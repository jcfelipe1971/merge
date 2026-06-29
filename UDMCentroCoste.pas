unit UDMCentroCoste;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet;

type
  TDMCentroCoste = class(TDataModule)
     QMCentroCoste: TFIBTableSet;
     DSQMCentroCoste: TDataSource;
     TLocal: THYTransaction;
     QMCentroCosteEMPRESA: TIntegerField;
     QMCentroCosteEJERCICIO: TIntegerField;
     QMCentroCosteCANAL: TIntegerField;
     QMCentroCosteNUM_DIGITO: TIntegerField;
     QMCentroCosteTITULO: TFIBStringField;
     QMCentroCosteLET_DIGITO: TFIBStringField;
     QMCentroCosteSerie: TFIBTableSet;
     DSQMCentroCosteSerie: TDataSource;
     QMCentroCosteSerieEMPRESA: TIntegerField;
     QMCentroCosteSerieEJERCICIO: TIntegerField;
     QMCentroCosteSerieCANAL: TIntegerField;
     QMCentroCosteSerieSERIE: TFIBStringField;
     QMCentroCosteSerieDIGITO_1: TFIBStringField;
     QMCentroCosteSerieDIGITO_2: TFIBStringField;
     QMCentroCosteSerieDIGITO_3: TFIBStringField;
     QMCentroCosteSerieDIGITO_4: TFIBStringField;
     QMCentroCosteSerieDIGITO_5: TFIBStringField;
     QMCentroCosteAgente: TFIBTableSet;
     DSQMCentroCosteAgente: TDataSource;
     QMCentroCosteAgenteEMPRESA: TIntegerField;
     QMCentroCosteAgenteEJERCICIO: TIntegerField;
     QMCentroCosteAgenteCANAL: TIntegerField;
     QMCentroCosteAgenteAGENTE: TIntegerField;
     QMCentroCosteAgenteTITULO: TFIBStringField;
     QMCentroCosteAgenteDIGITO_1: TFIBStringField;
     QMCentroCosteAgenteDIGITO_2: TFIBStringField;
     QMCentroCosteAgenteDIGITO_3: TFIBStringField;
     QMCentroCosteAgenteDIGITO_4: TFIBStringField;
     QMCentroCosteAgenteDIGITO_5: TFIBStringField;
     QMAgenciaTramitadora: TFIBTableSet;
     DSQMAgenciaTramitadora: TDataSource;
     QMAgenciaTramitadoraEMPRESA: TIntegerField;
     QMAgenciaTramitadoraEJERCICIO: TIntegerField;
     QMAgenciaTramitadoraCANAL: TIntegerField;
     QMAgenciaTramitadoraDIGITO_1: TFIBStringField;
     QMAgenciaTramitadoraDIGITO_2: TFIBStringField;
     QMAgenciaTramitadoraDIGITO_3: TFIBStringField;
     QMAgenciaTramitadoraDIGITO_4: TFIBStringField;
     QMAgenciaTramitadoraDIGITO_5: TFIBStringField;
     QMAgenciaTramitadoraAGENCIA_TRAMITADORA: TIntegerField;
     procedure DMCentroCosteCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure Duplicados(Sender: TField);
     procedure QMCentroCosteNewRecord(DataSet: TDataSet);
     procedure QMCentroCosteSerieNewRecord(DataSet: TDataSet);
     procedure QMCentroCosteAgenteNewRecord(DataSet: TDataSet);
     procedure QMAgenciaTramitadoraNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMCentroCoste : TDMCentroCoste;

implementation

uses UDMMain, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMCentroCoste.DMCentroCosteCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMCentroCoste, '11100', True);
  DMMain.FiltraTabla(QMCentroCosteSerie, '11100', True);
  DMMain.FiltraTabla(QMCentroCosteAgente, '11100', True);
  DMMain.FiltraTabla(QMAgenciaTramitadora, '11100', True);
end;

procedure TDMCentroCoste.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCentroCoste.Duplicados(Sender: TField);
begin
  // DMMain.ControlaDuplicados(Sender);
end;

procedure TDMCentroCoste.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCentroCoste, '00000');
end;

procedure TDMCentroCoste.QMCentroCosteNewRecord(DataSet: TDataSet);
begin
  QMCentroCosteEMPRESA.AsInteger := REntorno.Empresa;
  QMCentroCosteEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCentroCosteCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMCentroCoste.QMCentroCosteSerieNewRecord(DataSet: TDataSet);
begin
  QMCentroCosteSerieEMPRESA.AsInteger := REntorno.Empresa;
  QMCentroCosteSerieEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCentroCosteSerieCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMCentroCoste.QMCentroCosteAgenteNewRecord(DataSet: TDataSet);
begin
  QMCentroCosteAgenteEMPRESA.AsInteger := REntorno.Empresa;
  QMCentroCosteAgenteEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCentroCosteAgenteCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMCentroCoste.QMAgenciaTramitadoraNewRecord(DataSet: TDataSet);
begin
  QMAgenciaTramitadoraEMPRESA.AsInteger := REntorno.Empresa;
  QMAgenciaTramitadoraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAgenciaTramitadoraCANAL.AsInteger := REntorno.Canal;
end;

end.
