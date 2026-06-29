unit ZUFMPedidosAAlbaran;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UControlEdit, UFormGest,
  NsDBGrid, ULFPanel, ULFDBEdit, ULFToolBar, ULFEditFind2000, rxToolEdit,
  ULFLabel, rxPlacemnt, ULFFormStorage, ULFEdit, TFlatCheckBoxUnit,
  ULFCheckBox, UFPEditDetalle, RXDBCtrl, ULFDBDateEdit, ActnList,
  ULFActionList, Menus, UTeclas, UHYDBGrid, UG2kTBLoc, ULFPageControl,
  UEditPanel, UNavigator, Buttons;

type
  TZFMPedidosAAlbaran = class(TFPEditDetalle)
     LFechaServir: TLFLabel;
     LCodigoBarras: TLFLabel;
     LAlbaran: TLFLabel;
     LFFechaServir: TLFDBDateEdit;
     LFPeso: TLFDbedit;
     LFBultos: TLFDbedit;
     LPeso: TLFLabel;
     LBultos: TLFLabel;
     LFCodBarras: TLFEdit;
     LFAlbaran: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ATraspasaPedido: TAction;
     LFCliente: TLFDbedit;
     LFDescCliente: TLFDbedit;
     LCliente: TLFLabel;
     LFPrevisualizar: TLFCheckBox;
     LFCartaPortes: TLFCheckBox;
     SBAALbaran: TSpeedButton;
     APedidos: TLFActionList;
     AAlbaran: TAction;
     LFLstEti: TLFCheckBox;
     LFNumEti: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ATraspasaPedidoExecute(Sender: TObject);
     procedure InicializaTraspaso(Tipo: string);
     procedure LFCodBarrasKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormShow(Sender: TObject);
     procedure AAlbaranExecute(Sender: TObject);
     procedure LFLstEtiChange(Sender: TObject);
     procedure LFBultosChange(Sender: TObject);
  private
     { Private declarations }
     procedure MuestraErrores;
     procedure CodigoEspecial;
  public
     { Public declarations }
  end;

var
  ZFMPedidosAAlbaran : TZFMPedidosAAlbaran;

implementation

uses ZUDMPedidosAAlbaran, UDMMain, UEntorno, UUtiles,
  UFInfoFacturacionAlb, UFMControlErroresAgrupPec, UFMain, StrUtils;

{$R *.dfm}

procedure TZFMPedidosAAlbaran.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMPedidosAAlbaran, ZDMPedidosAAlbaran);
  LFAlbaran.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAAlbaran, LFAlbaran);

  NavMain.DataSource := ZDMPedidosAAlbaran.DSxCabecera;
  NavDetalle.DataSource := ZDMPedidosAAlbaran.DSxDetalle;
  DBGFDetalle.DataSource := ZDMPedidosAAlbaran.DSxDetalle;
end;

procedure TZFMPedidosAAlbaran.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ZDMPedidosAAlbaran.BorrarTablas;
  CierraData(ZDMPedidosAAlbaran);
end;

procedure TZFMPedidosAAlbaran.ATraspasaPedidoExecute(Sender: TObject);
begin
  inherited;
  if (ZDMPedidosAAlbaran.xCabeceraRIG_ALBARAN.AsInteger = 0) then
     InicializaTraspaso('ALB')
  else
     ShowMessage(_('Albarán traspasado'));
end;

procedure TZFMPedidosAAlbaran.InicializaTraspaso(Tipo: string);
var
  ejercicio, canal, rig, id_s, id_s_d, portes, rango, indice, transportista : integer;
  WndList : Pointer;
  serie : string;
  Por_Portes, I_Portes : double;
