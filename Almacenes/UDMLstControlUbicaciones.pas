unit UDMLstControlUbicaciones;

interface

uses
  SysUtils, Classes, FR_DSet, FR_DBSet, FIBDatabase, UFIBModificados,
  frxClass, frxHYReport, FR_Class, Fr_HYReport, DB, FIBDataSetRO,
  FIBDataSet;

type
  TDMLstControlUbicaciones = class(TDataModule)
     DSQMUbicacion: TDataSource;
     QMUbicacion: TFIBDataSetRO;
     frListadoUbicaciones: TfrHYReport;
     frxListadoUbicaciones: TfrxHYReport;
     TLocal: THYTransaction;
     frDSQMUbicacion: TfrDBDataSet;
     QMUbicacionUNIDADES: TIntegerField;
     QMUbicacionEMPRESA: TIntegerField;
     QMUbicacionARTICULO: TFIBStringField;
     QMUbicacionLOTE: TFIBStringField;
     QMUbicacionALMACEN: TFIBStringField;
     QMUbicacionID_UBICACION: TIntegerField;
     QMUbicacionTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frListadoUbicacionesBeforePrint(Memo: TStringList; View: TfrView);
     procedure frListadoUbicacionesGetValue(const ParName: string; var ParValue: variant);
     procedure frxListadoUbicacionesBeforePrint(Sender: TfrxReportComponent);
     procedure frxListadoUbicacionesGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraListado(Modo, Tipo: integer; DesdeAlmacen, HastaAlmacen, DesdeArticulo, HastaArticulo: string; DesdeUbicacion, HastaUbicacion: integer);
  end;

var
  DMLstControlUbicaciones : TDMLstControlUbicaciones;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno;

{$R *.dfm}

procedure TDMLstControlUbicaciones.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  QMUbicacion.Open;
end;

procedure TDMLstControlUbicaciones.DataModuleDestroy(Sender: TObject);
begin
  QMUbicacion.Close;
  CierraData(DMListados);
end;

