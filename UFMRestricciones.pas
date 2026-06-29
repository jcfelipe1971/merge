{ TODO -oDuilio : Revisar toda la parte de variables publicas y hacerlas privadas al formulario }

unit UFMRestricciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, ComCtrls, Menus, UTeclas, UControlEdit, UEditPanel, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, ULFLabel, ULFDBEditFind2000, UG2kTBLoc,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UFPEditDetalle;

type
  TFMRestriccion = class(TFPEditDetalle)
     PCabecera: TLFPanel;
     ToolBarInfo: TLFToolBar;
     TBNoVisible: TToolButton;
     TBEnabled: TToolButton;
     TBVisible: TToolButton;
     PNLTree: TLFPanel;
     TVMain: TTreeView;
     LBLNivel: TLFLabel;
     DBEPerfil: TLFDbedit;
     DBETitulo: TLFDbedit;
     PNLTituloRestriccionesEEC: TLFPanel;
     LSuperior: TLFLabel;
     DBETitSuperior: TLFDbedit;
     DBEFSuperior: TLFDBEditFind2000;
     CHKContabilidadAnalitica: TLFDBCheckBox;
     CHKTPVTactil: TLFDBCheckBox;
     LFCategoryAction1: TLFCategoryAction;
     AListaRestricciones: TAction;
     AConfiguracionListaRestricciones: TAction;
     CBPuedeAbrirFacturasVenta: TLFDBCheckBox;
     TBSeleccionaTodo: TToolButton;
     TBDesSeleccionaTodo: TToolButton;
     TBSep1: TToolButton;
     TSep2: TToolButton;
     TButtExpandeMapa: TToolButton;
     TButtContraeMapa: TToolButton;
     spl1: TSplitter;
     procedure FormCreate(Sender: TObject);
     procedure TVMainDblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TVMainKeyPress(Sender: TObject; var Key: char);
     procedure TBVisibleClick(Sender: TObject);
     procedure TBEnabledClick(Sender: TObject);
     procedure TBNoVisibleClick(Sender: TObject);
     procedure TButtContraeMapaClick(Sender: TObject);
     procedure TButtExpandeMapaClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure CHKContabilidadAnaliticaChange(Sender: TObject);
     procedure AListaRestriccionesExecute(Sender: TObject);
     procedure AConfiguracionListaRestriccionesExecute(Sender: TObject);
     procedure TBSeleccionaTodoClick(Sender: TObject);
     procedure TBDesSeleccionaTodoClick(Sender: TObject);
     procedure DBEPerfilChange(Sender: TObject);
     procedure FormResize(Sender: TObject);
  private
     { Private declarations }
     procedure HabilitarSuperior(habilita: boolean);
     procedure CrearArbol;
     procedure Restringir(Opcion: integer; Nodo: TTreeNode);
     procedure RestringirTodo(Opcion: integer);
  public
     { Public declarations }
     function DameRestriccion: string;
  end;


var
  FMRestriccion : TFMRestriccion;

const
  Rojo: integer = 6;
  Amarillo: integer = 8;
  Verde: integer = 7;

implementation

uses UFMain, UDMMain, UDMRestricciones, UFormGest, UDMLstRestricciones, UFMListConfig, UParam, UEntorno;

{$R *.DFM}

// Construye el arbol para indicar los perfiles a partir del action list
procedure TFMRestriccion.CrearArbol;
var
  // Categoria : array[0..100] of string;
  Categoria : TStrings;
  x, n, i, Top : integer;
  Nodo : TTreeNode;
  NodoHijo : TTreeNode;
  Acciones : TActionList;
  Accion : TAction;
  AIndex, Icon : integer;
  Encontrado : integer;
  cbuscar : string;
  Proteccion : string;

  IIndex, ITag : array of integer;
