unit UFMIEPNR;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBMemo, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFEdit,
  ULFEditFind2000;

type
  TFMIEPNR = class(TFPEdit)
     PDetalle: TLFPanel;
     TBAsientos: TLFToolBar;
     NavAsientos: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGFAsientos: TDBGridFind2000;
     LblPeriodo: TLFLabel;
     DBEPeriodo: TLFDbedit;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     TButtSep2: TToolButton;
     PCDetalle: TLFPageControl;
     TSAsientos: TTabSheet;
     TSDetalle: TTabSheet;
     PNLDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     DBETituloPeriodo: TLFDbedit;
     DBEPeriodoDesde: TLFDbedit;
     DBEPeriodoHasta: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ARegenerarIEPNR: TAction;
     AGeneraFicheroAsientos: TAction;
     TButtSep3: TToolButton;
     TBRecalcularIntrastat: TToolButton;
     TButtSep4: TToolButton;
     TBGeneraFichero: TToolButton;
     TBSep1: TToolButton;
     TBSep2: TToolButton;
     TBButRegenerarIEPNR: TToolButton;
     TBTodos: TToolButton;
     TBDeclarar: TToolButton;
     TBSep3: TToolButton;
     PNLFiltroProveedor: TLFPanel;
     LFLabel1: TLFLabel;
     EFiltroProveedor: TLFEdit;
     EFFiltroProveedor: TLFEditFind2000;
     TSDeclaracion: TTabSheet;
     PNLDeclaracion: TLFPanel;
     TBDeclaracion: TLFToolBar;
     NavDeclaracion: THYMNavigator;
     ToolButton1: TToolButton;
     TBRefrescarDeclaracion: TToolButton;
     DBGFDeclaracion: TDBGridFind2000;
     PNLDeclaracionDet: TLFPanel;
     LCIP: TLFLabel;
     ECIP: TLFEdit;
     AGenerarFicheroDeclaracion: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARegenerarIEPNRExecute(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFAsientosCellClick(Column: TColumn);
     procedure DBGFAsientosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AGeneraFicheroAsientosExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure TBTodosClick(Sender: TObject);
     procedure TBDeclararClick(Sender: TObject);
     procedure EFFiltroProveedorChange(Sender: TObject);
     procedure AGenerarFicheroDeclaracionExecute(Sender: TObject);
     procedure ECIPChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure TBRefrescarDeclaracionClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     FiltraTodos: boolean;
  public
     { Public declarations }
  end;

var
  FMIEPNR : TFMIEPNR;

implementation

uses UDMMain, UDMIEPNR, UFormGest, UUtiles, UFMain;

{$R *.dfm}

procedure TFMIEPNR.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMIEPNR, DMIEPNR);

  NavMain.DataSource := DMIEPNR.DSxPeriodos;
  DBGMain.DataSource := DMIEPNR.DSxPeriodos;
  NavDeclaracion.DataSource := DMIEPNR.DSQMDeclaracion;
  DBGFDeclaracion.DataSource := DMIEPNR.DSQMDeclaracion;
  DBGFAsientos.DataSource := DMIEPNR.DSQMAsientos;
  NavAsientos.DataSource := DMIEPNR.DSQMAsientos;
  NavDetalle.DataSource := DMIEPNR.DSQMDetalle;
  DBGFDetalle.DataSource := DMIEPNR.DSQMDetalle;

  PCDetalle.ActivePage := TSAsientos;

  ColActual := DBGFDetalle.Columns[0];
end;

procedure TFMIEPNR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMIEPNR);
end;

procedure TFMIEPNR.ARegenerarIEPNRExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(format(_('Se borraran los datos modificados para el Periodo: %s. Desea continuar?'), [DMIEPNR.xPeriodosPERIODO.AsString])) then
     DMIEPNR.GeneraIEPNR(True);
end;

