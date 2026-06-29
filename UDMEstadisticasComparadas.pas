unit UDMEstadisticasComparadas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMEstadisticasComparadas = class(TDataModule)
     xEstadisticaClientes: TFIBTableSet;
     DSxEstadisticaClientes: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSxEstadisticaArticulos: TDataSource;
     xEstadisticaArticulos: TFIBTableSet;
     DSxEstadisticaFamilias: TDataSource;
     xEstadisticaFamilias: TFIBTableSet;
     xEstadisticaClientesCLIENTE: TIntegerField;
     xEstadisticaClientesPERIODO: TFloatField;
     xEstadisticaClientesTOTAL: TFloatField;
     xEstadisticaClientesINCREMENTO: TFloatField;
     xEstadisticaClientesPERIODO_ANTERIOR: TFloatField;
     xEstadisticaClientesTOTAL_ANTERIOR: TFloatField;
     xEstadisticaFamiliasFAMILIA: TFIBStringField;
     xEstadisticaFamiliasTITULO: TFIBStringField;
     xEstadisticaFamiliasPERIODO: TFloatField;
     xEstadisticaFamiliasTOTAL: TFloatField;
     xEstadisticaFamiliasINCREMENTO: TFloatField;
     xEstadisticaFamiliasPERIODO_ANTERIOR: TFloatField;
     xEstadisticaFamiliasTOTAL_ANTERIOR: TFloatField;
     xEstadisticaFamiliasUNID_PERIODO: TFloatField;
     xEstadisticaFamiliasUNID_TOTAL: TFloatField;
     xEstadisticaFamiliasUNID_INCREMENTO: TFloatField;
     xEstadisticaFamiliasUNID_PERIODO_ANTERIOR: TFloatField;
     xEstadisticaFamiliasUNID_TOTAL_ANTERIOR: TFloatField;
     xEstadisticaArticulosARTICULO: TFIBStringField;
     xEstadisticaArticulosTITULO: TFIBStringField;
     xEstadisticaArticulosPERIODO: TFloatField;
     xEstadisticaArticulosTOTAL: TFloatField;
     xEstadisticaArticulosINCREMENTO: TFloatField;
     xEstadisticaArticulosPERIODO_ANTERIOR: TFloatField;
     xEstadisticaArticulosTOTAL_ANTERIOR: TFloatField;
     xEstadisticaArticulosUNID_PERIODO: TFloatField;
     xEstadisticaArticulosUNID_TOTAL: TFloatField;
     xEstadisticaArticulosUNID_INCREMENTO: TFloatField;
     xEstadisticaArticulosUNID_PERIODO_ANTERIOR: TFloatField;
     xEstadisticaArticulosUNID_TOTAL_ANTERIOR: TFloatField;
     xEstadisticaArticulosINCREMENTO_TOTAL: TFloatField;
     xEstadisticaArticulosUNID_INCREMENTO_TOTAL: TFloatField;
     xEstadisticaFamiliasINCREMENTO_TOTAL: TFloatField;
     xEstadisticaFamiliasUNID_INCREMENTO_TOTAL: TFloatField;
     xEstadisticaClientesINCREMENTO_TOTAL: TFloatField;
     xEstadisticaClientesFamilia: TFIBTableSet;
     DSxEstadisticaClientesFamilia: TDataSource;
     xEstadisticaClientesFamiliaCLIENTE: TIntegerField;
     xEstadisticaClientesFamiliaFAMILIA: TFIBStringField;
     xEstadisticaClientesFamiliaTITULO_FAMILIA: TFIBStringField;
     xEstadisticaClientesFamiliaPERIODO: TFloatField;
     xEstadisticaClientesFamiliaTOTAL: TFloatField;
     xEstadisticaClientesFamiliaINCREMENTO: TFloatField;
     xEstadisticaClientesFamiliaINCREMENTO_TOTAL: TFloatField;
     xEstadisticaClientesFamiliaPERIODO_ANTERIOR: TFloatField;
     xEstadisticaClientesFamiliaTOTAL_ANTERIOR: TFloatField;
     xEstadisticaClientesFamiliaUNID_PERIODO: TFloatField;
     xEstadisticaClientesFamiliaUNID_TOTAL: TFloatField;
     xEstadisticaClientesFamiliaUNID_INCREMENTO: TFloatField;
     xEstadisticaClientesFamiliaUNID_INCREMENTO_TOTAL: TFloatField;
     xEstadisticaClientesFamiliaUNID_PERIODO_ANTERIOR: TFloatField;
     xEstadisticaClientesFamiliaUNID_TOTAL_ANTERIOR: TFloatField;
     xEstadisticaClientesArticulo: TFIBTableSet;
     DSxEstadisticaClientesArticulo: TDataSource;
     xEstadisticaClientesArticuloCLIENTE: TIntegerField;
     xEstadisticaClientesArticuloNOMBRE_R_SOCIAL: TFIBStringField;
     xEstadisticaClientesArticuloPERIODO: TFloatField;
     xEstadisticaClientesArticuloTOTAL: TFloatField;
     xEstadisticaClientesArticuloINCREMENTO: TFloatField;
     xEstadisticaClientesArticuloINCREMENTO_TOTAL: TFloatField;
     xEstadisticaClientesArticuloPERIODO_ANTERIOR: TFloatField;
     xEstadisticaClientesArticuloTOTAL_ANTERIOR: TFloatField;
     xEstadisticaClientesArticuloUNID_PERIODO: TFloatField;
     xEstadisticaClientesArticuloUNID_TOTAL: TFloatField;
     xEstadisticaClientesArticuloUNID_INCREMENTO: TFloatField;
     xEstadisticaClientesArticuloUNID_INCREMENTO_TOTAL: TFloatField;
     xEstadisticaClientesArticuloUNID_PERIODO_ANTERIOR: TFloatField;
     xEstadisticaClientesArticuloUNID_TOTAL_ANTERIOR: TFloatField;
     xEstadisticaClientesArticuloARTICULO: TFIBStringField;
     xEstadisticaClientesArticuloTITULO: TFIBStringField;
     xEstadisticaClientesArticuloNOMBRE_COMERCIAL: TFIBStringField;
     xEstadisticaClientesNOMBRE_R_SOCIAL: TFIBStringField;
     xEstadisticaClientesNOMBRE_COMERCIAL: TFIBStringField;
     xEstadisticaClientesFamiliaNOMBRE_R_SOCIAL: TFIBStringField;
     xEstadisticaClientesFamiliaNOMBRE_COMERCIAL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RefrescaEstadisticaFamilias(Desde, Hasta: TDateTime);
     procedure RefrescaEstadisticaArticulos(Desde, Hasta: TDateTime);
     procedure RefrescaEstadisticaClientes(Desde, Hasta: TDateTime);
     procedure RefrescaEstadisticaClientesArticulo(Desde, Hasta: TDateTime);
     procedure RefrescaEstadisticaClientesFamilia(Desde, Hasta: TDateTime);
  end;

