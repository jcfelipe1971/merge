unit UFMAgrupacionDeAlbaranesKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, Grids,
  DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFEdit;

type
  TFMAgrupacionDeAlbaranesKri = class(TFPEditDetalle)
     LAgrupacion: TLFLabel;
     DBAgrupacion: TLFDbedit;
     LIntervaloAlbaranes: TLFLabel;
     DBEIntervaloAlbaranes: TLFDbedit;
     ToolButton1: TToolButton;
     TBSeleccionarTodos: TToolButton;
     TBDeseleccionar: TToolButton;
     DBCBAlbaran: TLFDBCheckBox;
     DBCBPackingList: TLFDBCheckBox;
     DBCBPackingListTotal: TLFDBCheckBox;
     DBCBEtiquetasEnvio: TLFDBCheckBox;
     DBCBTraspasaAFactura: TLFDBCheckBox;
     DBCBImprimeFactura: TLFDBCheckBox;
     DBCBRelacionCartaPortes: TLFDBCheckBox;
     DBCBFacturacionCanarias: TLFDBCheckBox;
     CHBPrevisualizarEtiqueta: TLFCheckBox;
     CHBPrevisualizarCartaPortes: TLFCheckBox;
     BImprimirAlbaranes: TButton;
     BPackingList: TButton;
     BPackingListTotal: TButton;
     BEtiquetasEnvio: TButton;
     BTraspasaAFactura: TButton;
     BImpresionFacturas: TButton;
     BCartaRelacionPortes: TButton;
     TButtRegenerar: TToolButton;
     CHBPrevisualizarAlbaran: TLFCheckBox;
     CHBPrevisualizarFactura: TLFCheckBox;
     DBEEtiquetasSEUR: TLFDBCheckBox;
     BEtiquetasSEUR: TButton;
     PNLDireccion: TLFPanel;
     DBEDirBloqEscx: TLFDbedit;
     DBEDirPisox: TLFDbedit;
     DBEDirPuerta: TLFDbedit;
     DBELocalidadNombre: TLFDbedit;
     DBECpostal: TLFDbedit;
     DBEProvincia: TLFDbedit;
     DBEPais: TLFDbedit;
     DBEDirTipo: TLFDbedit;
     DBEDireccion: TLFDbedit;
     DBEDirNumero: TLFDbedit;
     DBELocalidad: TLFDbedit;
     DBETelefono01: TLFDbedit;
     DBETelefono02: TLFDbedit;
     DBETelefax: TLFDbedit;
     PNLTareas: TLFPanel;
     CHBPrevisualizarEtiquetaSEUR: TLFCheckBox;
     TSPackingList: TTabSheet;
     DBGPackingList: TDBGridFind2000;
     TBExportar: TToolButton;
     DBGSeleccionaAgrupaciones: TDBGridFind2000;
     PNLCorteIgles: TLFPanel;
     BEportarCSV: TButton;
     LPalets: TLFLabel;
     EPalets: TLFEdit;
     LSeparador: TLFLabel;
     ESeparador: TLFEdit;
     LNroProveedor: TLFLabel;
     ENroProveedor: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BImprimirAlbaranesClick(Sender: TObject);
     procedure BPackingListClick(Sender: TObject);
     procedure BPackingListTotalClick(Sender: TObject);
     procedure BEtiquetasEnvioClick(Sender: TObject);
     procedure BTraspasaAFacturaClick(Sender: TObject);
     procedure BImpresionFacturasClick(Sender: TObject);
     procedure BCartaRelacionPortesClick(Sender: TObject);
     procedure TBSeleccionarTodosClick(Sender: TObject);
     procedure TBDeseleccionarClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure TSTablaShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TButtRegenerarClick(Sender: TObject);
     procedure BEtiquetasSEURClick(Sender: TObject);
     procedure TSPackingListShow(Sender: TObject);
     procedure TBExportarClick(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure BEportarCSVClick(Sender: TObject);
  private
     { Private declarations }
     PMain_Height: integer;
  public
     { Public declarations }
  end;

var
  FMAgrupacionDeAlbaranesKri : TFMAgrupacionDeAlbaranesKri;

implementation

uses UDMAgrupacionDeAlbaranesKri, UDMMain, UEntorno, UFormGest, UUtiles;

{$R *.dfm}

procedure TFMAgrupacionDeAlbaranesKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAgrupacionDeAlbaranesKri, DMAgrupacionDeAlbaranesKri);

  CEMain.DataSource := DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes;
  NavMain.DataSource := DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes;
  DBGMain.DataSource := DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes;
  G2KTableLoc.DataSource := DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes;
  CEDetalle.DataSource := DMAgrupacionDeAlbaranesKri.DSQCabecerasAlbaran;
  DBGFDetalle.DataSource := DMAgrupacionDeAlbaranesKri.DSQCabecerasAlbaran;
  NavDetalle.DataSource := DMAgrupacionDeAlbaranesKri.DSQCabecerasAlbaran;

  PCMain.ActivePage := TSFicha;
  CHBPrevisualizarEtiqueta.Checked := False;
  CHBPrevisualizarCartaPortes.Checked := False;
  CHBPrevisualizarAlbaran.Checked := False;
  CHBPrevisualizarFactura.Checked := False;
  if (DMMain.EstadoKri(238) = 1) then
  begin
     CHBPrevisualizarAlbaran.Checked := True;
     CHBPrevisualizarFactura.Checked := True;
  end;
  DBGFDetalle.ColumnasChecked.Strings[DBGFDetalle.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUP')] := REntorno.EntradaStr;
  PMain_Height := PMain.Height;

  {dji lrk kri - Lo hago asi, porque no puedo poner DBFGDetalle dentro de un panel (ya viene heredado asi)}
  PNLDireccion.Top := PDetalle.Height - PNLDireccion.Height;
  DBGFDetalle.Height := PNLDireccion.Top;
end;

procedure TFMAgrupacionDeAlbaranesKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAgrupacionDeAlbaranesKri);
end;

