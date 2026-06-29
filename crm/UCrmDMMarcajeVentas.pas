unit UCrmDMMarcajeVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TCrmDMMarcajeVentas = class(TDataModule)
     TLocal: THYTransaction;
     QMVentas: TFIBTableSet;
     QMVentasID_CONTACTO: TIntegerField;
     QMVentasID_ARTICULO: TIntegerField;
     QMVentasFECHA: TDateTimeField;
     DSVentas: TDataSource;
     QMVentasID: TIntegerField;
     QInsertVentas: THYFIBQuery;
     xArticulo: TFIBDataSetRO;
     DSArticulo: TDataSource;
     xArticuloID_ARTICULO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     function DameFecha(tipo: integer): string;
     { Private declarations }
  public
     { Public declarations }
     procedure InsertaFecha(Pedido, Tipo: integer);
     function ContactoExiste(contacto: integer): boolean; //sfg.albert
     function ArticuloExiste(articulo: string): boolean; //sfg.albert
     function DameDescContacto(id_contacto: integer): string;//sfg.albert
     function DameDescArticulo(articulo: string): string; //sfg.albert
     procedure InsertarMarcaje(contacto, articulo: integer);//sfg.albert
     function ExisteOperario(c_tarjeta: string): boolean;
     procedure MarcaOperario(c_barras, tipo: integer; operario: string);
     function DameOperario(tipo: integer): string;
  end;

var
  CrmDMMarcajeVentas : TCrmDMMarcajeVentas;

implementation

uses UDMMain, uFBusca, UEntorno, UDameDato;

{$R *.dfm}

procedure TCrmDMMarcajeVentas.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TCrmDMMarcajeVentas.InsertaFecha(Pedido, Tipo: integer);
var
  existe, id_s : integer;
  cadena_sql, tipo_fecha : string;
begin
  //mirar si está creado el marcaje en z_ges_cabeceras_s_ped_marca
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select mar.id_s,count(mar.id_s) as existe ' +
           'from z_ges_cabeceras_s_ped_marca mar ' +
           'join ver_cabeceras_pedido ped ' +
           'on (mar.id_s = ped.id_s) ' +
           'where ped.Z_COD_BARRAS_PED = ?Z_COD_BARRAS_PED ' +
           'group by mar.id_s';

        Params.ByName['Z_COD_BARRAS_PED'].AsInteger := Pedido;
        ExecQuery;
        existe := FieldByName['existe'].AsInteger;
        id_s := FieldByName['id_s'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  tipo_fecha := DameFecha(tipo);

  if (existe = 0) then
     cadena_sql := 'insert into z_ges_cabeceras_s_ped_marca (ID_S ,' + tipo_fecha + ') ' +
        'values(?ID_S , ?FECHA)'
  else
     cadena_sql := 'update z_ges_cabeceras_s_ped_marca ' +
        'set ' + tipo_fecha + '=?Fecha ' +
        'where id_s=?id_s ';

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := cadena_sql;
        Params.ByName['id_s'].AsInteger := id_s;
        Params.ByName['FECHA'].AsDateTime := Now;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TCrmDMMarcajeVentas.ContactoExiste(contacto: integer): boolean;
begin
  Result := False;
  //mirar si está creado el contacto en crm_contactos
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select count(*) as existe from crm_contactos ' +
           'where id_contacto=?id_contacto';
        Params.ByName['id_contacto'].AsInteger := contacto;
        ExecQuery;
        if FieldByName['existe'].AsInteger > 0 then
           Result := True;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TCrmDMMarcajeVentas.DameDescContacto(id_contacto: integer): string;
begin
  // Buscar el nombre comercial en crm_contactos
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select nombre_comercial ' +
           'from crm_contactos ' +
           'where id_contacto=?id_contacto';
        Params.ByName['id_contacto'].AsInteger := id_contacto;
        ExecQuery;
        Result := FieldByName['nombre_comercial'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TCrmDMMarcajeVentas.ExisteOperario(c_tarjeta: string): boolean;
begin
  Result := (DameEmpleadoTarjeta(c_tarjeta) <> 0);
end;

function TCrmDMMarcajeVentas.DameDescArticulo(articulo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select descripcion ' +
           'from crm_articulo ' +
           'where codigo=?articulo';
        Params.ByName['articulo'].AsString := articulo;
        ExecQuery;
        Result := FieldByName['descripcion'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMMarcajeVentas.MarcaOperario(c_barras, tipo: integer; operario: string);
var
  tipo_operario : string;
  id_s : integer;
  empleado : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select mar.id_s ' +
           'from z_ges_cabeceras_s_ped_marca mar ' +
           'join ver_cabeceras_pedido ped ' +
           'on (mar.id_s = ped.id_s) ' +
           'where ped.Z_COD_BARRAS_PED = ?Z_COD_BARRAS_PED ' +
           'group by mar.id_s';
        Params.ByName['Z_COD_BARRAS_PED'].AsInteger := c_barras;
        ExecQuery;
        id_s := FieldByName['id_s'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  tipo_operario := DameOperario(tipo);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select first(1) EMPLEADO as empleado ' +
           'from ope_empleado ' +
           'where codigo_tarjeta = ?operario and empresa=?empresa';
        Params.ByName['empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['operario'].AsString := operario;
        ExecQuery;
        empleado := FieldByName['empleado'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update z_ges_cabeceras_s_ped_marca ' +
           ' set ' + tipo_operario + '=?OPERARIO ' +
           'where id_s=?id_s ';
        Params.ByName['id_s'].AsInteger := id_s;
        Params.ByName['operario'].AsInteger := empleado;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TCrmDMMarcajeVentas.DameFecha(tipo: integer): string;
begin
  case tipo of
     1: Result := 'FECHA_CORTE';
     2: Result := 'FECHA_UNION';
     3: Result := 'FECHA_MACARRON';
     4: Result := 'FECHA_MONTAJE';
     5: Result := 'FECHA_TERMINADO';
     6: Result := 'FECHA_PREPARADO';
  end;
end;

function TCrmDMMarcajeVentas.DameOperario(tipo: integer): string;
begin
  case tipo of
     1: Result := 'OPERARIO_CORTE';
     2: Result := 'OPERARIO_UNION';
     3: Result := 'OPERARIO_MACARRON';
     4: Result := 'OPERARIO_MONTAJE';
     5: Result := 'OPERARIO_TERMINADO';
     6: Result := 'OPERARIO_PREPARADO';
  end;
end;

function TCrmDMMarcajeVentas.ArticuloExiste(articulo: string): boolean;
begin
  Result := False;
  //mirar si está creado el contacto en crm_contactos
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select count(*) as existe from crm_articulo ' +
           'where codigo=?articulo';
        Params.ByName['articulo'].AsString := articulo;
        ExecQuery;
        if FieldByName['existe'].AsInteger > 0 then
           Result := True;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMMarcajeVentas.InsertarMarcaje(contacto, articulo: integer);
begin
  QInsertVentas.Close;
  QInsertVentas.Params.ByName['id_contacto'].AsInteger := contacto;
  QInsertVentas.Params.ByName['id_articulo'].AsInteger := articulo;
  QInsertVentas.Params.ByName['fecha'].AsDateTime := Now;
  QInsertVentas.Prepare;
  QInsertVentas.ExecQuery;
end;

end.
