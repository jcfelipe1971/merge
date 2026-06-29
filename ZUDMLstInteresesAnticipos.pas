unit ZUDMLstInteresesAnticipos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, HYFIBQuery, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, ALetras, UHYReport, FR_Class, Fr_HYReport, FR_DSet,
  FR_DBSet, frxClass, frxHYReport;

type
  TZDMLstInteresesAnticipos = class(TDataModule)
     xAnticipoDesde: TFIBDataSetRO;
     TLocal: THYTransaction;
     xAnticipoHasta: TFIBDataSetRO;
     DSxAnticipoDesde: TDataSource;
     DSxAnticipoHasta: TDataSource;
     xAnticipos: TFIBDataSetRO;
     HYRSxAnticipos: THYReportSource;
     DSxAnticipos: TDataSource;
     xDetalle: TFIBDataSetRO;
     DSxDetalle: TDataSource;
     HYRxDetalle: THYReportSource;
     frDBxAnticipos: TfrDBDataSet;
     frDBDBDetalle: TfrDBDataSet;
     frLstInteresAnticipo: TfrHYReport;
     xBanco: TFIBDataSetRO;
     DSxBanco: TDataSource;
     xBancoEMPRESA: TIntegerField;
     xBancoBANCO: TIntegerField;
     xBancoTITULO: TFIBStringField;
     xBancoENTIDAD: TFIBStringField;
     xBancoSUCURSAL: TFIBStringField;
     xBancoCONTROL: TFIBStringField;
     xBancoRIESGO_CON: TFloatField;
     xBancoRIESGO_UTI: TFloatField;
     xBancoACTIVO: TIntegerField;
     xBancoRIESGO_DES: TFloatField;
     xBancoRIESGO_CFM: TFloatField;
     xBancoTERCERO: TIntegerField;
     xMonedas: TFIBDataSetRO;
     xMonedasTITULO: TFIBStringField;
     xMonedasGENERO_MASCULINO: TIntegerField;
     xMonedasDEC_VER: TIntegerField;
     DSxMonedas: TDataSource;
     xBancoCUENTA_CORRIENTE: TFIBStringField;
     xBancoBIC: TFIBStringField;
     xBancoIBAN: TFIBStringField;
     xAnticipoDesdeID: TIntegerField;
     xAnticipoHastaID: TIntegerField;
     SPDameInteresAnticipo: THYFIBQuery;
     xDetalleEMPRESA: TIntegerField;
     xDetalleEJERCICIO: TIntegerField;
     xDetalleCANAL: TIntegerField;
     xDetalleANTICIPO: TIntegerField;
     xDetalleTIPO_TERCERO: TFIBStringField;
     xDetalleCOD_CLI_PRO: TIntegerField;
     xDetalleCUENTA_CLI_PRO: TFIBStringField;
     xDetalleC_CONTRAPARTIDA: TFIBStringField;
     xDetalleCANTIDAD: TFloatField;
     xDetalleCONTABILIZAR: TIntegerField;
     xDetalleREGISTRO: TIntegerField;
     xDetalleASIENTO: TIntegerField;
     xDetalleFECHA: TDateTimeField;
     xDetalleID_CAB_Z_TALONES: TIntegerField;
     xDetalleMARCADO: TIntegerField;
     xDetallePAGADO: TIntegerField;
     xDetalleZ_TALON: TFIBStringField;
     xDetalleZ_DESCRIPCION: TFIBStringField;
     xDetalleZ_BANCO: TIntegerField;
     xDetalleC_CONTRAPARTIDA_PGC: TIntegerField;
     xDetalleCUENTA_CLI_PRO_PGC: TIntegerField;
     xDetalleZ_INTERES_ANTICIPO: TFloatField;
     xDetalleZ_FECHA_CORTE: TDateTimeField;
     xDetalleZ_IMPORTE_INTERES: TFloatField;
     xDetalleZ_MARCADO: TIntegerField;
     xDetalleZ_ID_INTERES_ANTICIPO: TIntegerField;
     xAnticiposID: TIntegerField;
     xAnticiposEMPRESA: TIntegerField;
     xAnticiposEJERCICIO: TIntegerField;
     xAnticiposCANAL: TIntegerField;
     xAnticiposCLIENTE: TIntegerField;
     xAnticiposESTADO: TIntegerField;
     xAnticiposINTERES: TFloatField;
     xAnticiposFECHA_CORTE: TDateTimeField;
     xAnticiposCONTABILIZAR: TIntegerField;
     xAnticiposREGISTRO: TIntegerField;
     xAnticiposASIENTO: TIntegerField;
     xAnticiposCUENTA: TFIBStringField;
     xAnticiposC_CONTRAPARTIDA: TFIBStringField;
     xAnticiposCUENTA_PGC: TIntegerField;
     xAnticiposC_CONTRAPARTIDA_PGC: TIntegerField;
     xAnticiposIMPORTE_INTERES: TFloatField;
     frxLstInteresAnticipo: TfrxHYReport;
     procedure ZDMLstAnticiposCreate(Sender: TObject);
     procedure frLstInteresAnticipoBeforePrint(Memo: TStringList; View: TfrView);
     procedure frLstInteresAnticipoEnterRect(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
     {function fecha: string; No se utiliza}
  public
     { Public declarations }
     procedure MostrarListado(desde, hasta: string; modo: smallint; tipo_listado: smallint);
     procedure DameAnticipo(var Desde, Hasta: string);
  end;

var
  ZDMLstInteresesAnticipos : TZDMLstInteresesAnticipos;

implementation

uses UEntorno, UUtiles, UDMMain, UDMListados, UFormGest;

{$R *.DFM}

procedure TZDMLstInteresesAnticipos.MostrarListado(desde, hasta: string; Modo: smallint; tipo_listado: smallint);
var
  str : string;
begin
  str := '';

  begin
     with xAnticipos do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['IDDESDE'].AsString := desde;
        Params.ByName['IDHASTA'].AsString := hasta;
        Open;
     end;
     with xDetalle do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ID'].AsString := xAnticiposID.AsString;
        Open;
     end;

     DMListados.Cargar(9010, '');
     if (REntorno.TipoListado = 'FRF') then
     begin
        frLstInteresAnticipo.LoadFromFIB(REntorno.Formato, str);
        frLstInteresAnticipo.PrepareReport;
        case modo of
           0: frLstInteresAnticipo.ShowPreparedReport;
           1: frLstInteresAnticipo.PrintPreparedReport('', REntorno.Copias);
        end;
     end;
     if (REntorno.TipoListado = 'FR3') then
     begin
        frxLstInteresAnticipo.LoadFromFIB(REntorno.Formato, str);
        frxLstInteresAnticipo.PrepareReport;
        case modo of
           0: frxLstInteresAnticipo.ShowPreparedReport;
           1: frxLstInteresAnticipo.PrintPreparedReport('', REntorno.Copias);
        end;
     end;
     DMListados.LimpiaEntorno;
  end;
end;

procedure TZDMLstInteresesAnticipos.DameAnticipo(var Desde, Hasta: string);
begin
  with xAnticipoDesde do
  begin
     Close;
     SelectSQL[0] := 'SELECT * FROM Z_INTERES_ANTICIPO_CAB';
  end;
  with xAnticipoHasta do
  begin
     Close;
     SelectSQL[0] := 'SELECT * FROM Z_INTERES_ANTICIPO_CAB';
  end;
  with SPDameInteresAnticipo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Desde := FieldByName['MIN'].AsString;
     Hasta := FieldByName['MAX'].AsString;
     FreeHandle;
  end;
end;

procedure TZDMLstInteresesAnticipos.ZDMLstAnticiposCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  xAnticiposIMPORTE_INTERES.DisplayFormat := MascaraN;
  xAnticipoDesde.Open;
  xAnticipoHasta.Open;
  xBanco.Open;
  xDetalle.Open;
end;

{No se utiliza
function TZDMLstInteresesAnticipos.fecha: string;
var
  ano, mes, dia : word;
  messtr : string;
begin
  DecodeDate(xAnticiposFECHA_CORTE.AsDateTime, ano, mes, dia);
  case mes of
     1: messtr := 'Enero';
     2: messtr := 'Febrero';
     3: messtr := 'Marzo';
     4: messtr := 'Abril';
     5: messtr := 'Mayo';
     6: messtr := 'Junio';
     7: messtr := 'Julio';
     8: messtr := 'Agosto';
     9: messtr := 'Septiembre';
     10: messtr := 'Octubre';
     11: messtr := 'Noviembre';
     12: messtr := 'Diciembre';
  end;
  Result := IntToStr(dia) + ' de ' + messtr + ' del ' + IntToStr(ano);
end;
}
procedure TZDMLstInteresesAnticipos.frLstInteresAnticipoBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     // if memo[0] = 'Nº' then
     //    SW := 1;
  end;
end;

procedure TZDMLstInteresesAnticipos.frLstInteresAnticipoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     // if memo[0] = 'Nº' then
     //    SW := 1;
  end;
end;

end.
