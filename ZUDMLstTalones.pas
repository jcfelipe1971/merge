unit ZUDMLstTalones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery;

type
  TZDMLstTalones = class(TDataModule)
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
     xTerceros: TFIBDataSetRO;
     xTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     DSxTerceros: TDataSource;
     QTemp: THYFIBQuery;
     QMAsientosID: TIntegerField;
     QMAsientosVENCIMIENTO: TDateTimeField;
     QMAsientosCOMENTARIO: TFIBStringField;
     QMAsientosLIQUIDO_ENTRADA: TFloatField;
     QMAsientosLIQUIDO_SALIDA: TFloatField;
     QMAsientosACUMULADO: TFloatField;
     QMAsientosSUMA_ENTRADA: TFloatField;
     QMAsientosSUMA_SALIDA: TFloatField;
     QMAsientosTOTAL_ENTRADA: TFloatField;
     QMAsientosTOTAL_SALIDA: TFloatField;
     QMAsientosLIQUIDO_ANTICIPO: TFloatField;
     QMAsientosENTRADA: TIntegerField;
     QMAsientosTOTAL_ANTICIPO: TFloatField;
     QMAsientosSUMA_ACUMULADO: TFloatField;
     procedure DMRTesoreriaCreate(Sender: TObject);
     procedure frHYTesoreriaGetValue(const ParName: string; var ParValue: variant);
     procedure frHYTesoreriaEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRTesoreriaDestroy(Sender: TObject);
     procedure xTercerosBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(modo: integer);
     procedure CalculaInforme(comp, comc: string; com_numdoc, com_titcue: boolean);
     procedure Rangos;
  end;

var
  ZDMLstTalones : TZDMLstTalones;
  Fecha_Desde, Fecha_Hasta : TDate;

implementation

uses UDMMain, UEntorno, ZUFMLstTalones, UFormGest, UDMListados;

{$R *.DFM}

procedure TZDMLstTalones.DMRTesoreriaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  xMonedas.Open;
end;

procedure TZDMLstTalones.DMRTesoreriaDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLstTalones.CalculaInforme(comp, comc: string; com_numdoc, com_titcue: boolean);
var
  fecha_desde, fecha_hasta : TDateTime;
  c_numdoc, c_titcue : smallint;
begin
  fecha_desde := Int(ZFMLstTalones.DTPDesde.Date);
  fecha_hasta := ZFMLstTalones.DTPHasta.Date;
  DMListados.Normalizar_Desde_Hasta(fecha_desde, fecha_hasta);

  if (com_numdoc) then
     c_numdoc := 1
  else
     c_numdoc := 0;
  if (com_titcue) then
     c_titcue := 1
  else
     c_titcue := 0;

  // cargar tabla temporal
  with QTemp do
  begin
     Close;
     QTemp.SQL.Text := 'execute procedure  z_c_crea_listado_tesoreria' +
        '(?empresa,?ejercicio,?canal,?desde,?hasta,?moneda,?fecha,' +
        '?comp, ?comc, ?com_numdoc, ?com_titcue,?TERCERO,?entrada)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := fecha_desde;
     Params.ByName['HASTA'].AsDateTime := fecha_hasta;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     Params.ByName['FECHA'].AsDateTime := ZFMLstTalones.DTPFechaListado.Date;
     Params.ByName['COMP'].AsString := comp;     // Comentario en caso de Pago
     Params.ByName['COMC'].AsString := comc;     // Comentario en caso de Cobro
     Params.ByName['COM_NUMDOC'].AsInteger := c_numdoc;
     Params.ByName['TERCERO'].AsString := ZFMLstTalones.LFTercero.Text;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     // Concatena el número de documento origen
     Params.ByName['COM_TITCUE'].AsInteger := c_titcue;
     ExecQuery;
     // Concatena el título de la cuenta asociada
  end;

  with QMAsientos do
  begin
     Close;
     { Params.ByName['EMPRESA'].AsInteger    := REntorno.Empresa;
    Params.ByName['EJERCICIO'].AsInteger  := REntorno.Ejercicio;
    Params.ByName['CANAL'].AsInteger      := REntorno.Canal;
    Params.ByName['DESDE'].AsDateTime     := fecha_desde;
    Params.ByName['HASTA'].AsDateTime     := fecha_hasta;
    Params.ByName['MONEDA'].AsString      := xMonedas.FieldByName('MONEDA').AsString;
    Params.ByName['FECHA'].AsDateTime     := ZFMLstTalones.DTPFechaListado.Date;
    Params.ByName['COMP'].AsString        := Comp;     // Comentario en caso de Pago
    Params.ByName['COMC'].AsString        := comc;     // Comentario en caso de Cobro
    Params.ByName['COM_NUMDOC'].AsInteger := c_numdoc;
    Params.ByName['TERCERO'].AsString     := ZFMLstTalones.LFTercero.Text; }
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TZDMLstTalones.MostrarListado(modo: integer);
var
  str, auxMascaraN : string;
begin
  auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);
  DMListados.Cargar(3000, '');
  frHYTesoreria.LoadFromFIB(REntorno.Formato, str);
  frHYTesoreria.PrepareReport;
  case modo of
     0: frHYTesoreria.ShowPreparedReport;
     1: frHYTesoreria.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;

  //Borrar tabla temporal
  with QTemp do
  begin
     Close;
     SQL.Text := 'DELETE FROM  tmp_lst_tsoreria where entrada=?entrada';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
  end;

  MascaraN := auxMascaraN;
end;

procedure TZDMLstTalones.frHYTesoreriaGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'InicioVencimiento' then
     ParValue := StrToDate(DateToStr(ZFMLstTalones.DTPDesde.Date));

  if ParName = 'FinalVencimiento' then
     ParValue := StrToDate(DateToStr(ZFMLstTalones.DTPHasta.Date));

  if ParName = 'FechaListado' then
     ParValue := StrToDate(DateToStr(ZFMLstTalones.DTPFechaListado.Date));

  if ParName = 'Comentario' then
     ParValue := ZFMLstTalones.EComentario.Text;

  if ParName = 'Moneda' then
     ParValue := ZFMLstTalones.DBLCBMoneda.Text;
end;

procedure TZDMLstTalones.frHYTesoreriaEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TZDMLstTalones.Rangos;
begin
  with QMinFecha do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PAGADO'].AsInteger := 0;
     ExecQuery;
     Fecha_Desde := FieldByName['MINIMO'].AsDateTime;
     if Fecha_Desde = 0 then
        Fecha_Desde := Date;
     FreeHandle;
  end;

  with QMaxFecha do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PAGADO'].AsInteger := 0;
     ExecQuery;
     Fecha_Hasta := FieldByName['MAXIMO'].AsDateTime;
     if Fecha_Hasta = 0 then
        Fecha_Hasta := Date;
     FreeHandle;
  end;
end;

procedure TZDMLstTalones.xTercerosBeforeOpen(DataSet: TDataSet);
begin
  xTerceros.Params.ByName['TERCERO'].AsInteger := StrToInt(ZFMLstTalones.LFTercero.Text);
end;

end.
