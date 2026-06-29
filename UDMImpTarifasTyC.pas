unit UDMImpTarifasTyC;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FIBDatabase, UFIBModificados,
  DB, FIBDataSet, FIBTableDataSet;

type
  TDMImpTarifasTyC = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InsertaTarifa(Modelo, TipoLona, Tarifa, Articulo: string; Precio: double; Bloqueado: integer; Modificar: boolean);
     function DameArticulo(Proveedor: integer; CodigoProveedor: string): string;
  end;

var
  DMImpTarifasTyC : TDMImpTarifasTyC;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMImpTarifasTyC.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

function TDMImpTarifasTyC.DameArticulo(Proveedor: integer; CodigoProveedor: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ARTICULO FROM ART_ARTICULOS_CODPROV WHERE EMPRESA = ' +
           REntorno.EmpresaStr + ' AND CODIGO_PROVEEDOR = ''' + CodigoProveedor + ''' AND PROVEEDOR = ' + IntToStr(Proveedor);
        ExecQuery;
        Result := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImpTarifasTyC.InsertaTarifa(Modelo, TipoLona, Tarifa, Articulo: string; Precio: double; Bloqueado: integer; Modificar: boolean);
var
  Existe : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPRESA FROM Z_MODELOS_PRECIOS_CAB WHERE EMPRESA = :EMPRESA AND MODELO = :MODELO AND TIPO_LONA = :TIPO_LONA AND TARIFA = :TARIFA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['TIPO_LONA'].AsString := TipoLona;
        Params.ByName['TARIFA'].AsString := Tarifa;
        ExecQuery;
        Existe := (FieldByName['EMPRESA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Inserto cabecera si no existe
  if not Existe then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO Z_MODELOS_PRECIOS_CAB ( ');
           SQL.Add(' EMPRESA, MODELO, TIPO_LONA, TARIFA, DESCRIPCIO) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :MODELO, :TIPO_LONA, :TARIFA, :DESCRIPCIO) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['MODELO'].AsString := Modelo;
           Params.ByName['TIPO_LONA'].AsString := TipoLona;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['DESCRIPCIO'].AsString := format('%s - %s - %s', [Modelo, TipoLona, Tarifa]);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Insertar Detalle
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        if Modificar then
        begin
           SQL.Add(' UPDATE OR INSERT INTO Z_MODELOS_PRECIOS_DET ( ');
           SQL.Add(' EMPRESA, MODELO, TIPO_LONA, TARIFA, ARTICULO, P_VENTA_MODIFICADO, BLOQUEO_PVENTA) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :MODELO, :TIPO_LONA, :TARIFA, :ARTICULO, :P_VENTA_MODIFICADO, :BLOQUEO_PVENTA) ');
           SQL.Add(' MATCHING (EMPRESA, MODELO, TIPO_LONA, TARIFA, ARTICULO) ');
        end
        else
        begin
           SQL.Add(' INSERT INTO Z_MODELOS_PRECIOS_DET ( ');
           SQL.Add(' EMPRESA, MODELO, TIPO_LONA, TARIFA, ARTICULO, P_VENTA_MODIFICADO, BLOQUEO_PVENTA) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :MODELO, :TIPO_LONA, :TARIFA, :ARTICULO, :P_VENTA_MODIFICADO, :BLOQUEO_PVENTA) ');
        end;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['TIPO_LONA'].AsString := TipoLona;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['P_VENTA_MODIFICADO'].AsFloat := Precio;
        Params.ByName['BLOQUEO_PVENTA'].AsInteger := 0;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Bloquear precio
  if (Bloqueado = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Database := DMMain.DataBase;
           SQL.Text := 'UPDATE Z_MODELOS_PRECIOS_DET SET BLOQUEO_PVENTA = 1 WHERE EMPRESA = :EMPRESA AND MODELO = :MODELO AND TIPO_LONA = :TIPO_LONA AND TARIFA = :TARIFA AND ARTICULO = :ARTICULO';

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['MODELO'].AsString := Modelo;
           Params.ByName['TIPO_LONA'].AsString := TipoLona;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
