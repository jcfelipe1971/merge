unit UDMMultiZona;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMMultiZona = class(TDataModule)
     TLocal: THYTransaction;
     DSxMultiZona: TDataSource;
     xMultiZona: TFIBTableSet;
     TUpdate: THYTransaction;
     xMultiZonaENTRADA: TIntegerField;
     xMultiZonaZONA: TFIBStringField;
     xMultiZonaTITULO: TFIBStringField;
     xMultiZonaMARCADO: TIntegerField;
     procedure xMultiZonaNewRecord(DataSet: TDataSet);
     procedure xMultiZonaMARCADOChange(Sender: TField);
     procedure xMultiZonaAfterPost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     // OcultarAlmacen: Boolean;
     procedure MarcarTodos(Marca: smallint);
     procedure FiltrarSeleccion;
     procedure RellenaZonas;
  end;

var
  DMMultiZona : TDMMultiZona;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMMultiZona.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  RellenaZonas;

  with xMultiZona do
  begin
     Close;
     DataBase := DMMain.DataBase;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMMultiZona.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMMultiZona.FiltrarSeleccion;
begin
  with xMultiZona do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM TMP_ZONAS WHERE ENTRADA = ?ENTRADA ORDER BY ZONA';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMMultiZona.MarcarTodos(Marca: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_ZONAS SET MARCADO = :MARCADO WHERE ENTRADA = :ENTRADA';
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

procedure TDMMultiZona.xMultiZonaNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMMultiZona.xMultiZonaMARCADOChange(Sender: TField);
begin
  if (xMultiZona.State = dsInsert) or (xMultiZona.State = dsEdit) then
     xMultiZona.Post;
end;

procedure TDMMultiZona.xMultiZonaAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMMultiZona.RellenaZonas;
var
  EntradaExiste : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_ZONAS WHERE ENTRADA = ?ENTRADA';
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
           SQL.Add(' INSERT INTO TMP_ZONAS (ENTRADA, ZONA, TITULO, MARCADO) ');
           SQL.Add(' SELECT ' + REntorno.EntradaStr + ', ZONA, TITULO, 0 FROM SYS_ZONAS ');
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
