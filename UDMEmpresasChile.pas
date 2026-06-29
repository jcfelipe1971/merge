unit UDMEmpresasChile;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase, FIBQuery,
  UFIBModificados, Controls, DateUtils, HYFIBQuery, Dialogs, UFMEmpresasChile;

type
  TDMEmpresasChile = class(TDataModule)
     TLocal: THYTransaction;
     QMEmpresasChile: TFIBTableSet;
     DSQMEmpresasChile: TDataSource;
     TUpdate: THYTransaction;
     QMEmpresasChileID_SYS_EMPRESAS_CHILE: TIntegerField;
     QMEmpresasChileRUT: TFIBStringField;
     QMEmpresasChileNOMBRE_R_SOCIAL: TFIBStringField;
     QMEmpresasChileNUMERO: TIntegerField;
     QMEmpresasChileFECHA_RESOLUCION: TDateTimeField;
     QMEmpresasChileEMAIL: TFIBStringField;
     QMEmpresasChileURL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMEmpresasChileNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     CancelarImportacion: boolean;
     procedure BusquedaCompleja;
     procedure ImportarCSV(Archivo: string);
     procedure Filtra(Filtro: string);
     procedure FiltraRUT(Filtro: string);
  end;

var
  DMEmpresasChile : TDMEmpresasChile;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles;

{$R *.dfm}

procedure TDMEmpresasChile.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  QMEmpresasChileNUMERO.DisplayFormat := MascaraI;
  QMEmpresasChileFECHA_RESOLUCION.DisplayFormat := ShortDateFormat;

  SQLBase := TStringList.Create;

  SQLBase.Add(' SELECT * FROM SYS_EMPRESAS_CHILE ');

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMEmpresasChile.SelectSQL.Text := SQLBase.Text;
  QMEmpresasChile.SelectSQL.Add(' ORDER BY NOMBRE_R_SOCIAL ');
  QMEmpresasChile.Open;
end;

procedure TDMEmpresasChile.BusquedaCompleja;
var
  Resultado : integer;
begin
  // Filtro
  Resultado := TFBusca.Create(Self).SeleccionaBusqueda(QMEmpresasChile, '00000', False);

  with QMEmpresasChile do
  begin
     if (Resultado = mrAll) then
     begin
        Close;
        SelectSQL.Text := SQLBase.Text;
        SelectSQL.Add(' ORDER BY NOMBRE_R_SOCIAL ');
        DMMain.FiltraTabla(QMEmpresasChile, '000000', True);
     end
     else
     begin
        Open;
     end;
  end;
end;

procedure TDMEmpresasChile.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMEmpresasChile.QMEmpresasChileNewRecord(DataSet: TDataSet);
begin
  QMEmpresasChileID_SYS_EMPRESAS_CHILE.AsInteger := 0;
end;

