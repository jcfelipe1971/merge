unit UDMCampanyas;

interface

uses
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados, FIBDataSetRO;

type
  TDMCampanyas = class(TDataModule)
     QMCampanyas: TFIBTableSet;
     DSQMCampanyas: TDataSource;
     TLocal: THYTransaction;
     QMCampanyasEMPRESA: TIntegerField;
     QMCampanyasEJERCICIO: TIntegerField;
     QMCampanyasINICIO: TDateTimeField;
     QMCampanyasFINAL: TDateTimeField;
     QMCampanyasACTIVA: TIntegerField;
     QMCampanyasVALOR: TDateTimeField;
     QMCampanyasCAMPANYA: TIntegerField;
     QMCampanyasTITULO: TFIBStringField;
     QMCampanyasVALOR_SI: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMCampanyasCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCampanyasBeforePost(DataSet: TDataSet);
     procedure QMCampanyasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMCampanyas : TDMCampanyas;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMCampanyas.DMCampanyasCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMCampanyas, '11000', True);
end;

procedure TDMCampanyas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCampanyas.QMCampanyasBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMCampanyasCAMPANYA.AsInteger := DMMain.Contador_EE('CMP');
end;

procedure TDMCampanyas.QMCampanyasNewRecord(DataSet: TDataSet);
var
  Apertura, Cierre : TDateTime;
begin
  DameMinMax('EJE', Apertura, Cierre);

  QMCampanyasEMPRESA.AsInteger := REntorno.Empresa;
  QMCampanyasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCampanyasINICIO.AsDateTime := Apertura;
  QMCampanyasFINAL.AsDateTime := Cierre;
  QMCampanyasVALOR.AsDateTime := Apertura;
  QMCampanyasACTIVA.AsInteger := 1;
  QMCampanyasVALOR_SI.AsInteger := 1;
end;

procedure TDMCampanyas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCampanyas, '11000');
end;

end.
