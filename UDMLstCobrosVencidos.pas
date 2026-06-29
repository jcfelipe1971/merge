unit UDMLstCobrosVencidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, HYFIBQuery, DB,
  FIBDataSet, FIBDataSetRO, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  frxClass, frxHYReport, FIBDataSetRW;

type
  TDMLstCobrosVencidos = class(TDataModule)
     TLocal: THYTransaction;
     DSxListado: TDataSource;
     frCobros: TfrHYReport;
     frDBxListado: TfrDBDataSet;
     frxCobros: TfrxHYReport;
     TUpdate: THYTransaction;
     xListado: TFIBDataSetRO;
     xListadoENTRADA: TIntegerField;
     xListadoEMPRESALST: TIntegerField;
     xListadoEJERCICIOLST: TIntegerField;
     xListadoCANALLST: TIntegerField;
     xListadoSIGNOLST: TFIBStringField;
     xListadoREGISTRO: TIntegerField;
     xListadoLINEA: TIntegerField;
     xListadoCOD_CLI_PRO: TIntegerField;
     xListadoVENCIMIENTO: TDateTimeField;
     xListadoCTA_PAGO: TFIBStringField;
     xListadoLIQUIDO: TFloatField;
     xListadoLIQUIDO_CANAL: TFloatField;
     xListadoPAGADO: TIntegerField;
     xListadoIMPAGADO: TIntegerField;
     xListadoFORMA_PAGO: TFIBStringField;
     xListadoTIT_FORMA_PAGO: TFIBStringField;
     xListadoTIPO_EFECTO: TFIBStringField;
     xListadoREMESAR: TIntegerField;
     xListadoESTADO: TIntegerField;
     xListadoREMESA: TIntegerField;
     xListadoESTADO_RECIBO: TFIBStringField;
     xListadoRECIBIDO: TIntegerField;
     xListadoFECHA_REGISTRO: TDateTimeField;
     xListadoACEPTAR: TIntegerField;
     xListadoVENCIMIENTO_30: TFloatField;
     xListadoVENCIMIENTO_60: TFloatField;
     xListadoVENCIMIENTO_90: TFloatField;
     xListadoVENCIMIENTO_120: TFloatField;
     xListadoVENCIMIENTO_121: TFloatField;
     xListadoMONEDA_LISTADO: TFIBStringField;
     xListadoDOC_FECHA: TDateTimeField;
     xListadoDOC_NUMERO: TIntegerField;
     xListadoDOC_SERIE: TFIBStringField;
     xListadoRIC: TIntegerField;
     xListadoRIVA: TIntegerField;
     xListadoFECHA_CIERR: TDateTimeField;
     xListadoDOC_TIPO: TFIBStringField;
     xListadoN_COMERCIAL: TFIBStringField;
     xListadoR_SOCIAL: TFIBStringField;
     xListadoTELEFONO01: TFIBStringField;
     xListadoDIR_COMPLETA: TFIBStringField;
     xListadoNO_VENCIDO: TFloatField;
     xListadoPROV_ACR: TIntegerField;
     xListadoNO_VENCIDO_CANAL: TFloatField;
     xListadoVTO_30_CANAL: TFloatField;
     xListadoVTO_60_CANAL: TFloatField;
     xListadoVTO_90_CANAL: TFloatField;
     xListadoVTO_120_CANAL: TFloatField;
     xListadoVTO_121_CANAL: TFloatField;
     xListadoMOROSO: TIntegerField;
     xListadoSALDO: TFloatField;
     xListadoSALDO_DEUDOR: TFloatField;
     xListadoSALDO_ACREEDOR: TFloatField;
     xListadoTOT_VENCIMIENTO: TFloatField;
     xListadoTOT_VENCIMIENTO_CANAL: TFloatField;
     xListadoCUENTA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frCobrosGetValue(const ParName: string; var ParValue: variant);
     procedure frCobrosEnterRect(Memo: TStringList; View: TfrView);
     procedure frxCobrosBeforePrint(Sender: TfrxReportComponent);
     procedure frxCobrosGetValue(const VarName: string; var Value: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     ComentarioLst, MonedaACalc: string;
     ConMonedaCliente: integer;
     FechaListado: TDateTime;
  public
     { Public declarations }
     ClienteProveedor: integer;
     function DameMaxMinVTO(Modo, DesdeHasta: byte): TDateTime;
     function DameMinCliProAge(Modo: integer): integer;
     procedure MostrarListado(FechaDesde, FechaHasta, FechaCalculo, FechaLst: TDateTime; MonedaCli, TipoListado, TipoProAcr, CliDesde, CliHasta, ProvDesde, ProvHasta, AcrDesde, AcrHasta: integer; MonedaListado, Comentario, FormaPago: string; Modo, FiltrarFP: byte; SerieKri, Zona: string; Orden, Canal: integer);
     function DameSentenciaSQL(TipoListado, TipoProAcr, MonedaCli, FiltrarFP: integer; CliDesde, CliHasta, ProvDesde, ProvHasta, AcrDesde, AcrHasta, MonedaListado, FormaPago: string; FechaDesde, FechaHasta, FechaCalculo: TDateTime; SerieKri: string; Orden, Canal: integer): string;
     function DameMinFP: string;
  end;

var
  DMLstCobrosVencidos : TDMLstCobrosVencidos;

implementation

uses UDMMain, UEntorno, UDMListados, UUtiles;

{$R *.dfm}

procedure TDMLstCobrosVencidos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMLstCobrosVencidos.DataModuleDestroy(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_COBROS_VENCIDOS WHERE ENTRADA=' + REntorno.EntradaStr;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstCobrosVencidos.DameMinCliProAge(Modo: integer): integer;
begin
  // Result := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Close;
        case Modo of
           0: SQL.Text := 'SELECT MIN(COD_CLI_PRO) AS COD_CLI_PRO FROM VER_CARTERA ' +
                 'WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND SIGNO=''C'' AND (DOC_TIPO =''FAC'' OR DOC_TIPO =''AGC'' OR DOC_TIPO = ''NRC'' OR DOC_TIPO=''AFC'')';
           1: SQL.Text := 'SELECT MAX(COD_CLI_PRO) AS COD_CLI_PRO FROM VER_CARTERA ' +
                 'WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND SIGNO=''C'' AND (DOC_TIPO =''FAC'' OR DOC_TIPO =''AGC'' OR DOC_TIPO = ''NRC'' OR DOC_TIPO=''AFC'')';
           2: SQL.Text := 'SELECT MIN(COD_CLI_PRO) AS COD_CLI_PRO FROM VER_CARTERA ' +
                 'WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND SIGNO=''P'' AND (DOC_TIPO =''FAP'' OR DOC_TIPO=''AGP'' OR DOC_TIPO =''NRP'' OR DOC_TIPO=''AFP'')';
           3: SQL.Text := 'SELECT MAX(COD_CLI_PRO) AS COD_CLI_PRO FROM VER_CARTERA ' +
                 'WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND SIGNO=''P'' AND (DOC_TIPO =''FAP'' OR DOC_TIPO=''AGP'' OR DOC_TIPO =''NRP'' OR DOC_TIPO=''AFP'')';
           4: SQL.Text := 'SELECT MIN(COD_CLI_PRO) AS COD_CLI_PRO FROM VER_CARTERA ' +
                 'WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND SIGNO=''P'' AND (DOC_TIPO =''FCR'' OR DOC_TIPO=''AGA'' OR DOC_TIPO =''NRA'' OR DOC_TIPO = ''AFA'')';
           5: SQL.Text := 'SELECT MAX(COD_CLI_PRO) AS COD_CLI_PRO FROM VER_CARTERA ' +
                 'WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND SIGNO=''P'' AND (DOC_TIPO =''FCR'' OR DOC_TIPO=''AGA'' OR DOC_TIPO =''NRA'' OR DOC_TIPO = ''AFA'')';
        end;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['COD_CLI_PRO'].AsInteger;
     finally
        Free;
     end;
  end;
end;

function TDMLstCobrosVencidos.DameMaxMinVTO(Modo, DesdeHasta: byte): TDateTime;
var
  tipo_doc, tipo_doc2, tipo_doc3, tipo_doc4, signo : string;
begin
  if (Modo = 0) then
  begin
     Signo := 'C';
     tipo_doc := 'FAC';
     tipo_doc2 := 'AGC';
     tipo_doc3 := 'NRC';
     tipo_doc4 := 'AFC';
  end
  else
  begin
     Signo := 'P';
     tipo_doc := 'FAP';
     tipo_doc2 := 'AGP';
     tipo_doc3 := 'NRP';
     tipo_doc4 := 'AFP';
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Close;
        case DesdeHasta of
           0: SQL.Text := 'SELECT MIN(DET.VENCIMIENTO) AS FECHA FROM EMP_CARTERA_DETALLE DET ' +
                 'JOIN EMP_CARTERA CAR ON (DET.ID_CARTERA=CAR.ID_CARTERA) ' +
                 'WHERE DET.EMPRESA=?EMPRESA AND DET.CANAL=?CANAL AND DET.SIGNO=?SIGNO AND ' +
                 '(CAR.DOC_TIPO =?TIPO_DOC OR CAR.DOC_TIPO =?TIPO_DOC2 OR CAR.DOC_TIPO = ' +
                 '?TIPO_DOC3 OR CAR.DOC_TIPO=?TIPO_DOC4) AND CAR.PAGADO = 0';

           1: SQL.Text := 'SELECT MAX(DET.VENCIMIENTO) AS FECHA FROM EMP_CARTERA_DETALLE DET ' +
                 'JOIN EMP_CARTERA CAR ON (DET.ID_CARTERA=CAR.ID_CARTERA) ' +
                 'WHERE DET.EMPRESA=?EMPRESA AND DET.CANAL=?CANAL AND DET.SIGNO=?SIGNO AND ' +
                 '(CAR.DOC_TIPO =?TIPO_DOC OR CAR.DOC_TIPO=?TIPO_DOC2 OR CAR.DOC_TIPO =?TIPO_DOC3 ' +
                 'OR CAR.DOC_TIPO=?TIPO_DOC4) AND CAR.PAGADO = 0';
        end;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := Signo;
        Params.ByName['TIPO_DOC'].AsString := Tipo_Doc;
        Params.ByName['TIPO_DOC2'].AsString := Tipo_Doc2;
        Params.ByName['TIPO_DOC3'].AsString := Tipo_Doc3;
        Params.ByName['TIPO_DOC4'].AsString := Tipo_Doc4;
        ExecQuery;
        Result := FieldByName['FECHA'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstCobrosVencidos.MostrarListado(FechaDesde, FechaHasta, FechaCalculo, FechaLst: TDateTime; MonedaCli, TipoListado, TipoProAcr, CliDesde, CliHasta, ProvDesde, ProvHasta, AcrDesde, AcrHasta: integer; MonedaListado, Comentario, FormaPago: string; Modo, FiltrarFP: byte; SerieKri, Zona: string; Orden, Canal: integer);
var
  str : string;
begin
  ComentarioLst := Comentario;
  ConMonedaCliente := MonedaCli;
  MonedaACalc := MonedaListado;
  FechaListado := Trunc(FechaLst);
  str := '';
  // Normalizamos los parametros.
  DMListados.Normalizar_Desde_Hasta(FechaDesde, FechaHasta);
  DMListados.Normalizar_Desde_Hasta(CliDesde, CliHasta);
  DMListados.Normalizar_Desde_Hasta(ProvDesde, ProvHasta);
  DMListados.Normalizar_Desde_Hasta(AcrDesde, AcrHasta);
  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');

  // Calculo el listado que guarda los datos en TMP_COBROS_VENCIDOS
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := DameSentenciaSQL(TipoListado, TipoProAcr, MonedaCli, FiltrarFP, IntToStr(CliDesde), IntToStr(CliHasta), IntToStr(ProvDesde), IntToStr(ProvHasta), IntToStr(AcrDesde), IntToStr(AcrHasta),
           MonedaListado, FormaPago, FechaDesde, FechaHasta, FechaCalculo, SerieKri, Orden, Canal);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Quito los registros que no pertenecen a las series seleccionadas
  if (SerieKri > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM TMP_COBROS_VENCIDOS WHERE ENTRADA=' + REntorno.EntradaStr + ' AND NOT ' + SerieKri;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Quito los registros que no pertenecen a la zona seleccionada
  if (Trim(Zona) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM TMP_COBROS_VENCIDOS WHERE ENTRADA=' + REntorno.EntradaStr + ' AND ZONA <> ''' + Zona + '''';
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Relleno totales y saldos contables
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE LST_COBROS_VENCIDOS_RELLENA (' + REntorno.EntradaStr + ')';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // El procedimiento genera ademas una tabla temporal que utilizo luego para poder ordenar por otros campos
  with xListado do
  begin
     Close;

     SelectSQL.Text := 'SELECT * FROM TMP_COBROS_VENCIDOS WHERE ENTRADA=' + REntorno.EntradaStr;

     if (FiltrarFP = 1) then
        SelectSQL.Text := SelectSQL.Text + ' and FORMA_PAGO =''' + FormaPago + '''';

     if (Length(SerieKri) > 1) then
        SelectSQL.Text := SelectSQL.Text + ' AND ' + SerieKri;

     case Orden of
        0: SelectSQL.Text := SelectSQL.Text + ' ORDER BY PROV_ACR,COD_CLI_PRO,DOC_NUMERO,VENCIMIENTO';
        1: SelectSQL.Text := SelectSQL.Text + ' ORDER BY PROV_ACR,N_COMERCIAL,COD_CLI_PRO,DOC_NUMERO,VENCIMIENTO';
        2: SelectSQL.Text := SelectSQL.Text + ' ORDER BY PROV_ACR,TOT_VENCIMIENTO DESC,COD_CLI_PRO,DOC_NUMERO,VENCIMIENTO';
        3: SelectSQL.Text := SelectSQL.Text + ' ORDER BY PROV_ACR,TOT_VENCIMIENTO DESC,N_COMERCIAL,COD_CLI_PRO,DOC_NUMERO,VENCIMIENTO';
        4: SelectSQL.Text := SelectSQL.Text + ' ORDER BY COD_CLI_PRO, DOC_FECHA';
        else
           SelectSQL.Text := SelectSQL.Text + ' ORDER BY PROV_ACR,COD_CLI_PRO,DOC_NUMERO,VENCIMIENTO';
     end;
     Open;
  end;

  DMListados.Cargar(513, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frCobros.LoadFromFIB(REntorno.Formato, str);
     frCobros.PrepareReport;
     case Modo of
        0: frCobros.ShowPreparedReport;
        1: frCobros.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxCobros.LoadFromFIB(REntorno.Formato, str);
     frxCobros.PrepareReport;
     case Modo of
        0: frxCobros.ShowPreparedReport;
        1: frxCobros.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

function TDMLstCobrosVencidos.DameSentenciaSQL(TipoListado, TipoProAcr, MonedaCli, FiltrarFP: integer; CliDesde, CliHasta, ProvDesde, ProvHasta, AcrDesde, AcrHasta, MonedaListado, FormaPago: string; FechaDesde, FechaHasta, FechaCalculo: TDateTime; SerieKri: string; Orden, Canal: integer): string;
begin
  Result := '';
  case TipoListado of
     0: Result := 'EXECUTE PROCEDURE LST_COBROS_VENCIDOS(' + REntorno.EmpresaStr + ',' + IntToStr(Canal) + ',''' + REntorno.Moneda + ''',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaDesde) + ''',' +
           '''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaHasta) + ''',''C'',' + CliDesde + ',' + CliHasta + ',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaCalculo) + ''',' +
           '''' + MonedaListado + ''',' + IntToStr(MonedaCli) + ',''FAC'',''AGC'',''NRC'',''AFC'',0,NULL,NULL,NULL,NULL,NULL,NULL,' + REntorno.EntradaStr + ')';
     1:
     begin
        case TipoProAcr of
           0: Result := 'EXECUTE PROCEDURE LST_COBROS_VENCIDOS(' + REntorno.EmpresaStr + ',' + IntToStr(Canal) + ',''' + REntorno.Moneda + ''',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaDesde) +
                 ''',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaHasta) + ''',''P'',' + ProvDesde + ',' + ProvHasta + ',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaCalculo) + ''',' +
                 '''' + MonedaListado + ''',' + IntToStr(MonedaCli) + ',''FAP'',''AGP'',''NRP'',''AFP'',0,NULL,NULL,NULL,NULL,NULL,NULL,' + REntorno.EntradaStr + ')';
           1: Result := 'EXECUTE PROCEDURE LST_COBROS_VENCIDOS(' + REntorno.EmpresaStr + ',' + REntorno.CanalStr + ',''' + REntorno.Moneda + ''',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaDesde) + ''',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaHasta) + ''',''P'',' + AcrDesde + ',' + AcrHasta + ',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaCalculo) + ''',' +
                 '''' + MonedaListado + ''',' + IntToStr(MonedaCli) + ',''FCR'',''AGA'',''NRA'',''AFA'',0,NULL,NULL,NULL,NULL,NULL,NULL,' + REntorno.EntradaStr + ')';
           2: Result := 'EXECUTE PROCEDURE LST_COBROS_VENCIDOS(' + REntorno.EmpresaStr + ',' + REntorno.CanalStr + ',''' + REntorno.Moneda + ''',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaDesde) + ''',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaHasta) + ''',''P'',' + ProvDesde + ',' + ProvHasta + ',''' + FormatDateTime('yyyy.mm.dd hh:mm:ss', FechaCalculo) + ''',' +
                 '''' + MonedaListado + ''',' + IntToStr(MonedaCli) + ',''FAP'',''AGP'',''NRP'',''AFP'',1,' + AcrDesde + ',' + AcrHasta + ',''FCR'',''AGA'',''NRA'',''AFA'',' + REntorno.EntradaStr + ')';
        end;
     end;
  end;
  {dji lrk kri - Utilizo la tabla temporal, por lo que no me interesa filtrar la salida del SP
  if (FiltrarFP=1) then
    result := result + ' where FORMA_PAGO ='''+FormaPago+'''';

  if (Length(SerieKri)>1) then
     if (pos('WHERE',UpperCase(result))>0) then
        result := result + ' AND '+SerieKri
     else
        result := result + ' WHERE '+SerieKri;
  }
  {dji lrk kri - Utilizo la tabla temporal, por lo que no me interesa ordenar la salida del SP
  Case Orden of
     0: result := result + ' order by prov_acr,cod_cli_pro,doc_numero,vencimiento';
     1: result := result + ' order by prov_acr,n_comercial,cod_cli_pro,doc_numero,vencimiento';
  end;
  }
end;

procedure TDMLstCobrosVencidos.frCobrosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'CLIENTE_PROV_ACR' then
  begin
     case ClienteProveedor of
        0: ParValue := _('Cliente');
        1:
        begin
           if (xListadoPROV_ACR.AsInteger = 0) then
              ParValue := _('Proveedor')
           else
              ParValue := _('Acreedor');
        end;
     end;
  end;
  if ParName = 'ProvAcr' then
  begin
     case ClienteProveedor of
        0: ParValue := 0;
        1: ParValue := 1;
     end;
  end;
  if ParName = 'ComentarioLst' then
     ParValue := ComentarioLst;

  if ParName = 'MonedaEntidad' then
     ParValue := ConMonedaCliente;
  if ParName = 'MonedaCanal' then
  begin
     if (ConMonedaCliente = 1) then
        ParValue := REntorno.Moneda
     else
        ParValue := MonedaACalc;
  end;
  if ParName = 'Fecha' then
     ParValue := FechaListado;
  if ParName = 'SuReferencia' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SU_REFERENCIA FROM ');
           if (xListadoDOC_TIPO.AsString = 'FAC') then
              SQL.Add(' GES_CABECERAS_S ')
           else
              SQL.Add(' GES_CABECERAS_E ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA=?EMPRESA AND ');
           SQL.Add(' EJERCICIO=?EJERCICIO AND ');
           SQL.Add(' CANAL=?CANAL AND ');
           SQL.Add(' SERIE=?SERIE AND ');
           SQL.Add(' TIPO=?TIPO AND ');
           SQL.Add(' RIG=?RIG ');
           Params.ByName['EMPRESA'].AsInteger := xListadoEMPRESALST.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xListadoEJERCICIOLST.AsInteger;
           Params.ByName['CANAL'].AsInteger := xListadoCANALLST.AsInteger;
           Params.ByName['SERIE'].AsString := xListadoDOC_SERIE.AsString;
           Params.ByName['TIPO'].AsString := xListadoDOC_TIPO.AsString;
           Params.ByName['RIG'].AsInteger := xListadoDOC_NUMERO.AsInteger;
           ExecQuery;
           ParValue := FieldByName['SU_REFERENCIA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMLstCobrosVencidos.frCobrosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

function TDMLstCobrosVencidos.DameMinFP: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(FORMA) AS MINIMO FROM VER_FORMAS_PAGO_EMP WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['MINIMO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstCobrosVencidos.frxCobrosBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstCobrosVencidos.frxCobrosGetValue(const VarName: string; var Value: variant);
begin
  frCobrosGetValue(VarName, Value);
end;

end.
