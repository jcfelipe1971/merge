unit UDMImportacionArticulosExcel;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs, Controls, Graphics;

type
  TDMImportacionArticulosExcel = class(TDataModule)
     QMArtImportados: TFIBTableSet;
     QMArtImportadosID_ARTICULO: TIntegerField;
     QMArtImportadosEMPRESA: TIntegerField;
     QMArtImportadosARTICULO: TFIBStringField;
     QMArtImportadosTITULO: TFIBStringField;
     QMArtImportadosPVENTA1: TFloatField;
     QMArtImportadosPIEZAS: TFloatField;
     QMArtImportadosPVENTA2: TFloatField;
     QMArtImportadosPCOMPRA1: TFloatField;
     QMArtImportadosDESCUENTO1: TFloatField;
     QMArtImportadosPCOSTE1: TFloatField;
     QMArtImportadosPCOMPRA2: TFloatField;
     QMArtImportadosDESCUENTO2: TFloatField;
     QMArtImportadosPCOSTE2: TFloatField;
     QMArtImportadosTITULO_PROVEEDOR: TFIBStringField;
     QMArtImportadosPROVEEDOR: TIntegerField;
     QMArtImportadosREF_PROVEEDOR: TFIBStringField;
     QMArtImportadosFAMILIA: TFIBStringField;
     QMArtImportadosNOTAS: TBlobField;
     QMArtImportadosTRASPASADO: TIntegerField;
     QMArtImportadosFECHA_IMPORTACION: TDateTimeField;
     QMArtImportadosENTRADA: TIntegerField;
     DSArtImportados: TDataSource;
     QMArtImportadosTARIFA: TFIBStringField;
     DSxFamilias: TDataSource;
     xFamilias: TFIBDataSetRO;
     xFamiliasTITULO: TFIBStringField;
     QMArtImportadosID_ART_ARTICULOS: TIntegerField;
     QMArtImportadosART_PRINCIPAL: TIntegerField;
     xFamiliasEMPRESA: TIntegerField;
     xFamiliasEJERCICIO: TIntegerField;
     xFamiliasCANAL: TIntegerField;
     xFamiliasFAMILIA: TFIBStringField;
     xFamiliasPAIS: TFIBStringField;
     xFamiliasTIPO_IVA: TIntegerField;
     xFamiliasCTA_COMPRAS: TFIBStringField;
     xFamiliasCTA_VENTAS: TFIBStringField;
     xFamiliasCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     xFamiliasCTA_DEVOLUCION_VENTAS: TFIBStringField;
     xFamiliasCTA_ABONO_COMPRAS: TFIBStringField;
     xFamiliasCTA_ABONO_VENTAS: TFIBStringField;
     xFamiliasVENTA: TIntegerField;
     xFamiliasPTO_VERDE: TFloatField;
     xFamiliasMARGEN: TFloatField;
     xFamiliasTIPO_REDONDEO: TIntegerField;
     xFamiliasACT_TAR_AUTOM: TIntegerField;
     xFamiliasTITULO_WEB: TFIBStringField;
     xFamiliasWEB: TIntegerField;
     xEquivalencias: TFIBDataSetRO;
     DSxEquivalencias: TDataSource;
     xEquivalenciasID_ARTICULO: TIntegerField;
     xEquivalenciasEMPRESA: TIntegerField;
     xEquivalenciasARTICULO: TFIBStringField;
     xEquivalenciasTITULO: TFIBStringField;
     xEquivalenciasPVENTA1: TFloatField;
     xEquivalenciasPIEZAS: TFloatField;
     xEquivalenciasPVENTA2: TFloatField;
     xEquivalenciasPCOMPRA1: TFloatField;
     xEquivalenciasDESCUENTO1: TFloatField;
     xEquivalenciasPCOSTE1: TFloatField;
     xEquivalenciasPCOMPRA2: TFloatField;
     xEquivalenciasDESCUENTO2: TFloatField;
     xEquivalenciasPCOSTE2: TFloatField;
     xEquivalenciasTITULO_PROVEEDOR: TFIBStringField;
     xEquivalenciasPROVEEDOR: TIntegerField;
     xEquivalenciasREF_PROVEEDOR: TFIBStringField;
     xEquivalenciasFAMILIA: TFIBStringField;
     xEquivalenciasNOTAS: TBlobField;
     xEquivalenciasTRASPASADO: TIntegerField;
     xEquivalenciasFECHA_IMPORTACION: TDateTimeField;
     xEquivalenciasENTRADA: TIntegerField;
     xEquivalenciasTARIFA: TFIBStringField;
     xEquivalenciasID_ART_ARTICULOS: TIntegerField;
     xEquivalenciasART_PRINCIPAL: TIntegerField;
     xArtImportados: TFIBDataSetRO;
     xInfoPrincipal: TFIBDataSetRO;
     xInfoPrincipalART_PRINCIPAL: TIntegerField;
     DSxInfoPrincipal: TDataSource;
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     QMArtImportadosALFA_1: TFIBStringField;
     QMArtImportadosALFA_2: TFIBStringField;
     QMArtImportadosALFA_3: TFIBStringField;
     QMArtImportadosALFA_4: TFIBStringField;
     QMArtImportadosALFA_5: TFIBStringField;
     QMArtImportadosALFA_6: TFIBStringField;
     QMArtImportadosEAN13: TFIBStringField;
     QMArtImportadosP_VENTA_RECOMENDADO: TFloatField;
     xEquivalenciasP_VENTA_RECOMENDADO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMArtImportadosNewRecord(DataSet: TDataSet);
     procedure QMArtImportadosTITULO_PROVEEDORGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArtImportadosAfterOpen(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMArtImportadosBeforeEdit(DataSet: TDataSet);
     procedure QMArtImportadosBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     SoloPrincipal: boolean;
     AsignarMasivo: boolean;
     procedure MarcaPrincipal(id: integer);
     function ExisteArticuloEnEEC(articulo: string): boolean;
     procedure InsertarArticulo(id_articulo: integer);
     procedure ModificarArticulo(id_articulo: integer);
     procedure InsertarArtProveedor(Articulo, RefProveedor: string; Proveedor: integer);
     procedure InsertarPreciosArt(id_articulo: integer; Piezas: double);
     procedure InsertarArtCodBarra(Articulo, CodBarra: string; Tipo: integer);
  public
     { Public declarations }
     old_RefProveedor: string;
     procedure ActualizarTodos;
     procedure AsignarPrincipal(id_articulo: integer; articulo: string);
     procedure BusquedaCompleja;
     procedure AsignarMasivoPrincipal(BusquedaCompleja: boolean);
     procedure RefrescaArticulosImportados;
     procedure FiltrarTabla(aSoloPrincipal: integer);
     procedure EliminarImportaciones(Proveedor: integer);
  end;

var
  DMImportacionArticulosExcel : TDMImportacionArticulosExcel;

implementation

uses UDMMain, UEntorno, UUtiles, UFBusca, UDameDato;

{$R *.dfm}

procedure TDMImportacionArticulosExcel.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignarMasivo := False;

  QMArtImportados.Close;
  // QMArtImportados.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMArtImportados.Open;
end;

procedure TDMImportacionArticulosExcel.Graba(DataSet: TDataSet);
begin
  // Refresco la taula perquè es vegin els canvis. No sé xq no ho fa sol.
  RefrescaArticulosImportados;
end;

procedure TDMImportacionArticulosExcel.QMArtImportadosNewRecord(DataSet: TDataSet);
begin
  QMArtImportadosENTRADA.AsInteger := REntorno.Entrada;
  QMArtImportadosEMPRESA.AsInteger := REntorno.Empresa;
  QMArtImportadosFECHA_IMPORTACION.AsDateTime := Date;
end;

function TDMImportacionArticulosExcel.ExisteArticuloEnEEC(Articulo: string): boolean;
begin
  Result := (DameIDCArticulo(Articulo) <> 0);
end;

procedure TDMImportacionArticulosExcel.InsertarArticulo(id_articulo: integer);
begin
  xArtImportados.Close;
  xArtImportados.Params.ByName['id_articulo'].AsInteger := id_articulo;
  xArtImportados.Open;

  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FAMILIA'].AsString := xArtImportados.FieldByName('FAMILIA').AsString;
     Open;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO VER_ARTICULOS_CUENTAS ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, ARTICULO, TITULO, ENTRADA, PAIS, CTA_COMPRAS, CTA_VENTAS, ');
        SQL.Add(' CTA_DEVOLUCION_COMPRAS, CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS, CTA_ABONO_VENTAS, ');
        SQL.Add(' DISPONIBILIDAD, UNIDADES, TIPO_IVA, FAMILIA, CONTROL_STOCK, NOTAS, ');
        SQL.Add(' ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, P_COSTE) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :TITULO, :ENTRADA, :PAIS, :CTA_COMPRAS, :CTA_VENTAS, ');
        SQL.Add(' :CTA_DEV_COMPRAS, :CTA_DEV_VENTAS, :CTA_ABO_COMPRAS, :CTA_ABO_VENTAS, ');
        SQL.Add(' :DISPONIBILIDAD, :UNIDADES, :TIPO_IVA, :FAMILIA, 1, :NOTAS, ');
        SQL.Add(' :ALFA_1, :ALFA_2, :ALFA_3, :ALFA_4, :ALFA_5, :ALFA_6, :P_COSTE) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := xArtImportados.FieldByName('ARTICULO').AsString;
        Params.ByName['TITULO'].AsString := xArtImportados.FieldByName('TITULO').AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PAIS'].AsString := xFamiliasPAIS.AsString;
        Params.ByName['CTA_COMPRAS'].AsString := xFamiliasCTA_COMPRAS.AsString;
        Params.ByName['CTA_VENTAS'].AsString := xFamiliasCTA_VENTAS.AsString;
        Params.ByName['CTA_DEV_COMPRAS'].AsString := xFamiliasCTA_DEVOLUCION_COMPRAS.AsString;
        Params.ByName['CTA_DEV_VENTAS'].AsString := xFamiliasCTA_DEVOLUCION_VENTAS.AsString;
        Params.ByName['CTA_ABO_COMPRAS'].AsString := xFamiliasCTA_ABONO_COMPRAS.AsString;
        Params.ByName['CTA_ABO_VENTAS'].AsString := xFamiliasCTA_ABONO_VENTAS.AsString;
        Params.ByName['DISPONIBILIDAD'].AsInteger := xFamiliasVENTA.AsInteger;
        Params.ByName['UNIDADES'].AsString := '-';
        Params.ByName['TIPO_IVA'].AsInteger := xFamiliasTIPO_IVA.AsInteger;
        Params.ByName['FAMILIA'].AsString := xArtImportados.FieldByName('FAMILIA').AsString;
        Params.ByName['NOTAS'].AsString := xArtImportados.FieldByName('NOTAS').AsString;
        Params.ByName['ALFA_1'].AsString := xArtImportados.FieldByName('ALFA_1').AsString;
        Params.ByName['ALFA_2'].AsString := xArtImportados.FieldByName('ALFA_2').AsString;
        Params.ByName['ALFA_3'].AsString := xArtImportados.FieldByName('ALFA_3').AsString;
        Params.ByName['ALFA_4'].AsString := xArtImportados.FieldByName('ALFA_4').AsString;
        Params.ByName['ALFA_5'].AsString := xArtImportados.FieldByName('ALFA_5').AsString;
        Params.ByName['ALFA_6'].AsString := xArtImportados.FieldByName('ALFA_6').AsString;
        if (xArtImportados.FieldByName('DESCUENTO1').AsFloat = 0) then
           Params.ByName['P_COSTE'].AsFloat := xArtImportados.FieldByName('PCOSTE1').AsFloat
        else
           Params.ByName['P_COSTE'].AsFloat := (xArtImportados.FieldByName('PCOMPRA1').AsFloat - (xArtImportados.FieldByName('PCOMPRA1').AsFloat * xArtImportados.FieldByName('DESCUENTO1').AsFloat / 100));
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  InsertarPreciosArt(xArtImportados.FieldByName('ID_ARTICULO').AsInteger, xArtImportados.FieldByName('PIEZAS').AsInteger);

  if (xArtImportados.FieldByName('REF_PROVEEDOR').AsString <> '') then
     InsertarArtProveedor(xArtImportados.FieldByName('ARTICULO').AsString, xArtImportados.FieldByName('REF_PROVEEDOR').AsString,
        xArtImportados.FieldByName('PROVEEDOR').AsInteger);

  InsertarArtCodBarra(xArtImportados.FieldByName('ARTICULO').AsString, xArtImportados.FieldByName('EAN13').AsString, 3);
end;

procedure TDMImportacionArticulosExcel.ModificarArticulo(id_articulo: integer);
begin
  xArtImportados.Close;
  xArtImportados.Params.ByName['id_articulo'].AsInteger := id_articulo;
  xArtImportados.Open;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_ARTICULOS_CUENTAS ');
        SQL.Add(' SET ');
        SQL.Add(' TITULO = ?TITULO, ');
        SQL.Add(' FAMILIA = ?FAMILIA, ');
        SQL.Add(' NOTAS = ?NOTAS, ');
        SQL.Add(' ALFA_1 = ?ALFA_1, ');
        SQL.Add(' ALFA_2 = ?ALFA_2, ');
        SQL.Add(' ALFA_3 = ?ALFA_3, ');
        SQL.Add(' ALFA_4 = ?ALFA_4, ');
        SQL.Add(' ALFA_5 = ?ALFA_5, ');
        SQL.Add(' ALFA_6 = ?ALFA_6 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ARTICULO = ?ARTICULO ');
        Params.ByName['TITULO'].AsString := xArtImportados.FieldByName('TITULO').AsString;
        Params.ByName['FAMILIA'].AsString := xArtImportados.FieldByName('FAMILIA').AsString;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := xArtImportados.FieldByName('ARTICULO').AsString;
        Params.ByName['NOTAS'].AsString := xArtImportados.FieldByName('NOTAS').AsString;
        Params.ByName['ALFA_1'].AsString := xArtImportados.FieldByName('ALFA_1').AsString;
        Params.ByName['ALFA_2'].AsString := xArtImportados.FieldByName('ALFA_2').AsString;
        Params.ByName['ALFA_3'].AsString := xArtImportados.FieldByName('ALFA_3').AsString;
        Params.ByName['ALFA_4'].AsString := xArtImportados.FieldByName('ALFA_4').AsString;
        Params.ByName['ALFA_5'].AsString := xArtImportados.FieldByName('ALFA_5').AsString;
        Params.ByName['ALFA_6'].AsString := xArtImportados.FieldByName('ALFA_6').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  InsertarPreciosArt(xArtImportados.FieldByName('ID_ARTICULO').AsInteger, xArtImportados.FieldByName('PIEZAS').AsInteger);
end;

procedure TDMImportacionArticulosExcel.InsertarPreciosArt(id_articulo: integer; Piezas: double);
begin
  xArtImportados.Close;
  xArtImportados.Params.ByName['id_articulo'].AsInteger := id_articulo;
  xArtImportados.Open;

  // Limpiar datos anteriores de precio y descuento
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM ART_TARIFAS_PRECIOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' TARIFA = :TARIFA AND ');
        SQL.Add(' ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARIFA'].AsString := xArtImportados.FieldByName('TARIFA').AsString;
        Params.ByName['ARTICULO'].AsString := xArtImportados.FieldByName('ARTICULO').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO ART_TARIFAS_PRECIOS ( ');
        SQL.Add(' EMPRESA, TARIFA, ARTICULO, UNID_MINIMAS, UNID_MAXIMAS, PRECIO_VENTA, PRECIO_COSTE, DESCUENTO_COMPRA, ');
        SQL.Add('  PRECIO_COMPRA, CALCULO, BLOQUEADO) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :TARIFA, :ARTICULO, :UNID_MINIMAS, :UNID_MAXIMAS, :PRECIO_VENTA, :PRECIO_COSTE, :DESCUENTO_COMPRA, ');
        SQL.Add('  :PRECIO_COMPRA, 1, 1) ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARIFA'].AsString := xArtImportados.FieldByName('TARIFA').AsString;
        Params.ByName['ARTICULO'].AsString := xArtImportados.FieldByName('ARTICULO').AsString;
        Params.ByName['UNID_MINIMAS'].AsFloat := 0;
        if (Piezas > 0) then
           Params.ByName['UNID_MAXIMAS'].AsFloat := Piezas
        else
           Params.ByName['UNID_MAXIMAS'].AsFloat := 1999999999;
        Params.ByName['PRECIO_VENTA'].AsCurrency := xArtImportados.FieldByName('PVENTA1').AsFloat;
        Params.ByName['PRECIO_COSTE'].AsCurrency := xArtImportados.FieldByName('PCOSTE1').AsFloat;
        Params.ByName['PRECIO_COMPRA'].AsCurrency := xArtImportados.FieldByName('PCOMPRA1').AsFloat;
        Params.ByName['DESCUENTO_COMPRA'].AsFloat := xArtImportados.FieldByName('DESCUENTO1').AsFloat;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Piezas > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO ART_TARIFAS_PRECIOS ( ');
           SQL.Add(' EMPRESA, TARIFA, ARTICULO, UNID_MINIMAS, UNID_MAXIMAS, PRECIO_VENTA, PRECIO_COSTE, DESCUENTO_COMPRA, ');
           SQL.Add('  PRECIO_COMPRA, CALCULO, BLOQUEADO) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :TARIFA, :ARTICULO, :UNID_MINIMAS, :UNID_MAXIMAS, :PRECIO_VENTA, :PRECIO_COSTE, :DESCUENTO_COMPRA, ');
           SQL.Add('  :PRECIO_COMPRA, 1, 1) ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TARIFA'].AsString := xArtImportados.FieldByName('TARIFA').AsString;
           Params.ByName['ARTICULO'].AsString := xArtImportados.FieldByName('ARTICULO').AsString;
           Params.ByName['UNID_MINIMAS'].AsFloat := Piezas + 0.01;
           Params.ByName['UNID_MAXIMAS'].AsFloat := 1999999999;
           Params.ByName['PRECIO_VENTA'].AsCurrency := xArtImportados.FieldByName('PVENTA2').AsFloat;
           Params.ByName['PRECIO_COSTE'].AsCurrency := xArtImportados.FieldByName('PCOSTE2').AsFloat;
           Params.ByName['PRECIO_COMPRA'].AsCurrency := xArtImportados.FieldByName('PCOMPRA2').AsFloat;
           Params.ByName['DESCUENTO_COMPRA'].AsFloat := xArtImportados.FieldByName('DESCUENTO2').AsFloat;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMImportacionArticulosExcel.ActualizarTodos;
var
  Marca : TBookmark;
begin
  // Procés que actualitza tots els articles amb els check marcat
  // Actualitza dades general d'article i també refà la pestanya de preus

  Marca := QMArtImportados.GetBookmark;
  try
     QMArtImportados.DisableControls;
     DMImportacionArticulosExcel.QMArtImportados.First;

     while (not DMImportacionArticulosExcel.QMArtImportados.EOF) do
     begin
        // si existeix fa l'update
        if (QMArtImportadosART_PRINCIPAL.AsInteger = 1) then
        begin
           if ExisteArticuloEnEEC(QMArtImportadosARTICULO.AsString) then
           begin
              ModificarArticulo(QMArtImportadosID_ARTICULO.AsInteger);
           end
           else
              InsertarArticulo(QMArtImportadosID_ARTICULO.AsInteger);
        end;

        DMImportacionArticulosExcel.QMArtImportados.Next;
     end;

     ShowMessage(_('Proceso de actualización realizado con éxito'));

     QMArtImportados.GotoBookmark(Marca);
  finally
     QMArtImportados.EnableControls;
     QMArtImportados.FreeBookmark(Marca);
  end;
end;

procedure TDMImportacionArticulosExcel.QMArtImportadosTITULO_PROVEEDORGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloProveedor(QMArtImportadosPROVEEDOR.AsInteger);
end;

// Inserto el proveidor
procedure TDMImportacionArticulosExcel.InsertarArtProveedor(Articulo, RefProveedor: string; Proveedor: integer);
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

procedure TDMImportacionArticulosExcel.InsertarArtCodBarra(Articulo, CodBarra: string; Tipo: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO ART_ARTICULOS_BARRAS ');
        SQL.Add(' (EMPRESA, BARRAS, ARTICULO, TIPO, FUNCION, ID_A, TITULO) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (:EMPRESA, :BARRAS, :ARTICULO, :TIPO, :FUNCION, :ID_A, :TITULO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['BARRAS'].AsString := CodBarra;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['TIPO'].AsInteger := Tipo;
        Params.ByName['FUNCION'].AsInteger := 1;
        Params.ByName['ID_A'].AsInteger := 0;
        Params.ByName['TITULO'].AsString := '';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Proces que fa insert o update d el'article a la taule d'articles mestre
procedure TDMImportacionArticulosExcel.AsignarPrincipal(id_articulo: integer; articulo: string);
var
  Existe : boolean;
begin
  // Primer miro si existeix un altre article igual amb el check marcat
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_ARTICULO FROM ART_ARTICULOS_IMPORTADOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' ARTICULO = ?ARTICULO AND ');
        SQL.Add(' ID_ARTICULO <> ?ID_ARTICULO AND ');
        SQL.Add(' ART_PRINCIPAL = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := QMArtImportadosARTICULO.AsString;
        Params.ByName['ID_ARTICULO'].AsInteger := id_articulo;
        ExecQuery;
        Existe := (Fields[0].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Existe) then
  begin
     if MessageDlg(_('Hay otro artículo marcado como principal. Quiere substituir?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        // Es posa a 0 el registre fins ara principal
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE ART_ARTICULOS_IMPORTADOS ');
              SQL.Add(' SET ');
              SQL.Add(' ART_PRINCIPAL = ?ART_PRINCIPAL ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_ARTICULO = ?ID_ARTICULO ');
              Params.ByName['ART_PRINCIPAL'].AsInteger := 0;
              Params.ByName['ID_ARTICULO'].AsInteger := id_articulo;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Es posa com a principal el nou article
        MarcaPrincipal(id_articulo);

        if (QMArtImportadosART_PRINCIPAL.AsInteger = 1) then
        begin
           // si existeix fa l'update
           if ExisteArticuloEnEEC(articulo) then
              ModificarArticulo(id_articulo)
           else
              InsertarArticulo(id_articulo);
        end;
     end;
  end
  else
  begin
     // Si no existeix cap check, s'assigna
     // Es posa com a principal el nou article
     MarcaPrincipal(id_articulo);

     // si existeix fa l'update
     if ExisteArticuloEnEEC(articulo) then
        ModificarArticulo(id_articulo)
     else
        InsertarArticulo(id_articulo);
  end;
end;

procedure TDMImportacionArticulosExcel.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMArtImportados, '10000');
end;

procedure TDMImportacionArticulosExcel.QMArtImportadosAfterOpen(DataSet: TDataSet);
begin
  xInfoPrincipal.Open;
  xEquivalencias.Open;
end;

procedure TDMImportacionArticulosExcel.QMArtImportadosBeforeClose(DataSet: TDataSet);
begin
  xInfoPrincipal.Close;
  xEquivalencias.Close;
end;

procedure TDMImportacionArticulosExcel.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

// S'assigna de forma masiva tots els articles pendents d'assignar com a principals a articulos
procedure TDMImportacionArticulosExcel.AsignarMasivoPrincipal(BusquedaCompleja: boolean);
var
  Contador : integer;
  Marca : TBookmark;
begin
  AsignarMasivo := True;
  try
     if (BusquedaCompleja = False) then
        FiltrarTabla(1);

     with QMArtImportados do
     begin
        Marca := GetBookmark;
        try
           Close;
           SelectSQL.Add(' AND ARTICULO NOT IN (SELECT ARTICULO FROM ART_ARTICULOS_IMPORTADOS WHERE ART_PRINCIPAL = 1) ');
           Open;

           DisableControls;

           First;
           Contador := 0;
           while (not EOF) do
           begin
              MarcaPrincipal(QMArtImportadosID_ARTICULO.AsInteger);
              AsignarPrincipal(QMArtImportadosID_ARTICULO.AsInteger, QMArtImportadosARTICULO.AsString);
              Next;
              Inc(Contador);
           end;

           GotoBookmark(Marca);
        finally
           EnableControls;
           FreeBookmark(Marca);
        end;
     end;
  finally
     AsignarMasivo := False;
  end;

  ShowMessage(Format(_('Se han traspasado %d articulos'), [Contador]));
end;

procedure TDMImportacionArticulosExcel.QMArtImportadosBeforeEdit(DataSet: TDataSet);
begin
  old_RefProveedor := QMArtImportadosREF_PROVEEDOR.AsString;
end;

procedure TDMImportacionArticulosExcel.RefrescaArticulosImportados;
var
  Marca : TBookmark;
begin
  with QMArtImportados do
  begin
     Marca := GetBookmark;
     DisableControls;
     try
        FiltrarTabla(-1);
        GotoBookmark(Marca);
     finally
        EnableControls;
        FreeBookmark(Marca);
     end;
  end;
end;

procedure TDMImportacionArticulosExcel.FiltrarTabla(aSoloPrincipal: integer);
var
  OrdenadoPorArticulo : boolean;
begin
  // Si el valor de aSoloPrincipal es distinto de (0, 1) dejo SoloPrincipal como está
  if (aSoloPrincipal = 0) then
     SoloPrincipal := True;
  if (aSoloPrincipal = 1) then
     SoloPrincipal := False;

  OrdenadoPorArticulo := not AsignarMasivo;

  with QMArtImportados do
  begin
     Close;

     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * FROM ART_ARTICULOS_IMPORTADOS ');
        Add(' WHERE EMPRESA = ?EMPRESA ');
        if SoloPrincipal then
           Add(' AND ART_PRINCIPAL = 1 ');
        if (OrdenadoPorArticulo) then
           Add(' ORDER BY ARTICULO');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMImportacionArticulosExcel.MarcaPrincipal(id: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_ARTICULOS_IMPORTADOS SET ART_PRINCIPAL = 1 WHERE ID_ARTICULO = ?ID_ARTICULO';
        Params.ByName['ID_ARTICULO'].AsInteger := id;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImportacionArticulosExcel.EliminarImportaciones(Proveedor: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM ART_ARTICULOS_IMPORTADOS WHERE EMPRESA = :EMPRESA AND PROVEEDOR = :PROVEEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage('Borrado realizado con éxito');

  QMArtImportados.Close;
  QMArtImportados.Open;
end;

end.
