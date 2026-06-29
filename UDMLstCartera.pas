unit UDMLSTCartera;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  SysUtils, FIBDataSetRO, HYFIBQuery, frxClass, frxHYReport;

type
  TDMLSTCartera = class(TDataModule)
     DSxRecibos: TDataSource;
     frRecibos: TfrHYReport;
     frDBxRecibos: TfrDBDataSet;
     DSCliente: TDataSource;
     frDBCliente: TfrDBDataSet;
     DSxRemesa: TDataSource;
     frDBxRemesa: TfrDBDataSet;
     DSxProveedores: TDataSource;
     DSxC_cartera_Agente: TDataSource;
     frDBxC_cartera_Agente: TfrDBDataSet;
     DSxClienteCuenta: TDataSource;
     frDBxClienteCuenta: TfrDBDataSet;
     DSxAcreedores: TDataSource;
     TLocal: THYTransaction;
     xImpagados: TFIBDataSetRO;
     frDBxImpagados: TfrDBDataSet;
     DSxImpagados: TDataSource;
     xRecibos: TFIBDataSetRO;
     xClientes: TFIBDataSetRO;
     xRemesa: TFIBDataSetRO;
     xProveedores: TFIBDataSetRO;
     xClienteCuenta: TFIBDataSetRO;
     xAcreedores: TFIBDataSetRO;
     xC_cartera_Agente: TFIBDataSetRO;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     frxRecibos: TfrxHYReport;
     TUpdate: THYTransaction;
     xMonedasMONEDA: TFIBStringField;
     xMonedasTITULO: TFIBStringField;
     procedure frRecibosGetValue(const ParName: string; var ParValue: variant);
     procedure DMLSTCarteraCreate(Sender: TObject);
     procedure DMLSTCarteraDestroy(Sender: TObject);
     procedure frRecibosEnterRect(Memo: TStringList; View: TfrView);
     procedure xRecibosAfterOpen(DataSet: TDataSet);
     procedure xRecibosAfterScroll(DataSet: TDataSet);
     procedure xC_cartera_AgenteAfterScroll(DataSet: TDataSet);
     procedure frxRecibosBeforePrint(Sender: TfrxReportComponent);
     procedure frxRecibosGetValue(const VarName: string; var Value: variant);
     procedure xRecibosBeforeClose(DataSet: TDataSet);
     procedure xC_cartera_AgenteAfterOpen(DataSet: TDataSet);
     procedure xC_cartera_AgenteBeforeClose(DataSet: TDataSet);
  private
     SW: integer;
     FDesdeFechaVencimiento, FHastaFechaVencimiento: TDateTime;
     FDesdeFechaFactura, FHastaFechaFactura: TDateTime;
     DesdeCodCliPro, HastaCodCliPro, FAgente: integer;
     SubTipoListado: integer;
     Signo: string;
     TipoListado: string;
     total: double;
     LocalMascaraN: string;
     procedure RecargarPagos(Q: THYFIBQuery; const Resultado, Tipo1, Tipo2, Tipo3, Tipo4: string);
     procedure RecargarCobros(Q: THYFIBQuery; const Resultado: string);
  public
     Cobrado, Impagado, Normal, Remesado, PagareConta: boolean;
     DesdeFecha, HastaFecha, CliDesde, CliHasta, AcrDesde, AcrHasta: TDateTime;
     ProvMin, ProvMax, AcrMin, AcrMax, CliMin, CliMax, Agente: string;
     procedure MostrarListado(DesdeFechaVencimiento, HastaFechaVencimiento, DesdeFechaFactura, HastaFechaFactura: TDateTime; min_CodCliPro, max_CodCliPro: integer; ASubTipoListado, Modo, recibido, aceptar, orden: integer);
     procedure Recargar;
     procedure MostrarListadoAge(DesdeFechaVencimiento, HastaFechaVencimiento, DesdeFechaFactura, HastaFechaFactura: TDateTime; Agente: integer; ASubTipoListado, Modo, recibido, aceptar, orden: integer);
  end;

var
  DMLSTCartera : TDMLSTCartera;

implementation

uses UDMMain, UEntorno, UUtiles, UFMIvaCartera, UDMListados, UFormGest, DateUtils, UDameDato;

{$R *.DFM}

procedure TDMLSTCartera.DMLSTCarteraCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  xMonedas.Open;
end;

