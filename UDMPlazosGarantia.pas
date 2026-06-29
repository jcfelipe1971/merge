unit UDMPlazosGarantia;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet;

type
  TDMPlazosGarantia = class(TDataModule)
     QMPlazosGarantia: TFIBTableSet;
     DSQMPlazosGarantia: TDataSource;
     TLocal: THYTransaction;
     QMPlazosGarantiaTIPO: TIntegerField;
     QMPlazosGarantiaTITULO: TFIBStringField;
     QMPlazosGarantiaDIAS: TIntegerField;
     QMPlazosGarantiaMESES: TIntegerField;
     QMPlazosGarantiaANYOS: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMPlazosGarantiaCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMPlazosGarantiaBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMPlazosGarantia : TDMPlazosGarantia;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMPlazosGarantia.DMPlazosGarantiaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMPlazosGarantia.Open;
end;

procedure TDMPlazosGarantia.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPlazosGarantia.QMPlazosGarantiaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'CONTA_GARANTIA', 'TIPO', True);
end;

procedure TDMPlazosGarantia.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPlazosGarantia, '00000');
end;

end.
