unit UProFMMarcajesTE;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Mask, UFormGest, rxPlacemnt, NsDBGrid, DB, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBMemo, ULFDBEdit, ULFDBEditFind2000, UG2kTBLoc, ULFLabel, ULFDBDateEdit;

type
  TProFMMarcajesTE = class(TFPEdit)
     LProveedor: TLFLabel;
     DBEFProveedor: TLFDBEditFind2000;
     DBETituloProveedor: TLFDbedit;
     LFecha: TLFLabel;
     DTPFecha: TLFDBDateEdit;
     PNLDetalleTe: TLFPanel;
     ToolBar1: TLFToolBar;
     HYMNavigator1: THYMNavigator;
     DBGFDetalleTe: TDBGridFind2000;
     DBMNotas: TLFDBMemo;
     CEDetTe: TControlEdit;
     CEDetTePMEdit: TPopUpTeclas;
     LTiempoTotal: TLFLabel;
     DBETiempoTotal: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleTeBusqueda(Sender: TObject);
     procedure DBGFDetalleTeColExit(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleTeColEnter(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleTeDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraTE(filtro: string);
  end;

var
  ProFMMarcajesTE : TProFMMarcajesTE;

implementation

uses UDMMain, UProDMMarcajesTe, UEntorno, UFMain;

{$R *.dfm}

procedure TProFMMarcajesTE.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMarcajesTe, ProDMMarcajesTe);
  NavMain.DataSource := ProDMMarcajesTE.DSQMProCabMarca;
  DBGMain.DataSource := ProDMMarcajesTE.DSQMProCabMarca;

  G2KTableLoc.DataSource := ProDMMarcajesTe.DSQMProCabMarca;
  DBGFDetalleTe.Columns[2].Color := REntorno.ColorEnlaceActivo;
end;

procedure TProFMMarcajesTE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMarcajesTe);
end;

procedure TProFMMarcajesTE.DBGFDetalleTeBusqueda(Sender: TObject);
begin
  inherited;

  with (Sender as TDBGridFind2000) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (TablaABuscar) = 'PRO_VER_TAREAS_ABIERTAS' then
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' AND (EJERCICIO=' + REntorno.EjercicioStr +
           ' OR ((EJERCICIO <' + REntorno.EjercicioStr + ')))' +
           ' AND CANAL=' + REntorno.CanalStr +
           ' AND SERIE=''' + REntorno.Serie + '''' +
           ' AND TIPO_RECURSO=''TE''';

     if (TablaABuscar) = 'PRO_ORD_FASES' then
        CondicionBusqueda := 'RIG_OF =' +
           ProDMMarcajesTe.QMProDetMarcaRIG_OF.AsString;

     if (Trim(TablaABuscar) = 'PRO_ORD_TAREA') and
        (ColumnaActual = 'LINEA_TAREA') then
        CondicionBusqueda := 'RIG_OF =' +
           ProDMMarcajesTe.QMProDetMarcaRIG_OF.AsString + ' AND ' +
           'LINEA_FASE =' + ProDMMarcajesTe.QMProDetMarcaLINEA_FASE.AsString;

     if ((TablaABuscar = 'PRO_TURNOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_SYS_TAREAS') or
        (TablaABuscar = 'PRO_RECURSOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_TURNOS')) then
        CondicionBusqueda := 'EMPRESA =' + IntToStr(REntorno.Empresa);
  end;
end;

