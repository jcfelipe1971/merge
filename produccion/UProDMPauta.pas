unit UProDMPauta;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, HYFIBQuery, FIBDataSetRO, ImgList, ExtCtrls, jpeg, GIFImage,
  Graphics, Dialogs, frxClass, frxDBSet, frxHYReport, FR_DSet, FR_DBSet,
  FR_Class, Fr_HYReport, UFIBModificados;

type
  TProDMPauta = class(TDataModule)
     DSCabPauta: TDataSource;
     QMDetPauta: TFIBTableSet;
     DSDetPauta: TDataSource;
     QMDetPautaEMPRESA: TIntegerField;
     QMDetPautaPAUTA: TIntegerField;
     QMDetPautaLINEA: TIntegerField;
     QMDetPautaORDEN: TIntegerField;
     QMDetPautaCOTA: TFIBStringField;
     QMDetPautaINSTRUCCION_CONTROL: TFIBStringField;
     QMDetPautaFRECUENCIA: TFIBStringField;
     QMDetPautaTIPOCONTROL: TIntegerField;
     QMCabPauta: TFIBTableSet;
     QMCabPautaPAUTA: TIntegerField;
     QMCabPautaFECHA_CREACION: TDateTimeField;
     QMCabPautaRESPONSABLE: TIntegerField;
     QMCabPautaCOMPUESTO: TFIBStringField;
     QMCabPautaCLIENTE: TIntegerField;
     QMCabPautaMATERIAL: TFIBStringField;
     QMCabPautaCROQUIS: TIntegerField;
     QMCabPautaNOTAS: TMemoField;
     QMCabPautaEMPRESA: TIntegerField;
     QMCabPautaFASE: TFIBStringField;
     QMDetPautaDESCRIPCION_CONTROL: TFIBStringField;
     QMDetPautaDescTipoControl: TStringField;
     xTituloTControl: TFIBDataSetRO;
     xTituloTControlDESCRIPCION: TFIBStringField;
     QMTControl: TFIBTableSet;
     DSTControl: TDataSource;
     QMTControlTIPOCONTROL: TIntegerField;
     QMTControlDESCRIPCION: TFIBStringField;
     QMTControlNOTAS: TMemoField;
     frLstPauta: TfrHYReport;
     frDBLstCabPauta: TfrDBDataSet;
     xLstCabpauta: TFIBDataSetRO;
     xLstDetPauta: TFIBDataSetRO;
     DSxLstCabPauta: TDataSource;
     DSxLstDetPauta: TDataSource;
     xLstCabpautaPAUTA: TIntegerField;
     xLstCabpautaCOMENTARIO: TFIBStringField;
     xLstCabpautaFECHA_CREACION: TDateTimeField;
     xLstCabpautaRESPONSABLE: TIntegerField;
     xLstCabpautaCOMPUESTO: TFIBStringField;
     xLstCabpautaCLIENTE: TIntegerField;
     xLstCabpautaMATERIAL: TFIBStringField;
     xLstCabpautaCROQUIS: TIntegerField;
     xLstCabpautaNOTAS: TMemoField;
     xLstCabpautaEMPRESA: TIntegerField;
     xLstCabpautaFASE: TFIBStringField;
     xLstDetPautaLINEA: TIntegerField;
     xLstDetPautaORDEN: TIntegerField;
     xLstDetPautaDESCRIPCION_CONTROL: TFIBStringField;
     xLstDetPautaCOTA: TFIBStringField;
     xLstDetPautaINSTRUCCION_CONTROL: TFIBStringField;
     xLstDetPautaFRECUENCIA: TFIBStringField;
     xLstDetPautaTIPOCONTROL: TIntegerField;
     frDBLstDetPauta: TfrDBDataSet;
     TLocal: THYTransaction;
     xLstCabpautaDESC_EMPLEADO: TFIBStringField;
     xLstCabpautaDESC_ARTICULO: TFIBStringField;
     xLstCabpautaDESC_CLIENTE: TFIBStringField;
     xLstCabpautaDESC_FASE: TFIBStringField;
     xLstDetPautaDESCRIPCION: TFIBStringField;
     QMCabPautaESCANDALLO: TIntegerField;
     QMCabPautaPLANO: TFIBStringField;
     QMCabPautaPROYECTO: TFIBStringField;
     QMCabPautaMAQUINA: TIntegerField;
     QMCabPautaLINEA_FASE: TIntegerField;
     xTituloFase: TFIBDataSetRO;
     xTituloFaseFASE: TFIBStringField;
     DSxTituloFase: TDataSource;
     QMCabPautaNUM_UTIL: TFIBStringField;
     QMCabPautaUBICACION: TFIBStringField;
     QMDibPauta: TFIBTableSet;
     DSDibPauta: TDataSource;
     QMDibPautaEMPRESA: TIntegerField;
     QMDibPautaPAUTA: TIntegerField;
     QMDibPautaLINEA: TIntegerField;
     QMDibPautaID_IMAGEN: TIntegerField;
     QMDibPautaDescripcion: TStringField;
     QMDibPautaTCONTROL: TIntegerField;
     QMDibPautaDescTControl: TStringField;
     xDescTControl: TFIBDataSetRO;
     DSxDescTControl: TDataSource;
     xDescTControlDESCRIPCION: TFIBStringField;
     QMDetPautaFRECUENCIA2: TFIBStringField;
     QMDetPautaFRECUENCIA3: TFIBStringField;
     xLstCabpautaESCANDALLO: TIntegerField;
     xLstCabpautaPLANO: TFIBStringField;
     xLstCabpautaPROYECTO: TFIBStringField;
     xLstCabpautaMAQUINA: TIntegerField;
     xLstCabpautaLINEA_FASE: TIntegerField;
     xLstCabpautaNUM_UTIL: TFIBStringField;
     xLstCabpautaUBICACION: TFIBStringField;
     xLstDetPautaFRECUENCIA2: TFIBStringField;
     xLstDetPautaFRECUENCIA3: TFIBStringField;
     QMDibPautaPRINCIPAL: TIntegerField;
     QMCabPautaOPERACION: TFIBStringField;
     xLstCabpautaOPERACION: TFIBStringField;
     xLstImatgePauta: TFIBDataSetRO;
     DSxLstImatgePauta: TDataSource;
     xLstImatgePautaID_IMAGEN: TIntegerField;
     xLstDetImatges: TFIBDataSetRO;
     DSxLstDetImatges: TDataSource;
     frDBLstDetImatges: TfrDBDataSet;
     xLstDetPautaPAUTA: TIntegerField;
     xLstDetPautaEMPRESA: TIntegerField;
     xLstDetImatgesOlber: TFIBDataSetRO;
     QMDibPautaORDEN: TIntegerField;
     xLstDetImatgesID_IMAGEN: TIntegerField;
     DSxLstDetImatgesOlber: TDataSource;
     frDBDLstOlber: TfrDBDataSet;
     xLstDetImatgesOlberID_IMAGEN: TIntegerField;
     xLstDetImatgesOlberDESCRIPCION: TFIBStringField;
     xLstDetImatgesOlberTCONTROL: TIntegerField;
     QMCabPautaDENOMINACION: TFIBStringField;
     xTituloFaseTIPOFASE: TFIBStringField;
     QMCabPautaINDICE: TFIBStringField;
     xLstCabpautaINDICE: TFIBStringField;
     xLstCabpautaDENOMINACION: TFIBStringField;
     xLstCabpautaDESC_ESC: TFIBStringField;
     xLstCabpautaMEDIDA1: TFloatField;
     xLstImageCompuesto: TFIBDataSetRO;
     DsxLstImageCompuesto: TDataSource;
     xLstImageCompuestoID_IMAGEN: TIntegerField;
     QMDetPautaNOTAS: TBlobField;
     xLstDetPautaNOTAS: TBlobField;
     QMCabPautaCOMENTARIO: TFIBStringField;
     QMCabPautaTITULO: TFIBStringField;
     QMCabPautaNOMBRE_R_SOCIAL: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabPautaAfterOpen(DataSet: TDataSet);
     procedure QMCabPautaNewRecord(DataSet: TDataSet);
     procedure QMDetPautaNewRecord(DataSet: TDataSet);
     procedure QMDetPautaTIPOCONTROLChange(Sender: TField);
     procedure QMDetPautaDescTipoControlGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabPautaAfterPost(DataSet: TDataSet);
     procedure QMDetPautaAfterPost(DataSet: TDataSet);
     procedure QMCabPautaBeforePost(DataSet: TDataSet);
     procedure xLstCabpautaAfterOpen(DataSet: TDataSet);
     procedure frLstPautaEnterRect(Memo: TStringList; View: TfrView);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabPautaLINEA_FASEChange(Sender: TField);
     procedure QMDibPautaNewRecord(DataSet: TDataSet);
     procedure QMDibPautaAfterScroll(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMDibPautaDescripcionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDibPautaDescTControlGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDibPautaTCONTROLChange(Sender: TField);
     procedure frLstPautaGetValue(const ParName: string; var ParValue: variant);
     procedure xLstDetPautaAfterOpen(DataSet: TDataSet);
     procedure QMCabPautaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure PreparaNotasDetalle;
     procedure CambiaTipoControl(Tipo: integer);
  end;

var
  ProDMPauta : TProDMPauta;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UFBusca, UProFMPauta, UDameDato, UImagenes;

{$R *.dfm}

procedure TProDMPauta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMCabPauta, '10000');
  QMTControl.Open;
