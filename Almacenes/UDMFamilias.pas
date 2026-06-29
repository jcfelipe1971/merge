unit UDMFamilias;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Math, FIBQuery, FIBDataSetRO, HYFIBQuery, SysUtils;

type
  TDMFamilias = class(TDataModule)
     QMFamilias: TFIBTableSet;
     QMFamiliasEMPRESA: TIntegerField;
     QMFamiliasEJERCICIO: TIntegerField;
     QMFamiliasCANAL: TIntegerField;
     QMFamiliasFAMILIA: TFIBStringField;
     QMFamiliasTITULO: TFIBStringField;
     QMFamiliasPAIS: TFIBStringField;
     QMFamiliasTIPO_IVA: TIntegerField;
     QMFamiliasCTA_COMPRAS: TFIBStringField;
     QMFamiliasCTA_VENTAS: TFIBStringField;
     DSQMFamilias: TDataSource;
     xTipoIva: TFIBDataSetRO;
     xTipoIvaTITULO: TFIBStringField;
     xTipoIvaP_IVA: TFloatField;
     xTipoIvaP_RECARGO: TFloatField;
     DSxTipoIva: TDataSource;
     TLocal: THYTransaction;
     QMFamiliasVENTA: TIntegerField;
     QMFamiliasPTO_VERDE: TFloatField;
     QMSeries: TFIBTableSet;
     DSQMSeries: TDataSource;
     QMFamiliasACT_TAR_AUTOM: TIntegerField;
     QMFamiliasMARGEN: TFloatField;
     QMFamiliasTIPO_REDONDEO: TIntegerField;
     xTiposRedondeo: TFIBDataSetRO;
     DSxTiposRedondeos: TDataSource;
     QMFamiliasDIAS_MIN: TIntegerField;
     QMFamiliasDIAS_MAX: TIntegerField;
     QMFamiliasCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMFamiliasCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMFamiliasCTA_ABONO_COMPRAS: TFIBStringField;
     QMFamiliasCTA_ABONO_VENTAS: TFIBStringField;
     QCtasCompraVenta: THYFIBQuery;
     QMSeriesEMPRESA: TIntegerField;
     QMSeriesEJERCICIO: TIntegerField;
     QMSeriesCANAL: TIntegerField;
     QMSeriesSERIE: TFIBStringField;
     QMSeriesFAMILIA: TFIBStringField;
     QMSeriesCTA_COMPRAS: TFIBStringField;
     QMSeriesCTA_VENTAS: TFIBStringField;
     QMSeriesCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMSeriesCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMSeriesCTA_ABONO_COMPRAS: TFIBStringField;
     QMSeriesCTA_ABONO_VENTAS: TFIBStringField;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     QMFamiliasTITULO_WEB: TFIBStringField;
     QMFamiliasWEB: TIntegerField;
     DSQMProyectos: TDataSource;
     QMProyectos: TFIBTableSet;
     DSQMProyectosSeries: TDataSource;
     QMProyectosSeries: TFIBTableSet;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosSeries: TFIBDataSetRO;
     DSxProyectosSeries: TDataSource;
     DSxSeries_PROYSER: TDataSource;
     xSeries_PROYSER: TFIBDataSetRO;
     QMProyectosSeriesEMPRESA: TIntegerField;
     QMProyectosSeriesEJERCICIO: TIntegerField;
     QMProyectosSeriesCANAL: TIntegerField;
     QMProyectosSeriesPROYECTO: TIntegerField;
     QMProyectosSeriesSERIE: TFIBStringField;
     QMProyectosSeriesFAMILIA: TFIBStringField;
     QMProyectosSeriesCTA_COMPRAS: TFIBStringField;
     QMProyectosSeriesCTA_VENTAS: TFIBStringField;
     QMProyectosSeriesCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMProyectosSeriesCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMProyectosSeriesCTA_ABONO_COMPRAS: TFIBStringField;
     QMProyectosSeriesCTA_ABONO_VENTAS: TFIBStringField;
     QMProyectosEMPRESA: TIntegerField;
     QMProyectosEJERCICIO: TIntegerField;
     QMProyectosCANAL: TIntegerField;
     QMProyectosPROYECTO: TIntegerField;
     QMProyectosFAMILIA: TFIBStringField;
     QMProyectosCTA_COMPRAS: TFIBStringField;
     QMProyectosCTA_VENTAS: TFIBStringField;
     QMProyectosCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMProyectosCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMProyectosCTA_ABONO_COMPRAS: TFIBStringField;
     QMProyectosCTA_ABONO_VENTAS: TFIBStringField;
     TUpdate: THYTransaction;
     QMSubfamilias: TFIBTableSet;
     DSQMSubfamilias: TDataSource;
     QMSubfamiliasID_SUBFAMILIA: TIntegerField;
     QMSubfamiliasEMPRESA: TIntegerField;
     QMSubfamiliasSUBFAMILIA: TFIBStringField;
     QMSubfamiliasTITULO: TFIBStringField;
     QMSubfamiliasULT_MODIFICACION: TDateTimeField;
     QMSubfamiliasORDEN: TIntegerField;
     QMSubfamiliasID_FAMILIA: TIntegerField;
     QMFamiliasID_FAMILIA: TIntegerField;
     QMFamiliasORDEN: TIntegerField;
     QMFamiliasTIPO_PRECIO_BASE: TIntegerField;
     QMFamiliasTIPO_REGISTRO_FITOSANITARIO: TFIBStringField;
     QMFamiliasDISPONIBILIDAD: TIntegerField;
     xDisponibilidad: TFIBDataSetRO;
     DSxDisponibilidad: TDataSource;
     QMSubfamiliasWEB: TIntegerField;
     QMConfECPrestashop: TFIBTableSet;
     QMConfECPrestashopID: TIntegerField;
     QMConfECPrestashopTITULO: TFIBStringField;
     QMConfECPrestashopWEB: TFIBStringField;
     QMConfECPrestashopEMPRESA: TIntegerField;
     QMConfECPrestashopCANAL: TIntegerField;
     QMConfECPrestashopSERIE: TFIBStringField;
     QMConfECPrestashopACTIVO: TIntegerField;
     QMConfECPrestashopPREFIJO_ART: TFIBStringField;
     QMConfECPrestashopALMACEN: TFIBStringField;
     QMConfECPrestashopAGENTE: TIntegerField;
     QMConfECPrestashopSOLO_CLIENTE_CON_PEDIDO: TIntegerField;
     QMConfECPrestashopUTILIZA_MODULO_PAYPAL: TIntegerField;
     QMConfECPrestashopART_SIN_CONTROL_STOCK: TIntegerField;
     QMConfECPrestashopUTILIZA_REF_PRESTAHOP: TIntegerField;
     QMConfECPrestashopVERSION_PRESTASHOP: TFIBStringField;
     QMConfECPrestashopID_TIENDA_ARTICULOS: TIntegerField;
     QMConfECPrestashopWS_URL: TFIBStringField;
     QMConfECPrestashopWS_KEY: TFIBStringField;
     QMConfECPrestashopWS_VERSION: TFIBStringField;
     QMConfECPrestashopWS_DEBUG: TIntegerField;
     QMConfECPrestashopWS_LANGUAGE: TIntegerField;
     QMConfECPrestashopWS_ORDER_STATE: TIntegerField;
     DSQMConfECPrestashop: TDataSource;
     DSQMFamiliaECPrestashop: TDataSource;
     QMFamiliaECPrestashop: TFIBTableSet;
     QMFamiliaECPrestashopID_CONFIGURACION: TIntegerField;
     QMFamiliaECPrestashopID_FAMILIA: TIntegerField;
     QMFamiliaECPrestashopID_CATEGORY: TIntegerField;
     QMFamiliaECPrestashopULT_SINCRONIZACION: TDateTimeField;
     QMFamiliaECPrestashopID_SUBFAMILIA: TIntegerField;
     QMFamiliaECPrestashopTITULO_FAMILIA: TFIBStringField;
     QMFamiliaECPrestashopTITULO_SUBFAMILIA: TFIBStringField;
     QMFamiliaECPrestashopFAMILIA: TFIBStringField;
     QMFamiliaECPrestashopSUBFAMILIA: TFIBStringField;
     QMFamiliasSECCION: TFIBStringField;
     QMFamiliasID_IMAGEN: TIntegerField;
     QMFamiliasCANTIDAD_ARTICULOS: TIntegerField;
     QMFamiliasACTUALIZA_VENTA: TIntegerField;
     QMFamiliasPCOSTE_CERO_EN_VENTAS: TIntegerField;
     procedure DMFamiliasCreate(Sender: TObject);
     procedure QMFamiliasNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMFamiliasTIPO_IVAChange(Sender: TField);
     procedure QMFamiliasAfterOpen(DataSet: TDataSet);
     procedure QMFamiliasBeforePost(DataSet: TDataSet);
     procedure QMSeriesCUENTA_VENTASChange(Sender: TField);
     procedure QMSeriesCUENTA_COMPRASChange(Sender: TField);
     procedure QMSeriesNewRecord(DataSet: TDataSet);
     procedure QMFamiliasTIPO_REDONDEOChange(Sender: TField);
     procedure QMFamiliasAfterPost(DataSet: TDataSet);
     procedure QMFamiliasAfterScroll(DataSet: TDataSet);
     procedure QMSeriesAfterOpen(DataSet: TDataSet);
     procedure QMSeriesSERIEChange(Sender: TField);
     procedure QMProyectosSeriesPROYECTOChange(Sender: TField);
     procedure QMProyectosSeriesSERIEChange(Sender: TField);
     procedure QMProyectosPROYECTOChange(Sender: TField);
     procedure QMProyectosNewRecord(DataSet: TDataSet);
     procedure QMProyectosSeriesNewRecord(DataSet: TDataSet);
     procedure QMProyectosAfterOpen(DataSet: TDataSet);
     procedure QMProyectosSeriesAfterOpen(DataSet: TDataSet);
     procedure SetPGCBeforeOpen(DataSet: TDataSet);
     procedure QMSubfamiliasNewRecord(DataSet: TDataSet);
     procedure QMSubfamiliasBeforePost(DataSet: TDataSet);
     procedure QMFamiliasBeforeClose(DataSet: TDataSet);
     procedure QMSubfamiliasBeforeEdit(DataSet: TDataSet);
     procedure QMSubfamiliasAfterPost(DataSet: TDataSet);
     procedure QMFamiliasDISPONIBILIDADChange(Sender: TField);
     procedure QMConfECPrestashopAfterScroll(DataSet: TDataSet);
     procedure QMFamiliaECPrestashopBeforeOpen(DataSet: TDataSet);
     procedure QMFamiliasCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     Sistema: boolean;
     OrdenSubfamilia: integer;
  public
     { Public declarations }
     DiasMin, DiasMax: integer;
     procedure BusquedaCompleja;
     procedure Propagar;
     function DameFamilia: string;
     procedure PropagaMargen;
     procedure PropagaMargenArticulo;
     procedure PropagaRed;
     procedure Refresca(Pagina: integer);
     procedure CambiaFamiliaSistema(Sistema: boolean);
     function DameTituloTipoPrecioBase(TipoPrecioBase: integer): string;
     procedure AbrirEcommerce;
     procedure CerrarEcommerce;
     procedure FiltrarEcommercePrestashop(IdTienda: integer);
  end;

