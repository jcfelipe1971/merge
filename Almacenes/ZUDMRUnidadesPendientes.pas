unit ZUDMRUnidadesPendientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, DBTables, FIBDataSet, FIBTableDataSet, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO;

type
  TZDMRUnidadesPendientes = class(TDataModule)
     frUnidadesPendientes: TfrHYReport;
     TLocal: THYTransaction;
     xArt_Desde: TFIBDataSetRO;
     xArt_Hasta: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     xUnidadesPendientes: TFIBDataSetRO;
     DSxUnidadesPendientes: TDataSource;
     frDBxUnidadesPendientes: TfrDBDataSet;
     xAlm_Desde: TFIBDataSetRO;
     DSxAlm_Desde: TDataSource;
     xAlm_Hasta: TFIBDataSetRO;
     DSxAlm_Hasta: TDataSource;
     xClienteD: TFIBDataSetRO;
     DSxClienteD: TDataSource;
     xClienteH: TFIBDataSetRO;
     DSxClienteH: TDataSource;
     xArt_DesdeARTICULO: TFIBStringField;
     xArt_DesdeTITULO: TFIBStringField;
     xArt_HastaARTICULO: TFIBStringField;
     xArt_HastaTITULO: TFIBStringField;
     xAlm_DesdeALMACEN: TFIBStringField;
     xAlm_DesdeTITULO: TFIBStringField;
     xAlm_HastaALMACEN: TFIBStringField;
     xAlm_HastaTITULO: TFIBStringField;
     xClienteDCLIENTE: TIntegerField;
     xClienteDNOMBRE_COMERCIAL: TFIBStringField;
     xClienteHCLIENTE: TIntegerField;
     xClienteHNOMBRE_COMERCIAL: TFIBStringField;
     xSerie_Hasta: TFIBDataSetRO;
     DSxSerie_Hasta: TDataSource;
     xSerie_Desde: TFIBDataSetRO;
     DSxSerie_Desde: TDataSource;
     xSerie_DesdeSERIE: TFIBStringField;
     xSerie_DesdeTITULO: TFIBStringField;
     xSerie_HastaSERIE: TFIBStringField;
     xSerie_HastaTITULO: TFIBStringField;
     xFamiliaH: TFIBDataSetRO;
     DSxFamiliaH: TDataSource;
     DSxFamiliaD: TDataSource;
     xFamiliaD: TFIBDataSetRO;
     xFamiliaDFAMILIA: TFIBStringField;
     xFamiliaDTITULO: TFIBStringField;
     xFamiliaHFAMILIA: TFIBStringField;
     xFamiliaHTITULO: TFIBStringField;
     xCanalDesde: TFIBDataSetRO;
     DSxCanalDesde: TDataSource;
     DSxCanalHasta: TDataSource;
     xCanalHasta: TFIBDataSetRO;
     xCanalDesdeTITULO: TFIBStringField;
     xCanalHastaTITULO: TFIBStringField;
     xCanalDesdeCANAL: TIntegerField;
     xCanalHastaCANAL: TIntegerField;
     procedure DMRInventario_StocksDestroy(Sender: TObject);
     procedure DMRDepositosActivosCreate(Sender: TObject);
     procedure frUnidadesPendientesEnterRect(Memo: TStringList; View: TfrView);
     procedure frUnidadesPendientesGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     CliDesde, CliHasta, CanalHasta, CanalDesde: integer;
     ArticuloDesde, ArticuloHasta: string;
     AlmacenDesde, AlmacenHasta: string;
     FamiliaDesde, FamiliaHasta: string;
     SerieDesde, SerieHasta: string;
     FechaDesde, FechaHasta: TDateTime;
     procedure Rangos;
     procedure MostrarListado(Modo, Ordenacion: integer; FechaListado: TDateTime; Comentario: string);
  end;

var
  ZDMRUnidadesPendientes : TZDMRUnidadesPendientes;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMListados, UFormGest, UDameDato;

