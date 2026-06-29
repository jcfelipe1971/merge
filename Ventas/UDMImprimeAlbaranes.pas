unit UDMImprimeAlbaranes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBDataSetRO, FIBTableDataSetRO, SysUtils,
  HYFIBQuery;

type
  TDMImprimeAlbaranes = class(TDataModule)
     DSQMAlbaranes: TDataSource;
     QMAlbaranes: TFIBTableSet;
     QMAlbaranesEMPRESA: TIntegerField;
     QMAlbaranesEJERCICIO: TIntegerField;
     QMAlbaranesCANAL: TIntegerField;
     QMAlbaranesSERIE: TFIBStringField;
     QMAlbaranesTIPO: TFIBStringField;
     QMAlbaranesRIG: TIntegerField;
     QMAlbaranesALMACEN: TFIBStringField;
     QMAlbaranesMONEDA: TFIBStringField;
     QMAlbaranesFECHA: TDateTimeField;
     QMAlbaranesTERCERO: TIntegerField;
     QMAlbaranesTITULO: TFIBStringField;
     QMAlbaranesDIRECCION: TIntegerField;
     QMAlbaranesCLIENTE: TIntegerField;
     QMAlbaranesSU_REFERENCIA: TFIBStringField;
     QMAlbaranesFORMA_PAGO: TFIBStringField;
     QMAlbaranesCAMPANYA: TIntegerField;
     QMAlbaranesNOTAS: TBlobField;
     QMAlbaranesESTADO: TIntegerField;
     QMAlbaranesBULTOS: TIntegerField;
     QMAlbaranesLINEAS: TIntegerField;
     QMAlbaranesBRUTO: TFloatField;
     QMAlbaranesI_DTO_LINEAS: TFloatField;
     QMAlbaranesS_BASES: TFloatField;
     QMAlbaranesM_BRUTO: TFloatField;
     QMAlbaranesC_TOTAL: TFloatField;
     QMAlbaranesAGENTE: TIntegerField;
     QMAlbaranesS_CUOTA_IVA: TFloatField;
     QMAlbaranesS_CUOTA_RE: TFloatField;
     QMAlbaranesB_DTO_LINEAS: TFloatField;
     QMAlbaranesDTO_PP: TFloatField;
     QMAlbaranesDTO_CIAL: TFloatField;
     QMAlbaranesI_DTO_CIAL: TFloatField;
     QMAlbaranesI_DTO_PP: TFloatField;
     QMAlbaranesB_COMISION: TFloatField;
     QMAlbaranesI_COMISION: TFloatField;
     QMAlbaranesPOR_FINANCIACION: TFloatField;
     QMAlbaranesI_FINANCIACION: TFloatField;
     QMAlbaranesLIQUIDO: TFloatField;
     QMAlbaranesENTRADA: TIntegerField;
     QMAlbaranesTRANSPORTISTA: TIntegerField;
     QMAlbaranesI_BASE_RETENCION: TFloatField;
     QMAlbaranesP_RETENCION: TFloatField;
     QMAlbaranesI_RETENCION: TFloatField;
     QMAlbaranesTIPO_IRPF: TIntegerField;
     QMAlbaranesA_IRPF: TIntegerField;
     QMAlbaranesTOTAL_A_COBRAR: TFloatField;
     QMAlbaranesNOMBRE_COMERCIAL: TFIBStringField;
     QMAlbaranesPORTES: TIntegerField;
     QMAlbaranesTARIFA: TFIBStringField;
     QMAlbaranesID_S: TIntegerField;
     TLocal: THYTransaction;
     QMAlbaranesEMAIL: TStringField;
     QMAlbaranesPEDIDO_CLIENTE: TFIBStringField;
     QMAlbaranesZ_OBSERVACION: TFIBStringField;
     QMAlbaranesFOLIO: TIntegerField;
     QMAlbaranesTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMAlbaranesID_FICHA_TECNICA: TIntegerField;
     procedure DMImprimeAlbaranesCreate(Sender: TObject);
     procedure QMAlbaranesTOTAL_A_COBRARGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAlbaranesCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja(SoloPendientes: boolean; Serie: string);
     procedure ImprimeAlbaranes(Sender: TForm; TipoListado: byte);
     procedure MarcaTodas(Sender: TForm);
     procedure MarcaHasta(Sender: TForm);
     procedure Filtra(Maestro: TDataSet);
     procedure Refrescar; {dji lrk kri}
     procedure CambiarSeleccion(SoloPendientes: boolean; Desde, Hasta: integer; Serie: string);
     procedure HojaDeCarga(Sender: TForm; Plantilla: string);
     procedure HojaDeRuta(Sender: TForm; Plantilla: string);
  end;

