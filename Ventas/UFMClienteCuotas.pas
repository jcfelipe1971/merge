unit UFMClienteCuotas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ComCtrls, ULFPageControl, UEditPanel, UNavigator, ToolWin, ULFToolBar,
  ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, rxToolEdit,
  RXDBCtrl, DbComboBoxValue, ULFDBMemo, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, ULFEdit, URecursos, Spin, UDBSpin, Buttons, ULFLabel,
  UG2kTBLoc, ULFDBDateEdit, ULFComboBox, UFPEditDetalle;

type
  TFMClienteCuotas = class(TFPEditDetalle)
     LPeriodicidad: TLFLabel;
     DBCBVPeriodicidad: TDBComboBoxValue;
     GBUltCuota: TGroupBox;
     LSerie: TLFLabel;
     LNumero: TLFLabel;
     DBERig: TLFDbedit;
     LTipoDoc: TLFLabel;
     DBCBTipoDoc: TDBComboBox;
     DBCKSuplido: TLFDBCheckBox;
     DBCKAgrupado: TLFDBCheckBox;
     DBMNotas: TLFDBMemo;
     DBDTPProxCuota: TLFDBDateEdit;
     DBESerie: TLFDbedit;
     ETitCliente: TLFEdit;
     LFecha: TLFLabel;
     DBDTPUltCuota: TLFDBDateEdit;
     LProxCuota: TLFLabel;
     DBETitTipoDoc: TLFDbedit;
     DBSEPrimerPlazo: TDBSpinEdit;
     LDias: TLFLabel;
     SBVerDoc: TSpeedButton;
     LFCategoryAction1: TLFCategoryAction;
     AListadoCuotas: TAction;
     LFechaFinCuota: TLFLabel;
     DEFinCuota: TLFDBDateEdit;
     LLineaInicial: TLFLabel;
     DBELineaInicial: TLFDbedit;
     LNotas: TLFLabel;
     LProyecto: TLFLabel;
     EFProyecto: TLFDBEditFind2000;
     ETitProyecto: TLFEdit;
     LCliente: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     LBLCuota: TLFLabel;
     DBECuota: TLFDbedit;
     SBACliente: TSpeedButton;
     SBAProyecto: TSpeedButton;
     LFCategoryAction2: TLFCategoryAction;
     AAdjuntosCuota: TAction;
     TSObservaciones: TTabSheet;
     PNLNotas: TLFPanel;
     DBREObservaciones: TDBRichEdit;
     TBObservaciones: TLFToolBar;
     btnTButtNegrita: TToolButton;
     btnTButtCursiva: TToolButton;
     btnTButtSubrayado: TToolButton;
     btnTButtSep4: TToolButton;
     btnTButtAlinIzq: TToolButton;
     btnTButtAlinCentr: TToolButton;
     btnTButtAlinDer: TToolButton;
     btnTButtSep5: TToolButton;
     btnTButtBullet: TToolButton;
     btnTButtSep3: TToolButton;
     CBFontName: TLFComboBox;
     btnTButtSep6: TToolButton;
     PNLTamano: TLFPanel;
     EFontSize: TLFEdit;
     UDFontSize: TUpDown;
     CENotas: TControlEdit;
     TBNotas: TLFToolBar;
     NavNotas: THYMNavigator;
     LFCategoryAction3: TLFCategoryAction;
     AConfListadoCuotas: TAction;
     aListadoContrato: TAction;
     LFCategoryAction4: TLFCategoryAction;
     AConfContrato: TAction;
     aListadoContratoMAIL: TAction;
     LIdCuota: TLFLabel;
     DBEIdCuota: TLFDbedit;
     DBESuReferencia: TLFDbedit;
     LSuReferenica: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure SBVerDocDblClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AListadoCuotasExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure EFProyectoChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure AAdjuntosCuotaExecute(Sender: TObject);
     procedure DBREObservacionesEnter(Sender: TObject);
     procedure EFontSizeChange(Sender: TObject);
     procedure CBFontNameChange(Sender: TObject);
     procedure DBREObservacionesSelectionChange(Sender: TObject);
     procedure AConfListadoCuotasExecute(Sender: TObject);
     procedure aListadoContratoExecute(Sender: TObject);
     procedure AConfContratoExecute(Sender: TObject);
     procedure aListadoContratoMAILExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
     { Private declarations }
     ClienteFiltrado: integer;
     FUpdating: boolean;
     RichEditConFoco: TDBRichEdit;
     procedure GetFontNames;
  public
     { Public declarations }
     procedure Muestra(Cliente: integer; TipoOrigen: string = ''; IdOrigen: integer = 0);
     procedure CrearCuota(Cliente: integer; Importe: double; TipoOrigen: string; IdOrigen: integer);
  end;

var
  FMClienteCuotas : TFMClienteCuotas;

implementation

uses UDMMain, UDMClienteCuotas, UFormGest, UEntorno, UFPregCuotasCliente,
  UFMain, UUtiles, UFMAdjunto, UFMListConfig, UDMLstCuotasCliente,
  ShellApi, URecibeFicheros, UDMAdjunto, UDameDato;

{$R *.dfm}

procedure TFMClienteCuotas.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  ClienteFiltrado := 0;

  AbreData(TDMClienteCuotas, DMClienteCuotas);

  NavMain.DataSource := DMClienteCuotas.DSQMCuotas;
  EPMain.DataSource := DMClienteCuotas.DSQMCuotas;
  DBGMain.DataSource := DMClienteCuotas.DSQMCuotas;
  G2kTableLoc.DataSource := DMClienteCuotas.DSQMCuotas;

  NavDetalle.DataSource := DMClienteCuotas.DSCuotasDetalle;
  DBGFDetalle.DataSource := DMClienteCuotas.DSCuotasDetalle;

  ControlEdit := CEMain;
  PCMain.ActivePage := TSFicha;

  SolapaControles(SBACliente, ETitCliente);
  ETitCliente.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAProyecto, ETitProyecto);
  ETitProyecto.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBVerDoc, DBERig);
  DBERig.Color := REntorno.ColorEnlaceActivo;

  // Para RTF
  FUpdating := False;
  GetFontNames;
