unit UFMProrrateoCostes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, UFPEditDetalle,
  TFlatCheckBoxUnit, ULFCheckBox, rxToolEdit, RXDBCtrl, ULFDBDateEdit;

type
  TFMProrrateoCostes = class(TFPEdit)
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGFDetalle: TDBGridFind2000;
     LProrrateo: TLFLabel;
     LImporte: TLFLabel;
     LRazon: TLFLabel;
     DBEProrrateo: TLFDbedit;
     DBEImporte: TLFDbedit;
     DBERazon: TLFDbedit;
     TBSep1: TToolButton;
     CBLineasTodosAlbaranes: TLFCheckBox;
     DBGFProrrateoAlb: TDBGridFind2000;
     TSDocumentosOrigen: TTabSheet;
     DBGOrigen: TDBGridFind2000;
     TBOrigen: TLFToolBar;
     NavOrigen: THYMNavigator;
     PNLOrigen: TLFPanel;
     CEDocumentosOrigenPMEdit: TPopUpTeclas;
     CEDocumentosOrigen: TControlEdit;
     PCDetalle: TLFPageControl;
     TSAlbaranes: TTabSheet;
     TBSep2: TToolButton;
     TBAsignaImporte: TToolButton;
     splProrrateo: TSplitter;
     LFecha: TLFLabel;
     DBDEFecha: TLFDBDateEdit;
     DBEImportePrevisto: TLFDbedit;
     LImportePrevisto: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure CBLineasTodosAlbaranesChange(Sender: TObject);
     procedure DBGOrigenBusqueda(Sender: TObject);
     procedure TBAsignaImporteClick(Sender: TObject);
     procedure DBGOrigenDblClick(Sender: TObject);
     procedure DBGOrigenCellClick(Column: TColumn);
     procedure DBGOrigenDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFProrrateoAlbDblClick(Sender: TObject);
     procedure DBGFProrrateoAlbCellClick(Column: TColumn);
     procedure DBGFProrrateoAlbDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure PDetalleResize(Sender: TObject);
     procedure splProrrateoMoved(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     Width_splProrrateo: integer;
  public
     { Public declarations }
  end;

var
  FMProrrateoCostes : TFMProrrateoCostes;

implementation

uses UDMMain, UDMProrrateoCostes, UEntorno, UFormGest, UFMain, UUtiles;

{$R *.dfm}

procedure TFMProrrateoCostes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMProrrateoCostes, DMProrrateoCostes);

  NavMain.DataSource := DMProrrateoCostes.DSxProrrateo;
  DBGMain.DataSource := DMProrrateoCostes.DSxProrrateo;
  G2KTableLoc.DataSource := DMProrrateoCostes.DSxProrrateo;

  NavDetalle.DataSource := DMProrrateoCostes.DSxProrrateoAlbaranes;
  DBGFDetalle.DataSource := DMProrrateoCostes.DSxProrrateoAlbaranes;

  NavOrigen.DataSource := DMProrrateoCostes.DSxProrrateoDocOrigen;
  DBGOrigen.DataSource := DMProrrateoCostes.DSxProrrateoDocOrigen;

  PCDetalle.ActivePage := TSAlbaranes;

  CBLineasTodosAlbaranes.Checked := False;
  ColActual := DBGFDetalle.Columns[0];
end;

procedure TFMProrrateoCostes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  EscribeDatoIni('FMProrrateoCostes', 'Width_splProrrateo', Width_splProrrateo);

  CierraData(DMProrrateoCostes);
end;

