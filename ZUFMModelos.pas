unit ZUFMModelos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, Buttons, ExtDlgs,
  dbcgrids, ULFDBCtrlGrid, ULFEdit;

type
  TZFMModelos = class(TFPEdit)
     LblCodigo: TLFLabel;
     LblDescripcion: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     TSNotas: TTabSheet;
     PnlCabNotas: TLFPanel;
     PnlEdNotas: TLFPanel;
     PnlCabNotasD: TLFPanel;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     DBMNotas: TLFDBMemo;
     DBECodigoNotas: TLFDbedit;
     DBEDescCodNotas: TLFDbedit;
     LblDiasServir: TLFLabel;
     DBEDiasServir: TLFDbedit;
     LblTipo: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     DescTipo: TLFHYDBDescription;
     DescSubtipo: TLFHYDBDescription;
     DBEFSubtipo: TLFDBEditFind2000;
     LSubtipoConfiguracion: TLFLabel;
     LIncCorte: TLFLabel;
     DBEIncCorte: TLFDbedit;
     LDecMedidaLona: TLFLabel;
     LDecBarrasMotor: TLFLabel;
     LDecBarrasManual: TLFLabel;
     DBEDecBarrasManualArriba: TLFDbedit;
     DBEDecBarrasMotorArriba: TLFDbedit;
     DBEDecMedidaLona: TLFDbedit;
     DBEDecBarrasManualAbajo: TLFDbedit;
     DBEDecBarrasMotorAbajo: TLFDbedit;
     LblArriba: TLFLabel;
     LblAbajo: TLFLabel;
     LTipoConfeccion: TLFLabel;
     DBEFTipoConfeccion: TLFDBEditFind2000;
     DescTipoConfeccion: TLFHYDBDescription;
     LFWeb: TLFDBCheckBox;
     LFCategoryAction1: TLFCategoryAction;
     ACrearDatosModelo: TAction;
     SBAModelosDet: TSpeedButton;
     ALModelos: TLFActionList;
     AModelosDet: TAction;
     LRegistrosDatos: TLFLabel;
     LFDBRegDatos: TLFDbedit;
     LFCategoryAction2: TLFCategoryAction;
     AListado: TAction;
     RGOrdenTarifas: TDBRadioGroup;
     LFImatge: TLFPanel;
     Imagen: TImage;
     OPImagen: TOpenPictureDialog;
     LTipo: TLFLabel;
     DBETipoModelo: TLFDBEditFind2000;
     DescTipoModelo: TLFHYDBDescription;
     LRegDatos: TLFLabel;
     ABorrarModeloTodos: TAction;
     ABorrarModeloObsoletos: TAction;
     TSDiasRetraso: TTabSheet;
     DBGDiasColor: TDBGridFind2000;
     PNLDiasColor: TLFPanel;
     PNLDias: TLFPanel;
     DBECodigoDias: TLFDbedit;
     DBEDescCodDias: TLFDbedit;
     NavDiasColor: THYMNavigator;
     TSAgrupaciones: TTabSheet;
     TBAgrupaciones: TLFToolBar;
     PNLCabAgrupaciones: TLFPanel;
     DBExTit: TLFDbedit;
     DBExModelo: TLFDbedit;
     ToolButton5: TToolButton;
     NavAgrupaciones: THYMNavigator;
     ToolButton2: TToolButton;
     NavDispopibles: THYMNavigator;
     DBCGPertenece: TLFDBCtrlGrid;
     DBEAgDentro: TLFDbedit;
     DBEAgTitDentro: TLFDbedit;
     PPertenece: TLFPanel;
     PDisponibles: TLFPanel;
     DBCGDisponibles: TLFDBCtrlGrid;
     DBEAgCodDisp: TLFDbedit;
     DBEAgTitDisp: TLFDbedit;
     CEAgrupacionesPMEdit: TPopUpTeclas;
     CEAgrupacionesMifirst: TMenuItem;
     CEAgrupacionesMiprior: TMenuItem;
     CEAgrupacionesMinext: TMenuItem;
     CEAgrupacionesMilast: TMenuItem;
     CEAgrupacionesMiinsert: TMenuItem;
     CEAgrupacionesMidelete: TMenuItem;
     CEAgrupacionesMiedit: TMenuItem;
     CEAgrupacionesMipost: TMenuItem;
     CEAgrupacionesMicancel: TMenuItem;
     CEAgrupacionesMirefresh: TMenuItem;
     CEAgrupacionesDispPMEdit: TPopUpTeclas;
     CEAgrupacionesDispMifirst: TMenuItem;
     CEAgrupacionesDispMiprior: TMenuItem;
     CEAgrupacionesDispMinext: TMenuItem;
     CEAgrupacionesDispMilast: TMenuItem;
     CEAgrupacionesDispMiinsert: TMenuItem;
     CEAgrupacionesDispMidelete: TMenuItem;
     CEAgrupacionesDispMiedit: TMenuItem;
     CEAgrupacionesDispMipost: TMenuItem;
     CEAgrupacionesDispMicancel: TMenuItem;
     CEAgrupacionesDispMirefresh: TMenuItem;
     CEAgrupacionesDisp: TControlEdit;
     CEAgrupaciones: TControlEdit;
     LBLImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     BClipboard: TButton;
     TSIncrPrecioColor: TTabSheet;
     CEIncrPrecioColor: TControlEdit;
     PNLIncrPrecioColor: TLFPanel;
     PNLIncrPrecioColor2: TLFPanel;
     DBEIncrPrecioColorCodigo: TLFDbedit;
     DBEIncrPrecioColorDesc: TLFDbedit;
     NavIncrPrecioColor: THYMNavigator;
     DBGIncrPrecioColor: TDBGridFind2000;
     CEIncrPrecioColorPMEdit: TPopUpTeclas;
     LBultos: TLFLabel;
     DBEBultos: TLFDbedit;
     LDecMotorMedidaLona: TLFLabel;
     DBEDecMotorMedidaLona: TLFDbedit;
     AAdjunto: TAction;
     DBECoeficienteCompra: TLFDbedit;
     LCoeficienteCompra: TLFLabel;
     LFamilia: TLFLabel;
     DBEFFamilia: TLFDBEditFind2000;
     ETituloFamilia: TLFEdit;
     ETituloSubFamilia: TLFEdit;
     DBEFSubFamilia: TLFDBEditFind2000;
     LSubfamilia: TLFLabel;
     LTiempoFase: TLFLabel;
     LTiempoFaseCHE: TLFLabel;
     LTiempoFaseMON: TLFLabel;
     LTiempoFasePRE: TLFLabel;
     LTiempoFaseTER: TLFLabel;
     DBETiempoFaseCHE: TLFDbedit;
     DBETiempoFaseMON: TLFDbedit;
     DBETiempoFasePRE: TLFDbedit;
     DBETiempoFaseTER: TLFDbedit;
     LFCategoryAction3: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFImagenChange(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFTipoChange(Sender: TObject);
     procedure DBEFSubtipoBusqueda(Sender: TObject);
     procedure DBEFSubtipoChange(Sender: TObject);
     procedure DBEFTipoConfeccionChange(Sender: TObject);
     procedure ACrearDatosModeloExecute(Sender: TObject);
     procedure AModelosDetExecute(Sender: TObject);
     procedure AListadoExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBETipoModeloChange(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ABorrarModeloTodosExecute(Sender: TObject);
     procedure ABorrarModeloObsoletosExecute(Sender: TObject);
     procedure DBGDiasColorBusqueda(Sender: TObject);
     procedure DBCGPerteneceDblClick(Sender: TObject);
     procedure DBCGDisponiblesDblClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure DBGIncrPrecioColorBusqueda(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AAdjuntoExecute(Sender: TObject);
     procedure DBEFFamiliaChange(Sender: TObject);
     procedure DBEFSubFamiliaBusqueda(Sender: TObject);
     procedure DBEFSubFamiliaChange(Sender: TObject);
     procedure TSAgrupacionesResize(Sender: TObject);
     procedure TSAgrupacionesShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMModelos : TZFMModelos;

implementation

uses ZUDMModelos, UFormGest, UDMMain, ZUFMCrearDatosModelo, UFMain, UEntorno,
  UUtiles, ZUFMLstPreciosModelo, UFMAdjunto, UDMAdjunto, URecibeFicheros, ShellAPI, UDameDato, UImagenes;

{$R *.dfm}

procedure TZFMModelos.FormCreate(Sender: TObject);
begin
  inherited;

  DragAcceptFiles(Self.Handle, True);
  AbreData(TZDMModelos, ZDMModelos);
  DBECodigo.Color := REntorno.ColorEnlaceActivo;
  DBGMain.DataSource := ZDMModelos.DSQMModelos;
  NavMain.DataSource := ZDMModelos.DSQMModelos;
  G2kTableLoc.DataSource := ZDMModelos.DSQMModelos;

  SolapaControles(SBAModelosDet, DBECodigo);

  // Color campo ID
  ColorCampoID(DBECodigo);
end;

procedure TZFMModelos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMModelos);
end;

procedure TZFMModelos.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TZFMModelos.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);

  // Fuerzo refresco porque Subfamilia podría mantener el mismo código pero ser de una familia distinta
  if (Button in [nbPost, nbRefresh]) then
  begin
     ETituloFamilia.Text := DameTituloFamilia(ZDMModelos.QMModelosFAMILIA.AsString);
     ETituloSubFamilia.Text := DameTituloSubFamilia(ZDMModelos.QMModelosSUBFAMILIA.AsString, ZDMModelos.QMModelosFAMILIA.AsString);
  end;
end;

procedure TZFMModelos.DBEFTipoChange(Sender: TObject);
begin
  inherited;
  DescTipo.ActualizaDatos('CONFIG_TIPO', DBEFTipo.Text);
end;

procedure TZFMModelos.DBEFSubtipoChange(Sender: TObject);
begin
  inherited;
  DescSubtipo.ActualizaDatos('CONFIG_SUBTIPO', DBEFSubtipo.Text);
end;

procedure TZFMModelos.DBEFSubtipoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFSubtipo.CondicionBusqueda := 'TIPO=' + DBEFTipo.Text;
end;

procedure TZFMModelos.DBEFTipoConfeccionChange(Sender: TObject);
begin
  inherited;
  DescTipoConfeccion.ActualizaDatos('TIPO_CONFECCION', DBEFTipoConfeccion.Text);
end;

procedure TZFMModelos.ACrearDatosModeloExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMCrearDatosModelo, ZFMCrearDatosModelo, Sender);
end;

