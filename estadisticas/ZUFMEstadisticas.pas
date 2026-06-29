unit ZUFMEstadisticas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, rxPlacemnt, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, ExtCtrls, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEdit, ULFComboBox,
  TFlatCheckBoxUnit, ULFCheckBox, DbComboBoxValue, DBActns, UG2kTBLoc,
  ULFLabel;

type
  TZFMEstadisticas = class(TFPEdit)
     LBLGrupo: TLFLabel;
     LBLTituloGrupo: TLFLabel;
     DBEGrupo: TLFDbedit;
     DBETitGrupo: TLFDbedit;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     GBCondiciones: TGroupBox;
     ChkBEmpresa: TLFCheckBox;
     ChkBEjercicio: TLFCheckBox;
     ChkBCanal: TLFCheckBox;
     ChkBSerie: TLFCheckBox;
     DBCBVEmpresas: TDBComboBoxValue;
     DBCBVEjercicios: TDBComboBoxValue;
     DBCBVCanales: TDBComboBoxValue;
     DBCBVSeries: TDBComboBoxValue;
     DBMReglas: TLFDBMemo;
     LblReglas: TLFLabel;
     LBLNombreCampoFecha: TLFLabel;
     DBMClaves: TLFDBMemo;
     GBConsulta: TGroupBox;
     LBLTablas: TLFLabel;
     DBMTablas: TLFDBMemo;
     GBEstadistica: TGroupBox;
     LBLEstadistica: TLFLabel;
     LBLClave1: TLFLabel;
     LBLNumClaves: TLFLabel;
     DBEEstadistica: TLFDbedit;
     DBETitEstadistica: TLFDbedit;
     DBEClave1: TLFDbedit;
     DBEClave2: TLFDbedit;
     DBEClave3: TLFDbedit;
     DBETitulo3: TLFDbedit;
     DBETitulo2: TLFDbedit;
     DBETitulo1: TLFDbedit;
     DBCBNumClaves: TDBComboBox;
     LFCategoryAction1: TLFCategoryAction;
     ADuplicarEstadistica: TLFDatasetAction;
     LFCategoryAction2: TLFCategoryAction;
     AVerDatos: TAction;
     ASep2: TAction;
     AComparaEstadisticas: TAction;
     DBEDescClave1: TLFDbedit;
     DBETituloDesc1: TLFDbedit;
     DBETituloDesc2: TLFDbedit;
     DBEDescClave2: TLFDbedit;
     DBEDescClave3: TLFDbedit;
     DBETituloDesc3: TLFDbedit;
     DBCBVOrdenTotal: TDBComboBoxValue;
     LBLCampoAux: TLFLabel;
     DBEAux1: TLFDbedit;
     DBEAux2: TLFDbedit;
     LBLTituloAux: TLFLabel;
     LBLClave: TLFLabel;
     LBLTitulo: TLFLabel;
     LBLDescClave: TLFLabel;
     LBLTitDescClave: TLFLabel;
     LBLClave2: TLFLabel;
     LBLClave3: TLFLabel;
     DBEAux3: TLFDbedit;
     DBEAux4: TLFDbedit;
     DBETitAux1: TLFDbedit;
     DBETitAux2: TLFDbedit;
     DBETitAux3: TLFDbedit;
     DBETitAux4: TLFDbedit;
     LBLCampoAux1: TLFLabel;
     LBLCampoAux2: TLFLabel;
     LBLCampoAux3: TLFLabel;
     LBLCampoAux4: TLFLabel;
     LBLTitEstadistica: TLFLabel;
     PCDetalle: TLFPageControl;
     TSFichaEst: TTabSheet;
     TSTablaEst: TTabSheet;
     DBGDetalle: THYTDBGrid;
     LOrden: TLFLabel;
     DBMAcumulados: TLFDBMemo;
     LBLAcum: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ChkBEmpresaClick(Sender: TObject);
     procedure ChkBEjercicioClick(Sender: TObject);
     procedure ChkBCanalClick(Sender: TObject);
     procedure ChkBSerieClick(Sender: TObject);
     procedure DBCBVEmpresasChange(Sender: TObject);
     procedure DBCBVEjerciciosChange(Sender: TObject);
     procedure DBCBVCanalesChange(Sender: TObject);
     procedure DBCBNumClavesChange(Sender: TObject);
     procedure ADuplicarEstadisticaExecute(Sender: TObject);
     procedure AVerDatosExecute(Sender: TObject);
     procedure AComparaEstadisticasExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure NumClaves(Num: integer);
     function CompruebaCampos: boolean;
  end;

