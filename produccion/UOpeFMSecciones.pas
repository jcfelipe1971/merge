unit UOpeFMSecciones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, NsDBGrid, rxPlacemnt, Fr_HYReport,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel, DbComboBoxValue,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UFPEditDetalle, ULFDBMemo,
  ULFDBEditFind2000, ULFEdit, HYFIBQuery;

type
  TOpeFMSecciones = class(TFPEditDetalle)
     LSeccion: TLFLabel;
     DBESeccion: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LNTareas: TLFLabel;
     DBENTareas: TLFDbedit;
     LNPersonas: TLFLabel;
     DBENPersonas: TLFDbedit;
     LTReal: TLFLabel;
     DBETReal: TLFDbedit;
     LTPosible: TLFLabel;
     DBETPosible: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     APlanCapacitacion: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AListadoPlan: TAction;
     LEstadoMarcajePedido: TLFLabel;
     DBCBMostrarEnMaquinas: TLFDBCheckBox;
     LCriterioOrden: TLFLabel;
     MCriterioOrden: TLFDBMemo;
     DBEEstadoMarcajePedido: TLFDBEditFind2000;
     ETituloEstadoMarcajePedido: TLFEdit;
     LSecuencia: TLFLabel;
     DBESecuencia: TLFDbedit;
     DBCBHojaSiempreVisible: TLFDBCheckBox;
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ListadoPlandeCapacitacinyPolivalencia1Click(Sender: TObject);
     procedure APlanCapacitacionExecute(Sender: TObject);
     procedure AListadoPlanExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEEstadoMarcajePedidoChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Grupo: integer;
     Listado: TfrHYReport;
     procedure FiltraSeccion(Filtro: string);
  end;

var
  OpeFMSecciones : TOpeFMSecciones;

implementation

uses UOpeDMSecciones, UFormGest, UDMMain, UEntorno, UDMListados, UFMListConfig;

{$R *.DFM}

procedure TOpeFMSecciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMSecciones.BusquedaCompleja;
  Continua := False;
end;

procedure TOpeFMSecciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMSecciones);
end;

procedure TOpeFMSecciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMSecciones, OpeDMSecciones);
  Grupo := 8019;
  Listado := OpeDMSecciones.frIsoSeccCapaci;

  NavMain.DataSource := OpeDMSecciones.DSQMSecciones;
  DBGMain.DataSource := OpeDMSecciones.DSQMSecciones;
  EPMain.DataSource := OpeDMSecciones.DSQMSecciones;
  G2kTableLoc.DataSource := OpeDMSecciones.DSQMSecciones;
  NavDetalle.DataSource := OpeDMSecciones.DSQMSeccionesD;
  DBGFDetalle.DataSource := OpeDMSecciones.DSQMSeccionesD;
end;

procedure TOpeFMSecciones.ListadoPlandeCapacitacinyPolivalencia1Click(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', Listado);
end;

procedure TOpeFMSecciones.APlanCapacitacionExecute(Sender: TObject);
begin
  inherited;
  with OpeDMSecciones.QMTareasD do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['SECCION'].AsString := OpeDMSecciones.QMSeccionesDSECCION.AsString;
     // Params.ByName['TAREA'].AsInteger := OpeDMSecciones.QMSeccionesDLINEA.AsInteger;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(8019, 0, '', _('Plan de Capacitación y Polivalencia'), OpeDMSecciones.frIsoSeccCapaci, nil);
  CierraData(DMListados);
end;

procedure TOpeFMSecciones.AListadoPlanExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', Listado);
end;

procedure TOpeFMSecciones.FiltraSeccion(Filtro: string);
begin
  OpeDMSecciones.FiltraSeccion(Filtro);
end;

procedure TOpeFMSecciones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TOpeFMSecciones.DBEEstadoMarcajePedidoChange(Sender: TObject);
begin
  inherited;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TITULO FROM OPE_ESTADO_MARCAJE_PEDIDO ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_ESTADO_MARCAJE_PEDIDO = :ID_ESTADO_MARCAJE_PEDIDO ');
           Params.ByName['ID_ESTADO_MARCAJE_PEDIDO'].AsInteger := StrToIntDef(DBEEstadoMarcajePedido.Text, 0);
           ExecQuery;
           ETituloEstadoMarcajePedido.Text := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
