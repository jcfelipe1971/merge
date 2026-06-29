unit UFMDiarioReparaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, StdCtrls, Mask, rxToolEdit, ULFDateEdit, Buttons, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFEdit,
  ULFPageControl;

type
  TFMDiarioReparaciones = class(TFPEditSimple)
     DBGDiarioReparaciones: TNsDBGrid;
     PNLFiltro: TLFPanel;
     LHastaFecha: TLFLabel;
     LDesdeFecha: TLFLabel;
     BEjercicio: TSpeedButton;
     BMes: TSpeedButton;
     BMesAnterior: TSpeedButton;
     BMesSiguiente: TSpeedButton;
     BEjercicioAnterior: TSpeedButton;
     BEjercicioSiguiente: TSpeedButton;
     DTPFecha_Hasta: TLFDateEdit;
     DTPFecha_Desde: TLFDateEdit;
     PNLTitSerie: TLFPanel;
     LSerie: TLFLabel;
     ETitSerie: TLFEdit;
     EFSerie: TLFEditFind2000;
     BFiltrar: TButton;
     PCMain: TLFPageControl;
     TSDiarioReparaciones: TTabSheet;
     TSDiarioFacturacion: TTabSheet;
     DBGDiarioFacturacion: TNsDBGrid;
     TSTrazabilidadCompras: TTabSheet;
     DBGTrazabilidadCompras: TNsDBGrid;
     AEnviarInformes: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BEjercicioAnteriorClick(Sender: TObject);
     procedure BEjercicioClick(Sender: TObject);
     procedure BEjercicioSiguienteClick(Sender: TObject);
     procedure BMesAnteriorClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure BFiltrarClick(Sender: TObject);
     procedure DBGDiarioReparacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGDiarioReparacionesDblClick(Sender: TObject);
     procedure DBGDiarioReparacionesCellClick(Column: TColumn);
     procedure TSDiarioFacturacionShow(Sender: TObject);
     procedure TSDiarioReparacionesShow(Sender: TObject);
     procedure TSTrazabilidadComprasShow(Sender: TObject);
     procedure AEnviarInformesExecute(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     procedure EnviarInformes;
     procedure ReporteInformeCaja;
     procedure ReporteDiarioFacturacion;
     procedure ReporteTrazabilidadCompras;
  end;

var
  FMDiarioReparaciones : TFMDiarioReparaciones;

implementation

uses UFormGest, UDMMain, UFMain, UUtiles, UEntorno, UParam, UDMDiarioReparaciones;

{$R *.dfm}

procedure TFMDiarioReparaciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDiarioReparaciones, DMDiarioReparaciones);

  NavMain.DataSource := DMDiarioReparaciones.DSCabReparar;
  DBGDiarioReparaciones.DataSource := DMDiarioReparaciones.DSCabReparar;

  PCMain.ActivePage := TSDiarioReparaciones;

  if REntorno.SerieRestringida <> '' then {dji lrk kri}
     EFSerie.Text := REntorno.SerieRestringida
  else
     EFSerie.Text := REntorno.Serie;

  EFSerie.Enabled := REntorno.SerieRestringida = '';

  BMes.Click;
  BFiltrar.Click;

  ColActual := DBGDiarioReparaciones.Columns[0];

  // Asignacion de imagenes a botones
  GetBitmapFromImageList(BEjercicioAnterior, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(BEjercicioAnterior, 2, DMMain.ILMain_In, 51);
  GetBitmapFromImageList(BEjercicio, 1, DMMain.ILMain_Ac, 50);
  GetBitmapFromImageList(BEjercicio, 2, DMMain.ILMain_In, 50);
  GetBitmapFromImageList(BEjercicioSiguiente, 1, DMMain.ILMain_Ac, 25);
  GetBitmapFromImageList(BEjercicioSiguiente, 2, DMMain.ILMain_In, 25);
  GetBitmapFromImageList(BMesAnterior, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(BMesAnterior, 2, DMMain.ILMain_In, 51);
  GetBitmapFromImageList(BMes, 1, DMMain.ILMain_Ac, 9);
  GetBitmapFromImageList(BMes, 2, DMMain.ILMain_In, 9);
  GetBitmapFromImageList(BMesSiguiente, 1, DMMain.ILMain_Ac, 25);
  GetBitmapFromImageList(BMesSiguiente, 2, DMMain.ILMain_In, 25);
end;

procedure TFMDiarioReparaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDiarioReparaciones);
end;

procedure TFMDiarioReparaciones.BEjercicioAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'E-');
end;

