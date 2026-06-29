unit UFMUsuariosWeb;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  Spin, UDBSpin, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  DbComboBoxValue, rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc,
  ULFFIBDBEditFind, ExtDlgs, ULFEdit;

type
  TFMUsuariosWeb = class(TFPEdit)
     DBEUsuarioId: TLFDbedit;
     LBLCodigo: TLFLabel;
     LBLTitulo: TLFLabel;
     DBEClave: TLFDbedit;
     LBLTipoEfecto: TLFLabel;
     LBLCuenta: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     DBCBAceptar: TLFDBCheckBox;
     DBCBVTipoUsuario: TDBComboBoxValue;
     LFCategoryAction1: TLFCategoryAction;
     LNombre: TLFLabel;
     DBENombre: TLFDbedit;
     LEmail: TLFLabel;
     DBEEMail: TLFDbedit;
     DBENombreCliAgeSis: TLFDbedit;
     LBLVista: TLFLabel;
     DBCBTipoVista: TDBComboBoxValue;
     LFDBCBStock: TLFDBCheckBox;
     LWebEmpresa: TLFLabel;
     DBEFWebEmpresa: TLFFibDBEditFind;
     DBEWebEmpresa: TLFDbedit;
     LWebEjercicio: TLFLabel;
     DBEFWebEjercicio: TLFFibDBEditFind;
     LWebCanal: TLFLabel;
     LWebSerie: TLFLabel;
     LAlmacen: TLFLabel;
     DBEFWebAlmacen: TLFFibDBEditFind;
     LWebTarifa: TLFLabel;
     DBCBAplicarTarifa: TLFDBCheckBox;
     DBEFWebCanal: TLFFibDBEditFind;
     DBEFWebSerie: TLFFibDBEditFind;
     DBEFWebTarifa: TLFFibDBEditFind;
     LUsuario: TLFLabel;
     DBEFUsuario: TLFDBEditFind2000;
     LDireccion: TLFLabel;
     LTelefono: TLFLabel;
     DBTelefono: TLFDbedit;
     LFImatge: TLFPanel;
     Imagen: TImage;
     OPImagen: TOpenPictureDialog;
     TSDocs: TTabSheet;
     DBGDocs: TDBGridFind2000;
     TBDocs: TLFToolBar;
     NavDocs: THYMNavigator;
     TSMarcas: TTabSheet;
     TBMarcas: TLFToolBar;
     NavMarcas: THYMNavigator;
     DBGMarcas: TDBGridFind2000;
     TSModulos: TTabSheet;
     DBGUsuariosWebModulos: TDBGridFind2000;
     TBModulos: TLFToolBar;
     NavModulos: THYMNavigator;
     DBEFSeccion: TLFFibDBEditFind;
     DBCBVerMaquinasHojasTrabajo: TLFDBCheckBox;
     LSeccion: TLFLabel;
     DBCBPermisoModificaParametros: TLFDBCheckBox;
     ETituloUsuario: TLFEdit;
     LMaestro: TLFLabel;
     DBEMaestro: TLFDbedit;
     PNLInfoUsuarioDocumentos: TLFPanel;
     DBEUsuarioDocumento: TLFDbedit;
     DBENombreUsuarioDocumento: TLFDbedit;
     PNLInfoUsuarioMarca: TLFPanel;
     DBEUsuarioMarca: TLFDbedit;
     DBENombreUsuarioMarca: TLFDbedit;
     PNLInfoUsuarioModulos: TLFPanel;
     DBEUsuarioModulos: TLFDbedit;
     DBENombreUsuarioModulos: TLFDbedit;
     LBLImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     BClipboard: TButton;
     LTercero: TLFLabel;
     DBETercero: TLFDbedit;
     DBEFDireccion: TLFDBEditFind2000;
     EDireccion: TLFEdit;
     BVerClave: TButton;
     BModificarClave: TButton;
     LContacto: TLFLabel;
     DBEFContacto: TLFDBEditFind2000;
     EContacto: TLFEdit;
     TSFormasPago: TTabSheet;
     TBFormasPago: TLFToolBar;
     PNLInfoUsuarioFormasPago: TLFPanel;
     DBEUsuarioIdFormasPago: TLFDbedit;
     DBENombreFormasPago: TLFDbedit;
     NavFormasPago: THYMNavigator;
     DBGFFormasPago: TDBGridFind2000;
     LAlmacenDestino: TLFLabel;
     DBEFWebAlmacenDestino: TLFFibDBEditFind;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFClienteBusqueda(Sender: TObject);
     procedure DBEFWebEjercicioBusqueda(Sender: TObject);
     procedure DBEFWebCanalBusqueda(Sender: TObject);
     procedure DBEFWebSerieBusqueda(Sender: TObject);
     procedure DBEFWebAlmacenBusqueda(Sender: TObject);
     procedure DBEFWebAlmacenDestinoBusqueda(Sender: TObject);
     procedure DBEFWebTarifaBusqueda(Sender: TObject);
     procedure DBEFSeccionBusqueda(Sender: TObject);
     procedure DBEFUsuarioChange(Sender: TObject);
     procedure DBCBVTipoUsuarioChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFDireccionBusqueda(Sender: TObject);
     procedure DBEFDireccionChange(Sender: TObject);
     procedure DBETerceroChange(Sender: TObject);
     procedure DBEUsuarioIdChange(Sender: TObject);
     procedure BVerClaveClick(Sender: TObject);
     procedure BModificarClaveClick(Sender: TObject);
     procedure DBEFContactoBusqueda(Sender: TObject);
     procedure DBEFContactoChange(Sender: TObject);
     procedure TSDocsShow(Sender: TObject);
     procedure TSMarcasShow(Sender: TObject);
     procedure TSModulosShow(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure TSFormasPagoShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure PosicionaUsuario(IdUsuario: integer);
     procedure UsuarioNuevo;
  end;

var
  FMUsuariosWeb : TFMUsuariosWeb;

implementation

uses UDMUsuariosWeb, UFormGest, UDMMain, UUtiles, UEntorno, DB, FIBDatabase, FIBDataSet, UParam,
  UFMain, UFMSincronizacionEginer, UDameDato, UImagenes;

{$R *.DFM}

procedure TFMUsuariosWeb.FormCreate(Sender: TObject);
begin
  inherited;

  // Cargo tipos de usuario en ComboBox
  DBCBVTipoUsuario.Items.Clear;
  DBCBVTipoUsuario.Values.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add('SELECT TIPO_USUARIO, TITULO_TIPO FROM SYS_TIPO_USUARIO_WEB ORDER BY TIPO_USUARIO');
           Open;
           while not EOF do
           begin
              DBCBVTipoUsuario.Items.Add(FieldByName('TITULO_TIPO').AsString);
              DBCBVTipoUsuario.Values.Add(FieldByName('TIPO_USUARIO').AsString);
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

  AbreData(TDMUsuariosWeb, DMUsuariosWeb);
  DBGMain.DataSource := DMUsuariosWeb.DSQMUsuariosWeb;
  NavMain.DataSource := DMUsuariosWeb.DSQMUsuariosWeb;
  EPMain.DataSource := DMUsuariosWeb.DSQMUsuariosWeb;
  G2kTableLoc.DataSource := DMUsuariosWeb.DSQMUsuariosWeb;
  ControlEdit := CEMain;
  TSMarcas.TabVisible := (LeeParametro('MODREST017') = 'S');
end;

procedure TFMUsuariosWeb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMUsuariosWeb);
end;