var
  ZFMEstadisticas : TZFMEstadisticas;

implementation

uses ZUDMEstadisticas, UDMMain, UFormGest, ZUFMEstDatos, ZUFMEstCompara;

{$R *.dfm}

procedure TZFMEstadisticas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMEstadisticas, ZDMEstadisticas);

  ZDMEstadisticas.RellenaEmpresas;
  ZDMEstadisticas.RellenaEjercicios(0);
  ZDMEstadisticas.RellenaCanales(0, 0);
  ZDMEstadisticas.RellenaSeries(0, 0, 0);

  GBEstadistica.Enabled := False;
  GBConsulta.Enabled := False;
  GBCondiciones.Enabled := False;

  NavMain.DataSource := ZDMEstadisticas.DSQMGrupo;
  DBGMain.DataSource := ZDMEstadisticas.DSQMGrupo;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  NavDetalle.DataSource := ZDMEstadisticas.DSQMDetalle;
  CEDetallePMEdit.Teclas := DMMain.Teclas;
end;

procedure TZFMEstadisticas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(ZDMEstadisticas);
end;

procedure TZFMEstadisticas.NumClaves(Num: integer);
begin
  LBLClave2.Visible := (Num > 1);
  DBEClave2.Visible := (Num > 1);
  LBLClave3.Visible := (Num > 2);
  DBEClave3.Visible := (Num > 2);
  DBETitulo2.Visible := (Num > 1);
  DBETitulo3.Visible := (Num > 2);
  DBEDescClave2.Visible := (Num > 1);
  DBEDescClave3.Visible := (Num > 2);
  DBETituloDesc2.Visible := (Num > 1);
  DBETituloDesc3.Visible := (Num > 2);
end;

procedure TZFMEstadisticas.ChkBEmpresaClick(Sender: TObject);
begin
  inherited;
  if ChkBEmpresa.State = cbChecked then
     DBCBVEmpresas.Enabled := True
  else
  begin
     DBCBVEmpresas.ItemIndex := 0;
     DBCBVEmpresas.Enabled := False;
  end;
end;

procedure TZFMEstadisticas.ChkBEjercicioClick(Sender: TObject);
begin
  inherited;
  DBCBVEjercicios.Enabled := (ChkBEjercicio.State = cbChecked);
end;

procedure TZFMEstadisticas.ChkBCanalClick(Sender: TObject);
begin
  inherited;
  DBCBVCanales.Enabled := (ChkBCanal.State = cbChecked);
end;

procedure TZFMEstadisticas.ChkBSerieClick(Sender: TObject);
begin
  inherited;
  DBCBVSeries.Enabled := (ChkBSerie.State = cbChecked);
end;

procedure TZFMEstadisticas.DBCBVEmpresasChange(Sender: TObject);
var
  Empresa : integer;
begin
  inherited;
  // Al canviar l'empresa, omplir de nou Ejercicios, Canales i Series depenent de l'empresa que hi hagi

  Empresa := StrToIntDef(DBCBVEmpresas.Values[DBCBVEmpresas.ItemIndex], 0);

  DBCBVEjercicios.ItemIndex := 0;
  if ChkBEjercicio.State = cbChecked then
     ZDMEstadisticas.RellenaEjercicios(Empresa);

  DBCBVCanales.ItemIndex := 0;
  if ChkBCanal.State = cbChecked then
     ZDMEstadisticas.RellenaCanales(Empresa, 0);

  DBCBVSeries.ItemIndex := 0;
  if ChkBSerie.State = cbChecked then
     ZDMEstadisticas.RellenaSeries(Empresa, 0, 0);
