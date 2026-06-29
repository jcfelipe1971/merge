unit ZUDMMaquinasDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, FIBQuery, HYFIBQuery;

type
  TZDMMaquinasDet = class(TDataModule)
     QMMaquinasC: TFIBTableSet;
     DSQMMaquinasC: TDataSource;
     TLocal: THYTransaction;
     QMMaquinasD: TFIBTableSet;
     DSQMMaquinasD: TDataSource;
     SPLineaSegDet: THYFIBQuery;
     QMMaquinasCEMPRESA: TIntegerField;
     QMMaquinasCCODMAQ: TIntegerField;
     QMMaquinasCOBSERVACIONES: TFIBStringField;
     QMMaquinasDEMPRESA: TIntegerField;
     QMMaquinasDCODMAQ: TIntegerField;
     QMMaquinasDLINEA: TIntegerField;
     QMMaquinasDTINTA: TIntegerField;
     QMMaquinasDVELOCIDAD: TFloatField;
     QMMaquinasDGRAMOS_TINTA: TFloatField;
     QMMaquinasDGRAMOS_BARNIZ: TFloatField;
     QMMaquinasDPOLIMEROS: TFloatField;
     xDescMaquina: TFIBTableSet;
     DSxDescMaquina: TDataSource;
     xDescMaquinaDESCRIPCION: TFIBStringField;
     QMMaquinasCDESCRIPCION: TFIBStringField;
     QMMaquinasCML_CAMBIO_PLANCHA: TFloatField;
     QMMaquinasCTIEMPO_CAMBIO_PLANCHA: TFloatField;
     QMMaquinasDCAMBIO_COLOR: TFloatField;
     QMMaquinasDHORAS_PREPARACION: TFloatField;
     procedure QMMaquinasCNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMMaquinasDNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMMaquinasCAfterOpen(DataSet: TDataSet);
     procedure QMMaquinasCBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure DescMaquina(codmaq: integer);
  end;

var
  ZDMMaquinasDet : TZDMMaquinasDet;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UIsoFMMedicion, UEntorno, URecursos, ZUFMMaquinasDet;

procedure TZDMMaquinasDet.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMaquinasC, '10000');
end;

procedure TZDMMaquinasDet.QMMaquinasCNewRecord(DataSet: TDataSet);
begin
  QMMaquinasCEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TZDMMaquinasDet.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  ZFMMaquinasDet.NavMain.BtnClick(nbRefresh);
end;

procedure TZDMMaquinasDet.QMMaquinasDNewRecord(DataSet: TDataSet);
begin
  if ((QMMaquinasC.State = dsInsert) or (QMMaquinasC.State = dsEdit)) then
  begin
     QMMaquinasC.Post;
     ZFMMaquinasDet.NavMain.BtnClick(nbRefresh);
     QMMaquinasD.Edit;
  end;

  //Obtenemos el numero de linea más alto del detalle
  with SPLineaSegDet do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['codmaq'].AsInteger := QMMaquinasCCODMAQ.AsInteger;
     ExecQuery;
     QMMaquinasDEMPRESA.AsInteger := REntorno.Empresa;
     QMMaquinasDCODMAQ.AsInteger := QMMaquinasCCODMAQ.AsInteger;
     QMMaquinasDLINEA.AsInteger := SPLineaSegDet.FieldByName['LINEA'].AsInteger + 1;
     FreeHandle;
  end;
end;

procedure TZDMMaquinasDet.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMMaquinasCML_CAMBIO_PLANCHA.DisplayFormat := MascaraN;
  QMMaquinasCTIEMPO_CAMBIO_PLANCHA.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMMaquinasC, '10000', True);
end;

procedure TZDMMaquinasDet.DescMaquina(codmaq: integer);
begin
  with xDescMaquina do
  begin
     Close;
     Params.ByName['CODMAQ'].AsInteger := codmaq;
     Open;
  end;
  QMMaquinasCDESCRIPCION.AsString := xDescMaquinaDESCRIPCION.AsString;
end;

procedure TZDMMaquinasDet.DataModuleDestroy(Sender: TObject);
begin
  QMMaquinasC.Close;
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TZDMMaquinasDet.QMMaquinasCAfterOpen(DataSet: TDataSet);
begin
  QMMaquinasD.Open;
  xDescMaquina.Open;
end;

procedure TZDMMaquinasDet.QMMaquinasCBeforeClose(DataSet: TDataSet);
begin
  QMMaquinasD.Close;
  xDescMaquina.Close;
end;

end.