begin
  Categoria := TStringList.Create;
  try
     // G2K
     Categoria.Add('Terceros');
     Categoria.Add('Almacenes');
     Categoria.Add('Compras');
     Categoria.Add('Ventas');
     Categoria.Add('Contabilidad');
     Categoria.Add('Inmovilizado');
     Categoria.Add('Impuestos');
     Categoria.Add('Tesoreria');
     Categoria.Add('Reparaciones');
     Categoria.Add('Empresas');
     Categoria.Add('Auxiliares');
     Categoria.Add('Utilidades');
     Categoria.Add('Produccion Avanzada');
     Categoria.Add('Produccion Despiece');
     Categoria.Add('Produccion Pauta');
     Categoria.Add('Produccion Plan');
     Categoria.Add('Obras');
     Categoria.Add('Control Presencia');
     Categoria.Add('Operarios');
     Categoria.Add('CRM');
     Categoria.Add('Produccion ISO');
     Categoria.Add('Etiquetas');
     Categoria.Add('TPV App');
     Categoria.Add('TPV');
     Categoria.Add('Coladas');
     Categoria.Add('Gas');
     Categoria.Add('T y C');
     Categoria.Add('T y C Auxiliares');
     Categoria.Add('T y C Listados');
     Categoria.Add('Tallas');
     Categoria.Add('Contabilidad Analitica');

     if (REntorno.Pais <> 'ESP') then
        Categoria.Add('Latino');

     Categoria.Add('Estadisticas');
     Categoria.Add('Listados Presonalizado');
     Categoria.Add('ECommerce');

     // Categoria[11] := 'Produccion'; Quitamos categoria que ya no se utiliza. Es la produccion basica de G2K
     // Categoria[33] := 'Rep. Dominicana'; Quitamos categoria que ya no se utiliza
     //***Nota*** No se agrega la categoria de acciones "Basico" porque tiene las opciones minimas que no deberian ser parte de los perfiles

     Acciones := FMain.ALMain;
     TVMain.Items.Clear;
     Top := 80; // Dimension maxima del array
     SetLength(IIndex, Top + 1); // Dimension del array
     SetLength(ITag, Top + 1);   // Dimension del array

     Proteccion := DMRestriccion.QMRestriccionPROTECCION.AsString;
     // Comprobamos si es el TPV o el G2K
     if (Pos('TPV', UpperCase(ExtractFileName(Application.ExeName))) > 0) then
        i := 27
     else
        i := 0;

     // Rellenamos nodos con las acciones de FMain
     for n := i to Categoria.Count - 1 do
     begin
        Icon := 66;
        Nodo := TVMain.Items.Add(nil, Categoria[n]);
        Nodo.ImageIndex := icon;     // <- Este icono va a pelo...
        Nodo.SelectedIndex := icon;  // <- Este icono va a pelo...

        for x := 0 to (Acciones.ActionCount - 1) do
           if (Acciones.Actions[x].Category = Categoria[n]) then
           begin
              Accion := TAction(Acciones.Actions[x]);
              cbuscar := (';' + IntToStr(Accion.Tag) + ',');
              Encontrado := Pos(cbuscar, Proteccion);

              if (Encontrado = 0) then
                 icon := Verde //icono indica el no visible.
              else
              begin
                 case StrToInt(Copy(Proteccion, Encontrado + Length(cbuscar), 1)) of
                    0: icon := Rojo;
                    1: icon := Amarillo;
                    2: icon := Verde;
                    else
                       icon := Amarillo // icono indica enabled.
                 end;
              end;

              if Accion.Tag <> 0 then
              begin
                 NodoHijo := TVMain.Items.AddChild(Nodo, Accion.Hint);
                 NodoHijo.ImageIndex := icon;
                 AIndex := NodoHijo.AbsoluteIndex;
                 if Top < AIndex then
                 begin
                    SetLength(IIndex, AIndex + 1); // por si necesitamos mas espacio
                    SetLength(ITag, AIndex + 1); // por si necesitamos mas espacio
                    Top := AIndex; // Nueva dimension maxima del array
                 end;
                 ITag[AIndex] := Accion.Tag;
                 IIndex[AIndex] := Accion.ImageIndex;
                 NodoHijo.Data := Accion;
                 NodoHijo.SelectedIndex := icon;
              end;
           end;
     end;
  finally
     Categoria.Free;
  end;

  // Limpio nodos vacios.
  Nodo := TVMain.TopItem;
  while Assigned(Nodo) do
  begin
     // Si el nodo no tiene hijos, lo elimino y vuelvo a empezar.
     if Nodo.Count = 0 then
     begin
        Nodo.Free;
        Nodo := TVMain.TopItem;
     end;
     Nodo := Nodo.getNextSibling;
  end;
