unit UFMHojaDePreparacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, ULFEdit, StdCtrls, ULFLabel, ULFEditFind2000,
  rxToolEdit, ULFDateEdit, Mask, DBCtrls, ULFDBEdit, RXDBCtrl, ULFDBDateEdit,
  ULFDBEditFind2000, UDBDateTimePicker, UUtiles;

type
  TFMHojaDePreparacion = class(TFPEditDetalle)
     LCliente: TLFLabel;
     LHoja: TLFLabel;
     DBEHoja: TLFDbedit;
     LDireccion: TLFLabel;
     DBEDireccion: TLFDbedit;
     LFechaInicio: TLFLabel;
     LFechaFin: TLFLabel;
     LComentario: TLFLabel;
     LTotalUnidades: TLFLabel;
     LTotalUnidadesLogisticas: TLFLabel;
     DBDEFechaInicio: TLFDBDateEdit;
     DBDEFechaFin: TLFDBDateEdit;
     DBETotalUnidades: TLFDbedit;
     DBETotalUnidadesLogisitcas: TLFDbedit;
     DBEComentario: TLFDbedit;
     LResponsable: TLFLabel;
     DBETituloResponsable: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AListadoHojaPreparacion: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AConfListadoHojaPreparacion: TAction;
     LFActionList1: TLFActionList;
     ARefrescar: TAction;
     TButtRefrescar: TToolButton;
     AGeneraAlbaran: TAction;
     tButtGeneraAlbaran: TToolButton;
     AInfoStocks: TAction;
     ToolButton1: TToolButton;
     TButtInfStocks: TToolButton;
     DBGDetalleUbicacion: TDBGridFind2000;
     ToolButton2: TToolButton;
     NavUbicacion: THYMNavigator;
     CEDetalleUbicacion: TControlEdit;
     CEDetalleUbicacionPMEdit: TPopUpTeclas;
     Splitter1: TSplitter;
     DBEFCliente: TLFDBEditFind2000;
     DBEFResponsable: TLFDBEditFind2000;
     DBEEstado: TLFDbedit;
     DBETituloEstado: TLFDbedit;
     LEstado: TLFLabel;
     DBETituloCliente: TLFDbedit;
     DBEDireccionCompleta: TLFDbedit;
     ToolButton3: TToolButton;
     TButtAtras: TToolButton;
     TButtAdelante: TToolButton;
     AEstadoAtras: TAction;
     AEstadoAdelante: TAction;
     DBDTPFechaIniTime: TDBDateTimePicker;
     DBDateTimePicker1: TDBDateTimePicker;
     LTotalPuntos: TLFLabel;
     DBETotalP: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AConfListadoHojaPreparacionExecute(Sender: TObject);
     procedure AListadoHojaPreparacionExecute(Sender: TObject);
     procedure ARefrescarExecute(Sender: TObject);
     procedure AGeneraAlbaranExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure AInfoStocksExecute(Sender: TObject);
     procedure Splitter1Moved(Sender: TObject);
     procedure PDetalleResize(Sender: TObject);
     procedure AEstadoAdelanteExecute(Sender: TObject);
     procedure AEstadoAtrasExecute(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEEstadoChange(Sender: TObject);
     procedure NavMainChangeState(Sender: TObject);
     procedure DBGDetalleUbicacionKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEHojaChange(Sender: TObject);
     procedure DBGDetalleUbicacionRowChange(Sender: TObject);
     procedure DBGDetalleUbicacionBusqueda(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     procedure ValidaCambioDeEstado;
  public
     { Public declarations }
     procedure ComprobarUnicadesUb;
     procedure FiltraHojas(FiltroAccion: string);
  end;

var
  FMHojaDePreparacion : TFMHojaDePreparacion;

implementation

uses UDMMain, UEntorno, UDMHojaDePreparacion, UFormGest, UDMLstHojaDePreparacion, UFMListConfig, UFMDocInfoStocks, UParam;

{$R *.dfm}

procedure TFMHojaDePreparacion.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMHojaDePreparacion, DMHojaDePreparacion);
  NavMain.DataSource := DMHojaDePreparacion.DSQMCabecera;
  DBGMain.DataSource := DMHojaDePreparacion.DSQMCabecera;
  NavDetalle.DataSource := DMHojaDePreparacion.DSQMDetallePre;
  DBGFDetalle.DataSource := DMHojaDePreparacion.DSQMDetallePre;
  NavUbicacion.DataSource := DMHojaDePreparacion.DSQMDetalleUbicacion;
  DBGDetalleUbicacion.DataSource := DMHojaDePreparacion.DSQMDetalleUbicacion;

  if (LeeParametro('HOJAPRE001', '') = '2') then
  begin
     // Ubicaciones simples
     with DBGDetalleUbicacion do
     begin
        // Columnas a esconder
        FindColumn('CALLE').Visible := False;
        FindColumn('ESTANTERIA').Visible := False;
        FindColumn('REPISA').Visible := False;
        FindColumn('POSICION').Visible := False;

        // Tabla de busqueda de UBICACION por EMP_UBICACION_SIMPLE
        Tablas.Strings[0] := 'EMP_UBICACION_SIMPLE';
        Campos.Strings[0] := 'ID_UBICACION_SIMPLE';
        CamposAMostrar.Strings[0] := 'ID_UBICACION';
        CamposAMostrar.Strings[1] := '0';
        CamposADevolver.Strings[0] := 'ID_UBICACION_SIMPLE';
        Numericos.Strings[0] := 'ID_UBICACION_SIMPLE';
        Titulos.Strings[0] := 'TITULO';
        OrdenadosPor.Strings[0] := 'TITULO';

        CamposDesplegar.Text := '1';
     end;
  end
  else
  begin
     // Ubicaciones complejas
     with DBGDetalleUbicacion do
     begin
        // Columnas a esconder
        FindColumn('TITULO_UBICACION_SIMPLE').Visible := False;

        // Tabla de busqueda de UBICACION por VER_ARTICULOS_UBICACIONES
        Tablas.Strings[0] := 'VER_ARTICULOS_UBICACIONES';
        Campos.Strings[0] := 'ID_UBICACION';
        CamposAMostrar.Strings[0] := 'ID_UBICACION';
        CamposAMostrar.Strings[1] := '0';
        CamposADevolver.Strings[0] := 'ID_UBICACION';
        Numericos.Strings[0] := 'ID_UBICACION';
        Titulos.Strings[0] := 'TITULO_DESCRIPCION';
        OrdenadosPor.Strings[0] := 'TITULO_DESCRIPCION';
     end;
  end;

  // Comprobacion de las unidades del pedido
  ComprobarUnicadesUb;
  ValidaCambioDeEstado;
end;

procedure TFMHojaDePreparacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMHojaDePreparacion);
end;

