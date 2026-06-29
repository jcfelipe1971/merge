{Especifico cliente DICOMOL}

unit UFMFiltroAlbaranesCompra;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls,
  UFIBDBEditfind, ULFFIBDBEditFind, ULFDBEdit;

type
  TFMFiltroAlbaranesCompra = class(TFPEdit)
     LAlbaran: TLFLabel;
     DBEAlbaran: TLFDbedit;
     Larticulo: TLFLabel;
     LFFibDBEArticulo: TLFDBEdit;
     LDescripcion: TLFLabel;
     LFFibDBETitulo: TLFDBEdit;
     LUnidades: TLFLabel;
     LFFibDBEUnidades: TLFDBEdit;
     LPrecio: TLFLabel;
     LFFibDBEPrecio: TLFDBEdit;
     LLinea: TLFLabel;
     LFFibDBELinea: TLFDBEdit;
     DBESerie: TLFDbedit;
     DBEEjercicio: TLFDbedit;
     AAbrirAlbaran: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AAbrirAlbaranExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMFiltroAlbaranesCompra : TFMFiltroAlbaranesCompra;

implementation

uses UDMFiltroAlbaranesCompra, UDMMain, UFormGest, UFMain;

{$R *.dfm}

procedure TFMFiltroAlbaranesCompra.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMFiltroAlbaranesCompra, DMFiltroAlbaranesCompra);
end;

procedure TFMFiltroAlbaranesCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFiltroAlbaranesCompra);
end;

procedure TFMFiltroAlbaranesCompra.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMFiltroAlbaranesCompra.BusquedaCompleja;
  Continua := False;
end;

procedure TFMFiltroAlbaranesCompra.AAbrirAlbaranExecute(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosEntrada(DMFiltroAlbaranesCompra.QMFiltro.FieldByName('ID_E').AsInteger);
end;

end.
