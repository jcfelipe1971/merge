unit ZUDMLstRecibos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, ALetras;

type
  TZDMLstRecibos = class(TDataModule)
     DSxLstRecibosIngresos: TDataSource;
     xLstRecibosIngresos: TFIBDataSetRO;
     TLocal: THYTransaction;
     frRecibosIngresos: TfrHYReport;
     frDBLstRecibosIngresos: TfrDBDataSet;
     xLstRecibosLimites: TFIBDataSetRO;
     DSxLstRecibosLimites: TDataSource;
     frDBLstRecibosLimites: TfrDBDataSet;
     Letras: TLetra;
     xMonedas: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frRecibosIngresosGetValue(const ParName: string; var ParValue: variant);
     procedure xLstRecibosIngresosBeforeScroll(DataSet: TDataSet);
     procedure xLstRecibosLimitesBeforeScroll(DataSet: TDataSet);
     procedure frRecibosIngresosEnterRect(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
     Cliente: integer;
     Texto: string;
  public
     { Public declarations }
     procedure MostrarListado(Modo, Tipo: byte; Rig: integer);
     procedure MostrarListadoLimites(Modo: byte; FechaDesde, FechaHasta: TDate; ClienteDesde, ClienteHasta: string);
  end;

var
  ZDMLstRecibos : TZDMLstRecibos;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles, UDameDato;

{$R *.DFM}

procedure TZDMLstRecibos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  Letras.DescDecimales := _('céntimos');
  Letras.Separador := DecimalSeparator;
end;

procedure TZDMLstRecibos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLSTRecibos.MostrarListado(Modo, Tipo: byte; Rig: integer);
begin
  if Tipo = 0 then
  begin
     with xLstRecibosIngresos do
     begin
        Close;
        Params.ByName['ID'].AsInteger := Rig;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Open;
     end;

     DMListados.Imprimir(9006, 0, Modo, '', 'Listado Recibo Ingreso', frRecibosIngresos, nil, nil);
  end;
end;

procedure TZDMLstRecibos.MostrarListadoLimites(Modo: byte; FechaDesde, FechaHasta: TDate; ClienteDesde, ClienteHasta: string);
var
  auxMascaraN : string;
begin
  auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  with xLstRecibosLimites do
  begin
     Close;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Params.ByName['CLIENTE_DESDE'].AsString := ClienteDesde;
     Params.ByName['CLIENTE_HASTA'].AsString := ClienteHasta;
     Open;
  end;

  DMListados.Imprimir(9007, 0, Modo, '', 'Listado Recibo Ingreso', frRecibosIngresos, nil, nil);

  MascaraN := auxMascaraN;
end;

procedure TZDMLstRecibos.frRecibosIngresosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Letras' then
  begin
     Letras.Numero := xLstRecibosIngresos.FieldByName('MONTO_RECIBO').AsFloat;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := xLstRecibosIngresos.FieldByName('MONEDA').AsString;
        Open;
        Letras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.Descdecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     ParValue := Letras.AsString{ + ' ' + Letras.Moneda};
  end;

  if ParName = 'TituloCliente' then
     ParValue := DameTituloCliente(Cliente);
  if ParName = 'Texto' then
     ParValue := Texto;
end;

procedure TZDMLstRecibos.xLstRecibosIngresosBeforeScroll(DataSet: TDataSet);
begin
  Cliente := xLstRecibosIngresos.FieldByName('CLIENTE').AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TEXTO FROM Z_RECIBOS_CAB_TEXTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ID = ?ID ');
        Params.ByName['EMPRESA'].AsInteger := xLstRecibosIngresos.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xLstRecibosIngresos.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := xLstRecibosIngresos.FieldByName('CANAL').AsInteger;
        Params.ByName['ID'].AsInteger := xLstRecibosIngresos.FieldByName('ID').AsInteger;
        ExecQuery;
        Texto := FieldByName['TEXTO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMLstRecibos.xLstRecibosLimitesBeforeScroll(DataSet: TDataSet);
begin
  Cliente := xLstRecibosLimites.FieldByName('CLIENTE').AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TEXTO FROM Z_RECIBOS_CAB_TEXTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ID = ?ID ');
        Params.ByName['EMPRESA'].AsInteger := xLstRecibosLimites.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xLstRecibosLimites.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := xLstRecibosLimites.FieldByName('CANAL').AsInteger;
        Params.ByName['ID'].AsInteger := xLstRecibosLimites.FieldByName('ID').AsInteger;
        ExecQuery;
        Texto := FieldByName['TEXTO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMLstRecibos.frRecibosIngresosEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

end.
