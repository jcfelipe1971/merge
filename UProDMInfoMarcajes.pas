unit UProDMInfoMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TProDMInfoMarcajes = class(TDataModule)
     QMarcajes: TFIBDataSetRO;
     DSQMarcajes: TDataSource;
     TLocal: THYTransaction;
     QMarcajesID_ORDEN: TIntegerField;
     QMarcajesIDTAREA: TIntegerField;
     QMarcajesLINEA_FASE: TIntegerField;
     QMarcajesLINEA_TAREA: TIntegerField;
     QMarcajesFECHA_REAL: TDateTimeField;
     QMarcajesHORA_INICIO: TFloatField;
     QMarcajesHORA_FIN: TFloatField;
     QMarcajesTIEMPO: TFloatField;
     QMarcajesRECURSO: TFIBStringField;
     QMarcajesTITULO_RECURSO: TFIBStringField;
     QMarcajesTIPO_RECURSO: TFIBStringField;
     QMarcajesOPERARIO: TIntegerField;
     QMarcajesTITULO_EMPLEADO: TFIBStringField;
     QMarcajesMAQUINA: TIntegerField;
     QMarcajesTITULO_MAQUINA: TFIBStringField;
     QMarcajesUNIDADES_FAB: TFloatField;
     QMarcajesESTADO: TIntegerField;
     QMarcajesTOTAL_RECURSO: TFloatField;
     QMarcajesEMPRESA: TIntegerField;
     QMarcajesEJERCICIO: TIntegerField;
     QMarcajesCANAL: TIntegerField;
     QMarcajesSERIE: TFIBStringField;
     QMarcajesTIPO: TFIBStringField;
     QMarcajesRIG: TIntegerField;
     QMarcajesLINEA: TIntegerField;
     QMarcajesTURNO: TFIBStringField;
     QMarcajesTITULO_TURNO: TFIBStringField;
     QMarcajesCAUSA: TFIBStringField;
     QMarcajesTITULO_CAUSA: TFIBStringField;
     QMarcajesUNIDADES_DEFECTUOSAS: TFloatField;
     QMarcajesCANTIDAD_RECHAZADA: TFloatField;
     QMarcajesNO_PRODUCTIVA: TIntegerField;
     QMarcajesHORAS_NO_PRODUCTIVAS: TFloatField;
     QMarcajesEFICIENCIA: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     IdOrden: integer;
  public
     { Public declarations }
     procedure AbrirMarcajes(aIdOrden: integer);
     procedure Refrescar;
  end;

var
  ProDMInfoMarcajes : TProDMInfoMarcajes;

implementation

uses UDMMain, UEntorno, HYFIBQuery, Dialogs, Controls;

{$R *.dfm}

procedure TProDMInfoMarcajes.AbrirMarcajes(aIdOrden: integer);
begin
  IdOrden := aIdOrden;
  Refrescar;
end;

procedure TProDMInfoMarcajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMarcajesUNIDADES_FAB.DisplayFormat := MascaraN;
  QMarcajesUNIDADES_DEFECTUOSAS.DisplayFormat := MascaraN;
  QMarcajesTOTAL_RECURSO.DisplayFormat := MascaraN;
  QMarcajesTIEMPO.DisplayFormat := '00:00';
  QMarcajesHORA_FIN.DisplayFormat := '00:00';
  QMarcajesHORA_INICIO.DisplayFormat := '00:00';
end;

procedure TProDMInfoMarcajes.Refrescar;
begin
  with QMarcajes do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Open;
  end;
end;

end.
