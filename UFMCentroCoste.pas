unit UFMCentroCoste;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  UG2kTBLoc, ULFPageControl, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEdit, ULFLabel;

type
  TFMCentroCoste = class(TFPEdit)
     LNumero: TLFLabel;
     LTitulo: TLFLabel;
     DBENumDigito: TLFDBEdit;
     DBETitulo: TLFDBEdit;
     DBELetDigito: TLFDBEdit;
     LLetra: TLFLabel;
     TSDivision: TTabSheet;
     TSSeries: TTabSheet;
     TSAgentes: TTabSheet;
     CESeries: TControlEdit;
     CESeriesPMEdit: TPopUpTeclas;
     MenuItem1: TMenuItem;
     MenuItem2: TMenuItem;
     MenuItem3: TMenuItem;
     MenuItem4: TMenuItem;
     MenuItem5: TMenuItem;
     MenuItem6: TMenuItem;
     MenuItem7: TMenuItem;
     MenuItem8: TMenuItem;
     MenuItem9: TMenuItem;
     MenuItem10: TMenuItem;
     MenuItem11: TMenuItem;
     MenuItem12: TMenuItem;
     MenuItem13: TMenuItem;
     MenuItem14: TMenuItem;
     MenuItem15: TMenuItem;
     MenuItem16: TMenuItem;
     MenuItem17: TMenuItem;
     MenuItem18: TMenuItem;
     MenuItem19: TMenuItem;
     MenuItem20: TMenuItem;
     MenuItem21: TMenuItem;
     MenuItem22: TMenuItem;
     MenuItem23: TMenuItem;
     MenuItem24: TMenuItem;
     MenuItem25: TMenuItem;
     MenuItem26: TMenuItem;
     MenuItem27: TMenuItem;
     MenuItem28: TMenuItem;
     MenuItem29: TMenuItem;
     MenuItem30: TMenuItem;
     MenuItem31: TMenuItem;
     CEAgente: TControlEdit;
     CEAgentesPMEdit: TPopUpTeclas;
     MenuItem32: TMenuItem;
     MenuItem33: TMenuItem;
     MenuItem34: TMenuItem;
     MenuItem35: TMenuItem;
     MenuItem36: TMenuItem;
     MenuItem37: TMenuItem;
     MenuItem38: TMenuItem;
     MenuItem39: TMenuItem;
     MenuItem40: TMenuItem;
     MenuItem41: TMenuItem;
     MenuItem42: TMenuItem;
     MenuItem43: TMenuItem;
     MenuItem44: TMenuItem;
     MenuItem45: TMenuItem;
     MenuItem46: TMenuItem;
     MenuItem47: TMenuItem;
     MenuItem48: TMenuItem;
     MenuItem49: TMenuItem;
     MenuItem50: TMenuItem;
     MenuItem51: TMenuItem;
     MenuItem52: TMenuItem;
     MenuItem53: TMenuItem;
     MenuItem54: TMenuItem;
     MenuItem55: TMenuItem;
     MenuItem56: TMenuItem;
     MenuItem57: TMenuItem;
     MenuItem58: TMenuItem;
     MenuItem59: TMenuItem;
     MenuItem60: TMenuItem;
     MenuItem61: TMenuItem;
     MenuItem62: TMenuItem;
     PNLSerie: TLFPanel;
     DBFGSerie: TDBGridFind2000;
     PNLAgente: TLFPanel;
     DBGFAgentes: TDBGridFind2000;
     NavAgentes: TDBNavigator;
     DBNSerie: TDBNavigator;
     TSAgenciaTramitadora: TTabSheet;
     PNLAgenciaTramitadora: TLFPanel;
     DBGFAgenciaTramitadora: TDBGridFind2000;
     DBNAgenciaTramitadora: TDBNavigator;
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBENumDigitoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFAgenciaTramitadoraBusqueda(Sender: TObject);
     procedure DBFGSerieBusqueda(Sender: TObject);
     procedure DBGFAgentesBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCentroCoste : TFMCentroCoste;

implementation

{$R *.DFM}

uses UFormGest, UDMMain, UDMCentroCoste, UEntorno, uUtiles;

procedure TFMCentroCoste.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCentroCoste, DMCentroCoste);
  NavMain.DataSource := DMCentroCoste.DSQMCentroCoste;
  DBGMain.DataSource := DMCentroCoste.DSQMCentroCoste;

  G2kTableLoc.DataSource := DMCentroCoste.DSQMCentroCoste;
  TSAgenciaTramitadora.TabVisible := False;
  if (DMMain.EstadoKri(183) = 1) then
     TSAgenciaTramitadora.TabVisible := True;

  // Color campo ID
  ColorCampoID(DBENumDigito);
end;

procedure TFMCentroCoste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCentroCoste);
end;

procedure TFMCentroCoste.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCentroCoste.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCentroCoste.DBENumDigitoChange(Sender: TObject);
begin
  inherited;
  if (DBENumDigito.Text > '5') or (DBENumDigito.Text < '1') then
     DBENumDigito.Text := '';
