unit UDMFinanciaManual;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMFinanciaManual = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraI_FINANCIACION_CANAL: TFloatField;
     QMCabeceraMONEDA: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMFinanciaManualCreate(Sender: TObject);
     procedure QMCabeceraBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraQuery(Serie, Tipo: string; rig: integer);
  end;

var
  DMFinanciaManual : TDMFinanciaManual;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMFinanciaManual.DMFinanciaManualCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMCabeceraPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMCabeceraI_FINANCIACION_CANAL.DisplayFormat := MascaraN;
end;

procedure TDMFinanciaManual.FiltraQuery(Serie, Tipo: string; rig: integer);
begin
  DMMain.FiltraTabla(QMCabecera, '11100', False);
  with QMCabecera do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := rig;
     Open;
  end;
  QMCabeceraI_FINANCIACION.DisplayFormat := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
end;

procedure TDMFinanciaManual.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMFinanciaManual.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMFinanciaManual.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

end.