procedure TDMEmpresasChile.ImportarCSV(Archivo: string);
var
  ts : TStrings;
  i, c, Campo, PosicionInicio, PosicionSeparador : integer;
  s : string;
  Separador, Cadena : string;
  Q : TFIBQuery;

  function StrDD_MM_YYYY_HH_NN_SSToDateTime(s: string): TDateTime;
  var
     FechaValida : boolean;
     aux : string;
  begin
     /// 04-10-2022 15:33:15
     /// Se ignoran separadores en la parte fecha
     /// La hora puede tener 1 o dos dígitos

     FechaValida := TryEncodeDate(StrToIntDef(Copy(s, 7, 4), 0), StrToIntDef(Copy(s, 4, 2), 0),
        StrToIntDef(Copy(s, 1, 2), 0), Result);

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
  /// Crea o modifica un registro para cada RUT

  CancelarImportacion := False;
  Q := TFIBQuery.Create(nil);
  ts := TStringList.Create;
  with ts do
  begin
     try
        LoadFromFile(Archivo);
        c := Count;
        FMEmpresasChile.InicializaProgreso(c);

        // SQL para insertar datos
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           // AutoTrans := False;
           Transaction.Free;
           Transaction := DameTransactionRW(DMMain.DataBase, Q);
           SQL.Add(' UPDATE OR INSERT INTO SYS_EMPRESAS_CHILE ( ');
           SQL.Add(' RUT, NOMBRE_R_SOCIAL, NUMERO, FECHA_RESOLUCION, EMAIL, URL, ENTRADA )');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :RUT, :NOMBRE_R_SOCIAL, :NUMERO, :FECHA_RESOLUCION, :EMAIL, :URL, ' + REntorno.EntradaStr + ' )');
           SQL.Add(' MATCHING (RUT) ');
           Transaction.StartTransaction;
           Prepare;
        end;

        Separador := ';';
        i := 1; // Porque la linea 0 son los nombre de los campos
        DMMain.LogIni(format('Importacion EmpresasChile.CSV - %d', [i]));
        while ((i < c) and (not CancelarImportacion)) do
        begin
           // Limito la actualización para evitar demasiados refrescos que pierden tiempo.
           if (i mod 99 = 0) then
              FMEmpresasChile.Progreso(i, c);

           s := ts[i];

           // Formato:
           // RUT;RAZON SOCIAL;NUMERO RESOLUCION;FECHA RESOLUCION;MAIL INTERCAMBIO;URL
           // 79944690-1;WILMAN SERVICIOS EMPRESARIALES LIMITADA;148;14-11-2008 ;dte_wilman@wilman.cl;web@web.com;

           with Q do
           begin
              // Hago un commit por cada 10000 lineas importadas
              if (i mod 10000 = 0) then
              begin
                 Transaction.Commit;
                 Transaction.Free;
                 Transaction := DameTransactionRW(DMMain.DataBase, Q);
                 Transaction.StartTransaction;
                 Prepare;
                 DMMain.LogFin('');
                 DMMain.LogIni(format('Importacion EmpresasChile.CSV - %d', [i]));
              end;

              Campo := 0;
              PosicionInicio := 1;
              while (s > '') do
              begin
                 PosicionSeparador := Pos(Separador, s);
                 if PosicionSeparador = 0 then
                    PosicionSeparador := Length(s);
                 Cadena := Trim(Copy(s, PosicionInicio, PosicionSeparador - 1));
                 case Campo of
                    0:
                       Params.ByName['RUT'].AsString := Copy(Cadena, 1, 20);
                    1:
                       Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(Cadena, 1, 60);
                    2:
                       Params.ByName['NUMERO'].AsInteger := StrToIntDef(Cadena, 0);
                    3:
                       Params.ByName['FECHA_RESOLUCION'].AsDateTime := StrDD_MM_YYYY_HH_NN_SSToDateTime(Cadena);
                    4:
                       Params.ByName['EMAIL'].AsString := Copy(Cadena, 1, 100);
                    5:
                       Params.ByName['URL'].AsString := Copy(Cadena, 1, 500);
                 end;

                 System.Delete(s, 1, PosicionSeparador);
                 Inc(Campo);
              end;

              // Inicializo campos no cargados
              if (Campo < 1) then
                 Params.ByName['RUT'].AsString := '';
              if (Campo < 2) then
                 Params.ByName['NOMBRE_R_SOCIAL'].AsString := '';
              if (Campo < 3) then
                 Params.ByName['NUMERO'].AsInteger := 0;
              if (Campo < 4) then
                 Params.ByName['FECHA_RESOLUCION'].AsDateTime := Now;
              if (Campo < 5) then
                 Params.ByName['EMAIL'].AsString := '';
              if (Campo < 6) then
                 Params.ByName['URL'].AsString := '';

              ExecQuery;
           end;

           Inc(i);
        end;
        DMMain.LogFin('Final de Importacion EmpresasChile.CSV');

        // Hago commit de lo que hubiera pendiente y libero la transaccion
        if Q.Transaction.InTransaction then
           Q.Transaction.Commit;
     finally
        ts.Free;
        Q.Transaction.Free;
        Q.Free;
     end;
  end;

  // Solo si se importaron todos los registros
  if ((i = c) and (not CancelarImportacion)) then
  begin
     // Borro el contenido de la tabla que no se haya actualizado
     DMMain.LogIni('Importacion EmpresasChile.CSV - Borrando registros no actualizados');
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := ' DELETE FROM SYS_EMPRESAS_CHILE WHERE ENTRADA <> ' + REntorno.EntradaStr;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     DMMain.LogFin('');
  end;

  QMEmpresasChile.Close;
  QMEmpresasChile.Open;

  MessageDlg(Format(_('Proceso finalizado.' + #13#10 + 'Se han importado %d lineas.'), [i]), mtInformation, [mbOK], 0);
end;


procedure TDMEmpresasChile.Filtra(Filtro: string);
var
  Orden : string;
begin
  Filtro := UpperCase(Trim(Filtro));
  with QMEmpresasChile do
  begin
     Close;

     Orden := OrdenadoPor;

     SelectSQL.Text := SQLBase.Text;
     if (Filtro > '') then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' RUT LIKE ''%' + Copy(Filtro, 1, 20) + '%'' ');
        SelectSQL.Add(' OR NOMBRE_R_SOCIAL LIKE ''%' + Copy(Filtro, 1, 60) + '%'' ');
        SelectSQL.Add(' OR EMAIL LIKE ''%' + Copy(Filtro, 1, 100) + '%'' ');
        SelectSQL.Add(' OR URL LIKE ''%' + Copy(Filtro, 1, 100) + '%'' ');
        if (StrToIntDef(Filtro, -1) >= 0) then
           SelectSQL.Add(' OR NUMERO LIKE ''%' + Filtro + '%'' ');
     end;

     if (Trim(Orden) > '') then
        SelectSQL.Add(' ORDER BY ' + Orden);

     Open;
  end;
end;

procedure TDMEmpresasChile.FiltraRUT(Filtro: string);
var
  Orden : string;
begin
  Filtro := UpperCase(Trim(Filtro));
  with QMEmpresasChile do
  begin
     Close;

     Orden := OrdenadoPor;

     SelectSQL.Text := SQLBase.Text;
     if (Filtro > '') then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' RUT STARTING WITH ''' + Copy(Filtro, 1, 20) + ''' ');
     end;

     if (Trim(Orden) > '') then
        SelectSQL.Add(' ORDER BY ' + Orden);

     Open;
  end;
end;

end.
