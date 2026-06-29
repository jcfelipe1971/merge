unit UObrDMPartidasPlantilla;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  FIBDataSetRO;

type
  TObrDMPartidasPlantilla = class(TDataModule)
     TLocal: TFIBTransaction;
     DSQMCabecera: TDataSource;
     DSQMDetalle: TDataSource;
     DSxInfoActualizada: TDataSource;
     QMCabecera: TFIBTableSet;
     QMDetalle: TFIBTableSet;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraCODIGO: TIntegerField;
     QMCabeceraPARTIDA: TFIBStringField;
     QMCabeceraDESCRIPCION: TFIBStringField;
     QMCabeceraCANTIDAD: TFloatField;
     QMCabeceraMEDIDA_1: TFIBStringField;
     QMCabeceraMEDIDA_2: TFIBStringField;
     QMCabeceraMEDIDA_3: TFIBStringField;
     QMCabeceraP_VENTA: TFloatField;
     QMCabeceraTOTAL_VENTA: TFloatField;
     QMCabeceraP_COSTE: TFloatField;
     QMCabeceraTOTAL_COSTE: TFloatField;
     QMCabeceraMARGEN_ABS: TFloatField;
     QMCabeceraMARGEN_POR: TFloatField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraDEFECTO: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleCODIGO: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleORDEN: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleDESCRIPCION: TFIBStringField;
     QMDetalleCANTIDAD: TFloatField;
     QMDetalleMEDIDA_1: TFIBStringField;
     QMDetalleMEDIDA_2: TFIBStringField;
     QMDetalleMEDIDA_3: TFIBStringField;
     QMDetalleP_VENTA: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleTOTAL_VENTA: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleTOTAL_COSTE: TFloatField;
     QMDetalleMARGEN_ABS: TFloatField;
     QMDetalleMARGEN_POR: TFloatField;
     xDescPartida: TFIBDataSetRO;
     xDescPartidaPARTIDA: TFIBStringField;
     xDescPartidaDESCRIPCION: TFIBStringField;
     xLineaDet: TFIBDataSetRO;
     xLineaDetMAX: TIntegerField;
     xDescArticulo: TFIBDataSetRO;
     xDescArticuloTITULO: TFIBStringField;
     xInfoActualizada: TFIBDataSetRO;
     xInfoActualizadaEMPRESA: TIntegerField;
     xInfoActualizadaCODIGO: TIntegerField;
     xInfoActualizadaPARTIDA: TFIBStringField;
     xInfoActualizadaDESCRIPCION: TFIBStringField;
     xInfoActualizadaCANTIDAD: TFloatField;
     xInfoActualizadaMEDIDA_1: TFIBStringField;
     xInfoActualizadaMEDIDA_2: TFIBStringField;
     xInfoActualizadaMEDIDA_3: TFIBStringField;
     xInfoActualizadaP_VENTA: TFloatField;
     xInfoActualizadaTOTAL_VENTA: TFloatField;
     xInfoActualizadaP_COSTE: TFloatField;
     xInfoActualizadaTOTAL_COSTE: TFloatField;
     xInfoActualizadaMARGEN_ABS: TFloatField;
     xInfoActualizadaMARGEN_POR: TFloatField;
     xInfoActualizadaNOTAS: TBlobField;
     xInfoActualizadaDEFECTO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCabeceraPARTIDAChange(Sender: TField);
     procedure QMDetalleARTICULOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ObrDMPartidasPlantilla : TObrDMPartidasPlantilla;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TObrDMPartidasPlantilla.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMCabecera, '10000');

  xInfoActualizadaP_VENTA.DisplayFormat := MascaraN;
  xInfoActualizadaTOTAL_VENTA.DisplayFormat := MascaraN;
  xInfoActualizadaP_COSTE.DisplayFormat := MascaraN;
  xInfoActualizadaTOTAL_COSTE.DisplayFormat := MascaraN;

  QMDetalleP_VENTA.DisplayFormat := MascaraN;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleTOTAL_VENTA.DisplayFormat := MascaraN;
  QMDetalleP_COSTE.DisplayFormat := MascaraN;
  QMDetalleTOTAL_COSTE.DisplayFormat := MascaraN;
end;

procedure TObrDMPartidasPlantilla.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  xInfoActualizada.Refresh;
end;

procedure TObrDMPartidasPlantilla.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  QMDetalle.Open;
end;

procedure TObrDMPartidasPlantilla.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMCabeceraCODIGO.AsInteger := DMMain.Contador_E('PPA');
end;

procedure TObrDMPartidasPlantilla.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraCANTIDAD.AsInteger := 1;
end;

procedure TObrDMPartidasPlantilla.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleCODIGO.AsInteger := QMCabeceraCODIGO.AsInteger;
  QMDetalleCANTIDAD.AsInteger := 1;

  xLineaDet.Close;
  xLineaDet.Open;
  QMDetalleLINEA.AsInteger := xLineaDetMAX.AsInteger + 1;
  QMDetalleORDEN.AsInteger := QMDetalleLINEA.AsInteger;
end;

procedure TObrDMPartidasPlantilla.QMCabeceraPARTIDAChange(Sender: TField);
begin
  xDescPartida.Close;
  xDescPartida.Open;

  QMCabeceraDESCRIPCION.AsString := xDescPartidaDESCRIPCION.AsString;
end;

procedure TObrDMPartidasPlantilla.QMDetalleARTICULOChange(Sender: TField);
begin
  xDescArticulo.Close;
  xDescArticulo.Open;

  QMDetalleDESCRIPCION.AsString := xDescArticuloTITULO.AsString;
end;

procedure TObrDMPartidasPlantilla.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '00000');
end;

end.
