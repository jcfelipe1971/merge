unit UDMRPrevisionPago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  frxClass, frxHYReport, ComCtrls;

type
  TDMRPrevisionPago = class(TDataModule)
     QMAsientos: TFIBDataSetRO;
     DSAsientos: TDataSource;
     xVer_Proveedores: TFIBDataSetRO;
     DSxVer_Proveedores: TDataSource;
     frDBPrevisionPago: TfrDBDataSet;
     frHYPrevisionPago: TfrHYReport;
     xVer_Acreedores: TFIBDataSetRO;
     DSxVer_Acreedores: TDataSource;
     TLocal: THYTransaction;
     xAcreedor: TFIBDataSetRO;
     DSxAcreedor: TDataSource;
     xProveedor: TFIBDataSetRO;
     DSxProveedor: TDataSource;
     xFormaPago: TFIBDataSetRO;
     DSxFormaPago: TDataSource;
     xBanco: TFIBDataSetRO;
     xCuenta: TFIBDataSetRO;
     xCuentaTercerosProv: TFIBDataSetRO;
     DSxCuentaTercerosProv: TDataSource;
     xCuentaTercerosAcre: TFIBDataSetRO;
     DSxCuentaTercerosAcre: TDataSource;
     frxHYPrevisionPago: TfrxHYReport;
     TUpdate: THYTransaction;
     xDatosDTE: TFIBDataSetRO;
     DSxDatosDTE: TDataSource;
     procedure frHYPrevisionPagoGetValue(const ParName: string; var ParValue: variant);
     procedure DMRPrevisionPagoCreate(Sender: TObject);
     procedure frHYPrevisionPagoEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRPrevisionPagoDestroy(Sender: TObject);
     procedure frxHYPrevisionPagoBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYPrevisionPagoGetValue(const VarName: string; var Value: variant);
     procedure QMAsientosAfterOpen(DataSet: TDataSet);
     procedure QMAsientosBeforeClose(DataSet: TDataSet);
     procedure xVer_ProveedoresBeforeOpen(DataSet: TDataSet);
     procedure xVer_AcreedoresBeforeOpen(DataSet: TDataSet);
     procedure xVer_ProveedoresAfterOpen(DataSet: TDataSet);
     procedure xVer_ProveedoresBeforeClose(DataSet: TDataSet);
     procedure xVer_AcreedoresAfterOpen(DataSet: TDataSet);
     procedure xVer_AcreedoresBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     FechaD, FechaH, FechaListado: TDateTime;
     Comentario, Moneda: string;
  public
     { Public declarations }
     procedure CalculaInforme(parFechaD, parFechaH, parFechaListado: TDateTime; parMoneda, parComentario: string; intGrupo, Proveedor, Acreedor: integer; FiltraFP: boolean; FPago: string; FiltroCanal: smallint; SerieKri: string; FiltraEfecto: boolean; EfectoDesde, EfectoHasta, Cuenta: string; AFiltraPais: boolean; APais: string; AFiltraBanco: boolean; ABanco: integer; AFiltraNIF: boolean; aNIF: string; CalcularPrevisionPedido, CalcularPrevisionAlbaran: boolean);
     procedure MostrarListado(Modo: integer; intGrupo: integer);
     procedure ExportarExcel(Modo: integer; PBExportacion: TProgressBar; Fichero: string = '');
     procedure Rangos(var VencDesde, VencHasta, DocFecDesde, DocFecHasta: TDateTime; SoloEjercicio: boolean);
     procedure CambiaProveedor(Proveedor: integer);
     procedure CambiaAcreedor(Acreedor: integer);
     procedure CambiaFormaPago(FPago: string);
  end;

var
  DMRPrevisionPago : TDMRPrevisionPago;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles, UParam, UHojaCalc, StrUtils, UDameDato;

{$R *.DFM}

