unit UFMModelosTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, DB, StdCtrls, DBCtrls, UHYDescription, Mask, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UDMMaestrosTallas, ActnList,
  ULFFormStorage, ULFActionList, ULFToolBar, UG2kTBLoc, ULFPageControl,
  ULFPanel, ULFFIBDBEditFind, ULFDBEdit, ULFHYDBDescription, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFEditFind2000, ULFEdit,
  ULFDBMemo, ULFDBEditFind2000, HYFIBQuery, Buttons, UFPEditDetalle,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit;

type
  TFMModelosTallas = class(TFPEditDetalle)
     DSart_articulos_modelos: TDataSource;
     DSart_articulos_mod_color: TDataSource;
     DBEFFamilia: TLFDBEditFind2000;
     ETituloFamilia: TLFEdit;
     DBEProveedor: TLFDBEditFind2000;
     DBDProveedor: TLFHYDBDescription;
     DBESeccion: TLFDbedit;
     DBEPCompra: TLFDbedit;
     DBETemporada: TLFDbedit;
     DBETipo_iva: TLFDBEditFind2000;
     DBDTipoIVA: TLFHYDBDescription;
     DBCBControlStock: TLFDBCheckBox;
     DBCBIvaIncluido: TLFDBCheckBox;
     DBETitulo: TLFDbedit;
     DBCBPvpTalla: TLFDBCheckBox;
     DBEPVenta: TLFDbedit;
     DBERef_proveedor: TLFDbedit;
     LAnyoTempSeccion: TLFLabel;
     LFamilia: TLFLabel;
     LProveedor: TLFLabel;
     LPCompra: TLFLabel;
     LTitulo: TLFLabel;
     LTipoIVA: TLFLabel;
     LPVenta: TLFLabel;
     DBEAgno: TLFDbedit;
     LGrupoTallas: TLFLabel;
     DBEFid_g_t: TLFDBEditFind2000;
     DBDGrupoTallas: TLFHYDBDescription;
     LRefProveedor: TLFLabel;
     TButtStockModeloColorTallas: TToolButton;
     AStockModelosColoresTallas: TAction;
     ToolButton2: TToolButton;
     AStockModelosTallas: TAction;
     TButtStockModelosTallas: TToolButton;
     TSPrecios: TTabSheet;
     DBGFPrecios: TDBGridFind2000;
     DSQMxver_precio_am: TDataSource;
     PNLCabPrecios: TLFPanel;
     TCTipoPrecios: TTabControl;
     LTarifa: TLFLabel;
     EFTarifas: TLFEditFind2000;
     NavPrecios: THYMNavigator;
     CEPrecios: TControlEdit;
     CEPreciosPMEdit: TPopUpTeclas;
     TBParamArticulo: TToolButton;
     AParametriza: TAction;
     LCodEstructura: TLFLabel;
     LBaseEstructura: TLFLabel;
     DBEFCod_estructura: TLFDBEditFind2000;
     HYDBTitulo_estructura: TLFHYDBDescription;
     DSModelo_estructura: TDataSource;
     DBEBase: TLFDbedit;
     TButtCreaArticulos: TToolButton;
     DBCBBorraDinamic: TLFDBCheckBox;
     ETituloTarifa: TLFEdit;
     ACreaArticulos: TAction;
     AFiltraArticulos: TAction;
     TButtFiltraArticulos: TToolButton;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     LFCategoryAction1: TLFCategoryAction;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     LImagen: TLFLabel;
     EGrupoTalla: TLFEdit;
     TButtFiltraEscandallosProd: TToolButton;
     AFiltraEscandallosProd: TAction;
     DBCBWeb: TLFDBCheckBox;
     DBEFCliente: TLFDBEditFind2000;
     LCliente: TLFLabel;
     ECliente: TLFEdit;
     LRefCliente: TLFLabel;
     DBERefCliente: TLFDbedit;
     LTarifaDefecto: TLFLabel;
     DBEFTarifaDefecto: TLFDBEditFind2000;
     ETarifaDefecto: TLFEdit;
     EMonedaTarifaDefecto: TLFEdit;
     PrecioTarifaDefecto: TLFEdit;
     LMarca: TLFLabel;
     DBEFMarca: TLFDBEditFind2000;
     DBETituloMarca: TLFDbedit;
     BCargarImagen: TButton;
     LGaleria: TLFLabel;
     DBEFGaleria: TLFDBEditFind2000;
     ETituloGaleria: TLFEdit;
     SBAGaleria: TSpeedButton;
     AGaleria: TAction;
     LSubfamilia: TLFLabel;
     DBEFSubfamilia: TLFDBEditFind2000;
     ETitSubfamilia: TLFEdit;
     LPCoste: TLFLabel;
     DBEPCoste: TLFDbedit;
     LDCompra: TLFLabel;
     DBEDtoCompra: TLFDbedit;
     LFCategoryAction2: TLFCategoryAction;
     AAdjuntosModelos: TAction;
     LALFA_1: TLFLabel;
     DBEALFA_1: TLFDbedit;
     LALFA_2: TLFLabel;
     DBEALFA_2: TLFDbedit;
     LALFA_3: TLFLabel;
     DBEALFA_3: TLFDbedit;
     AActuArticulos: TAction;
     ABorraArticulos: TAction;
     LALFA_4: TLFLabel;
     DBEALFA_4: TLFDbedit;
     LALFA_5: TLFLabel;
     LALFA_6: TLFLabel;
     LALFA_7: TLFLabel;
     LALFA_8: TLFLabel;
     DBEALFA_5: TLFDbedit;
     DBEALFA_6: TLFDbedit;
     DBEALFA_7: TLFDbedit;
     DBEALFA_8: TLFDbedit;
     DBCHKBaja: TLFDBCheckBox;
     DBDTPFechaBaja: TLFDBDateEdit;
     AActuColores: TAction;
     ADuplicaModelo: TAction;
     BClipboard: TButton;
     SBCamiarPrecio: TSpeedButton;
     DBEFGenero: TLFDBEditFind2000;
     DBEFTemporada: TLFDBEditFind2000;
     ETituloGenero: TLFEdit;
     ETituloTemporada: TLFEdit;
     LGenero: TLFLabel;
     LTemporada: TLFLabel;
     DBEPMercado: TLFDbedit;
     LPMercado: TLFLabel;
     LPTarifa: TLFLabel;
     LPack: TLFLabel;
     DBEPack: TLFDbedit;
     ACreaArticulosTodos: TAction;
     LCombinaciones: TLFLabel;
     DBENumeroCombinaciones: TLFDbedit;
     SBAFiltraArticulos: TSpeedButton;
     LFamiliaTejido: TLFLabel;
     DBEFFamiliaTejido: TLFDBEditFind2000;
     EFamiliaTejido: TLFEdit;
     EArticuloEstructura: TLFEdit;
     DBEFArticuloEstructura: TLFDBEditFind2000;
     LArticuloEstructura: TLFLabel;
     LArticuloConfeccion: TLFLabel;
     DBEFArticuloConfeccion: TLFDBEditFind2000;
     EArticuloConfeccion: TLFEdit;
     DBCBCreaFaldon: TLFDBCheckBox;
     DBCBCreaConfeccion: TLFDBCheckBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBEFFamiliaChange(Sender: TObject);
     procedure DBEProveedorChange(Sender: TObject);
     procedure DBETipo_ivaChange(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFid_g_tChange(Sender: TObject);
     procedure AStockModelosColoresTallasExecute(Sender: TObject);
     procedure AStockModelosTallasExecute(Sender: TObject);
     procedure TSPreciosExit(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure TCTipoPreciosChange(Sender: TObject);
     procedure EFTarifasExiste(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AParametrizaExecute(Sender: TObject);
     procedure DBEFCod_estructuraChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ACreaArticulosExecute(Sender: TObject);
     procedure AFiltraArticulosExecute(Sender: TObject);
     procedure DBEFFamiliaBusqueda(Sender: TObject);
     procedure DBCBPvpTallaChange(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AFiltraEscandallosProdExecute(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBEFTarifaDefectoChange(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFMarcaBusqueda(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure DBEFGaleriaChange(Sender: TObject);
     procedure AGaleriaExecute(Sender: TObject);
     procedure SBAGaleriaDblClick(Sender: TObject);
     procedure ETituloGaleriaDblClick(Sender: TObject);
     procedure DBEFSubfamiliaChange(Sender: TObject);
     procedure DBEFSubfamiliaBusqueda(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure AAdjuntosModelosExecute(Sender: TObject);
     procedure AActuArticulosExecute(Sender: TObject);
     procedure ABorraArticulosExecute(Sender: TObject);
     procedure DBCHKBajaChange(Sender: TObject);
     procedure AActuColoresExecute(Sender: TObject);
     procedure ADuplicaModeloExecute(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure SBCamiarPrecioClick(Sender: TObject);
     procedure DBEFGeneroChange(Sender: TObject);
     procedure DBEFTemporadaChange(Sender: TObject);
     procedure ACreaArticulosTodosExecute(Sender: TObject);
     procedure DBENumeroCombinacionesDblClick(Sender: TObject);
     procedure SBAFiltraArticulosDblClick(Sender: TObject);
     procedure DBEFFamiliaTejidoChange(Sender: TObject);
     procedure DBEFFamiliaTejidoExiste(Sender: TObject);
     procedure DBEFArticuloEstructuraChange(Sender: TObject);
     procedure DBEFArticuloEstructuraExiste(Sender: TObject);
     procedure DBEFArticuloConfeccionChange(Sender: TObject);
     procedure DBEFArticuloConfeccionExiste(Sender: TObject);
     procedure DBEFArticuloEstructuraBusqueda(Sender: TObject);
     procedure DBEFArticuloConfeccionBusqueda(Sender: TObject);
     procedure DBERef_proveedorExit(Sender: TObject);
     procedure DBETituloEnter(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
     { Private declarations }
     Param_MODCODI001: string;
     Param_MODCODI002: string;
     procedure ReparaGrid;
  public
     { Public declarations }
     DM: TDMMaestrosTallas;
     procedure Posiciona(RefProveedor: string);
     procedure FiltraModelo(aFiltro: string);
  end;

var
  FMModelosTallas : TFMModelosTallas;

implementation

uses UDMMain, UFormGest, ufBusca, UFMStockTallas, UDMTallas, UFMParamArticulos,
  UEntorno, UFMain, UUtiles, UDameDato, UParam, UFMAdjunto, UFMSeleccion,
  ShellApi, URecibeFicheros, UDMAdjunto, UImagenes;

{$R *.dfm}

procedure TFMModelosTallas.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreDataVarias(TDMMaestrosTallas, dm, Self);

  DSart_articulos_mod_color.DataSet := dm.QMver_art_mod_color_edit;
  DSQMxver_precio_am.DataSet := dm.QMxver_precio_am;
  DSart_articulos_modelos.DataSet := dm.QMart_articulos_modelos;
  DSModelo_estructura.DataSet := dm.QMArt_mod_estructura;

  dm.qmart_articulos_modelos.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  dm.QMart_articulos_modelos.Open;

  G2KTableLoc.DataSource := DSart_articulos_modelos;

  // Muestra el cliente a quien se vende este modelo
  // La cuenta de compras/ventas de los artículos se tomará del cliente
  if (DMMain.EstadoKri(438) <> 1) then
  begin
     LCliente.Visible := False;
     DBEFCliente.Visible := False;
     ECliente.Visible := False;
     DBERefCliente.Top := DBEFCliente.Top;
     DBERefCliente.Left := DBEFCliente.Left;
     LRefCliente.Top := LCliente.Top;
     LRefCliente.Left := DBERefCliente.Left - LRefCliente.Width - 4;
  end;

  // DOCPCTA001 - Utiliza precios de coste en ART_ARTICULOS_TARIFAS
  if (LeeParametro('DOCPCTA001') = 'S') then
  begin
     TCTipoPrecios.Tabs[0] := _('Compra');
  end;

  Param_MODCODI001 := LeeParametro('MODCODI001');
  Param_MODCODI002 := LeeParametro('MODCODI002');

  SolapaControles(SBAGaleria, ETituloGaleria);
  ETituloGaleria.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAFiltraArticulos, DBENumeroCombinaciones);
  DBENumeroCombinaciones.Color := REntorno.ColorEnlaceActivo;

  DBCHKBajaChange(Sender);

  LALFA_1.Caption := LeeParametro(format('ARTDESC%3.3d', [1]));
  LALFA_2.Caption := LeeParametro(format('ARTDESC%3.3d', [2]));
  LALFA_3.Caption := LeeParametro(format('ARTDESC%3.3d', [3]));
  LALFA_4.Caption := LeeParametro(format('ARTDESC%3.3d', [4]));
  LALFA_5.Caption := LeeParametro(format('ARTDESC%3.3d', [5]));
  LALFA_6.Caption := LeeParametro(format('ARTDESC%3.3d', [6]));
  LALFA_7.Caption := LeeParametro(format('ARTDESC%3.3d', [7]));
  LALFA_8.Caption := LeeParametro(format('ARTDESC%3.3d', [8]));

  GetBitmapFromImageList(SBCamiarPrecio, 1, DMMain.ILMain_Ac, 33);
  GetBitmapFromImageList(SBCamiarPrecio, 2, DMMain.ILMain_In, 33);
end;

procedure TFMModelosTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(dm);
end;

procedure TFMModelosTallas.DBEFFamiliaChange(Sender: TObject);
begin
  inherited;
  ETituloFamilia.Text := DameTituloFamilia(DBEFFamilia.Text);
  ETitSubfamilia.Text := DameTituloSubfamilia(DBEFSubfamilia.Text, DBEFFamilia.Text);
end;

procedure TFMModelosTallas.DBEProveedorChange(Sender: TObject);
begin
  inherited;
  DBDProveedor.ActualizaDatos('PROVEEDOR', DBEProveedor.Text);
end;

procedure TFMModelosTallas.DBETipo_ivaChange(Sender: TObject);
begin
  inherited;
  DBDTipoIVA.ActualizaDatos('TIPO_IVA', DBETipo_iva.Text);
end;

procedure TFMModelosTallas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  TFBusca.Create(Self).SeleccionaBusqueda(CEMain, dm.QMart_articulos_modelos,
     '10000');
end;

procedure TFMModelosTallas.DBEFid_g_tChange(Sender: TObject);
begin
  inherited;
  DBDGrupoTallas.ActualizaDatos('ID_G_T', DBEFid_g_t.Text);
  EGrupoTalla.Text := DMTallas.DameCodigoGrupoTallas(StrToIntDef(DBEFid_g_t.Text, 0));
end;

procedure TFMModelosTallas.AStockModelosColoresTallasExecute(Sender: TObject);
begin
  if dm.QMver_art_mod_color_edit['ID_A_M_C'] <> null then
     TFMStockTallas.Create(Self).MuestraAMC(dm.QMver_art_mod_color_edit['ID_A_M_C']);
end;

procedure TFMModelosTallas.AStockModelosTallasExecute(Sender: TObject);
begin
  if dm.QMart_articulos_modelos['ID_A_M'] <> null then
     TFMStockTallas.Create(Self).MuestraAM(dm.QMart_articulos_modelos['ID_A_M']);
end;

procedure TFMModelosTallas.TSPreciosExit(Sender: TObject);
begin
  inherited;
  dm.CerrarPrecios;
end;

procedure TFMModelosTallas.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSPrecios) then
  begin
     ControlEdit := CEPrecios;
     TCTipoPrecios.TabIndex := 1;
     EFTarifas.Text := ''; // REntorno.TarifaDefecto;
     EFTarifas.Text := DBEFTarifaDefecto.Text; // REntorno.TarifaDefecto;
     TCTipoPreciosChange(Sender);
     DMTallas.SetCaptions(dm.QMart_articulos_modelos['ID_G_T'], DBGFPrecios);
     RefrescarImagen(Imagen, dm.QMart_articulos_modelos.FieldByName('IMAGEN').AsInteger);
  end;
end;

procedure TFMModelosTallas.TCTipoPreciosChange(Sender: TObject);
begin
  inherited;
  dm.AbrirPrecios(TCTipoPrecios.TabIndex, EFTarifas.Text);

  // Con el DOCPCTA001 siempre deben ser visibles.
  // DOCPCTA001 - Utiliza precios de coste en ART_ARTICULOS_TARIFAS
  if (LeeParametro('DOCPCTA001') <> 'S') then
  begin
     EFTarifas.Visible := (TCTipoPrecios.TabIndex = 1);
     LTarifa.Visible := EFTarifas.Visible;
     ETituloTarifa.Visible := EFTarifas.Visible;
  end;
end;

procedure TFMModelosTallas.EFTarifasExiste(Sender: TObject);
begin
  dm.AbrirPrecios(TCTipoPrecios.TabIndex, EFTarifas.Text);
  // dm.LocateTarifa(EFTarifas.Text);
  ETituloTarifa.Text := DameTituloTarifa(EFTarifas.Text);
end;

procedure TFMModelosTallas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  case PCMain.TabIndex of
     1:
     begin
        // dm.AbrirPrecios(TCTipoPrecios.TabIndex,EFTarifas.Text);
        // HYDBDescripcion5.ActualizaDatos('TARIFA',EFTarifas.Text);
        DMTallas.SetCaptions(dm.QMart_articulos_modelos['ID_G_T'], DBGFPrecios);
     end;
  end;
end;

procedure TFMModelosTallas.AParametrizaExecute(Sender: TObject);
begin
  FMParamArticulos := TFMParamArticulos.Create(Self);
  FMParamArticulos.FiltraCodigo(DBEFCod_estructura.Text);
end;

procedure TFMModelosTallas.DBEFCod_estructuraChange(Sender: TObject);
begin
  // HYDBTitulo_estructura.ActualizaDatos('COD_MODELO',DBEFCod_estructura.Text);
end;

procedure TFMModelosTallas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // Quito filtros anteriores
  DM.FiltraModelo('');
  G2KTableLoc.Click;
end;

procedure TFMModelosTallas.ACreaArticulosExecute(Sender: TObject);
begin
  inherited;
  dm.CreaArticulosModelo;
  AFiltraArticulos.Execute;
end;

procedure TFMModelosTallas.AFiltraArticulosExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos,
     'ID_A IN ( ' +
     'SELECT ID_A FROM ART_ARTICULOS A ' +
     'JOIN ART_ARTICULOS_M_C_TALLAS T ' +
     'ON A.ID_A_M_C_T = T.ID_A_M_C_T ' +
     'JOIN ART_ARTICULOS_MOD_COLOR C ' +
     'ON T.ID_A_M_C = C.ID_A_M_C ' +
     'WHERE C.ID_A_M=' + IntToStr(dm.QMart_articulos_modelosID_A_M.AsInteger) + ')');
end;

procedure TFMModelosTallas.DBEFFamiliaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFFamilia.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMModelosTallas.DBCBPvpTallaChange(Sender: TObject);
begin
  inherited;
  if DBCBPvpTalla.Checked then
  begin
     DBEPVenta.Enabled := False;
     DBEPVenta.Color := clInactiveBorder;
  end
  else
  begin
     DBEPVenta.Enabled := True;
     DBEPVenta.Color := clWindow;
  end;
end;

procedure TFMModelosTallas.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMModelosTallas.FormShow(Sender: TObject);
begin
  inherited;
  ReparaGrid;
  RefrescarImagen(Imagen, dm.QMart_articulos_modelos.FieldByName('IMAGEN').AsInteger);
end;

procedure TFMModelosTallas.AFiltraEscandallosProdExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF,
     'compuesto like ''' + Trim(DBERef_proveedor.Text) + '%''');
end;

procedure TFMModelosTallas.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  ECliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0));
end;

procedure TFMModelosTallas.DBEFTarifaDefectoChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBEFTarifaDefecto.Text) > '') then
  begin
     // Moneda y Titulo de la tarifa por defecto
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO, MONEDA FROM ART_TARIFAS_C WHERE EMPRESA = ?EMPRESA AND TARIFA = ?TARIFA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TARIFA'].AsString := DBEFTarifaDefecto.Text;
           ExecQuery;
           ETarifaDefecto.Text := FieldByName['TITULO'].AsString;
           EMonedaTarifaDefecto.Text := FieldByName['MONEDA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Precio del primer artículo del modelo
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 PRECIO_VENTA FROM ART_TARIFAS_PRECIOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' TARIFA = ?TARIFA AND ');
           SQL.Add(' ARTICULO = ');
           SQL.Add(' ( ');
           SQL.Add(' SELECT FIRST 1 T.ARTICULO FROM ');
           SQL.Add(' ART_ARTICULOS_MOD_COLOR C ');
           SQL.Add(' LEFT JOIN ART_ARTICULOS_M_C_TALLAS T ');
           SQL.Add(' ON T.ID_A_M_C = C.ID_A_M_C ');
           SQL.Add(' WHERE C.ID_A_M = ?ID_A_M ');
           SQL.Add(' ORDER BY T.ARTICULO ');
           SQL.Add(' ) ');
           SQL.Add(' ORDER BY LINEA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TARIFA'].AsString := DBEFTarifaDefecto.Text;
           Params.ByName['ID_A_M'].AsInteger := dm.QMart_articulos_modelosID_A_M.AsInteger;
           ExecQuery;
           dm.QMart_articulos_modelosP_VENTA.AsFloat := FieldByName['PRECIO_VENTA'].AsFloat;
           PrecioTarifaDefecto.Text := FormatFloat(DMMain.MascaraMoneda(EMonedaTarifaDefecto.Text, 1), FieldByName['PRECIO_VENTA'].AsFloat);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     ETarifaDefecto.Text := '';
     EMonedaTarifaDefecto.Text := '';
  end;
end;

procedure TFMModelosTallas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  // DBEPVenta.Visible := (Button in [nbInsert, nbEdit]);
  // PrecioTarifaDefecto.Visible := not DBEPVenta.Visible;

  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);

  if ((Button = nbInsert) and (Param_MODCODI001 <> '')) then
  begin
     DBEFFamilia.SetFocus;
  end;
end;

procedure TFMModelosTallas.DBEFMarcaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFMarca.CondicionBusqueda := '((ID_MARCA=' + IntToStr(REntorno.Empresa * (-1)) + ') OR (ID_MARCA > 0 AND EMPRESA = ' + REntorno.EmpresaStr + '))';
end;

procedure TFMModelosTallas.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  dm.QMart_articulos_modelos.FieldByName('IMAGEN').AsInteger := ImportarImagen('');
end;

procedure TFMModelosTallas.DBEFGaleriaChange(Sender: TObject);
begin
  inherited;
  ETituloGaleria.Text := DameTituloGaleria(StrToIntDef(DBEFGaleria.Text, 0));
end;

procedure TFMModelosTallas.AGaleriaExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFGaleria.Text, -1) > 0) then
     FMain.EjecutaAccion(FMain.AGaleriaImagen, 'ID=' + DBEFGaleria.Text);