procedure TZDMRUnidadesPendientes.DMRDepositosActivosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMRUnidadesPendientes.DMRInventario_StocksDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMRUnidadesPendientes.MostrarListado(Modo, Ordenacion: integer; FechaListado: TDateTime; Comentario: string);
begin
  with xUnidadesPendientes do
  begin
     Close;
     SelectSQL.Add(' SELECT * FROM Z_LST_UNIDADES_PENDIENTES ( ');
     SelectSQL.Add(' :EMPRESA, :EJERCICIO, :CLI_INI, :CLI_FIN, :ARTICULO_INI, :ARTICULO_FIN, ');
     SelectSQL.Add(' :ALMACEN_INI, :ALMACEN_FIN, :FAMILIA_INI, :FAMILIA_FIN, :FECHA_INI, :FECHA_FIN, ');
     SelectSQL.Add(' :SERIE_INI, :SERIE_FIN, :CANAL_INI, :CANAL_FIN) ');
     if (Ordenacion = 0) then
        SelectSQL.Add(' ORDER BY ALMACEN, CLIENTE, FECHA, RIG ')
     else
     if (Ordenacion = 1) then
        SelectSQL.Add(' ORDER BY ALMACEN, ARTICULO, FECHA, RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     // Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLI_INI'].AsInteger := xClienteDCLIENTE.AsInteger;
     Params.ByName['CLI_FIN'].AsInteger := xClienteHCLIENTE.AsInteger;
     Params.ByName['ARTICULO_INI'].AsString := xArt_DesdeARTICULO.AsString;
     Params.ByName['ARTICULO_FIN'].AsString := xArt_HastaARTICULO.AsString;
     Params.ByName['ALMACEN_INI'].AsString := xAlm_DesdeALMACEN.AsString;
     Params.ByName['ALMACEN_FIN'].AsString := xAlm_HastaALMACEN.AsString;
     Params.ByName['FAMILIA_INI'].AsString := xFamiliaDFAMILIA.AsString;
     Params.ByName['FAMILIA_FIN'].AsString := xFamiliaHFAMILIA.AsString;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SERIE_INI'].AsString := xSerie_DesdeSERIE.AsString;
     Params.ByName['SERIE_FIN'].AsString := xSerie_HastaSERIE.AsString;
     Params.ByName['CANAL_INI'].AsInteger := xCanalDesdeCANAL.AsInteger;
     Params.ByName['CANAL_FIN'].AsInteger := xCanalHastaCANAL.AsInteger;

     Open;
  end;

  DMListados.DatosInforme(FechaListado, Comentario);
  DMListados.Imprimir(9006, 0, Modo, '', '', frUnidadesPendientes, nil, nil);
end;

procedure TZDMRUnidadesPendientes.Rangos;
var
  Q : THYFIBQuery;
begin
  // Cliente
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(CLIENTE), MAX(CLIENTE) ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ESTADO = 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        CliDesde := FieldByName['MIN'].AsInteger;
        CliHasta := FieldByName['MAX'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Articulos
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(ARTICULO), MIN(ARTICULO) FROM GES_DETALLES_S G ');
        SQL.Add(' LEFT JOIN GES_DETALLES_S_PED P ');
        SQL.Add(' ON G.ID_DETALLES_S = P.ID_DETALLES_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' G.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' G.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' G.CANAL = ?CANAL AND ');
        SQL.Add(' P.U_PENDIENTES > 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        ArticuloDesde := FieldByName['MIN'].AsString;
        ArticuloHasta := FieldByName['MAX'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Almacenes
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(ALMACEN), MAX(ALMACEN) ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ESTADO = 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        AlmacenDesde := FieldByName['MIN'].AsString;
        AlmacenHasta := FieldByName['MAX'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Series
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(SERIE), MAX(SERIE) ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ESTADO = 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        SerieDesde := FieldByName['MIN'].AsString;
        SerieHasta := FieldByName['MAX'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Familias
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(FAMILIA), MAX(FAMILIA) FROM ART_FAMILIAS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND FAMILIA <> ''' + REntorno.FamSistema + '''';
        ExecQuery;
        FamiliaDesde := FieldByName['MIN'].AsString;
        FamiliaHasta := FieldByName['MAX'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Canales
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(CANAL), MAX(CANAL) ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' ESTADO = 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        ExecQuery;
        CanalDesde := FieldByName['MIN'].AsInteger;
        CanalHasta := FieldByName['MAX'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMRUnidadesPendientes.frUnidadesPendientesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TZDMRUnidadesPendientes.frUnidadesPendientesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'NombreCli' then
     ParValue := DameTituloCliente(xUnidadesPendientes.FieldByName('CLIENTE').AsInteger);
end;

end.
