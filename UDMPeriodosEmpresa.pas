unit UDMPeriodosEmpresa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMPeriodosEmpresa = class(TDataModule)
     QMPeriodos: TFIBTableSet;
     DSQMPeriodos: TDataSource;
     QMPeriodosEMPRESA: TIntegerField;
     QMPeriodosEJERCICIO: TIntegerField;
     QMPeriodosPERIODO: TFIBStringField;
     QMPeriodosTITULO: TFIBStringField;
     QMPeriodosDESDE: TDateTimeField;
     QMPeriodosHASTA: TDateTimeField;
     QMPeriodosTIPO: TIntegerField;
     TLocal: THYTransaction;
     xTipoPeriodo: TFIBDataSetRO;
     DSxTipoPeriodo: TDataSource;
     TUpdate: THYTransaction;
     procedure DMPeriodosEmpresaCreate(Sender: TObject);
     procedure QMPeriodosNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMPeriodosBeforePost(DataSet: TDataSet);
     procedure QMPeriodosAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     function EsTipo5: boolean;
     { Public declarations }
  end;

var
  DMPeriodosEmpresa : TDMPeriodosEmpresa;

implementation

uses UDMMain, UEntorno, ufBusca, UUtiles;

{$R *.DFM}

procedure TDMPeriodosEmpresa.DMPeriodosEmpresaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMPeriodos, '11000', True);
end;

procedure TDMPeriodosEmpresa.QMPeriodosNewRecord(DataSet: TDataSet);
begin
  QMPeriodosEMPRESA.AsInteger := REntorno.Empresa;
  QMPeriodosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPeriodosDESDE.AsDateTime := REntorno.FechaTrab{SH};
  QMPeriodosHASTA.AsDateTime := REntorno.FechaTrab{SH};
  QMPeriodosTIPO.AsInteger := 6;
end;

procedure TDMPeriodosEmpresa.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPeriodosEmpresa.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPeriodos, '11000');
end;

procedure TDMPeriodosEmpresa.QMPeriodosBeforePost(DataSet: TDataSet);
begin
  QMPeriodosDESDE.AsDateTime := HourIntoDate(QMPeriodosDESDE.AsDateTime, '00:00:00');
  QMPeriodosHASTA.AsDateTime := HourIntoDate(QMPeriodosHASTA.AsDateTime, '23:59:59');
end;

procedure TDMPeriodosEmpresa.QMPeriodosAfterOpen(DataSet: TDataSet);
begin
  xTipoPeriodo.Open;
end;

function TDMPeriodosEmpresa.EsTipo5: boolean;
begin
  if (QMPeriodosTIPO.AsInteger = 5) then
     Result := False
  else
     Result := True;
end;

end.
