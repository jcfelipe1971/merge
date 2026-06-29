unit UDMCierreStocks;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery;

type
  TDMCierreStocks = class(TDataModule)
     TLocal: THYTransaction;
     SPProcesa: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Procesa(modo: smallint);
  end;

var
  DMCierreStocks : TDMCierreStocks;

implementation

uses UDMMain, UEntorno, UFParada;

{$R *.dfm}

procedure TDMCierreStocks.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMCierreStocks.Procesa(modo: smallint);
begin
  with SPProcesa do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['MODO'].AsInteger := modo;
     TFParada.Create(Self).ExecQuery(SPProcesa);
     FreeHandle;
  end;
end;

end.
