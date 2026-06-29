unit UFMEstadisticasSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, ULFPageControl, StdCtrls, ULFLabel, Mask,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, UFPEditSinNavegador, ULFDateEdit,
  Buttons, ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000;

type
  TFMEstadisticasSimples = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSFamilia: TTabSheet;
     TSArticulo: TTabSheet;
     TSCliente: TTabSheet;
     DBGFamilias: THYTDBGrid;
     DBGArticulos: THYTDBGrid;
     DBGClientes: THYTDBGrid;
     PNLFiltros: TLFPanel;
     LFechaDesde: TLFLabel;
     LFechaHasta: TLFLabel;
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
     EFClienteDesde: TLFEditFind2000;
     EClienteDesde: TLFEdit;
     EFClienteHasta: TLFEditFind2000;
     EClienteHasta: TLFEdit;
     LClienteDesde: TLFLabel;
     LClienteHasta: TLFLabel;
     LArticuloDesde: TLFLabel;
     LArticuloHasta: TLFLabel;
     EFArticuloDesde: TLFEditFind2000;
     EArticuloDesde: TLFEdit;
     EFArticuloHasta: TLFEditFind2000;
     EArticuloHasta: TLFEdit;
     TBSep6: TToolButton;
     TBRefrescar: TToolButton;
     RGTipoDocumento: TRadioGroup;
     PNLTotalesFamilia: TLFPanel;
     PNLTotalesArticulo: TLFPanel;
     PNLTotalesCliente: TLFPanel;
     PNLTotalesClienteFamilia: TLFPanel;
     PNLTotalesClienteArticulo: TLFPanel;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamiliaDesde: TLFEditFind2000;
     EFamiliaDesde: TLFEdit;
     EFFamiliaHasta: TLFEditFind2000;
     EFamiliaHasta: TLFEdit;
     LSerie1: TLFLabel;
     LSerie2: TLFLabel;
     EFSerie1: TLFEditFind2000;
     ESerie1: TLFEdit;
     EFSerie2: TLFEditFind2000;
     ESerie2: TLFEdit;
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
     procedure DBGClientesFamiliaDblClick(Sender: TObject);
     procedure DBGClientesArticuloDblClick(Sender: TObject);
     procedure ARefrescarEstadisicaClienteFamiliaExecute(Sender: TObject);
     procedure ARefrescarEstadisicaClienteArticuloExecute(Sender: TObject);
     procedure DBGCellClick(Column: TColumn);
     procedure EFClienteDesdeChange(Sender: TObject);
     procedure EFClienteHastaChange(Sender: TObject);
     procedure EFArticuloDesdeChange(Sender: TObject);
     procedure EFArticuloHastaChange(Sender: TObject);
     procedure DBGClientesArticuloColEnter(Sender: TObject);
     procedure DBGClientesFamiliaColEnter(Sender: TObject);
     procedure DBGClientesColEnter(Sender: TObject);
     procedure DBGArticulosColEnter(Sender: TObject);
     procedure DBGFamiliasColEnter(Sender: TObject);
     procedure EFFamiliaDesdeChange(Sender: TObject);
     procedure EFFamiliaHastaChange(Sender: TObject);
     procedure EFSerie1Change(Sender: TObject);
     procedure EFSerie2Change(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     TotalesFamilia: array of double;
     TotalesArticulo: array of double;
     TotalesCliente: array of double;
     TotalesClienteFamilia: array of double;
     TotalesClienteArticulo: array of double;
  public
     { Public declarations }
  end;

var
  FMEstadisticasSimples : TFMEstadisticasSimples;

implementation

uses
  UDMMain, UEntorno, UFMain, UUtiles, UDameDato, UFormGest, UDMEstadisticasSimples, DB, ULFREdit;

{$R *.dfm}

procedure TFMEstadisticasSimples.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEstadisticasSimples, DMEstadisticasSimples);

  NavFamilias.DataSource := DMEstadisticasSimples.DSxEstadisticaFamilias;
  DBGFamilias.DataSource := DMEstadisticasSimples.DSxEstadisticaFamilias;
  NavArticulos.DataSource := DMEstadisticasSimples.DSxEstadisticaArticulos;
  DBGArticulos.DataSource := DMEstadisticasSimples.DSxEstadisticaArticulos;
  NavClientes.DataSource := DMEstadisticasSimples.DSxEstadisticaClientes;
  DBGClientes.DataSource := DMEstadisticasSimples.DSxEstadisticaClientes;
  NavClientesFamilia.DataSource := DMEstadisticasSimples.DSxEstadisticaClientesFamilia;
  DBGClientesFamilia.DataSource := DMEstadisticasSimples.DSxEstadisticaClientesFamilia;
  NavClientesArticulo.DataSource := DMEstadisticasSimples.DSxEstadisticaClientesArticulo;
  DBGClientesArticulo.DataSource := DMEstadisticasSimples.DSxEstadisticaClientesArticulo;

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
end;

