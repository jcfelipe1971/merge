unit UProFMArtSerializacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, Barras, ActnList, URecursos, DB, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBMemo, ULFDBEdit, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFLabel, ULFDBDateEdit;

type
  TProFMArtSerializacion = class(TFPEdit)
     LBLCodigo: TLFLabel;
     LBLNSerie: TLFLabel;
     LBLAlmacen: TLFLabel;
     LBLFechaOrden: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEAlmacen: TLFDbedit;
     DBEFecha: TLFDbedit;
     DBETitAlmacen: TLFDbedit;
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
     DBEArticulo: TLFDbedit;
     DBETitArticulo: TLFDbedit;
     CodBarras: TCodeBar;
     DBEFNSerie: TLFDBEditFind2000;
     ARestoSeries: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AAnyadirEtiquetas: TAction;
     AImpresion: TAction;
     LFCategoryAction2: TLFCategoryAction;
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
  private
     { Private declarations }
     procedure PintaCodigoBarras;
  public
     { Public declarations }
  end;

var
  ProFMArtSerializacion : TProFMArtSerializacion;

procedure MuestraSerializacion(Serie, tipo, Almacen, Articulo: string; Rig, linea: integer; Fecha: TDateTime; Unidades: double; estado: integer; padre: TComponent);

implementation

uses UProDMArtSerializacion, UFormGest, UDMMain, UFPregSerializacion, UProFMOrden;

{$R *.DFM}

procedure MuestraSerializacion(Serie, tipo, Almacen, Articulo: string; Rig, linea: integer; Fecha: TDateTime; Unidades: double; estado: integer; padre: TComponent);
var
  ProFMArtSerializacion : TProFMArtSerializacion;
begin
  ProFMArtSerializacion := TProFMArtSerializacion.Create(padre);

  ProDMArtSerializacion.AbreDatos(Serie, Tipo, Almacen, Articulo, Rig, Linea, Fecha, Unidades, Estado);
  // Si estado=5 -> Només es permet la navegació
  if (Estado = 5) then
  begin
     // ProFMArtSerializacion.TButtGeneraResto.Enabled := False;
     ProFMArtSerializacion.NavMain.VisibleButtons := ProFMArtSerializacion.NavMain.VisibleButtons - [nbInsert, nbEdit, nbDelete];
  end;

  ProFMArtSerializacion.ShowModal;
  ProFMArtSerializacion.Free;
end;

procedure TProFMArtSerializacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMArtSerializacion, ProDMArtSerializacion);
  NavMain.DataSource := ProDMArtSerializacion.DSQMArtSerializacion;
  DBGMain.DataSource := ProDMArtSerializacion.DSQMArtSerializacion;
  ControlEdit := CEMain;
  CEMain.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TProFMArtSerializacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMArtSerializacion);
end;

procedure TProFMArtSerializacion.PintaCodigoBarras;
var
  Dibujar : boolean;
begin
  ICodBarras.Picture := nil;
  with CodBarras do
  begin
     Dibujar := True;
     codigo := DBEFNSerie.Text; // ProDMArtSerializacion.DameSerie;
     if (codigo <> '') then
     begin
        VerTexto := cboCodigo;
        Texto := '*' + CodBarras.codigo + '*';
        Alto := 60;
        Porcentaje := 10;
        Modulo := 1;
        ChequearDigito := True;
        Tipo := cb128;
        OrigenX := Trunc((ICodBarras.Width / 2) - (CodBarras.Ancho / 2));
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

procedure TProFMArtSerializacion.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
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

procedure TProFMArtSerializacion.DBENSerieChange(Sender: TObject);
begin
  PintaCodigoBarras;
end;

procedure TProFMArtSerializacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMArtSerializacion.BusquedaCompleja;
end;

procedure TProFMArtSerializacion.DBEFNSerieChange(Sender: TObject);
begin
  PintaCodigoBarras;
end;

procedure TProFMArtSerializacion.DBEFNSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Codigo, Contador : integer;
  CodigoStr : string;
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
     try
        ProDMArtSerializacion.DameCodigo(Codigo, Contador, CodigoStr);
        PintaCodigoBarras;
     except
     end;
  end;
end;

procedure TProFMArtSerializacion.ARestoSeriesExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     ProDMArtSerializacion.GeneraResto;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TProFMArtSerializacion.AAnyadirEtiquetasExecute(Sender: TObject);
var
  Contador : integer;
  Marca : TBookmark;
begin
  inherited;
  ProDMArtSerializacion.QMArtSerializacion.DisableControls;
  if DBGMain.SelectedRows.Count > 0 then
  begin
     Marca := ProDMArtSerializacion.QMArtSerializacion.GetBookmark;
     try
        // with DBGMain.SelectedRows do
        for contador := 0 to DBGMain.SelectedRows.Count - 1 do
        begin
           // DBGMain.SelectedRows.Items[Contador];
           ProDMArtSerializacion.QMArtSerializacion.Bookmark := DBGMain.SelectedRows.Items[Contador];
           ProDMArtSerializacion.AnyadeEtiquetas(DBETitArticulo.Text, ProDMArtSerializacion.QMArtSerializacionNSERIE.AsString);
        end;
        ProDMArtSerializacion.QMArtSerializacion.GotoBookmark(Marca);
     finally
        ProDMArtSerializacion.QMArtSerializacion.FreeBookmark(Marca);
     end;
  end;
  ProDMArtSerializacion.QMArtSerializacion.EnableControls;
end;

procedure TProFMArtSerializacion.AImpresionExecute(Sender: TObject);
begin
  inherited;
  TFPregSerializacion.Create(Self).ShowModal;
end;

procedure TProFMArtSerializacion.DBEFNSerieBusqueda(Sender: TObject);
begin
  DBEFNSerie.CondicionBusqueda := 'CANAL = ' + IntToStr(ProDMArtSerializacion.CanalOrigen) +
     ' AND ARTICULO = ''' + ProDMArtSerializacion.ArticuloDat + ''' ' +
     ' AND ACTIVO = 1' + ProDMArtSerializacion.Estadoser;
end;

end.
