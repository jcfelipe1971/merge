unit UFMPagaRecibosAgr;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, DBCtrls,
  UFormGest, Buttons, rxToolEdit, NsDBGrid, UDBGridSplit, UDBGridNivel,
  ULFComboBox, ULFToolBar, ULFCheckBox, ULFEdit, ULFDBEdit, ULFPanel,
  TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage, ActnList, HYFIBQuery,
  ULFActionList, ULFDateEdit, UFPEditSimple;

type
  TFMPagaRecibosAgr = class(TFPEditSimple)
     PNDatos: TLFPanel;
     LBLCuenta: TLFLabel;
     LBLCliPro: TLFLabel;
     LBLFecha: TLFLabel;
     LBLCantidad: TLFLabel;
     LImportes: TLFLabel;
     SPBPermuta: TSpeedButton;
     EFCtaPago: TLFEditFind2000;
     EFCli_Pro: TLFEditFind2000;
     ETituloCuenta: TLFEdit;
     ECli_Pro: TLFEdit;
     DTPFecha: TLFDateEdit;
     HYGRECantidad: TLFEdit;
     RETOTImportes: THYGRightEdit;
     EFFormaPago: TLFEditFind2000;
     EFormaPago: TLFEdit;
     PNLRecibos: TLFPanel;
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
     CBSigno: TLFComboBox;
     ToolButton2: TToolButton;
     CBProcedimiento: TLFComboBox;
     EFTipoAsientoKri: TLFEditFind2000;
     TBImprimeReciboKri: TToolButton;
     ToolButton1: TToolButton;
     APaga: TAction;
     BSoloAgrupaKri: TButton;
     LSerie: TLFLabel;
     ESerie: TLFEdit;
     LTipoEfecto: TLFLabel;
     LObservacionesVencimiento: TLFLabel;
     ETipoEfecto: TLFEdit;
     EFSerie: TLFEditFind2000;
     EFTipoEfecto: TLFEditFind2000;
     EObservaciones: TLFEdit;
     AAbreDocumento: TAction;
     AAbreRecibo: TAction;
     TButtListado: TToolButton;
     PMListado: TPopupMenu;
     CartadeRecibosAgrupados: TMenuItem;
     Sep1: TMenuItem;
     ConfCartadeRecibosAgr: TMenuItem;
     LCodigoBarras: TLFLabel;
     ECodigoBarras: TLFEdit;
     TButReciboNuevo: TToolButton;
     LErrorConversion: TLabel;
     EnviarCartadeRecibosAgrupados1: TMenuItem;
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
     procedure HYGRECantidadChange(Sender: TObject);
     procedure EFTipoAsientoKriChange(Sender: TObject);
     procedure TBImprimeReciboKriClick(Sender: TObject);
     procedure APagaExecute(Sender: TObject);
     procedure EFFormaPagoBusqueda(Sender: TObject);
     procedure BSoloAgrupaKriClick(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFTipoEfectoChange(Sender: TObject);
     procedure HYDBGRecibosDblClick(Sender: TObject);
     procedure HYDBGRecibosCellClick(Column: TColumn);
     procedure AAbreDocumentoExecute(Sender: TObject);
     procedure HYDBGRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AAbreReciboExecute(Sender: TObject);
     procedure ConfCartadeRecibosAgrClick(Sender: TObject);
     procedure TButtListadoClick(Sender: TObject);
     procedure ECodigoBarrasKeyPress(Sender: TObject; var Key: char);
     procedure TButReciboNuevoClick(Sender: TObject);
     procedure EnviarCartadeRecibosAgrupados1Click(Sender: TObject);
  private
     { Private declarations }
     Moneda: string;
     ColActual: TColumn;
  public
     { Public declarations }
     CerrarAlPagar: boolean;
     procedure Importe(Importe: double; aMoneda: string);
     function ObtDatosCli_Pro(var Cli_Pro: integer; var procedimiento: integer; var Signo, Tipo, Cuenta: string; var Cantidad: double): boolean;
     procedure PonDatosCli_Pro(Cli_Pro: integer; TipoDoc, Cuenta: string; Fecha: TDateTime; Cantidad: double);
  end;

var
  FMPagaRecibosAgr : TFMPagaRecibosAgr;

implementation

uses UDMPagaRecibosAgr, UDMMain, UEntorno, UUtiles, UFMRecibosAgrupados,
  UFMain, UDMLstCarteraRecibos, UFMListConfig, UFMSeleccion, UFMReciboNuevo, UParam,
  UDMListados, UDameDato;

{$R *.DFM}

procedure TFMPagaRecibosAgr.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMPagaRecibosAgr, DMPagaRecibosAgr);
  CEMain.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  CBSigno.ItemIndex := 0;
  CBProcedimiento.ItemIndex := 0;
  HYDBGRecibos.ColumnasChecked.Strings[HYDBGRecibos.ColumnasCheckBoxes.IndexOf('ENTRADA')] := REntorno.EntradaStr;
  DTPFecha.Date := REntorno.FechaTrabSH;
  Moneda := REntorno.Moneda;
  HYGRECantidad.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), 0);
  EFCtaPago.MaxLength := REntorno.DigitosSub;
  FMain.AddComponentePunto(EFCtaPago);
  DMPagaRecibosAgr.LimpiaEntradas;
  DMPagaRecibosAgr.LimpiaCPRecMarc;
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

  CerrarAlPagar := False; // Punteo de asientos

  ColActual := HYDBGRecibos.Columns[0];

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(SPBPermuta, 1, DMMain.ILMain_Ac, 54);
end;

