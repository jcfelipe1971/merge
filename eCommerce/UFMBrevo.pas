unit UFMBrevo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, ULFPageControl, UNavigator,
  Grids, DBGrids, NsDBGrid, DB, UHYDBGrid;

type
  TFMBrevo = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSPersonas: TTabSheet;
     TSListas: TTabSheet;
     PNLPersonas: TLFPanel;
     PNLListas: TLFPanel;
     TBPersonas: TLFToolBar;
     TBListas: TLFToolBar;
     NavPersonas: THYMNavigator;
     NavListas: THYMNavigator;
     DBGPersonas: THYTDBGrid;
     DBGListas: THYTDBGrid;
     TBSep1: TToolButton;
     TBFiltrarPersonas: TToolButton;
     TBSep2: TToolButton;
     TBPersonasVerTodos: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBFiltrarPersonasClick(Sender: TObject);
     procedure TBPersonasVerTodosClick(Sender: TObject);
     procedure DBGPersonasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGPersonasDblClick(Sender: TObject);
     procedure DBGPersonasCellClick(Column: TColumn);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMBrevo : TFMBrevo;

implementation

uses
  UDMBrevo, UFormGest, UDMMain, UUtiles, UFMain;

{$R *.dfm}

procedure TFMBrevo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMBrevo, DMBrevo);
  ColActual := DBGPersonas.Columns[0];
end;

procedure TFMBrevo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMBrevo);
end;

procedure TFMBrevo.TBFiltrarPersonasClick(Sender: TObject);
begin
  inherited;
  DMBrevo.FiltrarPersonas(DMBrevo.xListasID.AsInteger);
  PCMain.ActivePage := TSPersonas;
end;

procedure TFMBrevo.TBPersonasVerTodosClick(Sender: TObject);
begin
  inherited;
  DMBrevo.FiltrarPersonas(0);
end;

procedure TFMBrevo.DBGPersonasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ID_CONTACTO') or (UpperCase(Column.FieldName) = 'NUM_PERSONA') or (UpperCase(Column.FieldName) = 'NOMBRE') or (UpperCase(Column.FieldName) = 'APELLIDOS') then
     CeldaEnlace(THYTDBGrid(Sender), Rect);

  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMBrevo.xPersonasEMAIL_BLACKLISTED.AsInteger = 1) then
           ColorBloqueado(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMBrevo.DBGPersonasDblClick(Sender: TObject);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(ColActual.FieldName) = 'ID_CONTACTO') or (UpperCase(ColActual.FieldName) = 'NUM_PERSONA') or (UpperCase(ColActual.FieldName) = 'NOMBRE') or (UpperCase(ColActual.FieldName) = 'APELLIDOS') then
     begin
        if (DMBrevo.xPersonasID_CONTACTO.AsInteger <> 0) then
           FMain.EjecutaAccion(FMain.ACrmContactos, format('ID_CONTACTO = %d', [DMBrevo.xPersonasID_CONTACTO.AsInteger]));
     end;
  end;
end;

procedure TFMBrevo.DBGPersonasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

end.
