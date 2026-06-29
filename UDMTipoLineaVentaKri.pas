unit UDMTipoLineaVentaKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMTipoLineaVentaKri = class(TDataModule)
     QMTipoLineaVentaKri: TFIBTableSet;
     DSQMTipoLineaVentaKri: TDataSource;
     TLocal: THYTransaction;
     QMTipoLineaVentaKriID: TIntegerField;
     QMTipoLineaVentaKriTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMTipoLineaVentaKri : TDMTipoLineaVentaKri;

implementation

uses uFBusca;

{$R *.dfm}

procedure TDMTipoLineaVentaKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTipoLineaVentaKri.Open;
end;

procedure TDMTipoLineaVentaKri.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTipoLineaVentaKri.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoLineaVentaKri, '00000');
end;

end.
