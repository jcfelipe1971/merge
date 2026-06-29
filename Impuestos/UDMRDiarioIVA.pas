unit UDMRDiarioIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, FIBDataSetRW;

type
  TDMRDiarioIVA = class(TDataModule)
     DSQSPDiarioIVA: TDataSource;
     TLocal: THYTransaction;
     frDiarioIVA: TfrHYReport;
     frDBQSPDiarioIVA: TfrDBDataSet;
     DSQMTotales: TDataSource;
     frDSQMTotales: TfrDBDataSet;
     frxDiarioIVA: TfrxHYReport;
     TUpdate: THYTransaction;
     QSPDiarioIVA: TFIBDataSetRW;
     QMTotales: TFIBDataSetRW;
     procedure DMRDiarioIVACreate(Sender: TObject);
     procedure frDiarioIVAEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRDiarioIVADestroy(Sender: TObject);
     procedure frDiarioIVAGetValue(const ParName: string; var ParValue: variant);
     procedure frxDiarioIVABeforePrint(Sender: TfrxReportComponent);
     procedure frxDiarioIVAGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     Titulo: string;
     FechaListado: TDateTime;
     SW: integer;
     SQLBase: string;
     PorFecha: boolean;
     PorSerie: boolean;
     Filtro: string;
  public
     { Public declarations }
     FraDesde: integer;
     FraHasta: integer;
     FechaDesde: TDateTime;
     FechaHasta: TDateTime;
     Fecha_Lista: TDate;
     Serie: string;
     sSigno: string;
     sTipo: integer;
     procedure CalculaInforme(aFraDesde, aFraHasta: integer; aFechaDesde, aFechaHasta: TDateTime; Orden: integer; aPorFecha, aPorSerie: boolean);
     procedure Rangos;
     procedure MostrarInforme(Modo, Grupo: smallint; aTitulo: string; aFechaListado: TDateTime);
  end;

var
  DMRDiarioIVA : TDMRDiarioIVA;

implementation

uses UDMMain, UEntorno, UFPregDiarioIVA, UDMListados, UFormGest, UUtiles;

{$R *.DFM}

procedure TDMRDiarioIVA.DMRDiarioIVACreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  SQLBase := QSPDiarioIVA.SelectSQL.Text;
end;

