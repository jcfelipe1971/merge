{
  Mantenimiento especial de Marcajes de Maquina:
  - En este mantenimiento se pueden marcar directamente las nuevas tareas,
    y despues se insertaran automaticamente en la Orden de produccion.

  Codigo especial marcado con SFG_JLA
}

unit UProFMMarcajesMaqEsp;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DB,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Mask, UFormGest, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  ULFDBEdit, ULFDBEditFind2000, UG2kTBLoc, ULFLabel, ULFDBDateEdit;

type
  TProFMMarcajesMaqEsp = class(TFPEdit)
     LMaquina: TLFLabel;
     DBEFMaquina: TLFDBEditFind2000;
     DBEMaquina: TLFDbedit;
     LFecha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LTiempoTotal: TLFLabel;
     DBETiempoTotal: TLFDbedit;
     PNLDetMaq: TLFPanel;
     DBGFDetalleMaq: TDBGridFind2000;
     DBMNotas: TLFDBMemo;
     ToolBar1: TLFToolBar;
     NavDetMaq: THYMNavigator;
     CeDetMaq: TControlEdit;
     CeDetMaqPMEdit: TPopUpTeclas;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleMaqBusqueda(Sender: TObject);
     procedure DBGFDetalleMaqColEnter(Sender: TObject);
     procedure DBGFDetalleMaqColExit(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleMaqDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMMarcajesMaqEsp : TProFMMarcajesMaqEsp;

implementation

uses UProDMMarcajesMaqEsp, UDMMain, FIBDataSetRO, UEntorno, UFMain, UUtiles;

{$R *.dfm}

procedure TProFMMarcajesMaqEsp.FormCreate(Sender: TObject);
var
  Col : integer;
begin
  inherited;
  AbreData(TProDMMarcajesMaqEsp, ProDMMarcajesMaqEsp);
  NavMain.DataSource := ProDMMarcajesMaqEsp.DSQMProCabMarca;
  DBGMain.DataSource := ProDMMarcajesMaqEsp.DSQMProCabMarca;

  G2KTableLoc.DataSource := ProDMMarcajesMaqEsp.DSQMProCabMarca;

  Col := EncuentraField(DBGFDetalleMaq, 'ID_ORDEN');
  if (Col >= 0) then
     DBGFDetalleMaq.Columns[Col].Color := REntorno.ColorEnlaceActivo;
end;

procedure TProFMMarcajesMaqEsp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMarcajesMaqEsp);
end;

procedure TProFMMarcajesMaqEsp.DBGFDetalleMaqBusqueda(Sender: TObject);
begin
  inherited;
  with (Sender as TDBGridFind2000) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (TablaABuscar) = 'PRO_ORD' then
        CondicionBusqueda := 'SITUACION <4';

     if (TablaABuscar) = 'PRO_ORD_FASES' then
        CondicionBusqueda := 'ID_ORDEN =' +
           ProDMMarcajesMaqEsp.QMProDetMarcaID_ORDEN.AsString;

     if (Trim(TablaABuscar) = 'PRO_ORD_TAREA') and
        (ColumnaActual = 'LINEA_TAREA') then
        CondicionBusqueda := 'ID_ORDEN =' +
           ProDMMarcajesMaqEsp.QMProDetMarcaID_ORDEN.AsString + ' AND ' +
           'LINEA_FASE =' + ProDMMarcajesMaqEsp.QMProDetMarcaLINEA_FASE.AsString;

     if ((TablaABuscar = 'PRO_TURNOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_SYS_TAREAS') or
        (TablaABuscar = 'PRO_RECURSOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_TURNOS')) then
        CondicionBusqueda := 'EMPRESA =' + IntToStr(REntorno.Empresa);
  end;
end;

procedure TProFMMarcajesMaqEsp.DBGFDetalleMaqColEnter(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesMaqEsp.QMProDetMarca.State in [dsEdit, dsInsert] then
     case (Sender as TDBGridFind2000).SelectedIndex of
        8:
        begin
           if not ((ProDMMarcajesMaqEsp.QMProDetMarcaHORA_INICIO.Value >= 0000) and
              (ProDMMarcajesMaqEsp.QMProDetMarcaHORA_INICIO.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));
              (Sender as TDBGridFind2000).SelectedIndex := 7;
           end;
        end;
        9:
        begin
           if not ((ProDMMarcajesMaqEsp.QMProDetMarcaHORA_FIN.Value >= 0000) and
              (ProDMMarcajesMaqEsp.QMProDetMarcaHORA_FIN.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
           if ProDMMarcajesMaqEsp.QMProDetMarcaTiempo.Value < 0 then
           begin
              ShowMessage(_('La hora fin no puede ser inferior a la de inicio'));
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
        end;
     end;
end;

procedure TProFMMarcajesMaqEsp.DBGFDetalleMaqColExit(Sender: TObject);
begin
  inherited;
  ProDMMarcajesMaqEsp.CalculaCampos(DBGFDetalleMaq.ColumnaActual);
end;

procedure TProFMMarcajesMaqEsp.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMarcajesMaqEsp.BusquedaCompleja;
end;

procedure TProFMMarcajesMaqEsp.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + REntorno.Serie + ''' AND TIPO=''HM'' ';
  G2KTableLoc.Click;
end;

procedure TProFMMarcajesMaqEsp.DBGFDetalleMaqDblClick(Sender: TObject);
begin
  inherited;
  if (DBGFDetalleMaq.ColumnaActual = 'ID_ORDEN') then
     FMain.EjecutaAccion(FMain.AProOrden, ProDMMarcajesMaqEsp.QMProDetMarcaID_ORDEN.AsString);
end;

end.
