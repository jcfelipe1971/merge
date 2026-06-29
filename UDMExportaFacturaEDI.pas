unit UDMExportaFacturaEDI;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBTableDataSetRO,
  FIBDatabase, UFIBModificados, DateUtils, FIBQuery, HYFIBQuery;

type
  TDMExportaFacturaEDI = class(TDataModule)
     TLocal: THYTransaction;
     xProcedencia: TFIBDataSetRO;
     xDireccion: TFIBDataSetRO;
     QMCabecera: TFIBDataSetRO;
     QMDetalle: TFIBDataSetRO;
     QMCabeceraImpuestos: TFIBDataSetRO;
     QMVencimientos: TFIBDataSetRO;
     xProcedenciaLinea: TFIBDataSetRO;
     QEDIFacCab: TFIBDataSetRO;
     QEDIFacCabDto: TFIBDataSetRO;
     QEDIFacCabImp: TFIBDataSetRO;
     QEDIFacDet: TFIBDataSetRO;
     QEDIFacDetDto: TFIBDataSetRO;
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Exporta(empresa, ejercicio, canal: integer; serie, tipo: string; rig: integer);
  end;

var
  DMExportaFacturaEDI : TDMExportaFacturaEDI;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMExportaFacturaEDI.Exporta(empresa, ejercicio, canal: integer; serie, tipo: string; rig: integer);
var
  f : TextFile;
  // i : integer;
  // id_s : integer;
  // linea : integer;
  // Albaran : integer;
  AlbaranStr : string;
  // RefAlbaran : string;
  // Pedido : integer;
  // RefPedido : string;
  // Moneda : string;
  memo : TStrings;
  Q : THYFIBQuery;
