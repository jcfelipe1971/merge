unit UDMMateriales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMMateriales = class(TDataModule)
     DSQMMateriales: TDataSource;
     QMMateriales: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMMaterialesCODIGO: TFIBStringField;
     QMMaterialesTITULO: TFIBStringField;
     procedure BusquedaCompleja;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMMateriales : TDMMateriales;

implementation

uses
  UDMMain, UFBusca;

{$R *.DFM}

procedure TDMMateriales.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMMateriales.Open;
end;

procedure TDMMateriales.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMateriales, '00000');
end;

end.
