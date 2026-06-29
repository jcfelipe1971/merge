unit UFMStockTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, Grids, DBGrids, NsDBGrid, UHYDBGrid, ToolWin,
  rxPlacemnt, UDMStockTallas, HYFIBQuery, UFormGest, ULFToolBar,
  ULFFormStorage, ExtCtrls, ULFPanel, UFPEditSinNavegador, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel;

type
  TFMStockTallas = class(TFPEditSinNavegador)
     DSxStocksAlmacenesModeloColor: TDataSource;
     HYTDBGModeloColor: THYTDBGrid;
     TCModo: TTabControl;
     TCTipo: TTabControl;
     HYTDBGModelo: THYTDBGrid;
     DSxStocksAlmacenesModelo: TDataSource;
     TBSep1: TToolButton;
     procedure TCModoChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TCTipoChange(Sender: TObject);
  private
     { Private declarations }
     id_a_m_c: integer;
     id_a_m: integer;
     dm: TDMStockTallas;
  public
     { Public declarations }
     procedure MuestraArt(Articulo: string);
     procedure MuestraAM(id_a_m: integer);
     procedure MuestraAMC(id_a_m_c: integer);
  end;

var
  FMStockTallas : TFMStockTallas;

implementation

uses UDMTallas, UDMMain, UEntorno;

{$R *.dfm}

procedure TFMStockTallas.MuestraAMC(id_a_m_c: integer);
begin
  AbreDataVarias(TDMStockTallas, dm, nil);

  Self.id_a_m_c := id_a_m_c;
  dm.AbrirAMC(id_a_m_c, 0);
  if dm.xStocksAlmacenesModeloColor['ID_A_M'] <> null then
     id_a_m := dm.xStocksAlmacenesModeloColor['ID_A_M'];
  DSxStocksAlmacenesModeloColor.DataSet := dm.xStocksAlmacenesModeloColor;
  DMTallas.SetColumns(dm.xStocksAlmacenesModeloColor['ID_G_T'], HYTDBGModelo);
  DMTallas.SetColumns(dm.xStocksAlmacenesModeloColor['ID_G_T'], HYTDBGModeloColor);
  // HYTDBGrid1.DataSource:=DSxStocksAlmacenesModeloColor;
  TCTipo.TabIndex := 1;
  HYTDBGModelo.Visible := False;
  HYTDBGModeloColor.Visible := True;

  ShowModal;
end;

procedure TFMStockTallas.MuestraAM(id_a_m: integer);
begin
  AbreDataVarias(TDMStockTallas, dm, nil);

  Self.id_a_m := id_a_m;
  dm.AbrirAM(id_a_m, 0);
  TCTipo.Enabled := False;
  DSxStocksAlmacenesModelo.DataSet := dm.xStocksAlmacenesModelo;
  DMTallas.SetColumns(dm.xStocksAlmacenesModelo['ID_G_T'], HYTDBGModelo);
  // HYTDBGrid1.DataSource:=DSxStocksAlmacenesModeloColor;
  TCTipo.TabIndex := 0;
  HYTDBGModelo.Visible := True;
  HYTDBGModeloColor.Visible := False;

  ShowModal;
end;

procedure TFMStockTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(dm);
end;

procedure TFMStockTallas.TCModoChange(Sender: TObject);
begin
  case TCTipo.TabIndex of
     0: // Modelo
        dm.AbrirAM(id_a_m, TCModo.TabIndex);

     1: // Modelo-Color
        dm.AbrirAMC(id_a_m_c, TCModo.TabIndex);
  end;
end;

procedure TFMStockTallas.MuestraArt(Articulo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT AMC.ID_A_M FROM ART_ARTICULOS ART ');
        SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS ATA ON ART.ID_A_M_C_T = ATA.ID_A_M_C_T  ');
        SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ON ATA.ID_A_M_C = AMC.ID_A_M_C ');
        SQL.Add(' WHERE ');
        SQL.Add(' ART.EMPRESA = :EMPRESA AND ');
        SQL.Add(' ART.ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        id_a_m := FieldByName['ID_A_M'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  MuestraAM(id_a_m);
end;

procedure TFMStockTallas.TCTipoChange(Sender: TObject);
begin
  case TCTipo.TabIndex of
     0: // Modelo
     begin
        dm.AbrirAM(id_a_m, TCModo.TabIndex);
        HYTDBGModelo.Visible := True;
        HYTDBGModeloColor.Visible := False;
     end;
     1: // Modelo-Color
     begin
        dm.AbrirAMC(id_a_m_c, TCModo.TabIndex);
        HYTDBGModelo.Visible := False;
        HYTDBGModeloColor.Visible := True;
     end;
  end;
end;

end.
