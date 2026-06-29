unit UFPregLstEstadisticasVentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, StdCtrls, rxToolEdit,
  Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFActionList, ULFPageControl, ULFToolBar, ExtCtrls, ULFPanel,
  ULFEditFind2000, ULFDBEdit, ULFEdit, ULFComboBox, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFPregLstEstadisticasVentas = class(TFPEditListado)
     EFArticuloD: TLFEditFind2000;
     EArticuloD: TLFEdit;
     EArticuloH: TLFEdit;
     EFArticuloH: TLFEditFind2000;
     DEFechaH: TLFDateEdit;
     DEFechaD: TLFDateEdit;
     LFechaD: TLFLabel;
     LArticuloD: TLFLabel;
     TSAgentes: TTabSheet;
     ToolButton1: TToolButton;
     LArticuloH: TLFLabel;
     LBLAgenteD: TLFLabel;
     LBLAgenteH: TLFLabel;
     EFAgenteH: TLFEditFind2000;
     EFAgenteD: TLFEditFind2000;
     DBEAgenteD: TLFEdit;
     DBEAgenteH: TLFEdit;
     LBLComentario: TLFLabel;
     EComentario: TLFEdit;
     TSClientes: TTabSheet;
     LBLClienteD: TLFLabel;
     EFClienteD: TLFEditFind2000;
     DBEClienteD: TLFEdit;
     DBEClienteH: TLFEdit;
     EFClienteH: TLFEditFind2000;
     LBLClienteH: TLFLabel;
     TSProveedores: TTabSheet;
     LBLProveedorD: TLFLabel;
     EFProvD: TLFEditFind2000;
     DBEProveedorD: TLFEdit;
     DBEProveedorH: TLFEdit;
     LBLProveedorH: TLFLabel;
     EFProvH: TLFEditFind2000;
     LFPMain: TLFPanel;
     CBCanales: TLFComboBox;
     CBSeries: TLFComboBox;
     Canal: TLFLabel;
     Serie: TLFLabel;
     LFechaH: TLFLabel;
     LClienteAgenteD: TLFLabel;
     LClienteAgenteH: TLFLabel;
     EFClienteAgenteH: TLFEditFind2000;
     EFClienteAgenteD: TLFEditFind2000;
     DBEClienteAgenteTituloD: TLFEdit;
     DBEClienteAgenteTituloH: TLFEdit;
     LFamiliaD: TLFLabel;
     LFamiliaH: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     EFFamiliaH: TLFEditFind2000;
     EFamiliaD: TLFEdit;
     EFamiliaH: TLFEdit;
     TBExportar: TToolButton;
     CBProrratearPortes: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBCanalesChange(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFProvDChange(Sender: TObject);
     procedure EFProvHChange(Sender: TObject);
     procedure TSAgentesShow(Sender: TObject);
     procedure TSClientesShow(Sender: TObject);
     procedure TSProveedoresShow(Sender: TObject);
     procedure EFClienteAgenteDChange(Sender: TObject);
     procedure EFClienteAgenteHChange(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
  private
     { Private declarations }
     procedure Carga;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregLstEstadisticasVentas : TFPregLstEstadisticasVentas;

implementation

uses UDMLstEstadisticasVentas, UEntorno, UFormGest, UFMListConfig, UDMMain, UUtiles, UDameDato, URellenaLista;

{$R *.dfm}

procedure TFPregLstEstadisticasVentas.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstEstadisticasVentas, DMLstEstadisticasVentas);
  RellenaCanales(CBCanales.Items);
  RellenaSeries(CBSeries.Items);
  Carga;
  Grupo := 152;
  Listado := DMLstEstadisticasVentas.frEstadisticasArt;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregLstEstadisticasVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstEstadisticasVentas);
end;

procedure TFPregLstEstadisticasVentas.Carga;
var
  sMin, sMax : string;
  iMin, iMax : integer;
begin
  PCMain.ActivePage := TSAgentes;

  CBCanales.ItemIndex := 0;
  CBSeries.ItemIndex := 0;

  // Articulos
  DameMinMax('ART', sMin, sMax);
  EFArticuloD.Text := sMin;
  EFArticuloH.Text := sMax;

  // Familias
  DameMinMax('FAM', sMin, sMax);
  EFFamiliaD.Text := sMin;
  EFFamiliaH.Text := sMax;

  // Agentes
  DameMinMax('AGE', iMin, iMax);
  EFAgenteD.Text := IntToStr(iMin);
  EFAgenteH.Text := IntToStr(iMax);
  EFClienteAgenteD.Text := IntToStr(iMin);
  EFClienteAgenteH.Text := IntToStr(iMax);

  DEFechaD.Date := DMLstEstadisticasVentas.FechaEjercicio;
  DEFechaH.Date := REntorno.FechaTrabSH;

  EComentario.Text := '';

  // Clientes
  DameMinMax('CLI', iMin, iMax);
  EFClienteD.Text := IntToStr(iMin);
  EFClienteH.Text := IntToStr(iMax);

  // Proveedores
  DameMinMax('PRO', iMin, iMax);
  EFProvD.Text := IntToStr(iMin);
  EFProvH.Text := IntToStr(iMax);
end;

procedure TFPregLstEstadisticasVentas.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPregLstEstadisticasVentas.CBCanalesChange(Sender: TObject);
begin
  if CBCanales.ItemIndex = 0 then
     CBSeries.ItemIndex := 0;
end;

