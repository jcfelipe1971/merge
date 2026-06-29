unit UDMEscandalloGarantias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TDMEscandalloGarantias = class(TDataModule)
     TLocal: THYTransaction;
     xEscandalloGarantia: TFIBTableSet;
     xEscandalloGarantiaDetalle: TFIBTableSet;
     DSxEscandalloGarantia: TDataSource;
     DSxEscandalloGarantiaDetalle: TDataSource;
     xEscandalloGarantiaEMPRESA: TIntegerField;
     xEscandalloGarantiaARTICULO: TFIBStringField;
     xEscandalloGarantiaDESCRIPCION: TFIBStringField;
     xEscandalloGarantiaNRO_ETIQUETAS: TIntegerField;
     xEscandalloGarantiaDetalleEMPRESA: TIntegerField;
     xEscandalloGarantiaDetalleDETALLE: TFIBStringField;
     xEscandalloGarantiaDetalleDESCRIPCION: TFIBStringField;
     xEscandalloGarantiaDetalleARTICULO: TFIBStringField;
     xEscandalloGarantiaDetalleORDEN: TIntegerField;
     TUpdate: THYTransaction;
     procedure xEscandalloGarantiaAfterScroll(DataSet: TDataSet);
     procedure xEscandalloGarantiaNewRecord(DataSet: TDataSet);
     procedure xEscandalloGarantiaDetalleNewRecord(DataSet: TDataSet);
     procedure xEscandalloGarantiaDetalleBeforeInsert(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure xEscandalloGarantiaDetalleDETALLEChange(Sender: TField);
     procedure xEscandalloGarantiaAfterOpen(DataSet: TDataSet);
     procedure xEscandalloGarantiaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMEscandalloGarantias : TDMEscandalloGarantias;

implementation

uses UDMMain, UEntorno, UDameDato;

{$R *.DFM}

procedure TDMEscandalloGarantias.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(xEscandalloGarantia, '10000', True);
end;

procedure TDMEscandalloGarantias.xEscandalloGarantiaAfterScroll(DataSet: TDataSet);
begin
  xEscandalloGarantiaDetalle.Close;
  xEscandalloGarantiaDetalle.Open;
end;

procedure TDMEscandalloGarantias.xEscandalloGarantiaNewRecord(DataSet: TDataSet);
begin
  xEscandalloGarantiaEMPRESA.AsInteger := REntorno.Empresa;
  xEscandalloGarantiaDESCRIPCION.AsString := '';
  xEscandalloGarantiaNRO_ETIQUETAS.AsInteger := 1;
end;

procedure TDMEscandalloGarantias.xEscandalloGarantiaDetalleNewRecord(DataSet: TDataSet);
begin
  xEscandalloGarantiaDetalleEMPRESA.AsInteger := REntorno.Empresa;
  xEscandalloGarantiaDetalleARTICULO.AsString := xEscandalloGarantiaARTICULO.AsString;
  xEscandalloGarantiaDetalleDETALLE.AsString := '';
  xEscandalloGarantiaDetalleDESCRIPCION.AsString := '';
end;

procedure TDMEscandalloGarantias.xEscandalloGarantiaDetalleBeforeInsert(DataSet: TDataSet);
begin
  if xEscandalloGarantia.State in [dsInsert, dsEdit] then
     xEscandalloGarantia.Post;
end;

procedure TDMEscandalloGarantias.xEscandalloGarantiaDetalleDETALLEChange(Sender: TField);
begin
  if ((xEscandalloGarantiaDetalle.State = dsInsert) and (xEscandalloGarantiaDetalleDESCRIPCION.AsString = '')) then
     xEscandalloGarantiaDetalleDESCRIPCION.AsString := DameTituloArticulo(xEscandalloGarantiaDetalleDETALLE.AsString);
end;

procedure TDMEscandalloGarantias.xEscandalloGarantiaAfterOpen(DataSet: TDataSet);
begin
  xEscandalloGarantiaDetalle.Open;
end;

procedure TDMEscandalloGarantias.xEscandalloGarantiaBeforeClose(DataSet: TDataSet);
begin
  xEscandalloGarantiaDetalle.Close;
end;

end.