procedure TFMEstadisticasSimples.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEstadisticasSimples);
end;

procedure TFMEstadisticasSimples.ARefrescarEstadisicaFamiliaExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasSimples.RefrescaEstadisticaFamilias(DEFechaDesde.Date, DEFechaHasta.Date, StrToIntDef(EFClienteDesde.Text, 0), StrToIntDef(EFClienteHasta.Text, 0), EFArticuloDesde.Text, EFArticuloHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, EFSerie1.Text, EFSerie2.Text, RGTipoDocumento.ItemIndex);

  SetLength(TotalesFamilia, DBGFamilias.Columns.Count);
  CalculaTotales(DBGFamilias, TotalesFamilia);
  PintaTotales(PNLTotalesFamilia, DBGFamilias, TotalesFamilia);
end;

procedure TFMEstadisticasSimples.ARefrescarEstadisicaArticuloExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasSimples.RefrescaEstadisticaArticulos(DEFechaDesde.Date, DEFechaHasta.Date, StrToIntDef(EFClienteDesde.Text, 0), StrToIntDef(EFClienteHasta.Text, 0), EFArticuloDesde.Text, EFArticuloHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, EFSerie1.Text, EFSerie2.Text, RGTipoDocumento.ItemIndex);

  SetLength(TotalesArticulo, DBGArticulos.Columns.Count);
  CalculaTotales(DBGArticulos, TotalesArticulo);
  PintaTotales(PNLTotalesArticulo, DBGArticulos, TotalesArticulo);
end;

procedure TFMEstadisticasSimples.ARefrescarEstadisicaClienteExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasSimples.RefrescaEstadisticaClientes(DEFechaDesde.Date, DEFechaHasta.Date, StrToIntDef(EFClienteDesde.Text, 0), StrToIntDef(EFClienteHasta.Text, 0), EFArticuloDesde.Text, EFArticuloHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, EFSerie1.Text, EFSerie2.Text, RGTipoDocumento.ItemIndex);

  SetLength(TotalesCliente, DBGClientes.Columns.Count);
  CalculaTotales(DBGClientes, TotalesCliente, 'CLIENTE');
  PintaTotales(PNLTotalesCliente, DBGClientes, TotalesCliente, 'CLIENTE');
end;

procedure TFMEstadisticasSimples.ARefrescarEstadisicaClienteFamiliaExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasSimples.RefrescaEstadisticaClientesFamilia(DEFechaDesde.Date, DEFechaHasta.Date, StrToIntDef(EFClienteDesde.Text, 0), StrToIntDef(EFClienteHasta.Text, 0), EFArticuloDesde.Text, EFArticuloHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, EFSerie1.Text, EFSerie2.Text, RGTipoDocumento.ItemIndex);

  SetLength(TotalesClienteFamilia, DBGClientesFamilia.Columns.Count);
  CalculaTotales(DBGClientesFamilia, TotalesClienteFamilia, 'CLIENTE');
  PintaTotales(PNLTotalesClienteFamilia, DBGClientesFamilia, TotalesClienteFamilia, 'CLIENTE');
end;

procedure TFMEstadisticasSimples.ARefrescarEstadisicaClienteArticuloExecute(Sender: TObject);
begin
  inherited;
  DMEstadisticasSimples.RefrescaEstadisticaClientesArticulo(DEFechaDesde.Date, DEFechaHasta.Date, StrToIntDef(EFClienteDesde.Text, 0), StrToIntDef(EFClienteHasta.Text, 0), EFArticuloDesde.Text, EFArticuloHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, EFSerie1.Text, EFSerie2.Text, RGTipoDocumento.ItemIndex);

  SetLength(TotalesClienteArticulo, DBGClientesArticulo.Columns.Count);
  CalculaTotales(DBGClientesArticulo, TotalesClienteArticulo, 'CLIENTE');
  PintaTotales(PNLTotalesClienteArticulo, DBGClientesArticulo, TotalesClienteArticulo, 'CLIENTE');
end;

procedure TFMEstadisticasSimples.ARefrescarTodasExecute(Sender: TObject);
begin
  inherited;
  ARefrescarEstadisicaFamilia.Execute;
  ARefrescarEstadisicaArticulo.Execute;
  ARefrescarEstadisicaCliente.Execute;
  ARefrescarEstadisicaClienteFamilia.Execute;
  ARefrescarEstadisicaClienteArticulo.Execute;
end;

