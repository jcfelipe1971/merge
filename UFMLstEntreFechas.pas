unit UFMLstEntreFechas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UFormGest, rxToolEdit,
  ULFCheckBox, ULFDBEdit, ULFPanel, ULFToolBar, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFLabel, ULFDateEdit, UFPEditListado, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFComboBox,
  ULFEdit, UFPEditListadoSimple;

type
  TFMLstEntreFechas = class(TFPEditListadoSimple)
     LBLDesdeFecha: TLFLabel;
     LBLHastaFecha: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     EFProvDesde: TLFEditFind2000;
     LBLDesdeProveedor: TLFLabel;
     LBLHastaProveedor: TLFLabel;
     EFProvHasta: TLFEditFind2000;
     EProvDesde: TLFEdit;
     EProvHasta: TLFEdit;
     TButtConfRapida: TToolButton;
     EFMoneda: TLFEditFind2000;
     DBEMoneda: TLFDbedit;
     GBOrden: TGroupBox;
     ChkBOrden: TLFCheckBox;
     ChkBMostrarBImponible: TLFCheckBox;
     PNLLimites: TLFPanel;
     LBLMoneda: TLFLabel;
     LBLSerie: TLFLabel;
     CBSeries: TLFComboBox;
     ChkBAgruparPorProveedor: TLFCheckBox;
     RGEstado: TRadioGroup;
     LBLSDesdeFechaCon: TLFLabel;
     LBLSHastaFechaCon: TLFLabel;
     DTPDesdeCon: TLFDateEdit;
     DTPHastaCon: TLFDateEdit;
     EComentario: TLFEdit;
     LComentario: TLFLabel;
     LFechaListado: TLFLabel;
     TDPFechaListado: TLFDateEdit;
     TBExportar: TToolButton;
     procedure EFProvDesdeChange(Sender: TObject);
     procedure EFProvHastaChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure RGEstadoClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     ProveedorDesde, ProveedorHasta: integer;
     FechaDesde, FechaHasta, FechaConDesde, FechaConHasta: TDateTime;
     Serie, TipoDocumento: string;
     procedure TomarDatos;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(aTipoDocumento, aSerie: string);
  end;

var
  FMLstEntreFechas : TFMLstEntreFechas;

implementation

uses UDMMain, UEntorno, UDMLstEntreFechas, UUtiles, UDMLstPedidosAProv,
  UDMLstAlbaranesProv, UDMLstFactura_Prov, UFMListConfig, UDMLstPropuestasDeProv,
  UDMLstPropConfirmProv, UDMLstFacturaAcr, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMLstEntreFechas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstEntreFechas, DMLstEntreFechas);

  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  Serie := '';
end;

procedure TFMLstEntreFechas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstEntreFechas);
end;

procedure TFMLstEntreFechas.TomarDatos;
begin
  FechaDesde := HourIntoDate(DTPDesde.Date, '00:00:00');
  FechaHasta := HourIntoDate(DTPHasta.Date, '23:59:59');
  FechaConDesde := HourIntoDate(DTPDesdeCon.Date, '00:00:00');
  FechaConHasta := HourIntoDate(DTPHastaCon.Date, '23:59:59');

  if Length(EFProvDesde.Text) <> 0 then
     ProveedorDesde := StrToInt(EFProvDesde.Text)
  else
     ProveedorDesde := 0;
  if Length(EFProvHasta.Text) <> 0 then
     ProveedorHasta := StrToInt(EFProvHasta.Text)
  else
     ProveedorHasta := 0;
end;

