unit UFMCalculaStockMinMax;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, HYFIBQuery, UFormGest,
  ULFEdit, ULFLabel, ULFPanel, ULFEditFind2000, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel, ToolWin, ComCtrls, ULFToolBar, ULFPageControl;

type
  TFMCalculaStockMinMax = class(TFPEditSinNavegador)
     PNLDatos: TLFPanel;
     EFDesdeAlmacen: TLFEditFind2000;
     EFHastaAlmacen: TLFEditFind2000;
     LDesdeAlmacen: TLFLabel;
     LHastaAlmancen: TLFLabel;
     EdHastaAlmacen: TLFEdit;
     LMesInicial: TLFLabel;
     LMeses: TLFLabel;
     EdMesInicial: TLFEdit;
     EdMeses: TLFEdit;
     EdDesdeAlmacen: TLFEdit;
     ACalcular: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PCMain: TLFPageControl;
     TSCalculoStockMinMax1: TTabSheet;
     TSCalculoStockMinMax2: TTabSheet;
     LAlmacenDesde2: TLFLabel;
     LAlmacenHasta2: TLFLabel;
     EFAlmacenDesde2: TLFEditFind2000;
     EFAlmacenHasta2: TLFEditFind2000;
     EAlmacenDesde2: TLFEdit;
     EAlmacenHasta2: TLFEdit;
     LArticuloDesde: TLFLabel;
     LArticuloHasta: TLFLabel;
     EFArticuloDesde: TLFEditFind2000;
     EFArticuloHasta: TLFEditFind2000;
     EArticuloDesde: TLFEdit;
     EArticuloHasta: TLFEdit;
     LFamiliaDesde: TLFLabel;
     LFamiliaHasta: TLFLabel;
     EFFamiliaDesde: TLFEditFind2000;
     EFFamiliaHasta: TLFEditFind2000;
     EFamiliaDesde: TLFEdit;
     EFamiliaHasta: TLFEdit;
     LPeriodoDesde: TLFLabel;
     LPeriodoHasta: TLFLabel;
     EFPeriodoDesde: TLFEditFind2000;
     EFPeriodoHasta: TLFEditFind2000;
     LEFactorStockMinimo: TLFLabel;
     LEFactorStockMaximo: TLFLabel;
     EFactorStockMinimo: TLFEdit;
     EFactorStockMaximo: TLFEdit;
     EPeriodoHasta: TLFEdit;
     EPeriodoDesde: TLFEdit;
     BCalcular: TToolButton;
     TSep1: TToolButton;
     LCanalDesde: TLFLabel;
     LanalHasta: TLFLabel;
     EFCanalDesde: TLFEditFind2000;
     EFCanalHasta: TLFEditFind2000;
     ECanalDesde: TLFEdit;
     ECanalHasta: TLFEdit;
     procedure EFDesdeAlmacenChange(Sender: TObject);
     procedure EFHastaAlmacenChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ACalcularExecute(Sender: TObject);
     procedure EFAlmacenDesde2Change(Sender: TObject);
     procedure EFAlmacenHasta2Change(Sender: TObject);
     procedure EFArticuloDesdeChange(Sender: TObject);
     procedure EFArticuloHastaChange(Sender: TObject);
     procedure EFFamiliaDesdeChange(Sender: TObject);
     procedure EFFamiliaHastaChange(Sender: TObject);
     procedure EFPeriodoDesdeChange(Sender: TObject);
     procedure EFPeriodoHastaChange(Sender: TObject);
     procedure EFCanalDesdeChange(Sender: TObject);
     procedure EFCanalHastaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCalculaStockMinMax : TFMCalculaStockMinMax;

implementation

uses UDMMain, UDMCalculaStockMinMax, UEntorno, UUtiles, UDameDato, UFMain;

{$R *.DFM}

procedure TFMCalculaStockMinMax.FormCreate(Sender: TObject);
var
  Min, Max : string;
  Min_Int, Max_Int : integer;
begin
  inherited;
  AbreData(TDMCalculaStockMinMax, DMCalculaStockMinMax);

  // Este es un calculo que no se utiliza actualmente. Si se reutiliza, habrá que parametrizar.
  TSCalculoStockMinMax1.TabVisible := False;

  DameMinMax('ALM', Min, Max);
  EFDesdeAlmacen.Text := Min;
  EFHastaAlmacen.Text := Max;
  EFAlmacenDesde2.Text := Min;
  EFAlmacenHasta2.Text := Max;

  DameMinMax('ART', Min, Max);
  EFArticuloDesde.Text := Min;
  EFArticuloHasta.Text := Max;

  DameMinMax('FAM', Min, Max);
  EFFamiliaDesde.Text := Min;
  EFFamiliaHasta.Text := Max;

  DameMinMax('PE1', Min, Max);
  EFPeriodoDesde.Text := Min;
  EFPeriodoHasta.Text := Max;

  DameMinMax('CAN', Min_Int, Max_Int);
  EFCanalDesde.Text := IntToStr(Min_Int);
  EFCanalHasta.Text := IntToStr(Max_Int);

  FMain.AddComponentePunto(EFactorStockMinimo);
  FMain.AddComponentePunto(EFactorStockMaximo);
end;

procedure TFMCalculaStockMinMax.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.DelComponentePunto(EFactorStockMinimo);
  FMain.DelComponentePunto(EFactorStockMaximo);

  CierraData(DMCalculaStockMinMax);
end;

procedure TFMCalculaStockMinMax.EFDesdeAlmacenChange(Sender: TObject);
begin
  EdDesdeAlmacen.Text := DameTituloAlmacen(EFDesdeAlmacen.Text);
end;

