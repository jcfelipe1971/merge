unit UProDMInfoReservas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TProDMInfoReservas = class(TDataModule)
     QReservas: TFIBDataSetRO;
     DSQReservas: TDataSource;
     TLocal: THYTransaction;
     QReservasEMPRESA: TIntegerField;
     QReservasEJERCICIO: TIntegerField;
     QReservasCANAL: TIntegerField;
     QReservasSERIE: TFIBStringField;
     QReservasRIG_OF: TIntegerField;
     QReservasID_ORDEN: TIntegerField;
     QReservasLINEA_RES: TIntegerField;
     QReservasID_RESERVA: TIntegerField;
     QReservasALMACEN_LAN: TFIBStringField;
     QReservasALMACEN_SAL: TFIBStringField;
     QReservasCOMPUESTO: TFIBStringField;
     QReservasUNIDADES: TFloatField;
     QReservasN_MOV_STOCK_RESERVA: TIntegerField;
     QReservasENTRADA: TIntegerField;
     QReservasFECHA: TDateTimeField;
     QReservasID_LOTE: TIntegerField;
     QReservasLOTE: TStringField;
     QReservasESTADO: TIntegerField;
     QReservasTITULO: TFIBStringField;
     QReservasCLASIFICACION: TFIBStringField;
     QReservasID_LOTE_RESERVA: TIntegerField;
     QReservasLOTE_RESERVA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QReservasLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     IdOrden: integer;
  public
     { Public declarations }
     procedure AbrirReservas(aIdOrden: integer);
     procedure Refrescar;
  end;

var
  ProDMInfoReservas : TProDMInfoReservas;

implementation

uses UDMMain, UEntorno, UDameDato, HYFIBQuery, Dialogs, Controls;

{$R *.dfm}

procedure TProDMInfoReservas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QReservasUNIDADES.DisplayFormat := MascaraN;
end;

procedure TProDMInfoReservas.AbrirReservas(aIdOrden: integer);
begin
  IdOrden := aIdOrden;
  Refrescar;
end;

procedure TProDMInfoReservas.Refrescar;
begin
  with QReservas do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Open;
  end;
end;

procedure TProDMInfoReservas.QReservasLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QReservasID_LOTE.AsInteger);
end;

end.