procedure TZFMModelos.AModelosDetExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ZAModelosDet, DBECodigo.Text);
end;

procedure TZFMModelos.AListadoExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMLstPreciosModelo, ZFMLstPreciosModelo);
  ZFMLstPreciosModelo.EFModelo.Text := DBECodigo.Text; // EFModelo.Text;
end;

procedure TZFMModelos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TZFMModelos.DBETipoModeloChange(Sender: TObject);
begin
  inherited;
  DescTipoModelo.ActualizaDatos('TIPO_MODELO', DBETipoModelo.Text);

  if (ZDMModelos.QMModelosTIPO_MODELO.AsString = 'PER') then
  begin
     RGOrdenTarifas.items.Clear;
     RGOrdenTarifas.Values.Clear;
     RGOrdenTarifas.items.Add(_('Ancho/Alto'));
     RGOrdenTarifas.items.Add(_('Alto/Ancho'));
     RGOrdenTarifas.Values.Add('0');
     RGOrdenTarifas.Values.Add('1');

     LIncCorte.Visible := False;
     DBEIncCorte.Visible := False;
     LdecMedidaLona.Visible := False;
     DBEDecMedidaLona.Visible := False;
     LdecBarrasManual.Visible := False;
     DBEDecBarrasManualArriba.Visible := False;
     DBEDecBarrasManualAbajo.Visible := False;
     LdecBarrasMotor.Visible := False;
     DBEDecBarrasMotorArriba.Visible := False;
     DBEDecBarrasMotorAbajo.Visible := False;
     LblArriba.Visible := False;
     LblAbajo.Visible := False;
  end
  else
  if (ZDMModelos.QMModelosTIPO_MODELO.AsString = 'TOL') then
  begin
     RGOrdenTarifas.items.Clear;
     RGOrdenTarifas.Values.Clear;
     RGOrdenTarifas.items.Add(_('Linea/Salida'));
     RGOrdenTarifas.items.Add(_('Salida/Linea'));
     RGOrdenTarifas.Values.Add('0');
     RGOrdenTarifas.Values.Add('1');

     LIncCorte.Visible := True;
     DBEIncCorte.Visible := True;
     LdecMedidaLona.Visible := True;
     DBEDecMedidaLona.Visible := True;
     LdecBarrasManual.Visible := True;
     DBEDecBarrasManualArriba.Visible := True;
     DBEDecBarrasManualAbajo.Visible := True;
     LdecBarrasMotor.Visible := True;
     DBEDecBarrasMotorArriba.Visible := True;
     DBEDecBarrasMotorAbajo.Visible := True;
     LblArriba.Visible := True;
     LblAbajo.Visible := True;
  end;
