unit UDMProdProduccion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMProdProduccion = class(TDataModule)
     TLocal: THYTransaction;
     QMProcesos: TFIBTableSet;
     DSQMProcesos: TDataSource;
     QMProcesosEMPRESA: TIntegerField;
     QMProcesosPROCESO: TIntegerField;
     QMProcesosTITULO: TFIBStringField;
     QMProcesosDURACION: TFloatField;
     QMProcesosNOTAS: TBlobField;
     QGen: THYFIBQuery;
     QMProcesosPRECIO: TFloatField;
     procedure Graba(DataSet: TDataSet);
     procedure DMProdProduccionCreate(Sender: TObject);
     procedure QMProcesosNewRecord(DataSet: TDataSet);
     procedure QMProcesosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMProdProduccion : TDMProdProduccion;

implementation

uses UDMMain, uFBusca, UEntorno;

{$R *.DFM}

procedure TDMProdProduccion.DMProdProduccionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMProcesosDURACION.DisplayFormat := ',##0.##';
  DMMain.FiltraTabla(QMProcesos, '10000');
  QMProcesosPRECIO.DisplayFormat := MascaraE;
end;

procedure TDMProdProduccion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMProdProduccion.BusquedaCompleja;
begin
  // Llamada al buscador
  TFBusca.Create(Self).SeleccionaBusqueda(QMProcesos, '10000', True);
end;

procedure TDMProdProduccion.QMProcesosNewRecord(DataSet: TDataSet);
begin
  QMProcesosEMPRESA.AsInteger := REntorno.Empresa;
  QMProcesosDURACION.AsFloat := 0;
end;

procedure TDMProdProduccion.QMProcesosBeforePost(DataSet: TDataSet);
var
  orden : integer;
begin
  if ((StrToIntDef(QMProcesosPROCESO.AsString, 0) = 0) and (QMProcesos.State = dsInsert)) then
     with qGen do
     begin
        Close;
        SQL.Text := 'select max(proceso) as orden from emp_procesos_produccion ' +
           'where empresa=?empresa';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        orden := StrToIntDef(FieldByName['orden'].AsString, 0);
        orden := orden + 1;
        FreeHandle;
        QMProcesosPROCESO.AsInteger := orden;
     end;
end;

end.
