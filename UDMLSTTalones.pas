unit UDMLSTTalones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, HYFIBQuery, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, ALetras, UHYReport, FR_Class, Fr_HYReport, FR_DSet,
  FR_DBSet, frxClass, frxHYReport, FIBTableDataSet, DateUtils;

type
  TDMLstTalones = class(TDataModule)
     SPDameTalon: THYFIBQuery;
     xTalonDesde: TFIBDataSetRO;
     TLocal: THYTransaction;
     xTalonDesdeTALON: TFIBStringField;
     xTalonDesdeDESCRIPCION: TFIBStringField;
     xTalonHasta: TFIBDataSetRO;
     xTalonHastaTALON: TFIBStringField;
     xTalonHastaDESCRIPCION: TFIBStringField;
     DSxTalonDesde: TDataSource;
     DSxTalonHasta: TDataSource;
     xTalones: TFIBDataSetRO;
     Letra1: TLetra;
     HYTalones: THYReport;
     HYRSxTalones: THYReportSource;
     xProveedores: TFIBDataSetRO;
     DSxTalones: TDataSource;
     xAcreedores: TFIBDataSetRO;
     xProveedoresTITULO: TFIBStringField;
     xAcreedoresTITULO: TFIBStringField;
     SPDameTalonCta: THYFIBQuery;
     xTalonesCta: TFIBDataSetRO;
     DSxTalonesCta: TDataSource;
     HYRSxTalonesCta: THYReportSource;
     xCuentas: TFIBDataSetRO;
     xCuentasTITULO: TFIBStringField;
     xTalonesCtaEMPRESA: TIntegerField;
     xTalonesCtaEJERCICIO: TIntegerField;
     xTalonesCtaCANAL: TIntegerField;
     xTalonesCtaTALON: TFIBStringField;
     xTalonesCtaCUENTA: TFIBStringField;
     xTalonesCtaDESCRIPCION: TFIBStringField;
     xTalonesCtaLUGAR_LIBRAMIENTO: TFIBStringField;
     xTalonesCtaFECHA_LIBRAMIENTO: TDateTimeField;
     xTalonesCtaBANCO: TIntegerField;
     xTalonesCtaIMPORTE: TFloatField;
     xTalonesCtaPAGADO: TIntegerField;
     xDetalle: TFIBDataSetRO;
     DSxDetalle: TDataSource;
     HYRxDetalle: THYReportSource;
     xDetalleEMPRESA: TIntegerField;
     xDetalleEJERCICIO: TIntegerField;
     xDetalleCANAL: TIntegerField;
     xDetalleSIGNO: TFIBStringField;
     xDetalleREGISTRO: TIntegerField;
     xDetalleLINEA: TIntegerField;
     xDetalleCOD_CLI_PRO: TIntegerField;
     xDetalleVENCIMIENTO: TDateTimeField;
     xDetalleCTA_PAGO: TFIBStringField;
     xDetalleLIQUIDO: TFloatField;
     xDetallePAGADO: TIntegerField;
     xDetalleIMPAGADO: TIntegerField;
     xDetalleFORMA_PAGO: TFIBStringField;
     xDetalleTIPO_EFECTO: TFIBStringField;
     xDetalleACEPTADO: TIntegerField;
     xDetalleREMESAR: TIntegerField;
     xDetalleESTADO: TIntegerField;
     xDetalleREMESA: TIntegerField;
     xDetalleDOC_NUMERO: TIntegerField;
     xDetalleDOC_SERIE: TFIBStringField;
     xDetalleDOC_FECHA: TDateTimeField;
     xDetalleDOC_TIPO: TFIBStringField;
     xDetalleRIC: TIntegerField;
     xDetalleRIVA: TIntegerField;
     xDetalleFECHA_CIERRE: TDateTimeField;
     xDetalleESTADO_RECIBO: TFIBStringField;
     xDetalleRECIBIDO: TIntegerField;
     xDetalleCONFIRMING: TIntegerField;
     xDetalleTALON: TFIBStringField;
     xDetalleTALON_AUTOMATICO: TIntegerField;
     frDBxTalones: TfrDBDataSet;
     frDBDBDetalle: TfrDBDataSet;
     frCartaPago: TfrHYReport;
     xCodigoPostal: TFIBDataSetRO;
     DSxCodPostal: TDataSource;
     DSxDirPRO_ACR: TDataSource;
     xDirPRO_ACR: TFIBDataSetRO;
     xCodigoPostalCODPOSTAL: TFIBStringField;
     xDirPRO_ACRTERCERO: TIntegerField;
     xDirPRO_ACRNOMBRE_R_SOCIAL: TFIBStringField;
     xDirPRO_ACRNIF: TFIBStringField;
     xDirPRO_ACRDIR_COMPLETA: TFIBStringField;
     xDirPRO_ACRLOCALIDAD: TFIBStringField;
     xDirPRO_ACRTITULO_LOCALIDAD: TFIBStringField;
     xProveedoresTERCERO: TIntegerField;
     xAcreedoresTERCERO: TIntegerField;
     xBanco: TFIBDataSetRO;
     DSxBanco: TDataSource;
     xBancoEMPRESA: TIntegerField;
     xBancoBANCO: TIntegerField;
     xBancoTITULO: TFIBStringField;
     xBancoENTIDAD: TFIBStringField;
     xBancoSUCURSAL: TFIBStringField;
     xBancoCONTROL: TFIBStringField;
     xBancoRIESGO_CON: TFloatField;
     xBancoRIESGO_UTI: TFloatField;
     xBancoACTIVO: TIntegerField;
     xBancoRIESGO_DES: TFloatField;
     xBancoRIESGO_CFM: TFloatField;
     xBancoTERCERO: TIntegerField;
     Letras: TLetra;
     DSxProveedores: TDataSource;
     DSxAcreedores: TDataSource;
     xTalonesEMPRESA: TIntegerField;
     xTalonesEJERCICIO: TIntegerField;
     xTalonesCANAL: TIntegerField;
     xTalonesTALON: TFIBStringField;
     xTalonesCOD_CLI_PRO: TIntegerField;
     xTalonesTIPO_TERCERO: TFIBStringField;
     xTalonesDESCRIPCION: TFIBStringField;
     xTalonesLUGAR_LIBRAMIENTO: TFIBStringField;
     xTalonesFECHA_LIBRAMIENTO: TDateTimeField;
     xTalonesBANCO: TIntegerField;
     xTalonesIMPORTE: TFloatField;
     xTalonesPAGADO: TIntegerField;
     xTalonesRIC: TIntegerField;
     xTalonesASIENTO: TIntegerField;
     xNum_Factura: TFIBDataSetRO;
     DSxNumFactura: TDataSource;
     xNum_FacturaNUM_FACTURA: TFIBStringField;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xDetalleLIQUIDO_CANAL: TFloatField;
     xDetalleMONEDA: TFIBStringField;
     xCodigoPostalPROVINCIA: TFIBStringField;
     xBancoCUENTA_CORRIENTE: TFIBStringField;
     xBancoBIC: TFIBStringField;
     xBancoIBAN: TFIBStringField;
     frxCartaPago: TfrxHYReport;
     TUpdate: THYTransaction;
     xDirPRO_ACRDIR_TELEFONO01: TFIBStringField;
     xDirPRO_ACRDIR_TELEFONO02: TFIBStringField;
     xDirPRO_ACRDIR_TELEFAX: TFIBStringField;
     xDirPRO_ACRID_LOCAL: TIntegerField;
     xCodigoPostalPAIS: TFIBStringField;
     xDetalleRecAgrupKri: TFIBDataSetRO;
     DSxDetalleRecAgrupKri: TDataSource;
     xDetalleRecAgrupKriEMPRESA: TIntegerField;
     xDetalleRecAgrupKriEJERCICIO: TIntegerField;
     xDetalleRecAgrupKriCANAL: TIntegerField;
     xDetalleRecAgrupKriSIGNO: TFIBStringField;
     xDetalleRecAgrupKriREGISTRO: TIntegerField;
     xDetalleRecAgrupKriLINEA: TIntegerField;
     xDetalleRecAgrupKriVENCIMIENTO: TDateTimeField;
     xDetalleRecAgrupKriLIQUIDO: TFloatField;
     xDetalleRecAgrupKriCUENTA: TFIBStringField;
     xDetalleRecAgrupKriCUENTA_PGC: TIntegerField;
     xDetalleRecAgrupKriFECHA_REGISTRO: TDateTimeField;
     xDetalleRecAgrupKriDOC_NUMERO: TIntegerField;
     xDetalleRecAgrupKriDOC_SERIE: TFIBStringField;
     xDetalleRecAgrupKriDOC_TIPO: TFIBStringField;
     xDetalleRecAgrupKriDOC_FECHA: TDateTimeField;
     xDetalleRecAgrupKriFORMA_PAGO: TFIBStringField;
     xDetalleRecAgrupKriCOD_CLI_PRO: TIntegerField;
     xDetalleRecAgrupKriRIC: TIntegerField;
     HYRSxDetalleRecAgrupKri: THYReportSource;
     frDBxDetalleRecAgrupKri: TfrDBDataSet;
     xTalonesMARCA_CONT: TIntegerField;
     xTalonesTALON_PAPEL: TFIBStringField;
     xTalonesList: TFIBTableSet;
     DSxTalonesList: TDataSource;
     xTalonesListTALON: TFIBStringField;
     xTalonesListTIPO_TERCERO: TFIBStringField;
     xTalonesListDESCRIPCION: TFIBStringField;
     xTalonesListIMPORTE: TFloatField;
     xTalonesListPAGADO: TIntegerField;
     xTalonesListRIC: TIntegerField;
     xTalonesListASIENTO: TIntegerField;
     xTalonesListTIPO_ASIENTO_KRI: TFIBStringField;
     xTalonesListTALON_PAPEL: TFIBStringField;
     xTalonesListMARCA_CONT: TIntegerField;
     xTalonesListEMPRESA: TIntegerField;
     xTalonesListEJERCICIO: TIntegerField;
     xTalonesListCANAL: TIntegerField;
     xTalonesListCOD_CLI_PRO: TIntegerField;
     xTalonesListLUGAR_LIBRAMIENTO: TFIBStringField;
     xTalonesListFECHA_LIBRAMIENTO: TDateTimeField;
     xTalonesListBANCO: TIntegerField;
     xDirPRO_ACRDIRECCION_2: TFIBStringField;
     xDirPRO_ACRDIRECCION: TIntegerField;
     xTalonesTIPO_ASIENTO_KRI: TFIBStringField;
     xTalonesZ_CONTADOR: TIntegerField;
     xTalonesZ_NOTASTALON: TBlobField;
     xModoImporte: THYFIBQuery;
     frTalon: TfrHYReport;
     frxTalon: TfrxHYReport;
     xTalonesCtaRIC: TIntegerField;
     xTalonesCtaASIENTO: TIntegerField;
     xTalonesCtaZ_NOTASTALONCC: TBlobField;
     xTalonesCtaZ_CONTADOR: TIntegerField;
     procedure DMLstTalonesCreate(Sender: TObject);
     procedure HYTalonesEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure DMLstTalonesDestroy(Sender: TObject);
     procedure xTalonesCtaAfterScroll(DataSet: TDataSet);
     procedure frCartaPagoGetValue(const ParName: string; var ParValue: variant);
     procedure xTalonesAfterScroll(DataSet: TDataSet);
     procedure frCartaPagoEnterRect(Memo: TStringList; View: TfrView);
     procedure frxCartaPagoBeforePrint(Sender: TfrxReportComponent);
     procedure frxCartaPagoGetValue(const VarName: string; var Value: variant);
     procedure xDirPRO_ACRAfterOpen(DataSet: TDataSet);
     procedure xDirPRO_ACRBeforeClose(DataSet: TDataSet);
     procedure xDetalleAfterOpen(DataSet: TDataSet);
     procedure xDetalleBeforeClose(DataSet: TDataSet);
     procedure xTalonesListAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     tipo_talon: smallint;
     LocalMascaraN: string;
     function FechaLibramiento: string;
  public
     { Public declarations }
     procedure MostrarListado(desde, hasta: string; Modo: smallint; tipo_listado: smallint; NoContabilizados: boolean);
     procedure DameTalon(var Desde, Hasta: string; NoContabilizado: boolean);
     procedure DameTalonCta(var Desde, Hasta: string);
     procedure MostrarCartaPago(Talon: string; Modo, NoContabilizado: smallint; SerieKri: string);
     procedure MostrarListadoTalones(TalonD, TalonH: string; modo: smallint; NoContabilizado: boolean; SerieKri: string);
     procedure FiltrarContabilizados(NoContabilizado: boolean);
  end;