procedure TProFMMarcajesTE.DBGFDetalleTeColExit(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesTe.QMProDetMarca.State in [dsEdit, dsInsert] then
  begin
     if (DBGFDetalleTe.ColumnaActual = 'IDTAREA') and
        (ProDMMarcajesTe.QMProDetMarca.FieldByName('IDTAREA').AsString <> '') then
     begin
        with ProDMMarcajesTe.xDatosTarea do
        begin
           Active := False;
           SelectSQL.Clear;
           SelectSQL.Add('Select * From Pro_Ord_Tarea Where IDENTIFICADOR=:VIdTarea');
           Params.ByName['VIdTarea'].AsInteger := ProDMMarcajesTe.QMProDetMarcaIDTAREA.Value;
           Active := True;
        end;
        if (ProDMMarcajesTe.xDatosTarea.Fields[23].AsInteger <> 0) then
        begin
           ProDMMarcajesTe.QMProDetMarcaID_ORDEN.Value := ProDMMarcajesTe.xDatosTareaID_ORDEN.Value;
           ProDMMarcajesTe.QMProDetMarcaRIG_OF.Value := ProDMMarcajesTe.xDatosTareaRIG_OF.Value;
           ProDMMarcajesTe.QMProDetMarcaLINEA_FASE.Value := ProDMMarcajesTe.xDatosTareaLINEA_FASE.Value;
           ProDMMarcajesTe.QMProDetMarcaLINEA_TAREA.Value := ProDMMarcajesTe.xDatosTareaLINEA_TAREA.Value;
        end;
     end;
     if (DBGFDetalleTe.ColumnaActual = 'LINEA_TAREA') and
        (ProDMMarcajesTe.QMProDetMarca.FieldByName('LINEA_TAREA').AsString <> '') and
        (ProDMMarcajesTe.QMProDetMarca.FieldByName('IDTAREA').AsString = '') then
     begin
        with ProDMMarcajesTe.xDatosTarea do
        begin
           Active := False;
           SelectSQL.Clear;
           SelectSQL.Add(
              'Select * From Pro_Ord_Tarea Where LINEA_TAREA=:VLineaTarea and Rig_Of=:VRig_OF and LINEA_FASE=:VLineaFase');
           Params.ByName['VLineaTarea'].AsInteger :=
              ProDMMarcajesTe.QMProDetMarcaLINEA_TAREA.Value;
           Params.ByName['VLineaFase'].AsInteger :=
              ProDMMarcajesTe.QMProDetMarcaLINEA_FASE.Value;
           Params.ByName['VRig_Of'].AsInteger := ProDMMarcajesTe.QMProDetMarcaRig_Of.Value;
           Active := True;
        end;
        ProDMMarcajesTe.QMProDetMarcaIDTAREA.Value :=
           ProDMMarcajesTe.xDatosTareaIDENTIFICADOR.Value;
     end;
  end;
end;

procedure TProFMMarcajesTE.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMarcajesTE.BusquedaCompleja;
end;

procedure TProFMMarcajesTE.DBGFDetalleTeColEnter(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesTe.QMProDetMarca.State in [dsEdit, dsInsert] then
     case (Sender as TDBGridFind2000).SelectedIndex of
        8:
        begin
           if not ((ProDMMarcajesTe.QMProDetMarcaHORA_INICIO.Value >= 0000) and
              (ProDMMarcajesTe.QMProDetMarcaHORA_INICIO.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));//idioma_code
              (Sender as TDBGridFind2000).SelectedIndex := 7;
           end;
        end;
        9:
        begin
           if not ((ProDMMarcajesTe.QMProDetMarcaHORA_FIN.Value >= 0000) and
              (ProDMMarcajesTe.QMProDetMarcaHORA_FIN.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));//idioma_code
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
           if ProDMMarcajesTe.QMProDetMarcaTiempo.Value < 0 then
           begin
              ShowMessage(_('La hora fin no puede ser inferior a la de inicio')); //idioma_code
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
        end;
     end;
end;

procedure TProFMMarcajesTE.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // sfg.albert - Es treu la lupa de marcatges, perquè no té sentit el resultat
  // G2KTableLoc.CondicionBusqueda := 'serie=''' + REntorno.Serie + '''';
  // G2KTableLoc.Click;
end;

procedure TProFMMarcajesTE.FiltraTE(filtro: string);
begin
  ProDMMarcajesTE.FiltraTE(filtro);
end;

procedure TProFMMarcajesTE.DBGFDetalleTeDblClick(Sender: TObject);
begin
  inherited;
  if (DBGFDetalleTe.ColumnaActual = 'ID_ORDEN') then
     FMain.EjecutaAccion(FMain.AProOrden, ProDMMarcajesTe.QMProDetMarcaID_ORDEN.AsString);
end;

end.
