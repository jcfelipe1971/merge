unit UFMEnvio;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ComCtrls, ULFPageControl,
  ULFDBEditFind2000, Mask, DBCtrls, ULFDBEdit, rxToolEdit, RXDBCtrl, Grids,
  DBGrids, NsDBGrid, UNavigator, ToolWin, ULFToolBar, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, TFlatCheckBoxUnit, ULFCheckBox,
  UEditPanel, Menus, UTeclas, UControlEdit, ULFDBMemo, UFormGest{, tstyle_d6,
  tstyle_d6}, DateUtils, ULFLabel, UHYDBGrid, ULFEdit, ULFDBDateEdit, ULFDateEdit,
  UFPEditDetalle, UG2kTBLoc;

type
  TFMEnvio = class(TFPEditDetalle)
     PFiltros: TLFPanel;
     PArriba: TLFPanel;
     GBAlbaranes: TGroupBox;
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     PAbajo: TLFPanel;
     GBSeries: TGroupBox;
     LDesdeSerie: TLFLabel;
     LHastaSerie: TLFLabel;
     EFDesdeSerie: TLFEditFind2000;
     EFHastaSerie: TLFEditFind2000;
     TBSep3: TToolButton;
     LMatricula: TLFLabel;
     LZona: TLFLabel;
     LFecha: TLFLabel;
     LTitulo: TLFLabel;
     LEnvio: TLFLabel;
     EFMatricula: TLFEditFind2000;
     DBEMatricula: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBDTPEnvio: TLFDBDateEdit;
     DBEFZona: TLFDBEditFind2000;
     DBEZona: TLFDbedit;
     TSNotas: TTabSheet;
     PNLNotas: TLFPanel;
     TBNotas: TLFToolBar;
     NavNotas: THYMNavigator;
     PNLInfoNotas: TLFPanel;
     LFechaNotas: TLFLabel;
     DBENotasFechaCab: TLFDbedit;
     DBENotasRuta: TLFDbedit;
     DBENotasNEnvio: TLFDbedit;
     LRutaNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     TBAplicar: TToolButton;
     TBNoAplicar: TToolButton;
     CBFiltrarSerie: TLFCheckBox;
     TBSep4: TToolButton;
     TBMarcarTodo: TToolButton;
     TBDesmarcarTodo: TToolButton;
     CBFiltrarFechas: TLFCheckBox;
     GBCanales: TGroupBox;
     LDesdeCanal: TLFLabel;
     LHastaCanal: TLFLabel;
     EFDesdeCanal: TLFEditFind2000;
     EFHastaCanal: TLFEditFind2000;
     CBFiltrarCanal: TLFCheckBox;
     GBClientes: TGroupBox;
     EFDesdeCli: TLFEditFind2000;
     EFHastaCli: TLFEditFind2000;
     CBFiltrarClientes: TLFCheckBox;
     ECliHasta: TLFEdit;
     TBSep1: TToolButton;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     TBMostrar: TToolButton;
     TBNoMostrar: TToolButton;
     ECliDesde: TLFEdit;
     GBAgrup: TGroupBox;
     LDesdeAgrupacion: TLFLabel;
     LHastaAgrupacion: TLFLabel;
     EFDesdeAgrup: TLFEditFind2000;
     EFHastaAgrup: TLFEditFind2000;
     CBFiltrarAgrup: TLFCheckBox;
     EAgrupH: TLFEdit;
     EAgrupD: TLFEdit;
     ESerieD: TLFEdit;
     ESerieH: TLFEdit;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     TBSep2: TToolButton;
     TBAbreCierra: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     LFCategoryAction4: TLFCategoryAction;
     AMostrarFiltros: TAction;
     ANoMostrarFiltros: TAction;
     AAplicarFiltros: TAction;
     AInicializarFiltros: TAction;
     ACierraEnvio: TAction;
     AConfEnvio: TAction;
     AListadoEnvio: TAction;
     DBEEnvio: TLFDbedit;
     DBETituloEstado: TLFDbedit;
     LBLEstado: TLFLabel;
     LBultos: TLFLabel;
     DBBultos: TLFDbedit;
     LPortes: TLFLabel;
     DBPortes: TLFDbedit;
     PClientes: TLFPanel;
     GBUnCliente: TGroupBox;
     LCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     CBFiltrarUnCliente: TLFCheckBox;
     EFDireccion: TLFEditFind2000;
     LDireccion: TLFLabel;
     LMedidas: TLFLabel;
     DBMedidas: TLFDBMemo;
     AListadoEnvioSfg: TAction;
     AConfEnvioSfg: TAction;
     ETituloCliente: TLFEdit;
     EDireccionCliente: TLFEdit;
     ALstPeticionEnvio: TAction;
     AConfPeticionEnvio: TAction;
     ALstContenidoEnvio: TAction;
     AConfContenidoEnvio: TAction;
     GBTransportistas: TGroupBox;
     LDesdeTransportista: TLFLabel;
     LHastaTransportista: TLFLabel;
     EFDesdeTra: TLFEditFind2000;
     CBFiltrarTransportista: TLFCheckBox;
     ETraHasta: TLFEdit;
     ETraDesde: TLFEdit;
     EFHastaTra: TLFEditFind2000;
     AExportarTXT: TAction;
     EFHastaAlbaran: TLFEditFind2000;
     EFDesdeAlbaran: TLFEditFind2000;
     CBFiltrarAlbaranes: TLFCheckBox;
     LHastaAlbaran: TLFLabel;
     LDesdeAlbaran: TLFLabel;
     GBFactura: TGroupBox;
     EFHastaFac: TLFEditFind2000;
     EFDesdeFac: TLFEditFind2000;
     LDesdeFacturaAlbaran: TLFLabel;
     LHastaFacturaAlbaran: TLFLabel;
     CBFacturasCerradas: TLFCheckBox;
     CBFactuasAbiertas: TLFCheckBox;
     CBFiltrarFacaturas: TLFCheckBox;
     BFiltroFechaHoy: TButton;
     BDiaAnterior: TButton;
     BDiaSiguiente: TButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure AMostrarFiltrosExecute(Sender: TObject);
     procedure ANoMostarFiltrosExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure AAplicarFiltrosExecute(Sender: TObject);
     procedure AInicializarFiltrosExecute(Sender: TObject);
     procedure EFMatriculaChange(Sender: TObject);
     procedure TBMarcarTodoClick(Sender: TObject);
     procedure CBFiltrarFacaturasClick(Sender: TObject);
     procedure CBFiltrarFechasClick(Sender: TObject);
     procedure CBFiltrarClientesClick(Sender: TObject);
     procedure CBFiltrarCanalClick(Sender: TObject);
     procedure CBFiltrarSerieClick(Sender: TObject);
     procedure EFDesdeCliBusqueda(Sender: TObject);
     procedure EFHastaCliBusqueda(Sender: TObject);
     procedure EFDesdeSerieBusqueda(Sender: TObject);
     procedure EFHastaSerieBusqueda(Sender: TObject);
     procedure EFDesdeAgrupBusqueda(Sender: TObject);
     procedure EFHastaAgrupBusqueda(Sender: TObject);
     procedure CBFiltrarAgrupClick(Sender: TObject);
     procedure EFDesdeCanalBusqueda(Sender: TObject);
     procedure EFHastaCanalBusqueda(Sender: TObject);
     procedure EFDesdeFacBusqueda(Sender: TObject);
     procedure EFHastaFacBusqueda(Sender: TObject);
     procedure EFMatriculaBusqueda(Sender: TObject);
     procedure TBDesmarcarTodoClick(Sender: TObject);
     procedure ACierraEnvioExecute(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEEnvioChange(Sender: TObject);
     procedure AListadoEnvioExecute(Sender: TObject);
     procedure AConfEnvioExecute(Sender: TObject);
     procedure CBFiltrarUnClienteClick(Sender: TObject);
     procedure AListadoEnvioSfgExecute(Sender: TObject);
     procedure AConfEnvioSfgExecute(Sender: TObject);
     procedure ALstPeticionEnvioExecute(Sender: TObject);
     procedure AConfPeticionEnvioExecute(Sender: TObject);
     procedure ALstContenidoEnvioExecute(Sender: TObject);
     procedure AConfContenidoEnvioExecute(Sender: TObject);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure CBFiltrarTransportistaClick(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure AExportarTXTExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure CBFiltrarAlbaranesClick(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure BFiltroFechaClick(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     // Si algunas de estas variables es True indicará que ese filtro ya lo tiene
     Tercero: integer;
     ModificandoCliente: boolean;
     ColActual: TColumn;
     procedure FiltrosVisibles(aVisible: boolean);
     procedure AbreOCierra(Cierra: smallint);
     procedure CondicionBusqueda(aEditFind: TLFEditFind2000);
     procedure ListadoEnvio(Tipo: integer);
     procedure InicializaCanales;
  public
     { Public declarations }
     procedure AjustaCheckEnvio(campo: string; envio: integer);
     procedure RecargarFiltros;
     procedure MarcarTodo(Marcar: boolean);
  end;

var
  FMEnvio : TFMEnvio;

implementation

uses UDMMain, UEntorno, UDMEnvio, UUtiles, UFMain, UDMLstEnvio, UFMListConfig, UDameDato;

{$R *.dfm}

procedure TFMEnvio.FormCreate(Sender: TObject);
begin
  inherited;
  ModificandoCliente := False;

  AbreData(TDMEnvio, DMEnvio);
  NavMain.DataSource := DMEnvio.DSQMCabeceraEnvio;
  DBGMain.DataSource := DMEnvio.DSQMCabeceraEnvio;
  NavDetalle.DataSource := DMEnvio.DSQMEnvio;
  DBGFDetalle.DataSource := DMEnvio.DSQMEnvio;

  ColActual := DBGFDetalle.Columns[0];

  InicializaCanales;

  // Para que no muestre el panel de los filtros al entrar
  FiltrosVisibles(False);
  CBFacturasCerradas.Enabled := False;
  CBFactuasAbiertas.Enabled := False;
  CBFacturasCerradas.Checked := False;
  CBFactuasAbiertas.Checked := False;

  ControlEdit := CEMain;
end;

procedure TFMEnvio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEnvio);
end;

procedure TFMEnvio.FormDestroy(Sender: TObject);
begin
  inherited;
  FMEnvio := nil;
end;

procedure TFMEnvio.FiltrosVisibles(aVisible: boolean);
begin
  PFiltros.Visible := aVisible;
  PAbajo.Visible := aVisible;
  PArriba.Visible := aVisible;
  PClientes.Visible := aVisible;
end;

procedure TFMEnvio.AMostrarFiltrosExecute(Sender: TObject);
begin
  if (DMEnvio.QMCabeceraEnvioSERVIDO.AsInteger = 1) then
  begin
     ShowMessage(_('El documento está cerrado y no se puede filtrar ni modificar'));
     FiltrosVisibles(False);
  end
  else
     FiltrosVisibles(True);

  FormResize(Sender);

  RecargarFiltros;
end;

procedure TFMEnvio.ANoMostarFiltrosExecute(Sender: TObject);
begin
  FiltrosVisibles(False);
end;

procedure TFMEnvio.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMEnvio.BusquedaCompleja;
end;

procedure TFMEnvio.AjustaCheckEnvio(campo: string; envio: integer);
begin
  DBGFDetalle.ColumnasChecked.Strings[DBGFDetalle.ColumnasCheckBoxes.IndexOf(UpperCase(campo))] :=
     IntToStr(envio);
end;

procedure TFMEnvio.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
  DMEnvio.GrabarCabecera;
end;

procedure TFMEnvio.AAplicarFiltrosExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMEnvio.RefrescaDetalleEnvio(DTPDesde.Date, DTPHasta.Date);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMEnvio.AInicializarFiltrosExecute(Sender: TObject);
begin
  try
     CBFiltrarCanal.Checked := False;
     CBFiltrarCanalClick(Sender);

     CBFiltrarFacaturas.Checked := False;
     CBFiltrarFacaturasClick(Sender);

     CBFiltrarAlbaranes.Checked := False;
     CBFiltrarAlbaranesClick(Sender);

     CBFiltrarFechas.Checked := False;
     CBFiltrarFechasClick(Sender);

     CBFiltrarSerie.Checked := False;
     CBFiltrarSerieClick(Sender);

     CBFiltrarAgrup.Checked := False;
     CBFiltrarAgrupClick(Sender);

     CBFiltrarClientes.Checked := False;
     CBFiltrarClientesClick(Sender);

     CBFiltrarTransportista.Checked := False;
     CBFiltrarTransportistaClick(Sender);

     // No aplicar filtros
     DMEnvio.RefrescaDetalleEnvio(DTPDesde.Date, DTPHasta.Date);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMEnvio.RecargarFiltros;
var
  Dias : word;
  Min, Max : integer;
  Cerrado, Abierto : boolean;
begin
  Cerrado := CBFacturasCerradas.Checked;
  Abierto := CBFactuasAbiertas.Checked;
  with DMEnvio do
  begin
     EFDesdeCanal.Text := IntToStr(DameMinMax(1, Cerrado, Abierto));
     EFHastaCanal.Text := IntToStr(DameMinMax(2, Cerrado, Abierto));

     EFDesdeSerie.Text := DameMinMax(5, Cerrado, Abierto);
     EFHastaSerie.Text := DameMinMax(6, Cerrado, Abierto);

     EFDesdeAgrup.Text := DameMinMax(7, Cerrado, Abierto);
     EFHastaAgrup.Text := DameMinMax(8, Cerrado, Abierto);

     UUtiles.DameMinMax('CLI', Min, Max);
     EFDesdeCli.Text := IntToStr(Min);
     EFHastaCli.Text := IntToStr(Max);

     EFDesdeTra.Text := DameMinMax(9, Cerrado, Abierto);
     EFHastaTra.Text := DameMinMax(10, Cerrado, Abierto);

     EFDesdeAlbaran.Text := IntToStr(DameMinMax(11, Cerrado, Abierto));
     EFHastaAlbaran.Text := IntToStr(DameMinMax(12, Cerrado, Abierto));
     EFDesdeFac.Text := IntToStr(DameMinMax(13, Cerrado, Abierto));
     EFHastaFac.Text := IntToStr(DameMinMax(14, Cerrado, Abierto));

     DTPDesde.Date := REntorno.FechaTrab;

     // Fecha hasta es el ultimo dia del mes
     Dias := DaysInMonth(REntorno.FechaTrabSH);
     DTPHasta.Date := RecodeDay(REntorno.FechaTrabSH, Dias);
  end;
end;

procedure TFMEnvio.EFMatriculaChange(Sender: TObject);
begin
  if (EFMatricula.Text <> '') then
  begin
     DMEnvio.PonerMatricula(EFMatricula.Text);
     EFMatricula.Text := '';
  end;
end;

procedure TFMEnvio.TBMarcarTodoClick(Sender: TObject);
begin
  MarcarTodo(True);
end;

procedure TFMEnvio.TBDesmarcarTodoClick(Sender: TObject);
begin
  MarcarTodo(False);
end;

procedure TFMEnvio.MarcarTodo(Marcar: boolean);
begin
  try
     Screen.Cursor := crHourGlass;
     {
     // Aplicar si hay algun check marcado
     if ((CBFiltrarFacaturas.Checked) or (CBFiltrarFechas.Checked) or (CBFiltrarSerie.Checked) or
         (CBFiltrarAgrup.Checked) or (CBFiltrarClientes.Checked) or (CBFiltrarUnCliente.Checked)) then
     }
     DMEnvio.MarcarTodo(DTPDesde.Date, DTPHasta.Date, Marcar);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMEnvio.CBFiltrarCanalClick(Sender: TObject);
begin
  DMEnvio.FiltrarCanal := CBFiltrarCanal.Checked;

  DMEnvio.FiltroCanal := '';
  if CBFiltrarCanal.Checked then
     DMEnvio.FiltroCanal := Format(' AND ((CANAL >= %d) AND (CANAL <= %d)) ', [StrToIntDef(EFDesdeCanal.Text, 0), StrToIntDef(EFHastaCanal.Text, 0)]);
end;

procedure TFMEnvio.CBFiltrarSerieClick(Sender: TObject);
begin
  ESerieD.Text := DameTituloSerie(EFDesdeSerie.Text);
  ESerieH.Text := DameTituloSerie(EFHastaSerie.Text);

  DMEnvio.FiltrarSerie := CBFiltrarSerie.Checked;

  DMEnvio.FiltroSerie := '';
  if CBFiltrarSerie.Checked then
     DMEnvio.FiltroSerie := Format(' AND ((SERIE >= ''%s'') AND (SERIE <= ''%s'')) ', [EFDesdeSerie.Text, EFHastaSerie.Text]);
end;

procedure TFMEnvio.CBFiltrarAgrupClick(Sender: TObject);
begin
  EAgrupD.Text := DameTituloAgrupacion('C', EFDesdeAgrup.Text);
  EAgrupH.Text := DameTituloAgrupacion('C', EFHastaAgrup.Text);

  DMEnvio.FiltrarAgrup := CBFiltrarAgrup.Checked;

  DMEnvio.FiltroAgrupacion := '';
  if CBFiltrarAgrup.Checked then
     DMEnvio.FiltroAgrupacion := Format(' AND (CLIENTE IN (SELECT CLIENTE FROM EMP_AGRUPACIONES_CLI WHERE (AGRUPACION >= ''%s'') AND (AGRUPACION <= ''%s''))) ', [EFDesdeAgrup.Text, EFHastaAgrup.Text]);
end;

procedure TFMEnvio.CBFiltrarTransportistaClick(Sender: TObject);
begin
  inherited;
  ETraDesde.Text := DameTituloAcreedor(StrToIntDef(EFDesdeTra.Text, 0));
  ETraHasta.Text := DameTituloAcreedor(StrToIntDef(EFHastaTra.Text, 0));

  DMEnvio.FiltrarTransportista := CBFiltrarTransportista.Checked;

  DMEnvio.FiltroTransportista := '';
  if CBFiltrarTransportista.Checked then
     DMEnvio.FiltroTransportista := Format(' AND ((TRANSPORTISTA >= %d) AND (TRANSPORTISTA <= %d)) ', [StrToIntDef(EFDesdeTra.Text, 0), StrToIntDef(EFHastaTra.Text, 0)]);
end;

procedure TFMEnvio.CBFiltrarClientesClick(Sender: TObject);
begin
  if (not ModificandoCliente) then
  begin
     ModificandoCliente := True;
     try
        ECliDesde.Text := DameTituloCliente(StrToIntDef(EFDesdeCli.Text, 0));
        ECliHasta.Text := DameTituloCliente(StrToIntDef(EFHastaCli.Text, 0));

        DMEnvio.FiltroClientes := '';
        if CBFiltrarClientes.Checked then
        begin
           // Si habilito este filtro deshabilito el filtro de Un Cliente
           if CBFiltrarUnCliente.Checked then
              CBFiltrarUnCliente.Checked := False;

           DMEnvio.FiltroClientes := Format(' AND ((CLIENTE >= %d) AND (CLIENTE <= %d)) ', [StrToIntDef(EFDesdeCli.Text, 0), StrToIntDef(EFHastaCli.Text, 0)]);
        end;

        DMEnvio.FiltrarUnCliente := CBFiltrarUnCliente.Checked;
        DMEnvio.FiltrarClientes := CBFiltrarClientes.Checked;
     finally
        ModificandoCliente := False;
     end;
  end;
end;

procedure TFMEnvio.CBFiltrarUnClienteClick(Sender: TObject);
begin
  if (not ModificandoCliente) then
  begin
     ModificandoCliente := True;
     try
        ETituloCliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
        Tercero := DameTercero('CLI', StrToIntDef(EFCliente.Text, 0));
        EFDireccion.CondicionBusqueda := 'TERCERO=' + IntToStr(Tercero);
        EDireccionCliente.Text := DameDireccionTercero(Tercero, StrToIntDef(EFDireccion.Text, 0));

        DMEnvio.FiltroUnCliente := '';
        if CBFiltrarUnCliente.Checked then
        begin
           // Si filtro Un Cliente deshabilito el filtro de Clientes
           if CBFiltrarClientes.Checked then
              CBFiltrarClientes.Checked := False;

           DMEnvio.FiltroUnCliente := Format(' AND ((CLIENTE = %d) AND (DIRECCION = %d)) ', [StrToIntDef(EFCliente.Text, 0), StrToIntDef(EFDireccion.Text, 0)]);
        end;

        DMEnvio.FiltrarUnCliente := CBFiltrarUnCliente.Checked;
        DMEnvio.FiltrarClientes := CBFiltrarClientes.Checked;
     finally
        ModificandoCliente := False;
     end;
  end;
end;

procedure TFMEnvio.CBFiltrarAlbaranesClick(Sender: TObject);
begin
  inherited;
  DMEnvio.FiltrarAlbaranes := CBFiltrarAlbaranes.Checked;
  DMEnvio.FiltroAlbaranes := '';
  if CBFiltrarAlbaranes.Checked then
     DMEnvio.FiltroAlbaranes := Format(' AND ((TIPO = ''ALB'') AND (RIG >= %d) AND (RIG <= %d)) ', [StrToIntDef(EFDesdeAlbaran.Text, 0), StrToIntDef(EFHastaAlbaran.Text, 0)]);
end;

procedure TFMEnvio.CBFiltrarFacaturasClick(Sender: TObject);
begin
  CBFacturasCerradas.Enabled := CBFiltrarFacaturas.Checked;
  CBFactuasAbiertas.Enabled := CBFiltrarFacaturas.Checked;

  DMEnvio.FiltrarFacturas := CBFiltrarFacaturas.Checked;
  DMEnvio.FiltroFacturas := '';
  if CBFiltrarFacaturas.Checked then
  begin
     DMEnvio.FiltroFacturas := Format(' AND ((TIPO = ''FAC'') AND (RIG >= %d) AND (RIG <= %d) ', [StrToIntDef(EFDesdeFac.Text, 0), StrToIntDef(EFHastaFac.Text, 0)]);

     // Sólo las cerradas
     if (not CBFactuasAbiertas.Checked) and CBFacturasCerradas.Checked then
        DMEnvio.FiltroFacturas := DMEnvio.FiltroFacturas + ' AND (ESTADO = 5) ';

     // Sólo las abiertas
     if CBFactuasAbiertas.Checked and (not CBFacturasCerradas.Checked) then
        DMEnvio.FiltroFacturas := DMEnvio.FiltroFacturas + ' AND (ESTADO <> 5) ';

     DMEnvio.FiltroFacturas := DMEnvio.FiltroFacturas + ') ';
  end;
end;

procedure TFMEnvio.CBFiltrarFechasClick(Sender: TObject);
begin
  DMEnvio.FiltrarFechas := CBFiltrarFechas.Checked;

  DMEnvio.FiltroFechas := '';
  if CBFiltrarFechas.Checked then
     DMEnvio.FiltroFechas := ' AND ((FECHA_RIG >= :FECHAD) AND (FECHA_RIG <= :FECHAH)) ';
end;

procedure TFMEnvio.EFDesdeCliBusqueda(Sender: TObject);
begin
  // CondicionBusqueda(EFDesdeCli);
end;

procedure TFMEnvio.EFHastaCliBusqueda(Sender: TObject);
begin
  // CondicionBusqueda(EFHastaCli);
end;

procedure TFMEnvio.EFDesdeSerieBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFDesdeSerie);
end;

procedure TFMEnvio.EFHastaSerieBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFHastaSerie);
end;

procedure TFMEnvio.EFDesdeAgrupBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFDesdeAgrup);
end;

