unit UDMTiposEfectos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTiposEfectos = class(TDataModule)
     DSQMTiposEfectos: TDataSource;
     QMTiposEfectos: TFIBTableSet;
     TLocal: THYTransaction;
     QMTiposEfectosTIPO: TFIBStringField;
     QMTiposEfectosTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     QMTiposEfectosTIPO_EFECTO_FACTURAE: TIntegerField;
     QMTiposEfectosMEDIO_PAGO_FACTURAE_CL: TFIBStringField;
     procedure BusquedaCompleja;
     procedure DMTiposEfectosCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMTiposEfectosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTiposEfectos : TDMTiposEfectos;

implementation

uses
  UDMMain, UFBusca;

procedure TDMTiposEfectos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposEfectos, '00000');
end;

{$R *.DFM}

procedure TDMTiposEfectos.DMTiposEfectosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTiposEfectos.Open;
end;

procedure TDMTiposEfectos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTiposEfectos.QMTiposEfectosNewRecord(DataSet: TDataSet);
begin
  QMTiposEfectosTIPO_EFECTO_FACTURAE.AsInteger := 0;
  QMTiposEfectosMEDIO_PAGO_FACTURAE_CL.AsString := 'OT';
end;

end.
