unit UDMFinanciaManualAcr;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMFinanciaManualAcr = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     DSQMCabecera: TDataSource;
     QMCabeceraI_FINANCIACION_CANAL: TFloatField;
     QMCabeceraMONEDA: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMFinanciaManualAcrCreate(Sender: TObject);
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
  DMFinanciaManualAcr : TDMFinanciaManualAcr;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMFinanciaManualAcr.DMFinanciaManualAcrCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMCabeceraPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMCabeceraI_FINANCIACION_CANAL.DisplayFormat := MascaraN;
end;

procedure TDMFinanciaManualAcr.FiltraQuery(Serie, Tipo: string; rig: integer);
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

procedure TDMFinanciaManualAcr.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMFinanciaManualAcr.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMFinanciaManualAcr.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

end.