var
  DMFamilias : TDMFamilias;

implementation

uses UDMMain, UEntorno, ufBusca, UFParada, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMFamilias.DMFamiliasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  Sistema := False;
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMFamiliasPTO_VERDE.DisplayFormat := MascaraE;
  QMFamiliasMARGEN.DisplayFormat := MascaraP;
  xTipoIvaP_IVA.DisplayFormat := MascaraP;
  xTipoIvaP_RECARGO.DisplayFormat := MascaraP;

  // Filtrar Familias
  with QMFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
     Open;
  end;
end;

procedure TDMFamilias.QMFamiliasNewRecord(DataSet: TDataSet);
begin
  QMFamiliasEMPRESA.AsInteger := REntorno.Empresa;
  QMFamiliasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMFamiliasCANAL.AsInteger := REntorno.Canal;
  QMFamiliasPAIS.AsString := REntorno.Pais;
  // Selecciona el tipo de IVA por defecto del canal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_IVA FROM EMP_CANALES WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        ExecQuery;
        QMFamiliasTIPO_IVA.AsInteger := FieldByName['TIPO_IVA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  QMFamiliasVENTA.AsInteger := 0; // No permitir stock negativo
  QMFamiliasACTUALIZA_VENTA.AsInteger := 1;
  QMFamiliasDISPONIBILIDAD.AsInteger := 1;
  QMFamiliasPTO_VERDE.AsFloat := 0;
  QMFamiliasACT_TAR_AUTOM.AsInteger := 1;
  QMFamiliasMARGEN.AsFloat := 0;
  QMFamiliasTIPO_REDONDEO.AsInteger := -1;
  if (DMMain.EstadoKri(489) = 0) then
     QMFamiliasTIPO_PRECIO_BASE.AsInteger := -1
  else
     QMFamiliasTIPO_PRECIO_BASE.AsInteger := 2;
  QMFamiliasWEB.AsInteger := 1;
  QMFamiliasORDEN.AsInteger := 0;
  QMFamiliasTIPO_REGISTRO_FITOSANITARIO.AsString := 'Z';
  QMFamiliasSECCION.AsString := 'DES';

  // Cuentas
  with QCtasCompraVenta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMFamiliasEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMFamiliasEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMFamiliasCANAL.AsInteger;
     ExecQuery;
     QMFamiliasCTA_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
     QMFamiliasCTA_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
     QMFamiliasCTA_DEVOLUCION_COMPRAS.AsString := FieldByName['CTA_DEV_COMPRAS'].AsString;
     QMFamiliasCTA_DEVOLUCION_VENTAS.AsString := FieldByName['CTA_DEV_VENTAS'].AsString;
     QMFamiliasCTA_ABONO_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
     QMFamiliasCTA_ABONO_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
     FreeHandle;
  end;
end;

procedure TDMFamilias.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMFamilias.QMFamiliasTIPO_IVAChange(Sender: TField);
begin
  with xTipoIva do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Open;
  end;
end;

procedure TDmFamilias.BusquedaCompleja;
var
  Orden : string;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMFamilias, '11100', False);
  Orden := QMFamilias.OrdenadoPor;
  QMFamilias.Ordenar('');
  if QMFamilias.SelectSQL.Count <> 0 then
  begin
     QMFamilias.SelectSQL.Add('AND FAMILIA<>?FAMILIA');
     QMFamilias.Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
  end;
  QMFamilias.Ordenar(Orden);
  QMFamilias.Open;
