unit UDMRPrevisionCobro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_Class, FR_DSet, FR_DBSet, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  frxClass, frxHYReport, ComCtrls;

type
  TDMRPrevisionCobro = class(TDataModule)
     DSAsientos: TDataSource;
     QMAsientos: TFIBDataSetRO;
     frDBPrevisionCobro: TfrDBDataSet;
     xVer_Clientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     frHYPrevisionCobro: TfrHYReport;
     TLocal: THYTransaction;
     DSxVer_agentes: TDataSource;
     xVer_agentes: TFIBDataSetRO;
     xTercerosDireccion: TFIBDataSetRO;
     DSxTercerosDireccion: TDataSource;
     xCuentaTerceros: TFIBDataSetRO;
     DSxCuentaTerceros: TDataSource;
     DSAsientos_age: TDataSource;
     QMAsientos_age: TFIBDataSetRO;
     frDSQMAsientos_age: TfrDBDataSet;
     frxHYPrevisionCobro: TfrxHYReport;
     TUpdate: THYTransaction;
     xTercerosDirPral: TFIBDataSetRO;
     DSxTercerosDirPral: TDataSource;
     xCarteraDetalle: TFIBDataSetRO;
     DSxCarteraDetalle: TDataSource;
     xDatosDTE: TFIBDataSetRO;
     DSxDatosDTE: TDataSource;
     procedure frHYPrevisionCobroGetValue(const ParName: string; var ParValue: variant);
     procedure DMRPrevisionCobroCreate(Sender: TObject);
     procedure frHYPrevisionCobroEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRPrevisionCobroDestroy(Sender: TObject);
     procedure frxHYPrevisionCobroBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYPrevisionCobroGetValue(const VarName: string; var Value: variant);
     procedure xVer_ClientesBeforeOpen(DataSet: TDataSet);
     procedure QMAsientosAfterScroll(DataSet: TDataSet);
     procedure QMAsientosAfterOpen(DataSet: TDataSet);
     procedure QMAsientosBeforeClose(DataSet: TDataSet);
     procedure QMAsientos_ageAfterOpen(DataSet: TDataSet);
     procedure QMAsientos_ageBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     FechaD, FechaH, FechaListado: TDateTime;
     Comentario, Moneda: string;
     Grupo: integer;
     MarcarCartaEnviada: boolean;
     NumeroCarta: integer;
     FiltraIncidencia: boolean;
     Incidencia: string;
  public
     { Public declarations }
     procedure CalculaInforme(parFechaD, parFechaH, DesdeDocFecha, HastaDocFecha, parFechaListado: TDateTime; parMoneda, parComentario: string; intGrupo, Cliente, Agente: integer; FiltraFP: boolean; FPago: string; FiltroCanal: smallint; SoloImpagadosKRI, SoloNoRemesadosKRI, ExcluirRemesables: boolean; SerieKri: string; FiltraEfecto: boolean; EfectoDesde, EfectoHasta: string; CartaReclamacion, AFiltraIncidencia: boolean; AIncidencia: string; AFiltraPais: boolean; APais: string; OrdenAgente: integer; AFiltraNIF: boolean; aNIF: string; CalcularPrevisionPedido, CalcularPrevisionAlbaran, SoloRecibidos, SoloNoRecibidos: boolean);
     procedure CalculaInformeCarta(parFechaD, parFechaH, parFechaListado: TDateTime; parMoneda, parComentario: string; Cliente: integer; IdCarteraDetalle: integer);
     procedure ExportarExcel(aGrupo, OrdenAgente: integer; PBExportacion: TProgressBar; Fichero: string = '');
     procedure MostrarListado(Modo: integer; intGrupo: integer; CartaReclamacion: boolean; Carta: integer; MarcarEnvio: boolean; OrdenAgente: integer; Archivo: string = '');
     procedure Rangos(var VencDesde, VencHasta, DocFecDesde, DocFecHasta: TDateTime; SoloEjercicio: boolean);
     procedure MarcaCartaEnviada(Carta: integer);
  end;

var
  DMRPrevisionCobro : TDMRPrevisionCobro;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, DateUtils, UUtiles, UParam, UHojaCalc, StrUtils, UDameDato;

{$R *.DFM}

