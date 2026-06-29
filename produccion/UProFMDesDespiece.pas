unit UProFMDesDespiece;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEditFind2000, ULFLabel,
  DBCtrls, ULFDBEdit, UHYDescription, ULFHYDBDescription, Mask, rxToolEdit,
  RXDBCtrl, ULFDBDateEdit, ULFFIBDBEditFind, ULFDBMemo, ULFEdit,
  ULFDBEditFind2000, Buttons;

type
  TProFMDesDespiece = class(TFPEditDetalle)
     LPedido: TLFLabel;
     LLineaPedido: TLFLabel;
     LFechaCreacion: TLFLabel;
     DBDEFechaCreacion: TLFDBDateEdit;
     LEscandallo: TLFLabel;
     LCantidad: TLFLabel;
     LFDBCantidad: TLFDbedit;
     LTipoMaterial: TLFLabel;
     LArticulo: TLFLabel;
     DescArticulo: TLFHYDBDescription;
     TSNotas: TTabSheet;
     PNLNotas: TLFPanel;
     LFDBNotas: TLFDBMemo;
     LComentario: TLFLabel;
     LFDBComentario: TLFDbedit;
     LAlto: TLFLabel;
     LFDBAlto: TLFDbedit;
     LAncho: TLFLabel;
     LFDBAncho: TLFDbedit;
     LProfundidad: TLFLabel;
     LFDBProfundidad: TLFDbedit;
     LGrueso: TLFLabel;
     LFPedido: TLFEditFind2000;
     LFLineaPed: TLFEditFind2000;
     DescTipoMaterial: TLFHYDBDescription;
     LFDBTMaterial: TLFDBEditFind2000;
     LFDBEArticulos: TLFDBEditFind2000;
     LFDBGrueso: TLFDbedit;
     LFDBEFEscandallo: TLFDBEditFind2000;
     LDescripcion: TLFLabel;
     LFDBDespiece: TLFDbedit;
     ToolButton1: TToolButton;
     SBAEscandallo: TSpeedButton;
     ALDespiece: TLFActionList;
     AAEscandallo: TAction;
     AAImportarEsc: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AImportarEscandallo: TAction;
     AACalculoFormulas: TAction;
     AACrearOF: TAction;
     AACrearSuborden: TAction;
     LNumeroOrdenProduccion: TLFLabel;
     LNumeroSuborden: TLFLabel;
     LFDBOF: TLFDbedit;
     LFDBSuborden: TLFDbedit;
     SBAOF: TSpeedButton;
     AAOrden: TAction;
     DescEscandallo: TLFHYDBDescription;
     TBFormula: TToolButton;
     ACalculaformulas: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFDBTMaterialChange(Sender: TObject);
     procedure LFDBEArticulosChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAEscandalloExecute(Sender: TObject);
     procedure SBAEscandalloDblClick(Sender: TObject);
     procedure AImportarEscandalloExecute(Sender: TObject);
     procedure AAImportarEscExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AACrearOFExecute(Sender: TObject);
     procedure AAOrdenExecute(Sender: TObject);
     procedure SBAOFDblClick(Sender: TObject);
     procedure LFDBEFEscandalloChange(Sender: TObject);
     procedure AACrearSubordenExecute(Sender: TObject);
     procedure ACalculaformulasExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMDesDespiece : TProFMDesDespiece;

implementation

uses UDMMain, UFormGest, UProDMDesDespiece, UEntorno, UFMain, UUtiles,
  ProFMDesSelecOrden;

{$R *.dfm}

procedure TProFMDesDespiece.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TProDMDesDespiece, ProDMDesDespiece);

  NavMain.DataSource := ProDMDesDespiece.DSCabDespiece;
  DBGMain.DataSource := ProDMDesDespiece.DSCabDespiece;
  G2kTableLoc.DataSource := ProDMDesDespiece.DSCabDespiece;

  NavDetalle.DataSource := ProDMDesDespiece.DSDetDespiece;
  DBGFDetalle.DataSource := ProDMDesDespiece.DSDetDespiece;

  DescEscandallo.Color := REntorno.ColorEnlaceActivo;
  LFDBOF.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEscandallo, DescEscandallo);
  SolapaControles(SBAOF, LFDBOF);

  LFDBEArticulos.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TProFMDesDespiece.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMDesDespiece);
