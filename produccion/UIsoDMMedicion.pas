unit UIsoDMMedicion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, FIBQuery, HYFIBQuery, ShellAPI;

type
  TIsoDMMedicion = class(TDataModule)
     QMMedicionC: TFIBTableSet;
     DSQMMedicionC: TDataSource;
     TLocal: THYTransaction;
     QMMedicionCRIG: TIntegerField;
     QMMedicionCDENOMINACION: TFIBStringField;
     QMMedicionCCODID: TFIBStringField;
     QMMedicionCFECHA_COMPRA: TDateTimeField;
     QMMedicionCFABRICANTE: TFIBStringField;
     QMMedicionCNSERIE: TFIBStringField;
     QMMedicionCDESCRIPCION: TFIBStringField;
     QMMedicionCUBICACION: TFIBStringField;
     QMMedicionCUSUARIO: TIntegerField;
     QMMedicionCRANGOM: TFIBStringField;
     QMMedicionCDIVESCALA: TFIBStringField;
     QMMedicionCINCERTIDUMBRE: TFIBStringField;
     QMMedicionCOBSERVACIONES: TBlobField;
     QMMedicionD: TFIBTableSet;
     DSQMMedicionD: TDataSource;
     QMMedicionDRIG: TIntegerField;
     QMMedicionDFECHA_ULT: TDateTimeField;
     QMMedicionDFECHA_PROX: TDateTimeField;
     QMMedicionDRESULTADO: TFIBStringField;
     QMMedicionDLABORATORIO: TFIBStringField;
     QMMedicionDLINEA: TIntegerField;
     xUsuarios: TFIBTableSet;
     DSxUsuarios: TDataSource;
     QMMedicionCxDescUsuario: TStringField;
     frIsoInc: TfrHYReport;
     frDBQMDetalle: TfrDBDataSet;
     QMMedicionCFRECUENCIA: TIntegerField;
     QMMedicionCPRCAL: TFIBStringField;
     xUsuariosEMPRESA: TIntegerField;
     xUsuariosEMPLEADO: TIntegerField;
     xUsuariosTERCERO: TIntegerField;
     xUsuariosTITULO: TFIBStringField;
     xUsuariosNIF: TFIBStringField;
     QMMedicionCEMPRESA: TIntegerField;
     QMMedicionCCERTIFICADO: TFIBStringField;
     QMMedicionCID_ISO_MEDICION_C: TIntegerField;
     QMMedicionDEMPRESA: TIntegerField;
     procedure QMMedicionCUSUARIOChange(Sender: TField);
     procedure QMMedicionCAfterOpen(DataSet: TDataSet);
     procedure DMIsoMedicionCreate(Sender: TObject);
     procedure QMMedicionCNewRecord(DataSet: TDataSet);
     procedure QMMedicionCBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMMedicionDNewRecord(DataSet: TDataSet);
     procedure frIsoIncEnterRect(Memo: TStringList; View: TfrView);
     procedure QMMedicionDFECHA_ULTChange(Sender: TField);
     procedure QMMedicionCBeforeClose(DataSet: TDataSet);
     procedure frIsoIncGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     //sfg.marín    Lineas: integer;
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMMedicion : TIsoDMMedicion;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UIsoFMMedicion, UEntorno, URecursos, UUtiles, UDMListados;

procedure TIsoDMMedicion.DMIsoMedicionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMMedicionC, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMMedicionD, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMMedicionC, '10000', True);
end;

procedure TIsoDMMedicion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMedicionC, '10000');
end;

procedure TIsoDMMedicion.QMMedicionCUSUARIOChange(Sender: TField);
begin
  with xUsuarios do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['usuario'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TIsoDMMedicion.QMMedicionCAfterOpen(DataSet: TDataSet);
begin
  xUsuarios.Open;
  QMMedicionD.Open;
end;

procedure TIsoDMMedicion.QMMedicionCBeforeClose(DataSet: TDataSet);
begin
  xUsuarios.Close;
  QMMedicionD.Close;
end;

procedure TIsoDMMedicion.QMMedicionCNewRecord(DataSet: TDataSet);
begin
  QMMedicionCEMPRESA.AsInteger := REntorno.Empresa;
  QMMedicionCFECHA_COMPRA.AsDateTime := REntorno.FechaTrab;
end;

procedure TIsoDMMedicion.QMMedicionCBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMMedicionCRIG.AsInteger := DMMain.Contador_E('IME');
end;

procedure TIsoDMMedicion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  IsoFMMedicion.NavMain.BtnClick(nbRefresh);
end;

procedure TIsoDMMedicion.QMMedicionDNewRecord(DataSet: TDataSet);
begin
  if ((QMMedicionC.State = dsInsert) or (QMMedicionC.State = dsEdit)) then
  begin
     QMMedicionC.Post;
     IsoFMMedicion.NavMain.BtnClick(nbRefresh);
     QMMedicionD.Edit;
  end;

  QMMedicionDEMPRESA.AsInteger := QMMedicionCEMPRESA.AsInteger;
  QMMedicionDRIG.AsInteger := QMMedicionCRIG.AsInteger;
  QMMedicionDFECHA_ULT.AsDateTime := REntorno.FechaTRab;

  // Obtenemos siguiente numero de linea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM ISO_MEDICION_D WHERE EMPRESA=:EMPRESA AND RIG=:RIG';
        Params.ByName['EMPRESA'].AsInteger := QMMedicionCEMPRESA.AsInteger;
        Params.ByName['RIG'].AsInteger := QMMedicionCRIG.AsInteger;
        ExecQuery;
        QMMedicionDLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMMedicion.frIsoIncGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TIsoDMMedicion.frIsoIncEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TIsoDMMedicion.QMMedicionDFECHA_ULTChange(Sender: TField);
begin
  QMMedicionDFECHA_PROX.AsDateTime := QMMedicionDFECHA_ULT.AsDateTime + QMMedicionCFRECUENCIA.AsInteger;
end;

end.
