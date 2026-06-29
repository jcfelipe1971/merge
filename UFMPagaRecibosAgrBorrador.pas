unit UFMPagaRecibosAgrBorrador;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, DBCtrls,
  UFormGest, Buttons, rxToolEdit, NsDBGrid, RXDBCtrl, ULFComboBox,
  ULFToolBar, ULFCheckBox, ULFEdit, ULFDBEdit, ULFPanel, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFLabel, ULFDBDateEdit, UFPEditSimple, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList;

type
  TFMPagaRecibosAgrBorrador = class(TFPEditSimple)
     PNDatos: TLFPanel;
     LBLCuenta: TLFLabel;
     LBLCliPro: TLFLabel;
     LBLFecha: TLFLabel;
     LBLCantidad: TLFLabel;
     LImportes: TLFLabel;
     SPBPermuta: TSpeedButton;
     EFCtaPago: TLFEditFind2000;
     EFCli_Pro: TLFEditFind2000;
     ECuenta: TLFEdit;
     ECli_Pro: TLFEdit;
     DBDTPApunte: TLFDBDateEdit;
     HYGRECantidad: TLFEdit;
     RETOTImportes: THYGRightEdit;
     EFFormaPago: TLFEditFind2000;
     EFormaPago: TLFEdit;
     HYDBGRecibos: TDBGridFind2000;
     PNLCPRecMarcados: TLFPanel;
     TBCPRecMarcados: TLFToolBar;
     NavCPRecMarc: THYMNavigator;
     HYDBGCPRecMarc: THYTDBGrid;
     CBUnificaCuentaGastos: TLFCheckBox;
     TButtSeparador2: TToolButton;
     TButtPaga: TToolButton;
     TButtRecibosAgrupados: TToolButton;
     TButtSeparador1: TToolButton;
     LBLTipo: TLFLabel;
     PNLCBSigno: TLFPanel;
     CBSigno: TLFComboBox;
     ToolButton3: TToolButton;
     PNLCBProcedimiento: TLFPanel;
     CBProcedimiento: TLFComboBox;
     EFTipoAsientoKri: TLFEditFind2000;
     APaga: TAction;
     LSerie: TLFLabel;
     ESerie: TLFEdit;
     EFSerie: TLFEditFind2000;
     LCodigoBarras: TLFLabel;
     ECodigoBarras: TLFEdit;
     PNLRecibos: TLFPanel;
     TButReciboNuevo: TToolButton;
     LErrorConversion: TLabel;
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtPagaClick(Sender: TObject);
     procedure EFCli_ProChange(Sender: TObject);
     procedure CBSignoChange(Sender: TObject);
     procedure TButtPermutaProvAcreeClick(Sender: TObject);
     procedure EFCtaPagoChange(Sender: TObject);
     procedure EFCtaPagoExit(Sender: TObject);
     procedure HYGRECantidadExit(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure CBSignoExit(Sender: TObject);
     procedure CBProcedimientoChange(Sender: TObject);
     procedure EFFormaPagoChange(Sender: TObject);
     procedure TButtRecibosAgrupadosClick(Sender: TObject);
     procedure EFCtaPagoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure PMainExit(Sender: TObject);
     procedure HYGRECantidadChange(Sender: TObject);
     procedure EFCtaPagoEnter(Sender: TObject);
     procedure EFCtaPagoBusqueda(Sender: TObject);
     procedure APagaExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure ECodigoBarrasKeyPress(Sender: TObject; var Key: char);
     procedure TButReciboNuevoClick(Sender: TObject);
  private
     { Private declarations }
     Moneda: string;
  public
     { Public declarations }
     procedure Importe(Importe: double; aMoneda: string);
     procedure Mostrar(Tipo: string);
     function ObtDatosCli_Pro(var Cli_Pro: integer; var procedimiento: integer; var Signo, Tipo, Cuenta: string; var Cantidad: double): boolean;
     procedure PonDatosCli_Pro(Cli_Pro: integer; TipoDoc, Cuenta: string; Fecha: TDateTime; Cantidad: double);
  end;

var
  FMPagaRecibosAgrBorrador : TFMPagaRecibosAgrBorrador;

implementation

uses UDMPagaRecibosAgrBorrador, UDMMain, UEntorno, UUtiles, UFMRecibosAgrupados,
  UFMain, UDMBorradorContabilidad, UFMReciboNuevo, UDameDato;

{$R *.DFM}

procedure TFMPagaRecibosAgrBorrador.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMPagaRecibosAgrBorrador, DMPagaRecibosAgrBorrador);
  CEMain.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  CBSigno.ItemIndex := 0;
  CBProcedimiento.ItemIndex := 0;
  HYDBGRecibos.ColumnasChecked.Strings[HYDBGRecibos.ColumnasCheckBoxes.IndexOf('ENTRADA')] :=
     REntorno.EntradaStr;
  Moneda := REntorno.Moneda;
  HYGRECantidad.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), 0);
  EFCtaPago.MaxLength := REntorno.DigitosSub;
  DMPagaRecibosAgrBorrador.LimpiaEntradas;
  DMPagaRecibosAgrBorrador.LimpiaCPRecMarc;
  CBProcedimientoChange(Sender);
  CBSignoChange(Sender);
  REntorno.Asiento_CAR_C := 'CRE';
  REntorno.Asiento_CAR_P := 'PRE';

  if (CBSigno.ItemIndex = 0) then
     EFTipoAsientoKri.Text := REntorno.Asiento_CAR_C
  else
     EFTipoAsientoKri.Text := REntorno.Asiento_CAR_P;

  if (REntorno.SerieRestringida > '') then
  begin
     EFSerie.Text := REntorno.SerieRestringida;
     EFSerie.Color := clInfoBk;
     EFSerie.ReadOnly := True;
     EFSerie.Enabled := True;
  end
  else
     EFSerie.Text := REntorno.Serie;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(SPBPermuta, 1, DMMain.ILMain_Ac, 54);