end;

procedure TZFMEstadisticas.DBCBVEjerciciosChange(Sender: TObject);
var
  Empresa, Ejercicio : integer;
begin
  inherited;
  // Al canviar l'excercici, omplir de nou Canales i Series depenent de l'empresa i excercici que hi hagi

  Empresa := StrToIntDef(DBCBVEmpresas.Values[DBCBVEmpresas.ItemIndex], 0);
  Ejercicio := StrToIntDef(DBCBVEjercicios.Values[DBCBVEjercicios.ItemIndex], 0);

  DBCBVCanales.ItemIndex := 0;
  if ChkBCanal.State = cbChecked then
     ZDMEstadisticas.RellenaCanales(Empresa, Ejercicio);

  DBCBVSeries.ItemIndex := 0;
  if ChkBSerie.State = cbChecked then
     ZDMEstadisticas.RellenaSeries(Empresa, Ejercicio, 0);
end;

procedure TZFMEstadisticas.DBCBVCanalesChange(Sender: TObject);
var
  Empresa, Ejercicio, Canal : integer;
begin
  inherited;
  // Al canviar el canal, omplir de Series depenent de l'empresa, excercici i canal que hi hagi

  Empresa := StrToIntDef(DBCBVEmpresas.Values[DBCBVEmpresas.ItemIndex], 0);
  Ejercicio := StrToIntDef(DBCBVEjercicios.Values[DBCBVEjercicios.ItemIndex], 0);
  Canal := StrToIntDef(DBCBVCanales.Values[DBCBVCanales.ItemIndex], 0);

  DBCBVSeries.ItemIndex := 0;
  if ChkBSerie.State = cbChecked then
     ZDMEstadisticas.RellenaSeries(Empresa, Ejercicio, Canal);
end;

function TZFMEstadisticas.CompruebaCampos: boolean;
begin
  Result := True;
  if (DBMTablas.Text = '') then
  begin
     ShowMessage(_('ATENCIÓN: El campo Tablas no puede estar vacio.'));
     Result := False;
  end;

  if (DBMAcumulados.Text = '') then
  begin
     ShowMessage(_('ATENCIÓN: El campo Acumulados no puede estar vacio.'));
     Result := False;
  end;

  if (DBMClaves.Text = '') then
  begin
     ShowMessage(_('ATENCIÓN: El campo Fecha no puede estar vacio.'));
     Result := False;
  end;
end;

procedure TZFMEstadisticas.DBCBNumClavesChange(Sender: TObject);
begin
  inherited;
  NumClaves(StrToInt(DBCBNumClaves.Items[DBCBNumClaves.ItemIndex]));
end;

procedure TZFMEstadisticas.ADuplicarEstadisticaExecute(Sender: TObject);
begin
  inherited;
  ZDMEstadisticas.DuplicaEstadistica;
end;

procedure TZFMEstadisticas.AVerDatosExecute(Sender: TObject);
begin
  inherited;
  if CompruebaCampos then
  begin
     AbreForm(TZFMEstDatos, ZFMEstDatos, Sender);
     ZFMEstDatos.AbrirEstadistica(ZDMEstadisticas.QMDetalleGRUPO.AsInteger,
        ZDMEstadisticas.QMDetalleESTADISTICA.AsInteger, DBCBVOrdenTotal.ItemIndex);
  end;
end;

procedure TZFMEstadisticas.AComparaEstadisticasExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMEstCompara, ZFMEstCompara, Sender);
  ZFMEstCompara.EFGrupo.Text := DBEGrupo.Text;
  ZFMEstCompara.EFEstadistica1.Text := DBEEstadistica.Text;
  ZFMEstCompara.EFEstadistica2.Text := DBEEstadistica.Text;
  ZFMEstCompara.EFPeriodo.Text := '19';
end;

procedure TZFMEstadisticas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMEstadisticas.BusquedaCompleja;
  Continua := False;
end;

procedure TZFMEstadisticas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.DataSource := ZDMEstadisticas.DSQMGrupo;
  G2KTableLoc.Click;
end;

end.
