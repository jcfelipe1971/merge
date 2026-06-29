unit UFMReportesReportSmith;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ULFEdit, ULFLabel, ExtCtrls, ULFPanel, IniFiles,
  rxPlacemnt, ULFFormStorage;

type
  TFMReportesReportSmith = class(TG2KForm)
     PNLCabecera: TLFPanel;
     PNLPie: TLFPanel;
     PNLListados: TLFPanel;
     LCarpeta: TLFLabel;
     ECarpetaReportes: TLFEdit;
     BImprimir: TButton;
     LBReportes: TListBox;
     LTipoReporte: TLFLabel;
     ETipoReporte: TLFEdit;
     FSMain: TLFFibFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure ETipoReporteChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LBReportesDblClick(Sender: TObject);
     procedure BImprimirClick(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormResize(Sender: TObject);
  private
     { Private declarations }
     Archivo: TStrings;
  public
     { Public declarations }
     procedure EstablecerTipo(Tipo: string);
  end;

var
  FMReportesReportSmith : TFMReportesReportSmith;

implementation

uses UEntorno;

{$R *.dfm}

procedure TFMReportesReportSmith.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  ECarpetaReportes.Text := REntorno.ReportesReportSmith;
  ETipoReporte.Text := '';
  Archivo := TStringList.Create;
end;

procedure TFMReportesReportSmith.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMReportesReportSmith.ETipoReporteChange(Sender: TObject);
var
  oini : TIniFile;
  Secciones : TStrings;
  i : integer;
  Tipo : string;
begin
  Archivo.Clear;
  LBReportes.Items.Clear;
  {Abro Reportes.ini de la ubicacion que tenga el G2k2Plus.ini}
  oini := TIniFile.Create(REntorno.ReportesReportSmith + 'Reportes.ini');
  try
     {Busco todas las secciones (Rep001, Rep002, ...)}
     Secciones := TStringList.Create;
     try
        oini.ReadSections(Secciones);
        {Recorro los listados}
        for i := 0 to Secciones.Count - 1 do
        begin
           Tipo := oini.ReadString(Secciones[i], 'Tipo', '');
           {Solo tengo en cuenta los del tipo deseado}
           if (Tipo = ETipoReporte.Text) then
           begin
              LBReportes.Items.Add(oini.ReadString(Secciones[i], 'Titulo', ''));
              Archivo.Add(oini.ReadString(Secciones[i], 'Archivo', ''));
           end;
        end;
     finally
        Secciones.Free;
     end;
  finally
     oini.Free;
  end;
end;

procedure TFMReportesReportSmith.LBReportesDblClick(Sender: TObject);
begin
  BImprimir.Click;
end;

procedure TFMReportesReportSmith.BImprimirClick(Sender: TObject);
begin
  if (Archivo[LBReportes.ItemIndex] > '') then
     winexec(PChar('"' + REntorno.RuntimeReportSmith + 'rs_run.exe" ' + REntorno.ReportesReportSmith + Archivo[LBReportes.ItemIndex]), SW_MAXIMIZE);
end;

procedure TFMReportesReportSmith.EstablecerTipo(Tipo: string);
begin
  ETipoReporte.Text := Tipo;
end;

procedure TFMReportesReportSmith.FormDestroy(Sender: TObject);
begin
  Archivo.Free;
end;

procedure TFMReportesReportSmith.FormShow(Sender: TObject);
begin
  {Centrar el botón imprimir}
  BImprimir.Left := (PNLPie.Width div 2) - (BImprimir.Width div 2);
end;

procedure TFMReportesReportSmith.FormResize(Sender: TObject);
begin
  {Centrar el botón imprimir}
  BImprimir.Left := (PNLPie.Width div 2) - (BImprimir.Width div 2);
end;

end.
