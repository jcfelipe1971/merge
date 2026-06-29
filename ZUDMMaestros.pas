unit ZUDMMaestros;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB, FIBDataSet,
  FIBDataSetRO, FIBTableDataSetRO, FIBTableDataSet;

type
  TZDMMaestros = class(TDataModule)
     TLocal: THYTransaction;
     QMTablasMaestras: TFIBTableSet;
     DSQMTablasMaestras: TDataSource;
     QMTablasMaestrasTIPO_AUX: TFIBStringField;
     QMTablasMaestrasCODIGO: TFIBStringField;
     QMTablasMaestrasDESCRIPCION: TFIBStringField;
     DSxTiposTablasMaestras: TDataSource;
     xTiposTablasMaestras: TFIBTableSet;
     xTiposTablasMaestrasTIPO_AUX: TFIBStringField;
     xTiposTablasMaestrasDESC_TIPO_AUX: TFIBStringField;
     QMTablasMaestrasCANTIDAD: TIntegerField;
     QMTablasMaestrasPORCENTAJE: TFloatField;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure ZDMMaestrosCreate(Sender: TObject);
     procedure ZDMMaestrosDestroy(Sender: TObject);
     procedure QMTablasMaestrasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     TipoMaestro: string;
  public
     { Public declarations }
     procedure FiltrarTablasMaestras(Tipo: string);
     procedure BusquedaCompleja;
  end;

var
  ZDMMaestros : TZDMMaestros;

implementation

{$R *.DFM}

uses UDMMain, uFBusca;

procedure TZDMMaestros.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TZDMMaestros.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTablasMaestras, '00000');
end;

procedure TZDMMaestros.ZDMMaestrosCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTablasMaestras.Open;
end;

procedure TZDMMaestros.ZDMMaestrosDestroy(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TZDMMaestros.FiltrarTablasMaestras(Tipo: string);
begin
  TipoMaestro := Tipo;
  with QMTablasMaestras do
  begin
     Close;
     Params.ByName['tipo_aux'].AsString := TipoMaestro;
     Open;
  end;

  with xTiposTablasMaestras do
  begin
     Close;
     Params.ByName['tipo_aux'].AsString := TipoMaestro;
     Open;
  end;
end;

procedure TZDMMaestros.QMTablasMaestrasNewRecord(DataSet: TDataSet);
begin
  QMTablasMaestrasTIPO_AUX.AsString := TipoMaestro;
  QMTablasMaestrasDESCRIPCION.AsString := '';
end;

end.
