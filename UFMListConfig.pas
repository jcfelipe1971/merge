unit UFMListConfig;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEditListado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, UEditPanel, ToolWin, ActnList, Mask, DBCtrls,
  UHYEdits, fr_HYReport, UHYReport, UHYReportMail, ULFDBEdit, ULFCheckBox,
  ULFEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, frxHYReport, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFMListConfig = class(TFPEditListadoSimple)
     PNLMain: TLFPanel;
     TButtSalir2: TToolButton;
     EFFormato: TLFEditFind2000;
     LBLFormato: TLFLabel;
     LBLCopias: TLFLabel;
     ECopias: TLFEdit;
     LBLCabecera: TLFLabel;
     EFCabecera: TLFEditFind2000;
     CHKPijama: TLFCheckBox;
     DBEFormato: TLFDbedit;
     DBECabecera: TLFDbedit;
     LTipo: TLFLabel;
     EdTipo: TLFEdit;
     LBLFormatoGrupo: TLFLabel;
     LBLCabeceraGrupo: TLFLabel;
     DBEGruFor: TLFDbedit;
     DBEGruCab: TLFDbedit;
     CHKDefecto: TLFCheckBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFFormatoChange(Sender: TObject);
     procedure EFCabeceraChange(Sender: TObject);
     procedure EFFormatoBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     inicio: integer;
     Grupo, Formato, Cabecera, Copias, Pijama: integer;
     GrupoStr: string;
     TipoListado: string;
     procedure VisualizaDatos;
  public
     { Public declarations }
     // procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer);
     procedure Muestra(aGrupo: integer; var aFormato, aCabecera, aCopias, aPijama: integer; Serie: string); overload;
     procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrHyReport); overload;
     procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrHyReport; DesignHYReport: THyReport); overload;
     procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrHyReport; DesignHYReportMail: THyReportMail); overload;
     procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrHyReport; DesignHYReport: THyReport; DesignHYReportMail: THyReportMail); overload;
     { Procedimientos para FastReport 3 }
     procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrxHYReport); overload;
     procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrxHYReport; DesignHYReport: THyReport); overload;
     procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrxHYReport; DesignHYReportMail: THyReportMail); overload;
     procedure Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrxHYReport; DesignHYReport: THyReport; DesignHYReportMail: THyReportMail); overload;
  end;

var
  FMListConfig : TFMListConfig;

implementation

uses UDMMain, UFormGest, UEntorno, Uutiles, UDMListConfig;

{$R *.DFM}

procedure TFMListConfig.FormCreate(Sender: TObject);
begin
  inherited;

  inicio := 1;
  AbreData(TDMListConfig, DMListConfig);
end;

procedure TFMListConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMListConfig);
end;

procedure TFMListConfig.ARecargarExecute(Sender: TObject);
begin
  inherited;
  VisualizaDatos;
end;

procedure TFMListConfig.VisualizaDatos;
begin
  EFFormato.Text := IntToStr(Formato);
  EFCabecera.Text := IntToStr(Cabecera);
  Ecopias.Text := IntToStr(Copias);
  EdTipo.Text := TipoListado;
  if Pijama = 1 then
     CHKPijama.State := cbChecked
  else
     CHKPijama.State := cbUnchecked;
  Inicio := 0;

  Self.Caption := GrupoStr;
end;

procedure TFMListConfig.Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrHYReport);
begin
  DMListConfig.frListado := DesignReport;
  Muestra(Grupo, Formato, Cabecera, Copias, Pijama, Serie);
end;

procedure TFMListConfig.Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrHYReport; DesignHYReport: THyReport);
begin
  DMListConfig.frListado := DesignReport;
  DMListConfig.HyReport := DesignHYReport;
  Muestra(Grupo, Formato, Cabecera, Copias, Pijama, Serie);
end;

procedure TFMListConfig.Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrHYReport; DesignHYReportMail: THyReportMail);
begin
  DMListConfig.frListado := DesignReport;
  DMListConfig.HYReportMail := DesignHYReportMail;
  Muestra(Grupo, Formato, Cabecera, Copias, Pijama, Serie);
