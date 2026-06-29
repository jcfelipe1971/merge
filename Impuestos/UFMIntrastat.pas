unit UFMIntrastat;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBMemo, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFEdit;

type
  TFMIntrastat = class(TFPEdit)
     PDetalle: TLFPanel;
     TBDeclaracion: TLFToolBar;
     NavDeclaracion: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGFDeclaracion: TDBGridFind2000;
     LblPeriodo: TLFLabel;
     DBEPeriodo: TLFDbedit;
     TSNotas: TTabSheet;
     TBNotas: TLFToolBar;
     PNL_I_Info: TLFPanel;
     DBE_I_cod: TLFDbedit;
     DBE_I_Nom: TLFDbedit;
     TButtSep: TToolButton;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     PNLEditNotas: TLFPanel;
     DBMMNotas: TLFDBMemo;
     DBRGRealMod: TDBRadioGroup;
     TButtSep2: TToolButton;
     TBRefrescarIntrastat: TToolButton;
     PCDetalle: TLFPageControl;
     TSDeclaracion: TTabSheet;
     TSDetalle: TTabSheet;
     PNLDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     DBETituloPeriodo: TLFDbedit;
     DBEPeriodoDesde: TLFDbedit;
     DBEPeriodoHasta: TLFDbedit;
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     ETituloTipo: TLFEdit;
     LFCategoryAction1: TLFCategoryAction;
     ARefrescarIntrastat: TAction;
     ARecalcularIntrastat: TAction;
     AGeneraFichero: TAction;
     TButtSep3: TToolButton;
     TBRecalcularIntrastat: TToolButton;
     TButtSep4: TToolButton;
     TBGeneraFichero: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBETipoChange(Sender: TObject);
     procedure ARefrescarIntrastatExecute(Sender: TObject);
     procedure ARecalcularIntrastatExecute(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDeclaracionCellClick(Column: TColumn);
     procedure DBGFDeclaracionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AGeneraFicheroExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMIntrastat : TFMIntrastat;

implementation

uses UDMMain, UDMIntrastat, UFormGest, UUtiles, UFMain;

{$R *.dfm}

procedure TFMIntrastat.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMIntrastat, DMIntrastat);

  NavMain.DataSource := DMIntrastat.DSQMIntrastat;
  DBGMain.DataSource := DMIntrastat.DSQMIntrastat;
  DBGFDeclaracion.DataSource := DMIntrastat.DSQMDetalle;
  NavDeclaracion.DataSource := DMIntrastat.DSQMDetalle;
  NavDetalle.DataSource := DMIntrastat.DSDocumentos;
  DBGFDetalle.DataSource := DMIntrastat.DSDocumentos;

  PCDetalle.ActivePage := TSDeclaracion;

  ColActual := DBGFDetalle.Columns[0];
end;

procedure TFMIntrastat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMIntrastat);
end;

procedure TFMIntrastat.DBETipoChange(Sender: TObject);
begin
  inherited;
  if (DBETipo.Text = 'COM') then
     ETituloTipo.Text := _('Compras')
  else
     ETituloTipo.Text := _('Ventas');
end;

procedure TFMIntrastat.ARefrescarIntrastatExecute(Sender: TObject);
begin
  inherited;
  DMIntrastat.GeneraIntrastat(False);
end;

procedure TFMIntrastat.ARecalcularIntrastatExecute(Sender: TObject);
begin
  inherited;
  if (DMIntrastat.QMIntrastatTIPO.AsString = '') or ConfirmaMensaje(format(_('Se borraran los datos modificados para [Tipo: %s Periodo: %s]. Desea continuar?'), [DMIntrastat.QMIntrastatTIPO.AsString, DMIntrastat.QMIntrastatPERIODO.AsString])) then
     DMIntrastat.GeneraIntrastat(True);
end;

procedure TFMIntrastat.DBGFDeclaracionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'CODIGO_MERCANCIA') then
        begin
           if (Trim(DMIntrastat.QMDetalleCODIGO_MERCANCIA.AsString) = '') then
              ColorError(Canvas)
           else
              ColorEdicion(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'MODALIDAD_TRANSPORTE') then
        begin
           if (DMIntrastat.xDocumentosMODALIDAD_TRANSPORTE.AsInteger < 1) then
              ColorResaltado(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMIntrastat.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        if (UpperCase(Column.FieldName) = 'CODIGO_MERCANCIA') then
        begin
           if (Trim(DMIntrastat.xDocumentosCODIGO_MERCANCIA.AsString) = '') then
              ColorError(Canvas)
           else
              ColorEdicion(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'MODALIDAD_TRANSPORTE') then
        begin
           if (DMIntrastat.xDocumentosMODALIDAD_TRANSPORTE.AsInteger < 1) then
              ColorResaltado(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMIntrastat.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'RIG') or (UpperCase(ColActual.FieldName) = 'LINEA')) then
  begin
     if (DBETipo.Text = 'COM') then
        FMain.TraspasoDeDocumentosEntrada(DMIntrastat.xDocumentosID_DOC.AsInteger)
     else
        FMain.TraspasoDeDocumentosSalida(DMIntrastat.xDocumentosID_DOC.AsInteger);
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMIntrastat.xDocumentosARTICULO.AsString + '''' + ' AND EJERCICIO=' + DMIntrastat.xDocumentosEJERCICIO.AsString);
  end;
end;

procedure TFMIntrastat.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMIntrastat.DBGFDeclaracionCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMIntrastat.AGeneraFicheroExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := format('Intrastat_%s_%d_%s.csv', [DBETipo.Text, DMIntrastat.xDocumentosEJERCICIO.AsInteger, DBEPeriodo.Text]);
  if MySaveDialog(Archivo, 'CSV', '', 'FMIntrastat') then
     DMIntrastat.GeneraFichero(Archivo);
end;

procedure TFMIntrastat.DBGFDetalleBusqueda(Sender: TObject);
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

end.
