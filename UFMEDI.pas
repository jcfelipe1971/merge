unit UFMEDI;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, UControlEdit, DBCtrls, Grids, DBGrids, NsDBGrid,
  rxPlacemnt, UFormGest, ULFFormStorage, UFPEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFEdit, ULFEditFind2000, ULFLabel, ULFMemo, ULFPanel,
  ULFPageControl, ULFToolBar, rxToolEdit, ULFDateEdit, UFPEditSinNavegador,
  ActnList, ULFActionList, Menus, UTeclas, UEditPanel;

type
  TFMEDI = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSPedidos: TTabSheet;
     TSAlbaranes: TTabSheet;
     TSFacturas: TTabSheet;
     PNLPedido: TLFPanel;
     PPedidosErrores: TLFPanel;
     BImportaPedidos: TButton;
     PNLCarpeta: TLFPanel;
     LDirectorioEntrada: TLFLabel;
     EDirectorioEntrada: TLFEdit;
     PNLAlbaran: TLFPanel;
     BExportaAlbaranes: TButton;
     PNLFactura: TLFPanel;
     BExportaFacturas: TButton;
     PAlbaranesErrores: TLFPanel;
     PFacturasErrores: TLFPanel;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     ESerie: TLFEdit;
     MErroresImportacionPedidos: TLFMemo;
     DBGFAlbaranes: TDBGridFind2000;
     DBGFFacturas: TDBGridFind2000;
     CHBMuestraTodosAlbaranes: TLFCheckBox;
     CHBMuestraTodasFacturas: TLFCheckBox;
     TSEtiquetasAlbaranes: TTabSheet;
     PNLEtiquetaAlbaranes: TLFPanel;
     BImprimirEtiquetaAlbaranes: TButton;
     CHBMuestraTodosAlbEti: TLFCheckBox;
     PNLDetalleEtiquetaAlbaranes: TLFPanel;
     DBGFEtiquetasAlb: TDBGridFind2000;
     TSDeclPO: TTabSheet;
     PNLDeclaracionPO: TLFPanel;
     BImportaDeclaracionPuntoOperacional: TButton;
     PNLDeclaracionPOErrores: TLFPanel;
     MErroresDeclPO: TLFMemo;
     TButtImportarTodo: TToolButton;
     CHBPrevisualizaEtiqueta: TLFCheckBox;
     LProcesandoAlbaran: TLFLabel;
     LProcesandoFactura: TLFLabel;
     PNLFiltroAlbaranes: TLFPanel;
     BtnMarcar: TButton;
     BtnLimpiar: TButton;
     BtnFiltrar: TButton;
     LHastaAlbaran: TLFLabel;
     LDesdeAlbaran: TLFLabel;
     EDesdeAlbaran: TLFEdit;
     EHastaAlbaran: TLFEdit;
     PNLFiltroFactura: TLFPanel;
     LDesdeFactura: TLFLabel;
     LHastaFactura: TLFLabel;
     EDesdeFactura: TLFEdit;
     EHastaFactura: TLFEdit;
     BtnFiltrarFac: TButton;
     BtnLimpiarFac: TButton;
     BtnMarcarFac: TButton;
     BtnDesmarcarAlbaranes: TButton;
     BtnDesmarcarFacturas: TButton;
     BCancelarImportacion: TButton;
     TSReporteDeVentas: TTabSheet;
     PNLReporteDeVentasErrores: TLFPanel;
     MReporteDeVentasErrores: TLFMemo;
     PNLReporteDeVentas: TLFPanel;
     BReporteDeVentas: TButton;
     DEReporteDeVentasDesde: TLFDateEdit;
     DEReporteDeVentasHasta: TLFDateEdit;
     LReporteDeVentasDesde: TLFLabel;
     LReporteDeVentasHasta: TLFLabel;
     LSerieReporteVentas: TLFLabel;
     EFSerieReporteVentas: TLFEditFind2000;
     ESerieReporteVentas: TLFEdit;
     LEmisorReporteVentas: TLFLabel;
     EEmisorReporteVentas: TLFEdit;
     LReceptorReporteVentas: TLFLabel;
     EReceptorReporteVentas: TLFEdit;
     LProveedor: TLFLabel;
     EProveedorReporteVentas: TLFEdit;
     LComprador: TLFLabel;
     ECompradorReporteVentas: TLFEdit;
     LFamilia: TLFLabel;
     EFFamiliaReporteVentas: TLFEditFind2000;
     EFamiliaReporteVentas: TLFEdit;
     LCodigoLugar: TLFLabel;
     ECodigoLugar: TLFEdit;
     BMarcarProcesadoAlbaran: TButton;
     BMarcarProcesadoFactura: TButton;
     TBSep1: TToolButton;
     LDirectorioSalida: TLFLabel;
     EDirectorioSalida: TLFEdit;
     EFSerieAlbaran: TLFEditFind2000;
     LSerieAlbaran: TLFLabel;
     LSerieFactura: TLFLabel;
     EFSerieFactura: TLFEditFind2000;
     procedure BImportaPedidosClick(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure TSAlbaranesShow(Sender: TObject);
     procedure TSFacturasShow(Sender: TObject);
     procedure BExportaAlbaranesClick(Sender: TObject);
     procedure BExportaFacturasClick(Sender: TObject);
     procedure TSEtiquetasAlbaranesShow(Sender: TObject);
     procedure BImprimirEtiquetaAlbaranesClick(Sender: TObject);
     procedure MErroresImportacionPedidosChange(Sender: TObject);
     procedure BImportaDeclaracionPuntoOperacionalClick(Sender: TObject);
     procedure CHBMuestraTodosAlbaranesClick(Sender: TObject);
     procedure CHBMuestraTodasFacturasClick(Sender: TObject);
     procedure CHBMuestraTodosAlbEtiClick(Sender: TObject);
     procedure TButtImportarTodoClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BtnFiltrarClick(Sender: TObject);
     procedure BtnLimpiarClick(Sender: TObject);
     procedure BtnMarcarClick(Sender: TObject);
     procedure BtnFiltrarFacClick(Sender: TObject);
     procedure BtnLimpiarFacClick(Sender: TObject);
     procedure BtnMarcarFacClick(Sender: TObject);
     procedure BtnDesmarcarFacturasClick(Sender: TObject);
     procedure BtnDesmarcarAlbaranesClick(Sender: TObject);
     procedure BCancelarImportacionClick(Sender: TObject);
     procedure BReporteDeVentasClick(Sender: TObject);
     procedure EFSerieReporteVentasChange(Sender: TObject);
     procedure EFFamiliaReporteVentasChange(Sender: TObject);
     procedure BMarcarProcesadoAlbaranClick(Sender: TObject);
     procedure BMarcarProcesadoFacturaClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEDI : TFMEDI;

implementation

uses UEntorno, UDMMain, UDMEDI, UDMExportaAlbaranEDI, UFMain, UUtiles, DateUtils, UDameDato;

{$R *.dfm}

procedure TFMEDI.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEDI, DMEDI);

  EDirectorioEntrada.Text := REntorno.DirectorioEDI_Entrada;
  EDirectorioSalida.Text := REntorno.DirectorioEDI_Salida;
  EFSerie.Text := REntorno.Serie;
  PCMain.ActivePage := TSDeclPO;
  CHBPrevisualizaEtiqueta.Checked := False;
  BCancelarImportacion.Visible := False;

  EFSerieReporteVentas.Text := LeeDatoIni('EDI-SLSRPT', 'Serie', REntorno.Serie);
  EFFamiliaReporteVentas.Text := LeeDatoIni('EDI-SLSRPT', 'Familia', '');
  DEReporteDeVentasDesde.Date := LeeDatoIni('EDI-SLSRPT', 'DesdeFecha', Today);
  DEReporteDeVentasHasta.Date := LeeDatoIni('EDI-SLSRPT', 'HastaFecha', Today);
  EEmisorReporteVentas.Text := LeeDatoIni('EDI-SLSRPT', 'Emisor', '');
  EReceptorReporteVentas.Text := LeeDatoIni('EDI-SLSRPT', 'Receptor', '');
  EProveedorReporteVentas.Text := LeeDatoIni('EDI-SLSRPT', 'Proveedor', '');
  ECompradorReporteVentas.Text := LeeDatoIni('EDI-SLSRPT', 'Comprador', '');
  ECodigoLugar.Text := LeeDatoIni('EDI-SLSRPT', 'CodigoLugar', '');
