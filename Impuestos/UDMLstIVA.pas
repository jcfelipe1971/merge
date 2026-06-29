unit UDMLSTIva;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBTableDataSet, DBTables,
  Fr_HYReport, FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO,
  HYFIBQuery, frxClass, frxHYReport, FIBDataSetRW;

type
  TDMLstIva = class(TDataModule)
     frIVARepercutido: TfrHYReport;
     DSSPListaIVA: TDataSource;
     frDSSPListaIVA: TfrDBDataSet;
     QMTotales: TFIBDataSetRO;
     DSTotales: TDataSource;
     frDSQTotales: TfrDBDataSet;
     xTipoIva: TFIBDataSetRO;
     xModoIva: TFIBDataSetRO;
     TLocal: THYTransaction;
     xCompruebaIvaRep: TFIBDataSetRO;
     DSxCompruebaIvaRep: TDataSource;
     frDBxCompruebaIvaRep: TfrDBDataSet;
     frCompruebaIva: TfrHYReport;
     DSSPListadoIVARec: TDataSource;
     frDBDSDSSPListadoIVARec: TfrDBDataSet;
     frxIVARepercutido: TfrxHYReport;
     TUpdate: THYTransaction;
     SPListadoIVA: TFIBDataSetRO;
     SPListadoIVARec: TFIBDataSetRO;
     xDatosDUA: TFIBDataSetRO;
     DSxDatosDUA: TDataSource;
     frDBDxDatosDUA: TfrDBDataSet;
     xProveedorDUA: TFIBDataSetRO;
     DSxProveedorDUA: TDataSource;
     xDatosFacturaProvDUA: TFIBDataSetRO;
     DSxDatosFacturaProvDUA: TDataSource;
     DSSPListadoIVANeg: TDataSource;
     frDSSPListaIVANeg: TfrDBDataSet;
     SPListadoIVANeg: TFIBDataSetRO;
     QMTotalesNeg: TFIBDataSetRO;
     DSTotalesNeg: TDataSource;
     frDSTotalesNeg: TfrDBDataSet;
     procedure frIVARepercutidoGetValue(const ParName: string; var ParValue: variant);
     procedure frIVARepercutidoEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLSTIvaCreate(Sender: TObject);
     procedure DMLSTIvaDestroy(Sender: TObject);
     procedure frCompruebaIvaBeforePrint(Memo: TStringList; View: TfrView);
     procedure frCompruebaIvaGetValue(const ParName: string; var ParValue: variant);
     procedure frxIVARepercutidoBeforePrint(Sender: TfrxReportComponent);
     procedure frxIVARepercutidoGetValue(const VarName: string; var Value: variant);
     procedure xDatosDUAAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     TituloSigno: string;
     Signo: string;
     MostrarTotal: integer;
     FechaDesde, FechaHasta: TDateTime;
  public
     { Public declarations }
     procedure MostrarListado(aFechaDesde, aFechaHasta: TDateTime; RegDesde, RegHasta: integer; aSigno: string; Orden: integer; Filtro, MostrarTot: boolean; Modo: integer; SepararNegativo: boolean);
     procedure DameFechas(Signo: string; var aFechaDesde, aFechaHasta: TDateTime);
     procedure DameRegistros(Signo: string; var MinReg, MaxReg: integer);
     procedure CompruebaIVA(ini, fin: TDateTime);
  end;

var
  DMLstIva : TDMLstIva;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles;

{$R *.DFM}