end;

procedure TFMPagaRecibosAgrBorrador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  DMPagaRecibosAgrBorrador.LimpiaEntradas;
  DMPagaRecibosAgrBorrador.LimpiaCPRecMarc;
  CierraData(DMPagaRecibosAgrBorrador);

  if (DMBorradorContabilidad.QMAsientos.State = dsInsert) then
     DMBorradorContabilidad.QMAsientosTIPO.AsString := 'NOR';
end;

procedure TFMPagaRecibosAgrBorrador.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  // DMPagaRecibosAgrBorrador.ImprimeFacturas(Self);
end;

procedure TFMPagaRecibosAgrBorrador.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Tipo : string;
begin
  if LBLCliPro.Caption = _('Cliente') then
     Tipo := 'FAC'
  else if LBLCliPro.Caption = _('Proveedor') then
     Tipo := 'FAP'
  else if LBLCliPro.Caption = _('Acreedor') then
     Tipo := 'FCR';

  DMPagaRecibosAgrBorrador.BusquedaCompleja(Tipo, StrToIntDef(EFCli_Pro.Text, 0));

  Continua := False;
end;

procedure TFMPagaRecibosAgrBorrador.TButtPagaClick(Sender: TObject);
var
  Signo, TipoFac : string;
  Cantidad : double;
begin
  if CBSigno.ItemIndex = 0 then
     Signo := 'C'
  else
     Signo := 'P';
  if Signo = 'C' then
     TipoFac := 'FAC'
  else
  begin
     if LBLCliPro.Caption = _('Proveedor') then
        TipoFac := 'FAP'
     else
        TipoFac := 'FCR';
  end;

  if CBProcedimiento.ItemIndex = 0 then
  begin
     Cantidad := StrToFloatDef(HYGRECantidad.Text, -1);
     if (Cantidad < 0) then
        ShowMessage(_('La Cantidad introducida no es correcta'))
     else
     begin
        if ((EFCli_Pro.Text <> '') and (EFCtaPago.Text <> '')) then
        begin
           if (DMPagaRecibosAgrBorrador.PagaRecibos(Signo, TipoFac, EFCtaPago.Text,
              StrToIntDef(EFCli_Pro.Text, 0), DBDTPApunte.Date,
              Cantidad, CBUnificaCuentaGastos.Checked)) then
              Close;

           // Se ha producido un ERROR
        end
        else
           ShowMessage(_('Datos Incompletos'));

        HYGRECantidad.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), 0);
     end;
  end
  else
  begin
     if ((EFCli_Pro.Text <> '') and (EFFormaPago.Text <> '')) then
        DMPagaRecibosAgrBorrador.AgrupaRecibos(TipoFac, StrToIntDef(EFCli_Pro.Text, 0),
           EFFormaPago.Text, Trunc(DBDTPApunte.Date), (CBProcedimiento.ItemIndex - 1), EFTipoAsientoKri.Text, EFSerie.Text);
  end;

  DMPagaRecibosAgrBorrador.PonImporte(0);
  Importe(0, REntorno.Moneda);