end;

procedure TFMEDI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  EscribeDatoIni('EDI-SLSRPT', 'Serie', EFSerieReporteVentas.Text);
  EscribeDatoIni('EDI-SLSRPT', 'Familia', EFFamiliaReporteVentas.Text);
  EscribeDatoIni('EDI-SLSRPT', 'DesdeFecha', DEReporteDeVentasDesde.Date);
  EscribeDatoIni('EDI-SLSRPT', 'HastaFecha', DEReporteDeVentasHasta.Date);
  EscribeDatoIni('EDI-SLSRPT', 'Emisor', EEmisorReporteVentas.Text);
  EscribeDatoIni('EDI-SLSRPT', 'Receptor', EReceptorReporteVentas.Text);
  EscribeDatoIni('EDI-SLSRPT', 'Proveedor', EProveedorReporteVentas.Text);
  EscribeDatoIni('EDI-SLSRPT', 'Comprador', ECompradorReporteVentas.Text);
  EscribeDatoIni('EDI-SLSRPT', 'CodigoLugar', ECodigoLugar.Text);

  CierraData(DMEDI);
end;

procedure TFMEDI.BImportaPedidosClick(Sender: TObject);
var
  Inicio : TDateTime;
begin
  BCancelarImportacion.Visible := True;
  try
     Inicio := Now;

     with MErroresImportacionPedidos do
     begin
        Lines.Add(_('Iniciada la importación de Pedidos EDI'));
        Lines.Add(_('Inicio') + ' ' + DateTimeToStr(Inicio));

        DMEDI.ImportaPedido(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal,
           EFSerie.Text, 'PEC', 0, Lines);

        Lines.Add(_('Importación de Pedidos finalizada'));
        Lines.Add(_('Inicio') + ' ' + DateTimeToStr(Inicio));
        Lines.Add(_('Fin') + ' ' + DateTimeToStr(Now));
        Lines.Add(_('Duracion') + ' ' + TimeToStr(Now - Inicio));
     end;
  finally
     BCancelarImportacion.Visible := False;
  end;