var
  DMImprimeAlbaranes : TDMImprimeAlbaranes;

implementation

uses UFBusca, UFMImprimeAlbaranes, UEntorno, UDMLstAlbaranes, UFormGest, UDMMain,
  UDMListados, UUtiles, UHojaCalc, UDameDato;

{$R *.DFM}

procedure TDMImprimeAlbaranes.DMImprimeAlbaranesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  //  QMAlbaranesTOTAL_A_COBRAR.displayFormat:=MascaraN;

  if not QMAlbaranes.Transaction.InTransaction then
     QMAlbaranes.Transaction.StartTransaction;

  DMMain.FiltraTabla(QMAlbaranes, '11100', True);
end;

procedure TDMImprimeAlbaranes.Filtra(Maestro: TDataSet);
begin
  with QMAlbaranes do
  begin
     if Active then
        Close;
     Params.ByName['EMPRESA'].AsInteger := maestro.FieldByName('EMPRESA').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := maestro.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := maestro.FieldByName('CANAL').AsInteger;
     Open;
  end;
end;

procedure TDMImprimeAlbaranes.ImprimeAlbaranes(Sender: TForm; TipoListado: byte);
var
  Listado, Grupo, Cabecera, Copias : integer;
  Tipo : string;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  QMAlbaranes.DisableControls;
  try
     QMAlbaranes.Open;
     QMAlbaranes.First;
     Listado := REntorno.Formato;
     Grupo := REntorno.Grupo;
     Copias := REntorno.Copias;
     Cabecera := REntorno.Cabecera;
     Tipo := REntorno.TipoListado;
     repeat
        REntorno.Formato := Listado;
        REntorno.Grupo := Grupo;
        REntorno.Copias := Copias;
        REntorno.Cabecera := Cabecera;
        REntorno.TipoListado := Tipo;
        if TFMImprimeAlbaranes(Sender).Seleccionado then
        begin
           AbreData(TDMLstAlbaranes, DMLstAlbaranes);
           case TipoListado of
              0: DMLstAlbaranes.MostrarListado(QMAlbaranesID_S.AsInteger,
                    QMAlbaranesRIG.AsInteger, QMAlbaranesSERIE.AsString,
                    1, 1, QMAlbaranesEJERCICIO.AsInteger);
              // 1:
              //DMLstAlbaranes.MostrarListadoMatricialDirecta(QMAlbaranesRIG.AsInteger,QMAlbaranessSERIE.AsString,1,QMAlbaranesEJERCICIO.AsInteger);
              3:
              begin
                 DMLstALbaranes.MostrarListadoMail(QMAlbaranesID_S.AsInteger, QMAlbaranesSERIE.AsString,
                    2, QMAlbaranesEJERCICIO.AsInteger);

                 InicializaVariableEmail(QMAlbaranes.FieldByName('TIPO').AsString);
                 with VariableEmail do
                 begin
                    Ejercicio := QMAlbaranes.FieldByName('EJERCICIO').AsInteger;
                    Serie := QMAlbaranes.FieldByName('SERIE').AsString;
                    NumeroDocumento := QMAlbaranes.FieldByName('RIG').AsInteger;
                    Fecha := QMAlbaranes.FieldByName('FECHA').AsDateTime;
                    SuReferencia := QMAlbaranes.FieldByName('SU_REFERENCIA').AsString;
                    SuPedido := QMAlbaranes.FieldByName('PEDIDO_CLIENTE').AsString;
                    Folio := IntToStr(QMAlbaranes.FieldByName('FOLIO').AsInteger);
                    TituloDocTributario := DameTituloTipoDocTributario(QMAlbaranes.FieldByName('TIPO_DOC_TRIBUTARIO').AsString);
                    NombreFichero := DMLstAlbaranes.nombreFich;
                    Matricula := DMMain.DameMatriculaFichaTecnica(QMAlbaranes.FieldByName('ID_FICHA_TECNICA').AsInteger);
                    NombreComercial := '';
                    RazonSocial := '';
                    OrdenTrabajo := 0;
                    IdOrdenTrabajo := 0;
                    UsuarioCreadorDocumento := '';
                 end;
                 DamePartesEmail(Asunto, CuerpoMail);
                 try
                    AbreData(TDMListados, DMListados);
                    DMListados.SendMailClientePDF(QMAlbaranesCLIENTE.AsInteger, CuerpoMail, DMLstAlbaranes.rutaFich,
                       DMLstAlbaranes.nombreFich, Asunto, QMAlbaranesTIPO.AsString, QMAlbaranesID_S.AsInteger, False, DMMain.DameCorreoCopiaAgente(QMAlbaranesAGENTE.AsInteger, 'ALB'));
                 finally
                    CuerpoMail.Free;
                 end;
                 CierraData(DMListados);
              end;
           end;
           CierraData(DMLstAlbaranes);
        end;
        QMAlbaranes.Next;
     until QMAlbaranes.EOF;

     QMAlbaranes.First;
  finally
     QMAlbaranes.EnableControls;
  end;

  Refrescar;
