unit UDMVentasCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet;

type
  TDMVentasCli = class(TDataModule)
     TLocal: THYTransaction;
     DSxVentasCliente: TDataSource;
     xVentasCliente: TFIBTableSet;
     xVentasClienteTOTAL_VENTAS: TFloatField;
     xVentasClienteUNIDADES: TFloatField;
     xVentasClienteARTICULO: TFIBStringField;
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
     procedure DMVentasCliCreate(Sender: TObject);
     procedure frHYVentasClientesGetValue(const ParName: string; var ParValue: variant);
     procedure frHYVentasClientesEnterRect(Memo: TStringList; View: TfrView);
     procedure DMVentasCliDestroy(Sender: TObject);
  private
     { Private declarations }
     SW: integer;
     Cliente: integer;
     Moneda: string;
  public
     { Public declarations }
     LocalMascaraN: string;
     LocalMascaraL: string;
     procedure ActualizaTabla(aCliente, Modo: integer; var Total: double; MonedaAMostrar: string);
     procedure Visualizar(Moneda_Listado: string);
     procedure Configurar;
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMVentasCli : TDMVentasCli;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UFMListConfig, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMVentasCli.DMVentasCliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);

  AsignaDisplayFormat(xVentasCliente, LocalMascaraL, MascaraI, ShortDateFormat);

  xVentasClienteMARGEN.DisplayFormat := MascaraP;
  xVentasClienteUNIDADES.DisplayFormat := MascaraI;
  xVentasClienteUNIDADES_SEC.DisplayFormat := MascaraI;
end;

procedure TDMVentasCli.DMVentasCliDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMVentasCli.ActualizaTabla(aCliente, Modo: integer; var Total: double; MonedaAMostrar: string);
var
  Q : THYFIBQuery;
begin
  Cliente := aCliente;

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'EXECUTE PROCEDURE G_VENTAS_ARTICULOS_CLIENTE(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CLIENTE, :BORRAR, :MODO, :ENTRADA, :MONEDA)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['BORRAR'].AsInteger := 1;
     Params.ByName['MODO'].AsInteger := Modo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['MONEDA'].AsString := MonedaAMostrar;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);

  with xVentasCliente do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT SUM(TOTAL_VENTAS) AS TOTAL FROM TMP_VENTAS_ART_CLI WHERE ENTRADA = :ENTRADA';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     Total := FieldByName['TOTAL'].AsDouble;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMVentasCli.frHYVentasClientesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'CLIENTE' then
     ParValue := DameNombreComercialCliente(Cliente);

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;
end;

procedure TDMVentasCli.Visualizar(Moneda_Listado: string);
var
  str : string;
begin
  sw := 1;
  str := _('Listado de Ventas por Clientes');

  Moneda := Moneda_Listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Cargar(92, '');
  frHYVentasClientes.LoadFromFIB(REntorno.Formato, str);
  frHYVentasClientes.PrepareReport;
  frHYVentasClientes.ShowPreparedReport;
  DMListados.LimpiaEntorno;
end;

procedure TDMVentasCli.Configurar;
var
  formato, cabecera, copias, pijama, grupo : integer;
begin
  grupo := 92;
  TFMListConfig.Create(Self).Muestra(grupo, formato, cabecera, copias,
     pijama, '', frHYVentasClientes);
end;

procedure TDMVentasCli.frHYVentasClientesEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMVentasCli.CambiaMoneda(Moneda: string);
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

end.
