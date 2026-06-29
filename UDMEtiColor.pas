unit UDMEtiColor;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMEtiColor = class(TDataModule)
     QMEtiColor: TFIBTableSet;
     DSQMEtiColor: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMEtiColorCODIGO: TFIBStringField;
     QMEtiColorTITULO: TFIBStringField;
     QMEtiColorCOLOR_DECIMAL: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMEtiColorAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMEtiColor : TDMEtiColor;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno, UFMEtiColor;

{$R *.DFM}

procedure TDMEtiColor.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMEtiColor.Open;
end;

procedure TDMEtiColor.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMEtiColor, '00000');
end;

procedure TDMEtiColor.QMEtiColorAfterScroll(DataSet: TDataSet);
begin
  FMEtiColor.RefrescaColores;
end;

end.
