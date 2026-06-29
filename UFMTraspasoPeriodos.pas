unit UFMTraspasoPeriodos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, DbComboBoxValue, UFormGest, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ActnList,
  UEditPanel, Buttons, ULFActionList, ULFToolBar, ULFPageControl, ULFPanel,
  ULFCheckBox, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, rxPlacemnt,
  ULFFormStorage, UFPEditSinNavegador, Menus, UTeclas, UControlEdit;

type
  TFMTraspasoPeriodos = class(TFPEditSinNavegador)
     ALTraspaso: TLFActionList;
     ACerrar: TAction;
     ATraspasar: TAction;
     PCMain: TLFPageControl;
     TBTrasConPeriodos: TTabSheet;
     TSCuentas: TTabSheet;
     PNLCuentas: TLFPanel;
     CBFormasPago: TLFCheckBox;
     CBAcreedores: TLFCheckBox;
     CBAgentes: TLFCheckBox;
     CBProveedores: TLFCheckBox;
     CBFamilias: TLFCheckBox;
     CBArticulos: TLFCheckBox;
     CBClientes: TLFCheckBox;
     CBBancos: TLFCheckBox;
     CBFinancieros: TLFCheckBox;
     CBIva: TLFCheckBox;
     CBIRPF: TLFCheckBox;
     TBCuentas: TLFToolBar;
     PNLTBCuentas: TLFPanel;
     LEjercicioOrigenCuentas: TLFLabel;
     EDTFEjerOrigenCuentas: TLFEditFind2000;
     LEjercicioDestinoCuentas: TLFLabel;
     EDTFEjerDestinoCuentas: TLFEditFind2000;
     TBCuentas2: TLFToolBar;
     TButtTodo: TToolButton;
     ATodo: TAction;
     TButtCanal: TToolButton;
     ACanal: TAction;
     TButtTodoModo: TToolButton;
     TButtCanalModo: TToolButton;
     ATodoModo: TAction;
     ACanalModo: TAction;
     ANITempo: TAnimate;
     AniTempo2: TAnimate;
     TButtCanalCanal: TToolButton;
     TButtCanalCanalModo: TToolButton;
     ACanalCanal: TAction;
     ACanalCanalModo: TAction;
     TSOtrosTraspasos: TTabSheet;
     AListados: TAction;
     AListadosCanalTodos: TAction;
     AListadosCanalCanal: TAction;
     PNLGenericos: TLFPanel;
     LEjercicioOrigenTraspasos: TLFLabel;
     LEjercicioDestinoTraspasos: TLFLabel;
     EDFEjercicioOrigenGenericos: TLFEditFind2000;
     EDFEjercicioDestinoGenericos: TLFEditFind2000;
     PNLGenericos2: TLFPanel;
     GBListados: TGroupBox;
     BtnListadosCanalCanal: TBitBtn;
     BtnListadosCanalTodos: TBitBtn;
     BtnListadosTodosCanal: TBitBtn;
     GBPerfiles: TGroupBox;
     BtnRestriCanalCanal: TBitBtn;
     BtnRestriCanalTodos: TBitBtn;
     BtnRestriTodosCanal: TBitBtn;
     ARestriccion: TAction;
     ARestriccionTodo: TAction;
     ARestriccionCanal: TAction;
     EFEjeOrigen: TLFEditFind2000;
     EFEjeDestino: TLFEditFind2000;
     LBEjercicioOrigen: TLFLabel;
     LBEjercicioDestino: TLFLabel;
     EFCanalOrigen: TLFEditFind2000;
     EFCanalDestino: TLFEditFind2000;
     LBCanalOrigen: TLFLabel;
     LBCanalDestino: TLFLabel;
     BTTraspasar: TBitBtn;
     BTSeleccionarTodo: TBitBtn;
     ASeleccionarTodo: TAction;
     BTLimpiarOpciones: TBitBtn;
     ALimpiarTodo: TAction;
     CBArticulosSerie: TLFCheckBox;
     PNLCondEsp: TLFPanel;
     PNLRestoCond: TLFPanel;
     CBModCond: TLFCheckBox;
     CBCondProArt: TLFCheckBox;
     CBCondProvFam: TLFCheckBox;
     CBCondAgenAgrupFam: TLFCheckBox;
     CBCondAgeAgruArt: TLFCheckBox;
     CBCondAgeCliArt: TLFCheckBox;
     CBCondAgenCliFam: TLFCheckBox;
     CBCondAgenCliComisiones: TLFCheckBox;
     CBCondAgenAgrupComisiones: TLFCheckBox;
     CBCondCliArt: TLFCheckBox;
     CBCondAgrupArt: TLFCheckBox;
     CBCondPerArt: TLFCheckBox;
     CBCondArt: TLFCheckBox;
     CBCondCliFam: TLFCheckBox;
     CBCondAgrupFam: TLFCheckBox;
     CBCondPerFam: TLFCheckBox;
     CBCondFam: TLFCheckBox;
     CBCondAgrup: TLFCheckBox;
     CBCondPerf: TLFCheckBox;
     CBElimCond: TLFCheckBox;
     GBTarifasProveedor: TGroupBox;
     BtnTarProCanalCanal: TBitBtn;
     BtnTarProTodosCanal: TBitBtn;
     BtnTarProCanalTodos: TBitBtn;
     AProveedorCanalCanal: TAction;
     AProveedorCanalTodos: TAction;
     AProveedorTodosCanal: TAction;
     ToolButton1: TToolButton;
     ChkBModCuentas: TLFCheckBox;
     GBCampanyas: TGroupBox;
     ACampanya: TAction;
     BtnCampanyas: TBitBtn;
     TSTraspasoPromo: TTabSheet;
     PNPromociones: TLFPanel;
     BitBtn1: TBitBtn;
     BitBtn2: TBitBtn;
     BitBtn3: TBitBtn;
     LEjercicioOrigenProm: TLFLabel;
     EFOEjercicio: TLFEditFind2000;
     LCanalOrigenProm: TLFLabel;
     EFOcanal: TLFEditFind2000;
     LEjercicioDestinoProm: TLFLabel;
     LCanalDestinoProm: TLFLabel;
     EFDEjercicio: TLFEditFind2000;
     EFDCanal: TLFEditFind2000;
     PnlTraspasoPrompcionesPeriodos: TLFPanel;
     CBPromocionCliArt: TLFCheckBox;
     CBPromocionArticulo: TLFCheckBox;
     CBPromocionFamArt: TLFCheckBox;
     CBPromocionAgrupArt: TLFCheckBox;
     CBPromocionAgrupFam: TLFCheckBox;
     CBBorrar: TLFCheckBox;
     CBPromocionCliFam: TLFCheckBox;
     ATraspasoPromo: TAction;
     ASeleccionarPromo: TAction;
     ALimpiaPromo: TAction;
     AniTempo3: TAnimate;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     CBContabilidadAnalitica: TLFCheckBox;
     GBPrecioCosteKri: TGroupBox;
     APrecioCosteKri: TAction;
     BtnPrecioCosteKri: TBitBtn;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ACerrarExecute(Sender: TObject);
     procedure ATraspasarExecute(Sender: TObject);
     procedure ATodoExecute(Sender: TObject);
     procedure ACanalExecute(Sender: TObject);
     procedure ATodoModoExecute(Sender: TObject);
     procedure ACanalModoExecute(Sender: TObject);
     procedure ACanalCanalExecute(Sender: TObject);
     procedure ACanalCanalModoExecute(Sender: TObject);
     procedure AListadosExecute(Sender: TObject);
     procedure AListadosCanalTodosExecute(Sender: TObject);
     procedure AListadosCanalCanalExecute(Sender: TObject);
     procedure ARestriccionExecute(Sender: TObject);
     procedure ARestriccionTodoExecute(Sender: TObject);
     procedure ARestriccionCanalExecute(Sender: TObject);
     procedure EFCanalOrigenBusqueda(Sender: TObject);
     procedure EFEjeOrigenExit(Sender: TObject);
     procedure EFEjeDestinoExit(Sender: TObject);
     procedure ASeleccionarTodoExecute(Sender: TObject);
     procedure ALimpiarTodoExecute(Sender: TObject);
     procedure AProveedorCanalCanalExecute(Sender: TObject);
     procedure AProveedorCanalTodosExecute(Sender: TObject);
     procedure AProveedorTodosCanalExecute(Sender: TObject);
     procedure ACampanyaExecute(Sender: TObject);
     procedure ASeleccionarPromoExecute(Sender: TObject);
     procedure ALimpiaPromoExecute(Sender: TObject);
     procedure ATraspasoPromoExecute(Sender: TObject);
     procedure EFOEjercicioExit(Sender: TObject);
     procedure EFDEjercicioExit(Sender: TObject);
     procedure EFOcanalBusqueda(Sender: TObject);
     procedure APrecioCosteKriExecute(Sender: TObject);
  private
     { Private declarations }
     procedure LimpiaFormulario;
     procedure LimpiaFormularioPromo;
     procedure Animacion(Activo: boolean);
  public
     { Public declarations }
     procedure MuestraErrorEjercicio;
     function CheckModo: integer;
  end;

