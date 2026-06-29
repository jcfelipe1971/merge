unit ZUDMSysNCF;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, HYFIBQuery;

type
  TZDMSysNCF = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO_NCF: TIntegerField;
     QMDetallePREFIJO: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleORDEN: TIntegerField;
     QMDetalleFECHA_INI: TDateTimeField;
     QMDetalleCONTADOR_INI: TIntegerField;
     QMDetalleCONTADOR_FIN: TIntegerField;
     QMDetalleCONTADOR_ACTUAL: TIntegerField;
     QMDetalleACTIVO: TIntegerField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO_NCF: TIntegerField;
     QMCabeceraDESCRIPCION: TFIBStringField;
     QMCabeceraDEFECTO: TIntegerField;
     QMDetalleFECHA_FIN: TDateTimeField;
     QMDetalleFOLIO_INI: TIntegerField;
     QMDetalleFOLIO_FIN: TIntegerField;
     QMDetalleNUM_APROBACION: TIntegerField;
     QMDetalleANO_APROBACION: TIntegerField;
     QMDetalleSERIE_DIR: TFIBStringField;
     QMDetalleVERSION_NCF: TFIBStringField;
     QMDetalleFICHERO: TFIBStringField;
     QMDetalleCLAVE: TFIBStringField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraVERSION_XML: TFIBStringField;
     QMDetalleCERTIFICADO: TFIBStringField;
     xTipoNCF: TFIBDataSetRO;
     xTipoNCFTIPO_NCF: TIntegerField;
     xTipoNCFTITULO: TFIBStringField;
     DSxTipoNCF: TDataSource;
     TUpdate: THYTransaction;
     QMCabeceraCANAL: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraTIPOChange(Sender: TField);
  private
     { Private declarations }
     procedure FiltrarTiposNCF(Tipo: string);
  public
     { Public declarations }
  end;

var
  ZDMSysNCF : TZDMSysNCF;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TZDMSysNCF.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCabecera.Close;
  QMCabecera.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMCabecera.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  QMCabecera.Open;
end;

procedure TZDMSysNCF.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xTipoNCF.Open;
end;

procedure TZDMSysNCF.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraDEFECTO.AsInteger := 0;
  QMCabeceraSERIE.AsString := '';
end;

procedure TZDMSysNCF.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  // Serie no tiene sentido y será eliminado
  QMDetalleSERIE.AsString := QMCabeceraSERIE.AsString;
  QMDetalleTIPO.AsString := QMCabeceraTIPO.AsString;
  QMDetalleTIPO_NCF.AsInteger := QMCabeceraTIPO_NCF.AsInteger;
  QMDetallePREFIJO.AsString := '00000000000';
  QMDetalleORDEN.AsInteger := 0;
  QMDetalleFECHA_INI.AsDateTime := REntorno.FechaTrabSH;
  QMDetalleACTIVO.AsInteger := 1;
end;

procedure TZDMSysNCF.QMDetalleBeforePost(DataSet: TDataSet);
begin
  // Obtenemos el numero de linea más alto en el prefijo actual
  if (QMDetalle.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM Z_SYS_NCF_DET ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' TIPO_NCF = :TIPO_NCF ');
           // SQL.Add(' AND PREFIJO = :PREFIJO ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['TIPO_NCF'].AsInteger := QMCabeceraTIPO_NCF.AsInteger;
           // Params.ByName['PREFIJO'].AsString := QMDetallePREFIJO.AsString;
           ExecQuery;
           QMDetalleLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
  if (QMDetalleORDEN.AsInteger = 0) then
     QMDetalleORDEN.AsInteger := QMDetalleLINEA.AsInteger;
end;

procedure TZDMSysNCF.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xTipoNCF.Close;
end;

procedure TZDMSysNCF.FiltrarTiposNCF(Tipo: string);
begin
  // Si es para facturas de venta, solo admito algunos Tipos de NCF
  // Si es para facturas de compra
  with xTipoNCF do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM Z_SYS_TIPO_NCF ');
     if (Tipo = 'FAC') then
        SelectSQL.Add(' WHERE TIPO_DOCUMENTO IN (0, 2) ')
     else
     if ((Tipo = 'FAP') or (Tipo = 'FCR')) then
        SelectSQL.Add(' WHERE TIPO_DOCUMENTO IN (0, 1) ');
     SelectSQL.Add(' ORDER BY TIPO_NCF');

     Open;
  end;
end;

procedure TZDMSysNCF.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  FiltrarTiposNCF(QMCabeceraTIPO.AsString);
end;

procedure TZDMSysNCF.QMCabeceraTIPOChange(Sender: TField);
begin
  FiltrarTiposNCF(QMCabeceraTIPO.AsString);
end;

end.
