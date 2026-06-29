unit UDMADRPackingGroups;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, DB, FIBDataSet, FIBTableDataSet, UFIBModificados;

type
  TDMADRPackingGroups = class(TDataModule)
     QMADRPackingGroups: TFIBTableSet;
     DSQMADRPackingGroups: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMADRPackingGroupsPACKING_GROUP: TFIBStringField;
     QMADRPackingGroupsNAME: TFIBStringField;
     procedure DMADRPackingGroupsCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMADRPackingGroups : TDMADRPackingGroups;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMADRPackingGroups.DMADRPackingGroupsCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMADRPackingGroups.Open;
end;

procedure TDMADRPackingGroups.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMADRPackingGroups, '00000');
end;

end.
