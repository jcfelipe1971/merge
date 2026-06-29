unit UDMADRClases;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMADRClases = class(TDataModule)
     QMADRClases: TFIBTableSet;
     DSQMADRClases: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMADRClasesCLASS: TFIBStringField;
     QMADRClasesNAME: TFIBStringField;
     procedure DMADRClasesCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMADRClases : TDMADRClases;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMADRClases.DMADRClasesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMADRClases.Open;
end;

procedure TDMADRClases.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMADRClases, '00000');
end;

end.
