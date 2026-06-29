unit UProDMCausas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TProDMCausas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCausa: TFIBTableSet;
     DSQMCausa: TDataSource;
     QMCausaEMPRESA: TIntegerField;
     QMCausaCAUSA: TFIBStringField;
     QMCausaDESCRIPCION: TFIBStringField;
     QMCausaORDEN: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCausaNewRecord(DataSet: TDataSet);
     procedure QMCausaAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMCausas : TProDMCausas;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca;

{$R *.dfm}

procedure TProDMCausas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMCausa, '10000', True);
end;

procedure TProDMCausas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCausa, '10000');
end;

procedure TProDMCausas.QMCausaNewRecord(DataSet: TDataSet);
begin
  QMCausaEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TProDMCausas.QMCausaAfterPost(DataSet: TDataSet);
begin
  // Refresco datos y posiciono sobre el registro con el orden en el que estoy
  Refrescar(QMCausa, 'ORDEN', QMCausaORDEN.AsInteger);
end;

end.
