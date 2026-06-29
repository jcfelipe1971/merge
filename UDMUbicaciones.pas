unit UDMUbicaciones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMUbicaciones = class(TDataModule)
     TLocal: THYTransaction;
     QMUbicaciones: TFIBTableSet;
     DSQMUbicaciones: TDataSource;
     TUpdate: THYTransaction;
     procedure DMUbicacionesCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMUbicaciones : TDMUbicaciones;

implementation

uses UFBusca;

{$R *.DFM}

procedure TDMUbicaciones.DMUbicacionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMUbicaciones.Open;
end;

procedure TDMUbicaciones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMUbicaciones, '00000');
end;

end.
