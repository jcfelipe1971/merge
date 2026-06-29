unit UCrmDMVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs;

type
  TCrmDmVentas = class(TDataModule)
     QMCrmVentas: TFIBTableSet;
     DSQMCrmVentas: TDataSource;
     TLocal: THYTransaction;
     xContacto: TFIBDataSetRO;
     DSxContacto: TDataSource;
     xArticulo: TFIBDataSetRO;
     DSxArticulo: TDataSource;
     QMCrmVentasID: TIntegerField;
     QMCrmVentasID_CONTACTO: TIntegerField;
     QMCrmVentasID_ARTICULO: TIntegerField;
     QMCrmVentasFECHA: TDateTimeField;
     xContactoID_CONTACTO: TIntegerField;
     xContactoNUM_CONTACTO: TIntegerField;
     xContactoFECHA_ALTA: TDateTimeField;
     xContactoTERCERO: TIntegerField;
     xContactoNOMBRE_R_SOCIAL: TFIBStringField;
     xContactoNOMBRE_COMERCIAL: TFIBStringField;
     xContactoNOMBRE_CORTO: TFIBStringField;
     xContactoTIPO_RAZON: TFIBStringField;
     xContactoNIF: TFIBStringField;
     xContactoTELEFONO01: TFIBStringField;
     xContactoTELEFONO02: TFIBStringField;
     xContactoTELEFAX: TFIBStringField;
     xContactoDIR_NOMBRE: TFIBStringField;
     xContactoDIR_LOCALIDAD: TFIBStringField;
     xContactoID_LOCAL: TIntegerField;
     xContactoEMAIL: TFIBStringField;
     xContactoWEB: TFIBStringField;
     xContactoNOTAS: TBlobField;
     xContactoCOMENTARIO: TMemoField;
     xContactoCLIENTE: TIntegerField;
     xContactoRUTA_IMAGEN: TFIBStringField;
     xContactoORIGEN_CONTACTO: TFIBStringField;
     xContactoLINK_GOOGLE: TFIBStringField;
     xContactoACTIVITAT_ECONOMICA: TFIBStringField;
     xContactoAMBITO: TIntegerField;
     xContactoFORMA_DE_PAGO_IMP: TFIBStringField;
     xContactoCLI_PROV_IMP: TFIBStringField;
     xContactoID_AGENTE: TIntegerField;
     xContactoEMPRESA: TIntegerField;
     xContactoPAIS: TFIBStringField;
     QMCrmVentasDescContacto: TStringField;
     QMCrmVentasDescArticulo: TStringField;
     xArticuloID_ARTICULO: TIntegerField;
     xArticuloCODIGO: TFIBStringField;
     xArticuloDESCRIPCION: TFIBStringField;
     xArticuloCANTIDAD: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCrmVentasCalcFields(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  CrmDmVentas : TCrmDmVentas;

implementation

uses UEntorno, UDMMain, UCrmFmVentas, StdCtrls, UFParada, UFBusca;

{$R *.dfm}

procedure TCrmDmVentas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCrmVentas.Close;
  QMCrmVentas.Open;
end;

procedure TCrmDmVentas.QMCrmVentasCalcFields(DataSet: TDataSet);
begin
  with xContacto do
  begin
     Close;
     Open;
  end;

  QMCrmVentas['DescContacto'] := xContactoNOMBRE_R_SOCIAL.Value;

  with xArticulo do
  begin
     Close;
     Open;
  end;

  QMCrmVentas['DescArticulo'] := xArticuloDESCRIPCION.Value;
  QMCrmVentas['Cantidad'] := xArticuloCANTIDAD.Value;
end;

procedure TCrmDmVentas.Graba(DataSet: TDataSet);
begin
  {TFibTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;}
end;

procedure TCrmDmVentas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCrmVentas, '00000');
end;

end.
