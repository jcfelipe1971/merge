unit UDMLstIntrastatCV;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FR_DSet, FR_DBSet,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstIntrastatCV = class(TDataModule)
     TLocal: THYTransaction;
     frIntrastatCV: TfrHYReport;
     DSIntrastatCV: TDataSource;
     frDBDSIntrastatCV: TfrDBDataSet;
     xIntrastatCV: TFIBDataSetRO;
     xPeriodo: TFIBDataSetRO;
     DSxPeriodo: TDataSource;
     xPeriodoTITULO: TFIBStringField;
     xPeriodoDESDE: TDateTimeField;
     xPeriodoHASTA: TDateTimeField;
     frxIntrastatCV: TfrxHYReport;
     TUpdate: THYTransaction;
     xDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     frDBDDetalle: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frIntrastatCVGetValue(const ParName: string; var ParValue: variant);
     procedure frIntrastatCVBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxIntrastatCVBeforePrint(Sender: TfrxReportComponent);
     procedure frxIntrastatCVGetValue(const VarName: string; var Value: variant);
     procedure xIntrastatCVAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
     LocalMascaraN: string;
  public
     { Public declarations }
     Tipo: byte;
     procedure CambiaPeriodo(Periodo: string);
     function DameMinSerie: string;
     procedure MostrarListado(Modo: byte; Serie, Periodo: string; FechaListado: TDateTime; Comentario: string);
  end;

var
  DMLstIntrastatCV : TDMLstIntrastatCV;

implementation

uses UEntorno, UDMListados, UDMMain, UFormGest, UUtiles;

{$R *.dfm}

procedure TDMLstIntrastatCV.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstIntrastatCV.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstIntrastatCV.CambiaPeriodo(Periodo: string);
begin
  with xPeriodo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PERIODO'].AsString := Periodo;
     Open;
  end;
end;

function TDMLstIntrastatCV.DameMinSerie: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(SERIE) FROM EMP_SERIES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstIntrastatCV.MostrarListado(Modo: byte; Serie, Periodo: string; FechaListado: TDateTime; Comentario: string);
var
  DesdeFecha, HastaFecha : TDateTime;
  Archivo : string;
