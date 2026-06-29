unit UFMLst;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, StdCtrls,
  TFlatCheckBoxUnit, ULFCheckBox, ULFEdit, ULFComboBox, DBCtrls, Mask,
  rxToolEdit, ULFLabel, ExtCtrls, ULFPanel, ULFDBEdit, rxPlacemnt,
  ULFFormStorage, fr_HYReport, frxHyReport, ULFDateEdit;

type
  TFMLst = class(TFPEditListado)
     TSLimites: TTabSheet;
     TSOpciones: TTabSheet;
     PNLOpcGen: TLFPanel;
     LblFechaList: TLFLabel;
     LblMoneda: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     DBLCBMoneda: TDBLookupComboBox;
     CBCanales: TLFComboBox;
     LblComentario: TLFLabel;
     EDComentario: TLFEdit;
     GBEjemploEditFindDesdeHasta: TGroupBox;
     ChkLimClie: TLFCheckBox;
     LblDesCli: TLFLabel;
     EdDesCli: TLFEditFind2000;
     TitDesCli: TLFDbedit;
     LblHasCli: TLFLabel;
     EdHasCli: TLFEditFind2000;
     TitHasCli: TLFDbedit;
     TSAgrupOrd: TTabSheet;
     LblCanal: TLFLabel;
     CBOrden: TLFComboBox;
     GBAgrupadoPor: TGroupBox;
     TButtConf: TToolButton;
     RGTipoInforme: TRadioGroup;
     PNLOpciones: TLFPanel;
     LblOrden: TLFLabel;
     RGResumido: TRadioGroup;
     PNLTipoInforme: TLFPanel;
     RGSaltoPagina: TRadioGroup;
     PNLTotales: TLFPanel;
     PNLLimFilMae: TLFPanel;
     ChkFilMae: TLFCheckBox;
     PNLLimites: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ChkLimClieChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure RGResumidoClick(Sender: TObject);
  private
     { Private declarations }
     tmpOrdenDet, tmpOrdenRes: TStrings;
     function GetResumido: boolean;
     procedure SetResumido(const Value: boolean);
  public
     { Public declarations }
     property Resumido: boolean Read GetResumido Write SetResumido;
     procedure CheckTotales(Valor: boolean);
     procedure EnableTotales(Valor: boolean);
  end;

implementation

uses
  UDMMain, UEntorno, UFormGest, UFMListConfig, DB, FibDataSetRO, URellenaLista;

{$R *.dfm}

procedure TFMLst.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;

  RellenaCanales(CBCanales.Items);
  tmpOrdenDet := TStringList.Create;
  tmpOrdenRes := TStringList.Create;
  for i := 0 to CBOrden.Items.Count - 1 do
  begin
     tmpOrdenDet.Add(CBOrden.Items[i]);
     tmpOrdenRes.Add(Format(_('Resumido por %s'), [Copy(CBOrden.Items[i], 1, Pos('/', CBOrden.Items[i]) - 1)]));
  end;
  TButtRecargar.Click;
end;

procedure TFMLst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmpOrdenDet.Free;
  tmpOrdenRes.Free;
  inherited;
end;

procedure TFMLst.ARecargarExecute(Sender: TObject);
begin
  inherited;
  CBCanales.ItemIndex := REntorno.Canal;
  DBLCBMoneda.KeyValue := REntorno.Moneda;
  DTPFechaListado.Date := REntorno.FechaTrab;
  CBOrden.ItemIndex := 0;
  RGTipoInforme.ItemIndex := 0;
  RGResumido.ItemIndex := 0;
  RGSaltoPagina.ItemIndex := 0;
  CheckTotales(False);
  PCMain.ActivePage := TSLimites;
end;

procedure TFMLst.ChkLimClieChange(Sender: TObject);
begin
  inherited;
  EDDesCli.Enabled := ChkLimClie.Checked;
  EDHasCli.Enabled := ChkLimClie.Checked;
end;

function TFMLst.GetResumido: boolean;
begin
  Result := (RGResumido.ItemIndex = 1);
end;

procedure TFMLst.SetResumido(const Value: boolean);
begin
  if Value then
     RGResumido.ItemIndex := 1
  else
     RGResumido.ItemIndex := 0;
end;

procedure TFMLst.CheckTotales(Valor: boolean);
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
     if (Self.Components[i] is TLFCheckBox) then
        with TLFCheckBox(Self.Components[i]) do
           if Parent = GBAgrupadoPor then
              Checked := Valor;
end;

procedure TFMLst.EnableTotales(Valor: boolean);
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
     if (Self.Components[i] is TLFCheckBox) then
        with TLFCheckBox(Self.Components[i]) do
           if Parent = GBAgrupadoPor then
              Enabled := Valor;
end;

procedure TFMLst.RGResumidoClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := CBOrden.ItemIndex;
  if Resumido then
     CBOrden.Items.Assign(tmpOrdenRes)
  else
     CBOrden.Items.Assign(tmpOrdenDet);
  CBOrden.ItemIndex := i;
end;

end.