end;

procedure TFMPagaRecibosAgrBorrador.CBSignoChange(Sender: TObject);
begin
  case CBSigno.ItemIndex of
     0:
     begin
        LBLCliPro.Caption := _('Cliente');
        PNLCPRecMarcados.Visible := False;
        SPBPermuta.Visible := False;
        CBUnificaCuentaGastos.Visible := False;
        if (CBProcedimiento.ItemIndex = 0) then
        begin
           LBLCuenta.Caption := _('Cuenta de Cobro');
           LBLFecha.Caption := _('Fecha de Cobro');
           LBLCantidad.Caption := _('Cantidad a Cobrar');
           HYDBGRecibos.FindColumn('RECIBIDO').Title.Caption := _('Recibido');
           HYDBGRecibos.FindColumn('ENTRADA').Title.Caption := _('Cobrar');
        end;
        EFCli_Pro.Text := '';
        EFCli_Pro.Tabla_a_buscar := 'VER_CLIENTES_EF';
        EFCli_Pro.CampoNum := 'CLIENTE';
        EFCli_Pro.OrdenadoPor.Clear;
        EFCli_Pro.OrdenadoPor.Add('CLIENTE');
        EFTipoAsientoKri.Text := REntorno.Asiento_P_AGR_C;
     end;
     1:
     begin
        if (LBLCliPro.Caption = _('Proveedor')) then
        begin
           EFCli_Pro.Text := '';
           EFCli_Pro.Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
           EFCli_Pro.CampoNum := 'PROVEEDOR';
           EFCli_Pro.OrdenadoPor.Clear;
           EFCli_Pro.OrdenadoPor.Add('PROVEEDOR');
        end;

        if (LBLCliPro.Caption = _('Acreedor')) then
        begin
           EFCli_Pro.Text := '';
           EFCli_Pro.Tabla_a_buscar := 'VER_ACREEDORES_CUENTAS';
           EFCli_Pro.CampoNum := 'ACREEDOR';
           EFCli_Pro.OrdenadoPor.Clear;
           EFCli_Pro.OrdenadoPor.Add('PROVEEDOR');
        end;

        PNLCPRecMarcados.Visible := False;
        SPBPermuta.Visible := False;
        CBUnificaCuentaGastos.Visible := False;
        if (CBProcedimiento.ItemIndex = 0) then
        begin
           LBLCuenta.Caption := _('Cuenta de Pago');
           LBLFecha.Caption := _('Fecha de Pago');
           LBLCantidad.Caption := _('Cantidad a Pagar');
           HYDBGRecibos.FindColumn('RECIBIDO').Title.Caption := _('Emitido');
           HYDBGRecibos.FindColumn('ENTRADA').Title.Caption := _('Pagar');
        end;
        EFTipoAsientoKri.Text := REntorno.Asiento_P_AGR_P;
     end;
     2:
     begin
        SPBPermuta.Visible := True;
        PNLCPRecMarcados.Visible := True;
        LBLCliPro.Caption := _('Cliente');
        CBProcedimiento.ItemIndex := 0;
        LBLCuenta.Caption := _('Cuenta de Cobro');
        LBLFecha.Caption := _('Fecha de Cobro');
        LBLCantidad.Caption := _('Cantidad a Cobrar');
        HYDBGRecibos.FindColumn('RECIBIDO').Title.Caption := _('Recibido');
        HYDBGRecibos.FindColumn('ENTRADA').Title.Caption := _('Cobrar');
        EFCli_Pro.Text := '';
        EFCli_Pro.Tabla_a_buscar := 'VER_CLIENTES_EF';
        EFCli_Pro.CampoNum := 'CLIENTE';
        EFCli_Pro.OrdenadoPor.Clear;
        EFCli_Pro.OrdenadoPor.Add('CLIENTE');
        RETOTImportes.Visible := False;
        LImportes.Visible := False;
        CBUnificaCuentaGastos.Visible := True;
        CBUnificaCuentaGastos.Checked := (DMMain.EstadoKri(178) = 1);

        // Hacer visible Edit para leer codigos de barra
        ECodigoBarras.Visible := True;
        LCodigoBarras.Visible := True;
     end;
  end;

  DMPagaRecibosAgrBorrador.PonImporte(0);
  Importe(0, REntorno.Moneda);

  // Habilitamos boton para creacion de recibos si se trata de un pago
  TButReciboNuevo.Visible := (CBSigno.ItemIndex = 1);
