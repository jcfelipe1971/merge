unit UFMTipoColoresTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, DB, StdCtrls, Mask, DBCtrls, UDMMaestrosTallas, ULFFormStorage,
  ActnList, ULFActionList, ULFToolBar, UG2kTBLoc, ULFPageControl, ULFPanel,
  ULFDBEdit, ULFLabel, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMTipoColoresTallas = class(TFPEdit)
     DSart_tipo_color: TDataSource;
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LTipo: TLFLabel;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     dm: TDMMaestrosTallas;
  public
     { Public declarations }
  end;

var
  FMTipoColoresTallas : TFMTipoColoresTallas;

implementation

uses UFormGest, uFBusca, UDMMain;

{$R *.dfm}

procedure TFMTipoColoresTallas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreDataVarias(TDMMaestrosTallas, dm, Self);
  DSart_tipo_color.DataSet := dm.QMart_tipo_color;
  G2KTableLoc.DataSource := DSart_tipo_color;
  dm.QMart_tipo_color.Open;
end;

procedure TFMTipoColoresTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(dm);
end;

procedure TFMTipoColoresTallas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  TFBusca.Create(Self).SeleccionaBusqueda(CEMain, dm.QMart_tipo_color, '00000');
end;

procedure TFMTipoColoresTallas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
