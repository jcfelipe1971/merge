unit UDMRCVCompra;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery, Dialogs, XMLDoc, ActnList, ShellAPI, Forms, rxPlacemnt;

type
  TDMRCVCompra = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     DSQMQMRCV_COMPRA: TDataSource;
     QMRCV_COMPRA: TFIBTableSet;
     QMRCV_COMPRARIG: TIntegerField;
     QMRCV_COMPRAFOLIO: TFIBStringField;
     QMRCV_COMPRANOMBRE_R_SOCIAL: TFIBStringField;
     QMRCV_COMPRAEMPRESA: TIntegerField;
     QMRCV_COMPRATIPO_DOC: TFIBStringField;
     QMRCV_COMPRATIPO_COMPRA: TFIBStringField;
     QMRCV_COMPRARUT_PROVEEDOR: TFIBStringField;
     QMRCV_COMPRARAZON_SOCIAL: TFIBStringField;
     QMRCV_COMPRAFECHA_DOCTO: TDateTimeField;
     QMRCV_COMPRAFECHA_RECEPCION: TDateTimeField;
     QMRCV_COMPRAFECHA_ACUSE: TDateTimeField;
     QMRCV_COMPRAMONTO_EXENTO: TFloatField;
     QMRCV_COMPRAMONTO_NETO: TFloatField;
     QMRCV_COMPRAMONTO_IVA_RECUPERABLE: TFloatField;
     QMRCV_COMPRAMONTO_IVA_NO_RECUPERABLE: TFloatField;
     QMRCV_COMPRACODIGO_IVA_NO_RECUPERABLE: TIntegerField;
     QMRCV_COMPRAMONTO_TOTAL: TFloatField;
     QMRCV_COMPRAMONTO_NETO_ACTIVO_FIJO: TFloatField;
     QMRCV_COMPRAIVA_ACTIVO_FIJO: TFloatField;
     QMRCV_COMPRAIVA_USO_COMUN: TFloatField;
     QMRCV_COMPRAIMPUESTO_SIN_DERECHO_CREDITO: TFloatField;
     QMRCV_COMPRAIVA_NO_RETENIDO: TFloatField;
     QMRCV_COMPRATABACOS_PUROS: TFloatField;
     QMRCV_COMPRATABACOS_SIGARRILLOS: TFloatField;
     QMRCV_COMPRATABACOS_ELABORADOS: TFloatField;
     QMRCV_COMPRANCE_NDE_FACTURA_COMPRA: TFloatField;
     QMRCV_COMPRACODIGO_OTRO: TIntegerField;
     QMRCV_COMPRAVALOR_OTRO_IMP: TFloatField;
     QMRCV_COMPRATASA_OTRO_IMP: TFloatField;
     QMRCV_COMPRAPERIODO: TFIBStringField;
     QMRCV_COMPRATITULO_PERIODO: TFIBStringField;
     QMRCV_COMPRAT_D_TRIB: TFIBStringField;
     QMRCV_COMPRAID_ADJUNTO_SIE: TIntegerField;
     QMRCV_COMPRAXML_ACUSE_DTE: TMemoField;
     QMRCV_COMPRAESTADORECEPDTE: TIntegerField;
     QMRCV_COMPRARECEPDTEGLOSA: TFIBStringField;
     QMRCV_COMPRAID_ADJUNTO_XML: TIntegerField;
     QMRCV_COMPRAID_ADJUNTO_PDF: TIntegerField;
     QMRCV_COMPRAXML_RECIBIDO: TIntegerField;
     QMRCV_COMPRAID_E: TIntegerField;
     QMRCV_COMPRAPDF_RECIBIDO: TSmallintField;
     QMRCV_COMPRAEJERCICIO: TIntegerField;
     QMRCV_COMPRASERIE: TFIBStringField;
     QMRCV_COMPRATASA_IVA: TFloatField;
     QMRCV_COMPRAIVA: TFloatField;
     QMRCV_COMPRAENTRADA_SELECCION: TIntegerField;
     QMRCV_COMPRATERCERO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMRCV_COMPRACalcFields(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMRCV_COMPRABeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     TipoDocTributario, Periodo, RUTProveedor: string;
  public
     { Public declarations }
     procedure ImportarCSV(Archivo: string);
     procedure CambiarSeleccion(aRUTProveedor, aTipoDocTributario, aPeriodo: string; DocumentosPendientes: boolean; FiltroEjercicio: integer);
     procedure PosicionarFolioRCVCompra(Folio: integer);
     procedure EnviaAcuseDeRecibo;
     procedure AbrePdfAdjuntoDTE;
     procedure AbreXmlAdjuntoDTE;
     procedure MarcaDocumento(Marca: integer);
     procedure GeneraFacturasMarcadas;
     procedure MarcaTodas(Marca: integer);
     procedure CreaDteDesdeXml(Log: TStrings);
  end;

var
  DMRCVCompra : TDMRCVCompra;

implementation

uses UDMMain, UFBusca, UEntorno, UFormGest, UUtiles, UParam, UFacturaElectronicaCL,
  UDMAdjunto, DateUtils, UHojaCalc, UDMListados, XMLIntf,
  UDMFacturasAProveedor, UDMAlbaranesAProveedor;

{$R *.dfm}

function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
var
  i : integer;
begin
  Result := nil;
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i]);
     Inc(i);
  end;

  Result := Nodo;