end;

procedure TDMImprimeAlbaranes.MarcaTodas(Sender: TForm);
var
  IdS : integer;
begin
  IdS := QMAlbaranesID_S.AsInteger;

  with QMAlbaranes do
  begin
     try
        DisableControls;
        First;
        repeat
           TFMimprimeAlbaranes(Sender).Marca;
           Next;
        until EOF;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMAlbaranes, 'ID_S', IdS);
end;

procedure TDMImprimeAlbaranes.MarcaHasta(Sender: TForm);
var
  IdS : integer;
begin
  IdS := QMAlbaranesID_S.AsInteger;

  with QMAlbaranes do
  begin
     DisableControls;
     try
        while not (TFMimprimeAlbaranes(Sender).DBGAlbaranes.SelectedRows.CurrentRowSelected) do
        begin
           TFMimprimeAlbaranes(Sender).Marca;
           Prior;
        end;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMAlbaranes, 'ID_S', IdS);
end;

procedure TDMImprimeAlbaranes.BusquedaCompleja(SoloPendientes: boolean; Serie: string);
var
  Orden : string;
begin
  with QMAlbaranes do
  begin
     Close;
     if TFBusca.Create(Self).SeleccionaBusqueda(QMAlbaranes, '11100', False) = mrOk then
     begin
        Orden := OrdenadoPor;
        Ordenar('');
        if SelectSQL.Count <> 0 then
        begin
           SelectSQL.Add(' AND TIPO = ''ALB'' ');
           if (SoloPendientes) then
              SelectSQL.Add(' AND MODIFICA_DOC = 0 ');
        end;
        Ordenar(Orden);
     end
     else
        CambiarSeleccion(SoloPendientes, 0, 9999999, Serie);

     Open;
  end;
end;

procedure TDMImprimeAlbaranes.QMAlbaranesTOTAL_A_COBRARGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMAlbaranesMONEDA.AsString, 1),
     QMAlbaranesTOTAL_A_COBRAR.AsFloat);
end;

procedure TDMImprimeAlbaranes.Refrescar; {dji lrk kri}
begin
  UUtiles.Refrescar(QMAlbaranes, 'ID_S', 0);
end;

