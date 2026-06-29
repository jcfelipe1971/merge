unit UDMRemuneraciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMRemuneraciones = class(TDataModule)
     DSQMNomRemu: TDataSource;
     QMNomRemu: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMNomRemuID: TIntegerField;
     QMNomRemuEMPRESA: TIntegerField;
     QMNomRemuEJERCICIO: TIntegerField;
     QMNomRemuCANAL: TIntegerField;
     QMNomRemuPERIODO: TFIBStringField;
     QMNomRemuCODIGO: TFIBStringField;
     QMNomRemuORDEN_IMPRESION: TIntegerField;
     QMNomRemuEXPORTAR: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     function ExistePeriodo(Periodo: string): boolean;
     procedure InsertaPeriodo(Periodo: string);
  end;

var
  DMRemuneraciones : TDMRemuneraciones;

implementation

uses
  UDMMain, HYFIBQuery, UEntorno;

{$R *.dfm}

procedure TDMRemuneraciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMNomRemu.Open;
end;

function TDMRemuneraciones.ExistePeriodo(Periodo: string): boolean;
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT * FROM EMP_NOMINAS_REMUNERACION ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SelectSQL.Add(' CANAL = ?CANAL AND ');
           SelectSQL.Add(' PERIODO = ?PERIODO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           Open;

           Result := RecordCount > 0
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMRemuneraciones.InsertaPeriodo(Periodo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO EMP_NOMINAS_REMUNERACION ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, PERIODO, CODIGO) ');
        SQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, P.PERIODO, C.CODIGO ');
        SQL.Add(' FROM EMP_CONCEPTO_HABERES C ');
        SQL.Add(' JOIN EMP_PERIODOS P ON C.EMPRESA = P.EMPRESA AND C.EJERCICIO = P.EJERCICIO AND P.TIPO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' P.PERIODO = :PERIODO ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, P.PERIODO, C.CODIGO ');
        SQL.Add(' FROM EMP_CONCEPTO_DESCUENTOS C ');
        SQL.Add(' JOIN EMP_PERIODOS P ON C.EMPRESA = P.EMPRESA AND C.EJERCICIO = P.EJERCICIO AND P.TIPO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' P.PERIODO = :PERIODO ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, P.PERIODO, C.CODIGO ');
        SQL.Add(' FROM EMP_CONCEPTO_PARAMETROS C ');
        SQL.Add(' JOIN EMP_PERIODOS P ON C.EMPRESA = P.EMPRESA AND C.EJERCICIO = P.EJERCICIO AND P.TIPO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' P.PERIODO = :PERIODO ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := Periodo;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
