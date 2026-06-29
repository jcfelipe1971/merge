unit UDMAFPIndicadores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery, Dialogs;

type
  TDMAFPIndicadores = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMAFPIndicadores: TFIBTableSet;
     DSQMAFPIndicadores: TDataSource;
     QMAFPIndicadoresEMPRESA: TIntegerField;
     QMAFPIndicadoresEJERCICIO: TIntegerField;
     QMAFPIndicadoresCANAL: TIntegerField;
     QMAFPIndicadoresPERIODO: TFIBStringField;
     QMAFPIndicadoresCODIGO: TFIBStringField;
     QMAFPIndicadoresGLOSA: TFIBStringField;
     QMAFPIndicadoresTASA_AFP_DEPENDIENTE: TFloatField;
     QMAFPIndicadoresTASA_SIS_DEPENDIENTE: TFloatField;
     QMAFPIndicadoresTASA_AFP_INDEPENDIENTE: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     Periodo: string;
  public
     { Public declarations }
     procedure FiltraPeriodo(aPeriodo: string);
     procedure InsertaIndicadores;
  end;

var
  DMAFPIndicadores : TDMAFPIndicadores;

implementation

uses
  UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMAFPIndicadores.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMAFPIndicadores.FiltraPeriodo(aPeriodo: string);
begin
  Periodo := Trim(Copy(aPeriodo, 1, 2));

  with QMAFPIndicadores do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_AFP_EQUIVALENCIA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' PERIODO = :PERIODO ');
     SelectSQL.Add(' ORDER BY CODIGO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
     Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
     Params.ByName['PERIODO'].AsString := Periodo;
     Open;
  end;
end;

procedure TDMAFPIndicadores.InsertaIndicadores;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO EMP_AFP_INDICADORES ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, PERIODO, CODIGO_AFP) ');
        SQL.Add(' SELECT :EMPRESA, :EJERCICIO, :CANAL, :PERIODO, E.CODIGO ');
        SQL.Add(' FROM SYS_EQUIVALENCIAS_PREVIRED E ');
        SQL.Add(' WHERE ');
        SQL.Add(' E.ID_CLASIFICACION = 10 AND ');
        SQL.Add(' NOT EXISTS(SELECT CODIGO_AFP ');
        SQL.Add('            FROM EMP_AFP_INDICADORES ');
        SQL.Add('            WHERE ');
        SQL.Add('            EMPRESA = :EMPRESA AND ');
        SQL.Add('            EJERCICIO = :EJERCICIO AND ');
        SQL.Add('            CANAL = :CANAL AND ');
        SQL.Add('            PERIODO = :PERIODO AND ');
        SQL.Add('            CODIGO_AFP = E.CODIGO)');

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

  QMAFPIndicadores.Close;
  QMAFPIndicadores.Open;
end;

end.
