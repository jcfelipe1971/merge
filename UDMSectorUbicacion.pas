unit UDMSectorUbicacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMSectorUbicacion = class(TDataModule)
     DSQMSectorUbicacion: TDataSource;
     QMSectorUbicacion: TFIBTableSet;
     TLocal: THYTransaction;
     QMSectorUbicacionSECTOR: TFIBStringField;
     QMSectorUbicacionTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMSectorUbicacion : TDMSectorUbicacion;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.dfm}

procedure TDMSectorUbicacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMSectorUbicacion.Open;
end;

procedure TDMSectorUbicacion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMSectorUbicacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMSectorUbicacion, '00000');
end;

end.
