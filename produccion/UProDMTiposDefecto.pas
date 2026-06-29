unit UProDMTiposDefecto;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TProDMTiposDefecto = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMDefecto: TFIBTableSet;
     DSQMDefecto: TDataSource;
     QMDefectoCODIGO_DEFECTO: TIntegerField;
     QMDefectoDESCRIPCION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMTiposDefecto : TProDMTiposDefecto;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca;

{$R *.dfm}

procedure TProDMTiposDefecto.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMDefecto, '00000', True);
end;

procedure TProDMTiposDefecto.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMDefecto, '00000');
end;

procedure TProDMTiposDefecto.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