begin
  Serie := Trim(Serie);
  DMListados.DatosInforme(FechaListado, Comentario);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);

  with xIntrastatCV do
  begin
     Close;
     if (Tipo = 0) then
        SelectSQL.Text :=
           'SELECT * FROM C_GENERA_INTRASTAT_COMPRAS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :PERIODO)'
     else
        SelectSQL.Text :=
           'SELECT * FROM C_GENERA_INTRASTAT_VENTAS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :PERIODO)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['PERIODO'].AsString := Periodo;
     Open;
  end;

  DameDesdeHastaPeriodo(Periodo, DesdeFecha, HastaFecha);

  with xDetalle do
  begin
     Close;
     SelectSQL.Clear;
     if (Tipo = 0) then
     begin
        SelectSQL.Add(' SELECT CAB.EMPRESA, CAB.EJERCICIO, CAB.CANAL, CAB.SERIE, CAB.TIPO, CAB.RIG, DET.LINEA, CAB.FECHA, FAC.PROVEEDOR CODCLI, ');
        SelectSQL.Add('        ART.ARTICULO, DET.UNIDADES, DET.P_COSTE PRECIO, DET.B_DTO_LINEA, CAB.MONEDA, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, ');
        SelectSQL.Add('        T.NIF, D.DIR_COMPLETA_N, 0 AS TRANSPORTISTA, PRO.CODIGO_INCOTERM, I.TITULO DESCRIPCION_INCOTERM, ');
        SelectSQL.Add('        PRO.INTRA_TRANS TIPO_TRANSPORTE, TRA.TITULO DESCRIPCION_TIPO_TRANSPORTE, ');
        SelectSQL.Add('        CASE ');
        SelectSQL.Add('          WHEN (((SELECT SUM(B_IMPONIBLE) ');
        SelectSQL.Add('                  FROM GES_DETALLES_E ');
        SelectSQL.Add('                  WHERE ');
        SelectSQL.Add('                  ID_E = CAB.ID_E) <> 0) AND (DET.B_IMPONIBLE <> 0)) THEN ');
        SelectSQL.Add('              (CAB.I_PORTES / (SELECT SUM(B_IMPONIBLE) ');
        SelectSQL.Add('                               FROM GES_DETALLES_E ');
        SelectSQL.Add('                               WHERE ');
        SelectSQL.Add('                               ID_E = CAB.ID_E) * DET.B_IMPONIBLE) ');
        SelectSQL.Add('          ELSE 0 ');
        SelectSQL.Add('        END I_PORTE_PROPORCIONAL ');
        SelectSQL.Add(' FROM GES_DETALLES_E DET ');
        SelectSQL.Add(' JOIN GES_CABECERAS_E_FAC FAC ON DET.ID_E = FAC.ID_E ');
        SelectSQL.Add(' JOIN GES_CABECERAS_E CAB ON FAC.ID_E = CAB.ID_E ');
        SelectSQL.Add(' JOIN EMP_PROVEEDORES PRO ON FAC.EMPRESA = PRO.EMPRESA AND FAC.PROVEEDOR = PRO.PROVEEDOR ');
        SelectSQL.Add(' JOIN SYS_TERCEROS T ON PRO.TERCERO = T.TERCERO ');
        SelectSQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AND 1 = D.DIR_DEFECTO ');
        SelectSQL.Add(' JOIN SYS_CODIGO_INCOTERM I ON PRO.CODIGO_INCOTERM = I.CODIGO ');
        SelectSQL.Add(' JOIN SYS_TIPOS_TRANSPORTE TRA ON PRO.INTRA_TRANS = TRA.TIPO ');
        SelectSQL.Add(' JOIN SYS_MODO_IVA M ON FAC.MODO_IVA = M.MODO ');
        SelectSQL.Add(' LEFT JOIN SYS_PAISES P ON P.PAIS_C2 = PRO.PAIS_C2 ');
        SelectSQL.Add(' LEFT JOIN ART_ARTICULOS ART ON DET.ID_A = ART.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' CAB.EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' CAB.EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' CAB.CANAL = :CANAL AND ');
        SelectSQL.Add(' ((CAB.SERIE = :SERIE) OR (CAST(:SERIE AS VARCHAR(10)) = '''')) AND ');
        SelectSQL.Add(' CAB.FECHA >= :DESDE AND ');
        SelectSQL.Add(' CAB.FECHA <= :HASTA AND ');
        SelectSQL.Add(' CAB.TIPO = ''FAP'' AND ');
        SelectSQL.Add(' ((CAB.ESTADO = 5) OR (CAB.ESTADO = 6)) AND ');
        SelectSQL.Add(' PRO.INTRA = 1 AND ');
        SelectSQL.Add(' P.PERTENECE_CEE = 1 AND ');
        SelectSQL.Add(' PRO.PAIS_C2 <> ''ES'' AND ');
        SelectSQL.Add(' PRO.PAIS_C2 = :COD_PAIS AND ');
        SelectSQL.Add(' ART.CODIGO_INTRA = :COD_INTRASTAT AND ');
        SelectSQL.Add(' M.TIPO_TRANSACCION = 1 ');
        SelectSQL.Add(' ORDER BY CAB.RIG, DET.LINEA ');
     end
     else
     begin
        SelectSQL.Add(' SELECT CAB.EMPRESA, CAB.EJERCICIO, CAB.CANAL, CAB.SERIE, CAB.TIPO, CAB.RIG, DET.LINEA, CAB.FECHA, CAB.CLIENTE CODCLI, ');
        SelectSQL.Add('        ART.ARTICULO, DET.UNIDADES, DET.PRECIO PRECIO, DET.B_DTO_LINEA, CAB.MONEDA, T.NOMBRE_R_SOCIAL, ');
        SelectSQL.Add('        T.NOMBRE_COMERCIAL, T.NIF, D.DIR_COMPLETA_N, CAB.TRANSPORTISTA, CLI.CODIGO_INCOTERM, ');
        SelectSQL.Add('        I.TITULO DESCRIPCION_INCOTERM, CLI.INTRA_TRANS TIPO_TRANSPORTE, TRA.TITULO DESCRIPCION_TIPO_TRANSPORTE, ');
        SelectSQL.Add('        CASE ');
        SelectSQL.Add('          WHEN (((SELECT SUM(B_IMPONIBLE) ');
        SelectSQL.Add('                  FROM GES_DETALLES_S ');
        SelectSQL.Add('                  WHERE ');
        SelectSQL.Add('                  ID_S = CAB.ID_S) <> 0) AND (DET.B_IMPONIBLE <> 0)) THEN ');
        SelectSQL.Add('              (CAB.I_PORTES / (SELECT SUM(B_IMPONIBLE) ');
        SelectSQL.Add('                               FROM GES_DETALLES_S ');
        SelectSQL.Add('                               WHERE ');
        SelectSQL.Add('                               ID_S = CAB.ID_S) * DET.B_IMPONIBLE) ');
        SelectSQL.Add('          ELSE 0 ');
        SelectSQL.Add('        END I_PORTE_PROPORCIONAL ');
        SelectSQL.Add(' FROM GES_DETALLES_S DET ');
        SelectSQL.Add(' LEFT JOIN GES_DETALLES_S_REDONDEOS R ON R.ID_DETALLES_S = DET.ID_DETALLES_S ');
        SelectSQL.Add(' JOIN GES_CABECERAS_S CAB ON DET.ID_S = CAB.ID_S ');
        SelectSQL.Add(' JOIN GES_CABECERAS_S_FAC FAC ON CAB.ID_S = FAC.ID_S ');
        SelectSQL.Add(' JOIN SYS_MODO_IVA M ON FAC.MODO_IVA = M.MODO ');
        SelectSQL.Add(' JOIN EMP_CLIENTES CLI ON CAB.EMPRESA = CLI.EMPRESA AND CAB.CLIENTE = CLI.CLIENTE ');
        SelectSQL.Add(' JOIN SYS_TERCEROS T ON T.TERCERO = CLI.TERCERO ');
        SelectSQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AND CAB.DIRECCION = D.DIRECCION ');
        SelectSQL.Add(' JOIN SYS_CODIGO_INCOTERM I ON CLI.CODIGO_INCOTERM = I.CODIGO ');
        SelectSQL.Add(' JOIN SYS_TIPOS_TRANSPORTE TRA ON CLI.INTRA_TRANS = TRA.TIPO ');
        SelectSQL.Add(' LEFT JOIN SYS_PAISES P ON P.PAIS_C2 = CLI.PAIS_C2 ');
        SelectSQL.Add(' LEFT JOIN ART_ARTICULOS ART ON DET.ID_A = ART.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' DET.EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' DET.CANAL = :CANAL AND ');
        SelectSQL.Add(' ((DET.SERIE = :SERIE) OR (CAST(:SERIE AS VARCHAR(10)) = '''')) AND ');
        SelectSQL.Add(' CAB.FECHA >= :DESDE AND ');
        SelectSQL.Add(' CAB.FECHA <= :HASTA AND ');
        SelectSQL.Add(' DET.TIPO = ''FAC'' AND ');
        SelectSQL.Add(' ((CAB.ESTADO = 5) OR (CAB.ESTADO = 6)) AND ');
        SelectSQL.Add(' CLI.INTRA = 1 AND ');
        SelectSQL.Add(' P.PERTENECE_CEE = 1 AND ');
        SelectSQL.Add(' CLI.PAIS_C2 <> ''ES'' AND ');
        SelectSQL.Add(' CLI.PAIS_C2 = :COD_PAIS AND ');
        SelectSQL.Add(' ART.CODIGO_INTRA = :COD_INTRASTAT AND ');
        SelectSQL.Add(' M.TIPO_TRANSACCION = 1 ');
        SelectSQL.Add(' ORDER BY CAB.RIG, DET.LINEA ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['DESDE'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA'].AsDateTime := HastaFecha;
     Open;
  end;

  if (Modo = 2) then
  begin
     if (Tipo = 0) then
        Archivo := Format(_('IntrastatCompras-%s_%s.xls'), [Periodo, FormatDateTime('yyyymmdd-hhnnss', Now)])
     else
        Archivo := Format(_('IntrastatVentas-%s_%s.xls'), [Periodo, FormatDateTime('yyyymmdd-hhnnss', Now)]);

     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstIntrastatCV') then
     begin
        ExportarExcel(Archivo, DSIntrastatCV);
     end;
  end
  else
  begin
     DMListados.Imprimir(204, 0, Modo, Serie, '', frIntrastatCV, frxIntrastatCV, nil);
  end;
end;

procedure TDMLstIntrastatCV.frIntrastatCVGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Moneda' then
     ParValue := REntorno.Moneda;

  if ParName = 'TituloListado' then
  begin
     if (Tipo = 0) then
        ParValue := _('Listado de Compras de Intrastat')
     else
        ParValue := _('Listado de Ventas de Intrastat');
  end;

  if ParName = 'Periodo' then
     ParValue := xPeriodoTITULO.AsString;
end;

procedure TDMLstIntrastatCV.frIntrastatCVBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMLstIntrastatCV.frxIntrastatCVBeforePrint(Sender: TfrxReportComponent);
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
        end;
end;

procedure TDMLstIntrastatCV.frxIntrastatCVGetValue(const VarName: string; var Value: variant);
begin
  frIntrastatCVGetValue(VarName, Value);
end;

procedure TDMLstIntrastatCV.xIntrastatCVAfterOpen(DataSet: TDataSet);
begin
  xDetalle.Open;
end;

end.
