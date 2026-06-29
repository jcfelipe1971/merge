unit UCrmDMAsuntos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TCrmDMAsuntos = class(TDataModule)
     TLocal: THYTransaction;
     QMAsuntos: TFIBTableSet;
     DSQMAsuntos: TDataSource;
     TUpdate: THYTransaction;
     QMAsuntosID_ASUNTO: TIntegerField;
     QMAsuntosTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAsuntosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmDMAsuntos : TCrmDMAsuntos;

implementation

uses UDMMain;

{$R *.dfm}

procedure TCrmDMAsuntos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMAsuntos.Open;
end;

procedure TCrmDMAsuntos.QMAsuntosBeforePost(DataSet: TDataSet);
begin
  QMAsuntosID_ASUNTO.AsInteger := DMMain.Contador_Gen(QMAsuntos, 'CRM_ID_ASUNTO', 'ID_ASUNTO');
end;

end.
