unit UDMPresenciaTipoMarcaje;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TDMPresenciaTipoMarcaje = class(TDataModule)
     TLocal: THYTransaction;
     QMTipoPre: TFIBTableSet;
     DSQMTipoPre: TDataSource;
     TUpdate: THYTransaction;
     QMTipoPreTIPO: TFIBStringField;
     QMTipoPreDESCRIPCION: TFIBStringField;
     QMTipoPreIDENTIFICADOR_TIPO_MARCAJE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMPresenciaTipoMarcaje : TDMPresenciaTipoMarcaje;

implementation

uses UDMMain, UUtiles, UEntorno;

{$R *.dfm}

procedure TDMPresenciaTipoMarcaje.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMTipoPre, MascaraN, MascaraI, ShortDateFormat + 'hh:nn');

  QMTipoPre.Open;
end;

end.