var
  FMTraspasoPeriodos : TFMTraspasoPeriodos;

implementation

uses UEntorno, UDMTraspasoPeriodo, UDMMain, UUtiles, UParam;

{$R *.DFM}

procedure TFMTraspasoPeriodos.FormCreate(Sender: TObject);
var
  contAnalitica : boolean;
begin
  inherited;
  AbreData(TDMTraspasoPeriodo, DMTraspasoPeriodo);
  CBModCond.Checked := True;
  CBElimCond.Checked := True;
  PCMain.ActivePage := TBTrasConPeriodos;

  // Desactivamos la contabilidad Analitica si el usuario no puede acceder a ella
  contAnalitica := DMMain.PuedeHacerImputaciones;
  CBContabilidadAnalitica.Visible := contAnalitica;

  GBPrecioCosteKri.Visible := (LeeParametro('ALMPCOS001') = 'S');

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BTTraspasar, 1, DMMain.ILMain_Ac, 36);
  GetBitmapFromImageList(BTSeleccionarTodo, 1, DMMain.ILMain_Ac, 146);
  GetBitmapFromImageList(BTLimpiarOpciones, 1, DMMain.ILMain_Ac, 147);
  GetBitmapFromImageList(BitBtn1, 1, DMMain.ILMain_Ac, 36);
  GetBitmapFromImageList(BitBtn2, 1, DMMain.ILMain_Ac, 146);
  GetBitmapFromImageList(BitBtn3, 1, DMMain.ILMain_Ac, 147);
  GetBitmapFromImageList(BtnListadosCanalCanal, 1, DMMain.ILMain_Ac, 35);
  GetBitmapFromImageList(BtnListadosCanalTodos, 1, DMMain.ILMain_Ac, 37);
  GetBitmapFromImageList(BtnListadosTodosCanal, 1, DMMain.ILMain_Ac, 125);
  GetBitmapFromImageList(BtnTarProCanalCanal, 1, DMMain.ILMain_Ac, 56);
  GetBitmapFromImageList(BtnTarProCanalTodos, 1, DMMain.ILMain_Ac, 143);
  GetBitmapFromImageList(BtnTarProTodosCanal, 1, DMMain.ILMain_Ac, 141);
  GetBitmapFromImageList(BtnRestriCanalCanal, 1, DMMain.ILMain_Ac, 29);
  GetBitmapFromImageList(BtnRestriCanalTodos, 1, DMMain.ILMain_Ac, 27);
  GetBitmapFromImageList(BtnRestriTodosCanal, 1, DMMain.ILMain_Ac, 39);
  GetBitmapFromImageList(BtnCampanyas, 1, DMMain.ILMain_Ac, 123);
  GetBitmapFromImageList(BtnPrecioCosteKri, 1, DMMain.ILMain_Ac, 42);