procedure TFMPagaRecibosAgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FMain.DelComponentePunto(EFCtaPago);
  DMPagaRecibosAgr.LimpiaEntradas;
  DMPagaRecibosAgr.LimpiaCPRecMarc;
  CierraData(DMPagaRecibosAgr);
end;

procedure TFMPagaRecibosAgr.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  // DMPagaRecibosAgr.ImprimeFacturas(Self);
end;

procedure TFMPagaRecibosAgr.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Tipo : string;
begin
  if LBLCliPro.Caption = _('Cliente') then
     Tipo := 'FAC'
  else if LBLCliPro.Caption = _('Proveedor') then
     Tipo := 'FAP'
  else if LBLCliPro.Caption = _('Acreedor') then
     Tipo := 'FCR';

  DMPagaRecibosAgr.BusquedaCompleja(Tipo, StrToIntDef(EFCli_Pro.Text, 0));

  Continua := False;
end;

procedure TFMPagaRecibosAgr.TButtPagaClick(Sender: TObject);
var
  Signo, TipoFac : string;
  Cantidad : double;
  ImporteGastos : double;
  CuentaGastos : string;
  Agrupa : boolean;
begin
  if (CBSigno.ItemIndex = 0) then
  begin
     Signo := 'C';
     TipoFac := 'FAC';
  end
  else
  begin
     Signo := 'P';
     if (LBLCliPro.Caption = _('Proveedor')) then
        TipoFac := 'FAP'
     else
        TipoFac := 'FCR';
  end;

  Cantidad := StrToFloatDef(HYGRECantidad.Text, -1);
  if (Cantidad < 0) then
     ShowMessage(_('La Cantidad introducida no es correcta'))
  else
  begin
     if (((CBProcedimiento.ItemIndex = 0) and ((Trim(EFCli_Pro.Text) = '') or (Trim(EFCtaPago.Text) = ''))) or
        ((CBProcedimiento.ItemIndex <> 0) and ((Trim(EFCli_Pro.Text) = '') or (Trim(EFFormaPago.Text) = '')))) then
        ShowMessage(_('Datos Incompletos'))
     else
     begin
        ImporteGastos := 0;
        Agrupa := True;

        if (LeeParametro('CARIGAS001') = 'S') then
        begin
           // Pide importe y cuenta de gastos si es "Pago Agrupado de Recibos" o "Agrupacion y Pago de Recibos"
           if ((CBProcedimiento.ItemIndex = 0) or (CBProcedimiento.ItemIndex = 2)) then
           begin
              Agrupa := (PideDato('DBL', ImporteGastos, 'Importe de gastos'));
              if (Agrupa and (ImporteGastos <> 0)) then
                 Agrupa := (PideDato('CTA', CuentaGastos, 'Cuenta de gastos'));
           end;
        end;

        if (CBProcedimiento.ItemIndex = 0) then
        begin
           // DMPagaRecibosAgr.Anticipos(Trunc(DTPfecha.Date));

           if Agrupa then
              DMPagaRecibosAgr.PagaRecibos(Signo, TipoFac, Trim(EFCtaPago.Text),
                 StrToIntDef(EFCli_Pro.Text, 0), Trunc(DTPfecha.Date),
                 Cantidad, CBUnificaCuentaGastos.Checked, EFTipoAsientoKri.Text,
                 EFTipoEfecto.Text, EObservaciones.Text, ImporteGastos, CuentaGastos);

           HYGRECantidad.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), 0);
        end
        else
        begin
           if Agrupa then
              DMPagaRecibosAgr.AgrupaRecibos(TipoFac, StrToIntDef(EFCli_Pro.Text, 0), Trim(EFFormaPago.Text), Trunc(DTPfecha.Date), (CBProcedimiento.ItemIndex - 1), EFTipoAsientoKri.Text, EFSerie.Text, ImporteGastos, CuentaGastos, EObservaciones.Text);
        end;
     end;
  end;

  DMPagarecibosAgr.PonImporte(0);
  Importe(0, REntorno.Moneda);

  if (CerrarAlPagar) then // Punteo de asientos
     Close;
