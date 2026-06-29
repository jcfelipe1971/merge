unit UDMADRTunelCodes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMADRTunelCodes = class(TDataModule)
     QMADRTunelCodes: TFIBTableSet;
     DSQMADRTunelCodes: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMADRTunelCodesCODE: TFIBStringField;
     QMADRTunelCodesNAME: TFIBStringField;
     procedure DMADRTunelCodesCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMADRTunelCodes : TDMADRTunelCodes;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMADRTunelCodes.DMADRTunelCodesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMADRTunelCodes.Open;
end;

procedure TDMADRTunelCodes.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMADRTunelCodes, '00000');
end;

end.
