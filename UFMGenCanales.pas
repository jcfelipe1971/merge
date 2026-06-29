unit UFMGenCanales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, UG2kTBLoc, ULFEdit;

type
  TFMGenCanales = class(TFPEdit)
     DBECanal: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBCHKActivo: TLFDBCheckBox;
     LBLCanal: TLFLabel;
     LBLTitulo: TLFLabel;
     DBEFPais: TLFDBEditFind2000;
     EPaisTit: TLFEdit;
     DBEFMoneda: TLFDBEditFind2000;
     EMonedaTit: TLFEdit;
     DBEFTipoIVA: TLFDBEditFind2000;
     DBETitIva: TLFDbedit;
     LBLPais: TLFLabel;
     DBETipIva: TLFDbedit;
     DBERecIva: TLFDbedit;
     LBLTipoIVA: TLFLabel;
     LBLMoneda: TLFLabel;
     DBEFModoIVA: TLFDBEditFind2000;
     DBEModoTit: TLFDbedit;
     DBCHKIva: TLFDBCheckBox;
     DBCHKRecargo: TLFDBCheckBox;
     LBLModoIVA: TLFLabel;
     DBEFPerfil: TLFDBEditFind2000;
     LBLPerfilDef: TLFLabel;
     LFCategoryAction1: TLFCategoryAction;
     AActivarCanal: TAction;
     ADesactivarCanal: TAction;
     ACopiaModoIva: TAction;
     AEliminaCanal: TAction;
     AAsignaModoIvaProv: TAction;
     AAsignaModoIvaAcr: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AAsignaModoIva: TAction;
     LFCategoryAction3: TLFCategoryAction;
     LFCategoryAction4: TLFCategoryAction;
     ACopiaModoIvaAcre: TAction;
     ACopiaModoIvaProv: TAction;
     ETituloPerfil: TLFEdit;
     LColor: TLFLabel;
     EColor: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFPaisExiste(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure AActivarCanalExecute(Sender: TObject);
     procedure ADesactivarCanalExecute(Sender: TObject);
     procedure AAsignaModoIvaExecute(Sender: TObject);
     procedure ACopiaModoIvaExecute(Sender: TObject);
     procedure AEliminaCanalExecute(Sender: TObject);
     procedure AAsignaModoIvaProvExecute(Sender: TObject);
     procedure AAsignaModoIvaAcrExecute(Sender: TObject);
     procedure ACopiaModoIvaAcreExecute(Sender: TObject);
     procedure ACopiaModoIvaProvExecute(Sender: TObject);
     procedure DBEFPaisChange(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure DBEFPerfilChange(Sender: TObject);
     procedure EColorClick(Sender: TObject);
     procedure DBECanalChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGenCanales : TFMGenCanales;

implementation

uses UFormGest, UDMMain, UUtiles, UEntorno, UDMGenCanales, UDameDato;

{$R *.DFM}

procedure TFMGenCanales.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMGenCanales, DMGenCanales);
  EPMain.DataSource := DMGenCanales.DSQMGenCanales;
  NavMain.DataSource := DMGenCanales.DSQMGenCanales;
  DBGMain.DataSource := DMGenCanales.DSQMGenCanales;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  // Color campo ID
  ColorCampoID(DBECanal);
end;

procedure TFMGenCanales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGenCanales);
end;

procedure TFMGenCanales.DBEFPaisExiste(Sender: TObject);
begin
  DBEFTipoIVA.CondicionBusqueda := 'Pais=''' + DBEFPais.Text + '''';
end;

procedure TFMGenCanales.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMGenCanales.BusquedaComplejaCanales;
  Continua := False;
end;

procedure TFMGenCanales.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbDelete then
  begin
     if StrToInt(DBECanal.Text) = REntorno.Canal then
        ShowMessage(_('ATENCION: ¡¡¡No es posible borrar el canal abierto!!!'));
  end;
end;

procedure TFMGenCanales.AActivarCanalExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenCanales.ActivarCanal(1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenCanales.ADesactivarCanalExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenCanales.ActivarCanal(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenCanales.AAsignaModoIvaExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenCanales.AsignarModoIva(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenCanales.ACopiaModoIvaExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DMGenCanales.CopiarModoIva(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenCanales.AEliminaCanalExecute(Sender: TObject);
begin
  if StrToInt(DBECanal.Text) = REntorno.Canal then
     ShowMessage(_('ATENCION: ¡¡¡No es posible borrar el canal abierto!!!'))
  else if confirma and ConfirmaGrave then
     try
        Screen.Cursor := crHourGlass;
        DMGenCanales.LimpiaCanTodo;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TFMGenCanales.AAsignaModoIvaProvExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenCanales.AsignarModoIva(1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenCanales.AAsignaModoIvaAcrExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenCanales.AsignarModoIva(2);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenCanales.ACopiaModoIvaAcreExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DMGenCanales.CopiarModoIva(2);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenCanales.ACopiaModoIvaProvExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DMGenCanales.CopiarModoIva(1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenCanales.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  EPaisTit.Text := DameTituloPais(DBEFPais.Text);
end;

procedure TFMGenCanales.DBEFMonedaChange(Sender: TObject);
begin
  inherited;
  EMonedaTit.Text := DameTituloMoneda(DBEFMoneda.Text);
end;

procedure TFMGenCanales.DBEFPerfilChange(Sender: TObject);
begin
  inherited;
  ETituloPerfil.Text := DameTituloPerfilCliente(DBEFPerfil.Text);
end;

procedure TFMGenCanales.EColorClick(Sender: TObject);
begin
  inherited;
  EColor.Color := DameColor(EColor.Color);
  DMGenCanales.QMGenCanalesCOLOR.AsFloat := EColor.Color;
end;

procedure TFMGenCanales.DBECanalChange(Sender: TObject);
begin
  inherited;
  EColor.Color := Trunc(DMGenCanales.QMGenCanalesCOLOR.AsFloat);
end;

procedure TFMGenCanales.FormShow(Sender: TObject);
begin
  inherited;
  // Refresco color del Edit
  DBECanalChange(Sender);
end;

procedure TFMGenCanales.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMGenCanales.QMGenCanalesCOLOR.AsFloat = 0) then
           ColorInfo(Canvas)
        else
           ColorObjeto(Canvas, Trunc(DMGenCanales.QMGenCanalesCOLOR.AsFloat), clWindowText);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
