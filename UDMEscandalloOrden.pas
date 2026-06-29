unit UDMEscandalloOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  HYFIBQuery, FIBDataSetRO;

type
  TDMEscandalloOrden = class(TDataModule)
     TLocal: THYTransaction;
     QMEscandallo: TFIBTableSet;
     DSQMEscandallo: TDataSource;
     DSQMEscandalloDet: TDataSource;
     QMEscandalloDet: TFIBTableSet;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     QMEscandalloDetEMPRESA: TIntegerField;
     QMEscandalloDetEJERCICIO: TIntegerField;
     QMEscandalloDetCANAL: TIntegerField;
     QMEscandalloDetORDEN: TIntegerField;
     QMEscandalloDetARTICULO: TFIBStringField;
     QMEscandalloDetNUMERO: TIntegerField;
     QMEscandalloDetDETALLE: TFIBStringField;
     QMEscandalloDetCANTIDAD: TFloatField;
     QMEscandalloDetTITULO: TFIBStringField;
     QMEscandalloDetP_COSTE: TFloatField;
     QMEscandalloEMPRESA: TIntegerField;
     QMEscandalloEJERCICIO: TIntegerField;
     QMEscandalloCANAL: TIntegerField;
     QMEscandalloORDEN: TIntegerField;
     QMEscandalloARTICULO: TFIBStringField;
     QMEscandalloNUMERO: TIntegerField;
     QMEscandalloUNIDADES: TFloatField;
     QMEscandalloFECHA_DESDE: TDateTimeField;
     QMEscandalloFECHA_HASTA: TDateTimeField;
     QMEscandalloACTIVO: TIntegerField;
     QMEscandalloCOSTE: TFloatField;
     QMEscandalloDetCOSTE: TFloatField;
     QMEscandalloDetCANTFIN: TFloatField;
     QMEscandalloDetLINEA: TIntegerField;
     QMEscandalloDetFAMILIA: TFIBStringField;
     QMEscandalloSERIE: TFIBStringField;
     QMEscandalloDetSERIE: TFIBStringField;
     QMEscandalloDetCANTIDAD_INICIAL: TFloatField;
     QMEscandalloDetCOSTE_INICIAL: TFloatField;
     QMLotes: TFIBTableSet;
     DSQMLotes: TDataSource;
     QMLotesEMPRESA: TIntegerField;
     QMLotesEJERCICIO: TIntegerField;
     QMLotesCANAL: TIntegerField;
     QMLotesORDEN: TIntegerField;
     QMLotesARTICULO: TFIBStringField;
     QMLotesNUMERO: TIntegerField;
     QMLotesDETALLE: TFIBStringField;
     QMLotesLINEA: TIntegerField;
     QMLotesLOTE: TFIBStringField;
     QMLotesN_SERIE: TFIBStringField;
     QMLotesCLASIFICACION: TFIBStringField;
     QMLotesF_FABRICACION: TDateTimeField;
     QMLotesF_ENVASADO: TDateTimeField;
     QMLotesF_CADUCIDAD: TDateTimeField;
     QMLotesCANTIDAD: TFloatField;
     QMLotesALMACEN: TFIBStringField;
     QMLotesID_A: TIntegerField;
     QMLotesPROVEEDOR: TIntegerField;
     QMLotesID_LOTE: TIntegerField;
     xOrden: TFIBDataSetRO;
     xOrdenALMACEN: TFIBStringField;
     QMEscandalloDetLINEAL_PORCENTUAL: TIntegerField;
     QMLotesPOR_CANTIDAD: TFloatField;
     QMLotesPRIORIDAD: TIntegerField;
     TUpdate: THYTransaction;
     QMLotesSERIE: TFIBStringField;
     procedure DMEscandalloOrdenCreate(Sender: TObject);
     procedure QMEscandalloAfterOpen(DataSet: TDataSet);
     procedure QMEscandalloDetNewRecord(DataSet: TDataSet);
     procedure QMEscandalloARTICULOChange(Sender: TField);
     procedure QMEscandalloAfterPost(DataSet: TDataSet);
     procedure QMEscandalloDetDETALLEChange(Sender: TField);
     procedure QMEscandalloDetBeforePost(DataSet: TDataSet);
     procedure QMLotesNewRecord(DataSet: TDataSet);
     procedure QMLotesLOTEChange(Sender: TField);
     procedure QMLotesAfterDelete(DataSet: TDataSet);
     procedure QMLotesAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     Orden: integer;
     Serie: string;
     Total_Fabricacion: double;
     function DameMascaraUnidad(Decimales: integer): string;
     function DameUnidadesResto: double;
     function DameTotalUnidades: double;
     procedure CierraAbreLotes(Tabla: TDataSet);
     procedure RellenaDatosArticulo;
  public
     { Public declarations }
     procedure AbreMaestro(aOrden: integer; aSerie: string);
     function DameDetalle: string;
     function DameAlmacen: string;
     procedure AbrirLotes;
     function DameTotalFabricacion: string;
     function CompruebaTotalLotes: boolean;
     function HayDetalle: boolean;
     function TieneLotes: boolean;
  end;

