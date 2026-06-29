unit UDMRTesoreria;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMRTesoreria = class(TDataModule)
     frDBTesoreria: TfrDBDataSet;
     frHYTesoreria: TfrHYReport;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     QMinFecha: THYFIBQuery;
     DSAsientos: TDataSource;
     QMAsientos: TFIBDataSetRO;
     TLocal: THYTransaction;
     QMaxFecha: THYFIBQuery;
     xMonedasMONEDA: TFIBStringField;
     xMonedasTITULO: TFIBStringField;
     xMonedasSIGNO_MONEDA: TFIBStringField;
     xMonedasDEC_VER: TIntegerField;
     xMonedasDEC_CALCULOS: TIntegerField;
     xMonedasDEFECTO: TIntegerField;
     frxHYTesoreria: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRTesoreriaCreate(Sender: TObject);
     procedure frHYTesoreriaGetValue(const ParName: string; var ParValue: variant);
     procedure frHYTesoreriaEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRTesoreriaDestroy(Sender: TObject);
     procedure frxHYTesoreriaBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYTesoreriaGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     Fecha_Desde, Fecha_Hasta, FechaListado: TDateTime;
     Comentario, Moneda: string;
  public
     { Public declarations }
     procedure MostrarListado(modo: integer);
     procedure CalculaInforme(comp, comc: string; com_numdoc, com_titcue: boolean; FDesde, FHasta, FListado: TDateTime; AComentario, AMoneda: string);
     procedure Rangos(var MinFecha, MaxFecha: TDateTime);
  end;

var
  DMRTesoreria : TDMRTesoreria;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados;

{$R *.DFM}

procedure TDMRTesoreria.DMRTesoreriaCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  xMonedas.Open;
end;

procedure TDMRTesoreria.DMRTesoreriaDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRTesoreria.CalculaInforme(comp, comc: string; com_numdoc, com_titcue: boolean; FDesde, FHasta, FListado: TDateTime; AComentario, AMoneda: string);
var
  c_numdoc, c_titcue : smallint;
begin
  Fecha_Desde := Trunc(FDesde);
  Fecha_Hasta := Trunc(FHasta) + 0.999999;
  FechaListado := FListado;
  Comentario := AComentario;
  Moneda := AMoneda;
  DMListados.Normalizar_Desde_Hasta(Fecha_Desde, Fecha_Hasta);

  if (com_numdoc) then
     c_numdoc := 1
  else
     c_numdoc := 0;
  if (com_titcue) then
     c_titcue := 1
  else
     c_titcue := 0;

  with QMAsientos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := Fecha_Desde;
     Params.ByName['HASTA'].AsDateTime := Fecha_Hasta;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     Params.ByName['FECHA'].AsDateTime := FechaListado;
     Params.ByName['COMP'].AsString := comp;     // Comentario en caso de Pago
     Params.ByName['COMC'].AsString := comc;     // Comentario en caso de Cobro
     Params.ByName['COM_NUMDOC'].AsInteger := c_numdoc;
     // Concatena el número de documento origen
     Params.ByName['COM_TITCUE'].AsInteger := c_titcue;
     // Concatena el título de la cuenta asociada
     Open;
  end;
end;

procedure TDMRTesoreria.MostrarListado(modo: integer);
var
  str, auxMascaraN : string;
begin
  auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);
  DMListados.Cargar(29, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frHYTesoreria.LoadFromFIB(REntorno.Formato, str);
     frHYTesoreria.PrepareReport;
     case modo of
        0: frHYTesoreria.ShowPreparedReport;
        1: frHYTesoreria.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxHYTesoreria.LoadFromFIB(REntorno.Formato, str);
     frxHYTesoreria.PrepareReport;
     case Modo of
        0: frxHYTesoreria.ShowPreparedReport;
        1: frxHYTesoreria.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
  MascaraN := auxMascaraN;
end;

procedure TDMRTesoreria.frHYTesoreriaGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'InicioVencimiento' then
     ParValue := StrToDate(DateToStr(Fecha_Desde));

  if ParName = 'FinalVencimiento' then
     ParValue := StrToDate(DateToStr(Fecha_Hasta));

  if ParName = 'FechaListado' then
     ParValue := StrToDate(DateToStr(FechaListado));

  if ParName = 'Comentario' then
     ParValue := Comentario;

  if ParName = 'Moneda' then
     ParValue := Moneda;
end;

procedure TDMRTesoreria.frHYTesoreriaEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMRTesoreria.Rangos(var MinFecha, MaxFecha: TDateTime);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('select min(vencimiento),max(vencimiento) ');
        SQL.Add('from EMP_CARTERA_DETALLE ');
        SQL.Add('where ');
        SQL.Add('((empresa=?empresa) and (ejercicio=?ejercicio) and (canal=?canal) and (pagado=?pagado))');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PAGADO'].AsInteger := 0;
        ExecQuery;
        MinFecha := FieldByName['MIN'].AsDateTime;
        MaxFecha := FieldByName['MAX'].AsDateTime;
        if (MinFecha < EncodeDate(2000, 01, 01)) then
           MinFecha := EncodeDate(REntorno.Ejercicio, 1, 1);
        if (MaxFecha < EncodeDate(2000, 01, 01)) then
           MaxFecha := EncodeDate(REntorno.Ejercicio, 12, 31);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMRTesoreria.frxHYTesoreriaBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
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

procedure TDMRTesoreria.frxHYTesoreriaGetValue(const VarName: string; var Value: variant);
begin
  frHYTesoreriaGetValue(VarName, Value);
end;

end.
