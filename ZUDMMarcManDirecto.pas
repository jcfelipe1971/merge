unit ZUDMMarcManDirecto;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TZDMMarcManDirecto = class(TDataModule)
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     function DameCampoFecha(Tipo: integer): string;
     function DameCampoOperario(Tipo: integer): string;
  public
     { Public declarations }
     procedure InsertaFecha(Pedido, Tipo: integer);
     function PedidoExiste(Pedido: integer): boolean;
     function DameDescCliente(Pedido: integer): string;
     function DameDescOperario(CodigoTarjeta: string): string;
     procedure MarcaOperario(CodigoBarras, Tipo: integer; Operario: string);
  end;

var
  ZDMMarcManDirecto : TZDMMarcManDirecto;

implementation

uses UDMMain, uFBusca, UEntorno;

{$R *.dfm}

procedure TZDMMarcManDirecto.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMMarcManDirecto.InsertaFecha(Pedido, Tipo: integer);
var
  Existe, id_s : integer;
  CampoFecha : string;
begin
  // Mirar si está creado el marcaje en z_ges_cabeceras_s_ped_marca
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_S, COUNT(ID_S) ');
        SQL.Add(' FROM Z_GES_CABECERAS_S_PED_MARCA MAR ');
        SQL.Add(' JOIN VER_CABECERAS_PEDIDO PED ON (MAR.ID_S = PED.ID_S) ');
        SQL.Add(' WHERE ');
        SQL.Add(' Z_COD_BARRAS_PED = :Z_COD_BARRAS_PED ');
        SQL.Add(' GROUP BY ID_S ');
        Params.ByName['Z_COD_BARRAS_PED'].AsInteger := Pedido;
        ExecQuery;
        Existe := FieldByName['COUNT'].AsInteger;
        id_s := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CampoFecha := DameCampoFecha(Tipo);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Existe = 0) then
           SQL.Text := 'INSERT INTO Z_GES_CABECERAS_S_PED_MARCA (ID_S, ' + CampoFecha + ') VALUES(?ID_S , ?FECHA)'
        else
           SQL.Text := 'UPDATE Z_GES_CABECERAS_S_PED_MARCA SET ' + CampoFecha + ' = ?FECHA WHERE ID_S = ?ID_S ';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['FECHA'].AsDateTime := Now;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMMarcManDirecto.PedidoExiste(Pedido: integer): boolean;
begin
  // Mirar si está creado el marcaje en z_ges_cabeceras_s_ped_marca
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(ID_S) ');
        SQL.Add(' FROM Z_GES_CABECERAS_S_PED_MARCA MAR ');
        SQL.Add(' JOIN VER_CABECERAS_PEDIDO PED ON (MAR.ID_S = PED.ID_S) ');
        SQL.Add(' WHERE ');
        SQL.Add(' Z_COD_BARRAS_PED = :Z_COD_BARRAS ');
        Params.ByName['Z_COD_BARRAS_PED'].AsInteger := Pedido;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMMarcManDirecto.DameDescCliente(Pedido: integer): string;
begin
  // Mirar si está creado el marcaje en z_ges_cabeceras_s_ped_marca
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT NOMBRE_COMERCIAL FROM VER_CLIENTES CLI ');
        SQL.Add(' JOIN VER_CABECERAS_PEDIDO PED ');
        SQL.Add(' ON ');
        SQL.Add(' CLI.EMPRESA = PED.EMPRESA AND ');
        SQL.Add(' CLI.EJERCICIO = PED.EJERCICIO AND ');
        SQL.Add(' CLI.CANAL = PED.CANAL AND ');
        SQL.Add(' CLI.CLIENTE = PED.CLIENTE AND ');
        SQL.Add(' CLI.TERCERO = PED.TERCERO AND ');
        SQL.Add(' PED.Z_COD_BARRAS_PED = :Z_COD_BARRAS ');
        Params.ByName['Z_COD_BARRAS'].AsInteger := Pedido;
        ExecQuery;
        Result := FieldByName['NOMBRE_COMERCIAL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMMarcManDirecto.DameDescOperario(CodigoTarjeta: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT NOMBRE_COMERCIAL FROM SYS_TERCEROS TER ');
        SQL.Add(' JOIN OPE_EMPLEADO OPE ON OPE.TERCERO = TER.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' OPE.CODIGO_TARJETA = :CODIGO_TARJETA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
        Params.ByName['CODIGO_TARJETA'].AsString := CodigoTarjeta;
        ExecQuery;
        Result := FieldByName['NOMBRE_COMERCIAL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMMarcManDirecto.MarcaOperario(CodigoBarras, Tipo: integer; Operario: string);
var
  CampoOperario : string;
  id_s : integer;
  Empleado : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_S FROM Z_GES_CABECERAS_S_PED_MARCA MAR ');
        SQL.Add(' JOIN VER_CABECERAS_PEDIDO PED ON (MAR.ID_S = PED.ID_S) ');
        SQL.Add(' WHERE ');
        SQL.Add(' Z_COD_BARRAS_PED = :Z_COD_BARRAS_PED ');
        SQL.Add(' GROUP BY ID_S ');
        Params.ByName['Z_COD_BARRAS_PED'].AsInteger := CodigoBarras;
        ExecQuery;
        id_s := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CampoOperario := DameCampoOperario(Tipo);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) EMPLEADO FROM OPE_EMPLEADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO_TARJETA = :OPERARIO AND ');
        SQL.Add(' EMPRESA = :EMPRESA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['OPERARIO'].AsString := Operario;
        ExecQuery;
        Empleado := FieldByName['EMPLEADO'].AsInteger;
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
        SQL.Text := 'UPDATE Z_GES_CABECERAS_S_PED_MARCA SET ' + CampoOperario + ' = :OPERARIO WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['OPERARIO'].AsInteger := Empleado;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMMarcManDirecto.DameCampoFecha(Tipo: integer): string;
begin
  case Tipo of
     1: Result := 'FECHA_CORTE';
     2: Result := 'FECHA_UNION';
     3: Result := 'FECHA_MACARRON';
     4: Result := 'FECHA_MONTAJE';
     5: Result := 'FECHA_TERMINADO';
     6: Result := 'FECHA_PREPARADO';
  end;
end;

function TZDMMarcManDirecto.DameCampoOperario(Tipo: integer): string;
begin
  case Tipo of
     1: Result := 'OPERARIO_CORTE';
     2: Result := 'OPERARIO_UNION';
     3: Result := 'OPERARIO_MACARRON';
     4: Result := 'OPERARIO_MONTAJE';
     5: Result := 'OPERARIO_TERMINADO';
     6: Result := 'OPERARIO_PREPARADO';
  end;
end;

end.