procedure TDMLstIva.DMLSTIvaCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstIva.DMLSTIvaDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstIva.MostrarListado(aFechaDesde, aFechaHasta: TDateTime; RegDesde, RegHasta: integer; aSigno: string; Orden: integer; Filtro, MostrarTot: boolean; Modo: integer; SepararNegativo: boolean);
begin
  // Normalizar fechas Desde-Hasta
  DMListados.Normalizar_Desde_Hasta(FechaDesde, FechaHasta);

  MostrarTotal := BoolToInt(MostrarTot);

  FechaDesde := Trunc(aFechaDesde);
  FechaHasta := Trunc(aFechaHasta);
  Signo := aSigno;
  if Signo = 'R' then
     TituloSigno := _('Repercutido')
  else
     TituloSigno := _('Soportado');

  with SPListadoIva do
  begin
     Close;
     UniDirectional := DMMain.EstadoKri(215) = 0; {NCO lo quiere bidireccional, Iris lo quiere uni (muy largo)}
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM CREA_LISTADO_IVA ');
     SelectSQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?FECHA_INI, ?FECHA_FIN, ?RIG_INI, ?RIG_FIN, ?FILTRO) ');
     SelectSQL.Add(' WHERE  ');
     SelectSQL.Add(' ((ID_RECT = 0) OR (RECT = 1))');

     if SepararNegativo then
        SelectSQL.Add(' AND LIQUIDO_TOTAL >= 0 ');

     if (Orden = 0) then
        if (Signo = 'R') then
           SelectSQL.Add(' ORDER BY DOC_FECHA, DOC_SERIE, DOC_NUMERO, P_IVA')
        else
           SelectSQL.Add(' ORDER BY FECHA_REGISTRO, DOC_SERIE, DOC_NUMERO, P_IVA')
     else if (Orden = 1) then
        SelectSQL.Add(' ORDER BY RIG_VISIBLE, P_IVA')
     else if (Orden = 2) then
        SelectSQL.Add(' ORDER BY TITULO, DOC_SERIE, DOC_NUMERO, P_IVA');
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['RIG_INI'].AsInteger := RegDesde;
     Params.ByName['RIG_FIN'].AsInteger := RegHasta;
     Params.ByName['FILTRO'].AsInteger := BoolToInt(not Filtro);
     Open;
  end;

  with SPListadoIvaNeg do
  begin
     Close;
     UniDirectional := DMMain.EstadoKri(215) = 0; {NCO lo quiere bidireccional, Iris lo quiere uni (muy largo)}
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM CREA_LISTADO_IVA ');
     SelectSQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?FECHA_INI, ?FECHA_FIN, ?RIG_INI, ?RIG_FIN, ?FILTRO) ');
     SelectSQL.Add(' WHERE  ');
     SelectSQL.Add(' ((ID_RECT = 0) OR (RECT = 1))');
     SelectSQL.Add(' AND LIQUIDO_TOTAL < 0 ');
     if (Orden = 0) then
        if (Signo = 'R') then
           SelectSQL.Add(' ORDER BY DOC_FECHA, DOC_SERIE, DOC_NUMERO, P_IVA')
        else
           SelectSQL.Add(' ORDER BY FECHA_REGISTRO, DOC_SERIE, DOC_NUMERO, P_IVA')
     else if (Orden = 1) then
        SelectSQL.Add(' ORDER BY RIG_VISIBLE, P_IVA')
     else if (Orden = 2) then
        SelectSQL.Add(' ORDER BY TITULO, DOC_SERIE, DOC_NUMERO, P_IVA');
     Close;

     // Evito que devuelva datos
     if SepararNegativo then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['RIG_INI'].AsInteger := RegDesde;
     Params.ByName['RIG_FIN'].AsInteger := RegHasta;
     Params.ByName['FILTRO'].AsInteger := BoolToInt(not Filtro);
     Open;
  end;

  // Facturas de rectificacion
  // if (Signo = 'R') then
  // begin
  with SPListadoIvaRec do
  begin
     Close;
     UniDirectional := DMMain.EstadoKri(215) = 0; {NCO lo quiere bidireccional, Iris lo quiere uni (muy largo)}
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM CREA_LISTADO_IVA_REC ');
     SelectSQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?FECHA_INI, ?FECHA_FIN, ?RIG_INI, ?RIG_FIN, ?FILTRO) ');
     if (Orden = 0) then
        if (Signo = 'R') then
           SelectSQL.Add(' ORDER BY DOC_FECHA, DOC_SERIE, DOC_NUMERO, P_IVA')
        else
           SelectSQL.Add(' ORDER BY FECHA_REGISTRO, DOC_SERIE, DOC_NUMERO, P_IVA')
     else if (Orden = 1) then
        SelectSQL.Add(' ORDER BY RIG_VISIBLE, P_IVA')
     else if (Orden = 2) then
        SelectSQL.Add(' ORDER BY TITULO, DOC_SERIE, DOC_NUMERO, P_IVA');
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['RIG_INI'].AsInteger := RegDesde;
     Params.ByName['RIG_FIN'].AsInteger := RegHasta;
     Params.ByName['FILTRO'].AsInteger := BoolToInt(not Filtro);
     Open;
  end;
  //end;

  with QMTotales do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT SUM(B_IMPONIBLE), SUM(I_IVA), SUM(I_REC), SUM(RETENCION), P_IVA, P_REC, MODO, TIPO_IVA, ADQUISICION, INVERSION_SUJETO_PASIVO, CAST('''' AS VARCHAR(20)) TIPO ');
     SelectSQL.Add(' FROM CREA_LISTADO_IVA(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO, :FECHA_INI, :FECHA_FIN, :RIG_INI, :RIG_FIN, :FILTRO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ((ID_RECT = 0) OR (RECT = 1))');

     if (Signo = 'R') then
        SelectSQL.Add(' AND RIC <> 0 ');

     if SepararNegativo then
        SelectSQL.Add(' AND LIQUIDO_TOTAL >= 0 ');
     SelectSQL.Add(' GROUP BY TIPO_IVA, MODO, P_IVA, P_REC, INVERSION_SUJETO_PASIVO, ADQUISICION ');

     if (Signo = 'R') then
     begin
        SelectSQL.Add(' UNION ALL ');
        SelectSQL.Add(' SELECT SUM(B_IMPONIBLE), SUM(I_IVA), SUM(I_REC), SUM(RETENCION), P_IVA, P_REC, MODO, TIPO_IVA, ADQUISICION, INVERSION_SUJETO_PASIVO, CAST(''Autofactura'' AS VARCHAR(20)) TIPO ');
        SelectSQL.Add(' FROM CREA_LISTADO_IVA(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO, :FECHA_INI, :FECHA_FIN, :RIG_INI, :RIG_FIN, :FILTRO) ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ((ID_RECT = 0) OR (RECT = 1))');
        SelectSQL.Add(' AND RIC = 0 ');
        if SepararNegativo then
           SelectSQL.Add(' AND LIQUIDO_TOTAL >= 0 ');
        SelectSQL.Add(' GROUP BY TIPO_IVA, MODO, P_IVA, P_REC, INVERSION_SUJETO_PASIVO, ADQUISICION ');
     end;

     SelectSQL.Add(' ORDER BY 6, 7, 8, 9 ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['RIG_INI'].AsInteger := RegDesde;
     Params.ByName['RIG_FIN'].AsInteger := RegHasta;
     Params.ByName['FILTRO'].AsInteger := BoolToInt(not Filtro);
     Open;
  end;

  with QMTotalesNeg do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT SUM(B_IMPONIBLE), SUM(I_IVA), SUM(I_REC), SUM(RETENCION), P_IVA, P_REC, MODO, TIPO_IVA, ADQUISICION, INVERSION_SUJETO_PASIVO, CAST('''' AS VARCHAR(20)) TIPO ');
     SelectSQL.Add(' FROM CREA_LISTADO_IVA(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO, :FECHA_INI, :FECHA_FIN, :RIG_INI, :RIG_FIN, :FILTRO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ((ID_RECT = 0) OR (RECT = 1))');

     if (Signo = 'R') then
        SelectSQL.Add(' AND RIC <> 0 ');

     if SepararNegativo then
        SelectSQL.Add(' AND LIQUIDO_TOTAL < 0 ');
     SelectSQL.Add(' GROUP BY TIPO_IVA, MODO, P_IVA, P_REC, INVERSION_SUJETO_PASIVO, ADQUISICION ');

     if (Signo = 'R') then
     begin
        SelectSQL.Add(' UNION ALL ');
        SelectSQL.Add(' SELECT SUM(B_IMPONIBLE), SUM(I_IVA), SUM(I_REC), SUM(RETENCION), P_IVA, P_REC, MODO, TIPO_IVA, ADQUISICION, INVERSION_SUJETO_PASIVO, CAST(''Autofactura'' AS VARCHAR(20)) TIPO ');
        SelectSQL.Add(' FROM CREA_LISTADO_IVA(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO, :FECHA_INI, :FECHA_FIN, :RIG_INI, :RIG_FIN, :FILTRO) ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ((ID_RECT = 0) OR (RECT = 1))');
        SelectSQL.Add(' AND RIC = 0 ');
        if SepararNegativo then
           SelectSQL.Add(' AND LIQUIDO_TOTAL < 0 ');
        SelectSQL.Add(' GROUP BY TIPO_IVA, MODO, P_IVA, P_REC, INVERSION_SUJETO_PASIVO, ADQUISICION ');
     end;

     SelectSQL.Add(' ORDER BY 6, 7, 8, 9 ');

     // Evito que devuelva datos
     if SepararNegativo then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['RIG_INI'].AsInteger := RegDesde;
     Params.ByName['RIG_FIN'].AsInteger := RegHasta;
     Params.ByName['FILTRO'].AsInteger := BoolToInt(not Filtro);
     Open;
  end;

  xDatosDUA.Open;

  DMListados.Imprimir(2, 0, Modo, '', '', frIVARepercutido, frxIVARepercutido, nil);
