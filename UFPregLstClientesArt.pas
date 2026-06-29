unit UFPregLstClientesArt;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, StdCtrls, rxToolEdit,
  Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFActionList, ULFPageControl, ULFToolBar, ULFDateEdit, ULFEdit,
  ULFComboBox, ULFDBEdit, ULFEditFind2000, ULFLabel, rxPlacemnt,
  ULFFormStorage, ExtCtrls, ULFPanel;

type
  TFPregLstClientesArt = class(TFPEditListado)
     EFArticuloD: TEditFind2000;
     DBEArticuloD: TLFDBEdit;
     DBEArticuloH: TLFDBEdit;
     EFArticuloH: TEditFind2000;
     DTPFechaH: TLFDateEdit;
     DTPFechaD: TLFDateEdit;
     Label5: TLFLabel;
     Label1: TLFLabel;
     TSClientes: TTabSheet;
     CBCanales: TLFComboBox;
     CBSeries: TLFComboBox;
     ToolButton1: TToolButton;
     AConfigurar: TAction;
     Label3: TLFLabel;
     Label4: TLFLabel;
     Label6: TLFLabel;
     EFClienteH: TEditFind2000;
     EFClienteD: TEditFind2000;
     DBEClienteD: TLFDBEdit;
     DBEClienteH: TLFDBEdit;
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
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
  private
     { Private declarations }
     procedure Carga;
  public
     { Public declarations }
  end;

var
  FPregLstClientesArt : TFPregLstClientesArt;

implementation

uses UEntorno, UFormGest, UDMLstClientesArt, UFMListConfig;

{$R *.dfm}

procedure TFPregLstClientesArt.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 
  AbreData(TDMLstClientesArt, DMLstClientesArt);
  CBCanales.Items := DMLstClientesArt.RellenaCanales;
  CBSeries.Items := DMLstClientesArt.RellenaSeries;
  Carga;
end;

procedure TFPregLstClientesArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMLstClientesArt);
  Action := caFree;
end;

procedure TFPregLstClientesArt.Carga;
begin
  PCMain.ActivePage := TSClientes;

  CBCanales.ItemIndex := 0;
  CBSeries.ItemIndex := 0;

  EFArticuloD.Text := DMLstClientesArt.DameArticuloMin;
  EFArticuloH.Text := DMLstClientesArt.DameArticuloMax;
  EFClienteD.Text := DMLstClientesArt.DameClienteMin;
  EFClienteH.Text := DMLstClientesArt.DameClienteMax;

  DTPFechaD.Date := DMLstClientesArt.FechaEjercicio;
  DTPFechaH.Date := REntorno.FechaTrabSH;

  EComentario.Text := '';
end;

procedure TFPregLstClientesArt.AImprimirExecute(Sender: TObject);
var
  alcance, canal : integer;
  serie : string;
begin
  TBMain.SetFocus;

  alcance := 0;
  canal := REntorno.Canal;
  serie := REntorno.Serie;

  if PCMain.ActivePage = TSClientes then
  begin
     if CBSeries.Text = 'Todas las Series' then
        alcance := 1
     else
        serie := CBSeries.Text;

     if CBCanales.Text = 'Todos los Canales' then
        alcance := 2
     else
        canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

     DMLstClientesArt.Muestra(1, DTPFechaD.Date, DTPFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text,
        StrToInt(EFClienteD.Text), StrToInt(EFClienteH.Text),
        alcance, canal, serie);
  end;
end;

procedure TFPregLstClientesArt.APrevExecute(Sender: TObject);
var
  alcance, canal : integer;
  serie : string;
begin
  TBMain.SetFocus;

  alcance := 0;
  canal := REntorno.Canal;
  serie := REntorno.Serie;

  if PCMain.ActivePage = TSClientes then
  begin
     if CBSeries.Text = 'Todas las Series' then
        alcance := 1
     else
        serie := CBSeries.Text;

     if CBCanales.Text = 'Todos los Canales' then
        alcance := 2
     else
        canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

     DMLstClientesArt.Muestra(0, DTPFechaD.Date, DTPFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text,
        StrToInt(EFClienteD.Text), StrToInt(EFClienteH.Text),
        alcance, canal, serie);
  end;
end;

procedure TFPregLstClientesArt.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregLstClientesArt.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPregLstClientesArt.AConfigurarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(153, Formato, Cabecera, Copias,
     Pijama, '', DMLstClientesArt.frClientesArt);
end;

procedure TFPregLstClientesArt.CBCanalesChange(Sender: TObject);
begin
  if cbcanales.ItemIndex = 0 then
     cbseries.ItemIndex := 0;
end;

procedure TFPregLstClientesArt.CBSeriesChange(Sender: TObject);
begin
  if cbcanales.ItemIndex = 0 then
     cbseries.ItemIndex := 0;
end;

procedure TFPregLstClientesArt.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstClientesArt.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstClientesArt.EFArticuloDChange(Sender: TObject);
begin
  if EFArticuloD.Text <> '' then
     DMLstClientesArt.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TFPregLstClientesArt.EFArticuloHChange(Sender: TObject);
begin
  if EFArticuloH.Text <> '' then
     DMLstClientesArt.CambiaArticuloH(EFArticuloH.Text);
end;

procedure TFPregLstClientesArt.EFClienteDChange(Sender: TObject);
begin
  if EFClienteD.Text <> '' then
     DMLstClientesArt.CambiaClienteD(StrToInt(EFClienteD.Text));
end;

procedure TFPregLstClientesArt.EFClienteHChange(Sender: TObject);
begin
  if EFClienteH.Text <> '' then
     DMLstClientesArt.CambiaClienteH(StrToInt(EFClienteH.Text));
end;

end.
