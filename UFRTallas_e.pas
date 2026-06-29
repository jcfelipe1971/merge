unit UFRTallas_e;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ExtCtrls, ToolWin, ComCtrls, DB, UDMTallas_e, Variants,
  UNavigator, Menus, UTeclas, UControlEdit, ActnList, ULFActionList,
  ULFToolBar, ULFDBMemo, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFPageControl, ULFPanel, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel;

type
  TFRTallas_e = class(TFrame)
     PNLDetalleTallas: TLFPanel;
     DBGFDetalleTallas: TDBGridFind2000;
     TBMain: TLFToolBar;
     DSQMver_detalles_gr_ed: TDataSource;
     CETallas: TControlEdit;
     CETallasPMEdit: TPopUpTeclas;
     CETallasMifirst: TMenuItem;
     CETallasMiprior: TMenuItem;
     CETallasMinext: TMenuItem;
     CETallasMilast: TMenuItem;
     CETallasMiinsert: TMenuItem;
     CETallasMidelete: TMenuItem;
     CETallasMiedit: TMenuItem;
     CETallasMipost: TMenuItem;
     CETallasMicancel: TMenuItem;
     CETallasMirefresh: TMenuItem;
     NavTallas: THYMNavigator;
     TBStocksTallas: TToolButton;
     ToolButton1: TToolButton;
     ActionList1: TLFActionList;
     AStockTallas: TAction;
     APreciosPorTalla: TAction;
     TCPrecios: TTabControl;
     DBGFDetalleTallasPrecios: TDBGridFind2000;
     DSQMver_detalles_gr_ed_pc: TDataSource;
     ASeleccionarKit: TAction;
     TButtSeleccionarKit: TToolButton;
     AInsercionMasivaModelo: TAction;
     TBInsercionMasivaModelo: TToolButton;
     procedure DBGFDetalleTallasRowChange(Sender: TObject);
     procedure DBGFDetalleTallasBusqueda(Sender: TObject);
     procedure DBGFDetalleTallasExiste(Sender: TObject);
     procedure DBGFDetalleTallasCampoDevuelve(Sender: TObject; valor: string);
     procedure AStockTallasExecute(Sender: TObject);
     procedure TCPreciosChange(Sender: TObject);
     procedure DBGFDetalleTallasPreciosRowChange(Sender: TObject);
     procedure DBGFDetalleTallasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleTallasColEnter(Sender: TObject);
     procedure ASeleccionarKitExecute(Sender: TObject);
     procedure AInsercionMasivaModeloExecute(Sender: TObject);
  private
     { Private declarations }
     dm: TDMTallas_e;
  public
     { Public declarations }
     function SelectedFieldName: string;
     procedure SetDM(dm: TDMTallas_e);
     procedure AjustarGrid;
     procedure LocateTalla(cod_talla: string);
  end;

implementation

uses UDMMain, UFMStockTallas, UDMTallas, UFMain, UEntorno, UFMSeleccion, UParam, UUtiles, HYFIBQuery;

{$R *.dfm}

procedure TFRTallas_e.DBGFDetalleTallasRowChange(Sender: TObject);
begin
  AjustarGrid;
end;

procedure TFRTallas_e.SetDM(dm: TDMTallas_e);
begin
  Self.dm := dm;
  DSQMver_detalles_gr_ed.DataSet := dm.QMver_detalles_gr_ed;
  DSQMver_detalles_gr_ed_pc.DataSet := dm.QMver_detalles_gr_ed_pc;
end;

procedure TFRTallas_e.DBGFDetalleTallasBusqueda(Sender: TObject);
begin
  with (TDBGridFind2000(Sender)) do
  begin
     if Pos('ART_ARTICULOS_MODELOS', TablaABuscar) > 0 then
     begin
        // Busqueda del modelo
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;

        // Limita a solo a modelos del proveedor
        if (LeeParametro('TYCCOMP001', '') = 'S') then
           CondicionBusqueda := CondicionBusqueda + ' AND PROVEEDOR =' + VartoStr(dm.QMCabecera['PROVEEDOR']);

        if (FMain.AModelosTallas.Enabled = True) then
           Accion := FMain.AModelosTallas;
     end
     else
     begin
        // Busqueda del resto de cosas (color del modelo)
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND REF_PROVEEDOR =''' +
           VartoStr(dm.QMver_detalles_gr_ed['REF_PROVEEDOR']) + '''';
     end;
  end;
end;

procedure TFRTallas_e.DBGFDetalleTallasExiste(Sender: TObject);
begin
  AjustarGrid;
end;

procedure TFRTallas_e.DBGFDetalleTallasCampoDevuelve(Sender: TObject; valor: string);
begin
  AjustarGrid;
end;

procedure TFRTallas_e.AStockTallasExecute(Sender: TObject);
var
  ID_A_M_C : variant;
begin
  ID_A_M_C := null;
  if dm.QMver_detalles_gr_ed['ID_A_M_C'] <> null then
     ID_A_M_C := dm.QMver_detalles_gr_ed['ID_A_M_C'];
  if dm.QMver_detalles_gr_ed_pc['ID_A_M_C'] <> null then
     ID_A_M_C := dm.QMver_detalles_gr_ed_pc['ID_A_M_C'];
  if ID_A_M_C <> null then
     TFMStockTallas.Create(Self).MuestraAMC(ID_A_M_C);
end;

