unit ZUDMLstFechaPrevProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, FIBDatabase,
  UFIBModificados, FR_Class, Fr_HYReport, DB, FIBDataSet, FIBDataSetRO;

type
  TZDMLstFechaPrevProv = class(TDataModule)
     QMListado: TFIBDataSetRO;
     frPedEntregaProv: TfrHYReport;
     TLocal: THYTransaction;
     DSListado: TDataSource;
     FrDBPedEntregaProv: TfrDBDataSet;
     QMListadoV_RIGPEP: TIntegerField;
     QMListadoV_NOMBREPROVEEDOR: TFIBStringField;
     QMListadoV_CODPROVEEDOR: TIntegerField;
     QMListadoV_FECHAPREVISTA: TDateTimeField;
     QMListadoV_FECHA_PEDIDO: TDateTimeField;
     QMListadoV_SERIE: TFIBStringField;
     QMListadoV_ARTICULO: TFIBStringField;
     QMListadoV_DESCRIPCION_ART: TFIBStringField;
     QMListadoV_UD_PED: TFloatField;
     QMListadoV_UD_POR_SERVIR: TFloatField;
     QMListadoV_SU_REFERENCIA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPedEntregaProvBeforePrint(Memo: TStringList; View: TfrView);
     procedure frPedEntregaProvGetValue(const ParName: string; var ParValue: variant);
  private
  public
     CliMin, CliMax: string;
     FechaListado: TDateTime;
     Comentario: string;
     Filtro: string;
     procedure Recargar;
     procedure MostrarListado(modo: byte; min_fecha, max_fecha, min_fecha_prev, max_fecha_prev, fecha_listado: TDateTime; min_proveedor, max_proveedor, Grupo, Orden: integer);
  end;

var
  ZDMLstFechaPrevProv : TZDMLstFechaPrevProv;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno, UUtiles;

{$R *.dfm}

procedure TZDMLstFechaPrevProv.Recargar;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(PROVEEDOR), MAX(PROVEEDOR) FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        CliMin := FieldByName['MIN'].AsString;
        CliMax := FieldByName['MAX'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMLstFechaPrevProv.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLstFechaPrevProv.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLstFechaPrevProv.frPedEntregaProvBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TZDMLstFechaPrevProv.MostrarListado(modo: byte; min_fecha, max_fecha, min_fecha_prev, max_fecha_prev, fecha_listado: TDateTime; min_proveedor, max_proveedor, Grupo, Orden: integer);
var
  order_by : string;
begin
  min_fecha := HourIntoDate(min_fecha, '00:00:00');
  max_fecha := HourIntoDate(max_fecha, '00:00:00');
  min_fecha_prev := HourIntoDate(min_fecha_prev, '00:00:00');
  max_fecha_prev := HourIntoDate(max_fecha_prev, '00:00:00');

  DMListados.Normalizar_Desde_Hasta(min_fecha, max_fecha);
  DMListados.Normalizar_Desde_Hasta(min_fecha_prev, max_fecha_prev);
  DMListados.Normalizar_Desde_Hasta(min_proveedor, max_proveedor);

  if (Orden = 0) then
     order_by := ' order by V_RIGPEP, V_CODPROVEEDOR, V_FECHAPREVISTA'
  else
     order_by := ' order by V_RIGPEP, V_FECHAPREVISTA';

  if (grupo = 9010) then
  begin
     with QMListado do
     begin
        Close;
        SelectSQL.Text :=
           'select distinct(V_RIGPEP) , V_NOMBREPROVEEDOR , V_CODPROVEEDOR , ' +
           'V_FECHAPREVISTA , V_FECHA_PEDIDO , V_SERIE, ' +
           'V_ARTICULO,V_DESCRIPCION_ART  ,V_UD_PED,V_UD_POR_SERVIR, V_SU_REFERENCIA ' +
           'from z_lst_ped_p_fecha_prev_resumido (?EMPRESA , ?CANAL , ?SERIE , ?FECHAD , ' +
           '?FECHAH ,?FECHAPREVD , ?FECHAPREVH , ?PROVEEDORD , ?PROVEEDORH ,?ENTRADA,2 )' + order_by;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Serie'].AsString := REntorno.Serie;
        Params.ByName['FechaD'].AsDateTime := min_fecha;
        Params.ByName['FechaH'].AsDateTime := max_fecha;
        Params.ByName['FechaPrevD'].AsDateTime := min_fecha_prev;
        Params.ByName['FechaPrevH'].AsDateTime := max_fecha_prev;
        Params.ByName['ProveedorD'].AsInteger := min_proveedor;
        Params.ByName['ProveedorH'].AsInteger := max_proveedor;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Open;
     end;
  end;

  if (grupo = 9009) then
  begin
     with QMListado do
     begin
        Close;
        SelectSQL.Text :=
           'select V_RIGPEP , V_NOMBREPROVEEDOR , V_CODPROVEEDOR , ' +
           'V_FECHAPREVISTA , V_FECHA_PEDIDO , V_SERIE, ' +
           'V_ARTICULO,V_DESCRIPCION_ART  ,V_UD_PED,V_UD_POR_SERVIR, V_SU_REFERENCIA ' +
           'from z_lst_ped_p_fecha_prev_resumido (?EMPRESA , ?CANAL , ?SERIE , ?FECHAD , ' +
           '?FECHAH ,?FECHAPREVD , ?FECHAPREVH , ?PROVEEDORD , ?PROVEEDORH ,?ENTRADA,1 )' + order_by;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Serie'].AsString := REntorno.Serie;
        Params.ByName['FechaD'].AsDateTime := min_fecha;
        Params.ByName['FechaH'].AsDateTime := max_fecha;
        Params.ByName['FechaPrevD'].AsDateTime := min_fecha_prev;
        Params.ByName['FechaPrevH'].AsDateTime := max_fecha_prev;
        Params.ByName['ProveedorD'].AsInteger := min_proveedor;
        Params.ByName['ProveedorH'].AsInteger := max_proveedor;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Open;
     end;
  end;

  DMListados.Imprimir(Grupo, Modo, '', '', frPedEntregaProv, nil);
end;

procedure TZDMLstFechaPrevProv.frPedEntregaProvGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
  if (ParName = 'Comentario') then
     ParValue := Comentario;

  if (ParName = 'FechaListado') then
     ParValue := FechaListado;

  if (ParName = 'Filtro') then
     ParValue := Filtro;
end;

end.
