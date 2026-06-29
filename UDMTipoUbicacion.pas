unit UDMTipoUbicacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMTipoUbicacion = class(TDataModule)
     DSQMTipoUbicacion: TDataSource;
     QMTipoUbicacion: TFIBTableSet;
     TLocal: THYTransaction;
     QMTipoUbicacionTIPO: TFIBStringField;
     QMTipoUbicacionTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMTipoUbicacion : TDMTipoUbicacion;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.dfm}

procedure TDMTipoUbicacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTipoUbicacion.Open;
end;

procedure TDMTipoUbicacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoUbicacion, '00000');
end;

end.
