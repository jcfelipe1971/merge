unit UFPregPedPdteProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, StdCtrls, ComCtrls, ExtCtrls,
  ToolWin, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, DateUtils,
  rxToolEdit, ULFDBEdit, ULFActionList, ULFComboBox, ULFEdit, ULFPanel,
  ULFPageControl, ULFToolBar, ULFEditFind2000, ULFLabel, ULFDateEdit,
  TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt, ULFFormStorage;

type
  TFPregPedPdteProv = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     TSProveedor: TTabSheet;
     TSArticulo: TTabSheet;
     TSFechaE: TTabSheet;
     Panel3: TLFPanel;
     Panel4: TLFPanel;
     Panel5: TLFPanel;
     LClienteD: TLFLabel;
     EFProveedorD: TLFEditFind2000;
     DBEProveedorD: TLFDbedit;
     DBEProveedorH: TLFDbedit;
     EFProveedorH: TLFEditFind2000;
     LClienteH: TLFLabel;
     LDesdeFechaProveedor: TLFLabel;
     LHastaFechaProveedor: TLFLabel;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     DBEArticuloD: TLFDbedit;
     DBEArticuloH: TLFDbedit;
     LArtFechaD: TLFLabel;
     DTPFechaArtD: TLFDateEdit;
     DTPFechaArtH: TLFDateEdit;
     LArtFechaH: TLFLabel;
     EFArticuloD: TLFEditFind2000;
     EFArticuloH: TLFEditFind2000;
     LArticuloD: TLFLabel;
     LArticuloH: TLFLabel;
     RBRecibido: TRadioButton;
     RBPdteRecibir: TRadioButton;
     RBTodos: TRadioButton;
     DTPFechaED: TLFDateEdit;
     DTPFechaEH: TLFDateEdit;
     LFechaD: TLFLabel;
     LFechaEH: TLFLabel;
     TBMultiSer: TToolButton;
     AMultiSerie: TAction;
     RBAnulado: TRadioButton;
     CBAgrupadoPorModelo: TLFCheckBox;
     PNLBottom: TLFPanel;
     LDesdeTemporada: TLFLabel;
     LHastaTemporada: TLFLabel;
     LMarca: TLFLabel;
     EFDesdeTemporada: TLFEditFind2000;
     EDesdeTemporada: TLFEdit;
     EFHastaTemporada: TLFEditFind2000;
     EHastaTemporada: TLFEdit;
     EFMarca: TLFEditFind2000;
     EMarca: TLFEdit;
     procedure EFProveedorDChange(Sender: TObject);
     procedure EFProveedorHChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure AMultiSerieExecute(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFDesdeTemporadaChange(Sender: TObject);
     procedure EFHastaTemporadaChange(Sender: TObject);
     procedure EFMarcaChange(Sender: TObject);
     procedure EFMarcaBusqueda(Sender: TObject);
  private
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
     { Private declarations }
  public
     { Public declarations }
     SentenciaWhere: TStringList;
  end;

var
  FPregPedPdteProv : TFPregPedPdteProv;

implementation

uses UDMMain, UFormGest, UFMain, UEntorno, UDMLstPedPdteProv, UFMMultiSerie, UFMListConfig, UDameDato;

{$R *.dfm}

procedure TFPregPedPdteProv.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstPedPdteProv, DMLstPedPdteProv);
  PNLTop.Visible := True;

  ARecargar.Execute;
  PCMain.ActivePage := TSProveedor;
  CBOrden.Clear;
  CBOrden.Items.Add(_('Por Proveedor'));
  CBOrden.Items.Add(_('Por Fecha del Pedido'));
  CBOrden.Items.Add(_('Por Número de Pedido'));

  CBOrden.ItemIndex := 0;
  // Copio el stringlist a formulario del listado
  SentenciaWhere := TStringList.Create;
  SentenciaWhere.Add('(' + chr(39) + REntorno.Serie + chr(39) + ')');

  Grupo := 145;
  Listado := DMLstPedPdteProv.frPedPdteProv;
  ListadoFR3 := DMLstPedPdteProv.frxPedPdteProv;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregPedPdteProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SentenciaWhere.Free;
  CierraData(DMLstPedPdteProv);
end;

procedure TFPregPedPdteProv.EFProveedorDChange(Sender: TObject);
begin
  inherited;
  DMLstPedPdteProv.CambiaProveedorD(StrToIntDef(EFProveedorD.Text, 0));
end;

procedure TFPregPedPdteProv.EFProveedorHChange(Sender: TObject);
begin
  inherited;
  DMLstPedPdteProv.CambiaProveedorH(StrToIntDef(EFProveedorH.Text, 0));
end;

procedure TFPregPedPdteProv.ARecargarExecute(Sender: TObject);
var
  year, month, day, dies : word;
begin
  inherited;
  DMLstPedPdteProv.Recargar;
  EFProveedorD.Text := DMLstPedPdteProv.ProvMin;
  EFProveedorH.Text := DMLstPedPdteProv.ProvMax;
  EFArticuloD.Text := DMLstPedPdteProv.ArtMin;
  EFArticuloH.Text := DMLstPedPdteProv.ArtMax;
  // Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dies := DaysInMonth(REntorno.FechaTrabSH);

  DTPFechaD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaH.Date := RecodeDay(REntorno.FechaTrabSH, dies);
  DTPFechaArtD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaArtH.Date := RecodeDay(REntorno.FechaTrabSH, dies);
  DTPFechaED.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaEH.Date := RecodeDay(REntorno.FechaTrabSH, dies);
end;

