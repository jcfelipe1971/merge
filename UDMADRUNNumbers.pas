unit UDMADRUNNumbers;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMADRUNNumbers = class(TDataModule)
     QMADRUNNumbers: TFIBTableSet;
     DSQMADRUNNumbers: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMADRUNNumbersUN_NUMBER: TFIBStringField;
     QMADRUNNumbersNAME: TFIBStringField;
     procedure DMADRUNNumbersCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMADRUNNumbers : TDMADRUNNumbers;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMADRUNNumbers.DMADRUNNumbersCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMADRUNNumbers.Open;
end;

procedure TDMADRUNNumbers.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMADRUNNumbers, '00000');
end;

end.
