unit UObrFMObras;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, DBCtrls, ULFDBMemo, Mask,
  ULFDBEdit, ULFLabel, UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox,
  DbComboBoxValue;

type
  TObrFMObras = class(TFPEdit)
     TSNotas: TTabSheet;
     PNLNotas: TLFPanel;
     LFDBNotas: TLFDBMemo;
     TSDibujo: TTabSheet;
     TBDibujo: TLFToolBar;
     NavDibujo: THYMNavigator;
     TSDetObra: TTabSheet;
     LFPanelDetPartida: TLFPanel;
     PCDetallePartida: TLFPageControl;
     TSPartida: TTabSheet;
     TSNotasPartida: TTabSheet;
     TBNotasPartida: TLFToolBar;
     NavPartidaNotas: THYMNavigator;
     PNLNotasPartida: TLFPanel;
     LFDbNotasPartidas: TLFDBMemo;
     PNLDetalle: TLFPanel;
     PCSubDetalle: TLFPageControl;
     TSDetCostAlbCli: TTabSheet;
     TSDetCostProd: TTabSheet;
     TSDetCostVar: TTabSheet;
     TSDetIngre: TTabSheet;
     TSDetCostAlbProv: TTabSheet;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     TBNotas: TLFToolBar;
     NavNotas: THYMNavigator;
     CENotasPartida: TControlEdit;
     CENotasPartidaPMEdit: TPopUpTeclas;
     TBPartida: TLFToolBar;
     NavPartidas: THYMNavigator;
     CEPartidas: TControlEdit;
     CEPartidasPMEdit: TPopUpTeclas;
     PNLPartidas: TLFPanel;
     LObra: TLFLabel;
     LFDBObra: TLFDbedit;
     LDescripcion: TLFLabel;
     LFDBDescrip: TLFDbedit;
     LCliente: TLFLabel;
     LFDBCliente: TLFDBEditFind2000;
     DescCliente: TLFHYDBDescription;
     LDireccion: TLFLabel;
     LFDBDireccion: TLFDBEditFind2000;
     DescDireccion: TLFHYDBDescription;
     LFechaInicio: TLFLabel;
     LFDBFechaIni: TLFDBDateEdit;
     LFechaPrevCierre: TLFLabel;
     LFDBFechaPrevCierre: TLFDBDateEdit;
     LFechaCierre: TLFLabel;
     LFDBFechaCierre: TLFDBDateEdit;
     LFCBEstado: TLFDBCheckBox;
     LFEchaUltimaImp: TLFLabel;
     LFDBFechaUltImp: TLFDBDateEdit;
     LFCBContAlmacen: TLFDBCheckBox;
     LFDBAlmacen: TLFDBEditFind2000;
     DescAlmacen: TLFHYDBDescription;
     DBCBControlPartidas: TDBComboBoxValue;
     LControlPartida: TLFLabel;
     Imagen: TImage;
     PCCostes: TLFPageControl;
     TScostes: TTabSheet;
     TSArbol: TTabSheet;
     PNLCostes: TLFPanel;
     LMargenBeneficion: TLFLabel;
     LTotalCostes: TLFLabel;
     LCosteAlbaranProv: TLFLabel;
     LCosteTarea: TLFLabel;
     LCosteHoras: TLFLabel;
     LCosteMaterial: TLFLabel;
     LCosteFabricacion: TLFLabel;
     LCosteAlbaran: TLFLabel;
     LPendienteFacturar: TLFLabel;
     LTotalFacturado: TLFLabel;
     LMargenPrevisto: TLFLabel;
     LCostePrevisto: TLFLabel;
     LTotalOIferta: TLFLabel;
     LFDBTotPdteFac: TLFDbedit;
     LFDBTotFacturado: TLFDbedit;
     LFDBTotCostes: TLFDbedit;
     LFDBTotalOferta: TLFDbedit;
     LFDBMargenPrev: TLFDbedit;
     LFDBMargen: TLFDbedit;
     LFDBCostTarea: TLFDbedit;
     LFDBCostPrev: TLFDbedit;
     LFDBCostMat: TLFDbedit;
     LFDBCostHoras: TLFDbedit;
     LFDBCostFab: TLFDbedit;
     LFDBCostAlbProv: TLFDbedit;
     LFDBCostAlb: TLFDbedit;
     CEImagen: TControlEdit;
     CEImagenPMEdit: TPopUpTeclas;
     DBGImagenes: TDBGridFind2000;
     LFDBObraNotas: TLFDbedit;
     ToolButton1: TToolButton;
     LFDBDescNotas: TLFDbedit;
     LFDBDescImagen: TLFDbedit;
     LFDBObraImagen: TLFDbedit;
     ToolButton2: TToolButton;
     PNLImagen: TLFPanel;
     LFDBInfoPartida: TLFDbedit;
     LFDBInfoDescPartida: TLFDbedit;
     ToolButton3: TToolButton;
     LFDBInfoNotasPartida: TLFDbedit;
     LFDBInfoPartidaDesc: TLFDbedit;
     ToolButton4: TToolButton;
     DBGPartida: TDBGridFind2000;
     TBCostaAlbCli: TLFToolBar;
     PNLCostAlbCli: TLFPanel;
     NavCostaAlbCli: THYMNavigator;
     TBCostProd: TLFToolBar;
     TBCostesVarios: TLFToolBar;
     TBIngresos: TLFToolBar;
     TBCostProv: TLFToolBar;
     PNLCostProd: TLFPanel;
     PNLCostVar: TLFPanel;
     PNLIngresos: TLFPanel;
     PNLCostAlbProv: TLFPanel;
     NavCostProv: THYMNavigator;
     NavIngresos: THYMNavigator;
     NavCostesVarios: THYMNavigator;
     NavCostProd: THYMNavigator;
     DBGCostAlbCli: TDBGridFind2000;
     DBGCostProd: TDBGridFind2000;
     DBGCostVarios: TDBGridFind2000;
     DBGIngresos: TDBGridFind2000;
     DBGCostAlbaranProv: TDBGridFind2000;
     CECostAlbCli: TControlEdit;
     CECostAlbCliPMEdit: TPopUpTeclas;
     CECostesProd: TControlEdit;
     CECostesProdPMEdit: TPopUpTeclas;
     CECostVarios: TControlEdit;
     CECostVariosPMEdit: TPopUpTeclas;
     CEIngresos: TControlEdit;
     CEIngresosPMEdit: TPopUpTeclas;
     CECostAlbProv: TControlEdit;
     CECostAlbProvPMEdit: TPopUpTeclas;
     LMargenPrevistoPorc: TLFLabel;
     LFDBMargenPrev100: TLFDbedit;
     AListado: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AProConfig: TAction;
     Arbol: TTreeView;
     TBArbol: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure LFDBClienteChange(Sender: TObject);
     procedure LFDBDireccionBusqueda(Sender: TObject);
     procedure LFDBDireccionChange(Sender: TObject);
     procedure LFDBAlmacenChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGCostAlbCliBusqueda(Sender: TObject);
     procedure DBGCostAlbCliDblClick(Sender: TObject);
     procedure DBGCostProdBusqueda(Sender: TObject);
     procedure DBGCostProdDblClick(Sender: TObject);
     procedure DBGCostAlbaranProvBusqueda(Sender: TObject);
     procedure DBGCostAlbaranProvDblClick(Sender: TObject);
     procedure DBGIngresosBusqueda(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBGIngresosDblClick(Sender: TObject);
     procedure AListadoExecute(Sender: TObject);
     procedure AProConfigExecute(Sender: TObject);
     procedure LFCBContAlmacenChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure TBArbolClick(Sender: TObject);
     procedure PCCostesChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ArbolObr;
  end;

var
  ObrFMObras : TObrFMObras;

implementation

uses UDMMain, UFormGest, UObrDMObras, UFMain, UEntorno, UDMListados, UFMListconfig, UUtiles;

{$R *.dfm}

procedure TObrFMObras.FormCreate(Sender: TObject);
var
  i : smallint;
begin
  inherited;
  AbreData(TObrDMObras, ObrDMObras);

  NavMain.DataSource := ObrDMObras.DSCabObras;
  DBGMain.DataSource := ObrDMObras.DSCabObras;
  G2KTableLoc.DataSource := ObrDMObras.DSCabObras;

  PCMain.ActivePage := TSFicha;
  PCDetallePartida.ActivePage := TSPartida;
  PCSubDetalle.ActivePage := TSDetCostAlbCli;
  PCCostes.ActivePage := TSCostes;

  i := EncuentraField(DBGCostAlbCli, 'RIG');
  DBGCostAlbCli.Columns[i].Color := REntorno.ColorEnlaceActivo;
  i := EncuentraField(DBGCostProd, 'RIG');
  DBGCostProd.Columns[i].Color := REntorno.ColorEnlaceActivo;
  i := EncuentraField(DBGCostAlbaranProv, 'RIG');
  DBGCostAlbaranProv.Columns[i].Color := REntorno.ColorEnlaceActivo;
  i := EncuentraField(DBGIngresos, 'RIG');
  DBGIngresos.Columns[i].Color := REntorno.ColorEnlaceActivo;

  DBCBControlPartidas.Enabled := False;
  // LFDBAlmacen.Enabled := False;
end;

procedure TObrFMObras.LFDBClienteChange(Sender: TObject);
begin
  inherited;
  DescCliente.ActualizaDatos('CLIENTE', LFDBCliente.Text);
end;

procedure TObrFMObras.LFDBDireccionBusqueda(Sender: TObject);
begin
  inherited;
  LFDBDireccion.CondicionBusqueda := 'TERCERO=' + ObrDMObras.QMCabObrasTERCERO.AsString;
end;

procedure TObrFMObras.LFDBDireccionChange(Sender: TObject);
begin
  inherited;
  DescDireccion.ActualizaDatos('DIRECCION', LFDBDireccion.Text);
end;

procedure TObrFMObras.LFDBAlmacenChange(Sender: TObject);
begin
  inherited;
  DescAlmacen.ActualizaDatos('ALMACEN', LFDBAlmacen.Text);
end;

procedure TObrFMObras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ObrDMObras);
end;