var
  DMEstadisticasComparadas : TDMEstadisticasComparadas;

implementation

uses
  UDMMain, Variants, UUtiles, UEntorno, StrUtils, UParam, DateUtils;

{$R *.dfm}

procedure TDMEstadisticasComparadas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  // Máscaras de visualización a los campos numéricos
  AsignaDisplayFormat(xEstadisticaFamilias, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaFamiliasUNID_PERIODO.DisplayFormat := MascaraI;
  xEstadisticaFamiliasUNID_TOTAL.DisplayFormat := MascaraI;
  xEstadisticaFamiliasUNID_PERIODO_ANTERIOR.DisplayFormat := MascaraI;
  xEstadisticaFamiliasUNID_TOTAL_ANTERIOR.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xEstadisticaArticulos, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaArticulosUNID_PERIODO.DisplayFormat := MascaraI;
  xEstadisticaArticulosUNID_TOTAL.DisplayFormat := MascaraI;
  xEstadisticaArticulosUNID_PERIODO_ANTERIOR.DisplayFormat := MascaraI;
  xEstadisticaArticulosUNID_TOTAL_ANTERIOR.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xEstadisticaClientes, MascaraN, MascaraI, ShortDateFormat);

  AsignaDisplayFormat(xEstadisticaClientesFamilia, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaClientesFamiliaUNID_PERIODO.DisplayFormat := MascaraI;
  xEstadisticaClientesFamiliaUNID_TOTAL.DisplayFormat := MascaraI;
  xEstadisticaClientesFamiliaUNID_PERIODO_ANTERIOR.DisplayFormat := MascaraI;
  xEstadisticaClientesFamiliaUNID_TOTAL_ANTERIOR.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xEstadisticaClientesArticulo, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaClientesArticuloUNID_PERIODO.DisplayFormat := MascaraI;
  xEstadisticaClientesArticuloUNID_TOTAL.DisplayFormat := MascaraI;
  xEstadisticaClientesArticuloUNID_PERIODO_ANTERIOR.DisplayFormat := MascaraI;
  xEstadisticaClientesArticuloUNID_TOTAL_ANTERIOR.DisplayFormat := MascaraI;
end;

procedure TDMEstadisticasComparadas.RefrescaEstadisticaArticulos(Desde, Hasta: TDateTime);
begin
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  with xEstadisticaArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Open;
  end;
end;

procedure TDMEstadisticasComparadas.RefrescaEstadisticaClientes(Desde, Hasta: TDateTime);
begin
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  with xEstadisticaClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Open;
  end;
end;

procedure TDMEstadisticasComparadas.RefrescaEstadisticaClientesFamilia(Desde, Hasta: TDateTime);
begin
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  with xEstadisticaClientesFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Open;
  end;
end;

procedure TDMEstadisticasComparadas.RefrescaEstadisticaClientesArticulo(Desde, Hasta: TDateTime);
begin
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  with xEstadisticaClientesArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Open;
  end;
end;

procedure TDMEstadisticasComparadas.RefrescaEstadisticaFamilias(Desde, Hasta: TDateTime);
begin
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  with xEstadisticaFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Open;
  end;
end;

end.