var
  DMEscandalloOrden : TDMEscandalloOrden;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMEscandalloOrden.DMEscandalloOrdenCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Ponemos las máscaras
  QMEscandalloUNIDADES.DisplayFormat := MascaraI;
  QMEscandalloCOSTE.DisplayFormat := MascaraN;
  QMEscandalloDetCOSTE_INICIAL.DisplayFormat := MascaraN;
  QMEscandalloDetCANTIDAD_INICIAL.DisplayFormat := MascaraKri;
  QMEscandalloDetCOSTE.DisplayFormat := MascaraE;
  QMEscandalloDetCANTFIN.DisplayFormat := MascaraKri;
  QMEscandalloDetCOSTE.DisplayFormat := MascaraN;
  QMEscandalloDetCANTIDAD.DisplayFormat := MascaraKri;

  // Mascaras en Lotes
  QMLotesPOR_CANTIDAD.DisplayFormat := MascaraP;
end;

procedure TDMEscandalloOrden.AbreMaestro(aOrden: integer; aSerie: string);
begin
  Orden := aOrden;
  Serie := aSerie;

  // Abrimos la tabla maestra
  DMMain.FiltraTabla(QMEscandallo, '11100', False);
  QMEscandallo.Params.ByName['SERIE'].AsString := Serie;
  QMEscandallo.Params.ByName['ORDEN'].AsInteger := Orden;
  QMEscandallo.Open;
end;

procedure TDMEscandalloOrden.QMEscandalloAfterOpen(DataSet: TDataSet);
begin
  // Abrimos las tablas hijas
  QMEscandalloDet.Open;
  xArticulos.Open;
  xOrden.Open;
  QMLotes.Open;
end;

procedure TDMEscandalloOrden.QMEscandalloDetNewRecord(DataSet: TDataSet);
begin
  // Si el maestro está en modo de inserción o edición, lo grabamos antes
  if (QMEscandallo.State = dsEdit) then
  begin
     QMEscandallo.Post;
     QMEscandalloDet.Edit;
  end;

  // Valores por defecto
  QMEscandalloDetEMPRESA.AsInteger := REntorno.Empresa;
  QMEscandalloDetEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMEscandalloDetCANAL.AsInteger := REntorno.Canal;
  QMEscandalloDetSERIE.AsString := QMEscandalloSERIE.AsString;
  QMEscandalloDetORDEN.AsInteger := QMEscandalloORDEN.AsInteger;
  QMEscandalloDetARTICULO.AsString := QMEscandalloARTICULO.AsString;
  QMEscandalloDetNUMERO.AsInteger := QMEscandalloNUMERO.AsInteger;
  QMEscandalloDetCANTIDAD.AsFloat := 1;
  QMEscandalloDetCOSTE.AsFloat := 0;
  QMEscandalloDetCANTIDAD_INICIAL.AsFloat := 0;
  QMEscandalloDetCOSTE_INICIAL.AsFloat := 0;
end;

procedure TDMEscandalloOrden.QMEscandalloARTICULOChange(Sender: TField);
begin
  // Cambio de Título del artículo
  with xArticulos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMEscandalloOrden.QMEscandalloAfterPost(DataSet: TDataSet);
begin
  // Refresco los datos
  QMEscandallo.Close;
  AbreMaestro(Orden, Serie);
end;

procedure TDMEscandalloOrden.RellenaDatosArticulo;
var
  Q : THYFIBQuery;
