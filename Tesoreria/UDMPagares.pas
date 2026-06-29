unit UDMPagares;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UHYTickets, FIBDatabase,
  UFIBModificados, CVBNorma19CSB, Math, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, HYFIBQuery, FIBDataSetRO;

type
  TDMPagares = class(TDataModule)
     QMPagares: TFIBTableSet;
     DSQMPagares: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     DSxInfoActualizada: TDataSource;
     xInfoActualizada: TFIBDataSetRO;
     QMPagaresEMPRESA: TIntegerField;
     QMPagaresEJERCICIO: TIntegerField;
     QMPagaresCANAL: TIntegerField;
     QMPagaresPAGARE: TFIBStringField;
     QMPagaresCOD_CLI_PRO: TIntegerField;
     QMPagaresTIPO_TERCERO: TFIBStringField;
     QMPagaresDESCRIPCION: TFIBStringField;
     QMPagaresLUGAR_LIBRAMIENTO: TFIBStringField;
     QMPagaresFECHA_LIBRAMIENTO: TDateTimeField;
     QMPagaresFECHA_VENCIMIENTO: TDateTimeField;
     QMPagaresBANCO: TIntegerField;
     QMPagaresIMPORTE: TFloatField;
     QMPagaresCONTABILIZADO: TIntegerField;
     QMPagaresPAGADO: TIntegerField;
     QMPagaresRIC_CONTABILIZADO: TIntegerField;
     QMPagaresASIENTO_CONTABILIZADO: TIntegerField;
     QMPagaresRIC_PAGADO: TIntegerField;
     QMPagaresASIENTO_PAGADO: TIntegerField;
     xInfoActualizadaIMPORTE: TFloatField;
     xInfoActualizadaPAGADO: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSIGNO: TFIBStringField;
     QMDetalleREGISTRO: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCOD_CLI_PRO: TIntegerField;
     QMDetalleVENCIMIENTO: TDateTimeField;
     QMDetalleCTA_PAGO: TFIBStringField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleLIQUIDO_CANAL: TFloatField;
     QMDetallePAGADO: TIntegerField;
     QMDetalleIMPAGADO: TIntegerField;
     QMDetalleFORMA_PAGO: TFIBStringField;
     QMDetalleTIPO_EFECTO: TFIBStringField;
     QMDetalleACEPTADO: TIntegerField;
     QMDetalleREMESAR: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleREMESA: TIntegerField;
     QMDetalleDOC_NUMERO: TIntegerField;
     QMDetalleDOC_SERIE: TFIBStringField;
     QMDetalleDOC_FECHA: TDateTimeField;
     QMDetalleDOC_TIPO: TFIBStringField;
     QMDetalleRIC: TIntegerField;
     QMDetalleRIVA: TIntegerField;
     QMDetalleFECHA_CIERRE: TDateTimeField;
     QMDetalleESTADO_RECIBO: TFIBStringField;
     QMDetalleRECIBIDO: TIntegerField;
     QMDetalleCONFIRMING: TIntegerField;
     QMDetallePAGARE: TFIBStringField;
     QMDetallePAGARE_AUTOMATICO: TIntegerField;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleliquido_moneda: TFloatField;
     xInfoActualizadaCONTABILIZADO: TIntegerField;
     QMPagaresTIPO_ASIENTO_KRI: TFIBStringField;
     TUpdate: THYTransaction;
     QMPagaresSALDO_DEUDOR: TFloatField;
     QMPagaresSALDO_ACREEDOR: TFloatField;
     QMPagaresSALDO: TFloatField;
     QMDetallePAGO_AUTORIZADO: TIntegerField;
     procedure DMPagaresCreate(Sender: TObject);
     procedure DMPagaresDestroy(Sender: TObject);
     procedure QMPagaresAfterOpen(DataSet: TDataSet);
     procedure QMPagaresBeforePost(DataSet: TDataSet);
     procedure QMPagaresNewRecord(DataSet: TDataSet);
     procedure QMPagaresAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMPagaresCOD_CLI_PROChange(Sender: TField);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPagaresTIPO_ASIENTO_KRIChange(Sender: TField);
     procedure QMPagaresCalcFields(DataSet: TDataSet);
     procedure QMPagaresBeforeScroll(DataSet: TDataSet);
     procedure QMPagaresBANCOChange(Sender: TField);
  private
     { Private declarations }
     TipoTercero, Tipo, Tipo2, Tipo3, Tipo4, Signo: string;
     FCalcularSaldo: boolean;
     LocalMascaraN: string;
     procedure EstableceTiposDocumento;
     function DamePagare(Banco: integer): integer;
     function DameLugar: string;
     procedure SetCalcularSaldo(const Value: boolean);
  public
     { Public declarations }
     procedure MostrarRecibosDisponibles;
     procedure SeleccionaTodos;
     procedure CierraPagare;
     procedure AbrePagare;
     procedure FiltraDetalle;
     procedure CambiaCod_Pro(Tipo: string);
     function Detalle: boolean;
     function Contabilizado: boolean;
     procedure MostrarCartaPago(Modo: smallint);
     procedure DespagaPagare;
     procedure PagaPagare;
     procedure ContabilizaPagares;
     procedure PagaPagares;
     procedure BusquedaCompleja;
     procedure CierraDetalle;
     property CalcularSaldo: boolean Read FCalcularSaldo Write SetCalcularSaldo;
  end;

