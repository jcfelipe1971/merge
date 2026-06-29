unit UDMLstTickets;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_DSet, FR_DBSet, DB, FIBDataSet, FIBTableDataSet, FR_Class,
  Fr_HYReport, FIBDatabase, UFIBModificados, FIBQuery, UHYReport,
  FIBDataSetRO, frxClass, frxDBSet, frxHYReport;

type
  TDMLstTickets = class(TDataModule)
     TLocal: THYTransaction;
     frTicket: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frDBDetalle: TfrDBDataSet;
     frDBxCli: TfrDBDataSet;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xCliente: TFIBTableSet;
     DSxCliente: TDataSource;
     xCajas: TFIBTableSet;
     DSxCajas: TDataSource;
     frDBxCajas: TfrDBDataSet;
     xDesgloseIVA: TFIBTableSet;
     frDBxDesgloseIVA: TfrDBDataSet;
     DSxDesgloseIVA: TDataSource;
     xUsuarios: TFIBTableSet;
     DSxUsuarios: TDataSource;
     frDBxUsuarios: TfrDBDataSet;
     xFormaPagos: TFIBTableSet;
     frDBxFormaPagos: TfrDBDataSet;
     DSxFormaPagos: TDataSource;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSCliente: THYReportSource;
     HYRSCajas: THYReportSource;
     HYRSUsuarios: THYReportSource;
     HYRSDesgloseIVA: THYReportSource;
     HYRSFormaPago: THYReportSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     HYRSxArticulos: THYReportSource;
     xEntregas: TFIBTableSet;
     DSxEntregas: TDataSource;
     frDBxEntregas: TfrDBDataSet;
     frDBxVales: TfrDBDataSet;
     DSxVales: TDataSource;
     xVales: TFIBTableSet;
     xAbonos: TFIBTableSet;
     DSxAbonos: TDataSource;
     frDBxAbonos: TfrDBDataSet;
     DSxReservas: TDataSource;
     xReservas: TFIBTableSet;
     frDBxReservas: TfrDBDataSet;
     frxDBCabecera: TfrxDBDataset;
     frxDBDetalle: TfrxDBDataset;
     frxDBxCli: TfrxDBDataset;
     frxDBxCajas: TfrxDBDataset;
     frxDBxUsuarios: TfrxDBDataset;
     frxDBxDesgloseIVA: TfrxDBDataset;
     frxDBxFormaPagos: TfrxDBDataset;
     frxDBxArticulos: TfrxDBDataset;
     frxDBxEntregas: TfrxDBDataset;
     frxDBxAbonos: TfrxDBDataset;
     frxDBxVales: TfrxDBDataset;
     frxDBxReservas: TfrxDBDataset;
     frxTicket: TfrxHYReport;
     xTicketVales: TFIBTableSet;
     frDBxSeries: TfrDBDataSet;
     DSxSeries: TDataSource;
     frxDBxSeries: TfrxDBDataset;
     xSeries: TFIBTableSet;
     xEnEntregas: TFIBQuery;
     xEnVales: TFIBQuery;
     xAgente: TFIBTableSet;
     DSxAgente: TDataSource;
     procedure DMLstTicketsCreate(Sender: TObject);
     procedure DMLstTicketsDestroy(Sender: TObject);
     procedure frTicketGetValue(const ParName: string; var ParValue: variant);
     procedure frTicketEnterRect(Memo: TStringList; View: TfrView);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure frxTicketBeforePrint(Sender: TfrxReportComponent);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     function EsCredito: boolean;
     procedure PrepareDataSets(Serie, Tipo: string; RIT: integer; Abiertos: boolean = False);
     procedure PrepareEntregasVales(ID, Modo: integer);
     procedure ImprimirValesDeTicket;
     procedure ImprimirEntregaVale(ID: integer; Modo: integer; ImprimirRollo: boolean; ImprimirTicket: boolean = True);
     procedure Imprimir(Modo, Grupo: integer; str, Email: string);
     procedure EnviaEmailPdf(Email, aSerie: string; aEjercicio, Rit: integer; aFecha: TDateTime; nombreFich, rutaFich: string);
  public
     { Public declarations }
     procedure ImprimirTicket(Email: string; Serie, Tipo: string; RIT: integer; Modo: integer; ImprimirRollo: boolean; ImprimirTicket: boolean = True; esRegalo: boolean = False);
  end;

var
  DMLstTickets : TDMLstTickets;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFormGest, UDMListados, UFMain, HYFIBQuery, DateUtils, ExtCtrls, ALetras, frxPrinter, MMSystem;