end;

procedure TFMCentroCoste.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMCentroCoste.DBGFAgenciaTramitadoraBusqueda(Sender: TObject);
begin
  inherited;
  if Pos('CON_CENTROS_COSTE', Trim(DBGFAgenciaTramitadora.TablaABuscar)) > 0 then
  begin
     DBGFAgenciaTramitadora.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
     if (DBGFAgenciaTramitadora.SelectedField.FieldName = 'DIGITO_1') then
        DBGFAgenciaTramitadora.CondicionBusqueda := DBGFAgenciaTramitadora.CondicionBusqueda + ' AND NUM_DIGITO=1';
     if (DBGFAgenciaTramitadora.SelectedField.FieldName = 'DIGITO_2') then
        DBGFAgenciaTramitadora.CondicionBusqueda := DBGFAgenciaTramitadora.CondicionBusqueda + ' AND NUM_DIGITO=2';
     if (DBGFAgenciaTramitadora.SelectedField.FieldName = 'DIGITO_3') then
        DBGFAgenciaTramitadora.CondicionBusqueda := DBGFAgenciaTramitadora.CondicionBusqueda + ' AND NUM_DIGITO=3';
     if (DBGFAgenciaTramitadora.SelectedField.FieldName = 'DIGITO_4') then
        DBGFAgenciaTramitadora.CondicionBusqueda := DBGFAgenciaTramitadora.CondicionBusqueda + ' AND NUM_DIGITO=4';
     if (DBGFAgenciaTramitadora.SelectedField.FieldName = 'DIGITO_5') then
        DBGFAgenciaTramitadora.CondicionBusqueda := DBGFAgenciaTramitadora.CondicionBusqueda + ' AND NUM_DIGITO=5';
  end;
end;

procedure TFMCentroCoste.DBFGSerieBusqueda(Sender: TObject);
begin
  inherited;
  if Pos('VER_SERIES', Trim(DBFGSerie.TablaABuscar)) > 0 then
  begin
     DBFGSerie.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
  end;
  if Pos('CON_CENTROS_COSTE', Trim(DBFGSerie.TablaABuscar)) > 0 then
  begin
     DBFGSerie.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
     if (DBFGSerie.SelectedField.FieldName = 'DIGITO_1') then
        DBFGSerie.CondicionBusqueda := DBFGSerie.CondicionBusqueda + ' AND NUM_DIGITO=1';
     if (DBFGSerie.SelectedField.FieldName = 'DIGITO_2') then
        DBFGSerie.CondicionBusqueda := DBFGSerie.CondicionBusqueda + ' AND NUM_DIGITO=2';
     if (DBFGSerie.SelectedField.FieldName = 'DIGITO_3') then
        DBFGSerie.CondicionBusqueda := DBFGSerie.CondicionBusqueda + ' AND NUM_DIGITO=3';
     if (DBFGSerie.SelectedField.FieldName = 'DIGITO_4') then
        DBFGSerie.CondicionBusqueda := DBFGSerie.CondicionBusqueda + ' AND NUM_DIGITO=4';
     if (DBFGSerie.SelectedField.FieldName = 'DIGITO_5') then
        DBFGSerie.CondicionBusqueda := DBFGSerie.CondicionBusqueda + ' AND NUM_DIGITO=5';
  end;
end;

procedure TFMCentroCoste.DBGFAgentesBusqueda(Sender: TObject);
begin
  inherited;
  if Pos('VER_AGENTES_CUENTAS', Trim(DBGFAgentes.TablaABuscar)) > 0 then
  begin
     DBGFAgentes.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
  end;
  if Pos('CON_CENTROS_COSTE', Trim(DBGFAgentes.TablaABuscar)) > 0 then
  begin
     DBGFAgentes.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
     if (DBGFAgentes.SelectedField.FieldName = 'DIGITO_1') then
        DBGFAgentes.CondicionBusqueda := DBGFAgentes.CondicionBusqueda + ' AND NUM_DIGITO=1';
     if (DBGFAgentes.SelectedField.FieldName = 'DIGITO_2') then
        DBGFAgentes.CondicionBusqueda := DBGFAgentes.CondicionBusqueda + ' AND NUM_DIGITO=2';
     if (DBGFAgentes.SelectedField.FieldName = 'DIGITO_3') then
        DBGFAgentes.CondicionBusqueda := DBGFAgentes.CondicionBusqueda + ' AND NUM_DIGITO=3';
     if (DBGFAgentes.SelectedField.FieldName = 'DIGITO_4') then
        DBGFAgentes.CondicionBusqueda := DBGFAgentes.CondicionBusqueda + ' AND NUM_DIGITO=4';
     if (DBGFAgentes.SelectedField.FieldName = 'DIGITO_5') then
        DBGFAgentes.CondicionBusqueda := DBGFAgentes.CondicionBusqueda + ' AND NUM_DIGITO=5';
  end;
end;

end.