procedure TFPregLstEstadisticasVentas.CBSeriesChange(Sender: TObject);
begin
  if CBCanales.ItemIndex = 0 then
     CBSeries.ItemIndex := 0;
end;

procedure TFPregLstEstadisticasVentas.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstEstadisticasVentas.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstEstadisticasVentas.EFArticuloDChange(Sender: TObject);
begin
  EArticuloD.Text := DameTituloArticulo(EFArticuloD.Text);
end;

procedure TFPregLstEstadisticasVentas.EFArticuloHChange(Sender: TObject);
begin
  EArticuloH.Text := DameTituloArticulo(EFArticuloH.Text);
end;

procedure TFPregLstEstadisticasVentas.EFAgenteDChange(Sender: TObject);
begin
  DBEAgenteD.Text := DameTituloAgente(StrToIntDef(EFAgenteD.Text, 0));
end;

procedure TFPregLstEstadisticasVentas.EFAgenteHChange(Sender: TObject);
begin
  DBEAgenteH.Text := DameTituloAgente(StrToIntDef(EFAgenteH.Text, 0));
end;

procedure TFPregLstEstadisticasVentas.EFClienteDChange(Sender: TObject);
begin
  DBEClienteD.Text := DameTituloCliente(StrToIntDef(EFClienteD.Text, 0));
end;

procedure TFPregLstEstadisticasVentas.EFClienteHChange(Sender: TObject);
begin
  DBEClienteH.Text := DameTituloCliente(StrToIntDef(EFClienteH.Text, 0));
end;

procedure TFPregLstEstadisticasVentas.EFProvDChange(Sender: TObject);
begin
  DBEProveedorD.Text := DameTituloProveedor(StrToIntDef(EFProvD.Text, 0));
end;

procedure TFPregLstEstadisticasVentas.EFProvHChange(Sender: TObject);
begin
  DBEProveedorH.Text := DameTituloProveedor(StrToIntDef(EFProvH.Text, 0));
end;

procedure TFPregLstEstadisticasVentas.EFClienteAgenteDChange(Sender: TObject);
begin
  inherited;
  DBEClienteAgenteTituloD.Text := DameTituloAgente(StrToIntDef(EFClienteAgenteD.Text, 0));
end;

procedure TFPregLstEstadisticasVentas.EFClienteAgenteHChange(Sender: TObject);
begin
  inherited;
  DBEClienteAgenteTituloH.Text := DameTituloAgente(StrToIntDef(EFClienteAgenteH.Text, 0));
end;

procedure TFPregLstEstadisticasVentas.EFFamiliaDChange(Sender: TObject);
begin
  inherited;
  EFamiliaD.Text := DameTituloFamilia(EFFamiliaH.Text);
end;

procedure TFPregLstEstadisticasVentas.EFFamiliaHChange(Sender: TObject);
begin
  inherited;
  EFamiliaH.Text := DameTituloFamilia(EFFamiliaH.Text);
end;

procedure TFPregLstEstadisticasVentas.TSAgentesShow(Sender: TObject);
begin
  inherited;
  Grupo := 152;
end;

procedure TFPregLstEstadisticasVentas.TSClientesShow(Sender: TObject);
begin
  inherited;
  Grupo := 153;
end;

procedure TFPregLstEstadisticasVentas.TSProveedoresShow(Sender: TObject);
begin
  inherited;
  Grupo := 154;
end;

procedure TFPregLstEstadisticasVentas.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  Alcance, Canal : integer;
  Serie : string;
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;

  Alcance := 0;
  Canal := REntorno.Canal;
  Serie := REntorno.Serie;

  if CBSeries.Text = _('Todas las Series') then
     Alcance := 1
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
  end;

  if CBCanales.Text = _('Todos los Canales') then
     Alcance := 2
  else
     Canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

  if PCMain.ActivePage = TSAgentes then
     DMLstEstadisticasVentas.Muestra(0, Modo, DEFechaD.Date, DEFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text, EFFamiliaD.Text, EFFamiliaH.Text,
        EComentario.Text,
        StrToInt(EFAgenteD.Text), StrToInt(EFAgenteH.Text),
        Alcance, Canal, Serie);

  if PCMain.ActivePage = TSClientes then
     DMLstEstadisticasVentas.Muestra(1, Modo, DEFechaD.Date, DEFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text, EFFamiliaD.Text, EFFamiliaH.Text,
        EComentario.Text,
        StrToInt(EFClienteD.Text), StrToInt(EFClienteH.Text),
        Alcance, Canal, Serie, StrToInt(EFClienteAgenteD.Text), StrToInt(EFClienteAgenteH.Text));

  if PCMain.ActivePage = TSProveedores then
     DMLstEstadisticasVentas.Muestra(2, Modo, DEFechaD.Date, DEFechaH.Date,
        EFArticuloD.Text, EFArticuloH.Text, EFFamiliaD.Text, EFFamiliaH.Text,
        EComentario.Text,
        StrToInt(EFProvD.Text), StrToInt(EFProvH.Text),
        Alcance, Canal, Serie, 0, 0, CBProrratearPortes.Checked);
end;

procedure TFPregLstEstadisticasVentas.AConfigurarExecute(Sender: TObject);
begin
  Grupo := 152;
  if PCMain.ActivePage = TSAgentes then
     Grupo := 152
  else
  if PCMain.ActivePage = TSClientes then
     Grupo := 153
  else
  if PCMain.ActivePage = TSProveedores then
     Grupo := 154;

  inherited;
end;

end.
