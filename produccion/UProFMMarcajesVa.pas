unit UProFMMarcajesVa;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, DBCtrls, UFIBDBEditfind, DB,
  UComponentesBusquedaFiltrada, ComCtrls, UDBDateTimePicker, Mask, Menus,
  UTeclas, UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, UFormGest, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBMemo, ULFDBEditFind2000, ULFDBEdit, UG2kTBLoc, ULFLabel, ULFDBDateEdit;

type
  TProFMMarcajesVa = class(TFPEdit)
     PNLDetVa: TLFPanel;
     Label11: TLFLabel;
     DBEdit7: TLFDbedit;
     Label9: TLFLabel;
     DBDateTimePicker3: TLFDBDateEdit;
     Label10: TLFLabel;
     DBEdit6: TLFDbedit;
     ToolBar1: TLFToolBar;
     DBGFDetalleVa: TDBGridFind2000;
     NavDetalleVar: THYMNavigator;
     DBMemo1: TLFDBMemo;
     CeDetVa: TControlEdit;
     CeDetVaPMEdit: TPopUpTeclas;
     DBEditFind20001: TLFDBEditFind2000;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleVaBusqueda(Sender: TObject);
     procedure DBGFDetalleVaColEnter(Sender: TObject);
     procedure DBGFDetalleVaColExit(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleVaDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraVA(filtro: string);
  end;

var
  ProFMMarcajesVa : TProFMMarcajesVa;

implementation

uses UProDMMarcajesVa, UDMMain, UEntorno, UFMain;

{$R *.dfm}

procedure TProFMMarcajesVa.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMarcajesVa, ProDMMarcajesVa);
  NavMain.DataSource := ProDMMarcajesVa.DSQMProCabMarca;
  DBGMain.DataSource := ProDMMarcajesVa.DSQMProCabMarca;

  G2KTableLoc.DataSource := ProDMMarcajesVa.DSQMProCabMarca;
  DBGFDetalleVa.Columns[2].Color := REntorno.ColorEnlaceActivo;
end;

procedure TProFMMarcajesVa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMarcajesVa);
end;

procedure TProFMMarcajesVa.DBGFDetalleVaBusqueda(Sender: TObject);
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
           ' AND TIPO_RECURSO=''VAR''';

     if (TablaABuscar) = 'PRO_ORD_FASES' then
        CondicionBusqueda := 'RIG_OF =' +
           ProDMMarcajesVa.QMProDetMarcaRIG_OF.AsString;

     if (Trim(TablaABuscar) = 'PRO_ORD_TAREA') and
        (ColumnaActual = 'LINEA_TAREA') then
        CondicionBusqueda := 'RIG_OF =' +
           ProDMMarcajesVa.QMProDetMarcaRIG_OF.AsString + ' AND ' +
           'LINEA_FASE =' + ProDMMarcajesVa.QMProDetMarcaLINEA_FASE.AsString;

     if ((TablaABuscar = 'PRO_TURNOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_SYS_TAREAS') or
        (TablaABuscar = 'PRO_RECURSOS') or
        (TablaABuscar = 'PRO_CAUSAS') or
        (TablaABuscar = 'PRO_TURNOS')) then
        CondicionBusqueda := 'EMPRESA =' + IntToStr(REntorno.Empresa);
  end;
end;

