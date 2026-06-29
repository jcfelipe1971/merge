unit UFMKitTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt,
  Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ExtCtrls, DB, UDMMaestrosTallas,
  StdCtrls, Mask, DBCtrls, ULFFormStorage, ActnList, ULFActionList,
  ULFToolBar, UG2kTBLoc, ULFPageControl, ULFPanel, ULFDBEdit, ULFLabel,
  ULFEdit, ULFDBEditFind2000;

type
  TFMKitTallas = class(TFPEdit)
     DSKit: TDataSource;
     DSKitTallas: TDataSource;
     DBEKit: TLFDbedit;
     DBETitulo: TLFDbedit;
     LKit: TLFLabel;
     LTitulo: TLFLabel;
     pnlDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGTallas: TDBGridFind2000;
     CETallas: TControlEdit;
     CETallasPMEdit: TPopUpTeclas;
     LGrupoTallas: TLFLabel;
     DBEFGrupoTallas: TLFDBEditFind2000;
     EGrupoTalla: TLFEdit;
     ETituloGrupo: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFGrupoTallasChange(Sender: TObject);
  private
     { Private declarations }
     dm: TDMMaestrosTallas;
  public
     { Public declarations }
  end;

var
  FMKitTallas : TFMKitTallas;

implementation

uses UFormGest, UDMMain, uFBusca, UDameDato;

{$R *.dfm}

procedure TFMKitTallas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreDataVarias(TDMMaestrosTallas, dm, Self);
  DSKit.DataSet := dm.QMArtKit;
  DSKitTallas.DataSet := dm.QMArtKitTallas;

  DMMain.FiltraTabla(dm.QMArtKit, '100000');

  G2KTableLoc.DataSource := DSKit;

  NavMain.DataSource := DSKit;
  CEMain.DataSource := DSKit;
  DBGMain.DataSource := DSKit;

  DBEKit.DataSource := DSKit;
  DBETitulo.DataSource := DSKit;
  DBEFGrupoTallas.DataSource := DSKit;

  NavDetalle.DataSource := DSKitTallas;
  CETallas.DataSource := DSKitTallas;
  DBGTallas.DataSource := DSKitTallas;
end;

procedure TFMKitTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(dm);
end;

procedure TFMKitTallas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  TFBusca.Create(Self).SeleccionaBusqueda(CEMain, dm.QMArtKit, '10000');
end;

procedure TFMKitTallas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMKitTallas.DBEFGrupoTallasChange(Sender: TObject);
begin
  inherited;
  EGrupoTalla.Text := DMMain.DameGrupoGrupoTalla(StrToIntDef(DBEFGrupoTallas.Text, 0));
  ETituloGrupo.Text := DameTituloGrupoTalla(StrToIntDef(DBEFGrupoTallas.Text, 0));
end;

end.
