unit UDMArtSerializacionReg;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMArtSerializacionReg = class(TDataModule)
     TLocal: THYTransaction;
     QMArtSerializacion: TFIBTableSet;
     DSQMArtSerializacion: TDataSource;
     SPGeneraCodigo: THYFIBQuery;
     xAlmacenes: TFIBDataSetRO;
     DSxAlmacenes: TDataSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     SPGeneraResto: THYFIBQuery;
     SPCalculaGarantia: THYFIBQuery;
     QMImpresion: TFIBTableSet;
     QMImpresionUSUARIO: TIntegerField;
     QMImpresionARTICULO: TFIBStringField;
     QMImpresionNUM_SERIE: TFIBStringField;
     QMImpresionDESCRIPCION: TFIBStringField;
     QGen: THYFIBQuery;
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
     QMArtSerializacionCONTADOR: TIntegerField;
     procedure DMArtSerializacionCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMArtSerializacionBeforePost(DataSet: TDataSet);
     procedure QMArtSerializacionNewRecord(DataSet: TDataSet);
     procedure QMArtSerializacionALMACENChange(Sender: TField);
     procedure QMArtSerializacionAfterOpen(DataSet: TDataSet);
     procedure QMArtSerializacionARTICULOChange(Sender: TField);
     procedure QMArtSerializacionAfterPost(DataSet: TDataSet);
     procedure QMImpresionNewRecord(DataSet: TDataSet);
  private
     { Private dclarations }
     function CalculaGarantia(Articulo: string): TDateTime;
  public
     { Public declarations }
     SerieDat, TipoDat, AlmacenDat, ArticuloDat: string;
     RigDat, LineaDat: integer;
     FechaDat: TDateTime;
     UnidadesDat: double;
     CanalDat: smallint;
     procedure DameCodigo(var codigo, contador: integer; var codigostr: string);
     procedure AbreDatos(Serie, Tipo, Almacen, Articulo: string; Rig, Linea: integer; Fecha: TDateTime; Unidades: double; Estado: integer);
     procedure GeneraResto;
     function DameSerie: string;
     procedure BusquedaCompleja;
     procedure AnyadeEtiquetas(Descripcion, NumSerie: string);
     function DameEstado: string;
  end;

var
  DMArtSerializacionReg : TDMArtSerializacionReg;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMArtSerializacionReg.DMArtSerializacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMImpresion.Open;
end;

procedure TDMArtSerializacionReg.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMArtSerializacionReg.QMArtSerializacionBeforePost(DataSet: TDataSet);
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

procedure TDMArtSerializacionReg.DameCodigo(var codigo, contador: integer; var codigostr: string);
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

procedure TDMArtSerializacionReg.QMArtSerializacionNewRecord(DataSet: TDataSet);
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
  QMArtSerializacionFECHA_GARANTIA_PROVEEDOR.AsDateTime := REntorno.FechaTrab;

  {Sugerimos como fecha de garantía de cliente la del sistema más la garantía
   que ponemos a nuestro artículo, sólo si estamos en ventas }

  if (TipoDat = 'RGS') then
  begin
     QMArtSerializacionFECHA_GARANTIA_CLIENTE.AsDateTime :=
        CalculaGarantia(ArticuloDat);
     QMArtSerializacionESTADO.AsInteger := 0;
  end
  else
     QMArtSerializacionESTADO.AsInteger := 1;

  if UnidadesDat < 0 then
     QMArtSerializacionSIGNO.AsInteger := 1
  else
     QMArtSerializacionSIGNO.AsInteger := 0;
end;

procedure TDMArtSerializacionReg.QMArtSerializacionALMACENChange(Sender: TField);
begin
  with xAlmacenes do
  begin
     Close;
     Open;
  end;
end;

procedure TDMArtSerializacionReg.QMArtSerializacionAfterOpen(DataSet: TDataSet);
begin
  xAlmacenes.Open;
  xArticulos.Open;
end;

procedure TDMArtSerializacionReg.QMArtSerializacionARTICULOChange(Sender: TField);
begin
  with xArticulos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMArtSerializacionReg.AbreDatos(Serie, Tipo, Almacen, Articulo: string; Rig, Linea: integer; Fecha: TDateTime; Unidades: double; Estado: integer);
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
  CanalDat := REntorno.Canal;

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

procedure TDMArtSerializacionReg.GeneraResto;
begin
  with SPGeneraResto do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalDat;
     Params.ByName['SERIE'].AsString := SerieDat;
     Params.ByName['TIPO'].AsString := TipoDat;
     Params.ByName['RIG'].AsInteger := RigDat;
     Params.ByName['LINEA'].AsInteger := LineaDat;
     Params.ByName['FECHA_ENT'].AsDateTime := REntorno.FechaTrab;
     ExecQuery;
     if (FieldByName['CUANTOS'].AsInteger > 0) then
        ShowMessage(Format(_('Números de serie generados: %d'), [FieldByName['CUANTOS'].AsInteger]))
     else
        ShowMessage(_('Los números de serie ya estaban generados'));
     FreeHandle;
  end;

  with QMArtSerializacion do
  begin
     Close;
     Open;
  end;
end;

procedure TDMArtSerializacionReg.QMArtSerializacionAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  QMArtSerializacion.Refresh;
end;

function TDMArtSerializacionReg.DameSerie: string;
begin
  Result := QMArtSerializacionNSERIE.AsString;
end;

procedure TDMArtSerializacionReg.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMArtSerializacion, '11110', True, SerieDat);
end;

function TDMArtSerializacionReg.CalculaGarantia(Articulo: string): TDateTime;
begin
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

procedure TDMArtSerializacionReg.AnyadeEtiquetas(Descripcion, NumSerie: string);
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

procedure TDMArtSerializacionReg.QMImpresionNewRecord(DataSet: TDataSet);
begin
  QMImpresionUSUARIO.AsInteger := REntorno.Usuario;
end;

function TDMArtSerializacionReg.DameEstado: string;
begin
  if TipoDat = 'RGE' then
     Result := '0'
  else
     Result := '1';
end;

end.
