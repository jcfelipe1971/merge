unit UCrmDMRutas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TCrmDMRutas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMRutas: TFIBTableSet;
     DSQMRutas: TDataSource;
     QMRutasID_RUTA: TIntegerField;
     QMRutasRUTA: TFIBStringField;
     QMRutasEMPRESA: TIntegerField;
     QMRutasAGENTE: TIntegerField;
     QMRutasTITULO: TFIBStringField;
     procedure QMRutasNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMRutasBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  CrmDMRutas : TCrmDMRutas;

implementation

uses
  UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TCrmDMRutas.QMRutasNewRecord(DataSet: TDataSet);
begin
  QMRutasEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TCrmDMRutas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMRutas, '10000');
end;

procedure TCrmDMRutas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.Active then
     TLocal.StartTransaction;

  QMRutas.Close;
  QMRutas.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMRutas.Open;
end;

procedure TCrmDMRutas.QMRutasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMRutas, 'ID_RUTA_CONTACTO', 'ID_RUTA');
  QMRutasTITULO.AsString := UpperCase(QMRutasTITULO.AsString);
end;

end.
