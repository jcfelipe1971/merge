unit UDMDivilo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados;

type
  TDMDivilo = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMDivilo : TDMDivilo;

implementation

uses UDMMain, UUtiles, UEntorno, URecursos, uFBusca; // , UFMPunteoAsientos

{$R *.dfm}

procedure TDMDivilo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

end.
