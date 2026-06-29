unit UProDMTControlPauta;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TProDMTControlPauta = class(TDataModule)
     TLocal: THYTransaction;
     QMProTControlpauta: TFIBTableSet;
     QMProTControlpautaTIPOCONTROL: TIntegerField;
     QMProTControlpautaDESCRIPCION: TFIBStringField;
     DSTControlpauta: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMProTControlpautaBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMTControlPauta : TProDMTControlPauta;

implementation

uses UDMMain, UFBusca;

{$R *.dfm}

procedure TProDMTControlPauta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProTControlPauta.Open;
end;

procedure TProDMTControlPauta.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProTControlPauta, '00000');
end;

procedure TProDMTControlPauta.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMTControlPauta.QMProTControlpautaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_TIPOCONTROL_PAUTA', 'TIPOCONTROL');
end;

end.
