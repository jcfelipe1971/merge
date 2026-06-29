unit UDMArtEscandallo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO, UDMArticulos, Controls;

type
  TDMArtEscandallo = class(TDataModule)
     QMEscandallo: TFIBTableSet;
     DSQMEscandallo: TDataSource;
     QMEscandalloEMPRESA: TIntegerField;
     QMEscandalloARTICULO: TFIBStringField;
     QMEscandalloDETALLE: TFIBStringField;
     QMEscandalloTITULO: TFIBStringField;
     QMEscandalloP_COSTE: TFloatField;
     QMEscandalloCANTIDAD: TFloatField;
     xArticulo: TFIBTableSet;
     DSxArticulo: TDataSource;
     DSxDetalle: TDataSource;
     xDetalle: TFIBDataSetRO;
     xDetalleEMPRESA: TIntegerField;
     xDetalleARTICULO: TFIBStringField;
     xDetalleDETALLE: TFIBStringField;
     xDetalleTITULO: TFIBStringField;
     xDetalleP_COSTE: TFloatField;
     xDetalleCANTIDAD: TFloatField;
     TLocal: THYTransaction;
     QMEscandalloFAMILIA: TFIBStringField;
     QMEscandalloUNIDADES: TFIBStringField;
     QMEscandalloBARRAS: TStringField;
     TUpdate: THYTransaction;
     xArticuloEMPRESA: TIntegerField;
     xArticuloEJERCICIO: TIntegerField;
     xArticuloCANAL: TIntegerField;
     xArticuloARTICULO: TFIBStringField;
     xArticuloTITULO: TFIBStringField;
     xArticuloID_FAMILIA: TIntegerField;
     xArticuloFAMILIA: TFIBStringField;
     xArticuloID_SUBFAMILIA: TIntegerField;
     xArticuloSUBFAMILIA: TFIBStringField;
     xArticuloP_COSTE: TFloatField;
     xArticuloABIERTO: TIntegerField;
     xArticuloVIRTUAL: TIntegerField;
     xArticuloCONTROL_STOCK: TIntegerField;
     xArticuloPAIS: TFIBStringField;
     xArticuloTIPO_IVA: TIntegerField;
     xArticuloCTA_COMPRAS: TFIBStringField;
     xArticuloCTA_VENTAS: TFIBStringField;
     xArticuloCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     xArticuloCTA_DEVOLUCION_VENTAS: TFIBStringField;
     xArticuloCTA_ABONO_COMPRAS: TFIBStringField;
     xArticuloCTA_ABONO_VENTAS: TFIBStringField;
     xArticuloENTRADA: TIntegerField;
     xArticuloUNIDADES: TFIBStringField;
     xArticuloTITULO_CORTO: TFIBStringField;
     xArticuloNOTAS: TMemoField;
     xArticuloDISPONIBILIDAD: TIntegerField;
     xArticuloACTUALIZA_VENTA: TIntegerField;
     xArticuloPTO_VERDE: TFloatField;
     xArticuloCONTROLA_MEDIDAS: TIntegerField;
     xArticuloSERIALIZADO: TIntegerField;
     xArticuloGARANTIA: TIntegerField;
     xArticuloPRODUCCION: TIntegerField;
     xArticuloDESCUENTO: TFloatField;
     xArticuloDESCUENTO_2: TFloatField;
     xArticuloDESCUENTO_3: TFloatField;
     xArticuloIVA_ESCANDALLO: TIntegerField;
     xArticuloPVP_POR_UD_SECUNDARIA: TIntegerField;
     xArticuloALFA_1: TFIBStringField;
     xArticuloALFA_2: TFIBStringField;
     xArticuloALFA_3: TFIBStringField;
     xArticuloALFA_4: TFIBStringField;
     xArticuloALFA_5: TFIBStringField;
     xArticuloALFA_6: TFIBStringField;
     xArticuloALFA_7: TFIBStringField;
     xArticuloALFA_8: TFIBStringField;
     xArticuloSERIALIZADO_KRI: TIntegerField;
     xArticuloLOTES_KRI: TIntegerField;
     xArticuloLOTES: TIntegerField;
     xArticuloMULTIPLO_1: TFloatField;
     xArticuloMULTIPLO_2: TFloatField;
     xArticuloMULTIPLO_3: TFloatField;
     xArticuloMULTIPLO_4: TFloatField;
     xArticuloFACTOR_ESCALA: TFloatField;
     xArticuloUD_MINIMO_COMPRA: TFloatField;
     xArticuloUD_MINIMO_VENTA: TFloatField;
     xArticuloID_A_M_C_T: TIntegerField;
     xArticuloID_A: TIntegerField;
     xArticuloID_C_A: TIntegerField;
     xArticuloIMAGEN: TIntegerField;
     xArticuloID_GALERIA: TIntegerField;
     xArticuloCODIGO_INTRA: TFIBStringField;
     xArticuloPESO: TFloatField;
     xArticuloUBICABLE: TIntegerField;
     xArticuloVOLUMEN_UNIT: TFloatField;
     xArticuloDIAMETRO_UNIT: TFloatField;
     xArticuloDEFECTO_UD_SECUNDARIA: TFloatField;
     xArticuloNOTAS_COMPRAS: TMemoField;
     xArticuloNOTAS_VENTAS: TMemoField;
     xArticuloNO_CALCULA_STOCKMINMAX: TIntegerField;
     xArticuloCRC_NOTAS: TFIBStringField;
     xArticuloCRC_NOTAS_COMPRAS: TFIBStringField;
     xArticuloCRC_NOTAS_VENTAS: TFIBStringField;
     xArticuloANTICIPO: TIntegerField;
     xArticuloANTICIPO_CONTADO: TIntegerField;
     xArticuloANTICIPO_PREG_DATOS: TIntegerField;
     xArticuloWEB: TIntegerField;
     xArticuloFABRICANTE: TIntegerField;
     xArticuloBAJA: TIntegerField;
     xArticuloFECHA_BAJA: TDateTimeField;
     xArticuloMOTIVO_BAJA: TFIBStringField;
     xArticuloTIPO_CLAVE_ADR: TIntegerField;
     xArticuloCANTIDAD_LIMITADA: TIntegerField;
     xArticuloTIPO_ARTICULO_TYC: TFIBStringField;
     xArticuloZ_MODELO: TFIBStringField;
     xArticuloZ_LINEA: TFloatField;
     xArticuloZ_SALIDA: TFloatField;
     xArticuloZ_ARMAZON: TFIBStringField;
     xArticuloZ_LONA: TFIBStringField;
     xArticuloZ_LONA_TIPO: TFIBStringField;
     xArticuloZ_LONA_FORMA: TFIBStringField;
     xArticuloZ_LONA_MODELO: TFIBStringField;
     xArticuloZ_LONA_CONFECCION: TFIBStringField;
     xArticuloZ_LACADO: TIntegerField;
     xArticuloZ_TIPO_LACADO: TFIBStringField;
     xArticuloZ_CORTE: TIntegerField;
     xArticuloZ_QUITAR_SI_HAY_MOTOR: TIntegerField;
     xArticuloZ_SUSTITUTO: TFIBStringField;
     xArticuloZ_KIT_TIPO: TFIBStringField;
     xArticuloZ_PREPARABLE: TIntegerField;
     xArticuloZ_MERMA: TFloatField;
     xArticuloZ_FORZAR_LACADO_SN: TIntegerField;
     xArticuloZ_TIPO_LACADO_FORZADO: TFIBStringField;
     xArticuloCOMPONENTE_MOTOR: TIntegerField;
     xArticuloULT_MODIFICACION: TDateTimeField;
     xArticuloZ_LAM_ANCHO: TFloatField;
     xArticuloZ_LAM_LARGO: TFloatField;
     xArticuloZ_LAM_COLOR: TFIBStringField;
     xArticuloSUBTIPO_ARTICULO_TYC: TFIBStringField;
     xArticuloEXPORTAR: TIntegerField;
     xArticuloCOSTE_ADICIONAL: TFloatField;
     xArticuloZ_QUITAR_SI_ES_MANUAL: TIntegerField;
     xArticuloID_MARCA: TIntegerField;
     xArticuloMARCA: TFIBStringField;
     xArticuloTITULO_MARCA: TFIBStringField;
     xArticuloPMP: TFloatField;
     xArticuloPRECIO_MERCADO: TFloatField;
     xArticuloCOD_COLOR_HILO: TFIBStringField;
     xArticuloID_A_M: TIntegerField;
     xArticuloBLOQUEO_COMPRAS: TIntegerField;
     xArticuloMOTIVO_BLOQUEO_COMPRAS: TFIBStringField;
     xArticuloBLOQUEO_VENTAS: TIntegerField;
     xArticuloMOTIVO_BLOQUEO_VENTAS: TFIBStringField;
     xArticuloADR_PACKAGE: TFIBStringField;
     xArticuloTIPO_ARTICULO: TFIBStringField;
     xArticuloTIPO_REGISTRO_FITOSANITARIO: TFIBStringField;
     xArticuloPREPARABLE: TIntegerField;
     xArticuloTIPO_IBAE: TIntegerField;
     xArticuloLITROS_POR_UNIDAD: TFloatField;
     xArticuloZ_RIBETE_DEFECTO: TFIBStringField;
     xArticuloZ_LON_COLOR_1: TFIBStringField;
     xArticuloZ_LON_COLOR_2: TFIBStringField;
     xArticuloZ_LON_COLOR_3: TFIBStringField;
     xArticuloFORMULA_DEFECTO: TIntegerField;
     xArticuloTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     xArticuloGENERAR_PEDIDO_COMPRA_SIEMPRE: TIntegerField;
     xArticuloSECCION: TFIBStringField;
     procedure DMArt_EscandalloCreate(Sender: TObject);
     procedure QMEscandalloNewRecord(DataSet: TDataSet);
     procedure QMEscandalloAfterPost(DataSet: TDataSet);
     procedure QMEscandalloBARRASGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xArticuloAfterOpen(DataSet: TDataSet);
     procedure xArticuloBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure PRO_Habilita_Escandallo;
     procedure Es_Virtual(var vir: smallint);
     procedure FiltraArticulo(Articulo: string);
  end;

