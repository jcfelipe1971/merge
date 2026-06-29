unit UDMCuentasIRPF;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO;

type
  TDMCuentasIRPF = class(TDataModule)
     QMVerIRPF: TFIBTableSet;
     DSQMVerIRPF: TDataSource;
     QMVerIRPFPAIS: TFIBStringField;
     QMVerIRPFTIPO: TIntegerField;
     QMVerIRPFP_IRPF: TFloatField;
     QMVerIRPFBASE: TIntegerField;
     QMVerIRPFEMPRESA: TIntegerField;
     QMVerIRPFEJERCICIO: TIntegerField;
     QMVerIRPFCANAL: TIntegerField;
     QMVerIRPFCUENTA: TFIBStringField;
     QMVerIRPFCUENTA_ABONO: TFIBStringField;
     QMVerIRPFTITULO: TFIBStringField;
     QMVerIRPFTITULO_BASE: TStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DMCuentasIRPFCreate(Sender: TObject);
     procedure QMVerIRPFTITULO_BASEGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     procedure busquedacompleja;
     { Public declarations }
  end;

var
  DMCuentasIRPF : TDMCuentasIRPF;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca;

{$R *.DFM}

procedure TDMCuentasIRPF.DMCuentasIRPFCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMVerIRPFP_IRPF.DisplayFormat := MascaraP;
  DMMain.FiltraTabla(QMVerIRPF, '11101', True);
  QMVerIRPF.First;
end;

procedure TDMCuentasIRPF.QMVerIRPFTITULO_BASEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMVerIRPFBASE.AsInteger = 0 then
     Text := _('Base Imponible')
  else
     Text := _('Total con IVA');
end;

procedure TDMCuentasIRPF.busquedacompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMVerIRPF, '11101');
end;

end.
