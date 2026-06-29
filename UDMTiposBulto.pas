unit UDMTiposBulto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTiposBulto = class(TDataModule)
     DSQMTiposBulto: TDataSource;
     QMTiposBulto: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMTiposBultoTIPO: TFIBStringField;
     QMTiposBultoTITULO: TFIBStringField;
     procedure BusquedaCompleja;
     procedure DMTiposBultoCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTiposBulto : TDMTiposBulto;

implementation

uses
  UDMMain, UFBusca;

procedure TDMTiposBulto.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposBulto, '00000');
end;

{$R *.DFM}

procedure TDMTiposBulto.DMTiposBultoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTiposBulto.Open;
end;

end.