var
  DMArtEscandallo : TDMArtEscandallo;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca, URecursos,
  UFMArtescandallo, UDameDato;

{$R *.DFM}

procedure TDMArtEscandallo.DMArt_EscandalloCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xArticuloP_COSTE.DisplayFormat := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);

  QMEscandalloP_COSTE.DisplayFormat := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);
  QMEscandalloCANTIDAD.DisplayFormat := MascaraI;

  xDetalleP_COSTE.DisplayFormat := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);
  xDetalleCANTIDAD.DisplayFormat := MascaraI;

  with xArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMArtEscandallo.PRO_Habilita_Escandallo;
begin
  // MArca el articulo como ABIERTO=1
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_HABILITA_ESCANDALLO(?EMPRESA, ?ARTICULO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := QMEscandalloARTICULO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArtEscandallo.QMEscandalloNewRecord(DataSet: TDataSet);
begin
  QMEscandalloEMPRESA.AsInteger := xArticulo.FieldByName('EMPRESA').AsInteger;
  QMEscandalloARTICULO.AsString := xArticulo.FieldByName('ARTICULO').AsString;
  QMEscandalloCANTIDAD.AsFloat := 1;
  QMEscandalloUNIDADES.AsString := '';
end;

procedure TDMArtEscandallo.Es_Virtual(var vir: smallint);
begin
  if (xArticulo.FieldByName('VIRTUAL').AsInteger = 1) then
     vir := 1;
end;

procedure TDMArtEscandallo.QMEscandalloAfterPost(DataSet: TDataSet);
var
  Detalle : string;
begin
  Detalle := QMEscandalloDETALLE.AsString;
  Refrescar(xArticulo, 'ARTICULO', QMEscandalloARTICULO.AsString);
  Posicionar(QMEscandallo, 'DETALLE', Detalle);
end;

procedure TDMArtEscandallo.QMEscandalloBARRASGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameCodigoBarras(QMEscandalloDETALLE.AsString);
end;

procedure TDMArtEscandallo.xArticuloAfterOpen(DataSet: TDataSet);
begin
  QMEscandallo.Open;
end;

procedure TDMArtEscandallo.xArticuloBeforeClose(DataSet: TDataSet);
begin
  QMEscandallo.Close;
end;

procedure TDMArtEscandallo.FiltraArticulo(Articulo: string);
begin
  Posicionar(xArticulo, 'ARTICULO', Articulo);
end;

procedure TDMArtEscandallo.BusquedaCompleja;
var
  Orden : string;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(xArticulo, '11100', False) <> mrCancel) then
  begin
     with xArticulo do
     begin
        Orden := OrdenadoPor;
        Ordenar('');
        if SelectSQL.Count <> 0 then
           SelectSQL.Add('AND FAMILIA<>''' + REntorno.FamSistema + '''');
        Ordenar(Orden);
     end;
  end;

  xArticulo.Open;
end;

end.
