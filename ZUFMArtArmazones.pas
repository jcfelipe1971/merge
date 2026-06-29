unit ZUFMArtArmazones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, UTeclas, UControlEdit, UNavigator, StdCtrls,
  ULFLabel, ULFEdit, ToolWin, ULFToolBar, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel, UFormGest;

type
  TZFMArtArmazones = class(TG2KForm)
     PnlDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     TBDet: TLFToolBar;
     PnlCab: TLFPanel;
     EDescArmazon: TLFEdit;
     EArmazon: TLFEdit;
     LblArmazon: TLFLabel;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     TSepNav: TToolButton;
     TButtClose: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtCloseClick(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbreDatos(DM: TDataModule; Articulo, Titulo: string);
  end;

var
  ZFMArtArmazones : TZFMArtArmazones;

implementation

uses UDMMain, ZUDMArtArmazones, UEntorno;

{$R *.dfm}

procedure TZFMArtArmazones.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TZDMArtArmazones, ZDMArtArmazones);
end;

procedure TZFMArtArmazones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ZDMArtArmazones);
  Action := caFree;
end;

procedure TZFMArtArmazones.TButtCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMArtArmazones.AbreDatos(DM: TDataModule; Articulo, Titulo: string);
begin
  ZDMArtArmazones.AbreDatos(DM, Articulo);
  EArmazon.Text := Articulo;
  EDescArmazon.Text := Titulo;

  ShowModal;
end;

procedure TZFMArtArmazones.DBGFDetalleBusqueda(Sender: TObject);
begin
  if (DBGFDetalle.ColumnaActual = 'ESCANDALLO_DEF') then
     DBGFDetalle.CondicionBusqueda := 'compuesto="' +
        ZDMArtArmazones.QMArmazonesDetDETALLE.AsString + '"'
  else if (DBGFDetalle.ColumnaActual = 'DETALLE') then
     DBGFDetalle.CondicionBusqueda := 'familia<>"' + REntorno.FamSistema + '"'
  else
     DBGFDetalle.CondicionBusqueda := '';
end;

end.
