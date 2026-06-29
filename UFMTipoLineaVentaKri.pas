unit UFMTipoLineaVentaKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel;

type
  TFMTipoLineaVentaKri = class(TFPEdit)
     LBLTipo: TLFLabel;
     DBEID: TLFDbedit;
     DBETitulo: TLFDbedit;
     LBLTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTipoLineaVentaKri : TFMTipoLineaVentaKri;

implementation

uses UFormGest, UDMTipoLineaVentaKri, UDMMain;

{$R *.dfm}

procedure TFMTipoLineaVentaKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoLineaVentaKri, DMTipoLineaVentaKri);
  NavMain.DataSource := DMTipoLineaVentaKri.DSQMTipoLineaVentaKri;
  DBGMain.DataSource := DMTipoLineaVentaKri.DSQMTipoLineaVentaKri;
  G2KTableLoc.DataSource := DMTipoLineaVentaKri.DSQMTipoLineaVentaKri;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMTipoLineaVentaKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTipoLineaVentaKri);
end;

procedure TFMTipoLineaVentaKri.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoLineaVentaKri.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTipoLineaVentaKri.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
