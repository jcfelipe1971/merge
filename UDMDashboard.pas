unit UDMDashboard;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDashboard = class(TDataModule)
     xDashBoard: TFIBTableSet;
     DSxDashBoard: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xDashBoardID: TIntegerField;
     xDashBoardEMPRESA: TIntegerField;
     xDashBoardUSUARIO: TIntegerField;
     xDashBoardORDEN: TIntegerField;
     xDashBoardTIPO: TFIBStringField;
     xDashBoardSQL: TMemoField;
     xDashBoardDESCRIPCION: TFIBStringField;
     xDashBoardPAGINA: TIntegerField;
     xDashBoardTRANSACCION_READONLY: TIntegerField;
     xDashBoardCONFIGURACION: TMemoField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  Dashboard : TDashboard;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDashboard.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  with xDashBoard do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
  end;
end;

end.
