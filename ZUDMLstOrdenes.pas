unit ZUDMLstOrdenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, DBTables, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBDataSetRO,
  FIBDatabase, UFIBModificados, Classes, FR_Class, Fr_HYReport, Controls;

type
  TZDMLstOrdenes = class(TDataModule)
     frLstOrders: TfrHYReport;
     TLocal: THYTransaction;
     dsxUntilOrder: TDataSource;
     dsxFromOrder: TDataSource;
     xFromOrder: TFIBDataSetRO;
     xUntilOrder: TFIBDataSetRO;
     qDetails: TFIBDataSetRO;
     dsDetails: TDataSource;
     DatailData: TfrDBDataSet;
     dsxUntilClient: TDataSource;
     dsxFromClient: TDataSource;
     xFromClient: TFIBDataSetRO;
     xUntilClient: TFIBDataSetRO;
     dsxUntilLabel: TDataSource;
     dsxFromLabel: TDataSource;
     xFromLabel: TFIBDataSetRO;
     xUntilLabel: TFIBDataSetRO;
     xFromOrderS_REFERENCIA: TFIBStringField;
     xFromClientNOMBRE_COMERCIAL: TFIBStringField;
     xUntilClientNOMBRE_COMERCIAL: TFIBStringField;
     xFromLabelTITULO: TFIBStringField;
     xUntilLabelTITULO: TFIBStringField;
     qTexts: TFIBDataSetRO;
     dsTexts: TDataSource;
     TextsData: TfrDBDataSet;
     zzzSQLMemo: TQuery;
     zzzColors: TFIBDataSetRO;
     zzzColorsCOUNT: TIntegerField;
     qDetailsEMPRESA: TIntegerField;
     qDetailsORDEN_FABRICACION: TIntegerField;
     qDetailsFECHA_RECEPCION: TDateTimeField;
     qDetailsFECHA_ENTREGA: TDateTimeField;
     qDetailsCODIGO_CLIENTE: TIntegerField;
     qDetailsNOMBRE_CLIENTE: TFIBStringField;
     qDetailsPEDIDO_CLIENTE: TFIBStringField;
     qDetailsETIQUETA: TFIBStringField;
     qDetailsNOMBRE_ETIQUETA: TFIBStringField;
     qDetailsCANTIDAD: TFloatField;
     qDetailsANCHO: TIntegerField;
     qDetailsAVANCE: TIntegerField;
     qDetailsIMPRESORA: TFIBStringField;
     qDetailsBARNIZAR: TIntegerField;
     qDetailsTIPO_BARNIZ: TFIBStringField;
     qDetailsESTAMPAR: TIntegerField;
     qDetailsTIPO_ESTAMPADO: TFIBStringField;
     qDetailsMAQUINA_ESTAMPADORA: TFIBStringField;
     qDetailsANCHO_FILM: TIntegerField;
     qDetailsREIMPRIMIR: TIntegerField;
     qDetailsMAQUINA_REIMPRESORA: TFIBStringField;
     qDetailsPAPEL: TFIBStringField;
     qDetailsTROQUEL: TIntegerField;
     qDetailsADHESIVO: TFIBStringField;
     qDetailsX: TIntegerField;
     qDetailsY: TIntegerField;
     qDetailsSILICONADO: TFIBStringField;
     qDetailsDESARROLLO: TFIBStringField;
     qDetailsCILINDRO: TFIBStringField;
     qDetailsNOMBRE_PROVEEDOR: TFIBStringField;
     qDetailsFOTOGRABADO: TFIBStringField;
     qDetailsPOSICION_TEXTO: TFIBStringField;
     qDetailsANCHO_BOBINA: TIntegerField;
     qDetailsOBSERVACIONES_ETIQUETA: TBlobField;
     qDetailsOBSERVACIONES_PEDIDO: TBlobField;
     qDetailsETIQUETAS_POR_ROLLO: TIntegerField;
     qDetailsMAQUINA_VERIFICADORA: TFIBStringField;
     qDetailsDIAMETRO_INTERIOR: TIntegerField;
     qDetailsDIAMETRO_EXTERIOR: TIntegerField;
     qDetailsETIQUETADO: TFIBStringField;
     qDetailsETIQUETAS_AL_ANCHO: TIntegerField;
     qDetailsMODELO_CAJA: TFIBStringField;
     qDetailsETIQUETAS_POR_CAJA: TIntegerField;
     qDetailsDIRECCION_ENTREGA: TFIBStringField;
     qDetailsPRECIO_MIL: TFloatField;
     qDetailsFECHA_FABRICACION: TDateTimeField;
     qDetailsVARIOS: TFloatField;
     qTotal: TFIBDataSetRO;
     dsTotal: TDataSource;
     TotalData: TfrDBDataSet;
     qSubtotal: TFIBDataSetRO;
     dsSubTotal: TDataSource;
     SubtotalData: TfrDBDataSet;
     qTotalTOTAL: TFloatField;
     zzzSQLTotalMemo: TQuery;
     qSubtotalTOTAL: TFloatField;
     qDetailsIMPRESION: TFIBStringField;
     qDetailsPEDIDO_DELFOS: TIntegerField;
     qDetailsESTADO: TFIBStringField;
     qDetailsPOBLACION: TFIBStringField;
     qDetailsPOBLACION_CP: TFIBStringField;
     qDetailsNUMERO_VERIFICACION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure qDetailsAfterScroll(DataSet: TDataSet);
     procedure frLstOrdersGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     arreglo: integer;
     metros_lineal: real;
     metros_cuadrados: real;
     metros_tiraje: real;
     cantidad: real;
     etiquetas_troquel: integer;
     desarrollo: real;
     ClientCalc: integer;
  public
     { Public declarations }
     Filters, Ordenacion: string;
     procedure RefreshDRO(StrValue: TCaption; dset: TFIBDataSetRO);
     procedure ShowList(Lst, Action: integer);
  end;

