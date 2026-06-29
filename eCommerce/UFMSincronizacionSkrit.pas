unit UFMSincronizacionSkrit;

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
  TFMSincronizacionSkrit = class(TFPEditDetalle)
     TBSep1: TToolButton;
     TBSincronizar: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     ASincronizar: TAction;
     PNLFiltroFechas: TLFPanel;
     DEDesde: TLFDateEdit;
     DEHasta: TLFDateEdit;
     LFiltroFechas: TLFLabel;
     LSerie: TLFLabel;
     DBESerie: TLFDbedit;
     LCode: TLFLabel;
     DBECode: TLFDbedit;
     DBDEDate: TLFDBDateEdit;
     LDate: TLFLabel;
     LWarehouse: TLFLabel;
     DBEWarehouse: TLFDbedit;
     LRegistration: TLFLabel;
     DBERegistration: TLFDbedit;
     LOrderedBy: TLFLabel;
     DBEOrderedBy: TLFDbedit;
     LOrderNumber: TLFLabel;
     DBEOrderNumber: TLFDbedit;
     LObservations: TLFLabel;
     DBEObservations: TLFDbedit;
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
     PNLFiltro: TLFPanel;
     PNLConfiguracion: TLFPanel;
     LProveedor: TLFLabel;
     DBEProveedor: TLFDbedit;
     NavConfiguracion: THYMNavigator;
     BFechaDia: TButton;
     BFechaMes: TButton;
     DBTUltimaSincronizacion: TDBText;
     PNLUltimaSincronizacion: TLFPanel;
     LUltimaSincronizacion: TLFLabel;
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
  FMSincronizacionSkrit : TFMSincronizacionSkrit;

implementation

uses
  UDMMain, UFormGest, UDMSincronizacionSkrit, DateUtils, UUtiles, UFMain, UEntorno, UFMArticulos, UFMSeleccion;

{$R *.dfm}

procedure TFMSincronizacionSkrit.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSincronizacionSkrit, DMSincronizacionSkrit);

  NavMain.DataSource := DMSincronizacionSkrit.DSxCabecera;
  DBGMain.DataSource := DMSincronizacionSkrit.DSxCabecera;
  NavDetalle.DataSource := DMSincronizacionSkrit.DSxDetalle;
  DBGFDetalle.DataSource := DMSincronizacionSkrit.DSxDetalle;
  G2KTableLoc.DataSource := DMSincronizacionSkrit.DSxCabecera;

  TSTablaMaximizada := True;

  DEDesde.Date := Today;
  DEHasta.Date := Today;

  IdCabReparacion := 0;
  Serie := '';

  DMSincronizacionSkrit.Filtra(DEDesde.Date, DEHasta.Date, CBSoloNoSincronizados.Checked);

  DBEDestino.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBADocumento, DBEDestino);
end;

procedure TFMSincronizacionSkrit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSincronizacionSkrit);
end;

procedure TFMSincronizacionSkrit.ASincronizarExecute(Sender: TObject);
begin
  inherited;
  DMSincronizacionSkrit.Sincroniza;
end;

procedure TFMSincronizacionSkrit.DEFechaChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionSkrit.Filtra(DEDesde.Date, DEHasta.Date, CBSoloNoSincronizados.Checked);
end;

procedure TFMSincronizacionSkrit.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        if (UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'REFERENCE') then
        begin
           if (DMSincronizacionSkrit.xDetalleARTICULO.AsString = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionSkrit.FormShow(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSTabla;
end;

procedure TFMSincronizacionSkrit.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.CondicionBusqueda := format('PROVEEDOR = %d', [DMSincronizacionSkrit.QMConfiguracionPROVEEDOR.AsInteger]);
  G2kTableLoc.Click;
end;

procedure TFMSincronizacionSkrit.Inicializa(aIdCabReparacion: integer; aSerie: string);
begin
  IdCabReparacion := aIdCabReparacion;
  Serie := aSerie;
  PNLInformacionSincronizacion.Caption := format('Sincronizacion con reparacion: %s/%d', [Serie, IdCabReparacion]);
  PNLInformacionSincronizacion.Visible := True;
end;

procedure TFMSincronizacionSkrit.ACrearALPExecute(Sender: TObject);
var
  Seguir : boolean;
  SerieDoc : string;
  AlmacenDoc : string;
begin
  inherited;
  if (DMSincronizacionSkrit.xCabeceraID_E.AsInteger = 0) then
  begin
     Seguir := True;
     SerieDoc := Serie;

     if (IdCabReparacion = 0) then
     begin
        SerieDoc := REntorno.Serie;
        Seguir := PideDato('SER', SerieDoc);
     end;

     if Seguir then
     begin
        AlmacenDoc := DMMain.DameAlmacenDocumento('ALP', SerieDoc);
        Seguir := PideDato('ALM', AlmacenDoc);
     end;

     if Seguir then
        DMSincronizacionSkrit.CrearALP(IdCabReparacion, SerieDoc, AlmacenDoc);

     if (IdCabReparacion <> 0) then
        Close
     else
        DMSincronizacionSkrit.xCabecera.Refresh;
  end
  else
     ShowMessage(format('Este documento ha sido traspasado a %s', [DMSincronizacionSkrit.xCabeceraDESTINO.AsString]));
end;

procedure TFMSincronizacionSkrit.BFechaAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEDesde, DEHasta, 'M-');
end;

procedure TFMSincronizacionSkrit.BFechaSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEDesde, DEHasta, 'M+');
end;

procedure TFMSincronizacionSkrit.BFechaDiaClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEDesde, DEHasta, 'DIA');
end;

procedure TFMSincronizacionSkrit.BFechaMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEDesde, DEHasta, 'MES');
end;

procedure TFMSincronizacionSkrit.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        if (DMSincronizacionSkrit.xCabeceraID_E.AsInteger <> 0) then
           ColorResaltado2(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionSkrit.SBADocumentoDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosEntrada(DMSincronizacionSkrit.xCabeceraID_E.AsInteger);
end;

procedure TFMSincronizacionSkrit.ACreaArticuloExecute(Sender: TObject);
var
  Linea : integer;
begin
  inherited;
  if (DMSincronizacionSkrit.xDetalleARTICULO.AsString = '') then
  begin
     Linea := DMSincronizacionSkrit.xDetalleLINE.AsInteger;
     FMain.EjecutaAccion(FMain.AArticulos);
     FMArticulos.InsertarArticulo(DMSincronizacionSkrit.QMConfiguracionPROVEEDOR.AsInteger, DMSincronizacionSkrit.xDetalleREFERENCE.AsString, DMSincronizacionSkrit.xDetalleDESCRIPTION.AsString);

     DMSincronizacionSkrit.xCabecera.Refresh;
     Posicionar(DMSincronizacionSkrit.xDetalle, 'LINE', Linea);
  end;
end;

end.
