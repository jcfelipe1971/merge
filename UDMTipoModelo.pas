unit UDMTipoModelo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TDMTipoModelo = class(TDataModule)
     TLocal: THYTransaction;
     DSQMTipoModelo: TDataSource;
     QMTipoModelo: TFIBTableSet;
     QMTipoModeloCODIGO: TFIBStringField;
     QMTipoModeloDESCRIPCION: TFIBStringField;
     QMTipoModeloPREFIJO_ARTICULO: TFIBStringField;
     QMTipoModeloPREFIJO_TITULO_ART: TFIBStringField;
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
  DMTipoModelo : TDMTipoModelo;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles{, UFMTipoModelo};

{$R *.dfm}

procedure TDMTipoModelo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTipoModelo.Open;
end;

procedure TDMTipoModelo.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TDMTipoModelo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoModelo, '00000');
end;

end.
