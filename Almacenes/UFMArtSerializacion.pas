unit UFMArtSerializacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, Barras, ActnList, URecursos, DB, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBMemo, ULFDBEdit, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  ULFEditFind2000, ULFFIBDBEditFind, ULFDBDateEdit, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMArtSerializacion = class(TFPEdit)
     LBLCodigo: TLFLabel;
     LBLNSerie: TLFLabel;
     LBLAlmacen: TLFLabel;
     DBECodigo: TLFDbedit;
     ETitAlmacen: TLFEdit;
     DMMMNotas: TLFDBMemo;
     GBFechas: TGroupBox;
     LBLFechaCaducidad: TLFLabel;
     DBDTPGarProv: TLFDBDateEdit;
     LBLGarantiaCli: TLFLabel;
     DBDTPFechaCad: TLFDBDateEdit;
     LBLFinGarantiaProv: TLFLabel;
     DBDTPGarCliente: TLFDBDateEdit;
     GBBarras: TGroupBox;
     ICodBarras: TImage;
     LBLNotas: TLFLabel;
     LBLArticulo: TLFLabel;
     ETitArticulo: TLFEdit;
     CodBarras: TCodeBar;
     DBEFNSerie: TLFDBEditFind2000;
     ARestoSeries: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AAnyadirEtiquetas: TAction;
     AImpresion: TAction;
     LFCategoryAction2: TLFCategoryAction;
     LFBuscarSerie: TLFEditFind2000;
     LBuscaSerie: TLFLabel;
     LBuscaArticulo: TLFLabel;
     LFBuscarArticulo: TLFEditFind2000;
     PDetalle: TLFPanel;
     DBEArticulo: TLFFibDBEditFind;
     DBEAlmacen: TLFDBEditFind2000;
     LFPanelOrigen: TLFPanel;
     DBGOrigen: TDBGridFind2000;
     DBGDestino: TDBGridFind2000;
     MainMenu1: TMainMenu;
     LFPanelDest: TLFPanel;
     TBDestino: TLFToolBar;
     TBOrigen: TLFToolBar;
     NavOrigen: THYMNavigator;
     NavDestino: THYMNavigator;
     ALstSerializacion: TAction;
     LClienteReparacion: TLFLabel;
     DBECliRepara: TLFDbedit;
     DescCliente: TLFDbedit;
     PNLFiltroArticuloSerie: TLFPanel;
     CKEstado: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBENSerieChange(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFNSerieChange(Sender: TObject);
     procedure DBEFNSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ARestoSeriesExecute(Sender: TObject);
     procedure AAnyadirEtiquetasExecute(Sender: TObject);
     procedure AImpresionExecute(Sender: TObject);
     procedure DBEFNSerieBusqueda(Sender: TObject);
     procedure LFBuscarSerieChange(Sender: TObject);
     procedure DBEAlmacenBusqueda(Sender: TObject);
     procedure DBGOrigenDblClick(Sender: TObject);
     procedure DBGDestinoDblClick(Sender: TObject);
     procedure ALstSerializacionExecute(Sender: TObject);
     procedure DBECliReparaChange(Sender: TObject);
     procedure DBEArticuloChange(Sender: TObject);
     procedure DBEAlmacenChange(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure LFBuscarSerieBusqueda(Sender: TObject);
  private
     { Private declarations }
     procedure PintaCodigoBarras;
  public
     { Public declarations }
     procedure FiltraSerie(FiltroAccion: string);//sfg.albert
  end;

var
  FMArtSerializacion : TFMArtSerializacion;

procedure MuestraSerializacion(Ejercicio: smallint; Serie, tipo, Almacen, Articulo: string; Rig, linea, devolucion: integer; Fecha: TDateTime; Unidades: double; estado: integer; padre: TComponent);

implementation

uses UDMArtSerializacion, UFormGest, UDMMain, UFPregSerializacion, UEntorno, UDameDato, UFMain,
  UFPregLstSerializacion, UParam;

{$R *.DFM}

procedure MuestraSerializacion(Ejercicio: smallint; Serie, tipo, Almacen, Articulo: string; Rig, linea, devolucion: integer; Fecha: TDateTime; Unidades: double; estado: integer; padre: TComponent);
var
  FMArtSerializacion : TFMArtSerializacion;
begin
  FMArtSerializacion := TFMArtSerializacion.Create(padre);
  try
     DMArtSerializacion.AbreDatos(Ejercicio, Serie, Tipo, Almacen, Articulo, Rig,
        Linea, Devolucion, Fecha, Unidades, Estado);
     if (Estado = 5) then
     begin
        // FMArtSerializacion.TButtGeneraResto.Enabled := False;
        FMArtSerializacion.NavMain.VisibleButtons :=
           FMArtSerializacion.NavMain.VisibleButtons - [nbInsert, nbEdit, nbDelete];
     end;

     {  if ((Tipo = 'MVE') or (Tipo = 'MVS')) then
     FMArtSerializacion.LBLFechaAlbaran.Caption := _('Fecha entrada')
  else
     FMArtSerializacion.LBLFechaAlbaran.Caption := _('Fecha albaran');
 }
     FMArtSerializacion.ShowModal;
  finally
     FMArtSerializacion.Free;
  end;
end;

procedure TFMArtSerializacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMArtSerializacion, DMArtSerializacion);
  NavMain.DataSource := DMArtSerializacion.DSQMArtSerializacion;
  DBGMain.DataSource := DMArtSerializacion.DSQMArtSerializacion;
  DBGOrigen.DataSource := DMArtSerializacion.DSxOrigen;
  DBGDestino.DataSource := DMArtSerializacion.DSxDestino;
  ControlEdit := CEMain;
  CEMain.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  // Hojas de preparacion de pedidos
  if (LeeParametro('HOJAPRE001') = '0') then
  begin
     DBECliRepara.Visible := False;
     DescCliente.Visible := False;
     LClienteReparacion.Visible := False;
  end
  else
  begin
     DBECliRepara.Visible := True;
     DescCliente.Visible := True;
     LClienteReparacion.Visible := True;
  end;

  DBEArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' AND SERIALIZADO=1';
  LFBuscarArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' AND SERIALIZADO=1';
end;

procedure TFMArtSerializacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMArtSerializacion);
end;

