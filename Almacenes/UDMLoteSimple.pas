unit UDMLoteSimple;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMLoteSimple = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMLoteSimple: TDataSource;
     QMLoteSimple: TFIBTableSet;
     QMLoteSimpleEMPRESA: TIntegerField;
     QMLoteSimpleLOTE_SIMPLE: TFIBStringField;
     QMLoteSimpleFAMILIA: TFIBStringField;
     QMLoteSimpleFECHA_INICIO: TDateTimeField;
     QMLoteSimpleNOTAS: TMemoField;
     QMLoteSimpleFECHA_CADUCIDAD: TDateTimeField;
     QMLoteSimpleARTICULO: TFIBStringField;
     QMLoteSimpleDISPONIBLE: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMLoteSimpleNewRecord(DataSet: TDataSet);
     procedure QMLoteSimpleARTICULOChange(Sender: TField);
     procedure QMLoteSimpleFECHA_INICIOChange(Sender: TField);
  private
     { Private declarations }
     FamiliaFiltro: string;
     procedure CalculaGarantia;
  public
     { Public declarations }
     procedure Filtrar(Familia: string);
     procedure CreaRango(Prefijo: string; Desde, Hasta, Longitud: integer; Articulo, Familia: string);
  end;

var
  DMLoteSimple : TDMLoteSimple;

implementation

uses UDMMain, DateUtils, UEntorno, HYFIBQuery;

{$R *.dfm}

procedure TDMLoteSimple.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMLoteSimpleFECHA_INICIO.DisplayFormat := ShortDateFormat;

  FamiliaFiltro := '';

  Filtrar(FamiliaFiltro);
end;

procedure TDMLoteSimple.DataModuleDestroy(Sender: TObject);
begin
  if TLocal.InTransaction then
     TLocal.Commit;
end;

procedure TDMLoteSimple.Filtrar(Familia: string);
begin
  FamiliaFiltro := Trim(Familia);

  with QMLoteSimple do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ART_LOTE_SIMPLE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA=:EMPRESA ');
     if (FamiliaFiltro > '') then
        SelectSQL.Add(' AND FAMILIA = :FAMILIA ');
     SelectSQL.Add(' ORDER BY LOTE_SIMPLE ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (FamiliaFiltro > '') then
        Params.ByName['FAMILIA'].AsString := FamiliaFiltro;

     Open;
  end;
end;

procedure TDMLoteSimple.QMLoteSimpleNewRecord(DataSet: TDataSet);
begin
  QMLoteSimpleEMPRESA.AsInteger := REntorno.Empresa;
  QMLoteSimpleFECHA_INICIO.AsDateTime := Today;
  QMLoteSimpleDISPONIBLE.AsInteger := 1;
end;

procedure TDMLoteSimple.QMLoteSimpleARTICULOChange(Sender: TField);
begin
  CalculaGarantia;
end;

procedure TDMLoteSimple.QMLoteSimpleFECHA_INICIOChange(Sender: TField);
begin
  CalculaGarantia;
end;

procedure TDMLoteSimple.CalculaGarantia;
begin
  if (QMLoteSimpleARTICULO.AsString = '') then
     QMLoteSimpleFECHA_CADUCIDAD.AsDateTime := QMLoteSimpleFECHA_INICIO.AsDateTime + 15
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE A_ART_CALCULA_GARANTIA (:EMPRESA, :CANAL, :ARTICULO,  :FECHA)';
           Params.ByName['EMPRESA'].AsInteger := QMLoteSimpleEMPRESA.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ARTICULO'].AsString := QMLoteSimpleARTICULO.AsString;
           Params.ByName['FECHA'].AsDateTime := QMLoteSimpleFECHA_INICIO.AsDateTime;
           ExecQuery;
           QMLoteSimpleFECHA_CADUCIDAD.AsDateTime := FieldByName['FECHA_GARANTIA'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMLoteSimple.CreaRango(Prefijo: string; Desde, Hasta, Longitud: integer; Articulo, Familia: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO ART_LOTE_SIMPLE ( ');
        SQL.Add(' EMPRESA, LOTE_SIMPLE, FAMILIA, FECHA_INICIO, ARTICULO) ');
        SQL.Add(' SELECT :EMPRESA, CAST(:PREFIJO AS VARCHAR(20)) || (SELECT STR FROM XUT_STRZERO(NUMERO, :LONGITUD, ''0'')), :FAMILIA, :FECHA_INICIO, :ARTICULO ');
        SQL.Add(' FROM UT_DAME_RANGO_NUMEROS(:DESDE, :HASTA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FAMILIA'].AsString := Familia;
        Params.ByName['FECHA_INICIO'].AsDateTime := Today;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['PREFIJO'].AsString := Prefijo;
        Params.ByName['LONGITUD'].AsInteger := Longitud;
        Params.ByName['DESDE'].AsInteger := Desde;
        Params.ByName['HASTA'].AsInteger := Hasta;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMLoteSimple.Close;
  QMLoteSimple.Open;
end;

end.
