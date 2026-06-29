unit UDMMultiAgrupacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMMultiAgrupacion = class(TDataModule)
     TLocal: THYTransaction;
     DSxMultiAgrupacion: TDataSource;
     xMultiAgrupacion: TFIBTableSet;
     TUpdate: THYTransaction;
     xMultiAgrupacionENTRADA: TIntegerField;
     xMultiAgrupacionAGRUPACION: TFIBStringField;
     xMultiAgrupacionTITULO: TFIBStringField;
     xMultiAgrupacionMARCADO: TIntegerField;
     procedure xMultiAgrupacionNewRecord(DataSet: TDataSet);
     procedure xMultiAgrupacionMARCADOChange(Sender: TField);
     procedure xMultiAgrupacionAfterPost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     Tipo: string;
  public
     { Public declarations }
     // OcultarAlmacen: Boolean;
     procedure MarcarTodos(Marca: smallint);
     procedure FiltrarSeleccion;
     procedure RellenaAgrupaciones;
     procedure SetTipo(aTipo: string);
  end;

var
  DMMultiAgrupacion : TDMMultiAgrupacion;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMMultiAgrupacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // T : Artículos
  Tipo := 'T';

  RellenaAgrupaciones;

  with xMultiAgrupacion do
  begin
     Close;
     DataBase := DMMain.DataBase;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMMultiAgrupacion.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMMultiAgrupacion.FiltrarSeleccion;
begin
  with xMultiAgrupacion do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM TMP_AGRUPACIONES WHERE ENTRADA = ?ENTRADA ORDER BY AGRUPACION';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMMultiAgrupacion.MarcarTodos(Marca: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_AGRUPACIONES SET MARCADO = :MARCADO WHERE ENTRADA = :ENTRADA';
        Params.ByName['MARCADO'].AsInteger := Marca;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  FiltrarSeleccion;
end;

procedure TDMMultiAgrupacion.xMultiAgrupacionNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMMultiAgrupacion.xMultiAgrupacionMARCADOChange(Sender: TField);
begin
  if (xMultiAgrupacion.State = dsInsert) or (xMultiAgrupacion.State = dsEdit) then
     xMultiAgrupacion.Post;
end;

procedure TDMMultiAgrupacion.xMultiAgrupacionAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMMultiAgrupacion.RellenaAgrupaciones;
var
  EntradaExiste : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_AGRUPACIONES WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        EntradaExiste := (FieldByName['COUNT'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if not EntradaExiste then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO TMP_AGRUPACIONES (ENTRADA,AGRUPACION,TITULO,MARCADO) ');
           SQL.Add(' SELECT ' + REntorno.EntradaStr + ', AGRUPACION, TITULO, 0 ');
           SQL.Add(' FROM SYS_AGRUPACIONES ');
           SQL.Add(' WHERE ');
           SQL.Add(' TIPO=''' + Tipo + ''' ');
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMultiAgrupacion.SetTipo(aTipo: string);
begin
  /// A : Acreedores
  /// C : Clientes
  /// P : Proveedores
  /// R : Representantes
  /// T : Artículos

  Tipo := aTipo;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_AGRUPACIONES WHERE ENTRADA = ' + REntorno.EntradaStr;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RellenaAgrupaciones;
  FiltrarSeleccion;
end;

end.