procedure TFPregPedPdteProv.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSProveedor) then
  begin
     EFProveedorD.SetFocus;
     ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Proveedor'));
     CBOrden.Items.Add(_('Por Fecha Pedido'));
     CBOrden.Items.Add(_('Por Número Pedido'));
     // Orden por proveedor y num. pedido
     CBOrden.ItemIndex := 0;
     Grupo := 145;
  end;
  if (PCMain.ActivePage = TSArticulo) then
  begin
     EFArticuloD.SetFocus;
     ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Articulo'));
     CBOrden.Items.Add(_('Por Fecha'));
     // Orden por artículo y fecha de pedido
     CBOrden.ItemIndex := 0;
     Grupo := 146;
  end;
  if (PCMain.ActivePage = TSFechaE) then
  begin
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Fecha Recepcion'));
     // Orden por artículo y fecha de pedido
     CBOrden.ItemIndex := 0;
     // Grupo := 147;
  end;
end;

procedure TFPregPedPdteProv.EFArticuloDChange(Sender: TObject);
begin
  inherited;
  DMLstPedPdteProv.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TFPregPedPdteProv.EFArticuloHChange(Sender: TObject);
begin
  inherited;
  DMLstPedPdteProv.CambiaArticuloH(EFArticuloH.Text);
end;

procedure TFPregPedPdteProv.AMultiSerieExecute(Sender: TObject);
begin
  inherited;
  TFMMultiSerie.Create(Self).RellenaSeries(SentenciaWhere);
end;

procedure TFPregPedPdteProv.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregPedPdteProv.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregPedPdteProv.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  tipo_servido : integer;
  Ficha : char;
begin
  tipo_servido := -1;
  if (RBPdteRecibir.Checked) then
     tipo_servido := 0; // Mostrará sólo los pendientes de recibir
  if (RBRecibido.Checked) then
     tipo_servido := 1; // Mostrará sólo los recibidos
  if (RBTodos.Checked) then
     tipo_servido := 10; // Los mostrará todos
  if (RBAnulado.Checked) then
     tipo_servido := 11; // sfg.albert - Mostrará los anulados

  Ficha := 'P';
  if (PCMain.ActivePage = TSProveedor) then
     Ficha := 'P';
  if (PCMain.ActivePage = TSArticulo) then
     Ficha := 'A';
  if (PCMain.ActivePage = TSFechaE) then
     Ficha := 'F';

  DMLstPedPdteProv.CrearSQL(Ficha, CBAgrupadoPorModelo.Checked, SentenciaWhere.Text, CBOrden.ItemIndex);

  if PCMain.ActivePage = TSProveedor then
  begin
     DMLstPedPdteProv.MostrarListado(Modo, DTPFechaD.Date, DTPFechaH.Date,
        StrToIntDef(EFProveedorD.Text, 0),
        StrToIntDef(EFProveedorH.Text, 0), DMLstPedPdteProv.FamMin,
        DMLstPedPdteProv.FamMax, DMLstPedPdteProv.ArtMin,
        DMLstPedPdteProv.ArtMax, tipo_servido, 1, TDPFechaListado.Date, EComentario.Text, EFDesdeTemporada.Text, EFHastaTemporada.Text, StrToIntDef(EFMarca.Text, 0));
  end;
  if PCMain.ActivePage = TSArticulo then
  begin
     DMLstPedPdteProv.MostrarListado(Modo, DTPFechaArtD.Date, DTPFechaArtH.Date,
        StrToIntDef(DMLstPedPdteProv.ProvMin, 0),
        StrToIntDef(DMLstPedPdteProv.ProvMax, 0), DMLstPedPdteProv.FamMin,
        DMLstPedPdteProv.FamMax, EFArticuloD.Text,
        EFArticuloH.Text, tipo_servido, 2, TDPFechaListado.Date, EComentario.Text, EFDesdeTemporada.Text, EFHastaTemporada.Text, StrToIntDef(EFMarca.Text, 0));
  end;
  if PCMain.ActivePage = TSFechaE then
  begin
     DMLstPedPdteProv.MostrarListado(Modo, DTPFechaED.Date, DTPFechaEH.Date,
        StrToIntDef(DMLstPedPdteProv.ProvMin, 0),
        StrToIntDef(DMLstPedPdteProv.ProvMax, 0), DMLstPedPdteProv.FamMin,
        DMLstPedPdteProv.FamMax,
        DMLstPedPdteProv.ArtMin, DMLstPedPdteProv.ArtMax, tipo_servido,
        3, TDPFechaListado.Date, EComentario.Text, EFDesdeTemporada.Text, EFHastaTemporada.Text, StrToIntDef(EFMarca.Text, 0));
  end;
end;

procedure TFPregPedPdteProv.EFDesdeTemporadaChange(Sender: TObject);
begin
  inherited;
  EDesdeTemporada.Text := DameTituloArtModTemporada(EFDesdeTemporada.Text);
end;

procedure TFPregPedPdteProv.EFHastaTemporadaChange(Sender: TObject);
begin
  inherited;
  EHastaTemporada.Text := DameTituloArtModTemporada(EFHastaTemporada.Text);
end;

procedure TFPregPedPdteProv.EFMarcaBusqueda(Sender: TObject);
begin
  inherited;
  EFMarca.CondicionBusqueda := '((ID_MARCA=' + IntToStr(REntorno.Empresa * (-1)) + ') OR (ID_MARCA > 0 AND EMPRESA = ' + REntorno.EmpresaStr + '))';
end;

procedure TFPregPedPdteProv.EFMarcaChange(Sender: TObject);
begin
  inherited;
  EMarca.Text := DameTituloMarcaModelo(StrToIntDef(EFMarca.Text, 0));
end;

end.
