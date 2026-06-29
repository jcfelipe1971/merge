unit UDMPromoIndirectas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, UFIBModificados;

type
  TDMPromoIndirectas = class(TDataModule)
     TLocal: THYTransaction;
     QMPromociones: TFIBTableSet;
     DSQMPromociones: TDataSource;
     QMPromocionesEMPRESA: TIntegerField;
     QMPromocionesEJERCICIO: TIntegerField;
     QMPromocionesCANAL: TIntegerField;
     QMPromocionesSERIE: TFIBStringField;
     QMPromocionesTIPO: TFIBStringField;
     QMPromocionesRIG: TIntegerField;
     QMPromocionesLINEA: TIntegerField;
     QMPromocionesID_DETALLES_S: TIntegerField;
     QMPromocionesENTRADA: TIntegerField;
     QMPromocionesARTICULO: TFIBStringField;
     QMPromocionesTITULO: TFIBStringField;
     QMPromocionesUNIDADES: TFloatField;
     QMPromocionesPRECIO: TFloatField;
     QMPromocionesMARCADO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMPromoIndirectasCreate(Sender: TObject);
     procedure QMPromocionesNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     procedure AbrePromo;
     procedure BorraTemporal;
  public
     { Public declarations }
     procedure DevuelveParametrosIniciales(var FechaD, FechaH: TDateTime; var ClienteD, ClienteH: integer);
     procedure Rellena(Tipo: string; FechaD, FechaH: TDateTime; ClienteD, ClienteH: integer);
     procedure Marcar(Marca: smallint);
     procedure GenerarFacturas;
  end;

var
  DMPromoIndirectas : TDMPromoIndirectas;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMPromoIndirectas.DMPromoIndirectasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMPromoIndirectas.QMPromocionesNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPromoIndirectas.DevuelveParametrosIniciales(var FechaD, FechaH: TDateTime; var ClienteD, ClienteH: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_PROMOCION_PARAMS_DEF(:EMPRESA, :EJERCICIO, :CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FechaD := FieldByName['FECHA_D'].AsDateTime;
        FechaH := FieldByName['FECHA_H'].AsDateTime;
        ClienteD := FieldByName['CLIENTE_D'].AsInteger;
        ClienteH := FieldByName['CLIENTE_H'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPromoIndirectas.Rellena(Tipo: string; FechaD, FechaH: TDateTime; ClienteD, ClienteH: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_RELLENA_PROMOCIONES(:EMPRESA, :EJERCICIO, :CANAL, :TIPO, :FECHA_D, :FECHA_H, :CLIENTE_D, :CLIENTE_H, :ENTRADA, :FECHA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['FECHA_D'].AsDateTime := FechaD;
        Params.ByName['FECHA_H'].AsDateTime := FechaH;
        Params.ByName['CLIENTE_D'].AsInteger := ClienteD;
        Params.ByName['CLIENTE_H'].AsInteger := ClienteH;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrePromo;
end;

procedure TDMPromoIndirectas.AbrePromo;
begin
  with QMPromociones do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMPromoIndirectas.BorraTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_PROMOCIONES WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPromoIndirectas.DataModuleDestroy(Sender: TObject);
begin
  BorraTemporal;
end;

procedure TDMPromoIndirectas.Marcar(Marca: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_PROMOCIONES SET MARCADO = :MARCA WHERE ENTRADA = :ENTRADA';
        Params.ByName['MARCA'].AsInteger := Marca;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrePromo;
end;

procedure TDMPromoIndirectas.GenerarFacturas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_PROMOCION_GENERA_FACTURA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :FECHA, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrePromo;
end;

end.
