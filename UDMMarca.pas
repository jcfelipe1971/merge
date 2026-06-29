unit UDMMarca;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMMarca = class(TDataModule)
     DSQMMarca: TDataSource;
     QMMarca: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMMarcaID_MARCA: TIntegerField;
     QMMarcaEMPRESA: TIntegerField;
     QMMarcaMARCA: TFIBStringField;
     QMMarcaTITULO: TFIBStringField;
     QMMarcaIMAGEN: TIntegerField;
     QMMarcaID_GALERIA: TIntegerField;
     QMMarcaNOTAS: TMemoField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMarcaNewRecord(DataSet: TDataSet);
     procedure QMMarcaBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMMarca : TDMMarca;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMMarca.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMMarca, '10000');
end;

procedure TDMMarca.QMMarcaNewRecord(DataSet: TDataSet);
begin
  QMMarcaEMPRESA.AsInteger := REntorno.Empresa;
  QMMarcaIMAGEN.AsInteger := 0;
  QMMarcaID_GALERIA.AsInteger := 0;
end;

procedure TDMMarca.QMMarcaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_MARCAS', 'ID_MARCA');
end;

end.
