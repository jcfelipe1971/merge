unit UFMEstadisticasComparadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, ULFPageControl, StdCtrls, ULFLabel, Mask,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, UFPEditSinNavegador, ULFDateEdit,
  Buttons;

type
  TFMEstadisticasComparadas = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSFamilia: TTabSheet;
     TSArticulo: TTabSheet;
     TSCliente: TTabSheet;
     DBGFamilias: THYTDBGrid;
     DBGArticulos: THYTDBGrid;
     DBGClientes: THYTDBGrid;
     PNLFiltros: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DEFechaDesde: TLFDateEdit;
     DEFechaHasta: TLFDateEdit;
     TBFamilia: TLFToolBar;
     NavFamilias: THYMNavigator;
     TBSep1: TToolButton;
     TBRefrescarFamilia: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     ARefrescarEstadisicaFamilia: TAction;
     ARefrescarEstadisicaArticulo: TAction;
     ARefrescarEstadisicaCliente: TAction;
     TBArticulos: TLFToolBar;
     NavArticulos: THYMNavigator;
     TBSep2: TToolButton;
     TBRefrescarArticulos: TToolButton;
     TBClientes: TLFToolBar;
     NavClientes: THYMNavigator;
     TBSep3: TToolButton;
     TBRefrescarClientes: TToolButton;
     BEjercicio: TSpeedButton;
     BMes: TSpeedButton;
     BMesAnterior: TSpeedButton;
     BMesSiguiente: TSpeedButton;
     BEjercicioAnterior: TSpeedButton;
     BEjercicioSiguiente: TSpeedButton;
     SBRefrescaTodas: TSpeedButton;
     ARefrescarTodas: TAction;
     TSClienteFamilia: TTabSheet;
     TSClienteArticulo: TTabSheet;
     TBClientesFamilia: TLFToolBar;
     NavClientesFamilia: THYMNavigator;
     TBSep4: TToolButton;
     TBRefrescarClientesFamilia: TToolButton;
     DBGClientesFamilia: THYTDBGrid;
     TBClientesArticulo: TLFToolBar;
     NavClientesArticulo: THYMNavigator;
     TBSep5: TToolButton;
     TBRefrescarClientesArticulo: TToolButton;
     DBGClientesArticulo: THYTDBGrid;
     ARefrescarEstadisicaClienteFamilia: TAction;
     ARefrescarEstadisicaClienteArticulo: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARefrescarEstadisicaFamiliaExecute(Sender: TObject);
     procedure ARefrescarEstadisicaArticuloExecute(Sender: TObject);
     procedure ARefrescarEstadisicaClienteExecute(Sender: TObject);
     procedure DBGDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGClientesDblClick(Sender: TObject);
     procedure DBGArticulosDblClick(Sender: TObject);
     procedure BEjercicioClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BEjercicioAnteriorClick(Sender: TObject);
     procedure BEjercicioSiguienteClick(Sender: TObject);
     procedure BMesAnteriorClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure ARefrescarTodasExecute(Sender: TObject);
     procedure SBRefrescaTodasClick(Sender: TObject);
     procedure DBGClientesFamiliaDblClick(Sender: TObject);
     procedure DBGClientesArticuloDblClick(Sender: TObject);
     procedure ARefrescarEstadisicaClienteFamiliaExecute(Sender: TObject);
     procedure ARefrescarEstadisicaClienteArticuloExecute(Sender: TObject);
     procedure DBGCellClick(Column: TColumn);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMEstadisticasComparadas : TFMEstadisticasComparadas;

implementation

uses
  UDMMain, UEntorno, UFMain, UUtiles, UFormGest, UDMEstadisticasComparadas;

{$R *.dfm}

procedure TFMEstadisticasComparadas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEstadisticasComparadas, DMEstadisticasComparadas);

  NavFamilias.DataSource := DMEstadisticasComparadas.DSxEstadisticaFamilias;
  DBGFamilias.DataSource := DMEstadisticasComparadas.DSxEstadisticaFamilias;
  NavArticulos.DataSource := DMEstadisticasComparadas.DSxEstadisticaArticulos;
  DBGArticulos.DataSource := DMEstadisticasComparadas.DSxEstadisticaArticulos;
  NavClientes.DataSource := DMEstadisticasComparadas.DSxEstadisticaClientes;
  DBGClientes.DataSource := DMEstadisticasComparadas.DSxEstadisticaClientes;
  NavClientesFamilia.DataSource := DMEstadisticasComparadas.DSxEstadisticaClientesFamilia;
  DBGClientesFamilia.DataSource := DMEstadisticasComparadas.DSxEstadisticaClientesFamilia;
  NavClientesArticulo.DataSource := DMEstadisticasComparadas.DSxEstadisticaClientesArticulo;
  DBGClientesArticulo.DataSource := DMEstadisticasComparadas.DSxEstadisticaClientesArticulo;

  BMes.Click;

  ColActual := DBGFamilias.Columns[0];

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
  GetBitmapFromImageList(SBRefrescaTodas, 1, DMMain.ILMain_Ac, 26);
  GetBitmapFromImageList(SBRefrescaTodas, 2, DMMain.ILMain_In, 26);
