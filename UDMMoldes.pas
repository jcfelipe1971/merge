unit UDMMoldes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, Graphics, jpeg, GIFImage;

type
  TDMMoldes = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     QMArticuloPostizo: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraNUM_MOLDE: TFIBStringField;
     QMCabeceraPROPIETARIO: TIntegerField;
     QMCabeceraALTO: TIntegerField;
     QMCabeceraLARGO: TIntegerField;
     QMCabeceraANCHO: TIntegerField;
     QMCabeceraTIPO_BOQUILLA: TIntegerField;
     QMCabeceraDIAMETRO_EXPULSOR: TIntegerField;
     QMCabeceraTIPO_INYECCION: TIntegerField;
     QMCabeceraNUM_CAVIDADES: TIntegerField;
     QMCabeceraFECHA_LLEGADA: TDateTimeField;
     QMCabeceraFECHA_SALIDA: TDateTimeField;
     QMCabeceraACTIVO: TIntegerField;
     QMCabeceraDESCRIPCION: TFIBStringField;
     QMCabeceraID_UBICACION: TIntegerField;
     QMCabeceraARO_CENTRADOR: TIntegerField;
     QMCabeceraIMAGEN: TIntegerField;
     QMCabeceraCORREDERAS: TIntegerField;
     QMCabeceraNOYOS: TIntegerField;
     QMCabeceraTIPO_NOYO: TIntegerField;
     DSQMArticuloPostizo: TDataSource;
     QMMaquinas: TFIBTableSet;
     DSQMMaquinas: TDataSource;
     QMRevisiones: TFIBTableSet;
     QMDSRevisiones: TDataSource;
     QMReparaciones: TFIBTableSet;
     QMDSReparaciones: TDataSource;
     QMArticuloPostizoEMPRESA: TIntegerField;
     QMArticuloPostizoNUM_MOLDE: TFIBStringField;
     QMArticuloPostizoARTICULO: TFIBStringField;
     QMArticuloPostizoNUM_POSTIZO: TIntegerField;
     QMMaquinasEMPRESA: TIntegerField;
     QMMaquinasNUM_MOLDE: TFIBStringField;
     QMMaquinasMAQUINA: TIntegerField;
     QMRevisionesEMPRESA: TIntegerField;
     QMRevisionesNUM_MOLDE: TFIBStringField;
     QMRevisionesLINEA: TIntegerField;
     QMRevisionesFECHA_REVISION: TDateTimeField;
     QMRevisionesFECHA_PROXIMA: TDateTimeField;
     QMRevisionesRESULTADO: TFIBStringField;
     QMRevisionesLABORATORIO: TFIBStringField;
     QMRevisionesREVISADO: TIntegerField;
     QMReparacionesEMPRESA: TIntegerField;
     QMReparacionesNUM_MOLDE: TFIBStringField;
     QMReparacionesLINEA: TIntegerField;
     QMReparacionesFECHA_DETECCION: TDateTimeField;
     QMReparacionesFECHA_REPARACION: TDateTimeField;
     QMReparacionesDESCRIPCION: TFIBStringField;
     QMReparacionesCOMENTARIO: TFIBStringField;
     QMReparacionesLABORATORIO: TFIBStringField;
     QMReparacionesCOSTE_REP: TFloatField;
     QMMaquinasDescMaquina: TStringField;
     xDescMaquina: TFIBDataSetRO;
     xDescMaquinaDESCRIPCION: TFIBStringField;
     QMArticuloPostizoDescArticulo: TStringField;
     QMArticuloPostizoDescPostizo: TStringField;
     xDescArticulo: TFIBDataSetRO;
     xDescArticuloTITULO: TFIBStringField;
     xDescPostizo: TFIBDataSetRO;
     xDescPostizoDESCRIPCION: TFIBStringField;
     QMReparacionesTALLER: TIntegerField;
     QMReparacionesDescTaller: TStringField;
     xDescTaller: TFIBDataSetRO;
     xDescTallerTITULO: TFIBStringField;
     QMCabeceraFABRICADO: TIntegerField;
     QMCabeceraFABRICANTE: TIntegerField;
     QMReparacionesNOTAS: TBlobField;
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMArticuloPostizoNewRecord(DataSet: TDataSet);
     procedure QMMaquinasNewRecord(DataSet: TDataSet);
     procedure QMRevisionesNewRecord(DataSet: TDataSet);
     procedure QMReparacionesNewRecord(DataSet: TDataSet);
     procedure QMMaquinasDescMaquinaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticuloPostizoDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArticuloPostizoDescPostizoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure Graba(DataSet: TDataSet);
     procedure QMReparacionesDescTallerGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure PreparaNotasDetalle;
     procedure ActivaFiltro(Articulo: string; Filtrar: boolean);
  end;

