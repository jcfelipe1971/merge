unit UFMExportacionEuroPastry;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFLabel,
  Mask, rxToolEdit, ULFDateEdit, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMExportacionEuroPastry = class(TFPEditSinNavegador)
     DEDesde: TLFDateEdit;
     DEHasta: TLFDateEdit;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     ToolButton1: TToolButton;
     TButtExportar: TToolButton;
     AExportar: TAction;
     LCodigoDistribuidor: TLFLabel;
     ECodigoDistribuidor: TLFEdit;
     LRutaExportacion: TLFLabel;
     DERutaExportacion: TDirectoryEdit;
     CBRestar45Dias: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AExportarExecute(Sender: TObject);
     procedure CBRestar45DiasClick(Sender: TObject);
     procedure DEHastaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMExportacionEuroPastry : TFMExportacionEuroPastry;

implementation

uses UDMExportacionEuroPastry, UFormGest, UEntorno, UUtiles, DateUtils;

{$R *.dfm}

procedure TFMExportacionEuroPastry.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMExportacionEuroPastry, DMExportacionEuroPastry);

  ECodigoDistribuidor.Text := LeeDatoIni('ExportacionEuroPastry', 'CodigoDistribuidor', '');
  DERutaExportacion.Text := LeeDatoIni('ExportacionEuroPastry', 'RutaExportacion', GetSpecialFolderPath(CSIDL_PERSONAL, False));

  DEHasta.Date := Today;
  DEDesde.Date := DEHasta.Date - 45;
end;

procedure TFMExportacionEuroPastry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  EscribeDatoIni('ExportacionEuroPastry', 'CodigoDistribuidor', ECodigoDistribuidor.Text);
  EscribeDatoIni('ExportacionEuroPastry', 'RutaExportacion', DERutaExportacion.Text);

  CierraData(DMExportacionEuroPastry);
end;

procedure TFMExportacionEuroPastry.AExportarExecute(Sender: TObject);
begin
  inherited;
  DMExportacionEuroPastry.Exportar(ECodigoDistribuidor.Text, IncludeTrailingPathDelimiter(DERutaExportacion.Text), DEDesde.Date, DEHasta.Date);
end;

procedure TFMExportacionEuroPastry.CBRestar45DiasClick(Sender: TObject);
begin
  inherited;
  if (CBRestar45Dias.Checked) then
  begin
     DEDesde.Date := DEHasta.Date - 45;
     DEDesde.Enabled := False;
     DEDesde.Color := clInfoBk;
  end
  else
  begin
     DEDesde.Enabled := True;
     DEDesde.Color := clWindow;
  end;
end;

procedure TFMExportacionEuroPastry.DEHastaChange(Sender: TObject);
begin
  inherited;
  if (CBRestar45Dias.Checked) then
     DEDesde.Date := DEHasta.Date - 45;
end;

end.
