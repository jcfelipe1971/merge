unit UDMCentInventario;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO;

type
  TDMCentrosInventario = class(TDataModule)
     QMCentrosInventario: TFIBTableSet;
     DSQMCentrosInventario: TDataSource;
     DSxTerceros: TDataSource;
     QMCentrosInventarioEMPRESA: TIntegerField;
     QMCentrosInventarioCENTRO: TFIBStringField;
     QMCentrosInventarioTITULO: TFIBStringField;
     QMCentrosInventarioTERCERO: TIntegerField;
     TLocal: THYTransaction;
     xTerceros: TFIBDataSetRO;
     TUpdate: THYTransaction;
     procedure QMCentrosInventarioTERCEROChange(Sender: TField);
     procedure QMCentrosInventarioNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DMCentrosInventarioCreate(Sender: TObject);
     procedure QMCentrosInventarioAfterOpen(DataSet: TDataSet);
     procedure QMCentrosInventarioBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMCentrosInventario : TDMCentrosInventario;

implementation

{$R *.DFM}

uses UFormGest, UDMMain, UEntorno;

procedure TDMCentrosInventario.QMCentrosInventarioTERCEROChange(Sender: TField);
begin
  with xTerceros do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TDMCentrosInventario.QMCentrosInventarioNewRecord(DataSet: TDataSet);
begin
  QMCentrosInventarioEMPRESA.AsInteger := REntorno.Empresa;
  QMCentrosInventarioTERCERO.AsInteger := 1;
end;

procedure TDMCentrosInventario.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCentrosInventario.DMCentrosInventarioCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMCentrosInventario, '10000', True);
end;

procedure TDMCentrosInventario.QMCentrosInventarioAfterOpen(DataSet: TDataSet);
begin
  xTerceros.Open;
end;

procedure TDMCentrosInventario.QMCentrosInventarioBeforeClose(DataSet: TDataSet);
begin
  xTerceros.Close;
end;

end.