end;

procedure TFMPagaRecibosAgr.EFCli_ProChange(Sender: TObject);
var
  Tipo, Titulo : string;
begin
  if (CBSigno.ItemIndex <> 2) then
  begin
     DMPagaRecibosAgr.LimpiaEntradas;
     DMPagaRecibosAgr.LimpiaCPRecMarc;
     DMPagaRecibosAgr.PonImporte(0);
     Importe(0, REntorno.Moneda);
  end
  else
  if ((CBSigno.ItemIndex = 2) and (HYDBGCPRecMarc.DataSource.DataSet.RecordCount = 0)) then
     DMPagaRecibosAgr.LimpiaEntradas;

  if LBLCliPro.Caption = _('Cliente') then
     Tipo := 'FAC'
  else
  if LBLCliPro.Caption = _('Proveedor') then
     Tipo := 'FAP'
  else
     Tipo := 'FCR';

  DMPagaRecibosAgr.CambiaCod_Cli(Tipo, StrToIntDef(EFCli_pro.Text, 0), Titulo, CBProcedimiento.ItemIndex);
  ECli_Pro.Text := Titulo;
  DMPagaRecibosAgr.Filtra(Tipo, StrToIntDef(EFCli_pro.Text, 0));
  EFFormaPago.Text := DMPagaRecibosAgr.DameFormaPago(Tipo);
  HYGRECantidad.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), 0);
  EFTipoEfecto.Text := '';
end;