procedure TFMLstEntreFechas.Muestra(aTipoDocumento, aSerie: string);
begin
  Serie := aSerie;
  // Nos situamos en la serie
  while (((Copy(CBSeries.Text, 1, Length(Serie)) + ' ') <> Serie + ' ') and (CBSeries.ItemIndex <> CBSeries.Items.Count - 1)) do
     CBSeries.ItemIndex := CBSeries.ItemIndex + 1;
  CBSeriesChange(Self);

  TipoDocumento := aTipoDocumento;

  // Temporalmente deshabilitamos controles hasta que se propague la nueva funcionalidad
  if (TipoDocumento <> 'FAP') then
     ChkBAgruparPorProveedor.Enabled := False;

  DTPDesdeCon.Enabled := False;
  DTPHastaCon.Enabled := False;
  LBLSDesdeFechaCon.Enabled := False;
  LBLSHastaFechaCon.Enabled := False;

  EComentario.Text := '';
  TDPFechaListado.Date := Now;

  if ((TipoDocumento = 'FAP') or (TipoDocumento = 'FCR')) then
  begin
     DTPDesdeCon.Enabled := True;
     DTPHastaCon.Enabled := True;
     LBLSDesdeFechaCon.Enabled := True;
     LBLSHastaFechaCon.Enabled := True;
  end;

  if (TipoDocumento = 'FCR') then
  begin
     with EFProvDesde do
     begin
        Tabla_a_buscar := 'VER_ACREEDORES';
        CampoNum := 'ACREEDOR';
        OrdenadoPor.Text := 'ACREEDOR';
     end;
  end;

  with RGEstado.Items do
  begin
     Clear;
     Add(_('Todos'));
     Add(_('Documentos Abiertos'));
     Add(_('Documentos Cerrados'));
     if (TipoDocumento = 'ALP') then
        Add(_('Documentos Abiertos a Fecha de Fin Listado'));
  end;
  RGEstado.ItemIndex := 0;

  DMLstEntreFechas.Rangos(ProveedorDesde, ProveedorHasta, FechaDesde, FechaHasta, aTipoDocumento, Serie);
  DTPDesde.Date := Trunc(FechaDesde);
  DTPHasta.Date := Trunc(FechaHasta);
  DTPDesdeCon.Date := Trunc(FechaDesde);
  DTPHastaCon.Date := Trunc(FechaHasta);
  if ProveedorDesde = 0 then
     EFProvDesde.Text := ''
  else
     EFProvDesde.Text := IntToStr(ProveedorDesde);
  if ProveedorHasta = 0 then
     EFProvHasta.Text := ''
  else
     EFProvHasta.Text := IntToStr(ProveedorHasta);
  EFMoneda.Text := REntorno.Moneda;

  ShowModal;

  Close;
end;

procedure TFMLstEntreFechas.EFProvDesdeChange(Sender: TObject);
begin
  if (TipoDocumento = 'FCR') then
     EProvDesde.Text := DameTituloAcreedor(StrToIntDef(EFProvDesde.Text, 0))
  else
     EProvDesde.Text := DameTituloProveedor(StrToIntDef(EFProvDesde.Text, 0));
end;

procedure TFMLstEntreFechas.EFProvHastaChange(Sender: TObject);
begin
  if (TipoDocumento = 'FCR') then
     EProvHasta.Text := DameTituloAcreedor(StrToIntDef(EFProvHasta.Text, 0))
  else
     EProvHasta.Text := DameTituloProveedor(StrToIntDef(EFProvHasta.Text, 0));
end;

procedure TFMLstEntreFechas.AConfigurarExecute(Sender: TObject);
begin
  /// Primero configuro los listados a configurar y luego llamo a la parte heredada de este metodo.

  // Inicializo variables globales a este formulario
  Grupo := 0;
  Listado := nil;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := nil;

  if (TipoDocumento = 'OFP') then
  begin
     Grupo := 520;
     Listado := DMLstPropuestasDeProv.frPropuesta;
     ListadoFR3 := DMLstPropuestasDeProv.frxPropuesta;
  end
  else
  if (TipoDocumento = 'OCP') then
  begin
     Grupo := 521;
     Listado := DMLstPropConfirmProv.frPropConfirm;
     ListadoFR3 := DMLstPropConfirmProv.frxPropConfirm;
  end
  else
  if (TipoDocumento = 'PEP') then
  begin
     Grupo := 43;
     Listado := DMLstPedidosaProv.frPedido;
     ListadoFR3 := DMLstPedidosaProv.frxPedido;
  end
  else
  if (TipoDocumento = 'ALP') then
  begin
     Grupo := 42;
     Listado := DMLstAlbaranesprov.frAlbaran;
     ListadoFR3 := DMLstAlbaranesprov.frxAlbaran;
  end
  else
  if (TipoDocumento = 'FAP') then
  begin
     if (ChkBAgruparPorProveedor.Checked) then
        Grupo := 541
     else
        Grupo := 41;
     Listado := DMLstFactura_prov.frFactura;
     ListadoFR3 := DMLstFactura_prov.frxFactura;
  end
  else
  if (TipoDocumento = 'FCR') then
  begin
     Grupo := 101;
     Listado := DMLstFacturaAcr.frFactura;
     ListadoFR3 := DMLstFacturaAcr.frxFactura;
  end;

  inherited;