procedure TFMProrrateoCostes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMProrrateoCostes.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_SERIES') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO=' + IntToStr(DMProrrateoCostes.xProrrateoAlbaranesEJERCICIO_ORI.AsInteger) +
           ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'SERIE';
     end
     else
     if (Trim(TablaABuscar) = 'EMP_EJERCICIOS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'EJERCICIO DESC';
     end
     else
     if (Trim(TablaABuscar) = 'VER_CABECERAS_ALBARAN_PROV') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO=' + IntToStr(DMProrrateoCostes.xProrrateoAlbaranesEJERCICIO_ORI.AsInteger) +
           ' AND CANAL=' + REntorno.CanalStr +
           ' AND SERIE=''' + DMProrrateoCostes.xProrrateoAlbaranesSERIE_ORI.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'RIG';
     end
     else
     begin
        CondicionBusqueda := '';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMProrrateoCostes.CBLineasTodosAlbaranesChange(Sender: TObject);
begin
  inherited;
  DMProrrateoCostes.LineasTodosAlbaranes(CBLineasTodosAlbaranes.Checked);
end;

procedure TFMProrrateoCostes.DBGOrigenBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'SYS_TIPO_MOVIMIENTO') then
     begin
        CondicionBusqueda := 'TIPO IN (''FCR'',''FAP'')';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     if (Trim(TablaABuscar) = 'EMP_EJERCICIOS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'EJERCICIO DESC';
     end
     else
     if (Trim(TablaABuscar) = 'VER_SERIES') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO=' + IntToStr(DMProrrateoCostes.xProrrateoDocOrigenEJERCICIO_ORI.AsInteger) +
           ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'SERIE';
     end
     else
     if (Trim(TablaABuscar) = 'GES_CABECERAS_E') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO=' + IntToStr(DMProrrateoCostes.xProrrateoDocOrigenEJERCICIO_ORI.AsInteger) +
           ' AND CANAL=' + REntorno.CanalStr +
           ' AND TIPO = ''' + DMProrrateoCostes.xProrrateoDocOrigenTIPO_ORI.AsString + ''' ' +
           ' AND SERIE=''' + DMProrrateoCostes.xProrrateoDocOrigenSERIE_ORI.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'RIG';
     end
     else
     begin
        CondicionBusqueda := '';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMProrrateoCostes.TBAsignaImporteClick(Sender: TObject);
begin
  inherited;
  DMProrrateoCostes.AsingaImporte;
end;

procedure TFMProrrateoCostes.DBGOrigenDblClick(Sender: TObject);
var
  ProveedorTercero : integer;
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(ColActual.FieldName) = 'TIPO_ORI') or (UpperCase(ColActual.FieldName) = 'EJERCICIO_ORI') or (UpperCase(ColActual.FieldName) = 'SERIE_ORI') or (UpperCase(ColActual.FieldName) = 'RIG_ORI') or (UpperCase(ColActual.FieldName) = 'TITULO') then
     begin
        FMain.TraspasoDeDocumentosEntrada(DMProrrateoCostes.xProrrateoDocOrigenID_E_ORI.AsInteger);
     end;

     if (UpperCase(ColActual.FieldName) = 'TITULO') then
     begin
        ProveedorTercero := DMProrrateoCostes.DameProvedoorTercero(DMProrrateoCostes.xProrrateoDocOrigenTIPO_ORI.AsString, DMProrrateoCostes.xProrrateoDocOrigenID_E_ORI.AsInteger);
        if (DMProrrateoCostes.xProrrateoDocOrigenTIPO_ORI.AsString = 'FAP') then
           FMain.EjecutaAccion(FMain.AProveedores,
              'Proveedor = ' + IntToStr(ProveedorTercero) + ' and Ejercicio = ' +
              IntToStr(DMProrrateoCostes.xProrrateoDocOrigenEJERCICIO_ORI.AsInteger));

        if (DMProrrateoCostes.xProrrateoDocOrigenTIPO_ORI.AsString = 'FCR') then
           FMain.EjecutaAccion(FMain.AAcreedores, 'Tercero = ' + IntToStr(ProveedorTercero) + ' and Ejercicio = ' + IntToStr(DMProrrateoCostes.xProrrateoDocOrigenEJERCICIO_ORI.AsInteger));

     end;
  end;
end;

