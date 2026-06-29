unit UDMTiposArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTiposArticulo = class(TDataModule)
     DSQMTiposArticulo: TDataSource;
     QMTiposArticulo: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMTiposArticuloTIPO: TFIBStringField;
     QMTiposArticuloTITULO: TFIBStringField;
     procedure BusquedaCompleja;
     procedure DMTiposArticuloCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTiposArticulo : TDMTiposArticulo;

implementation

uses
  UDMMain, UFBusca;

procedure TDMTiposArticulo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposArticulo, '00000');
end;

{$R *.DFM}

procedure TDMTiposArticulo.DMTiposArticuloCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTiposArticulo.Open;
end;

end.
