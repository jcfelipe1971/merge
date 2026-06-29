unit ZUDMTiposArticulo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TZDMTiposArticulo = class(TDataModule)
     TLocal: THYTransaction;
     DSQMTiposArticulo: TDataSource;
     QMTiposArticulo: TFIBTableSet;
     QMTiposArticuloTIPO_ARTICULO_TYC: TFIBStringField;
     QMTiposArticuloDESCRIPCION: TFIBStringField;
     QMTiposArticuloCADENA_INICIO: TFIBStringField;
     TUpdate: THYTransaction;
     DSSubtipoArticulo: TDataSource;
     QMSubtipoArticulo: TFIBTableSet;
     QMSubtipoArticuloTIPO_ARTICULO_TYC: TFIBStringField;
     QMSubtipoArticuloSUBTIPO_ARTICULO_TYC: TFIBStringField;
     QMSubtipoArticuloTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMTiposArticuloAfterOpen(DataSet: TDataSet);
     procedure QMSubtipoArticuloBeforeClose(DataSet: TDataSet);
     procedure QMSubtipoArticuloNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ZDMTiposArticulo : TZDMTiposArticulo;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles;

{$R *.dfm}

procedure TZDMTiposArticulo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTiposArticulo.Open;
end;

procedure TZDMTiposArticulo.QMTiposArticuloAfterOpen(DataSet: TDataSet);
begin
  QMSubtipoArticulo.Open;
end;

procedure TZDMTiposArticulo.QMSubtipoArticuloBeforeClose(DataSet: TDataSet);
begin
  QMSubtipoArticulo.Close;
end;

procedure TZDMTiposArticulo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposArticulo, '00000');
end;

procedure TZDMTiposArticulo.QMSubtipoArticuloNewRecord(DataSet: TDataSet);
begin
  QMSubtipoArticuloTIPO_ARTICULO_TYC.AsString := QMTiposArticuloTIPO_ARTICULO_TYC.AsString;
end;

end.