end;

procedure TProDMPauta.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMPauta.QMCabPautaAfterOpen(DataSet: TDataSet);
begin
  QMDetPauta.Open;
  QMDibPauta.Open;
  xTituloFase.Open;
end;

procedure TProDMPauta.QMCabPautaBeforeClose(DataSet: TDataSet);
begin
  QMDetPauta.Close;
  QMDibPauta.Close;
  xTituloFase.Close;
end;

procedure TProDMPauta.QMCabPautaNewRecord(DataSet: TDataSet);
begin
  QMCabPautaEMPRESA.Value := REntorno.Empresa;
end;

procedure TProDMPauta.QMDetPautaNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMDetPautaEMPRESA.AsInteger := QMCabPautaEMPRESA.AsInteger;
  QMDetPautaPAUTA.AsInteger := QMCabPautaPAUTA.AsInteger;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM PRO_SYS_DET_PAUTA WHERE EMPRESA = :EMPRESA AND PAUTA = :PAUTA';
        Params.ByName['EMPRESA'].AsInteger := QMCabPautaEMPRESA.AsInteger;
        Params.ByName['PAUTA'].AsInteger := QMCabPautaPAUTA.AsInteger;
        ExecQuery;
        QMDetPautaLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMPauta.QMDetPautaTIPOCONTROLChange(Sender: TField);