procedure TFRTallas_e.TCPreciosChange(Sender: TObject);
begin
  case TCPrecios.TabIndex of
     0: // Unidades
     begin
        dm.QMver_detalles_gr_ed.Open;
        DBGFDetalleTallas.Visible := True;
        DBGFDetalleTallas.SetFocus;
        DBGFDetalleTallasPrecios.Visible := False;
        NavTallas.DataSource := DSQMver_detalles_gr_ed;
        NavTallas.EditaControl := DBGFDetalleTallas;
        NavTallas.InsertaControl := DBGFDetalleTallas;
        dm.SyncTallas(TCPrecios.TabIndex);
        with DBGFDetalleTallas do
           SelectedField := DataSource.DataSet.FindField(
              'T' + Copy(DBGFDetalleTallasPrecios.SelectedField.FieldName, 2, 2));
        dm.QMver_detalles_gr_ed_pc.Close;
     end;
     1: // Precios
     begin
        dm.QMver_detalles_gr_ed_pc.Open;
        DBGFDetalleTallas.Visible := False;
        DBGFDetalleTallasPrecios.Visible := True;
        DBGFDetalleTallasPrecios.SetFocus;
        NavTallas.EditaControl := DBGFDetalleTallasPrecios;
        NavTallas.InsertaControl := DBGFDetalleTallasPrecios;
        NavTallas.DataSource := DSQMver_detalles_gr_ed_pc;
        DMTallas.SetCaptions(dm.QMver_detalles_gr_ed_pc['ID_G_T'],
           DBGFDetalleTallasPrecios);
        dm.SyncTallas(TCPrecios.TabIndex);
        with DBGFDetalleTallasPrecios do
           SelectedField := DataSource.DataSet.FindField(
              'P' + Copy(DBGFDetalleTallas.SelectedField.FieldName, 2, 2));
        dm.QMver_detalles_gr_ed.Close;
     end;
  end;
  AjustarGrid;
end;

procedure TFRTallas_e.DBGFDetalleTallasColEnter(Sender: TObject);
begin
  AjustarGrid;
end;

procedure TFRTallas_e.AjustarGrid;
var
  ID_G_T, ID_A_M_C : variant;
begin
  ID_G_T := dm.GetActive['ID_G_T'];
  ID_A_M_C := dm.GetActive(TCPrecios.TabIndex)['ID_A_M_C'];
  if ((ID_G_T <> null) and (ID_A_M_C <> null)) then
  begin
     DMTallas.SetCaptions(ID_G_T, DBGFDetalleTallas, ID_A_M_C);
     DMTallas.SetCaptions(ID_G_T, DBGFDetalleTallasPrecios, ID_A_M_C);
  end;
end;

procedure TFRTallas_e.DBGFDetalleTallasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Column.Field.FieldName = 'P_COMPRA') and
        (dm.QMver_detalles_gr_ed['CAMBIA'] <> null) and
        (dm.QMver_detalles_gr_ed['CAMBIA'] <> 0) then
        ColorResaltado5(Canvas);

     // Marco color inhabilitado si la talla no tiene articulo asociado.
     if ((Column.Field.FieldName >= 'T01') and (Column.Field.FieldName <= 'T22')) then
     begin
        if ((dm.QMver_detalles_gr_ed[Column.Field.FieldName] <> null)) then
           ColorEdicion(Canvas)
        else
           ColorInactivo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFRTallas_e.LocateTalla(cod_talla: string);
begin
  if (StrToIntDef(cod_talla, 0) <= 22) then
  begin
     case TCPrecios.TabIndex of
        0: // Unidades
        begin
           DBGFDetalleTallas.SetFocus;
           DBGFDetalleTallas.SelectedField :=
              dm.QMver_detalles_gr_ed.FindField('T' + cod_talla);
        end;
        1: // Precios
        begin
           DBGFDetalleTallasPrecios.SetFocus;
           DBGFDetalleTallasPrecios.SelectedField :=
              dm.QMver_detalles_gr_ed_pc.FindField('P' + cod_talla);
        end;
     end;
  end;
end;

procedure TFRTallas_e.DBGFDetalleTallasPreciosRowChange(Sender: TObject);
begin
  AjustarGrid;
end;

function TFRTallas_e.SelectedFieldName: string;
begin
  case TCPrecios.TabIndex of
     0: Result := DBGFDetalleTallas.SelectedField.FieldName;
     1: Result := DBGFDetalleTallasPrecios.SelectedField.FieldName
  end;
end;

procedure TFRTallas_e.ASeleccionarKitExecute(Sender: TObject);
var
  Kit : string;
  IdGT : integer;
  Cantidad : double;
begin
  { TODO : Copiar de DMMovManStock.AsignaKit }

  Kit := '';
  Cantidad := 1;
  IdGT := dm.GetActive(TCPrecios.TabIndex)['ID_G_T'];
  if (PideDato('KIT', Kit, '', 'ID_G_T = ' + IntToStr(IdGT))) then
  begin
     if (PideDato('DBL', Cantidad, _('Cantidad'))) then
        dm.UnidadesSegunKit(Kit, Cantidad);
  end;
end;

procedure TFRTallas_e.AInsercionMasivaModeloExecute(Sender: TObject);
var
  RefProveedor : string;
begin
  if PideDato('MOD', RefProveedor) then
     dm.InsertaModelo(RefProveedor);
end;

end.
