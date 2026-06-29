unit UFMImportacionArticulosExcel;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, StdCtrls, Mask, DBCtrls,
  ULFDBEdit, ULFLabel, UHYDescription, ULFHYDBDescription,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, DB, Buttons, ULFComboBox,
  ULFDBMemo, ULFEdit;

type
  TFMImportacionArticulosExcel = class(TFPEdit)
     LBLArticuloFicha: TLFLabel;
     LBLNombreFicha: TLFLabel;
     LBLFamilia: TLFLabel;
     LBCtaDevC: TLFLabel;
     LBCtaDevV: TLFLabel;
     LPrecioVenta1: TLFLabel;
     LBLUnidades: TLFLabel;
     LDescuento1: TLFLabel;
     LPCompra1: TLFLabel;
     LPCoste1: TLFLabel;
     DBEArticulo: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBEFFamilia: TLFDBEditFind2000;
     ETitFamilias: TLFEdit;
     DBEPVenta1: TLFDbedit;
     DBEDescuento1: TLFDbedit;
     DBEPCompra1: TLFDbedit;
     DBEPCoste1: TLFDbedit;
     LPrecioVenta2: TLFLabel;
     DBEPVenta2: TLFDbedit;
     LDescuento2: TLFLabel;
     DBEDescuento2: TLFDbedit;
     LPCompra2: TLFLabel;
     DBEPCompra2: TLFDbedit;
     LPCoste2: TLFLabel;
     DBEPCoste2: TLFDbedit;
     LTarifa: TLFLabel;
     EFTarifa: TLFDBEditFind2000;
     DBERefProveedor: TLFDbedit;
     DBEPiezas: TLFDbedit;
     DBEProveedor: TLFDbedit;
     ALImportados: TLFActionList;
     LFCBPrincipal: TLFDBCheckBox;
     LFDBArtRelacionado: TLFDbedit;
     LArtRelacionado: TLFLabel;
     LFCategoryAction1: TLFCategoryAction;
     AActualizar: TAction;
     SBAArtRel: TSpeedButton;
     AArtRel: TAction;
     PNLEquivalentes: TLFPanel;
     DBGEquivalencias: TDBGridFind2000;
     LEquivalencias: TLFLabel;
     TBEquivalentes: TLFToolBar;
     NavEquivalentes: THYMNavigator;
     AExcel: TAction;
     ToolButton1: TToolButton;
     TBPrincipalEq: TToolButton;
     ToolButton3: TToolButton;
     TBPrincipal: TToolButton;
     LFActivos: TLFComboBox;
     ToolButton5: TToolButton;
     APrincipal: TAction;
     APrincipalEq: TAction;
     LFDBNotas: TLFDBMemo;
     LFNotas: TLFLabel;
     AProcMasivoPral: TAction;
     AEliminarBDD: TAction;
     ETituloTarifa: TLFEdit;
     EDescProveedor: TLFEdit;
     LAlfa1: TLFLabel;
     DBEAlfa1: TLFDbedit;
     LAlfa2: TLFLabel;
     DBEAlfa2: TLFDbedit;
     LAlfa3: TLFLabel;
     DBEAlfa3: TLFDbedit;
     LAlfa4: TLFLabel;
     DBEAlfa4: TLFDbedit;
     LAlfa5: TLFLabel;
     DBEAlfa5: TLFDbedit;
     LAlfa6: TLFLabel;
     DBEAlfa6: TLFDbedit;
     LCodigoBarra: TLFLabel;
     DBECodigoBarra: TLFDbedit;
     LPVentaRecomendado: TLFLabel;
     DBEPVentaRecomendado: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AArtRelExecute(Sender: TObject);
     procedure SBAArtRelDblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AActualizarExecute(Sender: TObject);
     procedure AExcelExecute(Sender: TObject);
     procedure APrincipalExecute(Sender: TObject);
     procedure APrincipalEqExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure LFActivosChange(Sender: TObject);
     procedure AProcMasivoPralExecute(Sender: TObject);
     procedure AEliminarBDDExecute(Sender: TObject);
     procedure EFTarifaChange(Sender: TObject);
     procedure DBEProveedorChange(Sender: TObject);
     procedure DBEArticuloChange(Sender: TObject);
     procedure DBEFFamiliaChange(Sender: TObject);
     procedure DBEPiezasChange(Sender: TObject);
  private
     { Private declarations }
     BusquedaCompleja: boolean;
     procedure EstableceActivos;
  public
     { Public declarations }
     procedure AsignacionNuevoPrincipal(id_articulo_importado: integer; articulo: string);
  end;