{$R *.DFM}

procedure TDMLstTickets.DMLstTicketsCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstTickets.DMLstTicketsDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstTickets.ImprimirTicket(Email: string; Serie, Tipo: string; RIT: integer; Modo: integer; ImprimirRollo: boolean; ImprimirTicket: boolean = True; EsRegalo: boolean = False);
var
  str : string;
  Grupo : integer;
  ArticulosPreparables : integer;
begin
  HYReport.ControlaLongitud := False;

  if ImprimirTicket then
  begin
     PrepareDataSets(Serie, Tipo, Rit);

     Grupo := 0;
     if Tipo = 'TAC' then
        Grupo := 186
     else
     if Tipo = 'TCR' then
        Grupo := 188
     else
     if Tipo = 'TIC' then
     begin
        if EsRegalo then
           Grupo := 632
        else
        begin
           if EsCredito then
           begin
              HYReport.ControlaLongitud := True;
              Grupo := 185;
           end
           else
              Grupo := 86;
        end;
     end;

     Imprimir(Modo, Grupo, str, Email);

     if DMMain.MuestraRolloHacienda then
     begin
        HYReport.ControlaLongitud := False;
        // PrepareDataSets(Serie,Tipo,Rit);

        // Esto no se debe enviar por email
        Imprimir(Modo, 187, str, '');
     end;
  end;

  // Después de imprimir el ticket imprimimos posibles vales del ticket
  PrepareDataSets(Serie, Tipo, Rit);
  ImprimirValesDeTicket;

  if ImprimirTicket and (Tipo = 'TIC') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT COUNT(*) FROM GES_TICKET_DETALLE D ');
           SQL.Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO = A.ARTICULO ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.EMPRESA = :EMPRESA AND ');
           SQL.Add(' D.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' D.CANAL = :CANAL AND ');
           SQL.Add(' D.SERIE = :SERIE AND ');
           SQL.Add(' D.TIPO = :TIPO AND ');
           SQL.Add(' D.RIT = :RIT AND ');
           SQL.Add(' A.PREPARABLE = 1 ');

           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
           Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
           Params.ByName['RIT'].AsInteger := QMCabecera.FieldByName('RIT').AsInteger;
           ExecQuery;
           ArticulosPreparables := FieldByName['COUNT'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (ArticulosPreparables > 0) then
     begin
        // Después imprimimos posibles tickets de entrega
        PrepareDataSets(Serie, Tipo, Rit);

        // Reabrimos el módulo Listados para que se entere del cambio ticket=>vale
        CierraData(DMListados);
        AbreData(TDMListados, DMListados);

        // Este ticket de entrega no se debe enviar por email
        Imprimir(Modo, 654, str, '');
        if (FileExists(REntorno.RutaEXE + 'Sonidos\TPV-Recogida.wav')) then
           sndPlaySound(PChar(REntorno.RutaEXE + 'Sonidos\TPV-Recogida.wav'), SND_ASYNC);
     end;
  end;
end;

procedure TDMLstTickets.PrepareDataSets(Serie, Tipo: string; RIT: integer; Abiertos: boolean = False);
begin
  if Abiertos then
  begin
     QMCabecera.First;
  end
  else
  begin
     with QMDetalle do
     begin
        Close;
        SelectSQL.Clear;

        SelectSQL.Add(' SELECT D.*, A.PREPARABLE FROM GES_TICKET_DETALLE D ');
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO = A.ARTICULO ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' D.EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' D.CANAL = :CANAL AND ');
        SelectSQL.Add(' D.SERIE = :SERIE AND ');
        SelectSQL.Add(' D.TIPO = :TIPO AND ');
        SelectSQL.Add(' D.RIT = :RIT ');
        SelectSQL.Add(' ORDER BY D.LINEA ');
     end;

     with QMCabecera do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIT'].AsInteger := RIT;
        Open;
     end;

     {
     with xEnVales do
     begin
        Close;
        Open;
     end;

     with xEnEntregas do
     begin
        Close;
        Params.ByName['ID_TICKET'].AsInteger := QMCabeceraID_TICKET.AsInteger;
       Open;
     end;
     }

     with xSeries do
     begin
        Close;
        Params.ByName['SERIE'].AsString := Serie;
        Open;
     end;
  end;
end;

procedure TDMLstTickets.Imprimir(Modo, Grupo: integer; str, Email: string);
var
  ModoEnter, Ejercicio, Rit : integer;
  Serie : string;
  Fecha : TDateTime;
  nombreFich, rutaFich : string;
  TituloIforme : string;
begin
  DMListados.Cargar(Grupo, REntorno.Serie);  // Añadir la serie?
  Serie := QMCabecera.FieldByName('SERIE').AsString;
  Ejercicio := QMCabecera.FieldByName('EJERCICIO').AsInteger;
  Rit := QMCabecera.FieldByName('RIT').AsInteger;
  Fecha := QMCabecera.FieldByName('FECHA').AsDateTime;

  if (Grupo = 86) then
     TituloIforme := _('Ticket') + '_' + Serie + '_' + IntToStr(Rit)
  else
  if (Grupo = 654) then
     TituloIforme := _('Ticket_Recogida') + '_' + Serie + '_' + IntToStr(Rit)
  else
     TituloIforme := _('Ticket') + '_G' + IntToStr(Grupo) + '_' + Serie + '_' + IntToStr(Rit);

  if (REntorno.TipoListado = 'FR3') then
  begin
     frxTicket.LoadFromFIB(REntorno.Formato, str);
     frxTicket.ReportOptions.Name := TituloIforme;
     DMMain.Log(format('DMLstTickets.Imprimir - FR3 - Impresora: %s', [frxTicket.Report.PrintOptions.Printer]));
     case Modo of
        0:
           if ((ssShift in FMain.Keystate) or (ssAlt in FMain.Keystate)) then
           begin
              frxTicket.DesignReport;
           end
           else if ssCtrl in FMain.Keystate then
           begin
              if frTicket.ComponentCount > 0 then
              begin
                 frxTicket.PrepareReport;
                 frxTicket.ShowPreparedReport;
              end;
           end
           else
           if frxTicket.ComponentCount > 0 then
           begin
              // Imprimir / Enviar por correo electronico
              // frxTicket.Report.PrintOptions.Printer := GetPrinterName(REntorno.Ticketera);
              frxTicket.PrintOptions.Printer := frxPrinters.Printers[REntorno.Etiquetas];
              frxTicket.SelectPrinter;
              DMMain.Log(format('DMLstTickets.Imprimir - FR3 - Modificada a Impresora: %s', [frxTicket.Report.PrintOptions.Printer]));
              frxTicket.PrepareReport;

              // Imprimos si email vacio
              if (Email = '') then
                 frxTicket.PrintPreparedReport('', REntorno.Copias)
              else
              begin
                 // Verificamos el formato del email
                 if (not FormatoEmailValido(Email)) then
                    ShowMessage(_('La direccion de correo electronico no es valida'))
                 else
                 begin
                    nombreFich := format('%s_%d-%s-%.5d.pdf', [_('Ticket'), Ejercicio, Serie, Rit]);
                    rutaFich := ExportarPDF(frxTicket, nombreFich);
                    EnviaEmailPdf(Email, Serie, Ejercicio, Rit, Fecha, nombreFich, rutaFich);
                 end;
              end;
           end;
        1:
        begin
           // Previsualizar
           frxTicket.PrepareReport;
           frxTicket.ShowPreparedReport;
        end;
     end;
  end;

  if (REntorno.TipoListado = 'FRF') then
  begin
     frTicket.LoadFromFIB(REntorno.Formato, str);
     frTicket.Title := TituloIforme;
     DMMain.Log(format('DMLstTickets.Imprimir - FRF - Impresora: %s', ['???']));
     DMMain.Log(format('DMLstTickets.Imprimir - FRF - PrintToDefault: %d', [BoolToInt(frTicket.PrintToDefault)]));
     case Modo of
        0:
           if ((ssShift in FMain.Keystate) or (ssAlt in FMain.Keystate)) then
              frTicket.DesignReport
           else if ssCtrl in FMain.Keystate then
           begin
              if frTicket.ComponentCount > 0 then
              begin
                 frTicket.PrepareReport;
                 frTicket.ShowPreparedReport;
              end;
           end
           else
           if frTicket.ComponentCount > 0 then
           begin
              // Imprimir / Enviar por correo electronico
              // frTicket.ChangePrinter(0, GetPrinterIndex(REntorno.Ticketera));
              frTicket.ChangePrinter(0, REntorno.Etiquetas);
              DMMain.Log(format('DMLstTickets.Imprimir - FRF - Impresora Etiquetas: %d', [REntorno.Etiquetas]));
              frTicket.PrepareReport;

              // Imprimos si email vacio
              if (Email = '') then
                 frTicket.PrintPreparedReport('', REntorno.Copias)
              else
              begin
                 // Verificamos el formato del email
                 if (not FormatoEmailValido(Email)) then
                    ShowMessage(_('La direccion de correo electronico no es valida'))
                 else
                 begin
                    nombreFich := format('%s_%d-%s-%.5d.pdf', [_('Ticket'), Ejercicio, Serie, Rit]);
                    rutaFich := ExportarPDF(frTicket, nombreFich);
                    EnviaEmailPdf(Email, Serie, Ejercicio, Rit, Fecha, nombreFich, rutaFich);
                 end;
              end;
           end;
        1:
        begin
           // Previsualizar
           frTicket.PrepareReport;
           frTicket.ShowPreparedReport;
        end;
     end;
  end;

  if (REntorno.TipoListado = 'HYR') then
  begin
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     try
        case Modo of
           0:
              if ssShift in FMain.Keystate then
              begin
                 HYReport.ValorCodigo := REntorno.Formato;
                 ModoEnter := REntorno.ModoEnter;  // Guardar Modo Enter
                 REntorno.ModoEnter := 0;
                 HYReport.Edit;
                 REntorno.ModoEnter := ModoEnter;  // Restaurar Modo Enter
              end
              else if ssCtrl in FMain.Keystate then
                 HYReport.Preview
              else
              begin
                 HYReport.Print(REntorno.TicketeraPuerto);
              end;
           1: HYReport.Preview;       // Previsualizar
        end;
     except
     end;
     //HYReport.Preview;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstTickets.frTicketGetValue(const ParName: string; var ParValue: variant);
var
  s : string;
  i : integer;
  Letras : TLetra;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'CIF' then
     ParValue := REntorno.CifEmpresa;

  if ParName = 'Forma_Pago' then
     ParValue := DameTituloFormaPago(xFormaPagos.FieldByName('FORMA_PAGO').AsString);

  if ParName = 'TotalE' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE S_MONEDAS_FACTOR_EEC(?EMPRESA, ?EJERCICIO, ?CANAL, ?MONEDA, ?FECHA)';
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['MONEDA'].AsString := REntorno.MonedaEmpresa;
           Params.ByName['FECHA'].AsDateTime := QMCabecera.FieldByName('FECHA').AsDateTime;
           ExecQuery;
           if (FieldByName['FACTOR'].AsFloat <> 0) then
              ParValue := QMCabecera.FieldByName('LIQUIDO').AsFloat / FieldByName['FACTOR'].AsFloat
           else
              ParValue := 0;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'EN_ENTREGAS' then
  begin
     with xEnEntregas do
     begin
        Close;
        Params.ByName['ID_TICKET'].AsInteger := QMCabecera.FieldByName('ID_TICKET').AsInteger;
        ExecQuery;
        if (FieldByName['EN_ENTREGAS'].IsNull) then
           ParValue := '0'
        else
           ParValue := FieldByName['EN_ENTREGAS'].AsString;
        FreeHandle;
     end;
  end;

  if ParName = 'EN_VALES' then
  begin
     with xEnVales do
     begin
        Close;
        Params.ByName['ID_TICKET'].AsInteger := QMCabecera.FieldByName('ID_TICKET').AsInteger;
        ExecQuery;
        if (FieldByName['EN_VALES'].IsNull) then
           ParValue := '0'
        else
           ParValue := FieldByName['EN_VALES'].AsString;
        FreeHandle;
     end;
  end;

  if ParName = 'TasaPortuaria' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(TOTAL_LINEA) FROM GES_TICKET_DETALLE ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' TIPO = ?TIPO AND ');
           SQL.Add(' RIT = ?RIT AND ');
           SQL.Add(' ARTICULO STARTING WITH ''TASA'' ');
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
           Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
           Params.ByName['RIT'].AsInteger := QMCabecera.FieldByName('RIT').AsInteger;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Familia' then
     ParValue := DameFamilia(QMCabecera.FieldByName('ID_FAMILIA').AsInteger);

  if ParName = 'FechaViaje' then
  begin
     s := QMCabecera.FieldByName('FECHA_HORA').AsString;
     ParValue := RecodeDate(Now, StrToInt(Copy(s, 1, 4)), StrToInt(Copy(s, 5, 2)), StrToInt(Copy(s, 7, 2)));
  end;

  if ParName = 'HoraViaje' then
  begin
     s := QMCabecera.FieldByName('FECHA_HORA').AsString;
     ParValue := Copy(s, 10, 2) + ':' + Copy(s, 12, 2);
  end;

  if ParName = 'TurnoEntrega' then
  begin
     // Aseguro que exista la fecha en el calendario
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OR INSERT INTO OPE_CALENDARIO_D ( ');
           SQL.Add(' EMPRESA, CALENDARIO, FECHA, HORARIO) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :CALENDARIO, :FECHA, (SELECT HORARIO ');
           SQL.Add('                                 FROM OPE_CALENDARIO_C ');
           SQL.Add('                                 WHERE ');
           SQL.Add('                                 EMPRESA = :EMPRESA AND ');
           SQL.Add('                                 CALENDARIO = :CALENDARIO)) ');
           SQL.Add('   MATCHING (EMPRESA, CALENDARIO, FECHA) ');
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['CALENDARIO'].AsInteger := 1;
           Params.ByName['FECHA'].AsDateTime := RecodeTime(QMCabecera.FieldByName('FECHA').AsDateTime, 0, 0, 0, 0);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Obtengo la descripcion que contendra el dia en el calendario. Contendrá el turno a entregar
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT COMENTARIO FROM OPE_CALENDARIO_D ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CALENDARIO = :CALENDARIO AND ');
           SQL.Add(' FECHA = :FECHA ');
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['CALENDARIO'].AsInteger := 1;
           Params.ByName['FECHA'].AsDateTime := RecodeTime(QMCabecera.FieldByName('FECHA').AsDateTime, 0, 0, 0, 0);
           ExecQuery;
           i := StrToIntDef(FieldByName['COMENTARIO'].AsString, 0) + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Guardo el turno
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OPE_CALENDARIO_D ');
           SQL.Add(' SET ');
           SQL.Add(' COMENTARIO = :COMENTARIO ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CALENDARIO = :CALENDARIO AND ');
           SQL.Add(' FECHA = :FECHA ');
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['CALENDARIO'].AsInteger := 1;
           Params.ByName['FECHA'].AsDateTime := RecodeTime(QMCabecera.FieldByName('FECHA').AsDateTime, 0, 0, 0, 0);
           Params.ByName['COMENTARIO'].AsString := IntToStr(i);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ParValue := format('%.4d', [i]);
  end;

  if ParName = 'TOTAL_LITERAL' then
  begin
     Letras := TLetra.Create(nil);
     try
        // Datos de configuracion segun moneda
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT * FROM SYS_MONEDAS WHERE MONEDA = :MONEDA';
              Params.ByName['MONEDA'].AsString := REntorno.Moneda{'EUR'};
              ExecQuery;
              Letras.Moneda := LowerCase(FieldByName['TITULO'].AsString);
              Letras.GeneroMasculino := (FieldByName['GENERO_MASCULINO'].AsInteger = 1);
              Letras.Decimales := FieldByName['DEC_VER'].AsInteger;
              Letras.DescDecimales := FieldByName['DESC_DECIMALES'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Numero
        Letras.Numero := QMCabecera.FieldByName('LIQUIDO').Value;

        ParValue := Letras.AsString;
     finally
        Letras.Free;
     end;
  end;

  if ParName = 'TextoQRVerifactu' then
  begin
     if (QMCabecera.FieldByName('ESTADO').AsInteger = 5) then
        ParValue := QMCabecera.FieldByName('INFO_QR').AsString
     else
        ParValue := '';
  end;
end;

procedure TDMLstTickets.frTicketEnterRect(Memo: TStringList; View: TfrView);
var
  s : string;
  Imagen : TImage;
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     // Codigo de Respuesta Rapida (Codigo QR para factura Bolivia)
     if (Memo[0] = '[CodigoRespuestaRapida]') and (View is TfrPictureView) then
     begin
        Imagen := TImage.Create(nil);
        try
           CrearCodigoQR(Imagen.Picture.Bitmap, QMCabecera.FieldByName('SFV_CODIGO_RESPUESTA_RAPIDA').AsString, 3);
           TfrPictureView(View).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     if (Memo[0] = '[QRVerifactu]') and (View is TfrPictureView) then
     begin
        // Devuelvo imagen QR solo si la factura está contabilizada.
        Imagen := TImage.Create(nil);
        try
           if (QMCabecera.FieldByName('ESTADO').AsInteger = 5) then
           begin
              s := QMCabecera.FieldByName('INFO_QR').AsString;
              if (s <> '') then
                 CrearCodigoQR(Imagen.Picture.Bitmap, s, 3);
           end;

           TfrPictureView(View).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;
  end;
end;

procedure TDMLstTickets.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
var
  Cantidad : double;
begin
  // Cabecera del Ticket
  if Source = '[EMPRESA]' then
     Source := REntorno.NombreEmpresa;

  if Source = '[CIF]' then
     Source := 'CIF: ' + REntorno.CifEmpresa;

  if Source = '[TICKET_SERIE]' then
     Source := Format(_('Ticket Nº %d Serie: %s'), [QMCabecera.FieldByName('RIT').AsInteger, QMCabecera.FieldByName('SERIE').AsString]);

  if Source = '[SESION_CAJA_TURNO]' then
     Source := Format(_('Sesión %d Caja %d Turno %d'), [QMCabecera.FieldByName('SESION').AsInteger, QMCabecera.FieldByName('CAJA').AsInteger, QMCabecera.FieldByName('TURNO').AsInteger]);

  if Source = '[CLIENTE]' then
     Source := Format(_('Cliente: %d %s'), [xCliente.FieldByName('CLIENTE').AsInteger, xCliente.FieldByName('TITULO').AsString]);

  if Source = '[DESGLOSE_DTO_CIAL]' then  // Texto formateado
  begin
     if (QMCabecera.FieldByName('I_DTO_LINEAS').AsFloat > 0) then
        Source := Format(_('%s DTO. COMERCIAL DE %s'), [FormatFloat(MascaraN, QMCabecera.FieldByName('BRUTO').AsFloat), FormatFloat(MascaraN, QMCabecera.FieldByName('I_DTO_LINEAS').AsFloat)])
     else
        Source := '';
  end;

  // Detalle
  if Source = '[PVP]' then
     Source := FormatFloat(MascaraN, QMDetalle.FieldByName('PRECIO').AsFloat);

  if Source = '[DTO_LINEA]' then
     Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[TOTAL_LINEA]' then
     Source := FormatFloat(MascaraN, QMDetalle.FieldByName('B_DTO_LINEA').AsFloat);

  // Desglose de IVA
  if Source = '[DESGLOSE_IVA]' then
  begin
     Source := Format(_('%s A %s DE IVA SON %s'),
        [FormatFloat(MascaraN, xDesgloseIVA.FieldByName('S_BASES_DTO').AsFloat),
        FormatFloat(MascaraP, xDesgloseIVA.FieldByName('P_IVA').AsFloat),
        FormatFloat(MascaraN, xDesgloseIVA.FieldByName('I_IVA').AsFloat)]);
  end;

  // Formas de Pago
  if Source = '[FORMA_PAGO]' then
     Source := DameTituloFormaPago(xFormaPagos.FieldByName('FORMA_PAGO').AsString);

  if Source = '[TOTAL_COBRADO]' then
     Source := FormatFloat(MascaraN, xFormaPagos.FieldByName('TOTAL_COBRADO').AsFloat);

  // Pie de Ticket
  if Source = '[TOTAL]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('LIQUIDO').AsFloat);

  if Source = '[ENTREGADO]' then
  begin
     Cantidad := QMCabecera.FieldByName('LIQUIDO').AsFloat + QMCabecera.FieldByName('A_DEVOLVER').AsFloat;
     Source := FormatFloat(MascaraN, Cantidad);
  end;

  if Source = '[A_DEVOLVER]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('A_DEVOLVER').AsFloat);

  if Source = '[TOTAL_EUROS]' then
     if QMCabecera.FieldByName('Moneda').AsString = 'PTS' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE S_MONEDAS_FACTUR_EEC(?EMPRESA, ?EJERCICIO, ?CANAL, ?MONEDA, ?FECHA)';
              Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
              Params.ByName['MONEDA'].AsString := REntorno.MonedaEmpresa;
              Params.ByName['FECHA'].AsDateTime := QMCabecera.FieldByName('FECHA').AsDateTime;
              ExecQuery;
              if (FieldByName['FACTOR'].AsFloat <> 0) then
                 Cantidad := QMCabecera.FieldByName('LIQUIDO').AsFloat / FieldByName['FACTOR'].AsFloat
              else
                 Cantidad := 0;
              Source := Format(_('Total Euros: %s'), [FormatFloat(MascaraE, Cantidad)]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
        Source := '';

  if Source = '[USUARIO]' then
     Source := Format(_('Le ha atendido %s'), [xUsuarios.FieldByName('NOMBRE').AsString]);

  {dji lrk kri - Descuento, que aparezca o no -----------------------------------}
  if Source = '[DESCOMPTE_TITULO]' then
     if ((QMCabecera.FieldByName('I_DTO_PP').AsFloat >= 0.01) or (QMCabecera.FieldByName('I_DTO_PP').AsFloat <= -0.01)) then
        Source := _('DESCOMPTE')
     else
        Source := ' ';
  if Source = '[DESCUENTO]' then
     if ((QMCabecera.FieldByName('I_DTO_PP').AsFloat >= 0.01) or (QMCabecera.FieldByName('I_DTO_PP').AsFloat <= -0.01)) then
        Source := FormatFloat(MascaraN, QMCabecera.FieldByName('B_DTO_LINEAS').AsFloat - QMCabecera.FieldByName('LIQUIDO').AsFloat)
     else
        Source := ' ';
  {------------------------------------------------------------------------------}
end;

function TDMLstTickets.EsCredito: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CGFP.TIPO_EFECTO FROM GES_TICKET_FP TFP ');
        SQL.Add(' JOIN CON_CUENTAS_GES_FP CGFP ');
        SQL.Add(' ON (TFP.EMPRESA = CGFP.EMPRESA AND ');
        SQL.Add(' TFP.EJERCICIO = CGFP.EJERCICIO AND ');
        SQL.Add(' TFP.CANAL = CGFP.CANAL AND ');
        SQL.Add(' TFP.FORMA_PAGO = CGFP.FORMA_PAGO) ');
        SQL.Add(' WHERE ');
        SQL.Add(' TFP.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' TFP.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' TFP.CANAL = ?CANAL AND ');
        SQL.Add(' TFP.SERIE = ?SERIE AND ');
        SQL.Add(' TFP.RIT = ?RIT AND ');
        SQL.Add(' TFP.TIPO = ?TIPO AND ');
        SQL.Add(' CGFP.TIPO_EFECTO = ''CRE'' ');

        Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
        Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
        Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
        Params.ByName['RIT'].AsInteger := QMCabecera.FieldByName('RIT').AsInteger;
        ExecQuery;
        Result := (FieldByName['TIPO_EFECTO'].AsString = 'CRE');
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstTickets.ImprimirEntregaVale(ID: integer; Modo: integer; ImprimirRollo: boolean; ImprimirTicket: boolean = True);
var
  str : string;
  Formato : integer;
begin
  Formato := 0;
  if (Modo = 0) then
     Formato := 622;
  if (Modo = 1) then
     Formato := 623;
  if (Modo = 2) then
     Formato := 625;
  if (Modo = 3) then
     Formato := 627;
  PrepareEntregasVales(ID, Modo);
  HYReport.ControlaLongitud := False;
  if (ImprimirTicket) then
     Imprimir(0, Formato, str, '');
end;

procedure TDMLstTickets.PrepareEntregasVales(ID, Modo: integer);
var
  Usuario : integer;
begin
  Usuario := 0;

  if (Modo = 0) then
  begin
     with xEntregas do
     begin
        Close;
        Params.ByName['ID'].AsInteger := id;
        Open;
     end;

     Usuario := xEntregas.FieldByName('USUARIO_ENTREGA').AsInteger;
  end;

  if (Modo = 1) then
  begin
     with xVales do
     begin
        Close;
        Params.ByName['ID'].AsInteger := id;
        Open;
     end;

     Usuario := xVales.FieldByName('USUARIO_VALE').AsInteger;
  end;

  if (Modo >= 2) then
  begin
     with xReservas do
     begin
        Close;
        Params.ByName['ID'].AsInteger := id;
        Open;
     end;

     Usuario := xReservas.FieldByName('USUARIO_RESERVA').AsInteger;
  end;

  with xUsuarios do
  begin
     Close;
     Params.ByName['USUARIO'].AsInteger := Usuario;
     Open;
  end;

  with xSeries do
  begin
     Close;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Open;
  end;
end;

procedure TDMLstTickets.frxTicketBeforePrint(Sender: TfrxReportComponent);
var
  s : string;
  Imagen : TImage;
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxPictureView) then
  begin
     if (TfrxPictureView(Sender).TagStr = 'Imagen') then
     begin
        DMListados.MostrarImagen(REntorno.ImagenEmpresa, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
     end;

     // Codigo de Respuesta Rapida (Codigo QR para factura Bolivia)
     if (TfrxPictureView(Sender).TagStr = 'CodigoRespuestaRapida') then
     begin
        Imagen := TImage.Create(nil);
        try
           CrearCodigoQR(Imagen.Picture.Bitmap, QMCabecera.FieldByName('SFV_CODIGO_RESPUESTA_RAPIDA').AsString, 3);
           TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     if (TfrxPictureView(Sender).TagStr = 'QRVerifactu') then
     begin
        // Devuelvo imagen QR solo si la factura está contabilizada.
        Imagen := TImage.Create(nil);
        try
           if (QMCabecera.FieldByName('ESTADO').AsInteger = 5) then
           begin
              s := QMCabecera.FieldByName('INFO_QR').AsString;
              CrearCodigoQR(Imagen.Picture.Bitmap, s, 3);
           end;

           TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;
  end;
end;

procedure TDMLstTickets.ImprimirValesDeTicket;
begin
  // Recorremos los vales de un ticket e imprimimos
  with xTicketVales do
  begin
     case QMCabecera.FieldByName('DEVOLUCION').AsInteger of
        1:
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT A.ID_VALE FROM EMP_CLIENTES_VALES A ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' A.ID_DOCUMENTO_DEVOLUCION = ?ID AND ');
           SelectSQL.Add(' A.ESTADO <= 2 ');
           Params.ByName['Id'].AsInteger := QMCabecera.FieldByName('ID_TICKET').AsInteger;
           Open;
        end;
        0:
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT B.ID_VALE FROM EMP_CLIENTES_VALES A ');
           SelectSQL.Add(' LEFT JOIN EMP_CLIENTES_VALES B ');
           SelectSQL.Add(' ON (B.ID_VALE = A.ID_DOCUMENTO_EMISION) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ((A.ID_DOCUMENTO_DEVOLUCION = ?ID) OR (A.ID_DOCUMENTO_CANCELACION = ?ID)) AND ');
           SelectSQL.Add(' B.ESTADO <= 2 ');
           Params.ByName['Id'].AsInteger := QMCabecera.FieldByName('ID_TICKET').AsInteger;
           Open;
        end;
     end;

     // Reabrimos el módulo Listados para que se entere del cambio ticket=>vale
     if (not xTicketVales.IsEmpty) then
     begin
        CierraData(DMListados);
        AbreData(TDMListados, DMListados);
     end;

     while not EOF do
     begin
        DMLstTickets.ImprimirEntregaVale(xTicketVales.FieldByName('ID_VALE').AsInteger, 1, False, True);

        // Finalmente
        CortePapel;
        Next;
     end;
  end;
end;

procedure TDMLstTickets.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulos.Open;
end;

procedure TDMLstTickets.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xArticulos.Close;
end;

procedure TDMLstTickets.EnviaEmailPdf(Email, aSerie: string; aEjercicio, Rit: integer; aFecha: TDateTime; nombreFich, rutaFich: string);
var
  Asunto : string;
  CuerpoMail : TStrings;
begin
  InicializaVariableEmail('TIC');
  with VariableEmail do
  begin
     Ejercicio := aEjercicio;
     Serie := aSerie;
     NumeroDocumento := Rit;
     Fecha := aFecha;
     SuReferencia := '';
     SuPedido := '';
     Folio := '';
     TituloDocTributario := '';
     NombreFichero := nombreFich;
     Matricula := '';

     if (xCliente.FieldByName('CLIENTE').AsInteger > 0) then
     begin
        NombreComercial := xCliente.FieldByName('NOMBRE_COMERCIAL').AsString;
        RazonSocial := xCliente.FieldByName('NOMBRE_R_SOCIAL').AsString;
     end
     else
     begin
        NombreComercial := DameNombreTercerosVarios(QMCabecera.FieldByName('TIPO').AsString, QMCabecera.FieldByName('ID_TICKET').AsInteger);
        RazonSocial := NombreComercial;
     end;
     OrdenTrabajo := 0;
     UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));
  end;

  DamePartesEmail(Asunto, CuerpoMail);
  try
     try
        DMListados.SendMailPDF(Email, CuerpoMail, rutaFich, nombreFich, Asunto);
        ShowMessage(_('Correo enviado'));
     except
        on E: Exception do
        begin
           DMMain.LogFin('DMLstTickets.EnviaEmailPdf' + #13#10 + E.Message);
           ShowMessage(E.Message);
        end;
     end
  finally
     CuerpoMail.Free;
  end;
end;

procedure TDMLstTickets.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xCliente.Open;
  xAbonos.Open;
  xDesgloseIVA.Open;
  xUsuarios.Open;
  xFormaPagos.Open;
end;

procedure TDMLstTickets.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xCliente.Close;
  xAbonos.Close;
  xDesgloseIVA.Close;
  xUsuarios.Close;
  xFormaPagos.Close;
end;

procedure TDMLstTickets.xClienteAfterOpen(DataSet: TDataSet);
begin
  xAgente.Open;
end;

procedure TDMLstTickets.xClienteBeforeClose(DataSet: TDataSet);
begin
  xAgente.Close;
end;

end.