procedure TFMHojaDePreparacion.AConfListadoHojaPreparacionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstHojaDePreparacion, DMLstHojaDePreparacion);
  TFMListConfig.Create(Self).Muestra(5106, Formato, Cabecera, Copias,
     Pijama, '', DMLstHojaDePreparacion.frHojaDePreparacion);
  CierraData(DMLstHojaDePreparacion);
end;

procedure TFMHojaDePreparacion.AListadoHojaPreparacionExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstHojaDePreparacion, DMLstHojaDePreparacion);
  DMLstHojaDePreparacion.MuestraListado(0, REntorno.Empresa, StrToIntDef(DBEHoja.Text, 0));
  CierraData(DMLstHojaDePreparacion);
end;

procedure TFMHojaDePreparacion.ARefrescarExecute(Sender: TObject);
begin
  inherited;
  DMHojaDePreparacion.Refrescar;
end;

procedure TFMHojaDePreparacion.AGeneraAlbaranExecute(Sender: TObject);
begin
  inherited;
  DMHojaDePreparacion.GeneraAlbaran;
end;

procedure TFMHojaDePreparacion.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if Trim(TablaABuscar) = 'VER_ARTICULOS_UNID_LOG' then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND ' +
           '(ARTICULO=''' + DMHojaDePreparacion.QMDetallePreARTICULO.AsString + ''')';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO,TIPO';
     end;

     if Trim(TablaABuscar) = 'VER_LOTES_UBICACION_DISP_VEN' then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND ' +
           'ARTICULO=''' + DMHojaDePreparacion.QMDetallePreARTICULO.AsString + ''' AND ' +
           'LOTE STARTING WITH ''' + DMHojaDePreparacion.QMDetallePreTIPO_UNIDAD_LOGISTICA.AsString + ''' AND ' +
           'ID_UBICACION=' + DMHojaDePreparacion.QMDetalleUbicacionID_UBICACION.AsString + ' AND ' +
           'CANTIDAD >=' + DMHojaDePreparacion.QMDetalleUbicacionUNIDADES.AsString;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CADUCIDAD,LOTE';
     end;
  end;
end;

procedure TFMHojaDePreparacion.AInfoStocksExecute(Sender: TObject);
var
  Articulo, Almacen : string;
begin
  DMHojaDePreparacion.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TFMHojaDePreparacion.Splitter1Moved(Sender: TObject);
begin
  inherited;
  ToolButton2.Width := Splitter1.Left - ToolButton2.Left + Splitter1.Width;
end;

procedure TFMHojaDePreparacion.PDetalleResize(Sender: TObject);
begin
  inherited;
  DBGFDetalle.Width := PDetalle.Width div 2;
  Splitter1Moved(Sender);
end;

procedure TFMHojaDePreparacion.AEstadoAdelanteExecute(Sender: TObject);
begin
  inherited;
  DMHojaDePreparacion.CambiaEstado(1);
end;

procedure TFMHojaDePreparacion.AEstadoAtrasExecute(Sender: TObject);
begin
  inherited;
  DMHojaDePreparacion.CambiaEstado(-1);
end;

procedure TFMHojaDePreparacion.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  AEstadoAdelante.Enabled := DBEEstado.Text <> '4';
  AEstadoAtras.Enabled := DBEEstado.Text <> '0';
end;

procedure TFMHojaDePreparacion.DBEEstadoChange(Sender: TObject);
begin
  inherited;
  ValidaCambioDeEstado;
end;

procedure TFMHojaDePreparacion.NavMainChangeState(Sender: TObject);
begin
  inherited;
  ValidaCambioDeEstado;
end;

procedure TFMHojaDePreparacion.ValidaCambioDeEstado;
begin
  // Valida cambio de estado para no volver atras cuando esta albaraneado
  TButtAtras.Enabled := ((DBEEstado.Text <> '4') and (DBEEstado.Text <> '0'));
  TButtAdelante.Enabled := (DBEEstado.Text <= '3');
end;

procedure TFMHojaDePreparacion.DBGDetalleUbicacionKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        DMHojaDePreparacion.Infolotes;
  end;
end;

procedure TFMHojaDePreparacion.DBEHojaChange(Sender: TObject);
begin
  inherited;
  // sfg.albert - Es comproben les unitats totals de les ubicacions. Si n'hi ha menys
  // que les unitats de pedido, no permetrà tirar endavant l'estat
  ComprobarUnicadesUb;
end;

procedure TFMHojaDePreparacion.ComprobarUnicadesUb;
begin
  if (DMHojaDePreparacion.ComprobarUnicadesUb) then
  begin
     TButtAdelante.Enabled := False;
     TButtAtras.Enabled := False;
  end
  else
  begin
     ValidaCambioDeEstado;
  end;
end;

procedure TFMHojaDePreparacion.DBGDetalleUbicacionRowChange(Sender: TObject);
begin
  inherited;
  ComprobarUnicadesUb;
end;

procedure TFMHojaDePreparacion.DBGDetalleUbicacionBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if Trim(TablaABuscar) = 'VER_ARTICULOS_UBICACIONES' then
     begin
        CondicionBusqueda := 'ID_A=' + DMHojaDePreparacion.QMDetallePreID_A.AsString + ' AND ' +
           'COMPOSICION STARTING WITH ''' + DMHojaDePreparacion.QMDetallePreALMACEN.AsString + '''';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'GENERAL desc, COMPOSICION';
     end;

     if Trim(TablaABuscar) = 'EMP_UBICACION_SIMPLE' then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TITULO';
     end;
  end;
end;

procedure TFMHojaDePreparacion.FiltraHojas(FiltroAccion: string);
begin
  DMHojaDePreparacion.FiltraHojas(FiltroAccion);
end;

procedure TFMHojaDePreparacion.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'UNIDADES') then
        begin
           if (DMHojaDePreparacion.QMDetallePrePREPARABLE.AsInteger = 1) then
           begin
              // Articulo sin stock preparable. En amarillo
              ColorResaltado(Canvas);
           end
           else if (DMHojaDePreparacion.QMDetallePreUNIDADES_PED.AsFloat > DMHojaDePreparacion.QMDetallePreUNIDADES.AsFloat) then
           begin
              // Linea preparable parcialmente. Verde suave
              ColorResaltado5(Canvas);
           end
           else
           if (DMHojaDePreparacion.QMDetallePreUNIDADES_PED.AsFloat = DMHojaDePreparacion.QMDetallePreUNIDADES.AsFloat) then
           begin
              // Linea preparable totalmente. Verde
              ColorResaltado2(Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMHojaDePreparacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMHojaDePreparacion.BusquedaCompleja;
end;

end.