end;

procedure TFMEstadisticasComparadas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEstadisticasComparadas);
end;

procedure TFMEstadisticasComparadas.ARefrescarEstadisicaFamiliaExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasComparadas.RefrescaEstadisticaFamilias(DEFechaDesde.Date, DEFechaHasta.Date);
end;

procedure TFMEstadisticasComparadas.ARefrescarEstadisicaArticuloExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasComparadas.RefrescaEstadisticaArticulos(DEFechaDesde.Date, DEFechaHasta.Date);
end;

procedure TFMEstadisticasComparadas.ARefrescarEstadisicaClienteExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasComparadas.RefrescaEstadisticaClientes(DEFechaDesde.Date, DEFechaHasta.Date);
end;

procedure TFMEstadisticasComparadas.DBGDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
        CeldaEnlace(THYTDBGrid(Sender), Rect);

     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if ((UpperCase(Column.FieldName) = 'INCREMENTO') or (UpperCase(Column.FieldName) = 'UNID_INCREMENTO') or
           (UpperCase(Column.FieldName) = 'INCREMENTO_TOTAL') or (UpperCase(Column.FieldName) = 'UNID_INCREMENTO_TOTAL')) then
        begin
           if (Column.Field.AsFloat < 0) then
              ColorError(Canvas)
           else
           if (Column.Field.AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMEstadisticasComparadas.DBGClientesDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
  begin
     if (DMEstadisticasComparadas.xEstadisticaClientesCLIENTE.AsInteger <> 0) then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMEstadisticasComparadas.xEstadisticaClientesCLIENTE.AsInteger));
  end;
end;

procedure TFMEstadisticasComparadas.DBGArticulosDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     if (DMEstadisticasComparadas.xEstadisticaArticulosARTICULO.AsString <> '') then
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMEstadisticasComparadas.xEstadisticaArticulosARTICULO.AsString + '''');
  end;
end;

procedure TFMEstadisticasComparadas.BEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'EJE');
end;

procedure TFMEstadisticasComparadas.BMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'MES');
end;

procedure TFMEstadisticasComparadas.BEjercicioAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'E-');
end;

procedure TFMEstadisticasComparadas.BEjercicioSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'E+');
end;

procedure TFMEstadisticasComparadas.BMesAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M-');
end;

procedure TFMEstadisticasComparadas.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M+');
end;

procedure TFMEstadisticasComparadas.ARefrescarTodasExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasComparadas.RefrescaEstadisticaFamilias(DEFechaDesde.Date, DEFechaHasta.Date);
  DMEstadisticasComparadas.RefrescaEstadisticaArticulos(DEFechaDesde.Date, DEFechaHasta.Date);
  DMEstadisticasComparadas.RefrescaEstadisticaClientes(DEFechaDesde.Date, DEFechaHasta.Date);
  DMEstadisticasComparadas.RefrescaEstadisticaClientesFamilia(DEFechaDesde.Date, DEFechaHasta.Date);
  DMEstadisticasComparadas.RefrescaEstadisticaClientesArticulo(DEFechaDesde.Date, DEFechaHasta.Date);
end;

procedure TFMEstadisticasComparadas.SBRefrescaTodasClick(Sender: TObject);
begin
  inherited;
  ARefrescarTodas.Execute;
end;

procedure TFMEstadisticasComparadas.DBGClientesFamiliaDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
  begin
     if (DMEstadisticasComparadas.xEstadisticaClientesFamiliaCLIENTE.AsInteger <> 0) then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMEstadisticasComparadas.xEstadisticaClientesFamiliaCLIENTE.AsInteger));
  end;
end;

procedure TFMEstadisticasComparadas.DBGClientesArticuloDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
  begin
     if (DMEstadisticasComparadas.xEstadisticaClientesArticuloCLIENTE.AsInteger <> 0) then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMEstadisticasComparadas.xEstadisticaClientesArticuloCLIENTE.AsInteger));
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     if (DMEstadisticasComparadas.xEstadisticaClientesArticuloARTICULO.AsString <> '') then
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMEstadisticasComparadas.xEstadisticaClientesArticuloARTICULO.AsString + '''');
  end;
end;

procedure TFMEstadisticasComparadas.ARefrescarEstadisicaClienteFamiliaExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasComparadas.RefrescaEstadisticaClientesFamilia(DEFechaDesde.Date, DEFechaHasta.Date);
end;

procedure TFMEstadisticasComparadas.ARefrescarEstadisicaClienteArticuloExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasComparadas.RefrescaEstadisticaClientesArticulo(DEFechaDesde.Date, DEFechaHasta.Date);
end;

procedure TFMEstadisticasComparadas.DBGCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

end.