procedure TFMEnvio.EFHastaAgrupBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFHastaAgrup);
end;

procedure TFMEnvio.EFDesdeCanalBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFDesdeCanal);
end;

procedure TFMEnvio.EFHastaCanalBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFHastaCanal);
end;

procedure TFMEnvio.EFDesdeFacBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFDesdeFac);
end;

procedure TFMEnvio.EFHastaFacBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFHastaFac);
end;

procedure TFMEnvio.EFMatriculaBusqueda(Sender: TObject);
begin
  CondicionBusqueda(EFMatricula);
end;

procedure TFMEnvio.ACierraEnvioExecute(Sender: TObject);
begin
  if Confirma then
     try
        Screen.Cursor := crHourGlass;
        if (TBAbreCierra.Tag = 0) then
        begin
           DMEnvio.AbreEnvio(1); // Marcar como abierto
           DMEnvio.RefrescaDetalleEnvio(DTPDesde.Date, DTPHasta.Date);
           AbreOCierra(1);
        end
        else if ConfirmaGrave then
        begin
           DMEnvio.AbreEnvio(0); // Marcar como cerrado
           AbreOCierra(0);
        end;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TFMEnvio.AbreOCierra(Cierra: smallint);
begin
  if (Cierra = 1) then
  begin
     TBAbreCierra.Hint := _('Abre y desbloquea el documento');
     TBAbreCierra.ImageIndex := 67;
     TBAbreCierra.Tag := 1;
     ACierraEnvio.Hint := _('Abre y desbloquea el documento');
     ACierraEnvio.ImageIndex := 67;
     ACierraEnvio.Tag := 1;
     ACierraEnvio.Caption := _('Abrir Envio');
     TBAplicar.Enabled := False;
     TBNoAplicar.Enabled := False;
     TBMarcarTodo.Enabled := False;
     TBDesmarcarTodo.Enabled := False;
  end
  else
  begin
     TBAbreCierra.Hint := _('Cierra y bloquea el documento');
     TBAbreCierra.ImageIndex := 68;
     TBAbreCierra.Tag := 0;
     ACierraEnvio.Hint := _('Cierra y bloquea el documento');
     ACierraEnvio.ImageIndex := 68;
     ACierraEnvio.Tag := 0;
     ACierraEnvio.Caption := _('Cerrar Envio');
     TBAplicar.Enabled := True;
     TBNoAplicar.Enabled := True;
     TBMarcarTodo.Enabled := True;
     TBDesmarcarTodo.Enabled := True;
  end;
