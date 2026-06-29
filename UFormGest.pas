unit UFormGest;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ActnList, UEntorno, StdCtrls, DB, DBCtrls, Mask, FIBTableDataSet, UControlEdit,
  dbcgrids, DBGrids, Variants, ULFDBEdit, ULFToolBar, ULFFormStorage, UNavigator, Math,
  FibEditFind, UFibDBEditFind, UComponentesBusquedaFiltrada, NsDBGrid, URecursos,
  {HYFIBQuery,} UHYDBGrid, ULFEditFind2000, ULFDBEditFind2000, ULFPageControl;

type

  TG2KForm = class(THYForm)
     function CloseQuery: boolean; override;
     procedure FSMainSaveIni(Sender: TObject);
     procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
  public
     Instancia: integer;
     slvar: boolean;
     instanciastr: string;
     Campo: TField;
     constructor Create(AOwner: TComponent); override;
     procedure DoClose(var Action: TCloseAction); override;
  protected
     procedure Activate; override;
  end;

  THYMenuItem = class(TMenuItem)
  public
     destructor Destroy; override;
  end;

  THYAction = class(TAction);

procedure InicializaComponentes(Nueva: TForm; FSMain: TLFFibFormStorage);
procedure SetMenuVentanas(Item: TMenuItem);
procedure AbreForm(Clase: TFormClass; var Referencia; Sender: TObject = nil);
procedure CalculaPos(Menus, Ancho, Alto: integer; var l, t: integer);
procedure AbreFormVarias(Clase: TFormClass; var Referencia; Sender: TObject = nil; Modal: boolean = False; ClaseContador: TFormClass = nil);
procedure AbreData(Clase: TComponentClass; var Referencia);
procedure AbreDataVarias(Clase: TComponentClass; var Referencia; Padre: TComponent);
procedure CierraData(var DModuloPar);
procedure CierraForms;
procedure CierraFormsMenos(Activo: TForm);
procedure CierraForm(var Form);
procedure AssignDataSource(var Referencia: TDataModule; Padre: TComponent);
procedure RetranslateForms; //IDIOMA_CODE

// Tratamiento formulario en menú Ventanas form principal
procedure AccionForm(Form: string; Accion: smallint);

implementation

uses UFMain, {$IFNDEF Utils}UFMMenu,{$ENDIF} UDMMain, UFPElegirPerfil, FIBDataSet, FIBDataSetRO, FIBDataBase, FIBQuery, HYFIBQuery, frxDBSet,
  {IdGlobal,} FR_Class, frxClass, Fr_HYReport, frxHYReport, ComCtrls, UG2kTBLoc, UParam, TFlatButtonUnit;

var
  SubMenu : TMenuItem;
  l : integer = 0;
  t : integer = 132;
  m : integer = 0;

//  _________________________  //
// |                         | //
// |       THYMenuItem       | //
// |_________________________| //
//                             //

destructor THYMenuItem.Destroy;
begin
  inherited Destroy;
  if ((SubMenu.Count > 0) and TForm(SubMenu.Items[SubMenu.Count - 1].Owner).CanFocus) then
     TForm(SubMenu.Items[SubMenu.Count - 1].Owner).SetFocus;
end;

// Procedimientos generales de la unit

procedure SetMenuVentanas(Item: TMenuItem);
begin
  SubMenu := Item;
end;

procedure InicializaComponentes(Nueva: TForm; FSMain: TLFFibFormStorage);
var
  i, c, t : integer;
  OrdenarBusquedaArticuloPorTitulo : boolean;
  CamposADesplegarEnBusqueda : string;
