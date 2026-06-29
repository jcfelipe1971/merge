unit UFNavegador;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, ExtCtrls, ActnList, Buttons, StdCtrls, ToolWin, ComCtrls,
  ULFToolBar, ULFPanel;

type
  TFNavegador = class(TG2KForm)
     PNLMain: TLFPanel;
     SBMain: TScrollBox;
     TBMain: TLFToolBar;
     BtnMenu: TBitBtn;
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure BtnMenuClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     ListaMenus: TStringList;
     procedure CreaListaMenus;
     procedure CreaBotonesMenus;
     procedure BotonMenuClick(Sender: TObject);
     procedure CreaMenus;
     procedure CreaSubMenus(SubMenu: string; Sender: TBitBtn);
     procedure BorraSB(Sender: TBitBtn);
  public
     { Public declarations }
  end;

var
  FNavegador : TFNavegador;

implementation

uses UFMain, UEntorno;

{$R *.DFM}

procedure TFNavegador.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  Self.Top := 132;
  ListaMenus := TStringList.Create;
  CreaListaMenus;
end;

procedure TFNavegador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  ListaMenus.Free;
  FNavegador := nil;
end;

procedure TFNavegador.CreaListaMenus;
var
  i : integer;
  Acciones : TActionList;

  function CheckCategoria(categoria: string): boolean;
  var
     i, contador : integer;
  begin
     Result := False;
     i := 0;
     contador := ListaMenus.Count;
     if contador = 0 then
        Exit;

     while (i <> (contador)) do
     begin
        if ListaMenus.Strings[i] = categoria then
           Result := True;
        Inc(i);
     end;
  end;

begin
  Acciones := FMain.ALMain;
  for i := 0 to (Acciones.ActionCount - 1) do
  begin
     if not (CheckCategoria(Acciones.Actions[i].Category)) then
        ListaMenus.Add(Acciones.Actions[i].Category);
  end;
end;

procedure TFNavegador.CreaBotonesMenus;
var
  Boton : TBitBtn;
  aTop, aLeft, i : integer;
  aAncho, aAlto : integer;
begin
  aAncho := 100;
  aAlto := 50;
  aTop := 0;
  aLeft := 0;
  i := 0;
  BorraSB(BtnMenu);
  repeat
     Boton := TBitBtn.Create(SBMain);
     with Boton do
     begin
        Parent := SBMain;
        Width := aAncho;
        Height := aAlto;
        Layout := blGlyphTop;
        Font.Height := 14;
        Font.Style := [fsBold];
        ShowHint := True;
        Hint := ListaMenus.Strings[i];
        Caption := ListaMenus.Strings[i];
        Top := aTop;
        Left := aLeft;
        OnClick := BotonMenuClick;
     end;
     aLeft := aLeft + aAncho;
     if ((aLeft + aAncho) > SBMain.Width) then
     begin
        aLeft := 0;
        aTop := aTop + aAlto;
     end;
     Inc(i);
  until (i = ListaMenus.Count);
end;

procedure TFNavegador.BotonMenuClick(Sender: TObject);
begin
  CreaSubMenus((Sender as TBitbtn).Caption, Sender as TBitBtn);
  (Sender as TBitBtn).Visible := False;
end;

procedure TFNavegador.CreaMenus;
begin
  CreaBotonesMenus;
end;

procedure TFNavegador.CreaSubMenus(SubMenu: string; Sender: TBitBtn);
var
  Acciones : TActionList;
  i : integer;
  Boton : TBitBtn;
  aTop, aLeft : integer;
  aAncho, aAlto : integer;
begin
  aAncho := 100;
  aAlto := 50;
  aLeft := 0;
  aTop := 0;
  i := 0;
  BorraSB(Sender);
  Acciones := FMain.AlMain;
  repeat
     begin
        if (Acciones.Actions[i].Category = SubMenu) then
        begin
           Boton := TBitBtn.Create(SBMain);
           with Boton do
           begin
              Parent := SBMain;
              Width := aAncho;
              Height := aAlto;
              Layout := blGlyphTop;
              Font.Height := 14;
              Font.Style := [fsBold];
              ShowHint := True;
              Action := Acciones.Actions[i];
              Top := aTop;
              Left := aLeft;
           end;
           aLeft := aLeft + aAncho;
           if ((aLeft + aAncho) > SBMain.Width) then
           begin
              aLeft := 0;
              aTop := aTop + aAlto;
           end;
        end;
     end;
     Inc(i);
  until (i = Acciones.ActionCount);
end;

procedure TFNavegador.BorraSB(Sender: TBitBtn);
var
  i : integer;
  Salir : boolean;

  function CheckBotones(Sender: TBitBtn): boolean;
  var
     i : integer;
  begin
     Result := False;
     if SBMain.ComponentCount = 0 then
        Exit;
     for i := 0 to (SBMain.ComponentCount - 1) do
     begin
        if (SBMain.Components[i] is TBitBtn) then
           if i <> Sender.ComponentIndex then
              Result := True;
     end;
  end;

begin
  BtnMenu.SetFocus;
  while CheckBotones(Sender) do
  begin
     i := 0;
     Salir := False;
     while not (Salir) do
     begin
        if (SBMain.Components[i] is TBitBtn) then
        begin
           if i <> Sender.ComponentIndex then
           begin
              (SBMain.Components[i] as TBitBtn).Free;
              Salir := True;
           end;
        end;
        Inc(i);
     end;
  end;
  // Por último hacer invisible el boton
end;

procedure TFNavegador.FormShow(Sender: TObject);
begin
  CreaMenus;
  FNavegador.SetFocus;
end;

procedure TFNavegador.BtnMenuClick(Sender: TObject);
begin
  CreaMenus;
end;

end.
