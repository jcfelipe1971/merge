unit UDMCilindros;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMCilindros = class(TDataModule)
     QMCilindros: TFIBTableSet;
     DSQMCilindros: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCilindrosEMPRESA: TIntegerField;
     QMCilindrosCILINDRO: TIntegerField;
     QMCilindrosZ: TFloatField;
     QMCilindrosBANDA: TFloatField;
     QMCilindrosDESCRIPCION: TFIBStringField;
     QMCilindrosARTICULO: TFIBStringField;
     QMCilindrosCODMAQ: TIntegerField;
     procedure DMCilindrosCreate(Sender: TObject);
     procedure QMCilindrosBeforePost(DataSet: TDataSet);
     procedure QMCilindrosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMCilindros : TDMCilindros;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMCilindros.DMCilindrosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCilindros.Open;
end;

procedure TDMCilindros.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCilindros, '00000');
end;

procedure TDMCilindros.QMCilindrosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'CONTA_CILINDROS', 'CILINDRO');
end;

procedure TDMCilindros.QMCilindrosNewRecord(DataSet: TDataSet);
begin
  QMCilindrosEMPRESA.AsInteger := REntorno.Empresa;
  QMCilindrosCILINDRO.AsInteger := 0;
  QMCilindrosZ.AsFloat := 0;
  QMCilindrosBANDA.AsFloat := 0;
  QMCilindrosDESCRIPCION.AsString := '';
end;

end.