var
  FMImportacionArticulosExcel : TFMImportacionArticulosExcel;

implementation

uses UDMImportacionArticulosExcel, UFormGest, UFMImportacionArticulosExcelArt, UDMMain, UFMain, UUtiles, UEntorno, UFMSeleccion, HYFIBQuery, UParam, UDameDato;

{$R *.dfm}

procedure TFMImportacionArticulosExcel.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImportacionArticulosExcel, DMImportacionArticulosExcel);
  NavMain.DataSource := DMImportacionArticulosExcel.DSArtImportados;
  DBGMain.DataSource := DMImportacionArticulosExcel.DSArtImportados;
  PCMain.ActivePage := TSFicha;

  SolapaControles(SBAArtRel, DBEArticulo);

  if (DMImportacionArticulosExcel.QMArtImportadosART_PRINCIPAL.AsInteger = 1) then
     DBEArticulo.Color := REntorno.ColorEnlaceActivo
  else
     DBEArticulo.Color := clWindow;

  // Buscar si hi ha principals o que filtri per tots
  EstableceActivos;

  LFCBPrincipal.ReadOnly := False;
  BusquedaCompleja := False;

  LAlfa1.Caption := LeeParametro(format('ARTDESC%3.3d', [1]));
  LAlfa2.Caption := LeeParametro(format('ARTDESC%3.3d', [2]));
  LAlfa3.Caption := LeeParametro(format('ARTDESC%3.3d', [3]));
  LAlfa4.Caption := LeeParametro(format('ARTDESC%3.3d', [4]));
  LAlfa5.Caption := LeeParametro(format('ARTDESC%3.3d', [5]));
  LAlfa6.Caption := LeeParametro(format('ARTDESC%3.3d', [6]));
  LAlfa1.Left := DBEAlfa1.Left - 8 - LAlfa1.Width;
  LAlfa2.Left := DBEAlfa2.Left - 8 - LAlfa2.Width;
  LAlfa3.Left := DBEAlfa3.Left - 8 - LAlfa3.Width;
  LAlfa4.Left := DBEAlfa4.Left - 8 - LAlfa4.Width;
  LAlfa5.Left := DBEAlfa5.Left - 8 - LAlfa5.Width;
  LAlfa6.Left := DBEAlfa6.Left - 8 - LAlfa6.Width;
end;

procedure TFMImportacionArticulosExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImportacionArticulosExcel);
end;

procedure TFMImportacionArticulosExcel.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  if (LFActivos.ItemIndex = 0) then
     G2KTableLoc.CondicionBusqueda := 'ART_PRINCIPAL = 1'
  else
  if (LFActivos.ItemIndex = 1) then
     G2KTableLoc.CondicionBusqueda := '';

  G2KTableLoc.Click;
end;