end;

procedure TFMLstEntreFechas.EFMonedaChange(Sender: TObject);
begin
  DMLstEntreFechas.CambiaMoneda(EFMoneda.Text);
end;

procedure TFMLstEntreFechas.RGEstadoClick(Sender: TObject);
var
  EstadoSeleccionado : integer;
begin
  inherited;
  case RGEstado.ItemIndex of
     1: EstadoSeleccionado := 0;
     2: EstadoSeleccionado := 5;
     3: EstadoSeleccionado := 10;
     else
        EstadoSeleccionado := -1;
  end;

  if (TipoDocumento = 'OFP') then
     DMLstPropuestasDeProv.Estado := EstadoSeleccionado
  else if (TipoDocumento = 'OCP') then
     DMLstPropConfirmProv.Estado := EstadoSeleccionado
  else if (TipoDocumento = 'PEP') then
     DMLstPedidosaprov.Estado := EstadoSeleccionado
  else if (TipoDocumento = 'ALP') then
     DMLstAlbaranesProv.Estado := EstadoSeleccionado
  else if (TipoDocumento = 'FAP') then
     DMLstFactura_Prov.Estado := EstadoSeleccionado
  else if (TipoDocumento = 'FCR') then
     DMLstFacturaAcr.Estado := EstadoSeleccionado;
end;

procedure TFMLstEntreFechas.CBSeriesChange(Sender: TObject);
begin
  if (CBSeries.Text <> '') then
  begin
     if (CBSeries.Text = _('Todas las Series')) then
        Serie := ''
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSeries.Items[CBSeries.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;
  end;
end;

procedure TFMLstEntreFechas.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  TomarDatos;

  if (TipoDocumento = 'OFP') then
     DMLstPropuestasDeProv.MostrarListado(FechaDesde, FechaHasta, ProveedorDesde, ProveedorHasta, Modo, Serie, EFMoneda.Text, ChkBOrden.Checked, EComentario.Text, TDPFechaListado.Date)
  else if (TipoDocumento = 'OCP') then
     DMLstPropConfirmProv.MostrarListado(FechaDesde, FechaHasta, ProveedorDesde, ProveedorHasta, Modo, Serie, EFMoneda.Text, ChkBOrden.Checked, EComentario.Text, TDPFechaListado.Date)
  else if (TipoDocumento = 'PEP') then
     DMLstPedidosAProv.MostrarListado(FechaDesde, FechaHasta, ProveedorDesde, ProveedorHasta, Modo, Serie, EFMoneda.Text, ChkBOrden.Checked, EComentario.Text, TDPFechaListado.Date)
  else if (TipoDocumento = 'ALP') then
     DMLstAlbaranesProv.MostrarListado(FechaDesde, FechaHasta, ProveedorDesde, ProveedorHasta, Modo, Serie, EFMoneda.Text, ChkBOrden.Checked, ChkBMostrarBImponible.Checked, EComentario.Text, TDPFechaListado.Date)
  else if (TipoDocumento = 'FAP') then
     DMLstFactura_Prov.MostrarListado(FechaDesde, FechaHasta, FechaConDesde, FechaConHasta, ProveedorDesde, ProveedorHasta, Modo, 0, Serie, EFMoneda.Text, ChkBOrden.Checked, ChkBMostrarBImponible.Checked, ChkBAgruparPorProveedor.Checked, EComentario.Text, TDPFechaListado.Date, PBListado)
  else if (TipoDocumento = 'FCR') then
     DMLstFacturaAcr.MostrarListado(FechaDesde, FechaHasta, FechaConDesde, FechaConHasta, ProveedorDesde, ProveedorHasta, Modo, Serie, EFMoneda.Text, ChkBOrden.Checked, EComentario.Text, TDPFechaListado.Date);
end;

end.