procedure TFMPagaRecibosAgr.CBSignoChange(Sender: TObject);
begin
  BSoloAgrupaKri.Visible := False;
  ECodigoBarras.Visible := False;
  LCodigoBarras.Visible := False;
  // LImportes.Visible := False;
  // RETOTImportes.Visible := False;

  case CBSigno.ItemIndex of
     0:
     begin
        LBLCliPro.Caption := _('Cliente');
        PNLCPRecMarcados.Visible := False;
        SPBPermuta.Visible := False;
        if (CBProcedimiento.ItemIndex = 0) then
        begin
           LBLCuenta.Caption := _('Cuenta de Cobro');
           LBLFecha.Caption := _('Fecha de Cobro');
           LBLCantidad.Caption := _('Cantidad a Cobrar');
           DMPagaRecibosAgr.QMRecibosRECIBIDO.DisplayLabel := _('Recibido');
           DMPagaRecibosAgr.QMRecibosENTRADA.DisplayLabel := _('Cobrar');
        end;
        EFCli_Pro.Text := '';
        EFCli_Pro.Tabla_a_buscar := 'VER_CLIENTES_EF_ALL';
        EFCli_Pro.CampoNum := 'CLIENTE';
        EFCli_Pro.Campos_Desplegar.Text := 'NOMBRE_COMERCIAL';
        EFCli_Pro.OrdenadoPor.Clear;
        EFCli_Pro.OrdenadoPor.Add('CLIENTE');
        // LImportes.Visible := True;
        // RETOTImportes.Visible := True;
        CBUnificaCuentaGastos.Visible := False;
        EFTipoAsientoKri.Text := REntorno.Asiento_P_AGR_C;
     end;
     1:
     begin
        SPBPermuta.Visible := True;
        PNLCPRecMarcados.Visible := False;
        LBLCliPro.Caption := _('Proveedor');
        if (CBProcedimiento.ItemIndex = 0) then
        begin
           LBLCuenta.Caption := _('Cuenta de Pago');
           LBLFecha.Caption := _('Fecha de Pago');
           LBLCantidad.Caption := _('Cantidad a Pagar');
           DMPagaRecibosAgr.QMRecibosRECIBIDO.DisplayLabel := _('Emitido');
           DMPagaRecibosAgr.QMRecibosENTRADA.DisplayLabel := _('Pagar');
        end;
        EFCli_Pro.Text := '';
        EFCli_Pro.Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
        EFCli_Pro.CampoNum := 'PROVEEDOR';
        EFCli_Pro.Campos_Desplegar.Text := 'NOMBRE_R_SOCIAL';
        EFCli_Pro.OrdenadoPor.Clear;
        EFCli_Pro.OrdenadoPor.Add('PROVEEDOR');
        // LImportes.Visible := True;
        // RETOTImportes.Visible := True;
        CBUnificaCuentaGastos.Visible := False;
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
        DMPagaRecibosAgr.QMRecibosRECIBIDO.DisplayLabel := _('Recibido');
        DMPagaRecibosAgr.QMRecibosENTRADA.DisplayLabel := _('Cobrar');
        EFCli_Pro.Text := '';
        EFCli_Pro.Tabla_a_buscar := 'VER_CLIENTES_EF_ALL';
        EFCli_Pro.CampoNum := 'CLIENTE';
        EFCli_Pro.Campos_Desplegar.Text := 'NOMBRE_COMERCIAL';
        EFCli_Pro.OrdenadoPor.Clear;
        EFCli_Pro.OrdenadoPor.Add('CLIENTE');
        CBUnificaCuentaGastos.Visible := True;
        CBUnificaCuentaGastos.Checked := (DMMain.EstadoKri(178) = 1);

        {y aca que?} EFTipoAsientoKri.Text := ''{REntorno.Asiento_P_AGR_P};

        if (DMMain.EstadoKri(213) = 1) then
           BSoloAgrupaKri.Visible := True;

        // Hacer visible Edit para leer codigos de barra
        ECodigoBarras.Visible := True;
        LCodigoBarras.Visible := True;
     end;
  end;

  DMPagaRecibosAgr.PonImporte(0);
  Importe(0, REntorno.Moneda);

  // Habilitamos boton para creacion de recibos si se trata de un pago
  TButReciboNuevo.Visible := (CBSigno.ItemIndex = 1);
end;

procedure TFMPagaRecibosAgr.TButtPermutaProvAcreeClick(Sender: TObject);
var
  Signo : string;
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
     LBLCliPro.Caption := _('Acreedor');
     Signo := 'P';

     with EFCli_Pro do
     begin
        Tabla_a_buscar := 'VER_ACREEDORES_CUENTAS';
        CampoNum := 'ACREEDOR';
        Campos_Desplegar.Text := 'NOMBRE_R_SOCIAL';
        OrdenadoPor.Add('ACREEDOR');
     end;

     if (Numero > 0) then
     begin
        if (DameTituloAcreedor(Numero) > '') then
           EFCli_Pro.Text := IntToStr(Numero);
     end;
  end
  else
  if (LBLCliPro.Caption = _('Acreedor')) and (CBSigno.ItemIndex = 2) then
  begin
     LBLCliPro.Caption := _('Cliente');
     Signo := 'C';

     with EFCli_Pro do
     begin
        Tabla_a_buscar := 'VER_CLIENTES_EF_ALL';
        CampoNum := 'CLIENTE';
        Campos_Desplegar.Text := 'NOMBRE_COMERCIAL';
        OrdenadoPor.Add('CLIENTE');
     end;

     if (Numero > 0) then
     begin
        if (DameTituloCliente(Numero) > '') then
           EFCli_Pro.Text := IntToStr(Numero);
     end;
  end
  else
  begin
     LBLCliPro.Caption := _('Proveedor');
     Signo := 'P';

     with EFCli_Pro do
     begin
        Tabla_a_buscar := 'VER_PROVEEDORES_CUENTAS';
        CampoNum := 'PROVEEDOR';
        Campos_Desplegar.Text := 'NOMBRE_R_SOCIAL';
        OrdenadoPor.Add('PROVEEDOR');
     end;

     if (Numero > 0) then
     begin
        if (DameTituloProveedor(Numero) > '') then
           EFCli_Pro.Text := IntToStr(Numero);
     end;
  end;

  if (CBSigno.ItemIndex = 2) and (LBLCliPro.Caption = _('Cliente')) then
  begin
     LBLCuenta.Caption := _('Cuenta de Cobro');
     LBLFecha.Caption := _('Fecha de Cobro');
     LBLCantidad.Caption := _('Cantidad a Cobrar');
     DMPagaRecibosAgr.QMRecibosENTRADA.DisplayLabel := _('Cobrar');
  end
  else
  begin
     LBLCuenta.Caption := _('Cuenta de Pago');
     LBLFecha.Caption := _('Fecha de Pago');
     LBLCantidad.Caption := _('Cantidad a Pagar');
     DMPagaRecibosAgr.QMRecibosENTRADA.DisplayLabel := _('Pagar');
  end;

  // Refresco el Importe Total
  Importe(DMPagaRecibosAgr.CalculaImporteTotal(Signo, CBProcedimiento.ItemIndex), DMPagaRecibosAgr.QMRecibosMONEDA.AsString);
