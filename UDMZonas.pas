unit UDMZonas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMZonas = class(TDataModule)
     DSQMZonas: TDataSource;
     QMZonas: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMZonasZONA: TFIBStringField;
     QMZonasTITULO: TFIBStringField;
     QMZonasDEFECTO: TIntegerField;
     QMZonasCALENDARIO: TIntegerField;
     QMZonasGENERA_RUTA_ALB_AUTO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMZonasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMZonas : TDMZonas;

implementation

uses UDMMain, UFBusca;

{$R *.dfm}

procedure TDMZonas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMZonas.Open;
end;

procedure TDMZonas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMZonas, '00000');
end;

procedure TDMZonas.QMZonasNewRecord(DataSet: TDataSet);
begin
  QMZonasDEFECTO.AsInteger := 0;
  QMZonasGENERA_RUTA_ALB_AUTO.AsInteger := 0;
  QMZonasCALENDARIO.AsInteger := 0;
end;

end.
