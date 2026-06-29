unit ZUFMSeriesCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  UHYDescription, ULFHYDBDescription, ULFDBEditFind2000, rxToolEdit,
  RXDBCtrl, ULFDBDateEdit;

type
  TZFMSeriesCli = class(TFPEditDetalle)
     LID: TLFLabel;
     LFDBId: TLFDbedit;
     LFecha: TLFLabel;
     LFDBFecha: TLFDBDateEdit;
     LCliente: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     ECliente: TLFDbedit;
     AExportacionExcel: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PBExportacion: TProgressBar;
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AExportacionExcelExecute(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     SWFil, SWEnlace: integer;
  public
     { Public declarations }
  end;

var
  ZFMSeriesCli : TZFMSeriesCli;

implementation

uses ZUDMSeriesCliente, UDMMain, UFormGest, UEntorno, UFMain, UUtiles;

{$R *.dfm}

procedure TZFMSeriesCli.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMSeriesCli, ZDMSeriesCli);

  NavMain.DataSource := ZDMSeriesCli.DSCabSeriesCli;
  NavDetalle.DataSource := ZDMSeriesCli.DSDetSeriesCli;
  DBGFDetalle.DataSource := ZDMSeriesCli.DSDetSeriesCli;
end;

procedure TZFMSeriesCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMSeriesCli);
end;

procedure TZFMSeriesCli.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  if (Trim(DBGFDetalle.TablaABuscar) = 'VER_ARTICULOS_EF') then
  begin
     DBGFDetalle.CondicionBusqueda :=
        'EMPRESA=' + IntToStr(ZDMSeriesCli.QMDetSeriesCliEMPRESA.AsInteger) + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + IntToStr(ZDMSeriesCli.QMDetSeriesCliCANAL.AsInteger) + ' AND ' +
        'FAMILIA<>''' + REntorno.FamSistema + '''';
  end;

  if (Trim(DBGFDetalle.TablaABuscar) = 'ART_ARTICULOS_SERIALIZACION') then
  begin
     DBGFDetalle.CondicionBusqueda :=
        'EMPRESA=' + IntToStr(ZDMSeriesCli.QMDetSeriesCliEMPRESA.AsInteger) + ' AND CANAL=' + IntToStr(ZDMSeriesCli.QMDetSeriesCliCANAL.AsInteger) +
        ' AND ARTICULO=''' + ZDMSeriesCli.QMDetSeriesCliARTICULO.AsString + '''' +
        ' AND ALMACEN =''' + ZDMSeriesCli.QMDetSeriesCliALMACEN.AsString + '''';
  end;

  if (Trim(DBGFDetalle.TablaABuscar) = 'ART_ALMACENES') then
     DBGFDetalle.CondicionBusqueda := 'EMPRESA=' + IntToStr(ZDMSeriesCli.QMDetSeriesCliEMPRESA.AsInteger);
end;

procedure TZFMSeriesCli.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'NSERIE') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(DBGFDetalle, Rect);
end;

procedure TZFMSeriesCli.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TZFMSeriesCli.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  inherited;
  Resultado := ZDMSeriesCli.BusquedaCompleja;
  if (Resultado in [mrOk, mrAll]) then
  begin
     SWFil := 1;
     SWEnlace := 0;
  end;
  Continua := False;
end;

procedure TZFMSeriesCli.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'NSERIE') then
  begin
     FMain.EjecutaAccion(FMain.ASerializacion, 'EMPRESA = ' +
        IntToStr(ZDMSeriesCli.QMDetSeriesCliEMPRESA.AsInteger) +
        ' AND CANAL=' + IntToStr(ZDMSeriesCli.QMDetSeriesCliCANAL.AsInteger) +
        ' AND CODIGO=' + IntToStr(ZDMSeriesCli.QMDetSeriesCliCODIGO.AsInteger));
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     if EstructuraCreada and PDetalle.Enabled then
        FMain.EjecutaAccion(FMain.AArticulos,
           'ARTICULO = ''' + ZDMSeriesCli.QMDetSeriesCliARTICULO.AsString + '''');
  end;
end;

procedure TZFMSeriesCli.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TZFMSeriesCli.AExportacionExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := LimpiaNombreFichero(Format(_('NroSerieCliente_%s.xls'), [FormatDateTime('yyyymmdd-hhnnss', Now)]));
  if MySaveDialog(Archivo, 'XLS,ODS,CSV', '', 'ZFMSeriesCli') then
  begin
     Screen.Cursor := crHourGlass;
     try
        // AbreData(TDMLstFactura, DMLstFactura);
        PBExportacion.Visible := True;
        ZDMSeriesCli.ExportacionExcel(Archivo, PBExportacion);
     finally
        Screen.Cursor := crDefault;
        PBExportacion.Visible := False;
        // CierraData(DMLstFactura);
     end;
  end;
end;

end.
