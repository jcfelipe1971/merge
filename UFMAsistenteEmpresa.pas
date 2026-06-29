unit UFMAsistenteEmpresa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB,
  ULFMemo, TFlatCheckBoxUnit, ULFPanel, ULFDBEditFind2000, ULFLabel, ULFDateEdit;

type
  TFMAsistenteEmpresa = class(TG2KForm)
     PCMain: TLFPageControl;
     TSTipo: TTabSheet;
     ButtCancel: TButton;
     ButtAnt: TButton;
     ButtNext: TButton;
     LTipoCreacion: TLFLabel;
     TVMain: TTreeView;
     RGCreacion: TRadioGroup;
     TSSeleccionModelo: TTabSheet;
     LSeleccionModelo: TLFLabel;
     TSGenericos: TTabSheet;
     TSConfiguracion: TTabSheet;
     LConfiguracion: TLFLabel;
     LDatosGenericos: TLFLabel;
     GBAvanzados: TGroupBox;
     RGEjercicios: TRadioGroup;
     CBClienteAuto: TLFCheckBox;
     CBPMP: TLFCheckBox;
     CBBloqueaEjercicio: TLFCheckBox;
     CBListarPedidos: TLFCheckBox;
     CBFecCompras: TLFCheckBox;
     CBFecVentas: TLFCheckBox;
     TSEstructura: TTabSheet;
     LEstructuraContable: TLFLabel;
     GBModelo: TGroupBox;
     OPDImagen: TOpenPictureDialog;
     TWMapa: TTreeView;
     GBEstructura: TGroupBox;
     LNumeroDigitos: TLFLabel;
     UPDigitos: TUpDown;
     LFEDTDigitos: TLFEdit;
     LFCBCreaEstructura: TLFCheckBox;
     TSCreacion: TTabSheet;
     LCreacionEmpresa: TLFLabel;
     MEMInfo: TLFMemo;
     ButtCrear: TButton;
     GBInformacion: TGroupBox;
     LBLInformacion: TLFLabel;
     ANITempo: TAnimate;
     CBCierreDoc: TLFCheckBox;
     GBGenericos: TGroupBox;
     LNombreEmpresa: TLFLabel;
     LMoneda: TLFLabel;
     LModoIVA: TLFLabel;
     LTercero: TLFLabel;
     LFechaApertura: TLFLabel;
     LSerieAutofactura: TLFLabel;
     LFLRegMerc: TLFLabel;
     LFLMail: TLFLabel;
     LFEFTercero: TLFEditFind2000;
     DTEFechaApertura: TLFDateEdit;
     LFEFModo: TLFEditFind2000;
     LFEFMoneda: TLFEditFind2000;
     LFEDTitEmpresa: TLFEdit;
     LFDBEFTitTercero: TLFDbedit;
     LFDBETitMoneda: TLFDbedit;
     LFDBETitModoIVA: TLFDbedit;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     LFEFSerieAut: TLFEditFind2000;
     LFDTitSerieAut: TLFDbedit;
     LFMRegMerc: TLFMemo;
     LFEDirEnvio: TLFEdit;
     LBLImagen: TLFLabel;
     DBEFImagen: TLFEditFind2000;
     ETituloImagen: TLFEdit;
     PNLBotones: TLFPanel;
     BCargarImagen: TButton;
     BClipboard: TButton;
     CBProveedorAuto: TLFCheckBox;
     CBAcreedorAuto: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure ButtAntClick(Sender: TObject);
     procedure ButtNextClick(Sender: TObject);
     procedure TVMainCollapsed(Sender: TObject; Node: TTreeNode);
     procedure TVMainChange(Sender: TObject; Node: TTreeNode);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFEFTerceroChange(Sender: TObject);
     procedure LFEFMonedaChange(Sender: TObject);
     procedure LFEFModoChange(Sender: TObject);
     procedure ButtCancelClick(Sender: TObject);
     procedure ButtCrearClick(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure LFEFSerieAutChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
  private
     { Private declarations }
     TabIndice: integer;
     OldTabIndice: integer;
     cambiar: boolean;
     MueveTreeAbierto: boolean;
     EmpOrigen: smallint; // Empresa Origen de Copia
     procedure InicializaVariables;
     procedure ActivarTS(Index: integer);
     procedure MueveTab(Valor: integer);
     procedure MueveTabTree(Index: integer);
     procedure ActivarTree(Index: integer);
     procedure ControlaBotones(Index: integer);
     function CheckTab(Index: integer): boolean;
     // Ajenas al motor
     procedure RellenaMapa;
     procedure RellenaEmp(Nodo: TTreeNode);
     procedure RellenaEje(Nodo: TTreeNode; Empresa: smallint);
     procedure RellenaCan(Nodo: TTreeNode; Empresa, Ejercicio: smallint);
     procedure RellenaSer(Nodo: TTreeNode; Empresa, Ejercicio, Canal: smallint);
     function CheckGenericos: boolean;
     function CheckSeleccionEmpresa: boolean;
     function CheckTipo: boolean;
     procedure CreaContabilidadSimple(Empresa: smallint);
     procedure CreaCopiaEmpresa(Origen, Destino: smallint);
  public
     { Public declarations }
  end;

var
  FMAsistenteEmpresa : TFMAsistenteEmpresa;

implementation

uses UDMMain, UDMAsistenteEmpresa, UEntorno, HYFIBQuery, UUtiles, UDameDato, UImagenes;

{$R *.dfm}

procedure TFMAsistenteEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMAsistenteEmpresa, DMAsistenteEmpresa);
  InicializaVariables;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteEmpresa.InicializaVariables;
