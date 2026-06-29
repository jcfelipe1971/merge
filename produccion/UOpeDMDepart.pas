unit UOpeDMDepart;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TOpeDMDepart = class(TDataModule)
     QMDepartamento: TFIBTableSet;
     DSQMDepartamento: TDataSource;
     TLocal: THYTransaction;
     QMDepartamentoEMPRESA: TIntegerField;
     QMDepartamentoDEPARTAMENTO: TFIBStringField;
     QMDepartamentoDESCRIPCION: TFIBStringField;
     procedure OpeDMDepartCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDepartamentoBeforePost(DataSet: TDataSet);
     procedure QMDepartamentoAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  OpeDMDepart : TOpeDMDepart;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UEntorno;

procedure TOpeDMDepart.OpeDMDepartCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMDepartamento, '10000');
  // QMDepartamento.Open;
end;

procedure TOpeDMDepart.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TOpeDMDepart.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMDepartamento, '10000');
end;

procedure TOpeDMDepart.QMDepartamentoBeforePost(DataSet: TDataSet);
begin
  QMDepartamentoDEPARTAMENTO.AsString := UpperCase(QMDepartamentoDEPARTAMENTO.AsString);
  QMDepartamentoEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TOpeDMDepart.QMDepartamentoAfterPost(DataSet: TDataSet);
var
  Departamento : string;
begin
  graba(DataSet);

  Departamento := QMDepartamentoDEPARTAMENTO.AsString;
  with QMDepartamento do
  begin
     DisableControls;
     Close;
     Open;
     try
        while ((not EOF) and (Departamento <> QMDepartamentoDEPARTAMENTO.AsString)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

end.
