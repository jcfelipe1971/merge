unit UDMRLibroDiarioConta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  FIBTableDataSetRO, frxClass, frxHYReport, Excel2000, OleServer;

type
  TDMRLibroDiarioConta = class(TDataModule)
     QSPCreaLibroDiario: TFIBDataSetRO;
     DSLibroDiario: TDataSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     frLibroDiario: TfrHYReport;
     frDSLibroDiario: TfrDBDataSet;
     SPLibroDiarioMoneda: TFIBDataSetRO;
     TLocal: THYTransaction;
     xTipoAsiento: TFIBQuery;
     QMinFecha: THYFIBQuery;
     QMaxFecha: THYFIBQuery;
     xMonedasMONEDA: TFIBStringField;
     xMonedasTITULO: TFIBStringField;
     QMaxAsiento: THYFIBQuery;
     QTotalDigitos: THYFIBQuery;
     DSLibroDiarioResum: TDataSource;
     frDBDSLibDiarioResum: TfrDBDataSet;
     SPLibroDiarioResum: TFIBDataSetRO;
     QMinPeriodo: THYFIBQuery;
     ExcelApplication: TExcelApplication;
     ExcelWorkbook: TExcelWorkbook;
     frxLibroDiario: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRLibroDiarioCreate(Sender: TObject);
     procedure frLibroDiarioGetValue(const ParName: string; var ParValue: variant);
     procedure frLibroDiarioEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRLibroDiarioDestroy(Sender: TObject);
     procedure frxLibroDiarioGetValue(const VarName: string; var Value: variant);
     procedure frxLibroDiarioBeforePrint(Sender: TfrxReportComponent);
  private
     { Private declarations }
     LocalMascaraN: string;
     RIC: integer;
     TotalCargos, TotalAbonos: double;
  public
     { Public declarations }
     Apertura, Cierre, Regula, Nivel, TotalDigitos: smallint;
     Pagina, IniPagina, TipoLibro: integer;
     IniDebe, IniHaber: double;
     Fecha_Desde: TDate;
     Fecha_Hasta: TDate;
     Periodo_Desde: string;
     Periodo_Hasta: string;
     Fecha_Lista: TDate;
     Titulo: string;
     SW: integer;
     TipoAsiento: string;
     Asiento_Desde: integer;
     Asiento_Hasta: integer;
     procedure CalculaInforme;
     procedure CalculaInformeResumido;
     procedure Rangos;
     procedure MostrarInforme(Modo: smallint; Tipo: smallint);
     procedure CambiaMascara(Moneda: string);
     function DameTotalDigitos(nivel: smallint): smallint;
     // Libro diario
     procedure ExportarFichero(Fichero: string);
  end;

var
  DMRLibroDiarioConta : TDMRLibroDiarioConta;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UHojaCalc, DateUtils, UUtiles,
  UFSendCorreo;

{$R *.DFM}

procedure TDMRLibroDiarioConta.DMRLibroDiarioCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  QSPCreaLibroDiario.Open;
  xMonedas.Open;
end;

procedure TDMRLibroDiarioConta.DMRLibroDiarioDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