begin
  OrdenarBusquedaArticuloPorTitulo := (DMMain.EstadoKri(42) = 1);
  CamposADesplegarEnBusqueda := LeeParametro('ARTBUSQ001');

  for i := 0 to Nueva.ComponentCount - 1 do
  begin
     // Asignar FSMain a Grids
     if (Nueva is TG2kForm) then
     begin
        // Valores por defecto de componentes
        if (Nueva.Components[i] is TLFFibFormStorage) then
           FSMain := TLFFibFormStorage(Nueva.Components[i])
        {else
                    if (Nueva.Components[i] is TFlatButton) then
                    begin
                       TFlatButton(Nueva.Components[i]).ColorBorder := clGray;
                       TFlatButton(Nueva.Components[i]).ColorFocused := clBtnFace;
                       TFlatButton(Nueva.Components[i]).ColorDown := clBtnFace;
                       TFlatButton(Nueva.Components[i]).ColorShadow := clWhite;
                       TFlatButton(Nueva.Components[i]).ColorHighlight := clWhite;
                    end }
        else
        if (Nueva.Components[i] is TDBRadioGroup) then
        begin
           TDBRadioGroup(Nueva.Components[i]).Ctl3D := False;
           TDBRadioGroup(Nueva.Components[i]).Caption := ' ' + Trim(TDBRadioGroup(Nueva.Components[i]).Caption) + ' ';
        end
        else
        if (Nueva.Components[i] is TGroupBox) then
        begin
           TDBRadioGroup(Nueva.Components[i]).Ctl3D := False;
           TDBRadioGroup(Nueva.Components[i]).Caption := ' ' + Trim(TDBRadioGroup(Nueva.Components[i]).Caption) + ' ';
        end
        else
        if (Nueva.Components[i] is TLFPageControl) then
        begin
           TLFPageControl(Nueva.Components[i]).TabActiveColor := CE_Color_Activo;
           TLFPageControl(Nueva.Components[i]).TabInActiveColor := clBtnFace;
        end
        else
        if (Nueva.Components[i] is TLFToolBar) then
        begin
           TLFToolBar(Nueva.Components[i]).Flat := True;
           TLFToolBar(Nueva.Components[i]).AutoSize := True;
        end
        else
        if (Nueva.Components[i] is THYMNavigator) then
        begin
           THYMNavigator(Nueva.Components[i]).Flat := True;
        end
        else
        if (Nueva.Components[i] is TDBGridFind2000) then
        begin
           with TDBGridFind2000(Nueva.Components[i]) do
           begin
              BorderStyle := bsNone;
              // TDBGridFind2000(Nueva.Components[i]).Idioma := REntorno.IdiomaCanal;
              if (IniStorage = nil) then
                 IniStorage := FSMain;
              // if (ReadOnly) then
              Font.Color := clWindowText;

              for c := 0 to Columns.Count - 1 do
              begin
                 if (Columns[c].Width > Width) then
                    Columns[c].Width := Width - 20;
              end;
           end;
        end
        else
        if (Nueva.Components[i] is THYTDBGrid) then
        begin
           with THYTDBGrid(Nueva.Components[i]) do
           begin
              BorderStyle := bsNone;
              if (Idioma <> REntorno.IdiomaCanal) then
              begin
                 try
                    Idioma := REntorno.IdiomaCanal;
                 except
                    DMMain.Log(Format('Error UFormGest.InicializaComponentes (%s)', [Name]));
                 end;
              end;
              if (IniStorage = nil) then
                 IniStorage := FSMain;
              // if (ReadOnly) then
              Font.Color := clWindowText;

              for c := 0 to Columns.Count - 1 do
              begin
                 if (Columns[c].Width > Width) then
                    Columns[c].Width := Width - 20;
              end;
           end;
        end
        else
        if (Nueva.Components[i] is TNsDBGrid) then
        begin
           with TNsDBGrid(Nueva.Components[i]) do
           begin
              BorderStyle := bsNone;
              if (Idioma <> REntorno.IdiomaCanal) then
              begin
                 try
                    Idioma := REntorno.IdiomaCanal;
                 except
                    DMMain.Log(Format('Error UFormGest.InicializaComponentes (%s)', [Name]));
                 end;
              end;
              if (IniStorage = nil) then
                 IniStorage := FSMain;
              // if (ReadOnly) then
              Font.Color := clWindowText;

              for c := 0 to Columns.Count - 1 do
              begin
                 if (Columns[c].Width > Width) then
                    Columns[c].Width := Width - 20;
              end;
           end;
        end;
     end;

     if (Nueva.Components[i] is TDBEdit) and (UsaMayusculas) then
        TDBEdit(Nueva.Components[i]).CharCase := ecUpperCase;

     // Ordenar busquedas de articulo por TITULO
     if (OrdenarBusquedaArticuloPorTitulo) then
     begin
        if (Nueva.Components[i] is TLFEditFind2000) then
        begin
           with TLFEditFind2000(Nueva.Components[i]) do
           begin
              if ((Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_COMPRAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_VENTAS')) then
                 OrdenadoPor.Text := 'TITULO';
           end;
        end;

        if (Nueva.Components[i] is TLFDBEditFind2000) then
        begin
           with TLFDBEditFind2000(Nueva.Components[i]) do
           begin
              if ((Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_COMPRAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_VENTAS')) then
                 OrdenadoPor.Text := 'TITULO';
           end;
        end;

        if (Nueva.Components[i] is TG2kTBLoc) then
        begin
           with TG2kTBLoc(Nueva.Components[i]) do
           begin
              if ((Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_COMPRAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_VENTAS')) then
                 OrdenadoPor.Text := 'TITULO';
           end;
        end;

        if (Nueva.Components[i] is TDBGridFind2000) then
        begin
           with TDBGridFind2000(Nueva.Components[i]) do
           begin
              for t := 0 to Tablas.Count - 1 do
              begin
                 if ((Trim(UpperCase(Tablas[t])) = 'VER_ARTICULOS_EF') or (Trim(UpperCase(Tablas[t])) = 'VER_ARTICULOS_EF_COMPRAS') or (Trim(UpperCase(Tablas[t])) = 'VER_ARTICULOS_EF_VENTAS')) then
                 begin
                    // Antes de asignar el valor de orden debo mirar si existe un elemento con ese indice.
                    // Si no existe creo elementos vacios hasta llegar a ese indice.
                    while (OrdenadosPor.Count - 1 < t) do
                       OrdenadosPor.Add('');
                    OrdenadosPor[t] := 'TITULO';
                 end;
              end;
           end;
        end;
     end;

     if ((CamposADesplegarEnBusqueda <> 'ARTICULO') and (CamposADesplegarEnBusqueda <> '')) then
     begin
        CamposADesplegarEnBusqueda := StringReplace(CamposADesplegarEnBusqueda, ',', #13, [rfReplaceAll]);

        if (Nueva.Components[i] is TLFEditFind2000) then
        begin
           with TLFEditFind2000(Nueva.Components[i]) do
           begin
              if ((Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_COMPRAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_VENTAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_CUENTAS')) then
                 Campos_Desplegar.Text := CamposADesplegarEnBusqueda;
           end;
        end;

        if (Nueva.Components[i] is TLFDBEditFind2000) then
        begin
           with TLFDBEditFind2000(Nueva.Components[i]) do
           begin
              if ((Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_COMPRAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_VENTAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_CUENTAS')) then
                 Campos_Desplegar.Text := CamposADesplegarEnBusqueda;
           end;
        end;

        if (Nueva.Components[i] is TG2kTBLoc) then
        begin
           with TG2kTBLoc(Nueva.Components[i]) do
           begin
              if ((Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_COMPRAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_EF_VENTAS') or (Trim(UpperCase(Tabla_a_buscar)) = 'VER_ARTICULOS_CUENTAS')) then
                 CamposADesplegar.Text := CamposADesplegarEnBusqueda;
           end;
        end;

        if (Nueva.Components[i] is TDBGridFind2000) then
        begin
           with TDBGridFind2000(Nueva.Components[i]) do
           begin
              for t := 0 to Tablas.Count - 1 do
              begin
                 if ((Trim(UpperCase(Tablas[t])) = 'VER_ARTICULOS_EF') or (Trim(UpperCase(Tablas[t])) = 'VER_ARTICULOS_EF_COMPRAS') or (Trim(UpperCase(Tablas[t])) = 'VER_ARTICULOS_EF_VENTAS') or (Trim(UpperCase(Tablas[t])) = 'VER_ARTICULOS_CUENTAS')) then
                 begin
                    if ((CamposDesplegar.Count > t) and (CamposDesplegar[t] = '1')) then
                    begin
                       if (Pos(#13, CamposADesplegarEnBusqueda) = 0) then
                          Numericos[t] := CamposADesplegarEnBusqueda
                       else
                          Numericos[t] := Copy(CamposADesplegarEnBusqueda, 1, Pos(#13, CamposADesplegarEnBusqueda) - 1); // LeeParametro('ARTBUSQ001');

                       CamposADevolver[t] := 'ARTICULO';

                       // Me aseguro de que haya un registro para poner el campo a ordenar. La lista puede estar vacia
                       while (OrdenadosPor.Count - 1) < t do
                          OrdenadosPor.Add('');
                       if (not OrdenarBusquedaArticuloPorTitulo) then
                          OrdenadosPor[t] := StringReplace(CamposADesplegarEnBusqueda, #13, ',', [rfReplaceAll]); // LeeParametro('ARTBUSQ001');
                    end;
                 end;
              end;
           end;
        end;
     end;

     if Assigned(CE_OwnerDrawMenuItem) then
     begin
        if (Nueva.Components[i] is TMenuItem) then
        begin
           TMenuItem(Nueva.Components[i]).OnDrawItem :=
              CE_OwnerDrawMenuItem;
           TMenuItem(Nueva.Components[i]).OnMeasureItem :=
              CE_MeasureMenuItem;
        end;
        if (Nueva.Components[i] is TMenu) then
        begin
           TMenu(Nueva.Components[i]).OwnerDraw := True;
        end;
     end;
  end;
end;

procedure AbreForm(Clase: TFormClass; var Referencia; Sender: TObject = nil);
var
  i, t : integer;
  m : THYMenuItem;
  Nueva : TForm;
  Menus : integer;
  CCInit : integer;
  FSMain : TLFFibFormStorage;
  aEnlaceModal : boolean;
  Save_Cursor : TCursor;
begin
  DMMain.LogIni('AbreForm');
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
     if not (FMain.EnlaceInstancias) then
     begin
        Nueva := nil;
        Menus := 0;
        DMMain.Log('Nueva.BringToFront');
        with Application do
           for i := 0 to (ComponentCount - 1) do
              if (('T' + Components[i].Name) = Clase.ClassName) then
              begin
                 Nueva := TForm(Components[i]);
                 // Si el form está maximizado lo dejo asi
                 if (Nueva.WindowState <> wsMaximized) then
                    Nueva.WindowState := wsNormal;
                 Nueva.BringToFront;
                 TForm(Referencia) := Nueva;
                 Exit;
              end;
        CCInit := 0;
        if (Nueva = nil) then
        begin
           Nueva := TForm(Clase.NewInstance);
           TForm(Referencia) := Nueva;
           try
              DMMain.Log('Nueva.Create(Application);');
              Nueva.Create(Application);
              CCInit := Nueva.ComponentCount;

              // Localizamos FSMain en el nuevo form
              FSMain := nil;
              if (Nueva is TG2kForm) then
              begin
                 // Si no existe lo creamos
                 if (FSMain = nil) then
                 begin
                    DMMain.Log('FSMain := TLFFibFormStorage.Create(Nueva);');
                    FSMain := TLFFibFormStorage.Create(Nueva);
                    FSMain.User := REntorno.Usuario;
                    {FSMain.Name := 'FSMain';
                    FSMain.Database := DMMain.DataBase;
                    FSMain.Profile := ifThen(super, - 1,REntorno.User_Profile);
                    FSMain.IniFileName := MakeTempFileName;
                    FSMain.OnSaveIni   := TG2kForm(Nueva).FSMainSaveIni;}
                 end
                 else
                    FSMain.User := REntorno.Usuario;
              end;

              DMMain.LogIni('InicializaComponentes');
              InicializaComponentes(Nueva, FSMain);
              DMMain.LogFin('InicializaComponentes');

              Nueva.FormStyle := fsNormal;
              Nueva.Visible := False;

              (* Esto no se debe utilizar. Duplica los menues de los Toobar
              // Restauro atributos del formulario, si tiene el componente para esto.
              if Assigned(FSMain) then
                 FSMain.RestoreFormPlacement;
              *)

              if (Nueva.Position = poDefault) then
              begin
                 DMMain.Log('Posicion');
                 if Assigned(SubMenu) then
                    Menus := SubMenu.Count;
                 CalculaPos(Menus, Nueva.Width, Nueva.Height, l, t);
                 Nueva.Left := l;
                 Nueva.Top := t;
              end;

              DMMain.LogIni('Posicion TSFicha, TSTabla');
              // En los PageControl Ficha será la primera y Notas la segunda
              with Nueva do
              begin
                 for i := 0 to (ComponentCount - 1) do
                 begin
                    if (Components[i] is TTabSheet) then
                    begin
                       if (TTabSheet(Components[i]).Name = 'TSFicha') then
                          TTabSheet(Components[i]).PageIndex := 0;
                       if (TTabSheet(Components[i]).Name = 'TSTabla') then
                          TTabSheet(Components[i]).PageIndex := 1;
                    end;
                 end;
              end;
              DMMain.LogFin('Posicion TSFicha, TSTabla');

              DMMain.Log('Nueva.Show;');
              Nueva.Show;

              DMMain.Log('Nueva.Left/Top');
              // No permito que la ventana esté fuera de los margenes de la pantalla
              if ((Nueva.Left > Screen.Width) or (Nueva.Left < 0)) then
                 Nueva.Left := 100;
              if ((Nueva.Top > Screen.Height) or (Nueva.Top < 0)) then
                 Nueva.Top := 100;

              // No permito que la ventana esté sobre el menu principal
              if (Nueva.Top < FMain.Top + FMain.Height) then
                 Nueva.Top := FMain.Top + FMain.Height;
           except
              TForm(Referencia) := nil;
              raise;
           end;

           DMMain.LogIni('SubMenu.Insert(SubMenu.Count, m);');
           if ((Sender is TAction) and Assigned(SubMenu)) then
           begin
              m := THYMenuItem.Create(Nueva);
              m.Action := TAction(Sender);
              m.OnDrawItem := CE_OwnerDrawMenuItem;
              m.OnMeasureItem := CE_MeasureMenuItem;
              m.Caption := Nueva.Caption;
              SubMenu.Insert(SubMenu.Count, m);
              // SubMenu.Add(m);
           end;
           DMMain.LogFin('SubMenu.Insert(SubMenu.Count, m);');
        end;

        if REntorno <> nil then
           Nueva.HelpFile := REntorno.FicheroAyuda;
        Nueva.HelpType := htKeyword;
        Nueva.HelpKeyword := UpperCase(Nueva.Name);

        DMMain.LogIni('CE_OwnerDrawMenuItem / CE_MeasureMenuItem');
        // Degradado para los MenuItem de la ULFToolBar
        for i := CCInit to Nueva.ComponentCount - 1 do
           if (Nueva.Components[i] is TMenuItem) then
           begin
              TMenuItem(Nueva.Components[i]).OnDrawItem := CE_OwnerDrawMenuItem;
              TMenuItem(Nueva.Components[i]).OnMeasureItem := CE_MeasureMenuItem;
           end;
        DMMain.LogFin('CE_OwnerDrawMenuItem / CE_MeasureMenuItem');
     end
     else
     begin
        aEnlaceModal := FMain.EnlaceModal;
        AbreFormVarias(Clase, Referencia, Sender, FMain.EnlaceModal);
        if (aEnlaceModal) then
           TForm(Referencia) := nil;
     end;
  finally
     Screen.Cursor := Save_Cursor;
     DMMain.LogFin('AbreForm');
  end;
end;

procedure CalculaPos(Menus, Ancho, Alto: integer; var l, t: integer);
var
  Cuantos : integer;
  Salto : boolean;
begin
  Salto := False;
  Cuantos := (Menus - m);
  l := 0 + (07 * Cuantos);
  t := 136 + (23 * Cuantos);
  if (Ancho + l) > Screen.Width then
     Salto := True;
  if (Alto + t) > Screen.Height then
     Salto := True;

  if ((Ancho > Screen.Width) or (Alto + 136 > Screen.Height)) then
  begin
     l := 0;
     t := 136;
     Salto := False;
  end;

  if Salto then
  begin
     m := Menus;
     CalculaPos(Menus, Ancho, Alto, l, t);
  end;
end;

procedure AbreData(Clase: TComponentClass; var Referencia);
var
  Nueva : TDataModule;
  ds : TDataSource;
  frxDB : TfrxDBDataSet;
  i, f : integer;
  encontrado : boolean;
  Save_Cursor : TCursor;
begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
     if TDataModule(Referencia) <> nil then
     begin
        Nueva := TDataModule(Referencia);
        Nueva.Tag := (Nueva.Tag + 1);
        Exit;
     end;
     Nueva := TDataModule(Clase.NewInstance);
     TDataModule(Referencia) := Nueva;
     try
        Nueva.Create(Application);

        // Busco componente tipo TfrxHyReport
        with Nueva do
        begin
           i := 0;
           f := ComponentCount - 1;
           encontrado := False;
           while ((not encontrado) and (i <= f)) do
           begin
              if (Components[i] is TfrxHyReport) then
                 encontrado := True
              else
                 Inc(i);
           end;

           // Si el DataModule contiene algún componente tipo TfrxHyReport
           // creo componentes TfrxDBDataSet por cada TDataSource
           if (encontrado) then
           begin
              for i := 0 to ComponentCount - 1 do
              begin
                 if ((Components[i] is TDataSource) and
                    (FindComponent('frxDB' + TDataSource(Components[i]).Name) = nil)) then
                 begin // Crea su semejante para frx
                    ds := TDataSource(Components[i]);
                    frxDB := TfrxDBDataSet.Create(Nueva);
                    frxDB.DataSource := ds;
                    frxDB.Name := 'frxDB' + ds.Name;
                    frxDB.UserName := 'frxDB' + ds.Name;
                 end;
              end;
           end;

           // Si KRICONF_430 es 1 prohibo edicion de FastReport y FastReport X.
           if (DMMain.EstadoKri(430) = 1) then
           begin
              // Recorro sus componentes
              for i := 0 to (ComponentCount - 1) do
              begin
                 // Si es un reporte, marco la propiedad para evitar que se edite
                 if (Components[i] is TfrReport) then
                    TfrReport(Components[i]).ModifyPrepared := False;
                 if (Components[i] is TfrHYReport) then
                    TfrHYReport(Components[i]).ModifyPrepared := False;
                 if (Components[i] is TfrxReport) then
                    TfrxReport(Components[i]).PreviewOptions.AllowEdit := False;
                 if (Components[i] is TfrxHYReport) then
                    TfrxHYReport(Components[i]).PreviewOptions.AllowEdit := False;
              end;
           end;
        end;
     except
        TDataModule(Referencia) := nil;
        raise;
     end;
  finally
     Screen.Cursor := Save_Cursor;
  end;
end;

procedure CierraData(var DModuloPar);
var
  i, j : integer;
  grabar : boolean;
  encontrado : boolean;
  DModulo : TDataModule;
  tr : TFIBTransaction;
begin
  encontrado := False;
  if (TDataModule(DModuloPar) <> nil) and not (csDestroying in
     TDataModule(DModuloPar).ComponentState) then
  begin
     DModulo := TDataModule(DModuloPar);
     j := 0;
     while ((j < Application.ComponentCount) and (not encontrado)) do
     begin
        if ((Application.Components[j].Name) = DModulo.Name) then
        begin
           encontrado := True;
           grabar := True;
           DModulo.Tag := (DModulo.Tag - 1);
           if (DModulo.Tag = -1) then
           begin
              if (REntorno.ModoCierraForm in [1, 2]) then
                 for i := 0 to DModulo.ComponentCount - 1 do
                 begin
                    if DModulo.Components[i] is TFIBTableSet then
                    begin
                       if (TDataSet(DModulo.Components[i]).State in [dsEdit, dsInsert]) and
                          grabar then
                       begin
                          if REntorno.ModoCierraForm = 2 then
                          begin
                             if MessageBox(Application.MainForm.Handle,
                                '¿Desea grabar los cambios realizados?', 'Atención...',
                                MB_YESNO or MB_TOPMOST) = ID_NO then
                                grabar := False;
                          end;
                          if grabar then
                             TFIBTableSet(DModulo.Components[i]).Post;
                       end;
                    end;
                 end;

              (*
                Recorrer datasets y query para verificar el
                cierre de las transacciones
          *)

              for i := 0 to DModulo.ComponentCount - 1 do
              begin
                 tr := nil;
                 if ((Assigned(DModulo.Components[i])) and (DModulo.Components[i] is TFIBDataSetRO) and
                    (TFIBDataSetRO(DModulo.Components[i]).AutoTrans) and
                    (TFIBDataSetRO(DModulo.Components[i]).Active) and
                    (Assigned(TFIBDataSetRO(DModulo.Components[i]).Transaction))
                    ) then
                    tr := TFIBDataSetRO(DModulo.Components[i]).Transaction;

                 // Intentamos hacer commit sino rollback
                 if ((Assigned(tr)) and (tr.InTransaction)) then
                 begin
                    try
                       try
                          tr.Commit;
                       except
                          try
                             tr.Rollback
                          except
                          end;
                       end;
                    finally
                       tr.Free;
                    end;
                 end;
              end;
              // Fin
              DModulo.Free;
              TObject(DModuloPar) := nil;
           end;
        end;
        j := j + 1;
     end;
     if not encontrado then
     begin
        grabar := True;
        if (REntorno.ModoCierraForm in [1, 2]) then
           for i := 0 to DModulo.ComponentCount - 1 do
           begin
              if DModulo.Components[i] is TFIBTableSet then
              begin
                 if (TDataSet(DModulo.Components[i]).State in [dsEdit, dsInsert]) and grabar then
                 begin
                    if REntorno.ModoCierraForm = 2 then
                    begin
                       if MessageBox(Application.MainForm.Handle,
                          PChar(string(_('¿Desea grabar los cambios realizados?'))), PChar(string(_('Atención...'))),
                          MB_YESNO or MB_TOPMOST) = ID_NO then
                          grabar := False;
                    end;
                    if grabar then
                       TFIBTableSet(DModulo.Components[i]).Post;
                 end;
              end;
           end;

        (*
            Recorrer datasets y query para verificar el
            cierre de las transacciones
      *)

        for i := 0 to DModulo.ComponentCount - 1 do
        begin
           tr := nil;
           if ((Assigned(DModulo.Components[i])) and (DModulo.Components[i] is TFIBDataSetRO) and
              (TFIBDataSetRO(DModulo.Components[i]).AutoTrans) and
              (TFIBDataSetRO(DModulo.Components[i]).Active) and
              (Assigned(TFIBDataSetRO(DModulo.Components[i]).Transaction))
              ) then
              tr := TFIBDataSetRO(DModulo.Components[i]).Transaction;

           // Intentamos hacer commit sino rollback
           if ((Assigned(tr)) and (tr.InTransaction)) then
           begin
              try
                 try
                    tr.Commit;
                 except
                    try
                       tr.Rollback
                    except
                    end;
                 end;
              finally
                 tr.Free;
              end;
           end;
        end;

        // Fin

        DModulo.Free;
        TObject(DModuloPar) := nil;
     end;
  end;
end;

procedure CierraForms;
var
  i : integer;
  Form : TForm;
begin
  m := 0;
  for i := SubMenu.Count - 1 downto 0 do
     if SubMenu.Items[i].Owner <> FMain then
     begin
        Form := TForm(SubMenu.Items[i].Owner);
        CierraForm(Form);
     end;
end;

procedure CierraFormsMenos(Activo: TForm);
var
  i : integer;
  Form : TForm;
begin
  for i := SubMenu.Count - 1 downto 0 do
     if (TForm(SubMenu.Items[i].Owner) <> Activo) and
        (TForm(SubMenu.Items[i].Owner) <> Activo.Owner) and
        (SubMenu.Items[i].Owner <> FMain) then
     begin
        Form := TForm(SubMenu.Items[i].Owner);
        CierraForm(Form);
     end;
end;

procedure CierraForm(var Form);
begin
  if (Assigned(TForm(Form))) then
  begin
     TForm(Form).Close;
     TForm(Form).Free;
     TObject(Form) := nil;
  end;
end;

{************************IDIOMA_CODE****************************}
procedure RetranslateForms;
var
  i : integer;
begin
  {  for i := SubMenu.Count-1 downto 0 do
    RetranslateComponent(TForm(SubMenu.Items[i].Owner));}
  {
  with Application do
     for i := 0 to (ComponentCount - 1) do
        if (Components[i] is TForm) or (Components[i] is THYForm) or
           (Components[i] is TFormClass) then
           RetranslateComponent(Components[i]);
}
  // Traduccion de Forms y DataModules
  with Application do
  begin
     for i := 0 to (ComponentCount - 1) do
        if (Components[i] is TDataModule) then
           RetranslateComponent(Components[i]);

     for i := 0 to (ComponentCount - 1) do
        if (Components[i] is TForm) then
           RetranslateComponent(Components[i]);
  end;
end;

{**********************FIN IDIOMA_CODE**************************}

procedure TG2KForm.Activate;
var
  hTB : HWND; // taskbar handle
  TBRect : TRect; // taskbar rectangle
  AlturaTaskBar : integer;
  MinLeft, MinTop, MaxHeight, MaxWidth : integer;
begin
  inherited;
  if Name <> 'FAyudaenLinea' then
     FMain.MuestraInfo(UpperCase(Name));

  MinLeft := 0;
  {$IFNDEF Utils}
  if Assigned(FMMenu) and ((Self as TForm) <> FMMenu) and (FMMenu.Visible) then
     MinLeft := FMMenu.Left + FMMenu.Width;
  {$ENDIF}
  // Da igual si se ha movido el FMain
  MinTop := FMain.Height;

  // Calculo la altura de la barra de tareas
  hTB := FindWindow('Shell_TrayWnd', '');
  if hTB = 0 then
     AlturaTaskBar := 0
  else
  begin
     GetWindowRect(hTB, TBRect);
     // Comprovamos si la barra de tareas es lateral
     if ((TBRect.Bottom - TBRect.Top) > (TBRect.Right - TBRect.Left)) then
        AlturaTaskBar := 0
     else
        AlturaTaskBar := TBRect.Bottom - TBRect.Top;
  end;
  MaxHeight := Screen.Height - AlturaTaskBar - FMain.Height;

  MaxWidth := Screen.Width - MinLeft;

  // Si esta maximizada no dejo que quede por arriba de FMain
  if ((Self as TForm).WindowState = wsMaximized) then
  begin
     // (Self as TForm).WindowState := wsNormal;
     (Self as TForm).Top := MinTop;
     (Self as TForm).Left := MinLeft;
     (Self as TForm).Height := MaxHeight;
     (Self as TForm).Width := MaxWidth;
  end
  else
  begin
     // Si esta sobre FMain pero entra debajo, la muevo hacia abajo.
     if ((Self as TForm).Top < MinTop) and ((Self as TForm).Height < MaxHeight) then
        (Self as TForm).Top := MinTop;

     // Si esta sobre FMMenu pero entra al lado, la muevo hacia la derecha.
     if ((Self as TForm).Left < MinLeft) and ((Self as TForm).Width < MaxWidth) then
        (Self as TForm).Left := MinLeft;

     // Si está fuera de la pantalla
     if ((Self as TForm).Top > MaxHeight - 48) then
        (Self as TForm).Top := Screen.Height - AlturaTaskBar - (Self as TForm).Height;
     if ((Self as TForm).Left > MaxWidth - 48) then
        (Self as TForm).Left := Screen.Width - (Self as TForm).Width;
  end;
end;

constructor TG2KForm.Create(AOwner: TComponent);
var
  i, k : integer;
  Botones : string;
  Restriccion : string;

  hTB : HWND; // taskbar handle
  TBRect : TRect; // taskbar rectangle
  AlturaTaskBar : integer;
begin
  slvar := True;
  inherited Create(AOwner);

  // Calculo la altura de la barra de tareas
  hTB := FindWindow('Shell_TrayWnd', '');
  if hTB = 0 then
     AlturaTaskBar := 0
  else
  begin
     GetWindowRect(hTB, TBRect);
     // Comprovamos si la barra de tareas es lateral
     if ((TBRect.Bottom - TBRect.Top) > (TBRect.Right - TBRect.Left)) then
        AlturaTaskBar := 0
     else
        AlturaTaskBar := TBRect.Bottom - TBRect.Top;
  end;
  // Establezco el tamaño maximo de la ventana
  // if (Height <= (Screen.Height-AlturaTaskBar-FMain.Top-FMain.Height)) then
  if (Screen.Height > 800) then
     Constraints.MaxHeight := Screen.Height - AlturaTaskBar - FMain.Top - FMain.Height;

  for i := 0 to (Self as TForm).ComponentCount - 1 do
  begin
     if (Self as TForm).Components[i] is TFIBEditFind then
     begin
        if REntorno.Estilo = 0 then
           TFIBEditFind((Self as TForm).Components[i]).Estilo := FIBEditFind.mdNormal
        else
           TFIBEditFind((Self as TForm).Components[i]).Estilo := FIBEditFind.mdTactil;
     end
     else
     if (Self as TForm).Components[i] is TFIBHYGGridFind then
     begin
        if REntorno.Estilo = 0 then
           TFIBHYGGridFind((Self as TForm).Components[i]).Estilos := mdNormal
        else
           TFIBHYGGridFind((Self as TForm).Components[i]).Estilos := mdTactil;
     end
     else
     if (Self as TForm).Components[i] is TFIBHYGEditFind then
     begin
        if REntorno.Estilo = 0 then
           TFIBHYGEditFind((Self as TForm).Components[i]).Estilo := TEstilo(mdNormal)
        else
           TFIBHYGEditFind((Self as TForm).Components[i]).Estilo := TEstilo(mdTactil);
     end
     else
     if (Self as TForm).Components[i] is TFIBDBEditfind then
     begin
        if REntorno.Estilo = 0 then
           TFIBDBEditfind((Self as TForm).Components[i]).Estilo := TEstilo(mdNormal)
        else
           TFIBDBEditfind((Self as TForm).Components[i]).Estilo := TEstilo(mdTactil);
     end
     else
     if (Self as TForm).Components[i] is TEdit then
     begin
        if TEDit((Self as TForm).Components[i]).Color = clAqua then
           TEDit((Self as TForm).Components[i]).Color := REntorno.ColorEnlaceActivo;
     end
     else
     if (Self as TForm).Components[i] is TLFFibFormStorage then
     begin
        TLFFibFormStorage((Self as TForm).Components[i]).Profile :=
           ifThen(super, -1, REntorno.User_Profile);
        TLFFibFormStorage((Self as TForm).Components[i]).OnSaveIni := FSMainSaveIni;
     end
     else
     if (Self as TForm).Components[i] is TDBGridFind2000 then
     begin
        if REntorno.Estilo = 0 then
           TDBGridFind2000((Self as TForm).Components[i]).Estilos := mdNormal
        else
           TDBGridFind2000((Self as TForm).Components[i]).Estilos := mdTactil;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT RESTRICCION FROM DIC_GRIDS WHERE FORMULARIO = ?FORMULARIO AND GRID = ?GRID AND PERFIL = ?PERFIL';
              Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
              Params.ByName['GRID'].AsString := UpperCase(TDBGridFind2000((Self as TForm).Components[i]).Name);
              Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
              ExecQuery;
              Restriccion := FieldByName['RESTRICCION'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Trim(Restriccion) <> '') then
        begin
           // Si existe, modifico los botones visibles
           with TDBGridFind2000((Self as TForm).Components[i]) do
           begin
              RestringirCopiarAPortapapeles := Restriccion[1] = 'C';
              RestringirPrevisualizar := Restriccion[2] = 'P';
           end;
        end
        else
        begin
           // Si NO existe, inserto el comportamiento por defecto
           with TDBGridFind2000((Self as TForm).Components[i]) do
           begin
              Restriccion := '';
              if (RestringirCopiarAPortapapeles) then
                 Restriccion := Restriccion + 'C'
              else
                 Restriccion := Restriccion + '1';
              if (RestringirPrevisualizar) then
                 Restriccion := Restriccion + 'P'
              else
                 Restriccion := Restriccion + '2';

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO DIC_GRIDS (FORMULARIO, GRID, PERFIL, RESTRICCION) VALUES (?FORMULARIO, ?GRID, ?PERFIL, ?RESTRICCION)';
                    Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
                    Params.ByName['GRID'].AsString := UpperCase(TDBGridFind2000((Self as TForm).Components[i]).Name);
                    Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
                    Params.ByName['RESTRICCION'].AsString := Restriccion;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
     end
     else
     // Activo o desactivo botones de navegadores, segun perfil
     if ((Self as TForm).Components[i] is THYMNavigator) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT BOTONES FROM DIC_NAVEGADORES WHERE FORMULARIO=?FORMULARIO AND NAVEGADOR=?NAVEGADOR AND PERFIL=?PERFIL';
              try
                 Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
                 Params.ByName['NAVEGADOR'].AsString := UpperCase(THYMNavigator((Self as TForm).Components[i]).Name);
                 Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
                 ExecQuery;
                 Botones := FieldByName['BOTONES'].AsString;
              except
                 Botones := '';
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Trim(Botones) <> '') then
        begin
           // Si existe, modifico los botones visibles
           with THYMNavigator((Self as TForm).Components[i]) do
           begin
              VisibleButtons := [];
              if (Botones[1] = 'F') then
                 VisibleButtons := VisibleButtons + [nbFirst];
              if (Botones[2] = 'P') then
                 VisibleButtons := VisibleButtons + [nbPrior];
              if (Botones[3] = 'N') then
                 VisibleButtons := VisibleButtons + [nbNext];
              if (Botones[4] = 'L') then
                 VisibleButtons := VisibleButtons + [nbLast];
              if (Botones[5] = 'I') then
                 VisibleButtons := VisibleButtons + [nbInsert];
              if (Botones[6] = 'D') then
                 VisibleButtons := VisibleButtons + [nbDelete];
              if (Botones[7] = 'E') then
                 VisibleButtons := VisibleButtons + [nbEdit];
              if (Botones[8] = 'P') then
                 VisibleButtons := VisibleButtons + [nbPost];
              if (Botones[9] = 'C') then
                 VisibleButtons := VisibleButtons + [nbCancel];
              if (Botones[10] = 'R') then
                 VisibleButtons := VisibleButtons + [nbRefresh];
           end;
        end
        else
        begin
           // Si NO existe, inserto el comportamiento por defecto
           with THYMNavigator((Self as TForm).Components[i]) do
           begin
              Botones := '';
              if (nbFirst in VisibleButtons) then
                 Botones := Botones + 'F'
              else
                 Botones := Botones + '1';
              if (nbPrior in VisibleButtons) then
                 Botones := Botones + 'P'
              else
                 Botones := Botones + '2';
              if (nbNext in VisibleButtons) then
                 Botones := Botones + 'N'
              else
                 Botones := Botones + '3';
              if (nbLast in VisibleButtons) then
                 Botones := Botones + 'L'
              else
                 Botones := Botones + '4';
              if (nbInsert in VisibleButtons) then
                 Botones := Botones + 'I'
              else
                 Botones := Botones + '5';
              if (nbDelete in VisibleButtons) then
                 Botones := Botones + 'D'
              else
                 Botones := Botones + '6';
              if (nbEdit in VisibleButtons) then
                 Botones := Botones + 'E'
              else
                 Botones := Botones + '7';
              if (nbPost in VisibleButtons) then
                 Botones := Botones + 'P'
              else
                 Botones := Botones + '8';
              if (nbCancel in VisibleButtons) then
                 Botones := Botones + 'C'
              else
                 Botones := Botones + '9';
              if (nbRefresh in VisibleButtons) then
                 Botones := Botones + 'R'
              else
                 Botones := Botones + '0';
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO DIC_NAVEGADORES (FORMULARIO, NAVEGADOR, PERFIL, BOTONES) VALUES (?FORMULARIO, ?NAVEGADOR, ?PERFIL, ?BOTONES)';
                    Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
                    Params.ByName['NAVEGADOR'].AsString := UpperCase(THYMNavigator((Self as TForm).Components[i]).Name);
                    Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
                    Params.ByName['BOTONES'].AsString := Botones;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Botones := '';
                    Free;
                 end;
              end;
           end;
        end; {if (Trim(Botones) <> '')}
     end
     else
     if ((Self as TForm).Components[i] is THYTDBGrid) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT RESTRICCION FROM DIC_GRIDS WHERE FORMULARIO = ?FORMULARIO AND GRID = ?GRID AND PERFIL = ?PERFIL';
              Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
              Params.ByName['GRID'].AsString := UpperCase(THYTDBGrid((Self as TForm).Components[i]).Name);
              Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
              ExecQuery;
              Restriccion := FieldByName['RESTRICCION'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Trim(Restriccion) <> '') then
        begin
           // Si existe, modifico los botones visibles
           with THYTDBGrid((Self as TForm).Components[i]) do
           begin
              RestringirCopiarAPortapapeles := Restriccion[1] = 'C';
              RestringirPrevisualizar := Restriccion[2] = 'P';
           end;
        end
        else
        begin
           // Si NO existe, inserto el comportamiento por defecto
           with THYTDBGrid((Self as TForm).Components[i]) do
           begin
              Restriccion := '';
              if (RestringirCopiarAPortapapeles) then
                 Restriccion := Restriccion + 'C'
              else
                 Restriccion := Restriccion + '1';
              if (RestringirPrevisualizar) then
                 Restriccion := Restriccion + 'P'
              else
                 Restriccion := Restriccion + '2';
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO DIC_GRIDS (FORMULARIO, GRID, PERFIL, RESTRICCION) VALUES (?FORMULARIO, ?GRID, ?PERFIL, ?RESTRICCION)';
                    Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
                    Params.ByName['GRID'].AsString := UpperCase(THYTDBGrid((Self as TForm).Components[i]).Name);
                    Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
                    Params.ByName['RESTRICCION'].AsString := Restriccion;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
     end
     else
     if ((Self as TForm).Components[i] is TNSDBGrid) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT RESTRICCION FROM DIC_GRIDS WHERE FORMULARIO = ?FORMULARIO AND GRID = ?GRID AND PERFIL = ?PERFIL';
              Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
              Params.ByName['GRID'].AsString := UpperCase(TNSDBGrid((Self as TForm).Components[i]).Name);
              Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
              ExecQuery;
              Restriccion := FieldByName['RESTRICCION'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
        if (Trim(Restriccion) <> '') then
        begin
           // Si existe, modifico los botones visibles
           with TNSDBGrid((Self as TForm).Components[i]) do
           begin
              RestringirCopiarAPortapapeles := Restriccion[1] = 'C';
              RestringirPrevisualizar := Restriccion[2] = 'P';
           end;
        end
        else
        begin
           // Si NO existe, inserto el comportamiento por defecto
           with TNSDBGrid((Self as TForm).Components[i]) do
           begin
              Restriccion := '';
              if (RestringirCopiarAPortapapeles) then
                 Restriccion := Restriccion + 'C'
              else
                 Restriccion := Restriccion + '1';
              if (RestringirPrevisualizar) then
                 Restriccion := Restriccion + 'P'
              else
                 Restriccion := Restriccion + '2';
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO DIC_GRIDS (FORMULARIO, GRID, PERFIL, RESTRICCION) VALUES (?FORMULARIO, ?GRID, ?PERFIL, ?RESTRICCION)';
                    Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
                    Params.ByName['GRID'].AsString := UpperCase(TNSDBGrid((Self as TForm).Components[i]).Name);
                    Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
                    Params.ByName['RESTRICCION'].AsString := Restriccion;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
     end
     else
     if ((Self as TForm).Components[i] is TLFPageControl) then
     begin
        with TLFPageControl((Self as TForm).Components[i]) do
        begin
           for k := 0 to PageCount - 1 do
           begin
              with Pages[k] do
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT RESTRICCION FROM DIC_PAGECONTROLS WHERE FORMULARIO = ?FORMULARIO AND PAGECONTROL = ?PAGECONTROL AND TABSHEET = ?TABSHEET AND PERFIL = ?PERFIL';
                       Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
                       Params.ByName['PAGECONTROL'].AsString := UpperCase(TLFPageControl((Self as TForm).Components[i]).Name);
                       Params.ByName['TABSHEET'].AsString := UpperCase(Pages[k].Name);
                       Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
                       ExecQuery;
                       Restriccion := FieldByName['RESTRICCION'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (Trim(Restriccion) <> '') then
                    TabVisible := (Restriccion = '0')
                 else
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'INSERT INTO DIC_PAGECONTROLS (FORMULARIO, PAGECONTROL, TABSHEET, PERFIL, RESTRICCION) VALUES (?FORMULARIO, ?PAGECONTROL, ?TABSHEET, ?PERFIL, ?RESTRICCION)';
                          Params.ByName['FORMULARIO'].AsString := UpperCase((Self as TForm).Name);
                          Params.ByName['PAGECONTROL'].AsString := UpperCase(TLFPageControl((Self as TForm).Components[i]).Name);
                          Params.ByName['TABSHEET'].AsString := UpperCase(Pages[k].Name);
                          Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
                          if (TabVisible) then
                             Params.ByName['RESTRICCION'].AsString := '0'
                          else
                             Params.ByName['RESTRICCION'].AsString := '1';
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;
              end;
           end;
        end;
     end;

     {$IFDEF Debug}
     // Campos ReadOnly amarillos en Grids
     if ((Self as TForm).Components[i] is TDBGrid) then
     begin
        for k := 0 to TDBGrid((Self as TForm).Components[i]).Columns.Count -1 do
        begin
           if (TDBGrid((Self as TForm).Components[i]).Columns[k].ReadOnly) then
              if (TDBGrid((Self as TForm).Components[i]).Columns[k].Color = clInfoBk) then
                 TDBGrid((Self as TForm).Components[i]).Columns[k].Color := clYellow;
        end;
     end;
     {$ENDIF}
  end; {for}

  if REntorno <> nil then
     (Self as TForm).HelpFile := REntorno.FicheroAyuda;
  (Self as TForm).HelpType := htKeyword;
  (Self as TForm).HelpKeyword := UpperCase((Self as TForm).Name);
end;

function TG2KForm.CloseQuery: boolean;
var
  grabar : boolean;
  i : integer;
begin
  if (slvar) then
  begin
     grabar := True;

     for i := 0 to Self.ComponentCount - 1 do
        if Self.Components[i] is THYMNavigator then
           if Assigned(THYMNavigator(Self.Components[i]).DataSource) then
              if Assigned(THYMNavigator(Self.Components[i]).DataSource.DataSet) then
                 if THYMNavigator(Self.Components[i]).DataSource.DataSet.State in [dsInsert,
                    dsEdit] then
                 begin
                    if REntorno.ModoCierraForm = 2 then
                       grabar := (MessageBox(Application.MainForm.Handle,
                          PChar(string(_('¿Desea grabar los cambios realizados?'))), PChar(string(_('Atención...'))),
                          MB_YESNO or MB_TOPMOST) = ID_YES);
                    if grabar then
                       THYMNavigator(Self.Components[i]).DataSource.DataSet.Post
                    else
                       THYMNavigator(Self.Components[i]).DataSource.DataSet.Cancel;
                 end;
  end;

  Result := inherited CloseQuery;
end;

procedure TG2KForm.DoClose(var Action: TCloseAction);
begin
  FMain.EnlaceDatos := null;
  if Campo <> nil then
     FMain.EnlaceDatos := Campo.Value;
  inherited;
end;

procedure TG2KForm.WMSysCommand(var Msg: TWMSysCommand);
begin
  DefaultHandler(Msg);

  {dji lrk kri - Cuando se maximiza no dejamos que quede sobre FMain}
  if (WindowState = wsMaximized) then
  begin
     Left := 0;
     {$IFNDEF Utils}
     if Assigned(FMMenu) and ((Self as TForm) <> FMMenu) and (FMMenu.Visible) then
        Left := FMMenu.Left + FMMenu.Width;
     Width := Screen.Width - Left;
     {$ENDIF}

     Top := FMain.Height;
  end;
end;

procedure AbreFormVarias(Clase: TFormClass; var Referencia; Sender: TObject = nil; Modal: boolean = False; ClaseContador: TFormClass = nil);
var
  i, inst : integer;
  m : THYMenuItem;
  Nueva : TForm;
  a : THYAction;
  CCInit : integer;
  FSMain : TLFFibFormStorage;
begin
  Nueva := nil;

  inst := 0;

  if (Sender is TAction) then
  begin
     if (Sender as TAction).Tag < 100 then
        with Application do
           for i := 0 to (ComponentCount - 1) do
           begin
              if (Components[i] is TG2KForm) then
                 if (Components[i] as TG2KForm).Instancia = (Sender as TAction).Tag then
                 begin
                    (Components[i] as TG2KForm).WindowState := wsNormal;
                    (Components[i] as TG2KForm).BringToFront;
                    Exit;
                 end;
           end;
  end;

  if (ClaseContador = nil) then
     ClaseContador := Clase;
  with Application do
     for i := 0 to (ComponentCount - 1) do
     begin
        if (Components[i] is TForm) then
           if (Components[i].InheritsFrom(ClaseContador)) then
              inst := (Components[i] as TG2KForm).Instancia;
     end;

  Inc(inst);
  CCInit := 0;
  if (Nueva = nil) then
  begin
     Nueva := TForm(Clase.NewInstance);
     TForm(Referencia) := Nueva;
     try
        if Nueva is TG2KForm then
        begin
           (Nueva as TG2KForm).Instancia := inst;
           if (Nueva as TG2KForm).Instancia > 9 then
              (Nueva as TG2KForm).instanciastr := IntToStr(inst)
           else
              (Nueva as TG2KForm).instanciastr := '0' + IntToStr(inst);
        end;

        Nueva.Create(Application);
        CCInit := Nueva.ComponentCount;

        // Localizamos FSMain en el nuevo form
        FSMain := nil;
        if (Nueva is TG2kForm) then
        begin
           // Si no existe lo creamos
           if (FSMain = nil) then
           begin
              FSMain := TLFFibFormStorage.Create(Nueva);
              FSMain.User := REntorno.Usuario;
              {FSMain.Name := 'FSMain';
              FSMain.Database := DMMain.DataBase;
              FSMain.Profile := ifThen(super, - 1,REntorno.User_Profile);
              FSMain.IniFileName := MakeTempFileName;
              FSMain.OnSaveIni   := TG2kForm(Nueva).FSMainSaveIni;}
           end
           else
              FSMain.User := REntorno.Usuario;
        end;

        for i := 0 to Nueva.ComponentCount - 1 do
        begin
           if (Nueva.Components[i] is TDBEdit) and (UsaMayusculas) then
              TDBEdit(Nueva.Components[i]).CharCase := ecUpperCase;

           if Assigned(CE_OwnerDrawMenuItem) then
           begin
              if (Nueva.Components[i] is TMenuItem) then
              begin
                 TMenuItem(Nueva.Components[i]).OnDrawItem := CE_OwnerDrawMenuItem;
                 TMenuItem(Nueva.Components[i]).OnMeasureItem := CE_MeasureMenuItem;
              end;
              if (Nueva.Components[i] is TMenu) then
              begin
                 TMenu(Nueva.Components[i]).OwnerDraw := True;
              end;
           end;
        end;

        if (not Modal) then
        begin
           Nueva.FormStyle := fsNormal;
           if (Nueva.Position = poDefault) then
           begin
              if ((Nueva.Width + l) > Screen.Width) then
                 l := 0;
              if ((Nueva.Height + t) > Screen.Height) then
                 t := 125;
              Nueva.Left := l;
              Nueva.Top := t;
              Nueva.Show;
              l := l + Nueva.Width - Nueva.ClientWidth;
              t := t + Nueva.Height - Nueva.ClientHeight;
           end
           else
              Nueva.Show;

           InicializaComponentes(Nueva, FSMain);

           // No permito que la ventana esté fuera de los margenes de la pantalla
           if ((Nueva.Left > Screen.Width) or (Nueva.Left < 0)) then
              Nueva.Left := 100;
           if ((Nueva.Top > Screen.Height) or (Nueva.Top < 0)) then
              Nueva.Top := 100;

           // No permito que la ventana esté sobre el menu principal
           if (Nueva.Top < FMain.Top + FMain.Height) then
              Nueva.Top := FMain.Top + FMain.Height;

           {dji lrk kri - Si esta maximizada no dejo que quede por arriba de FMain}
           if ((Nueva.Top < FMain.Top + FMain.Height) and (Nueva.WindowState = wsMaximized)) then
              Nueva.Top := FMain.Top + FMain.Height;
        end
        else
        begin
           Nueva.FormStyle := fsNormal;
           Nueva.Position := poScreenCenter;
           Nueva.ShowModal;
        end;
     except
        TForm(Referencia) := nil;
        raise;
     end;

     // Ponemos la accion en el submenú de ventanas //

     if ((not Modal) and (Sender is TAction) and Assigned(SubMenu)) then
     begin
        a := THYAction.Create(Nueva);
        a.Assign(TAction(Sender));
        a.OnExecute := (TAction(Sender)).OnExecute;
        m := THYMenuItem.Create(Nueva);
        m.Tag := 0;
        m.Action := a;
        if nueva.ClassParent = TG2KForm then
        begin
           m.Caption := m.Caption + ' (' + (Nueva as TG2KForm).instanciastr + ')';
           m.Tag := (Nueva as TG2KForm).Instancia;
           a.Tag := m.Tag;
        end;
        m.OnDrawItem := CE_OwnerDrawMenuItem;
        m.OnMeasureItem := CE_MeasureMenuItem;
        SubMenu.Add(m);
     end;
  end;

  if (not Modal) then
  begin
     Nueva.HelpFile := REntorno.FicheroAyuda;

     // Degradado para los MenuItem de la ULFToolBar
     for i := CCInit to Nueva.ComponentCount - 1 do
        if (Nueva.Components[i] is TMenuItem) then
        begin
           TMenuItem(Nueva.Components[i]).OnDrawItem := CE_OwnerDrawMenuItem;
           TMenuItem(Nueva.Components[i]).OnMeasureItem := CE_MeasureMenuItem;
        end;
  end;
end;

procedure AbreDataVarias(Clase: TComponentClass; var Referencia; Padre: TComponent);
var
  Nueva : TDataModule;
begin
  Nueva := nil;

  if (Nueva = nil) then
  begin
     Nueva := TDataModule(Clase.NewInstance);
     TDataModule(Referencia) := Nueva;
     try
        Nueva.Create(Padre);
     except
        TDataModule(Referencia) := nil;
        raise;
     end;
  end;
  if Padre <> nil then
     AssignDataSource(Nueva, Padre);
end;

procedure AssignDataSource(var Referencia: TDataModule; Padre: TComponent);
var
  i : integer;
  auxDataSource : TDataSource;
begin
  with Padre do
  begin
     for i := 0 to ComponentCount - 1 do
     begin
        if Components[i] is TDBEdit then
        begin
           auxDataSource := TDBEdit(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBEdit(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBCheckBox then
        begin
           auxDataSource := TDBCheckBox(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBCheckBox(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBComboBox then
        begin
           auxDataSource := TDBComboBox(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBComboBox(Components[i]).DataSource := auxDataSource;
        end;

        if Components[i] is TDBRichEdit then
        begin
           auxDataSource := TDBRichEdit(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBRichEdit(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBMemo then
        begin
           auxDataSource := TDBMemo(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBMemo(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBLookupComboBox then
        begin
           auxDataSource := TDBLookupComboBox(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBLookupComboBox(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBListBox then
        begin
           auxDataSource := TDBListBox(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBListBox(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBCtrlGrid then
        begin
           auxDataSource := TDBCtrlGrid(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBCtrlGrid(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBRadioGroup then
        begin
           auxDataSource := TDBRadioGroup(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBRadioGroup(Components[i]).DataSource := auxDataSource;
        end;

        if Components[i] is TDBGrid then
        begin
           auxDataSource := TDBGrid(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBGrid(Components[i]).DataSource := auxDataSource;
        end;

        if Components[i] is TDBLookuplistBox then
        begin
           auxDataSource := TDBLookuplistBox(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBLookuplistBox(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBNavigator then
        begin
           auxDataSource := TDBNavigator(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBNavigator(Components[i]).DataSource := auxDataSource;
        end;
        if Components[i] is TDBImage then
        begin
           auxDataSource := TDBImage(Components[i]).DataSource;
           if Assigned(auxDataSource) then
           begin
              auxDataSource := TDataSource(Referencia.FindComponent(auxDataSource.Name));
           end;

           TDBImage(Components[i]).DataSource := auxDataSource;
        end;
     end;
  end;
end;

procedure TG2KForm.FSMainSaveIni(Sender: TObject);
begin
  if (FindComponent('FSMain') <> nil) then
     TLFFibFormStorage(FindComponent('FSMain')).Profile :=
        TFPElegirPerfil.Create(Self).ShowDialog(TLFFibFormStorage(FindComponent('FSMain')).Profile);
end;

// Tratamiento formulario en menú Ventanas form principal
procedure AccionForm(Form: string; Accion: smallint);
var
  i : integer;
begin
  m := 0;
  for i := SubMenu.Count - 1 downto 0 do
     if SubMenu.Items[i].Caption = Form then
     begin
        case Accion of
           0: TForm(SubMenu.Items[i].Owner).BringToFront;
        end;
     end;
end;

end.
