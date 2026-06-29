unit UDMExportaAlbaranEDI;

interface

uses
  SysUtils, Classes, FIBQuery, DB, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FR_Class, Fr_HYReport, UFormGest, HYFIBQuery;

type
  TDMExportaAlbaranEDI = class(TDataModule)
     TLocal: THYTransaction;
     xProcedencia: TFIBDataSetRO;
     xDireccion: TFIBDataSetRO;
     QMCabecera: TFIBDataSetRO;
     QMDetalle: TFIBDataSetRO;
     QMCabeceraImpuestos: TFIBDataSetRO;
     QMVencimientos: TFIBDataSetRO;
     xProcedenciaLinea: TFIBDataSetRO;
     QEDIAlbCab: TFIBDataSetRO;
     QEDIAlbEmb: TFIBDataSetRO;
     QEDIAlbCabImp: TFIBDataSetRO;
     QEDIAlbDet: TFIBDataSetRO;
     QEDIAlbDetDto: TFIBDataSetRO;
     frEtiquetaEdi: TfrHYReport;
     QEDIAlbLoc: TFIBDataSetRO;
     procedure frEtiquetaEdiGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     Bultos: integer;
     BultoNro: integer;
  public
     { Public declarations }
     procedure Exporta(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer);
     procedure ImprimirEtiqueta(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer; Modo: byte);
  end;

var
  DMExportaAlbaranEDI : TDMExportaAlbaranEDI;

implementation

uses UDMMain, UEntorno, UDMListados, UParam;

{$R *.dfm}

