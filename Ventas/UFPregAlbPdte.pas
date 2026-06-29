unit UFPregAlbPdte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, StdCtrls, ComCtrls, ExtCtrls,
  ToolWin, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, DateUtils,
  UDBDateTimePicker, Grids, DBGrids, rxToolEdit, ULFDBEdit, ULFActionList,
  ULFComboBox, ULFEdit, ULFPanel, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, ULFDateEdit, TFlatCheckBoxUnit, ULFCheckBox,
  rxPlacemnt, ULFFormStorage;

type
  TFPregAlbPdte = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     TSCliente: TTabSheet;
     Panel5: TLFPanel;
     LClienteD: TLFLabel;
     EFClienteD: TLFEditFind2000;
     EClienteD: TLFEdit;
     EClienteH: TLFEdit;
     EFClienteH: TLFEditFind2000;
     LClienteH: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     RBFacturado: TRadioButton;
     RBPdteFacturar: TRadioButton;
     RBTodos: TRadioButton;
     TButtMultiSerie: TToolButton;
     AMultiSerie: TAction;
     CBAgrupadoPorModelo: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure AMultiSerieExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     SentenciaWhere: TStringList;
  end;

var
  FPregAlbPdte : TFPregAlbPdte;

implementation

uses UDMMain, UDMLstAlbPdte, UFormGest, UFMain, UEntorno, UFMMultiSerie, UUtiles, UDameDato;

{$R *.dfm}

procedure TFPregAlbPdte.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstAlbPdte, DMLstAlbPdte);

  Grupo := 5109;
  Listado := DMLstAlbPdte.frAlbPdte;
  ListadoFR3 := DMLstAlbPdte.frxAlbPdte;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  PNLTop.Visible := True;
  ARecargar.Execute;

  //Copio el stringlist al formulario del listado
  SentenciaWhere := TStringList.Create;
  SentenciaWhere.Add('(' + chr(39) + REntorno.Serie + chr(39) + ')');

  TDPFechaListado.Date := REntorno.FechaTrabSH;
end;

procedure TFPregAlbPdte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SentenciaWhere.Free;
  CierraData(DMLstAlbPdte);
end;

procedure TFPregAlbPdte.ARecargarExecute(Sender: TObject);
var
  year, month, day, dias : word;
  Min, Max : integer;
begin
  inherited;

  PCMain.ActivePage := TSCliente;

  CBOrden.Clear;
  CBOrden.Items.Add(_('Por Cliente'));
  CBOrden.Items.Add(_('Por Fecha de Albarán'));
  CBOrden.Items.Add(_('Por Número de Albarán'));
  CBOrden.ItemIndex := 0;

  DameMinMax('CLI', Min, Max);
  EFClienteD.Text := IntToStr(Min);
  EFClienteH.Text := IntToStr(Max);

  // Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dias := DaysInMonth(REntorno.FechaTrabSH);

  DTPFechaD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
end;

procedure TFPregAlbPdte.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  TipoServido : integer;
begin
  TipoServido := -1;
  if (RBPdteFacturar.Checked) then
     TipoServido := 0; // Mostrará sólo los pendientes de servir
  if (RBFacturado.Checked) then
     TipoServido := 1; // Mostrará sólo los servidos
  if (RBTodos.Checked) then
     TipoServido := 10; // Los mostrará todos

  DMLstAlbPdte.CrearSQL(CBAgrupadoPorModelo.Checked, SentenciaWhere.Text, CBOrden.ItemIndex);

  if PCMain.ActivePage = TSCliente then
  begin
     DMLstAlbPdte.MostrarListado(Modo, DTPFechaD.Date, DTPFechaH.Date, StrToIntDef(EFClienteD.Text, 0), StrToIntDef(EFClienteH.Text, 0), TipoServido, 1, '0', TDPFechaListado.Date, EComentario.Text, CBOrden.Items[CBOrden.ItemIndex]);
  end;
end;

procedure TFPregAlbPdte.EFClienteDChange(Sender: TObject);
begin
  inherited;
  EClienteD.Text := DameTituloCliente(StrToIntDef(EFClienteD.Text, 0));
end;

procedure TFPregAlbPdte.EFClienteHChange(Sender: TObject);
begin
  inherited;
  EClienteH.Text := DameTituloCliente(StrToIntDef(EFClienteH.Text, 0));
end;

procedure TFPregAlbPdte.AMultiSerieExecute(Sender: TObject);
begin
  inherited;
  TFMMultiSerie.Create(Self).RellenaSeries(SentenciaWhere);
end;

end.