var
  ZDMLstOrdenes : TZDMLstOrdenes;

implementation

uses
  UDMMain, UEntorno, Dialogs;

{$R *.dfm}

procedure TZDMLstOrdenes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMLstOrdenes.RefreshDRO(StrValue: TCaption; dset: TFIBDataSetRO);
var
  i : integer;
  straux : string;
begin
  with dset do
  begin
     Close;
     for i := 0 to Params.Count - 1 do
     begin
        straux := Trim(LowerCase(Params[i].Name));
        if straux = 'empresa' then
           Params[i].AsInteger := REntorno.Empresa
        else
        if straux = 'ejercicio' then
           Params[i].AsInteger := REntorno.Ejercicio
        else
        if straux = 'canal' then
           Params[i].AsInteger := REntorno.Canal
        else
        if straux = 'serie' then
           Params[i].AsString := REntorno.Serie
        else
           Params[i].AsString := StrValue;
     end;
     Open;
  end;
end;

procedure TZDMLstOrdenes.ShowList(Lst, Action: integer);
var
  ReportTitle : string;
begin
  qDetails.Close;
  qDetails.SelectSQL.Clear;
  qDetails.SelectSQL.AddStrings(zzzSQLMemo.SQL);
  qDetails.SelectSQL.Add(Filters);
  qDetails.SelectSQL.Add(Ordenacion);
  try
     qDetails.Open;
  except
     Beep
  end;
  qTotal.Close;
  qTotal.SelectSQL.Clear;
  qTotal.SelectSQL.AddStrings(zzzSQLTotalMemo.SQL);
  qTotal.SelectSQL.Add(Filters);
  try
     qTotal.Open;
  except
     Beep
  end;
  with frLstOrders do
  begin
     ReportTitle := _('Órdenes de producción');
     LoadFromFIB(Lst, ReportTitle);
     if Action <> 2 then
        PrepareReport;
     case Action of
        0: ShowPreparedReport;
        1: PrintPreparedReport('', REntorno.Copias);
        2: DesignReport;
     end;
     (******************************************************************************)
  end;
end;

procedure TZDMLstOrdenes.qDetailsAfterScroll(DataSet: TDataSet);
begin
  qTexts.Close;
  qTexts.Open;
end;

procedure TZDMLstOrdenes.frLstOrdersGetValue(const ParName: string; var ParValue: variant);
var
  str : string;
begin
  str := Trim(LowerCase(ParName));
  if str = 'arreglo' then
  begin
     arreglo := -1;
     metros_lineal := -1;
     metros_cuadrados := -1;
     metros_tiraje := -1;
     cantidad := -1;
     etiquetas_troquel := -1;
     desarrollo := -1;
     zzzColors.Close;
     zzzColors.Params.ByName['etiqueta'].AsString := qDetailsETIQUETA.AsString;
     zzzColors.Params.ByName['empresa'].AsInteger := qDetailsEMPRESA.AsInteger;
     zzzColors.Open;
     arreglo := zzzColorsCOUNT.AsInteger * 75 + 50;
     ParValue := arreglo;
  end;
  if str = 'metros_tiraje' then
     try
        cantidad := qDetailsCANTIDAD.AsFloat;
        etiquetas_troquel := qDetailsX.AsInteger * qDetailsY.AsInteger;
        desarrollo := StrToFloatDef(qDetailsDESARROLLO.AsString, 0);
        if (etiquetas_troquel <> 0) then
           metros_tiraje := (cantidad / etiquetas_troquel) * desarrollo * 1.035;
        ParValue := metros_tiraje;
     except
        ParValue := '-';
     end;
  if str = 'metros_lineal' then
     if metros_tiraje = -1 then
        ParValue := '-'
     else
     begin
        metros_lineal := metros_tiraje + arreglo;
        ParValue := metros_lineal;
     end;
  if str = 'metros_cuadrados' then
     if metros_lineal = -1 then
        ParValue := '-'
     else
     begin
        metros_cuadrados := metros_lineal * qDetailsANCHO_BOBINA.AsFloat / 1000;
        ParValue := metros_cuadrados;
     end;
  if str = 'calcula_cliente' then
  begin
     ClientCalc := qDetailsCODIGO_CLIENTE.AsInteger;
     ParValue := '';
  end;
  if str = 'subtotal' then
  begin
     qSubtotal.Close;
     qSubtotal.SelectSQL.Clear;
     qSubtotal.SelectSQL.AddStrings(zzzSQLTotalMemo.SQL);
     qSubtotal.SelectSQL.Add(Filters);
     qSubtotal.SelectSQL.Add('and ord.cliente=' + IntToStr(ClientCalc));
     qSubtotal.Open;
     ParValue := qSubtotalTOTAL.AsFloat;
  end;
end;

end.