procedure TDMRPrevisionCobro.DMRPrevisionCobroCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMRPrevisionCobro.DMRPrevisionCobroDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRPrevisionCobro.CalculaInforme(parFechaD, parFechaH, DesdeDocFecha, HastaDocFecha, parFechaListado: TDateTime; parMoneda, parComentario: string; intGrupo, Cliente, Agente: integer; FiltraFP: boolean; FPago: string; FiltroCanal: smallint; SoloImpagadosKRI, SoloNoRemesadosKRI, ExcluirRemesables: boolean; SerieKri: string; FiltraEfecto: boolean; EfectoDesde, EfectoHasta: string; CartaReclamacion, AFiltraIncidencia: boolean; AIncidencia: string; AFiltraPais: boolean; APais: string; OrdenAgente: integer; AFiltraNIF: boolean; aNIF: string; CalcularPrevisionPedido, CalcularPrevisionAlbaran, SoloRecibidos, SoloNoRecibidos: boolean);
var
  //FiltroTxt : string;
  Recibidos : integer;
  OrdenImporte : string;
begin
  // Asignar las variables globales del listado
  FechaD := HourIntoDate(parFechaD, '00:00:00');
  FechaH := HourIntoDate(parFechaH, '23:59:59');
  DesdeDocFecha := HourIntoDate(DesdeDocFecha, '00:00:00');
  HastaDocFecha := HourIntoDate(HastaDocFecha, '23:59:59');
  FechaListado := parFechaListado;
  Moneda := parMoneda;
  Comentario := parComentario;
  Grupo := intGrupo;
  if (CartaReclamacion) then
     Recibidos := 0 {solo los efectos no recibidos}
  else
     Recibidos := 1; {todos los efectos}

  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);

  FiltraIncidencia := AFiltraIncidencia;
  Incidencia := AIncidencia;

  if (intgrupo <> 4) then
  begin
     with QMAsientos do
     begin
        Close;
        xVer_Clientes.DataSource := DSAsientos;
        xCarteraDetalle.DataSource := DSAsientos;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM C_CREA_PREVISION_C_P (?EMPRESA, ?CANAL, ?DESDE, ?HASTA, ?SIGNO, ?MONEDA, ?FECHA, ?CLIPROACR, ?TIPOTER, ?IMPAGADOS, ?RECIBIDOS) ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' DOC_FECHA BETWEEN :DESDE_DOC_FECHA AND :HASTA_DOC_FECHA ');
        if (FiltraFP) then
           SelectSQL.Add(' AND FPAGO=''' + FPago + ''' ');
        if (FiltroCanal > 0) then
           SelectSQL.Add(' AND CAN=' + IntToStr(FiltroCanal));
        if (SoloNoRemesadosKRI) then
           SelectSQL.Add(' AND REMESA < 1 ');
        if (ExcluirRemesables) then
        begin
           // TUBOS PARIS - TESPREV002: En el listado de prevision de cobros tratar el tipo de efecto LET como no remesable.
           if (LeeParametro('TESPREV002') = 'S') then
              SelectSQL.Add(' AND ((REMESABLE <> ''S'') OR (EFECTO = ''LET''))')
           else
              SelectSQL.Add(' AND REMESABLE <> ''S'' ');
        end;
        if (Length(SerieKri) > 1) then
           SelectSQL.Add(' AND ' + SerieKri);
        if FiltraEfecto then
           SelectSQL.Add(' AND EFECTO >= ''' + EfectoDesde + ''' AND EFECTO <= ''' + EfectoHasta + '''');
        if ((AFiltraPais) and (intgrupo <> 4)) then
           SelectSQL.Add(' AND PAIS=''' + APais + ''' ');
        if AFiltraNIF then
           SelectSQL.Add(' AND NIF LIKE ''%' + aNIF + '%'' ');
        if not CalcularPrevisionPedido then
           SelectSQL.Add(' AND TIPO <> ''PEC'' ');
        if not CalcularPrevisionAlbaran then
           SelectSQL.Add(' AND TIPO <> ''ALB'' ');
        if SoloRecibidos then
           SelectSQL.Add(' AND RECIBIDO = 1 ');
        if SoloNORecibidos then
           SelectSQL.Add(' AND RECIBIDO = 0 ');

        SelectSQL.Add(' ORDER BY ');

        if (LeeParametro('CARPREV001') = 'S') then
        begin
           // Orden para que agrupe pedidos al principio, luego albaranes y luego el resto
           SelectSQL.Add(' CASE ');
           SelectSQL.Add('     WHEN TIPO = ''PEC'' THEN 1 ');
           SelectSQL.Add('     WHEN TIPO = ''ALB'' THEN 2 ');
           SelectSQL.Add('     ELSE 3 ');
           SelectSQL.Add(' END, ');
        end;

        OrdenImporte := '';
        if (LeeParametro('CARORDE001') = 'S') then
           OrdenImporte := 'IMPORTE, ';

        case intGrupo of
           0: // Por Vencimiento
              SelectSQL.Add(' VENCIMIENTO, ' + OrdenImporte + ' CODCLI, BANCO ');

           1: // Por Código Cliente
              SelectSQL.Add(' CODCLI, ' + OrdenImporte + ' VENCIMIENTO, BANCO ');

           2: // Para un Cliente
              SelectSQL.Add(' VENCIMIENTO, ' + OrdenImporte + ' BANCO ');

           3: // Por BANCO CPM
              SelectSQL.Add(' BANCO, ' + OrdenImporte + ' VENCIMIENTO, CODCLI ');
        end;

        Params.ByName['TIPOTER'].AsString := 'ALL';

        if (intGrupo = 2) then
           Params.ByName['TIPOTER'].AsString := 'FAC';

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        // Params.ByName['Ejercicio'].AsInteger  := REntorno.Ejercicio ;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['DESDE'].AsDateTime := FechaD;
        Params.ByName['HASTA'].AsDateTime := FechaH;
        Params.ByName['SIGNO'].AsString := 'C';
        Params.ByName['CLIPROACR'].AsInteger := Cliente;
        Params.ByName['MONEDA'].AsString := Moneda;
        Params.ByName['FECHA'].AsDateTime := FechaListado;
        Params.ByName['IMPAGADOS'].AsInteger := BoolToInt(SoloImpagadosKRI);
        Params.ByName['RECIBIDOS'].AsInteger := Recibidos;
        Params.ByName['DESDE_DOC_FECHA'].AsDateTime := DesdeDocFecha;
        Params.ByName['HASTA_DOC_FECHA'].AsDateTime := HastaDocFecha;
        Open;
     end;
  end;

  if (intgrupo = 4) then // Para un Agente, se utiliza QMAsientos_age
  begin
     with QMAsientos_age do
     begin
        xVer_Clientes.DataSource := DSAsientos_age;
        xCarteraDetalle.DataSource := DSAsientos_age;
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM C_CREA_PREVISION_C_P_AGE (?EMPRESA, ?CANAL, ?DESDE, ?HASTA, ?MONEDA, ?FECHA, ?AGENTE, ?IMPAGADOS, ?RECIBIDOS) ');

        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' DOC_FECHA BETWEEN :DESDE_DOC_FECHA AND :HASTA_DOC_FECHA ');
        if (FiltraFP) then
           SelectSQL.Add(' AND FPAGO=''' + FPago + ''' ');
        if (FiltroCanal > 0) then
           SelectSQL.Add(' AND CAN=' + IntToStr(FiltroCanal));
        if (SoloNoRemesadosKRI) then
           SelectSQL.Add(' AND REMESA < 1 ');
        if (ExcluirRemesables) then
           SelectSQL.Add(' AND REMESABLE <> ''S'' ');
        if (Length(SerieKri) > 1) then
           SelectSQL.Add(' AND ' + SerieKri);
        if FiltraEfecto then
           SelectSQL.Add(' AND EFECTO >= ''' + EfectoDesde + ''' AND EFECTO <= ''' + EfectoHasta + '''');
        if ((AFiltraPais) and (intgrupo <> 4)) then
           SelectSQL.Add(' AND PAIS=''' + APais + ''' ');
        if AFiltraNIF then
           SelectSQL.Add(' AND NIF LIKE ''%' + aNIF + '%'' ');
        if not CalcularPrevisionPedido then
           SelectSQL.Add(' AND TIPO <> ''PEC'' ');
        if not CalcularPrevisionAlbaran then
           SelectSQL.Add(' AND TIPO <> ''ALB'' ');
        if SoloRecibidos then
           SelectSQL.Add(' AND RECIBIDO = 1 ');
        if SoloNORecibidos then
           SelectSQL.Add(' AND RECIBIDO = 0 ');

        if (OrdenAgente = 1) then
           SelectSQL.Add(' ORDER BY CODCLI, VENCIMIENTO, BANCO')
        else
           SelectSQL.Add(' ORDER BY VENCIMIENTO, CODCLI, BANCO');
        Params.ByName['AGENTE'].AsInteger := agente;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['DESDE'].AsDateTime := FechaD;
        Params.ByName['HASTA'].AsDateTime := FechaH;
        Params.ByName['MONEDA'].AsString := Moneda;
        Params.ByName['FECHA'].AsDateTime := FechaListado;
        Params.ByName['IMPAGADOS'].AsInteger := BoolToInt(SoloImpagadosKRI);
        Params.ByName['RECIBIDOS'].AsInteger := Recibidos;
        Params.ByName['DESDE_DOC_FECHA'].AsDateTime := DesdeDocFecha;
        Params.ByName['HASTA_DOC_FECHA'].AsDateTime := HastaDocFecha;
        Open;
     end;
  end;
end;

procedure TDMRPrevisionCobro.MostrarListado(Modo: integer; intGrupo: integer; CartaReclamacion: boolean; Carta: integer; MarcarEnvio: boolean; OrdenAgente: integer; Archivo: string = '');
var
  auxMascaraN : string;
  Titulo : string;
  Grupo : integer;
begin
  auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(Moneda, 1);
  MarcarCartaEnviada := MarcarEnvio;
  NumeroCarta := 0;
  Titulo := _('Listado de Previsiones de Cobro');

  Grupo := 31;
  case intGrupo of
     0: Grupo := 31;
     1, 2: if CartaReclamacion then
        begin
           NumeroCarta := Carta + 1;
           Titulo := Trim(LeeParametro(format('TESCART00%d', [NumeroCarta])));
           if (Titulo = '') then
              Titulo := _('Carta de Reclamacion');

           {dji lrk kri - lo saque por fercam no se para quien se hizo
           if not SoloImpagado then
              Grupo := 509
           else}
           case Carta of
              0: Grupo := 5610;
              1: Grupo := 5611;
              2: Grupo := 5612;
              3: Grupo := 5613;
              4: Grupo := 5614;
           end;
        end
        else
           Grupo := 84;
     3: Grupo := 137;
     4:
     begin
        if (OrdenAgente = 1) then
           Grupo := 2008
        else
           Grupo := 508;
     end;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', Titulo, frHYPrevisionCobro, frxHYPrevisionCobro, nil, nil, Archivo);

  MascaraN := auxMascaraN;
end;

procedure TDMRPrevisionCobro.frHYPrevisionCobroGetValue(const ParName: string; var ParValue: variant);
var
  Q : THYFIBQuery;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'InicioVencimiento' then
     ParValue := DateToStr(FechaD);

  if ParName = 'FinalVencimiento' then
     ParValue := DateToStr(FechaH);

  if ParName = 'FechaListado' then
     ParValue := FechaListado;

  if ParName = 'Comentario' then
     ParValue := Comentario;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'NombreCliente' then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO, TERCERO FROM VER_CLIENTES WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND CLIENTE = ?CLIENTE';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           if (Grupo = 4) then
           begin
              Params.ByName['EJERCICIO'].AsInteger := QMAsientos_Age.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMAsientos_Age.FieldByName('CAN').AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMAsientos_Age.FieldByName('CODCLI').AsInteger;
           end
           else
           begin
              Params.ByName['EJERCICIO'].AsInteger := QMAsientos.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMAsientos.FieldByName('CAN').AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMAsientos.FieldByName('CODCLI').AsInteger;
           end;
           ExecQuery;
           ParValue := FieldByName['TITULO'].AsString;
        end;

        // Saco la dirección del cliente. Preferencia direccion: de tipo 3 (dir. para recibos); de tipo 1 y dir_defecto=1; primera direccion de tipo 1 que encuentre.
        with xTercerosDireccion do
        begin
           Close;
           Params.ByName['TERCERO'].AsInteger := Q.FieldByName['TERCERO'].AsInteger;
           Open;
        end;

        // sfg.albert / sfg.xavi Es treu l'adreça principal del client
        with xTercerosDirPral do
        begin
           Close;
           Params.ByName['TERCERO'].AsInteger := Q.FieldByName['TERCERO'].AsInteger;
           Open;
        end;

        Q.FreeHandle;
     finally
        FreeAndNil(Q);
     end;
  end;

  if ParName = 'NombreAgente' then
  begin
     ParValue := DameTituloAgente(QMAsientos_Age.FieldByName('CODAGE').AsInteger);
  end;

  if ParName = 'AgenteDoc' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT AGENTE FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := QMAsientos.FieldByName('ID_DOC').AsInteger;
           ExecQuery;
           ParValue := FieldByName['AGENTE'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'AgenteDoc' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT T.NOMBRE_R_SOCIAL ');
           SQL.Add(' FROM GES_CABECERAS_S C ');
           SQL.Add(' JOIN EMP_AGENTES A ON C.EMPRESA = A.EMPRESA AND C.AGENTE = A.AGENTE ');
           SQL.Add(' JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.ID_S = :ID_S ');
           Params.ByName['ID_S'].AsInteger := QMAsientos.FieldByName('ID_DOC').AsInteger;
           ExecQuery;
           ParValue := FieldByName['NOMBRE_R_SOCIAL'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TituloCarta' then
  begin
     if Comentario = '' then
        ParValue := _('RECLAMACIÓN COBRO')
     else
        ParValue := Comentario;
  end;

  if ParName = 'Lugar' then
     ParValue := Copy(REntorno.PobEmpresa, 7, Length(REntorno.PobEmpresa) - 6);

  if ((ParName = 'SaldoProv') or (ParName = 'SaldoProvSinSerie')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add(' SELECT SUM(SALDO) AS SALDO, SUM(SALDO_DEUDOR) AS SALDO_DEUDOR, SUM(SALDO_ACREEDOR) AS SALDO_ACREEDOR ');
           SQL.Add(' FROM KRI_SALDO_AGRUPADO_CLI_PRO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?CODCLIPRO) ');
           SQL.Add(' WHERE CUENTA STARTING WITH ''40'' OR CUENTA STARTING WITH ''41'' ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           if (ParName = 'SaldoProvSinSerie') then
              Params.ByName['SERIE'].AsString := ' '
           else
           begin
              if (Grupo = 4) then
                 Params.ByName['SERIE'].AsInteger := QMAsientos_age.FieldByName('SERIE').AsInteger
              else
                 Params.ByName['SERIE'].AsString := QMAsientos.FieldByName('SERIE').AsString;
           end;
           if (Grupo = 4) then
           begin
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := QMAsientos_Age.FieldByName('CAN').AsInteger;
              Params.ByName['CODCLIPRO'].AsInteger := QMAsientos_Age.FieldByName('CODCLI').AsInteger;
           end
           else
           begin
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := QMAsientos.FieldByName('CAN').AsInteger;
              Params.ByName['CODCLIPRO'].AsInteger := QMAsientos.FieldByName('CODCLI').AsInteger;
           end;
           Params.ByName['TIPO'].AsString := 'C';
           ExecQuery;
           ParValue := FieldByName['SALDO'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ((ParName = 'SaldoCli') or (ParName = 'SaldoCliSinSerie')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add(' SELECT SUM(SALDO) AS SALDO, SUM(SALDO_DEUDOR) AS SALDO_DEUDOR, SUM(SALDO_ACREEDOR) AS SALDO_ACREEDOR ');
           SQL.Add(' FROM KRI_SALDO_AGRUPADO_CLI_PRO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?CODCLIPRO) ');
           SQL.Add(' WHERE CUENTA STARTING WITH ''43'' ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           if (ParName = 'SaldoProvSinSerie') then
              Params.ByName['SERIE'].AsString := ' '
           else
           begin
              if (Grupo = 4) then
                 Params.ByName['SERIE'].AsInteger := QMAsientos_Age.FieldByName('SERIE').AsInteger
              else
                 Params.ByName['SERIE'].AsString := QMAsientos.FieldByName('SERIE').AsString;
           end;
           if (Grupo = 4) then
           begin
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := QMAsientos_Age.FieldByName('CAN').AsInteger;
              Params.ByName['CODCLIPRO'].AsInteger := QMAsientos_Age.FieldByName('CODCLI').AsInteger;
           end
           else
           begin
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := QMAsientos.FieldByName('CAN').AsInteger;
              Params.ByName['CODCLIPRO'].AsInteger := QMAsientos.FieldByName('CODCLI').AsInteger;
           end;
           Params.ByName['TIPO'].AsString := 'C';
           ExecQuery;
           ParValue := FieldByName['SALDO'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (ParName = 'VisiblePorIncidencia') then
  begin
     if ((Incidencia > '') and (FiltraIncidencia)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT COUNT(*) FROM EMP_INCIDENCIAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' TIPO_TERCERO = ''CLI'' AND ');
              SQL.Add(' ((FECHA_RESPUESTA IS NULL) OR (FECHA_RESPUESTA < ''01/01/1900'')) AND ');
              SQL.Add(' COD_CLI_PRO = ?CODCLI AND ');
              SQL.Add(' TIPO_INCIDENCIA_KRI = ?TIPO_INC ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              if (Grupo = 4) then
                 Params.ByName['CODCLI'].AsInteger := QMAsientos_Age.FieldByName('CODCLI').AsInteger
              else
                 Params.ByName['CODCLI'].AsInteger := QMAsientos.FieldByName('CODCLI').AsInteger;
              Params.ByName['TIPO_INC'].AsString := Incidencia;
              ExecQuery;
              ParValue := (FieldByName['COUNT'].AsInteger > 0);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
        ParValue := True;
  end;

  if (ParName = 'RiesgoVencido') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('SELECT RIESGO_VEN FROM DAME_RIESGO_CLIENTE (?EMPRESA, ?EJERCICIO, ?CANAL, ?CLIENTE, ?FECHA)');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           if (Grupo = 4) then
           begin
              Params.ByName['EJERCICIO'].AsInteger := QMAsientos_Age.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMAsientos_Age.FieldByName('CAN').AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMAsientos_Age.FieldByName('CODCLI').AsInteger;
           end
           else
           begin
              Params.ByName['EJERCICIO'].AsInteger := QMAsientos.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMAsientos.FieldByName('CAN').AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMAsientos.FieldByName('CODCLI').AsInteger;
           end;
           Params.ByName['FECHA'].AsDateTime := Today;
           ExecQuery;
           ParValue := FieldByName['RIESGO_VEN'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRPrevisionCobro.frHYPrevisionCobroEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMRPrevisionCobro.Rangos(var VencDesde, VencHasta, DocFecDesde, DocFecHasta: TDateTime; SoloEjercicio: boolean);
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
           Params.ByName['SIGNO'].AsString := 'C';
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

procedure TDMRPrevisionCobro.frxHYPrevisionCobroBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMRPrevisionCobro.frxHYPrevisionCobroGetValue(const VarName: string; var Value: variant);
begin
  frHYPrevisionCobroGetValue(VarName, Value);
end;

procedure TDMRPrevisionCobro.xVer_ClientesBeforeOpen(DataSet: TDataSet);
begin
  xVer_Clientes.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  if (Grupo = 4) then
  begin
     xVer_Clientes.Params.ByName['EJERCICIO'].AsInteger := QMAsientos_Age.FieldByName('EJERCICIO').AsInteger;
     xVer_Clientes.Params.ByName['CAN'].AsInteger := QMAsientos_Age.FieldByName('CAN').AsInteger;
     xVer_Clientes.Params.ByName['COD_CLI'].AsInteger := QMAsientos_Age.FieldByName('CODCLI').AsInteger;
  end
  else
  begin
     xVer_Clientes.Params.ByName['EJERCICIO'].AsInteger := QMAsientos.FieldByName('EJERCICIO').AsInteger;
     xVer_Clientes.Params.ByName['CAN'].AsInteger := QMAsientos.FieldByName('CAN').AsInteger;
     xVer_Clientes.Params.ByName['COD_CLI'].AsInteger := QMAsientos.FieldByName('CODCLI').AsInteger;
  end;
end;

procedure TDMRPrevisionCobro.MarcaCartaEnviada(Carta: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE EMP_CARTERA_DETALLE SET CARTA' + IntToStr(NumeroCarta) + ' = 1 WHERE ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE';
        Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMAsientos.FieldByName('ID_CARTERA_DETALLE').AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRPrevisionCobro.QMAsientosAfterScroll(DataSet: TDataSet);
var
  DatosBancarios : char;
  BancoPagos, BancoFP : integer;
begin
  with xCuentaTerceros do
  begin
     Close;
     // Inicializamos para no mostrar ningun dato
     Params.ByName['TERCERO'].AsInteger := 0;
     Params.ByName['BANCO_CLI'].AsInteger := 0;
     Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['BANCO'].AsInteger := 0;

     // Datos bancarios a mostrar segun forma de pago.
     if (Grupo = 4) then
        with QMAsientos_Age do
           DatosBancarios := DMMain.DameDatosBancarios(REntorno.Empresa, FieldByName('EJERCICIO').AsInteger, FieldByName('CAN').AsInteger, FieldByName('FPAGO').AsString, BancoFP)
     else
        with QMAsientos do
           DatosBancarios := DMMain.DameDatosBancarios(REntorno.Empresa, FieldByName('EJERCICIO').AsInteger, FieldByName('CAN').AsInteger, FieldByName('FPAGO').AsString, BancoFP);
     BancoPagos := xVer_Clientes.FieldByName('BANCO_PAGOS').AsInteger;

     case DatosBancarios of
        '1': // Datos del cliente
        begin
           Params.ByName['TERCERO'].AsInteger := xVer_Clientes.FieldByName('TERCERO').AsInteger;
           // Si el parametro BANCO_CLI = 0, se muestra el primer banco activo según orden
           Params.ByName['BANCO_CLI'].AsInteger := BancoPagos;
        end;
        '2': // Datos de la empresa
        begin
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           if (BancoPagos = 0) then
              Params.ByName['TERCERO'].AsInteger := REntorno.Tercero
           else
              Params.ByName['BANCO'].AsInteger := BancoPagos;
        end;
     end;

     Open;
  end;

  if (MarcarCartaEnviada) then
     MarcaCartaEnviada(NumeroCarta);
end;

procedure TDMRPrevisionCobro.CalculaInformeCarta(parFechaD, parFechaH, parFechaListado: TDateTime; parMoneda, parComentario: string; Cliente: integer; IdCarteraDetalle: integer);
begin
  FechaD := HourIntoDate(parFechaD, '00:00:00');
  FechaH := HourIntoDate(parFechaH, '23:59:59');
  FechaListado := parFechaListado;
  Moneda := parMoneda;
  Comentario := parComentario;

  with QMAsientos do
  begin
     Close;
     xVer_Clientes.DataSource := DSAsientos;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * ');
     SelectSQL.Add(' FROM C_CREA_PREVISION_C_P(:EMPRESA, :CANAL, :DESDE, :HASTA, :SIGNO, :MONEDA, :FECHA, :CLIPROACR, :TIPOTER, :SOLO_IMPAGADO, :RECIBIDOS) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' CAN = :CANAL AND ');
     SelectSQL.Add(' ID_CARTERA_DETALLE = :ID_CARTERA_DETALLE ');

     Params.ByName['TIPOTER'].AsString := 'FAC';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := FechaD;
     Params.ByName['HASTA'].AsDateTime := FechaH;
     Params.ByName['SIGNO'].AsString := 'C';
     Params.ByName['CLIPROACR'].AsInteger := Cliente;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['FECHA'].AsDateTime := FechaListado;
     Params.ByName['SOLO_IMPAGADO'].AsInteger := BoolToInt(False);
     Params.ByName['RECIBIDOS'].AsInteger := BoolToInt(True);
     Params.ByName['ID_CARTERA_DETALLE'].AsInteger := IdCarteraDetalle;
     Open;
  end;
end;

procedure TDMRPrevisionCobro.ExportarExcel(aGrupo, OrdenAgente: integer; PBExportacion: TProgressBar; Fichero: string = '');
var
  auxMascaraN : string;
  HCalc : THojaCalc;
  c, f : integer;
  ColumnasAutoFit : TStrings;
  Exportar : boolean;
  DataSet : TFIBDataSetRO;

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

  Grupo := aGrupo;

  // Almacenar la máscara
  auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(Moneda, 1);
  if (Fichero = '') then
  begin
     Fichero := Format(_('PrevisionCobro-%s'), [FormatDateTime('yyyymmdd_hhnnss', Now)]);
     Exportar := MySaveDialog(Fichero, 'ODS,XLS,ALL', '', 'DMRPrevisionCobro');
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
           if (Grupo <> 4) then
              DataSet := QMAsientos
           else
              DataSet := QMAsientos_age;

           with DataSet do
           begin
              Last;
              PBExportacion.Max := RecordCount;
              First;

              // Titulos de columnas
              f := 1;
              c := 1;
              HCalc.CellText[f, c] := 'EJERCICIO';
              Inc(c);
              HCalc.CellText[f, c] := 'COD. CLI.';
              Inc(c);
              HCalc.CellText[f, c] := 'NOMBRE';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'SERIE';
              Inc(c);
              HCalc.CellText[f, c] := 'FACTURA';
              Inc(c);
              // HCalc.CellText[f, c] := 'NRO. FAC. PROV./ACR.';
              // ColumnasAutoFit.Add(IntToStr(c));
              // inc(c);
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
              HCalc.CellText[f, c] := 'CTA. CLIENTE';
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
              HCalc.CellText[f, c] := 'RECIBIDO';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'OBSERVACIONES';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'REMESABLE';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'AGENTE';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'NOMB. AGE.';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);
              HCalc.CellText[f, c] := 'NIF';
              ColumnasAutoFit.Add(IntToStr(c));
              Inc(c);

              if ((REntorno.Pais = 'CHL') and (Grupo <> 4)) then
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

                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('EJERCICIO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('CODCLI'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, xVer_Clientes.FieldByName('TITULO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('SERIE'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('FACTURA'));
                 Inc(c);
                 // EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('NUM_FACTURA'));
                 // Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('DOC_FECHA'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('IMPORTE'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('VENCIMIENTO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, xCuentaTerceros.FieldByName('IBAN'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('BANCO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('CUENTA'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('FPAGO'));
                 Inc(c);
                 HCalc.CellText[f, c] := DameTituloFormaPago(DataSet.FieldByName('FPAGO').AsString);
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('EFECTO'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, DataSet.FieldByName('DESC_EFECTO'));
                 Inc(c);
                 HCalc.CellText[f, c] := ifthen((DataSet.FieldByName('RECIBIDO').AsInteger = 1), 'X', '');
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMAsientos.FieldByName('OBSERVACIONES'));
                 Inc(c);
                 HCalc.CellText[f, c] := ifthen((DataSet.FieldByName('REMESABLE').AsString = 'S'), 'X', '');
                 Inc(c);

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT C.AGENTE, T.NOMBRE_R_SOCIAL ');
                       SQL.Add(' FROM GES_CABECERAS_S C ');
                       SQL.Add(' JOIN EMP_AGENTES A ON C.EMPRESA = A.EMPRESA AND C.AGENTE = A.AGENTE ');
                       SQL.Add(' JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' C.ID_S = :ID_S ');
                       Params.ByName['ID_S'].AsInteger := DataSet.FieldByName('ID_DOC').AsInteger;
                       ExecQuery;
                       HCalc.CellText[f, c] := FieldByName['AGENTE'].AsString;
                       Inc(c);
                       HCalc.CellText[f, c] := FieldByName['NOMBRE_R_SOCIAL'].AsString;
                       Inc(c);
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 HCalc.CellText[f, c] := DataSet.FieldByName('NIF').AsString;

                 Inc(c);
                 if ((REntorno.Pais = 'CHL') and (Grupo <> 4)) then
                 begin
                    HCalc.CellText[f, c] := xDatosDTE.FieldByName('TIPO_DOC_TRIBUTARIO').AsString;
                    Inc(c);
                    HCalc.CellText[f, c] := xDatosDTE.FieldByName('FOLIO').AsString;
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

procedure TDMRPrevisionCobro.QMAsientosAfterOpen(DataSet: TDataSet);
begin
  xVer_Clientes.Open;
  xCarteraDetalle.Open;
  xDatosDTE.Open;
end;

procedure TDMRPrevisionCobro.QMAsientosBeforeClose(DataSet: TDataSet);
begin
  xVer_Clientes.Close;
  xCarteraDetalle.Close;
  xDatosDTE.Close;
end;

procedure TDMRPrevisionCobro.QMAsientos_ageAfterOpen(DataSet: TDataSet);
begin
  xVer_Clientes.Open;
  xCarteraDetalle.Open;
end;

procedure TDMRPrevisionCobro.QMAsientos_ageBeforeClose(DataSet: TDataSet);
begin
  xVer_Clientes.Close;
  xCarteraDetalle.Close;
end;

end.
