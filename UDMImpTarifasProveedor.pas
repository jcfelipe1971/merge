unit UDMImpTarifasProveedor;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FIBDatabase, UFIBModificados,
  DB, FIBDataSet, FIBTableDataSet;

type
  TDMImpTarifasProveedor = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InsertaTarifa(Proveedor: integer; Tarifa: string; Alta, Baja: TDateTime; Desc1, Desc2, Desc3: double; Articulo, CodProveedor: string; Precio: double; Modificar: boolean);
     function DameArticulo(Proveedor: integer; CodigoProveedor: string): string;
  end;

var
  DMImpTarifasProveedor : TDMImpTarifasProveedor;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMImpTarifasProveedor.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

function TDMImpTarifasProveedor.DameArticulo(Proveedor: integer; CodigoProveedor: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ARTICULO FROM ART_ARTICULOS_CODPROV WHERE EMPRESA = ' +
           REntorno.EmpresaStr + ' AND CODIGO_PROVEEDOR = ''' + CodigoProveedor + ''' AND PROVEEDOR = ' + IntToStr(Proveedor);
        ExecQuery;
        Result := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImpTarifasProveedor.InsertaTarifa(Proveedor: integer; Tarifa: string; Alta, Baja: TDateTime; Desc1, Desc2, Desc3: double; Articulo, CodProveedor: string; Precio: double; Modificar: boolean);
var
  Existe : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPRESA FROM ART_TARIFAS_PROVEEDOR WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL AND PROVEEDOR=:PROVEEDOR AND TARIFA=:TARIFA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['TARIFA'].AsString := Tarifa;
        ExecQuery;
        Existe := (FieldByName['EMPRESA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Inserto cabecera si no existe
  if not Existe then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO ART_TARIFAS_PROVEEDOR ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, PROVEEDOR, TARIFA, TITULO, FECHA_INICIO, FECHA_FINAL, DESCUENTO1, DESCUENTO2, DESCUENTO3) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :PROVEEDOR, :TARIFA, :TITULO, :FECHA_INICIO, :FECHA_FINAL, :DESCUENTO1, :DESCUENTO2, :DESCUENTO3) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['TITULO'].AsString := Tarifa;
           Params.ByName['FECHA_INICIO'].AsDateTime := Alta;
           Params.ByName['FECHA_FINAL'].AsDateTime := Baja;
           Params.ByName['DESCUENTO1'].AsFloat := Desc1;
           Params.ByName['DESCUENTO2'].AsFloat := Desc2;
           Params.ByName['DESCUENTO3'].AsFloat := Desc3;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Insertar Detalle
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        if Modificar then
        begin
           SQL.Add(' UPDATE OR INSERT INTO ART_TARIFAS_PROVEEDOR_DETALLE ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, PROVEEDOR, TARIFA, ARTICULO, ARTICULO_PROVEEDOR, P_COSTE) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :PROVEEDOR, :TARIFA, :ARTICULO, :ARTICULO_PROVEEDOR, :P_COSTE) ');
           SQL.Add(' MATCHING (EMPRESA, EJERCICIO, CANAL, PROVEEDOR, TARIFA, ARTICULO) ');
        end
        else
        begin
           SQL.Add(' INSERT INTO ART_TARIFAS_PROVEEDOR_DETALLE ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, PROVEEDOR, TARIFA, ARTICULO, ARTICULO_PROVEEDOR, P_COSTE) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :PROVEEDOR, :TARIFA, :ARTICULO, :ARTICULO_PROVEEDOR, :P_COSTE) ');
        end;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['ARTICULO_PROVEEDOR'].AsString := CodProveedor;
        Params.ByName['P_COSTE'].AsFloat := Precio;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
