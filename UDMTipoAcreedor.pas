unit UDMTipoAcreedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TDMTipoAcreedor = class(TDataModule)
     QMTipoAcreedor: TFIBTableSet;
     DSQMTipoAcreedor: TDataSource;
     TLocal: THYTransaction;
     QMTipoAcreedorTIPO: TIntegerField;
     QMTipoAcreedorTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMTipoAcreedorCreate(Sender: TObject);
     procedure QMTipoAcreedorBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMTipoAcreedor : TDMTipoAcreedor;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMTipoAcreedor.DMTipoAcreedorCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTipoAcreedor.Open;
end;

procedure TDMTipoAcreedor.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoAcreedor, '00000');
end;

procedure TDMTipoAcreedor.QMTipoAcreedorBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'conta_tipo_acreedor', 'TIPO', True);
end;

procedure TDMTipoAcreedor.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