end;

procedure TFMPagaRecibosAgrBorrador.TButtPermutaProvAcreeClick(Sender: TObject);
var
  Numero : integer;
begin
  with EFCli_Pro do
  begin
     // Trato de mantener el numero al cambiar de tipo de tercero
     Numero := StrToIntDef(Text, -1);
     Text := '';
     OrdenadoPor.Clear;
  end;

  if LBLCliPro.Caption = _('Proveedor') then
  begin
     with EFCli_Pro do
     begin
        LBLCliPro.Caption := _('Acreedor');
        Tabla_a_buscar := 'VER_ACREEDORES_CUENTAS';
        CampoNum := 'ACREEDOR';
        OrdenadoPor.Add('ACREEDOR');

        if (Numero > 0) then
        begin
           if (DameTituloAcreedor(Numero) > '') then
              EFCli_Pro.Text := IntToStr(Numero);
        end;
     end;
  end
  else
  if (LBLCliPro.Caption = _('Acreedor')) and (CBSigno.ItemIndex = 2) then
  begin
     with EFCli_Pro do
     begin
        LBLCliPro.Caption := _('Cliente');
        Tabla_a_buscar := 'VER_CLIENTES_EF';
        CampoNum := 'CLIENTE';
        OrdenadoPor.Add('CLIENTE');

        if (Numero > 0) then
        begin
           if (DameTituloCliente(Numero) > '') then
              EFCli_Pro.Text := IntToStr(Numero);
        end;
     end;
  end
  else
  begin
     with EFCli_Pro do
     begin
        LBLCliPro.Caption := _('Proveedor');
        Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
        CampoNum := 'PROVEEDOR';
        OrdenadoPor.Add('PROVEEDOR');

        if (Numero > 0) then
        begin
           if (DameTituloProveedor(Numero) > '') then
              EFCli_Pro.Text := IntToStr(Numero);
        end;
     end;
  end;

  if (CBSigno.ItemIndex = 2) and (LBLCliPro.Caption = _('Cliente')) then
  begin
     LBLCuenta.Caption := _('Cuenta de Cobro');
     LBLFecha.Caption := _('Fecha de Cobro');
     LBLCantidad.Caption := _('Cantidad a Cobrar');
     HYDBGRecibos.FindColumn('ENTRADA').Title.Caption := _('Cobrar');
  end
  else
  begin
     LBLCuenta.Caption := _('Cuenta de Pago');
     LBLFecha.Caption := _('Fecha de Pago');
     LBLCantidad.Caption := _('Cantidad a Pagar');
     HYDBGRecibos.FindColumn('ENTRADA').Title.Caption := _('Pagar');
  end;
end;

procedure TFMPagaRecibosAgrBorrador.EFCtaPagoChange(Sender: TObject);
begin
  ECuenta.Text := DameTituloCuenta(EFCtaPago.Text);
  HYGRECantidadChange(Sender);
end;

procedure TFMPagaRecibosAgrBorrador.EFCtaPagoExit(Sender: TObject);
begin
  EFCtaPago.Text := ExpandirCadena(EFCtaPago.Text, REntorno.DigitosSub);
  FMain.DelComponentePunto(EFCtaPago);
  FMain.DelComponenteReturn(EFCtaPago);
end;

