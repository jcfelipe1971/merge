unit UFMSincronizacionTyC;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel,
  UNavigator, ToolWin, ExtCtrls, ULFPanel, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, ULFEdit, Mask, DBCtrls, ULFDBEditFind2000, ULFLabel,
  ULFDBEdit, ULFDBMemo, Buttons;

type
  TFMSincronizacionTyC = class(TFPEditDetalle)
     LCliente: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     DBETituloCliente: TLFDbedit;
     LId: TLFLabel;
     DBEId: TLFDbedit;
     LReference: TLFLabel;
     DBEReference: TLFDbedit;
     LFechaEnvio: TLFLabel;
     DBDEDeliveryDate: TLFDBDateEdit;
     LDireccion: TLFLabel;
     DBEFDireccion: TLFDBEditFind2000;
     DBEDireccionCliente: TLFDbedit;
     LTotalAmount: TLFLabel;
     DBETotalAmount: TLFDbedit;
     LMagin: TLFLabel;
     DBEMagin: TLFDbedit;
     LInstalationAmount: TLFLabel;
     DBEInstalationAmount: TLFDbedit;
     LShippingAmount: TLFLabel;
     DBEShippingAmount: TLFDbedit;
     LSalesBudget: TLFLabel;
     DBESalesBudget: TLFDbedit;
     LSalesBudgetPlusTaxes: TLFLabel;
     DBESalesBudgetPlusTaxes: TLFDbedit;
     DBMObservations: TLFDBMemo;
     LDocumento: TLFLabel;
     DBEDocumento: TLFDbedit;
     SBADocumento: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFDireccionChange(Sender: TObject);
     procedure SBADocumentoDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSincronizacionTyC : TFMSincronizacionTyC;

implementation

uses
  UDMMain, UFMain, UFormGest, UDMSincronizacionTyC, UUtiles, UEntorno;

{$R *.dfm}

procedure TFMSincronizacionTyC.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSincronizacionTyC, DMSincronizacionTyC);

  NavMAin.DataSource := DMSincronizacionTyC.DSQMCabecera;
  DBGMain.DataSource := DMSincronizacionTyC.DSQMCabecera;
  NavDetalle.DataSource := DMSincronizacionTyC.DSQMDetalle;
  DBGFDetalle.DataSource := DMSincronizacionTyC.DSQMDetalle;
  G2kTableLoc.DataSource := DMSincronizacionTyC.DSQMCabecera;

  ColorCampoID(DBEId);
  DBEDocumento.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBADocumento, DBEDocumento);

  // Inicializo Colores
  DBEFClienteChange(Sender);
  DBEFDireccionChange(Sender);
end;

procedure TFMSincronizacionTyC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSincronizacionTyC);
end;

procedure TFMSincronizacionTyC.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  if (Trim(DMSincronizacionTyC.QMCabeceraNOMBRE_R_SOCIAL.AsString) = '') then
     ColorError(DBETituloCliente)
  else
     ColorInfo(DBETituloCliente);
end;

procedure TFMSincronizacionTyC.DBEFDireccionChange(Sender: TObject);
begin
  inherited;
  if (Trim(DMSincronizacionTyC.QMCabeceraDIR_COMPLETA_N.AsString) = '') then
     ColorError(DBEDireccionCliente)
  else
     ColorInfo(DBEDireccionCliente);
end;

procedure TFMSincronizacionTyC.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ARTICULO') then
        begin
           if (Trim(DMSincronizacionTyC.QMDetalleTITULO_LARGO.AsString) = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (DMSincronizacionTyC.QMDetalleES_TOLDO.AsInteger = 1) then
        begin
           if ((UpperCase(Column.FieldName) = 'CODIGO') or
              (UpperCase(Column.FieldName) = 'DESCRIPCION') or
              (UpperCase(Column.FieldName) = 'MEDIDAS_UDS') or
              (UpperCase(Column.FieldName) = 'TEJIDO_LONA') or
              (UpperCase(Column.FieldName) = 'LONA') or
              (UpperCase(Column.FieldName) = 'COLOR_ESTRUCTURA_COLOR') or
              (UpperCase(Column.FieldName) = 'COLOR') or
              (UpperCase(Column.FieldName) = 'MEDIDAS_LINEA') or
              (UpperCase(Column.FieldName) = 'MEDIDAS_SALIDA')) then
           begin
              // Campos traducidos de JSON a codigo propio
              if (Trim(DMSincronizacionTyC.QMDetalleCODIGO.AsString) = '') and ((UpperCase(Column.FieldName) = 'CODIGO') or (UpperCase(Column.FieldName) = 'DESCRIPCION')) then
                 ColorError(Canvas)
              else
              if (Trim(DMSincronizacionTyC.QMDetalleCOLOR.AsString) = 'SN') and ((UpperCase(Column.FieldName) = 'COLOR_ESTRUCTURA_COLOR') or (UpperCase(Column.FieldName) = 'COLOR')) then
                 ColorError(Canvas)
              else
              if (Trim(DMSincronizacionTyC.QMDetalleLONA.AsString) = '') and ((UpperCase(Column.FieldName) = 'TEJIDO_LONA') or (UpperCase(Column.FieldName) = 'LONA')) then
                 ColorError(Canvas)
              else
                 ColorResaltado(Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionTyC.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMSincronizacionTyC.SBADocumentoDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMSincronizacionTyC.QMCabeceraID_S.AsInteger);
end;

end.
