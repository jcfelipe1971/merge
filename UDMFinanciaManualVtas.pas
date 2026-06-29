unit UDMFinanciaManualVtas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet;

type
  TDMFinanciaManualVtas = class(TDataModule)
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     TLocal: THYTransaction;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraI_FINANCIACION_CANAL: TFloatField;
     QMCabeceraMONEDA: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMFinanciaManualVtasCreate(Sender: TObject);
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
  DMFinanciaManualVtas : TDMFinanciaManualVtas;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMFinanciaManualVtas.DMFinanciaManualVtasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMCabeceraPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMCabeceraI_FINANCIACION_CANAL.DisplayFormat := MascaraN;
end;

procedure TDMFinanciaManualVtas.FiltraQuery(Serie, Tipo: string; rig: integer);
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

procedure TDMFinanciaManualVtas.QMCabeceraBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMFinanciaManualVtas.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMFinanciaManualVtas.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

end.