begin
  // Expandir nodo
  TVMain.Items[0].Expanded := True;
  TabIndice := 0;
  OldTabIndice := 0;
  ActivarTS(0);
  ActivarTree(0);
  MueveTreeAbierto := False; // -> No dejo que se mueva de mas de uno en uno

  // Especificos al Asistente;
  RGCreacion.ItemIndex := 0;
  RGEjercicios.ItemIndex := 0;
  UPDigitos.Position := 9;
  RellenaMapa;
  TWMapa.Items[0].Item[0].Selected := True;
  DTEFechaApertura.Date := REntorno.FechaTrab;
  GBInformacion.Visible := False;
  AniTempo.Visible := False;
  AniTempo.Active := False;
end;

procedure TFMAsistenteEmpresa.ActivarTS(Index: integer);
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
     if Self.Components[i] is TTabSheet then
        if TTabSheet(Self.Components[i]).PageIndex = Index then
        begin
           PCMain.ActivePageIndex := Index;
           TTabSheet(Self.Components[i]).Visible := True;
        end
        else
           TTabSheet(Self.Components[i]).Visible := False;
end;

procedure TFMAsistenteEmpresa.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteEmpresa.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteEmpresa.MueveTab(Valor: integer);
begin
  cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Condiciones
  if (TabIndice = 1) and (RGCreacion.ItemIndex = 0) then
     if Valor < 0 then
        TabIndice := 0
     else
        TabIndice := 2;

  if (TabIndice = 4) and (RGCreacion.ItemIndex = 1) then
     if Valor < 0 then
        TabIndice := 3
     else
        TabIndice := 5;

  // Control Maxima Pestaña
  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin // Proceso de cambio real
     if (Valor > 0) then
        if not (CheckTab(OldTabIndice)) then
           TabIndice := OldTabIndice;
     cambiar := True;
     ActivarTS(TabIndice);
     ActivarTree(TabIndice);
     cambiar := False;
  end;

  ControlaBotones(TabIndice);
end;

procedure TFMAsistenteEmpresa.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteEmpresa.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteEmpresa.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteEmpresa.ControlaBotones(Index: integer);
begin
  if (TabIndice = 0) then
     ButtAnt.Enabled := False
  else
     ButtAnt.Enabled := True;

  if (TabIndice = PCMain.PageCount - 1) then
     ButtNext.Enabled := False
  else
     ButtNext.Enabled := True;
end;

procedure TFMAsistenteEmpresa.MueveTabTree(Index: integer);
begin
  if not (cambiar) then
  begin
     if MueveTreeAbierto then
        MueveTab(Index - TabIndice)
     else
     begin
        if (Index > TabIndice) then
           MueveTab(1);
        if (Index < TabIndice) then
           MueveTab(-1);
     end;
  end;
end;

function TFMAsistenteEmpresa.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckTipo;
     1: Result := CheckSeleccionEmpresa;
     2: Result := CheckGenericos;
     else
        Result := True;
  end;
