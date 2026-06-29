unit UDMImportacionArticulosExcelArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBTableDataSetRO, ImgList, Controls,
  Dialogs, Menus, ActnList, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, FIBDataSet;

type
  TDMImportacionArticulosExcelArt = class(TDataModule)
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function ExisteArticulo(Articulo, RefProveedor: string; Proveedor: integer): boolean;
     function ExisteArticuloPadre(Articulo: string; var id_a: integer): boolean;
     function ExisteArticuloPadreProv(RefProveedor: string; Proveedor: integer): boolean;
     function ExistePrincipal(Articulo: string): boolean;
     procedure EstablecePrincipal(Articulo: string; Proveedor: integer; RefProveedor: string);
     procedure InsertarArticulo(Articulo, Titulo, Familia: string; PVenta1, PVenta2, Piezas, PCompra1, Descuento1, PCoste1, PCompra2, Descuento2, PCoste2: double; RefProveedor, Notas, Tarifa: string; Proveedor: integer; Alfa1, Alfa2, Alfa3, Alfa4, Alfa5, Alfa6, EAN13: string; PVentaRecomendado: double);
     procedure UpdateArticulo(Articulo, Titulo, Familia: string; PVenta1, PVenta2, Piezas, PCompra1, Descuento1, PCoste1, PCompra2, Descuento2, PCoste2: double; RefProveedor, Notas, Tarifa: string; Proveedor: integer; Alfa1, Alfa2, Alfa3, Alfa4, Alfa5, Alfa6, EAN13: string; PVentaRecomendado: double);
     procedure InsertarArtProveedor(Articulo, RefProveedor: string; Proveedor, id_a: integer);
  end;

var
  DMImportacionArticulosExcelArt : TDMImportacionArticulosExcelArt;

implementation

uses UDMMain, Registry, Windows, UEntorno;

{$R *.dfm}