procedure TFMPagaRecibosAgrBorrador.HYGRECantidadExit(Sender: TObject);
begin
  with HYGRECantidad do
  begin
     Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), StrToFloatDef(Text, 0));
     SelStart := Length(Text);
  end;
end;

procedure TFMPagaRecibosAgrBorrador.FormShow(Sender: TObject);
var
  IdColumna : integer;
begin
  EFCli_Pro.SetFocus;

  // Para Chile se muestra el folio del documento
  IdColumna := EncuentraField(HYDBGRecibos, 'FOLIO');
  if (IdColumna >= 0) then
     HYDBGRecibos.Columns[IdColumna].Visible := (REntorno.Pais = 'CHL');
end;

procedure TFMPagaRecibosAgrBorrador.CBSignoExit(Sender: TObject);
begin
  EFCli_Pro.SetFocus;
end;

procedure TFMPagaRecibosAgrBorrador.Importe(Importe: double; aMoneda: string);
begin
  Moneda := aMoneda;
  RETOTImportes.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), Importe);
end;

procedure TFMPagaRecibosAgrBorrador.CBProcedimientoChange(Sender: TObject);
begin
  if (CBSigno.ItemIndex <> 2) then
  begin
     case CBProcedimiento.ItemIndex of
        0:
        begin
           EFCtaPago.Visible := True;
           ECuenta.Visible := True;
           EFFormaPago.Visible := False;
           EFormaPago.Visible := False;
           LBLCantidad.Visible := True;
           HYGRECantidad.Visible := True;
        end;
        1:
        begin
           TbuttPaga.Hint := _('Agrupa Recibos');
           EFCtaPago.Visible := False;
           ECuenta.Visible := False;
           EFFormaPago.Visible := True;
           EFormaPago.Visible := True;
           LBLCuenta.Caption := _('Forma de Pago');
           LBLFecha.Caption := _('Fecha de Reg.');
           LBLCantidad.Visible := False;
           HYGRECantidad.Visible := False;
           HYDBGRecibos.FindColumn('ENTRADA').Title.Caption := _('Agrup.');
        end;
        2:
        begin
           TbuttPaga.Hint := _('Agrupa y Paga Recibos');
           EFCtaPago.Visible := False;
           ECuenta.Visible := False;
           EFFormaPago.Visible := True;
           EFormaPago.Visible := True;
           LBLCuenta.Caption := _('Forma de Pago');
           LBLFecha.Caption := _('Fecha de Reg.');
           LBLCantidad.Visible := False;
           HYGRECantidad.Visible := False;
           HYDBGRecibos.FindColumn('ENTRADA').Title.Caption := _('Agrup.');
        end;
     end;
  end
  else
     CBProcedimiento.ItemIndex := 0;

  // EFCli_Pro.Text:='';

  DMPagaRecibosAgrBorrador.LimpiaEntradas;
  DMPagaRecibosAgrBorrador.PonImporte(0);
  Importe(0, REntorno.Moneda);

  // Refrescar el dataset
  DMPagaRecibosAgrBorrador.QMRecibos.Close;
  DMPagaRecibosAgrBorrador.QMRecibos.Open;
end;

procedure TFMPagaRecibosAgrBorrador.EFFormaPagoChange(Sender: TObject);
begin
  EFormaPago.Text := DameTituloFormaPago(EFFormaPago.Text);
end;

procedure TFMPagaRecibosAgrBorrador.TButtRecibosAgrupadosClick(Sender: TObject);
var
  Signo : string;
begin
  if (DMPagaRecibosAgrBorrador.EsAgrupado) then
  begin
     if CBSigno.ItemIndex = 0 then
        Signo := 'C'
     else
        Signo := 'P';
     TFMRecibosAgrupados.Create(Self).mostrar(REntorno.Empresa, REntorno.Ejercicio,
        REntorno.Canal, DMPagaRecibosAgrBorrador.Dameregistro,
        DMPagaRecibosAgrBorrador.QMRecibosEJERCICIO.AsInteger, Signo);
  end
  else
     ShowMessage(_('Este recibo no está agrupado'));
end;

procedure TFMPagaRecibosAgrBorrador.EFCtaPagoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
     EFCtaPago.Text := ExpandirCadena(EFCtaPago.Text, REntorno.DigitosSub);
     FMain.DelComponentePunto(EFCtaPago);
     FMain.DelComponenteReturn(EFCtaPago);
  end;