end;

function DameDato(Nodo: IXMLNode; a: array of string): string;
begin
  Result := '';

  Nodo := DameNodo(Nodo, a);

  // Si encuentro el nodo, obtengo el texto
  if Assigned(Nodo) then
     Result := Nodo.Text
  else
     Result := '';
end;

procedure TDMRCVCompra.CambiarSeleccion(aRUTProveedor, aTipoDocTributario, aPeriodo: string; DocumentosPendientes: boolean; FiltroEjercicio: integer);
begin
  RUTProveedor := aRUTProveedor;
  TipoDocTributario := aTipoDocTributario;
  Periodo := Copy(aPeriodo, 1, 2);

  if (FiltroEjercicio = 0) then
     FiltroEjercicio := REntorno.Ejercicio;

  with QMRCV_COMPRA do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;

        Add(' SELECT C.EMPRESA, DOC.EJERCICIO, DOC.SERIE, C.RUT_PROVEEDOR, C.TIPO_DOC, C.FOLIO, DOC.ID_E, DOC.RIG, TER.NOMBRE_R_SOCIAL, C.TIPO_COMPRA, ');
        Add(' C.RAZON_SOCIAL, C.FECHA_DOCTO, C.FECHA_RECEPCION, C.FECHA_ACUSE, C.MONTO_EXENTO, C.MONTO_NETO, ');
        Add(' C.MONTO_IVA_RECUPERABLE, C.MONTO_IVA_NO_RECUPERABLE, C.CODIGO_IVA_NO_RECUPERABLE, C.MONTO_TOTAL, ');
        Add(' C.MONTO_NETO_ACTIVO_FIJO, C.IVA_ACTIVO_FIJO, C.IVA_USO_COMUN, C.IMPUESTO_SIN_DERECHO_CREDITO, ');
        Add(' C.IVA_NO_RETENIDO, C.TABACOS_PUROS, C.TABACOS_SIGARRILLOS, C.TABACOS_ELABORADOS, C.NCE_NDE_FACTURA_COMPRA, ');
        Add(' C.CODIGO_OTRO, C.VALOR_OTRO_IMP, C.TASA_OTRO_IMP, P.PERIODO, P.TITULO AS TITULO_PERIODO, ');
        Add(' TDT.TITULO AS T_D_TRIB, C.ID_ADJUNTO_SIE, C.XML_ACUSE_DTE, C.ESTADORECEPDTE, C.RECEPDTEGLOSA, C.TASA_IVA, C.IVA, ');
        Add(' C.ENTRADA_SELECCION, TER.TERCERO, ');
        Add(' (SELECT FIRST 1 EA.ID ');
        Add(' FROM EMP_ADJUNTOS_RELACION EAR ');
        Add(' JOIN EMP_ADJUNTOS EA ON (EAR.ID_ADJUNTO = EA.ID) ');
        Add(' WHERE ');
        Add(' EAR.TIPO = ''SIE'' AND ');
        Add(' EAR.ID = C.ID_ADJUNTO_SIE AND ');
        Add(' UPPER(EA.NOMBRE) LIKE UPPER(''%.XML'') ');
        Add(' ORDER BY EA.ID DESC) ID_ADJUNTO_XML, ');
        Add(' (SELECT FIRST 1 EA.ID ');
        Add(' FROM EMP_ADJUNTOS_RELACION EAR ');
        Add(' JOIN EMP_ADJUNTOS EA ON (EAR.ID_ADJUNTO = EA.ID) ');
        Add(' WHERE ');
        Add(' EAR.TIPO = ''SIE'' AND ');
        Add(' EAR.ID = C.ID_ADJUNTO_SIE AND ');
        Add(' UPPER(EA.NOMBRE) LIKE UPPER(''%.PDF'') ');
        Add(' ORDER BY EA.ID DESC) ID_ADJUNTO_PDF ');
        Add(' FROM RCV_COMPRA C ');
        Add(' JOIN EMP_PERIODOS P ON C.EMPRESA = P.EMPRESA AND C.FECHA_DOCTO BETWEEN P.DESDE AND P.HASTA AND P.TIPO = 1 ');
        Add(' LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON C.TIPO_DOC = TDT.CODIGO ');
        Add(' LEFT JOIN SYS_TERCEROS TER ON C.RUT_PROVEEDOR = TER.NIF ');

        if (TipoDocTributario <> '52') then
           Add(' LEFT JOIN GES_CABECERAS_E_FAC DOC ON DOC.EMPRESA = C.EMPRESA AND DOC.TIPO = ''FAP'' AND DOC.FOLIO = C.FOLIO AND DOC.TIPO_DOC_TRIBUTARIO = C.TIPO_DOC AND ')
        else
           Add(' LEFT JOIN GES_CABECERAS_E_ALB DOC ON DOC.EMPRESA = C.EMPRESA AND DOC.TIPO = ''ALP'' AND DOC.FOLIO = C.FOLIO AND DOC.TIPO_DOC_TRIBUTARIO = C.TIPO_DOC AND ');

        Add(' DOC.PROVEEDOR = (SELECT FIRST 1 PROVEEDOR ');
        Add('                  FROM EMP_PROVEEDORES ');
        Add('                  WHERE ');
        Add('                  EMPRESA = C.EMPRESA AND ');
        Add('                  TERCERO = TER.TERCERO) ');
        Add(' WHERE ');
        Add(' C.EMPRESA = :EMPRESA ');
        Add(' AND C.TIPO_DOC = :TIPO_DOC ');

        if (RUTProveedor <> '') then
           Add(' AND C.RUT_PROVEEDOR = :RUT_PROVEEDOR ');
        if (Periodo <> '') then
        begin
           Add(' AND P.PERIODO = :PERIODO ');
           Add(' AND P.EJERCICIO = :EJERCICIO ');
        end;

        if (DocumentosPendientes) then
           Add(' AND DOC.ID_E IS NULL ');

        Add(' ORDER BY C.TIPO_DOC, C.FECHA_DOCTO, C.FOLIO ');

        {$IFDEF Debug}
        SaveToFile('C:\compra-DTE.sql') ;
        {$ENDIF}
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;

     if (TipoDocTributario <> '') then
        Params.ByName['TIPO_DOC'].AsString := TipoDocTributario;
     if (RUTProveedor <> '') then
        Params.ByName['RUT_PROVEEDOR'].AsString := RUTProveedor;

     if (Periodo <> '') then
     begin
        Params.ByName['PERIODO'].AsString := Periodo;
        Params.ByName['EJERCICIO'].AsInteger := FiltroEjercicio;
     end;

     Open;
  end;
