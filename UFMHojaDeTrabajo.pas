unit UFMHojaDeTrabajo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEdit,
  StdCtrls, ULFLabel, DBCtrls, ULFDBMemo, Mask, ULFDBEdit;

type
  TFMHojaDeTrabajo = class(TFPEditSimple)
     PNLDisponible: TLFPanel;
     PNLAsignado: TLFPanel;
     DBGDisponible: TDBGridFind2000;
     DBGAsignado: TDBGridFind2000;
     TBSep6: TToolButton;
     PNLSeccion: TLFPanel;
     LSeccion: TLFLabel;
     EFSeccion: TEditFind2000;
     ESeccion: TLFEdit;
     TBAsignado: TLFToolBar;
     NavDetalle: THYMNavigator;
     TBSep3: TToolButton;
     TButtSubirPrioridad: TToolButton;
     TButtBajarPrioridad: TToolButton;
     ASubirPrioridad: TAction;
     ABajarPrioridad: TAction;
     ToolButton5: TToolButton;
     TButtRefrescar: TToolButton;
     ARefrescar: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     ATodos: TAction;
     AVisibles: TAction;
     ANoVisibles: TAction;
     AIniciados: TAction;
     ACerrados: TAction;
     TButtNotas: TToolButton;
     TBSep4: TToolButton;
     LFCategoryAction3: TLFCategoryAction;
     AEditaNotas: TAction;
     APonVisiblesSI: TAction;
     APonVisiblesNO: TAction;
     ALimpiaYOrdena: TAction;
     TBSep1: TToolButton;
     TButtTodoVisible: TToolButton;
     TButtTodoInvisible: TToolButton;
     TBSep2: TToolButton;
     TBIniciar: TToolButton;
     TBFinalizar: TToolButton;
     AIniciar: TAction;
     AFinalizar: TAction;
     DBGPausas: TDBGridFind2000;
     TBPausas: TLFToolBar;
     PNLPausas: TLFPanel;
     TBSep5: TToolButton;
     TBPausaReanuda: TToolButton;
     APausarReanudar: TAction;
     DBMComentarioPausa: TLFDBMemo;
     LTituloPausa: TLFLabel;
     PNLPausaDesc: TLFPanel;
     PNLIncidencia: TLFPanel;
     DBECodIncidencia: TLFDbedit;
     ETituloIncidencia: TLFEdit;
     procedure DBGDisponibleDblClick(Sender: TObject);
     procedure ASubirPrioridadExecute(Sender: TObject);
     procedure ABajarPrioridadExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFSeccionChange(Sender: TObject);
     procedure ARefrescarExecute(Sender: TObject);
     procedure AFiltroExecute(Sender: TObject);
     procedure AEditaNotasExecute(Sender: TObject);
     procedure DBGAsignadoBusqueda(Sender: TObject);
     procedure APonVisiblesSIExecute(Sender: TObject);
     procedure APonVisiblesNOExecute(Sender: TObject);
     procedure ALimpiaYOrdenaExecute(Sender: TObject);
     procedure AIniciarExecute(Sender: TObject);
     procedure AFinalizarExecute(Sender: TObject);
     procedure APausarReanudarExecute(Sender: TObject);
     procedure DBECodIncidenciaChange(Sender: TObject);
     procedure DBGAsignadoDblClick(Sender: TObject);
     procedure DBGAsignadoCellClick(Column: TColumn);
     procedure DBGAsignadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     procedure Filtrar(Tipo: string; id: integer);
  end;

var
  FMHojaDeTrabajo : TFMHojaDeTrabajo;

implementation

uses UDMHojaDeTrabajo, UDMMain, UFormGest, UFMNotasCampo,
  UFSeleccionaPausaHojaDeTrabajo, UFMain, UUtiles;

{$R *.dfm}

procedure TFMHojaDeTrabajo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMHojaDeTrabajo, DMHojaDeTrabajo);

  NavMain.DataSource := DMHojaDeTrabajo.DSxDisponible;
  DBGDisponible.DataSource := DMHojaDeTrabajo.DSxDisponible;

  NavDetalle.DataSource := DMHojaDeTrabajo.DSxAsignado;
  DBGAsignado.DataSource := DMHojaDeTrabajo.DSxAsignado;

  DBGPausas.DataSource := DMHojaDeTrabajo.DSxPausas;
  ColActual := DBGAsignado.Columns[0];

end;

procedure TFMHojaDeTrabajo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMHojaDeTrabajo);
end;