end;

procedure TFMPagaRecibosAgr.EFCtaPagoChange(Sender: TObject);
begin
  ETituloCuenta.Text := DameTituloCuenta(EFCtaPago.Text);
  HYGRECantidadChange(Sender);
end;

procedure TFMPagaRecibosAgr.EFCtaPagoExit(Sender: TObject);
begin
  EFCtaPago.Text := ExpandirCadena(EFCtaPago.Text, REntorno.DigitosSub);
  // FMain.DelComponenteReturn(EFCtaPago);
end;

procedure TFMPagaRecibosAgr.HYGRECantidadExit(Sender: TObject);
begin
  with HYGRECantidad do
  begin
     Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), StrToFloatDef(Text, 0));
     SelStart := Length(Text);
  end;
end;

procedure TFMPagaRecibosAgr.FormShow(Sender: TObject);
var
  IdColumna : integer;
begin
  EFCli_Pro.SetFocus;

  // Para Chile se muestra el folio del documento
  IdColumna := EncuentraField(HYDBGRecibos, 'FOLIO');
  if (IdColumna >= 0) then
     HYDBGRecibos.Columns[IdColumna].Visible := (REntorno.Pais = 'CHL');
end;

procedure TFMPagaRecibosAgr.CBSignoExit(Sender: TObject);
begin
  EFCli_Pro.SetFocus;
end;

procedure TFMPagaRecibosAgr.Importe(Importe: double; aMoneda: string);
begin
  Moneda := aMoneda;
  if (aMoneda = '') then
     aMoneda := REntorno.Moneda;
  RETOTImportes.Text := FormatFloat(DMMain.MascaraMoneda(aMoneda, 1), Importe);
end;

procedure TFMPagaRecibosAgr.CBProcedimientoChange(Sender: TObject);
begin
  case CBProcedimiento.ItemIndex of
     0:
     begin
        EFCtaPago.Visible := True;
        EFCtaPago.TabStop := True;
        ETituloCuenta.Visible := True;
        EFFormaPago.Visible := False;
        EFFormaPago.TabStop := False;
        EFormaPago.Visible := False;
        LBLCantidad.Visible := True;
        HYGRECantidad.Visible := True;
        //CBSignoChange(Sender);
     end;
     1:
     begin
        TbuttPaga.Hint := _('Agrupa Recibos');
        EFCtaPago.Visible := False;
        EFCtaPago.TabStop := False;
        ETituloCuenta.Visible := False;
        EFFormaPago.Visible := True;
        EFFormaPago.TabStop := True;
        EFormaPago.Visible := True;
        LBLCuenta.Caption := _('Forma de Pago');
        LBLFecha.Caption := _('Fecha de Reg.');
        LBLCantidad.Visible := False;
        HYGRECantidad.Visible := False;
        DMPagaRecibosAgr.QMRecibosENTRADA.DisplayLabel := _('Agrup.');
        if CBSigno.ItemIndex = 2 then
           CBSigno.ItemIndex := 0;
     end;
     2:
     begin
        TbuttPaga.Hint := _('Agrupa y Paga Recibos');
        EFCtaPago.Visible := False;
        EFCtaPago.TabStop := False;
        ETituloCuenta.Visible := False;
        EFFormaPago.Visible := True;
        EFormaPago.Visible := True;
        EFFormaPago.TabStop := True;
        LBLCuenta.Caption := _('Forma de Pago');
        LBLFecha.Caption := _('Fecha de Reg.');
        LBLCantidad.Visible := False;
        HYGRECantidad.Visible := False;
        DMPagaRecibosAgr.QMRecibosENTRADA.DisplayLabel := _('Agrup.');
        if CBSigno.ItemIndex = 2 then
           CBSigno.ItemIndex := 0;
     end;
  end;
  CBSignoChange(Sender);
  EFCli_Pro.Text := '';
  DMPagaRecibosAgr.LimpiaEntradas;
  DMPagaRecibosAgr.LimpiaCPRecMarc;
  DMPagaRecibosAgr.PonImporte(0);
  Importe(0, REntorno.Moneda);
