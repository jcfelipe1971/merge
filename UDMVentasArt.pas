unit UDMVentasArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet;

type
  TDMVentasArt = class(TDataModule)
     TLocal: THYTransaction;
     DSxVentasCliente: TDataSource;
     xVentasCliente: TFIBTableSet;
     xVentasClienteTOTAL_VENTAS: TFloatField;
     xVentasClienteUNIDADES: TFloatField;
     xVentasClienteTITULO: TFIBStringField;
     xVentasClienteCOSTE: TFloatField;
     xVentasClientePV: TFloatField;
     xVentasClienteMARGEN: TFloatField;
     xVentasClienteENTRADA: TIntegerField;
     frDBDSxVentasCliente: TfrDBDataSet;
     frHYVentasClientes: TfrHYReport;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xVentasClienteUNIDADES_SEC: TFloatField;
     xVentasClienteCLIENTE: TIntegerField;
     xVentasClienteMARGEN_PORC: TFloatField;
     procedure DMVentasArtCreate(Sender: TObject);
     procedure frHYVentasClientesGetValue(const ParName: string; var ParValue: variant);
     procedure frHYVentasClientesEnterRect(Memo: TStringList; View: TfrView);
     procedure DMVentasArtDestroy(Sender: TObject);
     procedure xVentasClienteCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     Articulo: string;
     Moneda: string;
     LocalMascaraL: string;
     SW: integer;
  public
     { Public declarations }
     LocalMascaraN: string;
     procedure ActualizaTabla(aArticulo: string; Modo, id_a: integer; var TotalVentas, TotalUnidades: double; MonedaAMostrar: string);
     procedure Visualizar(Moneda_Listado: string);
     procedure Configurar;
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMVentasArt : TDMVentasArt;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UFMListConfig, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMVentasArt.DMVentasArtCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);

  AsignaDisplayFormat(xVentasCliente, LocalMascaraL, MascaraI, ShortDateFormat);

  xVentasClienteTOTAL_VENTAS.DisplayFormat := LocalMascaraL;
  xVentasClienteUNIDADES.DisplayFormat := MascaraI;
  xVentasClienteUNIDADES_SEC.DisplayFormat := MascaraI;
  xVentasClienteMARGEN_PORC.DisplayFormat := MascaraP;
end;

procedure TDMVentasArt.DMVentasArtDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMVentasArt.ActualizaTabla(aArticulo: string; Modo, id_a: integer; var TotalVentas, TotalUnidades: double; MonedaAMostrar: string);
begin
  Articulo := aArticulo;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_VENTAS_CLIENTES_ARTICULO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ARTICULO, :BORRAR, :MODO, :ENTRADA, :MONEDA, :ID_A)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['BORRAR'].AsInteger := 1;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MONEDA'].AsString := MonedaAMostrar;
        Params.ByName['ID_A'].AsInteger := id_a;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xVentasCliente do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(TOTAL_VENTAS) AS VENTAS, SUM(UNIDADES) AS UNIDADES FROM TMP_VENTAS_CLI_ART WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        TotalVentas := FieldByName['VENTAS'].AsDouble;
        TotalUnidades := FieldByName['UNIDADES'].AsDouble;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMVentasArt.frHYVentasClientesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Articulo' then
     ParValue := Articulo;

  if ParName = 'Descripcion' then
     ParValue := DameTituloArticulo(Articulo);

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;
end;

procedure TDMVentasArt.Visualizar(Moneda_Listado: string);
begin
  sw := 1;

  Moneda := Moneda_Listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Imprimir(128, 0, 0, '', _('Listado de Ventas por Artículo'), frHYVentasClientes, nil, nil, nil);
end;

procedure TDMVentasArt.Configurar;
var
  Formato, Cabecera, Copias, Pijama, Grupo : integer;
begin
  Grupo := 128;
  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias,
     Pijama, '', frHYVentasClientes);
end;

procedure TDMVentasArt.frHYVentasClientesEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMVentasArt.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;

  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  xVentasClienteTOTAL_VENTAS.DisplayFormat := LocalMascaraL;
end;

procedure TDMVentasArt.xVentasClienteCalcFields(DataSet: TDataSet);
begin
  xVentasClienteMARGEN_PORC.AsFloat := DMMain.DameMargenUtilidad(xVentasClientePV.AsFloat, xVentasClienteCOSTE.AsFloat);
end;

end.