function TDMRLibroDiarioConta.DameTotalDigitos(Nivel: smallint): smallint;
begin
  with QTotalDigitos do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NIVEL'].AsInteger := Nivel;
     ExecQuery;
     Result := FieldByName['TOTAL_DIGITOS'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMRLibroDiarioConta.CalculaInforme;
begin
  DMListados.Normalizar_Desde_Hasta(TDateTime(Fecha_Desde), TDateTime(Fecha_Hasta));

  with QSPCreaLibroDiario do
  begin
     Close;
     // Hobby lo quiere bidireccional, Iris lo quiere xq muy largo;
     Unidirectional := DMMain.EstadoKri(223) = 0;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := Fecha_Desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := Fecha_Hasta;
     Params.ByName['ASIENTO_DESDE'].AsInteger := Asiento_Desde;
     Params.ByName['ASIENTO_HASTA'].AsInteger := Asiento_Hasta;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     Params.ByName['TIPO'].AsString := TipoAsiento;
     Open;
  end;
end;

procedure TDMRLibroDiarioConta.Rangos;
begin
  with QMinPeriodo do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     Periodo_Desde := FieldByName['MINIMO'].AsString;
     Periodo_Hasta := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;
  with QTotalDigitos do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NIVEL'].AsInteger := 1;
     ExecQuery;
     TotalDigitos := FieldByName['TOTAL_DIGITOS'].AsInteger;
     FreeHandle;
  end;
  with QMinFecha do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Fecha_Desde := FieldByName['MINIMO'].AsDateTime;
     if Fecha_Desde = 0 then
        Fecha_Desde := Date;
     FreeHandle;
  end;

  with QMaxFecha do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Fecha_Hasta := FieldByName['MAXIMO'].AsDateTime;
     if Fecha_Hasta = 0 then
        Fecha_Hasta := Date;
     FreeHandle;
  end;

  with QMaxAsiento do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Asiento_Hasta := FieldByName['MAXIMO'].AsInteger;
     if Asiento_Hasta = 0 then
        Asiento_Hasta := 1;
     FreeHandle;
  end;
  Fecha_Lista := REntorno.FechaTrabSH;
end;

procedure TDMRLibroDiarioConta.MostrarInforme(Modo: smallint; Tipo: smallint);
var
  str : string;
begin
  // Inicializar variables del Listado

  SW := 1;
  TotalCargos := 0;
  TotalAbonos := 0;
  TipoLibro := Tipo;
  case Tipo of
     0: DMListados.Cargar(20, '');
     1: DMListados.Cargar(200, '');
     2: DMListados.Cargar(201, '');
  end;

  if (REntorno.TipoListado = 'FRF') then
  begin
     frLibroDiario.LoadFromFIB(REntorno.Formato, str);
     frLibroDiario.PrepareReport;
     case Modo of
        0: frLibroDiario.ShowPreparedReport;
        1: frLibroDiario.PrintPreparedReport('', REntorno.Copias);
     end;
  end;

  if (REntorno.TipoListado = 'FR3') then
  begin
     frxLibroDiario.LoadFromFIB(REntorno.Formato, str);
     frxLibroDiario.PrepareReport;
     case Modo of
        0: frxLibroDiario.ShowPreparedReport;
        1: frxLibroDiario.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMRLibroDiarioConta.frLibroDiarioGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  case TipoLibro of
     1: // Listado Resumido
     begin
        if ParName = 'Inicializacion' then
        begin
           TotalCargos := inidebe;
           TotalAbonos := inihaber;
           pagina := inipagina - 1;
           ParValue := 0;
        end;

        if (ParName = 'FECHA_LIST') then
           ParValue := Fecha_Lista;

        if (ParName = 'Fecha_Desde') then
           ParValue := DateToStr(Fecha_Desde);

        if (ParName = 'Fecha_Hasta') then
           ParValue := DateToStr(Fecha_Hasta);

        if (ParName = 'TITULO') then
           ParValue := Titulo;

        if ParName = 'DESC' then
           ParValue := Format(_('Ejercicio: %s, Desde %s, Hasta %s (%s)'), [REntorno.EjercicioStr, DateToStr(Fecha_Desde), DateToStr(Fecha_Hasta), xMonedas.FieldByName('TITULO').AsString]);

        if ParName = 'STDEBE' then
           with SPLibroDiarioMoneda do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['RIC'].AsInteger := RIC;
              Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
              Open;
              if (FieldByName('FACTOR').AsFloat <> 0) then
                 ParValue := FieldByName('DEBE').AsFloat / FieldByName('FACTOR').AsFloat
              else
                 ParValue := 0;
           end;

        if ParName = 'STHABER' then
           if (SPLibroDiarioMoneda.FieldByName('FACTOR').AsFloat <> 0) then
              ParValue := SPLibroDiarioMoneda.FieldByName('HABER').AsFloat /
                 SPLibroDiarioMoneda.FieldByName('FACTOR').AsFloat
           else
              ParValue := 0;

        if ParName = 'Cargos' then
           TotalCargos := TotalCargos + QSPCreaLibroDiario.FieldByName('IMPORTE_DEBE').AsFloat;

        if ParName = 'Abonos' then
           TotalAbonos := TotalAbonos + QSPCreaLibroDiario.FieldByName('IMPORTE_HABER').AsFloat;

        if ParName = 'TotalCargos' then
           ParValue := TotalCargos;

        if ParName = 'TotalAbonos' then
           ParValue := TotalAbonos;

        if ParName = 'Página' then
        begin
           Pagina := Pagina + 1;
           ParValue := IntToStr(Pagina);
        end;
     end;

     0:  // Listado Libro Diario
     begin
        if ParName = 'Inicializacion' then
        begin
           TotalCargos := 0;
           TotalAbonos := 0;
           ParValue := 0;
        end;

        if (ParName = 'FECHA_LIST') then
           ParValue := Fecha_Lista;

        if (ParName = 'Fecha_Desde') then
           ParValue := DateToStr(Fecha_Desde);

        if (ParName = 'Fecha_Hasta') then
           ParValue := DateToStr(Fecha_Hasta);

        if (ParName = 'TITULO') then
           ParValue := Titulo;

        if ParName = 'DESC' then
           ParValue := Format(_('Ejercicio: %s, Desde %s, Hasta %s (%s)'), [REntorno.EjercicioStr, DateToStr(Fecha_Desde), DateToStr(Fecha_Hasta), xMonedas.FieldByName('TITULO').AsString]);

        if ParName = 'STDEBE' then
           with SPLibroDiarioMoneda do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['RIC'].AsInteger := RIC;
              Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
              Open;
              if (FieldByName('FACTOR').AsFloat <> 0) then
                 ParValue := FieldByName('DEBE').AsFloat / FieldByName('FACTOR').AsFloat
              else
                 ParValue := 0;
           end;

        if ParName = 'STHABER' then
           if (SPLibroDiarioMoneda.FieldByName('FACTOR').AsFloat <> 0) then
              ParValue := SPLibroDiarioMoneda.FieldByName('HABER').AsFloat /
                 SPLibroDiarioMoneda.FieldByName('FACTOR').AsFloat
           else
              ParValue := 0;

        if ParName = 'Cargos' then
           TotalCargos := TotalCargos + QSPCreaLibroDiario.FieldByName('IMPORTE_DEBE').AsFloat;

        if ParName = 'Abonos' then
           TotalAbonos := TotalAbonos + QSPCreaLibroDiario.FieldByName('IMPORTE_HABER').AsFloat;

        if ParName = 'TotalCargos' then
           ParValue := TotalCargos;

        if ParName = 'TotalAbonos' then
           ParValue := TotalAbonos;

        if ParName = 'Titulo_Moneda' then
           ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;

     2:  // Listado Resumido
     begin
        if (ParName = 'TITULO') then
           ParValue := Titulo;
        if (ParName = 'FECHA') then
           ParValue := Fecha_lista;
     end;
  end;
end;

procedure TDMRLibroDiarioConta.frLibroDiarioEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if Pos('ASIENTO Nº', Memo[0]) > 0 then
     begin
        RIC := QSPCreaLibroDiario.FieldByName('RIC').AsInteger;
        SW := 1;
     end;

     if Pos('[MASCARA]', Memo[0]) > 0 then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMRLibroDiarioConta.CambiaMascara(Moneda: string);
begin
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
end;

procedure TDMRLibroDiarioConta.CalculaInformeResumido;
begin
  with SPLibroDiarioResum do
  begin
     Close;
     // Hobby lo quiere bidireccional, Iris lo quiere xq muy largo;
     Unidirectional := DMMain.EstadoKri(223) = 0;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NIVEL'].AsInteger := Nivel;
     Params.ByName['PERIODO_INI'].AsString := Periodo_Desde;
     Params.ByName['PERIODO_FIN'].AsString := Periodo_Hasta;
     Params.ByName['APE'].AsInteger := Apertura;
     Params.ByName['REG'].AsInteger := Regula;
     Params.ByName['CIE'].AsInteger := Cierre;
     Params.ByName['MONEDA_NUEVA'].AsString :=
        xMonedas.FieldByName('MONEDA').AsString;
     Params.ByName['FECHA'].AsDateTime := Fecha_Lista;
     Open;
  end;
end;

procedure TDMRLibroDiarioConta.ExportarFichero(Fichero: string);
var
  HCalc : THojaCalc;
  Pagina, c, f : integer;
  Asiento, Mes, Registro, CantidadRegistros : integer;
  TotalDebeAsi, TotalHaberAsi : double;
  TotalDebeMes, TotalHaberMes : double;
  TotalDebe, TotalHaber : double;
begin
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Exportado Fichero: '));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando datos ...'));

     // Exportacion de Libro diario a Excel
     with QSPCreaLibroDiario do
     begin
        Close;
        Unidirectional := True;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA_DESDE'].AsDateTime := Fecha_Desde;
        Params.ByName['FECHA_HASTA'].AsDateTime := Fecha_Hasta;
        Params.ByName['ASIENTO_DESDE'].AsInteger := Asiento_Desde;
        Params.ByName['ASIENTO_HASTA'].AsInteger := Asiento_Hasta;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Params.ByName['TIPO'].AsString := TipoAsiento;
        Open;
        Last;
        CantidadRegistros := RecordCount;
        Close;
        Open;
     end;

     // Borro fichero antes de volver a crearlo.
     DeleteFile(Fichero);

     if (UpperCase(ExtractFileExt(Fichero)) = '.ODS') then
        HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
     else
        HCalc := THojaCalc.Create(thcExcel, False);

     try
        Application.ProcessMessages;
        HCalc.FileName := Fichero; //Needs a file name before you SaveDoc!

        Pagina := 1;
        f := 1;

        HCalc.ActiveSheetName := format(_('Pagina %d'), [Pagina]);
        HCalc.RemoveAllSheetsExcept(format(_('Pagina %d'), [Pagina]), False);

        HCalc.CellText[f, 1] := _('Empresa');
        HCalc.CellText[f, 3] := REntorno.NombreEmpresa;
        for c := 1 to 3 do
        begin
           HCalc.Bold(f, c);
           HCalc.BackgroundColor(f, c, clSilver);
        end;
        Inc(f);

        HCalc.CellText[f, 1] := _('NIF');
        HCalc.CellText[f, 3] := REntorno.CifEmpresa;
        for c := 1 to 3 do
        begin
           HCalc.Bold(f, c);
           HCalc.BackgroundColor(f, c, clSilver);
        end;
        Inc(f);

        HCalc.CellText[f, 1] := _('Fechas');
        HCalc.CellText[f, 3] := format(_('Desde %s Hasta %s'), [DateToStr(Fecha_Desde), DateToStr(Fecha_Hasta)]);
        for c := 1 to 3 do
        begin
           HCalc.Bold(f, c);
           HCalc.BackgroundColor(f, c, clSilver);
        end;
        Inc(f);

        HCalc.CellText[f, 1] := _('Asientos');
        HCalc.CellText[f, 3] := format(_('Desde %d Hasta %d'), [Asiento_Desde, Asiento_Hasta]);
        for c := 1 to 3 do
        begin
           HCalc.Bold(f, c);
           HCalc.BackgroundColor(f, c, clSilver);
        end;
        Inc(f);
        Inc(f);

        // Paso 1
        // Encabezado de los Datos a Insertar
        HCalc.CellText[f, 1] := _('Asiento');
        HCalc.CellText[f, 2] := _('Fecha');
        HCalc.CellText[f, 3] := _('Comentario');
        HCalc.CellText[f, 4] := _('Titulo');
        HCalc.CellText[f, 5] := _('Cuenta Debe');
        HCalc.CellText[f, 6] := _('Importe Debe');
        HCalc.CellText[f, 7] := _('Cuenta Haber');
        HCalc.CellText[f, 8] := _('Importe Haber');

        for c := 1 to 8 do
           HCalc.Bold(f, c);

        Inc(f);

        QSPCreaLibroDiario.First;

        Registro := 0;
        TotalDebeAsi := 0;
        TotalHaberAsi := 0;
        TotalDebeMes := 0;
        TotalHaberMes := 0;
        TotalDebe := 0;
        TotalHaber := 0;
        Mes := MonthOf(QSPCreaLibroDiario.FieldByName('FECHA').AsDateTime);
        Asiento := QSPCreaLibroDiario.FieldByName('ASIENTO').AsInteger;

        repeat
           // Por cada linea introducimos los datos
           HCalc.SendNumber(f, 1, QSPCreaLibroDiario.FieldByName('ASIENTO').AsInteger);
           HCalc.CellText[f, 2] := DateToStr(QSPCreaLibroDiario.FieldByName('FECHA').AsDateTime);
           HCalc.CellText[f, 3] := QSPCreaLibroDiario.FieldByName('COMENTARIO').AsString;
           HCalc.CellText[f, 4] := QSPCreaLibroDiario.FieldByName('TITULO').AsString;
           if (QSPCreaLibroDiario.FieldByName('CUENTA_DEBE').AsString > '') then
              HCalc.CellText[f, 5] := QSPCreaLibroDiario.FieldByName('CUENTA_DEBE').AsString;
           if (QSPCreaLibroDiario.FieldByName('IMPORTE_DEBE').AsFloat <> 0) then
              HCalc.SendNumber(f, 6, QSPCreaLibroDiario.FieldByName('IMPORTE_DEBE').AsFloat);
           if (QSPCreaLibroDiario.FieldByName('CUENTA_HABER').AsString > '') then
              HCalc.CellText[f, 7] := QSPCreaLibroDiario.FieldByName('CUENTA_HABER').AsString;
           if (QSPCreaLibroDiario.FieldByName('IMPORTE_HABER').AsFloat <> 0) then
              HCalc.SendNumber(f, 8, QSPCreaLibroDiario.FieldByName('IMPORTE_HABER').AsFloat);

           TotalDebeAsi := TotalDebeAsi + QSPCreaLibroDiario.FieldByName('IMPORTE_DEBE').AsFloat;
           TotalHaberAsi := TotalHaberAsi + QSPCreaLibroDiario.FieldByName('IMPORTE_HABER').AsFloat;
           TotalDebeMes := TotalDebeMes + QSPCreaLibroDiario.FieldByName('IMPORTE_DEBE').AsFloat;
           TotalHaberMes := TotalHaberMes + QSPCreaLibroDiario.FieldByName('IMPORTE_HABER').AsFloat;
           TotalDebe := TotalDebe + QSPCreaLibroDiario.FieldByName('IMPORTE_DEBE').AsFloat;
           TotalHaber := TotalHaber + QSPCreaLibroDiario.FieldByName('IMPORTE_HABER').AsFloat;

           QSPCreaLibroDiario.Next;
           Inc(f);
           Inc(Registro);

           // Salto de asiento. Imprimo totales de asiento
           if QSPCreaLibroDiario.EOF or (Asiento <> QSPCreaLibroDiario.FieldByName('ASIENTO').AsInteger) then
           begin
              // Progreso
              FSendCorreo.Texto(format(_('Exportando Registro %d de %d - asiento %d' + #13#10 + 'Pagina: %d - Fila %d'), [Registro, CantidadRegistros, QSPCreaLibroDiario.FieldByName('ASIENTO').AsInteger, Pagina, f]));

              HCalc.Bold(f, 4);
              HCalc.Bold(f, 6);
              HCalc.Bold(f, 8);
              for c := 4 to 8 do
                 HCalc.BackgroundColor(f, c, clSilver);

              HCalc.CellText[f, 4] := format(_('Total Asiento %d'), [Asiento]);
              // HCalc.CellFormula[f, 6] := '=' + FloatToStrDec(TotalDebeAsi, '.');
              // HCalc.CellFormula[f, 8] := '=' + FloatToStrDec(TotalHaberAsi, '.');
              HCalc.SendNumber(f, 6, TotalDebeAsi);
              HCalc.SendNumber(f, 8, TotalHaberAsi);

              Asiento := QSPCreaLibroDiario.FieldByName('ASIENTO').AsInteger;
              TotalDebeAsi := 0;
              TotalHaberAsi := 0;
              Inc(f);
              Inc(f);

              // Si el proximo asiento supera la linea 50000 empiezo nueva pagina
              if (f > 50000) then
              begin
                 HCalc.ColNumberFormat(6, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                 HCalc.ColNumberFormat(8, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

                 for c := 1 to 8 do
                    HCalc.AutoFit(c);

                 Inc(Pagina);
                 f := 1;
                 if (HCalc.Document.Sheets.Count < Pagina) then
                 begin
                    HCalc.AddNewSheet(format(_('Pagina %d'), [Pagina]));
                    HCalc.ActivateSheetByName(format(_('Pagina %d'), [Pagina]), False);
                 end
                 else
                 begin
                    HCalc.ActivateSheetByNAme(format(_('Pagina %d'), [Pagina]), False);
                    HCalc.ActiveSheetName := format(_('Pagina %d'), [Pagina]);
                 end;

                 HCalc.CellText[f, 1] := _('Empresa');
                 HCalc.CellText[f, 3] := REntorno.NombreEmpresa;
                 for c := 1 to 3 do
                 begin
                    HCalc.Bold(f, c);
                    HCalc.BackgroundColor(f, c, clSilver);
                 end;
                 Inc(f);

                 HCalc.CellText[f, 1] := _('NIF');
                 HCalc.CellText[f, 3] := REntorno.CifEmpresa;
                 for c := 1 to 3 do
                 begin
                    HCalc.Bold(f, c);
                    HCalc.BackgroundColor(f, c, clSilver);
                 end;
                 Inc(f);

                 HCalc.CellText[f, 1] := _('Fechas');
                 HCalc.CellText[f, 3] := format(_('Desde %s Hasta %s'), [DateToStr(Fecha_Desde), DateToStr(Fecha_Hasta)]);
                 for c := 1 to 3 do
                 begin
                    HCalc.Bold(f, c);
                    HCalc.BackgroundColor(f, c, clSilver);
                 end;
                 Inc(f);

                 HCalc.CellText[f, 1] := _('Asientos');
                 HCalc.CellText[f, 3] := format(_('Desde %d Hasta %d'), [Asiento_Desde, Asiento_Hasta]);
                 for c := 1 to 3 do
                 begin
                    HCalc.Bold(f, c);
                    HCalc.BackgroundColor(f, c, clSilver);
                 end;
                 Inc(f);
                 Inc(f);

                 // Paso 1
                 // Encabezado de los Datos a Insertar
                 HCalc.CellText[f, 1] := _('Asiento');
                 HCalc.CellText[f, 2] := _('Fecha');
                 HCalc.CellText[f, 3] := _('Comentario');
                 HCalc.CellText[f, 4] := _('Titulo');
                 HCalc.CellText[f, 5] := _('Cuenta Debe');
                 HCalc.CellText[f, 6] := _('Importe Debe');
                 HCalc.CellText[f, 7] := _('Cuenta Haber');
                 HCalc.CellText[f, 8] := _('Importe Haber');

                 for c := 1 to 8 do
                    HCalc.Bold(f, c);

                 Inc(f);
              end;
           end;

           if QSPCreaLibroDiario.EOF or (Mes <> MonthOf(QSPCreaLibroDiario.FieldByName('FECHA').AsDateTime)) then
           begin
              HCalc.Bold(f, 4);
              HCalc.Bold(f, 6);
              HCalc.Bold(f, 8);
              for c := 4 to 8 do
                 HCalc.BackgroundColor(f, c, clYellow);
              HCalc.CellText[f, 4] := format(_('Total Mes %s'), [MesStr(Mes)]);
              // HCalc.CellFormula[f, 6] := '=' + FloatToStrDec(TotalDebeMes, '.');
              // HCalc.CellFormula[f, 8] := '=' + FloatToStrDec(TotalHaberMes, '.');
              HCalc.SendNumber(f, 6, TotalDebeMes);
              HCalc.SendNumber(f, 8, TotalHaberMes);

              TotalDebeMes := 0;
              TotalHaberMes := 0;
              Mes := MonthOf(QSPCreaLibroDiario.FieldByName('FECHA').AsDateTime);

              Inc(f);
              Inc(f);
           end;
        until QSPCreaLibroDiario.EOF;

        HCalc.Bold(f, 4);
        HCalc.Bold(f, 6);
        HCalc.Bold(f, 8);
        for c := 4 to 8 do
           HCalc.BackgroundColor(f, c, clGray);
        HCalc.CellText[f, 4] := _('Total');
        // HCalc.CellFormula[f, 6] := '=' + FloatToStrDec(TotalDebe, '.');
        // HCalc.CellFormula[f, 8] := '=' + FloatToStrDec(TotalHaber, '.');
        HCalc.SendNumber(f, 6, TotalDebe);
        HCalc.SendNumber(f, 8, TotalHaber);

        HCalc.ColNumberFormat(6, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(8, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

        for c := 1 to 8 do
           HCalc.AutoFit(c);

        HCalc.SaveDocAs(Fichero, (Pos('.XLS', UpperCase(ExtractFileExt(Fichero))) > 0));
        Application.ProcessMessages;
     finally
        Sleep(1000);
        Application.ProcessMessages;
        HCalc.Free;

        QSPCreaLibroDiario.Close;
        // Hobby lo quiere bidireccional, Iris lo quiere xq muy largo;
        QSPCreaLibroDiario.Unidirectional := DMMain.EstadoKri(223) = 0;
     end;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TDMRLibroDiarioConta.frxLibroDiarioGetValue(const VarName: string; var Value: variant);
begin
  frLibroDiarioGetValue(VarName, Value);
end;

procedure TDMRLibroDiarioConta.frxLibroDiarioBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('ASIENTO Nº', Memo[0]) > 0 then
           begin
              RIC := QSPCreaLibroDiario.FieldByName('RIC').AsInteger;
              SW := 1;
           end;

           if Pos('[MASCARA]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;

           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;

           // Utilizamos este recurso por problemas con el uso de variables en el listado y mascaras. ([[STDEBE]+[MASCARA]]
           if (Pos('[STDEBE]', Memo[0]) > 0) or
              (Pos('[STHABER]', Memo[0]) > 0) or
              (Pos('[TOTALDEBE]', Memo[0]) > 0) or
              (Pos('[TOTALHABER]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

end.