procedure TDMLstControlUbicaciones.MuestraListado(Modo, Tipo: integer; DesdeAlmacen, HastaAlmacen, DesdeArticulo, HastaArticulo: string; DesdeUbicacion, HastaUbicacion: integer);
var
  str : string;
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  with QMUbicacion do
  begin
     Close;
     SelectSQL.Clear;

     if (Tipo = 0) then
     begin
        SelectSQL.Text := 'SELECT COUNT(*)AS UNIDADES,N.EMPRESA,N.ARTICULO,N.LOTE,N.ALMACEN_ENT AS ALMACEN,N.ID_UBICACION,A.TITULO_LARGO AS TITULO  FROM NRO_SERIE_KRI N ' +
           'JOIN ART_ARTICULOS A ON N.EMPRESA=A.EMPRESA AND N.ARTICULO=A.ARTICULO WHERE N.EMPRESA = ?EMPRESA AND                  ' +
           'N.ARTICULO >= ?DESDE_ARTICULO AND N.ARTICULO <= ?ARTICULO_HASTA AND N.ALMACEN_ENT  >= ?DESDE_ALMACEN  AND                 ' +
           'N.ALMACEN_ENT  <= ?HASTA_ALMACEN AND N.RIG_MOS = 0 AND N.RIG_SAL = 0 AND N.RIG_MOV = 0 AND N.RIG_ENT <> 0                     ' +
           'GROUP BY N.EMPRESA,N.ARTICULO,N.LOTE,N.ALMACEN_ENT,N.ID_UBICACION,A.TITULO_LARGO                                                    ' +
           'UNION                                                                                                               ' +
           'SELECT COUNT(*)AS UNIDADES,N.EMPRESA,N.ARTICULO,N.LOTE,N.ALMACEN_MOE AS ALMACEN,N.ID_UBICACION,A.TITULO_LARGO AS TITULO  FROM NRO_SERIE_KRI N ' +
           'JOIN ART_ARTICULOS A ON N.EMPRESA=A.EMPRESA AND N.ARTICULO=A.ARTICULO WHERE N.EMPRESA = ?EMPRESA AND                  ' +
           'N.ARTICULO >= ?DESDE_ARTICULO AND N.ARTICULO <= ?HASTA_ARTICULO AND N.ALMACEN_MOE  >= ?DESDE_ALMACEN  AND                 ' +
           'N.ALMACEN_MOE <= ?HASTA_ALMACEN AND N.RIG_MOS = 0 AND N.RIG_SAL = 0 AND N.RIG_MOV = 0 AND N.RIG_MOE <> 0                      ' +
           'GROUP BY N.EMPRESA,N.ARTICULO,N.LOTE,N.ALMACEN_MOE,N.ID_UBICACION,A.TITULO_LARGO                                                    ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_ALMACEN'].AsString := DesdeAlmacen;
        Params.ByName['HASTA_ALMACEN'].AsString := HastaAlmacen;
        Params.ByName['DESDE_ARTICULO'].AsString := DesdeArticulo;
        Params.ByName['HASTA_ARTICULO'].AsString := HastaArticulo;
     end;

     if (Tipo = 1) then
     begin
        SelectSQL.Text :=
           'SELECT COUNT(*)AS UNIDADES,N.EMPRESA,N.ARTICULO,N.LOTE,N.ALMACEN_ENT AS ALMACEN,N.ID_UBICACION,A.TITULO_LARGO AS TITULO  FROM NRO_SERIE_KRI N  ' +
           'JOIN ART_ARTICULOS A ON N.EMPRESA=A.EMPRESA AND N.ARTICULO=A.ARTICULO WHERE N.EMPRESA = ?EMPRESA AND                   ' +
           'N.ID_UBICACION >= ?DESDE_ID_UBICACION AND N.ID_UBICACION <= ?HASTA_ID_UBICACION AND N.ALMACEN_ENT  >= ?DESDE_ALMACEN   AND ' +
           'N.ALMACEN_ENT  <= ?HASTA_ALMACEN AND N.RIG_MOS = 0 AND N.RIG_SAL = 0 AND N.RIG_MOV = 0 AND N.RIG_ENT <> 0                      ' +
           'GROUP BY N.EMPRESA,N.ARTICULO,N.LOTE,N.ALMACEN_ENT,N.ID_UBICACION,A.TITULO_LARGO                                                     ' +
           'UNION                                                                                                                ' +
           'SELECT COUNT(*)AS UNIDADES,N.EMPRESA,N.ARTICULO,N.LOTE,N.ALMACEN_MOE AS ALMACEN,N.ID_UBICACION,A.TITULO_LARGO AS TITULO  FROM NRO_SERIE_KRI N  ' +
           'JOIN ART_ARTICULOS A ON N.EMPRESA=A.EMPRESA AND N.ARTICULO=A.ARTICULO WHERE N.EMPRESA = ?EMPRESA AND                   ' +
           'N.ID_UBICACION >= ?DESDE_ID_UBICACION AND N.ID_UBICACION <= ?HASTA_ID_UBICACION AND N.ALMACEN_MOE  >= ?DESDE_ALMACEN  AND  ' +
           'N.ALMACEN_MOE <= ?HASTA_ALMACEN AND N.RIG_MOS = 0 AND N.RIG_SAL = 0 AND N.RIG_MOV = 0 AND N.RIG_MOE <> 0                       ' +
           'GROUP BY N.EMPRESA,N.ARTICULO,N.LOTE,N.ALMACEN_MOE,N.ID_UBICACION,A.TITULO_LARGO                                                     ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_ALMACEN'].AsString := DesdeAlmacen;
        Params.ByName['HASTA_ALMACEN'].AsString := HastaAlmacen;
        Params.ByName['DESDE_ID_UBICACION'].AsInteger := DesdeUbicacion;
        Params.ByName['HASTA_ID_UBICACION'].AsInteger := HastaUbicacion;
     end;

     Open;
  end; {With}

  DMListados.Cargar(5108, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frListadoUbicaciones.LoadFromFIB(REntorno.Formato, str);
     frListadoUbicaciones.PrepareReport;
     case Modo of
        0, 2: frListadoUbicaciones.ShowPreparedReport;
        1, 3: frListadoUbicaciones.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxListadoUbicaciones.LoadFromFIB(REntorno.Formato, str);
     frxListadoUbicaciones.PrepareReport;
     case Modo of
        0, 2: frxListadoUbicaciones.ShowPreparedReport;
        1, 3: frxListadoUbicaciones.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstControlUbicaciones.frListadoUbicacionesBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TDMLstControlUbicaciones.frListadoUbicacionesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstControlUbicaciones.frxListadoUbicacionesBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstControlUbicaciones.frxListadoUbicacionesGetValue(const VarName: string; var Value: variant);
begin
  frListadoUbicacionesGetValue(VarName, Value);
end;

end.