procedure TDMLSTCartera.DMLSTCarteraDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLSTCartera.frRecibosGetValue(const ParName: string; var ParValue: variant);
var
  cli1, cli2 : string;
  CodCliPro : integer;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'INICIALIZA' then
     total := 0;

  if ParName = 'IMPORTE' then
  begin
     if (TipoListado = 'NA') then
     begin
        ParValue := DMMain.DameCambio(True, xRecibos.FieldByName('MONEDA').AsString, xMonedas.FieldByName('MONEDA').AsString, xRecibos.FieldByName('VENCIMIENTO').AsDateTime, xRecibos.FieldByName('LIQUIDO').AsFloat);
     end
     else
     begin
        ParValue := DMMain.DameCambio(True, xC_cartera_Agente.FieldByName('MONEDA').AsString, xMonedas.FieldByName('MONEDA').AsString, xC_cartera_Agente.FieldByName('VENCIMIENTO').AsDateTime, xC_cartera_Agente.FieldByName('LIQUIDO').AsFloat);
     end;

     total := total + ParValue;
  end;

  if ParName = 'TOTAL' then
     ParValue := total;

  if ParName = 'F_PAGO' then
  begin
     if (TipoListado = 'NA') then
        ParValue := xRecibos.FieldByName('TIPO_EFECTO').AsString;
     if (TipoListado = 'A') then
        ParValue := xC_Cartera_Agente.FieldByName('TIPO_EFECTO').AsString;
  end;

  if ParName = 'RECIBIDO' then
  begin
     if (TipoListado = 'NA') then
        case xRecibos.FieldByName('RECIBIDO').AsInteger of
           0: ParValue := 'N';
           1: ParValue := 'S';
        end;
     if (TipoListado = 'A') then
        case xC_Cartera_Agente.FieldByName('RECIBIDO').AsInteger of
           0: ParValue := 'N';
           1: ParValue := 'S';
        end;
  end;

  if ParName = 'NUM_REMESA' then
  begin
     if ((TipoListado = 'NA') and (xRecibos.FieldByName('REMESAR').Value = 1) and (xRecibos.FieldByName('REMESA').Value <> 0)) then
        ParValue := xRecibos.FieldByName('REMESA').AsString;
     if ((TipoListado = 'A') and (xC_Cartera_Agente.FieldByName('REMESAR').Value = 1) and
        (xC_Cartera_Agente.FieldByName('REMESA').Value <> 0)) then
        ParValue := xC_Cartera_Agente.FieldByName('REMESA').AsString;
  end;

  if ParName = 'FECHA_REMESA' then
  begin
     if ((TipoListado = 'NA') and (xRecibos.FieldByName('FECHA_CIERRE').AsString <> '') and
        (xRecibos.FieldByName('ESTADO_RECIBO').AsString = 'R')) then
        ParValue := xRecibos.FieldByName('FECHA_CIERRE').Value;
     if ((TipoListado = 'A') and (xC_Cartera_Agente.FieldByName('FECHA_CIERRE').AsString <> '') and (xC_Cartera_Agente.FieldByName('ESTADO_RECIBO').Value = 'R')) then
        ParValue := xC_Cartera_Agente.FieldByName('FECHA_CIERRE').Value;
  end;

  if ParName = 'FECHA_DEVOLUCION' then
  begin
     if ((TipoListado = 'NA') and (xRecibos.FieldByName('ESTADO_RECIBO').Value = 'I')) then
        ParValue := xRecibos.FieldByName('FECHA_CIERRE').Value;
     if ((TipoListado = 'A') and (xC_Cartera_Agente.FieldByName('ESTADO_RECIBO').Value = 'I')) then
        ParValue := xC_Cartera_Agente.FieldByName('FECHA_CIERRE').Value;
  end;

  if ParName = 'FECHA_COBRADO' then
  begin
     if ((TipoListado = 'NA') and (xRecibos.FieldByName('ESTADO_RECIBO').Value = 'C')) then
        ParValue := xRecibos.FieldByName('FECHA_CIERRE').Value;
     if ((TipoListado = 'A') and (xC_Cartera_Agente.FieldByName('ESTADO_RECIBO').Value = 'C')) then
        ParValue := xC_Cartera_Agente.FieldByName('FECHA_CIERRE').Value;
  end;

  if ParName = 'CC' then
  begin
     if TipoListado = 'NA' then
        ParValue := xRecibos.FieldByName('ESTADO_RECIBO').Value
     else
        ParValue := xC_Cartera_Agente.FieldByName('ESTADO_RECIBO').Value;
  end;

  if ParName = 'TITULO' then
     case SubTipoListado of
        2: ParValue := Format(_('PROVEEDORES ENTRE %d Y %d'), [DesdeCodCliPro, HastaCodCliPro]);
        5: ParValue := Format(_('ACREEDORES ENTRE %d Y %d'), [DesdeCodCliPro, HastaCodCliPro]);
        1, 3, 4:
        begin
           if ((TipoListado = 'NA') and (SubTipoListado = 1)) then
              ParValue := Format(_('CLIENTES ENTRE %d Y %d'), [DesdeCodCliPro, HastaCodCliPro]);
           if ((TipoListado = 'NA') and (SubTipoListado = 3)) then
           begin
              with xClienteCuenta do
              begin
                 Close;
                 Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
                 Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['Canal'].AsInteger := REntorno.Canal;
                 Params.ByName['Cliente'].AsInteger := DesdeCodCliPro;
                 Open;
                 cli1 := FieldByName('CUENTA').AsString;
              end;
              with xClienteCuenta do
              begin
                 Close;
                 Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
                 Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['Canal'].AsInteger := REntorno.Canal;
                 Params.ByName['Cliente'].AsInteger := HastaCodCliPro;
                 Open;
                 cli2 := FieldByName('CUENTA').AsString;
              end;
              ParValue := Format(_('CLIENTES ENTRE %d Y %d'), [cli1, cli2]);
           end;
           if TipoListado = 'A' then
              ParValue := _('AGENTE') + ' ' + IntToStr(FAgente) +
                 ' ' + DameTituloAgente(FAgente);
        end;
     end;

  if ParName = 'DesdeFecha' then
     ParValue := FDesdeFechaVencimiento;
  if ParName = 'HastaFecha' then
     ParValue := FHastaFechaVencimiento;

  if ParName = 'DesdeFechaFactura' then
     ParValue := FDesdeFechaFactura;
  if ParName = 'HastaFechaFactura' then
     ParValue := FHastaFechaFactura;

  if ParName = 'DESCRIPCION' then
  begin
     if (FAgente = 0) then
        CodCliPro := xRecibos.FieldByName('COD_CLI_PRO').AsInteger
     else
        CodCliPro := xC_cartera_Agente.FieldByName('COD_CLI_PRO').AsInteger;

     case SubTipoListado of
        1, 3, 4: // Cobros
           with xClientes do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              Params.ByName['Cod_Cli_Pro'].AsInteger := CodCliPro;
              Open;
              ParValue := FieldByName('NOMBRE_R_SOCIAL').AsString;
           end;
        2: // Pagos, Proveedores
           with xProveedores do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              {
              Params.ByName['Ejercicio'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger; // REntorno.Ejercicio;
              Params.ByName['Canal'].AsInteger := REntorno.Canal;
              }
              Params.ByName['Cod_Cli_Pro'].AsInteger := CodCliPro;
              Open;
              ParValue := FieldByName('NOMBRE_R_SOCIAL').AsString;
           end;
        5: // Pagos, Acreedores
           with xAcreedores do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              Params.ByName['Ejercicio'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
              // REntorno.Ejercicio;
              Params.ByName['Canal'].AsInteger := REntorno.Canal;
              Params.ByName['Acreedor'].AsInteger := CodCliPro;
              Open;
              ParValue := FieldByName('TITULO').AsString;
           end;
     end;
  end;

  if ParName = 'NIF' then
  begin
     if (FAgente = 0) then
        CodCliPro := xRecibos.FieldByName('COD_CLI_PRO').AsInteger
     else
        CodCliPro := xC_cartera_Agente.FieldByName('COD_CLI_PRO').AsInteger;

     case SubTipoListado of
        1, 3, 4: // Cobros
           with xClientes do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              Params.ByName['Cod_Cli_Pro'].AsInteger := CodCliPro;
              Open;
              ParValue := FieldByName('NIF').AsString;
           end;
        2: // Pagos, Proveedores
           with xProveedores do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              Params.ByName['Cod_Cli_Pro'].AsInteger := CodCliPro;
              Open;
              ParValue := FieldByName('NIF').AsString;
           end;
        5: //Pagos, Acreedores
           with xAcreedores do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              Params.ByName['Ejercicio'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger; // REntorno.Ejercicio;
              Params.ByName['Canal'].AsInteger := REntorno.Canal;
              Params.ByName['Acreedor'].AsInteger := CodCliPro;
              Open;
              ParValue := FieldByName('NIF').AsString;
           end;
     end;
  end;

  if ParName = 'TIPO' then
     case SubTipoListado of
        1: ParValue := _('Cliente');
        2: ParValue := _('Proveedor');
        3: ParValue := _('Cliente');
        4: ParValue := _('Proveedor');
        5: ParValue := _('Acreedor');
     end;

  if ParName = 'COD_CLIENTE' then
     case SubTipoListado of
        1: if TipoListado = 'NA' then
              ParValue := xRecibos.FieldByName('COD_CLI_PRO').Value
           else
              xC_Cartera_Agente.FieldByName('COD_CLI_PRO').Value;
        2: ParValue := xRecibos.FieldByName('COD_CLI_PRO').Value;
        3: with xClienteCuenta do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              Params.ByName['Ejercicio'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
              // REntorno.Ejercicio;
              Params.ByName['Canal'].AsInteger := REntorno.Canal;
              Params.ByName['Cliente'].AsInteger := xRecibos.FieldByName('COD_CLI_PRO').Value;
              Open;
              ParValue := xClienteCuenta.FieldByName('CUENTA').Value;
           end;
        4: with xClienteCuenta do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              Params.ByName['Ejercicio'].AsInteger := xC_Cartera_Agente.FieldByName('EJERCICIO').AsInteger;
              // REntorno.Ejercicio;
              Params.ByName['Canal'].AsInteger := REntorno.Canal;
              Params.ByName['Cliente'].AsInteger := xC_Cartera_Agente.FieldByName('COD_CLI_PRO').Value;
              Open;
              ParValue := xClienteCuenta.FieldByName('CUENTA').Value;
           end;
        5: ParValue := xRecibos.FieldByName('COD_CLI_PRO').Value;
     end;

  if ParName = 'RECIBIDOIMPAGADO' then
  begin
     if xImpagados.FieldByName('RECIBIDO').AsInteger = 0 then
        ParValue := 'N'
     else
        ParValue := 'S';
  end;
end;

procedure TDMLSTCartera.MostrarListado(DesdeFechaVencimiento, HastaFechaVencimiento, DesdeFechaFactura, HastaFechaFactura: TDateTime; min_CodCliPro, max_CodCliPro: integer; ASubTipoListado, Modo, recibido, aceptar, orden: integer);
var
  C, I, N, R, P, aux : string;
begin
  C := '';
  I := '';
  N := '';
  R := '';
  P := '';

  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);

  DMListados.Normalizar_Desde_Hasta(DesdeFechaVencimiento, HastaFechaVencimiento);
  DMListados.Normalizar_Desde_Hasta(min_CodCliPro, max_CodCliPro);
  FDesdeFechaVencimiento := Trunc(DesdeFechaVencimiento);
  FHastaFechaVencimiento := Trunc(HastaFechaVencimiento);
  FDesdeFechaFactura := Trunc(DesdeFechaFactura);
  FHastaFechaFactura := Trunc(HastaFechaFactura);
  DesdeFechaVencimiento := RecodeTime(DesdeFechaVencimiento, 0, 0, 0, 0);
  HastaFechaVencimiento := RecodeTime(HastaFechaVencimiento, 23, 59, 59, 999);
  DesdeFechaFactura := RecodeTime(DesdeFechaFactura, 0, 0, 0, 0);
  HastaFechaFactura := RecodeTime(HastaFechaFactura, 23, 59, 59, 999);
  DesdeCodCliPro := min_CodCliPro;
  HastaCodCliPro := max_CodCliPro;
  SubTipoListado := ASubTipoListado;
  FAgente := 0;

  if ((SubTipoListado = 1) or (SubTipoListado = 3)) then
  begin
     Signo := 'C';
     TipoListado := 'NA';
  end
  else
  begin
     Signo := 'P';
     TipoListado := 'NA';
  end;
  SW := 1;

  with xClientes do
  begin
     Close;
     DataSource := DSxRecibos;
  end;

  with xRemesa do
  begin
     Close;
     DataSource := DSxRecibos;
  end;

  with xRecibos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.SIGNO, DET.REGISTRO, DET.LINEA, CAR.COD_CLI_PRO, DET.VENCIMIENTO, ');
     SelectSQL.Add('        DET.CTA_PAGO, DET.LIQUIDO, DET.LIQUIDO_CANAL, DET.PAGADO, DET.IMPAGADO, FP.FORMA_PAGO, DET.TIPO_EFECTO, ');
     SelectSQL.Add('        DET.REMESAR, DET.ESTADO, DET.REMESA, CAR.DOC_NUMERO, CAR.DOC_SERIE, CAR.DOC_FECHA, CAR.DOC_TIPO, CAR.RIC, ');
     SelectSQL.Add('        CAR.RIVA, DET.FECHA_CIERRE, DET.ESTADO_RECIBO, DET.RECIBIDO, CAR.FECHA_REGISTRO, FP.ACEPTAR, DET.MONEDA, ');
     SelectSQL.Add('        DET.MONEDA_CANAL, CAR.ORIGEN_IMPAGADO ');
     SelectSQL.Add(' FROM EMP_CARTERA_DETALLE DET ');
     SelectSQL.Add(' LEFT JOIN EMP_CARTERA CAR ON (DET.ID_CARTERA = CAR.ID_CARTERA) ');
     SelectSQL.Add(' LEFT JOIN CON_CUENTAS_GES_FP FP ON (DET.EMPRESA = FP.EMPRESA AND DET.EJERCICIO = FP.EJERCICIO AND DET.CANAL = FP.CANAL AND CAR.FORMA_PAGO = FP.FORMA_PAGO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' DET.CANAL = :CANAL AND ');
     SelectSQL.Add(' DET.VISIBLE = 1 AND ');
     SelectSQL.Add(' DET.VENCIMIENTO <= :HASTA_VENCIMIENTO AND ');
     SelectSQL.Add(' DET.VENCIMIENTO >= :DESDE_VENCIMIENTO AND ');
     SelectSQL.Add(' CAR.COD_CLI_PRO <= :MAX_COD_CLI_PRO AND ');
     SelectSQL.Add(' CAR.COD_CLI_PRO >= :MIN_COD_CLI_PRO AND ');
     SelectSQL.Add(' CAR.DOC_FECHA <= :HASTA_FECHA_DOC AND ');
     SelectSQL.Add(' CAR.DOC_FECHA >= :DESDE_FECHA_DOC AND ');
     SelectSQL.Add(' DET.SIGNO = :SIGNO AND ');
     SelectSQL.Add(' ((CAR.DOC_TIPO = :TIPO) OR (CAR.DOC_TIPO = :TIPO2) OR (CAR.DOC_TIPO = :TIPO3) OR (CAR.DOC_TIPO = :TIPO4)) AND ');
     SelectSQL.Add(' DET.RECIBIDO <> :REC AND ');
     SelectSQL.Add(' FP.ACEPTAR <> :ACEPTADO ');

     if Cobrado then
     begin
        C := '''C''';
        aux := C;
     end;
     if Impagado then
     begin
        I := '''I''';
        aux := I;
     end;
     if Normal then
     begin
        N := '''N''';
        aux := N;
     end;
     if Remesado then
     begin
        R := '''R''';
        aux := R;
     end;
     if PagareConta then
     begin
        P := '''P''';
        aux := P;
     end;

     if not Cobrado then
        C := aux;
     if not Impagado then
        I := aux;
     if not Normal then
        N := aux;
     if not Remesado then
        R := aux;
     if not PagareConta then
        P := aux;

     if ((Cobrado) or (Impagado) or (Normal) or (Remesado) or (PagareConta)) then
     begin
        SelectSQL.Add(' AND ESTADO_RECIBO IN (' + C + ',' + I + ',' + N + ',' + R + ',' + P + ') ');
     end;

     case orden of
        0: SelectSQL.Add(' ORDER BY DET.VENCIMIENTO ');
        1: SelectSQL.Add(' ORDER BY DET.EJERCICIO, CAR.DOC_SERIE, CAR.DOC_NUMERO, DET.VENCIMIENTO ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['HASTA_VENCIMIENTO'].AsDateTime := HastaFechaVencimiento;
     Params.ByName['DESDE_VENCIMIENTO'].AsDateTime := DesdeFechaVencimiento;
     Params.ByName['HASTA_FECHA_DOC'].AsDateTime := HastaFechaFactura;
     Params.ByName['DESDE_FECHA_DOC'].AsDateTime := DesdeFechaFactura;
     Params.ByName['MAX_COD_CLI_PRO'].AsInteger := max_CodCliPro;
     Params.ByName['MIN_COD_CLI_PRO'].AsInteger := min_CodCliPro;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['Rec'].AsInteger := recibido;
     Params.ByName['Aceptado'].AsInteger := aceptar;
     case SubTipoListado of
        1, 3:
        begin
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['TIPO2'].AsString := 'AGC';
           Params.ByName['TIPO3'].AsString := 'NRC';
           Params.ByName['TIPO4'].AsString := 'AFC';
        end;
        2:
        begin
           Params.ByName['TIPO'].AsString := 'FAP';
           Params.ByName['TIPO2'].AsString := 'AGP';
           Params.ByName['TIPO3'].AsString := 'NRP';
           Params.ByName['TIPO4'].AsString := 'AFP';
        end;
        5:
        begin
           Params.ByName['TIPO'].AsString := 'FCR';
           Params.ByName['TIPO2'].AsString := 'AGA';
           Params.ByName['TIPO3'].AsString := 'NRA';
           Params.ByName['TIPO4'].AsString := 'AFA';
        end;
     end;
     Open;
  end;

  DMListados.Imprimir(28, 0, Modo, '', _('Listado Cartera'), frRecibos, frxRecibos, nil, nil);
end;

procedure TDMLSTCartera.MostrarListadoAge(DesdeFechaVencimiento, HastaFechaVencimiento, DesdeFechaFactura, HastaFechaFactura: TDateTime; Agente: integer; ASubTipoListado, Modo, recibido, aceptar, orden: integer);
var
  C, I, N, R, P, aux : string;
begin
  C := '';
  I := '';
  N := '';
  R := '';
  P := '';

  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);
  DMListados.Normalizar_Desde_Hasta(DesdeFechaVencimiento, HastaFechaVencimiento);
  SubTipoListado := ASubTipoListado;
  TipoListado := 'A';
  FDesdeFechaVencimiento := Trunc(DesdeFechaVencimiento);
  FHastaFechaVencimiento := Trunc(HastaFechaVencimiento);
  FDesdeFechaFactura := Trunc(DesdeFechaFactura);
  FHastaFechaFactura := Trunc(HastaFechaFactura);
  DesdeFechaVencimiento := RecodeTime(DesdeFechaVencimiento, 0, 0, 0, 0);
  HastaFechaVencimiento := RecodeTime(HastaFechaVencimiento, 23, 59, 59, 999);
  DesdeFechaFactura := RecodeTime(DesdeFechaFactura, 0, 0, 0, 0);
  HastaFechaFactura := RecodeTime(HastaFechaFactura, 23, 59, 59, 999);
  FAgente := Agente;
  Signo := 'C';
  SW := 1;

  with xClientes do
  begin
     Close;
     DataSource := DSxC_cartera_Agente;
  end;
  with xRemesa do
  begin
     Close;
     DataSource := DSxC_cartera_Agente;
  end;

  with xC_Cartera_agente do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT G.EMPRESA, G.EJERCICIO, G.CANAL, D.SIGNO, D.REGISTRO, D.LINEA, E.COD_CLI_PRO, D.VENCIMIENTO, D.CTA_PAGO, ');
     SelectSQL.Add('        D.LIQUIDO, D.LIQUIDO_CANAL, D.PAGADO, D.IMPAGADO, FP.FORMA_PAGO, D.TIPO_EFECTO, D.REMESAR, D.ESTADO, D.REMESA, ');
     SelectSQL.Add('        E.DOC_NUMERO, E.DOC_SERIE, E.DOC_FECHA, E.RIC, E.RIVA, D.FECHA_CIERRE, D.ESTADO_RECIBO, D.RECIBIDO, FP.ACEPTAR, ');
     SelectSQL.Add('        D.MONEDA, D.MONEDA_CANAL ');
     SelectSQL.Add(' FROM GES_CABECERAS_S G ');
     SelectSQL.Add(' LEFT JOIN EMP_CARTERA E ON ((G.EMPRESA = E.EMPRESA) AND (G.EJERCICIO = E.EJERCICIO) AND (G.CANAL = E.CANAL) AND (G.TIPO = E.DOC_TIPO) AND (G.RIG = E.DOC_NUMERO) AND (G.SERIE = DOC_SERIE)) ');
     SelectSQL.Add(' LEFT JOIN CON_CUENTAS_GES_FP FP ON ((E.EMPRESA = FP.EMPRESA) AND (E.EJERCICIO = FP.EJERCICIO) AND (E.CANAL = FP.CANAL) AND (E.FORMA_PAGO = FP.FORMA_PAGO)) ');
     SelectSQL.Add(' LEFT JOIN EMP_CARTERA_DETALLE D ON (D.ID_CARTERA = E.ID_CARTERA) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' G.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' G.CANAL = :CANAL AND ');
     SelectSQL.Add(' G.TIPO = ''FAC'' AND ');
     SelectSQL.Add(' G.AGENTE = :AGENTE AND ');
     SelectSQL.Add(' D.VENCIMIENTO >= :DESDE_VENCIMIENTO AND ');
     SelectSQL.Add(' D.VENCIMIENTO <= :HASTA_VENCIMIENTO AND ');
     SelectSQL.Add(' E.DOC_FECHA <= :HASTA_FECHA_DOC AND ');
     SelectSQL.Add(' E.DOC_FECHA >= :DESDE_FECHA_DOC AND ');
     SelectSQL.Add(' D.VISIBLE = 1 AND ');
     SelectSQL.Add(' FP.ACEPTAR <> :ACEPTADO AND ');
     SelectSQL.Add(' D.RECIBIDO <> :REC ');

     if Cobrado then
     begin
        C := '''C''';
        aux := C;
     end;
     if Impagado then
     begin
        I := '''I''';
        aux := I;
     end;
     if Normal then
     begin
        N := '''N''';
        aux := N;
     end;
     if Remesado then
     begin
        R := '''R''';
        aux := R;
     end;
     if PagareConta then
     begin
        P := '''P''';
        aux := P;
     end;

     if not Cobrado then
        C := aux;
     if not Impagado then
        I := aux;
     if not Normal then
        N := aux;
     if not Remesado then
        R := aux;
     if not PagareConta then
        P := aux;

     if ((Cobrado) or (Impagado) or (Normal) or (Remesado) or (PagareConta)) then
     begin
        SelectSQL.Add(' AND ESTADO_RECIBO IN (' + C + ',' + I + ',' + N + ',' + R + ',' + P + ') ');
     end;

     case orden of
        0: SelectSQL.Add(' ORDER BY D.VENCIMIENTO ');
        1: SelectSQL.Add(' ORDER BY G.EJERCICIO, E.DOC_SERIE, E.DOC_NUMERO, E.VENCIMIENTO ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['HASTA_VENCIMIENTO'].AsDateTime := HastaFechaVencimiento;
     Params.ByName['DESDE_VENCIMIENTO'].AsDateTime := DesdeFechaVencimiento;
     Params.ByName['HASTA_FECHA_DOC'].AsDateTime := HastaFechaFactura;
     Params.ByName['DESDE_FECHA_DOC'].AsDateTime := DesdeFechaFactura;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['REC'].AsInteger := recibido;
     Params.ByName['ACEPTADO'].AsInteger := aceptar;
     Open;
  end;

  DMListados.Imprimir(33, 0, Modo, '', _('Listado Cartera'), frRecibos, frxRecibos, nil, nil);
end;

procedure TDMLSTCartera.frRecibosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if memo[0] = 'UDS.' then
        SW := 1;
     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMLstCartera.Recargar;
var
  Q : THYFIBQuery;
  MinVto, MaxVto : TDateTime;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;

        // Min Max Proveedor
        RecargarPagos(Q, 'MIN(COD_CLI_PRO) MIN_COD_CLI_PRO, MAX(COD_CLI_PRO) MAX_COD_CLI_PRO, MIN(VENCIMIENTO) MIN_VTO, MAX(VENCIMIENTO) MAX_VTO', 'FAP', 'AGP', 'NRP', 'AFP');
        ExecQuery;
        ProvMin := FieldByName['MIN_COD_CLI_PRO'].AsString;
        ProvMax := FieldByName['MAX_COD_CLI_PRO'].AsString;

        // Min Max Vencimiento Proveedor
        DesdeFecha := FieldByName['MIN_VTO'].AsDateTime;
        if (DesdeFecha = 0) then
           DesdeFecha := Date;
        HastaFecha := FieldByName['MAX_VTO'].AsDateTime;
        if (HastaFecha = 0) then
           HastaFecha := Date;

        // Min Acreedor
        RecargarPagos(Q, 'MIN(COD_CLI_PRO) MIN_COD_CLI_PRO, MAX(COD_CLI_PRO) MAX_COD_CLI_PRO, MIN(VENCIMIENTO) MIN_VTO, MAX(VENCIMIENTO) MAX_VTO', 'FCR', 'AGA', 'NRA', 'AFA');
        ExecQuery;
        AcrMin := FieldByName['MIN_COD_CLI_PRO'].AsString;
        AcrMax := FieldByName['MAX_COD_CLI_PRO'].AsString;

        // Min Max Vencimiento Proveedor
        MinVto := FieldByName['MIN_VTO'].AsDateTime;
        if (MinVto > 0) then
           if (MinVto < DesdeFecha) then
              DesdeFecha := MinVto;
        MaxVto := FieldByName['MAX_VTO'].AsDateTime;
        if (MaxVto > 0) then
           if (MaxVto > HastaFecha) then
              HastaFecha := MaxVto;

        // Min Max Cliente
        RecargarCobros(Q, 'MIN(COD_CLI_PRO) MIN_COD_CLI_PRO, MAX(COD_CLI_PRO) MAX_COD_CLI_PRO, MIN(VENCIMIENTO) MIN_VTO, MAX(VENCIMIENTO) MAX_VTO');
        ExecQuery;
        CliMin := FieldByName['MIN_COD_CLI_PRO'].AsString;
        CliMax := FieldByName['MAX_COD_CLI_PRO'].AsString;

        // Min Max Vencimiento Cliente
        MinVto := FieldByName['MIN_VTO'].AsDateTime;
        if (MinVto > 0) then
           if (MinVto < DesdeFecha) then
              DesdeFecha := MinVto;
        MaxVto := FieldByName['MAX_VTO'].AsDateTime;
        if (MaxVto > 0) then
           if (MaxVto > HastaFecha) then
              HastaFecha := MaxVto;

        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Min Agente
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(AGENTE) FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL AND TIPO = ''FAC''';
        ExecQuery;
        Agente := FieldByName['MIN'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMLstCartera.RecargarPagos(Q: THYFIBQuery; const Resultado, Tipo1, Tipo2, Tipo3, Tipo4: string);
begin
  with Q do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT ' + Resultado);
     SQL.Add(' FROM VER_CARTERA_REM ');
     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = :EMPRESA AND ');
     SQL.Add(' CANAL= :CANAL AND ');
     SQL.Add(' SIGNO = ''P'' AND ');
     SQL.Add(' (DOC_TIPO = :TIPO OR DOC_TIPO = :TIPO2 OR DOC_TIPO = :TIPO3 OR DOC_TIPO = :TIPO4) ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := Tipo1;
     Params.ByName['TIPO2'].AsString := Tipo2;
     Params.ByName['TIPO3'].AsString := Tipo3;
  end;
end;

procedure TDMLstCartera.RecargarCobros(Q: THYFIBQuery; const Resultado: string);
begin
  with Q do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT ' + Resultado);
     SQL.Add(' FROM VER_CARTERA_REM ');
     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = :EMPRESA AND ');
     SQL.Add(' CANAL= :CANAL AND ');
     SQL.Add(' SIGNO = ''C'' ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  end;
end;

procedure TDMLSTCartera.xRecibosAfterOpen(DataSet: TDataSet);
begin
  xClientes.Open;
  xProveedores.Open;
  xRemesa.Open;
  xImpagados.Open;
end;

procedure TDMLSTCartera.xRecibosBeforeClose(DataSet: TDataSet);
begin
  xProveedores.Close;
  xClientes.Close;
  xRemesa.Close;
  xImpagados.Close;
end;

procedure TDMLSTCartera.xC_cartera_AgenteAfterOpen(DataSet: TDataSet);
begin
  xClientes.Open;
  xProveedores.Open;
  xRemesa.Open;
  xImpagados.Open;
end;

procedure TDMLSTCartera.xC_cartera_AgenteBeforeClose(DataSet: TDataSet);
begin
  xProveedores.Close;
  xClientes.Close;
  xRemesa.Close;
  xImpagados.Close;
end;

procedure TDMLSTCartera.xRecibosAfterScroll(DataSet: TDataSet);
begin
  with xImpagados do
  begin
     Close;
     if xRecibos.FieldByName('ESTADO_RECIBO').AsString = 'I' then
        Params.ByName['REGISTRO_IMPAGADO'].AsInteger := xRecibos.FieldByName('REGISTRO').AsInteger
     else
        Params.ByName['REGISTRO_IMPAGADO'].AsInteger := 0;
     Open;
  end;
end;

procedure TDMLSTCartera.xC_cartera_AgenteAfterScroll(DataSet: TDataSet);
begin
  with xImpagados do
  begin
     Close;
     if xC_Cartera_Agente.FieldByName('ESTADO_RECIBO').AsString = 'I' then
        Params.ByName['REGISTRO_IMPAGADO'].AsInteger := xC_Cartera_Agente.FieldByName('REGISTRO').AsInteger
     else
        Params.ByName['REGISTRO_IMPAGADO'].AsInteger := 0;
     Open;
  end;
end;

procedure TDMLSTCartera.frxRecibosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
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
           if Pos('UDS.', Memo[0]) > 0 then
              SW := 1;
        end;
end;

procedure TDMLSTCartera.frxRecibosGetValue(const VarName: string; var Value: variant);
begin
  frRecibosGetValue(VarName, Value);
end;

end.