procedure TFMUsuariosWeb.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMUsuariosWeb.BusquedaCompleja;
  Continua := False;
end;

procedure TFMUsuariosWeb.DBEFClienteBusqueda(Sender: TObject);
var
  TipoUsuario : integer;
begin
  {
  if (DBCBVTipoUsuario.ItemIndex >= 0) then
     TipoUsuario := DBCBVTipoUsuario.Values[DBCBVTipoUsuario.Items[DBCBVTipoUsuario.ItemIndex]];
  }

  TipoUsuario := DMUsuariosWeb.QMUsuariosWebTIPO_USUARIO.AsInteger;
  with DBEFCliente do
  begin
     case TipoUsuario of
        0:
        begin
           // Cliente
           Tabla_a_buscar := 'VER_CLIENTES_EF';
           CampoNum := 'ID_CLIENTE';
           CampoStr := 'TITULO';
           Filtros := [obEmpresa, obEjercicio, obCanal];
           OrdenadoPor.Text := 'TITULO';
           CondicionBusqueda := '';
        end;
        1:
        begin
           // Agente
           Tabla_a_buscar := 'VER_AGENTES';
           CampoNum := 'ID_AGENTE';
           CampoStr := 'TITULO';
           Filtros := [obEmpresa];
           OrdenadoPor.Text := 'TITULO';
           CondicionBusqueda := '';
        end;
        2:
        begin
           // Sistema
           Tabla_a_buscar := 'SYS_USUARIOS';
           CampoNum := 'USUARIO';
           CampoStr := 'NOMBRE';
           Filtros := [];
           OrdenadoPor.Text := 'NOMBRE';
           CondicionBusqueda := '';
        end;
        3:
        begin
           // Almacen
           Tabla_a_buscar := 'VER_ALMACENES';
           CampoNum := 'ALMACEN';    { TODO : Crear un ID_ALMACEN }
           CampoStr := 'AL_TITULO';
           Filtros := [obEmpresa];
           OrdenadoPor.Text := 'ALMACEN';
           CondicionBusqueda := '';
        end;
        4:
        begin
           // Visitante
           Tabla_a_buscar := '';
           CampoNum := '';
           CampoStr := '';
           Filtros := [];
           OrdenadoPor.Text := '';
           CondicionBusqueda := '';
        end;
        5:
        begin
           // Empleado
           Tabla_a_buscar := 'VER_EMPLEADOS_EF';
           CampoNum := 'ID_EMPLEADO';
           CampoStr := 'TITULO';
           Filtros := [obEmpresa];
           OrdenadoPor.Text := 'TITULO';
           CondicionBusqueda := '';
        end;
        6:
        begin
           // Seccion
           Tabla_a_buscar := '';
           CampoNum := '';
           CampoStr := '';
           Filtros := [];
           OrdenadoPor.Text := '';
           CondicionBusqueda := '';
        end;
     end;
  end;
