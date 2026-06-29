unit UFMNotasCampo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UNavigator, ToolWin, ComCtrls, StdCtrls, DBCtrls, Menus,
  UTeclas, UControlEdit, DB, URecursos, ULFDBMemo, ULFPanel, ULFToolBar,
  ExtActns, ActnList, StdActns, ULFEdit, ULFComboBox;

type
  TFMNotasCampo = class(THYForm)
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     PNLNotas: TLFPanel;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     DBMNotas: TLFDBMemo;
     TButtRESep1: TToolButton;
     ALEditorRichText: TActionList;
     RichEditBold1: TRichEditBold;
     RichEditItalic1: TRichEditItalic;
     RichEditUnderline1: TRichEditUnderline;
     RichEditBullets1: TRichEditBullets;
     RichEditAlignLeft1: TRichEditAlignLeft;
     RichEditAlignRight1: TRichEditAlignRight;
     RichEditAlignCenter1: TRichEditAlignCenter;
     TButtRENegrita: TToolButton;
     TButtRECursiva: TToolButton;
     TButtRESubrayado: TToolButton;
     TButtRESep2: TToolButton;
     TButtREAlinIzq: TToolButton;
     TButtREAlinCent: TToolButton;
     TButtREAlinDer: TToolButton;
     TButtRESep3: TToolButton;
     TButtRESepBulet: TToolButton;
     EFontSize: TLFEdit;
     UpDownFontSize: TUpDown;
     PNLTamano: TLFPanel;
     PNLNotasRich: TLFPanel;
     DBRENotas2: TDBRichEdit;
     DBRENotas: TDBRichEdit;
     DBMNotas2: TLFDBMemo;
     TBRichEdit: TLFToolBar;
     Splitter1: TSplitter;
     Splitter2: TSplitter;
     ToolButton1: TToolButton;
     CBFontName: TLFComboBox;
     TSep1: TToolButton;
     TButtSalir: TToolButton;
     RichEditAlignJustified: TAction;
     TButtREAlinJus: TToolButton;
     PNLOrtografia: TLFPanel;
     TBOrtografia: TLFToolBar;
     TBComprobar: TToolButton;
     TBSep1: TToolButton;
     TBAgregarPalabra: TToolButton;
     LBPalabras: TListBox;
     PNLMain: TLFPanel;
     NavCancelar: THYMNavigator;
     TBSepCancelar: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure EFontSizeChange(Sender: TObject);
     procedure DBRENotasSelectionChange(Sender: TObject);
     procedure DBRENotasEnter(Sender: TObject);
     procedure DBRENotas2Enter(Sender: TObject);
     procedure CBFontNameChange(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure RichEditAlignJustifiedExecute(Sender: TObject);
     procedure TBComprobarClick(Sender: TObject);
     procedure TBAgregarPalabraClick(Sender: TObject);
  private
     { Private declarations }
     FUpdating: boolean;
     RichEditConFoco: TDBRichEdit;
     DS: TDataSource;
     procedure GetFontNames;
  public
     { Public declarations }
  end;

procedure EditarCampoNotas(Owner: TComponent; DataSource: TDataSource; Field: TField; Field2: TField = nil; rtf: boolean = False);

implementation

uses UDMMain, UEntorno, UUtiles, RichEdit;

{$R *.DFM}

procedure EditarCampoNotas(Owner: TComponent; DataSource: TDataSource; Field: TField; Field2: TField = nil; rtf: boolean = False);
var
  FMNotasAux : TFMNotasCampo;
  i : integer;
  Editable : boolean;
begin
  FMNotasAux := TFMNotasCampo.Create(Owner);
  with FMNotasAux do
  begin
     try
        DS := DataSource;
        // Habilito los componentes segun estemos en edicion o no
        Editable := (DataSource.DataSet.State in [dsEdit, dsInsert]);
        NavMain.Visible := Editable;
        TBSepCancelar.Visible := True;
        TBSepCancelar.Width := 40;
        NavCancelar.Visible := Editable;
        TSep1.Visible := not Editable;
        TButtSalir.Visible := not Editable;
        DBMNotas.ReadOnly := not Editable;
        DBMNotas2.ReadOnly := not Editable;
        DBRENotas.ReadOnly := not Editable;
        DBRENotas2.ReadOnly := not Editable;
        TBRichEdit.Enabled := Editable;
        PNLOrtografia.Visible := Editable;

        NavMain.DataSource := DataSource;
        NavCancelar.DataSource := DataSource;
        // Si no es RichText
        if (((Copy(Field.AsString, 1, 6) <> '{\rtf1')) and (rtf = False)) then
        begin
           DBMNotas.DataSource := DataSource;
           DBMNotas.DataField := Field.FieldName;
           DBMNotas2.Visible := False;
           if ((Field2 <> nil) and (DMMain.EstadoKri(198) = 1)) then
           begin
              DBMNotas2.Visible := True;
              DBMNotas2.DataSource := DataSource;
              DBMNotas2.DataField := Field2.FieldName;
              DBMNotas2.Height := FMNotasAux.PNLNotas.Height div 3;
           end;
           for i := 0 to TBMain.ButtonCount - 1 do
              if (TBMain.Buttons[i].Style = tbsSeparator) then
                 TBMain.Buttons[i].Visible := False;
        end;
        // Verifico si es RichText
        if (((Copy(Field.AsString, 1, 6) = '{\rtf1')) or (rtf = True)) then
        begin
           PNLNotas.Visible := False;
           PNLNotasRich.Visible := True;
           PNLNotasRich.Align := alClient;
           // Conecto el datasource al RichEdit
           DBRENotas.DataSource := DataSource;
           DBRENotas.DataField := Field.FieldName;
           if (DMMain.EstadoKri(224) <> 0) then
              DBRENotas.Font.Size := DMMain.EstadoKri(224);
           RichEditConFoco := DBRENotas;
           DBRENotas2.Visible := False;
           if ((Field2 <> nil) and (DMMain.EstadoKri(198) = 1)) then
           begin
              if (DMMain.EstadoKri(224) <> 0) then
                 DBRENotas2.Font.Size := DMMain.EstadoKri(224);
              DBRENotas2.Visible := True;
              DBRENotas2.DataSource := DataSource;
              DBRENotas2.DataField := Field2.FieldName;
              DBRENotas2.Height := PNLNotasRich.Height div 3;
           end;

           // Inicializo el tamaño de la letra
           // EFontSize.Text := IntToStr(DBRENotas.DefAttributes.Size);
        end;

        ShowModal;
     finally
        Free;
     end;
  end;
end;

procedure TFMNotasCampo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  HelpFile := REntorno.FicheroAyuda;
  HelpType := htKeyword;
  HelpKeyword := 'FMNOTASCAMPO';

  // RichEdit
  GetFontNames;
  RichEditConFoco := DBRENotas;
  FUpdating := False;
end;

procedure TFMNotasCampo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMNotasCampo.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if Button = nbPost then
     ModalResult := mrOk
  else
  if Button = nbCancel then
  begin
     if ConfirmaMensaje('Esta seguro de que desea cancelar los cambios?') then
        ModalResult := mrCancel
     else
        Continua := False;
  end;
end;

procedure TFMNotasCampo.EFontSizeChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  if (RichEditConFoco <> nil) then
     with RichEditConFoco do
     begin
        if SelLength > 0 then
           SelAttributes.Size := StrToInt(EFontSize.Text)
        else
           DefAttributes.Size := StrToInt(EFontSize.Text);
     end;
end;

procedure TFMNotasCampo.DBRENotasSelectionChange(Sender: TObject);
begin
  try
     FUpdating := True;
     with TDBRichEdit(Sender) do
     begin
        EFontSize.Text := IntToStr(SelAttributes.Size);
        CBFontName.Text := SelAttributes.Name;
     end;
  finally
     FUpdating := False;
  end;
end;

procedure TFMNotasCampo.DBRENotasEnter(Sender: TObject);
begin
  RichEditConFoco := DBRENotas;
end;

procedure TFMNotasCampo.DBRENotas2Enter(Sender: TObject);
begin
  RichEditConFoco := DBRENotas2;
end;

procedure TFMNotasCampo.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(CBFontName.Items));
  ReleaseDC(0, DC);
  CBFontName.Sorted := True;