procedure TDMImportacionArticulosExcelArt.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMImportacionArticulosExcelArt.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMImportacionArticulosExcelArt.InsertarArticulo(Articulo, Titulo, Familia: string; PVenta1, PVenta2, Piezas, PCompra1, Descuento1, PCoste1, PCompra2, Descuento2, PCoste2: double; RefProveedor, Notas, Tarifa: string; Proveedor: integer; Alfa1, Alfa2, Alfa3, Alfa4, Alfa5, Alfa6, EAN13: string; PVentaRecomendado: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO ART_ARTICULOS_IMPORTADOS ( ');
        SQL.Add(' EMPRESA, ARTICULO, TITULO, PVENTA1, PIEZAS, PVENTA2, PCOMPRA1, DESCUENTO1, ');
        SQL.Add(' PCOSTE1, PCOMPRA2, DESCUENTO2, PCOSTE2, PROVEEDOR, REF_PROVEEDOR, FAMILIA, ');
        SQL.Add(' NOTAS, FECHA_IMPORTACION, TARIFA, ENTRADA, ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, EAN13, P_VENTA_RECOMENDADO) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :ARTICULO, :TITULO, :PVENTA1, :PIEZAS, :PVENTA2, :PCOMPRA1, :DESCUENTO1, ');
        SQL.Add(' :PCOSTE1, :PCOMPRA2, :DESCUENTO2, :PCOSTE2, :PROVEEDOR, :REF_PROVEEDOR, :FAMILIA, ');
        SQL.Add(' :NOTAS, :FECHA_IMPORTACION, :TARIFA, :ENTRADA, :ALFA_1, :ALFA_2, :ALFA_3, :ALFA_4, :ALFA_5, :ALFA_6, :EAN13, :P_VENTA_RECOMENDADO) ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['TITULO'].AsString := Titulo;
        Params.ByName['PVENTA1'].AsFloat := PVenta1;
        Params.ByName['PIEZAS'].AsFloat := Piezas;
        Params.ByName['PVENTA2'].AsFloat := PVenta2;
        Params.ByName['PCOMPRA1'].AsFloat := PCompra1;
        Params.ByName['DESCUENTO1'].AsFloat := Descuento1;
        Params.ByName['PCOSTE1'].AsFloat := PCoste1;
        Params.ByName['PCOMPRA2'].AsFloat := PCompra2;
        Params.ByName['DESCUENTO2'].AsFloat := Descuento2;
        Params.ByName['PCOSTE2'].AsFloat := PCoste2;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['REF_PROVEEDOR'].AsString := RefProveedor;
        Params.ByName['FAMILIA'].AsString := Familia;
        Params.ByName['NOTAS'].AsString := Notas;
        Params.ByName['FECHA_IMPORTACION'].AsDateTime := Date;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ALFA_1'].AsString := Alfa1;
        Params.ByName['ALFA_2'].AsString := Alfa2;
        Params.ByName['ALFA_3'].AsString := Alfa3;
        Params.ByName['ALFA_4'].AsString := Alfa4;
        Params.ByName['ALFA_5'].AsString := Alfa5;
        Params.ByName['ALFA_6'].AsString := Alfa6;
        Params.ByName['EAN13'].AsString := EAN13;
        Params.ByName['P_VENTA_RECOMENDADO'].AsFloat := PVentaRecomendado;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// procedure TDMImportacionArticulosExcelArt.UpdateArticulo (articulo, titulo, familia: String);
procedure TDMImportacionArticulosExcelArt.UpdateArticulo(Articulo, Titulo, Familia: string; PVenta1, PVenta2, Piezas, PCompra1, Descuento1, PCoste1, PCompra2, Descuento2, PCoste2: double; RefProveedor, Notas, Tarifa: string; Proveedor: integer; Alfa1, Alfa2, Alfa3, Alfa4, Alfa5, Alfa6, EAN13: string; PVentaRecomendado: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE ART_ARTICULOS_IMPORTADOS ');
        SQL.Add(' SET ');
        SQL.Add(' TITULO = :TITULO, ');
        SQL.Add(' PVENTA1 = :PVENTA1, ');
        SQL.Add(' PIEZAS = :PIEZAS, ');
        SQL.Add(' PVENTA2 = :PVENTA2, ');
        SQL.Add(' PCOMPRA1 = :PCOMPRA1, ');
        SQL.Add(' DESCUENTO1 = :DESCUENTO1, ');
        SQL.Add(' PCOSTE1 = :PCOSTE1, ');
        SQL.Add(' PCOMPRA2 = :PCOMPRA2, ');
        SQL.Add(' DESCUENTO2 = :DESCUENTO2, ');
        SQL.Add(' PCOSTE2 = :PCOSTE2, ');
        SQL.Add(' FAMILIA = :FAMILIA, ');
        SQL.Add(' NOTAS = :NOTAS, ');
        SQL.Add(' TARIFA = :TARIFA, ');
        SQL.Add(' ART_PRINCIPAL = :ART_PRINCIPAL, ');
        SQL.Add(' ALFA_1 = :ALFA_1, ');
        SQL.Add(' ALFA_2 = :ALFA_2, ');
        SQL.Add(' ALFA_3 = :ALFA_3, ');
        SQL.Add(' ALFA_4 = :ALFA_4, ');
        SQL.Add(' ALFA_5 = :ALFA_5, ');
        SQL.Add(' ALFA_6 = :ALFA_6, ');
        SQL.Add(' EAN13 = :EAN13, ');
        SQL.Add(' P_VENTA_RECOMENDADO = :P_VENTA_RECOMENDADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
        SQL.Add(' REF_PROVEEDOR = :REF_PROVEEDOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['TITULO'].AsString := Titulo;
        Params.ByName['PVENTA1'].AsFloat := PVenta1;
        Params.ByName['PIEZAS'].AsFloat := Piezas;
        Params.ByName['PVENTA2'].AsFloat := PVenta2;
        Params.ByName['PCOMPRA1'].AsFloat := PCompra1;
        Params.ByName['DESCUENTO1'].AsFloat := Descuento1;
        Params.ByName['PCOSTE1'].AsFloat := PCoste1;
        Params.ByName['PCOMPRA2'].AsFloat := PCompra2;
        Params.ByName['DESCUENTO2'].AsFloat := Descuento2;
        Params.ByName['PCOSTE2'].AsFloat := PCoste2;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['REF_PROVEEDOR'].AsString := RefProveedor;
        Params.ByName['FAMILIA'].AsString := Familia;
        Params.ByName['NOTAS'].AsString := Notas;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ALFA_1'].AsString := Alfa1;
        Params.ByName['ALFA_2'].AsString := Alfa2;
        Params.ByName['ALFA_3'].AsString := Alfa3;
        Params.ByName['ALFA_4'].AsString := Alfa4;
        Params.ByName['ALFA_5'].AsString := Alfa5;
        Params.ByName['ALFA_6'].AsString := Alfa6;
        Params.ByName['EAN13'].AsString := EAN13;
        Params.ByName['P_VENTA_RECOMENDADO'].AsFloat := PVentaRecomendado;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImportacionArticulosExcelArt.InsertarArtProveedor(Articulo, RefProveedor: string; Proveedor, id_a: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO ART_ARTICULOS_CODPROV ');
        SQL.Add(' (EMPRESA, ARTICULO, PROVEEDOR, CODIGO_PROVEEDOR) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (:EMPRESA, :ARTICULO, :PROVEEDOR, :CODIGO_PROVEEDOR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['CODIGO_PROVEEDOR'].AsString := RefProveedor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportacionArticulosExcelArt.ExisteArticulo(Articulo, RefProveedor: string; Proveedor: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) ');
        SQL.Add(' FROM ART_ARTICULOS_IMPORTADOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
        SQL.Add(' REF_PROVEEDOR = :REF_PROVEEDOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['REF_PROVEEDOR'].AsString := RefProveedor;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportacionArticulosExcelArt.ExisteArticuloPadre(Articulo: string; var id_a: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_A ');
        SQL.Add(' FROM CON_CUENTAS_GES_ART ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;

        id_a := FieldByName['ID_A'].AsInteger;
        Result := (FieldByName['ID_A'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportacionArticulosExcelArt.ExisteArticuloPadreProv(RefProveedor: string; Proveedor: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) ');
        SQL.Add(' FROM ART_ARTICULOS_CODPROV ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
        SQL.Add(' CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['CODIGO_PROVEEDOR'].AsString := RefProveedor;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportacionArticulosExcelArt.ExistePrincipal(Articulo: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) ');
        SQL.Add(' FROM ART_ARTICULOS_IMPORTADOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' ART_PRINCIPAL = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImportacionArticulosExcelArt.EstablecePrincipal(Articulo: string; Proveedor: integer; RefProveedor: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE ART_ARTICULOS_IMPORTADOS ');
        SQL.Add(' SET ');
        SQL.Add(' ART_PRINCIPAL = :ART_PRINCIPAL ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
        SQL.Add(' REF_PROVEEDOR = :REF_PROVEEDOR ');
        Params.ByName['ART_PRINCIPAL'].AsInteger := 1;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['REF_PROVEEDOR'].AsString := RefProveedor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