procedure TDMExportaAlbaranEDI.Exporta(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer);
var
  f : TextFile;
  i : integer;
  // id_s : integer;
  // linea : integer;
  // Albaran : integer;
  AlbaranStr : string;
  // RefAlbaran : string;
  // Pedido : integer;
  // RefPedido : string;
  // Moneda : string;
  auxs : string;
  // cliente : string;
  Destino : string;
  CodigoProveedorSSCC : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_GENERA_ALB_EDI (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := Rig;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Agrega los SSCC para identificar las cajas -----------------------------------
  with QEDIAlbEmb do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
     while (not EOF) do
     begin
        if ((FieldByName('SSCC1').AsString <= '') and
           (Pos(FieldByName('TIPEMB').AsString, 'CT,CS,PK,SL,SW,RO') > 0) and
           (FieldByName('CPSPADRE').AsString > '')) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT DESTINO FROM EDI_ALB_CAB ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = ?EMPRESA AND ');
                 SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
                 SQL.Add(' CANAL = ?CANAL AND ');
                 SQL.Add(' SERIE = ?SERIE AND ');
                 SQL.Add(' TIPO = ?TIPO AND ');
                 SQL.Add(' RIG = ?RIG ');
                 Params.ByName['EMPRESA'].AsInteger := Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['CANAL'].AsInteger := Canal;
                 Params.ByName['SERIE'].AsString := Serie;
                 Params.ByName['TIPO'].AsString := Tipo;
                 Params.ByName['RIG'].AsInteger := Rig;
                 ExecQuery;
                 Destino := FieldByName['DESTINO'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           {------------------------------------------------------------------------------}
           // El Corte Ingles - 3PPPPPPPCCCCCCCCCD
           if ((Copy(Destino, 1, 7) = '8422416') or (Copy(Destino, 1, 7) = '5609431') or (Copy(Destino, 1, 7) = '5600000')) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT T.CODIGO_EDI FROM SYS_EMPRESAS E ');
                    SQL.Add(' JOIN SYS_TERCEROS T ');
                    SQL.Add(' ON E.TERCERO = T.TERCERO ');
                    SQL.Add(' WHERE E.EMPRESA = ' + REntorno.EmpresaStr);
                    ExecQuery;
                    auxs := FieldByName['CODIGO_EDI'].AsString;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT MAX(SSCC1) FROM EDI_ALB_EMB WHERE SSCC1 STARTING WITH ''3' + Copy(auxs, 1, 7) + '''';
                    ExecQuery;
                    i := StrToIntDef(Copy(FieldByName['MAX'].AsString, 9, 9), 0) + 1;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE EDI_ALB_EMB ');
                    SQL.Add(' SET SSCC1 = ?SSCC1 ');
                    SQL.Add(' WHERE  ');
                    SQL.Add(' IDCAB = ?IDCAB AND ');
                    SQL.Add(' IDEMB = ?IDEMB AND ');
                    SQL.Add(' EMPRESA = ?EMPRESA AND ');
                    SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
                    SQL.Add(' CANAL = ?CANAL AND ');
                    SQL.Add(' SERIE = ?SERIE AND ');
                    SQL.Add(' TIPO = ?TIPO AND ');
                    SQL.Add(' RIG = ?RIG ');
                    Params.ByName['SSCC1'].AsString := DMMain.AgregaDigitoControl('3' + Copy(auxs, 1, 7) + Copy(DMMain.IntToEDINum(i, 10, 0), 2, 9));
                    Params.ByName['IDCAB'].AsString := QEDIAlbEmb.FieldByName('IDCAB').AsString;
                    Params.ByName['IDEMB'].AsString := QEDIAlbEmb.FieldByName('IDEMB').AsString;
                    Params.ByName['EMPRESA'].AsInteger := Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                    Params.ByName['CANAL'].AsInteger := Canal;
                    Params.ByName['SERIE'].AsString := Serie;
                    Params.ByName['TIPO'].AsString := Tipo;
                    Params.ByName['RIG'].AsInteger := Rig;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
           {------------------------------------------------------------------------------}
           // Cortefiel - 7PPPPCCCCCCCD
           if (Copy(Destino, 1, 7) = '8429107') then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT MAX(SSCC1) FROM EDI_ALB_EMB WHERE SSCC1 STARTING WITH ''7''';
                    ExecQuery;
                    i := StrToIntDef(Copy(FieldByName['MAX'].AsString, 6, 7), 0) + 1;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              if (Copy(Destino, 1, 7) = '8429107') then
              begin
                 // ********************************************************************************
                 // 0264 es el codigo para Mirko Bender.
                 // 2040 es el codigo para Beltcom.
                 // ********************************************************************************
                 CodigoProveedorSSCC := format('%.4d', [StrToIntDef(LeeParametro('EDICODP001', Serie), 0)]);


                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE EDI_ALB_EMB ');
                       SQL.Add(' SET SSCC1 = ?SSCC1 ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' IDCAB = ?IDCAB AND ');
                       SQL.Add(' IDEMB = ?IDEMB AND ');
                       SQL.Add(' EMPRESA = ?EMPRESA AND ');
                       SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
                       SQL.Add(' CANAL = ?CANAL AND ');
                       SQL.Add(' SERIE = ?SERIE AND ');
                       SQL.Add(' TIPO = ?TIPO AND ');
                       SQL.Add(' RIG = ?RIG ');
                       Params.ByName['SSCC1'].AsString := DMMain.AgregaDigitoControl('7' + CodigoProveedorSSCC + Copy(DMMain.IntToEDINum(i, 8, 0), 2, 7));
                       Params.ByName['IDCAB'].AsString := QEDIAlbEmb.FieldByName('IDCAB').AsString;
                       Params.ByName['IDEMB'].AsString := QEDIAlbEmb.FieldByName('IDEMB').AsString;
                       Params.ByName['EMPRESA'].AsInteger := Empresa;
                       Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                       Params.ByName['CANAL'].AsInteger := Canal;
                       Params.ByName['SERIE'].AsString := Serie;
                       Params.ByName['TIPO'].AsString := Tipo;
                       Params.ByName['RIG'].AsInteger := Rig;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
              {**********************************************************************************************}
           end;
           {------------------------------------------------------------------------------}
        end;
        Next;
     end;
  end;

  {Cabecera ---------------------------------------------------------------------}
  with QEdiAlbCab do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
  if (not QEdiAlbCab.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'cabalb.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'cabalb.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEdiAlbCab do
     begin
        while not EOF do
        begin
           {IDCAB}    Write(f, DMMain.StrToEdi(FieldByName('IDCAB').AsString, 10));
           // Nro. de Albaran. El corte inglés max 7 digitos
           // AlbaranStr := '0000000' + FieldByName('NUMDES').AsString;
           // AlbaranStr := Copy(AlbaranStr, Length(AlbaranStr) - 6, 7);
           {NUMDES}   Write(f, DMMain.StrToEdi(FieldByName('NUMDES').AsString, 35));
           {TIPO}     Write(f, DMMain.StrToEdi(FieldByName('TIPOA').AsString, 3));
           {FUNCION}  Write(f, DMMain.StrToEdi(FieldByName('FUNCION').AsString, 3)); {Copia}
           {FECDES}   Write(f, DMMain.DateToEdi(FieldByName('FECDES').AsDateTime));
           {FECENT}   Write(f, DMMain.DateToEdi(FieldByName('FECENT').AsDateTime));
           {FECENTSO} Write(f, DMMain.DateToEdi(FieldByName('FECENTSO').AsDateTime));
           {FECPANT}  Write(f, DMMain.DateToEdi(FieldByName('FECPANT').AsDateTime));
           {FECPDES}  Write(f, DMMain.DateToEdi(FieldByName('FECPDES').AsDateTime));
           {CONCEP}   Write(f, DMMain.StrToEdi(FieldByName('CONESP').AsString, 3));
           // Nro. de Albaran. El corte inglés max 7 digitos
           // AlbaranStr := '0000000' + FieldByName('NUMALB').AsString;
           // AlbaranStr := Copy(AlbaranStr, Length(AlbaranStr) - 6, 7);
           {NUMALB}   Write(f, DMMain.StrToEdi(FieldByName('NUMALB').AsString, 35));
           {FECALB}   Write(f, DMMain.DateToEdi(FieldByName('FECALB').AsDateTime));
           {NUMPED}   Write(f, DMMain.StrToEdi(FieldByName('NUMPED').AsString, 35));
           {FECPED}   Write(f, DMMain.DateToEdi(FieldByName('FECPED').AsDateTime));
           {NUMPICK}  Write(f, DMMain.StrToEdi(FieldByName('NUMPICK').AsString, 35));
           {FECPICK}  Write(f, DMMain.DateToEdi(FieldByName('FECPICK').AsDateTime));
           {ORIGEN}   Write(f, DMMain.StrToEdi(FieldByName('ORIGEN').AsString, 17));
           {DESTINO}  Write(f, DMMain.StrToEdi(FieldByName('DESTINO').AsString, 17));
           {PROVEEDOR}Write(f, DMMain.StrToEdi(FieldByName('PROVEEDOR').AsString, 17));
           {COMPRADOR}Write(f, DMMain.StrToEdi(FieldByName('COMPRADOR').AsString, 17));
           {DPTO}     Write(f, DMMain.StrToEdi(FieldByName('DPTO').AsString, 17));
           {RECEPTOR} Write(f, DMMain.StrToEdi(FieldByName('RECEPTOR').AsString, 17));
           {MUELLE}   Write(f, DMMain.StrToEdi(FieldByName('MUELLE').AsString, 17));
           {PUNTENV}  Write(f, DMMain.StrToEdi(FieldByName('PUNTENV').AsString, 17));
           {EXPEDIDOR}Write(f, DMMain.StrToEdi(FieldByName('EXPEDIDOR').AsString, 17));
           {ULTCONS}  Write(f, DMMain.StrToEdi(FieldByName('ULTCONS').AsString, 17));
           {ENTREGA}  Write(f, DMMain.StrToEdi(FieldByName('ENTREGA').AsString, 3));
           {REPOS}    Write(f, DMMain.StrToEdi(FieldByName('REPOS').AsString, 35));
           {PORTES}   Write(f, DMMain.StrToEdi(FieldByName('PORTES').AsString, 3));
           {RECOGIDA} Write(f, DMMain.StrToEdi(FieldByName('RECOGIDA').AsString, 3));
           {TIPTRANS} Write(f, DMMain.StrToEdi(FieldByName('TIPTRANS').AsString, 3));
           {IDTRANS}  Write(f, DMMain.StrToEdi(FieldByName('IDTRANS').AsString, 17));
           {MATRIC}   Write(f, DMMain.StrToEdi(FieldByName('MATRIC').AsString, 35));
           {TOTQTY}   Write(f, DMMain.FloatToEdiNum(FieldByName('TOTQTY').AsFloat, 15, 3));
           {IDENTIF}  Write(f, DMMain.StrToEdi(FieldByName('IDENTIF').AsString, 3));
           {CONSIG}   Write(f, DMMain.StrToEdi(FieldByName('CONSIG').AsString, 3));
           {CIP}      Write(f, DMMain.StrToEdi(FieldByName('CIP').AsString, 17));
           {FECENVIO} Write(f, DMMain.DateToEdi(FieldByName('FECENVIO').AsDateTime));
           {CODPROV}  Write(f, DMMain.StrToEdi(FieldByName('CODPROV').AsString, 25));
           WriteLn(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;

  {Embalaje ---------------------------------------------------------------------}
  with QEdiAlbEmb do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
  if (not QEdiAlbEmb.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'embalb.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'embalb.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEdiAlbEmb do
     begin
        while not EOF do
        begin
           {IDCAB}    Write(f, DMMain.StrToEdi(FieldByName('IDCAB').AsString, 10));
           {IDEMB}    Write(f, DMMain.StrToEdi(FieldByName('IDEMB').AsString, 10));
           {CPS}      Write(f, DMMain.StrToEdi(FieldByName('CPS').AsString, 12));
           {CPSPADRE} Write(f, DMMain.StrToEdi(FieldByName('CPSPADRE').AsString, 12));
           {CANTEMB}  Write(f, DMMain.FloatToEdiNum(FieldByName('CANTEMB').AsFloat, 15, 3));
           {TIPCOD}   Write(f, DMMain.StrToEdi(FieldByName('TIPCOD').AsString, 3));
           {COSEMB}   Write(f, DMMain.StrToEdi(FieldByName('COSEMB').AsString, 3));
           {TIPEMB}   Write(f, DMMain.StrToEdi(FieldByName('TIPEMB').AsString, 3));
           {DESCEMB}  Write(f, DMMain.StrToEdi(FieldByName('DESCEMB').AsString, 35));
           {PAGRET}   Write(f, DMMain.StrToEdi(FieldByName('PAGRET').AsString, 3));
           {PESON}    Write(f, DMMain.FloatToEdiNum(FieldByName('PESON').AsFloat, 15, 3));
           {PESOB}    Write(f, DMMain.FloatToEdiNum(FieldByName('PESOB').AsFloat, 15, 3));
           {PESONU}   Write(f, DMMain.FloatToEdiNum(FieldByName('PESONU').AsFloat, 15, 3));
           {PESOBU}   Write(f, DMMain.FloatToEdiNum(FieldByName('PESOBU').AsFloat, 15, 3));
           {UNIPESO}  Write(f, DMMain.StrToEdi(FieldByName('UNIPESO').AsString, 3));
           {ALTURA}   Write(f, DMMain.FloatToEdiNum(FieldByName('ALTURA').AsFloat, 15, 3));
           {LONGITUD} Write(f, DMMain.FloatToEdiNum(
              FieldByName('LONGITUD').AsFloat, 15, 3));
           {ANCHURA}  Write(f, DMMain.FloatToEdiNum(FieldByName('ANCHURA').AsFloat, 15, 3));
           {UNIMED}   Write(f, DMMain.StrToEdi(FieldByName('UNIMED').AsString, 3));
           {CANCONSI} Write(f, DMMain.FloatToEdiNum(
              FieldByName('CANCONSI').AsFloat, 15, 3));
           {MANUPUL}  Write(f, DMMain.StrToEdi(FieldByName('MANIPUL').AsString, 3));
           {DESCMANI} Write(f, DMMain.StrToEdi(FieldByName('DESCMANI').AsString, 70));
           {SSCC1}    Write(f, DMMain.StrToEdi(FieldByName('SSCC1').AsString, 35));
           {SSCC2}    Write(f, DMMain.StrToEdi(FieldByName('SSCC2').AsString, 35));
           {SSCC3}    Write(f, DMMain.StrToEdi(FieldByName('SSCC3').AsString, 35));
           {SSCC4}    Write(f, DMMain.StrToEdi(FieldByName('SSCC4').AsString, 35));
           {SSCC5}    Write(f, DMMain.StrToEdi(FieldByName('SSCC5').AsString, 35));
           {LOTE}     Write(f, DMMain.StrToEdi(FieldByName('LOTE').AsString, 35));
           {TIPO2}    Write(f, DMMain.StrToEdi(FieldByName('TIPO2').AsString, 3));
           {TCAJAS}   Write(f, DMMain.IntToEdiNum(FieldByName('TCAJAS').AsInteger, 15, 0));
           {DESTDIF}  Write(f, DMMain.StrToEdi(FieldByName('DESTDIF').AsString, 3));
           {FECMAT}   Write(f, DMMain.DateToEdi(FieldByName('FECMAT').AsDateTime));
           {FECCAD}   Write(f, DMMain.DateToEdi(FieldByName('FECCAD').AsDateTime));
           {FECCON}   Write(f, DMMain.DateToEdi(FieldByName('FECCON').AsDateTime));
           WriteLn(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;
  {Detalle ----------------------------------------------------------------------}
  with QEdiAlbDet do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
  if (not QEdiAlbDet.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'linalb.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'linalb.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEdiAlbDet do
     begin
        while not EOF do
        begin
           {IDCAB}    Write(f, DMMain.StrToEdi(FieldByName('IDCAB').AsString, 10));
           {IDEMB}    Write(f, DMMain.StrToEdi(FieldByName('IDEMB').AsString, 10));
           {IDLIN}    Write(f, DMMain.StrToEdi(FieldByName('IDLIN').AsString, 10));
           {EAN}      Write(f, DMMain.StrToEdi(FieldByName('EAN').AsString, 35));
           {VP}       Write(f, DMMain.StrToEdi(FieldByName('VP').AsString, 2));
           {REFPROV}  Write(f, DMMain.StrToEdi(FieldByName('REFPROV').AsString, 35));
           {REFCLI}   Write(f, DMMain.StrToEdi(FieldByName('REFCLI').AsString, 35));
           {SERIE}    Write(f, DMMain.StrToEdi(FieldByName('NSERIE').AsString, 35));
           {NUMEXP}   Write(f, DMMain.StrToEdi(FieldByName('NUMEXP').AsString, 35));
           {DESCRIP}  Write(f, DMMain.StrToEdi(FieldByName('DESCRIP').AsString, 70));
           {TIPART}   Write(f, DMMain.StrToEdi(FieldByName('TIPART').AsString, 3));
           {CENVFAC}  Write(f, DMMain.FloatToEdiNum(FieldByName('CENVFAC').AsFloat, 15, 3));
           {CENVGRA}  Write(f, DMMain.FloatToEdiNum(FieldByName('CENVGRA').AsFloat, 15, 3));
           {CUGRUSUP} Write(f, DMMain.FloatToEdiNum(
              FieldByName('CUGRUSUP').AsFloat, 15, 3));
           {CUEXP}    Write(f, DMMain.FloatToEdiNum(FieldByName('CUEXP').AsFloat, 15, 3));
           {UNICANT}  Write(f, DMMain.StrToEdi(FieldByName('UNICANT').AsString, 3));
           {TEXTO1}   Write(f, DMMain.StrToEdi(FieldByName('TEXTO1').AsString, 70));
           {TEXTO2}   Write(f, DMMain.StrToEdi(FieldByName('TEXTO2').AsString, 70));
           {TEXTO3}   Write(f, DMMain.StrToEdi(FieldByName('TEXTO3').AsString, 70));
           {TEXTO4}   Write(f, DMMain.StrToEdi(FieldByName('TEXTO4').AsString, 70));
           {TEXTO5}   Write(f, DMMain.StrToEdi(FieldByName('TEXTO5').AsString, 70));
           {NUMPED}   Write(f, DMMain.StrToEdi(FieldByName('NUMPED').AsString, 35));
           {Nro. de Albaran. El corte inglés max 7 digitos / Cortefiel tiene que ser blanco}
           if ((Copy(Destino, 1, 7) = '8422416') or (Copy(Destino, 1, 7) = '5609431')) then
              {E.C.I.}
           begin
              AlbaranStr := '0000000' + FieldByName('NUMALB').AsString;
              AlbaranStr := Copy(AlbaranStr, Length(AlbaranStr) - 6, 7);
              {NUMALB}   Write(f, DMMain.StrToEdi(AlbaranStr, 35));
           end
           else if (Copy(Destino, 1, 7) = '8429107') then {Cortefiel}
              {NUMALB}   Write(f, DMMain.StrToEdi('', 35))
           else
              {NUMALB}   Write(f, DMMain.StrToEdi('', 35));
           {SSCC1}    Write(f, DMMain.StrToEdi(FieldByName('SSCC1').AsString, 35));
           {SSCC2}    Write(f, DMMain.StrToEdi(FieldByName('SSCC2').AsString, 35));
           {SSCC3}    Write(f, DMMain.StrToEdi(FieldByName('SSCC3').AsString, 35));
           {SSCC4}    Write(f, DMMain.StrToEdi(FieldByName('SSCC4').AsString, 35));
           {SSCC5}    Write(f, DMMain.StrToEdi(FieldByName('SSCC5').AsString, 35));
           {FECENV}   Write(f, DMMain.DateToEdi(FieldByName('FECENV').AsDateTime));
           {FECCONS}  Write(f, DMMain.DateToEdi(FieldByName('FECCONS').AsDateTime));
           {LOTE}     Write(f, DMMain.StrToEdi(FieldByName('LOTE').AsString, 35));
           {CANTLOTE} Write(f, DMMain.FloatToEdiNum(
              FieldByName('CANTLOTE').AsFloat, 15, 3));

           {LOC1}     Write(f, DMMain.StrToEdi(FieldByName('LOC1').AsString, 17));
           {FECLOC1}  Write(f, DMMain.DateToEdi(FieldByName('FECLOC1').AsDateTime));
           {CANTLOC1} Write(f, DMMain.FloatToEdiNum(
              FieldByName('CANTLOC1').AsFloat, 15, 3));
           {LOC2}     Write(f, DMMain.StrToEdi(FieldByName('LOC2').AsString, 17));
           {FECLOC2}  Write(f, DMMain.DateToEdi(FieldByName('FECLOC2').AsDateTime));
           {CANTLOC2} Write(f, DMMain.FloatToEdiNum(
              FieldByName('CANTLOC2').AsFloat, 15, 3));
           {LOC3}     Write(f, DMMain.StrToEdi(FieldByName('LOC3').AsString, 17));
           {FECLOC3}  Write(f, DMMain.DateToEdi(FieldByName('FECLOC3').AsDateTime));
           {CANTLOC3} Write(f, DMMain.FloatToEdiNum(
              FieldByName('CANTLOC3').AsFloat, 15, 3));

           {DESTINO}  Write(f, DMMain.StrToEdi(FieldByName('DESTINO').AsString, 17));
           {FECPED}   Write(f, DMMain.DateToEdi(FieldByName('FECPED').AsDateTime));
           {FECALB}   Write(f, DMMain.DateToEdi(FieldByName('FECALB').AsDateTime));

           {NUMLINPED}Write(f, DMMain.StrToEdi('', 6));
           {Write(f,DMMain.IntToEdiNum(FieldByName('NUMLINPED').AsInteger,6,0));}
           {NUMLINALB}Write(f, DMMain.StrToEdi('', 6));
           {Write(f,DMMain.IntToEdiNum(FieldByName('NUMLINALB').AsInteger,6,0));}

           {PESTOTLIN}Write(f, DMMain.FloatToEdiNum(
              FieldByName('PESTOTLIN').AsFloat, 15, 3));
           {CANTPED}  Write(f, DMMain.FloatToEdiNum(FieldByName('CANTPED').AsFloat, 15, 3));
           {UNICANTPED}Write(f, DMMain.StrToEdi(FieldByName('UNICANTPED').AsString, 3));
           {NUMCROTAL}Write(f, DMMain.StrToEdi(FieldByName('NUMCROTAL').AsString, 35));
           {TARIFA}   Write(f, DMMain.StrToEdi(FieldByName('TARIFA').AsString, 35));
           {FECMAT}   Write(f, DMMain.DateToEdi(FieldByName('FECMAT').AsDateTime));
           {FECCAD}   Write(f, DMMain.DateToEdi(FieldByName('FECCAD').AsDateTime));
           {FECCONPR} Write(f, DMMain.DateToEdi(FieldByName('FECCONPR').AsDateTime));
           {REGMATADERO}Write(f, DMMain.StrToEdi(FieldByName('REGMATADERO').AsString, 35));
           {REGDESPIECE}Write(f, DMMain.StrToEdi(FieldByName('REGDESPIECE').AsString, 35));
           {MATADERO} Write(f, DMMain.StrToEdi(FieldByName('MATADERO').AsString, 25));
           {DESPIECE} Write(f, DMMain.StrToEdi(FieldByName('DESPIECE').AsString, 25));
           {PNACIMIENTO}Write(f, DMMain.StrToEdi(FieldByName('PNACIMIENTO').AsString, 3));
           {PCEBADO}  Write(f, DMMain.StrToEdi(FieldByName('PCEBADO').AsString, 3));
           {PELABORACION}Write(f, DMMain.StrToEdi(FieldByName('PELABORACION').AsString, 3));
           {PDESPIECE}Write(f, DMMain.StrToEdi(FieldByName('PDESPIECE').AsString, 3));
           WriteLn(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;
  {Localizacion ---------------------------------------------------------------}
  with QEDIAlbLoc do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
  if (not QEDIAlbLoc.EOF) then
  begin
     AssignFile(f, REntorno.DirectorioEDI_Salida + 'localb.txt');
     if (FileExists(REntorno.DirectorioEDI_Salida + 'localb.txt')) then
        Append(f)
     else
        Rewrite(f);
     with QEDIAlbLoc do
     begin
        while not EOF do
        begin
           {IDCAB}    Write(f, DMMain.StrToEdi(FieldByName('IDCAB').AsString, 10));
           {IDEMB}    Write(f, DMMain.StrToEdi(FieldByName('IDEMB').AsString, 10));
           {IDLIN}    Write(f, DMMain.StrToEdi(FieldByName('IDLIN').AsString, 10));
           {IDLOC}    Write(f, DMMain.StrToEdi(FieldByName('IDLOC').AsString, 10));
           {LUGAR}    Write(f, DMMain.StrToEdi(FieldByName('LUGAR').AsString, 17));
           {FECENT}   Write(f, DMMain.DateToEdi(FieldByName('FECENT').AsDateTime));
           {CANTIDAD} Write(f, DMMain.FloatToEdiNum(
              FieldByName('CANTIDAD').AsFloat, 15, 3));
           {CANTKGM}  Write(f, DMMain.FloatToEdiNum(FieldByName('CANTKGM')
              .AsFloat, 15, 3));
           {CANTGRAT} Write(f, DMMain.FloatToEdiNum(
              FieldByName('CANTGRAT').AsFloat, 15, 3));
           WriteLn(f);
           Next;
        end;
        Close;
     end;
     CloseFile(f);
  end;
end;

procedure TDMExportaAlbaranEDI.ImprimirEtiqueta(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer; Modo: byte);
var
  tercero : integer;
  direccion : integer;
begin
  AbreData(TDMListados, DMListados);

  with QEdiAlbCab do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TERCERO, DIRECCION FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := Rig;
        ExecQuery;
        tercero := FieldByName['TERCERO'].AsInteger;
        direccion := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xDireccion do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Params.ByName['DIRECCION'].AsInteger := Direccion;
     Open;
  end;
  with QEdiAlbEmb do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
     Bultos := 0;
     while not EOF do
     begin
        if (Pos(QEdiAlbEmb.FieldByName('TIPEMB').AsString, 'CT,CS,PK,SL,SW,RO') > 0) then
           Inc(Bultos);
        Next;
     end;
     QEdiAlbEmb.First;
     BultoNro := 1;
     while not EOF do
     begin
        if (Pos(QEdiAlbEmb.FieldByName('TIPEMB').AsString, 'CT,CS,PK,SL,SW,RO') > 0) then
        begin
           DMListados.Imprimir(5102, 0, Modo, '', '', frEtiquetaEdi, nil, nil);
           Inc(BultoNro);
        end;
        Next;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EDI_PROCESADO ');
        SQL.Add(' SET PROCESAR  = 0, ');
        SQL.Add(' ETIQUETA = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := Rig;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CierraData(DMListados);
end;

procedure TDMExportaAlbaranEDI.frEtiquetaEdiGetValue(const ParName: string; var ParValue: variant);
begin
  if (ParName = 'Bultos') then
     ParValue := Bultos;
  if (ParName = 'NroDeBulto') then
     ParValue := IntToStr(BultoNro) + '/' + IntToStr(Bultos);
  if (ParName = 'Direccion') then
     ParValue := xDireccion.FieldByName('NOMBRE_R_SOCIAL').AsString + #13#10 +
        xDireccion.FieldByName('DIR_NOMBRE_2').AsString + #13#10 +
        xDireccion.FieldByName('DIR_NOMBRE').AsString + #13#10 +
        xDireccion.FieldByName('CODIGO_POSTAL').AsString +
        ' ' + xDireccion.FieldByName('TITULO').AsString;
  if (ParName = 'SSCC') then
     ParValue := QEdiAlbEmb.FieldByName('SSCC1').AsString;
end;

end.