end;

procedure TDMLstIva.frIVARepercutidoGetValue(const ParName: string; var ParValue: variant);
var
  num_fact : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FECHA' then
  begin
     if TituloSigno = _('Soportado') then
        ParValue := Trunc(SPListadoIva.FieldByName('FECHA_REGISTRO').AsDateTime)
     else
        ParValue := Trunc(SPListadoIva.FieldByName('DOC_FECHA').AsDateTime);
  end;

  if ParName = 'FECHA_NEG' then
  begin
     if TituloSigno = _('Soportado') then
        ParValue :=
           Trunc(SPListadoIvaNeg.FieldByName('FECHA_REGISTRO').AsDateTime)
     else
        ParValue := Trunc(SPListadoIvaNeg.FieldByName('DOC_FECHA').AsDateTime);
  end;

  if ParName = 'FECHA_REC' then
  begin
     if TituloSigno = _('Soportado') then
        ParValue :=
           Trunc(SPListadoIvaRec.FieldByName('FECHA_REGISTRO').AsDateTime)
     else
        ParValue := Trunc(SPListadoIvaRec.FieldByName('DOC_FECHA').AsDateTime);
  end;

  if ParName = 'DESDE' then
     ParValue := FechaDesde;

  if ParName = 'HASTA' then
     ParValue := FechaHasta;

  if ParName = 'SIGNO' then
     ParValue := TituloSigno;

  if ParName = 'FACTURA' then
  begin
     num_fact := ' ';
     if (SPListadoIva.FieldByName('DOC_NUMERO').AsString <> '0') then
     begin
        if signo = 'R' then
           num_fact := SPListadoIva.FieldByName('DOC_NUMERO').AsString + ' ' + SPListadoIva.FieldByName('DOC_SERIE').AsString
        else
           num_fact := SPListadoIva.FieldByName('NUM_FACTURA').AsString;
     end;
     ParValue := num_fact;
  end;

  if ParName = 'FACTURA_NEG' then
  begin
     num_fact := ' ';
     if (SPListadoIvaNeg.FieldByName('DOC_NUMERO').AsString <> '0') then
     begin
        if signo = 'R' then
           num_fact := SPListadoIvaNeg.FieldByName('DOC_NUMERO').AsString +
              ' ' + SPListadoIvaNeg.FieldByName('DOC_SERIE').AsString
        else
           num_fact := SPListadoIvaNeg.FieldByName('NUM_FACTURA').AsString;
     end;
     ParValue := num_fact;
  end;

  if ParName = 'FACTURA_REC' then
  begin
     num_fact := ' ';
     if (SPListadoIvaRec.FieldByName('DOC_NUMERO').AsString <> '0') then
     begin
        if Signo = 'R' then
           num_fact := SPListadoIvaRec.FieldByName('DOC_NUMERO').AsString +
              ' ' + SPListadoIvaRec.FieldByName('DOC_SERIE').AsString
        else
           num_fact := SPListadoIvaRec.FieldByName('NUM_FACTURA').AsString;
     end;
     ParValue := num_fact;
  end;

  if ParName = 'FAC_RECTIFICADA' then
  begin
     ParValue := ' ';
     if (SPListadoIVARec.FieldByName('RIG_RECT').AsInteger <> 0) then
     begin
        if Signo = 'R' then
           ParValue := SPListadoIVARec.FieldByName('RIG_RECT').AsString + ' ' +
              SPListadoIVARec.FieldByName('SERIE_RECT').AsString + ' ' +
              SPListadoIVARec.FieldByName('EJERCICIO_RECT').AsString
        else
           ParValue := SPListadoIVARec.FieldByName('RIG_RECT').AsString + ' ' +
              SPListadoIVARec.FieldByName('SERIE_RECT').AsString + ' ' +
              SPListadoIVARec.FieldByName('EJERCICIO_RECT').AsString;
     end;
  end;

  if ParName = 'TIPO' then
  begin
     with xTipoIva do
     begin
        Close;
        DataSource := DSTotales;
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Open;
        ParValue := FieldByName('TITULO').AsString;
     end;
  end;

  if ParName = 'MODO' then
  begin
     with xModoIva do
     begin
        Close;
        DataSource := DSTotales;
        Open;
        ParValue := FieldByName('TITULO').AsString;
     end;
  end;

  if ParName = 'TIPO_NEG' then
  begin
     with xTipoIva do
     begin
        Close;
        DataSource := DSTotalesNeg;
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Open;
        ParValue := FieldByName('TITULO').AsString;
     end;
  end;

  if ParName = 'MODO_NEG' then
  begin
     with xModoIva do
     begin
        Close;
        DataSource := DSTotalesNeg;
        Open;
        ParValue := FieldByName('TITULO').AsString;
     end;
  end;

  if ParName = 'MostrarTotal' then
     ParValue := MostrarTotal;
