unit UDMUbicacionesSimple;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMUbicacionesSimple = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMUbicacionesSimple: TFIBTableSet;
     QMUbicacionesSimpleID_UBICACION_SIMPLE: TIntegerField;
     QMUbicacionesSimpleEMPRESA: TIntegerField;
     QMUbicacionesSimpleTITULO: TFIBStringField;
     DSQMUbicacionesSimple: TDataSource;
     procedure QMUbicacionesSimpleNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure BusquedaCompleja;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMUbicacionesSimple : TDMUbicacionesSimple;

implementation

uses UEntorno, UFBusca, UDMMain;

{$R *.dfm}

procedure TDMUbicacionesSimple.QMUbicacionesSimpleNewRecord(DataSet: TDataSet);
begin
  QMUbicacionesSimpleID_Ubicacion_Simple.AsInteger := DMMain.ContadorGen('ID_UBICACIONES_SIMPLE');
  ;
  QMUbicacionesSimpleEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMUbicacionesSimple.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMUbicacionesSimple, '10000', True);
end;

procedure TDMUbicacionesSimple.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMUbicacionesSimple, '10000');
end;

end.
