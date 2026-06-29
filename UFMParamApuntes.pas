unit UFMParamApuntes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, DBCtrls, ExtCtrls, Buttons, UEditPanel,
  ToolWin, ComCtrls, DbComboBoxValue, ActnList, Mask, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UHYDescription, ULFDBEdit, ULFEditFind2000,
  ULFToolBar, ULFPanel, TFlatSpeedButtonUnit, ULFActionList, ULFLabel;

type
  TFMParamApuntes = class(TG2kForm)
     PNParametrizacion: TLFPanel;
     LGRupoAsientos: TLFLabel;
     LAsiento: TLFLabel;
     LApunte: TLFLabel;
     LVariable: TLFLabel;
     LFormatoFinal: TLFLabel;
     SBDatosIda: TSpeedButton;
     SBTextoIda: TSpeedButton;
     SBBorrarLinea: TSpeedButton;
     BtnConfTexto: TBitBtn;
     ETextoLibre: TLabeledEdit;
     ListDestino: TListBox;
     ListOrigen: TListBox;
     SBSubir: TSpeedButton;
     SBBajar: TSpeedButton;
     SBBorrarTodo: TSpeedButton;
     TBMain: TLFToolBar;
     PNVariables: TLFPanel;
     PNConfig: TLFPanel;
     TButtGrabar: TToolButton;
     ALMain: TLFActionList;
     AGrabar: TAction;
     ASalir: TAction;
     EFAsientos: TLFEditFind2000;
     EFApuntes: TLFEditFind2000;
     DBEGrupoAsientos: TLFDbedit;
     DBEAsientos: TLFDbedit;
     DBEApuntes: TLFDbedit;
     SBIntrodOriginal: TSpeedButton;
     AConfigMasiva: TAction;
     TButtConfigMasiva: TToolButton;
     AConfigNuevo: TAction;
     TButtSalir: TToolButton;
     EFGrupoAsientos: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure BtnConfTextoClick(Sender: TObject);
     procedure SBDatosIdaClick(Sender: TObject);
     procedure SBTextoIdaClick(Sender: TObject);
     procedure SBBorrarLineaClick(Sender: TObject);
     procedure SBSubirClick(Sender: TObject);
     procedure SBBajarClick(Sender: TObject);
     procedure SBBorrarTodoClick(Sender: TObject);
     procedure AGrabarExecute(Sender: TObject);
     procedure EFGrupoAsientosChange(Sender: TObject);
     procedure EFAsientosBusqueda(Sender: TObject);
     procedure EFApuntesBusqueda(Sender: TObject);
     procedure SBIntrodOriginalClick(Sender: TObject);
     procedure AConfigMasivaExecute(Sender: TObject);
     procedure AConfigNuevoExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure EFAsientosChange(Sender: TObject);
     procedure EFApuntesChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     //procedure ToolButton3Click(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMParamApuntes : TFMParamApuntes;

implementation

uses UDMParamApuntes, UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TFMParamApuntes.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMParamApuntes, DMParamApuntes);
  EFGrupoAsientos.Text := IntToStr(1);
  EFAsientos.Text := IntToStr(1);
  EFApuntes.Text := IntToStr(1);

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BtnConfTexto, 1, DMMain.ILMain_Ac, 2);
  GetBitmapFromImageList(SBDatosIda, 1, DMMain.ILMain_Ac, 25);
  GetBitmapFromImageList(SBTextoIda, 1, DMMain.ILMain_Ac, 25);
  GetBitmapFromImageList(SBSubir, 1, DMMain.ILMain_Ac, 53);
  GetBitmapFromImageList(SBBajar, 1, DMMain.ILMain_Ac, 52);
  GetBitmapFromImageList(SBBorrarLinea, 1, DMMain.ILMain_Ac, 20);
  GetBitmapFromImageList(SBBorrarTodo, 1, DMMain.ILMain_Ac, 39);
  GetBitmapFromImageList(SBIntrodOriginal, 1, DMMain.ILMain_Ac, 26);
end;

procedure TFMParamApuntes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMParamApuntes);
  Action := caFree;
end;