procedure TDMRDiarioIVA.DMRDiarioIVADestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRDiarioIVA.CalculaInforme(aFraDesde, aFraHasta: integer; aFechaDesde, aFechaHasta: TDateTime; Orden: integer; aPorFecha, aPorSerie: boolean);
begin
  PorSerie := aPorSerie;
  PorFecha := aPorFecha;
  FechaDesde := HourIntoDate(aFechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(aFechaHasta, '23:59:59');
  FraDesde := aFraDesde;
  FraHasta := aFraHasta;

  // Damos valor al texto Filtro para su uso en el listado
  if PorFecha then
     Filtro := _('Listado entre Fechas') + '. ' + Format(_('Desde: %s - Hasta: %s'), [DateTimeToStr(FechaDesde), DateToStr(FechaHasta)])
  else
     Filtro := _('Listado entre Números de Factura') + '. ' + Format(_('Desde: %d - Hasta: %d'), [aFraDesde, aFraHasta]);

  with QSPDiarioIVA do
  begin
     Close;
     UniDirectional := DMMain.EstadoKri(215) = 0; {NCO lo quiere bidireccional, Iris lo quiere uni (muy largo)}

     if PorSerie then
     begin
        if (Orden = 0) then
           if (SSigno = 'R') then
              SelectSQL.Text := SQLBase + ' ORDER BY DOC_SERIE, DOC_FECHA, DOC_NUMERO'
           else
              SelectSQL.Text := SQLBase + ' ORDER BY DOC_SERIE, FECHA_REGISTRO, DOC_NUMERO'
        else if (Orden = 1) then
           SelectSQL.Text := SQLBase + ' ORDER BY DOC_SERIE, RIG_VISIBLE'
        else if (Orden = 2) then
           SelectSQL.Text := SQLBase + ' ORDER BY DOC_SERIE, TITULO, DOC_NUMERO'
        else if (Orden = 3) then
           SelectSQL.Text := SQLBase + ' ORDER BY DOC_SERIE, DOC_NUMERO';
     end
     else
     begin
        if (Orden = 0) then
           if (SSigno = 'R') then
              SelectSQL.Text := SQLBase + ' ORDER BY MODO_IVA, TIPO_IVA, DOC_FECHA, DOC_SERIE, DOC_NUMERO'
           else
              SelectSQL.Text := SQLBase + ' ORDER BY MODO_IVA, TIPO_IVA, FECHA_REGISTRO, DOC_SERIE, DOC_NUMERO'
        else if (Orden = 1) then
           SelectSQL.Text := SQLBase + ' ORDER BY MODO_IVA, TIPO_IVA, RIG_VISIBLE'
        else if (Orden = 2) then
           SelectSQL.Text := SQLBase + ' ORDER BY MODO_IVA, TIPO_IVA, TITULO, DOC_NUMERO'
        else if (Orden = 3) then
           SelectSQL.Text := SQLBase + ' ORDER BY MODO_IVA, TIPO_IVA, DOC_SERIE, DOC_NUMERO';
     end;

     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Pais'].AsString := REntorno.Pais;
     Params.ByName['Signo'].AsString := sSigno;
     Params.ByName['Tipo'].AsInteger := sTipo;
     Params.ByName['Serie'].AsString := Serie;
     Params.ByName['Num_desde'].AsInteger := aFraDesde;
     Params.ByName['Num_hasta'].AsInteger := aFraHasta;
     Params.ByName['fecha_desde'].AsDateTime := FechaDesde;
     Params.ByName['fecha_hasta'].AsDateTime := FechaHasta;
     Params.ByName['Modo'].AsInteger := BoolToInt(not PorFecha);
     Open;
  end;
end;

procedure TDMRDiarioIVA.Rangos;
begin
  Fecha_Lista := REntorno.FechaTrabSH;

  // Emitidas = IVA (R)epercutido
  // Recibidas = IVA (S)oportado
  if FPregDiarioIVA.RGFacturas.ItemIndex = 0 then
     sSigno := 'R'
  else
     sSigno := 'S';

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_DIARIO_IVA_MAX_MIN(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := sSigno;
        ExecQuery;
        FechaDesde := FieldByName['FECHA_DESDE'].AsDateTime;
        FechaHasta := FieldByName['FECHA_HASTA'].AsDateTime;
        Serie := FieldByName['SERIE'].AsString;
        FraDesde := FieldByName['FRA_DESDE'].AsInteger;
        FraHasta := FieldByName['FRA_HASTA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if FechaDesde = 0 then
     FechaDesde := REntorno.FechaTrab;
  if FechaHasta = 0 then
     FechaHasta := REntorno.FechaTrab;
end;

procedure TDMRDiarioIVA.MostrarInforme(Modo, Grupo: smallint; aTitulo: string; aFechaListado: TDateTime);
begin
  SW := 1;
  //Guardamos los parametros en variables para meterlo en el fast
  Titulo := aTitulo;
  FechaListado := aFechaListado;

  DMListados.DatosInforme(FechaListado, Titulo);
  DMListados.Imprimir(Grupo, 0, Modo, '', Titulo, frDiarioIVA, frxDiarioIVA, nil);
end;

procedure TDMRDiarioIVA.frDiarioIVAEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMRDiarioIVA.frDiarioIVAGetValue(const ParName: string; var ParValue: variant);
var
  Empresa, Ejercicio, CANAL, Rig : integer;
  fecha : TDateTime;
  num_fact : string;
  Tipo, Serie2 : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FECHA_OP' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT REMPRESA, REJERCICIO, RCANAL, RSERIE, RTIPO, RRIG ');
           SQL.Add(' FROM G_RELACIONES_ORIGENES ');
           SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := QSPDiarioIVA.FieldByName('DOC_SERIE').AsString;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['RIG'].AsInteger := QSPDiarioIVA.FieldByName('DOC_NUMERO').AsInteger;
           ExecQuery;
           Empresa := FieldByName['REmpresa'].AsInteger;
           Ejercicio := FieldByName['REjercicio'].AsInteger;
           Canal := FieldByName['RCanal'].AsInteger;
           Serie2 := FieldByName['RSerie'].AsString;
           Tipo := FieldByName['RTipo'].AsString;
           Rig := FieldByName['RRig'].AsInteger;
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
           SQL.Add(' SELECT FECHA FROM VER_CABECERAS_ALBARAN ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' RIG = :RIG ');
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := canal;
           Params.ByName['SERIE'].AsString := Serie2;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['RIG'].AsInteger := Rig;
           ExecQuery;
           Fecha := FieldByName['FECHA'].AsDateTime;

           FreeHandle;
        finally
           Free;
        end;
     end;
     ParValue := Fecha;
  end;

  if ParName = 'TITULO_MODO' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_MODO_IVA WHERE MODO = :MODO';
           Params.ByName['MODO'].AsInteger := QSPDiarioIVA.FieldByName('MODO_IVA').AsInteger;
           ExecQuery;
           ParValue := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TITULO_TIPO' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND TIPO = :TIPO';
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           Params.ByName['TIPO'].AsInteger := QSPDiarioIVA.FieldByName('TIPO_IVA').AsInteger;
           ExecQuery;
           ParValue := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Titulo' then
     ParValue := Titulo;

  if ParName = 'FechaCab' then
     ParValue := FechaListado;

  if ParName = 'Descripcion' then
     ParValue := Format(_('Ejercicio: %s - Canal: %s'), [REntorno.EjercicioStr, REntorno.CanalStr]);

  if ParName = 'FILTRO' then
     ParValue := Filtro;

  if ParName = 'Ejercicio' then
     ParValue := REntorno.EjercicioStr;

  if ParName = 'Canal' then
     ParValue := REntorno.EjercicioStr;

  if ParName = 'FECHA' then
  begin
     if Ssigno = 'S' then
        fecha := Trunc(QSPDiarioIva.FieldByName('FECHA_REGISTRO').AsDateTime)
     else
        fecha := Trunc(QSPDiarioIva.FieldByName('DOC_FECHA').AsDateTime);

     ParValue := fecha;
  end;

  if ParName = 'DESDE' then
     ParValue := FechaDesde;

  if ParName = 'HASTA' then
     ParValue := FechaHasta;

  if ParName = 'FRA_DESDE' then
     ParValue := FraDesde;

  if ParName = 'FRA_HASTA' then
     ParValue := FraHasta;

  if ParName = 'SIGNO' then
     ParValue := Ssigno;

  if ParName = 'FACTURA' then
  begin
     num_fact := ' ';
     if (QSPDiarioIva.FieldByName('DOC_NUMERO').AsString <> '0') then
     begin
        if ssigno = 'R' then
           num_fact := QSPDiarioIva.FieldByName('DOC_SERIE').AsString + '/' + QSPDiarioIva.FieldByName('DOC_NUMERO').AsString
        else
           num_fact := QSPDiarioIva.FieldByName('NUM_FACTURA').AsString;
     end;

     ParValue := num_fact;
  end;

  if ParName = 'MUESTRA_TOTALES' then
  begin
     with QMTotales do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['SIGNO'].AsString := sSigno;
        Params.ByName['TIPO'].AsInteger := sTipo;
        if (PorSerie) then
           Params.ByName['SERIE'].AsString := QSPDiarioIVA.FieldByName('DOC_SERIE').AsString
        else
           Params.ByName['SERIE'].AsString := 'TODAS';
        Params.ByName['NUM_DESDE'].AsInteger := FraDesde;
        Params.ByName['NUM_HASTA'].AsInteger := FraHasta;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        Params.ByName['MODO'].AsInteger := BoolToInt(not PorFecha);
        Open;
     end;
     ParValue := '';
  end;
end;

procedure TDMRDiarioIVA.frxDiarioIVABeforePrint(Sender: TfrxReportComponent);
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

procedure TDMRDiarioIVA.frxDiarioIVAGetValue(const VarName: string; var Value: variant);
begin
  frDiarioIVAGetValue(VarName, Value);
end;

end.