end;

procedure TFMTraspasoPeriodos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTraspasoPeriodo);
end;

procedure TFMTraspasoPeriodos.ACerrarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMTraspasoPeriodos.ATraspasarExecute(Sender: TObject);
var
  O_Ejercicio, D_Ejercicio, O_Canal, D_Canal : integer;
begin
  if ((EFEjeOrigen.Text <> '') and (EFEjeDestino.Text <> '') and
     (EFCanalOrigen.Text <> '') and (EFCanalDestino.Text <> '')) then
  begin
     Animacion(True);
     Screen.Cursor := crHourGlass;
     O_Ejercicio := StrToInt(EFEjeOrigen.Text);
     D_Ejercicio := StrToInt(EFEjeDestino.Text);
     O_Canal := StrToInt(EFCanalOrigen.Text);
     D_Canal := StrToInt(EFCanalDestino.Text);

     if CBCondCliArt.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CCA', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondAgrupArt.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CAA', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondPerArt.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CPA', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondArt.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CAR', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondCliFam.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CCF', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondAgrupFam.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CAF', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondPerFam.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CPF', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondFam.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CFA', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondAgrup.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CAG', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondPerf.Checked then
     begin
        DMTraspasoPeriodo.TraspasoCondEsp('CPE', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBElimCond.Checked);
     end;
     if CBCondProArt.Checked then
     begin
        DMTraspasoPeriodo.EjecutarSP('TRS_CONDICIONES_PROV_ART', O_Ejercicio,
           D_Ejercicio, O_Canal, D_Canal, not CBModCond.Checked);
     end;
     if CBCondProvFam.Checked then
     begin
        DMTraspasoPeriodo.EjecutarSP('TRS_CONDICIONES_PROV_FAM', O_Ejercicio,
           D_Ejercicio, O_Canal, D_Canal, not CBModCond.Checked);
     end;
     if CBCondAgenAgrupFam.Checked then
     begin
        DMTraspasoPeriodo.EjecutarSP('TRS_CONDICIONES_AGE_AGRUP_FAM',
           O_Ejercicio, D_Ejercicio, O_Canal, D_Canal, not CBModCond.Checked);
     end;
     if CBCondAgeAgruArt.Checked then
     begin
        DMTraspasoPeriodo.EjecutarSP('TRS_CONDICIONES_AGE_AGRUP_ART',
           O_Ejercicio, D_Ejercicio, O_Canal, D_Canal, not CBModCond.Checked);
     end;
     if CBCondAgeCliArt.Checked then
     begin
        DMTraspasoPeriodo.EjecutarSP('TRS_CONDICIONES_AGE_CLI_ART',
           O_Ejercicio, D_Ejercicio, O_Canal, D_Canal, not CBModCond.Checked);
     end;
     if CBCondAgenCliFam.Checked then
     begin
        DMTraspasoPeriodo.EjecutarSP('TRS_CONDICIONES_AGE_CLI_FAM',
           O_Ejercicio, D_Ejercicio, O_Canal, D_Canal, not CBModCond.Checked);
     end;
     if CBCondAgenCliComisiones.Checked then
     begin
        DMTraspasoPeriodo.EjecutarSP('TRS_CONDICIONES_AGE_CLI', O_Ejercicio,
           D_Ejercicio, O_Canal, D_Canal, not CBModCond.Checked);
     end;
     if CBCondAgenAgrupComisiones.Checked then
     begin
        DMTraspasoPeriodo.EjecutarSP('TRS_CONDICIONES_AGE_AGRUP', O_Ejercicio,
           D_Ejercicio, O_Canal, D_Canal, not CBModCond.Checked);
     end;
  end;
  LimpiaFormulario;
  Screen.Cursor := crDefault;
  Animacion(False);