end;

procedure TProFMDesDespiece.LFDBTMaterialChange(Sender: TObject);
begin
  inherited;
  DescTipoMaterial.ActualizaDatos('Tipo_Material', LFDBTMaterial.Text);
end;

procedure TProFMDesDespiece.LFDBEArticulosChange(Sender: TObject);
begin
  inherited;
  DescArticulo.ActualizaDatos('ARTICULO_MAT_PRIMA', LFDBEArticulos.Text);
end;

procedure TProFMDesDespiece.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TProFMDesDespiece.AAEscandalloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'ID_Esc = ' +
     IntToStr(ProDMDesDespiece.QMCabDespieceID_ESCANDALLO.AsInteger));
end;

procedure TProFMDesDespiece.SBAEscandalloDblClick(Sender: TObject);
begin
  inherited;
  AAEscandallo.Execute;
end;

procedure TProFMDesDespiece.AImportarEscandalloExecute(Sender: TObject);
begin
  inherited;
  with ProDMDesDespiece.xImportarEsc do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['escandallo_des'].AsInteger := StrToIntDef(LFDBEFEscandallo.Text, 0); //ProDMDesDespiece.QMCabDespieceEscandallo.AsInteger;
     Params.ByName['despiece'].AsInteger := ProDMDesDespiece.QMCabDespieceID_DESPIECE.AsInteger;
     ExecQuery;
     FreeHandle;
  end;

  ProDMDesDespiece.QMDetDespiece.Close;
  ProDMDesDespiece.QMDetDespiece.Open;
end;

procedure TProFMDesDespiece.AAImportarEscExecute(Sender: TObject);
begin
  inherited;
  // Se comprueba si ya se ha importado el escandallo. Se informa al usuario
  ProDMDesDespiece.xComprobarImportacionEsc.Close;
  ProDMDesDespiece.xComprobarImportacionEsc.Open;

  if (ProDMDesDespiece.xComprobarImportacionEscLINIES.AsInteger = 0) then
     AImportarEscandallo.Execute
  else
  if MessageDlg(_('Ya se ha echo la importación del escandallo. Desea volver a ' +
     'traspasar los datos al actual despiece?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     AImportarEscandallo.Execute;
  end;
end;

procedure TProFMDesDespiece.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMDesDespiece.BusquedaCompleja;
end;

procedure TProFMDesDespiece.AACrearOFExecute(Sender: TObject);
begin
  inherited;
  ProDMDesDespiece.CrearOF;
  ProDMDesDespiece.QMCabDespieceAfterScroll(prodmdesdespiece.qmcabdespiece);
end;

procedure TProFMDesDespiece.AAOrdenExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProOrden, LFDBOF.Text);
end;

procedure TProFMDesDespiece.SBAOFDblClick(Sender: TObject);
begin
  inherited;
  if (ProDMDesDespiece.QMCabDespieceID_ORDEN.AsInteger <> 0) then
     AAOrden.Execute;
end;

procedure TProFMDesDespiece.LFDBEFEscandalloChange(Sender: TObject);
begin
  inherited;
  DescEscandallo.ActualizaDatos('IDEscandallo', ProDMDesDespiece.QMCabDespieceID_ESCANDALLO.AsString);
end;

procedure TProFMDesDespiece.AACrearSubordenExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMDesSelecOF, ProFMDesSelecOF, Sender);
  ProDMDesDespiece.QMCabDespieceAfterScroll(prodmdesdespiece.qmcabdespiece);
end;

procedure TProFMDesDespiece.ACalculaformulasExecute(Sender: TObject);
begin
  inherited;
  ProDMDesDespiece.CalculaFormulas;
end;

end.