end;

procedure TFMUsuariosWeb.DBEFWebEjercicioBusqueda(Sender: TObject);
begin
  DBEFWebEjercicio.CondicionBusqueda := ' EMPRESA = ' + DBEFWebEmpresa.Text;
end;

procedure TFMUsuariosWeb.DBEFWebCanalBusqueda(Sender: TObject);
begin
  DBEFWebCanal.CondicionBusqueda := 'EMPRESA = ' + DBEFWebEmpresa.Text +
     ' and EJERCICIO = ' + DBEFWebEjercicio.Text;
end;

procedure TFMUsuariosWeb.DBEFWebSerieBusqueda(Sender: TObject);
begin
  DBEFWebSerie.CondicionBusqueda := 'EMPRESA = ' + DBEFWebEmpresa.Text +
     ' and EJERCICIO = ' + DBEFWebEjercicio.Text + ' and CANAL = ' + DBEFWebCanal.Text;
end;

procedure TFMUsuariosWeb.DBEFWebAlmacenBusqueda(Sender: TObject);
begin
  DBEFWebAlmacen.CondicionBusqueda := ' EMPRESA = ' + DBEFWebEmpresa.Text;
end;

procedure TFMUsuariosWeb.DBEFWebAlmacenDestinoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFWebAlmacenDestino.CondicionBusqueda := ' EMPRESA = ' + DBEFWebEmpresa.Text;
end;

procedure TFMUsuariosWeb.DBEFWebTarifaBusqueda(Sender: TObject);
begin
  DBEFWebTarifa.CondicionBusqueda := 'EMPRESA = ' + DBEFWebEmpresa.Text;
end;

procedure TFMUsuariosWeb.DBEFSeccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFSeccion.CondicionBusqueda := 'EMPRESA = ' + DBEFWebEmpresa.Text;
end;

procedure TFMUsuariosWeb.DBEFUsuarioChange(Sender: TObject);
begin
  inherited;
  ETituloUsuario.Text := DameTituloUsuario(StrToIntDef(DBEFUsuario.Text, 0));
end;

procedure TFMUsuariosWeb.DBCBVTipoUsuarioChange(Sender: TObject);
begin
  inherited;
  /// TIPO_USUARIO - Definido en SYS_TIPO_USUARIO_WEB
  ///    0:Cliente
  ///    1:Agente
  ///    2:Sistema
  ///    3:Almacen
  ///    4:Visitante
  ///    5:Empelado
  ///    6:Seccion

  {
  if (DBCBVTipoUsuario.ItemIndex >= 0) then
     TipoUsuario := DBCBVTipoUsuario.Values[DBCBVTipoUsuario.Items[DBCBVTipoUsuario.ItemIndex]];
  }

  DBEFCliente.Enabled := (DMUsuariosWeb.QMUsuariosWebTIPO_USUARIO.AsInteger in [0, 1, 2, 5]);
  DBEFDireccion.Enabled := (DMUsuariosWeb.QMUsuariosWebTIPO_USUARIO.AsInteger in [0, 1, 5]);

  case DMUsuariosWeb.QMUsuariosWebTIPO_USUARIO.AsInteger of
     0:
        LMaestro.Caption := _('Cliente');
     1:
        LMaestro.Caption := _('Agente');
     2:
        LMaestro.Caption := _('Usuario');
     3:
        LMaestro.Caption := _('Usuario');
     4:
        LMaestro.Caption := _('Usuario');
     5:
        LMaestro.Caption := _('Empleado');
     6:
        LMaestro.Caption := _('Seccion');
  end;
end;