end;

procedure TFMRestriccion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRestriccion, DMRestriccion);
  NavMain.DataSource := DMRestriccion.DSRestriccion;
  DBGMain.DataSource := DMRestriccion.DSRestriccion;

  ToolBarInfo.Align := alNone;
  ToolBarInfo.Left := 0;
  ToolBarInfo.Top := PCabecera.Height - ToolBarInfo.Height - 1;

  if (DBEFSuperior.Text = '-1') then
     DBETitSuperior.Text := _('Padre');
end;

procedure TFMRestriccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRestriccion);
end;

// Recorre todo el arbol para restringir las opciones
procedure TFMRestriccion.RestringirTodo(Opcion: integer);
var
  i : integer;
begin
  with TVMain do
  begin
     for i := 0 to Items.Count - 1 do
        Restringir(Opcion, Items[i]);
     Refresh;
  end;
end;

procedure TFMRestriccion.Restringir(Opcion: integer; Nodo: TTreeNode);
var
  i : integer;
begin
  if (Nodo.HasChildren) then
  begin
     for i := 0 to Nodo.Count - 1 do
        Restringir(Opcion, Nodo.Item[i]);
  end
  else
  begin
     // Solo cambio los nodos relacionados con acciones. El resto son cabeceras.
     if Assigned(Nodo.Data) then
     begin
        Nodo.ImageIndex := Opcion;
        Nodo.SelectedIndex := Opcion;
     end;
  end;
end;

// Recorre todos los nodos de la rama con el siguiente nivel = {no Visible, desactivado, activado}
procedure TFMRestriccion.TVMainDblClick(Sender: TObject);
var
  Imagen : integer;
begin
  inherited;
  // Se hace la rotación para el próximo estado
  Imagen := 0;
  case TVMain.Selected.ImageIndex of
     6 {Rojo}: Imagen := Amarillo;
     7 {Verde}: Imagen := Rojo;
     8 {Amarillo}: Imagen := Verde;
  end;

  if (Imagen <> 0) then
     Restringir(Imagen, TVMain.Selected);

  TVMain.Refresh;
end;

procedure TFMRestriccion.TVMainKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if Key = #13 then
  begin
     TVMainDblClick(Sender);
     Key := #0;
  end;
end;

procedure TFMRestriccion.TBVisibleClick(Sender: TObject);
begin
  inherited;
  // Todo visible
  if Assigned(TVMain.Selected) then
     Restringir(Verde, TVMain.Selected);
end;

procedure TFMRestriccion.TBEnabledClick(Sender: TObject);
begin
  inherited;
  // Todo enabled
  if Assigned(TVMain.Selected) then
     Restringir(Amarillo, TVMain.Selected);
end;

procedure TFMRestriccion.TBNoVisibleClick(Sender: TObject);
begin
  // Todo no visible
  if Assigned(TVMain.Selected) then
     Restringir(Rojo, TVMain.Selected);
end;

procedure TFMRestriccion.TButtContraeMapaClick(Sender: TObject);
begin
  inherited;
  TVMain.FullCollapse;
end;

procedure TFMRestriccion.TButtExpandeMapaClick(Sender: TObject);
begin
  inherited;
  TVMain.FullExpand;
end;

procedure TFMRestriccion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;

  DMRestriccion.BusquedaCompleja;
  Continua := False;
end;