end;

procedure TFMEnvio.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  if (((Button = nbInsert) or (Button = nbEdit)) and (PFiltros.Visible)) then
     FiltrosVisibles(False);
end;

procedure TFMEnvio.CondicionBusqueda(aEditFind: TLFEditFind2000);
begin
  if ((aEditFind.Name = 'EFMatricula') or (aEditFind.Name = 'EFDesdeAgrup') or (aEditFind.Name = 'EFHastaAgrup')) then
     aEditFind.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr
  else
  if (aEditFind.Name <> 'EFCliente') then
     aEditFind.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + 'and ejercicio=' + REntorno.EjercicioStr;
end;

procedure TFMEnvio.DBEEnvioChange(Sender: TObject);
begin
  AbreOCierra(DMEnvio.QMCabeceraEnvioSERVIDO.AsInteger);
end;

procedure TFMEnvio.AListadoEnvioExecute(Sender: TObject);
begin
  ListadoEnvio(1);
end;

procedure TFMEnvio.AConfEnvioExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstEnvio, DMLstEnvio);
  TFMListConfig.Create(Self).Muestra(512, formato, cabecera, copias,
     pijama, '', DMLstEnvio.frEnvio);
  CierraData(DMLstEnvio);
end;

procedure TFMEnvio.ListadoEnvio(Tipo: integer);
begin
  AbreData(TDMLstEnvio, DMLstEnvio);
  DMLstEnvio.MostrarListadoFiltrado(DMEnvio.QMCabeceraEnvioENVIO.AsInteger, 0,
     DMEnvio.QMCabeceraEnvioEMPRESA.AsInteger, Tipo);
  CierraData(DMLstEnvio);
