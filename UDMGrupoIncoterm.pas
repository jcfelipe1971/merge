unit UDMGrupoIncoterm;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMGrupoIncoterm = class(TDataModule)
     DSQMGrupo: TDataSource;
     TLocal: THYTransaction;
     QMGrupo: TFIBTableSet;
     TUpdate: THYTransaction;
     QMGrupoGRUPO: TFIBStringField;
     QMGrupoTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMGrupoIncoterm : TDMGrupoIncoterm;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMGrupoIncoterm.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMGrupo.Open;
end;

end.
