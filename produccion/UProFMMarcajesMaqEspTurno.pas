{
  Mantenimiento especial de Marcajes de Maquina por Turno:
  - En este mantenimiento se pueden marcar directamente las nuevas tareas,
    y despues se insertaran automaticamente en la Orden de produccion.

  Codigo especial marcado con SFG_RSP
}

unit UProFMMarcajesMaqEspTurno;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DB,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Mask, UFormGest, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  ULFDBEdit, ULFDBEditFind2000, UG2kTBLoc, ULFLabel, Buttons;

type
  TProFMMarcajesMaqEspTurno = class(TFPEdit)
     LOrden: TLFLabel;
     DBEID_Orden: TLFDBEditFind2000;
     LFase: TLFLabel;
     PNLDetMaq: TLFPanel;
     DBGFDetalleMaq: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavDetMaq: THYMNavigator;
     CeDetMaq: TControlEdit;
     CeDetMaqPMEdit: TPopUpTeclas;
     DBEFase: TLFDBEditFind2000;
     LMaquina: TLFLabel;
     DBEMaquina: TLFDBEditFind2000;
     ETitulo_Maquina: TLFDbedit;
     ETitulo_Fase: TLFDbedit;
     SBAOrden: TSpeedButton;
     ALstInforme: TAction;
     ALstEficiencia: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ECompuesto: TLFDbedit;
     DBMNotas: TLFDBMemo;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleMaqBusqueda(Sender: TObject);
     procedure DBGFDetalleMaqColEnter(Sender: TObject);
     procedure DBGFDetalleMaqColExit(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFaseBusqueda(Sender: TObject);
     procedure DBEFaseChange(Sender: TObject);
     procedure DBEMaquinaChange(Sender: TObject);
     procedure ALstInformeExecute(Sender: TObject);
     procedure ALstEficienciaExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMMarcajesMaqEspTurno : TProFMMarcajesMaqEspTurno;

implementation

uses UProDMMarcajesMaqEspTurno, UDMMain, FIBDataSetRO, UEntorno, UFMain,
  UProFMLstInformeMarcajes, UDameDato;

{$R *.dfm}

procedure TProFMMarcajesMaqEspTurno.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMarcajesMaqEspTurno, ProDMMarcajesMaqEspTurno);
  NavMain.DataSource := ProDMMarcajesMaqEspTurno.DSQMProCabMarca;
  DBGMain.DataSource := ProDMMarcajesMaqEspTurno.DSQMProCabMarca;

  G2KTableLoc.DataSource := ProDMMarcajesMaqEspTurno.DSQMProCabMarca;
end;

procedure TProFMMarcajesMaqEspTurno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMarcajesMaqEspTurno);
end;

procedure TProFMMarcajesMaqEspTurno.DBGFDetalleMaqBusqueda(Sender: TObject);
begin
  inherited;
  with (Sender as TDBGridFind2000) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'PRO_ORD_TAREA') and
        (ColumnaActual = 'LINEA_TAREA') then
        CondicionBusqueda := 'ID_ORDEN =' +
           ProDMMarcajesMaqEspTurno.QMProDetMarcaID_ORDEN.AsString + ' AND ' +
           'LINEA_FASE =' + ProDMMarcajesMaqEspTurno.QMProDetMarcaLINEA_FASE.AsString;

     if ((TablaABuscar = 'PRO_TURNOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_SYS_TAREAS') or
        (TablaABuscar = 'PRO_RECURSOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_TURNOS')) then
        CondicionBusqueda := 'EMPRESA =' + IntToStr(REntorno.Empresa);
  end;
end;

