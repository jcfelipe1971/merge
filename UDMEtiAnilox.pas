unit UDMEtiAnilox;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMEtiAnilox = class(TDataModule)
     QMEtiAnilox: TFIBTableSet;
     DSQMEtiAnilox: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMEtiAniloxID_ANILOX: TIntegerField;
     QMEtiAniloxTITULO: TFIBStringField;
     QMEtiAniloxVALOR: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMEtiAnilox : TDMEtiAnilox;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMEtiAnilox.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMEtiAnilox.Open;
end;

procedure TDMEtiAnilox.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMEtiAnilox, '00000');
end;

end.