end;

procedure TZFMModelos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMModelos.BusquedaCompleja;
end;

procedure TZFMModelos.ABorrarModeloTodosExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaGrave then
     ZDMModelos.BorraModelo(False);
end;

procedure TZFMModelos.ABorrarModeloObsoletosExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaGrave then
     ZDMModelos.BorraModelo(True);
end;

procedure TZFMModelos.DBGDiasColorBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'Z_SYS_COLORES') then
     begin
        CondicionBusqueda := 'ACTIVO=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CODIGO';
     end;
  end;
end;

procedure TZFMModelos.DBCGPerteneceDblClick(Sender: TObject);
begin
  inherited;
  ZDMModelos.AgrupacionVacia;
end;

procedure TZFMModelos.DBCGDisponiblesDblClick(Sender: TObject);
begin
  inherited;
  ZDMModelos.AgrupacionRellena;
end;

procedure TZFMModelos.BClipboardClick(Sender: TObject);
begin
  inherited;
  ZDMModelos.QMModelosIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TZFMModelos.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ZDMModelos.QMModelosIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TZFMModelos.DBGIncrPrecioColorBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'Z_SYS_COLORES') then
     begin
        CondicionBusqueda := 'ACTIVO=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CODIGO';
     end;
  end;
end;

procedure TZFMModelos.AAdjuntoExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('MTC', ZDMModelos.QMModelosID.AsInteger);
end;

