unit UDMGasColaCamion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMGasColaCamion = class(TDataModule)
     QMGasColaCamion: TFIBTableSet;
     DSQMGasColaCamion: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMGasColaCamionCOD_CAMION: TIntegerField;
     QMGasColaCamionTITULO: TFIBStringField;
     QMGasColaCamionESTADO: TIntegerField;
     QMGasColaCamionCAPACIDAD: TFloatField;
     QMGasColaCamionNOTAS: TBlobField;
     procedure QMGasColaCamionAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMGasColaCamion : TDMGasColaCamion;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMGasColaCamion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMGasColaCamion.QMGasColaCamionAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMGasColaCamion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMGasColaCamion, '00000');
end;

procedure TDMGasColaCamion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMGasColaCamion.Open;
end;

end.
