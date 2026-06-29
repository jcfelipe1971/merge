unit UDMMotivosAbono;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMMotivosAbono = class(TDataModule)
     QMMotivosAbono: TFIBTableSet;
     DSQMMotivosAbono: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMMotivosAbonoCODIGO: TIntegerField;
     QMMotivosAbonoDESCRIPCION: TFIBStringField;
     procedure DMMotivosAbonoCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMMotivosAbono : TDMMotivosAbono;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMMotivosAbono.DMMotivosAbonoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMMotivosAbono.Open;
end;

procedure TDMMotivosAbono.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMotivosAbono, '00000');
end;

end.
