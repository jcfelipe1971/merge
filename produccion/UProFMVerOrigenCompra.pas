unit UProFMVerOrigenCompra;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel, ComCtrls, ToolWin,
  ULFToolBar;

type
  TProFMVerOrigenCompra = class(TG2KForm)
     PnlMain: TLFPanel;
     DBGFOrigen: TDBGridFind2000;
     TBMain: TLFToolBar;
     TBSalir: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure TBSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFOrigenDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMVerOrigenCompra : TProFMVerOrigenCompra;

implementation

uses UProDMOrden, UDMMain, UFMain;

{$R *.dfm}

procedure TProFMVerOrigenCompra.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TProFMVerOrigenCompra.TBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMVerOrigenCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TProFMVerOrigenCompra.DBGFOrigenDblClick(Sender: TObject);
begin
  FMain.MuestraDocumento(ProDMOrden.xDatosCompraEJERCICIO_DOC.AsInteger,
     ProDMOrden.xDatosCompraTIPO_COMPRA.AsString,
     ProDMOrden.QMProOrdMatCompraSERIE.AsString,
     ProDMOrden.xDatosCompraNUM_DOC.AsInteger);
  Close;
end;

end.
