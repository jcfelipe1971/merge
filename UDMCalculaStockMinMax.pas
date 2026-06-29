unit UDMCalculaStockMinMax;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, FIBDatabase;

type
  TDMCalculaStockMinMax = class(TDataModule)
     TLocal: TFIBTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMCalculaStockMinMax : TDMCalculaStockMinMax;

implementation

uses UDMMain;

{$R *.DFM}

procedure TDMCalculaStockMinMax.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMCalculaStockMinMax.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

end.