end;

procedure TFMPagaRecibosAgrBorrador.Mostrar(Tipo: string);
begin
  // Configuramos ventana segun tipo de Asiento

  PNLCBProcedimiento.Enabled := True;
  CBProcedimiento.Color := clWindow;
  CBProcedimiento.Font.Color := clWindowText;

  if (Tipo = 'CRC') then
  begin
     CBSigno.ItemIndex := 0;
  end;

  if (Tipo = 'PRP') then
  begin
     CBSigno.ItemIndex := 1;
     TButtPermutaProvAcreeClick(Self);
  end;

  if (Tipo = 'PRA') then
  begin
     CBSigno.ItemIndex := 1;
     TButtPermutaProvAcreeClick(Self);
     TButtPermutaProvAcreeClick(Self);
  end;

  if (Tipo = 'CPB') then
  begin
     CBSigno.ItemIndex := 2;
     PNLCBProcedimiento.Enabled := False;
     CBProcedimiento.Color := clInfoBk;
     CBProcedimiento.Font.Color := clGrayText;
  end;

  CBSignoChange(Self);
  ShowModal;
end;

procedure TFMPagaRecibosAgrBorrador.EFCli_ProChange(Sender: TObject);
var
  Tipo, Titulo : string;
begin
  if (CBSigno.ItemIndex <> 2) then
  begin
     DMPagaRecibosAgrBorrador.LimpiaEntradas;
     DMPagaRecibosAgrBorrador.LimpiaCPRecMarc;
  end
  else if ((CBSigno.ItemIndex = 2) and (HYDBGCPRecMarc.DataSource.DataSet.RecordCount = 0)) then
     DMPagaRecibosAgrBorrador.LimpiaEntradas;

  if LBLCliPro.Caption = _('Cliente') then
     Tipo := 'FAC'
  else if LBLCliPro.Caption = _('Proveedor') then
     Tipo := 'FAP'
  else
     Tipo := 'FCR';
  DMPagaRecibosAgrBorrador.CambiaCod_Cli(Tipo, StrToIntDef(EFCli_pro.Text, 0), Titulo);
  ECli_Pro.Text := Titulo;
  DMPagaRecibosAgrBorrador.Filtra(Tipo, StrToIntDef(EFCli_pro.Text, 0));
  EFFormaPago.Text := DMPagaRecibosAgrBorrador.DameFormaPago(Tipo);
  DMPagaRecibosAgrBorrador.PonImporte(0);
end;

procedure TFMPagaRecibosAgrBorrador.PMainExit(Sender: TObject);
begin
  PMain.Enabled := True;
end;

function TFMPagaRecibosAgrBorrador.ObtDatosCli_Pro(var Cli_Pro: integer; var Procedimiento: integer; var Signo, Tipo, Cuenta: string; var Cantidad: double): boolean;
begin
  procedimiento := CBProcedimiento.ItemIndex;
  Cli_Pro := StrToIntDef(EFCli_Pro.Text, 0);
  if (CBProcedimiento.ItemIndex = 0) and (Cli_Pro <> 0) then
  begin
     Result := True;
     if LBLCliPro.Caption = _('Cliente') then
     begin
        Signo := 'C';
        Tipo := 'CLI';
     end
     else
     begin
        Signo := 'P';
        if LBLCliPro.Caption = _('Proveedor') then
           Tipo := 'PRO'
        else
           Tipo := 'ACR';
     end;
     Cuenta := EFCtaPago.Text;
     Cantidad := StrToFloatDef(HYGRECantidad.Text, 0);
  end
  else
     Result := False;
end;

procedure TFMPagaRecibosAgrBorrador.HYGRECantidadChange(Sender: TObject);
var
  Signo, Tipo : string;
