unit UProFMMarcajesOpe;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, DB,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UDBDateTimePicker, StdCtrls, Mask, DBCtrls, UFormGest,
  rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  ULFDBEdit, ULFDBEditFind2000, UG2kTBLoc, Buttons, ULFLabel, ULFDBDateEdit,
  UFPEditDetalle, ULFEdit;

type
  TProFMMarcajesOpe = class(TFPEditDetalle)
     LOperario: TLFLabel;
     DBEFOperario: TLFDBEditFind2000;
     EDescOperario: TLFEdit;
     LFecha: TLFLabel;
     DBDateTimePicker4: TLFDBDateEdit;
     LTotalHoras: TLFLabel;
     DBETotalHoras: TLFDbedit;
     DBMNotas: TLFDBMemo;
     SBAOperario: TSpeedButton;
     ALOperario: TLFActionList;
     AAOperario: TAction;
     LMarcaje: TLFLabel;
     DBEMarcaje: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleColExit(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure SBAOperarioDblClick(Sender: TObject);
     procedure AAOperarioExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBEFOperarioChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraOperario(Filtro: string);
  end;

var
  ProFMMarcajesOpe : TProFMMarcajesOpe;

implementation

uses UDMMain, UProDMMarcajesOpe, UEntorno, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TProFMMarcajesOpe.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMarcajesOpe, ProDMMarcajesOpe);
  NavMain.DataSource := ProDMMarcajesOpe.DSQMProCabMarca;
  DBGMain.DataSource := ProDMMarcajesOpe.DSQMProCabMarca;
  NavDetalle.DataSource := ProDMMarcajesOpe.DSQMProDetMarca;
  DBGFDetalle.DataSource := ProDMMarcajesOpe.DSQMProDetMarca;

  G2KTableLoc.DataSource := ProDMMarcajesOpe.DSQMProCabMarca;
  EDescOperario.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAOperario, EDescOperario);

  if (EncuentraField(DBGFDetalle, 'ID_ORDEN') >= 0) then
     DBGFDetalle.Columns[EncuentraField(DBGFDetalle, 'ID_ORDEN')].Color := REntorno.ColorEnlaceActivo;
end;

procedure TProFMMarcajesOpe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMarcajesOpe);
end;

procedure TProFMMarcajesOpe.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     // SFG.Albert: Es busca nomes les imputacions d'aquell operari
     if (TablaABuscar) = 'OPE_EMPLEADO_PRE' then
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           'AND EMPLEADO=' + IntToStr(ProDMMarcajesOpe.QMProCabMarcaOPERARIO.AsInteger);

     if (TablaABuscar) = 'PRO_VER_TAREAS_ABIERTAS' then
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO<=' + REntorno.EjercicioStr +
           ' AND CANAL=' + REntorno.CanalStr +
           ' AND SERIE=''' + REntorno.Serie + '''' +
           ' AND TIPO_RECURSO=''MO''';

     if (TablaABuscar) = 'PRO_ORD_FASES' then
        CondicionBusqueda := 'ID_ORDEN =' +
           IntToStr(ProDMMarcajesOpe.QMProDetMarcaID_ORDEN.AsInteger);

     if (Trim(TablaABuscar) = 'PRO_ORD_TAREA') and
        (ColumnaActual = 'LINEA_TAREA') then
        CondicionBusqueda := 'ID_ORDEN =' +
           IntToStr(ProDMMarcajesOpe.QMProDetMarcaID_ORDEN.AsInteger) + ' AND ' +
           'LINEA_FASE =' + IntToStr(ProDMMarcajesOpe.QMProDetMarcaLINEA_FASE.AsInteger);

     if ((TablaABuscar = 'PRO_TURNOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_SYS_TAREAS') or
        (TablaABuscar = 'PRO_RECURSOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_TURNOS')) then
        CondicionBusqueda := 'EMPRESA =' + IntToStr(REntorno.Empresa);
  end;
end;