procedure TFMImportacionArticulosExcel.AArtRelExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
     DMImportacionArticulosExcel.QMArtImportadosARTICULO.AsString + '''' +
     ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TFMImportacionArticulosExcel.SBAArtRelDblClick(Sender: TObject);
begin
  inherited;
  if (DBEArticulo.Color = REntorno.ColorEnlaceActivo) then
     AArtRel.Execute;
end;

procedure TFMImportacionArticulosExcel.AActualizarExecute(Sender: TObject);
begin
  inherited;
  // sfg.albert - Procés que actualitza tots els articles amb els check marcat
  // Actualitza dades general d'article i també refà la pestanya de preus

  if MessageDlg(_('Está seguro que desea actualizar todos los artículos principales?'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     DMImportacionArticulosExcel.ActualizarTodos;
end;

procedure TFMImportacionArticulosExcel.AExcelExecute(Sender: TObject);
begin
  inherited;
  AbreFormVarias(TFMImportacionArticulosExcelArt, FMImportacionArticulosExcelArt, nil, True);

  // Buscar si hi ha principals o que filtri per tots
  EstableceActivos;
end;

procedure TFMImportacionArticulosExcel.APrincipalExecute(Sender: TObject);
begin
  inherited;
  AsignacionNuevoPrincipal(DMImportacionArticulosExcel.QMArtImportadosID_ARTICULO.AsInteger,
     DMImportacionArticulosExcel.QMArtImportadosARTICULO.AsString);
end;

procedure TFMImportacionArticulosExcel.APrincipalEqExecute(Sender: TObject);
begin
  inherited;
  AsignacionNuevoPrincipal(DMImportacionArticulosExcel.xEquivalenciasID_ARTICULO.AsInteger,
     DMImportacionArticulosExcel.xEquivalenciasARTICULO.AsString);
end;

procedure TFMImportacionArticulosExcel.LFActivosChange(Sender: TObject);
begin
  inherited;
  // FiltarTabla(SoloPrincipales, OrdenarPorArticulo)
  DMImportacionArticulosExcel.FiltrarTabla(LFActivos.ItemIndex);
end;

procedure TFMImportacionArticulosExcel.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMImportacionArticulosExcel.BusquedaCompleja;
  BusquedaCompleja := True;
end;

procedure TFMImportacionArticulosExcel.AProcMasivoPralExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg(_('Desea asignar como principales todos los articulos filtrados?'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     DMImportacionArticulosExcel.AsignarMasivoPrincipal(BusquedaCompleja);

     BusquedaCompleja := False;
     LFActivos.ItemIndex := 0;
     LFActivosChange(Sender);
  end;
end;

procedure TFMImportacionArticulosExcel.AEliminarBDDExecute(Sender: TObject);
var
  Proveedor : integer;
begin
  inherited;
  if MessageDlg(_('Está seguro que desea borrar TODOS los datos de importación?'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     Proveedor := 0;
     if (PideDato('PRO', Proveedor)) then
        DMImportacionArticulosExcel.EliminarImportaciones(Proveedor);
  end;
end;

procedure TFMImportacionArticulosExcel.AsignacionNuevoPrincipal(id_articulo_importado: integer; articulo: string);
begin
  inherited;
  with DMImportacionArticulosExcel do
  begin
     AsignarPrincipal(id_articulo_importado, articulo);
     RefrescaArticulosImportados;
  end;

  DBEArticuloChange(Self);
end;

procedure TFMImportacionArticulosExcel.EFTarifaChange(Sender: TObject);
begin
  inherited;
  ETituloTarifa.Text := DameTituloTarifa(EFTarifa.Text);
end;

procedure TFMImportacionArticulosExcel.DBEProveedorChange(Sender: TObject);
begin
  inherited;
  EDescProveedor.Text := DameTituloProveedor(StrToIntDef(DBEProveedor.Text, 0));
end;

procedure TFMImportacionArticulosExcel.EstableceActivos;
begin
  // Buscar si hi ha principals o que filtri per tots
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM ART_ARTICULOS_IMPORTADOS WHERE ART_PRINCIPAL = 1';
        ExecQuery;
        if (FieldByName['COUNT'].AsInteger = 0) then
           LFActivos.ItemIndex := 1 // Filtra tots
        else
           LFActivos.ItemIndex := 0; // Filtra només principals
        FreeHandle;
     finally
        Free;
     end;
  end;

  LFActivosChange(Self);
end;

procedure TFMImportacionArticulosExcel.DBEArticuloChange(Sender: TObject);
begin
  inherited;
  if (DMImportacionArticulosExcel.QMArtImportadosART_PRINCIPAL.AsInteger = 1) then
     DBEArticulo.Color := REntorno.ColorEnlaceActivo
  else
     DBEArticulo.Color := clWindow;
end;

procedure TFMImportacionArticulosExcel.DBEFFamiliaChange(Sender: TObject);
begin
  inherited;
  ETitFamilias.Text := DameTituloFamilia(DBEFFamilia.Text);
end;

procedure TFMImportacionArticulosExcel.DBEPiezasChange(Sender: TObject);
var
  Visibilidad : boolean;
begin
  inherited;
  Visibilidad := (StrToFloatDef(DBEPiezas.Text, 0) > 0);

  LPrecioVenta2.Visible := Visibilidad;
  DBEPVenta2.Visible := Visibilidad;
  LDescuento2.Visible := Visibilidad;
  DBEDescuento2.Visible := Visibilidad;
  LPCoste2.Visible := Visibilidad;
  DBEPCoste2.Visible := Visibilidad;
  LPCompra2.Visible := Visibilidad;
  DBEPCompra2.Visible := Visibilidad;
end;

end.