var
  DMPagares : TDMPagares;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles, UFormGest, UDMLSTPagares, UDameDato;

{$R *.DFM}

procedure TDMPagares.DMPagaresCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMPagares, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMPagares, '11100', True);
  TipoTercero := 'PRO';
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
end;

procedure TDMPagares.DMPagaresDestroy(Sender: TObject);
begin
  TLocal.Commit; // Para saltarnos el onchange del banco en el formulario
end;

procedure TDMPagares.QMPagaresAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  QMDetalle.Open;
end;

procedure TDMPagares.QMPagaresBeforePost(DataSet: TDataSet);
begin
  QMPagaresTIPO_TERCERO.AsString := TipoTercero;
  with DataSet do
  begin
     if (State = dsInsert) then
     begin
        if ((QMPagaresPAGARE.AsString = '') or (QMPagaresPAGARE.IsNull)) then
        begin
           ShowMessage(_('Es necesario el código de Pagaré'));
           DisableControls;
           try
              Cancel;
           finally
              EnableControls;
           end;
        end;
     end;
  end;
end;

procedure TDMPagares.QMPagaresNewRecord(DataSet: TDataSet);
var
  Pagare : integer;
begin
  QMPagaresEMPRESA.AsInteger := REntorno.Empresa;
  QMPagaresEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPagaresCANAL.AsInteger := REntorno.Canal;
  QMPagaresFECHA_LIBRAMIENTO.AsDateTime := REntorno.FechaTrab;
  QMPagaresFECHA_VENCIMIENTO.AsDateTime := REntorno.FechaTrab;
  QMPagaresBANCO.AsInteger := DameBancoDefecto;
  QMPagaresIMPORTE.AsFloat := 0;
  QMPagaresPAGADO.AsInteger := 0;
  QMPagaresCONTABILIZADO.AsInteger := 0;
  Pagare := DamePagare(QMPagaresBANCO.AsInteger);
  if (Pagare > 0) then
     QMPagaresPAGARE.AsString := IntToStr(Pagare + 1);
  QMPagaresLUGAR_LIBRAMIENTO.AsString := DameLugar;
  if (Self.signo = 'C') then
     QMPAgaresTIPO_ASIENTO_KRI.AsString := REntorno.Asiento_PAG_C
  else
     QMPagaresTIPO_ASIENTO_KRI.AsString := REntorno.Asiento_PAG_P;
end;

