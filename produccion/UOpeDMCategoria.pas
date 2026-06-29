unit UOpeDMCategoria;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet;

type
  TOpeDMCategoria = class(TDataModule)
     QMCategoria: TFIBTableSet;
     DSQMCategoria: TDataSource;
     TLocal: THYTransaction;
     QMCategoriaCATEGORIA: TFIBStringField;
     QMCategoriaDESCRIPCION: TFIBStringField;
     procedure opedmcategoriaCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure duplicados(Sender: TField);
     procedure QMCategoriaBeforePost(DataSet: TDataSet);
     procedure QMCategoriaAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  OpeDMCategoria : TOpeDMCategoria;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UUtiles;

procedure TOpeDMCategoria.opedmcategoriaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMCategoria.Open;
end;

procedure TOpeDMCategoria.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TOpeDMCategoria.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCategoria, '00000');
end;

procedure TOpeDMCategoria.duplicados(Sender: TField);
begin
  // DMMain.ControlaDuplicados(Sender);
end;

procedure TOpeDMCategoria.QMCategoriaBeforePost(DataSet: TDataSet);
begin
  QMCategoriaCATEGORIA.AsString := UpperCase(QMCategoriaCATEGORIA.AsString);
end;

procedure TOpeDMCategoria.QMCategoriaAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);

  Refrescar(QMCategoria, 'CATEGORIA', QMCategoriaCATEGORIA.AsString);
end;

end.