end;

procedure TFMTraspasoPeriodos.LimpiaFormulario;
begin
  ALimpiarTodoExecute(Self);
  EFEjeOrigen.Text := '';
  EFEjeDestino.Text := '';
  EFCanalOrigen.Text := '';
  EFCanalDestino.Text := '';
end;

procedure TFMTraspasoPeriodos.ATodoExecute(Sender: TObject);
begin
  if (EDTFEjerOrigenCuentas.Text <> '') and (EDTFEjerDestinoCuentas.Text <> '') then
  begin
     Animacion(True);
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoTodoModo(EDTFEjerOrigenCuentas.Text, EDTFEjerDestinoCuentas.Text, 8191, ChkBModCuentas.Checked);
     finally
        begin
           Screen.Cursor := crDefault;
           Animacion(False);
        end;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.MuestraErrorEjercicio;
begin
  ShowMessage(_('Datos incorrectos en los ejercicios'));
end;

procedure TFMTraspasoPeriodos.ACanalExecute(Sender: TObject);
begin
  if (EDTFEjerOrigenCuentas.Text <> '') and (EDTFEjerDestinoCuentas.Text <> '') then
  begin
     Animacion(True);
     Screen.Cursor := crHourGlass;
     try
        // 8191 es todo seleccionado
        DMTraspasoPeriodo.TraspasoCanalModo(EDTFEjerOrigenCuentas.Text, EDTFEjerDestinoCuentas.Text, 8191, ChkBModCuentas.Checked);
     finally
        begin
           Screen.Cursor := crDefault;
           Animacion(False);
        end;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.ATodoModoExecute(Sender: TObject);
