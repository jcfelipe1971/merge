unit UDMPGCEquivalencias;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO;

type
  TDMPGCEquivalencias = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMEquivalencias: TFIBTableSet;
     DSQMEquivalencias: TDataSource;
     QMEquivalenciasO_TITULO: TFIBStringField;
     QMEquivalenciasO_CUENTA: TFIBStringField;
     QMEquivalenciasO_PGC: TIntegerField;
     QMEquivalenciasD_TITULO: TFIBStringField;
     QMEquivalenciasD_CUENTA: TFIBStringField;
     QMEquivalenciasD_PGC: TIntegerField;
     QMEquivalenciasID_PGC_EQUIVALENCIA: TIntegerField;
     xOPGCs: TFIBDataSetRO;
     xDPGCs: TFIBDataSetRO;
     DSxOPGCs: TDataSource;
     DSxDPGCs: TDataSource;
     xOPGCsPGC: TIntegerField;
     xOPGCsTITULO: TFIBStringField;
     xOPGCsPAIS: TFIBStringField;
     xOPGCsDEFECTO: TIntegerField;
     xDPGCsPGC: TIntegerField;
     xDPGCsTITULO: TFIBStringField;
     xDPGCsPAIS: TFIBStringField;
     xDPGCsDEFECTO: TIntegerField;
     QMEquivalenciasNOTAS: TBlobField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMEquivalenciasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Abrir(OPgc, DPgc: integer);
     procedure BusquedaCompleja(OPgc, DPgc: integer);
  end;

var
  DMPGCEquivalencias : TDMPGCEquivalencias;

implementation

uses UDMMain, uFBusca;

{$R *.dfm}

procedure TDMPGCEquivalencias.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xOPGCs.Open;
  xDPGCs.Open;
end;

procedure TDMPGCEquivalencias.Abrir(OPgc, DPgc: integer);
begin
  QMEquivalencias.Close;
  with QMEquivalencias do
  begin
     Params.ByName['OPGC'].AsInteger := OPgc;
     Params.ByName['DPGC'].AsInteger := DPgc;
     Open;
  end;
end;

procedure TDMPGCEquivalencias.BusquedaCompleja(OPgc, DPgc: integer);
var
  Orden : string;
begin
  with QMEquivalencias do
  begin
     DisableControls;
     Close;
     Orden := OrdenadoPor;
     Ordenar('');
     TFBusca.Create(Self).SeleccionaBusqueda(QMEquivalencias, '00000', False, '', 3,
        ' AND O_PGC =' + IntToStr(OPgc) + ' AND D_PGC=' + IntToStr(DPgc));
     Ordenar(Orden);
     Open;
     EnableControls;
  end;
end;

procedure TDMPGCEquivalencias.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TDMPGCEquivalencias.QMEquivalenciasNewRecord(DataSet: TDataSet);
begin
  QMEquivalenciasO_PGC.AsInteger := xOPGCsPGC.AsInteger;
  QMEquivalenciasD_PGC.AsInteger := xDPGCsPGC.AsInteger;
end;

end.
