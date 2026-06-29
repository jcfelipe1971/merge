unit UProDMArtSerializacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TProDMArtSerializacion = class(TDataModule)
     TLocal: THYTransaction;
     QMArtSerializacion: TFIBTableSet;
     DSQMArtSerializacion: TDataSource;
     QMArtSerializacionEMPRESA: TIntegerField;
     QMArtSerializacionEJERCICIO: TIntegerField;
     QMArtSerializacionCANAL: TIntegerField;
     QMArtSerializacionSERIE: TFIBStringField;
     QMArtSerializacionTIPO: TFIBStringField;
     QMArtSerializacionRIG: TIntegerField;
     QMArtSerializacionLINEA: TIntegerField;
     QMArtSerializacionCODIGO: TIntegerField;
     QMArtSerializacionFECHA: TDateTimeField;
     QMArtSerializacionSIGNO: TIntegerField;
     QMArtSerializacionNSERIE: TFIBStringField;
     QMArtSerializacionARTICULO: TFIBStringField;
     QMArtSerializacionALMACEN: TFIBStringField;
     QMArtSerializacionESTADO: TIntegerField;
     QMArtSerializacionFECHA_CADUCIDAD: TDateTimeField;
     QMArtSerializacionFECHA_GARANTIA_CLIENTE: TDateTimeField;
     QMArtSerializacionFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     QMArtSerializacionNOTAS: TBlobField;
     xAlmacenes: TFIBDataSetRO;
     DSxAlmacenes: TDataSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     SPGeneraResto_: THYFIBQuery;
     QMImpresion: TFIBTableSet;
     QMImpresionUSUARIO: TIntegerField;
     QMImpresionARTICULO: TFIBStringField;
     QMImpresionNUM_SERIE: TFIBStringField;
     QMImpresionDESCRIPCION: TFIBStringField;
     QMArtSerializacionCONTADOR: TIntegerField;
     xSerieAsignada: TFIBDataSetRO;
     xSerieAsignadaCODIGO: TIntegerField;
     procedure Graba(DataSet: TDataSet);
     procedure QMArtSerializacionBeforePost(DataSet: TDataSet);
     procedure QMArtSerializacionNewRecord(DataSet: TDataSet);
     procedure QMArtSerializacionALMACENChange(Sender: TField);
     procedure QMArtSerializacionAfterOpen(DataSet: TDataSet);
     procedure QMArtSerializacionARTICULOChange(Sender: TField);
     procedure QMArtSerializacionAfterPost(DataSet: TDataSet);
     procedure QMImpresionNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private dclarations }
     {function CalculaGarantia(Articulo: string): TDateTime; No se utiliza}
  public
     { Public declarations }
     SerieDat, TipoDat, AlmacenDat, AlmacenOrigen, ArticuloDat, EstadoSer: string;
     RigDat, LineaDat: integer;
     FechaDat: TDateTime;
     UnidadesDat: double;
     CanalDat, CanalOrigen: smallint;
     procedure DameCodigo(var codigo, contador: integer; var codigostr: string);
     procedure AbreDatos(Serie, Tipo, Almacen, Articulo: string; Rig, Linea: integer; Fecha: TDateTime; Unidades: double; Estado: integer);
     procedure GeneraResto;
     function DameSerie: string;
     procedure BusquedaCompleja;
     procedure AnyadeEtiquetas(Descripcion, NumSerie: string);
  end;

var
  ProDMArtSerializacion : TProDMArtSerializacion;

implementation

uses UDMMain, UEntorno, UFBusca, UProFMOrden;

{$R *.DFM}

procedure TProDMArtSerializacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMImpresion.Open;
end;

procedure TProDMArtSerializacion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMArtSerializacion.QMArtSerializacionBeforePost(DataSet: TDataSet);
var
  Codigo, Contador : integer;
  CodigoStr : string;
begin
  // Es mostra el codi. Només quan assignem als components
  if (ProFMOrden.procedencia = 1) then
  begin
     xSerieAsignada.Close;
     xSerieAsignada.Open;
     QMArtSerializacionCODIGO.AsInteger := xSerieAsignadaCODIGO.AsInteger;
  end
  else
  begin
     // Generamos el contador interno Contador + Canal, si proveine de la creación de una serie
     // de la OF
     if (QMArtSerializacion.State = dsInsert) then
     begin
        DameCodigo(Codigo, Contador, CodigoStr);

        if (QMArtSerializacionNSERIE.AsString = '') then
           QMArtSerializacionNSERIE.AsString := CodigoStr;
        QMArtSerializacionCODIGO.AsInteger := Codigo;
        QMArtSerializacionCONTADOR.AsInteger := Contador;
     end;
  end;
end;