procedure TDMImprimeAlbaranes.CambiarSeleccion(SoloPendientes: boolean; Desde, Hasta: integer; Serie: string);
begin
  with QMAlbaranes do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * ');
        Add(' FROM  VER_CABECERAS_ALBARAN ');
        Add(' WHERE  ');
        Add(' EMPRESA = ?EMPRESA AND ');
        Add(' EJERCICIO = ?EJERCICIO AND ');
        Add(' CANAL = ?CANAL AND ');
        Add(' TIPO = ''ALB'' ');
        if (Serie <> '') then
           Add(' AND SERIE = :SERIE ');
        if (SoloPendientes) then
           Add(' AND MODIFICA_DOC = 0 ');
        if (Desde <> 0) then
           Add(' AND RIG >= ' + IntToStr(Desde));
        if (Hasta <> 0) then
           Add(' AND RIG <= ' + IntToStr(Hasta));
        Add(' ORDER BY SERIE, RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMImprimeAlbaranes.QMAlbaranesCalcFields(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST(1) EMAIL ');
        SQL.Add(' FROM L_DAME_EMAIL_TERCERO_TIPO(:TERCERO, :TIPO) ');
        Params.ByName['TERCERO'].AsInteger := QMAlbaranesTERCERO.AsInteger;
        Params.ByName['TIPO'].AsString := 'ALB';
        ExecQuery;
        QMAlbaranesEMAIL.AsString := FieldByName['EMAIL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImprimeAlbaranes.HojaDeRuta(Sender: TForm; Plantilla: string);
var
  IdDoc : integer;

  HCalc : THojaCalc;
  f : integer;
  Archivo, s : string;
  CodigoPostal : string;
  Localidad : string;
  Notas : string;
  Horario : string;
begin
  DMMain.LogIni('HojaDeRuta');
  try
     IdDoc := QMAlbaranesID_S.AsInteger;
     f := 5;
     DMMain.Log(format('IdDoc: %d', [IdDoc]));

     HCalc := THojaCalc.Create(Plantilla, False);
     try
        DMMain.Log(format('Plantilla abierta: %s', [Plantilla]));

        DMMain.Log(format('ActivateSheetIndex: %d', [1]));
        HCalc.ActivateSheetByIndex(1);

        QMAlbaranes.DisableControls;
        try
           QMAlbaranes.Open;
           QMAlbaranes.First;
           DMMain.Log('Inicio bucle');
           repeat
              if TFMImprimeAlbaranes(Sender).Seleccionado then
              begin
                 DMMain.Log(format('Albaran: %s/%d', [QMAlbaranesSERIE.AsString, QMAlbaranesRIG.AsInteger]));

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT L.CODIGO_POSTAL, L.TITULO, CAST(SUBSTRING(D.NOTAS FROM 1 FOR 60) AS VARCHAR(60)) NOTAS, D.HORARIO ');
                       SQL.Add(' FROM SYS_TERCEROS_DIRECCIONES D ');
                       SQL.Add(' JOIN SYS_LOCALIDADES L ON D.DIR_LOCALIDAD = L.LOCALIDAD ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' D.TERCERO = :TERCERO AND ');
                       SQL.Add(' D.DIRECCION = :DIRECCION ');
                       Params.ByName['TERCERO'].AsInteger := QMAlbaranesTERCERO.AsInteger;
                       Params.ByName['DIRECCION'].AsInteger := QMAlbaranesDIRECCION.AsInteger;
                       ExecQuery;
                       CodigoPostal := FieldByName['CODIGO_POSTAL'].AsString;
                       Localidad := FieldByName['TITULO'].AsString;
                       Notas := FieldByName['NOTAS'].AsString;
                       Horario := FieldByName['HORARIO'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 {
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT SU_REFERENCIA ');
                       SQL.Add(' FROM EMP_CLIENTES ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' CLIENTE = :CLIENTE ');
                       Params.ByName['EMPRESA'].AsInteger := QMAlbaranesEMPRESA.AsInteger;
                       Params.ByName['CLIENTE'].AsInteger := QMAlbaranesCLIENTE.AsInteger;
                       ExecQuery;
                       SuReferenciaCliente := FieldByName['SU_REFERENCIA'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 }

                 s := format('%s/%d', [QMAlbaranesSERIE.AsString, QMAlbaranesRIG.AsInteger]);
                 DMMain.Log(format('CellText[%d, 2] = %s', [f, s]));
                 HCalc.CellText[f, 2] := s;

                 s := format('%s', [Localidad]);
                 DMMain.Log(format('CellText[%d, 3] = %s', [f, s]));
                 if (s > '') then
                    HCalc.CellText[f, 3] := s;

                 s := format('''%s', [CodigoPostal]);
                 DMMain.Log(format('CellText[%d, 4] = %s', [f, s]));
                 if (s > '') then
                    HCalc.CellText[f, 4] := s;

                 s := QMAlbaranesSU_REFERENCIA.AsString;
                 DMMain.Log(format('CellText[%d, 5] = %s', [f, s]));
                 if (s > '') then
                    HCalc.CellText[f, 5] := s;

                 // s := format('%s', [Notas]);
                 s := format('%s', [Horario]);
                 DMMain.Log(format('CellText[%d, 6] = %s', [f, s]));
                 if (s > '') then
                    HCalc.CellText[f, 6] := s;

                 // HCalc.CellText[f, 7] := 'Hora';

                 s := format('%.2f', [QMAlbaranesLIQUIDO.AsFloat]);
                 DMMain.Log(format('CellText[%d, 8] = %s', [f, s]));
                 if (QMAlbaranesFORMA_PAGO.AsString = 'CON') then
                    HCalc.SendNumber(f, 8, QMAlbaranesLIQUIDO.AsFloat);
                 // HCalc.CellText[f, 8] := s;

                 s := format('%s', [QMAlbaranesTITULO.AsString]);
                 DMMain.Log(format('CellText[%d, 9] = %s', [f, s]));
                 HCalc.CellText[f, 9] := s;

                 Inc(f);
              end;
              QMAlbaranes.Next;
           until QMAlbaranes.EOF;

           Archivo := format('%s\HojaDeRuta_%s%s', [GetSpecialFolderPath(CSIDL_PERSONAL, True), FormatDateTime('yyyymmdd_hhnn', Now), ExtractFileExt(Plantilla)]);
           DMMain.Log(format('SaveDocAs: %s', [Archivo]));
           HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));

           DMMain.Log('Reposicionando');
           Posicionar(QMAlbaranes, 'ID_S', IdDoc);
        finally
           QMAlbaranes.EnableControls;
        end;
     finally
        HCalc.Free;
     end;
  finally
     DMMain.LogFin('HojaDeRuta');
  end;
end;

procedure TDMImprimeAlbaranes.HojaDeCarga(Sender: TForm; Plantilla: string);
var
  IdDoc : integer;
  Filtro : string;
  Documentos : string;
  Separador : string;

  HCalc : THojaCalc;
  f : integer;
  Archivo : string;
begin
  IdDoc := QMAlbaranesID_S.AsInteger;

  QMAlbaranes.DisableControls;
  try
     QMAlbaranes.Open;
     QMAlbaranes.First;
     Filtro := '';
     Documentos := '';
     Separador := '';
     repeat
        if TFMImprimeAlbaranes(Sender).Seleccionado then
        begin
           Filtro := Filtro + Separador + QMAlbaranesID_S.AsString;
           Documentos := Documentos + Separador + QMAlbaranesSERIE.AsString + '/' + QMAlbaranesRIG.AsString;
           Separador := ', ';
        end;
        QMAlbaranes.Next;
     until QMAlbaranes.EOF;

     // Evito error de SQL si no hay nada seleccionado.
     if (Trim(Filtro) = '') then
        Filtro := '0';

     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT D.ARTICULO, A.ALFA_1, D.TITULO AS TITULO, SUM(D.UNIDADES) ');
              SelectSQL.Add(' FROM GES_DETALLES_S D ');
              SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' D.ID_S IN (' + Filtro + ') ');
              SelectSQL.Add(' GROUP BY D.ARTICULO, A.ALFA_1, D.TITULO ');
              Open;

              f := 4;
              HCalc := THojaCalc.Create(Plantilla, True);
              try
                 DMMain.Log(format('Plantilla abierta: %s', [Plantilla]));

                 DMMain.Log(format('ActivateSheetIndex: %d', [1]));
                 HCalc.ActivateSheetByIndex(1);

                 DMMain.Log(format('CellText[%d, 2] = %s', [f, Documentos]));
                 HCalc.CellText[f, 2] := Documentos;

                 f := 8;
                 while not EOF do
                 begin
                    DMMain.Log(format('CellText[%d, 2] = %s', [f, FieldByName('ARTICULO').AsString]));
                    HCalc.CellText[f, 2] := format('%s', [FieldByName('ARTICULO').AsString]);
                    // DMMain.Log(format('CellText[%d, 2] = %s', [f, FieldByName('ALFA_1').AsString]));
                    // HCalc.CellText[f, 2] := format('%s', [FieldByName('ALFA_1').AsString]);

                    DMMain.Log(format('CellText[%d, 3] = %s', [f, FieldByName('TITULO').AsString]));
                    HCalc.CellText[f, 3] := format('%s', [FieldByName('TITULO').AsString]);

                    DMMain.Log(format('CellText[%d, 4] = %.2f', [f, FieldByName('SUM').AsFloat]));
                    // HCalc.CellText[f, 4] := format('%.2f', [FieldByName('SUM').AsFloat]);
                    HCalc.SendNumber(f, 4, FieldByName('SUM').AsFloat);
                    Next;
                    Inc(f);
                 end;

                 Archivo := format('%s\HojaDeCarga_%s%s', [GetSpecialFolderPath(CSIDL_PERSONAL, True), FormatDateTime('yyyymmdd_hhnn', Now), ExtractFileExt(Plantilla)]);
                 DMMain.Log(format('SaveDocAs: %s', [Archivo]));
                 HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
              finally
                 HCalc.Free;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;

     Posicionar(QMAlbaranes, 'ID_S', IdDoc);
  finally
     QMAlbaranes.EnableControls;
  end;
end;

end.
