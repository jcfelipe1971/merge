unit UDMTipoIncidenciaMaq;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMTipoIncidenciaMaq = class(TDataModule)
     DSQMTipoIncidencia: TDataSource;
     QMTipoIncidencia: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMTipoIncidenciaTIPO: TFIBStringField;
     QMTipoIncidenciaDESCRIPCION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMTipoIncidenciaMaq : TDMTipoIncidenciaMaq;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.dfm}

procedure TDMTipoIncidenciaMaq.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTipoIncidencia.Open;
end;

procedure TDMTipoIncidenciaMaq.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTipoIncidenciaMaq.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoIncidencia, '00000');
end;

end.
