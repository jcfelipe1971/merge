unit UDMHistoricoSerializacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBTableDataSetRO;

type
  TDMHistoricoSerializacion = class(TDataModule)
     TLocal: THYTransaction;
     DSxHistorico: TDataSource;
     xHistorico: TFIBTableSetRO;
     xHistoricoSERIE: TFIBStringField;
     xHistoricoTIPO: TFIBStringField;
     xHistoricoRIG: TIntegerField;
     xHistoricoLINEA: TIntegerField;
     xHistoricoFECHA: TDateTimeField;
     xHistoricoARTICULO: TFIBStringField;
     xHistoricoSIGNO: TIntegerField;
     xHistoricoCANAL: TIntegerField;
     xHistoricoALMACEN: TFIBStringField;
     xHistoricoEJERCICIO: TIntegerField;
     procedure DMHistoricoSerializacionCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ObtenerHistorico(NSerie: string);
  end;

var
  DMHistoricoSerializacion : TDMHistoricoSerializacion;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMHistoricoSerializacion.DMHistoricoSerializacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMHistoricoSerializacion.ObtenerHistorico(NSerie: string);
begin
  with xHistorico do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['NSerie'].AsString := NSerie;
     Open;
  end;
end;

end.