end;

procedure TDMRCVCompra.PosicionarFolioRCVCompra(Folio: integer);
begin
  Posicionar(QMRCV_COMPRA, 'FOLIO', Folio);
end;

procedure TDMRCVCompra.ImportarCSV(Archivo: string);
var
  ts : TStrings;
  i, Campo, PosicionSeparador : integer;
  //NroLinea : integer;
  s : string;
  Separador : string;

  function StrDD_MM_YYYY_HH_NN_SSToDateTime(s: string): TDateTime;
  var
     FechaValida : boolean;
     aux : string;
  begin
     /// 04-10-2022 15:33:15
     /// Se ignoran separadores en la parte fecha
     /// La hora puede tener 1 o dos dígitos

     FechaValida := TryEncodeDate(StrToIntDef(Copy(s, 7, 4), 0), StrToIntDef(Copy(s, 4, 2), 0), StrToIntDef(Copy(s, 1, 2), 0), Result);

     if (FechaValida) then
     begin
        if (Length(s) > 10) then
        begin
           s := Trim(Copy(s, 11, Length(s)));

           aux := Copy(s, 1, Pos(':', s) - 1);
           Result := RecodeHour(Result, StrToIntDef(aux, 0));

           s := Copy(s, Pos(':', s) + 1, Length(s));

           aux := Copy(s, 1, Pos(':', s) - 1);
           if (aux = '') then
           begin
              aux := s;
              s := '';
           end;
           Result := RecodeMinute(Result, StrToIntDef(aux, 0));

           s := Copy(s, Pos(':', s) + 1, Length(s));

           if (Length(s) > 0) then
           begin
              aux := s;
              Result := RecodeSecond(Result, StrToIntDef(aux, 0));
              Result := RecodeMilliSecond(Result, 0);
           end;
        end
        else
           RecodeTime(Result, 0, 0, 0, 0);
     end
     else
        Result := EncodeDate(1900, 1, 1);
  end;