procedure TFMDiarioReparaciones.BEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'EJE');
end;

procedure TFMDiarioReparaciones.BEjercicioSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'E+');
end;

procedure TFMDiarioReparaciones.BMesAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'M-');
end;

procedure TFMDiarioReparaciones.BMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'MES');
end;

procedure TFMDiarioReparaciones.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'M+');
end;

procedure TFMDiarioReparaciones.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  inherited;

  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMDiarioReparaciones.Filtrar(EFSerie.Text, DTPFecha_Desde.Date, DTPFecha_Hasta.Date);
  end;
end;

procedure TFMDiarioReparaciones.BFiltrarClick(Sender: TObject);
begin
  inherited;
  DMDiarioReparaciones.Filtrar(EFSerie.Text, DTPFecha_Desde.Date, DTPFecha_Hasta.Date);
end;

procedure TFMDiarioReparaciones.DBGDiarioReparacionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'IDCABREPARAR') or (UpperCase(Column.FieldName) = 'TIPO') or
     (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'SERIE_DOC') or
     (UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'ALB_COMPRA') or (UpperCase(Column.FieldName) = 'FAC_VENTA') then
     CeldaEnlace(DBGDiarioReparaciones, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if ((Column.FieldName = 'TIPO') or (Column.FieldName = 'SERIE') or (Column.FieldName = 'SERIE_DOC') or (Column.FieldName = 'RIG')) then
        begin
           if (DataSource.DataSet.FieldByName('RIG').AsInteger <> 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if ((Column.FieldName = 'ESTADO') or (Column.FieldName = 'TITULO_ESTADO')) then
        begin
           ColorSegunEstadoRep(Canvas, DataSource.DataSet.FieldByName('ESTADO').AsInteger);
        end
        else
        if ((Column.FieldName = 'ESTADO_REP') or (Column.FieldName = 'TITULO_ESTADO_REP')) then
        begin
           ColorSegunEstadoRep(Canvas, DataSource.DataSet.FieldByName('ESTADO_REP').AsInteger);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMDiarioReparaciones.DBGDiarioReparacionesDblClick(Sender: TObject);
begin
  inherited;

  if (UpperCase(ColActual.FieldName) = 'IDCABREPARAR') then
     FMain.EjecutaAccion(FMain.AReparaciones, Format('IDCABREPARAR=%d', [TNSDBGrid(Sender).DataSource.DataSet.FieldByName('IDCABREPARAR').AsInteger]));

  if (UpperCase(ColActual.FieldName) = 'ID_S') or (UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'SERIE_DOC') or (UpperCase(ColActual.FieldName) = 'RIG') or (UpperCase(ColActual.FieldName) = 'FAC_VENTA') then
     FMain.TraspasoDeDocumentosSalida(TNSDBGrid(Sender).DataSource.DataSet.FieldByName('ID_S').AsInteger);

  if (UpperCase(ColActual.FieldName) = 'ID_E') or (UpperCase(ColActual.FieldName) = 'ALB_COMPRA') then
     FMain.TraspasoDeDocumentosEntrada(TNSDBGrid(Sender).DataSource.DataSet.FieldByName('ID_E').AsInteger);
end;

procedure TFMDiarioReparaciones.DBGDiarioReparacionesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMDiarioReparaciones.TSDiarioFacturacionShow(Sender: TObject);
begin
  inherited;
  NavMain.DataSource := DMDiarioReparaciones.DSxDiarioFac;
end;

procedure TFMDiarioReparaciones.TSDiarioReparacionesShow(Sender: TObject);
begin
  inherited;
  NavMain.DataSource := DMDiarioReparaciones.DSCabReparar;
end;

procedure TFMDiarioReparaciones.TSTrazabilidadComprasShow(Sender: TObject);
begin
  inherited;
  NavMain.DataSource := DMDiarioReparaciones.DSxTazabilidadCompras;
end;

procedure TFMDiarioReparaciones.EnviarInformes;
begin
  ReporteDiarioFacturacion; // Se envía Diario de Reparaciones como Diario de Facturacion
  ReporteTrazabilidadCompras;
  ReporteInformeCaja;
end;

procedure TFMDiarioReparaciones.AEnviarInformesExecute(Sender: TObject);
begin
  inherited;
  EnviarInformes;
end;

procedure TFMDiarioReparaciones.ReporteDiarioFacturacion;
var
  Destinatarios : string;
begin
  // Se envía Diario de Reparaciones como Diario de Facturacion
  PCMain.ActivePage := TSDiarioReparaciones;
  try
     // Dia - "Todas las Series"
     DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'DIA');
     Destinatarios := 'gerencia@vcvauto.com, ignacio@vcvauto.com, javier@vcvauto.com, duilioisola@delfos.net';
     {$IFDEF Debug}
     DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'MES');
     Destinatarios := 'duilioisola@delfos.net, duilioisola@gmail.com, duilioisola@tuta.io';
     {$ENDIF}

     DMDiarioReparaciones.Filtrar('', DTPFecha_Desde.Date, DTPFecha_Hasta.Date);
     DMDiarioReparaciones.EnviarDiarioFacturacion(Destinatarios);
  except
     on e: Exception do
        DMMain.LogProduccion('FMDiarioReparaciones.ReporteDiarioFacturacion' + #13#10 + E.Message);
  end;
end;

procedure TFMDiarioReparaciones.ReporteInformeCaja;
var
  Destinatarios : string;
begin
  PCMain.ActivePage := TSDiarioFacturacion;
  try
     // Dia - "Todas las Series"
     DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'DIA');
     Destinatarios := 'gerencia@vcvauto.com, ana@vcvauto.com, ignacio@vcvauto.com, javier@vcvauto.com, duilioisola@delfos.net';
     {$IFDEF Debug}
     DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'MES');
     Destinatarios := 'duilioisola@delfos.net, duilioisola@gmail.com, duilioisola@tuta.io';
     {$ENDIF}

     DMDiarioReparaciones.Filtrar('', DTPFecha_Desde.Date, DTPFecha_Hasta.Date);
     DMDiarioReparaciones.EnviarInformeCaja(Destinatarios);
  except
     on e: Exception do
        DMMain.LogProduccion('FMDiarioReparaciones.ReporteInformeCaja' + #13#10 + E.Message);
  end;
end;

procedure TFMDiarioReparaciones.ReporteTrazabilidadCompras;
var
  Destinatarios : string;
begin
  PCMain.ActivePage := TSTrazabilidadCompras;
  try
     // Semana - "Todas las Series"
     Destinatarios := 'gerencia@vcvauto.com, ana@vcvauto.com, javier@vcvauto.com, duilioisola@delfos.net';
     DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'SEM');
     {$IFDEF Debug}
     Destinatarios := 'duilioisola@delfos.net, duilioisola@gmail.com, duilioisola@tuta.io';
     DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'MES');
     {$ENDIF}

     DMDiarioReparaciones.Filtrar('', DTPFecha_Desde.Date, DTPFecha_Hasta.Date);
     DMDiarioReparaciones.EnviarTrazabilidadCompras(Destinatarios);
  except
     on e: Exception do
        DMMain.LogProduccion('FMDiarioReparaciones.ReporteTrazabilidadCompras' + #13#10 + E.Message);
  end;
end;

end.
