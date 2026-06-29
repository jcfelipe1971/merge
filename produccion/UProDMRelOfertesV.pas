unit UProDMRelOfertesV;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, UDMMain, FIBQuery, HYFIBQuery;

type
  TProDMRelOfertesV = class(TDataModule)
     xEscandallo: TFIBDataSetRO;
     DSEscandallo: TDataSource;
     TLocal: THYTransaction;
     xInsertarOferta: THYFIBQuery;
     xDuplicarOferta: THYFIBQuery;
     xBuscarUltimEscandall: THYFIBQuery;
     xUpdateOferta: THYFIBQuery;
     xEscandalloTITULO: TFIBStringField;
     xEscandalloCOMPUESTO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProDMRelOfertesV : TProDMRelOfertesV;

implementation

{$R *.dfm}

procedure TProDMRelOfertesV.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

end.
