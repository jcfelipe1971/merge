unit UFMAsistenteEjercicio;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, TFlatCheckBoxUnit;

type
  TFMAsistenteEjercicio = class(TG2KForm)
     PCMain: TLFPageControl;
     ButtCancel: TButton;
     ButtAnt: TButton;
     ButtNext: TButton;
     TVMain: TTreeView;
     TSSeleccion: TTabSheet;
     LSeleccionModo: TLFLabel;
     RGEjercicio: TRadioGroup;
     TSSeleccionEjercicio: TTabSheet;
     TSTraspasos: TTabSheet;
     TSCreacion: TTabSheet;
     LSeleccionEjercicio: TLFLabel;
     LTraspasos: TLFLabel;
     LCreacionNuevoEjercicio: TLFLabel;
     RGTraspasos: TRadioGroup;
     GBEjercicio: TGroupBox;
     LEjercicio: TLFLabel;
     UPEjercicio: TUpDown;
     LFEDEjercicio: TLFEdit;
     ButtCrear: TButton;
     GBInformacion: TGroupBox;
     LBLInformacion: TLFLabel;
     ANITempo: TAnimate;
     MEMInfo: TLFMemo;
     CBContAnalitica: TLFCheckBox;
     PNLBotones: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure ButtAntClick(Sender: TObject);
     procedure ButtNextClick(Sender: TObject);
     procedure TVMainCollapsed(Sender: TObject; Node: TTreeNode);
     procedure TVMainChange(Sender: TObject; Node: TTreeNode);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButtCancelClick(Sender: TObject);
     procedure ButtCrearClick(Sender: TObject);
     procedure RGTraspasosClick(Sender: TObject);
  private
     { Private declarations }
     TabIndice: integer;
     OldTabIndice: integer;
     cambiar: boolean;
     MueveTreeAbierto: boolean;
     procedure InicializaVariables;
     procedure ActivarTS(Index: integer);
     procedure MueveTab(Valor: integer);
     procedure MueveTabTree(Index: integer);
     procedure ActivarTree(Index: integer);
     procedure ControlaBotones(Index: integer);
     function CheckTab(Index: integer): boolean;
     function CheckEjercicio: boolean;
     function CheckEjercicioSiguiente: boolean;
  public
     { Public declarations }
  end;

var
  FMAsistenteEjercicio : TFMAsistenteEjercicio;

implementation

uses UDMMain, UEntorno, UDMAsistenteEjercicio, UFMain;

{$R *.dfm}

procedure TFMAsistenteEjercicio.FormCreate(Sender: TObject);
var
  contAnalitica : boolean;
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAsistenteEjercicio, DMAsistenteEjercicio);
  InicializaVariables;

  // DesActivamos la contabilidad Analitica si el usuario no puede acceder a ella
  contAnalitica := DMMain.PuedeHacerImputaciones;
  CBContAnalitica.Visible := contAnalitica;
end;

procedure TFMAsistenteEjercicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteEjercicio);
  Action := caFree;
  FMAsistenteEjercicio := nil;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteEjercicio.InicializaVariables;
begin
  // Expandir nodo
  TVMain.Items[0].Expanded := True;
  TabIndice := 0;
  OldTabIndice := 0;
  ActivarTS(0);
  ActivarTree(0);
  MueveTreeAbierto := False; // -> No dejo que se mueva de mas de uno en uno

  // Especificas al asistente

  RGEjercicio.ItemIndex := 0;
  RGTraspasos.ItemIndex := 0;
  UPEjercicio.Position := REntorno.Ejercicio + 1;
  GBInformacion.Visible := False;
end;

procedure TFMAsistenteEjercicio.ActivarTS(Index: integer);
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

procedure TFMAsistenteEjercicio.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteEjercicio.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteEjercicio.MueveTab(Valor: integer);
begin
  cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Condiciones

  if (TabIndice = 1) and (RGEjercicio.ItemIndex = 0) then
     if Valor < 0 then
        TabIndice := 0
     else
        TabIndice := 2;

  // Control Maxima Pestaña

  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin  // Proceso de cambio real
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

procedure TFMAsistenteEjercicio.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteEjercicio.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteEjercicio.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteEjercicio.ControlaBotones(Index: integer);
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

procedure TFMAsistenteEjercicio.MueveTabTree(Index: integer);
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

function TFMAsistenteEjercicio.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckEjercicioSiguiente;
     1: Result := CheckEjercicio;

     else
        Result := True;
  end;
end;

procedure TFMAsistenteEjercicio.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

{ PROCEDIMIENTOS ESPECIFICOS PARA ESTE ASISTENTE }

