unit UDMPunteoAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMPunteoAsientos = class(TDataModule)
     TLocal: THYTransaction;
     QMPunteos: TFIBTableSet;
     DSQMPunteos: TDataSource;
     QMPunteosEMPRESA: TIntegerField;
     QMPunteosEJERCICIO: TIntegerField;
     QMPunteosCANAL: TIntegerField;
     QMPunteosRIC: TIntegerField;
     QMPunteosLINEA: TIntegerField;
     QMPunteosCUENTA: TFIBStringField;
     QMPunteosSIGNO: TFIBStringField;
     QMPunteosTEXTO: TFIBStringField;
     QMPunteosIMPORTE: TFloatField;
     QMPunteosDOC_NUMERO: TIntegerField;
     QMPunteosDOC_SERIE: TFIBStringField;
     QMPunteosDOC_FECHA: TDateTimeField;
     QMPunteosFECHA: TDateTimeField;
     QMPunteosASIENTO: TIntegerField;
     QMPunteosPUNTEO: TIntegerField;
     QMNorma43: TFIBTableSet;
     DSQMNorma43: TDataSource;
     QMNorma43ID: TIntegerField;
     QMNorma43EMPRESA: TIntegerField;
     QMNorma43OFICINA: TFIBStringField;
     QMNorma43FECHA_OPERACION: TDateTimeField;
     QMNorma43FECHA_VALOR: TDateTimeField;
     QMNorma43CONCEPTO_COMUN: TIntegerField;
     QMNorma43CONCEPTO_PROPIO: TIntegerField;
     QMNorma43SIGNO: TFIBStringField;
     QMNorma43IMPORTE: TFloatField;
     QMNorma43DOC_NUMERO: TIntegerField;
     QMNorma43REFERENCIA1: TFIBStringField;
     QMNorma43REFERENCIA2: TFIBStringField;
     QMNorma43LINEA_IMPORTADA: TFIBStringField;
     QMNorma43TIT_CONC_COMUN: TStringField;
     QMNorma43TIT_CONC_PROPIO: TStringField;
     QMNorma43PUNTEO: TIntegerField;
     QMNorma43BANCO: TIntegerField;
     TUpdate: THYTransaction;
     QMPunteosFECHA_PUNTEO: TDateTimeField;
     QMPunteosCANT_RELACIONES: TIntegerField;
     QMPunteosRELACION: TFIBStringField;
     QMNorma43RELACION: TFIBStringField;
     QMPunteosIMPORTE_DEBE: TFloatField;
     QMPunteosIMPORTE_HABER: TFloatField;
     xSaldoPunteado: TFIBDataSetRO;
     DSxSaldoPunteado: TDataSource;
     xSaldoPunteadoSALDO: TFloatField;
     xSaldoN43: TFIBDataSetRO;
     xSaldoN43SALDO: TFloatField;
     DSxSaldoN43: TDataSource;
     QMNorma43CONCEPTO: TFIBStringField;
     procedure DMPunteoAsientosCreate(Sender: TObject);
     procedure QMPunteosNewRecord(DataSet: TDataSet);
     procedure DMPunteoAsientosDestroy(Sender: TObject);
     procedure QMPunteosAfterScroll(DataSet: TDataSet);
     procedure QMPunteosPUNTEOChange(Sender: TField);
     procedure QMNorma43PUNTEOChange(Sender: TField);
     procedure QMPunteosFECHA_PUNTEOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPunteosBeforePost(DataSet: TDataSet);
     procedure QMPunteosAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     Cuenta: string;
     FechaDesde, FechaHasta: TDateTime;
     Banco: integer;
     CalculaDetalle: boolean; {dji lrk kri - Norma 43}
     PUNTEOChange: boolean;
     ActualizarSaldos: boolean;
     SincronizaNorma: boolean;
  public
     SQLBase: TStrings;
     Entidad: string; {dji lrk kri - Norma 43}
     BancoKri: integer;
     function DameSaldo(Cuenta: string): string;
     procedure DameSaldoPunteado;
     procedure DameSaldoPunteadoN43;
     procedure AbrirNorma43(aBanco: integer);
     procedure CerrarNorma43; {dji lrk kri - Norma 43}
     procedure VincularN43; {dji lrk kri - Norma 43}
     procedure FiltraN43(Filtro: string = '');
     procedure FiltraPunteos(aCuenta: string; aFechaDesde, aFechaHasta: TDateTime);
     procedure Refresca;
     procedure PuntearImporte;
     procedure SincronizaNorma43(Sincroniza: boolean);
  end;