end;

procedure TFMEDI.EFSerieChange(Sender: TObject);
begin
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMEDI.TSAlbaranesShow(Sender: TObject);
begin
  DMEDI.SeleccionAlbaranes(CHBMuestraTodosAlbaranes.Checked, EFSerieAlbaran.Text, 0, 0);
end;

procedure TFMEDI.TSFacturasShow(Sender: TObject);
begin
  DMEDI.SeleccionFacturas(CHBMuestraTodasFacturas.Checked, EFSerieFactura.Text, 0, 0);
end;

procedure TFMEDI.BExportaAlbaranesClick(Sender: TObject);
begin
  DMEDI.ExportaAlbaranes;
end;

procedure TFMEDI.BExportaFacturasClick(Sender: TObject);
begin
  DMEDI.ExportaFacturas;
end;

procedure TFMEDI.TSEtiquetasAlbaranesShow(Sender: TObject);
begin
  DMEDI.SeleccionAlbaranesEti(CHBMuestraTodosAlbEti.Checked);
end;

procedure TFMEDI.BImprimirEtiquetaAlbaranesClick(Sender: TObject);
begin
  DMEDI.ImprimirEtiquetasAlbaranes(CHBPrevisualizaEtiqueta.Checked);
end;

procedure TFMEDI.MErroresImportacionPedidosChange(Sender: TObject);
begin
  with MErroresImportacionPedidos do
  begin
     Lines.BeginUpdate;
     if (Lines.Count > 1000) then
        Lines.Delete(0);
     Lines.EndUpdate;
     SelStart := Length(Lines.Text);
     SelLength := 0;
  end;
end;

procedure TFMEDI.BImportaDeclaracionPuntoOperacionalClick(Sender: TObject);
begin
  with MErroresDeclPO do
  begin
     Lines.Add(_('Iniciada la importación de Declaracion de Punto Operacional') + ' - ' + DateTimeToStr(Now));
     DMEDI.ImportaDeclaracionPO(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, Lines);
     Lines.Add(_('Finalizada la importación de Declaracion de Punto Operacional') + ' - ' + DateTimeToStr(Now));
  end;
end;

procedure TFMEDI.CHBMuestraTodosAlbaranesClick(Sender: TObject);
begin
  DMEDI.SeleccionAlbaranes(CHBMuestraTodosAlbaranes.Checked, EFSerieAlbaran.Text, StrToIntDef(EDesdeAlbaran.Text, 0), StrToIntDef(EHastaAlbaran.Text, 0));
end;

procedure TFMEDI.CHBMuestraTodasFacturasClick(Sender: TObject);
begin
  DMEDI.SeleccionFacturas(CHBMuestraTodasFacturas.Checked, EFSerieFactura.Text, StrToIntDef(EDesdeFactura.Text, 0), StrToIntDef(EHastaFactura.Text, 0));
end;

