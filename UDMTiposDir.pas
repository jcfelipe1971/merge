unit UDMTiposDir;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMTiposDir = class(TDataModule)
     QMTiposDir: TFIBTableSet;
     DSQMTiposDir: TDataSource;
     QMTiposDirTIPO: TFIBStringField;
     QMTiposDirTITULO: TFIBStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DMTiposDirCreate(Sender: TObject);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMTiposDir : TDMTiposDir;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMTiposDir.DMTiposDirCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTiposDir.Open;
end;

procedure TDMTiposDir.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposDir, '00000');
end;

end.