procedure TFMUsuariosWeb.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMUsuariosWeb.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMUsuariosWeb.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMUsuariosWeb.QMUsuariosWebIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMUsuariosWeb.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMUsuariosWeb.QMUsuariosWebIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMUsuariosWeb.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
  DBEClave.PasswordChar := '*';
end;

procedure TFMUsuariosWeb.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'TERCERO = ' + IntToStr(StrToIntDef(DBETercero.Text, 0));
end;

procedure TFMUsuariosWeb.DBEFDireccionChange(Sender: TObject);
begin
  inherited;
  EDireccion.Text := DameDireccionTercero(StrToIntDef(DBETercero.Text, 0), StrToIntDef(DBEFDireccion.Text, 0));
end;

procedure TFMUsuariosWeb.DBETerceroChange(Sender: TObject);
begin
  inherited;
  EDireccion.Text := DameDireccionTercero(StrToIntDef(DBETercero.Text, 0), StrToIntDef(DBEFDireccion.Text, 0));
  EContacto.Text := DameTituloContacto(StrToIntDef(DBETercero.Text, 0), StrToIntDef(DBEFContacto.Text, 0));
end;

procedure TFMUsuariosWeb.DBEUsuarioIdChange(Sender: TObject);
begin
  inherited;
  DBEFCliente.Enabled := (DMUsuariosWeb.QMUsuariosWebTIPO_USUARIO.AsInteger in [0, 1, 2, 5]);
  DBEFDireccion.Enabled := (DMUsuariosWeb.QMUsuariosWebTIPO_USUARIO.AsInteger in [0, 1, 5]);
end;

procedure TFMUsuariosWeb.BVerClaveClick(Sender: TObject);
begin
  inherited;
  with DBEClave do
  begin
     if (PasswordChar = #0) then
        PasswordChar := '*'
     else
        PasswordChar := #0;
  end;
end;

procedure TFMUsuariosWeb.BModificarClaveClick(Sender: TObject);
begin
  inherited;
  DMUsuariosWeb.QMUsuariosWebCONTRASENYA.AsString := CalcCRC32Str(DMUsuariosWeb.QMUsuariosWebCONTRASENYA.AsString);
  DBEClave.PasswordChar := #0;
end;

procedure TFMUsuariosWeb.DBEFContactoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFContacto.CondicionBusqueda := 'TERCERO = ' + IntToStr(StrToIntDef(DBETercero.Text, 0));
end;

procedure TFMUsuariosWeb.DBEFContactoChange(Sender: TObject);
begin
  inherited;
  EContacto.Text := DameTituloContacto(StrToIntDef(DBETercero.Text, 0), StrToIntDef(DBEFContacto.Text, 0));
end;

procedure TFMUsuariosWeb.PosicionaUsuario(IdUsuario: integer);
begin
  DMUsuariosWeb.PosicionarUsuario(IdUsuario);
end;

procedure TFMUsuariosWeb.TSDocsShow(Sender: TObject);
begin
  inherited;
  DMUsuariosWeb.ConectaDocs;
end;

procedure TFMUsuariosWeb.TSMarcasShow(Sender: TObject);
begin
  inherited;
  DMUsuariosWeb.ConectaMarcas;
end;

procedure TFMUsuariosWeb.TSModulosShow(Sender: TObject);
begin
  inherited;
  DMUsuariosWeb.ConectaModulos;
end;

procedure TFMUsuariosWeb.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if PCMain.ActivePage = TSDocs then
     DMUsuariosWeb.DesconectaDocs
  else
  if PCMain.ActivePage = TSMarcas then
     DMUsuariosWeb.DesconectaMarcas
  else
  if PCMain.ActivePage = TSModulos then
     DMUsuariosWeb.DesconectaModulos
  else
  if PCMain.ActivePage = TSFormasPago then
     DMUsuariosWeb.DesconectaFormaPago;
end;

procedure TFMUsuariosWeb.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  inherited;
  if (DMUsuariosWeb.HayModificaciones) then
  begin
     if (LeeParametro('MODSINC016') = 'S') then
     begin
        if MessageDlg(_('Han habido modificaciones/altas ¿Desea sincronizar con SpeedLock?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           FMain.EjecutaAccion(FMain.ASincronizacionEginer);
           FMSincronizacionEginer.ASincronizarUsuarios.Execute;
        end;
     end;
  end;
end;

procedure TFMUsuariosWeb.UsuarioNuevo;
begin
  // Fuerza a que se considere que hay modificaciones para proponer la sincronizacion antes de salir.
  DMUsuariosWeb.HayModificaciones := True;
end;

procedure TFMUsuariosWeb.TSFormasPagoShow(Sender: TObject);
begin
  inherited;
  DMUsuariosWeb.ConectaFormaPago;
end;

end.