procedure TFMEDI.CHBMuestraTodosAlbEtiClick(Sender: TObject);
begin
  DMEDI.SeleccionAlbaranesEti(CHBMuestraTodosAlbEti.Checked);
end;

procedure TFMEDI.TButtImportarTodoClick(Sender: TObject);
begin
  PCMain.ActivePage := TSDeclPO;
  BImportaDeclaracionPuntoOperacional.Click;
  PCMain.ActivePage := TSPedidos;
  BImportaPedidos.Click;
end;

procedure TFMEDI.BtnFiltrarClick(Sender: TObject);
begin
  DMEDI.SeleccionAlbaranes(CHBMuestraTodosAlbaranes.Checked, EFSerieAlbaran.Text, StrToIntDef(EDesdeAlbaran.Text, 0), StrToIntDef(EHastaAlbaran.Text, 0));
end;

procedure TFMEDI.BtnLimpiarClick(Sender: TObject);
begin
  EDesdeAlbaran.Text := '0';
  EHastaAlbaran.Text := '0';
  EFSerieAlbaran.Text := '';
  DMEDI.SeleccionAlbaranes(CHBMuestraTodosAlbaranes.Checked, EFSerieAlbaran.Text, StrToIntDef(EDesdeAlbaran.Text, 0), StrToIntDef(EHastaAlbaran.Text, 0));
end;

procedure TFMEDI.BtnMarcarClick(Sender: TObject);
begin
  DMEDI.MarcaAlbaranes(1);
end;

procedure TFMEDI.BtnFiltrarFacClick(Sender: TObject);
begin
  DMEDI.SeleccionFacturas(CHBMuestraTodasFacturas.Checked, EFSerieFactura.Text, StrToIntDef(EDesdeFactura.Text, 0), StrToIntDef(EHastaFactura.Text, 0));
end;

procedure TFMEDI.BtnLimpiarFacClick(Sender: TObject);
begin
  EDesdeFactura.Text := '0';
  EHastaFactura.Text := '0';
  EFSerieFactura.Text := '';
  DMEDI.SeleccionFacturas(CHBMuestraTodasFacturas.Checked, EFSerieFactura.Text, StrToIntDef(EDesdeFactura.Text, 0), StrToIntDef(EHastaFactura.Text, 0));
end;

procedure TFMEDI.BtnMarcarFacClick(Sender: TObject);
begin
  DMEDI.MarcaFacturas(1);
end;

procedure TFMEDI.BtnDesmarcarFacturasClick(Sender: TObject);
begin
  DMEDI.MarcaFacturas(0);
end;

procedure TFMEDI.BtnDesmarcarAlbaranesClick(Sender: TObject);
begin
  DMEDI.MarcaAlbaranes(0);
end;

procedure TFMEDI.BCancelarImportacionClick(Sender: TObject);
begin
  DMEDI.Cancelar := True;
end;

procedure TFMEDI.BReporteDeVentasClick(Sender: TObject);
var
  Archivo : string;
begin
  MReporteDeVentasErrores.Lines.Clear;
  DMEDI.GenerarReporteDeVentas(EFSerieReporteVentas.Text, DEReporteDeVentasDesde.Date, DEReporteDeVentasHasta.Date, EFFamiliaReporteVentas.Text, EEmisorReporteVentas.Text, EReceptorReporteVentas.Text, EProveedorReporteVentas.Text, ECompradorReporteVentas.Text, ECodigoLugar.Text);

  Archivo := Format('SLSRPT_%s.txt', [FormatDateTime('yyyymmdd', Now)]);
  if MySaveDialog(Archivo, 'TXT', '', 'FMEDI-ReporteDeVentas') then
     MReporteDeVentasErrores.Lines.SaveToFile(Archivo);
end;

procedure TFMEDI.EFSerieReporteVentasChange(Sender: TObject);
begin
  ESerieReporteVentas.Text := DameTituloSerie(EFSerieReporteVentas.Text);
end;

procedure TFMEDI.EFFamiliaReporteVentasChange(Sender: TObject);
begin
  EFamiliaReporteVentas.Text := DameTituloFamilia(EFFamiliaReporteVentas.Text);
end;

procedure TFMEDI.BMarcarProcesadoAlbaranClick(Sender: TObject);
begin
  if Confirma then
     DMEDI.MarcaAlbaranesProcesado;
end;

procedure TFMEDI.BMarcarProcesadoFacturaClick(Sender: TObject);
begin
  if Confirma then
     DMEDI.MarcaFacturasProcesado;
end;

end.
