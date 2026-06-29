unit UDMAjustes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMAjustes = class(TDataModule)
     QMAjustes: TFIBTableSet;
     DSQMAjustes: TDataSource;
     QMAjustesREVISION: TIntegerField;
     QMAjustesFECHA: TDateTimeField;
     QMAjustesTITULO: TFIBStringField;
     QMAjustesSYS_USUARIO: TFIBStringField;
     QMAjustesTIPOS_REVISION: TFIBStringField;
     QMAjustesNOTAS: TBlobField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DMAjustesCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMAjustes : TDMAjustes;

implementation

{$R *.DFM}

uses UEntorno, UDMMain;

procedure TDMAjustes.DMAjustesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMAjustes, '00000', True);
end;

end.
