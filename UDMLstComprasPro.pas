unit UDMLstComprasPro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLstComprasPro = class(TDataModule)
     TLocal: THYTransaction;
     frDBDSxCompras_detalle: TfrDBDataSet;
     frHYComprasProveedores: TfrHYReport;
     QGen: THYFIBQuery;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xCompras_detalle: TFIBDataSetRO;
     DSxCompras_detalle: TDataSource;
     xArt_Desde: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     xArt_Hasta: TFIBDataSetRO;
     xFam_Desde: TFIBDataSetRO;
     DSxFam_Desde: TDataSource;
     DSxFam_Hasta: TDataSource;
     xFam_Hasta: TFIBDataSetRO;
     xPro_Desde: TFIBDataSetRO;
     DSxPro_Desde: TDataSource;
     DSxPro_Hasta: TDataSource;
     xPro_Hasta: TFIBDataSetRO;
     DSxSerie_Desde: TDataSource;
     xSerie_Desde: TFIBDataSetRO;
     xSerie_Hasta: TFIBDataSetRO;
     DSxSerie_Hasta: TDataSource;
     xCompras_detalleDOC_EMPRESA: TIntegerField;
     xCompras_detalleDOC_EJERCICIO: TIntegerField;
     xCompras_detalleDOC_CANAL: TIntegerField;
     xCompras_detalleDOC_SERIE: TFIBStringField;
     xCompras_detalleDOC_TIPO: TFIBStringField;
     xCompras_detalleDOC_RIG: TIntegerField;
     xCompras_detalleARTICULO: TFIBStringField;
     xCompras_detalleTITULO: TFIBStringField;
     xCompras_detalleUNIDADES: TFloatField;
     xCompras_detalleCOSTE: TFloatField;
     xCompras_detalleFECHA: TDateTimeField;
     xCompras_detalleUNIDADES_EXT: TFloatField;
     xCompras_detallePROVEEDOR: TIntegerField;
     xCompras_detalleTITULO_PROVEEDOR: TFIBStringField;
     xCompras_detalleTOTAL: TFloatField;
     frxHYComprasProveedores: TfrxHYReport;
     procedure DMComprasProCreate(Sender: TObject);
     procedure frHYComprasProveedoresGetValue(const ParName: string; var ParValue: variant);
     procedure frHYComprasProveedoresEnterRect(Memo: TStringList; View: TfrView);
     procedure DMComprasProDestroy(Sender: TObject);
     procedure frxHYComprasProveedoresBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYComprasProveedoresGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     Moneda: string;
     LocalMascaraL: string;
  public
     { Public declarations }
     LocalMascaraN: string;
     procedure Visualizar(modo, albaran, faccerrada, facabierta: smallint; ejerD, EjerH, CanalD, CanalH, proD, proH: integer; ArtD, ArtH, FamD, FamH, SerieD, SerieH, Moneda_listado: string; fechaD, FechaH: TDateTime);
     procedure CambiaMoneda(Moneda: string);
     procedure Rango1(var articulo_d, articulo_h, proveedorH, FamiliaD, FamiliaH, SerieD, SerieH: string);
  end;

var
  DMLstComprasPro : TDMLstComprasPro;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UFMListConfig, UFPregComprasProveedores;

{$R *.DFM}

procedure TDMLstComprasPro.DMComprasProCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);
end;

procedure TDMLstComprasPro.frHYComprasProveedoresGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;
end;

procedure TDMLstComprasPro.Visualizar(modo, albaran, faccerrada, facabierta: smallint; ejerD, EjerH, CanalD, CanalH, proD, proH: integer; ArtD, ArtH, FamD, FamH, SerieD, SerieH, Moneda_listado: string; fechaD, FechaH: TDateTime);
var
  str : string;
begin
  sw := 1;
  str := _('Listado de Compras por Proveedores');

  Moneda := Moneda_listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  with xCompras_detalle do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['EjercicioD'].AsInteger := EjerD;
     Params.ByName['EjercicioH'].AsInteger := EjerH;
     Params.ByName['CanalD'].AsInteger := CanalD;
     Params.ByName['CanalH'].AsInteger := CanalH;
     Params.ByName['SerieD'].AsString := SerieD;
     Params.ByName['SerieH'].AsString := SerieH;
     Params.ByName['ProveedorD'].AsInteger := ProD;
     Params.ByName['ProveedorH'].AsInteger := ProH;
     Params.ByName['entrada'].AsInteger := REntorno.Entrada;
     Params.ByName['facturas_abiertas'].AsInteger := facabierta;
     Params.ByName['facturas_cerradas'].AsInteger := faccerrada;
     Params.ByName['albaranes'].AsInteger := albaran;
     Params.ByName['moneda'].AsString := moneda;
     Params.ByName['ArticuloD'].AsString := ArtD;
     Params.ByName['ArticuloH'].AsString := ArtH;
     Params.ByName['FamiliaD'].AsString := FamD;
     Params.ByName['FamiliaH'].AsString := FamH;
     Params.ByName['FechaD'].AsDateTime := FechaD;
     Params.ByName['FechaH'].AsDateTime := FechaH;
     Open;
  end;
  DMListados.Cargar(158, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frHYComprasProveedores.LoadFromFIB(REntorno.Formato, str);
     frHYComprasProveedores.PrepareReport;
     if modo = 0 then
        frHYComprasProveedores.ShowPreparedReport
     else
        frHYComprasProveedores.PrintPreparedReport('', REntorno.copias);
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxHYComprasProveedores.LoadFromFIB(REntorno.Formato, str);
     frxHYComprasProveedores.PrepareReport;
     if modo = 0 then
        frxHYComprasProveedores.ShowPreparedReport
     else
        frxHYComprasProveedores.PrintPreparedReport('', REntorno.copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstComprasPro.frHYComprasProveedoresEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
  end;
end;

procedure TDMLstComprasPro.DMComprasProDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstComprasPro.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);
end;

procedure TDMLstComprasPro.Rango1(var articulo_d, articulo_h, proveedorH, FamiliaD, FamiliaH, SerieD, SerieH: string);
begin
  with QGen do
  begin
     Close;
     SQL.Text := 'Select max(proveedor) as proveedor from emp_proveedores where empresa=' +
        REntorno.EmpresaStr;
     ExecQuery;
     proveedorH := FieldByName['proveedor'].AsString;
     Close;
     SQL.Text := 'Select max(articulo) as arth, min(articulo) as artd from art_articulos where empresa=' +
        REntorno.EmpresaStr + ' and FAMILIA<>''' + REntorno.FamSistema + '''';
     ExecQuery;
     articulo_d := FieldByName['artd'].AsString;
     articulo_h := FieldByName['arth'].AsString;
     Close;
     SQL.Text := 'Select max(familia) as famh, min(familia) as famd from art_familias where empresa=' +
        REntorno.EmpresaStr + ' and FAMILIA<>''' + REntorno.FamSistema + '''';
     ExecQuery;
     FamiliaD := FieldByName['famd'].AsString;
     FamiliaH := FieldByName['Famh'].AsString;
     Close;
     SQL.Text := 'Select max(serie) as serh, min(serie) as serd from emp_series where empresa=' +
        REntorno.EmpresaStr;
     ExecQuery;
     SerieD := FieldByName['serd'].AsString;
     SerieH := FieldByName['serh'].AsString;
  end;
end;

procedure TDMLstComprasPro.frxHYComprasProveedoresBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraE]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstComprasPro.frxHYComprasProveedoresGetValue(const VarName: string; var Value: variant);
begin
  frHYComprasProveedoresGetValue(VarName, Value);
end;

end.
