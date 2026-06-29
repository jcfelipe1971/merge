unit UDMAsignacionCodigoBarra;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMAsignacionCodigoBarra = class(TDataModule)
     TLocal: THYTransaction;
     QMCodigosBarra: TFIBTableSet;
     DSQMCodigosBarra: TDataSource;
     TUpdate: THYTransaction;
     QMCodigosBarraEMPRESA: TIntegerField;
     QMCodigosBarraARTICULO: TFIBStringField;
     QMCodigosBarraBARRAS: TFIBStringField;
     QMCodigosBarraTIPO: TIntegerField;
     QMCodigosBarraFUNCION: TIntegerField;
     QMCodigosBarraTITULO: TFIBStringField;
     QMCodigosBarraLONGITUD: TIntegerField;
     QMCodigosBarraID_A: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCodigosBarraBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     Tipo: integer;
  public
     { Public declarations }
     procedure RellenaTipoCodigoBarra(Lista: TStrings);
     procedure FiltraTipo(aTipo: integer);
     procedure Filtrar(Filtro: string);
     procedure NextCodigoBarra;
  end;

var
  DMAsignacionCodigoBarra : TDMAsignacionCodigoBarra;

implementation

uses
  UDMMain, UEntorno, HYFIBQuery;

{$R *.dfm}

procedure TDMAsignacionCodigoBarra.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMAsignacionCodigoBarra.FiltraTipo(aTipo: integer);
begin
  Tipo := aTipo;
  with QMCodigosBarra do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TIPO'].AsInteger := Tipo;
     Open;
  end;
end;

procedure TDMAsignacionCodigoBarra.RellenaTipoCodigoBarra(Lista: TStrings);
var
  Tipo : integer;
begin
  Lista.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT TIPO, TITULO FROM SYS_TIPO_CODIGO_BARRAS ');
           SelectSQL.Add('ORDER BY TIPO');
           Open;
           while not EOF do
           begin
              Tipo := FieldByName('TIPO').AsInteger;
              Lista.AddObject(FieldByName('TIPO').AsString, Pointer(Tipo));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsignacionCodigoBarra.Filtrar(Filtro: string);
begin
  /// Agregar condiciones al SQL;
  with QMCodigosBarra do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_ARTICULOS_BARRAS_INSERT ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' ((TIPO = :TIPO) OR (TIPO = 0)) ');
     SelectSQL.Add(' AND (' + Filtro + ') ');
     SelectSQL.Add(' ORDER BY ARTICULO, BARRAS ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TIPO'].AsInteger := Tipo;
     Open;
  end;
end;

procedure TDMAsignacionCodigoBarra.NextCodigoBarra;
begin
  /// Guardo y salto a siguiente linea

  with QMCodigosBarra do
  begin
     if (State = dsEdit) then
        Post;
     Next;
  end;
end;

procedure TDMAsignacionCodigoBarra.QMCodigosBarraBeforePost(DataSet: TDataSet);
begin
  if (QMCodigosBarraTIPO.AsInteger = 0) then
     QMCodigosBarraTIPO.AsInteger := Tipo;
  if (QMCodigosBarraFUNCION.AsInteger = 0) then
     QMCodigosBarraFUNCION.AsInteger := 0;
end;

end.