procedure TFMArtSerializacion.PintaCodigoBarras;
var
  Dibujar : boolean;
begin
  ICodBarras.Picture := nil;
  with CodBarras do
  begin
     Dibujar := True;
     codigo := DBEFNSerie.Text; //DMArtSerializacion.DameSerie;
     if (codigo <> '') then
     begin
        VerTexto := cboCodigo;
        Texto := '*' + CodBarras.codigo + '*';
        Alto := 60;
        Porcentaje := 10;
        Modulo := 1;
        ChequearDigito := True;
        Tipo := cb128;
        OrigenX := (ICodBarras.Width div 2) - (CodBarras.Ancho div 2);
        OrigenY := 15;
        Ratio := 2;
        Fuente.Size := 8;
     end
     else
        Dibujar := False;
  end;
  if (Dibujar) then
     CodBarras.DibujaCodeBar(ICodBarras.Canvas);
  ICodBarras.Refresh;
end;

procedure TFMArtSerializacion.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if Button = nbInsert then
  begin
     DBEFNSerie.Enabled := True;
     DBEFNSerie.Font.Color := clWindowText;
     DBEFNSerie.Color := clWindow;
  end
  else
  begin
     DBEFNSerie.Enabled := False;
     DBEFNSerie.Font.Color := clGrayText;
     DBEFNSerie.Color := clInfobk;
  end;

  if Button = nbPost then
  begin
     if TBMain.CanFocus then
        TBMain.SetFocus;
  end;
end;

procedure TFMArtSerializacion.DBENSerieChange(Sender: TObject);
begin
  PintaCodigoBarras;
end;

procedure TFMArtSerializacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMArtSerializacion.BusquedaCompleja;
end;

procedure TFMArtSerializacion.DBEFNSerieChange(Sender: TObject);
begin
  PintaCodigoBarras;
end;

procedure TFMArtSerializacion.DBEFNSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Codigo, Contador : integer;
  CodigoStr : string;
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
     try
        DMArtSerializacion.DameCodigo(Codigo, Contador, CodigoStr);
        PintaCodigoBarras;
     except
     end;
  end;
end;

procedure TFMArtSerializacion.ARestoSeriesExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DMArtSerializacion.GeneraResto;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMArtSerializacion.AAnyadirEtiquetasExecute(Sender: TObject);
var
  Contador : integer;
  Marca : TBookmark;
