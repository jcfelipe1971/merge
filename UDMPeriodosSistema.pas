unit UDMPeriodosSistema;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMPeriodosSistema = class(TDataModule)
     QMPeriodos: TFIBTableSet;
     DSQMPeriodos: TDataSource;
     QMPeriodosPERIODO: TFIBStringField;
     QMPeriodosTITULO: TFIBStringField;
     QMPeriodosTIPO: TIntegerField;
     QMPeriodosDESDE: TFIBStringField;
     QMPeriodosHASTA: TFIBStringField;
     DSxPeriodoDesde: TDataSource;
     DSxPeriodoHasta: TDataSource;
     TLocal: THYTransaction;
     QMPeriodosSISTEMA: TIntegerField;
     DSxTipoPeriodo: TDataSource;
     xPeriodoDesde: TFIBDataSetRO;
     xPeriodoDesdeTITULO: TFIBStringField;
     xPeriodoHasta: TFIBDataSetRO;
     xPeriodoHastaTITULO: TFIBStringField;
     xTipoPeriodo: TFIBDataSetRO;
     TUpdate: THYTransaction;
     procedure DMPeriodosSistemaCreate(Sender: TObject);
     procedure QMPeriodosAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMPeriodosDESDEChange(Sender: TField);
     procedure QMPeriodosHASTAChange(Sender: TField);
     procedure QMPeriodosNewRecord(DataSet: TDataSet);
     procedure QMPeriodosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMPeriodosSistema : TDMPeriodosSistema;

implementation

uses UDMMain, UFBusca, UUtiles;

{$R *.DFM}

procedure TDMPeriodosSistema.DMPeriodosSistemaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMPeriodos.Open;
end;

procedure TDMPeriodosSistema.QMPeriodosAfterOpen(DataSet: TDataSet);
begin
  xPeriodoDesde.Open;
  xPeriodoHasta.Open;
  xTipoPeriodo.Open;
end;

procedure TDMPeriodosSistema.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPeriodosSistema.QMPeriodosDESDEChange(Sender: TField);
begin
  with xPeriodoDesde do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPeriodosSistema.QMPeriodosHASTAChange(Sender: TField);
begin
  with xPeriodoHasta do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPeriodosSistema.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPeriodos, '00000');
end;

procedure TDMPeriodosSistema.QMPeriodosNewRecord(DataSet: TDataSet);
begin
  QMPeriodosTIPO.AsInteger := 6;
end;

procedure TDMPeriodosSistema.QMPeriodosBeforePost(DataSet: TDataSet);
begin
  if (not AreAllNumbers(QMPeriodosPERIODO.AsString)) then
     raise Exception.Create('El valor del campo PERIODO es incorrecto');
end;

end.