end;

{ PROCEDIMIENTOS ESPECIFICOS PARA ESTE ASISTENTE }
procedure TFMAsistenteEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeMem(TWMapa.Items[0].Data);
  CierraData(DMAsistenteEmpresa);
  Action := caFree;
  FMAsistenteEmpresa := nil;
end;

procedure TFMAsistenteEmpresa.LFEFTerceroChange(Sender: TObject);
begin
  if LFEFTercero.Text <> '' then
     DMAsistenteEmpresa.FiltraTercero(StrToInt(LFEFTercero.Text));
end;

procedure TFMAsistenteEmpresa.LFEFMonedaChange(Sender: TObject);
begin
  if (LFEFMoneda.Text <> '') then
     DMAsistenteEmpresa.FiltraMoneda(LFEFMoneda.Text);
end;

procedure TFMAsistenteEmpresa.LFEFModoChange(Sender: TObject);
begin
  if (LFEFModo.Text <> '') then
     DMAsistenteEmpresa.FiltraModoIVA(StrToInt(LFEFModo.Text));
end;

procedure TFMAsistenteEmpresa.RellenaMapa;
var
  Nodo : TTreeNode;
begin
  Nodo := TWMapa.Items.Add(nil, _('Empresas'));
  Nodo.ImageIndex := 17;
  Nodo.SelectedIndex := 4;
  Nodo.Data := Pointer(0);

  RellenaEmp(Nodo);
end;

procedure TFMAsistenteEmpresa.RellenaEmp(Nodo: TTreeNode);
var
  NodoLoc : TTreeNode;
  Codigo : smallint;
  Titulo : string;
begin
  with DMAsistenteEmpresa.QTreeEmpresas do
  begin
     Close;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['Empresa'].AsInteger;
        Titulo := _('Empresa') + ' ' + IntToStr(Codigo) + ' - ' + FieldByName['Titulo'].AsString;
        NodoLoc := TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 17;
        NodoLoc.SelectedIndex := 4;
        NodoLoc.Data := Pointer(Codigo);

        RellenaEje(NodoLOc, Codigo);
        Next;
     end;
     Close;
  end;
end;

procedure TFMAsistenteEmpresa.RellenaEje(Nodo: TTreeNode; Empresa: smallint);
var
  NodoLoc : TTreeNode;
  Codigo : smallint;
  Titulo : string;
begin
  with DMAsistenteEmpresa.QTreeEjercicios do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := Empresa;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['Ejercicio'].AsInteger;
        Titulo := _('Ejercicio') + ' ' + FieldByName['Ejercicio'].AsString;
        NodoLoc := TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 50;
        NodoLoc.SelectedIndex := 4;
        NodoLoc.Data := Pointer(0);

        RellenaCan(NodoLoc, Empresa, Codigo);
        Next;
     end;
     Close;
  end;
end;

procedure TFMAsistenteEmpresa.RellenaCan(Nodo: TTreeNode; Empresa, Ejercicio: smallint);
var
  NodoLoc : TTreeNode;
  Codigo : smallint;
  Titulo : string;
begin
  with DMAsistenteEmpresa.QTreeCanales do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := Empresa;
     Params.ByName['Ejercicio'].AsInteger := Ejercicio;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['Canal'].AsInteger;
        Titulo := _('Canal') + ' ' + IntToStr(Codigo) + ' - ' + FieldByName['Titulo'].AsString;
        NodoLoc := TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 132;
        NodoLoc.SelectedIndex := 4;
        NodoLoc.Data := Pointer(0);
        RellenaSer(NodoLoc, Empresa, Ejercicio, Codigo);
        Next;
     end;
     Close;
  end;
end;

procedure TFMAsistenteEmpresa.RellenaSer(Nodo: TTreeNode; Empresa, Ejercicio, Canal: smallint);
var
  NodoLoc : TTreeNode;
  Codigo : string;
  Titulo : string;
begin
  with DMAsistenteEmpresa.QTreeSeries do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := Empresa;
     Params.ByName['Ejercicio'].AsInteger := Ejercicio;
     Params.ByName['Canal'].AsInteger := Canal;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['Serie'].AsString;
        Titulo := _('Serie') + ' ' + Codigo + ' - ' + FieldByName['Titulo'].AsString;
        NodoLoc := TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 115;
        NodoLoc.SelectedIndex := 4;
        NodoLoc.Data := Pointer(0);

        Next;
     end;
     Close;
  end;