begin
  xTituloTControl.Close;
  xTituloTControl.Open;
  QMDetPautaDescTipoControl.Text := xTituloTControlDESCRIPCION.AsString;
end;

procedure TProDMPauta.QMDetPautaDescTipoControlGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTituloTControl do
  begin
     Close;
     Open;
  end;
  Text := xTituloTControlDESCRIPCION.AsString;
end;

procedure TProDMPauta.QMCabPautaAfterPost(DataSet: TDataSet);
begin
  // TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMPauta.QMDetPautaAfterPost(DataSet: TDataSet);
begin
  // TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMPauta.QMCabPautaBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMCabPautaPAUTA.AsInteger := DMMain.Contador_E('ZPA');
end;

procedure TProDMPauta.xLstCabpautaAfterOpen(DataSet: TDataSet);
begin
  xLstImatgePauta.Open;
  xLstDetPauta.Open;
  xLstDetImatgesOlber.Open;
end;

procedure TProDMPauta.frLstPautaEnterRect(Memo: TStringList; View: TfrView);
begin
  if (memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
     //Capçalera
     if (Memo[0] = '[ImatgePauta]') and (View is TfrPictureView) then
        //Mirar si està marcada la linea, sino agafar imatge d'article
        if (QMDibPautaPRINCIPAL.AsInteger = 1) then
           DMListados.MostrarImagen(xLstImatgePautaID_IMAGEN.AsInteger, View)
        else
        begin
           xLstImageCompuesto.Close;
           xLstImageCompuesto.Open;
           DMListados.MostrarImagen(xLstImageCompuestoID_IMAGEN.AsInteger, View);
        end;
     //Detalle
     if (Memo[0] = '[ImatgeCroquis]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xLstDetImatgesID_IMAGEN.AsInteger, View);
     //Imatges
     if (Memo[0] = '[ImatgesControlPauta]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xLstDetImatgesOlberID_IMAGEN.AsInteger, View);
  end;
end;

procedure TProDMPauta.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabPauta, '10000');
end;

procedure TProDMPauta.QMCabPautaLINEA_FASEChange(Sender: TField);
begin
  xTituloFase.Close;
  xTituloFase.Open;

  QMCabPautaFASE.AsString := xTituloFaseTIPOFASE.AsString;
end;

procedure TProDMPauta.QMDibPautaNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMDibPautaEMPRESA.AsInteger := QMCabPautaEMPRESA.AsInteger;
  QMDibPautaPAUTA.AsInteger := QMCabPautaPAUTA.AsInteger;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM PRO_SYS_DIB_PAUTA WHERE EMPRESA = :EMPRESA AND PAUTA = :PAUTA';
        Params.ByName['EMPRESA'].AsInteger := QMCabPautaEMPRESA.AsInteger;
        Params.ByName['PAUTA'].AsInteger := QMCabPautaPAUTA.AsInteger;
        ExecQuery;
        QMDibPautaLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMPauta.QMDibPautaAfterScroll(DataSet: TDataSet);
begin
  RefrescarImagen(ProFMPauta.Imagen, QMDibPautaID_IMAGEN.AsInteger);
end;

procedure TProDMPauta.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMPauta.QMDibPautaDescripcionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloImagen(QMDibPautaID_IMAGEN.AsInteger);
end;

procedure TProDMPauta.QMDibPautaDescTControlGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescTControl.Close;
  xDescTControl.Open;

  Text := xDescTControlDESCRIPCION.AsString;
end;

procedure TProDMPauta.QMDibPautaTCONTROLChange(Sender: TField);
begin
  xDescTControl.Close;
  xDescTControl.Open;

  QMDibPautaDescTControl.AsString := xDescTControlDESCRIPCION.AsString;
end;

procedure TProDMPauta.frLstPautaGetValue(const ParName: string; var ParValue: variant);
begin
  if (ParName = 'COMPUESTO') then
     ParValue := QMCabPautaCOMPUESTO.AsString;
end;

procedure TProDMPauta.xLstDetPautaAfterOpen(DataSet: TDataSet);
begin
  xLstDetImatges.Close;
  xLstDetImatges.Open;
end;

procedure TProDMPauta.PreparaNotasDetalle;
begin
  if (DsDetPauta.State in [dsEdit, dsInsert]) then
     DsDetPauta.DataSet.Post;
  DsDetPauta.DataSet.Edit;
end;

procedure TProDMPauta.CambiaTipoControl(Tipo: integer);
begin
  with QMDetPauta do
  begin
     Close;
     SelectSQL.Clear;

     if (Tipo <> 0) then
     begin
        SelectSQL.Add('SELECT * FROM PRO_SYS_DET_PAUTA WHERE EMPRESA = :EMPRESA AND PAUTA = :PAUTA AND TIPOCONTROL = :TIPOCONTROL');
        Params.ByName['TIPOCONTROL'].AsInteger := Tipo;
     end
     else
        SelectSQL.Add('SELECT * FROM PRO_SYS_DET_PAUTA WHERE EMPRESA = :EMPRESA AND PAUTA = :PAUTA');

     Open;
  end;
end;

end.