var
  Modo : integer;
begin
  if (EDTFEjerOrigenCuentas.Text <> '') and (EDTFEjerDestinoCuentas.Text <> '') then
  begin
     Modo := CheckModo;
     Animacion(True);
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoTodoModo(EDTFEjerOrigenCuentas.Text,
           EDTFEjerDestinoCuentas.Text,
           Modo, ChkBModCuentas.Checked);
     finally
        begin
           Screen.Cursor := crDefault;
           Animacion(False);
        end;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

function TFMTraspasoPeriodos.CheckModo: integer;
begin
  Result := 0;
  // Chapuza al uso
  if CBFormasPago.Checked then
     Result := Result or 1;
  if CBAcreedores.Checked then
     Result := Result or 2;
  if CBAgentes.Checked then
     Result := Result or 4;
  if CBClientes.Checked then
     Result := Result or 8;
  if CBProveedores.Checked then
     Result := Result or 16;
  if CBFamilias.Checked then
     Result := Result or 32;
  if CBArticulos.Checked then
     Result := Result or 64;
  if CBBancos.Checked then
     Result := Result or 128;
  if CBFinancieros.Checked then
     Result := Result or 256;
  if CBIRPF.Checked then
     Result := Result or 512;
  if CBIva.Checked then
     Result := Result or 1024;
  if CBArticulosSerie.Checked then
     Result := Result or 2048;
  if CBContabilidadAnalitica.Checked then
     Result := Result or 4096;
end;

procedure TFMTraspasoPeriodos.ACanalModoExecute(Sender: TObject);
var
  Modo : integer;
begin
  if (EDTFEjerOrigenCuentas.Text <> '') and (EDTFEjerDestinoCuentas.Text <> '') then
  begin
     Modo := CheckModo;
     Animacion(True);
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoCanalModo(EDTFEjerOrigenCuentas.Text,
           EDTFEjerDestinoCuentas.Text,
           Modo, ChkBModCuentas.Checked);
     finally
        begin
           Screen.Cursor := crDefault;
           Animacion(False);
        end;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.Animacion;
begin
  AniTempo.Visible := Activo;
  AniTempo.Active := Activo;
  AniTempo2.Visible := Activo;
  AniTempo2.Active := Activo;
  AniTempo3.Visible := Activo;
  AniTempo3.Active := Activo;
end;

