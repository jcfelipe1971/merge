unit UFMSIILROE;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  RxDBComb;

type
  TFMSIILROE = class(TFPEdit)
     LIdPresentacion: TLFLabel;
     DBEIdPresentacion: TLFDbedit;
     PDetalle: TLFPanel;
     TBSuministroFacturasEmitidas: TLFToolBar;
     NavDocumentos: THYMNavigator;
     PCDocumentos: TLFPageControl;
     TSSeleccionados: TTabSheet;
     TSDisponibles: TTabSheet;
     DBGDisponibles: THYTDBGrid;
     DBGSeleccionados: THYTDBGrid;
     DBEEstado: TLFDbedit;
     LEstadoPresentacion: TLFLabel;
     TBSep1: TToolButton;
     TBSeleccionarTodo: TToolButton;
     TBDeseleccionarTodo: TToolButton;
     AGenerarPresentacion: TAction;
     LModelo: TLFLabel;
     DBEModelo: TRxDBComboBox;
     LCapitulo: TLFLabel;
     DBECapitulo: TRxDBComboBox;
     DBESubcapitulo: TRxDBComboBox;
     LSubcapitulo: TLFLabel;
     LEjercicio: TLFLabel;
     LNIF: TLFLabel;
     LOperacion: TLFLabel;
     DBEOperacion: TRxDBComboBox;
     DBENIF: TLFDbedit;
     DBEEjercicio: TLFDbedit;
     LNombre: TLFLabel;
     DBENombre: TLFDbedit;
     AEnviaPresentacion: TAction;
     AGuardarFicheroPresentacion: TAction;
     AGuardarFicheroRespuesta: TAction;
     DBEDescripcionEstado: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure TSSeleccionadosShow(Sender: TObject);
     procedure TSDisponiblesShow(Sender: TObject);
     procedure DBGDisponiblesDblClick(Sender: TObject);
     procedure DBGSeleccionadosDblClick(Sender: TObject);
     procedure TBSeleccionarTodoClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBDeseleccionarTodoClick(Sender: TObject);
     procedure AGenerarPresentacionExecute(Sender: TObject);
     procedure AEnviaPresentacionExecute(Sender: TObject);
     procedure AGuardarFicheroPresentacionExecute(Sender: TObject);
     procedure AGuardarFicheroRespuestaExecute(Sender: TObject);
     procedure DBGSeleccionadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEIdPresentacionChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGDisponiblesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSIILROE : TFMSIILROE;

implementation

uses
  UDMMain, UDMSIILROE, UFormGest, UUtiles;

{$R *.dfm}

procedure TFMSIILROE.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSIILROE, DMSIILROE);
  NavMain.DataSource := DMSIILROE.DSPresentacion;
  DBGMain.DataSource := DMSIILROE.DSPresentacion;
  G2kTableLoc.DataSource := DMSIILROE.DSPresentacion;
end;

procedure TFMSIILROE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSIILROE);
end;

procedure TFMSIILROE.FormShow(Sender: TObject);
begin
  inherited;
  DBEIdPresentacionChange(Sender);
end;

procedure TFMSIILROE.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMSIILROE.TSSeleccionadosShow(Sender: TObject);
begin
  inherited;
  NavDocumentos.DataSource := DBGSeleccionados.DataSource;

  TBDeseleccionarTodo.Visible := (DMSIILROE.xPresentacionESTADO_ENVIO.AsString = '');
  TBSeleccionarTodo.Visible := False;
end;

procedure TFMSIILROE.TSDisponiblesShow(Sender: TObject);
begin
  inherited;
  NavDocumentos.DataSource := DBGDisponibles.DataSource;

  TBDeseleccionarTodo.Visible := False;
  TBSeleccionarTodo.Visible := (DMSIILROE.xPresentacionESTADO_ENVIO.AsString = '');
end;

procedure TFMSIILROE.DBGDisponiblesDblClick(Sender: TObject);
begin
  inherited;
  DMSIILROE.Seleccionar;
end;

