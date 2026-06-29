unit UDMCuentasIVA;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Forms, DB, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO;

type
  TDMCuentasIVA = class(TDataModule)
     DSQMCuentaIVA: TDataSource;
     DSxTipoIva: TDataSource;
     QMCuentaIVA: TFIBTableSet;
     QMCuentaIVAEMPRESA: TIntegerField;
     QMCuentaIVAEJERCICIO: TIntegerField;
     QMCuentaIVACANAL: TIntegerField;
     QMCuentaIVAPAIS: TFIBStringField;
     QMCuentaIVATIPO_IVA: TIntegerField;
     QMCuentaIVAMODO_IVA: TIntegerField;
     QMCuentaIVACTA_CARGO_IVA: TFIBStringField;
     QMCuentaIVACTA_CARGO_REC: TFIBStringField;
     QMCuentaIVACTA_ABONO_IVA: TFIBStringField;
     QMCuentaIVACTA_ABONO_REC: TFIBStringField;
     TLocal: THYTransaction;
     DSxModoIva: TDataSource;
     QMCuentaIVAP_IVA: TFloatField;
     QMCuentaIVAP_REC: TFloatField;
     xTipoIva: TFIBDataSetRO;
     xModoIva: TFIBDataSetRO;
     xTipoIvaTIPO: TIntegerField;
     xTipoIvaPAIS: TFIBStringField;
     xTipoIvaTITULO: TFIBStringField;
     xTipoIvaP_IVA: TFloatField;
     xTipoIvaP_RECARGO: TFloatField;
     xTipoIvaACTIVO: TIntegerField;
     xTipoIvaDEFECTO: TIntegerField;
     xModoIvaMODO: TIntegerField;
     xModoIvaTITULO: TFIBStringField;
     xModoIvaIVA: TIntegerField;
     xModoIvaRECARGO: TIntegerField;
     xModoIvaDEDUCIBLE: TIntegerField;
     xModoIvaTIPO_TRANSACCION: TIntegerField;
     TUpdate: THYTransaction;
     QMCuentaIVACTA_CARGO_IVA_RECC: TFIBStringField;
     QMCuentaIVACTA_ABONO_IVA_RECC: TFIBStringField;
     QMCuentaIVACTA_CARGO_IVA_ISP: TFIBStringField;
     QMCuentaIVACTA_ABONO_IVA_ISP: TFIBStringField;
     procedure DMCuentasIVACreate(Sender: TObject);
     procedure QMCuentaIVAAfterOpen(DataSet: TDataSet);
     procedure QMCuentaIVATIPO_IVAChange(Sender: TField);
     procedure QMCuentaIVAMODO_IVAChange(Sender: TField);
     procedure QMCuentaIVAP_RECGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCuentaIVAP_IVAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCuentaIVABeforeClose(DataSet: TDataSet);
     procedure QMCuentaIVACTA_CARGO_IVAChange(Sender: TField);
     procedure QMCuentaIVACTA_ABONO_IVAChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMCuentasIVA : TDMCuentasIVA;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMCuentasIVA.DMCuentasIVACreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCuentaIVAP_IVA.DisplayFormat := MascaraP;
  QMCuentaIVAP_REC.DisplayFormat := MascaraP;

  DMMain.FiltraTabla(QMCuentaIVA, '11101', True);
end;

procedure TDMCuentasIVA.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCuentaIVA, '11101');
end;

procedure TDMCuentasIVA.QMCuentaIVAAfterOpen(DataSet: TDataSet);
begin
  xTipoIva.Open;
  xModoIva.Open;
end;

procedure TDMCuentasIVA.QMCuentaIVATIPO_IVAChange(Sender: TField);
begin
  with xTipoIva do
  begin
     Close;
     Open;
  end;
end;

procedure TDMCuentasIVA.QMCuentaIVAMODO_IVAChange(Sender: TField);
begin
  with xTipoIva do
  begin
     Close;
     Open;
  end;
end;

procedure TDMCuentasIVA.QMCuentaIVAP_RECGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraP, (xTipoIvaP_RECARGO.AsFloat * xModoIvaRECARGO.AsInteger));
end;

procedure TDMCuentasIVA.QMCuentaIVAP_IVAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraP, (xTipoIvaP_IVA.AsFloat * xModoIvaIVA.AsInteger));
end;

procedure TDMCuentasIVA.QMCuentaIVABeforeClose(DataSet: TDataSet);
begin
  xTipoIva.Close;
  xModoIva.Close;
end;

procedure TDMCuentasIVA.QMCuentaIVACTA_CARGO_IVAChange(Sender: TField);
begin
  if (QMCuentaIVACTA_CARGO_IVA_RECC.AsString = '') then
     QMCuentaIVACTA_CARGO_IVA_RECC.AsString := QMCuentaIVACTA_CARGO_IVA.AsString;
  if (QMCuentaIVACTA_CARGO_IVA_ISP.AsString = '') then
     QMCuentaIVACTA_CARGO_IVA_ISP.AsString := QMCuentaIVACTA_CARGO_IVA.AsString;
end;

procedure TDMCuentasIVA.QMCuentaIVACTA_ABONO_IVAChange(Sender: TField);
begin
  if (QMCuentaIVACTA_ABONO_IVA_RECC.AsString = '') then
     QMCuentaIVACTA_ABONO_IVA_RECC.AsString := QMCuentaIVACTA_ABONO_IVA.AsString;
  if (QMCuentaIVACTA_ABONO_IVA_ISP.AsString = '') then
     QMCuentaIVACTA_ABONO_IVA_ISP.AsString := QMCuentaIVACTA_ABONO_IVA.AsString;
end;

end.
