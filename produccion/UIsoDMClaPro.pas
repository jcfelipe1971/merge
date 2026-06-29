unit UIsoDMClaPro;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TIsoDMClaPro = class(TDataModule)
     DSQMIsoClaPro: TDataSource;
     TLocal: THYTransaction;
     xClaManual: TFIBTableSet;
     DSxClaManual: TDataSource;
     xClaManualTIPO: TFIBStringField;
     xClaManualDESCRIPCION: TFIBStringField;
     xNINC: TFIBTableSet;
     DSxNINC: TDataSource;
     xNINCCLI_PRO_INTE: TIntegerField;
     QMIsoClaPro: TFIBTableSet;
     QMIsoClaProEMPRESA: TIntegerField;
     QMIsoClaProPROVEEDOR: TIntegerField;
     QMIsoClaProCLAS_MANUAL: TFIBStringField;
     QMIsoClaProFECHA: TDateTimeField;
     QMIsoClaProN_INC: TIntegerField;
     QMIsoClaProVALOR_INC: TIntegerField;
     QMIsoClaProFACTOR_INC: TFloatField;
     QMIsoClaProOBSERVACIONES: TBlobField;
     QMIsoClaProISO9000: TIntegerField;
     QMIsoClaProFECHA_CERT_ISO: TDateTimeField;
     QMIsoClaProPRODUCTO: TFIBStringField;
     QMIsoClaProFECHA_BAJA: TDateTimeField;
     QMIsoClaProMOTIVO_BAJA: TFIBStringField;
     QMIsoClaProFECHA_VTO_ISO: TDateTimeField;
     QMIsoClaProBAJA: TIntegerField;
     QMIsoClaProISO_APROBADO: TIntegerField;
     QMIsoClaProISO_VERIFICADO: TIntegerField;
     QMIsoClaProISO_VALIDADO: TIntegerField;
     QMDetIsoClaPro: TFIBTableSet;
     QMDetIsoClaProEMPRESA: TIntegerField;
     QMDetIsoClaProPROVEEDOR: TIntegerField;
     QMDetIsoClaProLINEA: TIntegerField;
     QMDetIsoClaProNUM_PEDIDO: TIntegerField;
     QMDetIsoClaProNUM_DIAS_RETRASO: TIntegerField;
     QMDetIsoClaProEJERCICIO: TIntegerField;
     QMDetIsoClaProNUM_INC: TIntegerField;
     QMDetIsoClaProNUM_RECHAZO: TIntegerField;
     QMDetIsoClaProFACTOR: TIntegerField;
     QMDetIsoClaProDECISIONES: TFIBStringField;
     QMDetIsoClaProRESPONSABLE: TIntegerField;
     QMDetIsoClaProNOTAS: TBlobField;
     QMDetIsoClaProFECHA: TDateTimeField;
     QMDetIsoClaProVAL_CALIDAD_SUMINISTROS: TFloatField;
     QMDetIsoClaProVAL_CALIDAD_PRODUCTO: TFloatField;
     QMDetIsoClaProVAL_SERVICIO_ENTREGA: TFloatField;
     QMDetIsoClaProVAL_PRECIO: TFloatField;
     QMDetIsoClaProVAL_VARIOS: TFloatField;
     QMDetIsoClaProCOSTE_ACCIONES: TFloatField;
     QMDetIsoClaProDesc_Ope: TStringField;
     DSQMDetIsoClaPro: TDataSource;
     QMDetIsoClaProFECHA_FIN: TDateTimeField;
     SPDadesDet: THYFIBQuery;
     QMDetIsoClaProIPR_INDICE: TFIBStringField;
     SPDadesDetAct: THYFIBQuery;
     QMIsoClaProTERCERO: TIntegerField;
     xTercero: TFIBDataSetRO;
     DSxTercero: TDataSource;
     xTerceroTERCERO: TIntegerField;
     QMDetIsoClaProTERCERO: TIntegerField;
     frLstClaprov: TfrHYReport;
     xLstCabClaProv: TFIBDataSetRO;
     xLstDetClaProv: TFIBDataSetRO;
     frDBxLstCab: TfrDBDataSet;
     frDBxLstDet: TfrDBDataSet;
     DSxLstCabClaProv: TDataSource;
     DSxLstDetClaProv: TDataSource;
     xLstCabClaProvEMPRESA: TIntegerField;
     xLstCabClaProvPROVEEDOR: TIntegerField;
     xLstCabClaProvCLAS_MANUAL: TFIBStringField;
     xLstCabClaProvFECHA: TDateTimeField;
     xLstCabClaProvN_INC: TIntegerField;
     xLstCabClaProvVALOR_INC: TIntegerField;
     xLstCabClaProvFACTOR_INC: TFloatField;
     xLstCabClaProvOBSERVACIONES: TBlobField;
     xLstCabClaProvISO9000: TIntegerField;
     xLstCabClaProvFECHA_CERT_ISO: TDateTimeField;
     xLstCabClaProvPRODUCTO: TFIBStringField;
     xLstCabClaProvBAJA: TIntegerField;
     xLstCabClaProvFECHA_BAJA: TDateTimeField;
     xLstCabClaProvMOTIVO_BAJA: TFIBStringField;
     xLstCabClaProvFECHA_VTO_ISO: TDateTimeField;
     xLstCabClaProvISO_APROBADO: TIntegerField;
     xLstCabClaProvISO_VERIFICADO: TIntegerField;
     xLstCabClaProvISO_VALIDADO: TIntegerField;
     xLstCabClaProvTERCERO: TIntegerField;
     xLstCabClaProvTITULO: TFIBStringField;
     QMDetIsoClaProTOTAL_COMPRAS_FAC: TFloatField;
     xPrimerResponsable: THYFIBQuery;
     QMDetIsoClaProVAL_MANUAL: TFloatField;
     QMDetIsoClaProVAL_INC_PED: TFloatField;
     QMDetIsoClaProVAL_COSTE: TFloatField;
     QMDetIsoClaProVAL_ENTREGAS: TFloatField;
     xConfigIso: TFIBDataSetRO;
     DSxConfigIso: TDataSource;
     xConfigIsoID: TIntegerField;
     xConfigIsoVALORACION_MANUAL: TIntegerField;
     xConfigIsoVALORACION_INC_PED: TIntegerField;
     xConfigIsoVALORACION_COSTE: TIntegerField;
     xConfigIsoVALORACION_ENTREGAS: TIntegerField;
     xConfigIsoVALOR_INC_PED_A: TIntegerField;
     xConfigIsoVALOR_INC_PED_B: TIntegerField;
     xConfigIsoVALOR_INC_PED_C: TIntegerField;
     xConfigIsoVALOR_COSTE_A: TIntegerField;
     xConfigIsoVALOR_COSTE_B: TIntegerField;
     xConfigIsoVALOR_COSTE_C: TIntegerField;
     xConfigIsoVALOR_ENTREGAS_A: TIntegerField;
     xConfigIsoVALOR_ENTREGAS_B: TIntegerField;
     xConfigIsoVALOR_ENTREGAS_C: TIntegerField;
     xConfigIsoVALOR_MANUAL_A: TIntegerField;
     xConfigIsoVALOR_MANUAL_B: TIntegerField;
     xConfigIsoVALOR_MANUAL_C: TIntegerField;
     SPCalcIndice: THYFIBQuery;
     xLstCabClaTodos: TFIBDataSetRO;
     IntegerField1: TIntegerField;
     IntegerField2: TIntegerField;
     FIBStringField1: TFIBStringField;
     DateTimeField1: TDateTimeField;
     IntegerField3: TIntegerField;
     IntegerField4: TIntegerField;
     FloatField1: TFloatField;
     BlobField1: TBlobField;
     IntegerField5: TIntegerField;
     DateTimeField2: TDateTimeField;
     FIBStringField2: TFIBStringField;
     IntegerField6: TIntegerField;
     DateTimeField3: TDateTimeField;
     FIBStringField3: TFIBStringField;
     DateTimeField4: TDateTimeField;
     IntegerField7: TIntegerField;
     IntegerField8: TIntegerField;
     IntegerField9: TIntegerField;
     IntegerField10: TIntegerField;
     FIBStringField4: TFIBStringField;
     DSxLastCabClaTodos: TDataSource;
     xLstDetClaTodos: TFIBDataSetRO;
     DSxLstDetClaTodos: TDataSource;
     frDBxLstClaTodos: TfrDBDataSet;
     frDBxLstDetClaTodos: TfrDBDataSet;
     frLstClaTodos: TfrHYReport;
     QMIsoClaProTITULO: TFIBStringField;
     QMIsoClaProID_PROVEEDOR: TIntegerField;
     QMDetIsoClaProID_PROVEEDOR: TIntegerField;
     procedure DMIsoClaProCreate(Sender: TObject);
     procedure QMIsoClaProPROVEEDORChange(Sender: TField);
     procedure QMIsoClaProAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMIsoClaProNewRecord(DataSet: TDataSet);
     procedure QMIsoClaProCLAS_MANUALChange(Sender: TField);
     procedure QMDetIsoClaProNewRecord(DataSet: TDataSet);
     procedure QMDetIsoClaProDesc_OpeGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetIsoClaProEJERCICIOChange(Sender: TField);
     procedure QMIsoClaProBeforePost(DataSet: TDataSet);
     procedure QMDetIsoClaProBeforePost(DataSet: TDataSet);
     procedure QMDetIsoClaProPROVEEDORChange(Sender: TField);
     procedure QMDetIsoClaProAfterScroll(DataSet: TDataSet);
     procedure xLstCabClaProvAfterOpen(DataSet: TDataSet);
     procedure frLstClaprovGetValue(const ParName: string; var ParValue: variant);
     procedure frLstClaTodosGetValue(const ParName: string; var ParValue: variant);
     procedure frLstClaprovEnterRect(Memo: TStringList; View: TfrView);
     procedure frLstClaTodosEnterRect(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure CalcularDetalle;
     function CalcularIndice: integer;
     procedure CalcularDetalleTodo;
  end;

var
  IsoDMClaPro : TIsoDMClaPro;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca, URecursos, UDMListados, UDameDato;

{$R *.DFM}

procedure TIsoDMClaPro.DMIsoClaProCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMIsoClaPro, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetIsoClaPro, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMIsoClaPro, '10000', True);
end;

