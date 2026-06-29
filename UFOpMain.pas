unit UFOpMain;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, UControlEdit, UFormGest, ULFComboBox,
  ULFToolBar, ULFLabel;

type
  TFOpMain = class(TG2KForm)
     TBMain: TLFToolBar;
     SBMain: TStatusBar;
     TVMain: TTreeView;
     CBMain: TLFComboBox;
     LProcesos: TLFLabel;
     ToolButton2: TToolButton;
     ToolButton1: TToolButton;
     ToolButton3: TToolButton;
     ToolButton5: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBMainChange(Sender: TObject);
     procedure TVMainDblClick(Sender: TObject);
     procedure CBMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure TVMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure CBMainClick(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FOpMain : TFOpMain;

implementation

uses UFMain, UDMMain, ActnList, UEntorno;

{$R *.DFM}

procedure TFOpMain.FormCreate(Sender: TObject);
var
  n : integer;
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  CBMain.ItemIndex := 0;
  CBMainChange(Self);
  SBMain.Panels[0].Text := REntorno.NombreEmpresa;
  SBMain.Panels[2].Text := REntorno.EjercicioStr;
  SBMain.Panels[4].Text := REntorno.CanalStr;
  // Se muestra donde se dejó....
  if (REntorno.Menu_Left < Screen.DesktopWidth) then
     Left := REntorno.Menu_Left;
  if (REntorno.Menu_Top < Screen.DesktopHeight) then
     Top := REntorno.Menu_Top;
  for n := 0 to CBMain.Items.Count do
  begin
     CBMain.ItemIndex := n;
     CBMainChange(Self);
  end;
  {S * JMG}
  n := 0;
  while n < cBMain.Items.Count do
  begin
     if not Assigned(CBMain.Items.Objects[n]) then
        CBMain.Items.Delete(n)
     else
        Inc(n);
  end;
  {S * JMG}
  CBMain.ItemIndex := 0;
end;

procedure TFOpMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

{S * JMG}
procedure TFOpMain.CBMainChange(Sender: TObject);
var
  Categoria : string;
  x : integer;
  Nodo : TTreeNode;
  NodoHijo : TTreeNode;
  Acciones : TActionList;
  Accion : TAction;
  cNivelAcceso : string;
  cBuscada : string;
  Encontrado : integer;
  HayHijos : boolean;
  Mostrar : integer;
begin
  HayHijos := False;
  Nodo := nil;
  cNivelAcceso := DMMain.DameRestriccionUsuario;// xRestriccionesPROTECCION.AsString;
  Acciones := FMain.ALMain;
  Categoria := CBMain.Text;
  if not Assigned(CBMain.Items.Objects[CBMain.ItemIndex]) then
  begin
     for x := 0 to (Acciones.ActionCount - 1) do
        if (Acciones.Actions[x].Category = Categoria) then
        begin
           Accion := TAction(Acciones.Actions[x]);
           if cNivelAcceso <> '' then
           begin
              cBuscada := (';' + IntToStr(Accion.Tag) + ',');
              Encontrado := Pos(cBuscada, cNivelAcceso);
              //Mostrar:=0;
              if (encontrado <> 0) then
                 Mostrar := StrToInt(Copy(cNivelAcceso,
                    Encontrado + Length(cBuscada), 1))
              else
                 Mostrar := 2;
           end
           else
           begin
              Mostrar := 2;  // Da igual
           end;

           // if Mostrar = 2 then ShowMessage ('Si!!!');

           if {(Accion.Tag <> 0) and} (Mostrar = 2) then  // 2-> Visible y activo
           begin
              if not HayHijos then
              begin
                 Nodo := TVMain.Items.Add(nil, Categoria);
                 Nodo.ImageIndex := 25;     // <- Este icono va a pelo...
                 Nodo.SelectedIndex := 64;  // <- Este icono va a pelo...
              end;
              NodoHijo := TVMain.Items.AddChild(Nodo, Accion.Hint);
              NodoHijo.ImageIndex := Accion.ImageIndex;
              NodoHijo.Data := Accion;
              NodoHijo.SelectedIndex := 64;
              HayHijos := True;
           end;
        end;

     if HayHijos then
        CBMain.Items.Objects[CBMain.ItemIndex] := Nodo
     else
        CBMain.Items.Objects[CBMain.ItemIndex] := nil;
  end;
end;

procedure TFOpMain.TVMainDblClick(Sender: TObject);
begin
  if Assigned(TVMain.Selected) and
     (TComponent(TVMain.Selected.Data) is Taction) then
  begin
     TAction(TVMain.Selected.Data).Execute;
  end;
end;

procedure TFOpMain.CBMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Objeto : TObject;
begin
  Objeto := CBMain.Items.Objects[CBMain.ItemIndex];
  if Assigned(Objeto) and (Objeto is TTreeNode) then
  begin
     case Key of
        107: TTreeNode(Objeto).Expand(True);
        109: TTreeNode(Objeto).Collapse(True);
        VK_DOWN:
        begin
           TVMain.SetFocus;
           TVMain.Selected := TTreeNode(Objeto);
           Key := 0;
        end;
     end;
  end;
end;

procedure TFOpMain.TVMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (key = VK_RETURN) then
  begin
     TVMainDblClick(Sender);
     Key := 0;
  end;
  if (Key = VK_UP) and (TVMain.Selected = TVMain.Items[0]) then
  begin
     CBMain.SetFocus;
  end;
end;

procedure TFOpMain.CBMainClick(Sender: TObject);
begin
  TVMain.SetFocus;
end;

procedure TFOpMain.FormDestroy(Sender: TObject);
begin
  REntorno.Menu_Left := Self.Left;
  REntorno.Menu_Top := Self.Top;
end;

end.