begin
  inherited;
  if DBGMain.SelectedRows.Count > 0 then
  begin
     with DMArtSerializacion.QMArtSerializacion do
     begin
        DisableControls;
        Marca := GetBookmark;
        try
           // with DBGMain.SelectedRows do
           for contador := 0 to DBGMain.SelectedRows.Count - 1 do
           begin
              //  DBGMain.SelectedRows.Items[Contador];
              Bookmark := DBGMain.SelectedRows.Items[Contador];
              DMArtSerializacion.AnyadeEtiquetas(ETitArticulo.Text, DMArtSerializacion.QMArtSerializacionNSERIE.AsString);
           end;
           GotoBookmark(Marca);
        finally
           EnableControls;
           FreeBookmark(Marca);
        end;
     end;
  end;
end;

procedure TFMArtSerializacion.AImpresionExecute(Sender: TObject);
begin
  inherited;
  TFPregSerializacion.Create(Self).ShowModal;
end;

procedure TFMArtSerializacion.DBEFNSerieBusqueda(Sender: TObject);
begin
  DBEFNSerie.CondicionBusqueda := 'CANAL = ' + IntToStr(DMArtSerializacion.CanalDat) +
     ' AND ARTICULO = ''' + DMArtSerializacion.ArticuloDat +
     ''' ' + DMArtSerializacion.AlmacenOrigen +
     ' AND ACTIVO = 1 ' + DMArtSerializacion.EstadoSer;
end;

procedure TFMArtSerializacion.LFBuscarSerieChange(Sender: TObject);
begin
  inherited;
  DMArtSerializacion.FiltraSeries(LFBuscarArticulo.Text, LFBuscarSerie.Text);
end;

procedure TFMArtSerializacion.DBEAlmacenBusqueda(Sender: TObject);
begin
  inherited;
  // DBEAlmacen.CondicionBusqueda:='empresa='+REntorno.EmpresaStr;
end;

procedure TFMArtSerializacion.DBGOrigenDblClick(Sender: TObject);
begin
  inherited;
  if (DMArtSerializacion.xOrigenTIPO.AsString <> 'OP') then
     FMain.MuestraDocumento(DMArtSerializacion.xOrigenEJERCICIO.AsInteger,
        DMArtSerializacion.xOrigenTIPO.AsString,
        DMArtSerializacion.xOrigenSERIE.AsString,
        DMArtSerializacion.xOrigenRIG.AsInteger)
  else if (DMArtSerializacion.xOrigenTIPO.AsString = 'OP') then
     FMain.EjecutaAccion(FMain.AProOrden, DMArtSerializacion.xOrigenID_ORDEN.AsString);
end;

procedure TFMArtSerializacion.DBGDestinoDblClick(Sender: TObject);
begin
  inherited;
  if (DMArtSerializacion.xDestinoTIPO.AsString <> 'OP') then
     FMain.MuestraDocumento(DMArtSerializacion.xDestinoEJERCICIO.AsInteger,
        DMArtSerializacion.xDestinoTIPO.AsString,
        DMArtSerializacion.xDestinoSERIE.AsString,
        DMArtSerializacion.xDestinoRIG.AsInteger)
  else if (DMArtSerializacion.xDestinoTIPO.AsString = 'OP') then
     FMain.EjecutaAccion(FMain.AProOrden, DMArtSerializacion.xDestinoID_ORDEN.AsString);
end;

procedure TFMArtSerializacion.ALstSerializacionExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregLstSerializacion, FPregLstSerializacion);
end;

procedure TFMArtSerializacion.DBECliReparaChange(Sender: TObject);
begin
  inherited;
  DMArtSerializacion.DameClienteTitulo;
end;

//sfg.albert
procedure TFMArtSerializacion.FiltraSerie(FiltroAccion: string);
begin
  DMArtSerializacion.FiltroSerie(FiltroAccion);
end;

procedure TFMArtSerializacion.DBEArticuloChange(Sender: TObject);
begin
  inherited;
  ETitArticulo.Text := DameTituloArticulo(DBEArticulo.Text);
end;

procedure TFMArtSerializacion.DBEAlmacenChange(Sender: TObject);
begin
  inherited;
  ETitAlmacen.Text := DameTituloAlmacen(DBEAlmacen.Text);
end;

procedure TFMArtSerializacion.FormResize(Sender: TObject);
begin
  inherited;
  LFPanelDest.Width := PDetalle.Width div 2;
end;

procedure TFMArtSerializacion.LFBuscarSerieBusqueda(Sender: TObject);
begin
  inherited;
  if (Trim(LFBuscarArticulo.Text) <> '') then
     LFBuscarSerie.CondicionBusqueda := 'ARTICULO = ''' + LFBuscarArticulo.Text + '''';
end;

end.
