unit UDMLstCRM;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_Class, Fr_HYReport, DB, FIBDataSet,
  FIBTableDataSet, FIBDatabase, UFIBModificados, FR_DSet, FR_DBSet, HYFIBQuery, DateUtils;

type
  TDMLstCRM = class(TDataModule)
     TLocal: THYTransaction;
     xCRM: TFIBTableSet;
     xCRMID: TIntegerField;
     xCRMEMPRESA: TIntegerField;
     xCRMEJERCICIO: TIntegerField;
     xCRMUSUARIO: TIntegerField;
     xCRMAGENTE: TIntegerField;
     xCRMCLIENTE: TIntegerField;
     xCRMINCIDENCIA: TFIBStringField;
     xCRMFECHA: TDateTimeField;
     xCRMFECHA_FUTURO: TDateTimeField;
     xCRMTIPO: TIntegerField;
     xCRMNOTAS: TBlobField;
     xCRMTIT_AGENTE: TFIBStringField;
     xCRMTIT_CLIENTE: TFIBStringField;
     xCRMTIT_TIPO: TFIBStringField;
     xCRMRUTA: TIntegerField;
     xCRMSEMANA: TIntegerField;
     DSXCRM: TDataSource;
     xSemana: TFIBTableSet;
     xSemanaID: TIntegerField;
     xSemanaEMPRESA: TIntegerField;
     xSemanaEJERCICIO: TIntegerField;
     xSemanaUSUARIO: TIntegerField;
     xSemanaAGENTE: TIntegerField;
     xSemanaTIT_AGENTE: TFIBStringField;
     xSemanaCLIENTE: TIntegerField;
     xSemanaTIT_CLIENTE: TFIBStringField;
     xSemanaINCIDENCIA: TFIBStringField;
     xSemanaFECHA: TDateTimeField;
     xSemanaFECHA_FUTURO: TDateTimeField;
     xSemanaTIPO: TIntegerField;
     xSemanaTIT_TIPO: TFIBStringField;
     xSemanaNOTAS: TBlobField;
     xSemanaRUTA: TIntegerField;
     xSemanaSEMANA: TIntegerField;
     DSxSemana: TDataSource;
     xTotSemana: TFIBTableSet;
     xTotSemanaEMPRESA: TIntegerField;
     xTotSemanaEJERCICIO: TIntegerField;
     xTotSemanaUSUARIO: TIntegerField;
     xTotSemanaAGENTE: TIntegerField;
     xTotSemanaSEMANA: TIntegerField;
     xTotSemanaRUTA: TIntegerField;
     xTotSemanaKILOMETROS: TFloatField;
     xTotSemanaGASOLINA: TFloatField;
     xTotSemanaBILLETES: TFloatField;
     xTotSemanaPEAJES: TFloatField;
     xTotSemanaPARKING: TFloatField;
     xTotSemanaTELEFONO: TFloatField;
     xTotSemanaHOTEL: TFloatField;
     xTotSemanaCOMIDAS_VIAJE: TFloatField;
     xTotSemanaCOMIDAS_INVITACION: TFloatField;
     xTotSemanaGASTOS_PEQUENOS: TFloatField;
     xTotSemanaVARIOS: TFloatField;
     xTotSemanaTOTAL: TFloatField;
     DSxTotSemana: TDataSource;
     FrCRM: TfrHYReport;
     xCliente: TFIBTableSet;
     DSxCliente: TDataSource;
     xClienteEMPRESA: TIntegerField;
     xClienteEJERCICIO: TIntegerField;
     xClienteCANAL: TIntegerField;
     xClienteCLIENTE: TIntegerField;
     xClienteCUENTA: TFIBStringField;
     xClienteNOMBRE: TFIBStringField;
     xClienteNIF: TFIBStringField;
     xClienteTELEFONO: TFIBStringField;
     xClienteDIRECCION: TFIBStringField;
     xClienteCOD_POSTAL: TFIBStringField;
     xClienteLOCALIDAD: TFIBStringField;
     xClientePROVINCIA: TFIBStringField;
     frDBxCRM: TfrDBDataSet;
     frDBxSemana: TfrDBDataSet;
     frDBxTotSemana: TfrDBDataSet;
     frDBxCliente: TfrDBDataSet;
     xSemanaCLIENTE_AUSENTE: TIntegerField;
     xSemanaCLIENTE_NUEVO: TIntegerField;
     xSemanaVISITA_EFECTUADA: TIntegerField;
     xSemanaAUSENTE: TIntegerField;
     xSemanaVOLVER: TIntegerField;
     xSemanaANULAR: TIntegerField;
     xSemanaVISITA_COMERCIAL: TIntegerField;
     xSemanaGESTION_DE_COBROS: TIntegerField;
     xSemanaENTREGA_MATERIAL: TIntegerField;
     xCRMCLIENTE_AUSENTE: TIntegerField;
     xCRMCLIENTE_NUEVO: TIntegerField;
     xCRMVISITA_EFECTUADA: TIntegerField;
     xCRMAUSENTE: TIntegerField;
     xCRMVOLVER: TIntegerField;
     xCRMANULAR: TIntegerField;
     xCRMVISITA_COMERCIAL: TIntegerField;
     xCRMGESTION_DE_COBROS: TIntegerField;
     xCRMENTREGA_MATERIAL: TIntegerField;
     xVisitasConFrec: TFIBTableSet;
     xVisitasConFrecENTRADA: TIntegerField;
     xVisitasConFrecEMPRESA: TIntegerField;
     xVisitasConFrecCLIENTE: TIntegerField;
     xVisitasConFrecTITULO: TFIBStringField;
     xVisitasConFrecCODIGO_POSTAL: TFIBStringField;
     xVisitasConFrecTITULO_LOCALIDAD: TFIBStringField;
     xVisitasConFrecFRECUENCIA: TIntegerField;
     xVisitasConFrecVENTAS_2: TFloatField;
     xVisitasConFrecVENTAS_1: TFloatField;
     xVisitasConFrecVENTAS: TFloatField;
     xVisitasConFrecPREVISION_VENTA: TFloatField;
     xVisitasConFrecRUTA: TIntegerField;
     xVisitasConFrecD01: TIntegerField;
     xVisitasConFrecD02: TIntegerField;
     xVisitasConFrecD03: TIntegerField;
     xVisitasConFrecD04: TIntegerField;
     xVisitasConFrecD05: TIntegerField;
     xVisitasConFrecD06: TIntegerField;
     xVisitasConFrecD07: TIntegerField;
     xVisitasConFrecD08: TIntegerField;
     xVisitasConFrecD09: TIntegerField;
     xVisitasConFrecD10: TIntegerField;
     xVisitasConFrecD11: TIntegerField;
     xVisitasConFrecD12: TIntegerField;
     xVisitasConFrecD13: TIntegerField;
     xVisitasConFrecD14: TIntegerField;
     xVisitasConFrecD15: TIntegerField;
     xVisitasConFrecD16: TIntegerField;
     xVisitasConFrecD17: TIntegerField;
     xVisitasConFrecD18: TIntegerField;
     xVisitasConFrecD19: TIntegerField;
     xVisitasConFrecD20: TIntegerField;
     xVisitasConFrecD21: TIntegerField;
     xVisitasConFrecD22: TIntegerField;
     xVisitasConFrecD23: TIntegerField;
     xVisitasConFrecD24: TIntegerField;
     xVisitasConFrecD25: TIntegerField;
     xVisitasConFrecD26: TIntegerField;
     xVisitasConFrecD27: TIntegerField;
     xVisitasConFrecD28: TIntegerField;
     xVisitasConFrecD29: TIntegerField;
     DSVisitasConFrec: TDataSource;
     frDBxVisitasConFrec: TfrDBDataSet;
     xVisitasSinFrec: TFIBTableSet;
     IntegerField1: TIntegerField;
     IntegerField2: TIntegerField;
     IntegerField3: TIntegerField;
     FIBStringField1: TFIBStringField;
     FIBStringField2: TFIBStringField;
     FIBStringField3: TFIBStringField;
     IntegerField4: TIntegerField;
     FloatField1: TFloatField;
     FloatField2: TFloatField;
     FloatField3: TFloatField;
     FloatField4: TFloatField;
     IntegerField5: TIntegerField;
     IntegerField7: TIntegerField;
     IntegerField8: TIntegerField;
     IntegerField9: TIntegerField;
     IntegerField10: TIntegerField;
     IntegerField11: TIntegerField;
     IntegerField12: TIntegerField;
     IntegerField13: TIntegerField;
     IntegerField14: TIntegerField;
     IntegerField15: TIntegerField;
     IntegerField16: TIntegerField;
     IntegerField17: TIntegerField;
     IntegerField18: TIntegerField;
     IntegerField19: TIntegerField;
     IntegerField20: TIntegerField;
     IntegerField21: TIntegerField;
     IntegerField22: TIntegerField;
     IntegerField23: TIntegerField;
     IntegerField24: TIntegerField;
     IntegerField25: TIntegerField;
     IntegerField26: TIntegerField;
     IntegerField27: TIntegerField;
     IntegerField28: TIntegerField;
     IntegerField29: TIntegerField;
     IntegerField30: TIntegerField;
     IntegerField31: TIntegerField;
     IntegerField32: TIntegerField;
     IntegerField33: TIntegerField;
     IntegerField34: TIntegerField;
     IntegerField35: TIntegerField;
     DSVisitasSinFrec: TDataSource;
     frDBVisitasSinFrec: TfrDBDataSet;
     xVisitasConFrecD30: TIntegerField;
     xVisitasConFrecD31: TIntegerField;
     xVisitasConFrecD32: TIntegerField;
     xVisitasConFrecD33: TIntegerField;
     xVisitasConFrecD34: TIntegerField;
     xVisitasConFrecD35: TIntegerField;
     xVisitasConFrecD36: TIntegerField;
     xVisitasConFrecD37: TIntegerField;
     xVisitasConFrecD38: TIntegerField;
     xVisitasConFrecD39: TIntegerField;
     xVisitasConFrecD40: TIntegerField;
     xVisitasConFrecD41: TIntegerField;
     xVisitasConFrecD42: TIntegerField;
     xVisitasConFrecD43: TIntegerField;
     xVisitasConFrecD44: TIntegerField;
     xVisitasConFrecD45: TIntegerField;
     xVisitasConFrecD46: TIntegerField;
     xVisitasConFrecD47: TIntegerField;
     xVisitasConFrecD48: TIntegerField;
     xVisitasConFrecD49: TIntegerField;
     xVisitasConFrecD50: TIntegerField;
     xVisitasConFrecD51: TIntegerField;
     xVisitasConFrecD52: TIntegerField;
     xVisitasConFrecD53: TIntegerField;
     xVisitasConFrecD54: TIntegerField;
     xVisitasConFrecD55: TIntegerField;
     xVisitasSinFrecD30: TIntegerField;
     xVisitasSinFrecD31: TIntegerField;
     xVisitasSinFrecD32: TIntegerField;
     xVisitasSinFrecD33: TIntegerField;
     xVisitasSinFrecD34: TIntegerField;
     xVisitasSinFrecD35: TIntegerField;
     xVisitasSinFrecD36: TIntegerField;
     xVisitasSinFrecD37: TIntegerField;
     xVisitasSinFrecD38: TIntegerField;
     xVisitasSinFrecD39: TIntegerField;
     xVisitasSinFrecD40: TIntegerField;
     xVisitasSinFrecD41: TIntegerField;
     xVisitasSinFrecD42: TIntegerField;
     xVisitasSinFrecD43: TIntegerField;
     xVisitasSinFrecD44: TIntegerField;
     xVisitasSinFrecD45: TIntegerField;
     xVisitasSinFrecD46: TIntegerField;
     xVisitasSinFrecD47: TIntegerField;
     xVisitasSinFrecD48: TIntegerField;
     xVisitasSinFrecD49: TIntegerField;
     xVisitasSinFrecD50: TIntegerField;
     xVisitasSinFrecD51: TIntegerField;
     xVisitasSinFrecD52: TIntegerField;
     xVisitasSinFrecD53: TIntegerField;
     xVisitasSinFrecD54: TIntegerField;
     xVisitasSinFrecD55: TIntegerField;
     xVisitasPotenciales: TFIBTableSet;
     DSVisitasPotenciales: TDataSource;
     frDBDVisitasPotenciales: TfrDBDataSet;
     xVisitasConFrecCLIENTE_POTENCIAL: TIntegerField;
     xVisitasSinFrecCLIENTE_POTENCIAL: TIntegerField;
     xVisitasPotencialesENTRADA: TIntegerField;
     xVisitasPotencialesEMPRESA: TIntegerField;
     xVisitasPotencialesCLIENTE: TIntegerField;
     xVisitasPotencialesTITULO: TFIBStringField;
     xVisitasPotencialesCODIGO_POSTAL: TFIBStringField;
     xVisitasPotencialesTITULO_LOCALIDAD: TFIBStringField;
     xVisitasPotencialesFRECUENCIA: TIntegerField;
     xVisitasPotencialesVENTAS_2: TFloatField;
     xVisitasPotencialesVENTAS_1: TFloatField;
     xVisitasPotencialesVENTAS: TFloatField;
     xVisitasPotencialesPREVISION_VENTA: TFloatField;
     xVisitasPotencialesRUTA: TIntegerField;
     xVisitasPotencialesD01: TIntegerField;
     xVisitasPotencialesD02: TIntegerField;
     xVisitasPotencialesD03: TIntegerField;
     xVisitasPotencialesD04: TIntegerField;
     xVisitasPotencialesD05: TIntegerField;
     xVisitasPotencialesD06: TIntegerField;
     xVisitasPotencialesD07: TIntegerField;
     xVisitasPotencialesD08: TIntegerField;
     xVisitasPotencialesD09: TIntegerField;
     xVisitasPotencialesD10: TIntegerField;
     xVisitasPotencialesD11: TIntegerField;
     xVisitasPotencialesD12: TIntegerField;
     xVisitasPotencialesD13: TIntegerField;
     xVisitasPotencialesD14: TIntegerField;
     xVisitasPotencialesD15: TIntegerField;
     xVisitasPotencialesD16: TIntegerField;
     xVisitasPotencialesD17: TIntegerField;
     xVisitasPotencialesD18: TIntegerField;
     xVisitasPotencialesD19: TIntegerField;
     xVisitasPotencialesD20: TIntegerField;
     xVisitasPotencialesD21: TIntegerField;
     xVisitasPotencialesD22: TIntegerField;
     xVisitasPotencialesD23: TIntegerField;
     xVisitasPotencialesD24: TIntegerField;
     xVisitasPotencialesD25: TIntegerField;
     xVisitasPotencialesD26: TIntegerField;
     xVisitasPotencialesD27: TIntegerField;
     xVisitasPotencialesD28: TIntegerField;
     xVisitasPotencialesD29: TIntegerField;
     xVisitasPotencialesD30: TIntegerField;
     xVisitasPotencialesD31: TIntegerField;
     xVisitasPotencialesD32: TIntegerField;
     xVisitasPotencialesD33: TIntegerField;
     xVisitasPotencialesD34: TIntegerField;
     xVisitasPotencialesD35: TIntegerField;
     xVisitasPotencialesD36: TIntegerField;
     xVisitasPotencialesD37: TIntegerField;
     xVisitasPotencialesD38: TIntegerField;
     xVisitasPotencialesD39: TIntegerField;
     xVisitasPotencialesD40: TIntegerField;
     xVisitasPotencialesD41: TIntegerField;
     xVisitasPotencialesD42: TIntegerField;
     xVisitasPotencialesD43: TIntegerField;
     xVisitasPotencialesD44: TIntegerField;
     xVisitasPotencialesD45: TIntegerField;
     xVisitasPotencialesD46: TIntegerField;
     xVisitasPotencialesD47: TIntegerField;
     xVisitasPotencialesD48: TIntegerField;
     xVisitasPotencialesD49: TIntegerField;
     xVisitasPotencialesD50: TIntegerField;
     xVisitasPotencialesD51: TIntegerField;
     xVisitasPotencialesD52: TIntegerField;
     xVisitasPotencialesD53: TIntegerField;
     xVisitasPotencialesD54: TIntegerField;
     xVisitasPotencialesD55: TIntegerField;
     xVisitasPotencialesCLIENTE_POTENCIAL: TIntegerField;
     xVisitasPotencialesEJERCICIO: TIntegerField;
     xTotSemanaEFECTIVO: TFloatField;
     xTotSemanaTARJETA: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure FrCRMGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     VisitasXDias: integer;
  public
     { Public declarations }
     DCliente, HCliente: integer;
     Fecha, DFecha, HFecha: TDateTime;
     Ruta, Agente, Semana: integer;
     Dia: integer;
     procedure Listar(pAgente, Modo, DC, HC: integer; DF, HF: TDateTime);
     procedure ListarSemana(pAgente, pSemana, pRuta, Modo: integer);
     procedure ListarVisitas(pAgente, pRuta: integer; Fec: TDateTime; Modo, XDias: integer);
  end;