procedure TObrFMObras.DBGCostAlbCliBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGCostalbCli.TablaABuscar) = 'VER_CABECERAS_ALBARAN' then
     DBGCostalbCli.CondicionBusqueda := 'SERIE =''' + ObrDMObras.QMDetCostAlbCliSERIE.AsString + '''' +
        ' AND CLIENTE=' + IntToStr(StrToIntDef(LFDBCliente.Text, 0))
  else
     DBGCostalbCli.CondicionBusqueda := '';
end;

procedure TObrFMObras.DBGCostAlbCliDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(DBGCostAlbCli.ColumnaActual) = 'RIG') then
     FMain.MuestraDocumento(ObrDMObras.QMDetCostAlbCliEJERCICIO_ALB.AsInteger,
        'ALB',
        ObrDMObras.QMDetCostAlbCliSERIE.AsString,
        ObrDMObras.QMDetCostAlbCliRIG.AsInteger);
end;

procedure TObrFMObras.DBGCostProdBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGCostProd.TablaABuscar) = 'PRO_ORD' then
     DBGCostProd.CondicionBusqueda := 'SERIES =''' + REntorno.Serie + '''' +
        ' AND CLIENTE=' + IntToStr(StrToIntDef(LFDBCliente.Text, 0));
end;

procedure TObrFMObras.DBGCostProdDblClick(Sender: TObject);
begin
  inherited;
  // if ProDMEscandallo.HayMateriales then
  //  begin
  if (UpperCase(DBGCostProd.ColumnaActual) = 'RIG') then
     FMain.EjecutaAccion(FMain.AProOrden, ObrDMObras.QMDetCostProdID_ORDEN.AsString);
  //  end;
end;

procedure TObrFMObras.DBGCostAlbaranProvBusqueda(Sender: TObject);
begin
  inherited;

  if Trim(DBGCostAlbaranProv.TablaABuscar) = 'VER_CABECERAS_ALBARAN_PROV' then
     DBGCostAlbaranProv.CondicionBusqueda := 'SERIE =''' + ObrDMObras.QMDetCostAlbProvSERIE.AsString + ''''
  else
     DBGCostAlbaranProv.CondicionBusqueda := '';

  if Trim(DBGCostAlbaranProv.TablaABuscar) = 'VER_DETALLE_ALBARAN_PROV' then
  begin
     DBGCostAlbaranProv.CondicionBusqueda := 'SERIE =''' + ObrDMObras.QMDetCostAlbProvSERIE.AsString + '''';
     DBGCostAlbaranProv.CondicionBusqueda := 'RIG =' + IntToStr(ObrDMObras.QMDetCostAlbProvRIG.AsInteger);
  end
  else
     DBGCostAlbaranProv.CondicionBusqueda := '';
end;

procedure TObrFMObras.DBGCostAlbaranProvDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(DBGCostAlbaranprov.ColumnaActual) = 'RIG') then
     FMain.MuestraDocumento(ObrDMObras.QMDetCostAlbProvEJERCICIO_ALB.AsInteger,
        'ALP',
        ObrDMObras.QMDetCostAlbProvSERIE.AsString,
        ObrDMObras.QMDetCostAlbProvRIG.AsInteger);
end;

procedure TObrFMObras.DBGIngresosBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGIngresos.TablaABuscar) = 'VER_CABECERAS_FACTURA' then
     DBGIngresos.CondicionBusqueda := 'SERIE =''' + ObrDMObras.QMDetIngrSERIE.AsString + '''' +
        ' AND CLIENTE=' + IntToStr(StrToIntDef(LFDBCliente.Text, 0))
  else
     DBGIngresos.CondicionBusqueda := '';
end;

procedure TObrFMObras.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSFicha) then
     if not (ObrDMObras.QMCabObras.IsEmpty) then {dji lrk kri - Si esta vacia Refresh genera error}
        ObrDMObras.QMCabObras.Refresh;
end;

procedure TObrFMObras.DBGIngresosDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(DBGIngresos.ColumnaActual) = 'RIG') then
  begin
     FMain.MuestraDocumento(ObrDMObras.QMDetIngrEJERCICIO_FAC.AsInteger,
        'FAC',
        ObrDMObras.QMDetIngrSERIE.AsString,
        ObrDMObras.QMDetIngrRIG.AsInteger);
  end;
end;

procedure TObrFMObras.AListadoExecute(Sender: TObject);
begin
  inherited;
  ObrDMObras.xLstObras.Close;
  ObrDMObras.xLstObras.Open;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(8032, 0, '', _('Listado Obras'), ObrDMObras.frLstObras, nil);
  CierraData(DMListados);

  ObrDMObras.xLstObras.Close;
end;

procedure TObrFMObras.AProConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8032, Formato, Cabecera, Copias, Pijama, '', ObrDMObras.frLstObras);
end;

procedure TObrFMObras.LFCBContAlmacenChange(Sender: TObject);
begin
  inherited;
  if (ObrDMObras.QMCabObrasCONTROL_ALMACEN.AsInteger = 1) then
     LFDBAlmacen.Enabled := True
  else
     LFDBAlmacen.Enabled := False;
end;

procedure TObrFMObras.FormActivate(Sender: TObject);
begin
  inherited;
  if (ObrDMObras.QMCabObrasCONTROL_ALMACEN.AsInteger = 1) then
     LFDBAlmacen.Enabled := True
  else
     LFDBAlmacen.Enabled := False;
end;

procedure TObrFMObras.ArbolObr;
var
  Nodo, Nodo1, Nodo2, Nodo3 : TTreeNode;
begin
  with ObrDMObras do
  begin
     try
        QMDetObras.DisableControls;
        QMDetCostAlbCli.DisableControls;
        QMDetCostProd.DisableControls;
        QMDetCostVar.DisableControls;
        QMDetIngr.DisableControls;
        QMDetCostAlbProv.DisableControls;

        QMDetObras.Close;
        QMDetObras.Open;

        Arbol.Items.Clear;
        Nodo := Arbol.Items.Add(nil, _('Obra') + '  ' + QMCabObrasCODIGO.AsString);
        Nodo.SelectedIndex := 0;

        Nodo1 := Arbol.Items.AddChild(Nodo, _('Partidas'));

        while not QMDetObras.EOF do
        begin
           // Partida
           Nodo2 := Arbol.Items.AddChild(Nodo1, QMDetObrasPARTIDA.AsString + '  ' +
              QMDetObrasDESCRIPCION.AsString);

           // Titol Coste Albaran Cliente
           Nodo3 := Arbol.Items.AddChild(Nodo2, _('Coste Albaran Cliente'));
           QMDetCostAlbCli.Close;
           QMDetCostAlbCli.Open;

           while not QMDetCostAlbCli.EOF do
           begin
              Arbol.Items.Addchild(Nodo3, Format(_('%d Fecha Alb. Cli: %s Nro. Albaran: %d'), [QMDetCostAlbCliLINEA_DET.AsInteger, DateToStr(QMDetCostAlbCliFECHA.AsDateTime), QMDetCostAlbCliRIG.AsInteger]));
              QMDetCostAlbCli.Next;
           end;

           // Titol Coste Producción
           Nodo3 := Arbol.Items.AddChild(Nodo2, _('Coste Producción'));
           QMDetCostProd.Close;
           QMDetCostProd.Open;

           while not QMDetCostProd.EOF do
           begin
              Arbol.Items.Addchild(Nodo3, Format(_('%d Fecha OF: %s Nro. OF: %d'), [QMDetCostProdLINEA_DET.AsInteger, DateToStr(QMDetCostProdFECHA.AsDateTime), QMDetCostProdRIG.AsInteger]));
              QMDetCostProd.Next;
           end;

           // Titol Coste Varios
           Nodo3 := Arbol.Items.AddChild(Nodo2, _('Coste Varios'));
           QMDetCostVar.Close;
           QMDetCostVar.Open;

           while not QMDetCostVar.EOF do
           begin
              Arbol.Items.Addchild(Nodo3, Format(_('%d Descripción OF: %s Fecha: %d'), [QMDetCostVarLINEA_DET.AsInteger, QMDetCostVarCOMENTARIO, DateToStr(QMDetCostVarFECHA.AsDateTime)]));
              QMDetCostVar.Next;
           end;

           // Titol Coste Albaran Proveedor
           Nodo3 := Arbol.Items.AddChild(Nodo2, _('Coste Albaran Proveedor'));
           QMDetCostAlbProv.Close;
           QMDetCostAlbProv.Open;

           while not QMDetCostAlbProv.EOF do
           begin
              Arbol.Items.Addchild(Nodo3, Format(_('%d Fecha Alb. Prov: %s Nro. Albaran: %d'), [QMDetCostAlbProvLINEA_DET.AsInteger, (QMDetCostAlbProvFECHA.AsDateTime), QMDetCostAlbProvRIG.AsInteger]));
              QMDetCostAlbProv.Next;
           end;

           // Titol Facturacion
           Nodo3 := Arbol.Items.AddChild(Nodo2, _('Facturación'));
           QMDetIngr.Close;
           QMDetIngr.Open;

           while not QMDetIngr.EOF do
           begin
              Arbol.Items.Addchild(Nodo3, Format(_('%d Fecha Factura: %s Nro. Factura: %d'), [QMDetIngrLINEA_DET.AsInteger, (QMDetIngrFECHA.AsDateTime), QMDetIngrRIG.AsInteger]));
              QMDetIngr.Next;
           end;

           QMDetObras.Next;
        end;

        Arbol.Items[0].Expand(True);
        Nodo.SelectedIndex := 0;
     finally
        QMDetObras.EnableControls;
        QMDetCostAlbCli.EnableControls;
        QMDetCostProd.EnableControls;
        QMDetCostVar.EnableControls;
        QMDetIngr.EnableControls;
        QMDetCostAlbProv.EnableControls;
     end;
  end;
end;

procedure TObrFMObras.TBArbolClick(Sender: TObject);
begin
  inherited;
  ArbolObr;
end;

procedure TObrFMObras.PCCostesChange(Sender: TObject);
begin
  inherited;
  if (PCCostes.ActivePage = TSArbol) then
     ArbolObr;
end;

procedure TObrFMObras.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
