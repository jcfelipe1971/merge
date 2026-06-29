unit UFMGenEjercicios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid,
  ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFToolBar, ULFPanel, ULFPageControl, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBDateEdit, ULFLabel, UG2kTBLoc, ULFEdit;

type
  TFMGenEjercicios = class(TFPEdit)
     DBEEjercicio: TLFDbedit;
     DBCHKActivo: TLFDBCheckBox;
     DBDTPApertura: TLFDBDateEdit;
     DBDTPCierre: TLFDBDateEdit;
     LBLEjercicio: TLFLabel;
     LBLApertura: TLFLabel;
     LBLCierre: TLFLabel;
     AActivarEjercicio: TAction;
     ADesactivarEjercicio: TAction;
     AEliminarEjercicio: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LColor: TLFLabel;
     EColor: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure AActivarEjercicioExecute(Sender: TObject);
     procedure ADesactivarEjercicioExecute(Sender: TObject);
     procedure AEliminarEjercicioExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EColorClick(Sender: TObject);
     procedure DBEEjercicioChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGenEjercicios : TFMGenEjercicios;

implementation

uses UFormGest, UDMMain, UUtiles, UEntorno, UDMGenEjercicios, UFMain;

{$R *.DFM}

procedure TFMGenEjercicios.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMGenEjercicios, DMGenEjercicios);
  EPMain.DataSource := DMGenEjercicios.DSQMGenEjercicios;
  NavMain.DataSource := DMGenEjercicios.DSQMGenEjercicios;
  DBGMain.DataSource := DMGenEjercicios.DSQMGenEjercicios;
  G2KTableLoc.DataSource := DMGenEjercicios.DSQMGenEjercicios;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  // Color campo ID
  ColorCampoID(DBEEjercicio);
end;

procedure TFMGenEjercicios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGenEjercicios);
end;

procedure TFMGenEjercicios.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbDelete then
     if (StrToInt(DBEEjercicio.Text) = REntorno.Ejercicio) then
        ShowMessage(_('¡¡¡ ATENCIÓN : No es posible borrar el ejercicio seleccionado. !!!'))
     else
        FMain.ConstruyeBotonMultiEjercicio;
end;

procedure TFMGenEjercicios.AActivarEjercicioExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenEjercicios.ActivarEjercicio(1);
  finally
     Screen.Cursor := crDefault;
  end;
  FMain.ConstruyeBotonMultiEjercicio;
end;

procedure TFMGenEjercicios.ADesactivarEjercicioExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenEjercicios.ActivarEjercicio(0);
  finally
     Screen.Cursor := crDefault;
  end;
  FMain.ConstruyeBotonMultiEjercicio;
end;

procedure TFMGenEjercicios.AEliminarEjercicioExecute(Sender: TObject);
begin
  if (StrToInt(DBEEjercicio.Text) = REntorno.Ejercicio) then
     ShowMessage(_('¡¡¡ ATENCIÓN : No es posible borrar el ejercicio seleccionado !!!'))
  else if (Confirma and ConfirmaGrave) then
     try
        Screen.Cursor := crHourGlass;
        DMGenEjercicios.LimpiaEjeTodo;
     finally
        Screen.Cursor := crDefault;
     end;
  FMain.ConstruyeBotonMultiEjercicio;
end;

procedure TFMGenEjercicios.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMGenEjercicios.EColorClick(Sender: TObject);
begin
  inherited;
  EColor.Color := DameColor(EColor.Color);
  DMGenEjercicios.QMGenEjerciciosCOLOR.AsFloat := EColor.Color;
end;

procedure TFMGenEjercicios.DBEEjercicioChange(Sender: TObject);
begin
  inherited;
  EColor.Color := Trunc(DMGenEjercicios.QMGenEjerciciosCOLOR.AsFloat);
end;

procedure TFMGenEjercicios.FormShow(Sender: TObject);
begin
  inherited;
  // Refresco color del Edit
  DBEEjercicioChange(Sender);
end;

procedure TFMGenEjercicios.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMGenEjercicios.QMGenEjerciciosCOLOR.AsFloat = 0) then
           ColorInfo(Canvas)
        else
           ColorObjeto(Canvas, Trunc(DMGenEjercicios.QMGenEjerciciosCOLOR.AsFloat), clWindowText);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