var
  DMMoldes : TDMMoldes;

implementation

uses UDMMain, UEntorno, UFMMoldes;

{$R *.dfm}

procedure TDMMoldes.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraFECHA_LLEGADA.AsDateTime := REntorno.FechaTrabSH;
  QMCabeceraACTIVO.AsInteger := 1;
  QMCabeceraCORREDERAS.AsInteger := 0;
  QMCabeceraNOYOS.AsInteger := 0;
end;

procedure TDMMoldes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction; //Sempre hem d'obrir transaccio

  DMMain.FiltraTabla(QMCabecera, '10000');   //Per obrir la taula amb una consulta filtrant per Empresa
end;

procedure TDMMoldes.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMArticuloPostizo.Open;
  QMMaquinas.Open;
  QMRevisiones.Open;
  QMReparaciones.Open;
end;

procedure TDMMoldes.QMArticuloPostizoNewRecord(DataSet: TDataSet);
begin
  QMArticuloPostizoEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMArticuloPostizoNUM_MOLDE.AsString := QMCabeceraNUM_MOLDE.AsString;
end;

procedure TDMMoldes.QMMaquinasNewRecord(DataSet: TDataSet);
begin
  QMMaquinasEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMMaquinasNUM_MOLDE.AsString := QMCabeceraNUM_MOLDE.AsString;
end;

procedure TDMMoldes.QMRevisionesNewRecord(DataSet: TDataSet);
begin
  QMRevisionesEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMRevisionesNUM_MOLDE.AsString := QMCabeceraNUM_MOLDE.AsString;
end;

procedure TDMMoldes.QMReparacionesNewRecord(DataSet: TDataSet);
begin
  QMReparacionesEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMReparacionesNUM_MOLDE.AsString := QMCabeceraNUM_MOLDE.AsString;
  QMReparacionesFECHA_DETECCION.AsDateTime := REntorno.FechaTrabSH;
end;

procedure TDMMoldes.QMMaquinasDescMaquinaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescMaquina.Close;
  xDescMaquina.Open;
  Text := xDescMaquinaDESCRIPCION.AsString;
end;

procedure TDMMoldes.QMArticuloPostizoDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescArticulo.Close;
  xDescArticulo.Open;
  Text := xDescArticuloTITULO.AsString;
end;

procedure TDMMoldes.QMArticuloPostizoDescPostizoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescPostizo.Close;
  xDescPostizo.Open;
  Text := xDescPostizoDESCRIPCION.AsString;
end;

procedure TDMMoldes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMMoldes.QMReparacionesDescTallerGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescTaller.Close;
  xDescTaller.Open;
  Text := xDescTallerTITULO.AsString;
end;

// sfg_rsl incluir filtro por artículo postizo
procedure TDMMoldes.ActivaFiltro(Articulo: string; Filtrar: boolean);
begin
  // cerrar detalles el afteropen los abrirá
  QMArticuloPostizo.Close;
  QMMaquinas.Close;
  QMRevisiones.Close;
  QMReparaciones.Close;

  with QmCabecera do
  begin
     Close;
     SelectSQL.Clear;
     if Filtrar then
     begin
        SelectSQL.Text := 'SELECT * FROM EMP_MOLDES ' +
           'WHERE EMPRESA = ?EMPRESA AND NUM_MOLDE IN ' +
           '(SELECT DISTINCT(NUM_MOLDE) FROM EMP_MOLDE_ART_POSTIZ ' +
           ' WHERE ARTICULO = ?ARTICULO )';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
     end
     else
     begin
        SelectSQL.Text := 'SELECT * FROM EMP_MOLDES ' +
           'WHERE EMPRESA = ?EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     end;

     Open;
  end;
end;

procedure TDMMoldes.PreparaNotasDetalle;
begin
  if (QMDSReparaciones.State in [dsEdit, dsInsert]) then
     QMDSReparaciones.DataSet.Post;
  QMDSReparaciones.DataSet.Edit;
end;

end.
