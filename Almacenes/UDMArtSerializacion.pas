unit UDMArtSerializacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FIBTableDataSetRO;

type
  TDMArtSerializacion = class(TDataModule)
     TLocal: THYTransaction;
     QMArtSerializacion: TFIBTableSet;
     DSQMArtSerializacion: TDataSource;
     SPGeneraCodigo: THYFIBQuery;
     SPGeneraResto: THYFIBQuery;
     SPGeneraRestoE: THYFIBQuery;
     QMImpresion: TFIBTableSet;
     QMImpresionUSUARIO: TIntegerField;
     QMImpresionARTICULO: TFIBStringField;
     QMImpresionNUM_SERIE: TFIBStringField;
     QMImpresionDESCRIPCION: TFIBStringField;
     QMArtSerializacionEMPRESA: TIntegerField;
     QMArtSerializacionCANAL: TIntegerField;
     QMArtSerializacionCODIGO: TIntegerField;
     QMArtSerializacionNSERIE: TFIBStringField;
     QMArtSerializacionARTICULO: TFIBStringField;
     QMArtSerializacionALMACEN: TFIBStringField;
     QMArtSerializacionESTADO: TIntegerField;
     QMArtSerializacionFECHA_CADUCIDAD: TDateTimeField;
     QMArtSerializacionFECHA_GARANTIA_CLIENTE: TDateTimeField;
     QMArtSerializacionFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     QMArtSerializacionNOTAS: TBlobField;
     QMArtSerializacionDEVUELTO_PROV: TIntegerField;
     QMArtSerializacionCONTADOR: TIntegerField;
     QMArtSerializacionACTIVO: TIntegerField;
     xOrigen: TFIBTableSetRO;
     xDestino: TFIBTableSetRO;
     DSxDestino: TDataSource;
     xOrigenEMPRESA: TIntegerField;
     xOrigenEJERCICIO: TIntegerField;
     xOrigenCANAL: TIntegerField;
     xOrigenSERIE: TFIBStringField;
     xOrigenRIG: TIntegerField;
     xOrigenLINEA: TIntegerField;
     xOrigenTIPO: TFIBStringField;
     xDestinoEMPRESA: TIntegerField;
     xDestinoEJERCICIO: TIntegerField;
     xDestinoCANAL: TIntegerField;
     xDestinoSERIE: TFIBStringField;
     xDestinoRIG: TIntegerField;
     xDestinoLINEA: TIntegerField;
     xDestinoTIPO: TFIBStringField;
     DSxOrigen: TDataSource;
     xOrigenID_ORDEN: TIntegerField;
     xDestinoID_ORDEN: TIntegerField;
     xOrigenFECHA: TDateTimeField;
     xDestinoFECHA: TDateTimeField;
     QMArtSerializacionCLIENTE_REPARACION: TIntegerField;
     QMArtSerializacionNombreCliente: TStringField;
     xOrigenSIGNO: TIntegerField;
     xDestinoSIGNO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMArtSerializacionCreate(Sender: TObject);
     procedure QMArtSerializacionBeforePost(DataSet: TDataSet);
     procedure QMArtSerializacionNewRecord(DataSet: TDataSet);
     procedure QMArtSerializacionAfterOpen(DataSet: TDataSet);
     procedure QMArtSerializacionAfterPost(DataSet: TDataSet);
     procedure QMImpresionNewRecord(DataSet: TDataSet);
     procedure QMArtSerializacionAfterScroll(DataSet: TDataSet);
  private
     { Private dclarations }
     {function CalculaGarantia(Articulo: string): TDateTime; No se utiliza}
  public
     { Public declarations }
     SerieDat, TipoDat, AlmacenDat, AlmacenOrigen, ArticuloDat, EstadoSer, AlmacenDst: string;
     RigDat, LineaDat, DevolucionDat: integer;
     EjercicioDat: smallint;
     FechaDat: TDateTime;
     UnidadesDat: double;
     CanalDat: smallint;
     procedure DameCodigo(var codigo, contador: integer; var codigostr: string);
     procedure AbreDatos(Ejercicio: smallint; Serie, Tipo, Almacen, Articulo: string; Rig, Linea, Devolucion: integer; Fecha: TDateTime; Unidades: double; Estado: integer);
     procedure GeneraResto;
     function DameSerie: string;
     procedure BusquedaCompleja;
     procedure AnyadeEtiquetas(Descripcion, NumSerie: string);
     procedure FiltraSeries(articulo, serie: string); //sfg.albert
     procedure DameClienteTitulo; //sfg.albert
     procedure FiltroSerie(Filtro: string); //sfg.albert
  end;