end;

procedure TDMLstIva.frIVARepercutidoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstIva.DameFechas(Signo: string; var aFechaDesde, aFechaHasta: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(FECHA_REGISTRO) AS MIN_FECHA_REGISTRO, MIN(DOC_FECHA) AS MIN_DOC_FECHA, ');
        SQL.Add('        MAX(FECHA_REGISTRO) AS MAX_FECHA_REGISTRO, MAX(DOC_FECHA) AS MAX_DOC_FECHA ');
        SQL.Add(' FROM EMP_REGISTRO_IVA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SIGNO = :SIGNO ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := Signo;
        ExecQuery;

        if (Signo = 'S') then
           aFechaDesde := FieldByName['MIN_FECHA_REGISTRO'].AsDateTime
        else
           aFechaDesde := FieldByName['MIN_DOC_FECHA'].AsDateTime;

        if aFechaDesde = 0 then
           aFechaDesde := REntorno.FechaTrab;
        aFechaHasta := REntorno.FechaTrab;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstIva.DameRegistros(Signo: string; var MinReg, MaxReg: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(REGISTRO), MAX(REGISTRO) ');
        SQL.Add(' FROM EMP_REGISTRO_IVA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SIGNO = :SIGNO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := Signo;
        ExecQuery;
        MinReg := FieldByName['MIN'].AsInteger;
        MaxReg := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstIva.CompruebaIVA(ini, fin: TDateTime);
begin
  with xCompruebaIvaRep do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_I'].AsDateTime := ini;
     Params.ByName['FECHA_F'].AsDateTime := fin;
     Open;
  end;

  frcompruebaIva.PrepareReport;
  frcompruebaIva.ShowPreparedReport;
end;

procedure TDMLstIva.frCompruebaIvaBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstIva.frCompruebaIvaGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstIva.frxIVARepercutidoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstIva.frxIVARepercutidoGetValue(const VarName: string; var Value: variant);
begin
  frIVARepercutidoGetValue(VarName, Value);
end;

procedure TDMLstIva.xDatosDUAAfterScroll(DataSet: TDataSet);
begin
  // Solo abro datos detalle de DUA si hay DUA. (Para optimizar velocidad del listado)
  xProveedorDUA.Close;
  xDatosFacturaProvDUA.Close;

  if (xDatosDUA.FieldByName('ID_DETALLES_I').AsInteger <> 0) then
  begin
     xProveedorDUA.Open;
     xDatosFacturaProvDUA.Open;
  end;
end;

end.
