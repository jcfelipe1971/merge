unit UFMSincronizacionTiendaPureWorks;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFDBEditFind2000, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, RxDBComb, UFPEditSinNavegador, ULFEditFind2000, ULFDBMemo,
  ULFMemo;

type
  TFMSincronizacionTiendaPureWorks = class(TFPEditSinNavegador)
     ASincronizar: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PNLConexion: TLFPanel;
     PNLDatos: TLFPanel;
     LHost: TLFLabel;
     LPort: TLFLabel;
     LUser: TLFLabel;
     LPassword: TLFLabel;
     LCarpetaImportacion: TLFLabel;
     LCarpetaExportacion: TLFLabel;
     EHost: TLFEdit;
     EPort: TLFEdit;
     EUser: TLFEdit;
     EPassword: TLFEdit;
     ECarpetaImportacion: TLFEdit;
     ECarpetaExportacion: TLFEdit;
     TSep1: TToolButton;
     TButtSincronizar: TToolButton;
     TSep2: TToolButton;
     TButtGuardarConfiguracion: TToolButton;
     AGuardarConfiguracion: TAction;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     EProveedor: TLFEdit;
     TSep3: TToolButton;
     TButtCrearModificar: TToolButton;
     DBMNotas: TLFDBMemo;
     MLog: TLFMemo;
     ACrearModificarArticulos: TAction;
     procedure FormCreate(Sender: TObject);
     procedure ASincronizarExecute(Sender: TObject);
     procedure AGuardarConfiguracionExecute(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure ACrearModificarArticulosExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure SincronizarcionAutomatica;
     procedure Log(s: string);
  end;

var
  FMSincronizacionTiendaPureWorks : TFMSincronizacionTiendaPureWorks;

implementation

uses UDMMain, UDMSincronizacionTiendaPureWorks, UFormGest, UEntorno, UUtiles,
  UFMain, UDameDato;

{$R *.dfm}

procedure TFMSincronizacionTiendaPureWorks.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSincronizacionTiendaPureWorks, DMSincronizacionTiendaPureWorks);

  DBGFDetalle.DataSource := DMSincronizacionTiendaPureWorks.DSxImportacionArticulos;

  EHost.Text := LeeDatoIni('SincronizacionTiendaPureWorks', 'Host', '');
  EPort.Text := IntToStr(LeeDatoIni('SincronizacionTiendaPureWorks', 'Port', 0));
  EUser.Text := LeeDatoIni('SincronizacionTiendaPureWorks', 'User', '');
  // EPassword.Text := LeeDatoIni('SincronizacionTiendaPureWorks', 'Password', '-'); // ;;8U}{^Z*-T-4ep7
  EPassword.Text := DescodificaClave(LeeDatoIni('SincronizacionTiendaPureWorks', 'PasswordEnc2', ''));
  EPassword.Text := DescodificaClave(LeeDatoIni('SincronizacionTiendaPureWorks', 'PasswordEnc1', '')) + EPassword.Text;

  ECarpetaImportacion.Text := LeeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaImportacion', '');
  ECarpetaExportacion.Text := LeeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaExportacion', '');
  EFProveedor.Text := IntToStr(LeeDatoIni('SincronizacionTiendaPureWorks', 'ProveedorSincronizacion', 0));

  // ECarpetaImportacion_FTP.Text := LeeDatoIni('SincronizacionTiendaPureWorks', 'FTP_CarpetaImportacion', '/shop2erp/');
  // ECarpetaExportacion_FTP.Text := LeeDatoIni('SincronizacionTiendaPureWorks', 'FTP_CarpetaExportacion', '/erp2shop/');
end;

procedure TFMSincronizacionTiendaPureWorks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSincronizacionTiendaPureWorks);
end;

procedure TFMSincronizacionTiendaPureWorks.ASincronizarExecute(Sender: TObject);
begin
  inherited;
  // Primero guardo datos de configuracion, por si se han modificado.
  AGuardarConfiguracion.Execute;

  MLog.Lines.Clear;
  DMSincronizacionTiendaPureWorks.Sincronizar(False, MLog.Lines);
end;

procedure TFMSincronizacionTiendaPureWorks.SincronizarcionAutomatica;
begin
  DMSincronizacionTiendaPureWorks.Sincronizar(True);
end;

procedure TFMSincronizacionTiendaPureWorks.AGuardarConfiguracionExecute(Sender: TObject);
begin
  inherited;

  EscribeDatoIni('SincronizacionTiendaPureWorks', 'Host', EHost.Text);
  EscribeDatoIni('SincronizacionTiendaPureWorks', 'Port', StrToIntDef(EPort.Text, 21));
  EscribeDatoIni('SincronizacionTiendaPureWorks', 'User', EUser.Text);
  EscribeDatoIni('SincronizacionTiendaPureWorks', 'Password', '');
  EscribeDatoIni('SincronizacionTiendaPureWorks', 'PasswordEnc1', CodificaClave(Copy(EPassword.Text, 1, 12)));
  EscribeDatoIni('SincronizacionTiendaPureWorks', 'PasswordEnc2', CodificaClave(Copy(EPassword.Text, 13, 24)));

  // EscribeDatoIni('SincronizacionTiendaPureWorks', 'FTP_CarpetaImportacion', '');
  // EscribeDatoIni('SincronizacionTiendaPureWorks', 'FTP_CarpetaExportacion', '');

  EscribeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaImportacion', IncludeTrailingPathDelimiter(ECarpetaImportacion.Text));
  EscribeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaExportacion', IncludeTrailingPathDelimiter(ECarpetaExportacion.Text));
  EscribeDatoIni('SincronizacionTiendaPureWorks', 'ProveedorSincronizacion', StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMSincronizacionTiendaPureWorks.EFProveedorChange(Sender: TObject);
begin
  inherited;
  EProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMSincronizacionTiendaPureWorks.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ARTICULO') then
        begin
           CeldaEnlace(TDBGridFind2000(Sender), Rect);

           if (DataSource.DataSet.FieldByName('ID_ART_ARTICULOS').AsInteger = 0) then
              ColorResaltado5(Canvas)
           else
              ColorEdicion(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'TITULO') then
        begin
           // Si no coinciden las descripciones, lo resalto
           if (DataSource.DataSet.FieldByName('TITULO').AsString <> DataSource.DataSet.FieldByName('TITULO_PROVEEDOR').AsString) then
              ColorResaltado(Canvas)
           else
              ColorInfo(Canvas);

           // Si tiene asignado un articulo que no existe en la aplicacion lo resalto mas.
           if ((DataSource.DataSet.FieldByName('TITULO').AsString = '') and (DataSource.DataSet.FieldByName('ARTICULO').AsString > '')) then
              ColorResaltado4(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionTiendaPureWorks.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (DMSincronizacionTiendaPureWorks.xImportacionArticulosARTICULO.AsString > '') then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO=''' + DMSincronizacionTiendaPureWorks.xImportacionArticulosARTICULO.AsString + '''');
end;

procedure TFMSincronizacionTiendaPureWorks.DBGFDetalleBusqueda(Sender: TObject);
begin
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
     end;
  end;
end;

procedure TFMSincronizacionTiendaPureWorks.Log(s: string);
begin
  MLog.Lines.Add(s);
end;

procedure TFMSincronizacionTiendaPureWorks.ACrearModificarArticulosExecute(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaPureWorks.CrearModificarArticulos;
end;

end.
