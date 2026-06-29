unit UProDMMaquinasRevisiones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, Controls, Forms, Windows, Messages, Dialogs, FIBDataSetRO,
  FIBQuery, HYFIBQuery;

type
  TProDMMaquinasRevisiones = class(TDataModule)
     QMTiposRevisiones: TFIBTableSet;
     DSQMTiposRevisiones: TDataSource;
     TLocal: THYTransaction;
     QMTiposRevisionesEMPRESA: TIntegerField;
     QMTiposRevisionesID: TIntegerField;
     QMTiposRevisionesTIPO_REVISION: TFIBStringField;
     QMTiposRevisionesFRECUENCIA: TIntegerField;
     QMTiposRevisionesNOTAS: TBlobField;
     QMTiposRevisionesRESPONSABLE: TIntegerField;
     QMTipoRevDet: TFIBTableSet;
     DSQMTipoRevDet: TDataSource;
     QMTipoRevDetEMPRESA: TIntegerField;
     QMTipoRevDetID_DETALL: TIntegerField;
     QMTipoRevDetID_CAB_REV: TIntegerField;
     QMTipoRevDetTIPO_MAQUINA: TFIBStringField;
     QMTipoRevDetDescMaquina: TStringField;
     xDescTipoMaquina: TFIBDataSetRO;
     xDescTipoMaquinaDESCRIPCION: TFIBStringField;
     QMTiposRevisionesDENOMINACION: TFIBStringField;
     procedure Graba(DataSet: TDataSet);
     procedure DMProTipoMaquinasRevisionesCreate(Sender: TObject);
     procedure QMTiposRevisionesBeforePost(DataSet: TDataSet);
     procedure QMTiposRevisionesNewRecord(DataSet: TDataSet);
     procedure QMTiposRevisionesAfterOpen(DataSet: TDataSet);
     procedure QMTipoRevDetNewRecord(DataSet: TDataSet);
     procedure QMTipoRevDetDescMaquinaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTipoRevDetTIPO_MAQUINAChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure RevisionMaquina;
  end;

var
  ProDMMaquinasRevisiones : TProDMMaquinasRevisiones;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca, URecursos;

{$R *.dfm}

procedure TProDMMaquinasRevisiones.DMProTipoMaquinasRevisionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMTiposRevisiones, '10000', True);
end;

procedure TProDMMaquinasRevisiones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposRevisiones, '10000');
end;

procedure TProDMMaquinasRevisiones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMMaquinasRevisiones.QMTiposRevisionesBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_MAQ_REV', 'ID');
end;

procedure TProDMMaquinasRevisiones.QMTiposRevisionesNewRecord(DataSet: TDataSet);
begin
  QMTiposRevisionesEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TProDMMaquinasRevisiones.QMTiposRevisionesAfterOpen(DataSet: TDataSet);
begin
  QMTipoRevDet.Close;
  QMTipoRevDet.Open;
end;

procedure TProDMMaquinasRevisiones.QMTipoRevDetNewRecord(DataSet: TDataSet);
begin
  QMTipoRevDetEMPRESA.AsInteger := QMTiposRevisionesEMPRESA.AsInteger;
  QMTipoRevDetID_CAB_REV.AsInteger := QMTiposRevisionesID.AsInteger;
end;

procedure TProDMMaquinasRevisiones.QMTipoRevDetDescMaquinaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescTipoMaquina.Close;
  xDescTipoMaquina.Open;

  Text := xDescTipoMaquinaDESCRIPCION.AsString;
end;

procedure TProDMMaquinasRevisiones.QMTipoRevDetTIPO_MAQUINAChange(Sender: TField);
begin
  xDescTipoMaquina.Close;
  xDescTipoMaquina.Open;

  QMTipoRevDetDescMaquina.AsString := xDescTipoMaquinaDESCRIPCION.AsString;
end;

procedure TProDMMaquinasRevisiones.RevisionMaquina;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_REVISION_MAQUINAS(:ID_CAB_REVISION)';
        Params.ByName['ID_CAB_REVISION'].AsInteger := QMTiposRevisionesID.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