var
  DMLstCRM : TDMLstCRM;

implementation

uses UDMListados, UDMMain, UFormGest, UEntorno;

{$R *.dfm}

procedure TDMLstCRM.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstCRM.DataModuleDestroy(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'DELETE FROM TMP_LST_CRM  WHERE ENTRADA=:ENTRADA';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
  CierraData(DMListados);
end;

procedure TDMLstCRM.FrCRMGetValue(const ParName: string; var ParValue: variant);
var
  fec : TDateTime;
  Q : THYFIBQuery;
begin
  DMListados.GetValue(ParName, ParValue);
  if (ParName = 'DFecha') then
     ParValue := DFecha;
  if (ParName = 'HFecha') then
     ParValue := HFecha;
  if (ParName = 'DCliente') then
     ParValue := DCliente;
  if (ParName = 'HCliente') then
     ParValue := HCliente;
  if (ParName = 'Ruta') then
     ParValue := Ruta;
  if (ParName = 'Agente') then
     ParValue := Agente;
  if (ParName = 'Semana') then
     ParValue := Semana;

  if (VisitasXDias = 0) then
  begin
     if (Copy(ParName, 1, 5) = 'FECHA') and (StrToIntDef(Copy(ParName, 6, 2), 0) > 0) then
     begin
        ParValue := Fecha;
        if ((Dia > 0) and (Dia <= 7)) then
        begin
           while ((DayOfWeek(ParValue) - 1) <> Dia) do
              ParValue := ParValue - 1;
           ParValue := ParValue + (StrToIntDef(Copy(ParName, 6, 2), 0) - 1) * 7;
        end;
     end;
     if (Copy(ParName, 1, 6) = 'VISITA') and (StrToIntDef(Copy(ParName, 7, 2), 0) > 0) then
     begin
        fec := Fecha;
        if ((Dia > 0) and (Dia <= 7)) then
        begin
           while ((DayOfWeek(fec) - 1) <> Dia) do
              fec := fec - 1;
           fec := fec + (StrToIntDef(Copy(ParName, 7, 2), 0) - 1) * 7;
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT COUNT(*) FROM CRM_CABECERA WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CLIENTE=' + IntToStr(xVisitasConFrecCLIENTE.AsInteger) + ' AND TIPO=1 AND FECHA BETWEEN ?DFECHA AND ?HFECHA AND AGENTE=' + IntToStr(Agente) + ' AND CLIENTE_POTENCIAL=0';
              Params.ByName['DFECHA'].AsDateTime := +Trunc(fec);
              Params.ByName['HFECHA'].AsDateTime := +Trunc(fec) + 6.99999;
              ExecQuery;
              if (FieldByName['COUNT'].AsInteger > 0) then
                 ParValue := 'X'
              else
                 ParValue := ' ';
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;
     end;
     if (Copy(ParName, 1, 9) = 'VISITAPOT') and (StrToIntDef(Copy(ParName, 10, 2), 0) > 0) then
     begin
        fec := Fecha;
        if ((Dia > 0) and (Dia <= 7)) then
        begin
           while ((DayOfWeek(fec) - 1) <> Dia) do
              fec := fec - 1;
           fec := fec + (StrToIntDef(Copy(ParName, 10, 2), 0) - 1) * 7;
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT COUNT(*) FROM CRM_CABECERA WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CLIENTE=' + IntToStr(xVisitasPotencialesCLIENTE.AsInteger) + ' AND TIPO=1 AND FECHA BETWEEN ?DFECHA AND ?HFECHA AND AGENTE=' + IntToStr(Agente) + ' AND CLIENTE_POTENCIAL=1';
              Params.ByName['DFECHA'].AsDateTime := +Trunc(fec);
              Params.ByName['HFECHA'].AsDateTime := +Trunc(fec) + 6.99999;
              ExecQuery;
              if (FieldByName['COUNT'].AsInteger > 0) then
                 ParValue := 'X'
              else
                 ParValue := ' ';
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;
     end;
  end
  else
  begin
     if (Copy(ParName, 1, 5) = 'FECHA') and (StrToIntDef(Copy(ParName, 6, 2), 0) > 0) then
        ParValue := Fecha + StrToIntDef(Copy(ParName, 6, 2), 0);

     if (Copy(ParName, 1, 6) = 'VISITA') and (StrToIntDef(Copy(ParName, 7, 2), 0) > 0) then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COUNT(*) FROM CRM_CABECERA WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CLIENTE=' + IntToStr(xVisitasConFrecCLIENTE.AsInteger) + ' AND TIPO=1 AND FECHA BETWEEN ?DFECHA AND ?HFECHA AND AGENTE=' + IntToStr(Agente) + ' AND CLIENTE_POTENCIAL=0';
           Params.ByName['DFECHA'].AsDateTime := +Trunc(Fecha) + StrToIntDef(Copy(ParName, 7, 2), 0);
           Params.ByName['HFECHA'].AsDateTime := +Trunc(Fecha) + StrToIntDef(Copy(ParName, 7, 2), 0) + 0.99999;
           ExecQuery;
           if (FieldByName['COUNT'].AsInteger > 0) then
              ParValue := 'X'
           else
              ParValue := ' ';
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
     if (Copy(ParName, 1, 9) = 'VISITAPOT') and (StrToIntDef(Copy(ParName, 10, 2), 0) > 0) then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COUNT(*) FROM CRM_CABECERA WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CLIENTE=' + IntToStr(xVisitasPotencialesCLIENTE.AsInteger) + ' AND TIPO=1 AND FECHA BETWEEN ?DFECHA AND ?HFECHA AND AGENTE=' + IntToStr(Agente) + ' AND CLIENTE_POTENCIAL=1';
           Params.ByName['DFECHA'].AsDateTime := +Trunc(Fecha) + StrToIntDef(Copy(ParName, 10, 2), 0);
           Params.ByName['HFECHA'].AsDateTime := +Trunc(Fecha) + StrToIntDef(Copy(ParName, 10, 2), 0) + 0.99999;
           ExecQuery;
           if (FieldByName['COUNT'].AsInteger > 0) then
              ParValue := 'X'
           else
              ParValue := ' ';
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMLstCRM.Listar(pAgente, Modo, DC, HC: integer; DF, HF: TDateTime);
var
  str : string;
begin
  DCliente := DC;
  HCliente := HC;
  DFecha := DF;
  HFecha := Trunc(HF) + 0.999999999;
  Agente := pAgente;

  xCliente.DataSource := DSXCRM;
  with xCRM do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['DCLIENTE'].AsInteger := DCliente;
     Params.ByName['HCLIENTE'].AsInteger := HCliente;
     Params.ByName['DFECHA'].AsDateTime := DFecha;
     Params.ByName['HFECHA'].AsDateTime := HFecha;
     Open;
  end;

  xCliente.Close;
  xCliente.Open;

  DMListados.Cargar(5700, '');  // Listado de CRM Kri

  frCRM.LoadFromFIB(REntorno.Formato, str);
  frCRM.PrepareReport;
  case Modo of
     0: frCRM.ShowPreparedReport;
     1: frCRM.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstCRM.ListarSemana(pAgente, pSemana, pRuta, Modo: integer);
var
  str : string;
begin
  Ruta := pRuta;
  Agente := pAgente;
  Semana := pSemana;
  xCliente.DataSource := DSxSemana;
  with xSemana do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['SEMANA'].AsInteger := Semana;
     Params.ByName['RUTA'].AsInteger := Ruta;
     Open;
  end;

  xCliente.Close;
  xCliente.Open;

  with xTotSemana do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['SEMANA'].AsInteger := Semana;
     Params.ByName['RUTA'].AsInteger := Ruta;
     Open;
  end;

  DMListados.Cargar(5701, '');  // Listado de CRM x Semana Kri

  frCRM.LoadFromFIB(REntorno.Formato, str);
  frCRM.PrepareReport;
  case Modo of
     0: frCRM.ShowPreparedReport;
     1: frCRM.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstCRM.ListarVisitas(pAgente, pRuta: integer; Fec: TDateTime; Modo, XDias: integer);
var
  str : string;
  Q : THYFIBQuery;
  i : integer;
begin
  Fecha := fec;
  Ruta := pRuta;
  Agente := pAgente;
  dia := ruta;
  VisitasXDias := XDias;
  {Pasar los datos a listar al temporal}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'DELETE FROM TMP_LST_CRM  WHERE ENTRADA=:ENTRADA';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (VisitasXDias = 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO TMP_LST_CRM ( ' +
           'ENTRADA,EMPRESA,CLIENTE,TITULO,CODIGO_POSTAL,TITULO_LOCALIDAD,FRECUENCIA, ' +
           'VENTAS_2,VENTAS_1,VENTAS,PREVISION_VENTA,RUTA, ' +
           'D01,D02,D03,D04,D05,D06,D07,D08,D09,D10, ' +
           'D11,D12,D13,D14,D15,D16,D17,D18,D19,D20, ' +
           'D21,D22,D23,D24,D25,D26,D27,D28,D29,D30, ' +
           'D31,D32,D33,D34,D35,D36,D37,D38,D39,D40, ' +
           'D41,D42,D43,D44,D45,D46,D47,D48,D49,D50, ' +
           'D51,D52,D53,D54,D55,CLIENTE_POTENCIAL,EJERCICIO) ' +
           'SELECT ' +
           ':ENTRADA,EMPRESA,CLIENTE,TITULO,CODIGO_POSTAL,TITULO_LOCALIDAD,FRECUENCIA, ' +
           'VENTAS_2,VENTAS_1,VENTAS,PREVISION_VENTA,RUTA, ' +
           'D01,D02,D03,D04,D05,D06,D07,D08,D09,D10, ' +
           'D11,D12,D13,D14,D15,D16,D17,D18,D19,D20, ' +
           'D21,D22,D23,D24,D25,D26,D27,D28,D29,D30, ' +
           'D31,D32,D33,D34,D35,D36,D37,D38,D39,D40, ' +
           'D41,D42,D43,D44,D45,D46,D47,D48,D49,D50, ' +
           'D51,D52,D53,D54,D55,CLIENTE_POTENCIAL,EJERCICIO ' +
           'FROM CRM_VISITAS WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND AGENTE=:AGENTE AND RUTA=:RUTA ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['AGENTE'].AsInteger := Agente;
        Params.ByName['RUTA'].AsInteger := Ruta;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);

     for i := 1 to WeekOf(fec) - 1 do
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE TMP_LST_CRM SET ' +
              'D01=D02,D02=D03,D03=D04,D04=D05,D05=D06,D06=D07,D07=D08,D08=D09,D09=D10,D10=D11,' +
              'D11=D12,D12=D13,D13=D14,D14=D15,D15=D16,D16=D17,D17=D18,D18=D19,D19=D20,D20=D21,' +
              'D21=D22,D22=D23,D23=D24,D24=D25,D25=D26,D26=D27,D27=D28,D28=D29,D29=D30,D30=D31,' +
              'D31=D32,D32=D33,D33=D34,D34=D35,D35=D36,D36=D37,D37=D38,D38=D39,D39=D40,D40=D41,' +
              'D41=D42,D42=D43,D43=D44,D44=D45,D45=D46,D46=D47,D47=D48,D48=D49,D49=D50,D50=D51,' +
              'D51=D52,D52=D53,D53=D54,D54=D55,D55=0' +
              'WHERE ENTRADA=:ENTRADA AND RUTA=:RUTA ';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['RUTA'].AsInteger := Ruta;
           ExecQuery;
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
  end
  else
  begin
     {primero inserto todos los clientes de la agente/ruta}
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO TMP_LST_CRM ( ' +
           'ENTRADA,EMPRESA,CLIENTE,TITULO,CODIGO_POSTAL,TITULO_LOCALIDAD,FRECUENCIA, ' +
           'VENTAS_2,VENTAS_1,VENTAS,PREVISION_VENTA,RUTA, ' +
           'D01,D02,D03,D04,D05,D06,D07,D08,D09,D10, ' +
           'D11,D12,D13,D14,D15,D16,D17,D18,D19,D20, ' +
           'D21,D22,D23,D24,D25,D26,D27,D28,D29,D30, ' +
           'D31,D32,D33,D34,D35,D36,D37,D38,D39,D40, ' +
           'D41,D42,D43,D44,D45,D46,D47,D48,D49,D50, ' +
           'D51,D52,D53,D54,D55,CLIENTE_POTENCIAL,EJERCICIO) ' +
           'SELECT ' +
           ':ENTRADA,EMPRESA,CLIENTE,TITULO,CODIGO_POSTAL,TITULO_LOCALIDAD,FRECUENCIA, ' +
           'VENTAS_2,VENTAS_1,VENTAS,PREVISION_VENTA,RUTA, ' +
           '0,0,0,0,0,0,0,0,0,0, ' +
           '0,0,0,0,0,0,0,0,0,0, ' +
           '0,0,0,0,0,0,0,0,0,0, ' +
           '0,0,0,0,0,0,0,0,0,0, ' +
           '0,0,0,0,0,0,0,0,0,0, ' +
           '0,0,0,0,0,CLIENTE_POTENCIAL,EJERCICIO ' +
           'FROM CRM_VISITAS WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND AGENTE=:AGENTE AND RUTA=:RUTA ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['AGENTE'].AsInteger := Agente;
        Params.ByName['RUTA'].AsInteger := Ruta;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);

     {luego marco los días que tiene visita}
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_LST_CRM SET ' +
           'D01=:D01,D02=:D02,D03=:D03,D04=:D04,D05=:D05,D06=:D06,D07=:D07,D08=:D08,D09=:D09,D10=:D10,' +
           'D11=:D11,D12=:D12,D13=:D13,D14=:D14,D15=:D15,D16=:D16,D17=:D17,D18=:D18,D19=:D19,D20=:D20,' +
           'D21=:D21,D22=:D22,D23=:D23,D24=:D24,D25=:D25,D26=:D26,D27=:D27,D28=:D28,D29=:D29,D30=:D30,' +
           'D31=:D31,D32=:D32,D33=:D33,D34=:D34,D35=:D35,D36=:D36,D37=:D37,D38=:D38,D39=:D39,D40=:D40,' +
           'D41=:D41,D42=:D42,D43=:D43,D44=:D44,D45=:D45,D46=:D46,D47=:D47,D48=:D48,D49=:D49,D50=:D50,' +
           'D51=:D51,D52=:D52,D53=:D53,D54=:D54,D55=:D55 ' +
           'WHERE ENTRADA=:ENTRADA AND RUTA=:RUTA ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['RUTA'].AsInteger := Ruta;
        for i := 0 to Params.Count - 1 do
        begin
           if (Copy(Params[i].Name, 1, 1) = 'D') then
              if (DayOfWeek(fec + StrToInt(Copy(Params[i].Name, 2, 2)) - 1) = Ruta) then
                 Params[i].AsInteger := 1
              else
                 Params[i].AsInteger := 0;
        end;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;

  with xVisitasConFrec do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['RUTA'].AsInteger := Ruta;
     Open;
  end;

  with xVisitasSinFrec do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['RUTA'].AsInteger := Ruta;
     Open;
  end;

  with xVisitasPotenciales do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['RUTA'].AsInteger := Ruta;
     Open;
  end;

  DMListados.Cargar(5702, '');  // Listado de CRM x Semana Kri

  frCRM.LoadFromFIB(REntorno.Formato, str);
  frCRM.PrepareReport;
  case Modo of
     0: frCRM.ShowPreparedReport;
     1: frCRM.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

end.
