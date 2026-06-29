unit UFMArtescandallo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UEditPanel, ComCtrls, ToolWin, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, UHYDBGrid,
  UNavigator, Menus, UTeclas, UControlEdit, UHYEdits, ActnList, UFormGest, DB,
  NsDBGrid, URecursos, FIBTableDataSet, ULFActionList, ULFDBCheckBox, ULFDBEdit, ULFToolBar, ULFPanel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditDetalle, UG2kTBLoc, ULFPageControl;

type
  TFMArtEscandallo = class(TFPEditDetalle)
     ALMacrosList: TLFActionList;
     AEscandallar: TAction;
     AActualizar_costes: TAction;
     ASubescandallo: TAction;
     TSep1: TMenuItem;
     MIEscandallar1: TMenuItem;
     MISubescandallo1: TMenuItem;
     TSep2: TMenuItem;
     MIEscandallar2: TMenuItem;
     MISubescandallo2: TMenuItem;
     TButt_Escandallar: TToolButton;
     LBLCosteArt: TLFLabel;
     DBEArt_Descrip: TLFDbedit;
     DBEArt_Coste: TLFDbedit;
     DBCBAbierto: TLFDBCheckBox;
     DBEArticulos: TLFDbedit;
     LBLescandallable: TLFLabel;
     ADuplicaEscandallo: TAction;
     ASep: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     ADuplicaEsc: TAction;
     AVisualizarListadoFiltrados: TAction;
     AImprimirLstFiltrado: TAction;
     AConfigList: TAction;
     ASubEscandallo2: TAction;
     AVisualizarListado: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButt_EscandallarClick(Sender: TObject);
     procedure TButtSubEscandalloClick(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure macro_Butt_EscandallarClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure MIVisualizarListadoClick(Sender: TObject);
     procedure MIImprimirListadoClick(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure MIListConfigClick(Sender: TObject);
     procedure NavDetalleClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure ADuplicaEscandalloExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AVisualizarListadoExecute(Sender: TObject);
  private
     procedure MuestraFiltrado(Tipo: byte);
  public
     procedure ControlChequeo;
     procedure FiltraArticulo(Articulo: string);
  end;

var
  FMArtEscandallo : TFMArtEscandallo;

implementation

uses UDMArtEscandallo, UDMMain, UEntorno, UFMInfoDetalle,
  UFMLstArtEscandallo, UDMLstArtEscandallo, UFMListConfig,
  UFMain, UFMDupArtescandallo, UUtiles;

{$R *.DFM}

procedure TFMArtEscandallo.FormCreate(Sender: TObject);
begin
  inherited;
  // DMArt.AbreQueries(true);
  AbreData(TDMArtEscandallo, DMArtEscandallo);
  // DMArtEscandallo.DMArt_EscandalloCreate(Sender);

  EPMain.DataSource := DMArtEscandallo.DSxArticulo;
  NavMain.DataSource := DMArtEscandallo.DSxArticulo;
  DBGMain.DataSource := DMArtEscandallo.DSxArticulo;
  NavDetalle.DataSource := DMArtEscandallo.DSQMEscandallo;
  DBGFDetalle.DataSource := DMArtEscandallo.DSQMEscandallo;

  G2KTableLoc.DataSource := DMArtEscandallo.DSxArticulo;

  ControlChequeo;
  ControlEdit := CEMain;
  OwnerDrawMenus(Self);
  if ((REntorno.Usuario <> 1) and (REntorno.Delegacion = 'S')) then
     NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];

  // Color campo ID
  ColorCampoID(DBEArticulos);
end;

procedure TFMArtEscandallo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMArtEscandallo);
  FreeAndNil(DMArtEscandallo);
  FMArtEscandallo := nil;
end;

procedure TFMArtEscandallo.TButt_EscandallarClick(Sender: TObject);
begin
  if (not DBCBAbierto.Checked) then
  begin
     DMArtEscandallo.PRO_Habilita_Escandallo;
     ControlChequeo;
  end;
end;

procedure TFMArtEscandallo.macro_Butt_EscandallarClick(Sender: TObject);
begin
  if TButt_escandallar.Enabled then
     TButt_EscandallarClick(Sender);
end;

procedure TFMArtEscandallo.ControlChequeo;
begin
  if (DMArtEscandallo.xArticulo.FieldByName('PRODUCCION').AsInteger = 1) then
  begin
     LBLescandallable.Visible := True;
     NavDetalle.Enabled := False;
     DBGFDetalle.Enabled := False;
  end
  else
  begin
     LBLescandallable.Visible := False;
     NavDetalle.Enabled := True;
     DBGFDetalle.Enabled := True;
  end;
