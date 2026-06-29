unit UDMBancos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMBancos = class(TDataModule)
     QMBancos: TFIBTableSet;
     DSQMBancos: TDataSource;
     QMBancosENTIDAD: TFIBStringField;
     QMBancosTITULO: TFIBStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMBancosPAIS: TFIBStringField;
     procedure DMBancosCreate(Sender: TObject);
     procedure QMBancosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMBancos : TDMBancos;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMBancos.DMBancosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMBancos.Open;
end;

procedure TDMBancos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMBancos, '00000');
end;

procedure TDMBancos.QMBancosNewRecord(DataSet: TDataSet);
begin
  QMBancosPAIS.AsString := REntorno.Pais;
end;

end.