function TDMPagares.DamePagare(Banco: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(PAGARE) FROM EMP_CARTERA_PAGARES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' BANCO = ?BANCO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := Banco;
        ExecQuery;
        Result := StrToIntDef(FieldByName['MAX'].AsString, 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPagares.QMPagaresAfterScroll(DataSet: TDataSet);
begin
  TipoTercero := QMPagaresTIPO_TERCERO.AsString;
  EstableceTiposDocumento;

  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA_PAGARES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND EJERCICIO <= ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND SIGNO = ?SIGNO AND PAGARE = ?PAGARE AND PAGARE_AUTOMATICO = 2 ');
     SelectSQL.Add(' AND COD_CLI_PRO = ?COD_CLI_PRO');
     SelectSQL.Add(' AND ((DOC_TIPO = ?TIPO) OR (DOC_TIPO = ?TIPO2) OR (DOC_TIPO = ?TIPO3) OR (DOC_TIPO = ?TIPO4))');
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['TIPO2'].AsString := Tipo2;
     Params.ByName['TIPO3'].AsString := Tipo3;
     Params.ByName['TIPO4'].AsString := Tipo4;
     Params.ByName['SIGNO'].AsString := Signo;
     Open;
  end;
end;

procedure TDMPagares.MostrarRecibosDisponibles;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA_PAGARES ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ((EMPRESA = ?EMPRESA) AND (EJERCICIO <= ?EJERCICIO) AND (CANAL = ?CANAL) ');
        SelectSQL.Add(' AND ((PAGARE = '''' AND PAGO_AUTORIZADO = 1) OR (PAGARE = ?PAGARE)) ');
        SelectSQL.Add(' AND (PAGADO = 0) AND (COD_CLI_PRO = ?COD_CLI_PRO) ');
        SelectSQL.Add(' AND ((DOC_TIPO = ?TIPO) OR (DOC_TIPO = ?TIPO2) OR (DOC_TIPO = ?TIPO3) OR (DOC_TIPO = ?TIPO4))) ');
        Params.ByName['PAGARE'].AsString := QMPagaresPAGARE.AsString;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['TIPO2'].AsString := Tipo2;
        Params.ByName['TIPO3'].AsString := Tipo3;
        Params.ByName['TIPO4'].AsString := Tipo4;
        Params.ByName['COD_CLI_PRO'].AsInteger := QMPagaresCOD_CLI_PRO.AsInteger;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMPagares.QMDetalleAfterPost(DataSet: TDataSet);
var
  Titulo : string;
begin
  xInfoActualizada.Close;
  xInfoActualizada.Open;

  // Si estoy marcando, debo verificar que el saldo de la cuenta sea mayor que el importe marcado
  if (QMDetallePAGARE.AsString = QMPagaresPAGARE.AsString) then
  begin
     if (QMPagaresSALDO.AsFloat > xInfoActualizadaIMPORTE.AsFloat) then
     begin
        if (QMPagaresTIPO_TERCERO.AsString = 'PRO') then
           Titulo := DameTituloProveedor(QMPagaresCOD_CLI_PRO.AsInteger)
        else
        if (QMPagaresTIPO_TERCERO.AsString = 'ACR') then
           Titulo := DameTituloAcreedor(QMPagaresCOD_CLI_PRO.AsInteger)
        else
           Titulo := DameTituloCliente(QMPagaresCOD_CLI_PRO.AsInteger);

        ShowMessage(Format(_('El saldo contable de %s es menor al importe a pagar.'), [Titulo]));
     end;
  end;
end;

procedure TDMPagares.SeleccionaTodos;
begin
  if QMDetalle.RecordCount > 0 then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE VER_CARTERA_PAGARES ');
           SQL.Add(' SET PAGARE = ?PAGARE ');
           SQL.Add(' WHERE ');
           QMDetalle.DameFiltroSelect(SQL);
           if Params.ByName['EMPRESA'] <> nil then
           begin
              Params.ByName['EMPRESA'].AsInteger := QMPagaresEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMPagaresEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMPagaresCANAL.AsInteger;
           end;
           Params.ByName['PAGARE'].AsString := QMPagaresPAGARE.AsString;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['TIPO2'].AsString := Tipo2;
           Params.ByName['TIPO3'].AsString := Tipo3;
           Params.ByName['TIPO4'].AsString := Tipo4;
           Params.ByName['COD_CLI_PRO'].AsInteger := QMPagaresCOD_CLI_PRO.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMDetalle.DisableControls;
     try
        QMDetalle.Close;
        QMDetalle.Open;
     finally
        QMDetalle.EnableControls;
     end;

     xInfoActualizada.Close;
     xInfoActualizada.Open;
  end;
end;

procedure TDMPagares.CierraPagare;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_CONTABILIZA_PAGARE(?EMPRESA, ?EJERCICIO, ?CANAL, ?PAGARE, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMPagaresEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPagaresEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPagaresCANAL.AsInteger;
        Params.ByName['PAGARE'].AsString := QMPagaresPAGARE.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPagares.Refresh;
  QMPagaresAfterScroll(QMPagares); {dji lrk kri - para refrescar el detalle y que solo queden los del pagare}
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMPagares.AbrePagare;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESCONTABILIZA_PAGARE(?EMPRESA, ?EJERCICIO, ?CANAL, ?PAGARE, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMPagaresEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPagaresEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPagaresCANAL.AsInteger;
        Params.ByName['PAGARE'].AsString := QMPagaresPAGARE.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPagares.Refresh;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMPagares.FiltraDetalle;
var
  orden : string;
  resultado : integer;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        orden := OrdenadoPor;
        Ordenar('');
        resultado := TFBusca.Create(Self).SeleccionaBusqueda(QMDetalle, '11100', False);
        if (resultado = mrOk) then
        begin
           if Active then
              Close;
           SelectSQL.Add(' AND ((PAGARE = '''' AND PAGO_AUTORIZADO = 1) OR (PAGARE = ?PAGARE)) ');
           SelectSQL.Add(' AND (PAGADO = 0) AND (COD_CLI_PRO = ?COD_CLI_PRO) ');
           SelectSQL.Add(' AND ((DOC_TIPO = ?TIPO) OR (DOC_TIPO = ?TIPO2) OR (DOC_TIPO = ?TIPO3) OR (DOC_TIPO = ?TIPO4)) ');
           SelectSQL.Add(' OR ((PAGADO = 1) AND (PAGARE = ?PAGARE) AND (PAGARE_AUTOMATICO = 2)) ');
           Params.ByName['PAGARE'].AsString := QMPagaresPAGARE.AsString;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['TIPO2'].AsString := Tipo2;
           Params.ByName['TIPO3'].AsString := Tipo3;
           Params.ByName['TIPO4'].AsString := Tipo4;
           Params.ByName['COD_CLI_PRO'].AsInteger := QMPagaresCOD_CLI_PRO.AsInteger;
           Ordenar(orden);
           Open;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMPagares.CambiaCod_Pro(Tipo: string);
begin
  TipoTercero := Tipo;
  EstableceTiposDocumento;
end;

function TDMPagares.Detalle: boolean;
begin
  Result := not QMDetalle.IsEmpty;
end;

procedure TDMPagares.QMPagaresCOD_CLI_PROChange(Sender: TField);
begin
  if (detalle and (QMPagares.State = dsEdit)) then
     QMPagares.Cancel;
end;

procedure TDMPagares.EstableceTiposDocumento;
begin
  if TipoTercero = 'CLI' then
  begin
     Tipo := 'FAC';
     Tipo2 := 'AGC';
     Tipo3 := 'NRC';
     Tipo4 := 'AFC';
     Signo := 'C';
  end
  else
  if TipoTercero = 'PRO' then
  begin
     Tipo := 'FAP';
     Tipo2 := 'AGP';
     Tipo3 := 'NRP';
     Tipo4 := 'AFP';
     Signo := 'P';
  end
  else
  if TipoTercero = 'ACR' then
  begin
     Tipo := 'FCR';
     Tipo2 := 'AGA';
     Tipo3 := 'NRA';
     Tipo4 := 'AFA';
     Signo := 'P';
  end;
end;

procedure TDMPagares.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMPagares.State = dsEdit) or (QMPagares.State = dsInsert)) then
     QMPagares.Post;

  if QMDetalle.State = dsInsert then
     DataSet.Cancel;
end;

procedure TDMPagares.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  if ((QMPagares.State = dsEdit) or (QMPagares.State = dsInsert)) then
     QMPagares.Post;
  if (Contabilizado) then
     raise Exception.CreateFmt(_('Pagaré contabilizado'), []);
end;

function TDMPagares.DameLugar: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT LUGAR_LIBRAMIENTO FROM EMP_CARTERA_PAGARES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' PAGARE = (SELECT MAX(PAGARE) FROM EMP_CARTERA_PAGARES WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['LUGAR_LIBRAMIENTO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPagares.MostrarCartaPago(Modo: smallint);
begin
  if (QMPagares.RecordCount > 0) then  // Si hay datos mostramos el listado
  begin
     AbreData(TDMLstPagares, DMLstPagares);
     DMLstPagares.MostrarCartaPago(QMPagaresPAGARE.AsString, Modo);
     CierraData(DMLstPagares);
  end;
end;

procedure TDMPagares.QMDetalleLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMDetalleMONEDA.AsString, 1),
     QMDetalleLIQUIDO.AsFloat);
