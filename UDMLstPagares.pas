unit UDMLSTPagares;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, HYFIBQuery, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, ALetras, UHYReport, FR_Class, Fr_HYReport, FR_DSet,
  FR_DBSet, frxClass, frxHYReport;

type
  TDMLstPagares = class(TDataModule)
     SPDamePagare: THYFIBQuery;
     xPagareDesde: TFIBDataSetRO;
     TLocal: THYTransaction;
     xPagareHasta: TFIBDataSetRO;
     DSxPagareDesde: TDataSource;
     DSxPagareHasta: TDataSource;
     xPagares: TFIBDataSetRO;
     Letra1: TLetra;
     HYPagares: THYReport;
     HYRSxPagares: THYReportSource;
     xProveedores: TFIBDataSetRO;
     DSxPagares: TDataSource;
     xAcreedores: TFIBDataSetRO;
     xDetalle: TFIBDataSetRO;
     DSxDetalle: TDataSource;
     HYRxDetalle: THYReportSource;
     frDBxPagares: TfrDBDataSet;
     frDBDBDetalle: TfrDBDataSet;
     frCartaPago: TfrHYReport;
     xCodigoPostal: TFIBDataSetRO;
     DSxCodPostal: TDataSource;
     DSxDirPRO_ACR: TDataSource;
     xDirPRO_ACR: TFIBDataSetRO;
     xBanco: TFIBDataSetRO;
     DSxBanco: TDataSource;
     Letras: TLetra;
     DSxProveedores: TDataSource;
     DSxAcreedores: TDataSource;
     xNum_Factura: TFIBDataSetRO;
     DSxNumFactura: TDataSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     xPagareDesdePAGARE: TFIBStringField;
     xPagareDesdeDESCRIPCION: TFIBStringField;
     xPagareHastaPAGARE: TFIBStringField;
     xPagareHastaDESCRIPCION: TFIBStringField;
     frxCartaPago: TfrxHYReport;
     frPagares: TfrHYReport;
     frxPagares: TfrxHYReport;
     frDSxPagares: TfrDBDataSet;
     TUpdate: THYTransaction;
     xModoImporte: THYFIBQuery;
     xDetalleRecAgrupKri: TFIBDataSetRO;
     DSxDetalleRecAgrupKri: TDataSource;
     HYRSxDetalleRecAgrupKri: THYReportSource;
     frDBxDetalleRecAgrupKri: TfrDBDataSet;
     procedure DMLstPagaresCreate(Sender: TObject);
     procedure HYPagaresEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure DMLstPagaresDestroy(Sender: TObject);
     procedure xPagaresAfterScroll(DataSet: TDataSet);
     procedure xDirPRO_ACRAfterScroll(DataSet: TDataSet);
     procedure frxCartaPagoBeforePrint(Sender: TfrxReportComponent);
     // procedure frxCartaPagoGetValue(const VarName: string; var Value: variant);
     procedure frPagaresGetValue(const ParName: string; var ParValue: variant);
     procedure frPagaresEnterRect(Memo: TStringList; View: TfrView);
     procedure frxPagaresGetValue(const VarName: string; var Value: variant);
     procedure frxPagaresBeforePrint(Sender: TfrxReportComponent);
     procedure xDetalleAfterOpen(DataSet: TDataSet);
     procedure xDetalleBeforeClose(DataSet: TDataSet);
     procedure xPagaresAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
     LocalMascaraN: string;
     function Fechas(fecha: TDateTime): string;
  public
     { Public declarations }
     procedure MostrarListado(Desde, Hasta: string; Modo: smallint);
     function DamePagare(Pagare: string): string;
     procedure DameMinMaxPagare(var Desde, Hasta: string);
     procedure MostrarCartaPago(Pagare: string; Modo: smallint);
  end;

var
  DMLstPagares : TDMLstPagares;

implementation

uses UEntorno, UUtiles, UDMMain, UDMListados, UFormGest, DateUtils, UDameDato;

{$R *.DFM}

procedure TDMLstPagares.DMLstPagaresCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  xPagareDesde.Open;
  xPagareHasta.Open;
  xBanco.Open;
  xDetalle.Open;

  Letras.DescDecimales := _('céntimos');
  Letras.Separador := DecimalSeparator;
  Letra1.DescDecimales := _('céntimos');
  Letra1.Separador := DecimalSeparator;
