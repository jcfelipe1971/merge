unit ZUFMArtLonas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, UTeclas, UControlEdit, UNavigator, StdCtrls,
  ULFLabel, ULFEdit, ToolWin, ULFToolBar, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel, UFormGest;

type
  TZFMArtLonas = class(TG2KForm)
     PnlDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     TBDet: TLFToolBar;
     PnlCab: TLFPanel;
     EDescLona: TLFEdit;
     ELona: TLFEdit;
     LblLona: TLFLabel;
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
  ZFMArtLonas : TZFMArtLonas;

implementation

uses UDMMain, ZUDMArtLonas, UEntorno;

{$R *.dfm}

procedure TZFMArtLonas.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TZDMArtLonas, ZDMArtLonas);
end;

procedure TZFMArtLonas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ZDMArtLonas);
  Action := caFree;
end;

procedure TZFMArtLonas.TButtCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMArtLonas.AbreDatos(DM: TDataModule; Articulo, Titulo: string);
begin
  ZDMArtLonas.AbreDatos(DM, Articulo);
  ELona.Text := Articulo;
  EDescLona.Text := Titulo;

  ShowModal;
end;

procedure TZFMArtLonas.DBGFDetalleBusqueda(Sender: TObject);
begin
  if (DBGFDetalle.ColumnaActual = 'ESCANDALLO_DEF') then
     DBGFDetalle.CondicionBusqueda := 'compuesto="' +
        ZDMArtLonas.QMLonasDetDETALLE.AsString + '"'
  else if (DBGFDetalle.ColumnaActual = 'DETALLE') then
     DBGFDetalle.CondicionBusqueda := 'familia<>"' + REntorno.FamSistema + '"'
  else
     DBGFDetalle.CondicionBusqueda := '';
end;

end.