end;

procedure TFMArtEscandallo.TButtSubEscandalloClick(Sender: TObject);
begin
  DMArtEscandallo.xDetalle.Open;
  TFMInfoDetalle.Create(Self).ShowModal;
end;

procedure TFMArtEscandallo.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  AVisualizarListado.Execute;
  Continua := False;
end;

procedure TFMArtEscandallo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMArtEscandallo.BusquedaCompleja;
  Continua := False;
end;

procedure TFMArtEscandallo.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  ControlChequeo;
end;

procedure TFMArtEscandallo.MuestraFiltrado(Tipo: byte);
begin
  AbreData(TDMLstArtEscandallo, DMLstArtEscandallo);
  DMLstArtEscandallo.AsignaSQL(DMArtEscandallo.xArticulo.SelectSQL);
  DMLstArtEscandallo.MostrarListadoFiltrado(Tipo);
  CierraData(DMLstArtEscandallo);
end;

procedure TFMArtEscandallo.MIVisualizarListadoClick(Sender: TObject);
begin
  MuestraFiltrado(0);
end;

procedure TFMArtEscandallo.MIImprimirListadoClick(Sender: TObject);
begin
  MuestraFiltrado(1);
end;

procedure TFMArtEscandallo.DBGFDetalleBusqueda(Sender: TObject);
var
  vir : smallint;
begin
  vir := 0;
  DMArtEscandallo.Es_Virtual(vir);
  if Pos('VER_ARTICULOS_CUENTAS', Trim(DBGFDetalle.TablaABuscar)) > 0 then
  begin
     if (vir = 1) then
        DBGFDetalle.CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr +
           ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + ''''
     else
        DBGFDetalle.CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr +
           ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + ''' and VIRTUAL=0';
  end
  else
  begin
     DBGFDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr;
     DBGFDetalle.PlanBusquedaNum := '';
     DBGFDetalle.PlanBusquedaStr := '';
  end;
end;

procedure TFMArtEscandallo.MIListConfigClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstArtEscandallo, DMLstArtEscandallo);
  TFMListConfig.Create(Self).Muestra(35, formato, cabecera, copias,
     pijama, '', DMLstArtEscandallo.frEscandallo);
  CierraData(DMLstArtEscandallo);
end;

procedure TFMArtEscandallo.NavDetalleClick(Sender: TObject; Button: TNavigateBtn);
var
  c : integer;
begin
  // Se habilita la columna del artículo sólo al insertar
  c := EncuentraField(DBGFDetalle, 'DETALLE');
  if Button = nbInsert then
  begin
     DBGFDetalle.Columns[c].ReadOnly := False;
     DBGFDetalle.Columns[c].Font.Color := clWindowText;
     DBGFDetalle.Columns[c].Color := clWindow;
  end
  else
  begin
     DBGFDetalle.Columns[c].ReadOnly := True;
     DBGFDetalle.Columns[c].Color := clInfoBk;
     DBGFDetalle.Columns[c].Font.Color := clGrayText;
  end;
end;

procedure TFMArtEscandallo.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  c : integer;
begin
  // Se habilita la columna del artículo sólo al insertar
  c := EncuentraField(DBGFDetalle, 'DETALLE');
  if DMArtEscandallo.QMEscandallo.State = dsInsert then
  begin
     DBGFDetalle.Columns[c].ReadOnly := False;
     DBGFDetalle.Columns[c].Font.Color := clWindowText;
     DBGFDetalle.Columns[c].Color := clWindow;
  end
  else
  begin
     DBGFDetalle.Columns[c].ReadOnly := True;
     DBGFDetalle.Columns[c].Color := clInfoBk;
     DBGFDetalle.Columns[c].Font.Color := clGrayText;
  end;
end;

procedure TFMArtEscandallo.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMArtEscandallo.ADuplicaEscandalloExecute(Sender: TObject);
begin
  TFMDupArtEscandallo.Create(Self).AsignaArticulo(DMArtEscandallo.xArticulo.FieldByName('ARTICULO').AsString);
end;

procedure TFMArtEscandallo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMArtEscandallo.FiltraArticulo(Articulo: string);
begin
  DMArtEscandallo.FiltraArticulo(Articulo);
end;

procedure TFMArtEscandallo.AVisualizarListadoExecute(Sender: TObject);
begin
  inherited;
  with TFMLstArtEscandallo.Create(Self) do
  begin
     Inicializar(DBEArticulos.Text, DBEArticulos.Text);
     ShowModal;
  end;
end;

end.
