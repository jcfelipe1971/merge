unit UDMCierraDocCompras;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, SysUtils;

type
  TDMCierraDocCompras = class(TDataModule)
     QMCabecerasPro: TFIBTableSet;
     DSQMCabecerasPro: TDataSource;
     DSxSeries: TDataSource;
     xSeries: TFIBDataSetRO;
     TLocal: THYTransaction;
     QMCabecerasProEMPRESA: TIntegerField;
     QMCabecerasProEJERCICIO: TIntegerField;
     QMCabecerasProCANAL: TIntegerField;
     QMCabecerasProSERIE: TFIBStringField;
     QMCabecerasProTIPO: TFIBStringField;
     QMCabecerasProRIG: TIntegerField;
     QMCabecerasProALMACEN: TFIBStringField;
     QMCabecerasProMONEDA: TFIBStringField;
     QMCabecerasProFECHA: TDateTimeField;
     QMCabecerasProPROVEEDOR: TIntegerField;
     QMCabecerasProTERCERO: TIntegerField;
     QMCabecerasProTITULO: TFIBStringField;
     QMCabecerasProNOTAS: TBlobField;
     QMCabecerasProESTADO: TIntegerField;
     QMCabecerasProBULTOS: TIntegerField;
     QMCabecerasProLINEAS: TIntegerField;
     QMCabecerasProBRUTO: TFloatField;
     QMCabecerasProI_DTO_LINEAS: TFloatField;
     QMCabecerasProS_BASES: TFloatField;
     QMCabecerasProS_CUOTA_IVA: TFloatField;
     QMCabecerasProS_CUOTA_RE: TFloatField;
     QMCabecerasProB_DTO_LINEAS: TFloatField;
     QMCabecerasProDTO_PP: TFloatField;
     QMCabecerasProDTO_CIAL: TFloatField;
     QMCabecerasProI_DTO_CIAL: TFloatField;
     QMCabecerasProI_DTO_PP: TFloatField;
     QMCabecerasProLIQUIDO: TFloatField;
     QMCabecerasProENTRADA: TIntegerField;
     QMCabecerasProP_IRPF: TFloatField;
     QMCabecerasProI_IRPF: TFloatField;
     QMCabecerasProA_IRPF: TIntegerField;
     QMCabecerasProTOTAL_FACTURA: TFloatField;
     QMCabecerasProNUM_FACTURA: TFIBStringField;
     QMCabecerasProFORMA_DE_PAGO: TFIBStringField;
     QMCabecerasProTIPO_IRPF: TIntegerField;
     QMCabecerasProBASE_IRPF: TFloatField;
     QMCabecerasProDEVOLUCION: TIntegerField;
     QMCabecerasProSIN_DETALLE: TIntegerField;
     QMCabecerasProASIENTO: TIntegerField;
     QMCabecerasProNOMBRE_COMERCIAL: TFIBStringField;
     QMCabecerasProREGISTRO: TIntegerField;
     QMCabecerasProPOR_FINANCIACION: TFloatField;
     QMCabecerasProI_FINANCIACION: TFloatField;
     QMCabecerasProFECHA_CON: TDateTimeField;
     QMCabecerasProSIN_RECIBOS: TIntegerField;
     QMCabecerasAcre: TFIBTableSet;
     DSQMCabecerasAcre: TDataSource;
     QMCabecerasAcreEMPRESA: TIntegerField;
     QMCabecerasAcreEJERCICIO: TIntegerField;
     QMCabecerasAcreCANAL: TIntegerField;
     QMCabecerasAcreSERIE: TFIBStringField;
     QMCabecerasAcreTIPO: TFIBStringField;
     QMCabecerasAcreRIG: TIntegerField;
     QMCabecerasAcreALMACEN: TFIBStringField;
     QMCabecerasAcreMONEDA: TFIBStringField;
     QMCabecerasAcreFECHA: TDateTimeField;
     QMCabecerasAcreACREEDOR: TIntegerField;
     QMCabecerasAcreTERCERO: TIntegerField;
     QMCabecerasAcreTITULO: TFIBStringField;
     QMCabecerasAcreNOTAS: TBlobField;
     QMCabecerasAcreESTADO: TIntegerField;
     QMCabecerasAcreBULTOS: TIntegerField;
     QMCabecerasAcreLINEAS: TIntegerField;
     QMCabecerasAcreBRUTO: TFloatField;
     QMCabecerasAcreI_DTO_LINEAS: TFloatField;
     QMCabecerasAcreS_BASES: TFloatField;
     QMCabecerasAcreS_CUOTA_IVA: TFloatField;
     QMCabecerasAcreS_CUOTA_RE: TFloatField;
     QMCabecerasAcreB_DTO_LINEAS: TFloatField;
     QMCabecerasAcreDTO_PP: TFloatField;
     QMCabecerasAcreDTO_CIAL: TFloatField;
     QMCabecerasAcreI_DTO_CIAL: TFloatField;
     QMCabecerasAcreI_DTO_PP: TFloatField;
     QMCabecerasAcreLIQUIDO: TFloatField;
     QMCabecerasAcreENTRADA: TIntegerField;
     QMCabecerasAcreP_IRPF: TFloatField;
     QMCabecerasAcreI_IRPF: TFloatField;
     QMCabecerasAcreA_IRPF: TIntegerField;
     QMCabecerasAcreTOTAL_FACTURA: TFloatField;
     QMCabecerasAcreNUM_FACTURA: TFIBStringField;
     QMCabecerasAcreFORMA_DE_PAGO: TFIBStringField;
     QMCabecerasAcreTIPO_IRPF: TIntegerField;
     QMCabecerasAcreDEVOLUCION: TIntegerField;
     QMCabecerasAcreASIENTO: TIntegerField;
     QMCabecerasAcreNOMBRE_COMERCIAL: TFIBStringField;
     QMCabecerasAcreREGISTRO: TIntegerField;
     QMCabecerasAcrePOR_FINANCIACION: TFloatField;
     QMCabecerasAcreI_FINANCIACION: TFloatField;
     QMCabecerasAcreFECHA_CON: TDateTimeField;
     QMCabecerasAcreSIN_RECIBOS: TIntegerField;
     TUpdate: THYTransaction;
     QMCabecerasProID_E: TIntegerField;
     QMCabecerasAcreID_E: TIntegerField;
     QMCabecerasAcreSU_REFERENCIA: TFIBStringField;
     QMCabecerasProSU_REFERENCIA: TFIBStringField;
     procedure QMCabecerasProNewRecord(DataSet: TDataSet);
     procedure xSeriesAfterOpen(DataSet: TDataSet);
     procedure DMCierraDocumentoCreate(Sender: TObject);
  private
     { Private declarations }
     Tipo: boolean;
     procedure RefrescaTablas(Tipo: boolean);
  public
     { Public declarations }
     procedure Muestra;
     procedure MarcarTodo(Entrada: integer; Tipo: boolean);
     procedure CierraFacturas(Tipo: boolean);
     procedure MuestraErrores;
     function HayErrores: boolean;
     procedure SeleccionaTipo(aTipo: boolean);
  end;