begin
  // Verifico si se puede convertir el numero
  if ((Trim(HYGRECantidad.Text) > '') and (StrToFloatDef(HYGRECantidad.Text, -123456) = -123456)) then
  begin
     ColorError(HYGRECantidad);
     LErrorConversion.Visible := True;
  end
  else
  begin
     ColorEdicion(HYGRECantidad);
     LErrorConversion.Visible := False;
  end;

  if LBLCliPro.Caption = _('Cliente') then
  begin
     Signo := 'C';
     Tipo := 'CLI';
  end
  else
  begin
     Signo := 'P';
     if LBLCliPro.Caption = _('Proveedor') then
        Tipo := 'PRO'
     else
        Tipo := 'ACR';
  end;

  if (EFCli_Pro.Text <> '') then
     DMPagaRecibosAgrBorrador.ActCPRecMarc(StrToIntDef(EFCli_Pro.Text, 0), Signo, Tipo,
        EFCtaPago.Text, Trunc(DBDTPApunte.Date), StrToFloatDef(HYGRECantidad.Text, 0));
end;

procedure TFMPagaRecibosAgrBorrador.PonDatosCli_Pro(Cli_Pro: integer; TipoDoc, Cuenta: string; Fecha: TDateTime; Cantidad: double);
begin
  if TipoDoc = 'FAC' then
     LBLCliPro.Caption := _('Cliente')
  else
  if TipoDoc = 'FAP' then
     LBLCliPro.Caption := _('Proveedor')
  else
     LBLCliPro.Caption := _('Acreedor');

  DBDTPApunte.Date := Fecha;
  HYGRECantidad.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), Cantidad);
  EFCtaPago.Text := Cuenta;
  EFCli_Pro.Text := IntToStr(Cli_Pro);
end;

procedure TFMPagaRecibosAgrBorrador.EFCtaPagoEnter(Sender: TObject);
begin
  FMain.AddComponentePunto(EFCtaPago);
  FMain.AddComponenteReturn(EFCtaPago);
end;

procedure TFMPagaRecibosAgrBorrador.EFCtaPagoBusqueda(Sender: TObject);
var
  Canal, Pgc : integer;
begin
  with DMBorradorContabilidad do
  begin
     Canal := QMAsientosCanal.AsInteger;
     Pgc := DamePgc(QMAsientosEMPRESA.AsInteger, QMAsientosEJERCICIO.AsInteger, Canal);
     EFCtaPago.CondicionBusqueda := 'PGC=' + IntToStr(Pgc) + ' AND TIPO = 5';
  end;
end;

procedure TFMPagaRecibosAgrBorrador.EFSerieChange(Sender: TObject);
begin
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMPagaRecibosAgrBorrador.APagaExecute(Sender: TObject);
begin
  inherited;
  // Cree la ActionList para poder poner un Shortcut (CTRL+T)
  TButtPagaClick(Sender);
end;

procedure TFMPagaRecibosAgrBorrador.ECodigoBarrasKeyPress(Sender: TObject; var Key: char);
var
  IdCarteraDetalle : integer;
begin
  inherited;
  if (Key = #13) then
  begin
     if (EFCtaPago.Text = '') then
        ShowMessage(_('La cuenta de Cobro/Pago es incorrecta'))
     else
     begin
        // Aqui debe traer datos segun el ID_CARTERA_DETALLE y agregar el recibo a cobro/pago
        IdCarteraDetalle := StrToIntDef(ECodigoBarras.Text, 0);

        if (IdCarteraDetalle > 0) then
        begin
           EFCli_Pro.Text := IntToStr(DMPagaRecibosAgrBorrador.DameClienteCartera(IdCarteraDetalle));
           DMPagaRecibosAgrBorrador.SeleccionaRecibo(IdCarteraDetalle);
        end;

        ECodigoBarras.Text := '';
        ECodigoBarras.SetFocus;
     end;
  end;
end;

procedure TFMPagaRecibosAgrBorrador.TButReciboNuevoClick(Sender: TObject);
var
  Acreedor : integer;
begin
  inherited;
  Acreedor := 0;

  // Obtenemos el acreedor asociado a la cuenta de pago (un banco normalmente)
  if (EFCtaPago.Text > '') then
     Acreedor := DMPagaRecibosAgrBorrador.DameAcreedorCuenta(EFCtaPago.Text);

  CreaRecibo(EFSerie.Text, 'ACR', Acreedor, StrToFloatDef(RETOTImportes.Text, 0), _(Format('Factura %s', [DMPagaRecibosAgrBorrador.QMRecibosNUM_FACTURA.AsString])));
end;

end.
