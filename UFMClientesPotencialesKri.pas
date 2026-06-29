unit UFMClientesPotencialesKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UTeclas, UControlEdit, StdCtrls, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, UFPEdit,
  dbcgrids, ActnList, Buttons, UDMClientesPotencialesKri, Variants, NsDBGrid, rxPlacemnt,
  ULFHYDBDescription, URecursos, URightMaskEdit, ULFEdit, ULFDBCheckBox, ULFDBEdit, ULFFormStorage,
  ULFActionList, ULFToolBar, ULFPanel, ULFDBCtrlGrid, ULFDBMemo,
  ULFDBEditFind2000, ULFPageControl, DBActns, UHYDescription,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, DbComboBoxValue,
  ULFEditFind2000;

type
  TFMClientesPotencialesKri = class(TFPEdit)
     LBLClienteFicha: TLFLabel;
     LBLTercero: TLFLabel;
     LBLAgente: TLFLabel;
     LBLTarifa: TLFLabel;
     LBLFormaPago: TLFLabel;
     LBLDtoPP: TLFLabel;
     DBECliente: TLFDbedit;
     DBETituloTercero: TLFDbedit;
     DBETituloAgente: TLFDbedit;
     DBEDtoPP: TLFDbedit;
     DBETercero: TLFDBEditFind2000;
     DBEFAgente: TLFDBEditFind2000;
     DBETituloTarifa: TLFDbedit;
     DBETituloFormaPago: TLFDbedit;
     TSNotas: TTabSheet;
     TBNotas: TLFToolBar;
     PNL_I_Info: TLFPanel;
     DBE_I_cod: TLFDbedit;
     DBE_I_Nom: TLFDbedit;
     TButtSep1: TToolButton;
     NavNotas: THYMNavigator;
     PNLEditNotas: TLFPanel;
     DBMMNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     DBEFTarifa: TLFDBEditFind2000;
     DBETipoTercero: TLFDbedit;
     LBLTipoCliente: TLFLabel;
     LBNotas: TLFLabel;
     RelojNotas: TTimer;
     DBCKPortes: TLFDBCheckBox;
     DBEDtoCial: TLFDBEdit;
     LBLDtoCial: TLFLabel;
     DBEFTipoCliente: TLFDBEditFind2000;
     DBEFFormaPago: TLFDBEditFind2000;
     LBLSuProveedor: TLFLabel;
     DBESuProveedor: TLFDbedit;
     DBCBEvalFebSi: TLFDBCheckBox;
     DBCBEvalFeb: TLFDBCheckBox;
     LBMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     DBETituloMoneda: TLFDbedit;
     ALClientes: TLFActionList;
     ANewTercero: TAction;
     ANewAgente: TAction;
     AATercero: TAction;
     SBATercero: TSpeedButton;
     AAAgente: TAction;
     SBAAgente: TSpeedButton;
     MISepEnlaces: TMenuItem;
     MIVerDatosTercero: TMenuItem;
     MIVerDatosAgente: TMenuItem;
     DBEPor_Financion: TLFDbedit;
     LPorcentajeFinanciacion: TLFLabel;
     LBLTransportista: TLFLabel;
     DBEFTransportista: TLFDBEditFind2000;
     HYDTransportista: TLFHYDBDescription;
     LBLDiasPagos: TLFLabel;
     DBEDiaPago1: TLFDbedit;
     DBEDiaPago2: TLFDbedit;
     LBLSuReferencia: TLFLabel;
     DBESuReferencia: TLFDBEdit;
     ButUltimoCte: TBitBtn;
     TButtInfoComercialKri: TToolButton;
     DBChkBIntra: TLFDBCheckBox;
     LblPais: TLFLabel;
     DBEFPais: TLFDBEditFind2000;
     DBEPais: TLFDbedit;
     LblTipoTrans: TLFLabel;
     DBEFTipoTrans: TLFDBEditFind2000;
     DBETipoTrans: TLFDbedit;
     TSInfoComercial: TTabSheet;
     DBEInfoComCliente: TLFDbedit;
     DBEInfoComTituloCliente: TLFDbedit;
     NavInfoComercial: THYMNavigator;
     CEInfoComrecial: TControlEdit;
     CEInfoComrecialPMEdit: TPopUpTeclas;
     PNLInfoComercial: TLFPanel;
     LNroEmpleados: TLFLabel;
     LFacturacionTotal: TLFLabel;
     LConsumoMateriales: TLFLabel;
     LProveedoresHabituales: TLFLabel;
     LRuta: TLFLabel;
     LTipoCliente: TLFLabel;
     DBENroDeEmpleados: TLFDBEdit;
     DBEFacturacionTotal: TLFDBEdit;
     DBEConsumoMaterial: TLFDBEdit;
     DBEProveedoresHabituales: TLFDBEdit;
     DBETipoCliente: TLFDBEdit;
     DBERutaKri: TLFDBEdit;
     DBCBTipoCliente: TDBComboBoxValue;
     LUltimaCompra: TLFLabel;
     EUltimaCompra: TLFEdit;
     LBLPotencialDeCompra: TLFLabel;
     DBEPotencialDeCompraKri: TLFDBEdit;
     AEtiquetasCliente: TAction;
     AVisualizarDatosClientes: TAction;
     AImprimirDatosClientes: TAction;
     AVisualizarDatosFiscales: TAction;
     AImprimirDatosFiscales: TAction;
     AClientesporAgrupacion: TAction;
     AVisualizarListadoDirecciones: TAction;
     AListadoDireccionesCP: TAction;
     AImprimirListadoDirecciones: TAction;
     AEtiquetas: TAction;
     AVentasDetalladas: TAction;
     AConfClientes: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfClientesFiscal: TAction;
     AConfAgrupClientes: TAction;
     AConfDireccionesCli: TAction;
     AConfDireccionesCliCP: TAction;
     AConfEtiquetas: TAction;
     AConfVentasDetalladas: TAction;
     LFCategoryAction4: TLFCategoryAction;
     LFCategoryAction5: TLFCategoryAction;
     AVentasAgenteClienteMes: TAction;
     ASep: TAction;
     AConfVentasAgenteClienteMes: TAction;
     ASep2: TAction;
     LBLDiasEntrega: TLFLabel;
     DBEDiasEntrega: TLFDbedit;
     DBEFIdioma: TLFDBEditFind2000;
     DBETituloIdioma: TLFDbedit;
     LBIdioma: TLFLabel;
     AIncidencias: TAction;
     TSIncidencias: TTabSheet;
     DBGIncidencias: THYTDBGrid;
     TBIncidencias: TLFToolBar;
     PNLCabIncidencias: TLFPanel;
     DBCliTitIn: TLFDbedit;
     DBCliIn: TLFDbedit;
     DBCKPtoVerde: TLFDBCheckBox;
     AEtiquetasFiltrados: TAction;
     AConfEtiquetasFiltrados: TAction;
     EFCliente: TLFEditFind2000;
     DBEFrecuencia: TLFDbedit;
     LFrecuencia: TLFLabel;
     LNombCom_Social: TLFLabel;
     ToolButton7: TToolButton;
     ATraspasarACliente: TAction;
     TSAgrupaciones: TTabSheet;
     TBProv: TLFToolBar;
     PNLCabProveedores: TLFPanel;
     DBExTit: TLFDbedit;
     DBExCli: TLFDbedit;
     ToolButton5: TToolButton;
     NavAgrupaciones: THYMNavigator;
     ToolButton2: TToolButton;
     HYMNavDisp: THYMNavigator;
     DBCGPertenece: TLFDBCtrlGrid;
     DBEAgDentro: TLFDbedit;
     DBEAgTitDentro: TLFDbedit;
     PPertenece: TLFPanel;
     PDisponibles: TLFPanel;
     DBCGDisponibles: TLFDBCtrlGrid;
     DBEAgCodDisp: TLFDbedit;
     DBEAgTitDisp: TLFDbedit;
     CEAgrupaciones: TControlEdit;
     CEAgrupacionesPMEdit: TPopUpTeclas;
     CEAgrupacionesMifirst: TMenuItem;
     CEAgrupacionesMiprior: TMenuItem;
     CEAgrupacionesMinext: TMenuItem;
     CEAgrupacionesMilast: TMenuItem;
     CEAgrupacionesMiinsert: TMenuItem;
     CEAgrupacionesMidelete: TMenuItem;
     CEAgrupacionesMiedit: TMenuItem;
     CEAgrupacionesMipost: TMenuItem;
     CEAgrupacionesMicancel: TMenuItem;
     CEAgrupacionesMirefresh: TMenuItem;
     CEAgrupacionesDisp: TControlEdit;
     CEAgrupacionesDispPMEdit: TPopUpTeclas;
     CEAgrupacionesDispMifirst: TMenuItem;
     CEAgrupacionesDispMiprior: TMenuItem;
     CEAgrupacionesDispMinext: TMenuItem;
     CEAgrupacionesDispMilast: TMenuItem;
     CEAgrupacionesDispMiinsert: TMenuItem;
     CEAgrupacionesDispMidelete: TMenuItem;
     CEAgrupacionesDispMiedit: TMenuItem;
     CEAgrupacionesDispMipost: TMenuItem;
     CEAgrupacionesDispMicancel: TMenuItem;
     CEAgrupacionesDispMirefresh: TMenuItem;
     AAImportaClientePotencial: TAction;
     TBInfoComercial: TLFToolBar;
     ToolButton1: TToolButton;
     PNLClienteInfoComercial: TLFPanel;
     Splitter1: TSplitter;
     DBMMDatosIncidencia: TLFDBMemo;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttCompClick(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure MuestraFiltrado(tipo: byte);
     procedure MuestraFiltradoFiscal(tipo: byte);
     procedure TbuttImprimeFiltradoClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure RelojNotasTimer(Sender: TObject);
     procedure DBCGDisponiblesDblClick(Sender: TObject);
     procedure DBCGPerteneceDblClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure MIConfClientesClick(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure MIEtiquetasClick(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure ANewTerceroExecute(Sender: TObject);
     procedure ANewAgenteExecute(Sender: TObject);
     procedure AATerceroExecute(Sender: TObject);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure AAAgenteExecute(Sender: TObject);
     procedure SBAAgenteDblClick(Sender: TObject);
     procedure DBETituloAgenteEnter(Sender: TObject);
     procedure DBETituloTerceroEnter(Sender: TObject);
     procedure DBEFTransportistaChange(Sender: TObject);
     procedure AEtiquetasClienteExecute(Sender: TObject);
     procedure AVisualizarDatosClientesExecute(Sender: TObject);
     procedure AImprimirDatosClientesExecute(Sender: TObject);
     procedure ButUltimoCteClick(Sender: TObject);
     procedure TButtInfoComercialKriClick(Sender: TObject);
     procedure AVisualizarDatosFiscalesExecute(Sender: TObject);
     procedure AClientesporAgrupacionExecute(Sender: TObject);
     procedure AVisualizarListadoDireccionesExecute(Sender: TObject);
     procedure AListadoDireccionesCPExecute(Sender: TObject);
     procedure AImprimirListadoDireccionesExecute(Sender: TObject);
     procedure AEtiquetasExecute(Sender: TObject);
     procedure AVentasDetalladasExecute(Sender: TObject);
     procedure AFiltradoAgrupExecute(Sender: TObject);
     procedure AVentaArticulosCliExecute(Sender: TObject);
     procedure AImprimirDatosFiscalesExecute(Sender: TObject);
     procedure AConfClientesFiscalExecute(Sender: TObject);
     procedure AConfAgrupClientesExecute(Sender: TObject);
     procedure AConfDireccionesCliExecute(Sender: TObject);
     procedure AConfDireccionesCliCPExecute(Sender: TObject);
     procedure AConfEtiquetasExecute(Sender: TObject);
     procedure AConfVentasDetalladasExecute(Sender: TObject);
     procedure AAgenteExecute(Sender: TObject);
     procedure AVentasAgenteClienteMesExecute(Sender: TObject);
     procedure AConfVentasAgenteClienteMesExecute(Sender: TObject);
     procedure ExpandirCadenaCta(Sender: TObject);
     procedure ExpandirCadenaCtaTk(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AClienteCuotaExecute(Sender: TObject);
     procedure AIncidenciasExecute(Sender: TObject);
     procedure DBGIncidenciasDblClick(Sender: TObject);
     procedure DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AEtiquetasFiltradosExecute(Sender: TObject);
     procedure AConfEtiquetasFiltradosExecute(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure AFacturasClienteKriExecute(Sender: TObject);
     procedure AAlbaranesClienteKriExecute(Sender: TObject);
     procedure APedidosClienteKriExecute(Sender: TObject);
     procedure AOfertasClienteKriExecute(Sender: TObject);
     procedure LNombCom_SocialClick(Sender: TObject);
     procedure ATraspasarAClienteExecute(Sender: TObject);
     procedure AAImportaClientePotencialExecute(Sender: TObject);
  private
     Primera: boolean;
     procedure notas;
     procedure HabilitaEnlaces;
     procedure ColoresCodigoCliente;
  public
     SWFil, SWEnlace: integer;
     DataModule: TDMClientesPotencialesKri;
     procedure FiltraCliente(Filtro: string);
     procedure Tercero_a_ClientePotencial(Tercero: integer);
  end;

var
  FMClientesPotencialesKri : TFMClientesPotencialesKri;

implementation

uses UFormGest, UDMMain, UEntorno, UUtiles,
  UDMLSTClientes, UDMListConfig, UFMListConfig,
  UFPregAgrupacionCli, UFMEtiqCli, UFPregEtiCliente, UFPregCPostal,
  UFMain, UFMTerceros, UFMAgentes, UFFiltra_Clientes_Agr,
  UFPregVentasCliente, UDMLstVentasCliente, UFMInformacionComercial, UFPregVentasClienteAge,
  UDMLstVentasCliAge, UFMClienteCuotas, UFMIncidencias,
  UFMFacturas, UFMAlbaranes, UFMPedidos, UFMOfertas, UFMClientes, UParam, UDameDato;

{$R *.DFM}

procedure TFMClientesPotencialesKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreDataVarias(TDMClientesPotencialesKri, DataModule, Self);
  Campo := DataModule.QMClientesCLIENTE;
  NavMain.DataSource := DataModule.DSQMClientes;
  EPMain.DataSource := DataModule.DSQMClientes;
  DBGMain.DataSource := DataModule.DSQMClientes;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  CENotasPMEdit.Teclas := DMMain.Teclas;
  G2KTableLoc.DataSource := DataModule.DSQMClientes;

  if ((DataModule.QMClientes.Active) and (DataModule.QMClientesNOTAS.Value <> '')) then
     RelojNotas.Enabled := True
  else
  begin
     RelojNotas.Enabled := False;
     LBNotas.Visible := False;
  end;
  SWFil := 0;
  SWEnlace := 0;

  ColoresCodigoCliente;
  HabilitaEnlaces;

  if (REntorno.Delegacion = 'S') then // dji lrk kri
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavNotas.VisibleButtons := [nbRefresh];
     NavInfoComercial.VisibleButtons := [nbRefresh];
  end;

  if (DMMain.EstadoKri(252) = 0) then
     LNombCom_Social.Visible := False;

  // Color campo ID
  ColorCampoID(DBECliente);

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(ButUltimoCte, 1, DMMain.ILMain_Ac, 104);
  GetBitmapFromImageList(ButUltimoCte, 2, DMMain.ILMain_In, 104);
end;

procedure TFMClientesPotencialesKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFMClientesPotencialesKri.TbuttCompClick(Sender: TObject);
begin
  FMain.MuestraInfoTercero(StrToIntDef(DBETercero.Text, 0));
end;

procedure TFMClientesPotencialesKri.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMClientesPotencialesKri.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  inherited;
  Resultado := DataModule.BusquedaCompleja;
  if (Resultado in [mrOk, mrAll]) then
  begin
     SWFil := 1;
     SWEnlace := 0;
  end;
  Continua := False;
  notas;
end;

procedure TFMClientesPotencialesKri.MuestraFiltrado(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DataModule.QMClientes.SelectSQL);
  AbreData(TDMlstClientes, DMlstClientes);
  TempSql.AddStrings(DMLstClientes.QMClientes.SelectSQL);
  DMlstClientes.QMClientes.Close;
  DMLstClientes.QMClientes.SelectSQL.Assign(SqlFiltro);
  DMLstClientes.MostrarListadoFiltrado(tipo);
  DMlstClientes.QMClientes.Close;
  DMLstClientes.QMClientes.SelectSQL.Assign(TempSQL);
  CierraData(DMLstClientes);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMClientesPotencialesKri.TbuttImprimeFiltradoClick(Sender: TObject);
begin
  MuestraFiltrado(0);  // Previsualizar
end;

procedure TFMClientesPotencialesKri.MuestraFiltradoFiscal(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DataModule.QMClientes.SelectSQL);
  AbreData(TDMlstClientes, DMlstClientes);
  TempSql.AddStrings(DMLstClientes.QMClientes.SelectSQL);
  DMlstClientes.QMClientes.Close;
  DMLstClientes.QMClientes.SelectSQL.Assign(SqlFiltro);
  DMLstClientes.MostrarFiltradoFiscal(tipo);
  DMlstClientes.QMClientes.Close;
  DMLstClientes.QMClientes.SelectSQL.Assign(TempSQL);
  CierraData(DMlstClientes);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMClientesPotencialesKri.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  i : integer;
  esta : boolean;
begin
  inherited;
  Notas;

  if FMain.sourcecall = True then
  begin
     FMain.sourcecall := False;
     Close;
  end
  else
  if FMain.autcliente then
  begin
     esta := False;
     with Application do
        for i := 0 to (ComponentCount - 1) do
           if (('T' + Components[i].Name) = TFMTerceros.ClassName) then
              esta := True;

     if esta then
        FMTerceros.CierraCliente
     else
     begin
        FMain.autcliente := False;
        Close;
     end;
  end;
end;

procedure TFMClientesPotencialesKri.RelojNotasTimer(Sender: TObject);
begin
  inherited;
  if LBNotas.Visible = True then
     LBNotas.Visible := False
  else
     LBNotas.Visible := True;
end;

procedure TFMClientesPotencialesKri.DBCGDisponiblesDblClick(Sender: TObject);
begin
  if ((REntorno.Usuario = 1) or (REntorno.Delegacion <> 'S')) then // dji lrk kri
     DataModule.AgrupacionRellena;
end;

procedure TFMClientesPotencialesKri.DBCGPerteneceDblClick(Sender: TObject);
begin
  if ((REntorno.Usuario = 1) or (REntorno.Delegacion <> 'S')) then // dji lrk kri
     DataModule.AgrupacionVacia;
end;

procedure TFMClientesPotencialesKri.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  if ((button = nbInsert) and (DMMain.EstadoKri(19) = 1)) then
  begin
     ButUltimoCte.Visible := True;
     ButUltimoCte.Enabled := True;
  end
  else
  begin
     ButUltimoCte.Visible := False;
     ButUltimoCte.Enabled := False;
  end;
end;

procedure TFMClientesPotencialesKri.MIConfClientesClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(7, formato, cabecera, copias, pijama, '',
     DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

{ Filtra por Cliente }
procedure TFMClientesPotencialesKri.FiltraCliente(Filtro: string);
var
  Parametro : TParametroFiltrado;
begin
  PCMain.ActivePage := TSFicha;
  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := Filtro;
     Parametro.SQLBase := TStringList.Create;
     Parametro.SQLBase.Text := DataModule.SQLBase.Text;
     Parametro.Tabla := DataModule.QMClientes;
     DMMain.FiltraSQL(Parametro);
  finally
     Parametro.SQLBase.Free;
     Parametro.Free;
  end;

  if (Filtro <> '') then
  begin
     SWEnlace := 1;
     SWFil := 0;
  end;

  if ((DataModule.QMClientes.Active) and (DataModule.QMClientesNOTAS.Value <> '')) then
     RelojNotas.Enabled := True
  else
  begin
     RelojNotas.Enabled := False;
     LBNotas.Visible := False;
  end;
end;

procedure TFMClientesPotencialesKri.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMClientesPotencialesKri.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMClientesPotencialesKri.MIEtiquetasClick(Sender: TObject);
begin
  TFPregEtiCliente.Create(Self).Muestra(DataModule.Cliente, 'CLI');
end;

// Mantenimiento de Etiquetas de Clientes
procedure TFMClientesPotencialesKri.FormActivate(Sender: TObject);
begin
  inherited;
  if not Primera then
     if not REntorno.DatosAbiertos then
        if (DataModule.BusquedaCompleja in [mrOk, mrAll]) then
           SWFil := 1;
  Primera := True;
  if FMain.EnlaceCrea then
     Tercero_a_ClientePotencial(DMMain.MinTercero);
end;

procedure TFMClientesPotencialesKri.Tercero_a_ClientePotencial(Tercero: integer);
begin
  {dji lrk kri - Nro ultimo cliente NCO}
  if (DMMain.EstadoKri(19) = 1) then
  begin
     ButUltimoCte.Visible := True;
     ButUltimoCte.Enabled := True;
  end
  else
  begin
     ButUltimoCte.Visible := False;
     ButUltimoCte.Enabled := False;
  end;
  DataModule.CambiarTercero(Tercero);
end;

procedure TFMClientesPotencialesKri.notas;
begin
  if DataModule.QMClientesNOTAS.Value <> '' then
     RelojNotas.Enabled := True
  else
  begin
     RelojNotas.Enabled := False;
     LBNotas.Visible := False;
  end;
end;

procedure TFMClientesPotencialesKri.ANewTerceroExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     FMain.SourceCallTer := True;
     FMain.EjecutaAccion(FMain.ATerceros);
     FMTerceros.InsertarTercero;
  end;
end;

procedure TFMClientesPotencialesKri.ANewAgenteExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.AAgentes);

     if (FMain.EnlaceDatos <> Null) then
     begin
        DBEFAgente.SetBufferText(FMain.EnlaceDatos);
     end;
     DBEFTarifa.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TFMClientesPotencialesKri.AATerceroExecute(Sender: TObject);
begin
  if PEdit.Enabled then
  begin
     if DBETercero.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + DBETercero.Text);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' +
        IntToStr(DataModule.QMClientesTERCERO.AsInteger));
end;

procedure TFMClientesPotencialesKri.SBATerceroDblClick(Sender: TObject);
begin
  AATercero.Execute;
end;

procedure TFMClientesPotencialesKri.HabilitaEnlaces;
begin
  if (FMain.ATerceros.Enabled = False) then
  begin
     DBETercero.Accion := nil;
     SBATercero.Width := 0;
     MIVerDatosTercero.Visible := False;
     DBETituloTercero.Color := clInfoBk;
     TbuttComp.Visible := False;
     TSepTerc.Visible := False;
  end
  else
  begin
     SolapaControles(SBATercero, DBETituloTercero);
     DBETituloTercero.Color := REntorno.ColorEnlaceActivo;
     TbuttComp.Visible := True;
     TSepTerc.Visible := True;
  end;

  if (FMain.AAgentes.Enabled = False) then
  begin
     DBEFAgente.Accion := nil;
     SBAAgente.Width := 0;
     MIVerDatosAgente.Visible := False;
     DBETituloAgente.Color := clInfoBk;
  end
  else
  begin
     SolapaControles(SBAAgente, DBETituloAgente);
     DBETituloAgente.Color := REntorno.ColorEnlaceActivo;
  end;

  if ((FMain.ATerceros.Enabled = False) and (FMain.AAgentes.Enabled = False)) then
     MISepEnlaces.Visible := False;
end;

procedure TFMClientesPotencialesKri.AAAgenteExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if PEdit.Enabled then
     begin
        if DBEFAgente.Text <> '' then
           FMain.EjecutaAccion(FMain.AAgentes, 'Agente = ' + DBEFAgente.Text +
              ' and Ejercicio = ' + REntorno.EjercicioStr);
     end
     else
        FMain.EjecutaAccion(FMain.AAgentes, 'Agente = ' +
           IntToStr(DataModule.QMClientesAGENTE.AsInteger) + ' and Ejercicio = ' +
           REntorno.EjercicioStr);
end;

procedure TFMClientesPotencialesKri.SBAAgenteDblClick(Sender: TObject);
begin
  AAAgente.Execute;
end;

procedure TFMClientesPotencialesKri.DBETituloAgenteEnter(Sender: TObject);
begin
  DBEFAgente.SetFocus;
end;

procedure TFMClientesPotencialesKri.DBETituloTerceroEnter(Sender: TObject);
begin
  if DBETercero.Enabled then
     DBETercero.SetFocus
  else
     DBEFAgente.SetFocus;
end;

procedure TFMClientesPotencialesKri.ColoresCodigoCliente;
begin
  case REntorno.Cliente_aut of
     False:
     begin
        DBECliente.ReadOnly := False;
        DBECliente.Enabled := True;
        DBECliente.Color := clWindow;
        DBECliente.Font.Color := clWindowText;
        NavMain.InsertaControl := DBECliente;
     end;
     True:
     begin
        DBECliente.ReadOnly := True;
        DBECliente.Enabled := False;
        DBECliente.Color := clInfoBk;
        DBECliente.Font.Color := clGrayText;
        NavMain.InsertaControl := DBEFTipoCliente;
     end;
  end;
end;

procedure TFMClientesPotencialesKri.DBEFTransportistaChange(Sender: TObject);
begin
  HYDTransportista.ActualizaDatos('TRANSPORTISTA', DBEFTransportista.Text);
end;

procedure TFMClientesPotencialesKri.AEtiquetasClienteExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMEtiqCli, FMEtiqCli, Sender);
end;

procedure TFMClientesPotencialesKri.AVisualizarDatosClientesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMClientesPotencialesKri.AImprimirDatosClientesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMClientesPotencialesKri.AVisualizarDatosFiscalesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltradoFiscal(0);
end;

procedure TFMClientesPotencialesKri.AClientesporAgrupacionExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMlstClientes, DMlstClientes);
  TFPregAgrupacionCli.Create(Self);
  CierraData(DMLstClientes);
end;

procedure TFMClientesPotencialesKri.AVisualizarListadoDireccionesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(2);
end;

procedure TFMClientesPotencialesKri.AListadoDireccionesCPExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFPregCPostal.Create(Self).Muestra('CLI');
  CierraData(DMLstClientes);
end;

procedure TFMClientesPotencialesKri.AImprimirListadoDireccionesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(3);
end;

procedure TFMClientesPotencialesKri.AEtiquetasExecute(Sender: TObject);
begin
  inherited;
  TFPregEtiCliente.Create(Self).Muestra(DataModule.Cliente, 'CLI');
end;

procedure TFMClientesPotencialesKri.AVentasDetalladasExecute(Sender: TObject);
begin
  inherited;
  TFPregVentasCliente.Create(Self).Muestra(DBECliente.Text);
end;

procedure TFMClientesPotencialesKri.AFiltradoAgrupExecute(Sender: TObject);
begin
  inherited;
  FFiltra_clientes_agr := TFFiltra_clientes_agr.Create(Self);
  if (FFiltra_clientes_agr.ShowModal = mrOk) then
     Datamodule.FiltraSeleccion;
end;

procedure TFMClientesPotencialesKri.AVentaArticulosCliExecute(Sender: TObject);
begin
  inherited;
  DataModule.VentasCliente;
end;

procedure TFMClientesPotencialesKri.AImprimirDatosFiscalesExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltradoFiscal(1);
end;

procedure TFMClientesPotencialesKri.AConfClientesFiscalExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(8, formato, cabecera, copias, pijama, '',
     DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientesPotencialesKri.AConfAgrupClientesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(16, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientesPotencialesKri.AConfDireccionesCliExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(17, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientesPotencialesKri.AConfDireccionesCliCPExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(81, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientesPotencialesKri.AConfEtiquetasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(59, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientesPotencialesKri.AConfVentasDetalladasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstVentasCliente, DMLstVentasCliente);
  TFMListConfig.Create(Self).Muestra(140, formato, cabecera, copias,
     pijama, '', DMLstVentasCliente.frHYVentasClientes);
  CierraData(DMLstVentasCliente);
end;

procedure TFMClientesPotencialesKri.ButUltimoCteClick(Sender: TObject);
var
  cliente : integer;
begin
  inherited;
  cliente := (StrToInt(DBECliente.Text) + 1) * 10000;
  with DataModule.xBuscoMaxCte do
  begin
     if not Transaction.InTransaction then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := cliente;
     ExecQuery;
     if (FieldByName['MAX'].AsInteger / 10000) < (cliente / 10000 - 1) then
        DataModule.QMClientesCLIENTE.Value := (StrToInt(DBECliente.Text)) * 10000
     else
        DataModule.QMClientesCLIENTE.Value := (FieldByName['MAX'].AsInteger) + 1;
     Transaction.CommitRetaining;
     // FreeHandle;
  end;
end;

procedure TFMClientesPotencialesKri.TButtInfoComercialKriClick(Sender: TObject);
begin
  inherited;
  AbreForm(TFMInformacionComercial, FMInformacionComercial);
  FMInformacionComercial.Muestra(DataModule.QMClientesCLIENTE.AsInteger);
end;

procedure TFMClientesPotencialesKri.AAgenteExecute(Sender: TObject);
begin
  inherited;
  AAAgente.Execute;
end;

procedure TFMClientesPotencialesKri.AVentasAgenteClienteMesExecute(Sender: TObject);
begin
  inherited;
  TFPregVentasClienteAge.Create(Self).Muestra(DBECliente.Text);
end;

procedure TFMClientesPotencialesKri.AConfVentasAgenteClienteMesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstVentasCliAge, DMLstVentasCliAge);
  TFMListConfig.Create(Self).Muestra(159, Formato, Cabecera, Copias,
     Pijama, '', DMLstVentasCliAge.frHYVentasClientesAgentes);
  CierraData(DMLstVentasCliAge);
end;

procedure TFMClientesPotencialesKri.ExpandirCadenaCta(Sender: TObject);
begin
  ExpandirCadenaEdit((Sender as TLFDBEditFind2000));
end;

procedure TFMClientesPotencialesKri.ExpandirCadenaCtaTk(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if key = VK_RETURN then
     ExpandirCadenaCta(Sender);
end;

procedure TFMClientesPotencialesKri.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMClientesPotencialesKri.AClienteCuotaExecute(Sender: TObject);
begin
  TFMClienteCuotas.Create(Self).Muestra(DataModule.QMClientesCLIENTE.AsInteger);
end;

procedure TFMClientesPotencialesKri.AIncidenciasExecute(Sender: TObject);
begin
  with DataModule do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMClientesCLIENTE.AsInteger,
        QMClientesTERCERO.AsInteger, 4, 0, 1);
  end;
end;

procedure TFMClientesPotencialesKri.DBGIncidenciasDblClick(Sender: TObject);
begin
  with DataModule do
  begin
     AbreForm(TFMIncidencias, FMIncidencias);
     FMIncidencias.Muestra(QMClientesCLIENTE.AsInteger,
        QMClientesTERCERO.AsInteger, 4, xIncidenciasINCIDENCIA.AsInteger, 1);
  end;
end;

procedure TFMClientesPotencialesKri.DBGIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DataModule.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'TITULO_INCIDENCIA') then
        CeldaEnlace(DBGIncidencias, Rect);
  end;
end;

procedure TFMClientesPotencialesKri.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  {dji lrk kri - Nava - Quitar filtro antes de realizar la búsqueda}
  DataModule.QMClientes.Close;
  DataModule.QMClientes.SelectSQL.Text := 'SELECT * FROM VER_CLIENTES_POTENCIALES ' +
     'WHERE EMPRESA=?EMPRESA ORDER BY CLIENTE';
  DMMain.FiltraTabla(DataModule.QMClientes, '10000', True);
  G2KTableLoc.Click;
end;

procedure TFMClientesPotencialesKri.AEtiquetasFiltradosExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(4);
end;

procedure TFMClientesPotencialesKri.AConfEtiquetasFiltradosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  TFMListConfig.Create(Self).Muestra(2059, formato, cabecera, copias,
     pijama, '', DMLstClientes.frClientes);
  CierraData(DMLstClientes);
end;

procedure TFMClientesPotencialesKri.EFClienteChange(Sender: TObject);
begin
  inherited;
  {dji lrk kri}
  if ((EFCliente.Text = '') or (DameTituloClientePotencial(StrToIntDef(EFCliente.Text, 0)) <> '')) then
  begin
     with DataModule.QMClientes do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT * FROM VER_CLIENTES_POTENCIALES ');
        SelectSQL.Add('WHERE EMPRESA=?EMPRESA ');
        if (EFCliente.Text <> '') then
           if (DameTituloClientePotencial(StrToIntDef(EFCliente.Text, 0)) <> '') then
              SelectSQL.Add(' AND CLIENTE=' + EFCliente.Text);
        SelectSQL.Add(' ORDER BY CLIENTE ');
        DMMain.FiltraTabla(DataModule.QMClientes, '10000', REntorno.DatosAbiertos);
     end;
     NavMainClickAfterAdjust(Sender, nbRefresh);
  end;
end;

procedure TFMClientesPotencialesKri.AFacturasClienteKriExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.EjecutaAccion(FMain.AFacturas);
  FMFacturas.FiltraClienteKri(REntorno.Ejercicio, Serie, DataModule.QMClientesCLIENTE.AsInteger, 0);
end;

procedure TFMClientesPotencialesKri.AAlbaranesClienteKriExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.EjecutaAccion(FMain.AAlbaranes);
  FMAlbaranes.FiltraClienteKri(REntorno.Ejercicio, Serie, DataModule.QMClientesCLIENTE.AsInteger, 0);
end;

procedure TFMClientesPotencialesKri.APedidosClienteKriExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.EjecutaAccion(FMain.APedidos);
  FMPedidos.FiltraClienteKri(REntorno.Ejercicio, Serie, DataModule.QMClientesCLIENTE.AsInteger, 0);
end;

procedure TFMClientesPotencialesKri.AOfertasClienteKriExecute(Sender: TObject);
var
  serie : string;
begin
  inherited;
  if REntorno.SerieRestringida <> '' then
     serie := REntorno.SerieRestringida
  else
     serie := REntorno.Serie;
  FMain.EjecutaAccion(FMain.AOfertas);
  FMOfertas.FiltraClienteKri(REntorno.Ejercicio, Serie, DataModule.QMClientesCLIENTE.AsInteger, 0);
end;

procedure TFMClientesPotencialesKri.LNombCom_SocialClick(Sender: TObject);
begin
  inherited;
  if (LNombCom_Social.Caption <> _('Nombre Comercial')) then
  begin
     LNombCom_Social.Caption := _('Nombre Comercial');
     EFCliente.CampoStr := 'NOMBRE_COMERCIAL';
  end
  else
  begin
     LNombCom_Social.Caption := _('Razón Social');
     EFCliente.CampoStr := 'TITULO';
  end;
end;

procedure TFMClientesPotencialesKri.ATraspasarAClienteExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.EjecutaAccion(FMain.AClientes);
     FMClientes.Potencial_a_Cliente(StrToInt(DBECliente.Text), StrToInt(DBETercero.Text));
     DataModule.QMClientes.Close;
     DataModule.QMClientes.Open;
  end;
end;

procedure TFMClientesPotencialesKri.AAImportaClientePotencialExecute(Sender: TObject);
begin
  inherited;
  DataModule.ImportacionClientesPotenciales;
end;

end.