end;

procedure TDMFamilias.QMFamiliasAfterOpen(DataSet: TDataSet);
begin
  xTipoIva.Open;
  xTiposRedondeo.Open;
  QMSeries.Open;
  QMProyectosSeries.Open;
  QMProyectos.Open;
  if (DMMain.EstadoKri(445) = 1) then
     QMSubfamilias.Open;
  xDisponibilidad.Open;
end;

procedure TDMFamilias.QMFamiliasBeforePost(DataSet: TDataSet);
var
  pto : double;
  pot10 : extended;
begin
  pto := QMFamiliasPTO_VERDE.AsFloat;
  pot10 := Power(10, REntorno.DecimalesCalculo);
  pto := (Trunc(pto * pot10)) / pot10;
  QMFamiliasPTO_VERDE.AsFloat := pto;
end;

procedure TDMFamilias.QMSeriesCUENTA_VENTASChange(Sender: TField);
begin
  QMSeries.FieldByName('TITULO_CTA_VENTAS').AsString := DameTituloCuenta(Sender.AsString);
end;

procedure TDMFamilias.QMSeriesCUENTA_COMPRASChange(Sender: TField);
begin
  QMSeries.FieldByName('TITULO_CTA_COMPRAS').AsString := DameTituloCuenta(Sender.AsString);
