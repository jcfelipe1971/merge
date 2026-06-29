unit UOpeDMCentTrab;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, HYFIBQuery;

type
  TOpeDMCentTrab = class(TDataModule)
     QMCentroTrabajo: TFIBTableSet;
     DSQMCentroTrabajo: TDataSource;
     QMCentroTrabajoEMPRESA: TIntegerField;
     QMCentroTrabajoCENTRO: TFIBStringField;
     QMCentroTrabajoDESCRIPCION: TFIBStringField;
     TLocal: THYTransaction;
     QMCentroTrabajoSECCION: TFIBStringField;
     procedure OpeDMCentTrabCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCentroTrabajoBeforePost(DataSet: TDataSet);
     procedure QMCentroTrabajoAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     function DameTituloSeccion(Seccion: string): string;
  end;

var
  OpeDMCentTrab : TOpeDMCentTrab;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UEntorno, UUtiles;

procedure TOpeDMCentTrab.OpeDMCentTrabCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // QMCentroTrabajo.Open;
  DMMain.FiltraTabla(QMCentroTrabajo, '10000');
end;

procedure TOpeDMCentTrab.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TOpeDMCentTrab.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCentroTrabajo, '10000');
end;

procedure TOpeDMCentTrab.QMCentroTrabajoBeforePost(DataSet: TDataSet);
begin
  QMCentroTrabajoCENTRO.AsString := UpperCase(QMCentroTrabajoCENTRO.AsString);
  QMCentroTrabajoEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TOpeDMCentTrab.QMCentroTrabajoAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  Refrescar(QMCentroTrabajo, 'CENTRO', QMCentroTrabajoCENTRO.AsString);
end;

function TOpeDMCentTrab.DameTituloSeccion(Seccion: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DESCRIPCION FROM OPE_SECCIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' SECCION = ?SECCION ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SECCION'].AsString := Seccion;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
