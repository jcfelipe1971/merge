unit UDMAtributos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMAtributos = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMAtributos: TDataSource;
     QMAtributos: TFIBTableSet;
     QMAtributosID: TIntegerField;
     QMAtributosTIPO: TFIBStringField;
     QMAtributosATRIBUTO: TFIBStringField;
     QMAtributosTIPO_PADRE: TFIBStringField;
     QMAtributosID_PADRE: TIntegerField;
     procedure QMAtributosBeforePost(DataSet: TDataSet);
     procedure QMAtributosNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     Tipo: string;
  public
     { Public declarations }
     procedure RellenaTipoAtributo(Lista: TStrings; Todos: boolean = True);
     procedure FiltraTipo(aTipo: string);
     function DameTituloTipoAtributo(Tipo: string): string;
     function DameTituloAtributo(id: integer): string;
  end;

var
  DMAtributos : TDMAtributos;

implementation

uses UDMMain, UUtiles, HYFIBQuery;

{$R *.dfm}

procedure TDMAtributos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMAtributos.RellenaTipoAtributo(Lista: TStrings; Todos: boolean = True);
begin
  /// Rellena la lista con tipos de atributo.
  /// Devuelve el ItemIndex asociado al pais del entorno.

  Lista.Clear;
  if (Todos) then
     Lista.AddObject(_('Todos'), Pointer(0));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT TIPO, TITULO FROM ART_TIPO_ATRIBUTO ');
           SelectSQL.Add(' ORDER BY TIPO ');
           Open;
           while not EOF do
           begin
              Lista.Add(FieldByName('TIPO').AsString + ' - ' + FieldByName('TITULO').AsString);
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

procedure TDMAtributos.QMAtributosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_ATRIBUTOS', 'ID');
end;

procedure TDMAtributos.FiltraTipo(aTipo: string);
begin
  Tipo := aTipo;

  with QMAtributos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ART_ATRIBUTO ');
     if (Tipo > '') then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' TIPO = :TIPO ');
     end;
     SelectSQL.Add(' ORDER BY TIPO, ATRIBUTO ');

     if (Tipo > '') then
        Params.ByName['TIPO'].AsString := Tipo;

     Open;
  end;
end;

procedure TDMAtributos.QMAtributosNewRecord(DataSet: TDataSet);
begin
  QMAtributosTIPO.AsString := Tipo;
end;

function TDMAtributos.DameTituloTipoAtributo(Tipo: string): string;
begin
  Result := '';
  if (Trim(Tipo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM ART_TIPO_ATRIBUTO WHERE TIPO = :TIPO';
           Params.ByName['TIPO'].AsString := Tipo;
           ExecQuery;
           Result := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMAtributos.DameTituloAtributo(id: integer): string;
begin
  Result := '';
  if (id > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ATRIBUTO FROM ART_ATRIBUTO WHERE ID = :ID';
           Params.ByName['ID'].AsInteger := id;
           ExecQuery;
           Result := FieldByName['ATRIBUTO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