end;

procedure TFMListConfig.Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrHYReport; DesignHYReport: THyReport; DesignHYReportMail: THyReportMail);
begin
  DMListConfig.frListado := DesignReport;
  DMListConfig.HyReport := DesignHYReport;
  DMListConfig.HYReportMail := DesignHYReportMail;
  Muestra(Grupo, Formato, Cabecera, Copias, Pijama, Serie);
end;

procedure TFMListConfig.Muestra(aGrupo: integer; var aFormato, aCabecera, aCopias, aPijama: integer; Serie: string);
begin
  Grupo := aGrupo;
  Formato := aFormato;
  Cabecera := aCabecera;
  Copias := aCopias;
  Pijama := aPijama;

  DMListConfig.Carga(Grupo, Formato, Cabecera, Copias, Pijama, GrupoStr, TipoListado, Serie);

  VisualizaDatos;
  ShowModal;

  // Devuelvo datos
  aFormato := StrToIntDef(EFFormato.Text, 0);
  aCabecera := StrToIntDef(EFCabecera.Text, 0);
  aCopias := StrToIntDef(ECopias.Text, 1);
  TipoListado := EdTipo.Text;
  aPijama := BoolToInt(CHKPijama.Checked);

  // Guardo en el entorno
  REntorno.Grupo := Grupo;
  REntorno.Formato := aFormato;
  REntorno.Cabecera := aCabecera;
  REntorno.Copias := aCopias;
  REntorno.Pijama := aPijama;
  REntorno.TipoListado := TipoListado;
end;

procedure TFMListConfig.EFFormatoChange(Sender: TObject);
var
  Cabecera : integer;
  TipoListado : string;
begin
  if inicio = 0 then
  begin
     DMListConfig.CambiaFormato(StrToIntDef(EFFormato.Text, Formato), Cabecera, TipoListado);
     EFCabecera.Text := IntToStr(Cabecera);
     EdTipo.Text := TipoListado;
  end;
end;

procedure TFMListConfig.EFCabeceraChange(Sender: TObject);
begin
  if inicio = 0 then
     DMListConfig.CambiaCabecera(StrToIntDef(EFCabecera.Text, 1000));
end;

procedure TFMListConfig.EFFormatoBusqueda(Sender: TObject);
begin
  EFFormato.CondicionBusqueda := 'grupo=' + IntToStr(Grupo);
end;

procedure TFMListConfig.FormShow(Sender: TObject);
begin
  inherited;
  EFFormato.SetFocus;
end;

procedure TFMListConfig.Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrxHYReport; DesignHYReport: THyReport);
begin
  DMListConfig.frxListado := DesignReport;
  DMListConfig.HyReport := DesignHYReport;
  Muestra(Grupo, Formato, Cabecera, Copias, Pijama, Serie);
end;

procedure TFMListConfig.Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrxHYReport);
begin
  DMListConfig.frxListado := DesignReport;
  Muestra(Grupo, Formato, Cabecera, Copias, Pijama, Serie);
end;

procedure TFMListConfig.Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrxHYReport; DesignHYReport: THyReport; DesignHYReportMail: THyReportMail);
begin
  DMListConfig.frxListado := DesignReport;
  DMListConfig.HyReport := DesignHYReport;
  DMListConfig.HYReportMail := DesignHYReportMail;
  Muestra(Grupo, Formato, Cabecera, Copias, Pijama, Serie);
end;

procedure TFMListConfig.Muestra(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; Serie: string; DesignReport: TfrxHYReport; DesignHYReportMail: THyReportMail);
begin
  DMListConfig.frxListado := DesignReport;
  DMListConfig.HYReportMail := DesignHYReportMail;
  Muestra(Grupo, Formato, Cabecera, Copias, Pijama, Serie);
end;

procedure TFMListConfig.AConfigurarExecute(Sender: TObject);
begin
  // inherited;
  DMListConfig.Disenyar;
  if (CHKDefecto.Checked and (EFFormato.Text <> '') and (DBEGruFor.Text <> '')) then
     DMListConfig.PorDefecto(EFFormato.Text, DBEGruFor.Text);
end;

end.