var
  DMArtSerializacion : TDMArtSerializacion;

implementation

uses UDMMain, UEntorno, UFBusca, UDameDato;

{$R *.DFM}

procedure TDMArtSerializacion.DMArtSerializacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  QMArtSerializacionFECHA_CADUCIDAD.DisplayFormat := ShortDateFormat;
  QMArtSerializacionFECHA_GARANTIA_CLIENTE.DisplayFormat := ShortDateFormat;
  QMArtSerializacionFECHA_GARANTIA_PROVEEDOR.DisplayFormat := ShortDateFormat;

  xOrigenFECHA.DisplayFormat := ShortDateFormat;
  xDestinoFECHA.DisplayFormat := ShortDateFormat;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMImpresion.Open;

  DMMain.FiltraTabla(QMArtSerializacion, '10100', True);
end;

procedure TDMArtSerializacion.QMArtSerializacionBeforePost(DataSet: TDataSet);
var
  Codigo, Contador : integer;
  CodigoStr : string;
begin
  // Generamos el contador interno Contador + Canal
  if (QMArtSerializacion.State = dsInsert) then
  begin
     DameCodigo(Codigo, Contador, CodigoStr);

     if (QMArtSerializacionNSERIE.AsString = '') then
        QMArtSerializacionNSERIE.AsString := CodigoStr;
     QMArtSerializacionCODIGO.AsInteger := Codigo;
     QMArtSerializacionCONTADOR.AsInteger := Contador;
  end;
end;