procedure TFMCalculaStockMinMax.EFHastaAlmacenChange(Sender: TObject);
begin
  EdHastaAlmacen.Text := DameTituloAlmacen(EFHastaAlmacen.Text);
end;

procedure TFMCalculaStockMinMax.ACalcularExecute(Sender: TObject);
begin
  inherited;

  // Esta opcion actualmente no se utiliza
  if (PCMain.ActivePage = TSCalculoStockMinMax1) then
  begin
     if (StrToIntDef(EdMesInicial.Text, 0) < 1) or (StrToIntDef(EdMesInicial.Text, 0) > 12) then
        MessageDlg(_('El mes inicial debe ser un número entre 1 y 12'), mtError, [mbOK], 0)
     else
     if (StrToIntDef(EdMeses.Text, 0) < 1) or (StrToIntDef(EdMeses.Text, 0) > 12) then
        MessageDlg(_('La cantidad de meses debe ser un número entre 1 y 12'), mtError, [mbOK], 0)
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE A_CALCULA_STOCK_MIN_MAX_EMP (:EMPRESA, :EJERCICIO, :CANAL, :D_ALMACEN, :H_ALMACEN, :MES_INICAL, :MESES)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['D_ALMACEN'].AsString := EFDesdeAlmacen.Text;
              Params.ByName['H_ALMACEN'].AsString := EFHastaAlmacen.Text;
              Params.ByName['MES_INICAL'].AsInteger := StrToInt(EdMesInicial.Text);
              Params.ByName['MESES'].AsInteger := StrToInt(EdMeses.Text);
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if (PCMain.ActivePage = TSCalculoStockMinMax2) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE A_CALCULA_STOCK_MIN_MAX_EMP_2(:EMPRESA, :EJERCICIO, :CANAL_INI, :CANAL_FIN, :ALMACEN_INI, ');
           SQL.Add(' :ALMACEN_FIN, :PERIODO_INI, :PERIODO_FIN, :ARTICULO_INI, :ARTICULO_FIN, :FAMILIA_INI, :FAMILIA_FIN, ');
           SQL.Add(' :FACTOR_STOCK_MIN, :FACTOR_STOCK_MAX) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL_INI'].AsInteger := StrToInt(EFCanalDesde.Text);
           Params.ByName['CANAL_FIN'].AsInteger := StrToInt(EFCanalHasta.Text);
           Params.ByName['ALMACEN_INI'].AsString := EFAlmacenDesde2.Text;
           Params.ByName['ALMACEN_FIN'].AsString := EFAlmacenHasta2.Text;
           Params.ByName['PERIODO_INI'].AsString := EFPeriodoDesde.Text;
           Params.ByName['PERIODO_FIN'].AsString := EFPeriodoHasta.Text;
           Params.ByName['ARTICULO_INI'].AsString := EFArticuloDesde.Text;
           Params.ByName['ARTICULO_FIN'].AsString := EFArticuloHasta.Text;
           Params.ByName['FAMILIA_INI'].AsString := EFFamiliaDesde.Text;
           Params.ByName['FAMILIA_FIN'].AsString := EFFamiliaHasta.Text;
           Params.ByName['FACTOR_STOCK_MIN'].AsFloat := StrToFloat(EFactorStockMinimo.Text);
           Params.ByName['FACTOR_STOCK_MAX'].AsFloat := StrToFloat(EFactorStockMaximo.Text);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFMCalculaStockMinMax.EFAlmacenDesde2Change(Sender: TObject);
begin
  inherited;
  EAlmacenDesde2.Text := DameTituloAlmacen(EFAlmacenDesde2.Text);
end;

procedure TFMCalculaStockMinMax.EFAlmacenHasta2Change(Sender: TObject);
begin
  inherited;
  EAlmacenHasta2.Text := DameTituloAlmacen(EFAlmacenHasta2.Text);
end;

procedure TFMCalculaStockMinMax.EFArticuloDesdeChange(Sender: TObject);
begin
  inherited;
  EArticuloDesde.Text := DameTituloArticulo(EFArticuloDesde.Text);
end;

procedure TFMCalculaStockMinMax.EFArticuloHastaChange(Sender: TObject);
begin
  inherited;
  EArticuloHasta.Text := DameTituloArticulo(EFArticuloHasta.Text);
end;

procedure TFMCalculaStockMinMax.EFFamiliaDesdeChange(Sender: TObject);
begin
  inherited;
  EFamiliaDesde.Text := DameTituloFamilia(EFFamiliaDesde.Text);
end;

procedure TFMCalculaStockMinMax.EFFamiliaHastaChange(Sender: TObject);
begin
  inherited;
  EFamiliaHasta.Text := DameTituloFamilia(EFFamiliaHasta.Text);
end;

procedure TFMCalculaStockMinMax.EFPeriodoDesdeChange(Sender: TObject);
begin
  inherited;
  EPeriodoDesde.Text := DameTituloPeriodo(EFPeriodoDesde.Text);
end;

procedure TFMCalculaStockMinMax.EFPeriodoHastaChange(Sender: TObject);
begin
  inherited;
  EPeriodoHasta.Text := DameTituloPeriodo(EFPeriodoHasta.Text);
end;

procedure TFMCalculaStockMinMax.EFCanalDesdeChange(Sender: TObject);
begin
  inherited;
  ECanalDesde.Text := DameTituloCanal(StrToIntDef(EFCanalDesde.Text, 0));
end;

procedure TFMCalculaStockMinMax.EFCanalHastaChange(Sender: TObject);
begin
  inherited;
  ECanalHasta.Text := DameTituloCanal(StrToIntDef(EFCanalHasta.Text, 0));
end;

end.