end;

procedure TFMEnvio.InicializaCanales;
begin
  EFDesdeCanal.Text := REntorno.CanalStr;
  EFHastaCanal.Text := REntorno.CanalStr;
end;

procedure TFMEnvio.AListadoEnvioSfgExecute(Sender: TObject);
begin
  ListadoEnvio(2);
end;

procedure TFMEnvio.AConfEnvioSfgExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstEnvio, DMLstEnvio);
  TFMListConfig.Create(Self).Muestra(8206, formato, cabecera, copias,
     pijama, '', DMLstEnvio.frEnvio);
  CierraData(DMLstEnvio);
end;

procedure TFMEnvio.ALstPeticionEnvioExecute(Sender: TObject);
begin
  AbreData(TDMLstEnvio, DMLstEnvio);
  DMLstEnvio.ListadoPeticion(0, DMEnvio.QMCabeceraEnvioEMPRESA.AsInteger,
     DMEnvio.QMCabeceraEnvioENVIO.AsInteger);
  CierraData(DMLstEnvio);
end;

procedure TFMEnvio.AConfPeticionEnvioExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstEnvio, DMLstEnvio);
  TFMListConfig.Create(Self).Muestra(9005, formato, cabecera, copias, pijama, '', DMLstEnvio.frPeticion);
  CierraData(DMLstEnvio);
