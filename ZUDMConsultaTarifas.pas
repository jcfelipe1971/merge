unit ZUDMConsultaTarifas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, HYFIBQuery;

type
  TZDMConsultaTarifas = class(TDataModule)
     TLocal: THYTransaction;
     QMPreciosTarifas: TFIBTableSet;
     QMPreciosTarifasEMPRESA: TIntegerField;
     QMPreciosTarifasMODELO: TFIBStringField;
     QMPreciosTarifasTIPO_LONA: TFIBStringField;
     QMPreciosTarifasTARIFA: TFIBStringField;
     QMPreciosTarifasARTICULO: TFIBStringField;
     QMPreciosTarifasP_COSTE: TFloatField;
     QMPreciosTarifasP_VENTA: TFloatField;
     QMPreciosTarifasMARGEN: TFloatField;
     QMPreciosTarifasLINEA: TIntegerField;
     QMPreciosTarifasSALIDA: TIntegerField;
     QMPreciosTarifasMULTIPLO: TIntegerField;
     QMPreciosTarifasTOTAL_LINEA: TIntegerField;
     QMPreciosTarifasTOTAL_SALIDA: TIntegerField;
     QMPreciosTarifasTOTAL_M2_LONA: TFloatField;
     QMPreciosTarifasID_CAB: TIntegerField;
     QMPreciosTarifasP_VENTA_MODIFICADO: TFloatField;
     QMPreciosTarifasP_COSTE_ARMAZON: TFloatField;
     QMPreciosTarifasP_COSTE_LONA: TFloatField;
     QMPreciosTarifasP_VENTA_ARMAZON: TFloatField;
     QMPreciosTarifasP_VENTA_LONA: TFloatField;
     QMPreciosTarifasARMAZON: TFIBStringField;
     QMPreciosTarifasP_COSTE_FABRICACION: TFloatField;
     QMPreciosTarifasP_VENTA_FABRICACION: TFloatField;
     QMPreciosTarifasLONA: TFIBStringField;
     QMPreciosTarifasBLOQUEO_PVENTA: TIntegerField;
     QMPreciosTarifasmargen_cent: TFloatField;
     QMPreciosTarifasCOLOR2: TIntegerField;
     QMPreciosTarifasP_VENTA_ARMAZON_MODIFICADO: TFloatField;
     QMPreciosTarifasMARGEN_ARMAZON: TFloatField;
     QMPreciosTarifasmargen_armazon_cent: TFloatField;
     DSPreciosDet: TDataSource;
     xLinea: TFIBDataSetRO;
     xSalida: TFIBDataSetRO;
     DSxLinea: TDataSource;
     DSxSalida: TDataSource;
     xModelo: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxModelo: TDataSource;
     xLineaLINEA: TIntegerField;
     xSalidaSALIDA: TIntegerField;
     xOmplir: TFIBDataSetRO;
     DSxOmplir: TDataSource;
     xOmplirP_VENTA_MODIFICADO: TFloatField;
     xOmplirP_VENTA_ARMAZON_MODIFICADO: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameTituloModelo(Modelo: string): string; //sfg.albert
     procedure FiltrarTabla(Modelo, TipoLona, Tarifa: string; Color: boolean);
     function Dame_tipo_salida_linea(Modelo: string): integer; //sfg.albert
     function Dame_Precio_Modelo(Modelo, TipoLona, Tarifa: string; Color, Linea, Salida: integer; Tipo: integer): real;
  end;

var
  ZDMConsultaTarifas : TZDMConsultaTarifas;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TZDMConsultaTarifas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AsignaDisplayFormat(QMPreciosTarifas, MascaraN, MascaraI, ShortDateFormat);

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMConsultaTarifas.FiltrarTabla(Modelo, TipoLona, Tarifa: string; Color: boolean);
begin
  with QMPreciosTarifas do
  begin
     Close;
     Params.ByName['MODELO'].AsString := Trim(Modelo);
     Params.ByName['TIPO_LONA'].AsString := TipoLona;
     Params.ByName['TARIFA'].AsString := Tarifa;
     Params.ByName['COLOR'].AsInteger := BoolToInt(Color);
     Open;
  end;
end;

function TZDMConsultaTarifas.DameTituloModelo(Modelo: string): string;
begin
  Result := '';
  if (Modelo <> '') then
  begin
     with xModelo do
     begin
        Close;
        Params.ByName['CODIGO'].AsString := Modelo;
        Open;
        Result := Fields[0].AsString;
     end;
  end;
end;

function TZDMConsultaTarifas.Dame_Precio_Modelo(Modelo, TipoLona, Tarifa: string; Color, Linea, Salida, Tipo: integer): real;
begin
  with xOmplir do
  begin
     Close;
     Params.ByName['MODELO'].AsString := Modelo;
     Params.ByName['TIPO_LONA'].AsString := TipoLona;
     Params.ByName['TARIFA'].AsString := Tarifa;
     Params.ByName['COLOR'].AsInteger := Color;
     Params.ByName['LINEA'].AsInteger := Linea;
     Params.ByName['SALIDA'].AsInteger := Salida;
     Open;
  end;

  if (Tipo = 0) then
     Result := xOmplirP_VENTA_MODIFICADO.AsFloat
  else
  if (Tipo = 1) then
     Result := xOmplirP_VENTA_ARMAZON_MODIFICADO.AsFloat
  else
     Result := 0;

  // where modelo=?modelo and tipo_lona=?tipo_lona and tarifa=?tarifa and color=?color
  // and linea=?linea and salida=?salida
end;

function TZDMConsultaTarifas.Dame_tipo_salida_linea(Modelo: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_LINEA_SALIDA FROM Z_SYS_MODELOS WHERE CODIGO = ?MODELO';
        Params.ByName['MODELO'].AsString := Modelo;
        ExecQuery;
        Result := FieldByName['TIPO_LINEA_SALIDA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
