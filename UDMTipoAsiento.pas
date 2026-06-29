unit UDMTipoAsiento;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTipoAsiento = class(TDataModule)
     TLocal: THYTransaction;
     SysTipoAsiento: TFIBTableSet;
     DSSysTipoAsiento: TDataSource;
     SysTipoAsientoTIPO: TFIBStringField;
     SysTipoAsientoTITULO: TFIBStringField;
     SysTipoAsientoDEFECTO: TIntegerField;
     SysTipoAsientoVISIBLE: TIntegerField;
     SysTipoAsientoRESTRICCION: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMTipoAsientoCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTipoAsiento : TDMTipoAsiento;

implementation

uses UDMMain;

{$R *.DFM}

procedure TDMTipoAsiento.DMTipoAsientoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  SysTipoAsiento.Close;
  SysTipoAsiento.Open;
end;

end.
