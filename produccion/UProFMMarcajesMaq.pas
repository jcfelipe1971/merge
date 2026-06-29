unit UProFMMarcajesMaq;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DB,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Mask, UFormGest, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  ULFDBEdit, ULFDBEditFind2000, UG2kTBLoc, ULFLabel, ULFDBDateEdit, ULFEdit;

type
  TProFMMarcajesMaq = class(TFPEdit)
     LMaquina: TLFLabel;
     DBEFMaquina: TLFDBEditFind2000;
     DBEDescripcionMaquina: TLFDbedit;
     LFecha: TLFLabel;
     DBDateTimePicker1: TLFDBDateEdit;
     LHorasLab: TLFLabel;
     DBETiempoTotal: TLFDbedit;
     PNLDetMaq: TLFPanel;
     DBGFDetalleMaq: TDBGridFind2000;
     DBMNotas: TLFDBMemo;
     TBDetalle: TLFToolBar;
     NavDetMaq: THYMNavigator;
     CeDetMaq: TControlEdit;
     CeDetMaqPMEdit: TPopUpTeclas;
     LOperario: TLFLabel;
     DBEFOperario: TLFDBEditFind2000;
     ETitOperario: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleMaqBusqueda(Sender: TObject);
     procedure DBGFDetalleMaqColExit(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleMaqDblClick(Sender: TObject);
     procedure DBEFOperarioChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraMaquina(filtro: string);
  end;

var
  ProFMMarcajesMaq : TProFMMarcajesMaq;

implementation

uses UProDMMarcajesMaq, UDMMain, FIBDataSetRO, UEntorno, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TProFMMarcajesMaq.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMarcajesMaq, ProDMMarcajesMaq);
  NavMain.DataSource := ProDMMarcajesMaq.DSQMProCabMarca;
  DBGMain.DataSource := ProDMMarcajesMaq.DSQMProCabMarca;

  G2KTableLoc.DataSource := ProDMMarcajesMaq.DSQMProCabMarca;

  DBGFDetalleMaq.Columns[EncuentraField(DBGFDetalleMaq, 'ID_ORDEN')].Color := REntorno.ColorEnlaceActivo;
  DBGFDetalleMaq.Columns[EncuentraField(DBGFDetalleMaq, 'COMPUESTO')].Color := REntorno.ColorEnlaceActivo;
end;

procedure TProFMMarcajesMaq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMarcajesMaq);
end;

procedure TProFMMarcajesMaq.DBGFDetalleMaqBusqueda(Sender: TObject);
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
           ' AND TIPO_RECURSO=''HM''';

     if (TablaABuscar) = 'PRO_ORD_FASES' then
        CondicionBusqueda := 'ID_ORDEN =' +
           ProDMMarcajesMaq.QMProDetMarcaID_ORDEN.AsString;

     if (Trim(TablaABuscar) = 'PRO_ORD_TAREA') and
        (ColumnaActual = 'LINEA_TAREA') then
        CondicionBusqueda := 'ID_ORDEN =' +
           ProDMMarcajesMaq.QMProDetMarcaID_ORDEN.AsString + ' AND ' +
           'LINEA_FASE =' + ProDMMarcajesMaq.QMProDetMarcaLINEA_FASE.AsString;

     if ((TablaABuscar = 'PRO_TURNOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_SYS_TAREAS') or
        (TablaABuscar = 'PRO_RECURSOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_TURNOS')) then
        CondicionBusqueda := 'EMPRESA =' + IntToStr(REntorno.Empresa);
  end;
end;

procedure TProFMMarcajesMaq.DBGFDetalleMaqColExit(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesMaq.QMProDetMarca.State in [dsEdit, dsInsert] then
  begin
     if ((Sender as TDBGridFind2000).SelectedField.FieldName = 'HORA_INICIO') then
     begin
        if not ((ProDMMarcajesMaq.QMProDetMarcaHORA_INICIO.Value >= 0000) and
           (ProDMMarcajesMaq.QMProDetMarcaHORA_INICIO.Value < 2400)) then
        begin
           ShowMessage(_('Hora incorrecta'));
           (Sender as TDBGridFind2000).SelectedIndex := EncuentraField((Sender as TDBGridFind2000), 'HORA_INICIO');
        end;
     end
     else
     if ((Sender as TDBGridFind2000).SelectedField.FieldName = 'HORA_FIN') then
     begin
        if not ((ProDMMarcajesMaq.QMProDetMarcaHORA_FIN.Value >= 0000) and
           (ProDMMarcajesMaq.QMProDetMarcaHORA_FIN.Value < 2400)) then
        begin
           ShowMessage(_('Hora incorrecta'));
           (Sender as TDBGridFind2000).SelectedIndex := EncuentraField((Sender as TDBGridFind2000), 'HORA_FIN');
        end;
        if ProDMMarcajesMaq.QMProDetMarcaTiempo.Value < 0 then
        begin
           ShowMessage(_('La hora fin no puede ser inferior a la de inicio'));
           // (Sender as TDBGridFind2000).SelectedIndex := EncuentraField((Sender as TDBGridFind2000), 'HORA_FIN');
        end;
     end;
  end;
end;

procedure TProFMMarcajesMaq.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMarcajesMaq.BusquedaCompleja;
end;

procedure TProFMMarcajesMaq.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // G2KTableLoc.CondicionBusqueda := 'serie=''' + REntorno.Serie + '''';
  // G2KTableLoc.Click;
end;

procedure TProFMMarcajesMaq.FiltraMaquina(filtro: string);
begin
  ProDMMarcajesMaq.FiltraMaquina(filtro);
end;

procedure TProFMMarcajesMaq.DBGFDetalleMaqDblClick(Sender: TObject);
begin
  inherited;
  if (DBGFDetalleMaq.ColumnaActual = 'ID_ORDEN') then
     FMain.EjecutaAccion(FMain.AProOrden, ProDMMarcajesMaq.QMProDetMarcaID_ORDEN.AsString);

  if (DBGFDetalleMaq.ColumnaActual = 'COMPUESTO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO=''' + ProDMMarcajesMaq.xCompuestoOPCOMPUESTO.AsString + '''');
end;

procedure TProFMMarcajesMaq.DBEFOperarioChange(Sender: TObject);
begin
  inherited;
  ETitOperario.Text := DameTituloEmpleado(StrToIntDef(DBEFOperario.Text, 0));
end;

end.
