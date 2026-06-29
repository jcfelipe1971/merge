unit UFMSysEmpresas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  Buttons, ActnList, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, TFlatCheckBoxUnit, ULFCheckBox, ULFDBDateEdit,
  ULFDBMemo, ULFLabel, UG2kTBLoc, ULFEdit;

type
  TFMSysEmpresas = class(TFPEdit)
     DBEEmpresa: TLFDbedit;
     LEmpresa: TLFLabel;
     DBETitulo: TLFDbedit;
     EFTercero: TLFDBEditFind2000;
     LTercero: TLFLabel;
     DBETextTercero: TLFDbedit;
     LApertura: TLFLabel;
     DBDTPApertura: TLFDBDateEdit;
     DBRGDuracion: TDBRadioGroup;
     DBEFechaAlta: TLFDbedit;
     LFechaAlte: TLFLabel;
     DBCBAbierta: TLFDBCheckBox;
     EFMoneda: TLFDBEditFind2000;
     DBEMonedaTit: TLFDbedit;
     LMoneda: TLFLabel;
     EFModoIVA: TLFDBEditFind2000;
     DBEModoTit: TLFDbedit;
     LModoIVA: TLFLabel;
     DBCBIva: TLFDBCheckBox;
     DBCBRecargo: TLFDBCheckBox;
     DBCBDeducible: TLFDBCheckBox;
     DBCBClienteAuto: TLFDBCheckBox;
     ALEmpresas: TLFActionList;
     AATercero: TAction;
     SBATercero: TSpeedButton;
     MISepEnlaces: TMenuItem;
     MIVerDatosTercero: TMenuItem;
     DBCBPMP: TLFDBCheckBox;
     DBCBCompras: TLFDBCheckBox;
     DBCBCierre: TLFDBCheckBox;
     DBCBFechaVentas: TLFDBCheckBox;
     DBCBLstPedCompras: TLFDBCheckBox;
     LBLAutofacturas: TLFLabel;
     DBETitSerie: TLFDbedit;
     DBEFSerie: TLFDBEditFind2000;
     ARegenera: TAction;
     AActivacionECS: TAction;
     AAbrirEmpresa: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ACerrarEmpresa: TAction;
     AAltaEjercicio: TAction;
     AEliminaEmpresa: TAction;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     LImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     LFDBCBCierraDocCero: TLFDBCheckBox;
     DBMMercantil: TLFDBMemo;
     LBLMercantil: TLFLabel;
     CBSerializadoAuto: TLFDBCheckBox;
     LFDBCBMoverStockVentas: TLFDBCheckBox;
     LFDBCBMoverStockCompras: TLFDBCheckBox;
     LFDBCBCalcularPortesCompras: TLFDBCheckBox;
     LFDBCBCalcularPortesVentas: TLFDBCheckBox;
     DBCBSeparaApuntes: TLFDBCheckBox;
     LFDBCBSepararPedidosEnRecep: TLFDBCheckBox;
     LFDBCBControlStockNeg: TLFDBCheckBox;
     LFDBCBAsientoNegativo: TLFDBCheckBox;
     LLimitePEPKri: TLFLabel;
     DBELimitePEPKri: TLFDbedit;
     DBCBImporteLetras: TDBComboBox;
     LBLImporteLetras: TLFLabel;
     DBCBSepararApunteDtoCial: TLFDBCheckBox;
     DBChkBRECC: TLFDBCheckBox;
     BCargarImagen: TButton;
     DBCBInvetarioPermanente: TLFDBCheckBox;
     TSEmail: TTabSheet;
     PNLEmail: TLFPanel;
     LAsunto: TLFLabel;
     DBEAsunto: TLFDbedit;
     LNotasPieEmail: TLFLabel;
     DBMNotasPieCorreo: TLFDBMemo;
     TBConfigEmail: TLFToolBar;
     NavConfigEmail: THYMNavigator;
     CEMail: TControlEdit;
     CEEmailPMEdit: TPopUpTeclas;
     MenuItem1: TMenuItem;
     MenuItem2: TMenuItem;
     MenuItem3: TMenuItem;
     MenuItem4: TMenuItem;
     MenuItem5: TMenuItem;
     MenuItem6: TMenuItem;
     MenuItem7: TMenuItem;
     MenuItem8: TMenuItem;
     MenuItem9: TMenuItem;
     MenuItem10: TMenuItem;
     MenuItem11: TMenuItem;
     MenuItem12: TMenuItem;
     MenuItem13: TMenuItem;
     MenuItem14: TMenuItem;
     MenuItem15: TMenuItem;
     MenuItem16: TMenuItem;
     MenuItem17: TMenuItem;
     MenuItem18: TMenuItem;
     MenuItem19: TMenuItem;
     MenuItem20: TMenuItem;
     MenuItem21: TMenuItem;
     MenuItem22: TMenuItem;
     MenuItem23: TMenuItem;
     BClipboard: TButton;
     TSLOPD: TTabSheet;
     TBLOPD: TLFToolBar;
     NavLOPD: THYMNavigator;
     PNLLOPD: TLFPanel;
     DBMTextoLOPD: TLFDBMemo;
     PNLTextoLOPDPieDocumento: TLFPanel;
     PNLTextoLOPD: TLFPanel;
     LTextoLOPD: TLFLabel;
     LTextoLOPDPieDocumento: TLFLabel;
     DBMTextoLOPDPieDocumento: TLFDBMemo;
     CELOPD: TControlEdit;
     CELOPDPMEdit: TPopUpTeclas;
     CELOPDPMEdit1: TMenuItem;
     CELOPDPMEdit2: TMenuItem;
     CELOPDPMEdit3: TMenuItem;
     CELOPDPMEdit4: TMenuItem;
     CELOPDPMEdit5: TMenuItem;
     CELOPDPMEdit6: TMenuItem;
     CELOPDPMEdit7: TMenuItem;
     CELOPDPMEdit8: TMenuItem;
     CELOPDPMEdit9: TMenuItem;
     CELOPDPMEdit10: TMenuItem;
     CELOPDPMEdit11: TMenuItem;
     CELOPDPMEdit12: TMenuItem;
     CELOPDPMEdit13: TMenuItem;
     CELOPDPMEdit14: TMenuItem;
     CELOPDPMEdit15: TMenuItem;
     CELOPDPMEdit16: TMenuItem;
     CELOPDPMEdit17: TMenuItem;
     CELOPDPMEdit18: TMenuItem;
     CELOPDPMEdit19: TMenuItem;
     CELOPDPMEdit20: TMenuItem;
     CELOPDPMEdit21: TMenuItem;
     CELOPDPMEdit22: TMenuItem;
     CELOPDPMEdit23: TMenuItem;
     DBETamanyoEmpresa: TLFDbedit;
     LTamanyoEmpresa: TLFLabel;
     LAgenciaTributaria: TLFLabel;
     DBEAgenciaTributaria: TLFDbedit;
     TSFacturaElectronica: TTabSheet;
     TBTipoGiro: TLFToolBar;
     NavTipoGiro: THYMNavigator;
     DBGFTipoGiro: TDBGridFind2000;
     LFCategoryAction2: TLFCategoryAction;
     AAdjuntoEmpresa: TAction;
     DBEGS1CompanyPrefix: TLFDbedit;
     LGS1CompanyPrefix: TLFLabel;
     LTextoEnvioDocumento: TLFLabel;
     DBMTextoEnvioDocumento: TLFDBMemo;
     LstVariables: TListBox;
     DBCBProveedorAuto: TLFDBCheckBox;
     DBCBAcreedorAuto: TLFDBCheckBox;
     LImagenFondo: TLFLabel;
     DBEFImagenFondo: TLFDBEditFind2000;
     ETituloImagenFondo: TLFEdit;
     BCargarImagenFondo: TButton;
     BClipboardImagenFondo: TButton;
     TBSep1: TToolButton;
     PNLTipoConfig: TLFPanel;
     LTipoConfig: TLFLabel;
     DBETipoConfig: TLFDbedit;
     ETipoConfig: TLFEdit;
     LServCorreo: TLFLabel;
     DBEServCorreo: TLFDBEditFind2000;
     EServCorreoTitulo: TLFEdit;
     procedure TbuttCompClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AATerceroExecute(Sender: TObject);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure DBETextTerceroEnter(Sender: TObject);
     procedure ARegeneraExecute(Sender: TObject);
     procedure AActivacionECSExecute(Sender: TObject);
     procedure AAbrirEmpresaExecute(Sender: TObject);
     procedure ACerrarEmpresaExecute(Sender: TObject);
     procedure AAltaEjercicioExecute(Sender: TObject);
     procedure AEliminaEmpresaExecute(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure BClipboardClick(Sender: TObject);
     procedure AAdjuntoEmpresaExecute(Sender: TObject);
     procedure LstVariablesDblClick(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBEFImagenFondoChange(Sender: TObject);
     procedure BCargarImagenFondoClick(Sender: TObject);
     procedure BClipboardImagenFondoClick(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure ComponenteFocoEnter(Sender: TObject);
     procedure DBETipoConfigChange(Sender: TObject);
     procedure DBEServCorreoChange(Sender: TObject);
  private
     { Private declarations }
     ComponenteFoco: TComponent;
     procedure HabilitaEnlaces;
  public
     { Public declarations }
  end;

var
  FMSysEmpresas : TFMSysEmpresas;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, UDMSysEmpresa,
  UFMain, UFMAdjunto, ShellApi, URecibeFicheros, UDMAdjunto, UImagenes;

{$R *.DFM}

procedure TFMSysEmpresas.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMSysEmpresa, DMSysEmpresa);
  NavMain.DataSource := DMSysEmpresa.DSQMSysEmpresas;
  EPMain.DataSource := DMSysEmpresa.DSQMSysEmpresas;
  DBGMain.DataSource := DMSysEmpresa.DSQMSysEmpresas;
  NavConfigEmail.DataSource := DMSysEmpresa.DSxConfigEmail;
  HabilitaEnlaces;
  RefrescarImagen(Imagen, DMSysEmpresa.QMSysEmpresasE_IMAGEN.AsInteger);

  // Color campo ID
  ColorCampoID(DBEEmpresa);

  // Lista de variables que se pueden utilizar en texto de envio de documentos por email
  // ***********************************
  // Ver tambien UUtiles.DamePartesEmail
  // ***********************************
  with LstVariables.Items do
  begin
     Clear;
     Add('[EMPRESA]');
     Add('[EJERCICIO]');
     Add('[NOMBREFICHERO]');
     Add('[TIPODOCUMENTO]');
     Add('[SERIE]');
     Add('[NUMERODOCUMENTO]');
     Add('[FECHA]');
     Add('[SUREFERENCIA]');
     Add('[SUPEDIDO]');
     Add('[MATRICULA]');
     Add('[NOMBRECOMERCIAL]');
     Add('[RAZONSOCIAL]');
     Add('[ORDENTRABAJO]');
     Add('[IDORDENTRABAJO]');
     Add('[USUARIOCREADORDOCUMENTO]');

     if (REntorno.Pais = 'CHL') then
     begin
        Add('[FOLIO]');
        Add('[TITULODOCTRIBUTARIO]');
     end;
  end;

  // Elimino las acciones para ver adjuntos
  if (DMMain.EstadoKri(242) <> 1) then
  begin
     for i := Self.ComponentCount - 1 downto 0 do
     begin
        if (Self.Components[i] is TAction) then
        begin
           if TAction(Self.Components[i]).Category = 'Adjuntos' then
              TAction(Self.Components[i]).Free;
        end
        else
        begin
           if (Components[i] is TLFCategoryAction) then
              if TLFCategoryAction(Self.Components[i]).Category = 'Adjuntos' then
                 TLFCategoryAction(Self.Components[i]).Free;
        end;
     end;
  end;
end;

procedure TFMSysEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSysEmpresa);
end;

procedure TFMSysEmpresas.FormActivate(Sender: TObject);
begin
  inherited;
  TSFacturaElectronica.TabVisible := (REntorno.Pais = 'CHL');
end;

procedure TFMSysEmpresas.TbuttCompClick(Sender: TObject);
begin
  FMain.MuestraInfoTercero(StrToIntDef(EFTercero.Text, 0));
end;

procedure TFMSysEmpresas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMSysEmpresa.BusquedaCompleja;
  Continua := False;
end;

procedure TFMSysEmpresas.AATerceroExecute(Sender: TObject);
begin
  if PEdit.Enabled then
  begin
     if EFTercero.Text <> '' then
        FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + EFTercero.Text);
  end
  else
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' +
        IntToStr(DMSysEmpresa.QMSysEmpresasTERCERO.AsInteger));