procedure TFMIEPNR.DBGFAsientosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
{
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'CODIGO_MERCANCIA') then
        begin
           if (Trim(DMIEPNR.QMDetalleCODIGO_MERCANCIA.AsString) = '') then
              ColorError(Canvas)
           else
              ColorEdicion(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'MODALIDAD_TRANSPORTE') then
        begin
           if (DMIEPNR.xDocumentosMODALIDAD_TRANSPORTE.AsInteger < 1) then
              ColorResaltado(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;
}
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMIEPNR.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'LINEA') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'CLAVE_PRODUCTO') then
        begin
           if (Trim(DMIEPNR.QMDetalleCLAVE_PRODUCTO.AsString) <> Trim(DMIEPNR.QMDetalleART_CLAVE_PRODUCTO.AsString)) then
              ColorResaltado3(Canvas)
           else
              ColorEdicion(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'KILOGRAMOS') then
        begin
           if (Trim(DMIEPNR.QMDetalleCLAVE_PRODUCTO.AsString) = '') then
              ColorInactivo(Canvas)
           else
           begin
              if (DMIEPNR.QMDetalleKILOGRAMOS.AsFloat > 0) then
                 ColorEdicion(Canvas)
              else
                 ColorResaltado(Canvas);
           end;
        end
        else
        if (UpperCase(Column.FieldName) = 'KILOGRAMOS_NO_RECICLADOS') then
        begin
           if (Trim(DMIEPNR.QMDetalleCLAVE_PRODUCTO.AsString) = '') then
              ColorInactivo(Canvas)
           else
           begin
              if (DMIEPNR.QMDetalleKILOGRAMOS_NO_RECICLADOS.AsFloat > 0) then
                 ColorEdicion(Canvas)
              else
                 ColorResaltado(Canvas);
           end;
        end
        else
        if (UpperCase(Column.FieldName) = 'CONCEPTO') then
        begin
           if (Trim(DMIEPNR.QMDetalleCLAVE_PRODUCTO.AsString) = '') then
              ColorInactivo(Canvas)
           else
           begin
              if (Trim(DMIEPNR.QMDetalleCONCEPTO.AsString) > '') then
                 ColorEdicion(Canvas)
              else
                 ColorError(Canvas);
           end;
        end
        else
        if (UpperCase(Column.FieldName) = 'REGIMEN_FISCAL') then
        begin
           if (Trim(DMIEPNR.QMDetalleCLAVE_PRODUCTO.AsString) = '') then
              ColorInactivo(Canvas)
           else
           begin
              if (Trim(DMIEPNR.QMDetalleREGIMEN_FISCAL.AsString) > '') then
                 ColorEdicion(Canvas)
              else
                 ColorError(Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMIEPNR.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG') or (UpperCase(ColActual.FieldName) = 'LINEA')) then
  begin
     FMain.TraspasoDeDocumentosEntrada(DMIEPNR.QMDetalleID_E.AsInteger);
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMIEPNR.QMDetalleARTICULO.AsString + '''' + ' AND EJERCICIO=' + DMIEPNR.QMDetalleEJERCICIO.AsString);
  end
  else
  if (UpperCase(ColActual.FieldName) = 'PROVEEDOR_DESTINATARIO') or (UpperCase(ColActual.FieldName) = 'PROVEEDOR_DESTINATARIO_DOC') then
  begin
     FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + IntToStr(DMIEPNR.QMDetallePROVEEDOR.AsInteger));
  end;
end;

procedure TFMIEPNR.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMIEPNR.DBGFAsientosCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMIEPNR.AGenerarFicheroDeclaracionExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := format('MOD592_Declaracion_%d-%s.csv', [DMIEPNR.xPeriodosEJERCICIO.AsInteger, DBEPeriodo.Text]);
  if (MySaveDialog(Archivo, 'CSV', '', 'FMIEPNR-FicheroDeclaracion')) then
  begin
     DMIEPNR.GeneraFicheroDeclaracion(Archivo);
  end;
end;

procedure TFMIEPNR.AGeneraFicheroAsientosExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := format('MOD592_Asientos_%d-%s.csv', [DMIEPNR.xPeriodosEJERCICIO.AsInteger, DBEPeriodo.Text]);
  if (MySaveDialog(Archivo, 'CSV', '', 'FMIEPNR-FicheroAsientos')) then
  begin
     DMIEPNR.GeneraFicheroAsientos(Archivo);
  end;
end;

procedure TFMIEPNR.DBGFDetalleBusqueda(Sender: TObject);
begin
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'SYS_PAISES') then
     begin
        CondicionBusqueda := 'PERTENECE_CEE = 1';
     end;
  end;
end;

procedure TFMIEPNR.TBTodosClick(Sender: TObject);
begin
  inherited;
  FiltraTodos := True;
  DMIEPNR.FiltraDetalles(FiltraTodos, StrToIntDef(EFFiltroProveedor.Text, 0));
end;

procedure TFMIEPNR.TBDeclararClick(Sender: TObject);
begin
  inherited;
  FiltraTodos := False;
  DMIEPNR.FiltraDetalles(FiltraTodos, StrToIntDef(EFFiltroProveedor.Text, 0));
end;

procedure TFMIEPNR.EFFiltroProveedorChange(Sender: TObject);
begin
  inherited;
  DMIEPNR.FiltraDetalles(FiltraTodos, StrToIntDef(EFFiltroProveedor.Text, 0));
end;

procedure TFMIEPNR.ECIPChange(Sender: TObject);
begin
  inherited;
  DMIEPNR.SetCIP(ECIP.Text);
end;

procedure TFMIEPNR.FormActivate(Sender: TObject);
begin
  inherited;
  DMIEPNR.SetCIP(ECIP.Text);
end;

procedure TFMIEPNR.TBRefrescarDeclaracionClick(Sender: TObject);
begin
  inherited;
  DMIEPNR.RefrescarDeclaracion;
end;

end.