procedure TProFMMarcajesVa.DBGFDetalleVaColEnter(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesVa.QMProDetMarca.State in [dsEdit, dsInsert] then
     case (Sender as TDBGridFind2000).SelectedIndex of
        8:
        begin
           if not ((ProDMMarcajesVa.QMProDetMarcaHORA_INICIO.Value >= 0000) and
              (ProDMMarcajesVa.QMProDetMarcaHORA_INICIO.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));//idioma_code
              (Sender as TDBGridFind2000).SelectedIndex := 7;
           end;
        end;
        9:
        begin
           if not ((ProDMMarcajesVa.QMProDetMarcaHORA_FIN.Value >= 0000) and
              (ProDMMarcajesVa.QMProDetMarcaHORA_FIN.Value <= 2400)) then
           begin
              ShowMessage(_('Hora incorrecta'));//idioma_code
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
           if ProDMMarcajesVa.QMProDetMarcaTiempo.Value < 0 then
           begin
              ShowMessage(_('La hora fin no puede ser inferior a la de inicio'));//idioma_code
              (Sender as TDBGridFind2000).SelectedIndex := 8;
           end;
        end;
     end;
end;

procedure TProFMMarcajesVa.DBGFDetalleVaColExit(Sender: TObject);
begin
  inherited;
  if ProDMMarcajesVa.QMProDetMarca.State in [dsEdit, dsInsert] then
  begin
     if (DBGFDetalleVa.ColumnaActual = 'IDTAREA') and
        (ProDMMarcajesVa.QMProDetMarca.FieldByName('IDTAREA').AsString <> '') then
     begin
        with ProDMMarcajesVa.xDatosTarea do
        begin
           Active := False;
           SelectSQL.Clear;
           SelectSQL.Add('Select * From Pro_Ord_Tarea Where IDENTIFICADOR=:VIdTarea');
           Params.ByName['VIdTarea'].AsInteger := ProDMMarcajesVa.QMProDetMarcaIDTAREA.Value;
           Active := True;
        end;
        if (ProDMMarcajesVa.xDatosTarea.Fields[24].AsInteger <> 0) then
        begin
           ProDMMarcajesVa.QMProDetMarcaID_ORDEN.Value := ProDMMarcajesva.xDatosTareaID_ORDEN.Value;
           ProDMMarcajesVa.QMProDetMarcaRIG_OF.Value := ProDMMarcajesVa.xDatosTareaRIG_OF.Value;
           ProDMMarcajesVa.QMProDetMarcaLINEA_FASE.Value := ProDMMarcajesVa.xDatosTareaLINEA_FASE.Value;
           ProDMMarcajesVa.QMProDetMarcaLINEA_TAREA.Value := ProDMMarcajesVa.xDatosTareaLINEA_TAREA.Value;
        end;
     end;
     if (DBGFDetalleVa.ColumnaActual = 'LINEA_TAREA') and
        (ProDMMarcajesVa.QMProDetMarca.FieldByName('LINEA_TAREA').AsString <> '') and
        (ProDMMarcajesVa.QMProDetMarca.FieldByName('IDTAREA').AsString = '') then
     begin
        with ProDMMarcajesVa.xDatosTarea do
        begin
           Active := False;
           SelectSQL.Clear;
           SelectSQL.Add(
              'Select * From Pro_Ord_Tarea Where LINEA_TAREA=:VLineaTarea and Rig_Of=:VRig_OF and LINEA_FASE=:VLineaFase');
           Params.ByName['VLineaTarea'].AsInteger :=
              ProDMMarcajesVa.QMProDetMarcaLINEA_TAREA.Value;
           Params.ByName['VLineaFase'].AsInteger :=
              ProDMMarcajesVa.QMProDetMarcaLINEA_FASE.Value;
           Params.ByName['VRig_Of'].AsInteger := ProDMMarcajesVa.QMProDetMarcaRig_Of.Value;
           Active := True;
        end;
        ProDMMarcajesVa.QMProDetMarcaIDTAREA.Value := ProDMMarcajesVa.xDatosTareaIDENTIFICADOR.Value;
     end;
  end;
end;

procedure TProFMMarcajesVa.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMarcajesVa.BusquedaCompleja;
end;

procedure TProFMMarcajesVa.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // sfg.albert - Es treu la lupa de marcatges, perquè no té sentit el resultat
  // G2KTableLoc.CondicionBusqueda := 'serie=''' + REntorno.Serie + '''';
  // G2KTableLoc.Click;
end;

procedure TProFMMarcajesVa.FiltraVA(filtro: string);
begin
  ProDMMarcajesVa.FiltraVA(filtro);
end;

procedure TProFMMarcajesVa.DBGFDetalleVaDblClick(Sender: TObject);
begin
  inherited;
  if (DBGFDetalleVa.ColumnaActual = 'ID_ORDEN') then
     FMain.EjecutaAccion(FMain.AProOrden, ProDMMarcajesVa.QMProDetMarcaID_ORDEN.AsString);
end;

end.