end;

procedure TDMPagares.PagaPagare;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_PAGA_PAGARE(?EMPRESA, ?EJERCICIO, ?CANAL, ?PAGARE, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMPagaresEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPagaresEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPagaresCANAL.AsInteger;
        Params.ByName['PAGARE'].AsString := QMPagaresPAGARE.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPagares.Refresh;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMPagares.DespagaPagare;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESPAGA_PAGARE(?EMPRESA, ?EJERCICIO, ?CANAL, ?PAGARE, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMPagaresEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPagaresEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPagaresCANAL.AsInteger;
        Params.ByName['PAGARE'].AsString := QMPagaresPAGARE.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPagares.Refresh;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMPagares.PagaPagares;
begin
  if QMPagares.RecordCount > 0 then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_PAGA_PAGARES(?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA, ?ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH + 1;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMPagares.Refresh;
     xInfoActualizada.Close;
     xInfoActualizada.Open;
  end;
end;

procedure TDMPagares.ContabilizaPagares;
begin
  if QMPagares.RecordCount > 0 then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_CONTABILIZA_PAGARES(?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA, ?ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH + 1;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMPagares.Refresh;
     xInfoActualizada.Close;
     xInfoActualizada.Open;
  end;
end;

procedure TDMPagares.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPagares, '11100', 1 = 1);
end;

procedure TDMPagares.QMPagaresTIPO_ASIENTO_KRIChange(Sender: TField);
begin
  if (Self.signo = 'C') then
     REntorno.Asiento_PAG_C := Sender.AsString
  else
     REntorno.Asiento_PAG_P := Sender.AsString;
end;

function TDMPagares.Contabilizado: boolean;
begin
  Result := False;
  if (QMPagares.Active) then
     Result := QMPagaresCONTABILIZADO.AsInteger = 1;
end;

procedure TDMPagares.CierraDetalle;
begin
  QMDetalle.Close;
end;

procedure TDMPagares.QMPagaresCalcFields(DataSet: TDataSet);
var
  SaldoDeudor : double;
  SaldoAcreedor : double;
  Saldo : double;
  Tipo : string;
begin
  /// Calculo los saldos contables.

  SaldoDeudor := 0;
  SaldoAcreedor := 0;
  Saldo := 0;
  if FCalcularSaldo then
  begin
     if QMPagaresTIPO_TERCERO.AsString = 'PRO' then
        Tipo := 'P'
     else
     if QMPagaresTIPO_TERCERO.AsString = 'ACR' then
        Tipo := 'A'
     else
        Tipo := 'C';
     DMMain.DameSaldoCliPro(' ', Tipo, QMPagaresCOD_CLI_PRO.AsInteger, SaldoDeudor, SaldoAcreedor, Saldo);
  end;
  QMPagaresSALDO_DEUDOR.AsFloat := SaldoDeudor;
  QMPagaresSALDO_ACREEDOR.AsFloat := SaldoAcreedor;
  QMPagaresSALDO.AsFloat := Saldo;
end;

procedure TDMPagares.SetCalcularSaldo(const Value: boolean);
begin
  FCalcularSaldo := Value;
  QMPagaresCalcFields(QMPagares);
end;

procedure TDMPagares.QMPagaresBeforeScroll(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

procedure TDMPagares.QMPagaresBANCOChange(Sender: TField);
var
  Pagare : integer;
begin
  Pagare := DamePagare(QMPagaresBANCO.AsInteger);
  if (Pagare > 0) then
     QMPagaresPAGARE.AsString := IntToStr(Pagare + 1);
end;

end.