var
  DMPunteoAsientos : TDMPunteoAsientos;

implementation

uses UDMMain, UUtiles, UEntorno, URecursos, uFBusca; // , UFMPunteoAsientos

{$R *.DFM}

procedure TDMPunteoAsientos.DMPunteoAsientosCreate(Sender: TObject);
begin
  SQLBase := TStringList.Create;
  with SQLBase do
  begin
     Add(' SELECT * FROM VER_CUENTAS_PUNTEOS ');
     Add(' WHERE ');
     Add(' EMPRESA = :EMPRESA AND ');
     Add(' /*EJERCICIO = _EJERCICIO AND*/ ');
     Add(' CANAL = :CANAL AND ');
     Add(' CUENTA = :CUENTA AND ');
     Add(' CAST(EXTRACT(DAY FROM FECHA)||''.''|| EXTRACT(MONTH FROM FECHA)||''.''|| EXTRACT(YEAR FROM FECHA) AS DATE) BETWEEN :DFECHA AND :HFECHA ');
     Add(' ORDER BY FECHA, RIC, LINEA');
  end;

  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMPunteos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMNorma43, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xSaldoPunteado, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xSaldoN43, MascaraN, MascaraI, ShortDateFormat);

  QMNorma43FECHA_OPERACION.DisplayFormat := StringReplace(ShortDateFormat, 'yyyy', 'yy', [rfIgnoreCase]);
  QMNorma43FECHA_VALOR.DisplayFormat := StringReplace(ShortDateFormat, 'yyyy', 'yy', [rfIgnoreCase]);

  QMPunteos.SelectSQL.Assign(SQLBase);
  // DMMain.FiltraTabla(QMPunteos, '11100', False);

  // Norma 43
  Entidad := '2038';
  CalculaDetalle := True;
  PUNTEOChange := True;
  ActualizarSaldos := True;
end;

procedure TDMPunteoAsientos.QMPunteosNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPunteoAsientos.DMPunteoAsientosDestroy(Sender: TObject);
begin
  QMPunteos.Close;
  SQLBase.Free;
end;

