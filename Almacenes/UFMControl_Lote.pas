unit UFMControl_Lote;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, rxToolEdit, RXDBCtrl,
  Mask, DBCtrls, ULFDBEdit, ULFLabel, ULFDBMemo, ULFDBDateEdit;

type
  TFMControl_Lote = class(TFPEdit)
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     DBELote: TLFDbedit;
     DBEClasificacion: TLFDbedit;
     DTPFFAbricacion: TLFDBDateEdit;
     LBLAlmacen: TLFLabel;
     LBLSerie: TLFLabel;
     LBLClasificacion: TLFLabel;
     LBLFFAbricacion: TLFLabel;
     LBLFENvasado: TLFLabel;
     LBLFCaducidad: TLFLabel;
     LBLStock: TLFLabel;
     DBESerie: TLFDbedit;
     DBEStock: TLFDbedit;
     DTPFENvasado: TLFDBDateEdit;
     DTPFCaducidad: TLFDBDateEdit;
     DBEFAlmacen: TLFDBEditFind2000;
     ETitulo_Alm: TLFEdit;
     DBEFProveedor: TLFDBEditFind2000;
     LBLArticulo: TLFLabel;
     LFLabel3: TLFLabel;
     AImprimeEtiquetas: TAction;
     DBEFArticulos: TLFDBEditFind2000;
     LFDBMemo1: TLFDBMemo;
     LFCategoryAction1: TLFCategoryAction;
     ETitulo_Prov: TLFEdit;
     ETitulo_Art: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFAlmacenChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimeEtiquetasExecute(Sender: TObject);
     procedure DBEFArticulosChange(Sender: TObject);
     procedure DBEFProveedorChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMControl_Lote : TFMControl_Lote;

implementation

uses UFormGest, UDMMain, UDMControl_Lote, UUtiles, UEntorno,
  UFPregEtiquetasLotes;

{$R *.dfm}

procedure TFMControl_Lote.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMControl_Lote, DMControl_Lote);
  ControlEdit := CeMain;
  NavMain.DataSource := DMControl_Lote.DSQMArticulos_Lotes;
  EPMain.DataSource := DMControl_Lote.DSQMArticulos_Lotes;
  DBGMain.DataSource := DMControl_Lote.DSQMArticulos_Lotes;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  // CELotePMEdit.Teclas := DMMain.teclas;
end;

procedure TFMControl_Lote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMControl_Lote);
  Action := caFree;
end;

procedure TFMControl_Lote.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMControl_Lote.BusquedaCompleja;
  Continua := False;
end;

procedure TFMControl_Lote.DBEFAlmacenChange(Sender: TObject);
begin
  if (DBEFAlmacen.Text <> '') then
     ETitulo_Alm.Text := DMControl_Lote.DameTituloAlmacen(DBEFAlmacen.Text);
end;

procedure TFMControl_Lote.AImprimeEtiquetasExecute(Sender: TObject);
begin
  TFPregEtiquetasLotes.Create(Self).Muestrate(StrToIntDef(DBEStock.Text, 0),
     DBELote.Text,
     DBEFArticulos.Text, ETitulo_Art.Text, DBEserie.Text, DBEClasificacion.Text,
     DTPFFabricacion.Date,
     DTPFCaducidad.Date, DTPFEnvasado.Date);
end;

procedure TFMControl_Lote.DBEFArticulosChange(Sender: TObject);
begin
  if (DBEFArticulos.Text <> '') then
     ETitulo_Art.Text := DMControl_Lote.DameTituloArticulo(DBEFArticulos.Text);
end;

procedure TFMControl_Lote.DBEFProveedorChange(Sender: TObject);
begin
  if (DBEFProveedor.Text <> '') then
     ETitulo_Prov.Text := DMControl_Lote.DameTituloProveedor(DBEFProveedor.Text);
end;

end.
