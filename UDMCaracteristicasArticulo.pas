unit UDMCaracteristicasArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMCaracteristicasArticulo = class(TDataModule)
     DSQMCaracteristicasArticulo: TDataSource;
     QMCaracteristicasArticulo: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCaracteristicasArticuloEMPRESA: TIntegerField;
     QMCaracteristicasArticuloCODIGO: TFIBStringField;
     QMCaracteristicasArticuloTITULO: TFIBStringField;
     procedure BusquedaCompleja;
     procedure DMCaracteristicasArticuloCreate(Sender: TObject);
     procedure QMCaracteristicasArticuloNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMCaracteristicasArticulo : TDMCaracteristicasArticulo;

implementation

uses
  UDMMain, UFBusca, UEntorno;

procedure TDMCaracteristicasArticulo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCaracteristicasArticulo, '10000');
end;

{$R *.DFM}

procedure TDMCaracteristicasArticulo.DMCaracteristicasArticuloCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCaracteristicasArticulo.Open;
end;

procedure TDMCaracteristicasArticulo.QMCaracteristicasArticuloNewRecord(DataSet: TDataSet);
begin
  QMCaracteristicasArticuloEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
