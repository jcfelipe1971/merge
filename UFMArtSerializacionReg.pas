unit UFMArtSerializacionReg;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, Barras, ActnList, URecursos, DB, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBMemo, ULFDBEdit, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBDateEdit;

type
  TFMArtSerializacionReg = class(TFPEdit)
     LBLCodigo: TLFLabel;
     LBLNSerie: TLFLabel;
     LBLAlmacen: TLFLabel;
     LBLFechaAlbaran: TLFLabel;
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
  FMArtSerializacionReg : TFMArtSerializacionReg;

procedure MuestraSerializacion(Serie, tipo, Almacen, Articulo: string; Rig, linea: integer; Fecha: TDateTime; Unidades: double; estado: integer; padre: TComponent);

implementation

uses UDMArtSerializacion, UFormGest, UDMMain, UFPregSerializacion,
  UDMArtSerializacionReg;

{$R *.DFM}

procedure MuestraSerializacion(Serie, tipo, Almacen, Articulo: string; Rig, linea: integer; Fecha: TDateTime; Unidades: double; estado: integer; padre: TComponent);
var
  FMArtSerializacionReg : TFMArtSerializacionReg;
begin
  FMArtSerializacionReg := TFMArtSerializacionReg.Create(padre);

  DMArtSerializacionReg.AbreDatos(Serie, Tipo, Almacen, Articulo, Rig,
     Linea, Fecha, Unidades, Estado);
  if (Estado = 5) then
  begin
     // FMArtSerializacionReg.TButtGeneraResto.Enabled:=False;
     FMArtSerializacionReg.NavMain.VisibleButtons :=
        FMArtSerializacionReg.NavMain.VisibleButtons - [nbInsert, nbEdit, nbDelete];
  end;

  FMArtSerializacionReg.ShowModal;
  FMArtSerializacionReg.Free;
end;

procedure TFMArtSerializacionReg.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMArtSerializacionReg, DMArtSerializacionReg);
  NavMain.DataSource := DMArtSerializacionReg.DSQMArtSerializacion;
  DBGMain.DataSource := DMArtSerializacionReg.DSQMArtSerializacion;
  ControlEdit := CEMain;
  CEMain.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMArtSerializacionReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMArtSerializacionReg);
end;

procedure TFMArtSerializacionReg.PintaCodigoBarras;
var
  Dibujar : boolean;
begin
  ICodBarras.Picture := nil;
  with CodBarras do
  begin
     Dibujar := True;
     codigo := DBEFNSerie.Text; // DMArtSerializacionReg.DameSerie;
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

procedure TFMArtSerializacionReg.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
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

procedure TFMArtSerializacionReg.DBENSerieChange(Sender: TObject);
begin
  PintaCodigoBarras;
end;

procedure TFMArtSerializacionReg.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMArtSerializacionReg.BusquedaCompleja;
end;

procedure TFMArtSerializacionReg.DBEFNSerieChange(Sender: TObject);
begin
  PintaCodigoBarras;
end;

procedure TFMArtSerializacionReg.DBEFNSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Codigo, Contador : integer;
  CodigoStr : string;
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
     try
        DMArtSerializacionReg.DameCodigo(Codigo, Contador, CodigoStr);
        PintaCodigoBarras;
     except
     end;
  end;
end;

procedure TFMArtSerializacionReg.ARestoSeriesExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DMArtSerializacionReg.GeneraResto;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMArtSerializacionReg.AAnyadirEtiquetasExecute(Sender: TObject);
var
  Contador : integer;
  Marca : TBookmark;
begin
  inherited;
  if DBGMain.SelectedRows.Count > 0 then
  begin
     with DMArtSerializacionReg.QMArtSerializacion do
     begin
        Marca := GetBookmark;
        try
           DisableControls;
           // with DBGMain.SelectedRows do
           for contador := 0 to DBGMain.SelectedRows.Count - 1 do
           begin
              // DBGMain.SelectedRows.Items[Contador];
              Bookmark := DBGMain.SelectedRows.Items[Contador];
              DMArtSerializacionReg.AnyadeEtiquetas(DBETitArticulo.Text,
                 DMArtSerializacionReg.QMArtSerializacionNSERIE.AsString);
           end;
           GotoBookmark(Marca);
        finally
           EnableControls;
           FreeBookmark(Marca);
        end;
     end;
  end;
end;

procedure TFMArtSerializacionReg.AImpresionExecute(Sender: TObject);
begin
  inherited;
  TFPregSerializacion.Create(Self).ShowModal;
end;

procedure TFMArtSerializacionReg.DBEFNSerieBusqueda(Sender: TObject);
begin
  DBEFNSerie.CondicionBusqueda := ' ALMACEN = ' + DMArtSerializacionReg.AlmacenDat +
     ' AND ESTADO = ' + DMArtSerializacionReg.DameEstado +
     ' AND ARTICULO = ''' +
     DMArtSerializacionReg.ArticuloDat + ''' ';
end;

end.