begin
  // Tratamos los valores de los portes
  Portes := 0;
  Transportista := ZDMPedidosAAlbaran.DameMinTransportista(StrToInt(LFCliente.Text));
  Rango := 0;
  Indice := 0;
  Por_Portes := 0;
  I_Portes := 0;
  id_s_d := 0;
  Screen.Cursor := crHourGlass;
  WndList := DisableTaskWindows(FInfoFacturacionAlb.Handle);
  try
     FInfoFacturacionAlb := TFInfoFacturacionAlb.Create(Self);
     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Traspasando Pedidos');
        GBProcesaCab.Caption := _('Procesando Pedido');
        LBLEjercicio.Caption := '';
        LBLCanal.Caption := '';
        LBLSerie.Caption := '';
        LBLRig.Caption := '';
        Show;
     end;

     Application.ProcessMessages;

     if not (ZDMPedidosAAlbaran.TLocal.InTransaction) then
        ZDMPedidosAAlbaran.TLocal.StartTransaction;

     // Inicializar el proceso
     ZDMPedidosAAlbaran.InicializaTraspaso;

     // Crear  cabeceras
     while not ZDMPedidosAAlbaran.xRecorre.EOF do
     begin
        ejercicio := ZDMPedidosAAlbaran.xRecorreEJERCICIODEV.AsInteger;
        canal := ZDMPedidosAAlbaran.xRecorreCANALDEV.AsInteger;
        serie := ZDMPedidosAAlbaran.xRecorreSERIEDEV.AsString;
        rig := ZDMPedidosAAlbaran.xRecorreRIG.AsInteger;
        id_s := ZDMPedidosAAlbaran.xRecorreID_S.AsInteger;

        with FInfoFacturacionAlb do
        begin
           LBLEjercicio.Caption := IntToStr(Ejercicio);
           LBLCanal.Caption := IntToStr(Canal);
           LBLSerie.Caption := Serie;
           LBLRig.Caption := IntToStr(Rig);
        end;
        Application.ProcessMessages;
        try
           ZDMPedidosAAlbaran.GeneraCabeceras(ejercicio, Canal{canal}, rig, id_s, serie, tipo, transportista, portes,
              rango, indice, REntorno.Canal {SFG_JLA}, por_portes, i_portes);
        except
           {Ha habido algún error lo insertamos en la tabla temporal de errores
               y no se hace nada mas ya que no se inserta en la tabla temporal de
               relaciones}
           ZDMPedidosAAlbaran.InsertaErrores(ejercicio, canal, rig, serie);
        end;
        Application.ProcessMessages;
        ZDMPedidosAAlbaran.xRecorre.Next;
     end;
     ZDMPedidosAAlbaran.xRecorre.Close;

     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Traspasando Pedidos');
        GBProcesaCab.Caption := _('Procesando Pedido');
     end;
     Application.ProcessMessages;

     // Recorrer los grupos generados
     with ZDMPedidosAAlbaran.xProcesar do
     begin
        Close;
        SelectSQL.Text := 'SELECT * FROM TMP_FACTURA_PEDIDOS WHERE ENTRADA = ?ENTRADA ORDER BY ID_S';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
        First;
     end;

     while not (ZDMPedidosAAlbaran.xProcesar.EOF) do
     begin
        id_s := ZDMPedidosAAlbaran.xProcesarID_S.AsInteger;
        with ZDMPedidosAAlbaran.xProcesar do
        begin
           Close;
           SelectSQL.Text := 'SELECT * FROM TMP_FACTURA_PEDIDOS WHERE ENTRADA = ?ENTRADA AND ID_S >= ?ID_S ORDER BY ID_S';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_S'].AsInteger := id_s;
           Open;
           First;
        end;

        id_s_d := ZDMPedidosAAlbaran.xProcesarID_S_D.AsInteger;

        ejercicio := ZDMPedidosAAlbaran.xProcesarEJERCICIO.AsInteger;
        canal := ZDMPedidosAAlbaran.xProcesarCANAL.AsInteger;
        serie := ZDMPedidosAAlbaran.xProcesarSERIE.AsString;
        rig := ZDMPedidosAAlbaran.xProcesarRIG.AsInteger;

        with FInfoFacturacionAlb do
        begin
           LBLEjercicio.Caption := IntToStr(Ejercicio);
           LBLCanal.Caption := IntToStr(Canal);
           LBLSerie.Caption := Serie;
           LBLRig.Caption := IntToStr(Rig);
        end;

        Application.ProcessMessages;

        try
           ZDMPedidosAAlbaran.TraspasaPedido(id_s, id_s_d, tipo);
        except
           {Ha habido algún error con los detalles no se va a insertar ninguno pero
         habrá que borrar la cabecera}
           ZDMPedidosAAlbaran.CorrigeError(ejercicio, canal, rig, id_s, serie);
        end;

        Application.ProcessMessages;

        ZDMPedidosAAlbaran.xProcesar.Next;
     end;
     ZDMPedidosAAlbaran.xProcesar.Close;

     // Por último quitamos la entrada agrupación y ajustamos las cabeceras
     try
        with ZDMPedidosAAlbaran.xProcesar do
        begin
           Close;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Open;
           First;
           while not ZDMPedidosAAlbaran.xProcesar.EOF do
           begin
              ZDMPedidosAAlbaran.ActualizaPedidos(ZDMPedidosAAlbaran.xProcesarID_S.AsInteger, ZDMPedidosAAlbaran.xProcesarID_S_D.AsInteger);
              ZDMPedidosAAlbaran.xProcesar.Next;
           end;
        end;
     except
        on Exception do
        begin
           // No lo ha podido cerrar,borrar el albarán para evitarse problemas
           ZDMPedidosAAlbaran.BorraAlbaran;
           LFPrevisualizar.State := cbUnChecked;
           LFCartaPortes.State := cbUnChecked;
           LFLstEti.State := cbUnChecked;
           raise;
        end;
     end;

  finally
     ZDMPedidosAAlbaran.BorraTemporales;

     if not (ZDMPedidosAAlbaran.TLocal.InTransaction) then
        ZDMPedidosAAlbaran.TLocal.StartTransaction;
     ZDMPedidosAAlbaran.TLocal.CommitRetaining;
     Screen.Cursor := crDefault;
     EnableTaskWindows(WndList);
     FInfoFacturacionAlb.Close;
     FInfoFacturacionAlb.Free;
  end;
  ZDMPedidosAAlbaran.ZCierraPedido(id_s_d);

  if (ZDMPedidosAAlbaran.HayErrores) then
     MuestraErrores;

  if ((LFPrevisualizar.GetChecked) or (LFCartaPortes.GetChecked) or
     (LFLstEti.GetChecked)) then
     ZDMPedidosAAlbaran.AbreDocumentos(Tipo,
        ZDMPedidosAAlbaran.SerieDestino,
        ZDMPedidosAAlbaran.Proceso_auto,
        LFPrevisualizar.GetChecked, LFCartaPortes.GetChecked,
        LFLstEti.GetChecked, StrToInt(LFNumEti.Text));