end;

procedure TFMAsistenteEmpresa.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

function TFMAsistenteEmpresa.CheckGenericos: boolean;
begin
  Result := False;

  if LFEDTitEmpresa.Text <= '' then
  begin
     Application.MessageBox(PChar(string(_('La Empresa no tiene Título.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_yesno);
     Exit;
  end;

  if LFEFTercero.Text <= '' then
  begin
     Application.MessageBox(PChar(string(_('La Empresa no tiene Tercero asociado.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_yesno);
     Exit;
  end;

  if LFEFModo.Text <= '' then
  begin
     Application.MessageBox(PChar(string(_('La Empresa no tiene Modo de IVA asociado.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_yesno);
     Exit;
  end;

  if LFEFMoneda.Text <= '' then
  begin
     Application.MessageBox(PChar(string(_('La Empresa no tiene Moneda asociada.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_yesno);
     Exit;
  end;

  if DBEFImagen.Text <= '' then
     DBEFImagen.Text := '0';

  Result := True;
end;

function TFMAsistenteEmpresa.CheckSeleccionEmpresa: boolean;
var
  NodeTemp : TTreeNode;
begin
  // Control de que un Nodo de Empresa este activo
  Result := False;
  NodeTemp := TWMapa.Selected;

  if (smallint(NodeTemp.Data) = 0) then
     Application.MessageBox(PChar(string(_('Debe de seleccionar una Empresa.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_yesno)
  else
  begin
     EmpOrigen := smallint(NodeTemp.Data);
     // Rellenamos los datos de la empresa seleccionada
     with DMAsistenteEmpresa do
     begin
        xDatosEmpresa.Close;
        xDatosEmpresa.Params.ByName['EMPRESA'].AsInteger := EmpOrigen;
        xDatosEmpresa.Open;
        LFEFTercero.Text := IntToStr(xDatosEmpresaTERCERO.AsInteger);
        LFEFMoneda.Text := xDatosEmpresaMONEDA.AsString;
        LFEFModo.Text := IntToStr(xDatosEmpresaMODO_IVA.AsInteger);
        DBEFImagen.Text := IntToStr(xDatosEmpresaE_IMAGEN.AsInteger);
        RGEjercicios.ItemIndex := xDatosEmpresaDURACION.AsInteger - 1;
        CBClienteAuto.Checked := xDatosEmpresaCLIENTE_AUT.AsInteger = 1;
        CBProveedorAuto.Checked := xDatosEmpresaPROVEEDOR_AUT.AsInteger = 1;
        CBAcreedorAuto.Checked := xDatosEmpresaACREEDOR_AUT.AsInteger = 1;
        CBPMP.Checked := xDatosEmpresaPMP_CERO.AsInteger = 1;
        CBFecVentas.Checked := xDatosEmpresaFECHA_VENTAS.AsInteger = 1;
        CBFecCompras.Checked := xDatosEmpresaFECHA_CONTABILIZACION_COMPRAS.AsInteger = 1;
        CBBloqueaEjercicio.Checked := xDatosEmpresaCIERRE_CONTABLE.AsInteger = 1;
        CBListarPedidos.Checked := xDatosEmpresaLISTAR_PEDIDOS.AsInteger = 1;
        CBCierreDoc.Checked := xDatosEmpresaCIERRA_DOC_CERO.AsInteger = 1;
        LFEDirEnvio.Text := xDatosEmpresaE_MAIL.AsString;
        LFEFSerieAut.Text := xDatosEmpresaSERIE_AUTOFAC.AsString;
        LFMRegMerc.Text := xDatosEmpresaREG_MERCANTIL.AsString;

        Result := True;
     end;
  end;
end;

function TFMAsistenteEmpresa.CheckTipo: boolean;
var
  tercero : integer;
begin
  Result := True; // Siempre solo es para rellenar datos defecto

  if (RGCreacion.ItemIndex = 0) then
  begin
     // Genericos
     Tercero := DMMain.MinTercero;
     LFEFTercero.Text := IntToStr(Tercero);
     LFEFModo.Text := '1';
     LFEFMoneda.Text := 'EUR';
     DBEFImagen.Text := '0';

     LFEFSerieAut.Text := REntorno.Serie;

     RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));

     // Configuracion
     RGEjercicios.ItemIndex := 0;
     CBClienteAuto.Checked := True;
     CBProveedorAuto.Checked := True;
     CBAcreedorAuto.Checked := True;
     CBPMP.Checked := False;
     CBBloqueaEjercicio.Checked := False;
     CBListarPedidos.Checked := False;
     CBFecCompras.Checked := False;
     CBFecVentas.Checked := False;
     CBCierreDoc.Checked := False;
  end;
end;

procedure TFMAsistenteEmpresa.ButtCrearClick(Sender: TObject);
begin
  // Todo dentro de un try. Si falla, todo para atras.
  try
     GBInformacion.Visible := True;
     LBLInformacion.Caption := _('Inicializando Proceso...');
     AniTempo.Visible := True;
     AniTempo.Active := True;
     Application.ProcessMessages;
     Screen.Cursor := crHourGlass;
     // Inserta la empresa
     with DMAsistenteEmpresa do
     begin
        if not (TLocal.InTransaction) then
           TLocal.StartTransaction;

        QMCreaEmpresa.Open;
        QMCreaEmpresa.Insert;
        DMMain.Contador_GEN(DMAsistenteEmpresa.QMCreaEmpresa, 'Conta_empresas', 'Empresa');
        QMCreaEmpresaTITULO.AsString := LFEDTitEmpresa.Text;
        QMCreaEmpresaTERCERO.AsInteger := StrToInt(LFEFTercero.Text);
        QMCreaEmpresaFECHA_ALTA.AsDateTime := DTEFechaApertura.Date;
        QMCreaEmpresaAPERTURA.AsDateTime := DTEFechaApertura.Date;
        QMCreaEmpresaDURACION.AsInteger := RGEjercicios.ItemIndex + 1;
        QMCreaEmpresaMONEDA.AsString := LFEFMoneda.Text;
        QMCreaEmpresaMODO_IVA.AsInteger := StrToInt(LFEFModo.Text);
        QMCreaEmpresaSERIE_AUTOFAC.AsString := LFEFSerieAut.Text;
        QMCreaEmpresaE_IMAGEN.AsInteger := StrToIntDef(DBEFImagen.Text, 0);
        QMCreaEmpresaE_MAIL.AsString := LFEDirEnvio.Text;
        QMCreaEmpresaREG_MERCANTIL.AsString := LFMRegMerc.Text;

        QMCreaEmpresaCLIENTE_AUT.AsInteger := BoolToInt(CBClienteAuto.Checked);
        QMCreaEmpresaPROVEEDOR_AUT.AsInteger := BoolToInt(CBProveedorAuto.Checked);
        QMCreaEmpresaACREEDOR_AUT.AsInteger := BoolToInt(CBAcreedorAuto.Checked);

        QMCreaEmpresaPMP_CERO.AsInteger := BoolToInt(CBPMP.Checked);

        QMCreaEmpresaFECHA_CONTABILIZACION_COMPRAS.AsInteger := BoolToInt(CBFecCompras.Checked);

        QMCreaEmpresaCIERRE_CONTABLE.AsInteger := BoolToInt(CBBloqueaEjercicio.Checked);

        QMCreaEmpresaFECHA_VENTAS.AsInteger := BoolToInt(CBFecVentas.Checked);

        QMCreaEmpresaLISTAR_PEDIDOS.AsInteger := BoolToInt(CBListarPedidos.Checked);

        QMCreaEmpresaCIERRA_DOC_CERO.AsInteger := BoolToInt(CBCierreDoc.Checked);

        LBLInformacion.Caption := _('Creando Empresa...');
        QMCreaEmpresa.Post;

        // Regenerar sus Auxiliares
        LBLInformacion.Caption := _('Regenerando Auxiliares Empresa...');
        Application.ProcessMessages;
        with SPEmpAjusta do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := QMCreaEmpresaEMPRESA.AsInteger;
           ExecQuery;
           FreeHandle;
        end;

        // Activar Empresa
        LBLInformacion.Caption := _('Activando Empresa...');
        Application.ProcessMessages;
        with SPActEmpresa do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := QMCreaEmpresaEMPRESA.AsInteger;
           ExecQuery;
           FreeHandle;
        end;

        // Creacion de la contabilidad
        if ((RGCreacion.ItemIndex = 0) and not (LFCBCreaEstructura.Checked)) then
           CreaContabilidadSimple(QMCreaEmpresaEMPRESA.AsInteger);

        if (RGCreacion.ItemIndex = 1) then
           CreaCopiaEmpresa(EmpOrigen, QMCreaEmpresaEMPRESA.AsInteger);

        // Commit fin de Proceso
        TLocal.Commit;
        LBLInformacion.Caption := _('Proceso finalizado con éxito.');
        Screen.Cursor := crDefault;
        AniTempo.Visible := False;
        AniTempo.Active := False;
        Application.ProcessMessages;
        ShowMessage(_('La Empresa ha sido creada con éxito.'));
        Close;
     end;
  except
     // Se ha producido un ERROR
     on e: Exception do
     begin
        Screen.Cursor := crDefault;
        AniTempo.Visible := False;
        AniTempo.Active := False;
        DMAsistenteEmpresa.TLocal.Rollback;
        raise Exception.Create(_('Se ha producido un error creando la Empresa') + #13#10 + e.Message);
        Close;
     end;
  end;
end;

procedure TFMAsistenteEmpresa.CreaContabilidadSimple(Empresa: smallint);
var
  Ejercicio, Canal : smallint;
begin
  LBLInformacion.Caption := _('Grabando Niveles Contables...');
  Application.ProcessMessages;
  DMAsistenteEmpresa.DameEjerCanal(Empresa, Ejercicio, Canal);
  DMAsistenteEmpresa.GrabaNivelesContables(Empresa, Ejercicio, Canal,
     5, StrToInt(LFEDTDigitos.Text));
  LBLInformacion.Caption := _('Creando Estructura Contable...');
  Application.ProcessMessages;
  DMAsistenteEmpresa.CreaEstructuraContable(Empresa, Ejercicio, Canal,
     5, StrToInt(LFEDTDigitos.Text));
end;

procedure TFMAsistenteEmpresa.CreaCopiaEmpresa(Origen, Destino: smallint);
var
  Ejercicio, Canal : smallint;
begin
  LBLInformacion.Caption := _('Copiando Canales y Series de Empresa Origen...');
  Application.ProcessMessages;
  DMAsistenteEmpresa.CopiaCanalSerie(Origen, Destino);
  LBLInformacion.Caption := _('Propagando los datos a la Empresa');
  Application.ProcessMessages;
  DMAsistenteEmpresa.Propaga(Destino);
  DMAsistenteEmpresa.DameEjerCanal(Origen, Ejercicio, Canal);
  LBLInformacion.Caption := _('Creando Niveles Contables...');
  Application.ProcessMessages;
  DMAsistenteEmpresa.CopiaCreaNiveles(Origen, Destino, Ejercicio);
  LBLInformacion.Caption := _('Creando Estructura Contable...');
  Application.ProcessMessages;
  DMAsistenteEmpresa.CopiaCreaEstructura(Destino);

  LBLInformacion.Caption := _('Activando Empresa + Ejercicio + Canal + Serie...');
  Application.ProcessMessages;

  with DMAsistenteEmpresa.SPActEmpresa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Destino;
     ExecQuery;
     FreeHandle;
  end;

  LBLInformacion.Caption := _('Copiando datos genéricos...');
  Application.ProcessMessages;
  DMAsistenteEmpresa.CopiaGenericos(Origen, Destino);
end;

procedure TFMAsistenteEmpresa.DBEFImagenChange(Sender: TObject);
begin
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMAsistenteEmpresa.LFEFSerieAutChange(Sender: TObject);
begin
  if (LFEFSerieAut.Text <> '') then
     DMAsistenteEmpresa.FiltraSerieAut(LFEFSerieAut.Text);
end;

procedure TFMAsistenteEmpresa.BCargarImagenClick(Sender: TObject);
begin
  DBEFImagen.Text := IntToStr(ImportarImagen(''));
end;

procedure TFMAsistenteEmpresa.BClipboardClick(Sender: TObject);
begin
  DBEFImagen.Text := IntToStr(ImportarImagenDesdeClipboard);
end;

end.
