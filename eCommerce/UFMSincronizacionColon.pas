unit UFMSincronizacionColon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel,
  UNavigator, ToolWin, ExtCtrls, ULFPanel, ULFLabel, Mask, rxToolEdit,
  ULFDateEdit, RXDBCtrl, ULFDBDateEdit, DBCtrls, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, Buttons;

type
  TFMSincronizacionColon = class(TFPEditDetalle)
     TBSep1: TToolButton;
     TBSincronizar: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     ASincronizar: TAction;
     PNLFiltroFechas: TLFPanel;
     DEDesde: TLFDateEdit;
     DEHasta: TLFDateEdit;
     LFiltroFechas: TLFLabel;
     LCIFProveedpr: TLFLabel;
     DBECIFProveedor: TLFDbedit;
     LNroDocumento: TLFLabel;
     DBENroDocumento: TLFDbedit;
     DBDEFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     LCodigoCliente: TLFLabel;
     DBECodigoCliente: TLFDbedit;
     LCIFCliente: TLFLabel;
     DBECIFCliente: TLFDbedit;
     LNroEnvio: TLFLabel;
     DBENroEnvio: TLFDbedit;
     LSuReferencia: TLFLabel;
     DBESuReferencia: TLFDbedit;
     LDireccionEnvio: TLFLabel;
     DBEDireccionEnvio: TLFDbedit;
     ACrearALP: TAction;
     LTotal: TLFLabel;
     DBETotal: TLFDbedit;
     LBaseImponible: TLFLabel;
     DBEBaseImponible: TLFDbedit;
     DBEIVA: TLFDbedit;
     LIVA: TLFLabel;
     LCuotaIVA: TLFLabel;
     DBECuotaIVA: TLFDbedit;
     BFechaAnterior: TButton;
     BFechaSiguiente: TButton;
     PNLInformacionSincronizacion: TLFPanel;
     LImpuesto: TLFLabel;
     DBEImpuesto: TLFDbedit;
     LDestino: TLFLabel;
     DBEDestino: TLFDbedit;
     PNLFiltroTratado: TLFPanel;
     CBSoloNoSincronizados: TLFCheckBox;
     SBADocumento: TSpeedButton;
     TBSep2: TToolButton;
     TBCreaArticulo: TToolButton;
     ACreaArticulo: TAction;
     LAgenciaTransporte: TLFLabel;
     DBEAgenciaTransporte: TLFDbedit;
     LPortes: TLFLabel;
     DBEPortes: TLFDbedit;
     PBProgreso: TProgressBar;
     LProgreso: TLFLabel;
     BFechaDia: TButton;
     BFechaMes: TButton;
     procedure FormCreate(Sender: TObject);
     procedure ASincronizarExecute(Sender: TObject);
     procedure DEFechaChange(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FormShow(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ACrearALPExecute(Sender: TObject);
     procedure BFechaAnteriorClick(Sender: TObject);
     procedure BFechaSiguienteClick(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure SBADocumentoDblClick(Sender: TObject);
     procedure ACreaArticuloExecute(Sender: TObject);
     procedure BFechaDiaClick(Sender: TObject);
     procedure BFechaMesClick(Sender: TObject);
  private
     { Private declarations }
     IdCabReparacion: integer;
     Serie: string;
  public
     { Public declarations }
     procedure Inicializa(aIdCabReparacion: integer; aSerie: string);
  end;

var
  FMSincronizacionColon : TFMSincronizacionColon;

implementation

uses
  UDMMain, UFormGest, UDMSincronizacionColon, DateUtils, UUtiles, UFMain, UEntorno, UFMArticulos, UFMSeleccion;

{$R *.dfm}

procedure TFMSincronizacionColon.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSincronizacionColon, DMSincronizacionColon);

  NavMain.DataSource := DMSincronizacionColon.DSxCabecera;
  DBGMain.DataSource := DMSincronizacionColon.DSxCabecera;
  NavDetalle.DataSource := DMSincronizacionColon.DSxDetalle;
  DBGFDetalle.DataSource := DMSincronizacionColon.DSxDetalle;
  G2kTableLoc.DataSource := DMSincronizacionColon.DSxCabecera;

  TSTablaMaximizada := True;

  DEDesde.Date := Today;
  DEHasta.Date := Today;

  IdCabReparacion := 0;
  Serie := '';

  DMSincronizacionColon.Filtra(DEDesde.Date, DEHasta.Date, CBSoloNoSincronizados.Checked);

  DBEDestino.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBADocumento, DBEDestino);
end;

procedure TFMSincronizacionColon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSincronizacionColon);
end;

