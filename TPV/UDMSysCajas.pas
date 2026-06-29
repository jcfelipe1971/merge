unit UDMSysCajas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TDMSysCajas = class(TDataModule)
     QMSysCajas: TFIBTableSet;
     DSQMSysCajas: TDataSource;
     TLocal: THYTransaction;
     QMSysCajasCAJA: TIntegerField;
     QMSysCajasTITULO: TFIBStringField;
     procedure DMSysCajasCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Refresca;
     procedure BusquedaCompleja;
  end;

var
  DMSysCajas : TDMSysCajas;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMSysCajas.DMSysCajasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMSysCajas.Open;
end;

procedure TDMSysCajas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  Refresca;
  QMSysCajas.Last;
end;

procedure TDMSysCajas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMSysCajas, '00000');
end;

procedure TDMSysCajas.Refresca;
begin
  QMSysCajas.Close;
  QMSysCajas.Open;
end;

end.
