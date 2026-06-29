unit UProDMTipoMaquinas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet;

type
  TProDMTipoMaquinas = class(TDataModule)
     QMTipos: TFIBTableSet;
     DSQMTipos: TDataSource;
     TLocal: THYTransaction;
     QMTiposEMPRESA: TIntegerField;
     QMTiposDESCRIPCION: TFIBStringField;
     QMTiposTIPO: TFIBStringField;
     procedure Graba(DataSet: TDataSet);
     procedure DMProTipoMaquinasCreate(Sender: TObject);
     procedure QMTiposBeforePost(DataSet: TDataSet);
     procedure QMTiposNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMTipoMaquinas : TProDMTipoMaquinas;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UUtiles, uFBusca, URecursos;

procedure TProDMTipoMaquinas.DMProTipoMaquinasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMTipos, '10000', True);
end;

procedure TProDMTipoMaquinas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipos, '10000');
end;

procedure TProDMTipoMaquinas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMTipoMaquinas.QMTiposBeforePost(DataSet: TDataSet);
begin
  //DMMain.Contador_Gen( DataSet, 'PRO_CONTA_TIPO_MAQUINAS', 'Tipo')
end;

procedure TProDMTipoMaquinas.QMTiposNewRecord(DataSet: TDataSet);
begin
  QMTiposEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