end;

procedure TDMFamilias.QMSeriesNewRecord(DataSet: TDataSet);
begin
  QMSeriesEMPRESA.AsInteger := REntorno.Empresa;
  QMSeriesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMSeriesCANAL.AsInteger := REntorno.Canal;
  QMSeriesFAMILIA.AsString := QMFamiliasFAMILIA.AsString;

  // Cuentas
  with QCtasCompraVenta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMSeriesEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMSeriesEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMSeriesCANAL.AsInteger;
     ExecQuery;
     QMSeriesCTA_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
     QMSeriesCTA_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
     QMSeriesCTA_DEVOLUCION_COMPRAS.AsString := FieldByName['CTA_DEV_COMPRAS'].AsString;
     QMSeriesCTA_DEVOLUCION_VENTAS.AsString := FieldByName['CTA_DEV_VENTAS'].AsString;
     QMSeriesCTA_ABONO_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
     QMSeriesCTA_ABONO_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
     FreeHandle;
  end;
end;

function TDMFamilias.DameFamilia: string;
begin
  Result := QMFamiliasFAMILIA.AsString;
end;

procedure TDMFamilias.Propagar;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_FAM_PROPAGA_CUENTAS_SERIE(:EMPRESA, :EJERCICIO, :CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFamilias.PropagaMargen;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_ACTUALIZA_MARGEN_FAMILIA (:EMPRESA, :FAMILIA)';
        Params.ByName['EMPRESA'].AsInteger := QMFamiliasEMPRESA.AsInteger;
        Params.ByName['FAMILIA'].AsString := QMFamiliasFAMILIA.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFamilias.PropagaMargenArticulo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_ACTUALIZA_MARGEN_ARTICULO (:EMPRESA,:FAMILIA)';
        Params.ByName['EMPRESA'].AsInteger := QMFamiliasEMPRESA.AsInteger;
        Params.ByName['FAMILIA'].AsString := QMFamiliasFAMILIA.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFamilias.QMFamiliasTIPO_REDONDEOChange(Sender: TField);
begin
  xTiposRedondeo.Close;
  xTiposRedondeo.Open;
end;

procedure TDMFamilias.PropagaRed;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_ACTUALIZA_REDONDEOS_ART (:EMPRESA, :FAMILIA)';
        Params.ByName['EMPRESA'].AsInteger := QMFamiliasEMPRESA.AsInteger;
        Params.ByName['FAMILIA'].AsString := QMFamiliasFAMILIA.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFamilias.QMFamiliasAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_FAMILIAS SET DIAS_MIN = :DIAS_MIN, DIAS_MAX = :DIAS_MAX WHERE EMPRESA = :EMPRESA AND FAMILIA = :FAMILIA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FAMILIA'].AsString := QMFamiliasFAMILIA.AsString;
        Params.ByName['DIAS_MIN'].AsInteger := DiasMin;
        Params.ByName['DIAS_MAX'].AsInteger := DiasMax;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMFamilias, 'ID_FAMILIA', QMFamiliasID_FAMILIA.AsInteger);