var
  DMLstTalones : TDMLstTalones;

implementation

uses UEntorno, UUtiles, UDMMain, UDMListados, UFormGest;

{$R *.DFM}

procedure TDMLstTalones.MostrarListado(desde, hasta: string; Modo: smallint; tipo_listado: smallint; NoContabilizados: boolean);
var
  str : string;
  i : smallint;
begin
  str := '';
  tipo_talon := tipo_listado;
  if tipo_talon = 1 then
  begin
     with xTalones do
     begin
        Close;
        {dji lrk kri - Fercam - Opcion de que solo salgan los no pagados}
        SelectSQL.Text := 'SELECT * FROM VER_TALONES WHERE EMPRESA=?EMPRESA AND ' +
           'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND ' +
           'TALON<=?TALONHASTA';
        if NoContabilizados then
           SelectSQL.Text := SelectSQL.Text + ' AND PAGADO = 0';
        SelectSQL.Text := SelectSQL.Text + ' order by talon';

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TALONDESDE'].AsString := desde;
        Params.ByName['TALONHASTA'].AsString := hasta;
        Open;
        DMListados.Cargar(502, str);
     end;
  end;
  if tipo_talon = 2 then
  begin
     with xTalonesCta do
     begin
        Close;
        {dji lrk kri - Fercam - Opcion de que solo salgan los no pagados}
        SelectSQL.Text := 'SELECT * FROM VER_TALONES_CTA WHERE EMPRESA=?EMPRESA AND ' +
           'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND ' +
           'TALON<=?TALONHASTA';
        if NoContabilizados then
           SelectSQL.Text := SelectSQL.Text + ' AND PAGADO = 0';
        SelectSQL.Text := SelectSQL.Text + ' order by talon';

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TALONDESDE'].AsString := desde;
        Params.ByName['TALONHASTA'].AsString := hasta;
        Open;
        DMListados.Cargar(503, str);
     end;
  end;
  if (REntorno.TipoListado = 'FRF') then
  begin
     frTalon.LoadFromFIB(REntorno.Formato, str);
     frTalon.Title := 'Talones (' + desde + '-' + hasta + ')';
     frTalon.PrepareReport;
     case Modo of
        0: frTalon.ShowPreparedReport;
        1: frTalon.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxTalon.LoadFromFIB(REntorno.Formato, str);
     frxTalon.PrepareReport;
     case Modo of
        0: frxTalon.ShowPreparedReport;
        1: frxTalon.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     HYTalones.LoadFromFIB(REntorno.Formato, str);
     HYTalones.Prepare;
     case Modo of
        0: HYTalones.Preview;
        1: for i := 1 to REntorno.Copias do
              HYTalones.Print(REntorno.NombreMatricial);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstTalones.DameTalon(var Desde, Hasta: string; NoContabilizado: boolean);