procedure TProFMMarcajesMaqEspTurno.DBGFDetalleMaqColEnter(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesMaqEspTurno.QMProDetMarca.State in [dsEdit, dsInsert] then
     case (Sender as TDBGridFind2000).SelectedIndex of
        7:
        begin
           if not ((ProDMMarcajesMaqEspTurno.QMProDetMarcaHORA_INICIO.Value >= 0000) and
              (ProDMMarcajesMaqEspTurno.QMProDetMarcaHORA_INICIO.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));
              (Sender as TDBGridFind2000).SelectedIndex := 6;
           end;
        end;
        8:
        begin
           if not ((ProDMMarcajesMaqEspTurno.QMProDetMarcaHORA_FIN.Value >= 0000) and
              (ProDMMarcajesMaqEspTurno.QMProDetMarcaHORA_FIN.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));
              (Sender as TDBGridFind2000).SelectedIndex := 7;
           end;
           if ProDMMarcajesMaqEspTurno.QMProDetMarcaTiempo.Value < 0 then
           begin
              ShowMessage(_('La hora fin no puede ser inferior a la de inicio'));
              (Sender as TDBGridFind2000).SelectedIndex := 7;
           end;
        end;
     end;
end;

procedure TProFMMarcajesMaqEspTurno.DBGFDetalleMaqColExit(Sender: TObject);
begin
  inherited;
  if (ProDMMarcajesMaqEspTurno.QMProDetMarca.State in [dsEdit, dsInsert]) then
  begin
     if (DBGFDetalleMaq.ColumnaActual = 'IDTAREA') and
        (ProDMMarcajesMaqEspTurno.QMProDetMarca.FieldByName('IDTAREA').AsString <> '') then
     begin
        with ProDMMarcajesMaqEspTurno.xDatosTarea do
        begin
           Active := False;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT * FROM PRO_ORD_TAREA WHERE IDENTIFICADOR = :IDENTIFICADOR');
           Params.ByName['IDENTIFICADOR'].AsInteger := ProDMMarcajesMaqEspTurno.QMProDetMarcaIDTAREA.Value;
           Active := True;
        end;

        if (ProDMMarcajesMaqEspTurno.xDatosTareaIDENTIFICADOR.AsInteger <> 0) then
        begin
           ProDMMarcajesMaqEspTurno.QMProDetMarcaRIG_OF.Value := ProDMMarcajesMaqEspTurno.xDatosTareaRIG_OF.Value;
           ProDMMarcajesMaqEspTurno.QMProDetMarcaLINEA_FASE.Value := ProDMMarcajesMaqEspTurno.xDatosTareaLINEA_FASE.Value;
           ProDMMarcajesMaqEspTurno.QMProDetMarcaLINEA_TAREA.Value := ProDMMarcajesMaqEspTurno.xDatosTareaLINEA_TAREA.Value;
        end;
     end;

     if (DBGFDetalleMaq.ColumnaActual = 'LINEA_TAREA') and
        (ProDMMarcajesMaqEspTurno.QMProDetMarca.FieldByName('LINEA_TAREA').AsString <> '') and
        (ProDMMarcajesMaqEspTurno.QMProDetMarca.FieldByName('IDTAREA').AsString = '') then
     begin
        with ProDMMarcajesMaqEspTurno.xDatosTarea do
        begin
           Active := False;
           SelectSQL.Clear;
           SelectSQL.Add(
              'SELECT * FROM PRO_ORD_TAREA WHERE LINEA_TAREA = :LINEA_TAREA AND RIG_OF = :RIG_OF AND LINEA_FASE = :LINEA_FASE');
           Params.ByName['LINEA_TAREA'].AsInteger := ProDMMarcajesMaqEspTurno.QMProDetMarcaLINEA_TAREA.Value;
           Params.ByName['LINEA_FASE'].AsInteger := ProDMMarcajesMaqEspTurno.QMProDetMarcaLINEA_FASE.Value;
           Params.ByName['RIG_OF'].AsInteger := ProDMMarcajesMaqEspTurno.QMProDetMarcaRig_Of.Value;
           Active := True;
        end;

        ProDMMarcajesMaqEspTurno.QMProDetMarcaIDTAREA.Value := ProDMMarcajesMaqEspTurno.xDatosTareaIDENTIFICADOR.Value;
     end;
  end;
end;

procedure TProFMMarcajesMaqEspTurno.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMarcajesMaqEspTurno.BusquedaCompleja;
end;

procedure TProFMMarcajesMaqEspTurno.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // sfg.albert - Es treu la lupa de marcatges, perquè no té sentit el resultat
  // G2KTableLoc.CondicionBusqueda := 'serie=''' + REntorno.Serie + '''';
  // G2KTableLoc.Click;
end;

procedure TProFMMarcajesMaqEspTurno.DBEFaseBusqueda(Sender: TObject);
begin
  DBEFase.CondicionBusqueda := 'ID_ORDEN =' +
     ProDMMarcajesMaqEspTurno.QMProCabMarcaID_ORDEN.AsString;
end;

procedure TProFMMarcajesMaqEspTurno.DBEFaseChange(Sender: TObject);
begin
  if (DBEFase.Text <> '') then
     ETitulo_Fase.Text := DameTituloFase(DBEFase.Text);
end;

procedure TProFMMarcajesMaqEspTurno.DBEMaquinaChange(Sender: TObject);
begin
  if (DBEMaquina.Text <> '') then
     ETitulo_Maquina.Text := DameTituloMaquina(StrToIntDef(DBEMaquina.Text, 0));
end;

procedure TProFMMarcajesMaqEspTurno.ALstInformeExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstInformeMarcajes, ProFMLstInformeMarcajes, Sender);
  ProFMLstInformeMarcajes.EstablecerGrupo(8208);
end;

procedure TProFMMarcajesMaqEspTurno.ALstEficienciaExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstInformeMarcajes, ProFMLstInformeMarcajes, Sender);
  ProFMLstInformeMarcajes.EstablecerGrupo(8209);
end;

end.
