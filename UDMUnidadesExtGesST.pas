unit UDMUnidadesExtGesST;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery;

type
  TDMUnidadesExtGesST = class(TDataModule)
     TLocal: THYTransaction;
     QMUnidadesExt: TFIBTableSet;
     DSQMUnidadesExt: TDataSource;
     QMUnidadesExtEMPRESA: TIntegerField;
     QMUnidadesExtEJERCICIO: TIntegerField;
     QMUnidadesExtSERIE: TFIBStringField;
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
  private
     { Private declarations }
     Empresa, Ejercicio, Canal: integer;
     Serie, TipoOper: string;
     Rig, Linea: integer;
     Articulo: string;
  public
     { Public declarations }
     Estado: integer;
     Multiplo1, Multiplo2, Multiplo3, Multiplo4: double;
     Unidades: integer;
     procedure FiltraLinea(aEmpresa, aEjercicio, aCanal: integer; aSerie, aTipoOper: string; aRig, aLinea: integer; aArticulo: string; aEstado: integer);
     procedure FiltraPrecio(Articulo, Almacen, TipoOper: string; Canal: integer);
     function DameUnidades: double;
  end;

var
  DMUnidadesExtGesST : TDMUnidadesExtGesST;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMUnidadesExtGesST.DMUnidadesExtCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // DMMain.FiltraTabla(QMUnidadesExt, '11010', 1 = 0);
  QMUnidadesExtPRECIO.DisplayFormat := MascaraL;
end;

procedure TDMUnidadesExtGesST.FiltraLinea(aEmpresa, aEjercicio, aCanal: integer; aSerie, aTipoOper: string; aRig, aLinea: integer; aArticulo: string; aEstado: integer);
begin
  Empresa := aEmpresa;
  Ejercicio := aEjercicio;
  Canal := aCanal;
  Serie := aSerie;
  TipoOper := aTipoOper;
  Rig := aRig;
  Linea := aLinea;

  Articulo := aArticulo;
  Estado := aEstado;

  with QMUnidadesExt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
  end;

  if (QMUnidadesExt.RecordCount = 0) then
     QMUnidadesExt.Insert
  else
     QMUnidadesExt.Edit;
end;

procedure TDMUnidadesExtGesST.QMUnidadesExtAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMUnidadesExtGesST.QMUnidadesExtNewRecord(DataSet: TDataSet);
begin
  QMUnidadesExtEMPRESA.AsInteger := Empresa;
  QMUnidadesExtEJERCICIO.AsInteger := Ejercicio;
  QMUnidadesExtSerie.AsString := Serie;
  QMUnidadesExtRig.AsInteger := Rig;
  QMUnidadesExtLinea.AsInteger := Linea;

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

function TDMUnidadesExtGesST.DameUnidades: double;
var
  i : integer;
  aFieldName : string;
  Medida : double;
begin
  Result := 1;
  for i := 1 to Unidades do
  begin
     aFieldName := format('MEDIDA%d', [i]);
     Medida := QMUnidadesExt.FieldByName(aFieldName).AsFloat;
     Result := Result * Medida;
  end;
end;

procedure TDMUnidadesExtGesST.FiltraPrecio(Articulo, Almacen, TipoOper: string; Canal: integer);
begin
  if QMUnidadesExt.State = dsInsert then
     QMUnidadesExtPRECIO.AsFloat := DMMain.DamePrecioMovimientoArticulo(REntorno.Empresa, Canal, Articulo, Almacen, 1, TipoOper, 0);
end;

end.
