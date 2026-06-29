unit UProDMPedidosOrd;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery,
  DB, FIBDataSet, FIBTableDataSet, FIBDataSetRO, Dialogs, FIBDataSetRW;

type
  TProDMPedidosOrd = class(TDataModule)
     QMDetallePedidos: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMDetallePedidos: TDataSource;
     DSQMProPedidosOrd: TDataSource;
     QMDetallePedidosEMPRESA: TIntegerField;
     QMDetallePedidosEJERCICIO: TIntegerField;
     QMDetallePedidosCANAL: TIntegerField;
     QMDetallePedidosSERIE: TFIBStringField;
     QMDetallePedidosTIPO: TFIBStringField;
     QMDetallePedidosRIG: TIntegerField;
     QMDetallePedidosLINEA: TIntegerField;
     QMDetallePedidosARTICULO: TFIBStringField;
     QMDetallePedidosTITULO: TFIBStringField;
     QMDetallePedidosUNIDADES: TFloatField;
     QMDetallePedidosPRECIO: TFloatField;
     QMDetallePedidosB_IMPONIBLE: TFloatField;
     QMDetallePedidosPRO_UNIDADES: TFloatField;
     QMDetallePedidosPRO_B_IMPONIBLE: TFloatField;
     QMDetallePedidosNOTAS: TMemoField;
     QMDetallePedidosMARCA: TIntegerField;
     QMDetallePedidosESTADO: TIntegerField;
     QMDetallePedidosCLIENTE: TIntegerField;
     QMDetallePedidosALMACEN: TFIBStringField;
     QMDetallePedidosFECHA_PEDIDO: TDateTimeField;
     QMDetallePedidosESCANDALLO: TIntegerField;
     QMDetallePedidosENTRADA: TIntegerField;
     QMDetallePedidosSITUACION: TStringField;
     QMDetallePedidosUDS_PRODUCIDAS: TFloatField;
     QMProPedidosOrd: TFIBTableSet;
     QMProPedidosOrdSITUACION: TIntegerField;
     QMProPedidosOrdFECHA: TDateTimeField;
     QMProPedidosOrdUNIDADES: TFloatField;
     QMProPedidosOrdNOTAS: TMemoField;
     QMProPedidosOrdUDS_MANUAL: TFloatField;
     QMProPedidosOrdSITUACION_STR: TStringField;
     TUpdate: THYTransaction;
     procedure QMDetallePedidosCalcFields(DataSet: TDataSet);
     procedure QMProPedidosOrdCalcFields(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDetallePedidosAfterOpen(DataSet: TDataSet);
     procedure QMDetallePedidosBeforeClose(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BorraRelacion;
     procedure Filtra(Estado: integer);
     procedure Cerrar;
     procedure Marcar(Marca: integer);
  end;

var
  ProDMPedidosOrd : TProDMPedidosOrd;

implementation

uses UDMMain, UEntorno, UUtiles, UProFMPedidosOrdSelec, UFormGest;

{$R *.dfm}

procedure TProDMPedidosOrd.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMPedidosOrd.QMDetallePedidosCalcFields(DataSet: TDataSet);
begin
  case QMDetallePedidos['ESTADO'] of
     0: QMDetallePedidos['SITUACION'] := _('Pendiente');
     1: QMDetallePedidos['SITUACION'] := _('En proceso');
     2: QMDetallePedidos['SITUACION'] := _('Finalizada');
  end;
end;

procedure TProDMPedidosOrd.QMProPedidosOrdCalcFields(DataSet: TDataSet);
begin
  case QMProPedidosOrdSITUACION.AsInteger of
     0: QMProPedidosOrdSITUACION_STR.AsString := _('Deslanzada');
     1: QMProPedidosOrdSITUACION_STR.AsString := _('Lanzada');
     2: QMProPedidosOrdSITUACION_STR.AsString := _('Lanzada + Reserva');
     3: QMProPedidosOrdSITUACION_STR.AsString := _('Terminada');
  end;
end;

procedure TProDMPedidosOrd.BorraRelacion;
begin
  if (QMDetallePedidosESTADO.AsInteger = 0) and
     (ConfirmaMensaje(_('¿Desea borrar la relación?'))) then
     QMDetallePedidos.Delete;
end;

procedure TProDMPedidosOrd.QMDetallePedidosAfterOpen(DataSet: TDataSet);
begin
  QMProPedidosOrd.Open;
end;

procedure TProDMPedidosOrd.QMDetallePedidosBeforeClose(DataSet: TDataSet);
begin
  QMProPedidosOrd.Close;
end;

procedure TProDMPedidosOrd.Filtra(Estado: integer);
begin
  with QMDetallePedidos do
  begin
     if (State in [dsEdit, dsInsert]) then
     begin
        Edit;
        QMDetallePedidosMARCA.AsInteger := 0;
        Post;
     end;

     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['ESTADO'].AsInteger := Estado;
     Open;
  end;
end;

procedure TProDMPedidosOrd.DataModuleDestroy(Sender: TObject);
begin
  if (QMDetallePedidos.State in [dsEdit, dsInsert]) then
     QMDetallePedidos.Cancel;
end;

procedure TProDMPedidosOrd.Cerrar;
var
  IdCab, CantidadPedidos : integer;
begin
  with QMDetallePedidos do
  begin
     if (RecordCount > 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT COUNT(*) ');
              SQL.Add(' FROM PRO_ORD ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' EJERCICIO = :EJERCICIO AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' SERIES = :SERIES AND ');
              SQL.Add(' PEDIDO = :RIG AND ');
              SQL.Add(' LINEA_PED = :LINEA ');
              // SQL.Add(' AND ESTADO = 0 ');
              Params.ByName['EMPRESA'].AsInteger := QMDetallePedidosEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMDetallePedidosEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMDetallePedidosCANAL.AsInteger;
              Params.ByName['SERIES'].AsString := QMDetallePedidosSERIE.AsString;
              Params.ByName['RIG'].AsInteger := QMDetallePedidosRIG.AsInteger;
              Params.ByName['LINEA'].AsInteger := QMDetallePedidosLINEA.AsInteger;
              ExecQuery;
              CantidadPedidos := FieldByName['COUNT'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if ((QMDetallePedidosESTADO.AsInteger = 0) and (CantidadPedidos > 0)) then
        begin
           ShowMessage(Format(_('El pedido %d tiene %d OF creadas y pendientes de lanzar.' + #13#10 + 'Debe lanzar la/s OF desde Mant. de Órdenes de Fabricación'), [QMDetallePedidosRIG.AsInteger, CantidadPedidos]));
           Cancel;
        end
        else
        begin
           if (State in [dsEdit, dsInsert]) then
              Post;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE PRO_INSERT_CAB_LANZA_MASIV (:FECHA)';
                 Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
                 ExecQuery;
                 IdCab := FieldByName['ID_CAB'].AsInteger;
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
                 SQL.Text := 'SELECT COUNT(*) FROM PRO_DET_PEDIDOS_ORD WHERE MARCA = 1';
                 ExecQuery;
                 if (FieldByName['COUNT'].AsInteger > 0) then
                 begin
                    AbreForm(TProFMPedidosOrdSelec, ProFMPedidosOrdSelec);
                    ProFMPedidosOrdSelec.Inicializa(IdCab);
                 end
                 else
                    ShowMessage(_('Debe seleccionar un registro'));
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  end;
end;

procedure TProDMPedidosOrd.Marcar(Marca: integer);
var
  BM : TBookmark;
begin
  with QMDetallePedidos do
  begin
     if (QMDetallePedidosESTADO.Value = 1) or
        (QMDetallePedidosESTADO.Value = 0) then
     begin
        Cancel;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE PRO_DET_PEDIDOS_ORD ');
              SQL.Add(' SET ');
              SQL.Add(' MARCA = :MARCA ');
              SQL.Add(' WHERE ');
              SQL.Add(' ESTADO = :ESTADO AND ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' EJERCICIO = :EJERCICIO AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' SERIE = :SERIE AND ');
              SQL.Add(' RIG = :RIG AND ');
              SQL.Add(' LINEA = :LINEA ');
              Params.ByName['ESTADO'].AsInteger := QMDetallePedidosESTADO.AsInteger;
              Params.ByName['EMPRESA'].AsInteger := QMDetallePedidosEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMDetallePedidosEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMDetallePedidosCANAL.AsInteger;
              Params.ByName['SERIE'].AsString := QMDetallePedidosSERIE.AsString;
              Params.ByName['RIG'].AsInteger := QMDetallePedidosRIG.AsInteger;
              Params.ByName['LINEA'].AsInteger := QMDetallePedidosLINEA.AsInteger;
              Params.ByName['MARCA'].AsInteger := Marca;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     BM := GetBookmark;
     try
        DisableControls;
        Close;
        Open;
        GotoBookmark(BM);
     finally
        EnableControls;
        FreeBookmark(BM);
     end;
  end;
end;

end.