end;

procedure TFMModelosTallas.SBAGaleriaDblClick(Sender: TObject);
begin
  inherited;
  AGaleriaExecute(Sender);
end;

procedure TFMModelosTallas.ETituloGaleriaDblClick(Sender: TObject);
begin
  inherited;
  AGaleriaExecute(Sender);
end;

procedure TFMModelosTallas.DBEFSubfamiliaChange(Sender: TObject);
begin
  inherited;
  ETitSubfamilia.Text := DameTituloSubfamilia(DBEFSubfamilia.Text, DBEFFamilia.Text);
end;

procedure TFMModelosTallas.DBEFSubfamiliaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFSubfamilia.CondicionBusqueda := 'ID_FAMILIA = ' + IntToStr(DameIDFamilia(DBEFFamilia.Text));
end;

procedure TFMModelosTallas.Posiciona(RefProveedor: string);
begin
  dm.PosicionaRefProveedor(RefProveedor);
end;

procedure TFMModelosTallas.DBGFDetalleBusqueda(Sender: TObject);
var
  ListaIdColor : string;
begin
  inherited;

  DBGFDetalle.CondicionBusqueda := '';

  if (LeeParametro('TYCCOLO001') = 'S') then
  begin
     // Lista de ID de codigo de color del proveedor o sin proveedor asignado
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CAST(LIST(C.ID_A_C) AS VARCHAR(10000)) LIST ');
           SQL.Add(' FROM ART_COLORES C ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.ID_A_C IN (SELECT ID_A_C ');
           SQL.Add('              FROM ART_COLORES_EMPRESA ');
           SQL.Add('              WHERE ');
           SQL.Add('              EMPRESA = :EMPRESA AND ');
           SQL.Add('              PROVEEDOR = :PROVEEDOR) ');
           SQL.Add(' OR ');
           SQL.Add(' (NOT EXISTS(SELECT ID_A_C ');
           SQL.Add('             FROM ART_COLORES_EMPRESA ');
           SQL.Add('             WHERE ');
           SQL.Add('             EMPRESA = :EMPRESA AND ');
           SQL.Add('             ID_A_C = C.ID_A_C)) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['PROVEEDOR'].AsInteger := StrToIntDef(DBEProveedor.Text, 0);
           ExecQuery;
           ListaIdColor := FieldByName['LIST'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
     DBGFDetalle.CondicionBusqueda := 'ID_A_C IN (' + ListaIdColor + ')';
  end;
end;

procedure TFMModelosTallas.FiltraModelo(aFiltro: string);
begin
  DM.FiltraModelo(aFiltro);
end;

procedure TFMModelosTallas.AAdjuntosModelosExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('MOD', dm.QMart_articulos_modelosID_A_M.AsInteger);
end;

procedure TFMModelosTallas.AActuArticulosExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
  begin
     dm.ActualizaAlfasArticulosModelo;
     AFiltraArticulos.Execute;
  end;
end;

procedure TFMModelosTallas.ABorraArticulosExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
  begin
     if ConfirmaGrave then
     begin
        dm.BorrarArticulosModelo;
     end;
  end;
end;

procedure TFMModelosTallas.ReparaGrid;
var
  i : smallint;
begin
  // Se asigna nombre a campos ALFA
  with DBGFDetalle do
  begin
     for i := 1 to 8 do
     begin
        if (EncuentraField(DBGFDetalle, Format('ALFA_%d', [i])) >= 0) then
        begin
           FindColumn(Format('ALFA_%d', [i])).Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
           if (FindColumn(Format('ALFA_%d', [i])).Title.Caption = '') then
           begin
              FindColumn(Format('ALFA_%d', [i])).Title.Caption := Format(_('Campo %d'), [i]);
              FindColumn(Format('ALFA_%d', [i])).Width := 100;
           end;
        end;
     end;
  end;
end;

procedure TFMModelosTallas.DBCHKBajaChange(Sender: TObject);
begin
  inherited;
  DBDTPFechaBaja.Visible := DBCHKBaja.Checked;
end;

procedure TFMModelosTallas.AActuColoresExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
     dm.ActualizaAlfasColoresModelo;
end;

procedure TFMModelosTallas.ADuplicaModeloExecute(Sender: TObject);
var
  RefProveedor : string;
begin
  inherited;
  RefProveedor := InputBox(_('Codigo modelo'), _('Asigne un codigo al nuevo modelo'), '');
  if (Trim(RefProveedor) > '') then
     DM.DuplicaModelo(Trim(RefProveedor));
end;

procedure TFMModelosTallas.BClipboardClick(Sender: TObject);
begin
  inherited;
  dm.QMart_articulos_modelos.FieldByName('IMAGEN').AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMModelosTallas.SBCamiarPrecioClick(Sender: TObject);
var
  Importe : double;
begin
  inherited;
  // Cambiar todos los precios de la tarifa actual
  Importe := 0;
  if PideDato('DBL', Importe, _('Importe')) then
  begin
     if ConfirmaMensajeCaption(_('Esta seguro de que quiere modificar el precio de todos los colores/tallas de esta tarifa ?'), '') then
        dm.ModificaPrecioTarifa(Importe);
  end;
end;

procedure TFMModelosTallas.DBEFGeneroChange(Sender: TObject);
begin
  inherited;
  ETituloGenero.Text := DameTituloArtModGenero(DBEFGenero.Text);
end;

procedure TFMModelosTallas.DBEFTemporadaChange(Sender: TObject);
begin
  inherited;
  ETituloTemporada.Text := DameTituloArtModTemporada(DBEFTemporada.Text);
end;

procedure TFMModelosTallas.ACreaArticulosTodosExecute(Sender: TObject);
begin
  inherited;
  PMain.Enabled := False;
  PDetalle.Enabled := False;
  TBActions.Enabled := False;
  try
     with (dm.QMart_articulos_modelos) do
     begin
        First;
        while not EOF do
        begin
           // Crea articulos sin preguntar colores y tallas.
           dm.CreaArticulosModelo(True);
           Next;
           Application.ProcessMessages;
        end;
     end;
  finally
     PMain.Enabled := True;
     PDetalle.Enabled := True;
     TBActions.Enabled := True;
  end;
end;

procedure TFMModelosTallas.DBENumeroCombinacionesDblClick(Sender: TObject);
begin
  inherited;
  AFiltraArticulos.Execute;
end;

procedure TFMModelosTallas.SBAFiltraArticulosDblClick(Sender: TObject);
begin
  inherited;
  AFiltraArticulos.Execute;
end;

procedure TFMModelosTallas.DBEFFamiliaTejidoChange(Sender: TObject);
begin
  inherited;
  EFamiliaTejido.Text := DameTituloFamilia(DBEFFamiliaTejido.Text);
end;

procedure TFMModelosTallas.DBEFFamiliaTejidoExiste(Sender: TObject);
begin
  inherited;
  EFamiliaTejido.Text := DameTituloFamilia(DBEFFamiliaTejido.Text);
end;

procedure TFMModelosTallas.DBEFArticuloEstructuraChange(Sender: TObject);
begin
  inherited;
  EArticuloEstructura.Text := DameTituloArticulo(DBEFArticuloEstructura.Text);

  // Cambio color si no existe el articulo
  if (DBEFArticuloEstructura.Text > '') then
  begin
     if (EArticuloEstructura.Text > '') then
        ColorInfo(EArticuloEstructura)
     else
        ColorResaltado3(EArticuloEstructura);
  end
  else
     ColorInfo(EArticuloEstructura);
end;

procedure TFMModelosTallas.DBEFArticuloEstructuraExiste(Sender: TObject);
begin
  inherited;
  EArticuloEstructura.Text := DameTituloArticulo(DBEFArticuloEstructura.Text);

  // Cambio color si no existe el articulo
  if (DBEFArticuloEstructura.Text > '') then
  begin
     if (EArticuloEstructura.Text > '') then
        ColorInfo(EArticuloEstructura)
     else
        ColorResaltado3(EArticuloEstructura);
  end
  else
     ColorInfo(EArticuloEstructura);
end;

procedure TFMModelosTallas.DBEFArticuloConfeccionChange(Sender: TObject);
begin
  inherited;
  EArticuloConfeccion.Text := DameTituloArticulo(DBEFArticuloConfeccion.Text);

  // Cambio color si no existe el articulo
  if (DBEFArticuloConfeccion.Text > '') then
  begin
     if (EArticuloConfeccion.Text > '') then
        ColorInfo(EArticuloConfeccion)
     else
        ColorResaltado3(EArticuloConfeccion);
  end
  else
     ColorInfo(EArticuloConfeccion);
end;

procedure TFMModelosTallas.DBEFArticuloConfeccionExiste(Sender: TObject);
begin
  inherited;
  EArticuloConfeccion.Text := DameTituloArticulo(DBEFArticuloConfeccion.Text);

  // Cambio color si no existe el articulo
  if (DBEFArticuloConfeccion.Text > '') then
  begin
     if (EArticuloConfeccion.Text > '') then
        ColorInfo(EArticuloConfeccion)
     else
        ColorResaltado3(EArticuloConfeccion);
  end
  else
     ColorInfo(EArticuloConfeccion);
end;

procedure TFMModelosTallas.DBEFArticuloEstructuraBusqueda(Sender: TObject);
begin
  inherited;
  DBEFArticuloEstructura.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMModelosTallas.DBEFArticuloConfeccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFArticuloConfeccion.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMModelosTallas.DBERef_proveedorExit(Sender: TObject);
begin
  inherited;
  if (Param_MODCODI002 = '') and (dm.QMart_articulos_modelosBASE_CREACION.AsString = '') then
     dm.QMart_articulos_modelosBASE_CREACION.AsString := DBERef_proveedor.Text;
end;

procedure TFMModelosTallas.DBETituloEnter(Sender: TObject);
begin
  inherited;
  if ((DBETitulo.Text = '') and (Param_MODCODI001 <> '')) then
     DBETitulo.Text := Trim(ETituloFamilia.Text + ' ' + ETitSubfamilia.Text);
end;

procedure TFMModelosTallas.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('MOD', dm.QMart_articulos_modelosID_A_M.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosModelos.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

end.
