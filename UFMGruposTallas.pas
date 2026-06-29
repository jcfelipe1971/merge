unit UFMGruposTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt,
  Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ExtCtrls, DB, UDMMaestrosTallas,
  StdCtrls, Mask, DBCtrls, ULFFormStorage, ActnList, ULFActionList,
  ULFToolBar, UG2kTBLoc, ULFPageControl, ULFPanel, ULFDBEdit, ULFLabel,
  UFPEditDetalle;

type
  TFMGruposTallas = class(TFPEditDetalle)
     DSart_grupos_tallas: TDataSource;
     DSart_tallas: TDataSource;
     DBEGrupo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LGrupo: TLFLabel;
     LTitulo: TLFLabel;
     DBEPrefijo: TLFDbedit;
     LPrefijo: TLFLabel;
     DBESufijo: TLFDbedit;
     LSufijo: TLFLabel;
     LEjemplo: TLFLabel;
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
  FMGruposTallas : TFMGruposTallas;

implementation

uses UFormGest, UDMMain, uFBusca;

{$R *.dfm}

procedure TFMGruposTallas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreDataVarias(TDMMaestrosTallas, dm, Self);
  DSart_grupos_tallas.DataSet := dm.QMart_grupos_tallas;
  DSart_tallas.DataSet := dm.QMart_tallas;
  dm.QMart_grupos_tallas.Open;
  dm.QMart_tallas.Open;
  G2KTableLoc.DataSource := DSart_grupos_tallas;
end;

procedure TFMGruposTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(dm);
end;

procedure TFMGruposTallas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  TFBusca.Create(Self).SeleccionaBusqueda(CEMain, dm.QMart_grupos_tallas, '00000');
end;

procedure TFMGruposTallas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