procedure TFMParamApuntes.BtnConfTextoClick(Sender: TObject);
begin
  if ((EFGrupoAsientos.Text = '') or (EFAsientos.Text = '') or (EFApuntes.Text = '')) then
     Application.MessageBox(PChar(string(_('Debe completar todos los campos'))), PChar(string(_('Atención'))),
        MB_YESNO + MB_ICONINFORMATION)
  else
  begin
     ListOrigen.Clear;
     ListDestino.Clear;
     DMParamApuntes.InsertaVariables(ListOrigen.Items, StrToIntDef(EFGrupoAsientos.Text, 0),
        StrToIntDef(EFAsientos.Text, 0), StrToIntDef(EFApuntes.Text, 0));
     DMParamApuntes.InsertaFormatoF(ListDestino.Items, StrToIntDef(EFGrupoAsientos.Text, 0),
        StrToIntDef(EFAsientos.Text, 0), StrToIntDef(EFApuntes.Text, 0));
  end;
end;

procedure TFMParamApuntes.SBDatosIdaClick(Sender: TObject);
begin
  if (ListOrigen.ItemIndex >= 0) then
     ListDestino.Items.Add(ListOrigen.Items[ListOrigen.ItemIndex]);
end;

procedure TFMParamApuntes.SBTextoIdaClick(Sender: TObject);
begin
  if (ETextoLibre.Text > '') then
  begin
     ListDestino.Items.Add(ETextoLibre.Text);
     ETextoLibre.Text := '';
  end;
end;

procedure TFMParamApuntes.SBBorrarLineaClick(Sender: TObject);
begin
  if (ListDestino.ItemIndex >= 0) then
  begin
     ListDestino.Items.Delete(ListDestino.ItemIndex);
  end;
end;

procedure TFMParamApuntes.SBSubirClick(Sender: TObject);
var
  a : integer;
begin
  // Se mueve una posición arriba y se deja seleccionado
  if (ListDestino.ItemIndex > 0) then
  begin
     a := ListDestino.ItemIndex - 1;
     ListDestino.Items.Move(ListDestino.ItemIndex, a);
     ListDestino.ItemIndex := a;
  end;
end;

procedure TFMParamApuntes.SBBajarClick(Sender: TObject);
var
  a : integer;
begin
  // Se mueve una posición abajo y se deja seleccionado
  if ((ListDestino.ItemIndex >= 0) and (ListDestino.ItemIndex < ListDestino.Count - 1)) then
  begin
     a := ListDestino.ItemIndex + 1;
     ListDestino.Items.Move(ListDestino.ItemIndex, a);
     ListDestino.ItemIndex := a;
  end;
end;

procedure TFMParamApuntes.SBBorrarTodoClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar(string(_('¿Está seguro de que quiere borrar el formato final?'))),
     PChar(string(_('Confirmación'))), MB_YESNO + MB_ICONEXCLAMATION) = idYes) then
     ListDestino.Clear;
end;

procedure TFMParamApuntes.AGrabarExecute(Sender: TObject);
var
  a : integer;
  Lindex : integer;
begin
  if (ListDestino.Items.Text = '') then
     Application.MessageBox(PChar(string(_('Debe introducir un formato para el apunte'))), PChar(string(_('Atención'))),
        MB_OK + MB_ICONINFORMATION)
  else
  begin
     //Se borran los datos originales que se quieren cambiar y se insertan los nuevos
     //de la selección.
     a := ListDestino.Items.Count - 1;
     ListDestino.ItemIndex := 0;
     for Lindex := 0 to a do
     begin
        if (Lindex = 0) then
           DMParamApuntes.BorraTablaFinal(StrToIntDef(EFGrupoAsientos.Text, 0),
              StrToIntDef(EFAsientos.Text, 0), StrToIntDef(EFApuntes.Text, 0));
        DMParamApuntes.GrabaTexto(StrToIntDef(EFGrupoAsientos.Text, 0), StrToIntDef(EFAsientos.Text, 0),
           StrToIntDef(EFApuntes.Text, 0), ListDestino.Items[Lindex], Lindex);
     end;
     ListOrigen.Clear;
     ListDestino.Clear;
     BtnConfTextoClick(BtnConfTexto);
  end;
end;

procedure TFMParamApuntes.EFGrupoAsientosChange(Sender: TObject);
begin
  ListOrigen.Clear;
  ListDestino.Clear;
  if (EFGrupoAsientos.Text <> '') then
  begin
     DMParamApuntes.DameTituloGAsiento(StrToIntDef(EFGrupoAsientos.Text, 0));
     if (EFAsientos.Text <> '') then
     begin
        DMParamApuntes.DameTituloAsientos(StrToIntDef(EFGrupoAsientos.Text, 0), StrToIntDef(EFAsientos.Text, 0));
        if (EFApuntes.Text <> '') then
        begin
           DMParamApuntes.DameTituloApute(StrToIntDef(EFGrupoAsientos.Text, 0),
              StrToIntDef(EFAsientos.Text, 0), StrToIntDef(EFApuntes.Text, 0));
           BtnConfTextoClick(BtnConfTexto);
        end;
     end;
  end;
