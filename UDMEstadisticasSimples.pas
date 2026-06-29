unit UDMEstadisticasSimples;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMEstadisticasSimples = class(TDataModule)
     xEstadisticaClientes: TFIBTableSet;
     DSxEstadisticaClientes: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSxEstadisticaArticulos: TDataSource;
     xEstadisticaArticulos: TFIBTableSet;
     DSxEstadisticaFamilias: TDataSource;
     xEstadisticaFamilias: TFIBTableSet;
     xEstadisticaClientesCLIENTE: TIntegerField;
     xEstadisticaFamiliasFAMILIA: TFIBStringField;
     xEstadisticaFamiliasTITULO: TFIBStringField;
     xEstadisticaClientesFamilia: TFIBTableSet;
     DSxEstadisticaClientesFamilia: TDataSource;
     xEstadisticaClientesFamiliaCLIENTE: TIntegerField;
     xEstadisticaClientesFamiliaFAMILIA: TFIBStringField;
     xEstadisticaClientesArticulo: TFIBTableSet;
     DSxEstadisticaClientesArticulo: TDataSource;
     xEstadisticaClientesArticuloCLIENTE: TIntegerField;
     xEstadisticaClientesArticuloNOMBRE_R_SOCIAL: TFIBStringField;
     xEstadisticaClientesArticuloARTICULO: TFIBStringField;
     xEstadisticaClientesArticuloNOMBRE_COMERCIAL: TFIBStringField;
     xEstadisticaClientesNOMBRE_R_SOCIAL: TFIBStringField;
     xEstadisticaClientesNOMBRE_COMERCIAL: TFIBStringField;
     xEstadisticaClientesFamiliaNOMBRE_R_SOCIAL: TFIBStringField;
     xEstadisticaClientesFamiliaNOMBRE_COMERCIAL: TFIBStringField;
     xEstadisticaArticulosARTICULO: TFIBStringField;
     xEstadisticaArticulosTITULO_LARGO: TFIBStringField;
     xEstadisticaArticulosB_DTO_LINEA: TFloatField;
     xEstadisticaArticulosUNIDADES: TFloatField;
     xEstadisticaClientesB_DTO_LINEA: TFloatField;
     xEstadisticaClientesUNIDADES: TFloatField;
     xEstadisticaFamiliasB_DTO_LINEA: TFloatField;
     xEstadisticaFamiliasUNIDADES: TFloatField;
     xEstadisticaClientesFamiliaTITULO: TFIBStringField;
     xEstadisticaClientesFamiliaB_DTO_LINEA: TFloatField;
     xEstadisticaClientesFamiliaUNIDADES: TFloatField;
     xEstadisticaClientesArticuloTITULO_LARGO: TFIBStringField;
     xEstadisticaClientesArticuloB_DTO_LINEA: TFloatField;
     xEstadisticaClientesArticuloUNIDADES: TFloatField;
     xEstadisticaClientesEMAIL: TFIBStringField;
     xEstadisticaClientesFamiliaEMAIL: TFIBStringField;
     xEstadisticaClientesArticuloEMAIL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RefrescaEstadisticaFamilias(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
     procedure RefrescaEstadisticaArticulos(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
     procedure RefrescaEstadisticaClientes(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
     procedure RefrescaEstadisticaClientesArticulo(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
     procedure RefrescaEstadisticaClientesFamilia(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
  end;

var
  DMEstadisticasSimples : TDMEstadisticasSimples;

implementation

uses
  UDMMain, Variants, UUtiles, UEntorno, StrUtils, UParam, DateUtils;

{$R *.dfm}

procedure TDMEstadisticasSimples.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  // Máscaras de visualización a los campos numéricos
  AsignaDisplayFormat(xEstadisticaFamilias, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaFamiliasUNIDADES.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xEstadisticaArticulos, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaArticulosUNIDADES.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xEstadisticaClientes, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaClientesUNIDADES.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xEstadisticaClientesFamilia, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaClientesFamiliaUNIDADES.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xEstadisticaClientesArticulo, MascaraN, MascaraI, ShortDateFormat);
  xEstadisticaClientesArticuloUNIDADES.DisplayFormat := MascaraI;
end;

procedure TDMEstadisticasSimples.RefrescaEstadisticaArticulos(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');
  if (DesdeCliente = 0) then
     DesdeCliente := -9999999;
  if (HastaCliente = 0) then
     HastaCliente := 9999999;
  if (DesdeArticulo = '') then
     DesdeArticulo := '.';
  if (HastaArticulo = '') then
     HastaArticulo := '¿?';
  if (DesdeFamilia = '') then
     DesdeFamilia := '.';
  if (HastaFamilia = '') then
     HastaFamilia := '¿?';

  with xEstadisticaArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     Params.ByName['DESDE_ARTICULO'].AsString := DesdeArticulo;
     Params.ByName['HASTA_ARTICULO'].AsString := HastaArticulo;
     Params.ByName['DESDE_FAMILIA'].AsString := DesdeFamilia;
     Params.ByName['HASTA_FAMILIA'].AsString := HastaFamilia;
     Params.ByName['SERIE1'].AsString := Serie1;
     Params.ByName['SERIE2'].AsString := Serie2;
     case TipoDoc of
        0: Params.ByName['TIPO'].AsString := 'OFC';
        1: Params.ByName['TIPO'].AsString := 'PEC';
        2: Params.ByName['TIPO'].AsString := 'ALB';
        3: Params.ByName['TIPO'].AsString := 'FAC';
     end;
     Open;
  end;
end;

procedure TDMEstadisticasSimples.RefrescaEstadisticaClientes(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');
  if (DesdeCliente = 0) then
     DesdeCliente := -9999999;
  if (HastaCliente = 0) then
     HastaCliente := 9999999;
  if (DesdeArticulo = '') then
     DesdeArticulo := '.';
  if (HastaArticulo = '') then
     HastaArticulo := '¿?';
  if (DesdeFamilia = '') then
     DesdeFamilia := '.';
  if (HastaFamilia = '') then
     HastaFamilia := '¿?';

  with xEstadisticaClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     Params.ByName['DESDE_ARTICULO'].AsString := DesdeArticulo;
     Params.ByName['HASTA_ARTICULO'].AsString := HastaArticulo;
     Params.ByName['DESDE_FAMILIA'].AsString := DesdeFamilia;
     Params.ByName['HASTA_FAMILIA'].AsString := HastaFamilia;
     Params.ByName['SERIE1'].AsString := Serie1;
     Params.ByName['SERIE2'].AsString := Serie2;
     case TipoDoc of
        0: Params.ByName['TIPO'].AsString := 'OFC';
        1: Params.ByName['TIPO'].AsString := 'PEC';
        2: Params.ByName['TIPO'].AsString := 'ALB';
        3: Params.ByName['TIPO'].AsString := 'FAC';
     end;
     Open;
  end;
end;

procedure TDMEstadisticasSimples.RefrescaEstadisticaClientesFamilia(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');
  if (DesdeCliente = 0) then
     DesdeCliente := -9999999;
  if (HastaCliente = 0) then
     HastaCliente := 9999999;
  if (DesdeArticulo = '') then
     DesdeArticulo := '.';
  if (HastaArticulo = '') then
     HastaArticulo := '¿?';
  if (DesdeFamilia = '') then
     DesdeFamilia := '.';
  if (HastaFamilia = '') then
     HastaFamilia := '¿?';

  with xEstadisticaClientesFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     Params.ByName['DESDE_ARTICULO'].AsString := DesdeArticulo;
     Params.ByName['HASTA_ARTICULO'].AsString := HastaArticulo;
     Params.ByName['DESDE_FAMILIA'].AsString := DesdeFamilia;
     Params.ByName['HASTA_FAMILIA'].AsString := HastaFamilia;
     Params.ByName['SERIE1'].AsString := Serie1;
     Params.ByName['SERIE2'].AsString := Serie2;
     case TipoDoc of
        0: Params.ByName['TIPO'].AsString := 'OFC';
        1: Params.ByName['TIPO'].AsString := 'PEC';
        2: Params.ByName['TIPO'].AsString := 'ALB';
        3: Params.ByName['TIPO'].AsString := 'FAC';
     end;
     Open;
  end;
end;

procedure TDMEstadisticasSimples.RefrescaEstadisticaClientesArticulo(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');
  if (DesdeCliente = 0) then
     DesdeCliente := -9999999;
  if (HastaCliente = 0) then
     HastaCliente := 9999999;
  if (DesdeArticulo = '') then
     DesdeArticulo := '.';
  if (HastaArticulo = '') then
     HastaArticulo := '¿?';
  if (DesdeFamilia = '') then
     DesdeFamilia := '.';
  if (HastaFamilia = '') then
     HastaFamilia := '¿?';

  with xEstadisticaClientesArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     Params.ByName['DESDE_ARTICULO'].AsString := DesdeArticulo;
     Params.ByName['HASTA_ARTICULO'].AsString := HastaArticulo;
     Params.ByName['DESDE_FAMILIA'].AsString := DesdeFamilia;
     Params.ByName['HASTA_FAMILIA'].AsString := HastaFamilia;
     Params.ByName['SERIE1'].AsString := Serie1;
     Params.ByName['SERIE2'].AsString := Serie2;
     case TipoDoc of
        0: Params.ByName['TIPO'].AsString := 'OFC';
        1: Params.ByName['TIPO'].AsString := 'PEC';
        2: Params.ByName['TIPO'].AsString := 'ALB';
        3: Params.ByName['TIPO'].AsString := 'FAC';
     end;
     Open;
  end;
end;

procedure TDMEstadisticasSimples.RefrescaEstadisticaFamilias(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente: integer; DesdeArticulo, HastaArticulo, DesdeFamilia, HastaFamilia, Serie1, Serie2: string; TipoDoc: integer);
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');
  if (DesdeCliente = 0) then
     DesdeCliente := -9999999;
  if (HastaCliente = 0) then
     HastaCliente := 9999999;
  if (DesdeArticulo = '') then
     DesdeArticulo := '.';
  if (HastaArticulo = '') then
     HastaArticulo := '¿?';
  if (DesdeFamilia = '') then
     DesdeFamilia := '.';
  if (HastaFamilia = '') then
     HastaFamilia := '¿?';

  with xEstadisticaFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     Params.ByName['DESDE_ARTICULO'].AsString := DesdeArticulo;
     Params.ByName['HASTA_ARTICULO'].AsString := HastaArticulo;
     Params.ByName['DESDE_FAMILIA'].AsString := DesdeFamilia;
     Params.ByName['HASTA_FAMILIA'].AsString := HastaFamilia;
     Params.ByName['SERIE1'].AsString := Serie1;
     Params.ByName['SERIE2'].AsString := Serie2;
     case TipoDoc of
        0: Params.ByName['TIPO'].AsString := 'OFC';
        1: Params.ByName['TIPO'].AsString := 'PEC';
        2: Params.ByName['TIPO'].AsString := 'ALB';
        3: Params.ByName['TIPO'].AsString := 'FAC';
     end;
     Open;
  end;
end;

end.