end;

procedure TFMNotasCampo.CBFontNameChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  with RichEditConFoco do
  begin
     if SelLength > 0 then
        SelAttributes.Name := CBFontName.Items[CBFontName.ItemIndex]
     else
        DefAttributes.Name := CBFontName.Items[CBFontName.ItemIndex];
  end;
end;

procedure TFMNotasCampo.TButtSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFMNotasCampo.RichEditAlignJustifiedExecute(Sender: TObject);
var
  Format : TParaFormat2; // declared in RichEdit.pas
begin
  FillChar(Format, SizeOf(TParaFormat2), 0);
  Format.cbSize := SizeOf(TParaFormat2);
  Format.dwMask := PFM_ALIGNMENT; {The wAlignment member is valid}
  Format.wAlignment := PFA_JUSTIFY;
  {Some words about PFA_JUSTIFY from MSDN help:
  Rich Edit 2.0: Paragraphs are justified.
  This value is included for compatibility with TOM interfaces;
  rich edit controls earlier than version 3.0 display the text aligned with the left margin.}
  SendMessage(RichEditConFoco.Handle, EM_SETPARAFORMAT, 0, LPARAM(@Format));
end;

procedure TFMNotasCampo.TBComprobarClick(Sender: TObject);
var
  s, w : string;
  i, Index : integer;
