unit UDMUnidadesExtGes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, Math;

type
  TDMUnidadesExtGes = class(TDataModule)
     TLocal: THYTransaction;
     QMUnidadesExt: TFIBTableSet;
     DSQMUnidadesExt: TDataSource;
     QMUnidadesExtEMPRESA: TIntegerField;
     QMUnidadesExtEJERCICIO: TIntegerField;
     QMUnidadesExtCANAL: TIntegerField;
     QMUnidadesExtSERIE: TFIBStringField;
     QMUnidadesExtTIPO: TFIBStringField;
     QMUnidadesExtRIG: TIntegerField;
     QMUnidadesExtLINEA: TIntegerField;
     QMUnidadesExtUNIDADES: TIntegerField;
     QMUnidadesExtMEDIDA1: TFloatField;
     QMUnidadesExtMEDIDA2: TFloatField;
     QMUnidadesExtMEDIDA3: TFloatField;
     QMUnidadesExtMEDIDA4: TFloatField;
     QMUnidadesExtPRECIO: TFloatField;
     TUpdate: THYTransaction;
     procedure DMUnidadesExtCreate(Sender: TObject);
     procedure QMUnidadesExtAfterPost(DataSet: TDataSet);
     procedure QMUnidadesExtNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     Empresa, Ejercicio, Canal: integer;
     Serie, Tipo: string;
     Rig, Linea: integer;
     Articulo: string;
     TipoLinea: string;
     id_p_old: integer;
     function VerificaMultiplo(Numero: double; UnidadExt: integer): double;
  public
     { Public declarations }
     MonedaDoc: string;
     Estado: integer;
     Multiplo1, Multiplo2, Multiplo3, Multiplo4, FactorEscala, ud_min_compra, ud_min_venta, Factor: double;
     Unidades: integer;
     Unidad: string;
     procedure FiltraLinea(aEmpresa, aEjercicio, aCanal: integer; aSerie, aTipo: string; aRig, aLinea: integer; aArticulo, aTipoLinea: string; aEstado, aid_p: integer);
     procedure FiltraPrecio(Articulo, Tarifa: string; Cliente, id_a: integer; Factor: double);
     function DameUnidades: double;
  end;

var
  DMUnidadesExtGes : TDMUnidadesExtGes;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMUnidadesExtGes.DMUnidadesExtCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // DMMain.FiltraTabla(QMUnidadesExt, '11110', 1 = 0);
  // QMUnidadesExtPRECIO.DisplayFormat := MascaraL;
end;

procedure TDMUnidadesExtGes.FiltraLinea(aEmpresa, aEjercicio, aCanal: integer; aSerie, aTipo: string; aRig, aLinea: integer; aArticulo, aTipoLinea: string; aEstado, aid_p: integer);
begin
  Empresa := aEmpresa;
  Ejercicio := aEjercicio;
  Canal := aCanal;
  Serie := aSerie;
  Tipo := aTipo;
  Rig := aRig;
  Linea := aLinea;

  Articulo := aArticulo;
  TipoLinea := aTipoLinea;
  id_p_old := aid_p;
  Estado := aEstado;

  with QMUnidadesExt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
  end;

  if (QMUnidadesExt.RecordCount = 0) then
     QMUnidadesExt.Insert
  else
     QMUnidadesExt.Edit;

  if (Estado = 2) then
     QMUnidadesExt.Cancel;
end;

