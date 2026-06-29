unit UDMVerificaStockEscandallo;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBDataSet, HYFIBQuery;

type
  TDMVerificaStockEscandallo = class(TDataModule)
     QArticulo: TFIBDataSetRO;
     TLocal: THYTransaction;
     QEscandallo: TFIBDataSetRO;
     DSQEscandallo: TDataSource;
     QEscandalloDETALLE: TFIBStringField;
     QEscandalloTITULO: TFIBStringField;
     QEscandalloCANTIDAD: TFloatField;
     QEscandalloNECESIDAD: TFloatField;
     QEscandalloEXISTENCIAS: TFloatField;
     procedure DMVerificaStockEscandalloCreate(Sender: TObject);
     procedure DMVerificaStockEscandalloDestroy(Sender: TObject);
     procedure QEscandalloNECESIDADGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QEscandalloEXISTENCIASGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     Cantidad: real;
     Almacen: string;
  end;

var
  DMVerificaStockEscandallo : TDMVerificaStockEscandallo;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMVerificaStockEscandallo.DMVerificaStockEscandalloCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMVerificaStockEscandallo.DMVerificaStockEscandalloDestroy(Sender: TObject);
begin
  if TLocal.InTransaction then
     TLocal.Commit;
end;

procedure TDMVerificaStockEscandallo.QEscandalloNECESIDADGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FloatToStr(QEscandalloCANTIDAD.AsFloat * Cantidad);
end;

procedure TDMVerificaStockEscandallo.QEscandalloEXISTENCIASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QEscandalloDETALLE.AsString > '') then
     Text := FormatFloat(',0.00', DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QEscandalloDETALLE.AsString, Almacen));
end;

end.