end;

procedure TFMPagaRecibosAgr.EFFormaPagoChange(Sender: TObject);
begin
  EFormaPago.Text := DameTituloFormaPago(EFFormaPago.Text);
end;

procedure TFMPagaRecibosAgr.TButtRecibosAgrupadosClick(Sender: TObject);
var
  Signo : string;
begin
  if (DMPagaRecibosAgr.EsAgrupado) then
  begin
     if CBSigno.ItemIndex = 0 then
        Signo := 'C'
     else
        Signo := 'P';
     TFMRecibosAgrupados.Create(Self).mostrar(REntorno.Empresa, REntorno.Ejercicio,
        REntorno.Canal, DMPagaRecibosAgr.Dameregistro,
        DMPagaRecibosAgr.QMRecibosEJERCICIO.AsInteger, Signo);
  end
  else
     ShowMessage(_('Este recibo no está agrupado'));
end;

procedure TFMPagaRecibosAgr.EFCtaPagoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
     EFCtaPago.Text := ExpandirCadena(EFCtaPago.Text, REntorno.DigitosSub);
     // FMain.DelComponenteReturn(EFCtaPago);
  end;
end;

function TFMPagaRecibosAgr.ObtDatosCli_Pro(var Cli_Pro: integer; var Procedimiento: integer; var Signo, Tipo, Cuenta: string; var Cantidad: double): boolean;
begin
  Procedimiento := CBProcedimiento.ItemIndex;
  Cli_Pro := StrToIntDef(EFCli_Pro.Text, 0);
  if (Cli_Pro <> 0) then
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

     Cuenta := '';
     Cantidad := 0;
     if (CBProcedimiento.ItemIndex = 0) then
     begin
        Cuenta := EFCtaPago.Text;
        Cantidad := StrToFloatDef(HYGRECantidad.Text, 0);
     end;
  end
  else
     Result := False;
end;

procedure TFMPagaRecibosAgr.HYGRECantidadChange(Sender: TObject);
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
     DMPagaRecibosAgr.ActCPRecMarc(StrToIntDef(EFCli_Pro.Text, 0), Signo, Tipo, EFCtaPago.Text, Trunc(DTPfecha.Date), StrToFloatDef(HYGRECantidad.Text, 0));
end;

procedure TFMPagaRecibosAgr.PonDatosCli_Pro(Cli_Pro: integer; TipoDoc, Cuenta: string; Fecha: TDateTime; Cantidad: double);
begin
  if TipoDoc = 'FAC' then
     LBLCliPro.Caption := _('Cliente')
  else
  if TipoDoc = 'FAP' then
     LBLCliPro.Caption := _('Proveedor')
  else
     LBLCliPro.Caption := _('Acreedor');

  DTPFecha.Date := Fecha;
  HYGRECantidad.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), Cantidad);
  EFCtaPago.Text := Cuenta;
  EFCli_Pro.Text := IntToStr(Cli_Pro);
end;

procedure TFMPagaRecibosAgr.EFTipoAsientoKriChange(Sender: TObject);
begin
  if (CBSigno.ItemIndex = 0) then
     REntorno.Asiento_CAR_C := EFTipoAsientoKri.Text
  else
     REntorno.Asiento_CAR_P := EFTipoAsientoKri.Text;
end;

procedure TFMPagaRecibosAgr.TBImprimeReciboKriClick(Sender: TObject);
begin
  with DMPagaRecibosAgr do
  begin
     if (QMRecibos.RecordCount > 0) then
     begin
        AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
        DMLstCarteraRecibos.ImprimirUnRecibo(
           0,
           QMRecibosSIGNO.AsString,
           QMRecibosEJERCICIO.AsInteger,
           QMRecibosREGISTRO.AsInteger,
           QMRecibosLINEA.AsInteger);
        CierraData(DMLstCarteraRecibos);
     end
     else
        ShowMessage(_('No existe recibo seleccionado'));
  end;
end;

procedure TFMPagaRecibosAgr.APagaExecute(Sender: TObject);
begin
  // Cree la ActionList para poder poner un Shortcut (CTRL+T)
  TButtPagaClick(Sender);