begin
  // Obtenemos el título y familia del artículo
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO_LARGO AS TITULO, FAMILIA FROM ART_ARTICULOS WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := QMEscandalloDetDETALLE.AsString;
        ExecQuery;
        QMEscandalloDetTITULO.AsString := FieldByName['TITULO'].AsString;
        QMEscandalloDetFAMILIA.AsString := FieldByName['FAMILIA'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMEscandalloOrden.QMEscandalloDetDETALLEChange(Sender: TField);
begin
  RellenaDatosArticulo;
end;

procedure TDMEscandalloOrden.QMEscandalloDetBeforePost(DataSet: TDataSet);
begin
  if (QMEscandalloDetCANTIDAD.AsString = '') then
     QMEscandalloDetCANTIDAD.AsFloat := 1;
  if (QMEscandalloDetCANTIDAD_INICIAL.AsString = '') then
     QMEscandalloDetCANTIDAD.AsFloat := 1;
  if (QMEscandalloDetfamilia.AsString <= '') then
     RellenaDatosArticulo;
end;

procedure TDMEscandalloOrden.QMLotesNewRecord(DataSet: TDataSet);
begin
  if (QMEscandalloDet.State = dsEdit) then
     QMEscandalloDet.Post;

  QMLotesEMPRESA.AsInteger := REntorno.Empresa;
  QMLotesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMLotesCANAL.AsInteger := REntorno.Canal;
  QMLotesORDEN.AsInteger := QMEscandalloDetORDEN.AsInteger;
  QMLotesSERIE.AsString := QMEscandalloSERIE.AsString;
  QMLotesDETALLE.AsString := QMEscandalloDetDETALLE.AsString;
  QMLotesLINEA.AsInteger := QMEscandalloDetLINEA.AsInteger;
  QMLotesARTICULO.AsString := QMEscandalloARTICULO.AsString;
  QMLotesNUMERO.AsInteger := QMEscandalloNUMERO.AsInteger;
  QMLotesCANTIDAD.AsFloat := DameUnidadesResto;
end;

procedure TDMEscandalloOrden.QMLotesLOTEChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ');
        SQL.Add(' SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO, F_CADUCIDAD, ALMACEN, ID_A, PROVEEDOR, ID_LOTE ');
        SQL.Add(' FROM ART_ARTICULOS_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' CANAL=?CANAL AND ');
        SQL.Add(' ALMACEN=?ALMACEN AND ');
        SQL.Add(' ARTICULO=?ARTICULO AND ');
        SQL.Add(' LOTE=?LOTE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := xOrdenALMACEN.AsString;
        Params.ByName['ARTICULO'].AsString := QMLotesDETALLE.AsString;
        Params.ByName['LOTE'].AsString := Sender.AsString;
        ExecQuery;
        QMLotesN_SERIE.AsString := FieldByName['SERIE'].AsString;
        QMLotesCLASIFICACION.AsString := FieldByName['CLASIFICACION'].AsString;
        QMLotesF_FABRICACION.AsDateTime := FieldByName['F_FABRICACION'].AsDateTime;
        QMLotesF_ENVASADO.AsDateTime := FieldByName['F_ENVASADO'].AsDateTime;
        QMLotesF_CADUCIDAD.AsDateTime := FieldByName['F_CADUCIDAD'].AsDateTime;
        QMLotesALMACEN.AsString := FieldByName['ALMACEN'].AsString;
        QMLotesID_A.AsInteger := FieldByName['ID_A'].AsInteger;
        QMLotesPROVEEDOR.AsInteger := FieldByName['PROVEEDOR'].AsInteger;
        QMLotesID_LOTE.AsInteger := FieldByName['ID_LOTE'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMEscandalloOrden.DameAlmacen: string;
begin
  Result := xOrdenALMACEN.AsString;
end;

function TDMEscandalloOrden.DameDetalle: string;
begin
  Result := QMEscandalloDetDETALLE.AsString;
end;

procedure TDMEscandalloOrden.AbrirLotes;
begin
  with QMLotes do
  begin
     Close;
     Open;
  end;
end;

function TDMEscandalloOrden.DameTotalFabricacion: string;
var
  //Unidades : double;
  Decimales : integer;
  MascaraLotes : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT (O.UNIDADES / EO.UNIDADES) * D.CANTIDAD UNIDADES_NECESARIAS ');
        SQL.Add(' FROM ART_ORDENES_PRODUCCION O ');
        SQL.Add(' JOIN ART_ARTICULOS_ESC_ORDEN EO ON EO.EMPRESA = O.EMPRESA AND EO.EJERCICIO = O.EJERCICIO AND EO.CANAL = O.CANAL AND EO.SERIE = O.SERIE AND EO.ORDEN = O.NORDEN ');
        SQL.Add(' JOIN ART_ARTICULOS_ESC_ORDEN_DETALLE D ON D.EMPRESA = O.EMPRESA AND D.EJERCICIO = O.EJERCICIO AND D.CANAL = O.CANAL AND D.SERIE = O.SERIE AND D.ORDEN = O.NORDEN ');
        SQL.Add(' JOIN ART_ARTICULOS_ESC_PRODUCCION E ON O.EMPRESA = E.EMPRESA AND O.ARTICULO = E.ARTICULO AND O.ESCANDALLO = E.NUMERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' O.EMPRESA = :EMPRESA AND ');
        SQL.Add(' O.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' O.CANAL = :CANAL AND ');
        SQL.Add(' O.SERIE = :SERIE AND ');
        SQL.Add(' O.NORDEN = :NORDEN AND ');
        SQL.Add(' LINEA = :LINEA ');
        Params.ByName['EMPRESA'].AsInteger := QMEscandalloDetEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMEscandalloDetEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMEscandalloDetCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMEscandalloDetSERIE.AsString;
        Params.ByName['NORDEN'].AsInteger := QMEscandalloDetORDEN.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMEscandalloDetLINEA.AsInteger;
        ExecQuery;
        Total_Fabricacion := FieldByName['UNIDADES_NECESARIAS'].AsFloat;
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
        SQL.Add(' SELECT DECIMALES FROM SYS_UNIDADES_ARTICULOS UDS ');
        SQL.Add(' JOIN ART_ARTICULOS ART ON UDS.TIPO = ART.UNIDADES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ART.EMPRESA = :EMPRESA AND ');
        SQL.Add(' ART.ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := QMEscandalloDetEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMEscandalloDetDETALLE.AsString;
        ExecQuery;
        Decimales := FieldByName['DECIMALES'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  MascaraLotes := DameMascaraUnidad(Decimales);

  // Asignamos la mascara de las unidades del artículo a la cantidad de los lotes
  QMLotesCANTIDAD.DisplayFormat := MascaraLotes;

  Result := FormatFloat(MascaraLotes, Total_Fabricacion);
end;

function TDMEscandalloOrden.DameMascaraUnidad(Decimales: integer): string;
var
  i : integer;
begin
  Result := '#,0.';
  for i := 1 to Decimales do
     Result := Result + '0';
end;

function TDMEscandalloOrden.DameUnidadesResto: double;
begin
  // Result := 0;
  if (QMLotes.RecordCount = 0) then
     Result := Total_Fabricacion
  else
     Result := (Total_Fabricacion - DameTotalUnidades);
end;

function TDMEscandalloOrden.CompruebaTotalLotes: boolean;
begin
  Result := True;
  if (ArticuloLoteable(QMEscandalloDetDETALLE.AsString)) then
     Result := Abs(Total_Fabricacion - DameTotalUnidades) < 0.01;
end;

function TDMEscandalloOrden.DameTotalUnidades: double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(CANTIDAD) AS CANTIDAD FROM ART_ARTICULOS_ESC_ORDEN_D_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' ORDEN = :ORDEN AND ');
        SQL.Add(' DETALLE = :DETALLE AND ');
        SQL.Add(' LINEA = :LINEA ');
        Params.ByName['EMPRESA'].AsInteger := QMEscandalloDetEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMEscandalloDetEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMEscandalloDetCANAL.AsInteger;
        Params.ByName['ORDEN'].AsInteger := QMEscandalloDetORDEN.AsInteger;
        Params.ByName['DETALLE'].AsString := QMEscandalloDetDETALLE.AsString;
        Params.ByName['LINEA'].AsInteger := QMEscandalloDetLINEA.AsInteger;
        ExecQuery;
        Result := FieldByName['CANTIDAD'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEscandalloOrden.QMLotesAfterDelete(DataSet: TDataSet);
begin
  if (DataSet.RecordCount > 0) then
     CierraAbreLotes(DataSet)
  else
  begin
     DataSet.Close;
     DataSet.Open;
  end;
end;

procedure TDMEscandalloOrden.CierraAbreLotes(Tabla: TDataSet);
var
  Mark : TBookmark;
begin
  Mark := Tabla.GetBookmark;
  try
     Tabla.DisableControls;
     Tabla.Close;
     Tabla.Open;
     Tabla.GotoBookmark(Mark);
  finally
     Tabla.EnableControls;
     Tabla.FreeBookmark(Mark);
  end;
end;

procedure TDMEscandalloOrden.QMLotesAfterPost(DataSet: TDataSet);
begin
  CierraAbreLotes(DataSet);
end;

function TDMEscandalloOrden.HayDetalle: boolean;
begin
  Result := (QMEscandalloDet.RecordCount > 0);
end;

function TDMEscandalloOrden.TieneLotes: boolean;
begin
  Result := (ArticuloLoteable(QMEscandalloDetDETALLE.AsString));
end;

end.
