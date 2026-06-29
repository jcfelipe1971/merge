unit UIsoFMPlanning;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBMemo, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TIsoFMPlanning = class(TFPEdit)
     TSNotas: TTabSheet;
     LPlanning: TLFLabel;
     LFDBRig: TLFDbedit;
     LFecha: TLFLabel;
     LFDBFecha: TLFDBDateEdit;
     LTotalCoste: TLFLabel;
     LFDBTotal: TLFDbedit;
     PNLDetalle: TLFPanel;
     LDescripcion: TLFLabel;
     LFDBDescrip: TLFDbedit;
     TBNotas: TLFToolBar;
     LFDBRigNotas: TLFDbedit;
     LFDBDescNotas: TLFDbedit;
     ToolButton1: TToolButton;
     NavNotas: THYMNavigator;
     LFDBNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LFPanelNotas: TLFPanel;
     GBFirmas: TGroupBox;
     ChkBAprobado: TLFDBCheckBox;
     ChkBVerificado: TLFDBCheckBox;
     ChkBValidado: TLFDBCheckBox;
     DBGDetallPlanning: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavDetall: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetall: TPopUpTeclas;
     LFCategoryAction2: TLFCategoryAction;
     ALstConfigPlanning: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AlstPlanning: TAction;
     PNLEmp: TLFPanel;
     TBSubdetalle: TLFToolBar;
     NavEmpleado: THYMNavigator;
     DBGRelEmplCurso: TDBGridFind2000;
     LEjercicio: TLFLabel;
     LFEjercicio: TLFDbedit;
     LFCategoryAction3: TLFCategoryAction;
     AAdjuntos: TAction;
     PNLInfoNotas: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ALstPlanningExecute(Sender: TObject);
     procedure ALstConfigPlanningExecute(Sender: TObject);
     procedure DBGRelEmplCursoBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AAdjuntosExecute(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGRelEmplCursoDblClick(Sender: TObject);
     procedure DBGRelEmplCursoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FormResize(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  IsoFMPlanning : TIsoFMPlanning;

implementation

uses UIsoDMPlanning, UDMMain, UFormGest, UFMListconfig, UDMListados, UFMAdjunto,
  ShellApi, URecibeFicheros, UDMAdjunto, UUtiles, UFMain;

{$R *.dfm}

procedure TIsoFMPlanning.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TIsoDMPlanning, IsoDMPlanning);
  NavMain.DataSource := IsoDMPlanning.DSCabPlanning;
  NavDetall.DataSource := IsoDMPlanning.DSDetPlanning;
  NavEmpleado.DataSource := IsoDMPlanning.DSQMRelEmplCursos;
  G2KTableLoc.DataSource := IsoDMPlanning.DSCabPlanning;
  ColActual := DBGRelEmplCurso.Columns[0];
end;

procedure TIsoFMPlanning.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMPlanning);
end;

procedure TIsoFMPlanning.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMPlanning.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMPlanning.BusquedaCompleja;
end;

procedure TIsoFMPlanning.ALstPlanningExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(8034, 0, '', '', IsoDMPlanning.frPlanning, nil);
  CierraData(DMListados);
end;

procedure TIsoFMPlanning.ALstConfigPlanningExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8034, Formato, Cabecera, Copias, Pijama, '', IsoDMPlanning.frPlanning);
end;

procedure TIsoFMPlanning.DBGRelEmplCursoBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGRelEmplCurso.TablaABuscar) = 'VER_EMPLEADOS_EF' then
     DBGRelEmplCurso.Filtros := [obEmpresa];
  if Trim(DBGRelEmplCurso.TablaABuscar) = 'ISO_EMPL_RESULTADOS' then
     DBGRelEmplCurso.Filtros := [];
end;

procedure TIsoFMPlanning.AAdjuntosExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('IPL', IsoDMPlanning.QMCabPlanningID_CAB_PLANNING.AsInteger);
end;

procedure TIsoFMPlanning.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ALstPlanning.Execute;
end;

procedure TIsoFMPlanning.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('IPL', IsoDMPlanning.QMCabPlanningID_CAB_PLANNING.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntos.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TIsoFMPlanning.DBGRelEmplCursoDblClick(Sender: TObject);
begin
  inherited;
  // El campo ID_EMPLEADO es el campo OPE_EMPLEADO.EMPLEADO
  if (UpperCase(ColActual.FieldName) = 'ID_EMPLEADO') then
     FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO = ' + IntToStr(IsoDMPlanning.QMRelEmplCursosID_EMPLEADO.AsInteger));
end;

procedure TIsoFMPlanning.DBGRelEmplCursoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ID_EMPLEADO') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
end;

procedure TIsoFMPlanning.FormResize(Sender: TObject);
begin
  inherited;
  PNLDetalle.Height := (Self.Height - PCMain.Height) div 2;
end;

end.
