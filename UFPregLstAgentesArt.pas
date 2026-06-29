unit UFPregLstAgentesArt;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, StdCtrls, rxToolEdit,
  Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFActionList, ULFPageControl, ULFToolBar;

type
  TFPregLstAgentesArt = class(TFPEditListado)
     EFArticuloD: TLFEditFind2000;
     DBEArticuloD: TLFDBEdit;
     DBEArticuloH: TLFDBEdit;
     EFArticuloH: TLFEditFind2000;
     DTPFechaH: TLFDateEdit;
     DTPFechaD: TLFDateEdit;
     Label5: TLFLabel;
     Label1: TLFLabel;
     TSAgentes: TTabSheet;
     CBCanales: TLFComboBox;
     CBSeries: TLFComboBox;
     ToolButton1: TToolButton;
     AConfigurar: TAction;
     Label3: TLFLabel;
     Label4: TLFLabel;
     Label6: TLFLabel;
     EFAgenteH: TLFEditFind2000;
     EFAgenteD: TLFEditFind2000;
     DBEAgenteD: TLFDBEdit;
     DBEAgenteH: TLFDBEdit;
     Label2: TLFLabel;
     Label7: TLFLabel;
     Label8: TLFLabel;
     EComentario: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBCanalesChange(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
  private
     { Private declarations }
     procedure Carga;
  public
     { Public declarations }
  end;

var
  FPregLstAgentesArt : TFPregLstAgentesArt;

implementation

uses UDMLstAgentesArt, UEntorno, UFormGest, UFMListConfig;

{$R *.dfm}

procedure TFPregLstAgentesArt.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 
  AbreData(TDMLstAgentesArt, DMLstAgentesArt);
  CBCanales.Items := DMLstAgentesArt.RellenaCanales;
  CBSeries.Items := DMLstAgentesArt.RellenaSeries;
  Carga;
end;

procedure TFPregLstAgentesArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMLstAgentesArt);
  Action := caFree;
end;

procedure TFPregLstAgentesArt.Carga;
begin
  PCMain.ActivePage := TSAgentes;

  CBCanales.ItemIndex := 0;
  CBSeries.ItemIndex := 0;

  EFArticuloD.Text := DMLstAgentesArt.DameArticuloMin;
  EFArticuloH.Text := DMLstAgentesArt.DameArticuloMax;
  EFAgenteD.Text := DMLstAgentesArt.DameAgenteMin;
  EFAgenteH.Text := DMLstAgentesArt.DameAgenteMax;

  DTPFechaD.Date := DMLstAgentesArt.FechaEjercicio;
  DTPFechaH.Date := REntorno.FechaTrabSH;

  EComentario.Text := '';
end;

procedure TFPregLstAgentesArt.AImprimirExecute(Sender: TObject);
var
  alcance, canal : integer;
  serie : string;
begin
  TBMain.SetFocus;

  alcance := 0;
  canal := REntorno.Canal;
  serie := REntorno.Serie;

  if PCMain.ActivePage = TSAgentes then
  begin
     if CBSeries.Text = 'Todas las Series' then
        alcance := 1
     else
        serie := CBSeries.Text;

     if CBCanales.Text = 'Todos los Canales' then
        alcance := 2
     else
        canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

     DMLstAgentesArt.Muestra(1, DTPFechaD.Date, DTPFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text,
        StrToInt(EFAgenteD.Text), StrToInt(EFAgenteH.Text),
        alcance, canal, serie);
  end;
end;

procedure TFPregLstAgentesArt.APrevExecute(Sender: TObject);
var
  alcance, canal : integer;
  serie : string;
begin
  TBMain.SetFocus;

  alcance := 0;
  canal := REntorno.Canal;
  serie := REntorno.Serie;

  if PCMain.ActivePage = TSAgentes then
  begin
     if CBSeries.Text = 'Todas las Series' then
        alcance := 1
     else
        serie := CBSeries.Text;

     if CBCanales.Text = 'Todos los Canales' then
        alcance := 2
     else
        canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

     DMLstAgentesArt.Muestra(0, DTPFechaD.Date, DTPFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text,
        StrToInt(EFAgenteD.Text), StrToInt(EFAgenteH.Text),
        alcance, canal, serie);
  end;
end;

procedure TFPregLstAgentesArt.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregLstAgentesArt.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPregLstAgentesArt.AConfigurarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(152, Formato, Cabecera, Copias,
     Pijama, '', DMLstAgentesArt.frAgentesArt);
end;

procedure TFPregLstAgentesArt.CBCanalesChange(Sender: TObject);
begin
  if cbcanales.ItemIndex = 0 then
     cbseries.ItemIndex := 0;
end;

procedure TFPregLstAgentesArt.CBSeriesChange(Sender: TObject);
begin
  if cbcanales.ItemIndex = 0 then
     cbseries.ItemIndex := 0;
end;

procedure TFPregLstAgentesArt.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstAgentesArt.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstAgentesArt.EFArticuloDChange(Sender: TObject);
begin
  if EFArticuloD.Text <> '' then
     DMLstAgentesArt.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TFPregLstAgentesArt.EFArticuloHChange(Sender: TObject);
begin
  if EFArticuloH.Text <> '' then
     DMLstAgentesArt.CambiaArticuloH(EFArticuloH.Text);
end;

procedure TFPregLstAgentesArt.EFAgenteDChange(Sender: TObject);
begin
  if EFAgenteD.Text <> '' then
     DMLstAgentesArt.CambiaAgenteD(StrToInt(EFAgenteD.Text));
end;

procedure TFPregLstAgentesArt.EFAgenteHChange(Sender: TObject);
begin
  if EFAgenteH.Text <> '' then
     DMLstAgentesArt.CambiaAgenteH(StrToInt(EFAgenteH.Text));
end;

end.