procedure TFMEstadisticasSimples.DBGDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
        CeldaEnlace(THYTDBGrid(Sender), Rect);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMEstadisticasSimples.DBGClientesDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
  begin
     if (DMEstadisticasSimples.xEstadisticaClientesCLIENTE.AsInteger <> 0) then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMEstadisticasSimples.xEstadisticaClientesCLIENTE.AsInteger));
  end;
end;

procedure TFMEstadisticasSimples.DBGArticulosDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     if (DMEstadisticasSimples.xEstadisticaArticulosARTICULO.AsString <> '') then
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMEstadisticasSimples.xEstadisticaArticulosARTICULO.AsString + '''');
  end;
end;

procedure TFMEstadisticasSimples.BEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'EJE');
end;

procedure TFMEstadisticasSimples.BMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'MES');
end;

procedure TFMEstadisticasSimples.BEjercicioAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'E-');
end;

procedure TFMEstadisticasSimples.BEjercicioSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'E+');
end;

procedure TFMEstadisticasSimples.BMesAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M-');
end;

procedure TFMEstadisticasSimples.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M+');
end;

procedure TFMEstadisticasSimples.DBGClientesFamiliaDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
  begin
     if (DMEstadisticasSimples.xEstadisticaClientesFamiliaCLIENTE.AsInteger <> 0) then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMEstadisticasSimples.xEstadisticaClientesFamiliaCLIENTE.AsInteger));
  end;
end;

procedure TFMEstadisticasSimples.DBGClientesArticuloDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
  begin
     if (DMEstadisticasSimples.xEstadisticaClientesArticuloCLIENTE.AsInteger <> 0) then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMEstadisticasSimples.xEstadisticaClientesArticuloCLIENTE.AsInteger));
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     if (DMEstadisticasSimples.xEstadisticaClientesArticuloARTICULO.AsString <> '') then
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMEstadisticasSimples.xEstadisticaClientesArticuloARTICULO.AsString + '''');
  end;
end;

procedure TFMEstadisticasSimples.DBGCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMEstadisticasSimples.EFClienteDesdeChange(Sender: TObject);
begin
  inherited;
  EClienteDesde.Text := DameTituloCliente(StrToIntDef(EFClienteDesde.Text, 0));
end;

procedure TFMEstadisticasSimples.EFClienteHastaChange(Sender: TObject);
begin
  inherited;
  EClienteHasta.Text := DameTituloCliente(StrToIntDef(EFClienteHasta.Text, 0));
end;

procedure TFMEstadisticasSimples.EFArticuloDesdeChange(Sender: TObject);
begin
  inherited;
  EArticuloDesde.Text := DameTituloArticulo(EFArticuloDesde.Text);
end;

procedure TFMEstadisticasSimples.EFArticuloHastaChange(Sender: TObject);
begin
  inherited;
  EArticuloHasta.Text := DameTituloArticulo(EFArticuloHasta.Text);
end;

procedure TFMEstadisticasSimples.DBGClientesArticuloColEnter(Sender: TObject);
begin
  inherited;
  PintaTotales(PNLTotalesClienteArticulo, DBGClientesArticulo, TotalesClienteArticulo, 'CLIENTE');
end;

procedure TFMEstadisticasSimples.DBGClientesFamiliaColEnter(Sender: TObject);
begin
  inherited;
  PintaTotales(PNLTotalesClienteFamilia, DBGClientesFamilia, TotalesClienteFamilia, 'CLIENTE');
end;

procedure TFMEstadisticasSimples.DBGClientesColEnter(Sender: TObject);
begin
  inherited;
  PintaTotales(PNLTotalesCliente, DBGClientes, TotalesCliente, 'CLIENTE');
end;

procedure TFMEstadisticasSimples.DBGArticulosColEnter(Sender: TObject);
begin
  inherited;
  PintaTotales(PNLTotalesArticulo, DBGArticulos, TotalesArticulo);
end;

procedure TFMEstadisticasSimples.DBGFamiliasColEnter(Sender: TObject);
begin
  inherited;
  PintaTotales(PNLTotalesFamilia, DBGFamilias, TotalesFamilia);
end;

procedure TFMEstadisticasSimples.EFFamiliaDesdeChange(Sender: TObject);
begin
  inherited;
  EFamiliaDesde.Text := DameTituloFamilia(EFFamiliaDesde.Text);
end;

procedure TFMEstadisticasSimples.EFFamiliaHastaChange(Sender: TObject);
begin
  inherited;
  EFamiliaHasta.Text := DameTituloFamilia(EFFamiliaHasta.Text);
end;

procedure TFMEstadisticasSimples.EFSerie1Change(Sender: TObject);
begin
  inherited;
  ESerie1.Text := DameTituloSerie(EFSerie1.Text);
end;

procedure TFMEstadisticasSimples.EFSerie2Change(Sender: TObject);
begin
  inherited;
  ESerie2.Text := DameTituloSerie(EFSerie2.Text);
end;

end.