begin
  /// Crea o modifica un registro para cada TIPO_DOC+FOLIO

  ts := TStringList.Create;
  with ts do
  begin
     try
        LoadFromFile(Archivo);

        Separador := ';';
        i := 1; // Porque la linea 0 son los nombre de los campos
        while (i < Count) do
        begin
           s := ts[i];

           // Formato:
           // Nro, Tipo Doc, Tipo Compra, RUT Proveedor, Razon Social,   Folio,   Fecha Docto ,Fecha Recepcion,   Fecha Acuse, Monto Exento ,Monto Neto  ,Monto IVA Recuperable,   Monto Iva No Recuperable, Codigo IVA No Rec., Monto Total  ,Monto Neto Activo Fijo , IVA Activo Fijo  ,   IVA uso Comun  ,Impto. Sin Derecho a Credito ,IVA No Retenido  ,Tabacos Puros   Tabacos Cigarrillos   Tabacos Elaborados   NCE o NDE sobre Fact. de Compra   Codigo Otro Impuesto   Valor Otro Impuesto   Tasa Otro Impuesto

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE OR INSERT INTO RCV_COMPRA( ');
                 SQL.Add('  EMPRESA, TIPO_DOC, TIPO_COMPRA, RUT_PROVEEDOR, RAZON_SOCIAL, FOLIO, FECHA_DOCTO, FECHA_RECEPCION, FECHA_ACUSE, ');
                 SQL.Add('  MONTO_EXENTO, MONTO_NETO, MONTO_IVA_RECUPERABLE, MONTO_IVA_NO_RECUPERABLE, CODIGO_IVA_NO_RECUPERABLE,  MONTO_TOTAL, ');
                 SQL.Add('  MONTO_NETO_ACTIVO_FIJO, IVA_ACTIVO_FIJO, IVA_USO_COMUN, IMPUESTO_SIN_DERECHO_CREDITO, ');
                 SQL.Add('  IVA_NO_RETENIDO, TABACOS_PUROS, TABACOS_SIGARRILLOS, TABACOS_ELABORADOS, NCE_NDE_FACTURA_COMPRA, ');
                 SQL.Add('  CODIGO_OTRO, VALOR_OTRO_IMP, TASA_OTRO_IMP) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add('  :EMPRESA, :TIPO_DOC, :TIPO_COMPRA, :RUT_PROVEEDOR, :RAZON_SOCIAL, :FOLIO, :FECHA_DOCTO, :FECHA_RECEPCION, :FECHA_ACUSE, ');
                 SQL.Add('  :MONTO_EXENTO, :MONTO_NETO, :MONTO_IVA_RECUPERABLE, :MONTO_IVA_NO_RECUPERABLE, :CODIGO_IVA_NO_RECUPERABLE,  :MONTO_TOTAL, ');
                 SQL.Add('  :MONTO_NETO_ACTIVO_FIJO, :IVA_ACTIVO_FIJO, :IVA_USO_COMUN, :IMPUESTO_SIN_DERECHO_CREDITO, ');
                 SQL.Add('  :IVA_NO_RETENIDO, :TABACOS_PUROS, :TABACOS_SIGARRILLOS, :TABACOS_ELABORADOS, :NCE_NDE_FACTURA_COMPRA, ');
                 SQL.Add('  :CODIGO_OTRO, :VALOR_OTRO_IMP, :TASA_OTRO_IMP) ');
                 SQL.Add(' MATCHING (EMPRESA, RUT_PROVEEDOR, TIPO_DOC, FOLIO) ');

                 // Inicializo campos
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['TIPO_DOC'].AsString := '';
                 Params.ByName['TIPO_COMPRA'].AsString := '';
                 Params.ByName['RUT_PROVEEDOR'].AsString := '';
                 Params.ByName['RAZON_SOCIAL'].AsString := '';
                 Params.ByName['FOLIO'].AsInteger := 0;
                 Params.ByName['FECHA_DOCTO'].AsDateTime := Now;
                 Params.ByName['FECHA_RECEPCION'].AsDateTime := Now;
                 Params.ByName['FECHA_ACUSE'].AsDateTime := Now;
                 Params.ByName['MONTO_EXENTO'].AsFloat := 0;
                 Params.ByName['MONTO_NETO'].AsFloat := 0;
                 Params.ByName['MONTO_IVA_RECUPERABLE'].AsFloat := 0;
                 Params.ByName['MONTO_IVA_NO_RECUPERABLE'].AsFloat := 0;
                 Params.ByName['CODIGO_IVA_NO_RECUPERABLE'].AsFloat := 0;
                 Params.ByName['MONTO_TOTAL'].AsFloat := 0;
                 Params.ByName['MONTO_NETO_ACTIVO_FIJO'].AsFloat := 0;
                 Params.ByName['IVA_ACTIVO_FIJO'].AsFloat := 0;
                 Params.ByName['IVA_USO_COMUN'].AsFloat := 0;
                 Params.ByName['IMPUESTO_SIN_DERECHO_CREDITO'].AsFloat := 0;
                 Params.ByName['IVA_NO_RETENIDO'].AsFloat := 0;
                 Params.ByName['TABACOS_PUROS'].AsFloat := 0;
                 Params.ByName['TABACOS_SIGARRILLOS'].AsFloat := 0;
                 Params.ByName['TABACOS_ELABORADOS'].AsFloat := 0;
                 Params.ByName['NCE_NDE_FACTURA_COMPRA'].AsFloat := 0;
                 Params.ByName['CODIGO_OTRO'].AsFloat := 0;
                 Params.ByName['VALOR_OTRO_IMP'].AsFloat := 0;
                 Params.ByName['TASA_OTRO_IMP'].AsInteger := 0;

                 Campo := 0;
                 while (s > '') do
                 begin
                    PosicionSeparador := Pos(Separador, s);
                    if PosicionSeparador = 0 then
                       PosicionSeparador := Length(s);
                    case Campo of
                       //0: NroLinea := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       1: Params.ByName['TIPO_DOC'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       2: Params.ByName['TIPO_COMPRA'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       3: Params.ByName['RUT_PROVEEDOR'].AsString := Trim(Copy(s, 0, PosicionSeparador - 1));
                       4: Params.ByName['RAZON_SOCIAL'].AsString := Copy(Trim(Copy(s, 0, PosicionSeparador - 1)), 1, 60);
                       5: Params.ByName['FOLIO'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       6: Params.ByName['FECHA_DOCTO'].AsDateTime := StrDD_MM_YYYY_HH_NN_SSToDateTime(Trim(Copy(s, 0, PosicionSeparador - 1)));
                       7: Params.ByName['FECHA_RECEPCION'].AsDateTime := StrDD_MM_YYYY_HH_NN_SSToDateTime(Trim(Copy(s, 0, PosicionSeparador - 1)));
                       8: Params.ByName['FECHA_ACUSE'].AsDateTime := StrDD_MM_YYYY_HH_NN_SSToDateTime(Trim(Copy(s, 0, PosicionSeparador - 1)));
                       9: Params.ByName['MONTO_EXENTO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       10: Params.ByName['MONTO_NETO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       11: Params.ByName['MONTO_IVA_RECUPERABLE'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       12: Params.ByName['CODIGO_IVA_NO_RECUPERABLE'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       13: Params.ByName['MONTO_TOTAL'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       14: Params.ByName['MONTO_NETO_ACTIVO_FIJO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       15: Params.ByName['IVA_ACTIVO_FIJO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       16: Params.ByName['IVA_USO_COMUN'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       17: Params.ByName['IMPUESTO_SIN_DERECHO_CREDITO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       18: Params.ByName['IVA_NO_RETENIDO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       19: Params.ByName['TABACOS_PUROS'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       20: Params.ByName['TABACOS_SIGARRILLOS'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       21: Params.ByName['TABACOS_ELABORADOS'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       22: Params.ByName['NCE_NDE_FACTURA_COMPRA'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       23: Params.ByName['CODIGO_OTRO'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       24: Params.ByName['VALOR_OTRO_IMP'].AsFloat := StrToFloatDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                       25: Params.ByName['TASA_OTRO_IMP'].AsInteger := StrToIntDef(Trim(Copy(s, 0, PosicionSeparador - 1)), 0);
                    end;

                    System.Delete(s, 1, PosicionSeparador);
                    Inc(Campo);
                 end;

                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Inc(i);
        end;
     finally
        Free;
     end;
  end;
  QMRCV_COMPRA.Close;
  QMRCV_COMPRA.Open;

  MessageDlg(Format(_('Proceso finalizado.' + #13#10 + 'Se han recibido %d lineas.'), [i]), mtInformation, [mbOK], 0);
end;

procedure TDMRCVCompra.DataModuleCreate(Sender: TObject);
var
  MascaraMoneda : string;
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  RUTProveedor := '';
  TipoDocTributario := '';
  Periodo := '';

  MascaraMoneda := DMMain.MascaraMoneda(REntorno.Moneda);

  with QMRCV_COMPRA do
  begin
     for i := 0 to FieldCount - 1 do
     begin
        if (Fields[i] is TFloatField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraMoneda;
        if (Fields[i] is TIntegerField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraI;
        if (Fields[i] is TDateTimeField) then
           TFloatField(Fields[i]).DisplayFormat := ShortDateFormat;
     end;
  end;

  QMRCV_COMPRAFECHA_DOCTO.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMRCV_COMPRAFECHA_recepcion.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMRCV_COMPRAFECHA_ACUSE.DisplayFormat := ShortDateFormat + ' hh:nn';
end;

procedure TDMRCVCompra.EnviaAcuseDeRecibo;
var
  EndpointSII_CL, UrlEnvioXml, FicheroXmlDte, FicheroCertificado, NombreFicheroXmlDte, FicheroXmlDteRecibido : string;
  RutEmisor_esperado, RutReceptor_esperado : string;
  DS : TFIBDataSet;
  m, f : TStream;
  FacturaElectronica : TFacturaElectronicaCL;
  Respuesta : TStrings;
  RutCertificado : string;
  Contrasenya : string;
  //FechaResolucion : TDateTime;
  //NroResolucion : integer;
  Documento : TXMLDocument;
  EstadoRecepDTE : integer;
  RecepDTEGlosa : string;
  StreamDestino, StreamOrigen : TStream;
begin
  DMMain.LogIni('EnviaAcuseDeRecibo');
  EndpointSII_CL := DMMain.DameUrlEndPoint('DTE');
  DMMain.Log('Obtenemos URL del SSI_Chile - ' + EndpointSII_CL);

  // Obtenemos certificado
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT FIRST 1 CERTIFICADO, CONTRASENYA, RUT, FECHA_RESOLUCION, NRO_RESOLUCION FROM SII_CERTIFICADOS WHERE EMPRESA = :EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;
           Contrasenya := FieldByName('CONTRASENYA').AsString;
           RutCertificado := FieldByName('RUT').AsString;
           //FechaResolucion := FieldByName('FECHA_RESOLUCION').AsDateTime;
           //NroResolucion := FieldByName('NRO_RESOLUCION').AsInteger;

           FicheroCertificado := DameTempPath + RutCertificado + '.p12'; // IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + Rut + '.p12'
           m := CreateBlobStream(FieldByName('CERTIFICADO'), bmRead);
           try
              f := TFileStream.Create(FicheroCertificado, fmCreate);
              try
                 f.CopyFrom(m, m.Size);
              finally
                 f.Free;
              end;
           finally
              m.Free;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  // Definimos ruta para el envio del XML
  UrlEnvioXml := EndpointSII_CL + '/recepcionXML.php';

  // Enviamos xml certificado
  DMMain.Log('Enviamos el certificado');
  if not (UploadFile(UrlEnvioXml, FicheroCertificado)) then
     raise Exception.Create(_('No se ha podido enviar el certificado.'))
  else
  begin
     // Si se ha enviado el fichero el archivo eliminamos del temporal
     DeleteFile(FicheroCertificado);
  end;

  // Obtenemos Xml de documento
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Text := 'SELECT FIRST 1 * FROM VER_ADJUNTOS WHERE EMPRESA = :EMPRESA AND TIPO = ''SIE'' AND ID_ADJUNTO = :ID_ADJUNTO_SIE  ORDER BY ID DESC';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ID_ADJUNTO_SIE'].AsInteger := QMRCV_COMPRAID_ADJUNTO_SIE.AsInteger;
           Open;
           NombreFicheroXmlDte := QMRCV_COMPRATIPO_DOC.AsString + '_' + QMRCV_COMPRARUT_PROVEEDOR.AsString + '_' + Trim(QMRCV_COMPRAFOLIO.AsString) + '.xml';
           FicheroXmlDte := DameTempPath + NombreFicheroXmlDte;

           m := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
           try
              f := TFileStream.Create(FicheroXmlDte, fmCreate);
              try
                 f.CopyFrom(m, m.Size);
              finally
                 f.Free;
              end;
           finally
              m.Free;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  RutEmisor_esperado := QMRCV_COMPRARUT_PROVEEDOR.AsString;
  RutReceptor_esperado := REntorno.CifEmpresa;

  // Enviamos xml Autorizacion folios
  DMMain.Log('Enviamos FicheroXmlDte');
  if not (UploadFile(UrlEnvioXml, FicheroXmlDte)) then
     raise Exception.Create(_('No se ha podido enviar el xml DTE de compras.'))
  else
  begin
     // Si se ha enviado el fichero el archivo eliminamos del temporal
     DeleteFile(FicheroXmlDte);
  end;

  Respuesta := TStringList.Create;

  try
     FacturaElectronica.ConsultaSiiChile(EndpointSII_CL +
        '/intercambioAcuseReciboDTE.php?' +
        'RutReceptor_esperado=' + RutReceptor_esperado +
        '&RutEmisor_esperado=' + RutEmisor_esperado +
        '&FicheroXmlDte=' + NombreFicheroXmlDte +
        '&Contrasenya=' + Contrasenya +
        '&RutCertificado=' + RutCertificado,
        Respuesta);

     DMMain.Log('Se envia la consulta');

     //Guardamos en temporal Xml respuesta generado
     FicheroXmlDteRecibido := 'Xml_acuse_' + FormatDateTime('yyyymmddhhnnss', Now) + '.xml';
     Respuesta.SaveToFile(DameTempPath + FicheroXmlDteRecibido);
     DMMain.Log('Se guardo el Xml temporal de respuesta:' + DameTempPath + FicheroXmlDteRecibido);

     // Recuperamos datos de respuesta DTE y los pasamos a XML
     DMMain.Log('Recuperamos datos DTE y los pasamos a XML');
     Documento := TXMLDocument.Create(Self);
     try
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           // XML.LoadFromFile(DameTempPath + 'respuesta.xml');

           DMMain.Log('Documento.Active := True');
           // Se activa para poder utilizar el componente
           Active := True;
           DMMain.Log('Documento.Encoding = utf-8');
           // Codigifacion UTF-8
           // Para Envio DTE de Chile debe ser ISO-8859-1
           Encoding := 'utf-8';
           DMMain.Log('Documento.NodeIndentStr = #8');
           // Caracter para indentar el fichero XML
           NodeIndentStr := #8;

           DMMain.Log('Obtener nodos');

           // Obtenemos el EstadoRecepDTE
           EstadoRecepDTE := StrToInt(DameDato(DocumentElement, ['Resultado', 'RecepcionEnvio', 'RecepcionDTE', 'EstadoRecepDTE']));
           DMMain.Log('ESTADORECEPDTE :' + IntToStr(EstadoRecepDTE));

           // Obtenemos el RecepDTEGlosa
           RecepDTEGlosa := DameDato(DocumentElement, ['Resultado', 'RecepcionEnvio', 'RecepcionDTE', 'RecepDTEGlosa']);
           DMMain.Log('RecepDTEGlosa: ' + RecepDTEGlosa);

           //Guardamos datos resultdo en base de datos
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 Transaction := DameTransactionRW(DMMain.DataBase);
                 try
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;

                    // Guardamos el XML generado en la base de datos
                    DMMain.Log('Guardamos el XML generado en la base de datos select de GES_CABECERAS_S_FE_CHL');

                    SelectSQL.Add(' SELECT * FROM RCV_COMPRA ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' EMPRESA =:EMPRESA AND ');
                    SelectSQL.Add(' RUT_PROVEEDOR= :RUT_PROVEEDOR AND ');
                    SelectSQL.Add(' TIPO_DOC = :TIPO_DOC AND ');
                    SelectSQL.Add(' FOLIO = :FOLIO ');

                    UpdateSQL.Add(' UPDATE RCV_COMPRA ');
                    UpdateSQL.Add(' SET ');
                    UpdateSQL.Add(' ESTADORECEPDTE = :ESTADORECEPDTE, ');
                    UpdateSQL.Add(' RECEPDTEGLOSA = :RECEPDTEGLOSA, ');
                    UpdateSQL.Add(' XML_ACUSE_DTE = :XML_ACUSE_DTE ');
                    UpdateSQL.Add(' WHERE ');
                    UpdateSQL.Add(' EMPRESA =:EMPRESA AND ');
                    UpdateSQL.Add(' RUT_PROVEEDOR= :RUT_PROVEEDOR AND ');
                    UpdateSQL.Add(' TIPO_DOC = :TIPO_DOC AND ');
                    UpdateSQL.Add(' FOLIO = :FOLIO ');

                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['RUT_PROVEEDOR'].AsString := RutEmisor_esperado;
                    Params.ByName['TIPO_DOC'].AsString := QMRCV_COMPRATIPO_DOC.AsString;
                    Params.ByName['FOLIO'].AsString := QMRCV_COMPRAFOLIO.AsString;

                    Open;
                    Edit;

                    FieldByName('ESTADORECEPDTE').AsInteger := EstadoRecepDTE;
                    FieldByName('RECEPDTEGLOSA').AsString := RecepDTEGlosa;

                    StreamDestino := CreateBlobStream(FieldByName('XML_ACUSE_DTE'), bmRead);
                    try
                       StreamOrigen := TFileStream.Create(DameTempPath + FicheroXmlDteRecibido, fmOpenRead);
                       try
                          StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                       finally
                          StreamOrigen.Free;
                       end;
                    finally
                       StreamDestino.Free;
                    end;

                    Post;
                    Close;
                    Transaction.Commit;
                 finally
                    Transaction.Free;
                 end;
              finally
                 Free;
              end;
           end;
        end;
     finally
        Documento.Free;
     end;

  finally
     Respuesta.Free;
  end;

  //Eliminamos el fichero temporal
  DeleteFile(DameTempPath + FicheroXmlDteRecibido);
  DMMain.LogFin('EnviaAcuseDeRecibo');
end;

procedure TDMRCVCompra.QMRCV_COMPRACalcFields(DataSet: TDataSet);
begin
  if (QMRCV_COMPRAID_ADJUNTO_XML.AsInteger > 0) then
     QMRCV_COMPRAXML_RECIBIDO.AsInteger := 1
  else
     QMRCV_COMPRAXML_RECIBIDO.AsInteger := 0;

  if (QMRCV_COMPRAID_ADJUNTO_PDF.AsInteger > 0) then
     QMRCV_COMPRAPDF_RECIBIDO.AsInteger := 1
  else
     QMRCV_COMPRAPDF_RECIBIDO.AsInteger := 0;
end;

procedure TDMRCVCompra.CreaDteDesdeXml(Log: TStrings);
var
  DS : TFIBDataSet;
  Titulo, FicheroXml : string;
  m, f : TStream;
begin
  if (QMRCV_COMPRAID_E.AsInteger = 0) then
  begin
     // Obtenemos Xml del Dte
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT ARCHIVO, TITULO FROM EMP_ADJUNTOS WHERE EMPRESA = :EMPRESA AND ID = :ID';
              Params.ByName['EMPRESA'].AsInteger := QMRCV_COMPRAEMPRESA.AsInteger;
              Params.ByName['ID'].AsInteger := QMRCV_COMPRAID_ADJUNTO_XML.AsInteger;
              Open;
              Titulo := FieldByName('TITULO').AsString;

              FicheroXml := DameTempPath + format('%s_%s_%s.xml', [Trim(QMRCV_COMPRARUT_PROVEEDOR.AsString), Trim(QMRCV_COMPRATIPO_DOC.AsString), Trim(QMRCV_COMPRAFOLIO.AsString)]);
              m := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
              try
                 f := TFileStream.Create(FicheroXml, fmCreate);
                 try
                    f.CopyFrom(m, m.Size);
                 finally
                    f.Free;
                 end;
              finally
                 m.Free;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;

     if (FicheroXml > '') then
     begin
        if (QMRCV_COMPRATIPO_DOC.AsString <> '52') then
        begin
           AbreData(TDMFacturasAProveedor, DMFacturasAProveedor);
           DMFacturasAProveedor.ImportaXML(FicheroXml, Log);
           CierraData(DMFacturasAProveedor);
        end
        else
        begin
           AbreData(TDMAlbaranesAProveedor, DMAlbaranesAProveedor);
           DMAlbaranesAProveedor.ImportaXML(FicheroXml, Log);
           CierraData(DMAlbaranesAProveedor);
        end;
     end;
     DeleteFile(FicheroXml);
     QMRCV_COMPRA.Refresh;
  end;
end;

procedure TDMRCVCompra.AbrePdfAdjuntoDTE;
var
  DS : TFIBDataSet;
  Titulo, FicheroPdf : string;
  m, f : TStream;
begin
  if (QMRCV_COMPRAID_ADJUNTO_PDF.AsInteger > 0) then
  begin
     // Obtenemos Xml del Dte
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT ARCHIVO, TITULO FROM EMP_ADJUNTOS WHERE EMPRESA = :EMPRESA AND ID = :ID';
              Params.ByName['EMPRESA'].AsInteger := QMRCV_COMPRAEMPRESA.AsInteger;
              Params.ByName['ID'].AsInteger := QMRCV_COMPRAID_ADJUNTO_PDF.AsInteger;
              Open;
              Titulo := FieldByName('TITULO').AsString;

              FicheroPdf := DameTempPath + format('%s_%s_%s.pdf', [Trim(QMRCV_COMPRARUT_PROVEEDOR.AsString), Trim(QMRCV_COMPRATIPO_DOC.AsString), Trim(QMRCV_COMPRAFOLIO.AsString)]);
              m := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
              try
                 f := TFileStream.Create(FicheroPdf, fmCreate);
                 try
                    f.CopyFrom(m, m.Size);
                 finally
                    f.Free;
                 end;
              finally
                 m.Free;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;

     if ShellExecute(Application.Handle, nil, PChar(FicheroPdf), nil, nil, SW_SHOWNA) <= 32 then
        ShowMessage(_('No se pudo abrir el pdf del DTE'));
  end
  else
     ShowMessage(_('El DTE no tiene un pdf recepcionado'));
end;

procedure TDMRCVCompra.AbreXmlAdjuntoDTE;
var
  DS : TFIBDataSet;
  Titulo, FicheroXml : string;
  m, f : TStream;
begin
  if (QMRCV_COMPRAID_ADJUNTO_XML.AsInteger > 0) then
  begin
     // Obtenemos Xml del Dte
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT ARCHIVO, TITULO FROM EMP_ADJUNTOS WHERE EMPRESA = :EMPRESA AND ID = :ID';
              Params.ByName['EMPRESA'].AsInteger := QMRCV_COMPRAEMPRESA.AsInteger;
              Params.ByName['ID'].AsInteger := QMRCV_COMPRAID_ADJUNTO_XML.AsInteger;
              Open;
              Titulo := FieldByName('TITULO').AsString;

              FicheroXml := DameTempPath + format('%s_%s_%s.xml', [Trim(QMRCV_COMPRARUT_PROVEEDOR.AsString), Trim(QMRCV_COMPRATIPO_DOC.AsString), Trim(QMRCV_COMPRAFOLIO.AsString)]);
              m := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
              try
                 f := TFileStream.Create(FicheroXml, fmCreate);
                 try
                    f.CopyFrom(m, m.Size);
                 finally
                    f.Free;
                 end;
              finally
                 m.Free;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;

     if (ShellExecute(Application.Handle, nil, PChar(FicheroXml), nil, nil, SW_SHOWNA) <= 32) then
        ShowMessage(_('No se pudo abrir el Xml del DTE'));
  end
  else
     ShowMessage(_('El DTE no tiene un XML recepcionado'));
end;

procedure TDMRCVCompra.MarcaDocumento(Marca: integer);
begin
  if (QMRCV_COMPRAID_E.AsInteger = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE RCV_COMPRA ');
           SQL.Add(' SET ');
           SQL.Add(' ENTRADA_SELECCION = :ENTRADA_SELECCION ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' RUT_PROVEEDOR = :RUT_PROVEEDOR AND ');
           SQL.Add(' TIPO_DOC = :TIPO_DOC AND ');
           SQL.Add(' FOLIO = :FOLIO ');
           Params.ByName['EMPRESA'].AsInteger := QMRCV_COMPRAEMPRESA.AsInteger;
           Params.ByName['RUT_PROVEEDOR'].AsString := QMRCV_COMPRARUT_PROVEEDOR.AsString;
           Params.ByName['TIPO_DOC'].AsString := QMRCV_COMPRATIPO_DOC.AsString;
           Params.ByName['FOLIO'].AsString := QMRCV_COMPRAFOLIO.AsString;
           Params.ByName['ENTRADA_SELECCION'].AsInteger := Marca;

           ExecQuery;
           Close;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRCVCompra.DataModuleDestroy(Sender: TObject);
begin
  // Desmarcamos documentos antes de salir
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE RCV_COMPRA ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA_SELECCION = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA_SELECCION = :ENTRADA_SELECCION ');
        Params.ByName['ENTRADA_SELECCION'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRCVCompra.GeneraFacturasMarcadas;
var
  Log : TStrings;
  RutaFicheroLog : string;
begin
  Log := TStringList.Create;
  try
     with QMRCV_COMPRA do
     begin
        DisableControls;
        try
           Close;
           Open;
           First;
           // Recorremos los documentos seleccionamos
           while not EOF do
           begin
              if (QMRCV_COMPRA.FieldByName('ENTRADA_SELECCION').AsInteger = REntorno.Entrada) then
              begin
                 try
                    CreaDteDesdeXml(Log);
                 except
                    Log.Add(Format(_('No se ha podido generar el Documento: %s - %s.'), [QMRCV_COMPRATIPO_DOC.AsString, IntToStr(QMRCV_COMPRAFOLIO.AsInteger)]));
                 end;
              end;
              Next;
           end;
           Close;
           Open;
        finally
           EnableControls;
        end;
     end;

     // Mostramos resumen  de la importacion en fichero temporal
     RutaFicheroLog := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + 'Importacion_DTE_Compras_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.Log';
     Log.SaveToFile(RutaFicheroLog);
     DMMain.AbrirArchivo(RutaFicheroLog);
  finally
     Log.Free;
  end;
end;

procedure TDMRCVCompra.QMRCV_COMPRABeforePost(DataSet: TDataSet);
begin
  if (DMRCVCompra.QMRCV_COMPRAID_E.AsInteger <> 0) then
     QMRCV_COMPRAENTRADA_SELECCION.AsInteger := 0;
end;

procedure TDMRCVCompra.MarcaTodas(Marca: integer);
var
  BM : TBookmark;
begin
  with QMRCV_COMPRA do
  begin
     BM := GetBookmark;
     try
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if (((QMRCV_COMPRAENTRADA_SELECCION.AsInteger <> Marca) and (QMRCV_COMPRAID_E.AsInteger = 0)) or
                 ((QMRCV_COMPRAENTRADA_SELECCION.AsInteger <> Marca) and (Marca = 0) and (QMRCV_COMPRAID_E.AsInteger > 0))
                 ) then
                 MarcaDocumento(Marca);
              Next;
           end;

           Refrescar(QMRCV_COMPRA, '', 0);

           if BookmarkValid(BM) then
              GotoBookmark(BM)
           else
              First;

        finally
           EnableControls;
        end;
     finally
        FreeBookmark(BM);
     end;
  end;
end;

end.
