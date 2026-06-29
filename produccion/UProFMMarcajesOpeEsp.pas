{
  Mantenimiento especial de Marcajes de Operario:
  - En este mantenimiento se pueden marcar directamente las nuevas tareas,
    y despues se insertaran automaticamente en la Orden de produccion.

  Codigo especial marcado con SFG_JLA
}

unit UProFMMarcajesOpeEsp;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, DB,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UDBDateTimePicker, StdCtrls, Mask, DBCtrls, UFormGest,
  rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  ULFDBEdit, ULFDBEditFind2000, UG2kTBLoc, Buttons, ULFLabel, ULFDBDateEdit;

type
  TProFMMarcajesOpeEsp = class(TFPEdit)
     PNLDetMO: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     LOperario: TLFLabel;
     DBEFOperario: TLFDBEditFind2000;
     DBEDescOperario: TLFDbedit;
     LFecha: TLFLabel;
     DBDateTimePicker4: TLFDBDateEdit;
     LTotalHoras: TLFLabel;
     DBETotalHoras: TLFDbedit;
     CEDetMO: TControlEdit;
     CEDetMOPMEdit: TPopUpTeclas;
     DBMNotas: TLFDBMemo;
     SBAOperario: TSpeedButton;
     ALOperario: TLFActionList;
     AAOperario: TAction;
     DBGFDetalle: TDBGridFind2000;
     ARecalcula: TAction;
     LFCategoryAction1: TLFCategoryAction;
     DBERIG: TLFDbedit;
     LRIG: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleColExit(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure SBAOperarioDblClick(Sender: TObject);
     procedure AAOperarioExecute(Sender: TObject);
     procedure ARecalculaExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBEFOperarioChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMMarcajesOpeEsp : TProFMMarcajesOpeEsp;

implementation

uses UDMMain, UProDMMarcajesOpeEsp, UEntorno, UFMain, UUtiles, HYFIBQuery, UParam;

{$R *.dfm}

procedure TProFMMarcajesOpeEsp.FormCreate(Sender: TObject);
var
  c : integer;
  Param_TARTIEM001 : string;
begin
  inherited;
  AbreData(TProDMMarcajesOpeEsp, ProDMMarcajesOpeEsp);
  NavMain.DataSource := ProDMMarcajesOpeEsp.DSQMProCabMarca;
  DBGMain.DataSource := ProDMMarcajesOpeEsp.DSQMProCabMarca;

  G2KTableLoc.DataSource := ProDMMarcajesOpeEsp.DSQMProCabMarca;
  DBEDescOperario.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAOperario, DBEDescOperario);

  Param_TARTIEM001 := LeeParametro('TARTIEM001', REntorno.Serie);

  c := EncuentraField(DBGFDetalle, 'ID_ORDEN');
  if (c >= 0) then
  begin
     DBGFDetalle.Columns[c].Color := REntorno.ColorEnlaceActivo;
     DBGFDetalle.ColumnaInicial := c;
  end;

  c := EncuentraField(DBGFDetalle, 'TIEMPO');
  if (c >= 0) then
     if (Param_TARTIEM001 = 'S') then
     begin
        DBGFDetalle.Columns[c].ReadOnly := False;
        DBGFDetalle.Columns[c].Color := clWindow;
     end
     else
     begin
        DBGFDetalle.Columns[c].ReadOnly := True;
        DBGFDetalle.Columns[c].Color := clInfoBk;
     end;

  c := EncuentraField(DBGFDetalle, 'HORA_INICIO');
  if (c >= 0) then
     if (Param_TARTIEM001 = 'S') then
     begin
        DBGFDetalle.Columns[c].ReadOnly := True;
        DBGFDetalle.Columns[c].Color := clInfoBk;
     end
     else
     begin
        DBGFDetalle.Columns[c].ReadOnly := False;
        DBGFDetalle.Columns[c].Color := clWindow;
     end;

  c := EncuentraField(DBGFDetalle, 'HORA_FIN');
  if (c >= 0) then
     if (Param_TARTIEM001 = 'S') then
     begin
        DBGFDetalle.Columns[c].ReadOnly := True;
        DBGFDetalle.Columns[c].Color := clInfoBk;
     end
     else
     begin
        DBGFDetalle.Columns[c].ReadOnly := False;
        DBGFDetalle.Columns[c].Color := clWindow;
     end;