end;

procedure TFMEnvio.ALstContenidoEnvioExecute(Sender: TObject);
begin
  AbreData(TDMLstEnvio, DMLstEnvio);
  DMLstEnvio.ListadoContenido(0, DMEnvio.QMCabeceraEnvioEMPRESA.AsInteger,
     DMEnvio.QMCabeceraEnvioENVIO.AsInteger);
  CierraData(DMLstEnvio);
end;

procedure TFMEnvio.AConfContenidoEnvioExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstEnvio, DMLstEnvio);
  TFMListConfig.Create(Self).Muestra(9007, formato, cabecera, copias, pijama, '', DMLstEnvio.frContenido);
  CierraData(DMLstEnvio);
end;

procedure TFMEnvio.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  if (DMEnvio.QMCabeceraEnvioSERVIDO.AsInteger = 0) then
     ColorSegunEstado(TLFDbedit(Sender), 0)
  else
     ColorSegunEstado(TLFDbedit(Sender), 5);
end;

procedure TFMEnvio.FormResize(Sender: TObject);
begin
  inherited;
  // Tamaño de paneles de filtros
  GBCanales.Width := PArriba.Width div 4;
  GBFechas.Width := PArriba.Width div 4;
  GBAlbaranes.Width := PArriba.Width div 4;
  GBSeries.Width := PAbajo.Width div 3;
  GBClientes.Width := PAbajo.Width div 3;
  GBUnCliente.Width := PClientes.Width div 2;
  DBMedidas.Width := PEdit.Width - DBMedidas.Left - 4;