procedure TFMAgrupacionDeAlbaranesKri.BImprimirAlbaranesClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     if (CHBPrevisualizarAlbaran.Checked) then
        DMAgrupacionDeAlbaranesKri.ImprimirAlbaranes(0)
     else
        DMAgrupacionDeAlbaranesKri.ImprimirAlbaranes(1);

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.BPackingListClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     DMAgrupacionDeAlbaranesKri.ImprimirPackingList(1 {Imprimir});

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.BPackingListTotalClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     DMAgrupacionDeAlbaranesKri.ImprimirPackingListTotal(0);

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.BEtiquetasEnvioClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     if (CHBPrevisualizarEtiqueta.Checked) then
        DMAgrupacionDeAlbaranesKri.ImprimirEtiquetas(0, 1{copias}, 0{vacias})
     else
        DMAgrupacionDeAlbaranesKri.ImprimirEtiquetas(1, 1{copias}, 0{vacias});

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.BTraspasaAFacturaClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     DMAgrupacionDeAlbaranesKri.FacturaAlbaranes;

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.BImpresionFacturasClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     if (CHBPrevisualizarFactura.Checked) then
        DMAgrupacionDeAlbaranesKri.ImprimirFacturas(0)
     else
        DMAgrupacionDeAlbaranesKri.ImprimirFacturas(1);

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.BCartaRelacionPortesClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     if (CHBPrevisualizarCartaPortes.Checked) then
        DMAgrupacionDeAlbaranesKri.ImprimirCartaPortes(0)
     else
        DMAgrupacionDeAlbaranesKri.ImprimirCartaPortes(1);

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.TBSeleccionarTodosClick(Sender: TObject);
begin
  inherited;
  DMAgrupacionDeAlbaranesKri.Marcar(REntorno.Entrada);
end;

procedure TFMAgrupacionDeAlbaranesKri.TBDeseleccionarClick(Sender: TObject);
begin
  inherited;
  DMAgrupacionDeAlbaranesKri.Marcar(0);
end;

procedure TFMAgrupacionDeAlbaranesKri.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMAgrupacionDeAlbaranesKri.TSTablaShow(Sender: TObject);
begin
  inherited;
  PMain.Height := PMain.Height + PDetalle.Height;
end;

procedure TFMAgrupacionDeAlbaranesKri.TSFichaShow(Sender: TObject);
begin
  inherited;
  PMain.Height := PMain_Height;
  DBGFDetalle.Width := PDetalle.Width - PNLTareas.Width;
  DBGFDetalle.Height := PDetalle.Height - PNLDireccion.Height - TBDetalle.Height;
end;

procedure TFMAgrupacionDeAlbaranesKri.TButtRegenerarClick(Sender: TObject);
begin
  inherited;
  DMAgrupacionDeAlbaranesKri.Refresca;
end;

procedure TFMAgrupacionDeAlbaranesKri.BEtiquetasSEURClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     if (CHBPrevisualizarEtiquetaSEUR.Checked) then
        DMAgrupacionDeAlbaranesKri.ImprimirEtiquetasSEUR(0, 1{copias}, 0{vacias})
     else
        DMAgrupacionDeAlbaranesKri.ImprimirEtiquetasSEUR(1, 1{copias}, 0{vacias});

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.TSPackingListShow(Sender: TObject);
begin
  inherited;
  PMain.Height := PMain.Height + PDetalle.Height;
  DBGSeleccionaAgrupaciones.Height := PMain.Height div 3;
end;

procedure TFMAgrupacionDeAlbaranesKri.TBExportarClick(Sender: TObject);
var
  Archivo : string;
begin
  inherited;

  Archivo := Format(_('PackingList_%s.xls'), [FormatDateTime('yyyymmdd_hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMAgrupacionDeAlbaranesKri-PackingList') then
  begin
     DMAgrupacionDeAlbaranesKri.ExportarPackingList(Archivo);
     ShowMessage('Exportación realizada con éxito.');
     DMMain.AbrirArchivo(Archivo);
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSPackingList) then
  begin
     DMAgrupacionDeAlbaranesKri.AbrirPackingList;
     FormResize(Sender);
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.FormResize(Sender: TObject);
begin
  inherited;
  DBGFDetalle.Width := PDetalle.Width - PNLTareas.Width;
  DBGFDetalle.Height := PDetalle.Height - PNLDireccion.Height - TBDetalle.Height;
  if (PCMain.ActivePage = TSPackingList) then
  begin
     PMain.Height := Self.ClientHeight - TBActions.Height;
     DBGSeleccionaAgrupaciones.Height := PMain.Height div 3;
  end;
  if (PCMain.ActivePage = TSTabla) then
  begin
     PMain.Height := Self.ClientHeight - TBActions.Height;
  end;
end;

procedure TFMAgrupacionDeAlbaranesKri.BEportarCSVClick(Sender: TObject);
begin
  inherited;
  try
     PNLTareas.Enabled := False;

     DMAgrupacionDeAlbaranesKri.EportarCSV(StrToIntDef(EPalets.Text, 1), ENroProveedor.Text, ESeparador.Text);

     if (DMMain.EstadoKri(238) = 1) then
        DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     PNLTareas.Enabled := True;
  end;
end;

end.