end;

procedure TProFMMarcajesOpeEsp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMarcajesOpeEsp);
end;

procedure TProFMMarcajesOpeEsp.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  with (Sender as TDBGridFind2000) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (TablaABuscar) = 'PRO_ORD' then
        CondicionBusqueda := 'EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CANAL = ' + IntToStr(REntorno.Canal) + ' AND SERIES = ''' + ProDMMarcajesOpeEsp.QMProCabMarcaSERIE.AsString + ''' AND SITUACION < 4';

     //SFG.Albert: Es busca nomes les imputacions d'aquell operari
     if (TablaABuscar) = 'OPE_EMPLEADO_PRE' then
        CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr + ' AND EMPLEADO=' + ProDMMarcajesOpeEsp.QMProCabMarcaOPERARIO.AsString;

     if ((TablaABuscar = 'PRO_TURNOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_SYS_TAREAS') or
        (TablaABuscar = 'PRO_RECURSOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_TURNOS')) then
        CondicionBusqueda := 'EMPRESA = ' + IntToStr(REntorno.Empresa);
  end;
end;

procedure TProFMMarcajesOpeEsp.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesOpeEsp.QMProDetMarca.State in [dsEdit, dsInsert] then
     case (Sender as TDBGridFind2000).SelectedIndex of
        8:
        begin
           if not ((ProDMMarcajesOpeEsp.QMProDetMarcaHORA_INICIO.Value >= 0000) and
              (ProDMMarcajesOpeEsp.QMProDetMarcaHORA_INICIO.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));
              (Sender as TDBGridFind2000).SelectedIndex := 7;
           end;
        end;
        9:
        begin
           if not ((ProDMMarcajesOpeEsp.QMProDetMarcaHORA_FIN.Value >= 0000) and
              (ProDMMarcajesOpeEsp.QMProDetMarcaHORA_FIN.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
           if ProDMMarcajesOpeEsp.QMProDetMarcaTiempo.Value < 0 then
           begin
              ShowMessage(_('La hora fin no puede ser inferior a la de inicio'));
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
        end;
     end;
end;

procedure TProFMMarcajesOpeEsp.DBGFDetalleColExit(Sender: TObject);
begin
  if ProDMMarcajesOpeEsp.QMProDetMarca.State in [dsEdit, dsInsert] then
  begin
     if (DBGFDetalle.ColumnaActual = 'IDTAREA') and
        (ProDMMarcajesOpeEsp.QMProDetMarca.FieldByName('IDTAREA').AsString <> '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT IDENTIFICADOR, RIG_OF, LINEA_FASE, LINEA_TAREA FROM PRO_ORD_TAREA WHERE IDENTIFICADOR = :IDENTIFICADOR';
              Params.ByName['IDENTIFICADOR'].AsInteger := ProDMMarcajesOpeEsp.QMProDetMarcaIDTAREA.AsInteger;
              ExecQuery;
              if (FieldByName['IDENTIFICADOR'].AsInteger <> 0) then
              begin
                 ProDMMarcajesOpeEsp.QMProDetMarcaRIG_OF.AsInteger := FieldByName['RIG_OF'].AsInteger;
                 ProDMMarcajesOpeEsp.QMProDetMarcaLINEA_FASE.AsInteger := FieldByName['LINEA_FASE'].AsInteger;
                 ProDMMarcajesOpeEsp.QMProDetMarcaLINEA_TAREA.AsInteger := FieldByName['LINEA_TAREA'].AsInteger;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if (DBGFDetalle.ColumnaActual = 'LINEA_TAREA') and
        (ProDMMarcajesOpeEsp.QMProDetMarca.FieldByName('LINEA_TAREA').AsString <> '') and
        (ProDMMarcajesOpeEsp.QMProDetMarca.FieldByName('IDTAREA').AsString = '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT * FROM PRO_ORD_TAREA WHERE ID_ORDEN = :ID_ORDEN AND AND RIG_OF = :RIG_OF AND LINEA_FASE = :LINEA_FASE LINEA_TAREA = :LINEA_TAREA';
              Params.ByName['ID_ORDEN'].AsInteger := ProDMMarcajesOpeEsp.QMProDetMarcaID_ORDEN.AsInteger;
              Params.ByName['RIG_OF'].AsInteger := ProDMMarcajesOpeEsp.QMProDetMarcaRIG_OF.AsInteger;
              Params.ByName['LINEA_FASE'].AsInteger := ProDMMarcajesOpeEsp.QMProDetMarcaLINEA_FASE.AsInteger;
              Params.ByName['LINEA_TAREA'].AsInteger := ProDMMarcajesOpeEsp.QMProDetMarcaLINEA_TAREA.AsInteger;
              ExecQuery;
              ProDMMarcajesOpeEsp.QMProDetMarcaIDTAREA.AsInteger := FieldByName['IDENTIFICADOR'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TProFMMarcajesOpeEsp.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMarcajesOpeEsp.BusquedaCompleja;
end;

procedure TProFMMarcajesOpeEsp.SBAOperarioDblClick(Sender: TObject);
begin
  inherited;
  AAOperario.Execute;
end;

procedure TProFMMarcajesOpeEsp.AAOperarioExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO = ''' +
     ProDMMarcajesOpeEsp.QMProCabMarcaOPERARIO.AsString + '''');
end;

// Proceso para recalcular tiempos en marcajes
procedure TProFMMarcajesOpeEsp.ARecalculaExecute(Sender: TObject);
begin
  inherited;
  ProDMMarcajesOpeEsp.RecalculaTiempo;
end;

procedure TProFMMarcajesOpeEsp.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (DBGFDetalle.ColumnaActual = 'ID_ORDEN') then
     FMain.EjecutaAccion(FMain.AProOrden, ProDMMarcajesOpeEsp.QMProDetMarcaID_ORDEN.AsString);
end;

procedure TProFMMarcajesOpeEsp.DBEFOperarioChange(Sender: TObject);
var
  i : integer;
begin
  inherited;

  // Depende del tipo de imputación del operario, muestro en el grid la impitación o recurso
  // Recurso
  i := EncuentraField(DBGFDetalle, 'RECURSO');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1)
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'RECURSO';
        Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1);
     end;
  end;

  // Descripción Recurso
  i := EncuentraField(DBGFDetalle, 'TITULO_RECURSO');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1)
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'TITULO_RECURSO';
        Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1);
     end;
  end;

  // Imputación
  i := EncuentraField(DBGFDetalle, 'IMPUTACION');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1)
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'IMPUTACION';
        Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1);
     end;
  end;

  // Descripción Imputación
  i := EncuentraField(DBGFDetalle, 'TITULO_IMPUTACION');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1)
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'TITULO_IMPUTACION';
        Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1);
     end;
  end;

  // Cantidad Imputación
  i := EncuentraField(DBGFDetalle, 'CANTIDAD');
  if (i >= 0) then
     DBGFDetalle.Columns.Items[i].Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1)
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'CANTIDAD';
        Visible := (ProDMMarcajesOpeEsp.QMProCabMarcaTIPOIMPUTACION.AsInteger = 1);
     end;
  end;
end;

procedure TProFMMarcajesOpeEsp.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + REntorno.Serie + ''' AND TIPO=''MO'' ';
  G2kTableLoc.Click;
end;

end.
