unit UDMRPrevisionCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_DSet, FR_DBSet, FIBDataSetRO, FIBDatabase, UFIBModificados, FR_Class,
  Fr_HYReport, FIBQuery, DB, FIBDataSet, FIBTableDataSet, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMRPrevisionCuentas = class(TDataModule)
     DSxMonedas: TDataSource;
     frHYImportesCuentas: TfrHYReport;
     TLocal: THYTransaction;
     SPPrevisionCuentas: TFIBDataSetRO;
     DSPrevisionCuentas: TDataSource;
     frDBPrevCuentas: TfrDBDataSet;
     xMonedas: TFIBDataSetRO;
     frxHYImportesCuentas: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRTotalCuentasCreate(Sender: TObject);
     procedure DMRTotalCuentasDestroy(Sender: TObject);
     procedure frHYImportesCuentasGetValue(const ParName: string; var ParValue: variant);
     procedure frHYImportesCuentasEnterRect(Memo: TStringList; View: TfrView);
     procedure frxHYImportesCuentasBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYImportesCuentasGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     FechaListado: TDateTime;
     Comentario, Moneda, Signo: string;
  public
     { Public declarations }
     FechaD, FechaH: TDateTime;
     procedure MostrarListado(parFechaD, parFechaH, parFechaListado: TDateTime; parMoneda, parComentario, parSigno: string; Modo: integer);
     procedure Rangos(parSigno: string);
  end;

var
  DMRPrevisionCuentas : TDMRPrevisionCuentas;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados;

{$R *.DFM}

procedure TDMRPrevisionCuentas.DMRTotalCuentasCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  xMonedas.Open;
end;

procedure TDMRPrevisionCuentas.DMRTotalCuentasDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRPrevisionCuentas.MostrarListado(parFechaD, parFechaH, parFechaListado: TDateTime; parMoneda, parComentario, parSigno: string; Modo: integer);
var
  str, auxMascaraN : string;
  fecha_desde, fecha_hasta : TDateTime;
begin
  auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);
  try
     // Asignar las variables globales del listado
     FechaD := parFechaD;
     FechaH := parFechaH;
     FechaListado := parFechaListado;
     Moneda := parMoneda;
     Comentario := parComentario;
     Signo := parSigno;

     fecha_desde := Int(FechaD);
     fecha_hasta := FechaH;

     DMListados.Normalizar_Desde_Hasta(fecha_desde, fecha_hasta);

     with SPPrevisionCuentas do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['DESDE'].AsDateTime := fecha_desde;
        Params.ByName['HASTA'].AsDateTime := fecha_hasta;
        Params.ByName['SIGNO'].AsString := parSigno;
        Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
        Params.ByName['FECHA'].AsDateTime := FechaListado;
        Open;
     end;

     DMListados.Cargar(501, '');

     if (REntorno.TipoListado = 'FRF') then
     begin
        frHYImportesCuentas.LoadFromFIB(REntorno.Formato, str);
        frHYImportesCuentas.PrepareReport;
        case Modo of
           0: frHYImportesCuentas.ShowPreparedReport;
           1: frHYImportesCuentas.PrintPreparedReport('', REntorno.Copias);
        end;
     end;
     if (REntorno.TipoListado = 'FR3') then
     begin
        frxHYImportesCuentas.LoadFromFIB(REntorno.Formato, str);
        frxHYImportesCuentas.PrepareReport;
        case Modo of
           0: frxHYImportesCuentas.ShowPreparedReport;
           1: frxHYImportesCuentas.PrintPreparedReport(' ', REntorno.Copias);
        end;
     end;

     DMListados.LimpiaEntorno;
  finally
     MascaraN := auxMascaraN; // Recuperamos el valor de la MáscaraN
  end;
end;

procedure TDMRPrevisionCuentas.frHYImportesCuentasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloListado' then
     if (Signo = 'C') then
        ParValue := _('Previsión por Cuentas de Cobro')
     else
        ParValue := _('Previsión por Cuentas de Pago');

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'InicioVencimiento' then
     ParValue := StrToDate(DateToStr(FechaD));

  if ParName = 'FinalVencimiento' then
     ParValue := StrToDate(DateToStr(FechaH));

  if ParName = 'FechaListado' then
     ParValue := StrToDate(DateToStr(FechaListado));

  if ParName = 'Comentario' then
     ParValue := Comentario;

  if ParName = 'Moneda' then
     ParValue := Moneda;
end;

procedure TDMRPrevisionCuentas.frHYImportesCuentasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMRPrevisionCuentas.Rangos(parSigno: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(VENCIMIENTO), MAX(VENCIMIENTO) ');
        SQL.Add(' FROM EMP_CARTERA_DETALLE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' PAGADO = :PAGADO AND ');
        SQL.Add(' SIGNO = :SIGNO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PAGADO'].AsInteger := 0;
        Params.ByName['SIGNO'].AsString := parSigno;
        ExecQuery;
        FechaD := FieldByName['MIN'].AsDateTime;
        if (FechaD = 0) then
           FechaD := Date;
        FechaH := FieldByName['MAX'].AsDateTime;
        if (FechaH = 0) then
           FechaH := Date;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMRPrevisionCuentas.frxHYImportesCuentasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
  begin
     with TfrxCustomMemoView(Sender) do
     begin
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
     end;
  end;
end;

procedure TDMRPrevisionCuentas.frxHYImportesCuentasGetValue(const VarName: string; var Value: variant);
begin
  frHYImportesCuentasGetValue(VarName, Value);
end;

end.