procedure TZFMModelos.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('MTC', ZDMModelos.QMModelosID.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjunto.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TZFMModelos.DBEFFamiliaChange(Sender: TObject);
begin
  inherited;
  ETituloFamilia.Text := DameTituloFamilia(ZDMModelos.QMModelosFAMILIA.AsString);
  ETituloSubFamilia.Text := DameTituloSubFamilia(ZDMModelos.QMModelosSUBFAMILIA.AsString, ZDMModelos.QMModelosFAMILIA.AsString);
end;

procedure TZFMModelos.DBEFSubFamiliaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFSubfamilia.CondicionBusqueda := 'ID_FAMILIA = ' + IntToStr(DameIDFamilia(DBEFFamilia.Text));
end;

procedure TZFMModelos.DBEFSubFamiliaChange(Sender: TObject);
begin
  inherited;
  ETituloSubFamilia.Text := DameTituloSubFamilia(ZDMModelos.QMModelosSUBFAMILIA.AsString, ZDMModelos.QMModelosFAMILIA.AsString);
end;

procedure TZFMModelos.TSAgrupacionesResize(Sender: TObject);
begin
  inherited;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

procedure TZFMModelos.TSAgrupacionesShow(Sender: TObject);
begin
  inherited;
  DBCGPertenece.PanelHeight := 26;
  DBCGDisponibles.RowCount := DBCGDisponibles.Height div 26;
end;

end.