end;

procedure TDMLstPagares.DMLstPagaresDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPagares.MostrarListado(Desde, Hasta: string; Modo: smallint);
var
  Titulo : string;
begin
  with xPagares do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PAGAREDESDE'].AsString := Desde;
     Params.ByName['PAGAREHASTA'].AsString := Hasta;
     Open;
  end;

  Titulo := _('Pagares') + '_' + Desde + '-' + Hasta;
  DMListados.Imprimir(102, 0, Modo, '', Titulo, frPagares, frxPagares, HYPagares);
end;

procedure TDMLstPagares.DameMinMaxPagare(var Desde, Hasta: string);
begin
  with SPDamePagare do
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

function TDMLstPagares.DamePagare(Pagare: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PAGARE, DESCRIPCION FROM VER_PAGARES ');
        SQL.Add(' WHERE ');
        SQL.Add('   EMPRESA = :EMPRESA AND ');
        SQL.Add('   EJERCICIO = :EJERCICIO AND ');
        SQL.Add('   CANAL = :CANAL AND ');
        SQL.Add('   PAGARE = :PAGARE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PAGARE'].AsString := Pagare;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstPagares.HYPagaresEnterFields(Sender: THYReport; Field: THYField; var Source: string);
var
  fecha, fechav : TDateTime;
  importe : double;
  ModoDec : integer;
  sl : TStrings;
begin
  DMListados.EnterFields(Source);

  fecha := xPagares.FieldByName('FECHA_LIBRAMIENTO').AsDateTime;
  fechav := xPagares.FieldByName('FECHA_VENCIMIENTO').AsDateTime;
  importe := xPagares.FieldByName('IMPORTE').AsFloat;

  if Source = '[TITULAR]' then
  begin
     if xPagares.FieldByName('TIPO_TERCERO').AsString = 'PRO' then
     begin
        xProveedores.Close;
        xProveedores.Open;
        Source := xProveedores.FieldByName('TITULO').AsString;
     end;
     if xPagares.FieldByName('TIPO_TERCERO').AsString = 'ACR' then
     begin
        xAcreedores.Close;
        xAcreedores.Open;
        Source := xAcreedores.FieldByName('TITULO').AsString;
     end;
     if xPagares.FieldByName('TIPO_TERCERO').AsString = 'CLI' then
     begin
        xClientes.Close;
        xClientes.Open;
        Source := xClientes.FieldByName('TITULO').AsString;
     end;
  end;

  if Source = '[IMPORTE]' then
     Source := '## ' + FormatFloat(MascaraN, importe) + ' ##';

  with xModoImporte do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     ModoDec := FieldByName['Importe_Letras'].AsInteger;
     FreeHandle;
  end;

  if Source = '[LETRAS1]' then
  begin
     Letra1.Numero := importe;
     Letra1.ModoDecimales := ModoDec;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Open;
        Letra1.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letra1.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letra1.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letra1.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     sl := Letra1.Texto;
     Source := sl[0];
     sl.Free;
  end;

  if (Source = '[LETRAS2]') then
  begin
     sl := Letra1.Texto;
     if (sl.Count > 1) then
        Source := sl[1]
     else
        Source := ' ';
     sl.Free;
  end;
  {
  if (Source = '[LETRAS3]') then
  begin
     Letra1.Numero := importe;
     if (REntorno.Pais = 'DOM') then
        Letra1.ModoDecimales := 1;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Open;
        Letra1.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letra1.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letra1.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letra1.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
        Letra1.LongLinea := 200;
        Letra1.LongPrimeraLinea := 200;
     end;
     Source := Letra1.AsString;
  end;
  }
  if Source = '[DIA]' then
  begin
     Source := IntToStr(DayOf(Fecha));
  end;

  if Source = '[DIA_VTO]' then
  begin
     Source := xPagares.FieldByName('LUGAR_LIBRAMIENTO').AsString + ', ' + IntToStr(DayOf(Fecha));
  end;

  if Source = '[MES]' then
  begin
     Source := MesStr(MonthOf(Fecha));
  end;

  if Source = '[ANO]' then
     Source := IntToStr(YearOf(fecha));

  if Source = '[DIAV]' then
     Source := IntToStr(DayOf(FechaV));

  if Source = '[MESV]' then
  begin
     Source := MesStr(MonthOf(FechaV));
  end;

  if Source = '[ANOV]' then
     Source := IntToStr(YearOf(FechaV));

  if Source = '[LOCALIDAD_EXP]' then
     Source := xPagares.FieldByName('LUGAR_LIBRAMIENTO').AsString + ', ';

  if Source = ' ' then
     Source := '';
end;

procedure TDMLstPagares.MostrarCartaPago(Pagare: string; Modo: smallint);
var
  Titulo : string;
begin
  with xPagares do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PagareDESDE'].AsString := Pagare;
     Params.ByName['PagareHASTA'].AsString := Pagare;
     Open;
  end;

  Titulo := 'CartaPago_' + Pagare;
  DMListados.Imprimir(103, 0, Modo, '', Titulo, frCartaPago, frxCartaPago, HYPagares);
end;

procedure TDMLstPagares.xPagaresAfterScroll(DataSet: TDataSet);
begin
  if (xPagares.FieldByName('TIPO_TERCERO').AsString = 'PRO') then
  begin
     xProveedores.Close;
     xProveedores.Open;
     xDirPRO_ACR.DataSource := DSXProveedores;
  end
  else
  if (xPagares.FieldByName('TIPO_TERCERO').AsString = 'ACR') then
  begin
     xAcreedores.Close;
     xAcreedores.Open;
     xDirPRO_ACR.DataSource := DSxAcreedores;
  end
  else
  if (xPagares.FieldByName('TIPO_TERCERO').AsString = 'CLI') then
  begin
     xClientes.Close;
     xClientes.Open;
     xDirPRO_ACR.DataSource := DSxClientes;
  end;

  xDirPRO_ACR.Close;
  xDirPRO_ACR.Open;
end;

function TDMLstPagares.Fechas(Fecha: TDateTime): string;
var
  ano, mes, dia : word;
begin
  DecodeDate(Fecha, ano, mes, dia);
  Result := Format(_('%d de %s del %d'), [dia, MesStr(MonthOf(Fecha)), ano]); // Dia de MesStr del Año
end;

procedure TDMLstPagares.xDirPRO_ACRAfterScroll(DataSet: TDataSet);
begin
  xCodigoPostal.Close;
  xCodigoPostal.Open;
end;

procedure TDMLstPagares.frxCartaPagoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstPagares.frPagaresGetValue(const ParName: string; var ParValue: variant);
var
  Tabla, s : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Nombre' then
     ParValue := DameTituloTercero(xPagares.FieldByName('COD_CLI_PRO').AsInteger); // ObtenerNombre(xPagaresCOD_CLI_PRO.AsInteger);

  if ParName = 'ImporteLetras' then
  begin
     Letras.Numero := xPagares.FieldByName('IMPORTE').AsFloat;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Open;
        Letras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     ParValue := Letras.AsString;
  end;

  if ParName = 'FECHA' then
     ParValue := fechas(xPagares.FieldByName('FECHA_LIBRAMIENTO').AsDateTime);

  if ParName = 'FECHA_VTO' then
     ParValue := fechas(xPagares.FieldByName('FECHA_VENCIMIENTO').AsDateTime);

  if ParName = 'MES_LIBRAMIENTO' then
  begin
     ParValue := MesStr(MonthOf(xPagares.FieldByName('FECHA_LIBRAMIENTO').AsDateTime));
  end;

  if ParName = 'MES_VENCIMIENTO' then
  begin
     ParValue := MesStr(MonthOf(xPagares.FieldByName('FECHA_VENCIMIENTO').AsDateTime));
  end;

  if ParName = 'IMPORTE' then
     ParValue := FormatFloat(MascaraN, xPagares.FieldByName('IMPORTE').AsFloat);

  if ParName = 'Liquido' then
  begin
     LocalMascaraN := DMMain.MascaraMoneda(xDetalle.FieldByName('MONEDA').AsString, 1);
     ParValue := FormatFloat(LocalMascaraN, xDetalle.FieldByName('LIQUIDO').AsFloat);
  end;

  if ParName = 'Moneda' then
     ParValue := Copy(REntorno.Moneda,
        1, 1) + LowerCase(Copy(REntorno.Moneda, 2, 2)) + '.';

  if ParName = 'MonedaDetalle' then
     ParValue :=
        Copy(xDetalle.FieldByName('MONEDA').AsString, 1, 1) +
        LowerCase(Copy(xDetalle.FieldByName('MONEDA').AsString, 2, 2)) + '.';

  if ParName = 'NUM_FAC' then
  begin
     if xPagares.FieldByName('TIPO_TERCERO').AsString = 'PRO' then
        Tabla := 'GES_CABECERAS_E_FAC'
     else
     if xPagares.FieldByName('TIPO_TERCERO').AsString = 'ACR' then
        Tabla := 'GES_CABECERAS_E_FCR';

     if xPagares.FieldByName('TIPO_TERCERO').AsString = 'CLI' then
        ParValue := xDetalle.FieldByName('DOC_NUMERO').AsInteger
     else
        with xNum_Factura do
        begin
           Close;
           SelectSQL.Text := 'SELECT NUM_FACTURA FROM ' + Tabla + ' ' +
              'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ' +
              'CANAL=?CANAL AND SERIE=?SERIE AND RIG=?RIG';
           Params.ByName['EMPRESA'].AsInteger := xDetalle.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xDetalle.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := xDetalle.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := xDetalle.FieldByName('DOC_SERIE').AsString;
           Params.ByName['RIG'].AsInteger := xDetalle.FieldByName('DOC_NUMERO').AsInteger;
           Open;
           ParValue := xNum_Factura.FieldByName('NUM_FACTURA').AsString;
        end;
  end;

  if ParName = 'NUM_FAC_FERCAM' then
  begin
     ParValue := '';
     if ((xDetalle.FieldByName('DOC_TIPO').AsString = 'FAP') or
        (xDetalle.FieldByName('DOC_TIPO').AsString = 'FCR')) then
     begin
        if (xDetalle.FieldByName('DOC_TIPO').AsString = 'FAP') then
           Tabla := 'GES_CABECERAS_E_FAC'
        else
        if (xDetalle.FieldByName('DOC_TIPO').AsString = 'FCR') then
           Tabla := 'GES_CABECERAS_E_FCR';

        with xNum_Factura do
        begin
           Close;
           SelectSQL.Text := 'SELECT NUM_FACTURA FROM ' + Tabla + ' ' +
              'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ' +
              'CANAL=?CANAL AND SERIE=?SERIE AND RIG=?RIG';
           Params.ByName['EMPRESA'].AsInteger := xDetalle.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xDetalle.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := xDetalle.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := xDetalle.FieldByName('DOC_SERIE').AsString;
           Params.ByName['RIG'].AsInteger := xDetalle.FieldByName('DOC_NUMERO').AsInteger;
           Open;
           ParValue := xNum_factura.FieldByName('NUM_FACTURA').AsString;
        end;
     end;

     if xDetalle.FieldByName('DOC_TIPO').AsString = 'AFP' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT TITULO FROM CON_CUENTAS_ASIENTOS ' +
                 'WHERE EMPRESA=' + xDetalle.FieldByName('EMPRESA').AsString + ' AND EJERCICIO=' + xDetalle.FieldByName('EJERCICIO').AsString + ' AND CANAL=' + xDetalle.FieldByName('CANAL').AsString + ' AND RIC=' + xDetalle.FieldByName('RIC').AsString;
              ExecQuery;
              s := FieldByName['TITULO'].AsString;
              ParValue := Copy(s, Pos('(', s) + 1, Pos(')', s) - Pos('(', s) - 1);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if xDetalle.FieldByName('DOC_TIPO').AsString = 'AFC' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT DOC_SERIE, DOC_NUMERO FROM CON_CUENTAS_APUNTES ' +
                 'WHERE EMPRESA=' + xDetalle.FieldByName('EMPRESA').AsString + ' AND EJERCICIO=' + xDetalle.FieldByName('EJERCICIO').AsString + ' AND CANAL=' + xDetalle.FieldByName('CANAL').AsString + ' AND RIC=' + xDetalle.FieldByName('RIC').AsString + ' AND LINEA=1';
              ExecQuery;
              ParValue := Format(_('Nuestra Factura %s/%s'), [FieldByName['DOC_SERIE'].AsString, FieldByName['DOC_NUMERO'].AsString]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if ParName = 'NUM_FAC_FERCAM_AGR' then
  begin
     ParValue := '';
     if ((xDetalleRecAgrupKri.FieldByName('DOC_TIPO').AsString = 'FAP') or (xDetalleRecAgrupKri.FieldByName('DOC_TIPO').AsString = 'FCR')) then
     begin
        if (xDetalleRecAgrupKri.FieldByName('DOC_TIPO').AsString = 'FAP') then
           Tabla := 'GES_CABECERAS_E_FAC'
        else
        if (xDetalleRecAgrupKri.FieldByName('DOC_TIPO').AsString = 'FCR') then
           Tabla := 'GES_CABECERAS_E_FCR';

        with xNum_Factura do
        begin
           Close;
           SelectSQL.Text := 'SELECT NUM_FACTURA FROM ' + Tabla + ' ' +
              'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ' +
              'CANAL=?CANAL AND SERIE=?SERIE AND RIG=?RIG';
           Params.ByName['EMPRESA'].AsInteger := xDetalleRecAgrupKri.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xDetalleRecAgrupKri.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := xDetalleRecAgrupKri.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := xDetalleRecAgrupKri.FieldByName('DOC_SERIE').AsString;
           Params.ByName['RIG'].AsInteger := xDetalleRecAgrupKri.FieldByName('DOC_NUMERO').AsInteger;
           Open;
           ParValue := xNum_factura.FieldByName('NUM_FACTURA').AsString;
        end;
     end;

     if (xDetalleRecAgrupKri.FieldByName('DOC_TIPO').AsString = 'FAC') then
     begin
        ParValue := Format(_('Nuestra Factura %s/%s'), [xDetalleRecAgrupKri.FieldByName('DOC_SERIE').AsString, xDetalleRecAgrupKri.FieldByName('DOC_NUMERO').AsString]);
     end;

     if xDetalleRecAgrupKri.FieldByName('DOC_TIPO').AsString = 'AFP' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT TITULO FROM CON_CUENTAS_ASIENTOS ' +
                 'WHERE EMPRESA=' + xDetalleRecAgrupKri.FieldByName('EMPRESA').AsString + ' AND EJERCICIO=' + xDetalleRecAgrupKri.FieldByName('EJERCICIO').AsString +
                 ' AND CANAL=' + xDetalleRecAgrupKri.FieldByName('CANAL').AsString + ' AND RIC=' + xDetalleRecAgrupKri.FieldByName('RIC').AsString;
              ExecQuery;
              s := FieldByName['TITULO'].AsString;
              ParValue := Copy(s, Pos('(', s) + 1, Pos(')', s) - Pos('(', s) - 1);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if xDetalleRecAgrupKri.FieldByName('DOC_TIPO').AsString = 'AFC' then
     begin
        ParValue := Format(_('Nuestra Factura %s/%s'), [xDetalleRecAgrupKri.FieldByName('DOC_SERIE').AsString, xDetalleRecAgrupKri.FieldByName('DOC_NUMERO').AsString]);
     end;
  end;
end;

procedure TDMLstPagares.frPagaresEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMLstPagares.frxPagaresGetValue(const VarName: string; var Value: variant);
begin
  frPagaresGetValue(VarName, Value);
end;

procedure TDMLstPagares.frxPagaresBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstPagares.xDetalleAfterOpen(DataSet: TDataSet);
begin
  xDetalleRecAgrupKri.Open;
end;

procedure TDMLstPagares.xDetalleBeforeClose(DataSet: TDataSet);
begin
  xDetalleRecAgrupKri.Close;
end;

procedure TDMLstPagares.xPagaresAfterOpen(DataSet: TDataSet);
begin
  TNumericField(xPagares.FieldByName('IMPORTE')).DisplayFormat := MascaraN;
end;

end.