procedure TDMRPrevisionPago.DMRPrevisionPagoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMRPrevisionPago.DMRPrevisionPagoDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRPrevisionPago.CalculaInforme(parFechaD, parFechaH, parFechaListado: TDateTime; parMoneda, parComentario: string; intGrupo, Proveedor, Acreedor: integer; FiltraFP: boolean; FPago: string; FiltroCanal: smallint; SerieKri: string; FiltraEfecto: boolean; EfectoDesde, EfectoHasta, Cuenta: string; AFiltraPais: boolean; APais: string; AFiltraBanco: boolean; ABanco: integer; AFiltraNIF: boolean; aNIF: string; CalcularPrevisionPedido, CalcularPrevisionAlbaran: boolean);
var
  FiltroTxt, auxCuenta, OrdenImporte : string;
begin
  // Asignar las variables globales del listado
  FechaD := HourIntoDate(parFechaD, '00:00:00');
  FechaH := HourIntoDate(parFechaH, '23:59:59');
  FechaListado := parFechaListado;
  Moneda := parMoneda;
  Comentario := parComentario;

  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);

  if FiltraFP then
     FiltroTxt := ' WHERE FPAGO=' + '''' + FPago + ''''
  else
     FiltroTxt := ' ';

  if FiltroCanal > 0 then
  begin
     if not FiltraFP then
        FiltroTxt := ' WHERE CAN=' + IntToStr(FiltroCanal)
     else
        FiltroTxt := FiltroTxt + ' AND CAN=' + IntToStr(FiltroCanal);
  end;

  if (Length(SerieKri) > 1) then
  begin
     if (Trim(Filtrotxt) = '') then
        FiltroTxt := ' WHERE ' + SerieKri
     else
        FiltroTxt := FiltroTxt + ' AND ' + SerieKri;
  end;

  if ((intGrupo = 5) and (Cuenta <> '')) then
  begin
     if FiltroTxt = '' then
        FiltroTxt := ' WHERE BANCO=''' + Cuenta + ''''
     else
        FiltroTxt := FiltroTxt + ' AND BANCO=''' + Cuenta + '''';
  end;

  if FiltraEfecto then
  begin
     if (Trim(Filtrotxt) = '') then
        FiltroTxt := ' WHERE EFECTO >= ''' + EfectoDesde + ''' AND EFECTO <= ''' + EfectoHasta + ''''
     else
        FiltroTxt := FiltroTxt + ' AND EFECTO >= ''' + EfectoDesde + ''' AND EFECTO <= ''' + EfectoHasta + '''';
  end;

  if AFiltraPais then
  begin
     if (Trim(Filtrotxt) = '') then
        FiltroTxt := ' WHERE PAIS = ''' + APais + ''''
     else
        FiltroTxt := FiltroTxt + ' AND PAIS = ''' + APais + '''';
  end;

  if AFiltraNIF then
  begin
     if (Trim(Filtrotxt) = '') then
        FiltroTxt := ' WHERE NIF LIKE ''%' + aNIF + '%'''
     else
        FiltroTxt := FiltroTxt + ' AND NIF LIKE ''%' + aNIF + '%''';
  end;

  if not CalcularPrevisionPedido then
  begin
     if (Trim(Filtrotxt) = '') then
        FiltroTxt := ' WHERE TIPO <> ''PEP'''
     else
        FiltroTxt := FiltroTxt + ' AND TIPO <> ''PEP''';
  end;

  if not CalcularPrevisionAlbaran then
  begin
     if (Trim(Filtrotxt) = '') then
        FiltroTxt := ' WHERE TIPO <> ''ALP'''
     else
        FiltroTxt := FiltroTxt + ' AND TIPO <> ''ALP''';
  end;

  if AFiltraBanco then
  begin
     // Obtengo la cuenta del banco
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CUENTA_CC FROM CON_CUENTAS_GES_BAN ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
           SQL.Add(' AND EJERCICIO = ' + REntorno.EjercicioStr);
           SQL.Add(' AND CANAL = ' + REntorno.CanalStr);
           SQL.Add(' AND BANCO = ' + IntToStr(ABanco));
           ExecQuery;
           auxCuenta := FieldByName['CUENTA_CC'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (Trim(Filtrotxt) = '') then
        FiltroTxt := ' WHERE BANCO = ''' + auxCuenta + ''''
     else
        FiltroTxt := FiltroTxt + ' AND BANCO = ''' + auxCuenta + '''';
  end;

  with QMAsientos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM C_CREA_PREVISION_C_P (?EMPRESA, ?CANAL, ?DESDE, ?HASTA, ?SIGNO, ?MONEDA, ?FECHA, ?CLIPROACR, ?TIPOTER, 0, 1) ');
     SelectSQL.Add(FiltroTxt);

     SelectSQL.Add(' ORDER BY ');

     if (LeeParametro('CARPREV001') = 'S') then
     begin
        // Orden para que agrupe pedidos al principio, luego albaranes y luego el resto
        SelectSQL.Add(' CASE ');
        SelectSQL.Add('     WHEN TIPO = ''PEP'' THEN 1 ');
        SelectSQL.Add('     WHEN TIPO = ''ALP'' THEN 2 ');
        SelectSQL.Add('     ELSE 3 ');
        SelectSQL.Add(' END, ');
     end;

     OrdenImporte := '';
     if (LeeParametro('CARORDE001') = 'S') then
        OrdenImporte := 'IMPORTE, ';

     case intGrupo of
        0: // Por Vencimiento
           SelectSQL.Add(' VENCIMIENTO, ' + OrdenImporte + ' CODCLI, BANCO, ORDEN ');
        1: // Por Código Proveedor/Acreedor
           SelectSQL.Add(' CODCLI, TIPO, ' + OrdenImporte + ' VENCIMIENTO, BANCO, ORDEN ');
        2, 3: // Para un Proveedor(2)/Acreedor(3)
           SelectSQL.Add(' VENCIMIENTO, ' + OrdenImporte + ' BANCO, ORDEN ');
        4, 5: // Por Cuenta / Por una Cuenta  //SFG_JLA
           SelectSQL.Add(' BANCO, ' + OrdenImporte + ' VENCIMIENTO, CODCLI, ORDEN ');
     end;

     if (intGrupo = 2) then
     begin
        Params.ByName['TIPOTER'].AsString := 'FAP';
        Params.ByName['CLIPROACR'].AsInteger := Proveedor;
     end
     else if (intGrupo = 3) then
     begin
        Params.ByName['TIPOTER'].AsString := 'FCR';
        Params.ByName['CLIPROACR'].AsInteger := Acreedor;
     end
     else
     begin
        Params.ByName['TIPOTER'].AsString := 'ALL';
        Params.ByName['CLIPROACR'].AsInteger := Proveedor;
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := FechaD;
     Params.ByName['HASTA'].AsDateTime := FechaH;
     Params.ByName['SIGNO'].AsString := 'P';
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['FECHA'].AsDateTime := FechaListado;
     Open;
  end;
end;

procedure TDMRPrevisionPago.MostrarListado(Modo, intGrupo: integer);
var
  str, auxMascaraN : string;
begin
  // Almacenar la máscara
  auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(Moneda, 1);

  case intGrupo of
     0: DMListados.Cargar(30, '');
     1, 2, 3: DMListados.Cargar(83, '');  // Por Código
     4, 5: DMListados.Cargar(136, '');     // Por Cuenta //SFG_JLA
  end;

  if (REntorno.TipoListado = 'FRF') then
  begin
     frHYPrevisionPago.LoadFromFIB(REntorno.Formato, str);
     frHYPrevisionPago.PrepareReport;
     case modo of
        0: frHYPrevisionPago.ShowPreparedReport;
        1: frHYPrevisionPago.PrintPreparedReport('', 1);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxHYPrevisionPago.LoadFromFIB(REntorno.Formato, str);
     frxHYPrevisionPago.PrepareReport;
     case Modo of
        0: frxHYPrevisionPago.ShowPreparedReport;
        1: frxHYPrevisionPago.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
  // Restaurar la máscara
  MascaraN := auxMascaraN;
end;

procedure TDMRPrevisionPago.frHYPrevisionPagoGetValue(const ParName: string; var ParValue: variant);
var
  Q : THYFIBQuery;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'InicioVencimiento' then
     ParValue := StrToDate(DateToStr(FechaD));

  if ParName = 'FinalVencimiento' then
     ParValue := StrToDate(DateToStr(FechaH));

  if ParName = 'FechaListado' then
     ParValue := StrToDate(DateToStr(FechaListado));

  if ParName = 'Comentario' then
     ParValue := Comentario;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'NombreProveedor' then
  begin
     if ((QMAsientos.FieldByName('TIPO').AsString = 'FAP') or
        (QMAsientos.FieldByName('TIPO').AsString = 'AGP') or
        (QMAsientos.FieldByName('TIPO').AsString = 'AFP') or
        (QMAsientos.FieldByName('TIPO').AsString = 'NRP') or
        (QMAsientos.FieldByName('TIPO').AsString = 'PEP') or
        (QMAsientos.FieldByName('TIPO').AsString = 'ALP')) then
     begin
        with xVer_Proveedores do
        begin
           ParValue := xVer_Proveedores.FieldByName('TITULO').AsString;
        end;
        with xBanco do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT SB.TITULO FROM EMP_PROVEEDORES EP ');
           SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_BANCOS STB ON ');
           SelectSQL.Add(' EP.TERCERO = STB.TERCERO ');
           SelectSQL.Add(' LEFT JOIN SYS_BANCOS SB ON ');
           SelectSQL.Add(' STB.PAIS = SB.PAIS AND STB.ENTIDAD = SB.ENTIDAD ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' (STB.BANCO = 1 OR STB.BANCO IS NULL) ');
           SelectSQL.Add(' AND EP.EMPRESA = ' + REntorno.EmpresaStr);
           SelectSQL.Add(' AND EP.PROVEEDOR = ' + IntToStr(QMAsientos.FieldByName('CODCLI').AsInteger));
           Open;
        end;
        with xCuenta do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT CUENTA FROM CON_CUENTAS_GES_PRO ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
           SelectSQL.Add(' AND EJERCICIO = ' + IntToStr(QMAsientos.FieldByName('EJERCICIO').AsInteger));
           SelectSQL.Add(' AND CANAL = ' + REntorno.CanalStr);
           SelectSQL.Add(' AND PROVEEDOR = ' + IntToStr(QMAsientos.FieldByName('CODCLI').AsInteger));
           Open;
        end;
     end;

     if ((QMAsientos.FieldByName('TIPO').AsString = 'FCR') or
        (QMAsientos.FieldByName('TIPO').AsString = 'AGA') or
        (QMAsientos.FieldByName('TIPO').AsString = 'AFA') or
        (QMAsientos.FieldByName('TIPO').AsString = 'NRA')) then
     begin
        with xVer_Acreedores do
        begin
           ParValue := xVer_Acreedores.FieldByName('TITULO').AsString;
        end;
        with xBanco do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT SB.TITULO FROM EMP_ACREEDORES EA ');
           SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_BANCOS STB ON ');
           SelectSQL.Add(' EA.TERCERO = STB.TERCERO ');
           SelectSQL.Add(' LEFT JOIN SYS_BANCOS SB ON ');
           SelectSQL.Add(' STB.PAIS = SB.PAIS AND STB.ENTIDAD = SB.ENTIDAD ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' (STB.BANCO = 1 OR STB.BANCO IS NULL) ');
           SelectSQL.Add(' AND EA.EMPRESA = ' + REntorno.EmpresaStr);
           SelectSQL.Add(' AND EA.ACREEDOR = ' + IntToStr(QMAsientos.FieldByName('CODCLI').AsInteger));
           Open;
        end;
        with xCuenta do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT CUENTA FROM CON_CUENTAS_GES_ACR ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
           SelectSQL.Add(' AND EJERCICIO = ' + IntToStr(QMAsientos.FieldByName('EJERCICIO').AsInteger));
           SelectSQL.Add(' AND CANAL = ' + REntorno.CanalStr);
           SelectSQL.Add(' AND ACREEDOR = ' + IntToStr(QMAsientos.FieldByName('CODCLI').AsInteger));
           Open;
        end;
     end;
  end;

  // Moroso, teniendo en cuenta todos los clientes que son de ese tercero
  if (ParName = 'Moroso') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT MAX(C.MOROSO) FROM SYS_TERCEROS T JOIN EMP_CLIENTES C ON C.TERCERO = T.TERCERO WHERE C.EMPRESA = ?EMPRESA AND T.NIF = ?NIF');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;

        if ((QMAsientos.FieldByName('TIPO').AsString = 'FAP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AGP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AFP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'NRP')) then
           Params.ByName['NIF'].AsString := xVer_Proveedores.FieldByName('NIF').AsString;
        if ((QMAsientos.FieldByName('TIPO').AsString = 'FCR') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AGA') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AFA') or
           (QMAsientos.FieldByName('TIPO').AsString = 'NRA')) then
           Params.ByName['NIF'].AsString := xVer_Acreedores.FieldByName('NIF').AsString;

        ExecQuery;
        ParValue := FieldByName['MAX'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;

  if ((ParName = 'SaldoProv') or (ParName = 'SaldoProvSinSerie')) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(SALDO) AS SALDO, SUM(SALDO_DEUDOR) AS SALDO_DEUDOR, SUM(SALDO_ACREEDOR) AS SALDO_ACREEDOR ');
        SQL.Add(' FROM KRI_SALDO_AGRUPADO_CLI_PRO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?CODCLIPRO) ');
        SQL.Add(' WHERE CUENTA STARTING WITH ''400'' OR CUENTA STARTING WITH ''410'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;

        if (ParName = 'SaldoProvSinSerie') then
           Params.ByName['SERIE'].AsString := ' '
        else
           Params.ByName['SERIE'].AsString := QMAsientos.FieldByName('SERIE').AsString;

        Params.ByName['CODCLIPRO'].AsInteger := QMAsientos.FieldByName('CODCLI').AsInteger;

        if ((QMAsientos.FieldByName('TIPO').AsString = 'FAP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AGP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AFP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'NRP')) then
           Params.ByName['TIPO'].AsString := 'P';
        if ((QMAsientos.FieldByName('TIPO').AsString = 'FCR') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AGA') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AFA') or
           (QMAsientos.FieldByName('TIPO').AsString = 'NRA')) then
           Params.ByName['TIPO'].AsString := 'A';

        ExecQuery;
        ParValue := FieldByName['SALDO'].AsFloat;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;

  if ((ParName = 'SaldoCli') or (ParName = 'SaldoCliSinSerie')) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(SALDO) AS SALDO, SUM(SALDO_DEUDOR) AS SALDO_DEUDOR, SUM(SALDO_ACREEDOR) AS SALDO_ACREEDOR ');
        SQL.Add(' FROM KRI_SALDO_AGRUPADO_CLI_PRO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?CODCLIPRO) ');
        SQL.Add(' WHERE CUENTA STARTING WITH ''430'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;

        if (ParName = 'SaldoCliSinSerie') then
           Params.ByName['SERIE'].AsString := ' '
        else
           Params.ByName['SERIE'].AsString := QMAsientos.FieldByName('SERIE').AsString;

        Params.ByName['CODCLIPRO'].AsInteger := QMAsientos.FieldByName('CODCLI').AsInteger;

        if ((QMAsientos.FieldByName('TIPO').AsString = 'FAP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AGP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AFP') or
           (QMAsientos.FieldByName('TIPO').AsString = 'NRP')) then
           Params.ByName['TIPO'].AsString := 'P';
        if ((QMAsientos.FieldByName('TIPO').AsString = 'FCR') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AGA') or
           (QMAsientos.FieldByName('TIPO').AsString = 'AFA') or
           (QMAsientos.FieldByName('TIPO').AsString = 'NRA')) then
           Params.ByName['TIPO'].AsString := 'A';

        ExecQuery;
        ParValue := FieldByName['SALDO'].AsFloat;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;

  {Datos bancarios del proveedor/acreedor}
  if ((QMAsientos.FieldByName('TIPO').AsString = 'FCR') or
     (QMAsientos.FieldByName('TIPO').AsString = 'AGA') or
     (QMAsientos.FieldByName('TIPO').AsString = 'AFA') or
     (QMAsientos.FieldByName('TIPO').AsString = 'NRA')) then
  begin
     if (ParName = 'Entidad') then
        ParValue := xCuentaTercerosAcre.FieldByName('ENTIDAD').AsString;
     if (ParName = 'Sucursal') then
        ParValue := xCuentaTercerosAcre.FieldByName('SUCURSAL').AsString;
     if (ParName = 'Control') then
        ParValue := xCuentaTercerosAcre.FieldByName('CONTROL').AsString;
     if (ParName = 'Cuenta') then
        ParValue := Trim(xCuentaTercerosAcre.FieldByName('CUENTA').AsString);
     if (ParName = 'IBAN') then
        ParValue := xCuentaTercerosAcre.FieldByName('IBAN').AsString;
     if (ParName = 'BIC') then
        ParValue := xCuentaTercerosAcre.FieldByName('BIC').AsString;
     if (ParName = 'TituloBanco') then
        ParValue := xCuentaTercerosAcre.FieldByName('TITULO').AsString;
  end;

  if ((QMAsientos.FieldByName('TIPO').AsString = 'FAP') or
     (QMAsientos.FieldByName('TIPO').AsString = 'AGP') or
     (QMAsientos.FieldByName('TIPO').AsString = 'AFP') or
     (QMAsientos.FieldByName('TIPO').AsString = 'NRP')) then
  begin
     if (ParName = 'Entidad') then
        ParValue := xCuentaTercerosProv.FieldByName('ENTIDAD').AsString;
     if (ParName = 'Sucursal') then
        ParValue := xCuentaTercerosProv.FieldByName('SUCURSAL').AsString;
     if (ParName = 'Control') then
        ParValue := xCuentaTercerosProv.FieldByName('CONTROL').AsString;
     if (ParName = 'Cuenta') then
        ParValue := Trim(xCuentaTercerosProv.FieldByName('CUENTA').AsString);
     if (ParName = 'IBAN') then
        ParValue := xCuentaTercerosProv.FieldByName('IBAN').AsString;
     if (ParName = 'BIC') then
        ParValue := xCuentaTercerosProv.FieldByName('BIC').AsString;
     if (ParName = 'TituloBanco') then
        ParValue := xCuentaTercerosProv.FieldByName('TITULO').AsString;
  end;
end;

procedure TDMRPrevisionPago.frHYPrevisionPagoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMRPrevisionPago.Rangos(var VencDesde, VencHasta, DocFecDesde, DocFecHasta: TDateTime; SoloEjercicio: boolean);
begin
  if (SoloEjercicio) then
  begin
     DameDesdeHastaPeriodo('19', VencDesde, VencHasta);
     DocFecDesde := VencDesde;
     DocFecHasta := VencHasta;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MIN(D.VENCIMIENTO) VENC_MIN, MAX(D.VENCIMIENTO) VENC_MAX, MIN(C.DOC_FECHA) DOC_FECHA_MIN, MAX(C.DOC_FECHA) DOC_FECHA_MAX ');
           SQL.Add(' FROM EMP_CARTERA_DETALLE D ');
           SQL.Add(' JOIN EMP_CARTERA C ON C.ID_CARTERA = D.ID_CARTERA ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' PAGADO = :PAGADO AND ');
           SQL.Add(' SIGNO = :SIGNO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PAGADO'].AsInteger := 0;
           Params.ByName['SIGNO'].AsString := 'P';
           ExecQuery;
           VencDesde := FieldByName['VENC_MIN'].AsDateTime;
           VencHasta := FieldByName['VENC_MAX'].AsDateTime;
           DocFecDesde := FieldByName['DOC_FECHA_MIN'].AsDateTime;
           DocFecHasta := FieldByName['DOC_FECHA_MAX'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ((VencDesde = 0) or (VencHasta = 0)) then
     Rangos(VencDesde, VencHasta, DocFecDesde, DocFecHasta, True);
end;

procedure TDMRPrevisionPago.CambiaProveedor(Proveedor: integer);
begin
  with xProveedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMRPrevisionPago.CambiaAcreedor(Acreedor: integer);
begin
  with xAcreedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Open;
  end;
end;

procedure TDMRPrevisionPago.CambiaFormaPago(FPago: string);
begin
  with xFormaPago do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FORMA_PAGO'].AsString := FPago;
     Open;
  end;
end;

procedure TDMRPrevisionPago.frxHYPrevisionPagoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMRPrevisionPago.frxHYPrevisionPagoGetValue(const VarName: string; var Value: variant);
begin
  frHYPrevisionPagoGetValue(VarName, Value);
end;

procedure TDMRPrevisionPago.QMAsientosAfterOpen(DataSet: TDataSet);
begin
  xVer_Proveedores.Open;
  xVer_Acreedores.Open;
  xDatosDTE.Open;
end;

procedure TDMRPrevisionPago.QMAsientosBeforeClose(DataSet: TDataSet);
begin
  xVer_Proveedores.Close;
  xVer_Acreedores.Close;
  xDatosDTE.Close;
end;

procedure TDMRPrevisionPago.xVer_ProveedoresBeforeOpen(DataSet: TDataSet);
begin
  xVer_Proveedores.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

procedure TDMRPrevisionPago.xVer_AcreedoresBeforeOpen(DataSet: TDataSet);
begin
  xVer_Acreedores.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

procedure TDMRPrevisionPago.xVer_ProveedoresAfterOpen(DataSet: TDataSet);
begin
  xCuentaTercerosProv.Open;
end;

procedure TDMRPrevisionPago.xVer_ProveedoresBeforeClose(DataSet: TDataSet);
begin
  xCuentaTercerosProv.Close;
end;

procedure TDMRPrevisionPago.xVer_AcreedoresAfterOpen(DataSet: TDataSet);
begin
  xCuentaTercerosAcre.Open;
end;

procedure TDMRPrevisionPago.xVer_AcreedoresBeforeClose(DataSet: TDataSet);
begin
  xCuentaTercerosAcre.Close;
end;

procedure TDMRPrevisionPago.ExportarExcel(Modo: integer; PBExportacion: TProgressBar; Fichero: string = '');
var
  auxMascaraN : string;
  HCalc : THojaCalc;
  c, f : integer;
  ColumnasAutoFit : TStrings;
  Exportar : boolean;

  procedure EscribeCampo(HC: THojaCalc; f, c: integer; Campo: TField);
  begin
     // Campo tipo String
     if (Campo is TStringField) then
        HC.CellText[f, c] := Trim(Campo.AsString);

     // Campo tipo Float
     if (Campo is TFloatField) then
        HC.SendNumber(f, c, Campo.AsFloat);

     // Campo tipo Integer
     if (Campo is TIntegerField) then
        HC.SendNumber(f, c, Campo.AsInteger);

     // Campo tipo Fecha
     if (Campo is TDateTimeField) then
     begin
        // HCalc.SendDate(f, c , Campo.AsDateTime)
        if (HC.IsOpenOffice) then
           HC.CellText[f, c] := DateToStr(Campo.AsDateTime)
        else
           HC.CellText[f, c] := Trim(FormatDateTime('MM/DD/YYYY', Campo.AsDateTime));
     end;

     // Campo tipo Blob
     // Los blobs exportan solo caracteres basicos.
     if (Campo is TBlobField) then
     begin
        try
           HC.CellText[f, c] := Trim(LimpiaCadena(Campo.AsString));
        except
           HC.CellText[f, c] := 'BLOB';
        end;
     end;
  end;

begin
  /// Exporta en formato Excel los recibos y algunos datos de otros datasets.

  Exportar := True;

  // Almacenar la máscara
  auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(Moneda, 1);

  if (Fichero = '') then
  begin
     Fichero := Format(_('PrevisionPago-%s'), [FormatDateTime('yyyymmdd_hhnnss', Now)]);
     Exportar := MySaveDialog(Fichero, 'ODS,XLS,ALL', '', 'DMRPrevisionPago');
  end;

  if Exportar then
  begin
     if (UpperCase(ExtractFileExt(Fichero)) = '.ODS') then
        HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
     else
        HCalc := THojaCalc.Create(thcExcel, False);

     try
        HCalc.FileName := Fichero; //Needs a file name before you SaveDoc!

        ColumnasAutoFit := TStringList.Create;
        try
           with QMAsientos do
           begin
              Last;
              PBExportacion.Max := RecordCount;
              First;

              // Titulos de columnas
              f := 1;
              c := 1;
              HCalc.CellText[f, c] := 'EJERCICIO';
              Inc(c);
              HCalc.CellText[f, c] := 'COD. PROV./ACR.';
              Inc(c);
              HCalc.CellText[f, c] := 'NOMBRE';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'SERIE';
              Inc(c);
              HCalc.CellText[f, c] := 'FACTURA';
              Inc(c);
              HCalc.CellText[f, c] := 'NRO. FAC. PROV./ACR.';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'FECHA DOC.';
              Inc(c);
              HCalc.CellText[f, c] := 'IMPORTE';
              Inc(c);
              HCalc.CellText[f, c] := 'VENCIMIENTO';
              Inc(c);
              HCalc.CellText[f, c] := 'IBAN';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'CTA. BANCO';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'CTA. PROV./ACR.';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'F. PAGO';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'DESC. F.P.';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'T. EFECTO';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'DESC. T.EFE.';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'EMITIDO';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'OBSERVACIONES';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);

              HCalc.CellText[f, c] := 'NIF';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);

              if (REntorno.Pais = 'CHL') then
              begin
                 HCalc.CellText[f, c] := 'TIPO DOC. TRIB.';
                 ColumnasAutoFit.Add(IntToStr(c));
                 Inc(c);
                 HCalc.CellText[f, c] := 'FOLIO';
                 ColumnasAutoFit.Add(IntToStr(c));
                 Inc(c);
              end;

              while not EOF do
              begin
                 Inc(f);
                 PBExportacion.Position := f;
                 c := 1;

                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('EJERCICIO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('CODCLI'));
                 Inc(c);
                 if ((QMAsientos.FieldByName('TIPO').AsString = 'FCR') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'AGA') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'AFA') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'NRA')) then
                    EscribeCampo(HCalc, f, c, xVer_Acreedores.FieldByName('TITULO'));
                 if ((QMAsientos.FieldByName('TIPO').AsString = 'FAP') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'AGP') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'AFP') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'NRP')) then
                    EscribeCampo(HCalc, f, c, xVer_Proveedores.FieldByName('TITULO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('SERIE'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('FACTURA'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('NUM_FACTURA'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('DOC_FECHA'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('IMPORTE'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('VENCIMIENTO'));
                 Inc(c);
                 if ((QMAsientos.FieldByName('TIPO').AsString = 'FCR') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'AGA') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'AFA') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'NRA')) then
                    EscribeCampo(HCalc, f, c, xCuentaTercerosAcre.FieldByName('IBAN'));
                 if ((QMAsientos.FieldByName('TIPO').AsString = 'FAP') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'AGP') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'AFP') or
                    (QMAsientos.FieldByName('TIPO').AsString = 'NRP')) then
                    EscribeCampo(HCalc, f, c, xCuentaTercerosProv.FieldByName('IBAN'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('BANCO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('CUENTA'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('FPAGO'));
                 Inc(c);
                 HCalc.CellText[f, c] := DameTituloFormaPago(QMAsientos.FieldByName('FPAGO').AsString);
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('EFECTO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('DESC_EFECTO'));
                 Inc(c);
                 HCalc.CellText[f, c] := ifthen((QMAsientos.FieldByName('RECIBIDO').AsInteger = 1), 'X', '');
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('OBSERVACIONES'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('NIF'));
                 Inc(c);

                 if (REntorno.Pais = 'CHL') then
                 begin
                    EscribeCampo(HCalc, f, c, xDatosDTE.FieldByName('TIPO_DOC_TRIBUTARIO'));
                    Inc(c);
                    EscribeCampo(HCalc, f, c, xDatosDTE.FieldByName('FOLIO'));
                    Inc(c);
                 end;

                 Next;
                 // Application.ProcessMessages;
              end;
           end;

           while ColumnasAutoFit.Count > 0 do
           begin
              HCalc.AutoFit(StrToInt(ColumnasAutoFit[0]));
              ColumnasAutoFit.Delete(0);
           end;
        finally
           ColumnasAutoFit.Free;
        end;
        HCalc.SaveDocAs(Fichero, (Pos('.XLS', UpperCase(ExtractFileExt(Fichero))) > 0));
     finally
        Sleep(1000);
        Application.ProcessMessages;
        HCalc.Free;
     end;
  end;

  // Restaurar la máscara
  MascaraN := auxMascaraN;
end;

end.