function TDMPunteoAsientos.DameSaldo(Cuenta: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SALDO FROM CON_CUENTAS_SALDOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' CUENTA = ?CUENTA AND ');
        SQL.Add(' PERIODO = ''20'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        ExecQuery;
        Result := FormatFloat(MascaraN, FieldByName['SALDO'].AsFloat);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPunteoAsientos.DameSaldoPunteado;
begin
  with xSaldoPunteado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Open;
  end;
end;

procedure TDMPunteoAsientos.DameSaldoPunteadoN43;
begin
  with xSaldoN43 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['BANCO'].AsInteger := Banco;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Open;
  end;
end;

procedure TDMPunteoAsientos.QMPunteosAfterScroll(DataSet: TDataSet);
var
  Coincide : boolean;
  id : integer;
  Importe : double;
begin
  {dji lrk kri - Norma 43}
  {0   Si tiene relacion, me posiciono sobre esta}
  {1ro busco uno que coincida completamente y que no este punteado}
  {2do busco uno que coincida parcialmente y que no este punteado}
  {3ro busco uno que coincida parcialmente y este puntedo}
  with QMNorma43 do
  begin
     if (Active) and (SincronizaNorma) then
     begin
        Coincide := False;
        DisableControls;
        try
           CalculaDetalle := False;

           {Voy al primero, busco hasta que me paso.}
           First;

           if (QMPunteosCANT_RELACIONES.AsInteger > 0) then
           begin
              id := StrToIntDef(Copy(QMPunteosRELACION.AsString, 1, Pos('.', QMPunteosRELACION.AsString) - 1), -1);
              if (id > 0) then
              begin
                 while ((not EOF) and (QMNorma43ID.AsInteger <> id)) do
                    Next;
              end;
           end
           else
           begin
              // Optimizacion para evitar tener que obtenerlo del campo
              Importe := QMPunteosIMPORTE.AsFloat;
              while ((not EOF) and (Importe >= QMNorma43IMPORTE.AsFloat)) do
                 Next;

              {Busco mientras no encuentre una coincidencia completa}
              while ((not BOF) and (Importe <= QMNorma43IMPORTE.AsFloat) and not ((Importe = QMNorma43IMPORTE.AsFloat) and
                    (Trunc(QMPunteosFECHA.AsDateTime) = Trunc(QMNorma43FECHA_OPERACION.AsDateTime)) and
                    (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString) and
                    (0 = QMNorma43PUNTEO.AsInteger))) do
                 Prior;

              if ((Importe = QMNorma43IMPORTE.AsFloat) and
                 (Trunc(QMPunteosFECHA.AsDateTime) = Trunc(QMNorma43FECHA_OPERACION.AsDateTime)) and
                 (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString) and
                 (0 = QMNorma43PUNTEO.AsInteger)) then
                 Coincide := True;

              {Si no encuentro una conicidencia completa busco una coincidencia parcial}
              if (not Coincide) then
              begin
                 {Busco hasta que me paso.}
                 while ((not EOF) and (Importe >= QMNorma43IMPORTE.AsFloat)) do
                    Next;

                 {Busco mientras no encuentre una coincidencia completa}
                 while ((not BOF) and (Importe <= QMNorma43IMPORTE.AsFloat) and not ((Importe = QMNorma43IMPORTE.AsFloat) and
                       (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString) and
                       (0 = QMNorma43PUNTEO.AsInteger))) do
                    Prior;

                 if ((Importe = QMNorma43IMPORTE.AsFloat) and
                    (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString) and
                    (0 = QMNorma43PUNTEO.AsInteger)) then
                    Coincide := True;
              end;

              {Si no encuentro una conicidencia parcial busco una coincidencia por importe y signo}
              if (not Coincide) then
              begin
                 {Busco hasta que me paso.}
                 while ((not EOF) and (Importe >= QMNorma43IMPORTE.AsFloat)) do
                    Next;

                 {Busco mientras no encuentre una coincidencia completa}
                 while ((not BOF) and (Importe <= QMNorma43IMPORTE.AsFloat) and not ((Importe = QMNorma43IMPORTE.AsFloat) and
                       (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString))) do
                    Prior;

                 if ((Importe = QMNorma43IMPORTE.AsFloat) and
                    (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString)) then
                    Coincide := True;
              end;

              {Si no encuentro nada, voy al importe más cercano}
              if (not Coincide) then
              begin
                 {Busco hasta que me paso.}
                 while ((not EOF) and (Importe >= QMNorma43IMPORTE.AsFloat)) do
                    Next;

                 {Luego vuelvo uno para atras.}
                 if (Importe < QMNorma43IMPORTE.AsFloat) then
                    Prior;
              end;
           end;
        finally
           EnableControls;
           CalculaDetalle := True;
        end;
     end;
  end;
end;

procedure TDMPunteoAsientos.AbrirNorma43(aBanco: integer);
begin
  Banco := aBanco;

  with QMNorma43 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['BANCO'].AsInteger := Banco;
     Params.ByName['DFECHA'].AsDateTime := FechaDesde;
     Params.ByName['HFECHA'].AsDateTime := FechaHasta;
     Open;
  end;

  QMPunteosAfterScroll(QMPunteos);
end;

procedure TDMPunteoAsientos.CerrarNorma43;
begin
  QMNorma43.Close;
end;

procedure TDMPunteoAsientos.QMPunteosPUNTEOChange(Sender: TField);
var
  BMNorma43 : TBookmark;
  DS : TFIBDataSet;
begin
  // Norma 43
  if (QMPunteosPUNTEO.AsInteger = 0) and (PUNTEOChange) then
  begin
     if (QMNorma43.Active) then {Si está abierta quitamos las marcas sino, lo hacemos por SQL}
     begin
        CalculaDetalle := False;
        PUNTEOChange := False;

        BMNorma43 := QMNorma43.GetBookmark;
        try
           QMNorma43.DisableControls;
           DS := TFIBDataSet.Create(nil);
           try
              with DS do
              begin
                 Transaction := TFIBTransaction.Create(nil);
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    with Transaction do
                    begin
                       DefaultDatabase := DMMain.DataBase;
                       TRParams.Clear;
                       TRParams.Add('read_committed');
                       TRParams.Add('read');
                       if (not InTransaction) then
                          StartTransaction;
                    end;
                    SelectSQL.Text := 'SELECT ID FROM CON_NORMA_43_REL_KRI WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND RIC=?RIC AND LINEA=?LINEA';
                    Params.ByName['EMPRESA'].AsInteger := QMPunteosEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMPunteosEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMPunteosCANAL.AsInteger;
                    Params.ByName['RIC'].AsInteger := QMPunteosRIC.AsInteger;
                    Params.ByName['LINEA'].AsInteger := QMPunteosLINEA.AsInteger;
                    Open;
                    while (not EOF) do
                    begin
                       QMNorma43.First;
                       while (not QMNorma43.EOF) do
                       begin
                          if ((QMNorma43ID.AsInteger = FieldByName('ID').AsInteger) and (QMNorma43PUNTEO.AsInteger = 1)) then
                          begin
                             QMNorma43.Edit;
                             QMNorma43PUNTEO.AsInteger := 0;
                             QMNorma43.Post;
                          end;
                          QMNorma43.Next;
                       end;
                       Next;
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

           QMNorma43.GotoBookmark(BMNorma43);
        finally
           QMNorma43.EnableControls;
           QMNorma43.FreeBookmark(BMNorma43);
        end;
        CalculaDetalle := True;
        PUNTEOChange := True;
     end;
  end;

  ActualizarSaldos := True;
end;

procedure TDMPunteoAsientos.QMNorma43PUNTEOChange(Sender: TField);
var
  BMPunteo, BMNorma43 : TBookmark;
  DS : TFIBDataSet;
begin
  {dji lrk kri - Norma 43}
  if (QMNorma43PUNTEO.AsInteger = 0) and (PUNTEOChange) then
  begin
     CalculaDetalle := False;
     PUNTEOChange := False;
     BMNorma43 := QMNorma43.GetBookmark;
     BMPunteo := QMPunteos.GetBookmark;
     try
        QMNorma43.DisableControls;
        QMPunteos.DisableControls;

        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Text := 'SELECT EMPRESA,EJERCICIO,CANAL,RIC,LINEA FROM CON_NORMA_43_REL_KRI WHERE ID=?ID';
                 Params.ByName['ID'].AsInteger := QMNorma43ID.AsInteger;
                 Open;
                 while (not EOF) do
                 begin
                    QMPunteos.First;
                    while (not QMPunteos.EOF) do
                    begin
                       if ((QMPunteosEMPRESA.AsInteger = FieldByName('EMPRESA').AsInteger) and
                          (QMPunteosEJERCICIO.AsInteger = FieldByName('EJERCICIO').AsInteger) and
                          (QMPunteosCANAL.AsInteger = FieldByName('CANAL').AsInteger) and
                          (QMPunteosRIC.AsInteger = FieldByName('RIC').AsInteger) and
                          (QMPunteosLINEA.AsInteger = FieldByName('LINEA').AsInteger) and
                          (QMPunteosPUNTEO.AsInteger = 1)) then
                       begin
                          QMPunteos.Edit;
                          QMPunteosPUNTEO.AsInteger := 0;
                          QMPunteos.Post;
                       end;
                       QMPunteos.Next;
                    end;
                    Next;
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

        QMPunteos.GotoBookmark(BMPunteo);
        QMNorma43.GotoBookmark(BMNorma43);
     finally
        QMPunteos.EnableControls;
        QMNorma43.EnableControls;
        QMPunteos.FreeBookmark(BMPunteo);
        QMNorma43.FreeBookmark(BMNorma43);
     end;
     CalculaDetalle := True;
     PUNTEOChange := True;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM CON_NORMA_43_REL_KRI WHERE ID=?ID';
           Params.ByName['ID'].AsInteger := QMNorma43ID.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPunteoAsientos.VincularN43;
var
  Vincular : boolean;
begin
  {dji lrk kri - Norma 43}
  // Evito vincular dos veces el mismo asiento
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID FROM CON_NORMA_43_REL_KRI WHERE ID = :ID AND EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND RIC = :RIC AND LINEA = :LINEA';
        Params.ByName['ID'].AsInteger := QMNorma43ID.AsInteger;
        Params.ByName['EMPRESA'].AsInteger := QMPunteosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPunteosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPunteosCANAL.AsInteger;
        Params.ByName['RIC'].AsInteger := QMPunteosRIC.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMPunteosLINEA.AsInteger;
        ExecQuery;
        Vincular := (FieldByName['ID'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if Vincular and (QMPunteosIMPORTE.AsFloat <> QMNorma43IMPORTE.AsFloat) then
     Vincular := MessageDlg(_('Los IMPORTES no son iguales, Desea vincular de todos modos?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes;

  if Vincular and (QMPunteosSIGNO.AsString <> QMNorma43SIGNO.AsString) then
     Vincular := MessageDlg(_('Los SIGNOS no son iguales, Desea vincular de todos modos?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes;

  if (Vincular) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO CON_NORMA_43_REL_KRI (ID, EMPRESA, EJERCICIO, CANAL, RIC, LINEA) VALUES (:ID, :EMPRESA, :EJERCICIO, :CANAL, :RIC, :LINEA)';
           Params.ByName['ID'].AsInteger := QMNorma43ID.AsInteger;
           Params.ByName['EMPRESA'].AsInteger := QMPunteosEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMPunteosEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMPunteosCANAL.AsInteger;
           Params.ByName['RIC'].AsInteger := QMPunteosRIC.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMPunteosLINEA.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with QMNorma43 do
     begin
        if (QMNorma43PUNTEO.AsInteger = 0) then
        begin
           Edit;
           QMNorma43PUNTEO.AsInteger := 1;
           Post;
        end
        else
           Refresh;
     end;

     with QMPunteos do
     begin
        if (QMPunteosPUNTEO.AsInteger = 0) then
        begin
           Edit;
           QMPunteosPUNTEO.AsInteger := 1;
           Post;
        end
        else
           Refresh;
     end;

     DameSaldoPunteado;
     DameSaldoPunteadoN43;

     QMPunteos.Next;
  end;
end;

procedure TDMPunteoAsientos.FiltraN43(Filtro: string = '');
begin
  {dji lrk kri - Norma 43}
  with QMNorma43 do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT C.*, ');
     SelectSQL.Add('        (CAST(SUBSTRING((SELECT LIST(EJERCICIO || ''-'' || CANAL || ''-'' || RIC || ''-'' || LINEA) ');
     SelectSQL.Add('         FROM CON_NORMA_43_REL_KRI ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID = C.ID) FROM 1 FOR 256) AS VARCHAR(265))) AS RELACION, ');
     SelectSQL.Add('        (SELECT TITULO ');
     SelectSQL.Add('         FROM SYS_TIPO_NORMA43 ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ENTIDAD = ''0000'' AND ');
     SelectSQL.Add('         CONCEPTO_COMUN = C.CONCEPTO_COMUN AND ');
     SelectSQL.Add('         CONCEPTO_PROPIO = -1) TIT_CONC_COMUN, ');
     SelectSQL.Add('         COALESCE((SELECT TITULO ');
     SelectSQL.Add('                   FROM SYS_TIPO_NORMA43 ');
     SelectSQL.Add('                   WHERE ');
     SelectSQL.Add('                   ENTIDAD = B.ENTIDAD AND ');
     SelectSQL.Add('                   CONCEPTO_COMUN = C.CONCEPTO_COMUN AND ');
     SelectSQL.Add('                   CONCEPTO_PROPIO = C.CONCEPTO_PROPIO), ');
     SelectSQL.Add('                  (SELECT FIRST 1 TITULO ');
     SelectSQL.Add('                   FROM SYS_TIPO_NORMA43 ');
     SelectSQL.Add('                   WHERE ');
     SelectSQL.Add('                   ENTIDAD = B.ENTIDAD AND ');
     SelectSQL.Add('                   CONCEPTO_PROPIO = C.CONCEPTO_PROPIO), ');
     SelectSQL.Add('                   '''') TIT_CONC_PROPIO, ');
     SelectSQL.Add('        CAST((SELECT SUBSTRING(LIST(CONCEPTO, ASCII_CHAR(13) || ASCII_CHAR(10)) FROM 1 FOR 256) ');
     SelectSQL.Add('              FROM (SELECT COD_DATO || '': '' || CONCEPTO1 || '' '' || CONCEPTO2 AS CONCEPTO ');
     SelectSQL.Add('                    FROM CON_NORMA_43_DET_KRI ');
     SelectSQL.Add('                    WHERE ');
     SelectSQL.Add('                    ID_CAB = C.ID ');
     SelectSQL.Add('                    ORDER BY COD_DATO)) AS VARCHAR(256)) CONCEPTO ');
     SelectSQL.Add(' FROM CON_NORMA_43_CAB_KRI C ');
     SelectSQL.Add(' JOIN EMP_BANCOS B ON C.EMPRESA = B.EMPRESA AND C.BANCO = B.BANCO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' C.BANCO = :BANCO AND ');
     SelectSQL.Add(' CAST(EXTRACT(DAY FROM C.FECHA_OPERACION)||''.''|| EXTRACT(MONTH FROM C.FECHA_OPERACION)||''.''|| EXTRACT(YEAR FROM C.FECHA_OPERACION) AS DATE) BETWEEN :DFECHA AND :HFECHA ');
     if (Filtro > '') then
        SelectSQL.Add(' AND ' + Filtro + ' ');
     SelectSQL.Add(' ORDER BY C.IMPORTE, C.FECHA_OPERACION ');
  end;

  AbrirNorma43(Banco);
end;

procedure TDMPunteoAsientos.FiltraPunteos(aCuenta: string; aFechaDesde, aFechaHasta: TDateTime);
begin
  Cuenta := aCuenta;
  FechaDesde := aFechaDesde;
  FechaHasta := HourIntoDate(aFechaHasta, '23:59:59');

  with QMPunteos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Params.ByName['DFECHA'].AsDateTime := FechaDesde;
     Params.ByName['HFECHA'].AsDateTime := FechaHasta;
     Open;
  end;
end;

procedure TDMPunteoAsientos.QMPunteosFECHA_PUNTEOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMPunteosPUNTEO.AsInteger = 0) then
     Text := ''
  else
     Text := DateTimeToStr(QMPunteosFECHA_PUNTEO.AsDateTime);
end;

procedure TDMPunteoAsientos.QMPunteosBeforePost(DataSet: TDataSet);
begin
  if (QMPunteosPUNTEO.AsInteger = 1) then
     QMPunteosFECHA_PUNTEO.AsDateTime := Now;

  // Para despuntear debo poner "PUNTEO = -1" para evitar despunteos accidentales.
  if (QMPunteosPUNTEO.AsInteger = 0) then
     QMPunteosPUNTEO.AsInteger := -1;
end;

procedure TDMPunteoAsientos.QMPunteosAfterPost(DataSet: TDataSet);
begin
  if (ActualizarSaldos) then
  begin
     ActualizarSaldos := False;
     DameSaldoPunteadoN43;
  end;
end;

procedure TDMPunteoAsientos.Refresca;
var
  id : integer;
  ric, linea : integer;
begin
  QMPunteos.DisableControls;
  QMNorma43.DisableControls;
  try
     id := QMNorma43ID.AsInteger;
     ric := QMPunteosRIC.AsInteger;
     linea := QMPunteosLINEA.AsInteger;

     QMNorma43.Close;
     QMPunteos.Close;
     QMPunteos.Open;
     QMNorma43.Open;

     if ((ric <> QMPunteosRIC.AsInteger) or (linea <> QMPunteosLINEA.AsInteger)) then
        repeat
           QMPunteos.Next;
        until (((ric = QMPunteosRIC.AsInteger) and (linea = QMPunteosLINEA.AsInteger)) or (QMPunteos.EOF));

     while ((id <> QMNorma43ID.AsInteger) and (not QMNorma43.EOF)) do
        QMNorma43.Next;
  finally
     QMNorma43.EnableControls;
     QMPunteos.EnableControls;
  end;
end;

procedure TDMPunteoAsientos.PuntearImporte;
var
  BM : TBookmark;
  Signo : string;
  Importe : double;
  Punteado : boolean;
begin
  with QMPunteos do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           // Avanzo al primero no punteado
           while ((not EOF) and (QMPunteosPUNTEO.AsInteger = 1)) do
              Next;

           // Obtengo Signo e Importe del registro
           BM := GetBookmark;
           try
              Signo := QMPunteosSIGNO.AsString;
              Importe := QMPunteosIMPORTE.AsFloat;
              Punteado := False;

              // Busco otro registro con mismo importe y distinto signo.
              Next;
              while ((not EOF) and ((Signo = QMPunteosSIGNO.AsString) or (Importe <> QMPunteosIMPORTE.AsFloat) or (QMPunteosPUNTEO.AsInteger = 1))) do
                 Next;

              // Si encuentro un registro con mismo importe y distinto signo, lo marco.
              if ((Signo <> QMPunteosSIGNO.AsString) and (Importe = QMPunteosIMPORTE.AsFloat) and (QMPunteosPUNTEO.AsInteger = 0)) then
              begin
                 Edit;
                 QMPunteosPUNTEO.AsInteger := 1;
                 Post;
                 Punteado := True;
              end;

              GotoBookmark(BM);
           finally
              FreeBookmark(BM);
           end;

           // Si encontre un registro marco este tambien.
           if Punteado then
           begin
              Edit;
              QMPunteosPUNTEO.AsInteger := 1;
              Post;
           end;

           // Salto al siguiente registro a puntear.
           Next;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMPunteoAsientos.SincronizaNorma43(Sincroniza: boolean);
begin
  SincronizaNorma := Sincroniza;
end;

end.
