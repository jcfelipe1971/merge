unit UDMPedidosAlquiler;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMPedidos, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery,
  UComponentesBusquedaFiltrada, FIBDataSetRO, DB, FIBDataSet,
  FIBTableDataSet, UDameDato;

type
  TDMPedidosAlquiler = class(TDMPedidos)
     QMCabeceraDIRECCION_EVENTO: TBlobField;
     QMCabeceraRECEPTOR: TFIBStringField;
     QMCabeceraFECHA_EVENTO: TDateTimeField;
     QMCabeceraFECHA_ENTREGA: TDateTimeField;
     QMCabeceraFECHA_RECOGIDA: TDateTimeField;
     QMCabeceraDIAS: TFloatField;
     QMDetalleSTOCK_FUTURO: TFloatField;
     xAnticiposAlquiler: TFIBDataSetRO;
     DSxAnticiposAlquiler: TDataSource;
     xAnticiposAlquilerID_S: TIntegerField;
     xAnticiposAlquilerID_CARTERA: TIntegerField;
     xAnticiposAlquilerREGISTRO: TIntegerField;
     xAnticiposAlquilerFECHA_REGISTRO: TDateTimeField;
     xAnticiposAlquilerLIQUIDO: TFloatField;
     xAnticiposAlquilerMONEDA: TFIBStringField;
     xAnticiposAlquilerPAGADO: TIntegerField;
     xInfoActualizadaTOTAL_ANTICIPOS: TFloatField;
     procedure DMDocsPedidoCreate(Sender: TObject);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure xInfoActualizadaTOTAL_ANTICIPOSGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     procedure FiltraPendiente(Serie, Filtro: string);
     procedure FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente: integer);
     procedure RefrescaAnticipo;
  end;

var
  DMPedidosAlquiler : TDMPedidosAlquiler;

implementation

uses UDMMain, UEntorno, UFMReciboNuevo, UFMain;

{$R *.dfm}

procedure TDMPedidosAlquiler.DMDocsPedidoCreate(Sender: TObject);
begin
  inherited;
  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add('SELECT * FROM VER_CABECERAS_PEDIDO_ALQ ');
     Add('WHERE ');
     Add('EMPRESA = ?EMPRESA AND ');
     Add('CANAL = ?CANAL AND ');
     Add('SERIE = ?SERIE AND ');
     Add('TIPO = ''PEC'' ');
     Add('AND (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0 OR ESTADO = 3))) ');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        Add('AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
     Add('ORDER BY EJERCICIO, RIG ');
  end;

  SQLFind := QMCabecera.SelectSQL.Text;

  QMDetalleSTOCK_FUTURO.DisplayFormat := MascaraI;
  xAnticiposAlquilerFECHA_REGISTRO.DisplayFormat := ShortDateFormat;
  xAnticiposAlquilerLIQUIDO.DisplayFormat := LocalMascaraN;

  DMMain.FiltraTabla(QMCabecera, '11100', False);
end;

procedure TDMPedidosAlquiler.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_ALQ ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ''PEC'' AND ');
     SelectSQL.Add(' RIG = ?RIG ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
end;

procedure TDMPedidosAlquiler.FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_ALQ ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0 OR ESTADO = 3))) AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ''PEC'' AND ');
     SelectSQL.Add(' CLIENTE = ?CLIENTE AND ');
     SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMPedidosAlquiler.FiltraPendiente(Serie, Filtro: string);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_ALQ ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(Filtro);
     SelectSQL.Add(' AND SERIE = ''' + Serie + ''' ');
     SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
     Open;
  end;
end;

procedure TDMPedidosAlquiler.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  inherited;
  QMCabeceraFECHA_EVENTO.AsDateTime := REntorno.FechaTrab;
  QMCabeceraFECHA_ENTREGA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraFECHA_RECOGIDA.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMPedidosAlquiler.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  if (QMCabeceraFECHA_ENTREGA.AsDateTime > QMCabeceraFECHA_EVENTO.AsDateTime) then
     raise Exception.Create(_('La fecha de entrega debe ser anterior a la fecha del evento'));
  if (QMCabeceraFECHA_ENTREGA.AsDateTime > QMCabeceraFECHA_RECOGIDA.AsDateTime) then
     raise Exception.Create(_('La fecha del evento debe ser anterior a la fecha de recogida'));

  inherited;
end;

procedure TDMPedidosAlquiler.QMDetalleCalcFields(DataSet: TDataSet);
begin
  inherited;
  QMDetalle.FieldByName('STOCK_FUTURO').AsFloat := 0;

  if ((QMCabeceraESTADO.AsInteger = 0) and (QMDetalle.RecordCount > 0) and (Trim(QMDetalleARTICULO.AsString) > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT FIRST 1 * FROM A_ART_STOCK_FUTURO(:ID_A, :CANAL, :ALMACEN) WHERE FECHA <= :FECHA ORDER BY FECHA DESC';
           Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
           Params.ByName['ALMACEN'].AsString := QMDetalleALMACEN.AsString;
           Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA_ENTREGA.AsDateTime;
           ExecQuery;
           QMDetalle.FieldByName('STOCK_FUTURO').AsFloat := FieldByName['STOCK'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPedidosAlquiler.RefrescaAnticipo;
begin
  xAnticiposAlquiler.Close;
  xAnticiposAlquiler.Open;
end;

procedure TDMPedidosAlquiler.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  xAnticiposAlquiler.Open;
end;

procedure TDMPedidosAlquiler.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  inherited;
  xAnticiposAlquiler.Close;
end;

procedure TDMPedidosAlquiler.xInfoActualizadaTOTAL_ANTICIPOSGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  inherited;

  if (QMCabeceraID_S.AsString > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(C.LIQUIDO) FROM GES_CABECERAS_S_CAR A ');
           SQL.Add(' JOIN EMP_CARTERA C ');
           SQL.Add(' ON C.ID_CARTERA = A.ID_CARTERA ');
           SQL.Add(' WHERE ');
           SQL.Add(' A.ID_S = :ID_S AND ');
           SQL.Add(' C.PAGADO = 1 ');
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           Text := FormatFloat(LocalMascaraN, FieldByName['SUM'].AsFloat);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