begin
  {Cabecera ---------------------------------------------------------------------}
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'execute procedure g_genera_fac_edi (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG)';
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['EJERCICIO'].AsInteger := ejercicio;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['SERIE'].AsString := serie;
        Params.ByName['TIPO'].AsString := tipo;
        Params.ByName['RIG'].AsInteger := rig;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  with QEdiFacCab do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := rig;
     Open;
  end;
  if (not QEdiFacCab.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'cabfac.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'cabfac.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEdiFacCab do
     begin
        while not EOF do
        begin
           {NUMFAC}   Write(f, DMMain.StrToEdi(FieldByName('NUMFAC').AsString, 15));
           {VENDEDOR} Write(f, DMMain.StrToEdi(FieldByName('VENDEDOR').AsString, 17));
           {Codigo EAN13 del vendedor/proveedor}
           {EMISOR}   Write(f, DMMain.StrToEdi(FieldByName('EMISOR').AsString, 17));
           {Codigo EAN13 del emisor}
           {COBRADOR} Write(f, DMMain.StrToEdi(FieldByName('COBRADOR').AsString, 17));
           {Codigo EAN13 de la empresa}
           {COMPRADOR}Write(f, DMMain.StrToEdi(FieldByName('COMPRADOR').AsString, 17));
           {Codigo EAN13 de la empresa}
           {DEPTO}    Write(f, DMMain.StrToEdi(FieldByName('DEPTO').AsString, 13));
           {El Corte Ingles y Alcampo}
           //                   Write(f,DMMain.StrToEdi('098',13));
           {RECEPTOR} Write(f, DMMain.StrToEdi(FieldByName('RECEPTOR').AsString, 17));
           {Codigo EAN13 de la empresa}
           {CLIENTE}  Write(f, DMMain.StrToEdi(FieldByName('CLIENTE').AsString, 17));
           {Codigo EAN13 del cliente}
           {PAGADOR}  Write(f, DMMain.StrToEdi(FieldByName('PAGADOR').AsString, 17));
           {Codigo EAN13 de la empresa}
           {PEDIDO}   Write(f, DMMain.StrToEdi(FieldByName('PEDIDO').AsString, 17));
           {Nro de pedido del proveedor}
           {FECHA}    Write(f, DMMain.DateToEdi(FieldByName('FECHA').AsDateTime));
           {Fecha de emision de la factura}
           {NODO}     Write(f, DMMain.StrToEdi(FieldByName('NODO').AsString, 3));
           {Factura comercial}
           {FUNCION}  Write(f, DMMain.StrToEdi(FieldByName('FUNCION').AsString, 3)); {Copia}
           {RSOCIAL}  Write(f, DMMain.StrToEdi(FieldByName('RSOCIAL').AsString, 70));
           {Nombre del Cliente}
           {CALLE}    Write(f, DMMain.StrToEdi(FieldByName('CALLE').AsString, 35));
           {Domicilio del cliente, calle y nro}
           {CIUDAD}   Write(f, DMMain.StrToEdi(FieldByName('CIUDAD').AsString, 35));
           {Ciudad del cliente}
           {CP}       Write(f, DMMain.StrToEdi(FieldByName('CP').AsString, 5));
           {Codigo postal del cliente}
           {NIF}      Write(f, DMMain.StrToEdi(FieldByName('NIF').AsString, 17));
           {NIF del cliente}
           {RAZON}    Write(f, DMMain.StrToEdi(FieldByName('RAZON').AsString, 3));
           // Nro. de Albaran. El corte inglés max 7 digitos
           // AlbaranStr := '0000000' + FieldByName('ALBARAN').AsString;
           // AlbaranStr := Copy(AlbaranStr, Length(AlbaranStr) - 6, 7);
           {ALBARAN}  Write(f, DMMain.StrToEdi(FieldByName('ALBARAN').AsString, 17));
           {CONTRATO} Write(f, DMMain.StrToEdi(FieldByName('CONTRATO').AsString, 17));
           {Nro. de contrato en facturas de servicios}
           {NFACSUS}  Write(f, DMMain.StrToEdi(FieldByName('NFACSUS').AsString, 17));
           {Si es abono, nro de factura que abona}
           {FPAGO}    Write(f, DMMain.StrToEdi(FieldByName('FPAGO').AsString, 3));
           {Pago a una cuenta bancaria}
           {DIVISA}   Write(f, DMMain.StrToEdi(FieldByName('DIVISA').AsString, 3));
           {Moneda}
           {SUMBRUTO} Write(f, DMMain.FloatToEdiNum(
              FieldByName('SUMBRUTO').AsFloat, 15, 3));
           {SUMNETOS} Write(f, DMMain.FloatToEdiNum(
              FieldByName('SUMNETOS').AsFloat, 15, 3));
           {CARGOS}   Write(f, DMMain.FloatToEdiNum(FieldByName('CARGOS')
              .AsFloat, 15, 3));
           {DESCUEN}  Write(f, DMMain.FloatToEdiNum(FieldByName('DESCUEN')
              .AsFloat, 15, 3));

           {Los Impuestos solo tiene que estar en un lugar: en cabecera o en el fichero de detalle, pero no en los dos}
           Write(f, DMMain.StrToEdi('', 15 + 3 + 8 + 15));
           Write(f, DMMain.StrToEdi('', 15 + 3 + 8 + 15));
           Write(f, DMMain.StrToEdi('', 15 + 3 + 8 + 15));
           Write(f, DMMain.StrToEdi('', 15 + 3 + 8 + 15));
           Write(f, DMMain.StrToEdi('', 15 + 3 + 8 + 15));
           Write(f, DMMain.StrToEdi('', 15 + 3 + 8 + 15));
           {
        BASEIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('BASEIMP1').AsFloat,15,3));
        TIPOIMP  Write(f,DMMain.StrToEdi(FieldByName('TIPOIMP1') .AsString,3));
        TASAIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('TASAIMP1').AsFloat,8,3));
        IMPIMP   Write(f,DMMain.FloatToEdiNum(FieldByName('IMPIMP1').AsFloat,15,3));
        BASEIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('BASEIMP2').AsFloat,15,3));
        TIPOIMP  Write(f,DMMain.StrToEdi(FieldByName('TIPOIMP2') .AsString,3));
        TASAIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('TASAIMP2').AsFloat,8,3));
        IMPIMP   Write(f,DMMain.FloatToEdiNum(FieldByName('IMPIMP2').AsFloat,15,3));
        BASEIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('BASEIMP3').AsFloat,15,3));
        TIPOIMP  Write(f,DMMain.StrToEdi(FieldByName('TIPOIMP3') .AsString,3));
        TASAIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('TASAIMP3').AsFloat,8,3));
        IMPIMP   Write(f,DMMain.FloatToEdiNum(FieldByName('IMPIMP3').AsFloat,15,3));
        BASEIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('BASEIMP4').AsFloat,15,3));
        TIPOIMP  Write(f,DMMain.StrToEdi(FieldByName('TIPOIMP4') .AsString,3));
        TASAIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('TASAIMP4').AsFloat,8,3));
        IMPIMP   Write(f,DMMain.FloatToEdiNum(FieldByName('IMPIMP4').AsFloat,15,3));
        BASEIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('BASEIMP5').AsFloat,15,3));
        TIPOIMP  Write(f,DMMain.StrToEdi(FieldByName('TIPOIMP5') .AsString,3));
        TASAIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('TASAIMP5').AsFloat,8,3));
        IMPIMP   Write(f,DMMain.FloatToEdiNum(FieldByName('IMPIMP5').AsFloat,15,3));
        BASEIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('BASEIMP6').AsFloat,15,3));
        TIPOIMP  Write(f,DMMain.StrToEdi(FieldByName('TIPOIMP6') .AsString,3));
        TASAIMP  Write(f,DMMain.FloatToEdiNum(FieldByName('TASAIMP6').AsFloat,8,3));
        IMPIMP   Write(f,DMMain.FloatToEdiNum(FieldByName('IMPIMP6').AsFloat,15,3));
        }

           {BASEIMP}  Write(f, DMMain.FloatToEdiNum(FieldByName('BASEIMP').AsFloat, 15, 3));
           {Base Imponible}
           {TOTIMP}   Write(f, DMMain.FloatToEdiNum(FieldByName('TOTIMP').AsFloat, 15, 3));
           {Total de impuestos}
           {TOTAL}    Write(f, DMMain.FloatToEdiNum(FieldByName('TOTAL').AsFloat, 15, 3));
           {Total a pagar de la factura}
           {VTO1}
           if (FieldByName('IMPVTO1').AsFloat <> 0) then
              Write(f, DMMain.Date8ToEdi(FieldByName('VTO1').AsDateTime)) {Fecha vencimiento}
           else
              Write(f, DMMain.StrToEdi('', 8));
           {IMPVTO1}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPVTO1').AsFloat, 15, 3));
           {Importe vencimiento}
           {VTO2}
           if (FieldByName('IMPVTO2').AsFloat <> 0) then
              Write(f, DMMain.Date8ToEdi(FieldByName('VTO2').AsDateTime)) {Fecha vencimiento}
           else
              Write(f, DMMain.StrToEdi('', 8));
           {IMPVTO2}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPVTO2').AsFloat, 15, 3));
           {Importe vencimiento}
           {VTO3}
           if (FieldByName('IMPVTO3').AsFloat <> 0) then
              Write(f, DMMain.Date8ToEdi(FieldByName('VTO3').AsDateTime)) {Fecha vencimiento}
           else
              Write(f, DMMain.StrToEdi('', 8));
           {IMPVTO3}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPVTO3').AsFloat, 15, 3));
           {Importe vencimiento}
           {TPVERDE}  Write(f, DMMain.FloatToEdiNum(FieldByName('TPVERDE').AsFloat, 15, 3));
           {Total punto verde}
           {CALIF1}   Write(f, DMMain.StrToEdi(FieldByName('CALIF1').AsString, 3));
           {Decuento}
           {SECUEN1}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN1').AsInteger, 2, 0));
           {1,2,3,4,... se puede omitir}
           {TIPO1}    Write(f, DMMain.StrToEdi(FieldByName('TIPO1').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN1}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN1').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDES1}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDES1').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {CALIF2}   Write(f, DMMain.StrToEdi(FieldByName('CALIF2').AsString, 3));
           {Decuento}
           {SECUEN2}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN2').AsInteger, 2, 0));
           {1,2,3,4,... se puede omitir}
           {TIPO2}    Write(f, DMMain.StrToEdi(FieldByName('TIPO2').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN2}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN2').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDES2}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDES2').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {CALIF3}   Write(f, DMMain.StrToEdi(FieldByName('CALIF3').AsString, 3));
           {Decuento}
           {SECUEN3}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN3').AsInteger, 2, 0));
           {1,2,3,4,... se puede omitir}
           {TIPO3}    Write(f, DMMain.StrToEdi(FieldByName('TIPO3').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN3}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN3').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDES3}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDES3').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {CALIF4}   Write(f, DMMain.StrToEdi(FieldByName('CALIF4').AsString, 3));
           {Decuento}
           {SECUEN4}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN4').AsInteger, 2, 0));
           {1,2,3,4,... se puede omitir}
           {TIPO4}    Write(f, DMMain.StrToEdi(FieldByName('TIPO4').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN4}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN4').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDES4}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDES4').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {CALIF5}   Write(f, DMMain.StrToEdi(FieldByName('CALIF5').AsString, 3));
           {Decuento}
           {SECUEN5}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN5').AsInteger, 2, 0));
           {1,2,3,4,... se puede omitir}
           {TIPO5}    Write(f, DMMain.StrToEdi(FieldByName('TIPO5').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN5}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN5').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDES5}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDES5').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {ERSOCIAL} Write(f, DMMain.StrToEdi(FieldByName('ERSOCIAL').AsString, 70));
           {Razon social de la empresa}
           {ECALLE}   Write(f, DMMain.StrToEdi(FieldByName('ECALLE').AsString, 35));
           {Domicilio de la empresa}
           {EPOBLAC}  Write(f, DMMain.StrToEdi(FieldByName('EPOBLAC').AsString, 35));
           {Poblacion de la empresa}
           {ECP}      Write(f, DMMain.StrToEdi(FieldByName('ECP').AsString, 5));
           {CP de la empresa}
           {NIF}      Write(f, DMMain.StrToEdi(FieldByName('ENIF').AsString, 17));
           {NIF de la empresa}
           {EMERCA}   Write(f, DMMain.StrToEdi(FieldByName('EMERCA').AsString, 70));
           {Registro Mercantil de la empresa}
           {NOTAC}    Write(f, DMMain.StrToEdi(FieldByName('NOTAC').AsString, 17));
           {Nota de cargo que se abona, DIA}
           {NUMREL}   Write(f, DMMain.StrToEdi(FieldByName('NUMREL').AsString, 17));
           {Numero de relacion de entregas, CONDIS}
           {RECOGIDA} Write(f, DMMain.StrToEdi(FieldByName('RECOGIDA').AsString, 17));
           {Codigo EDI de donde se regoge, DIA}
           {DESTINO}  Write(f, DMMain.StrToEdi(FieldByName('DESTINO').AsString, 17));
           {Codigo EDI del destino, EAN13, El corte ingles}
           {FECEFEC}  Write(f, DMMain.DateToEdi(FieldByName('FECHA_EFEC').AsDateTime));
           {Fecha de emision de la factura}
           WriteLn(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;
  {Notas Cabecera ---------------------------------------------------------------}
  with QMCabecera do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := rig;
     Open;
  end;
  if (not QMCabecera.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'obsfac.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'obsfac.txt')) then
        Append(f)
     else
        Rewrite(f);
     Memo := TStringList.Create;
     with QMCabecera do
     begin
        memo.Assign(FieldByName('NOTAS'));
        if (memo.Count > 0) then
        begin
           {NUMFAC}   Write(f, DMMain.StrToEdi(FieldByName('SERIE').AsString +
              '/' + FieldByName('RIG').AsString, 15));
           {NUMOBS}   Write(f, DMMain.IntToEdiNum(1, 5, 0));
           {G2K solo tiene una observacion}
           {TEMA}     Write(f, DMMain.StrToEdi('AAI', 15));
           {AAI, información gral. (no hay mas opciones)}
           if (memo.Count > 0) then
              {TEXTO1}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[0], 1, 70), 70));
           {Texto libre}
           if (memo.Count > 1) then
              {TEXTO2}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[1], 1, 70), 70));
           {Texto libre}
           if (memo.Count > 2) then
              {TEXTO3}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[2], 1, 70), 70));
           {Texto libre}
           if (memo.Count > 3) then
              {TEXTO4}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[3], 1, 70), 70));
           {Texto libre}
           if (memo.Count > 4) then
              {TEXTO5}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[4], 1, 70), 70));
           {Texto libre}
           writeln(f);
        end;
        Close;
     end;
     memo.Free;
     CloseFile(f);
  end;
  {Dto. factura -----------------------------------------------------------------}
  with QEdiFacCabDto do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := rig;
     Open;
  end;
  if (not QEdiFacCabDto.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'dtofac.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'dtofac.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEdiFacCabDto do
     begin
        while not EOF do
        begin
           {NUMFAC}  Write(f, DMMain.StrToEdi(FieldByName('NUMFAC').AsString, 15));
           {NUMDTO}  Write(f, DMMain.IntToEdiNum(FieldByName('NUMDTO').AsInteger, 5, 0));
           {Nro. de Descuento}
           {CALDTO}  Write(f, DMMain.StrToEdi(FieldByName('CALDTO').AsString, 3));
           {A=Descuento  C=Cargo}
           {SECUEN}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN').AsInteger, 2, 0));
           {Secuencia}
           {TIPODES} Write(f, DMMain.StrToEdi(FieldByName('TIPODES').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDES}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDES').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           WriteLn(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;
  {Impuestos factura ------------------------------------------------------------}
  with QEDIFacCabImp do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := rig;
     Open;
  end;
  if (not QEDIFacCabImp.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'impfac.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'impfac.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEDIFacCabImp do
     begin
        // i := 1;
        while not EOF do
        begin
           {NUMFAC}   Write(f, DMMain.StrToEdi(FieldByName('NUMFAC').AsString, 15));
           {NUMIMP}   Write(f, DMMain.IntToEdiNum(FieldByName('NUMIMP').AsInteger, 5, 0));
           {Nro. de Impuesto}
           {BASEIMP}  Write(f, DMMain.FloatToEdiNum(FieldByName('BASEIMP').AsFloat, 15, 3));
           {Base imponible}
           {TIPO}     Write(f, DMMain.StrToEdi(FieldByName('TIPOI').AsString, 3));
           {VAT,ENV,EXT,IGI,ACT,RE,RET,OTH}
           {TASA}     Write(f, DMMain.FloatToEdiNum(FieldByName('TASA').AsFloat, 8, 3));
           {Porcentaje de impuesto}
           {IMPORTE}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPORTE').AsFloat, 15, 3));
           {Importe del impuesto}
           WriteLn(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;
  {Detalle de Factura -----------------------------------------------------------}
  with QEDIFacDet do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := rig;
     Open;
  end;
  if (not QEDIFacDet.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'linfac.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'linfac.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEDIFacDet do
     begin
        while not EOF do
        begin
           {NUMFAC}   Write(f, DMMain.StrToEdi(FieldByName('NUMFAC').AsString, 15));
           {NUMLIN}   Write(f, DMMain.IntToEdiNum(FieldByName('NUMLIN').AsInteger, 5, 0));
           {Nro. de linea}
           {REFEAN}   Write(f, DMMain.StrToEdi(FieldByName('REFEAN').AsString, 17));
           {Ref EAN13 del artículo}
           {REFCLI}   Write(f, DMMain.StrToEdi(FieldByName('REFCLI').AsString, 35));
           {Ref interna del artículo segun el cliente - El corte inglés es espacial}
           {REFPRO}   Write(f, DMMain.StrToEdi(FieldByName('REFPRO').AsString, 35));
           {Ref según proveedor}
           {VP}       Write(f, DMMain.StrToEdi(FieldByName('VP').AsString, 2));
           {Variable promocional}
           {DUN14}    Write(f, DMMain.StrToEdi(FieldByName('DUN14').AsString, 14));
           {Codigo DUN14 del articulo = cod.logistico+EAN13}
           {DESC}     Write(f, DMMain.StrToEdi(FieldByName('DESCRIP').AsString, 70));
           {Descripcion del articulo}
           {CFAC}     Write(f, DMMain.FloatToEdiNum(FieldByName('CFAC').AsFloat, 15, 3));
           {Cantidad}
           {MEDIDA}   Write(f, DMMain.IntToEdiNum(FieldByName('MEDIDA').AsInteger, 10, 0));
           {Cantidad de articulos (bultos)}
           {UMEDIDA}  Write(f, DMMain.StrToEdi(FieldByName('UMEDIDA').AsString, 3));
           {KGM,LTR}
           {PRECIOB}  Write(f, DMMain.FloatToEdiNum(FieldByName('PRECIOB').AsFloat, 15, 3));
           {Precio bruto unitario}
           {PRECION}  Write(f, DMMain.FloatToEdiNum(FieldByName('PRECION').AsFloat, 15, 3));
           {Precio neto unitario}

           {TIPOIMP1} Write(f, DMMain.StrToEdi(FieldByName('TIPOIMP1').AsString, 3));
           {VAT,ENV,EXT,ACT,RE,RET,OTH}
           {TASA1}    Write(f, DMMain.FloatToEdiNum(FieldByName('TASA1').AsFloat, 8, 3));
           {Porcentaje de impuesto}
           {IMPTASA1} Write(f, DMMain.FloatToEdiNum(
              FieldByName('IMPTASA1').AsFloat, 15, 3));
           {Importe impuesto}
           {TIPOIMP2} Write(f, DMMain.StrToEdi(FieldByName('TIPOIMP2').AsString, 3));
           {VAT,ENV,EXT,ACT,RE,RET,OTH}
           {TASA2}    Write(f, DMMain.FloatToEdiNum(FieldByName('TASA2').AsFloat, 8, 3));
           {Porcentaje de impuesto}
           {IMPTASA2} Write(f, DMMain.FloatToEdiNum(
              FieldByName('IMPTASA2').AsFloat, 15, 3));
           {Importe impuesto}
           {TIPOIMP3} Write(f, DMMain.StrToEdi(FieldByName('TIPOIMP3').AsString, 3));
           {VAT,ENV,EXT,ACT,RE,RET,OTH}
           {TASA3}    Write(f, DMMain.FloatToEdiNum(FieldByName('TASA3').AsFloat, 8, 3));
           {Porcentaje de impuesto}
           {IMPTASA3} Write(f, DMMain.FloatToEdiNum(
              FieldByName('IMPTASA3').AsFloat, 15, 3));
           {Importe impuesto}

           {CALIF1}   Write(f, DMMain.StrToEdi(FieldByName('CALIF1').AsString, 3));
           {A=Descuento   C=Cargo}
           {SECUEN1}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN1').AsInteger, 2, 0));
           {Secuencia}
           {TIPO1}    Write(f, DMMain.StrToEdi(FieldByName('TIPO1').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN1}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN1').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDTO1}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDTO1').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {CALIF2}   Write(f, DMMain.StrToEdi(FieldByName('CALIF2').AsString, 3));
           {A=Descuento   C=Cargo}
           {SECUEN2}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN2').AsInteger, 2, 0));
           {Secuencia}
           {TIPO2}    Write(f, DMMain.StrToEdi(FieldByName('TIPO2').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN2}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN2').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDTO2}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDTO2').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {CALIF3}   Write(f, DMMain.StrToEdi(FieldByName('CALIF3').AsString, 3));
           {A=Descuento   C=Cargo}
           {SECUEN3}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN3').AsInteger, 2, 0));
           {Secuencia}
           {TIPO3}    Write(f, DMMain.StrToEdi(FieldByName('TIPO3').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN3}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN3').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDTO3}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDTO3').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {CALIF4}   Write(f, DMMain.StrToEdi(FieldByName('CALIF4').AsString, 3));
           {A=Descuento   C=Cargo}
           {SECUEN4}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN4').AsInteger, 2, 0));
           {Secuencia}
           {TIPO4}    Write(f, DMMain.StrToEdi(FieldByName('TIPO4').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN4}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN4').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDTO4}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDTO4').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           {CBONI}    Write(f, DMMain.IntToEdiNum(FieldByName('CBONI').AsInteger, 15, 0));
           {Cantidad Bonificada/Regalada}
           {NETO}     Write(f, DMMain.FloatToEdiNum(FieldByName('NETO').AsFloat, 15, 3));
           {Importe Neto. con desc y cargos, sin impuestos}
           {PVERDE}   Write(f, DMMain.FloatToEdiNum(FieldByName('PVERDE').AsFloat, 15, 3));
           {Punto Verde por linea}
           {PEDIDO}   Write(f, DMMain.StrToEdi(FieldByName('PEDIDO').AsString, 17));
           {Nro de pedido en el caso de que sea asoc. a varios pedidos}
           AlbaranStr := '0000000' + FieldByName('ALBARAN').AsString;
           AlbaranStr := Copy(AlbaranStr, Length(AlbaranStr) - 6, 7);
           {ALBARAN}  Write(f, AlbaranStr, 17);
           {Nro de albaran en el caso de que sea asoc. a varios pedidos}
           {LOTE}     Write(f, DMMain.StrToEdi(FieldByName('LOTE').AsString, 17));
           {Nro de lote}
           {FCARGA}   Write(f, DMMain.DateToEdi(FieldByName('FCARGA').AsDateTime));
           {Fecha de carga - Solo DIA}
           {FENTREGA} Write(f, DMMain.DateToEdi(FieldByName('FENTREGA').AsDateTime));
           {Fecha de entrega - Solo DIA}
           {MATRICULA}Write(f, DMMain.StrToEdi(FieldByName('MATRICULA').AsString, 17));
           {Matricula del vehiculo - Solo DIA}
           writeln(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;
  {Notas Detalle ----------------------------------------------------------------}
  with QMDetalle do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := rig;
     Open;
  end;
  if (not QMDetalle.EOF) then
  begin
     Memo := TStringList.Create;
     memo.Assign(QMDetalle.FieldByName('NOTAS'));
     if (memo.Count > 0) then
     begin
        AssignFile(f, REntorno.DirectorioEDI_Salida + 'obslfac.txt');
        if (FileExists(REntorno.DirectorioEDI_Salida + 'obslfac.txt')) then
           Append(f)
        else
           Rewrite(f);
        with QMDetalle do
        begin
           while not EOF do
           begin
              {NUMFAC}   Write(f, DMMain.StrToEdi(FieldByName('SERIE').AsString +
                 '/' + FieldByName('RIG').AsString, 15));
              {NUMLIN}   Write(f, DMMain.IntToEdiNum(FieldByName('LINEA').AsInteger, 5, 0));
              {Nro. de linea}
              {NUMOBS}   Write(f, DMMain.IntToEdiNum(1, 5, 0));
              {G2K solo tiene una observacion}
              {TEMA}     Write(f, DMMain.StrToEdi('AAI', 15));
              {AAI, información gral. (no hay mas opciones)}
              if (memo.Count > 0) then
                 {TEXTO1}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[0], 1, 70), 70));
              {Texto libre}
              if (memo.Count > 1) then
                 {TEXTO2}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[1], 1, 70), 70));
              {Texto libre}
              if (memo.Count > 2) then
                 {TEXTO3}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[2], 1, 70), 70));
              {Texto libre}
              if (memo.Count > 3) then
                 {TEXTO4}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[3], 1, 70), 70));
              {Texto libre}
              if (memo.Count > 4) then
                 {TEXTO5}   Write(f, DMMain.StrToEdi(Copy(memo.Strings[4], 1, 70), 70));
              {Texto libre}
              writeln(f);
           end;
           Next;
        end;
        CloseFile(f);
     end;
     Memo.Free;
     QMDetalle.Close;
  end;
  {Descuentos Detalle -----------------------------------------------------------}
  with QEDIFacDetDto do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := rig;
     Open;
  end;
  if (not QEDIFacDetDto.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'dtolfac.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'dtolfac.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEDIFacDetDto do
     begin
        while not EOF do
        begin
           {NUMFAC}  Write(f, DMMain.StrToEdi(FieldByName('NUMFAC').AsString, 15));
           {NUMLIN}  Write(f, DMMain.IntToEdiNum(FieldByName('NUMLIN').AsInteger, 5, 0));
           {Nro. de linea}
           {NUMDTO}  Write(f, DMMain.IntToEdiNum(FieldByName('NUMDTO').AsInteger, 5, 0));
           {Nro de Descuento}
           {CALIF}   Write(f, DMMain.StrToEdi(FieldByName('CALIF').AsString, 3));
           {A=Descuento  C=Cargo}
           {SECUEN}  Write(f, DMMain.IntToEdiNum(FieldByName('SECUEN').AsInteger, 2, 0));
           {Secuencia}
           {TIPO}    Write(f, DMMain.StrToEdi(FieldByName('TIPOD').AsString, 3));
           {EAB,TD,FC,PC,SH,IN,CW,RAD,ABH,ACQ,FI}
           {PORCEN}  Write(f, DMMain.FloatToEdiNum(FieldByName('PORCEN').AsFloat, 8, 3));
           {Porcentaje de descuento/cargo}
           {IMPDES}  Write(f, DMMain.FloatToEdiNum(FieldByName('IMPDES').AsFloat, 15, 3));
           {Importe de descuento/cargo}
           writeln(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;
end;

end.
