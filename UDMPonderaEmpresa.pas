unit UDMPonderaEmpresa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, HYFIBQuery, FIBDatabase, UFIBModificados, DB, FIBDataSetRO;

type
  TDMPonderaEmpresa = class(TDataModule)
     TLocal: THYTransaction;
     QPondera: THYFIBQuery;
     TPondera: THYTransaction;
     QMain: TFIBDataSetRO;
     QGeneral: TFIBQuery;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMPonderaEmpresa : TDMPonderaEmpresa;

implementation

uses UDMMain;

{$R *.DFM}

end.
