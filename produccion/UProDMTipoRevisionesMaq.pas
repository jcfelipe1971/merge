unit UProDMTipoRevisionesMaq;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TProDMTipoRevionesMaq = class(TDataModule)
     TLocal: THYTransaction;
     QMTipoRevisionesMaq: TFIBTableSet;
     DSTipoRevisionesMaq: TDataSource;
     QMTipoRevisionesMaqTIPO: TFIBStringField;
     QMTipoRevisionesMaqTITULO: TFIBStringField;
     QMTipoRevisionesMaqNOTAS: TMemoField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMTipoRevionesMaq : TProDMTipoRevionesMaq;

implementation

uses UDMMain, UFBusca;

{$R *.dfm}

procedure TProDMTipoRevionesMaq.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoRevisionesMaq, '00000');
end;

procedure TProDMTipoRevionesMaq.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTipoRevisionesMaq.Open;
end;

procedure TProDMTipoRevionesMaq.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