procedure TDMArtSerializacion.DameCodigo(var codigo, contador: integer; var codigostr: string);
begin
  with SPGeneraCodigo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['LONGITUD'].AsInteger := 12;
     ExecQuery;
     Codigo := FieldByName['CODIGO'].AsInteger;
     CodigoStr := FieldByName['CODIGOSTR'].AsString;
     Contador := FieldByName['CONTADOR'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMArtSerializacion.QMArtSerializacionNewRecord(DataSet: TDataSet);
begin
  // Ponemos los valores por defecto
  QMArtSerializacionEMPRESA.AsInteger := REntorno.Empresa;
  {  if (ejerciciodat <> 0) then
     QMArtSerializacionEJERCICIO.AsInteger := EjercicioDat
  else
     QMArtSerializacionEJERCICIO.AsInteger := REntorno.Ejercicio;
 }
  if (canaldat <> 0) then
     QMArtSerializacionCANAL.AsInteger := CanalDat
  else
     QMArtSerializacionCANAL.AsInteger := REntorno.Canal;

  {  if (seriedat <> '') then
     QMArtSerializacionSERIE.AsString := SerieDat
  else
     QMArtSerializacionSERIE.AsString := SerieDat;
 }
  {  if (tipodat <> '') then
     QMArtSerializacionTIPO.AsString := TipoDat
  else
     QMArtSerializacionTIPO.AsString := TipoDat;
 }
  {  if (rigdat <> 0) then
     QMArtSerializacionRIG.AsInteger := RigDat
  else
     QMArtSerializacionRIG.AsInteger := RigDat;
 }
  { if (lineadat <> 0) then
     QMArtSerializacionLINEA.AsInteger := LineaDat
  else
     QMArtSerializacionLINEA.AsInteger := LineaDat;
  }
  if (articulodat <> '') then
     QMArtSerializacionARTICULO.AsString := ArticuloDat
  else
     QMArtSerializacionARTICULO.AsString := ArticuloDat;

  if (almacendat <> '') then
     QMArtSerializacionALMACEN.AsString := AlmacenDat
  else
     QMArtSerializacionALMACEN.AsString := AlmacenDat;

  {  if (fechadat <> 0) then
     QMArtSerializacionFECHA.AsDateTime := FechaDat
  else
     QMArtSerializacionFECHA.AsDateTime := FechaDat;
 }
  QMArtSerializacionNSERIE.AsString := '';
  QMArtSerializacionFECHA_CADUCIDAD.AsDateTime := REntorno.FechaTrab;
  QMArtSerializacionFECHA_GARANTIA_PROVEEDOR.AsDateTime := REntorno.FechaTrab;
  QMArtSerializacionFECHA_GARANTIA_CLIENTE.AsDateTime := REntorno.FechaTrab;

  {Sugerimos como fecha de garantía de cliente la del sistema más la garantía
   que ponemos a nuestro artículo, sólo si estamos en ventas }
  {
  if ((TipoDat = 'ALB') or (TipoDat = 'FAC') or (TipoDat = 'MVS')) then
     QMArtSerializacionFECHA_GARANTIA_CLIENTE.AsDateTime :=
        CalculaGarantia(ArticuloDat);

  if UnidadesDat < 0 then
     QMArtSerializacionSIGNO.AsInteger := 1
  else
     QMArtSerializacionSIGNO.AsInteger := 0;

  if ((TipoDat = 'MVT') or (TipoDat = 'ALB') or (TipoDat = 'FAC') or (TipoDat = 'MVS')) and
     (devolucionDat = 0) then
     QMArtSerializacionESTADO.AsInteger := 0;

  if ((TipoDat = 'MVT') or (TipoDat = 'ALB') or (TipoDat = 'FAC') or (TipoDat = 'MVS')) and
     (devolucionDat = 1) then
     QMArtSerializacionESTADO.AsInteger := 1;

  if ((TipoDat = 'MVE') or (TipoDat = 'ALP') or (TipoDat = 'FAP')) and
     (DevolucionDat = 0) then
     QMArtSerializacionESTADO.AsInteger := 1;

  if ((TipoDat = 'MVE') or (TipoDat = 'ALP') or (TipoDat = 'FAP')) and
     (DevolucionDat = 1) then
     QMArtSerializacionESTADO.AsInteger := 0;
}
end;

procedure TDMArtSerializacion.QMArtSerializacionAfterOpen(DataSet: TDataSet);
begin
  xOrigen.Open;
end;

procedure TDMArtSerializacion.AbreDatos(Ejercicio: smallint; Serie, Tipo, Almacen, Articulo: string; Rig, Linea, Devolucion: integer; Fecha: TDateTime; Unidades: double; Estado: integer);
begin
  // Nos guardamos los datos
  EjercicioDat := Ejercicio;
  SerieDat := Serie;
  TipoDat := Tipo;
  RigDat := Rig;
  LineaDat := Linea;
  AlmacenDat := Almacen;
  FechaDat := Fecha;
  ArticuloDat := Articulo;
  UnidadesDat := Unidades;
  DevolucionDat := Devolucion;
  if ((tipo = 'MVE') or (tipo = 'MVS') or (tipo = 'MVT')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add(' SELECT CANAL_ORI, CANAL_DST, ALMACEN_ORI, ALMACEN_DST FROM GES_CABECERAS_ST ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' RIG = ?RIG ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['RIG'].AsInteger := Rig;
           ExecQuery;
           AlmacenDat := FieldByName['ALMACEN_ORI'].AsString;
           AlmacenDst := FieldByName['ALMACEN_DST'].AsString;
           CanalDat := FieldByName['CANAL_ORI'].AsInteger;
           AlmacenOrigen := ' AND ALMACEN = ''' + FieldByName['ALMACEN_ORI'].AsString + '''';
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     CanalDat := REntorno.Canal;
     AlmacenOrigen := ' AND ALMACEN = ''' + AlmacenDat + '''';
  end;

  if ((TipoDat = 'ALB') or (TipoDat = 'FAC') or (TipoDat = 'MVS') or (TipoDat = 'MVT')) and
     (devolucion = 0) then
     EstadoSer := 'AND ESTADO = 1';

  if ((TipoDat = 'ALB') or (TipoDat = 'FAC') or (TipoDat = 'MVS') or (TipoDat = 'MVT')) and
     (devolucion = 1) then
     EstadoSer := 'AND ESTADO = 0';

  if ((TipoDat = 'ALP') or (TipoDat = 'FAP') or (TipoDat = 'MVE')) and (devolucion = 0) then
     EstadoSer := 'AND ESTADO = 0';

  if ((TipoDat = 'ALP') or (TipoDat = 'FAP') or (TipoDat = 'MVE')) and (devolucion = 1) then
     EstadoSer := 'AND ESTADO = 1 ';
end;

procedure TDMArtSerializacion.GeneraResto;
begin
  if (TipoDat = 'MVT') then
     raise Exception.Create(_('No se pueden generar en traspasos'))
  else
  if ((TipoDat = 'ALB') or (TipoDat = 'FAC') or (TipoDat = 'MVS')) then
     with SPGeneraResto do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        //Params.ByName['EJERCICIO'].AsInteger  := REntorno.Ejercicio;
        Params.ByName['EJERCICIO'].AsInteger := EjercicioDat;
        Params.ByName['CANAL'].AsInteger := CanalDat;
        Params.ByName['SERIE'].AsString := SerieDat;
        Params.ByName['TIPO'].AsString := TipoDat;
        Params.ByName['RIG'].AsInteger := RigDat;
        Params.ByName['LINEA'].AsInteger := LineaDat;
        Params.ByName['FECHA_ENT'].AsDateTime := REntorno.FechaTrab;
        ExecQuery;
        if (FieldByName['CUANTOS'].AsInteger > 0) then
           ShowMessage(Format(_('Numeros de serie generados: %d'), [FieldByName['CUANTOS'].AsInteger]))
        else
           ShowMessage(_('Los numeros de serie ya estaban generados'));
        FreeHandle;
     end
  else
     with SPGeneraRestoE do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        //Params.ByName['EJERCICIO'].AsInteger  := REntorno.Ejercicio;
        Params.ByName['EJERCICIO'].AsInteger := EjercicioDat;
        Params.ByName['CANAL'].AsInteger := CanalDat;
        Params.ByName['SERIE'].AsString := SerieDat;
        Params.ByName['TIPO'].AsString := TipoDat;
        Params.ByName['RIG'].AsInteger := RigDat;
        Params.ByName['LINEA'].AsInteger := LineaDat;
        Params.ByName['FECHA_ENT'].AsDateTime := REntorno.FechaTrab;
        ExecQuery;
        if (FieldByName['CUANTOS'].AsInteger > 0) then
           ShowMessage(Format(_('Numeros de serie generados: %d'), [FieldByName['CUANTOS'].AsInteger]))
        else
           ShowMessage(_('Los numeros de serie ya estaban generados'));
        FreeHandle;
     end;

  with QMArtSerializacion do
  begin
     Close;
     Open;
  end;
end;

procedure TDMArtSerializacion.QMArtSerializacionAfterPost(DataSet: TDataSet);
begin
  QMArtSerializacion.Refresh;
end;

function TDMArtSerializacion.DameSerie: string;
begin
  Result := QMArtSerializacionNSERIE.AsString;
end;

procedure TDMArtSerializacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMArtSerializacion, '10100', True, SerieDat);
end;

procedure TDMArtSerializacion.AnyadeEtiquetas(Descripcion, NumSerie: string);
begin
  with QMImpresion do
  begin
     Append;
     FieldByName('ARTICULO').AsString := QMArtSerializacionARTICULO.AsString;
     FieldByName('DESCRIPCION').AsString := Descripcion;
     FieldByName('NUM_SERIE').AsString := NumSerie;
     try
        Post;
        Transaction.CommitRetaining;
     except
        Cancel;
     end;
  end;
end;

procedure TDMArtSerializacion.QMImpresionNewRecord(DataSet: TDataSet);
begin
  QMImpresionUSUARIO.AsInteger := REntorno.Usuario;
end;

procedure TDMArtSerializacion.FiltraSeries(articulo, serie: string);
begin
  with QMArtSerializacion do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ART_ARTICULOS_SERIALIZACION ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' CANAL = ?CANAL ');

     if (Trim(Articulo) > '') then
        SelectSQL.Add(' AND ARTICULO = ?ARTICULO ');
     if (Trim(serie) > '') then
        SelectSQL.Add(' AND NSERIE = ?NSERIE ');
     SelectSQL.Add(' ORDER BY ARTICULO, NSERIE ');

     // Asigno parametros
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Trim(Articulo) > '') then
        Params.ByName['ARTICULO'].AsString := Trim(Articulo);
     if (Trim(serie) > '') then
        Params.ByName['NSERIE'].AsString := Trim(Serie);
     Open;
  end;
end;

procedure TDMArtSerializacion.QMArtSerializacionAfterScroll(DataSet: TDataSet);
begin
  // EXECUTE PROCEDURE FILTRA_SERIALIZACION_ORIG_DEST(?EMPRESA, ?CANAL, ?CODIGO_SER, ?TIPO)
  with xOrigen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CODIGO_SER'].AsInteger := QMArtSerializacionCODIGO.AsInteger;
     Open;
  end;

  with xDestino do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CODIGO_SER'].AsInteger := QMArtSerializacionCODIGO.AsInteger;
     Open;
  end;
end;

procedure TDMArtSerializacion.DameClienteTitulo;
begin
  QMArtSerializacionNombreCliente.AsString := DameTituloCliente(QMArtSerializacionCLIENTE_REPARACION.AsInteger);
end;

procedure TDMArtSerializacion.FiltroSerie(Filtro: string);
begin
  if (Filtro <> '') then
  begin
     with QMArtSerializacion do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM ART_ARTICULOS_SERIALIZACION ');
        SelectSQL.Add(' WHERE ' + Filtro);
        SelectSQL.Add(' ORDER BY EMPRESA, CANAL, CODIGO ');
        Open;
     end;
  end;
end;

end.