end;

procedure TFMClienteCuotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMClienteCuotas);
end;

procedure TFMClienteCuotas.Muestra(Cliente: integer; TipoOrigen: string = ''; IdOrigen: integer = 0);
begin
  ClienteFiltrado := Cliente;
  DMClienteCuotas.FiltraCliente(Cliente, TipoOrigen, IdOrigen);
  G2KTableLoc.CondicionBusqueda := 'CLIENTE=' + IntToStr(Cliente);
  NavMain.InsertaControl := EFProyecto;
  NavMain.EditaControl := EFProyecto;
  Hide;
  ShowModal;
end;

procedure TFMClienteCuotas.SBVerDocDblClick(Sender: TObject);
begin
  DMClienteCuotas.MuestraDoc;
end;

procedure TFMClienteCuotas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  SBVerDoc.Enabled := not (Button in [nbEdit, nbInsert]);
end;

procedure TFMClienteCuotas.AListadoCuotasExecute(Sender: TObject);
begin
  TFPregCuotasCliente.Create(Self).Muestra(DMClienteCuotas.QMCuotasCLIENTE.AsInteger);
end;

procedure TFMClienteCuotas.CrearCuota(Cliente: integer; Importe: double; TipoOrigen: string; IdOrigen: integer);
begin
  ClienteFiltrado := Cliente;
  DMClienteCuotas.CrearCuota(Cliente, Importe, TipoOrigen, IdOrigen);
  NavMain.InsertaControl := EFProyecto;
  NavMain.EditaControl := EFProyecto;
  Hide;
  ShowModal;
end;

procedure TFMClienteCuotas.FormActivate(Sender: TObject);
begin
  inherited;
  NavMain.DataSource := DMClienteCuotas.DSQMCuotas;
  DBGMain.DataSource := DMClienteCuotas.DSQMCuotas;
end;

procedure TFMClienteCuotas.EFProyectoChange(Sender: TObject);
begin
  inherited;
  ETitProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyecto.Text, 0));
end;

procedure TFMClienteCuotas.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  ETitCliente.Text := DameTituloCliente(DMClienteCuotas.QMCuotasCLIENTE.AsInteger);
end;

procedure TFMClienteCuotas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMClienteCuotas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMClienteCuotas.BusquedaCompleja;
end;

procedure TFMClienteCuotas.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  if (DMClienteCuotas.QMCuotasCLIENTE.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMClienteCuotas.QMCuotasCLIENTE.AsInteger));
end;

procedure TFMClienteCuotas.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  if (DMClienteCuotas.QMCuotasPROYECTO.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, DMClienteCuotas.QMCuotasPROYECTO.AsString);
end;

procedure TFMClienteCuotas.AAdjuntosCuotaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('CUO', DMClienteCuotas.QMCuotasID_CUOTA.AsInteger);
end;

procedure TFMClienteCuotas.DBREObservacionesEnter(Sender: TObject);
begin
  inherited;
  RichEditConFoco := TDBRichEdit(Sender);
end;

procedure TFMClienteCuotas.EFontSizeChange(Sender: TObject);
begin
  if FUpdating then
     Exit;
  if (RichEditConFoco <> nil) then
     with RichEditConFoco do
     begin
        if SelLength > 0 then
           SelAttributes.Size := StrToInt(TEdit(Sender).Text)
        else
           DefAttributes.Size := StrToInt(TEdit(Sender).Text);
     end;
end;

procedure TFMClienteCuotas.CBFontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  with RichEditConFoco do
  begin
     if SelLength > 0 then
        SelAttributes.Name := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex]
     else
        DefAttributes.Name := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex];
  end;
end;

procedure TFMClienteCuotas.DBREObservacionesSelectionChange(Sender: TObject);
begin
  inherited;
  try
     FUpdating := True;
     with TDBRichEdit(Sender) do
     begin
        EFontSize.Text := IntToStr(SelAttributes.Size);
        CBFontName.Text := SelAttributes.Name;
     end;
  finally
     FUpdating := False;
  end;
end;

procedure TFMClienteCuotas.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(CBFontName.Items));
  ReleaseDC(0, DC);
  CBFontName.Sorted := True;
end;

procedure TFMClienteCuotas.AConfListadoCuotasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCuotasCliente, DMLstCuotasCliente);
  TFMListConfig.Create(Self).Muestra(191, Formato, Cabecera, Copias, Pijama, '', DMLstCuotasCliente.frCuotas);
  CierraData(DMLstCuotasCliente);
end;

procedure TFMClienteCuotas.aListadoContratoExecute(Sender: TObject);
begin
  inherited;
  DMClienteCuotas.ImprimirContrato(0, False);
end;

procedure TFMClienteCuotas.AConfContratoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCuotasCliente, DMLstCuotasCliente);
  TFMListConfig.Create(Self).Muestra(184, Formato, Cabecera, Copias, Pijama, '', DMLstCuotasCliente.frCuotas);
  CierraData(DMLstCuotasCliente);
end;

procedure TFMClienteCuotas.aListadoContratoMAILExecute(Sender: TObject);
begin
  inherited;
  DMClienteCuotas.ImprimirContrato(2, False);
end;

procedure TFMClienteCuotas.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
     end;
  end;
end;

procedure TFMClienteCuotas.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('CUO', DMClienteCuotas.QMCuotasID_CUOTA.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosCuota.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

end.