var
  DMCierraDocCompras : TDMCierraDocCompras;

implementation

uses UDMMain, UEntorno, UUtiles, UFMControlErroresFactura;

{$R *.DFM}

procedure TDMCierraDocCompras.DMCierraDocumentoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Tipo := True;
  DMMain.FiltraRO(xSeries, '11100', True);
end;

procedure TDMCierraDocCompras.QMCabecerasProNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMCierraDocCompras.Muestra;
begin
  if (Tipo) then
  begin
     with QMCabecerasPro do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := xSeries.FieldByName('SERIE').AsString;
        Params.ByName['ESTADO'].AsInteger := 0;
        Open;
     end;
  end
  else
  begin
     with QMCabecerasAcre do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := xSeries.FieldByName('SERIE').AsString;
        Params.ByName['ESTADO'].AsInteger := 0;
        Open;
     end;
  end;
end;

procedure TDMCierraDocCompras.MarcarTodo(Entrada: integer; Tipo: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        if Tipo then
           SQL.Add('EXECUTE PROCEDURE G_MARCA_S_TODO_COMPRAS (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA) ')
        else
           SQL.Add('EXECUTE PROCEDURE G_MARCA_S_TODO_ACRE(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA)');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := xSeries.FieldByName('SERIE').AsString;
        Params.ByName['ENTRADA'].AsInteger := Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  RefrescaTablas(Tipo);
end;

procedure TDMCierraDocCompras.CierraFacturas(Tipo: boolean);
var
  Q : THYFIBQuery;
begin
  if Confirma then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        if Tipo then
           SQL.Add('EXECUTE PROCEDURE G_CIERRE_MASIVO_FAC_COM(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA)')
        else
           SQL.Add('EXECUTE PROCEDURE G_CIERRE_MASIVO_FAC_ACR(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA)');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := xSeries.FieldByName('SERIE').AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);

     if HayErrores then
        MuestraErrores;

     RefrescaTablas(Tipo);
  end;
end;

procedure TDMCierraDocCompras.xSeriesAfterOpen(DataSet: TDataSet);
begin
  Muestra;
end;

function TDMCierraDocCompras.HayErrores: boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT COUNT(*) FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = :ENTRADA');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger <> 0);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMCierraDocCompras.MuestraErrores;
begin
  FMControlErroresFactura := TFMControlErroresFactura.Create(Self);
  FMControlErroresFactura.ShowModal;
  FMControlErroresFactura.Free;
end;

procedure TDMCierraDocCompras.RefrescaTablas(Tipo: boolean);
var
  TS : TFIBTableSet;
begin
  if Tipo then
     TS := QMCabecerasPro
  else
     TS := QMCabecerasAcre;

  with TS do
  begin
     try
        DisableControls;
        Close;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMCierraDocCompras.SeleccionaTipo(aTipo: boolean);
begin
  if (Tipo <> aTipo) then
  begin
     Tipo := aTipo;
     Muestra;
  end;
end;

end.