procedure TDMUnidadesExtGes.QMUnidadesExtAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMUnidadesExtGes.QMUnidadesExtNewRecord(DataSet: TDataSet);
begin
  QMUnidadesExtEMPRESA.AsInteger := Empresa;
  QMUnidadesExtEJERCICIO.AsInteger := Ejercicio;
  QMUnidadesExtCANAL.AsInteger := Canal;
  QMUnidadesExtSERIE.AsString := Serie;
  QMUnidadesExtTIPO.AsString := Tipo;
  QMUnidadesExtRIG.AsInteger := Rig;
  QMUnidadesExtLINEA.AsInteger := Linea;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MULTIPLO_1, MULTIPLO_2, MULTIPLO_3, MULTIPLO_4 FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        QMUnidadesExtMEDIDA1.AsFloat := FieldByName['MULTIPLO_1'].AsFloat;
        QMUnidadesExtMEDIDA2.AsFloat := FieldByName['MULTIPLO_2'].AsFloat;
        QMUnidadesExtMEDIDA3.AsFloat := FieldByName['MULTIPLO_3'].AsFloat;
        QMUnidadesExtMEDIDA4.AsFloat := FieldByName['MULTIPLO_4'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMUnidadesExtGes.DameUnidades: double;
var
  i, Decimales : integer;
  aFieldName : string;
  Medida : double;
begin
  Result := 1;

  // Nos aseguramos que las MEDIDAx sean Multiplos de ART_ARTICULO.MULTIPLO_x
  for i := 1 to Unidades do
  begin
     aFieldName := format('MEDIDA%d', [i]);
     Medida := QMUnidadesExt.FieldByName(aFieldName).AsFloat;
     Medida := VerificaMultiplo(Medida, i);
     Result := Result * Medida;

     if (QMUnidadesExt.FieldByName(aFieldName).AsFloat <> Medida) then
     begin
        QMUnidadesExt.Edit;
        QMUnidadesExt.FieldByName(aFieldName).AsFloat := Medida;
        QMUnidadesExt.Post;
     end;

     if (FactorEscala > 0) then
        Result := Result / FactorEscala;
  end;

  Decimales := DMMain.DameDecimalesUnidad(Unidad);
  Result := Result * (power(10, Decimales));
  Result := Round(Result);
  Result := Result / (power(10, Decimales));

  if (Result < ud_min_venta) then
     Result := ud_min_venta;
end;

procedure TDMUnidadesExtGes.FiltraPrecio(Articulo, Tarifa: string; Cliente, id_a: integer; Factor: double);
begin
  QMUnidadesExtPRECIO.DisplayFormat := DMMain.MascaraMoneda(MonedaDoc, 0);

  if QMUnidadesExt.State = dsInsert then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT * FROM G_PRECIO_VENTA_MONEDA(:EMPRESA, :CLIENTE, :ARTICULO, :TARIFA, :FECHA, :EJERCICIO, :CANAL, ');
           SQL.Add(' :UNIDADES_EXT, :PRECIOP, :UNIDADES, :MONEDA, :ID_A, :UNIDADES_OLD, :IDIOMA, :TIPO_LINEA, :ID_P_OLD, :ALMACEN, :FACTOR) ');
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['CLIENTE'].AsInteger := Cliente;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['UNIDADES_EXT'].AsFloat := 1;
           Params.ByName['PRECIOP'].AsFloat := 0;
           Params.ByName['UNIDADES'].AsFloat := 0;
           Params.ByName['MONEDA'].AsString := MonedaDoc;
           Params.ByName['ID_A'].AsInteger := id_a;
           Params.ByName['UNIDADES_OLD'].AsFloat := 0;
           Params.ByName['IDIOMA'].AsString := 'CAS';
           Params.ByName['TIPO_LINEA'].AsString := TipoLinea;
           Params.ByName['ID_P_OLD'].AsInteger := id_p_old;
           Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
           Params.ByName['FACTOR'].AsFloat := Factor;
           ExecQuery;
           QMUnidadesExtPRECIO.AsFloat := FieldByName['PRECIO'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMUnidadesExtGes.VerificaMultiplo(Numero: double; UnidadExt: integer): double;
var
  Resto, Multiplo : double;
  Divisor : integer;
begin
  /// Verifica que el [Numero] sea multiplo de la medida de ART_ARTICULOS.MULTIPLO_x.
  /// Si no lo es, incrementa [Numero] hasta que lo sea.

  Multiplo := 1;

  case UnidadExt of
     0: Multiplo := 1;
     1: Multiplo := Multiplo1;
     2: Multiplo := Multiplo2;
     3: Multiplo := Multiplo3;
     4: Multiplo := Multiplo4;
  end;

  if (Numero < Multiplo) then
  begin
     Numero := Multiplo;
     Multiplo := 1;
  end;

  if (Multiplo = 0) then
     Multiplo := 1;

  Resto := (Numero / Multiplo);
  Resto := Trunc(Resto) * Multiplo;
  Resto := Numero - Resto;
  if ((Resto = 0) or (Multiplo = 1)) then
     Result := Numero
  else
  begin
     Divisor := Trunc(Numero / Multiplo);
     Result := Multiplo * (Divisor + 1);
  end;
end;

procedure TDMUnidadesExtGes.DataModuleDestroy(Sender: TObject);
begin
  if QMUnidadesExt.State in [dsInsert, dsEdit] then
  begin
     if Estado = 2 then
        QMUnidadesExt.Cancel
     else
        QMUnidadesExt.Post;
  end;
end;

end.
