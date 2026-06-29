unit UFPregLstProvArt;

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
  TFPregLstProvArt = class(TFPEditListado)
     EFArticuloD: TEditFind2000;
     DBEArticuloD: TLFDBEdit;
     DBEArticuloHs: TLFDBEdit;
     EFArticuloH: TEditFind2000;
     DTPFechaH: TLFDateEdit;
     DTPFechaD: TLFDateEdit;
     Label5: TLFLabel;
     Label1: TLFLabel;
     TSProveedores: TTabSheet;
     CBCanales: TLFComboBox;
     CBSeries: TLFComboBox;
     ToolButton1: TToolButton;
     AConfigurar: TAction;
     Label3: TLFLabel;
     Label4: TLFLabel;
     Label6: TLFLabel;
     EFProvH: TEditFind2000;
     EFProvD: TEditFind2000;
     DBEProveedorD: TLFDBEdit;
     DBEProveedorH: TLFDBEdit;
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
     procedure EFProvDChange(Sender: TObject);
     procedure EFProvHChange(Sender: TObject);
  private
     { Private declarations }
     procedure Carga;
  public
     { Public declarations }
  end;

var
  FPregLstProvArt : TFPregLstProvArt;

implementation

uses UDMLstProvArt, UEntorno, UFormGest, UFMListConfig;

{$R *.dfm}

procedure TFPregLstProvArt.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 

  AbreData(TDMLstProvArt, DMLstProvArt);
  CBCanales.Items := DMLstProvArt.RellenaCanales;
  CBSeries.Items := DMLstProvArt.RellenaSeries;
  Carga;
end;

procedure TFPregLstProvArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMLstProvArt);
  Action := caFree;
end;

procedure TFPregLstProvArt.Carga;
begin
  PCMain.ActivePage := TSProveedores;

  CBCanales.ItemIndex := 0;
  CBSeries.ItemIndex := 0;

  EFArticuloD.Text := DMLstProvArt.DameArticuloMin;
  EFArticuloH.Text := DMLstProvArt.DameArticuloMax;
  EFProvD.Text := DMLstProvArt.DameProvMin;
  EFProvH.Text := DMLstProvArt.DameProvMax;

  DTPFechaD.Date := DMLstProvArt.FechaEjercicio;
  DTPFechaH.Date := REntorno.FechaTrabSH;

  EComentario.Text := '';
end;

procedure TFPregLstProvArt.AImprimirExecute(Sender: TObject);
var
  alcance, canal : integer;
  serie : string;
begin
  TBMain.SetFocus;

  alcance := 0;
  canal := REntorno.Canal;
  serie := REntorno.Serie;

  if PCMain.ActivePage = TSProveedores then
  begin
     if CBSeries.Text = 'Todas las Series' then
        alcance := 1
     else
        serie := CBSeries.Text;

     if CBCanales.Text = 'Todos los Canales' then
        alcance := 2
     else
        canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

     DMLstProvArt.Muestra(1, DTPFechaD.Date, DTPFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text,
        StrToInt(EFProvD.Text), StrToInt(EFProvH.Text),
        alcance, canal, serie);
  end;
end;

procedure TFPregLstProvArt.APrevExecute(Sender: TObject);
var
  alcance, canal : integer;
  serie : string;
begin
  TBMain.SetFocus;

  alcance := 0;
  canal := REntorno.Canal;
  serie := REntorno.Serie;

  if PCMain.ActivePage = TSProveedores then
  begin
     if CBSeries.Text = 'Todas las Series' then
        alcance := 1
     else
        serie := CBSeries.Text;

     if CBCanales.Text = 'Todos los Canales' then
        alcance := 2
     else
        canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

     DMLstProvArt.Muestra(0, DTPFechaD.Date, DTPFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text,
        StrToInt(EFProvD.Text), StrToInt(EFProvH.Text),
        alcance, canal, serie);
  end;
end;

procedure TFPregLstProvArt.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregLstProvArt.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPregLstProvArt.AConfigurarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(154, Formato, Cabecera, Copias,
     Pijama, '', DMLstProvArt.frProvArt);
end;

procedure TFPregLstProvArt.CBCanalesChange(Sender: TObject);
begin
  if cbcanales.ItemIndex = 0 then
     cbseries.ItemIndex := 0;
end;

procedure TFPregLstProvArt.CBSeriesChange(Sender: TObject);
begin
  if cbcanales.ItemIndex = 0 then
     cbseries.ItemIndex := 0;
end;

procedure TFPregLstProvArt.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstProvArt.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstProvArt.EFArticuloDChange(Sender: TObject);
begin
  if EFArticuloD.Text <> '' then
     DMLstProvArt.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TFPregLstProvArt.EFArticuloHChange(Sender: TObject);
begin
  if EFArticuloH.Text <> '' then
     DMLstProvArt.CambiaArticuloH(EFArticuloH.Text);
end;

procedure TFPregLstProvArt.EFProvDChange(Sender: TObject);
begin
  if EFProvD.Text <> '' then
     DMLstProvArt.CambiaProvD(StrToInt(EFProvD.Text));
end;

procedure TFPregLstProvArt.EFProvHChange(Sender: TObject);
begin
  if EFProvH.Text <> '' then
     DMLstProvArt.CambiaProvH(StrToInt(EFProvH.Text));
end;

end.
