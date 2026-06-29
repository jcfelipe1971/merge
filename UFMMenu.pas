unit UFMMenu;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ComCtrls, Menus, ULFLabel, ToolWin,
  ULFToolBar;

type
  TFMMenu = class(TG2KForm)
     tvMenu: TTreeView;
     TBMain: TLFToolBar;
     TBConfigurar: TToolButton;
     TBGuardar: TToolButton;
     TBCancelar: TToolButton;
     BSep1: TToolButton;
     pmOpcionesNodo: TPopupMenu;
     MIBorrar: TMenuItem;
     MIInsertar: TMenuItem;
     MICrearAccesoDirecto: TMenuItem;
     N1: TMenuItem;
     MIMostrarAvisos: TMenuItem;
     MIOculatarBorde: TMenuItem;
     MIMostrarBorde: TMenuItem;
     procedure FormCreate(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure tvMenuClick(Sender: TObject);
     procedure tvMenuDblClick(Sender: TObject);
     procedure tvMenuKeyPress(Sender: TObject; var Key: char);
     procedure TBConfigurarClick(Sender: TObject);
     procedure TBGuardarClick(Sender: TObject);
     procedure TBCancelarClick(Sender: TObject);
     procedure tvMenuDragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
     procedure tvMenuDragDrop(Sender, Source: TObject; X, Y: integer);
     procedure MIBorrarClick(Sender: TObject);
     procedure MIInsertarClick(Sender: TObject);
     procedure pmOpcionesNodoPopup(Sender: TObject);
     procedure tvMenuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
     procedure FormDestroy(Sender: TObject);
     procedure MICrearAccesoDirectoClick(Sender: TObject);
     procedure tvMenuMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure MIMostrarAvisosClick(Sender: TObject);
     procedure MIOculatarBordeClick(Sender: TObject);
     procedure MIMostrarBordeClick(Sender: TObject);
  private
     { Private declarations }
     tvMenuSeleccion: TTreeView;
     Configurando: boolean;
     procedure BorrarMenu;
     procedure CrearMenuLimpio(Menu: TMainMenu; TreeView: TTreeView = nil);
     procedure CrearMenuGuardado(Menu: TMainMenu; TreeView: TTreeView = nil);
     procedure CrearSubMenuLimpio(TreeView: TTreeView; NodoPadre: TTreeNode; Menu: TMenuItem);
     procedure CrearSubMenuGuardado(Menu: TMainMenu; TreeView: TTreeView; NodoPadre: TTreeNode; ParentTreeIndex: integer);
     function DameMenuItem(Menu: TMainMenu; Nombre: string): TMenuItem;
     function DameMenuItemSubmenu(MenuItem: TMenuItem; Nombre: string): TMenuItem;
     function LimpiaCaption(s: string): string;
     procedure AjustaBotonera;
  public
     { Public declarations }
     procedure CrearMenu(Menu: TMainMenu; TreeView: TTreeView = nil);
     procedure Posicionar;
  end;

var
  FMMenu : TFMMenu;

implementation

uses UFMain, UDMMain, UEntorno, FIBDataSet, FIBDatabase, HYFIBQuery, UAccesosDirectos;

{$R *.dfm}

procedure TFMMenu.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  Posicionar;
  tvMenuSeleccion := nil;
  Configurando := False;
  AjustaBotonera;
end;

procedure TFMMenu.FormActivate(Sender: TObject);
begin
  inherited;
  Posicionar;
end;

procedure TFMMenu.CrearMenu(Menu: TMainMenu; TreeView: TTreeView = nil);
var
  Existe : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID, TREE_INDEX, PARENT_TREE_INDEX, ORDEN, TITULO, ACCION FROM DIC_MENU WHERE USUARIO = :USUARIO';
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        Existe := (FieldByName['ID'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Assigned(TreeView)) then
     TreeView.Items.Clear;

  if (Existe) then
     CrearMenuGuardado(Menu, TreeView)
  else
     CrearMenuLimpio(Menu, TreeView);
end;

procedure TFMMenu.CrearMenuGuardado(Menu: TMainMenu; TreeView: TTreeView = nil);
var
  Nodo : TTreeNode;
  i : integer;
begin
  if (not Assigned(TreeView)) then
     TreeView := tvMenu;

  // Ahora que tengo el menu lo organizo segun lo desee el usuario
  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add('SELECT M.ID, M.TREE_INDEX, M.PARENT_TREE_INDEX, M.ORDEN, M.TITULO, M.ACCION, ');
           SelectSQL.Add('       (SELECT COUNT(*) ');
           SelectSQL.Add('        FROM DIC_MENU ');
           SelectSQL.Add('        WHERE ');
           SelectSQL.Add('        USUARIO = M.USUARIO AND ');
           SelectSQL.Add('        PARENT_TREE_INDEX = M.TREE_INDEX) CANT_SUBMENU ');
           SelectSQL.Add('FROM DIC_MENU M ');
           SelectSQL.Add('WHERE ');
           SelectSQL.Add('M.USUARIO = :USUARIO AND ');
           SelectSQL.Add('M.PARENT_TREE_INDEX = :PARENT_TREE_INDEX ');
           SelectSQL.Add('ORDER BY M.PARENT_TREE_INDEX, M.ORDEN, M.TREE_INDEX ');
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['PARENT_TREE_INDEX'].AsInteger := -1; // Seleciono los elementos de primer nivel
           Open;

           while not EOF do
           begin
              if (FieldByName('CANT_SUBMENU').AsInteger > 0) then
              begin
                 // Creo el nodo padre
                 Nodo := TreeView.Items.AddChildObject(nil, FieldByName('TITULO').AsString, nil);
                 Nodo.ImageIndex := 66;
                 Nodo.SelectedIndex := 80;
                 Nodo.StateIndex := -1;

                 // Creo submenu, colgando de padre
                 CrearSubMenuGuardado(Menu, TreeView, Nodo, FieldByName('TREE_INDEX').AsInteger);
              end
              else
              begin
                 // Busco el MenuItem
                 i := 0;
                 while ((i < Menu.Items.Count - 1) and (Menu.Items[i].Name <> FieldByName('ACCION').AsString)) do
                    Inc(i);

                 // Creo Nodo
                 if (i < Menu.Items.Count - 1) then
                 begin
                    Nodo := TreeView.Items.AddChildObject(nil, LimpiaCaption(FieldByName('TITULO').AsString), Menu.Items[i]);
                    Nodo.ImageIndex := 66; //  Menu.Items[i].ImageIndex;
                    Nodo.SelectedIndex := 80;
                    Nodo.StateIndex := -1;
                 end;
              end;

              Next;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

function TFMMenu.DameMenuItem(Menu: TMainMenu; Nombre: string): TMenuItem;
var
  i : integer;
begin
  Result := nil;
  i := 0;
  while ((not Assigned(Result)) and (i <= Menu.Items.Count - 1) and (Menu.Items[i].Name <> Nombre)) do
  begin
     if (Menu.Items[i].Count > 0) then
        Result := DameMenuItemSubmenu(Menu.Items[i], Nombre);
     Inc(i);
  end;
end;

function TFMMenu.DameMenuItemSubmenu(MenuItem: TMenuItem; Nombre: string): TMenuItem;
var
  i : integer;
begin
  Result := nil;
  i := 0;
  while ((not Assigned(Result)) and (i <= MenuItem.Count - 1) and (MenuItem.Items[i].Name <> Nombre)) do
  begin
     if (MenuItem.Items[i].Count > 0) then
        Result := DameMenuItemSubmenu(MenuItem.Items[i], Nombre);
     Inc(i);
  end;

  if ((i <= MenuItem.Count - 1) and (MenuItem.Items[i].Name = Nombre)) then
     Result := MenuItem.Items[i];
end;

procedure TFMMenu.CrearSubMenuGuardado(Menu: TMainMenu; TreeView: TTreeView; NodoPadre: TTreeNode; ParentTreeIndex: integer);
var
  Nodo : TTreeNode;
  MenuItem : TMenuItem;
begin
  // Recorro los registros que corresponden a elementos del submenu
  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add('SELECT M.ID, M.TREE_INDEX, M.PARENT_TREE_INDEX, M.ORDEN, M.TITULO, M.ACCION, ');
           SelectSQL.Add('       (SELECT COUNT(*) ');
           SelectSQL.Add('        FROM DIC_MENU ');
           SelectSQL.Add('        WHERE ');
           SelectSQL.Add('        USUARIO = M.USUARIO AND ');
           SelectSQL.Add('        PARENT_TREE_INDEX = M.TREE_INDEX) CANT_SUBMENU ');
           SelectSQL.Add('FROM DIC_MENU M ');
           SelectSQL.Add('WHERE ');
           SelectSQL.Add('M.USUARIO = :USUARIO AND ');
           SelectSQL.Add('M.PARENT_TREE_INDEX = :PARENT_TREE_INDEX ');
           SelectSQL.Add('ORDER BY M.PARENT_TREE_INDEX, M.ORDEN, M.TREE_INDEX ');
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['PARENT_TREE_INDEX'].AsInteger := ParentTreeIndex;
           Open;

           while not EOF do
           begin
              if (FieldByName('CANT_SUBMENU').AsInteger > 0) then
              begin
                 // Creo el nodo padre
                 Nodo := TreeView.Items.AddChildObject(NodoPadre, FieldByName('TITULO').AsString, nil);
                 Nodo.ImageIndex := 66;
                 Nodo.SelectedIndex := 80;
                 Nodo.StateIndex := -1;

                 // Creo submenu, colgando de padre
                 CrearSubMenuGuardado(Menu, TreeView, Nodo, FieldByName('TREE_INDEX').AsInteger);
              end
              else
              begin
                 // Busco el MenuItem
                 MenuItem := nil;
                 if (Trim(FieldByName('ACCION').AsString) <> '') then
                    MenuItem := DameMenuItem(Menu, FieldByName('ACCION').AsString);

                 // Creo Nodo
                 Nodo := TreeView.Items.AddChildObject(NodoPadre, LimpiaCaption(FieldByName('TITULO').AsString), MenuItem);
                 if (Assigned(MenuItem)) then
                    Nodo.ImageIndex := MenuItem.ImageIndex
                 else
                    Nodo.ImageIndex := 66;
                 Nodo.SelectedIndex := 80;
                 Nodo.StateIndex := -1;
              end;

              Next;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMMenu.CrearMenuLimpio(Menu: TMainMenu; TreeView: TTreeView = nil);
var
  Nodo : TTreeNode;
  i : integer;
begin
  if (not Assigned(TreeView)) then
     TreeView := tvMenu;

  with TreeView do
  begin
     Items.Clear;
     Items.BeginUpdate;

     // Creo primer nodo
     // Nodo := Items.Add(nil, _('Menu'));

     // Recorro Menu
     for i := 0 to Menu.Items.Count - 1 do
     begin
        // Evito menú 'Ventanas' e 'Impresoras'
        if ((LimpiaCaption(Menu.Items[i].Caption) <> _('Ventanas')) and (LimpiaCaption(Menu.Items[i].Caption) <> _('Impresoras'))) then
        begin
           // Evito separadores
           if ((Menu.Items[i].Caption <> '-') and (Menu.Items[i].Visible)) then
           begin
              Nodo := Items.Add(nil, LimpiaCaption(Menu.Items[i].Caption));

              if (Assigned(Menu.Items[i].OnClick)) then
                 Nodo.Data := Menu.Items[i];

              if (Menu.Items[i].Count > 0) then
                 CrearSubMenuLimpio(TreeView, Nodo, Menu.Items[i]);
              Nodo.ImageIndex := 66; //  Menu.Items[i].ImageIndex;
              Nodo.SelectedIndex := 80;
              Nodo.StateIndex := -1;
              {
              Nodo.Tag := 0;
              if (Assigned(Menu.Items[i].Action)) then
                 Nodo.Tag := Menu.Items[i].Action.Tag;
              }
           end;
        end;
     end;

     Items[0].Expand(False);
     Items.EndUpdate;
  end;
end;

procedure TFMMenu.CrearSubMenuLimpio(TreeView: TTreeView; NodoPadre: TTreeNode; Menu: TMenuItem);
var
  Nodo : TTreeNode;
  i : integer;
begin
  for i := 0 to Menu.Count - 1 do
  begin
     if ((Menu.Items[i].Caption <> '-') and (Menu.Items[i].Visible)) then
     begin
        Nodo := TreeView.Items.AddChildObject(NodoPadre, LimpiaCaption(Menu.Items[i].Caption), Menu.Items[i]);

        Nodo.ImageIndex := Menu.Items[i].ImageIndex;
        if Nodo.ImageIndex = -1 then
           Nodo.ImageIndex := 66;
        Nodo.SelectedIndex := 80;
        Nodo.StateIndex := -1;

        if (Menu.Items[i].Count > 0) then
           CrearSubMenuLimpio(TreeView, Nodo, Menu.Items[i]);

        Nodo.Expand(False);
     end;
  end;
end;

function TFMMenu.LimpiaCaption(s: string): string;
var
  i : integer;
begin
  Result := '';
  for i := 1 to Length(s) do
     if (s[i] <> '&') then
        Result := Result + s[i];
end;

procedure TFMMenu.MICrearAccesoDirectoClick(Sender: TObject);
begin
  with tvMenu do
  begin
     if (Assigned(Selected)) then
     begin
        if (Assigned(Selected.Data) and Assigned(TMenuItem(Selected.Data).Action)) then
           GuardaAccesoDirecto(TMenuItem(Selected.Data).Action.Name);
     end;
  end;
end;

procedure TFMMenu.tvMenuClick(Sender: TObject);
var
  Nodo, SelectedNode : TTreeNode;
begin
  if not (Configurando) then
  begin
     with tvMenu do
     begin
        if (Assigned(Selected)) then
        begin
           if (Assigned(Selected.Data)) then
              TMenuItem(Selected.Data).Click
           else
           begin
              SelectedNode := Selected;

              Nodo := Items[0];
              while (Assigned(Nodo)) do
              begin
                 Nodo.Collapse(True);
                 Nodo := Nodo.GetNextSibling;
              end;

              Nodo := SelectedNode;
              while Assigned(Nodo.Parent) do
              begin
                 Nodo := Nodo.Parent;
                 Nodo.Expand(False);
              end;

              Selected := SelectedNode;
              Selected.Expand(False);
           end;
        end;
     end;
  end;
end;

procedure TFMMenu.tvMenuDblClick(Sender: TObject);
var
  Nodo, SelectedNode : TTreeNode;
begin
  if not (Configurando) then
  begin
     with tvMenu do
     begin
        if (Assigned(Selected)) then
        begin
           if (Assigned(Selected.Data)) then
              TMenuItem(Selected.Data).Click
           else
           begin
              SelectedNode := Selected;

              Nodo := Items[0];
              while (Assigned(Nodo)) do
              begin
                 Nodo.Collapse(True);
                 Nodo := Nodo.GetNextSibling;
              end;

              Nodo := SelectedNode;
              while Assigned(Nodo.Parent) do
              begin
                 Nodo := Nodo.Parent;
                 Nodo.Expand(False);
              end;

              Selected := SelectedNode;
              Selected.Expand(True);
           end;
        end;
     end;
  end;
end;

procedure TFMMenu.tvMenuKeyPress(Sender: TObject; var Key: char);
var
  Nodo : TTreeNode;
begin
  if (Key = #27) then
  begin
     with tvMenu do
     begin
        Nodo := Items[0];
        while (Assigned(Nodo)) do
        begin
           Nodo.Collapse(True);
           Nodo := Nodo.GetNextSibling;
        end;
     end;
  end;

  if ((Key = #13) and (not Configurando)) then
     tvMenuClick(Sender);
end;

procedure TFMMenu.AjustaBotonera;
begin
  TBGuardar.Visible := Configurando;
  TBCancelar.Visible := Configurando;
  TBConfigurar.Visible := (not Configurando);
end;

procedure TFMMenu.TBConfigurarClick(Sender: TObject);
var
  aWidth : integer;
begin
  with tvMenu do
  begin
     aWidth := Width;
     ReadOnly := False;
     PopupMenu := pmOpcionesNodo;
  end;

  tvMenuSeleccion := TTreeView.Create(Self);
  with tvMenuSeleccion do
  begin
     Parent := Self;
     Width := aWidth;
     Align := alRight;
     BorderStyle := tvMenu.BorderStyle;
     Images := tvMenu.Images;
     DragMode := dmAutomatic;
     StateImages := tvMenu.StateImages;
     ReadOnly := True;
  end;

  Self.Width := Self.Width + aWidth;

  CrearMenuLimpio(FMain.MainMenu, tvMenuSeleccion);
  Configurando := True;
  AjustaBotonera;
end;

procedure TFMMenu.TBGuardarClick(Sender: TObject);
var
  i : integer;
begin
  // Borro configuracion previa
  BorrarMenu;

  // Guardar configuracion
  for i := 0 to tvMenu.Items.Count - 1 do
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO DIC_MENU (USUARIO, ORDEN, TREE_INDEX, PARENT_TREE_INDEX, TITULO, ACCION) VALUES (:USUARIO, :ORDEN, :TREE_INDEX, :PARENT_TREE_INDEX, :TITULO, :ACCION)';
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['ORDEN'].AsInteger := i + 1;
           Params.ByName['TREE_INDEX'].AsInteger := tvMenu.Items[i].AbsoluteIndex;
           Params.ByName['PARENT_TREE_INDEX'].AsInteger := -1;
           if (Assigned(tvMenu.Items[i].Parent)) then
              Params.ByName['PARENT_TREE_INDEX'].AsInteger := tvMenu.Items[i].Parent.AbsoluteIndex;
           Params.ByName['TITULO'].AsString := tvMenu.Items[i].Text;
           Params.ByName['ACCION'].AsString := '';
           if (Assigned(tvMenu.Items[i].Data)) then
              Params.ByName['ACCION'].AsString := TMenuItem(tvMenu.Items[i].Data).Name;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Configurando := False;
  tvMenu.PopupMenu := nil;
  Self.Width := Self.Width - tvMenu.Width;
  FreeAndNil(tvMenuSeleccion);
  AjustaBotonera;
  CrearMenu(FMain.MainMenu, tvMenu);
end;

procedure TFMMenu.TBCancelarClick(Sender: TObject);
begin
  Configurando := False;
  tvMenu.PopupMenu := nil;
  Self.Width := Self.Width - tvMenu.Width;
  FreeAndNil(tvMenuSeleccion);
  AjustaBotonera;
  CrearMenu(FMain.MainMenu, tvMenu);
end;

procedure TFMMenu.tvMenuDragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
var
  TargetNode, SourceNode : TTreeNode;
begin
  TargetNode := tvMenu.GetNodeAt(X, Y);
  // accept dragging from itself
  if (Source = Sender) and (TargetNode <> nil) then
  begin
     Accept := True;
     // determines source and target
     SourceNode := tvMenu.Selected;
     // look up the target parent chain
     while (TargetNode.Parent <> nil) and (TargetNode <> SourceNode) do
        TargetNode := TargetNode.Parent;
     // if source is found
     if TargetNode = SourceNode then
        // do not allow dragging over a child
        Accept := False;
  end
  else
     Accept := True;
end;

procedure TFMMenu.tvMenuDragDrop(Sender, Source: TObject; X, Y: integer);
var
  TargetNode, SourceNode, NewNode : TTreeNode;
begin
  TargetNode := tvMenu.GetNodeAt(X, Y);
  if (Source is TTreeView) then
  begin
     // Si se mueve un nodo del mismo TreeView
     if (Source = Sender) then
     begin
        if (TargetNode <> nil) then
        begin
           SourceNode := TTreeView(Source).Selected;
           if (Assigned(TargetNode.Data)) then
              SourceNode.MoveTo(TargetNode, naInsert)
           else
              SourceNode.MoveTo(TargetNode, naAddChildFirst);
           TargetNode.Expand(False);
           tvMenu.Selected := TargetNode;
        end;
     end
     else
     begin
        if (TargetNode <> nil) then
        begin
           SourceNode := TTreeView(Source).Selected;

           // Copio los datos del Nodo origen
           if (Assigned(TargetNode.Data)) then
              NewNode := TTreeView(Sender).Items.AddObject(TargetNode, SourceNode.Text, SourceNode.Data)
           else
              NewNode := TTreeView(Sender).Items.AddChildObject(TargetNode, SourceNode.Text, SourceNode.Data);
           NewNode.ImageIndex := SourceNode.ImageIndex;
           NewNode.SelectedIndex := 80;
           NewNode.StateIndex := -1;
           SourceNode.Delete;

           TargetNode.Expand(False);
           tvMenu.Selected := TargetNode;
        end;
     end;
  end;
end;

procedure TFMMenu.BorrarMenu;

  procedure BorraElementoMenu(id: integer);
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM DIC_MENU WHERE ID = :ID';
           Params.ByName['ID'].AsInteger := id;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  // Se borrar los elementos en orden descendiente para evitar que el trigger DIC_MENU_AD0 reordene el resto de la tabla.
  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add('SELECT ID FROM DIC_MENU WHERE USUARIO = :USUARIO ORDER BY ORDEN DESC');
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Open;
           while not EOF do
           begin
              BorraElementoMenu(FieldByName('ID').AsInteger);
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMMenu.MIBorrarClick(Sender: TObject);
begin
  tvMenu.Selected.Delete;
end;

procedure TFMMenu.MIInsertarClick(Sender: TObject);
var
  Nodo : TTreeNode;
begin
  if Assigned(tvMenu.Selected.Data) then
     Nodo := tvMenu.Items.AddObject(tvMenu.Selected, 'Nuevo', nil)
  else
     Nodo := tvMenu.Items.AddChildObject(tvMenu.Selected, 'Nuevo', nil);

  Nodo.ImageIndex := 66;
  Nodo.SelectedIndex := 80;
  Nodo.StateIndex := -1;
end;

procedure TFMMenu.pmOpcionesNodoPopup(Sender: TObject);
begin
  if (Assigned(tvMenu.Selected)) then
     MIBorrar.Caption := _('Borrar') + ' ' + tvMenu.Selected.Text;
end;

procedure TFMMenu.tvMenuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
var
  Nodo : TTreeNode;
begin
  // Asigno el Hint del MenuItem al del TreeView
  Nodo := tvMenu.GetNodeAt(X, Y);
  if (Assigned(Nodo)) then
  begin
     if (Assigned(Nodo.Data)) then
        tvMenu.Hint := TMenuItem(Nodo.Data).Hint
     else
        tvMenu.Hint := Nodo.Text;
  end;
end;

procedure TFMMenu.Posicionar;
begin
  /// Ajusta posicion y dimension del menu

  Self.Top := FMain.Top + FMain.Height;
  if (Constraints.MaxHeight <> 0) then
     Self.Height := Constraints.MaxHeight;

  Self.Left := 0;
end;

procedure TFMMenu.FormDestroy(Sender: TObject);
begin
  FMMenu := nil;
end;

procedure TFMMenu.tvMenuMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if (Button = mbRight) then
     tvMenu.Select(tvMenu.GetNodeAt(X, Y));
end;

procedure TFMMenu.MIMostrarAvisosClick(Sender: TObject);
begin
  with tvMenu do
  begin
     if (Assigned(Selected)) then
        MostrarAvisos;
  end;
end;

procedure TFMMenu.MIOculatarBordeClick(Sender: TObject);
begin
  with tvMenu do
  begin
     if (Assigned(Selected)) then
        BordeVisible(False);
  end;
end;

procedure TFMMenu.MIMostrarBordeClick(Sender: TObject);
begin
  with tvMenu do
  begin
     if (Assigned(Selected)) then
        BordeVisible(True);
  end;
end;

end.
