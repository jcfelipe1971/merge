unit UDMCambioDivisas;

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, DB, FIBDataSetRO, FIBTableDataSetRO, FIBQuery,
  HYFIBQuery;

type
  TDMCambioDivisas = class(TDataModule)
     QMCambios: TFIBTableSet;
     QMCambiosORIGEN: TFIBStringField;
     QMCambiosDESTINO: TFIBStringField;
     QMCambiosF_ALTA: TDateTimeField;
     QMCambiosF_BAJA: TDateTimeField;
     QMCambiosCAMBIO: TFloatField;
     QMCambiosFACTOR: TFloatField;
     QMCambiosACTIVO: TIntegerField;
     QMCambiosNUM_CAMBIO: TIntegerField;
     DSQMCambios: TDataSource;
     TLocal: THYTransaction;
     xCambios: TFIBDataSetRO;
     DSxCambios: TDataSource;
     xCambiosNUM_CAMBIO: TIntegerField;
     xCambiosORIGEN: TFIBStringField;
     xCambiosT_ORIGEN: TFIBStringField;
     xCambiosDESTINO: TFIBStringField;
     xCambiosT_DESTINO: TFIBStringField;
     xCambiosF_ALTA: TDateTimeField;
     xCambiosF_BAJA: TDateTimeField;
     xCambiosCAMBIO: TFloatField;
     xCambiosFACTOR: TFloatField;
     xCambiosACTIVO: TIntegerField;
     TUpdate: THYTransaction;
     QMCambiosCARGO_LINEAL: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCambiosAfterOpen(DataSet: TDataSet);
     procedure QMCambiosAfterPost(DataSet: TDataSet);
     procedure QMCambiosAfterDelete(DataSet: TDataSet);
     procedure QMCambiosNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCambiosBeforePost(DataSet: TDataSet);
     procedure QMCambiosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMCambiosAfterCancel(DataSet: TDataSet);
     procedure QMCambiosBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     insercion: boolean;
     marca1, marca2: TBookmark;
     MonedaOrigen, MonedaDestino: string;
     procedure GuardaPosicion;
     procedure PosicionaRegistro;
     procedure LiberaPosicion;
  public
     { Public declarations }
     procedure ValoresIniciales(aMonedaOrigen, aMonedaDestino: string);
  end;

var
  DMCambioDivisas : TDMCambioDivisas;

implementation

uses UDMMain, UUtiles, UEntorno;

{$R *.dfm}

procedure TDMCambioDivisas.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xCambiosCAMBIO.DisplayFormat := MascaraC;
  xCambiosFACTOR.DisplayFormat := MascaraC;
  QMCambiosCAMBIO.DisplayFormat := MascaraC;

  insercion := False;
end;

procedure TDMCambioDivisas.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TDMCambioDivisas.QMCambiosAfterOpen(DataSet: TDataSet);
begin
  xCambios.Open;
end;

procedure TDMCambioDivisas.QMCambiosAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  QMCambios.Close;
  QMCambios.Open;
  xCambios.Close;
  xCambios.Open;
  PosicionaRegistro;
end;

procedure TDMCambioDivisas.ValoresIniciales(aMonedaOrigen, aMonedaDestino: string);
begin
  MonedaOrigen := aMonedaOrigen;
  MonedaDestino := aMonedaDestino;

  with QMCambios do
  begin
     Close;
     Params.ByName['ORIGEN'].AsString := MonedaOrigen;
     Params.ByName['DESTINO'].AsString := MonedaDestino;
     Open;
  end;
end;

procedure TDMCambioDivisas.QMCambiosAfterDelete(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMCambioDivisas.QMCambiosNewRecord(DataSet: TDataSet);
begin
  QMCambiosORIGEN.AsString := MonedaOrigen;
  QMCambiosDESTINO.AsString := MonedaDestino;
  QMCambiosF_ALTA.AsDateTime := REntorno.FechaTrabSH + Time;
  QMCambiosACTIVO.AsFloat := 1;
  QMCambiosCARGO_LINEAL.AsFloat := 0;
  insercion := True;
end;

procedure TDMCambioDivisas.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMCambioDivisas.QMCambiosBeforePost(DataSet: TDataSet);
begin
  GuardaPosicion;
end;

procedure TDMCambioDivisas.QMCambiosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  LiberaPosicion;
end;

procedure TDMCambioDivisas.QMCambiosAfterCancel(DataSet: TDataSet);
begin
  LiberaPosicion;
end;

procedure TDMCambioDivisas.GuardaPosicion;
begin
  /// Primero verifico que no este asignada la posicion.
  /// Si esta asignada la libero

  // Libero la posicion si esta asignada
  LiberaPosicion;

  // Ahora guardo la posocion
  marca1 := QMCambios.GetBookmark();
  marca2 := xCambios.GetBookmark();
end;

procedure TDMCambioDivisas.PosicionaRegistro;
begin
  /// Posiciona el registro y libera las marcas
  try
     if Assigned(marca2) then
        xCambios.GotoBookmark(marca2);
     if Assigned(marca1) then
        QMCambios.GotoBookmark(marca1);
  finally
     LiberaPosicion;
  end;
end;

procedure TDMCambioDivisas.LiberaPosicion;
begin
  // Verifico si esta asignada
  if Assigned(marca2) then
  begin
     xCambios.FreeBookmark(marca2);
     marca2 := nil;
  end;
  if Assigned(marca1) then
  begin
     QMCambios.FreeBookmark(marca1);
     marca1 := nil;
  end;
end;

procedure TDMCambioDivisas.QMCambiosBeforeClose(DataSet: TDataSet);
begin
  xCambios.Close;
end;

end.