function TFMAsistenteEjercicio.CheckEjercicio: boolean;
begin
  Result := DMAsistenteEjercicio.CheckEjercicio(StrToInt(LFEDEjercicio.Text));
  if not (Result) then
     Application.MessageBox(PChar(string(_('El Ejercicio seleccionado ya existe.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_yesno);
end;

function TFMAsistenteEjercicio.CheckEjercicioSiguiente: boolean;
begin
  if RGEjercicio.ItemIndex = 0 then
  begin
     Result := DMAsistenteEjercicio.CheckEjercicio(REntorno.Ejercicio + 1);
     if not (Result) then
        Application.MessageBox(PChar(string(_('El Ejercicio seleccionado ya existe.'))),
           PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_yesno);
  end
  else
     Result := True;
end;

procedure TFMAsistenteEjercicio.ButtCrearClick(Sender: TObject);
var
  EjercicioCrear : smallint;
  EjercicioTrasp : smallint;
  modo : integer; // 4095=Sin Contabilidad Ana. ; 8191=Con Contabilidad Ana.
begin
  try
     // Inicializando
     GBInformacion.Visible := True;
     LBLInformacion.Caption := _('Inicializando Proceso...');
     AniTempo.Visible := True;
     AniTempo.Active := True;
     Application.ProcessMessages;
     Screen.Cursor := crHourGlass;

     // Eleccion del modo: con contabilidad ana. o sin ella
     if (CBContAnalitica.Checked) then
        modo := 8191
     else
        modo := 4095;

     // Buscando Ejercicio a Crear
     if (RGEjercicio.ItemIndex = 1) then
        EjercicioCrear := StrToInt(LFEDEjercicio.Text)
     else
     begin
        EjercicioCrear := DMAsistenteEjercicio.DameMaxEjercicio(REntorno.Empresa) + 1;
     end;

     with DMAsistenteEjercicio do
     begin
        // Creando Ejercicio
        LBLInformacion.Caption := _('Creando Ejercicio...');
        Application.ProcessMessages;

        with QCreaEjercicio do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := EjercicioCrear;
           ExecQuery;
           FreeHandle;
        end;

        if (RGTraspasos.ItemIndex = 0) then
        begin
           // Traspaso de cuentas
           EjercicioTrasp := DameMaxEjercicioContable(REntorno.Empresa, EjercicioCrear);

           if (EjercicioTrasp = 0) then
           begin
              Application.MessageBox(PChar(string(_('No existe ningun ejercicio activo para realizar traspasos'))),
                 PChar(string(_('Error'))), mb_iconstop);
              raise Exception.Create('Error!!');
           end;

           LBLInformacion.Caption := _('Traspasando Cuentas Contables...');
           Application.ProcessMessages;
           TraspasaCuentas(REntorno.Empresa, EjercicioTrasp, EjercicioCrear, modo);

           // Traspasa Condiciones
           LBLInformacion.Caption := _('Traspasando Condiciones...');
           Application.ProcessMessages;
           TraspasaCondiciones(REntorno.Empresa, EjercicioTrasp, EjercicioCrear);

           // Traspasa Promociones
           LBLInformacion.Caption := _('Traspasando Promociones...');
           Application.ProcessMessages;
           TraspasaPromociones(REntorno.Empresa, EjercicioTrasp, EjercicioCrear);

           // Traspasa Listados
           LBLInformacion.Caption := _('Traspasando Listados...');
           Application.ProcessMessages;
           TraspasaListados(REntorno.Empresa, EjercicioTrasp, EjercicioCrear);

           // Traspasa Perfiles
           LBLInformacion.Caption := _('Traspasando Restricciones...');
           Application.ProcessMessages;
           TraspasaPerfiles(REntorno.Empresa, EjercicioTrasp, EjercicioCrear);

           // Traspasa Tarifas de Proveedor
           LBLInformacion.Caption := _('Traspasando Tarifas de Proveedor...');
           Application.ProcessMessages;
           TraspasaTarifasProv(REntorno.Empresa, EjercicioTrasp, EjercicioCrear);

           // Traspasa Campanyas
           LBLInformacion.Caption := _('Traspasando Campañas...');
           Application.ProcessMessages;
           TraspasaCampanyas(REntorno.Empresa, EjercicioTrasp, EjercicioCrear);

           // Traspasa Genericos
           LBLInformacion.Caption := _('Traspasando Datos Genericos...');
           Application.ProcessMessages;
           TraspasaGenericos(REntorno.Empresa, EjercicioTrasp, EjercicioCrear);

           // Traspasa Precio Coste Articulos
           LBLInformacion.Caption := _('Traspasando Precios de Coste...');
           Application.ProcessMessages;
           TraspasaPrecioCosteKri(REntorno.Empresa, EjercicioTrasp, EjercicioCrear);
        end;

        TLocal.Commit;
        LBLInformacion.Caption := _('Proceso finalizado con éxito.');
        Screen.Cursor := crDefault;
        AniTempo.Visible := False;
        AniTempo.Active := False;
        Application.ProcessMessages;
        ShowMessage(_('El Nuevo Ejercicio ha sido creado con éxito.'));
        FMain.ConstruyeBotonMultiEjercicio;
        Close;
     end;
  except
     on E: Exception do
     begin
        Screen.Cursor := crDefault;
        AniTempo.Visible := False;
        AniTempo.Active := False;
        DMAsistenteEjercicio.TLocal.Rollback;
        raise Exception.Create(_('Se ha producido un error creando el Nuevo Ejercicio.') + E.Message);
        Close;
     end;
  end;
end;

procedure TFMAsistenteEjercicio.RGTraspasosClick(Sender: TObject);
begin
  if (RGTraspasos.ItemIndex = 0) then //Con Traspasos
     CBContAnalitica.Enabled := True
  else                                //Sin traspasos
  begin
     CBContAnalitica.Checked := False;
     CBContAnalitica.Enabled := False;
  end;
end;

end.
