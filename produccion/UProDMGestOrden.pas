unit UProDMGestOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs,
  FIBTableDataSetRO;

type
  TProDMGestOrden = class(TDataModule)
     QMProOrd: TFIBTableSet;
     QMProOrdEMPRESA: TIntegerField;
     QMProOrdEJERCICIO: TIntegerField;
     QMProOrdCANAL: TIntegerField;
     QMProOrdSERIES: TFIBStringField;
     QMProOrdRIG_OF: TIntegerField;
     QMProOrdSUBORDEN: TIntegerField;
     QMProOrdALMACEN_SAL: TFIBStringField;
     QMProOrdALMACEN_LAN: TFIBStringField;
     QMProOrdALMACEN_ENT: TFIBStringField;
     QMProOrdFECHA_ORD: TDateTimeField;
     QMProOrdCLIENTE: TIntegerField;
     QMProOrdCOMPUESTO: TFIBStringField;
     QMProOrdESCANDALLO: TIntegerField;
     QMProOrdESTADO: TIntegerField;
     QMProOrdPEDIDO: TIntegerField;
     QMProOrdLINEA_PED: TIntegerField;
     QMProOrdFECHA_PED: TDateTimeField;
     QMProOrdUNI_PEDID: TFloatField;
     QMProOrdUNI_MANUAL: TFloatField;
     QMProOrdUNI_TOTAL: TFloatField;
     QMProOrdPRIORIDAD: TIntegerField;
     QMProOrdMERMA: TFloatField;
     QMProOrdUNI_PRODUC: TFloatField;
     QMProOrdUNI_PENDIENTES: TFloatField;
     QMProOrdFECHA_ENTREGA: TDateTimeField;
     QMProOrdFECHA_INI: TDateTimeField;
     QMProOrdFECHA_FIN: TDateTimeField;
     QMProOrdCOSTE_FIJO_PRE: TFloatField;
     QMProOrdCOSTE_VAR_PRE: TFloatField;
     QMProOrdCOSTE_MAT_PRE: TFloatField;
     QMProOrdCOSTE_MO_PRE: TFloatField;
     QMProOrdCOSTE_MAQ_PRE: TFloatField;
     QMProOrdCOSTE_TEX_PRE: TFloatField;
     QMProOrdCOSTE_TOT_PRE: TFloatField;
     QMProOrdCOSTE_FIJO_REAL: TFloatField;
     QMProOrdCOSTE_VAR_REAL: TFloatField;
     QMProOrdCOSTE_MAT_REAL: TFloatField;
     QMProOrdCOSTE_MO_REAL: TFloatField;
     QMProOrdCOSTE_MAQ_REAL: TFloatField;
     QMProOrdCOSTE_TEX_REAL: TFloatField;
     QMProOrdCOSTE_TOT_REAL: TFloatField;
     QMProOrdCOSTE_UNITARIO: TFloatField;
     QMProOrdPRECIO_VENTA: TFloatField;
     QMProOrdHORAS_TOTALES: TFloatField;
     QMProOrdMARGEN_UNI: TFloatField;
     QMProOrdMARGEN_TOTAL: TFloatField;
     QMProOrdOBSERVACIONES: TMemoField;
     QMProOrdVISTOBUENO1: TIntegerField;
     QMProOrdVISTOBUENO2: TIntegerField;
     QMProOrdVISTOBUENO3: TIntegerField;
     QMProOrdTituloCliente: TStringField;
     DSQMProOrd: TDataSource;
     TLocal: THYTransaction;
     QMProOrdSitu: TStringField;
     QMProOrdSITUACION: TIntegerField;
     QMProCierres: TFIBTableSet;
     DSQMProCierres: TDataSource;
     QMProCierresEMPRESA: TIntegerField;
     QMProCierresEJERCICIO: TIntegerField;
     QMProCierresCANAL: TIntegerField;
     QMProCierresSERIES: TFIBStringField;
     QMProCierresRIG: TIntegerField;
     QMProCierresRIG_OF: TIntegerField;
     QMProCierresSUBORDEN: TIntegerField;
     QMProCierresFECHA: TDateTimeField;
     QMProCierresUNDS: TFloatField;
     QMProCierresNOTAS: TMemoField;
     QMProOrdTituloCompuesto: TStringField;
     QMProOrdSELECCIONADA: TIntegerField;
     QLanzarCerrar: THYFIBQuery;
     QMProOrdID_ORDEN: TIntegerField;
     QMNecesidades: TFIBTableSet;
     QMNecesidadesARTICULO: TFIBStringField;
     QMNecesidadesSTOCK: TFloatField;
     QMNecesidadesCANTIDAD: TFloatField;
     QMNecesidadesTOTAL: TFloatField;
     DSQMNecesidades: TDataSource;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProOrdBeforeOpen(DataSet: TDataSet);
     procedure QMProCierresNewRecord(DataSet: TDataSet);
     procedure QMProCierresBeforeInsert(DataSet: TDataSet);
     procedure QMProCierresBeforePost(DataSet: TDataSet);
     procedure QMProOrdCalcFields(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMProOrdSITUACIONChange(Sender: TField);
     procedure QMProOrdAfterOpen(DataSet: TDataSet);
     procedure QMProOrdBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Situacion: integer;
  public
     { Public declarations }
     procedure LanzarCerrar;
     procedure SeleccionarDeseleccionar(Seleccionar: boolean);
     procedure BusquedaCompleja;
     procedure CalculaNecesidadesTotal(almacen: string);
     procedure FiltraSituacion(aSituacion: integer);
     procedure TraspasoTipoLanzamientoS(TipoLanzamiento: integer);
     procedure Lanzar(TipoLanzamiento: integer);
     procedure Reservar;
  end;

var
  ProDMGestOrden : TProDMGestOrden;

implementation

uses UEntorno, UDMMain, StdCtrls, UFParada, UFBusca, UUtiles, UDameDato;

{$R *.dfm}

procedure TProDMGestOrden.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Mascaras
  QMProOrdCOSTE_TOT_REAL.DisplayFormat := MascaraN;
  QMProOrdCOSTE_TOT_PRE.DisplayFormat := MascaraN;

  FiltraSituacion(-1);

  QMNecesidades.Open;
end;

procedure TProDMGestOrden.QMProOrdBeforeOpen(DataSet: TDataSet);
begin
  QMProOrd.Params.ByName['SITUACION'].AsInteger := 0;
end;

procedure TProDMGestOrden.QMProCierresNewRecord(DataSet: TDataSet);
begin
  QMProCierresempresa.Value := QMProOrdEMPRESA.Value;
  QMProCierresEjercicio.Value := QMProOrdEjercicio.Value;
  QMProCierresCanal.Value := QMProOrdCanal.Value;
  QMProCierresSeries.Value := QMProOrdSeries.Value;
  QMProCierresRig_Of.Value := QMProOrdRig_Of.Value;
  QMProCierresSubOrden.Value := QMProOrdSubOrden.Value;
  QMProCierresFECHA.Value := Now;
end;

procedure TProDMGestOrden.QMProCierresBeforeInsert(DataSet: TDataSet);
begin
  if (QMProOrdSITUACION.Value = 0) or (QMProOrdSITUACION.Value = 4) then
     Abort;
end;

procedure TProDMGestOrden.QMProCierresBeforePost(DataSet: TDataSet);
begin
  if (MessageDlg(_('El proceso de cierre es irreversible,') + #13#10 +
     _('¿ Desea continuar ?'), mtConfirmation, [mbOK, mbCancel], 0) = 2) then
     QMProCierres.Cancel;
end;

procedure TProDMGestOrden.QMProOrdCalcFields(DataSet: TDataSet);
begin
  QMProOrd['TituloCliente'] := DameTituloCliente(QMProOrdCLIENTE.AsInteger);
  QMProOrd['TituloCompuesto'] := DameTituloArticulo(QMProOrdCOMPUESTO.AsString);

  case QMProOrd['SITUACION'] of
     0: QMProOrd['Situ'] := _('Deslanzada');
     1: QMProOrd['Situ'] := _('Lanzada');
     2: QMProOrd['Situ'] := _('Lanzada + Reservada');
     3: QMProOrd['Situ'] := _('Cerrada Parcialmente');
     4: QMProOrd['Situ'] := _('Cerrada Totalmente');
  end;
end;

procedure TProDMGestOrden.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMGestOrden.QMProOrdSITUACIONChange(Sender: TField);
begin
  QMProOrd.Refresh;
end;

procedure TProDMGestOrden.LanzarCerrar;
begin
  { TODO : Hay que modificar la forma de reservar en PRO_LANZAR_CERRAR_ORDENES }
  raise Exception.Create(_('No implentendao (PRO_LANZAR_CERRAR_ORDENES)'));

  TFParada.Create(Self).ExecQuery(QLanzarCerrar, _('Lanzando y reservando las ordenes seleccionadas'));
  QLanzarCerrar.Transaction.CommitRetaining;
  QLanzarCerrar.FreeHandle;
  QMProOrd.Close;
  QMProOrd.Open;
end;

procedure TProDMGestOrden.SeleccionarDeseleccionar(Seleccionar: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD ');
        SQL.Add(' SET SELECCIONADA = :SELECCIONADA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' SELECCIONADA <> :SELECCIONADA ');
        if (Situacion <> -1) then
        begin
           SQL.Add(' AND SITUACION = :SITUACION ');
           Params.ByName['SITUACION'].AsInteger := Situacion;
        end;
        Params.ByName['SELECCIONADA'].AsInteger := BoolToInt(Seleccionar);
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.Value;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.Value;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMProOrd.Close;
  QMProOrd.Open;
end;

procedure TProDMGestOrden.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProOrd, '00000');
end;

procedure TProDMGestOrden.CalculaNecesidadesTotal(almacen: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_CALCULA_NECESIDADES_TOTAL(:EMPRESA, :EJERCICIO, :CANAL, :ALMACEN)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := almacen;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMNecesidades.Close;
  QMNecesidades.Open;
end;

procedure TProDMGestOrden.FiltraSituacion(aSituacion: integer);
begin
  Situacion := aSituacion;

  with QMProOrd do
  begin
     Close;
     Params.ByName['SITUACION'].AsInteger := Situacion;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIES'].AsString := REntorno.Serie;
     Open;
  end;
end;

procedure TProDMGestOrden.QMProOrdAfterOpen(DataSet: TDataSet);
begin
  QMProCierres.Open;
end;

procedure TProDMGestOrden.QMProOrdBeforeClose(DataSet: TDataSet);
begin
  QMProCierres.Close;
end;

procedure TProDMGestOrden.TraspasoTipoLanzamientoS(TipoLanzamiento: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD ');
        SQL.Add(' SET ');
        SQL.Add(' TIPO_LANZAMIENTO = :TIPO_LANZAMIENTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIES = :SERIES AND ');
        SQL.Add(' RIG_OF = :RIG_OF AND ');
        SQL.Add(' SUBORDEN = :SUBORDEN ');
        Params.ByName['TIPO_LANZAMIENTO'].AsInteger := TipoLanzamiento;
        Params.ByName['EMPRESA'].AsInteger := QMProOrdEMPRESA.Value;
        Params.ByName['EJERCICIO'].AsInteger := QMProOrdEJERCICIO.Value;
        Params.ByName['CANAL'].AsInteger := QMProOrdCANAL.Value;
        Params.ByName['SERIES'].AsString := QMProOrdSERIES.Value;
        Params.ByName['RIG_OF'].AsInteger := QMProOrdRIG_OF.Value;
        Params.ByName['SUBORDEN'].AsInteger := QMProOrdSUBORDEN.Value;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMGestOrden.Lanzar(TipoLanzamiento: integer);
begin
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE PRO_LANZAR_ORDEN (:ID_ORDEN, :ENTRADA, :TIPO_LANZAMIENTO, :FECHA) ');
           Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['TIPO_LANZAMIENTO'].AsInteger := TipoLanzamiento;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     on E: Exception do
     begin
        ShowMessage(_('Ha ocurrido un error al generar el lanzamiento.') + #13#10 + E.Message);
     end;
  end;
end;

procedure TProDMGestOrden.Reservar;
var
  IdReserva : integer;
begin
  raise Exception.Create(_('No implementado. Hay que crear registro de reserva'));

  IdReserva := 0;

  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE PRO_RESERVAR_ORDEN(:ID_ORDEN, :ENTRADA, :ID_RESERVA) ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
           Params.ByName['ID_RESERVA'].AsFloat := IdReserva;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     on E: Exception do
     begin
        ShowMessage(_('Ha ocurrido un error al generar la reserva.') + #13#10 + E.Message);

        // Si hay algun problema, borro la cabecera de reserva
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'DELETE FROM PRO_ORD_RESERVA WHERE ID_ORDEN = :ID_ORDEN AND ID_RESERVA =  :ID_RESERVA';
              Params.ByName['ID_ORDEN'].AsInteger := QMProOrdID_ORDEN.AsInteger;
              Params.ByName['ID_RESERVA'].AsFloat := IdReserva;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

end.