procedure TProDMArtSerializacion.DameCodigo(var codigo, contador: integer; var codigostr: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_GENERA_SERIALIZACION (:EMPRESA, :CANAL, :LONGITUD)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['LONGITUD'].AsInteger := 12;
        ExecQuery;
        Codigo := FieldByName['CODIGO'].AsInteger;
        CodigoStr := FieldByName['CODIGOSTR'].AsString;
        Contador := FieldByName['CONTADOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMArtSerializacion.QMArtSerializacionNewRecord(DataSet: TDataSet);
begin
  // Ponemos los valores por defecto
  QMArtSerializacionEMPRESA.AsInteger := REntorno.Empresa;
  QMArtSerializacionEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMArtSerializacionCANAL.AsInteger := CanalDat;
  QMArtSerializacionSERIE.AsString := SerieDat;
  QMArtSerializacionTIPO.AsString := TipoDat;
  QMArtSerializacionRIG.AsInteger := RigDat;
  QMArtSerializacionLINEA.AsInteger := LineaDat;
  QMArtSerializacionARTICULO.AsString := ArticuloDat;
  QMArtSerializacionALMACEN.AsString := AlmacenDat;
  QMArtSerializacionFECHA.AsDateTime := FechaDat;
  QMArtSerializacionNSERIE.AsString := '';
  QMArtSerializacionFECHA_CADUCIDAD.AsDateTime := REntorno.FechaTrab;

  // Sugerimos como fecha de garantía de cliente la del sistema más la garantía que ponemos a nuestro artículo, sólo si estamos en ventas
  QMArtSerializacionFECHA_GARANTIA_PROVEEDOR.AsDateTime := REntorno.FechaTrab;

  if UnidadesDat < 0 then
     QMArtSerializacionSIGNO.AsInteger := 1
  else
     QMArtSerializacionSIGNO.AsInteger := 0;

  if ((LineaDat > 0) and (TipoDat = 'PRO')) then
     QMArtSerializacionESTADO.AsInteger := 0  // Components
  else
     QMArtSerializacionESTADO.AsInteger := 1;  // OF
end;

procedure TProDMArtSerializacion.QMArtSerializacionALMACENChange(Sender: TField);
begin
  with xAlmacenes do
  begin
     Close;
     Open;
  end;
end;

procedure TProDMArtSerializacion.QMArtSerializacionAfterOpen(DataSet: TDataSet);
begin
  xAlmacenes.Open;
  xArticulos.Open;
end;

procedure TProDMArtSerializacion.QMArtSerializacionARTICULOChange(Sender: TField);
begin
  with xArticulos do
  begin
     Close;
     Open;
  end;
end;

procedure TProDMArtSerializacion.AbreDatos(Serie, Tipo, Almacen, Articulo: string; Rig, Linea: integer; Fecha: TDateTime; Unidades: double; Estado: integer);
begin
  // Nos guardamos los datos
  SerieDat := Serie;
  TipoDat := Tipo;
  RigDat := Rig;
  LineaDat := Linea;
  AlmacenDat := Almacen;
  FechaDat := Fecha;
  ArticuloDat := Articulo;
  UnidadesDat := Unidades;

  if (LineaDat = 0) then
     EstadoSer := ' AND ESTADO=0'
  else
     EstadoSer := ' AND ESTADO=1';

  CanalDat := REntorno.Canal;
  CanalOrigen := CanalDat;
  AlmacenOrigen := '';

  with QMArtSerializacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalDat;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
  end;
end;

procedure TProDMArtSerializacion.GeneraResto;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_A_ART_GENERA_RESTO_SERIAL_E(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :FECHA_ENT, :PROCEDENCIA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := CanalDat;
        Params.ByName['SERIE'].AsString := SerieDat;
        Params.ByName['TIPO'].AsString := TipoDat;
        Params.ByName['RIG'].AsInteger := RigDat;
        Params.ByName['LINEA'].AsInteger := LineaDat;
        Params.ByName['FECHA_ENT'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['PROCEDENCIA'].AsInteger := ProFMOrden.procedencia;
        ExecQuery;
        if (FieldByName['CUANTOS'].AsInteger > 0) then
           ShowMessage(Format(_('Números de serie generados: %d'), [FieldByName['CUANTOS'].AsInteger]))
        else
           ShowMessage(_('Los números de serie ya estaban generados'));
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMArtSerializacion do
  begin
     Close;
     Open;
  end;
end;

procedure TProDMArtSerializacion.QMArtSerializacionAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  QMArtSerializacion.Refresh;
end;

function TProDMArtSerializacion.DameSerie: string;
begin
  Result := QMArtSerializacionNSERIE.AsString;
end;

procedure TProDMArtSerializacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMArtSerializacion, '11110', True, SerieDat);
end;

{dji lrk kri - No se utiliza
function TProDMArtSerializacion.CalculaGarantia(Articulo: string): TDateTime;
begin
  // EXECUTE PROCEDURE A_ART_CALCULA_GARANTIA (?EMPRESA, ?CANAL, ?ARTICULO,  ?FECHA)

  with SPCalculaGarantia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := CanalDat;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     ExecQuery;
     Result := FieldByName['FECHA_GARANTIA'].AsDateTime;
     FreeHandle;
  end;
end;
}

procedure TProDMArtSerializacion.AnyadeEtiquetas(Descripcion, NumSerie: string);
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

procedure TProDMArtSerializacion.QMImpresionNewRecord(DataSet: TDataSet);
begin
  QMImpresionUSUARIO.AsInteger := REntorno.Usuario;
end;

end.
