unit UDMPeriodoFacturacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMPeriodoFacturacion = class(TDataModule)
     DSQMPeriodoFacturacion: TDataSource;
     QMPeriodoFacturacion: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPeriodoFacturacionEMPRESA: TIntegerField;
     QMPeriodoFacturacionPERIODO: TFIBStringField;
     QMPeriodoFacturacionTITULO: TFIBStringField;
     procedure BusquedaCompleja;
     procedure DMPeriodoFacturacionCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMPeriodoFacturacionNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMPeriodoFacturacion : TDMPeriodoFacturacion;

implementation

uses
  UDMMain, UFBusca, UEntorno;

procedure TDMPeriodoFacturacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPeriodoFacturacion, '10000');
end;

{$R *.DFM}

procedure TDMPeriodoFacturacion.DMPeriodoFacturacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMPeriodoFacturacion, '100000');
end;

procedure TDMPeriodoFacturacion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPeriodoFacturacion.QMPeriodoFacturacionNewRecord(DataSet: TDataSet);
begin
  QMPeriodoFacturacionEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