end;

procedure TFMSysEmpresas.SBATerceroDblClick(Sender: TObject);
begin
  AATercero.Execute;
end;

procedure TFMSysEmpresas.HabilitaEnlaces;
begin
  if (FMain.ATerceros.Enabled = False) then
  begin
     SBATercero.Width := 0;
     MIVerDatosTercero.Visible := False;
     MISepEnlaces.Visible := False;
     DBETextTercero.Color := clInfoBk;
     TbuttComp.Visible := False;
     TSepTerc.Visible := False;
  end
  else
  begin
     SolapaControles(SBATercero, DBETextTercero);
     DBETextTercero.Color := REntorno.ColorEnlaceActivo;
     TbuttComp.Visible := True;
     TSepTerc.Visible := True;
  end;
end;

procedure TFMSysEmpresas.DBETextTerceroEnter(Sender: TObject);
begin
  if EFTercero.CanFocus then
     EFTercero.SetFocus;
end;

procedure TFMSysEmpresas.ARegeneraExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMSysEmpresa.AjustaAuxiliaresDeEmpresa;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMSysEmpresas.AActivacionECSExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMSysEmpresa.ActivarEmpresa;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMSysEmpresas.AAbrirEmpresaExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMSysEmpresa.AbrirEmpresa(1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMSysEmpresas.ACerrarEmpresaExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMSysEmpresa.AbrirEmpresa(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMSysEmpresas.AAltaEjercicioExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMSysEmpresa.AltaDeEjercicios;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMSysEmpresas.AEliminaEmpresaExecute(Sender: TObject);
begin
  if StrToInt(DBEEmpresa.Text) = REntorno.Empresa then
     ShowMessage(_('ATENCION:  ¡¡¡ No es posible borrar la empresa abierta !!!'))
  else if Confirma then
     if ConfirmaGrave then
     begin
        try
           Screen.Cursor := crHourGlass;
           DMSysEmpresa.LimpiaEmpTodo;
        finally
           Screen.Cursor := crDefault;
        end;
     end;
end;

procedure TFMSysEmpresas.DBEFImagenChange(Sender: TObject);
begin
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMSysEmpresas.DBEFImagenFondoChange(Sender: TObject);
begin
  inherited;
  // DMMain.RefrescarImagen(ImagenFondo, StrToIntDef(DBEFImagenFondo.Text, 0));
  ETituloImagenFondo.Text := DameTituloImagen(StrToIntDef(DBEFImagenFondo.Text, 0));
end;

procedure TFMSysEmpresas.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMSysEmpresa.QMSysEmpresasE_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMSysEmpresas.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMSysEmpresa.QMSysEmpresasE_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMSysEmpresas.BCargarImagenFondoClick(Sender: TObject);
begin
  inherited;
  DMSysEmpresa.QMSysEmpresasF_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMSysEmpresas.BClipboardImagenFondoClick(Sender: TObject);
begin
  inherited;
  DMSysEmpresa.QMSysEmpresasF_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMSysEmpresas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
  BCargarImagenFondo.Visible := (Button in [nbInsert, nbEdit]);
  BClipboardImagenFondo.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMSysEmpresas.AAdjuntoEmpresaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('EMP', DMSysEmpresa.QMSysEmpresasEMPRESA.AsInteger);
end;

procedure TFMSysEmpresas.LstVariablesDblClick(Sender: TObject);
var
  Variable : string;
  st, sl : integer;
begin
  inherited;
  Variable := Trim(LstVariables.Items[LstVariables.ItemIndex]);

  with TCustomEdit(ComponenteFoco) do
  begin
     st := SelStart;
     sl := SelLength;

     if CanFocus then
        SetFocus;

     Text :=
        // copy the text before the caret
        Copy(Text, 1, st) +
        // then add your string
        Variable +
        // and now add the text from the memo that cames after the caret
        // Note: if you did have selected text, this text will be replaced, in other words, we copy here the text from the memo that cames after the selection
        Copy(Text, st + sl + 1, Length(Text));

     // clear text selection
     SelLength := 0;
     // set the caret after the inserted string
     SelStart := st + Length(Variable);
  end;
end;

procedure TFMSysEmpresas.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('EMP', DMSysEmpresa.QMSysEmpresasEMPRESA.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoEmpresa.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMSysEmpresas.ComponenteFocoEnter(Sender: TObject);
begin
  inherited;
  ComponenteFoco := TCustomEdit(Sender);
end;

procedure TFMSysEmpresas.DBETipoConfigChange(Sender: TObject);
begin
  inherited;
  // *******************************************
  // Ver tambien UUtiles.InicializaVariableEmail
  // *******************************************
  if (DBETipoConfig.Text = 'OFC') then
     ETipoConfig.Text := _('Oferta');
  if (DBETipoConfig.Text = 'PRF') then
     ETipoConfig.Text := _('Proforma');
  if (DBETipoConfig.Text = 'PEC') then
     ETipoConfig.Text := _('Pedido');
  if (DBETipoConfig.Text = 'ALB') then
     ETipoConfig.Text := _('Albaran');
  if (DBETipoConfig.Text = 'FAC') then
     ETipoConfig.Text := _('Factura');
  if (DBETipoConfig.Text = 'OFP') then
     ETipoConfig.Text := _('Propuesta a Proveedor');
  if (DBETipoConfig.Text = 'OCP') then
     ETipoConfig.Text := _('Propuesta Confirmada');
  if (DBETipoConfig.Text = 'PEP') then
     ETipoConfig.Text := _('Pedido a Proveedor');
  if (DBETipoConfig.Text = 'RPP') then
     ETipoConfig.Text := _('Recordatorio Pedido a Proveedor');
  if (DBETipoConfig.Text = 'ALP') then
     ETipoConfig.Text := _('Albaran de Proveedor');
  if (DBETipoConfig.Text = 'FAP') then
     ETipoConfig.Text := _('Factura de Proveedor');
  if (DBETipoConfig.Text = 'FCR') then
     ETipoConfig.Text := _('Factura de Acreedor');
  if (DBETipoConfig.Text = 'PKL') then
     ETipoConfig.Text := _('Packing List');
  if (DBETipoConfig.Text = 'TIC') then
     ETipoConfig.Text := _('Ticket');
  if (DBETipoConfig.Text = '347') then
     ETipoConfig.Text := _('Carta 347');
  if (DBETipoConfig.Text = 'CRE') then
     ETipoConfig.Text := _('Carta Reclamacion');
  if (DBETipoConfig.Text = 'DTE') then
     ETipoConfig.Text := _('Documento Electronico');
end;

procedure TFMSysEmpresas.DBEServCorreoChange(Sender: TObject);
begin
  inherited;
  if StrToIntDef(DBEServCorreo.Text, 0) = 0 then
     EServCorreoTitulo.Text := _('Segun configuracion de usuario')
  else
     EServCorreoTitulo.Text := DameTituloServConfCorreo(StrToIntDef(DBEServCorreo.Text, 0));
end;

end.