procedure TIsoDMClaPro.QMIsoClaProPROVEEDORChange(Sender: TField);
begin
  {
  with xDescProv do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['proveedor'].AsInteger := Sender.AsInteger;
     Open;
  end;
  }
  {
  // Es busca el tercer
  xTercero.Close;
  xTercero.Open;
  QMIsoClaProTERCERO.AsInteger := xTerceroTERCERO.AsInteger;
  }
end;

procedure TIsoDMClaPro.QMIsoClaProAfterOpen(DataSet: TDataSet);
begin
  // S'executa procediment d'actulització del detall
  CalcularDetalleTodo;
  // xDescProv.Open;
  xClaManual.Open;
end;

procedure TIsoDMClaPro.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMIsoClaPro, '10000');
end;

procedure TIsoDMClaPro.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TIsoDMClaPro.QMIsoClaProNewRecord(DataSet: TDataSet);
begin
  QMIsoClaProEMPRESA.AsInteger := REntorno.Empresa;
  QMIsoClaProFECHA.AsDateTime := Date;
end;

procedure TIsoDMClaPro.QMIsoClaProCLAS_MANUALChange(Sender: TField);
begin
  with xClaManual do
  begin
     Close;
     Params.ByName['clas_manual'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TIsoDMClaPro.QMDetIsoClaProNewRecord(DataSet: TDataSet);
var
  Any, Mes, Dia : word;
begin
  DecodeDate(Date, any, mes, dia);
  QMDetIsoClaProEMPRESA.AsInteger := REntorno.Empresa;
  QMDetIsoClaProPROVEEDOR.AsInteger := QMIsoClaProPROVEEDOR.AsInteger;
  QMDetIsoClaProEJERCICIO.AsInteger := REntorno.Ejercicio;

  // sfg.albert - Es busca el primer respobsale (empleados)
  with xPrimerResponsable do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Prepare;
     ExecQuery;

     QMDetIsoClaProRESPONSABLE.AsInteger := Fields[0].AsInteger;
     FreeHandle;
  end;

  // QMDetIsoClaProFECHA.AsDateTime := EncodeDate(any, 01, 01);
  // QMDetIsoClaProFECHA_FIN.AsDateTime := EncodeDate(any, 12, 31);
  // sfg.albert
  QMDetIsoClaProFECHA.AsDateTime := EncodeDate(QMDetIsoClaProEJERCICIO.AsInteger, 01, 01);
  QMDetIsoClaProFECHA_FIN.AsDateTime := EncodeDate(QMDetIsoClaProEJERCICIO.AsInteger, 12, 31);

  // Obtenemos siguiente numero de linea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM ISO_CLAS_DET_PROV WHERE EMPRESA = :EMPRESA AND PROVEEDOR = :PROVEEDOR';
        Params.ByName['EMPRESA'].AsInteger := QMIsoClaProEMPRESA.AsInteger;
        Params.ByName['PROVEEDOR'].AsInteger := QMIsoClaProPROVEEDOR.AsInteger;
        ExecQuery;
        QMDetIsoClaProLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMClaPro.QMDetIsoClaProDesc_OpeGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEmpleado(QMDetIsoClaProRESPONSABLE.AsInteger);
end;

procedure TIsoDMClaPro.QMDetIsoClaProEJERCICIOChange(Sender: TField);
var
  Any : integer;
begin
  any := (Sender as TField).AsInteger;

  QMDetIsoClaProFECHA.AsDateTime := EncodeDate(any, 01, 01);
  QMDetIsoClaProFECHA_FIN.AsDateTime := EncodeDate(any, 31, 12);
end;

procedure TIsoDMClaPro.QMIsoClaProBeforePost(DataSet: TDataSet);
begin
  // Este calculo puede fallar si no hay registros (division by 0)
  QMIsoClaProFACTOR_INC.AsFloat := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('select (sum(por_clasifica) / count(*)) as factor from iso_no_conformidad ');
        SQL.Add('where empresa=:empresa and tipo=''P'' and cli_pro_inte=:proveedor ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := QMIsoClaProPROVEEDOR.AsInteger;
        ExecQuery;
        QMIsoClaProFACTOR_INC.AsFloat := Round(FieldByName['FACTOR'].AsFloat);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMClaPro.QMDetIsoClaProBeforePost(DataSet: TDataSet);
begin
  //Se rellenan los campos de consulta
  CalcularDetalle;

  //sfg.albert
  //A=1; B=2; C=3
  case CalcularIndice of
     1: QMDetIsoClaProIPR_INDICE.AsString := 'A';
     2: QMDetIsoClaProIPR_INDICE.AsString := 'B';
     3: QMDetIsoClaProIPR_INDICE.AsString := 'C';
  end;
  {
  //Se decide el IPR_Indice
  total_ipr:=(QMDetIsoClaProVAL_CALIDAD_SUMINISTROS.AsInteger+
             QMDetIsoClaProVAL_CALIDAD_PRODUCTO.AsInteger+
             QMDetIsoClaProVAL_SERVICIO_ENTREGA.AsInteger+
             QMDetIsoClaProVAL_PRECIO.AsInteger+
             QMDetIsoClaProVAL_VARIOS.AsInteger) div 5;

  case total_ipr of
    0..60 : begin
              QMDetIsoClaProIPR_INDICE.AsString:='C';
              //IsoFMClaPro.DBGDetalle.Columns[18].Color:=clRed;
            end;
   61..74 : begin
              QMDetIsoClaProIPR_INDICE.AsString:='B';
              //IsoFMClaPro.DBGDetalle.Columns[18].Color:=clYellow;
            end;
   75..100: begin
              QMDetIsoClaProIPR_INDICE.AsString:='A';
              //IsoFMClaPro.DBGDetalle.Columns[18].Color:=clGreen;
            end;
  end;
 }
end;

procedure TIsoDMClaPro.QMDetIsoClaProPROVEEDORChange(Sender: TField);
begin
  //Es busca el tercer
  xTercero.Close;
  xTercero.Open;
  QMDetIsoClaProTERCERO.AsInteger := xTerceroTERCERO.AsInteger;
end;

procedure TIsoDMClaPro.CalcularDetalle;
begin
  with SPDadesDet do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := QMDetIsoClaProEJERCICIO.AsInteger;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['Tercero'].AsInteger := QMDetIsoClaProTERCERO.AsInteger; // QMDetIsoClaProPROVEEDOR.AsInteger;
     Params.ByName['Fecha_Ini'].AsDateTime := QMDetIsoClaProFECHA.AsDateTime;
     Params.ByName['Fecha_Fin'].AsDateTime := QMDetIsoClaProFECHA_FIN.AsDateTime;
     Params.ByName['Linea'].AsInteger := 0;
     ExecQuery;

     QMDetIsoClaProNUM_PEDIDO.AsInteger := FieldByName['N_PEDIDO'].AsInteger;
     QMDetIsoClaProNUM_DIAS_RETRASO.AsInteger := FieldByName['N_DIAS_RETRASO'].AsInteger;
     QMDetIsoClaProNUM_INC.AsInteger := FieldByName['NUM_INC'].AsInteger;
     QMDetIsoClaProNUM_RECHAZO.AsInteger := FieldByName['NUM_RECHAZO'].AsInteger;
     QMDetIsoClaProFACTOR.AsInteger := FieldByName['N_FACTOR'].AsInteger;
     QMDetIsoClaProCOSTE_ACCIONES.AsInteger := FieldByName['COSTE_ACCIONES'].AsInteger;
     QMDetIsoClaProTOTAL_COMPRAS_FAC.AsFloat := FieldByName['TOTAL_COMPRAS_FAC'].AsInteger;

     FreeHandle;
  end;
end;

procedure TIsoDMClaPro.QMDetIsoClaProAfterScroll(DataSet: TDataSet);
begin
  // CalcularDetalle;
end;

procedure TIsoDMClaPro.xLstCabClaProvAfterOpen(DataSet: TDataSet);
begin
  xLstDetClaProv.Open;
end;

//sfg.albert
function TIsoDMClaPro.CalcularIndice: integer;
begin
  with SPCalcIndice do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := QMDetIsoClaProEMPRESA.AsInteger;
     Params.ByName['proveedor'].AsInteger := QMDetIsoClaProPROVEEDOR.AsInteger;
     Params.ByName['linea'].AsInteger := QMDetIsoClaProLINEA.AsInteger;
     Prepare;
     ExecQuery;

     QMDetIsoClaProVAL_MANUAL.AsFloat := FieldByName['TOTAL_MANUAL'].AsFloat;
     QMDetIsoClaProVAL_COSTE.AsFloat := FieldByName['TOTAL_COSTE'].AsFloat;
     QMDetIsoClaProVAL_INC_PED.AsFloat := FieldByName['TOTAL_INC_PED'].AsFloat;
     QMDetIsoClaProVAL_ENTREGAS.AsFloat := FieldByName['TOTAL_ENTREGAS'].AsFloat;

     Result := FieldByName['VALOR_INDICE_TOTAL'].AsInteger;
     FreeHandle;
  end;
end;

procedure TIsoDMClaPro.CalcularDetalleTodo;
begin
  QMDetIsoClaPro.Close;
  with SPDadesDetAct do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['Tercero'].AsInteger := QMIsoClaProTERCERO.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  QMDetIsoClaPro.Open;
end;

procedure TIsoDMClaPro.frLstClaprovGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TIsoDMClaPro.frLstClaTodosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TIsoDMClaPro.frLstClaprovEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TIsoDMClaPro.frLstClaTodosEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

end.