procedure TFMRestriccion.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMRestriccion.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
end;

procedure TFMRestriccion.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMRestriccion.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbInsert) then
  begin
     HabilitarSuperior(False);
     CrearArbol;
  end
  else
     HabilitarSuperior(True);

  if (Button = nbPost) then
     DMRestriccion.AsignaProteccion(DameRestriccion);

  if ((Button = nbPost) or (Button = nbCancel)) then
     CrearArbol;

  if (DBEFSuperior.Text = '-1') then
     DBETitSuperior.Text := _('Padre');
end;

procedure TFMRestriccion.HabilitarSuperior(Habilita: boolean);
begin
  if Habilita then
  begin
     DBEFSuperior.Color := clWindow;
     DBEFSuperior.Font.Color := clWindowText;
     DBEFSuperior.Enabled := Habilita;
  end
  else
  begin
     DBEFSuperior.Color := clInfoBk;
     DBEFSuperior.Font.Color := clGrayText;
     DBEFSuperior.Enabled := Habilita;
     DBETitSuperior.Text := _('Padre');
  end;
end;

procedure TFMRestriccion.CHKContabilidadAnaliticaChange(Sender: TObject);
var
  Nodo : TTreeNode;
begin
  inherited;

  Nodo := TVMain.Items.GetFirstNode;
  if (Nodo <> nil) then
     while ((Nodo <> nil) and (Nodo.Text <> 'Contabilidad Analitica')) do
        Nodo := Nodo.getNextSibling;

  if (Nodo <> nil) then
  begin
     TVMain.Select(Nodo);
     TVMainDblClick(Sender);
  end;
end;

procedure TFMRestriccion.AListaRestriccionesExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstRestricciones, DMLstRestricciones);
  DMLstRestricciones.MostrarListadoRestricciones(0);
  CierraData(DMLstRestricciones);
end;

procedure TFMRestriccion.AConfiguracionListaRestriccionesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstRestricciones, DMLstRestricciones);
  try
     TFMListConfig.Create(Self).Muestra(6136, formato, cabecera, copias,
        pijama, '', DMLstRestricciones.FrRestriciones);
  finally
     CierraData(DMLstRestricciones);
  end;
end;

procedure TFMRestriccion.TBSeleccionaTodoClick(Sender: TObject);
begin
  inherited;
  RestringirTodo(Verde);
end;

procedure TFMRestriccion.TBDesSeleccionaTodoClick(Sender: TObject);
begin
  inherited;
  RestringirTodo(Rojo);
end;

function TFMRestriccion.DameRestriccion: string;
var
  i : integer;
begin
  Result := '';

  with TVMain do
  begin
     for i := 0 to TVMain.Items.Count - 1 do
     begin
        if Assigned(TVMain.Items[i].Data) then
        begin
           try
              if (TVMain.Items[i].ImageIndex in [Rojo, Amarillo, Verde]) then
              begin
                 case TVMain.Items[i].ImageIndex of
                    6{Rojo}: Result := Result + ';' + IntToStr(TAction(TVMain.Items[i].Data).Tag) + ',0';
                    8{Amarillo}: Result := Result + ';' + IntToStr(TAction(TVMain.Items[i].Data).Tag) + ',1';
                    7{Verde}: Result := Result + ';' + IntToStr(TAction(TVMain.Items[i].Data).Tag) + ',2';
                 end;
              end;
           except
              on E: Exception do
                 ShowMessage(IntToStr(i) + #13#10 + E.Message);
           end;
        end;
     end;
  end;
end;

procedure TFMRestriccion.DBEPerfilChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEPerfil.Text, -1) <> -1) then
     CrearArbol;
end;

procedure TFMRestriccion.FormResize(Sender: TObject);
begin
  inherited;
  // Para forzar a estar en el pie del formulario, sobre TBActions.
  // Modifico la altura del panel principal para que el panel de restricciones quede siempre abajo.
  PMain.Height := Self.Height - TBActions.Height - 150;
end;

end.