end;

procedure TFMEnvio.AExportarTXTExecute(Sender: TObject);
begin
  inherited;
  DMEnvio.ExportarATexto(DMEnvio.QMCabeceraEnvioENVIO.AsInteger, False);
end;

procedure TFMEnvio.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ListadoEnvio(1);
end;

procedure TFMEnvio.BFiltroFechaClick(Sender: TObject);
var
  Dias : integer;
begin
  inherited;

  Dias := TButton(Sender).Tag;

  if (Dias = 0) then
  begin
     DTPDesde.Date := Today;
     DTPHasta.Date := Today;
  end
  else
  begin
     DTPDesde.Date := DTPDesde.Date + Dias;
     DTPHasta.Date := DTPHasta.Date + Dias;
  end;

  CBFiltrarFechasClick(Sender);
end;

procedure TFMEnvio.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMEnvio.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG')) then
     FMain.TraspasoDeDocumentosSalida(DMEnvio.QMEnvioID_S.AsInteger);

  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMEnvio.QMEnvioCLIENTE.AsInteger));
end;

procedure TFMEnvio.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'CLIENTE') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

        {
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        begin
           if (UpperCase(Column.FieldName) = 'XXX') then
           begin
              if (XXX) then
                 ColorError(Canvas)
              else
                 ColorInfo(Canvas);
           end;
        end;
        }

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