end;

procedure TZFMPedidosAAlbaran.LFCodBarrasKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
     if (LFCodBarras.Text <> '') then
     begin
        CodigoEspecial;
        if (ZDMPedidosAAlbaran.ExistePedido(StrToInt(LFCodBarras.Text))) then
        begin
           ZDMPedidosAAlbaran.InsertaPedido(StrToInt(LFCodBarras.Text));
           LFCodBarras.Text := '';
           LFCodBarras.Refresh;
           DBGFDetalle.Refresh;
           ZDMPedidosAAlbaran.RecalculaPeso;
           ZDMPedidosAAlbaran.RecalculaBultos;
        end
        else
           Beep;
     end;

     if (LFCliente.Text = '') then
        ZDMPedidosAAlbaran.InformarCliente;
  end;
end;

procedure TZFMPedidosAAlbaran.CodigoEspecial;
var
  b, c, NoTiene5ceros, salir, longitud : integer;
  cadena : string;
begin
  cadena := LFCodBarras.Text;
  NoTiene5ceros := 0;

  // comprobar que empieza por 21011
  if ((cadena[1] = '2') and (cadena[2] = '1') and
     (cadena[3] = '0') and (cadena[4] = '1') and
     (cadena[5] = '1')) then
  begin
     // comprobar que después vienen 4 ceros seguidos
     for b := 6 to 10 do
        if (cadena[b] <> '0') then
           NoTiene5ceros := 1;

     if (NoTiene5ceros = 0) then
     begin
        // Eliminar resto de ceros
        c := 9;
        salir := 0;

        while ((c <> (Length(cadena) - 9)) and (salir <> 1)) do
        begin
           if (cadena[c] <> '0') then
              salir := 1
           else
              c := c + 1;
        end;
        longitud := Length(Cadena) - (c - 1);
        // recomponer cadena quitando último número final
        cadena := RightStr(cadena, longitud);
        cadena := LeftStr(cadena, Length(Cadena) - 1);
        LFCodBarras.Text := cadena;
     end;
  end;
end;

procedure TZFMPedidosAAlbaran.MuestraErrores;
begin
  FMControlErroresAgrupPec := TFMControlErroresAgrupPec.Create(Self);
  FMControlErroresAgrupPec.ShowModal;
  FMControlErroresAgrupPec.Free;
end;

procedure TZFMPedidosAAlbaran.FormShow(Sender: TObject);
begin
  inherited;
  ZDMPedidosAAlbaran.xCabecera.Insert;
end;

procedure TZFMPedidosAAlbaran.AAlbaranExecute(Sender: TObject);
var
  id_s : integer;
begin
  inherited;
  {   FMain.EjecutaAccion(FMain.AAlbaranesPendientes,'Empresa = '+ REntorno.EmpresaStr+
    ' and ejercicio='+REntorno.EjercicioStr+' and Canal ='+Rentorno.CanalStr +
    ' and rig = ' + ZDMPedidosAAlbaran.xCabeceraRIG_ALBARAN.AsString+ ' and tipo=''ALB'' ' +
    ' and serie = ''' +  ZDMPedidosAAlbaran.xCabeceraSERIE.AsString + ''''); }
  id_s := ZDMPedidosAAlbaran.BuscaIdSAlbaran;
  FMain.EjecutaAccion(FMain.AAlbaranesPendientes, 'id_s = ' + IntToStr(id_s));
end;

procedure TZFMPedidosAAlbaran.LFLstEtiChange(Sender: TObject);
begin
  inherited;
  if (LFLstEti.State = cbChecked) then
     LFNumEti.Visible := True;
  if (LFLstEti.State = cbunChecked) then
     LFNumEti.Visible := False;
end;

procedure TZFMPedidosAAlbaran.LFBultosChange(Sender: TObject);
begin
  inherited;
  LFNumEti.Text := LFBultos.Text;
end;

end.