end;

procedure TDMFamilias.QMFamiliasAfterScroll(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DIAS_MIN, DIAS_MAX FROM ART_FAMILIAS WHERE EMPRESA = :EMPRESA AND FAMILIA = :FAMILIA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FAMILIA'].AsString := QMFamiliasFAMILIA.AsString;
        ExecQuery;
        DiasMin := FieldByName['DIAS_MIN'].AsInteger;
        DiasMax := FieldByName['DIAS_MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFamilias.Refresca(Pagina: integer);
begin
  QMProyectos.Open;
  xProyectos.DataSource := DSQMProyectos;
  xProyectos.Open;

  QMProyectosSeries.Open;
  xProyectosSeries.DataSource := DSQMProyectosSeries;
  xProyectosSeries.Open;
  xSeries_PROYSER.Open;
end;

procedure TDMFamilias.QMSeriesAfterOpen(DataSet: TDataSet);
begin
  xSeries.Open;
end;

procedure TDMFamilias.QMSeriesSERIEChange(Sender: TField);
begin
  xSeries.Close;
  xSeries.Open;
end;

procedure TDMFamilias.CambiaFamiliaSistema(Sistema: boolean);
begin
  with QMFamilias do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_FAMILIAS_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     if Sistema then
        SelectSQL.Add(' FAMILIA = ?FAMILIA ')
     else
        SelectSQL.Add(' FAMILIA <> ?FAMILIA ');
     SelectSQL.Add(' ORDER BY FAMILIA ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
     Open;
  end;
end;

procedure TDMFamilias.QMProyectosSeriesPROYECTOChange(Sender: TField);
begin
  xProyectosSeries.Close;
  xProyectosSeries.Open;
end;

procedure TDMFamilias.QMProyectosSeriesSERIEChange(Sender: TField);
begin
  xSeries_PROYSER.Close;
  xSeries_PROYSER.Open;
end;

procedure TDMFamilias.QMProyectosPROYECTOChange(Sender: TField);
begin
  xProyectos.Close;
  xProyectos.Open;
end;

procedure TDMFamilias.QMProyectosNewRecord(DataSet: TDataSet);
begin
  QMProyectosEMPRESA.AsInteger := REntorno.Empresa;
  QMProyectosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProyectosCANAL.AsInteger := REntorno.Canal;
  QMProyectosFAMILIA.AsString := QMFamiliasFAMILIA.AsString;

  // Cuentas
  with QCtasCompraVenta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMProyectosEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMProyectosEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMProyectosCANAL.AsInteger;
     ExecQuery;
     QMProyectosCTA_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
     QMProyectosCTA_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
     QMProyectosCTA_DEVOLUCION_COMPRAS.AsString := FieldByName['CTA_DEV_COMPRAS'].AsString;
     QMProyectosCTA_DEVOLUCION_VENTAS.AsString := FieldByName['CTA_DEV_VENTAS'].AsString;
     QMProyectosCTA_ABONO_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
     QMProyectosCTA_ABONO_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
     FreeHandle;
  end;
end;

procedure TDMFamilias.QMProyectosSeriesNewRecord(DataSet: TDataSet);
begin
  QMProyectosSeriesEMPRESA.AsInteger := REntorno.Empresa;
  QMProyectosSeriesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProyectosSeriesCANAL.AsInteger := REntorno.Canal;
  QMProyectosSeriesFAMILIA.AsString := QMFamiliasFAMILIA.AsString;

  // Cuentas
  with QCtasCompraVenta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMProyectosSeriesEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMProyectosSeriesEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMProyectosSeriesCANAL.AsInteger;
     ExecQuery;
     QMProyectosSeriesCTA_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
     QMProyectosSeriesCTA_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
     QMProyectosSeriesCTA_DEVOLUCION_COMPRAS.AsString := FieldByName['CTA_DEV_COMPRAS'].AsString;
     QMProyectosSeriesCTA_DEVOLUCION_VENTAS.AsString := FieldByName['CTA_DEV_VENTAS'].AsString;
     QMProyectosSeriesCTA_ABONO_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
     QMProyectosSeriesCTA_ABONO_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
     FreeHandle;
  end;
end;

procedure TDMFamilias.QMProyectosAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
end;

procedure TDMFamilias.QMProyectosSeriesAfterOpen(DataSet: TDataSet);
begin
  xProyectosSeries.Open;
  xSeries_PROYSER.Open;
end;

procedure TDMFamilias.SetPGCBeforeOpen(DataSet: TDataSet);
begin
  TFIBDataSetRO(DataSet).Params.ByName['PGC'].AsInteger := REntorno.Pgc;
end;

procedure TDMFamilias.QMSubfamiliasNewRecord(DataSet: TDataSet);
begin
  QMSubfamiliasEMPRESA.AsInteger := QMFamiliasEMPRESA.AsInteger;
  QMSubfamiliasID_FAMILIA.AsInteger := QMFamiliasID_FAMILIA.AsInteger;
  QMSubfamiliasID_SUBFAMILIA.AsInteger := 0;

  QMSubFamiliasWEB.AsInteger := QMFamiliasWEB.AsInteger;
  QMSubfamiliasORDEN.AsInteger := 0;
end;

procedure TDMFamilias.QMSubfamiliasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMSubfamilias, 'CONTA_SUBFAMILIAS', 'ID_SUBFAMILIA');

  if (QMSubfamiliasORDEN.AsInteger = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(ORDEN) FROM ART_SUBFAMILIAS WHERE EMPRESA = ?EMPRESA AND ID_FAMILIA = ?ID_FAMILIA';
           Params.ByName['EMPRESA'].AsInteger := QMSubfamiliasEMPRESA.AsInteger;
           Params.ByName['ID_FAMILIA'].AsInteger := QMSubfamiliasID_FAMILIA.AsInteger;
           ExecQuery;
           QMSubfamiliasORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFamilias.QMFamiliasBeforeClose(DataSet: TDataSet);
begin
  xTipoIva.Close;
  xTiposRedondeo.Close;
  QMSeries.Close;
  QMProyectosSeries.Close;
  QMProyectos.Close;
  QMSubfamilias.Close;
  xDisponibilidad.Close;
end;

procedure TDMFamilias.QMSubfamiliasBeforeEdit(DataSet: TDataSet);
begin
  OrdenSubfamilia := QMSubfamiliasORDEN.AsInteger;
end;

procedure TDMFamilias.QMSubfamiliasAfterPost(DataSet: TDataSet);
begin
  if (OrdenSubfamilia <> QMSubfamiliasORDEN.AsInteger) then
     Refrescar(QMSubfamilias, 'ID_SUBFAMILIA', QMSubfamiliasID_SUBFAMILIA.AsInteger);
end;

function TDMFamilias.DameTituloTipoPrecioBase(TipoPrecioBase: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_TIPO_PRECIO_BASE WHERE TIPO_PRECIO_BASE = :TIPO_PRECIO_BASE';
        Params.ByName['TIPO_PRECIO_BASE'].AsInteger := TipoPrecioBase;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;


procedure TDMFamilias.QMFamiliasDISPONIBILIDADChange(Sender: TField);
begin
  with xDisponibilidad do
  begin
     Close;
     Open;
  end;
end;

procedure TDMFamilias.AbrirEcommerce;
begin
  with QMConfECPrestashop do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  QMFamiliaECPrestashop.Open;
end;

procedure TDMFamilias.CerrarEcommerce;
begin
  QMFamiliaECPrestashop.Close;
  QMConfECPrestashop.Close;
end;

procedure TDMFamilias.FiltrarEcommercePrestashop(IdTienda: integer);
begin
  with QMConfECPrestashop do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_CONF_PRESTASHOP ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL ');
     if (IdTienda <> 0) then
        SelectSQL.Add(' AND ID = :ID ');
     SelectSQL.Add(' ORDER BY ID ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (IdTienda <> 0) then
        Params.ByName['ID'].AsInteger := IdTienda;
     Open;
  end;

  QMFamiliaECPrestashop.Open;
end;

procedure TDMFamilias.QMConfECPrestashopAfterScroll(DataSet: TDataSet);
begin
  QMFamiliaECPrestashop.Close;
  QMFamiliaECPrestashop.Open;
end;

procedure TDMFamilias.QMFamiliaECPrestashopBeforeOpen(DataSet: TDataSet);
begin
  QMFamiliaECPrestashop.Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfECPrestashopID.AsInteger;
end;

procedure TDMFamilias.QMFamiliasCalcFields(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) ');
        SQL.Add(' FROM ART_ARTICULOS A ');
        SQL.Add(' JOIN CON_CUENTAS_GES_ART C ON A.EMPRESA = C.EMPRESA AND A.ARTICULO = C.ARTICULO ');
        SQL.Add(' JOIN ART_FAMILIAS F ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.FAMILIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' A.FAMILIA = :FMAILIA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FMAILIA'].AsString := QMFamiliasFAMILIA.AsString;
        ExecQuery;
        QMFamiliasCANTIDAD_ARTICULOS.AsInteger := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
