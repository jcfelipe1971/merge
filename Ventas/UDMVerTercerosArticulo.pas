unit UDMVerTercerosArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO, FIBTableDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMVerTercerosArticulo = class(TDataModule)
     Tlocal: THYTransaction;
     DSQMArticulos: TDataSource;
     QMArticulos: TFIBTableSet;
     DSxClientes: TDataSource;
     xClientes: TFIBDataSet;
     QMArticulosEMPRESA: TIntegerField;
     QMArticulosARTICULO: TFIBStringField;
     QMArticulosTITULO: TFIBStringField;
     xProveedores: TFIBDataSet;
     DSxProveedores: TDataSource;
     xProveedoresPROVEEDOR: TIntegerField;
     xProveedoresTITULO: TFIBStringField;
     xProveedoresPRECIO_COMPRA: TFloatField;
     xProveedoresPRECIO_COSTE: TFloatField;
     xProveedoresCOSTE: TFloatField;
     xClientesCLIENTE: TIntegerField;
     xClientesTITULO: TFIBStringField;
     xClientesPV: TFloatField;
     xProveedoresRIG: TIntegerField;
     xProveedoresFECHA: TDateTimeField;
     xProveedoresSERIE: TFIBStringField;
     TUpdate: THYTransaction;
     xClientesTITULO_MODELO: TFIBStringField;
     xProveedoresTITULO_MODELO: TFIBStringField;
     xClientesUNIDADES: TFloatField;
     xProveedoresARTICULO: TFIBStringField;
     xProveedoresUNIDADES: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     TotalImporte, TotalUnidades: double;
     procedure ActualizaGridProveedores(articulo: string);
     procedure ActualizaGridCLientes(articulo: string);
  end;

var
  DMVerTercerosArticulo : TDMVerTercerosArticulo;

implementation

uses UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TDMVerTercerosArticulo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  TotalImporte := 0;
  TotalUnidades := 0;

  // Asignamos las mascaras
  xClientesPV.DisplayFormat := MascaraL;
  xProveedoresPRECIO_COMPRA.DisplayFormat := MascaraL;
  xProveedoresPRECIO_COSTE.DisplayFormat := MascaraL;
  xProveedoresCOSTE.DisplayFormat := MascaraL;
end;

procedure TDMVerTercerosArticulo.ActualizaGridProveedores(articulo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DAME_ULTIMOS_PROVEEDORES (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ARTICULO, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xProveedores do
  begin
     if Active then
        Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(PRECIO_COMPRA * UNIDADES) AS IMPORTE, SUM(UNIDADES) AS UNIDADES FROM TMP_ULTIMOS_PROVEEDORES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ARTICULO = ?ARTICULO AND ');
        SQL.Add(' ENTRADA = ?ENTRADA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        TotalImporte := FieldByName['IMPORTE'].AsDouble;
        TotalUnidades := FieldByName['UNIDADES'].AsDouble;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMVerTercerosArticulo.ActualizaGridCLientes(articulo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_VENTAS_CLIENTES_ARTICULO (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ARTICULO, :BORRAR, :MODO, :ENTRADA, :MONEDA, :ID_A)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['BORRAR'].AsInteger := 1;
        Params.ByName['MODO'].AsInteger := 2; // Todas las series
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Params.ByName['ID_A'].AsInteger := DameIDArticulo(Articulo);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xClientes do
  begin
     if Active then
        Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(TOTAL_VENTAS) IMPORTE, SUM(UNIDADES) UNIDADES FROM TMP_VENTAS_CLI_ART ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = ?ENTRADA ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        TotalImporte := FieldByName['IMPORTE'].AsDouble;
        TotalUnidades := FieldByName['UNIDADES'].AsDouble;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
