unit UProDMHistoricoSerializacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBTableDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TProDMHistoricoSerializacion = class(TDataModule)
     TLocal: THYTransaction;
     DSxHistorico: TDataSource;
     xHistorico: TFIBTableSetRO;
     xHistoricoSERIE: TFIBStringField;
     xHistoricoTIPO: TFIBStringField;
     xHistoricoRIG: TIntegerField;
     xHistoricoLINEA: TIntegerField;
     xHistoricoFECHA: TDateTimeField;
     xHistoricoARTICULO: TFIBStringField;
     xHistoricoSIGNO: TIntegerField;
     xHistoricoCANAL: TIntegerField;
     xHistoricoALMACEN: TFIBStringField;
     frDBTrazaSeries: TfrDBDataSet;
     QMTrazaSeries: TFIBDataSetRO;
     QMTrazaSeriesS_EMPRESA: TIntegerField;
     QMTrazaSeriesS_EJERCICIO: TIntegerField;
     QMTrazaSeriesS_CANAL: TIntegerField;
     QMTrazaSeriesS_SERIE: TFIBStringField;
     QMTrazaSeriesS_CODIGO: TIntegerField;
     QMTrazaSeriesS_TIPO: TFIBStringField;
     QMTrazaSeriesS_RIG: TIntegerField;
     QMTrazaSeriesS_LINEA: TIntegerField;
     QMTrazaSeriesS_FECHA: TDateTimeField;
     QMTrazaSeriesS_ALMACEN: TFIBStringField;
     QMTrazaSeriesS_NSERIE: TFIBStringField;
     QMTrazaSeriesS_ARTICULO: TFIBStringField;
     QMTrazaSeriesR_PROVEEDOR: TIntegerField;
     QMTrazaSeriesR_NOMBRE_R_SOCIAL: TFIBStringField;
     QMTrazaSeriesR_ARTICULO: TFIBStringField;
     QMTrazaSeriesR_TITULO: TFIBStringField;
     QMTrazaSeriesR_UNIDADES: TFloatField;
     QMTrazaSeriesR_PREU: TFloatField;
     QMTrazaSeriesR_TOTAL: TFloatField;
     QMTrazaSeriesR_LOTE: TFIBStringField;
     QMTrazaSeriesR_SERIE: TFIBStringField;
     QMTrazaSeriesR_CLASIFICACION: TFIBStringField;
     QMTrazaSeriesR_FECHA: TDateTimeField;
     QMTrazaSeriesR_TOTAL2: TFloatField;
     frLstTrazaSeries: TfrHYReport;
     QMTrazaSeriesS_TITULOAL: TFIBStringField;
     QMComponentesTraza: TFIBDataSetRO;
     DSTrazaSeries: TDataSource;
     frDBComponentesTraza: TfrDBDataSet;
     QMComponentesTrazaCOMPONENTE: TFIBStringField;
     QMComponentesTrazaEMPRESA: TIntegerField;
     QMComponentesTrazaEJERCICIO: TIntegerField;
     QMComponentesTrazaCANAL: TIntegerField;
     QMComponentesTrazaTIPO: TFIBStringField;
     QMComponentesTrazaNORDEN: TIntegerField;
     QMComponentesTrazaLOTE: TFIBStringField;
     QMComponentesTrazaN_SERIE: TFIBStringField;
     QMComponentesTrazaCLASIFICACION: TFIBStringField;
     QMComponentesTrazaF_FABRICACION: TDateTimeField;
     QMComponentesTrazaF_ENVASADO: TDateTimeField;
     QMComponentesTrazaF_CADUCIDAD: TDateTimeField;
     QMComponentesTrazaCANTIDAD: TFloatField;
     QMComponentesTrazaARTICULO: TFIBStringField;
     QMComponentesTrazaALMACEN: TFIBStringField;
     QMComponentesTrazaLINEA: TIntegerField;
     QMComponentesTrazaID_DETALLES_S: TIntegerField;
     QMComponentesTrazaESTADO_LOTE: TIntegerField;
     QMComponentesTrazaID_A: TIntegerField;
     QMComponentesTrazaSERIE: TFIBStringField;
     QMComponentesTrazaPROVEEDOR: TIntegerField;
     QMComponentesTrazaID_LOTE: TIntegerField;
     QMComponentesTrazaID_ORDEN: TIntegerField;
     QMComponentesTrazaID_ORDEN_MAT: TIntegerField;
     QMComponentesTrazaTITULO: TFIBStringField;
     procedure DMHistoricoSerializacionCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frLstTrazaSeriesGetValue(const ParName: string; var ParValue: variant);
     procedure QMTrazaSeriesBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(modo: integer; nserie: string);
     procedure ObtenerHistorico(NSerie: string);
  end;

var
  ProDMHistoricoSerializacion : TProDMHistoricoSerializacion;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.DFM}

procedure TProDMHistoricoSerializacion.DMHistoricoSerializacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMHistoricoSerializacion.MostrarListado(modo: integer; nserie: string);
begin
  //Obro les dades
  QMTrazaSeries.Close;
  QMTrazaSeries.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  QMTrazaSeries.Params.ByName['nserie'].AsString := nserie;
  QMTrazaSeries.Open;

  DMListados.Imprimir(8024, modo, '', '', frLstTrazaSeries, nil); //Listado traza series
end;

procedure TProDMHistoricoSerializacion.ObtenerHistorico(NSerie: string);
begin
  with xHistorico do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['NSerie'].AsString := NSerie;
     Open;
  end;
end;

procedure TProDMHistoricoSerializacion.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMHistoricoSerializacion.frLstTrazaSeriesGetValue(const ParName: string; var ParValue: variant);
begin
  if (ParName = 'DescTipo') then
  begin
     if ((ProDMHistoricoSerializacion.QMTrazaSeriesS_TIPO.AsString = 'PRO') and
        (ProDMHistoricoSerializacion.QMTrazaSeriesS_LINEA.AsInteger = 0)) then
        ParValue := _('Producción (Entrada)'); //idioma_code
     if ((ProDMHistoricoSerializacion.QMTrazaSeriesS_TIPO.AsString = 'PRO') and
        (ProDMHistoricoSerializacion.QMTrazaSeriesS_LINEA.AsInteger > 0)) then
        ParValue := _('Producción (Salida)');  //idioma_code
     if (ProDMHistoricoSerializacion.QMTrazaSeriesS_TIPO.AsString = 'ALB') then
        ParValue := _('Albarán a cliente');    //idioma_code
     if (ProDMHistoricoSerializacion.QMTrazaSeriesS_TIPO.AsString = 'FAC') then
        ParValue := _('Factura a cliente');    //idioma_code
     if (ProDMHistoricoSerializacion.QMTrazaSeriesS_TIPO.AsString = 'ALP') then
        ParValue := _('Albarán a proveedor');  //idioma_code
     if (ProDMHistoricoSerializacion.QMTrazaSeriesS_TIPO.AsString = 'FAP') then
        ParValue := ('Factura a proveedor');   //idioma_code
     if (ProDMHistoricoSerializacion.QMTrazaSeriesS_TIPO.AsString = 'MVE') then
        ParValue := _('Entrada de stock manual');//idioma_code
     if (ProDMHistoricoSerializacion.QMTrazaSeriesS_TIPO.AsString = 'MVS') then
        ParValue := _('Salida de stock manual'); //idioma_code            //idioma_code
  end;
end;

procedure TProDMHistoricoSerializacion.QMTrazaSeriesBeforeOpen(DataSet: TDataSet);
begin
  QMComponentesTraza.Close;
  QMComponentesTraza.Open;
end;

end.