begin
  inherited;
  s := DBMNotas.Lines.Text;
  Index := LBPalabras.ItemIndex;
  if (Index < 0) then
     Index := 0;

  // Recorro texto y agrego palabras a lista de palabras
  LBPalabras.Items.Clear;
  w := '';
  for i := 1 to Length(s) do
  begin
     if (s[i] in ['A'..'Z', 'a'..'z', 'ñ', 'Ñ', 'ç', 'Ç', 'á', 'Á', 'é', 'É', 'í', 'Í', 'ó', 'Ó', 'ú', 'Ú', 'ü', 'Ü', 'à', 'À', 'è', 'È', 'ì', 'Ì', 'ò', 'Ò', 'ù', 'Ù']) then
        w := w + s[i]
     else
     begin
        if (Trim(w) > '') then
           LBPalabras.Items.Add(w);

        w := '';
     end;
  end;
  if (w <> ' ') then
     LBPalabras.Items.Add(w);

  // Borro palabras conocidas.
  for i := LBPalabras.Items.Count - 1 downto 0 do
  begin
     if DMMain.ExistePalabra(LBPalabras.Items[i]) then
        LBPalabras.Items.Delete(i);
  end;

  if (LBPalabras.Items.Count = 0) then
     LBPalabras.ItemIndex := -1
  else
  if (Index > LBPalabras.Items.Count - 1) then
     LBPalabras.ItemIndex := LBPalabras.Items.Count - 1
  else
     LBPalabras.ItemIndex := Index;
end;

procedure TFMNotasCampo.TBAgregarPalabraClick(Sender: TObject);
var
  Origen, Separador : string;
begin
  inherited;
  with DS.DataSet do
  begin
     Origen := '';
     Separador := '';
     if Assigned(Fields.FindField('TIPO')) then
     begin
        Origen := Origen + Separador + FieldByName('TIPO').AsString;
        Separador := '-';
     end;
     if Assigned(Fields.FindField('EJERCICIO')) then
     begin
        Origen := Origen + Separador + FieldByName('EJERCICIO').AsString;
        Separador := '-';
     end;
     if Assigned(Fields.FindField('SERIE')) then
     begin
        Origen := Origen + Separador + FieldByName('SERIE').AsString;
        Separador := '/';
     end;
     if Assigned(Fields.FindField('RIG')) then
     begin
        Origen := Origen + Separador + FieldByName('RIG').AsString;
        Separador := '.';
     end;
     if Assigned(Fields.FindField('LINEA')) then
     begin
        Origen := Origen + Separador + FieldByName('LINEA').AsString;
        Separador := '-';
     end;
  end;

  DMMain.AgregarPalabra(LBPalabras.Items[LBPalabras.ItemIndex], Origen);
  TBComprobar.Click;
end;

end.
