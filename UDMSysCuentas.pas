unit UDMSysCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMSysCuentas = class(TDataModule)
     QMCuentas: TFIBTableSet;
     DSCuentas: TDataSource;
     QMCuentasCUENTA: TFIBStringField;
     QMCuentasTITULO: TFIBStringField;
     QMCuentasNIVEL: TIntegerField;
     QMCuentasSUPERIOR: TFIBStringField;
     QMCuentasTIPO: TIntegerField;
     QMCuentasGESTION: TIntegerField;
     DSxCuentasPadres: TDataSource;
     DSxCuentasGestion: TDataSource;
     QMCuentasTIPO_TERCERO: TIntegerField;
     DSxTipoTercero: TDataSource;
     TLocal: THYTransaction;
     xCuentasPadres: TFIBDataSetRO;
     xCuentasGestion: TFIBDataSetRO;
     xTipoTercero: TFIBDataSetRO;
     xCuentasPadresPAIS: TFIBStringField;
     xCuentasPadresCUENTA: TFIBStringField;
     xCuentasPadresTITULO: TFIBStringField;
     xCuentasPadresNIVEL: TIntegerField;
     xCuentasPadresSUPERIOR: TFIBStringField;
     xCuentasPadresTIPO: TIntegerField;
     xCuentasPadresGESTION: TIntegerField;
     xCuentasPadresTIPO_TERCERO: TIntegerField;
     xPgC: TFIBDataSetRO;
     DSxPgC: TDataSource;
     xPgCPAIS: TFIBStringField;
     xPgCPGC: TIntegerField;
     xPgCTITULO: TFIBStringField;
     QMCuentasREG_CIERRE: TIntegerField;
     QMCuentasPGC: TIntegerField;
     xPgCDEFECTO: TIntegerField;
     TUpdate: THYTransaction;
     QMCuentasPAIS: TFIBStringField;
     procedure QMCuentasAfterOpen(DataSet: TDataSet);
     procedure DMSysCuentasCreate(Sender: TObject);
     procedure QMCuentasGESTIONChange(Sender: TField);
     procedure QMCuentasNewRecord(DataSet: TDataSet);
     procedure QMCuentasTIPO_TERCEROChange(Sender: TField);
     procedure xPgCAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMSysCuentas : TDMSysCuentas;

implementation

uses UDMMain, uFBusca;

{$R *.DFM}

procedure TDMSysCuentas.QMCuentasAfterOpen(DataSet: TDataSet);
begin
  xCuentasPadres.Open;
  xCuentasGestion.Open;
  xTipoTercero.Open;
end;

procedure TDMSysCuentas.DMSysCuentasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xPgC.Open;
end;

procedure TDMSysCuentas.BusquedaCompleja;
var
  Orden : string;
begin
  with QMCuentas do
  begin
     DisableControls;
     Close;
     Orden := OrdenadoPor;
     Ordenar('');
     TFBusca.Create(Self).SeleccionaBusqueda(QMCuentas, '00000', False);
     if Pos('WHERE', UpperCase(SelectSQL.Text)) <> 0 then
        SelectSQL.Add('AND')
     else
        SelectSQL.Add('WHERE');
     SelectSQL.Add('PGC=?PGC');
     Params.ByName['PGC'].AsString := xPgCPGC.AsString;
     Ordenar(Orden);
     Open;
     EnableControls;
  end;
end;

procedure TDMSysCuentas.QMCuentasGESTIONChange(Sender: TField);
begin
  with xCuentasGestion do
  begin
     Close;
     Open;
  end;
end;

procedure TDMSysCuentas.QMCuentasNewRecord(DataSet: TDataSet);
begin
  QMCuentasPGC.AsInteger := xPGCPGC.AsInteger;
  QMCuentasPais.AsString := xPGCPAIS.AsString;
  QMCuentasREG_CIERRE.AsInteger := 0;
  QMCuentasTIPO_TERCERO.AsInteger := 0;
  QMCuentasGESTION.AsInteger := 0;
end;

procedure TDMSysCuentas.QMCuentasTIPO_TERCEROChange(Sender: TField);
begin
  with xTipoTercero do
  begin
     Close;
     Open;
  end;
end;

procedure TDMSysCuentas.xPgCAfterOpen(DataSet: TDataSet);
begin
  QMCuentas.Close;
  QMCuentas.Open;
end;

procedure TDMSysCuentas.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

end.
