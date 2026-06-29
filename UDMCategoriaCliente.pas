unit UDMCategoriaCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMCategoriaCliente = class(TDataModule)
     DSQMCategoriaCliente: TDataSource;
     QMCategoriaCliente: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCategoriaClienteCODIGO: TFIBStringField;
     QMCategoriaClienteTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMCategoriaCliente : TDMCategoriaCliente;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.dfm}

procedure TDMCategoriaCliente.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMCategoriaCliente.Open;
end;

procedure TDMCategoriaCliente.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCategoriaCliente, '00000');
end;

end.