procedure TFMSincronizacionColon.ASincronizarExecute(Sender: TObject);
begin
  inherited;
  DMSincronizacionColon.Sincroniza(PBProgreso, LProgreso);
  DMSincronizacionColon.Filtra(DEDesde.Date, DEHasta.Date, CBSoloNoSincronizados.Checked);
end;

procedure TFMSincronizacionColon.DEFechaChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionColon.Filtra(DEDesde.Date, DEHasta.Date, CBSoloNoSincronizados.Checked);
end;

procedure TFMSincronizacionColon.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (UpperCase(Column.FieldName) = 'ARTICULO') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'REFERENCIA') then
        begin
           if (DMSincronizacionColon.xDetalleARTICULO.AsString = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionColon.FormShow(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSTabla;
end;

procedure TFMSincronizacionColon.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMSincronizacionColon.Inicializa(aIdCabReparacion: integer; aSerie: string);
begin
  IdCabReparacion := aIdCabReparacion;
  Serie := aSerie;
  PNLInformacionSincronizacion.Caption := format('Sincronizacion con reparacion: %s/%d', [Serie, IdCabReparacion]);
  PNLInformacionSincronizacion.Visible := True;
end;

procedure TFMSincronizacionColon.ACrearALPExecute(Sender: TObject);
var
  Seguir : boolean;
  SerieDoc : string;
begin
  inherited;
  if (DMSincronizacionColon.xCabeceraID_E.AsInteger = 0) then
  begin
     Seguir := True;
     SerieDoc := Serie;

     if (IdCabReparacion = 0) then
     begin
        SerieDoc := REntorno.Serie;
        Seguir := PideDato('SER', SerieDoc);
     end;

     if Seguir then
        DMSincronizacionColon.CrearALP(IdCabReparacion, SerieDoc);

     if (IdCabReparacion <> 0) then
        Close
     else
        DMSincronizacionColon.xCabecera.Refresh;
  end
  else
     ShowMessage(format('Este documento ha sido traspasado a %s', [DMSincronizacionColon.xCabeceraDESTINO.AsString]));
end;

procedure TFMSincronizacionColon.BFechaAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEDesde, DEHasta, 'M-');
end;

procedure TFMSincronizacionColon.BFechaSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEDesde, DEHasta, 'M+');
end;

procedure TFMSincronizacionColon.BFechaDiaClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEDesde, DEHasta, 'DIA');
end;

procedure TFMSincronizacionColon.BFechaMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEDesde, DEHasta, 'MES');
end;

procedure TFMSincronizacionColon.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (UpperCase(Column.FieldName) = 'DESTINO') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMSincronizacionColon.xCabeceraID_E.AsInteger <> 0) then
           ColorResaltado2(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionColon.SBADocumentoDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosEntrada(DMSincronizacionColon.xCabeceraID_E.AsInteger);
end;

procedure TFMSincronizacionColon.ACreaArticuloExecute(Sender: TObject);
var
  Linea : integer;
begin
  inherited;
  if (DMSincronizacionColon.xDetalleARTICULO.AsString = '') then
  begin
     Linea := DMSincronizacionColon.xDetalleLINEA.AsInteger;
     FMain.EjecutaAccion(FMain.AArticulos);
     FMArticulos.InsertarArticulo(DMSincronizacionColon.QMConfiguracionPROVEEDOR.AsInteger, DMSincronizacionColon.xDetalleREFERENCIA.AsString, DMSincronizacionColon.xDetalleDESCRIPCION.AsString);

     DMSincronizacionColon.xCabecera.Refresh;
     Posicionar(DMSincronizacionColon.xDetalle, 'LINEA', Linea);
  end;
end;

end.