procedure TProFMMarcajesOpe.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesOpe.QMProDetMarca.State in [dsEdit, dsInsert] then
     case (Sender as TDBGridFind2000).SelectedIndex of
        8:
        begin
           if not ((ProDMMarcajesOpe.QMProDetMarcaHORA_INICIO.Value >= 0000) and
              (ProDMMarcajesOpe.QMProDetMarcaHORA_INICIO.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));
              (Sender as TDBGridFind2000).SelectedIndex := 7;
           end;
        end;
        9:
        begin
           if not ((ProDMMarcajesOpe.QMProDetMarcaHORA_FIN.Value >= 0000) and
              (ProDMMarcajesOpe.QMProDetMarcaHORA_FIN.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
           if ProDMMarcajesOpe.QMProDetMarcaTiempo.Value < 0 then
           begin
              ShowMessage(_('La hora fin no puede ser inferior a la de inicio'));
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
        end;
     end;
end;

procedure TProFMMarcajesOpe.DBGFDetalleColExit(Sender: TObject);
begin
  if ProDMMarcajesOpe.QMProDetMarca.State in [dsEdit, dsInsert] then
  begin
     if (DBGFDetalle.ColumnaActual = 'IDTAREA') and
        (ProDMMarcajesOpe.QMProDetMarca.FieldByName('IDTAREA').AsString <> '') then
     begin
        with ProDMMarcajesOpe.xDatosTarea do
        begin
           Active := False;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT * FROM PRO_ORD_TAREA WHERE IDENTIFICADOR = :IDENTIFICADOR');
           Params.ByName['IDENTIFICADOR'].AsInteger := ProDMMarcajesOpe.QMProDetMarcaIDTAREA.Value;
           Active := True;
        end;

        if (ProDMMarcajesOpe.xDatosTarea.FieldByName('IDENTIFICADOR').AsInteger <> 0) then
        begin
           ProDMMarcajesOpe.QMProDetMarcaID_ORDEN.Value := ProDMMarcajesOpe.xDatosTareaID_ORDEN.Value;
           ProDMMarcajesOpe.QMProDetMarcaRIG_OF.Value := ProDMMarcajesOpe.xDatosTareaRIG_OF.Value;
           ProDMMarcajesOpe.QMProDetMarcaLINEA_FASE.Value := ProDMMarcajesOpe.xDatosTareaLINEA_FASE.Value;
           ProDMMarcajesOpe.QMProDetMarcaLINEA_TAREA.Value := ProDMMarcajesOpe.xDatosTareaLINEA_TAREA.Value;
        end;
     end;
     if (DBGFDetalle.ColumnaActual = 'LINEA_TAREA') and
        (ProDMMarcajesOpe.QMProDetMarca.FieldByName('LINEA_TAREA').AsString <> '') and
        (ProDMMarcajesOpe.QMProDetMarca.FieldByName('IDTAREA').AsString = '') then
     begin
        with ProDMMarcajesOpe.xDatosTarea do
        begin
           Active := False;
           SelectSQL.Clear;
           SelectSQL.Add(
              'SELECT * FROM PRO_ORD_TAREA WHERE LINEA_TAREA = :LINEA_TAREA AND ID_ORDEN = :ID_ORDEN AND LINEA_FASE = :LINE_AFASE');
           Params.ByName['LINEA_TAREA'].AsInteger := ProDMMarcajesOpe.QMProDetMarcaLINEA_TAREA.Value;
           Params.ByName['LINEA_FASE'].AsInteger := ProDMMarcajesOpe.QMProDetMarcaLINEA_FASE.Value;
           Params.ByName['ID_ORDEN'].AsInteger := ProDMMarcajesOpe.QMProDetMarcaId_orden.Value;
           Active := True;
        end;
        ProDMMarcajesOpe.QMProDetMarcaIDTAREA.Value := ProDMMarcajesOpe.xDatosTareaIDENTIFICADOR.Value;
     end;
  end;
end;

procedure TProFMMarcajesOpe.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMarcajesOpe.BusquedaCompleja;
end;

procedure TProFMMarcajesOpe.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // sfg.albert - Es treu la lupa de marcatges, perquè no té sentit el resultat
  // G2KTableLoc.CondicionBusqueda := 'serie=''' + REntorno.Serie + '''';
  // G2KTableLoc.Click;
end;

procedure TProFMMarcajesOpe.SBAOperarioDblClick(Sender: TObject);
begin
  inherited;
  AAOperario.Execute;
end;

procedure TProFMMarcajesOpe.AAOperarioExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO = ''' +
     ProDMMarcajesOpe.QMProCabMarcaOPERARIO.AsString + '''');
end;

procedure TProFMMarcajesOpe.FiltraOperario(Filtro: string);
begin
  ProDMMarcajesOpe.FiltraOperario(Filtro);
end;

procedure TProFMMarcajesOpe.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (DBGFDetalle.ColumnaActual = 'ID_ORDEN') then
     FMain.EjecutaAccion(FMain.AProOrden, ProDMMarcajesOpe.QMProDetMarcaID_ORDEN.AsString);
end;

procedure TProFMMarcajesOpe.DBEFOperarioChange(Sender: TObject);
begin
  inherited;
  EDescOperario.Text := DameTituloEmpleado(ProDMMarcajesOpe.QMProCabMarcaOPERARIO.AsInteger);
end;

end.