procedure TFMHojaDeTrabajo.DBGDisponibleDblClick(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.AsignaTarea;
end;

procedure TFMHojaDeTrabajo.ASubirPrioridadExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.SubirPrioridad;
end;

procedure TFMHojaDeTrabajo.ABajarPrioridadExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.BajarPrioridad;
end;

procedure TFMHojaDeTrabajo.EFSeccionChange(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.CambiaSeccion(EFSeccion.Text);

  { TODO : Buscar descripcion }
  ESeccion.Text := EFSeccion.Text;
end;

procedure TFMHojaDeTrabajo.ARefrescarExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.RefrescarDisponibles;
end;

procedure TFMHojaDeTrabajo.AFiltroExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.Filtra(TAction(Sender).Tag);
end;

procedure TFMHojaDeTrabajo.AEditaNotasExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.PreparaNotas;
  EditarCampoNotas(Self, DMHojaDeTrabajo.DSxAsignadoNotas, DMHojaDeTrabajo.xAsignadoNotas.FieldByName('NOTAS'));
end;

procedure TFMHojaDeTrabajo.DBGAsignadoBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     Filtros := [];
     if Pos('SYS_IMAGENES', Trim(TablaABuscar)) > 0 then
     begin
        CondicionBusqueda := 'CODIGO >= 0';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CODIGO';
     end;

     if Pos('VER_EMPLEADOS_CUENTAS', Trim(TablaABuscar)) > 0 then
     begin
        Filtros := [obEmpresa, obEjercicio, obCanal];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'EMPLEADO';
     end;

     if Pos('SYS_TIPO_HOJA_TRABAJO', Trim(TablaABuscar)) > 0 then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end;

     if Pos('OPE_SECCIONES', Trim(TablaABuscar)) > 0 then
     begin
        Filtros := [obEmpresa];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'SECCION';
     end;

     if Pos('VER_CLIENTES_EF', Trim(TablaABuscar)) > 0 then
     begin
        Filtros := [obEmpresa, obEjercicio, obCanal];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CLIENTE';
     end;

     if Pos('VER_ARTICULOS_EF', Trim(TablaABuscar)) > 0 then
     begin
        Filtros := [obEmpresa, obEjercicio, obCanal];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end;

     if Pos('PRO_SYS_TAREAS', Trim(TablaABuscar)) > 0 then
     begin
        Filtros := [obEmpresa];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TAREA';
     end;
  end;
end;

procedure TFMHojaDeTrabajo.APonVisiblesSIExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.ActuVisible(1);
end;

procedure TFMHojaDeTrabajo.APonVisiblesNOExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.ActuVisible(0);
end;

procedure TFMHojaDeTrabajo.Filtrar(Tipo: string; id: integer);
begin
  DMHojaDeTrabajo.Filtrar(Tipo, id);
end;

procedure TFMHojaDeTrabajo.ALimpiaYOrdenaExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.LimpiarYOrdenar;
end;

procedure TFMHojaDeTrabajo.AIniciarExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.IniciarHoja;
end;

procedure TFMHojaDeTrabajo.AFinalizarExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.FinalizarHoja;
end;

procedure TFMHojaDeTrabajo.APausarReanudarExecute(Sender: TObject);
begin
  inherited;
  DMHojaDeTrabajo.PausarReanudarHoja;
end;

procedure TFMHojaDeTrabajo.DBECodIncidenciaChange(Sender: TObject);
begin
  inherited;
  ETituloIncidencia.Text := FSeleccionaPausaHojaDeTrabajo.DameTituloIncidenciaRep(DBECodIncidencia.Text);
end;

procedure TFMHojaDeTrabajo.DBGAsignadoDblClick(Sender: TObject);
begin
  inherited;
  if (DMHojaDeTrabajo.xAsignado.RecordCount > 0) then
  begin
     if (UpperCase(ColActual.FieldName) = 'ID_ORDEN') then
        if (DMHojaDeTrabajo.xAsignadoTIPO.AsString = 'REP') then
           FMain.EjecutaAccion(FMain.AReparaciones, 'IDCABREPARAR = ' + IntToStr(DMHojaDeTrabajo.xAsignadoID_ORDEN2.AsInteger));

  end;

end;

procedure TFMHojaDeTrabajo.DBGAsignadoCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMHojaDeTrabajo.DBGAsignadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ID_ORDEN') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
end;

end.