procedure TFMProrrateoCostes.DBGOrigenCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMProrrateoCostes.DBGOrigenDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'TIPO_ORI') or (UpperCase(Column.FieldName) = 'EJERCICIO_ORI') or (UpperCase(Column.FieldName) = 'SERIE_ORI') or (UpperCase(Column.FieldName) = 'RIG_ORI') or (UpperCase(Column.FieldName) = 'TITULO') then
        CeldaEnlace(THYTDBGrid(Sender), Rect);

     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'MONEDA') then
        begin
           if (DMProrrateoCostes.xProrrateoAlbaranesMONEDA.AsString <> REntorno.Moneda) then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMProrrateoCostes.DBGFProrrateoAlbDblClick(Sender: TObject);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(ColActual.FieldName) = 'EJERCICIO_ORI') or (UpperCase(ColActual.FieldName) = 'SERIE_ORI') or (UpperCase(ColActual.FieldName) = 'RIG_ORI') then
     begin
        FMain.TraspasoDeDocumentosEntrada(DMProrrateoCostes.xProrrateoLineasID_E_ORI.AsInteger);
     end
     else
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     begin
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMProrrateoCostes.xProrrateoLineasARTICULO.AsString + '''');
     end;
  end;
end;

procedure TFMProrrateoCostes.DBGFProrrateoAlbCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMProrrateoCostes.DBGFProrrateoAlbDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'EJERCICIO_ORI') or (UpperCase(Column.FieldName) = 'SERIE_ORI') or (UpperCase(Column.FieldName) = 'RIG_ORI') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
        CeldaEnlace(THYTDBGrid(Sender), Rect);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMProrrateoCostes.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'EJERCICIO_ORI') or (UpperCase(Column.FieldName) = 'SERIE_ORI') or (UpperCase(Column.FieldName) = 'RIG_ORI') or (UpperCase(Column.FieldName) = 'PROVEEDOR') or (UpperCase(Column.FieldName) = 'NOMBRE_R_SOCIAL') then
        CeldaEnlace(THYTDBGrid(Sender), Rect);

     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'MONEDA') then
        begin
           if (DMProrrateoCostes.xProrrateoAlbaranesMONEDA.AsString <> REntorno.Moneda) then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMProrrateoCostes.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (UpperCase(ColActual.FieldName) = 'EJERCICIO_ORI') or (UpperCase(ColActual.FieldName) = 'SERIE_ORI') or (UpperCase(ColActual.FieldName) = 'RIG_ORI') then
     begin
        FMain.TraspasoDeDocumentosEntrada(DMProrrateoCostes.xProrrateoAlbaranesID_E_ORI.AsInteger);
     end;

     if ((UpperCase(ColActual.FieldName) = 'PROVEEDOR') or (UpperCase(ColActual.FieldName) = 'NOMBRE_R_SOCIAL')) then
     begin
        FMain.EjecutaAccion(FMain.AProveedores,
           'Proveedor = ' + DMProrrateoCostes.xProrrateoAlbaranesPROVEEDOR.AsString + ' and Ejercicio = ' +
           IntToStr(DMProrrateoCostes.xProrrateoAlbaranesEJERCICIO.AsInteger));
     end;

  end;
end;

procedure TFMProrrateoCostes.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMProrrateoCostes.PDetalleResize(Sender: TObject);
begin
  inherited;
  // Por lo menos el panel de datos de prorrateo debe ser de 250px
  if DBGFProrrateoAlb.Width < 250 then
  begin
     Width_splProrrateo := TSAlbaranes.Width - 250;
     DBGFDetalle.Width := Width_splProrrateo;
  end;
end;

procedure TFMProrrateoCostes.splProrrateoMoved(Sender: TObject);
begin
  inherited;
  Width_splProrrateo := DBGFDetalle.Width;
end;

procedure TFMProrrateoCostes.FormShow(Sender: TObject);
begin
  inherited;
  Width_splProrrateo := LeeDatoIni('FMProrrateoCostes', 'Width_splProrrateo', 0);
  if (Width_splProrrateo = 0) then
     Width_splProrrateo := 250;
  DBGFDetalle.Width := Width_splProrrateo;

  if Width_splProrrateo > TSAlbaranes.Width - 250 then
  begin
     Width_splProrrateo := TSAlbaranes.Width - 250;
     DBGFDetalle.Width := Width_splProrrateo;
  end;
end;

end.