procedure TFMSIILROE.DBGSeleccionadosDblClick(Sender: TObject);
begin
  inherited;
  DMSIILROE.Deseleccionar;
end;

procedure TFMSIILROE.TBSeleccionarTodoClick(Sender: TObject);
begin
  inherited;
  DMSIILROE.SeleccionarTodo;
  PCDocumentos.ActivePage := TSSeleccionados;
end;

procedure TFMSIILROE.TBDeseleccionarTodoClick(Sender: TObject);
begin
  inherited;
  DMSIILROE.DeseleccionarTodo;
end;

procedure TFMSIILROE.AGenerarPresentacionExecute(Sender: TObject);
begin
  inherited;
  DMSIILROE.GenerarPresentacion;
end;

procedure TFMSIILROE.AEnviaPresentacionExecute(Sender: TObject);
begin
  inherited;
  DMMain.Log('AEnviaPresentacionExecute');
  DMSIILROE.EnviarPresentacion;
  DMMain.Log('Fin AEnviaPresentacionExecute');
end;

procedure TFMSIILROE.AGuardarFicheroPresentacionExecute(Sender: TObject);
begin
  inherited;
  DMSIILROE.GuardarFicheroPresentacion;
end;

procedure TFMSIILROE.AGuardarFicheroRespuestaExecute(Sender: TObject);
begin
  inherited;
  DMSIILROE.GuardarFicheroRespuesta;
end;

procedure TFMSIILROE.DBGSeleccionadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  EstadoRegistro : string;
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        EstadoRegistro := DataSource.DataSet.FieldByName('ESTADO_ENVIO').AsString;

        if (EstadoRegistro = '') then
           ColorInfo(Canvas)
        else
        if (EstadoRegistro = 'Correcto') then
           ColorResaltado2(Canvas)
        else
        if (EstadoRegistro = 'Incorrecto') then
           ColorError(Canvas)
        else
           ColorResaltado3(Canvas);

        if (Column.FieldName = 'CODIGO_IDENTIFICATIVO') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('CODIGO_IDENTIFICATIVO').AsString) = '') then
              ColorError(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSIILROE.DBGDisponiblesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (Column.FieldName = 'CODIGO_IDENTIFICATIVO') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('CODIGO_IDENTIFICATIVO').AsString) = '') then
              ColorError(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSIILROE.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  EstadoRegistro : string;
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        EstadoRegistro := DataSource.DataSet.FieldByName('ESTADO_ENVIO').AsString;

        if (EstadoRegistro = '') then
           ColorInfo(Canvas)
        else
        if (EstadoRegistro = 'Correcto') then
           ColorResaltado2(Canvas)
        else
        if (EstadoRegistro = 'Incorrecto') then
           ColorError(Canvas)
        else
           ColorResaltado3(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSIILROE.DBEIdPresentacionChange(Sender: TObject);
var
  EstadoRegistro : string;
begin
  inherited;
  EstadoRegistro := DMSIILROE.xPresentacionESTADO_ENVIO.AsString;

  TSDisponibles.TabVisible := (EstadoRegistro = '');
  TBDeseleccionarTodo.Visible := (EstadoRegistro = '') and (PCDocumentos.ActivePage = TSSeleccionados);
  TBSeleccionarTodo.Visible := (EstadoRegistro = '') and (PCDocumentos.ActivePage = TSDisponibles);

  if (EstadoRegistro = '') then
  begin
     ColorInfo(DBEEstado);
     ColorInfo(DBEDescripcionEstado);
  end
  else
  if (EstadoRegistro = 'Correcto') then
  begin
     ColorResaltado2(DBEEstado);
     ColorResaltado2(DBEDescripcionEstado);
  end
  else
  if (EstadoRegistro = 'Incorrecto') then
  begin
     ColorError(DBEEstado);
     ColorError(DBEDescripcionEstado);
  end
  else
  begin
     ColorResaltado3(DBEEstado);
     ColorResaltado3(DBEDescripcionEstado);
  end;
end;

end.