end;

procedure TFMParamApuntes.EFAsientosBusqueda(Sender: TObject);
begin
  if (EFGrupoAsientos.Text = '') then
     raise Exception.Create(_('No ha seleccionado el Grupo de Asiento'))
  else
     EFAsientos.CondicionBusqueda := 'COD_GRUP_ASIENTO=' + EFGrupoAsientos.Text;
end;

procedure TFMParamApuntes.EFApuntesBusqueda(Sender: TObject);
begin
  if (EFAsientos.Text = '') then
     raise Exception.Create(_('No ha seleccionado el Asiento'))
  else
     EFApuntes.CondicionBusqueda := 'COD_GRUP_ASIENTO=' + EFGrupoAsientos.Text +
        'AND COD_ASIENTO =' + EFAsientos.Text;
end;

procedure TFMParamApuntes.SBIntrodOriginalClick(Sender: TObject);
var
  a : integer;
  LBox : TStringList;
begin
  LBox := TStringList.Create;
  a := 0;
  if (ListOrigen.Items.Text = '') then
     Application.MessageBox(PChar(string(_('Debe seleccionar un apunte'))), PChar(string(_('Atención'))),
        MB_OK + MB_ICONINFORMATION)
  else if (ListDestino.Items.Text = '') then
     a := 1
  else if (Application.MessageBox(PChar(string(_('¿Está seguro de que quiere cambiar este formato por el original?'))),
     PChar(string(_('Confirmación'))), MB_YESNO + MB_ICONEXCLAMATION) = idYes) then
     if Confirma then
        if confirmaGrave then
        begin
           ListDestino.Clear;
           a := 1;
        end;

  if (a = 1) then
  begin
     DMParamApuntes.InsertaFormato0(LBox, StrToIntDef(EFGrupoAsientos.Text, 0), StrToIntDef(EFAsientos.Text, 0), StrToIntDef(EFApuntes.Text, 0));
     ListDestino.Items := LBox;
  end;
  LBox.Free;
end;

procedure TFMParamApuntes.AConfigMasivaExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar(string(_('Va a Cambiar el Formato de TODOS los apuntes por el Formato Inicial'))),
     PChar(string(_('Confirmación'))), MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
     if Confirma then
        if ConfirmaGrave then
        begin
           ListOrigen.Clear;
           ListDestino.Clear;
           DMParamApuntes.ConfiguracionMasiva(0);
           BtnConfTextoClick(BtnConfTexto);
        end;
end;

procedure TFMParamApuntes.AConfigNuevoExecute(Sender: TObject);
begin
  DMParamApuntes.ConfiguracionMasiva(1);
end;

procedure TFMParamApuntes.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMParamApuntes.EFAsientosChange(Sender: TObject);
begin
  ListOrigen.Clear;
  ListDestino.Clear;
  if (EFGrupoAsientos.Text <> '') then
  begin
     if (EFAsientos.Text <> '') then
     begin
        DMParamApuntes.DameTituloAsientos(StrToIntDef(EFGrupoAsientos.Text, 0), StrToIntDef(EFAsientos.Text, 0));
        if (EFApuntes.Text <> '') then
        begin
           DMParamApuntes.DameTituloApute(StrToIntDef(EFGrupoAsientos.Text, 0),
              StrToIntDef(EFAsientos.Text, 0), StrToIntDef(EFApuntes.Text, 0));
           BtnConfTextoClick(BtnConfTexto);
        end;
     end;
  end;
end;

procedure TFMParamApuntes.EFApuntesChange(Sender: TObject);
begin
  ListOrigen.Clear;
  ListDestino.Clear;
  if ((EFApuntes.Text <> '') and (EFGrupoAsientos.Text <> '') and (EFAsientos.Text <> '')) then
  begin
     DMParamApuntes.DameTituloApute(StrToIntDef(EFGrupoAsientos.Text, 0), StrToIntDef(EFAsientos.Text, 0), StrToIntDef(EFApuntes.Text, 0));
     BtnConfTextoClick(BtnConfTexto);
  end;
end;

end.
