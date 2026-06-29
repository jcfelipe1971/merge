unit UDMRCabecera;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet;

type
  TDMRCabecera = class(TDataModule)
     frCabecera: TfrHYReport;
     procedure DMRCabeceraDestroy(Sender: TObject);
     procedure frCabeceraGetValue(const ParName: string; var ParValue: variant);
     procedure frCabeceraEnterRect(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado;
  end;

var
  DMRCabecera : TDMRCabecera;
  SW : integer;

implementation

uses UEntorno, UDMListados;

{$R *.DFM}

procedure TDMRCabecera.DMRCabeceraDestroy(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TDMRCabecera.MostrarListado;
var
  str : string;
begin
  SW := 1;
  frCabecera.LoadFromFIB(0{LST_CABECERA}, str);
  frCabecera.PrepareReport;
  frCabecera.ShowPreparedReport;
end;

procedure TDMRCabecera.frCabeceraGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMRCabecera.frCabeceraEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

end.