end;

procedure TFMPagaRecibosAgr.EFFormaPagoBusqueda(Sender: TObject);
begin
  EFFormaPago.CondicionBusqueda := 'CUENTA_PAGO_PGC=' + IntToStr(REntorno.Pgc);
end;

procedure TFMPagaRecibosAgr.BSoloAgrupaKriClick(Sender: TObject);
var
  Signo, TipoFac, TipoTer : string;
  Cantidad : double;
  Continuar : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(IMPORTE) FROM TMP_CARTERA_CP_REC_MARC WHERE ENTRADA = ?ENTRADA AND SIGNO = ''C'' ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Cantidad := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(IMPORTE) FROM TMP_CARTERA_CP_REC_MARC WHERE ENTRADA = ?ENTRADA AND SIGNO = ''P'' ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Cantidad := Cantidad - FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if LBLCliPro.Caption = _('Cliente') then
  begin
     TipoFac := 'FAC';
     TipoTer := _('Cliente');
     Signo := 'C';
  end
  else
  if LBLCliPro.Caption = _('Proveedor') then
  begin
     TipoFac := 'FAP';
     TipoTer := _('Proveedor');
     Signo := 'P';
  end
  else
  begin
     TipoFac := 'FCR';
     TipoTer := _('Acreedor');
     Signo := 'P';
  end;

  Continuar := True;

  if ((Cantidad < 0) and (TipoFac = 'FAC')) then
     Continuar := MessageDlg(Format(_('El importe resultante sera NEGATIVO: %8.2n' + #13#10 + 'Desea continuar?'), [Cantidad]), mtConfirmation, [mbOK, mbCancel], 0) = mrOk;

  if ((Cantidad > 0) and ((TipoFac = 'FAP') or (TipoFac = 'FCR'))) then
  begin
     Cantidad := Cantidad * (-1);
     Continuar := MessageDlg(Format(_('El importe resultante sera NEGATIVO: %8.2n' + #13#10 + 'Desea continuar?'), [Cantidad]), mtConfirmation, [mbOK, mbCancel], 0) = mrOk;
  end;

  if (Continuar and (MessageDlg(Format(_('Se agruparan estos recibos al %s: %s, %s'), [TipoTer, EFCli_Pro.Text, ECli_Pro.Text]), mtConfirmation, [mbOK, mbCancel], 0) = mrOk)) then
     if ((EFCli_Pro.Text <> '') and (EFFormaPago.Text <> '')) then
        DMPagaRecibosAgr.AgrupaRecibos(TipoFac, StrToIntDef(EFCli_Pro.Text, 0),
           EFFormaPago.Text, Trunc(DTPfecha.Date), -1, EFTipoAsientoKri.Text, EFSerie.Text, 0, '', EObservaciones.Text);

  with DMPagarecibosAgr do
  begin
     PonImporte(0);
     QMCPRecMarcados.Close;
     QMCPRecMarcados.Open;
  end;
  Importe(0, REntorno.Moneda);

  if (CerrarAlPagar) then {dji lrk kri - Punteo de asientos}
     Close;
end;

procedure TFMPagaRecibosAgr.EFSerieChange(Sender: TObject);
begin
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMPagaRecibosAgr.EFTipoEfectoChange(Sender: TObject);
begin
  ETipoEfecto.Text := DameTituloEfecto(EFTipoEfecto.Text);
end;

procedure TFMPagaRecibosAgr.HYDBGRecibosDblClick(Sender: TObject);
begin
  if DMPagaRecibosAgr.HayDetalle then
  begin
     if ((UpperCase(ColActual.FieldName) = 'DOC_NUMERO') or (UpperCase(ColActual.FieldName) = 'DOC_SERIE')) then
        AAbreDocumento.Execute;
     if (UpperCase(ColActual.FieldName) = 'REGISTRO') then
        AAbreRecibo.Execute;
  end;
end;

procedure TFMPagaRecibosAgr.HYDBGRecibosCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMPagaRecibosAgr.AAbreDocumentoExecute(Sender: TObject);
begin
  with DMPagaRecibosAgr do
     FMain.MuestraDocumento(QMRecibosEJERCICIO.AsInteger, QMRecibosDOC_TIPO.AsString, QMRecibosDOC_SERIE.AsString, QMRecibosDOC_NUMERO.AsInteger);
end;

procedure TFMPagaRecibosAgr.HYDBGRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMPagaRecibosAgr.HayDetalle then
     if ((UpperCase(Column.FieldName) = 'DOC_NUMERO') or (UpperCase(Column.FieldName) = 'DOC_SERIE') or (UpperCase(Column.FieldName) = 'REGISTRO')) then
        CeldaEnlace(HYDBGRecibos, Rect);
end;

procedure TFMPagaRecibosAgr.AAbreReciboExecute(Sender: TObject);
begin
  with DMPagaRecibosAgr do
     FMain.MuestraCartera(QMRecibosEJERCICIO.AsInteger, QMRecibosCANAL.AsInteger, QMRecibosSIGNO.AsString[1], QMRecibosREGISTRO.AsInteger);
end;

procedure TFMPagaRecibosAgr.TButtListadoClick(Sender: TObject);
var
  Signo : string;
begin
  if (DMPagaRecibosAgr.EsAgrupado) then
  begin
     if CBSigno.ItemIndex = 0 then
        Signo := 'C'
     else
        Signo := 'P';

     DMPagaRecibosAgr.MostrarListado(9100, 0, StrToInt(EFCli_Pro.Text), REntorno.Empresa,
        REntorno.Ejercicio, REntorno.Canal, DMPagaRecibosAgr.DameRegistro, Signo, '');
  end
  else
     MessageDlg(_('Este recibo no está agrupado'), mtInformation, [mbOK], 0);
end;

procedure TFMPagaRecibosAgr.ConfCartadeRecibosAgrClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(9100, Formato, Cabecera, Copias, Pijama, '', DMPagaRecibosAgr.frListado);
end;

procedure TFMPagaRecibosAgr.ECodigoBarrasKeyPress(Sender: TObject; var Key: char);
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
           EFCli_Pro.Text := IntToStr(DMPagaRecibosAgr.DameClienteCartera(IdCarteraDetalle));
           DMPagaRecibosAgr.SeleccionaRecibo(IdCarteraDetalle);
        end;

        ECodigoBarras.Text := '';
        ECodigoBarras.SetFocus;
     end;
  end;
end;

procedure TFMPagaRecibosAgr.TButReciboNuevoClick(Sender: TObject);
var
  Acreedor : integer;
begin
  inherited;
  Acreedor := 0;

  // Obtenemos el acreedor asociado a la cuenta de pago (un banco normalmente)
  if (EFCtaPago.Text > '') then
     Acreedor := DMPagaRecibosAgr.DameAcreedorCuenta(EFCtaPago.Text);

  CreaRecibo(EFSerie.Text, 'ACR', Acreedor, StrToFloatDef(RETOTImportes.Text, 0), _(Format('Factura %s', [DMPagaRecibosAgr.QMRecibosNUM_FACTURA.AsString])));
end;

procedure TFMPagaRecibosAgr.EnviarCartadeRecibosAgrupados1Click(Sender: TObject);
var
  Signo : string;
  CuerpoMail : TStrings;
  Archivo : string;
begin
  if (DMPagaRecibosAgr.EsAgrupado) then
  begin
     if CBSigno.ItemIndex = 0 then
        Signo := 'C'
     else
        Signo := 'P';

     Archivo := _('ReciboAgrupados') + '-' + EFCli_Pro.Text + '.pdf';
     DMPagaRecibosAgr.MostrarListado(9100, 2, StrToInt(EFCli_Pro.Text), REntorno.Empresa,
        REntorno.Ejercicio, REntorno.Canal, DMPagaRecibosAgr.DameRegistro, Signo, Archivo);

     AbreData(TDMListados, DMListados);
     CuerpoMail := TStringList.Create;
     try
        CuerpoMail.Add('Este correo ha sido enviado desde:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('Y contiene el fichero adjunto ' + UpperCase(Archivo));
        CuerpoMail.Add('Correspondiente al documento: ' + _('Recibos Agrupados'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This email has been sent from:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('And contains the attached file ' + UpperCase(Archivo));
        CuerpoMail.Add('Corresponding to the document: ' + _('Recibos Agrupados'));
        DMListados.SendMailClientePDF(StrToInt(EFCli_Pro.Text), CuerpoMail, DameTempPath + Archivo, Archivo, _('Recibos Agrupados'), 'CLI');
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end
  else
     MessageDlg(_('Este recibo no está agrupado'), mtInformation, [mbOK], 0);
end;


end.
