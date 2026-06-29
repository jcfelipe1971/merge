unit UDMDivisionesMaestro;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMDivisionesMaestro = class(TDataModule)
     QMDivisiones: TFIBTableSet;
     DSQMDivisiones: TDataSource;
     TLocal: THYTransaction;
     QMDivisionesEMPRESA: TIntegerField;
     QMDivisionesDIVISION: TFIBStringField;
     QMDivisionesTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDivisionesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMDivisionesMaestro : TDMDivisionesMaestro;

implementation

uses UDMMain, UEntorno, uFBusca;

{$R *.dfm}

procedure TDMDivisionesMaestro.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMDivisiones, '10000', True);
end;

procedure TDMDivisionesMaestro.QMDivisionesNewRecord(DataSet: TDataSet);
begin
  QMDivisionesEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMDivisionesMaestro.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMDivisiones, '10000');
end;

end.