begin
  with xTalonDesde do
  begin
     Close;
     SelectSQL[0] := 'SELECT * FROM VER_TALONES';
  end;
  with xTalonHasta do
  begin
     Close;
     SelectSQL[0] := 'SELECT * FROM VER_TALONES';
  end;
  with SPDameTalon do
  begin
     Close;
     if (NoContabilizado) then
        SQL.Text := 'select max(talon),min(talon) from ver_talones where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?canal)and(pagado=0))'
     else
        SQL.Text := 'select max(talon),min(talon) from ver_talones where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?canal))';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Desde := FieldByName['MIN'].AsString;
     Hasta := FieldByName['MAX'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLstTalones.DameTalonCta(var Desde, Hasta: string);
begin
  with xTalonDesde do
  begin
     Close;
     SelectSQL[0] := 'SELECT * FROM VER_TALONES_CTA';
  end;
  with xTalonHasta do
  begin
     Close;
     SelectSQL[0] := 'SELECT * FROM VER_TALONES_CTA';
  end;
  with SPDameTalonCta do
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

procedure TDMLstTalones.DMLstTalonesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  xTalonesIMPORTE.DisplayFormat := MascaraN;
  xTalonesListIMPORTE.DisplayFormat := MascaraN;
  xTalonDesde.Open;
  xTalonHasta.Open;
  xBanco.Open;
  xDetalle.Open;
  Letras.DescDecimales := _('céntimos');
  Letras.Separador := DecimalSeparator;
  Letra1.DescDecimales := _('céntimos');
  Letra1.Separador := DecimalSeparator;
end;

procedure TDMLstTalones.HYTalonesEnterFields(Sender: THYReport; Field: THYField; var Source: string);
var
  fecha : TDateTime;
  importe : double;
  ModoDec : integer;
  sl : TStrings;
begin
  if tipo_talon = 1 then
  begin
     fecha := xTalonesFECHA_LIBRAMIENTO.AsDateTime;
     importe := xTalonesIMPORTE.AsFloat;
  end
  else
  begin
     fecha := xTalonesCtaFECHA_LIBRAMIENTO.AsDateTime;
     importe := xTalonesCtaIMPORTE.AsFloat;
  end;

  if Source = '[TITULAR]' then
  begin
     if xTalonesTIPO_TERCERO.AsString = 'PRO' then
     begin
        xProveedores.Close;
        xProveedores.Open;
        Source := xProveedoresTITULO.AsString;
     end;
     if xTalonesTIPO_TERCERO.AsString = 'ACR' then
     begin
        xAcreedores.Close;
        xAcreedores.Open;
        Source := xAcreedoresTITULO.AsString;
     end;
  end;
  if Source = '[TITULAR_CTA]' then
  begin
     xCuentas.Close;
     xCuentas.Open;
     Source := xCuentasTITULO.AsString;
  end;
  if Source = '[IMPORTE]' then
     Source := '##' + FormatFloat(MascaraN, importe) + '##';

  if (Source = '[LETRAS1]') then
  begin
     with xModoImporte do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        ModoDec := FieldByName['Importe_Letras'].AsInteger;
        FreeHandle;
     end;

     Letra1.Numero := importe;
     // Letra1.ModoDecimales := 0;
     Letra1.ModoDecimales := ModoDec;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Open;
        Letra1.Moneda := LowerCase(FieldByName('TITULO').AsString);
        Letra1.GeneroMasculino := (FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letra1.Decimales := FieldByName('DEC_VER').AsInteger;
        Letra1.DescDecimales := FieldByName('DESC_DECIMALES').AsString;
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
        Letra1.Moneda := LowerCase(FieldByName('TITULO').AsString);
        Letra1.GeneroMasculino := (FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letra1.Decimales := FieldByName('DEC_VER').AsInteger;
        Letra1.DescDecimales := FieldByName('DESC_DECIMALES').AsString;
        Letra1.LongLinea := 200;
        Letra1.LongPrimeraLinea := 200;
     end;
     Source := Letra1.AsString;
  end;

  if Source = '[DIA]' then
  begin
     Source := xTalonesLUGAR_LIBRAMIENTO.AsString + ', ' +
        Copy(DateToStr(fecha), 1, 2);
  end;
  if Source = '[DIA_CTA]' then
  begin
     Source := xTalonesCtaLUGAR_LIBRAMIENTO.AsString + ', ' +
        Copy(DateToStr(fecha), 1, 2);
  end;
  if Source = '[MES]' then
  begin
     Source := MesStr(MonthOf(Fecha));
  end;
  if Source = '[ANO]' then
  begin
     Source := Copy(DateToStr(fecha), 7, 4);
  end;
  if Source = ' ' then
     Source := '';
  if Source = '[COMENTARIO]' then
     Source := xTalonesCtaZ_NOTASTALONCC.AsString;
end;

procedure TDMLstTalones.DMLstTalonesDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstTalones.xTalonesCtaAfterScroll(DataSet: TDataSet);
begin
  xCuentas.Close;
  xCuentas.Open;
end;

procedure TDMLstTalones.MostrarCartaPago(Talon: string; Modo, NoContabilizado: smallint; SerieKri: string);
var
  str : string;
  i : smallint;
begin
  tipo_talon := 1;

  with xTalones do
  begin
     Close;
     {dji lrk kri - Fercam - Opcion de que solo salgan los no pagados}
     if (NoContabilizado = 1) then
     begin
        SelectSQL.Text := 'SELECT * FROM VER_TALONES WHERE EMPRESA=?EMPRESA AND ' +
           'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND ' +
           'TALON<=?TALONHASTA AND PAGADO = 0';
        if (Length(SerieKri) > 1) then
           SelectSQL.Text := SelectSQL.Text + ' AND talon in (SELECT talon FROM VER_CARTERA_TALONES WHERE ' +
              'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND TALON<=?TALONHASTA  AND ' +
              'TALON_AUTOMATICO=1 AND pagado=0 and doc_serie = ''' + SerieKri + ''')';

        SelectSQL.Text := SelectSQL.Text + ' order by talon';

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TALONDESDE'].AsString := '';
        Params.ByName['TALONHASTA'].AsString := 'zzzzzzzzzzzzzzz';
     end
     else
     begin
        SelectSQL.Text := 'SELECT * FROM VER_TALONES WHERE EMPRESA=?EMPRESA AND ' +
           'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND ' +
           'TALON<=?TALONHASTA';

        if (Length(SerieKri) > 1) then
           SelectSQL.Text := SelectSQL.Text + ' AND talon in (SELECT talon FROM VER_CARTERA_TALONES WHERE ' +
              'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND TALON<=?TALONHASTA  AND ' +
              'TALON_AUTOMATICO=1 AND pagado=0 and doc_serie = ''' + SerieKri + ''')';

        SelectSQL.Text := SelectSQL.Text + ' order by talon';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TALONDESDE'].AsString := Talon;
        Params.ByName['TALONHASTA'].AsString := Talon;
     end;
     Open;
  end;

  DMListados.Cargar(93, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frCartaPago.LoadFromFIB(REntorno.Formato, str);
     frCartaPago.PrepareReport;
     case Modo of
        0: frCartaPago.ShowPreparedReport;
        1: frCartaPago.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     HYTalones.LoadFromFIB(REntorno.Formato, str);
     HYTalones.Prepare;
     case Modo of
        0: HYTalones.Preview;
        1: for i := 1 to REntorno.Copias do
              HYTalones.Print(REntorno.NombreMatricial);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxCartaPago.LoadFromFIB(REntorno.Formato, str);
     frxCartaPago.PrepareReport;
     case Modo of
        0: frxCartaPago.ShowPreparedReport;
        1: frxCartaPago.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstTalones.frCartaPagoGetValue(const ParName: string; var ParValue: variant);
var
  fecha : TDateTime;
  importe : double;
  tabla, s : string;
  Q : THYFIBQuery;
begin
  DMListados.GetValue(ParName, ParValue);

  if tipo_talon = 1 then
  begin
     fecha := xTalonesFECHA_LIBRAMIENTO.AsDateTime;
     importe := xTalonesIMPORTE.AsFloat;
  end
  else
  begin
     fecha := xTalonesCtaFECHA_LIBRAMIENTO.AsDateTime;
     importe := xTalonesCtaIMPORTE.AsFloat;
  end;

  if ParName = 'ImporteLetras' then
  begin
     Letras.Numero := importe;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Open;
        Letras.Moneda := LowerCase(FieldByName('TITULO').AsString);
        Letras.GeneroMasculino := (FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := FieldByName('DESC_DECIMALES').AsString;
     end;
     ParValue := Letras.AsString;
  end;

  if ParName = 'FECHA' then
     ParValue := FechaLibramiento;

  if ParName = 'IMPORTE' then
     ParValue := FormatFloat(MascaraN, importe);

  if ParName = 'Liquido' then
  begin
     LocalMascaraN := DMMain.MascaraMoneda(xDetalle.FieldByName('MONEDA').AsString, 1);
     ParValue := FormatFloat(LocalMascaraN, xDetalle.FieldByName('LIQUIDO').AsFloat);
  end;

  if ParName = 'Mes' then
  begin
     ParValue := MesStr(MonthOf(fecha));
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
     if xTalonesTIPO_TERCERO.AsString = 'PRO' then
        tabla := 'GES_CABECERAS_E_FAC';
     if xTalonesTIPO_TERCERO.AsString = 'ACR' then
        tabla := 'GES_CABECERAS_E_FCR';
     with xNum_Factura do
     begin
        Close;
        SelectSQL.Text := 'SELECT NUM_FACTURA FROM ' + tabla + ' ' +
           'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ' +
           'CANAL=?CANAL AND SERIE=?SERIE AND RIG=?RIG';
        Params.ByName['EMPRESA'].AsInteger := xDetalleEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xDetalleEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xDetalleCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xDetalleDOC_SERIE.AsString;
        Params.ByName['RIG'].AsInteger := xDetalleDOC_NUMERO.AsInteger;
        Open;
        ParValue := xNum_facturaNUM_FACTURA.AsString;
     end;
  end;

  if ParName = 'NUM_FAC_FERCAM' then
  begin
     ParValue := '';
     if ((xDetalleDOC_TIPO.AsString = 'FAP') or
        (xDetalleDOC_TIPO.AsString = 'FCR')) then
     begin
        if (xDetalleDOC_TIPO.AsString = 'FAP') then
           tabla := 'GES_CABECERAS_E_FAC';
        if (xDetalleDOC_TIPO.AsString = 'FCR') then
           tabla := 'GES_CABECERAS_E_FCR';
        with xNum_Factura do
        begin
           Close;
           SelectSQL.Text := 'SELECT NUM_FACTURA FROM ' + tabla + ' ' +
              'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ' +
              'CANAL=?CANAL AND SERIE=?SERIE AND RIG=?RIG';
           Params.ByName['EMPRESA'].AsInteger := xDetalleEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xDetalleEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := xDetalleCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := xDetalleDOC_SERIE.AsString;
           Params.ByName['RIG'].AsInteger := xDetalleDOC_NUMERO.AsInteger;
           Open;
           ParValue := xNum_facturaNUM_FACTURA.AsString;
        end;
     end;
     if xDetalleDOC_TIPO.AsString = 'AFP' then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select titulo from con_cuentas_asientos ' +
              'where empresa=' + xDetalleEMPRESA.AsString + ' and ejercicio=' + xDetalleEJERCICIO.AsString + ' and canal=' + xDetalleCANAL.AsString + ' and ric=' + xDetalleRIC.AsString;
           ExecQuery;
           s := FieldByName['TITULO'].AsString;
           ParValue := Copy(s, Pos('(', s) + 1, Pos(')', s) - Pos('(', s) - 1);
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
     if xDetalleDOC_TIPO.AsString = 'AFC' then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select doc_serie,doc_numero from con_cuentas_apuntes ' +
              'where empresa=' + xDetalleEMPRESA.AsString + ' and ejercicio=' + xDetalleEJERCICIO.AsString + ' and canal=' + xDetalleCANAL.AsString + ' and ric=' + xDetalleRIC.AsString + ' and linea=1';
           ExecQuery;
           ParValue := Format(_('Nuestra Factura %s/%s'), [FieldByName['DOC_SERIE'].AsString, FieldByName['DOC_NUMERO'].AsString]);
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
  end;

  if ParName = 'NUM_FAC_FERCAM_AGR' then
  begin
     ParValue := '';
     if ((xDetalleRecAgrupKriDOC_TIPO.AsString = 'FAP') or (xDetalleRecAgrupKriDOC_TIPO.AsString = 'FCR')) then
     begin
        if (xDetalleRecAgrupKriDOC_TIPO.AsString = 'FAP') then
           tabla := 'GES_CABECERAS_E_FAC';
        if (xDetalleRecAgrupKriDOC_TIPO.AsString = 'FCR') then
           tabla := 'GES_CABECERAS_E_FCR';
        with xNum_Factura do
        begin
           Close;
           SelectSQL.Text := 'SELECT NUM_FACTURA FROM ' + tabla + ' ' +
              'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ' +
              'CANAL=?CANAL AND SERIE=?SERIE AND RIG=?RIG';
           Params.ByName['EMPRESA'].AsInteger := xDetalleRecAgrupKriEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xDetalleRecAgrupKriEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := xDetalleRecAgrupKriCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := xDetalleRecAgrupKriDOC_SERIE.AsString;
           Params.ByName['RIG'].AsInteger := xDetalleRecAgrupKriDOC_NUMERO.AsInteger;
           Open;
           ParValue := xNum_facturaNUM_FACTURA.AsString;
        end;
     end;
     if (xDetalleRecAgrupKriDOC_TIPO.AsString = 'FAC') then
     begin
        ParValue := Format(_('Nuestra Factura %s/%s'), [xDetalleRecAgrupKriDOC_SERIE.AsString, xDetalleRecAgrupKriDOC_NUMERO.AsString]);
     end;
     if xDetalleRecAgrupKriDOC_TIPO.AsString = 'AFP' then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select titulo from con_cuentas_asientos ' +
              'where empresa=' + xDetalleRecAgrupKriEMPRESA.AsString + ' and ejercicio=' + xDetalleRecAgrupKriEJERCICIO.AsString +
              ' and canal=' + xDetalleRecAgrupKriCANAL.AsString + ' and ric=' + xDetalleRecAgrupKriRIC.AsString;
           ExecQuery;
           s := FieldByName['TITULO'].AsString;
           ParValue := Copy(s, Pos('(', s) + 1, Pos(')', s) - Pos('(', s) - 1);
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
     if xDetalleRecAgrupKriDOC_TIPO.AsString = 'AFC' then
     begin
        ParValue := Format(_('Nuestra Factura %s/%s'), [xDetalleRecAgrupKriDOC_SERIE.AsString, xDetalleRecAgrupKriDOC_NUMERO.AsString]);
     end;
  end;
end;

procedure TDMLstTalones.xTalonesAfterScroll(DataSet: TDataSet);
begin
  xDirPRO_ACR.Close;
  if xTalonesTIPO_TERCERO.AsString = 'PRO' then
  begin
     xDirPRO_ACR.DataSource := DSXProveedores;
     xProveedores.Close;
     xProveedores.Open;
  end
  else
  begin
     xDirPRO_ACR.DataSource := DSxAcreedores;
     xAcreedores.Close;
     xAcreedores.Open;
  end;
  xDirPRO_ACR.Open;
end;

function TDMLstTalones.FechaLibramiento: string;
var
  ano, mes, dia : word;
begin
  if tipo_talon = 1 then
     DecodeDate(xTalonesFECHA_LIBRAMIENTO.AsDateTime, ano, mes, dia)
  else
     DecodeDate(xTalonesCtaFECHA_LIBRAMIENTO.AsDateTime, ano, mes, dia);
  Result := Format(_('%d de %s del %d'), [dia, MesStr(mes), ano]); // Dia de MesStr del Año
end;

procedure TDMLstTalones.frCartaPagoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMLstTalones.frxCartaPagoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstTalones.frxCartaPagoGetValue(const VarName: string; var Value: variant);
begin
  frCartaPagoGetValue(VarName, Value);
end;

procedure TDMLstTalones.MostrarListadoTalones(TalonD, TalonH: string; modo: smallint; NoContabilizado: boolean; SerieKri: string);
var
  str : string;
  i : smallint;
begin
  with xTalones do
  begin
     Close;
     {dji lrk kri - Fercam - Opcion de que solo salgan los no pagados}
     SelectSQL.Text := 'SELECT * FROM VER_TALONES WHERE EMPRESA=?EMPRESA AND ' +
        'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND ' +
        'TALON<=?TALONHASTA ';

     if (NoContabilizado) then
        SelectSQL.Text := SelectSQL.Text + ' AND PAGADO = 0 ';

     if (Length(SerieKri) > 1) then
        SelectSQL.Text := SelectSQL.Text + 'AND talon in (SELECT talon FROM VER_CARTERA_TALONES WHERE ' +
           'EMPRESA=?EMPRESA AND EJERCICIO<=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND TALON<=?TALONHASTA  AND ' +
           'TALON_AUTOMATICO=1 AND pagado=0 and doc_serie = ''' + SerieKri + ''')';

     SelectSQL.Text := SelectSQL.Text + ' order by talon ';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (NoContabilizado) then
     begin
        Params.ByName['TALONDESDE'].AsString := '';
        Params.ByName['TALONHASTA'].AsString := 'zzzzzzzzzzzzzzz';
     end
     else
     begin
        Params.ByName['TALONDESDE'].AsString := TalonD;
        Params.ByName['TALONHASTA'].AsString := TalonH;
     end;
     Open;
  end;

  DMListados.Cargar(5093, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frCartaPago.LoadFromFIB(REntorno.Formato, str);
     frCartaPago.PrepareReport;
     case Modo of
        0: frCartaPago.ShowPreparedReport;
        1: frCartaPago.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     HYTalones.LoadFromFIB(REntorno.Formato, str);
     HYTalones.Prepare;
     case Modo of
        0: HYTalones.Preview;
        1: for i := 1 to REntorno.Copias do
              HYTalones.Print(REntorno.NombreMatricial);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxCartaPago.LoadFromFIB(REntorno.Formato, str);
     frxCartaPago.PrepareReport;
     case Modo of
        0: frxCartaPago.ShowPreparedReport;
        1: frxCartaPago.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstTalones.xDirPRO_ACRAfterOpen(DataSet: TDataSet);
begin
  xCodigoPostal.Open;
end;

procedure TDMLstTalones.xDirPRO_ACRBeforeClose(DataSet: TDataSet);
begin
  xCodigoPostal.Close;
end;

procedure TDMLstTalones.xDetalleAfterOpen(DataSet: TDataSet);
begin
  xDetalleRecAgrupKri.Open;
end;

procedure TDMLstTalones.xDetalleBeforeClose(DataSet: TDataSet);
begin
  xDetalleRecAgrupKri.Close;
end;

procedure TDMLstTalones.FiltrarContabilizados(NoContabilizado: boolean);
begin
  with xTalones do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_TALONES WHERE EMPRESA=?EMPRESA AND ' +
        'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON>=?TALONDESDE AND ' +
        'TALON<=?TALONHASTA';
     if (NoContabilizado) then
        SelectSQL.Text := SelectSQL.Text + ' AND PAGADO = 0';
     SelectSQL.Text := SelectSQL.Text + ' order by talon';

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TALONDESDE'].AsString := xTalonDesdeTALON.AsString;
     Params.ByName['TALONHASTA'].AsString := xTalonHastaTALON.AsString;
     Open;
  end;
  with xTalonesList do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TALONDESDE'].AsString := xTalonDesdeTALON.AsString;
     Params.ByName['TALONHASTA'].AsString := xTalonHastaTALON.AsString;
     Open;
  end;
end;

procedure TDMLstTalones.xTalonesListAfterPost(DataSet: TDataSet);
var
  Talon_Papel : integer;
  Talon : string;
  Q : THYFIBQuery;
begin
  Talon := xTalonesListTALON.AsString;
  Talon_Papel := StrToInt(xTalonesListTALON_PAPEL.AsString);

  with xTalonesList do
  begin
     DisableControls;
     Next;
     while not EOF do
     begin
        Talon_Papel := Talon_Papel + 1;
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE VER_TALONES SET TALON_PAPEL=?TALON_PAPEL ' +
              'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ' +
              'CANAL=?CANAL AND TALON=?TALON';
           Params.ByName['TALON_PAPEL'].AsString := IntToStr(Talon_Papel);
           Params.ByName['EMPRESA'].AsInteger := xTalonesListEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xTalonesListEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := xTalonesListCANAL.AsInteger;
           Params.ByName['TALON'].AsString := xTalonesListTALON.AsString;
           ExecQuery;
           FreeHandle;
        end;
        FreeAndNil(Q);
        Next;
     end;

     Close;
     Open;
     while ((not EOF) and (xTalonesListTALON.AsString <> Talon)) do
        Next;
     EnableControls;
  end;
end;

end.