procedure TFMTraspasoPeriodos.ACanalCanalExecute(Sender: TObject);
begin
  if (EDTFEjerOrigenCuentas.Text <> '') and (EDTFEjerDestinoCuentas.Text <> '') then
  begin
     Animacion(True);
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoCanalCanal(EDTFEjerOrigenCuentas.Text,
           EDTFEjerDestinoCuentas.Text,
           8191, ChkBModCuentas.Checked);
     finally
        begin
           Screen.Cursor := crDefault;
           Animacion(False);
        end;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.ACanalCanalModoExecute(Sender: TObject);
var
  Modo : integer;
begin
  if (EDTFEjerOrigenCuentas.Text <> '') and (EDTFEjerDestinoCuentas.Text <> '') then
  begin
     Modo := CheckModo;
     Animacion(True);
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoCanalCanal(EDTFEjerOrigenCuentas.Text,
           EDTFEjerDestinoCuentas.Text,
           Modo, ChkBModCuentas.Checked);
     finally
        begin
           Screen.Cursor := crDefault;
           Animacion(False);
        end;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.AListadosExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoListados(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.AListadosCanalTodosExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoListadosTodo(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.AListadosCanalCanalExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoListadosCanal(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.ARestriccionExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoRestriccion(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.ARestriccionTodoExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoRestriccionTodo(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.ARestriccionCanalExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoRestriccionCanal(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.EFCanalOrigenBusqueda(Sender: TObject);
begin
  EFCanalOrigen.CondicionBusqueda := 'EJERCICIO=' + EFEjeOrigen.Text;
end;

procedure TFMTraspasoPeriodos.EFEjeOrigenExit(Sender: TObject);
begin
  if EFEjeOrigen.Text <> '' then
     EFCanalOrigen.Enabled := True;
end;

procedure TFMTraspasoPeriodos.EFEjeDestinoExit(Sender: TObject);
begin
  if EFEjeDestino.Text <> '' then
     EFCanalDestino.Enabled := True;
end;

procedure TFMTraspasoPeriodos.ASeleccionarTodoExecute(Sender: TObject);
begin
  CBCondCliArt.Checked := True;
  CBCondAgrupArt.Checked := True;
  CBCondPerArt.Checked := True;
  CBCondArt.Checked := True;
  CBCondCliFam.Checked := True;
  CBCondAgrupFam.Checked := True;
  CBCondPerFam.Checked := True;
  CBCondFam.Checked := True;
  CBCondAgrup.Checked := True;
  CBCondPerf.Checked := True;
  CBCondProArt.Checked := True;
  CBCondProvFam.Checked := True;
  CBCondAgenAgrupFam.Checked := True;
  CBCondAgeAgruArt.Checked := True;
  CBCondAgeCliArt.Checked := True;
  CBCondAgenCliFam.Checked := True;
  CBCondAgenCliComisiones.Checked := True;
  CBCondAgenAgrupComisiones.Checked := True;
end;

procedure TFMTraspasoPeriodos.ALimpiarTodoExecute(Sender: TObject);
begin
  CBCondCliArt.Checked := False;
  CBCondAgrupArt.Checked := False;
  CBCondPerArt.Checked := False;
  CBCondArt.Checked := False;
  CBCondCliFam.Checked := False;
  CBCondAgrupFam.Checked := False;
  CBCondPerFam.Checked := False;
  CBCondFam.Checked := False;
  CBCondAgrup.Checked := False;
  CBCondPerf.Checked := False;
  CBCondProArt.Checked := False;
  CBCondProvFam.Checked := False;
  CBCondAgenAgrupFam.Checked := False;
  CBCondAgeAgruArt.Checked := False;
  CBCondAgeCliArt.Checked := False;
  CBCondAgenCliFam.Checked := False;
  CBCondAgenCliComisiones.Checked := False;
  CBCondAgenAgrupComisiones.Checked := False;
end;

procedure TFMTraspasoPeriodos.AProveedorCanalCanalExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoProveedor(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.AProveedorCanalTodosExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoProveedorTodo(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.AProveedorTodosCanalExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoProveedorCanal(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.ACampanyaExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasoCampanya(EDFEjercicioOrigenGenericos.Text,
           EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.APrecioCosteKriExecute(Sender: TObject);
begin
  if (EDFEjercicioOrigenGenericos.Text <> '') and (EDFEjercicioDestinoGenericos.Text <> '') then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMTraspasoPeriodo.TraspasaPrecioCosteKri(EDFEjercicioOrigenGenericos.Text, EDFEjercicioDestinoGenericos.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end
  else
     MuestraErrorEjercicio;
end;

procedure TFMTraspasoPeriodos.ASeleccionarPromoExecute(Sender: TObject);
begin
  CBPromocionCliArt.Checked := True;
  CBPromocionArticulo.Checked := True;
  CBPromocionFamArt.Checked := True;
  CBPromocionAgrupArt.Checked := True;
  CBPromocionAgrupFam.Checked := True;
  CBPromocionCliFam.Checked := True;
end;

procedure TFMTraspasoPeriodos.ALimpiaPromoExecute(Sender: TObject);
begin
  CBPromocionCliArt.Checked := False;
  CBPromocionArticulo.Checked := False;
  CBPromocionFamArt.Checked := False;
  CBPromocionAgrupArt.Checked := False;
  CBPromocionAgrupFam.Checked := False;
  CBPromocionCliFam.Checked := False;
end;

procedure TFMTraspasoPeriodos.ATraspasoPromoExecute(Sender: TObject);
var
  O_Ejercicio, D_Ejercicio, O_Canal, D_Canal : integer;
begin
  if ((EFOEjercicio.Text <> '') and (EFDEjercicio.Text <> '') and
     (EFOCanal.Text <> '') and (EFDCanal.Text <> '')) then
  begin
     Animacion(True);
     Screen.Cursor := crHourGlass;
     O_Ejercicio := StrToInt(EFOEjercicio.Text);
     D_Ejercicio := StrToInt(EFDEjercicio.Text);
     O_Canal := StrToInt(EFOCanal.Text);
     D_Canal := StrToInt(EFDCanal.Text);

     if CBPromocionCliArt.Checked then
     begin
        DMTraspasoPeriodo.TraspasoPromociones('PCA', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBBorrar.Checked);
     end;
     if CBPromocionCliFam.Checked then
     begin
        DMTraspasoPeriodo.TraspasoPromociones('PCF', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBBorrar.Checked);
     end;
     if CBPromocionArticulo.Checked then
     begin
        DMTraspasoPeriodo.TraspasoPromociones('PAR', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBBorrar.Checked);
     end;
     if CBPromocionFamArt.Checked then
     begin
        DMTraspasoPeriodo.TraspasoPromociones('CFA', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBBorrar.Checked);
     end;
     if CBPromocionAgrupArt.Checked then
     begin
        DMTraspasoPeriodo.TraspasoPromociones('PAA', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBBorrar.Checked);
     end;
     if CBPromocionAgrupFam.Checked then
     begin
        DMTraspasoPeriodo.TraspasoPromociones('PAF', O_Ejercicio, D_Ejercicio,
           O_Canal, D_Canal, CBBorrar.Checked);
     end;
     LimpiaFormularioPromo;
     Screen.Cursor := crDefault;
     Animacion(False);
  end;
end;

procedure TFMTraspasoPeriodos.LimpiaFormularioPromo;
begin
  ALimpiaPromoExecute(Self);
  EFOEjercicio.Text := '';
  EFDEjercicio.Text := '';
  EFOCanal.Text := '';
  EFDCanal.Text := '';
end;

procedure TFMTraspasoPeriodos.EFOEjercicioExit(Sender: TObject);
begin
  if EFOEjercicio.Text <> '' then
     EFOCanal.Enabled := True;
end;

procedure TFMTraspasoPeriodos.EFDEjercicioExit(Sender: TObject);
begin
  if EFDEjercicio.Text <> '' then
     EFDCanal.Enabled := True;
end;

procedure TFMTraspasoPeriodos.EFOcanalBusqueda(Sender: TObject);
begin
  EFOcanal.CondicionBusqueda := 'EJERCICIO=' + EFOEjercicio.Text;
end;

end.
