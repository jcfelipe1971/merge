unit UDMConfiguracionTPV;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMConfiguracionTPV = class(TDataModule)
     QMConfiguracion: TFIBTableSet;
     QMConfiguracionEMPRESA: TIntegerField;
     QMConfiguracionEJERCICIO: TIntegerField;
     QMConfiguracionCANAL: TIntegerField;
     QMConfiguracionSERIE: TFIBStringField;
     QMConfiguracionTERCERO: TIntegerField;
     QMConfiguracionCLIENTE: TIntegerField;
     QMConfiguracionCONTROL_STOCK: TIntegerField;
     DSQMConfiguracion: TDataSource;
     xTipoStock: TFIBTableSet;
     DSxTiposStock: TDataSource;
     xTipoStockTIPO: TIntegerField;
     xTipoStockTITULO: TFIBStringField;
     QMConfiguracionFACTURAR: TIntegerField;
     QMConfiguracionUNICA_FAC: TIntegerField;
     QMConfiguracionLIMITE_FAC: TFloatField;
     QMConfiguracionROLLO_HACIENDA: TIntegerField;
     QMConfiguracionACREEDOR: TIntegerField;
     QMConfiguracionDIAS_CADUCIDAD_RESERVA: TIntegerField;
     QMConfiguracionDIAS_CADUCIDAD_VALES: TIntegerField;
     QMConfiguracionDESPLEGAR_BUSQUEDA_VALES: TIntegerField;
     QMConfiguracionUSAR_MEDIOS_VALES: TIntegerField;
     QMConfiguracionUSAR_MEDIAS_ENTREGAS: TIntegerField;
     QMConfiguracionCUENTA_VALES: TFIBStringField;
     QMConfiguracionOBLIGA_TICKET_DEVOLUCION: TIntegerField;
     QMConfiguracionOBLIGA_ARTICULOS_DEVOLUCION: TIntegerField;
     QMConfiguracionGENERA_VALE_DEVOLUCION: TIntegerField;
     QMConfiguracionPRIORIZA_FP: TIntegerField;
     QMConfiguracionPRIORIZA_STK: TIntegerField;
     QMConfiguracionPOR_IMPORTES: TIntegerField;
     QMConfiguracionFORMA_PAGO_TICKET: TFIBStringField;
     QMConfiguracionFORMA_PAGO_ABONO: TFIBStringField;
     QMConfiguracionDIAS_PROPUESTA_PEDIDO: TIntegerField;
     QMConfiguracionFACTURACION_POR_LINEAS: TIntegerField;
     QMConfiguracionOBLIGA_FP_DEVOLUCION: TIntegerField;
     QMConfiguracionREGULA_MOV_STOCK: TIntegerField;
     QMConfiguracionCANAL_FACTURACION_DEFECTO: TIntegerField;
     QMConfiguracionAUTO_GRABA_CABECERA: TIntegerField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMConfiguracionOBLIGA_CLIENTE_CONCRETO: TIntegerField;
     QMConfiguracionCERRAR_TICKET_PRECIO_0: TIntegerField;
     QMConfiguracionCONTROLA_DISPONIBILIDAD: TIntegerField;
     procedure DMConfiguracionTPVCreate(Sender: TObject);
     procedure QMConfiguracionAfterOpen(DataSet: TDataSet);
     procedure QMConfiguracionCONTROL_STOCKChange(Sender: TField);
     procedure QMConfiguracionBeforePost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     procedure PonMascaras;
  public
     { Public declarations }
     procedure Editar;
     procedure Graba;
     procedure Cancela;
     procedure RestauraLimite;
     function Editando: boolean;
     procedure FiltraSerie(Serie: string);
  end;

var
  DMConfiguracionTPV : TDMConfiguracionTPV;

implementation

uses UDMMain, UEntorno, UDameDato;

{$R *.DFM}

procedure TDMConfiguracionTPV.DMConfiguracionTPVCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  PonMascaras;

  DMMain.FiltraTabla(QMConfiguracion, '11110', False);
end;

procedure TDMConfiguracionTPV.QMConfiguracionAfterOpen(DataSet: TDataSet);
begin
  xTipoStock.Open;
end;

procedure TDMConfiguracionTPV.QMConfiguracionCONTROL_STOCKChange(Sender: TField);
begin
  xTipoStock.Close;
  xTipoStock.Open;
end;

procedure TDMConfiguracionTPV.Editar;
begin
  QMConfiguracion.Edit;
end;

procedure TDMConfiguracionTPV.Cancela;
begin
  QMConfiguracion.Cancel;
end;

procedure TDMConfiguracionTPV.Graba;
begin
  if DSQMConfiguracion.DataSet.State = dsEdit then
  begin
     QMConfiguracion.Post;
  end;
end;

procedure TDMConfiguracionTPV.QMConfiguracionBeforePost(DataSet: TDataSet);
begin
  QMConfiguracionTERCERO.AsInteger := DameTercero('CLI', QMConfiguracionCLIENTE.AsInteger);
end;

procedure TDMConfiguracionTPV.RestauraLimite;
begin
  QMConfiguracionLIMITE_FAC.AsFloat := 0;
end;

procedure TDMConfiguracionTPV.PonMascaras;
begin
  QMConfiguracionLIMITE_FAC.DisplayFormat := MascaraN;
end;

function TDMConfiguracionTPV.Editando: boolean;
begin
  Result := (DSQMConfiguracion.State = dsEdit);
end;

procedure TDMConfiguracionTPV.DataModuleDestroy(Sender: TObject);
begin
  QMConfiguracion.Close;
end;

procedure TDMConfiguracionTPV.FiltraSerie(Serie: string);
begin
  with QMConfiguracion do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

end.
