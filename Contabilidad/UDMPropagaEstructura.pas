unit UDMPropagaEstructura;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs, UFParada;

type
  TDMPropagaEstructura = class(TDataModule)
     DSQMPropagacion: TDataSource;
     TLocal: THYTransaction;
     QMPropagacion: TFIBTableSet;
     QMPropagacionEMPRESA_O: TIntegerField;
     QMPropagacionEJERCICIO_O: TIntegerField;
     QMPropagacionCANAL_O: TIntegerField;
     QMPropagacionEMPRESA_D: TIntegerField;
     QMPropagacionEJERCICIO_D: TIntegerField;
     QMPropagacionCANAL_D: TIntegerField;
     QMPropagacionPLAN_CONTABLE: TFIBStringField;
     QMPropagacionPLANTILLAS: TIntegerField;
     QMPropagacionCUENTAS: TIntegerField;
     xEmpresaO: TFIBDataSetRO;
     DSxEmpresaO: TDataSource;
     xEmpresaD: TFIBDataSetRO;
     DSxEmpresaD: TDataSource;
     xCanalO: TFIBDataSetRO;
     DSxCanalO: TDataSource;
     xCanalD: TFIBDataSetRO;
     DSxCanalD: TDataSource;
     xPlan: TFIBDataSetRO;
     DSxPlan: TDataSource;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPropagacionAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMPropagacionNewRecord(DataSet: TDataSet);
     procedure QMPropagacionPLAN_CONTABLEChange(Sender: TField);
     procedure QMPropagacionCANAL_DChange(Sender: TField);
     procedure QMPropagacionAfterPost(DataSet: TDataSet);
     procedure QMPropagacionAfterInsert(DataSet: TDataSet);
     procedure QMPropagacionAfterCancel(DataSet: TDataSet);
  private
     { Private declarations }
     insertando: boolean; //Variable para controlar la inserción (Semáforo)
     procedure AbrirDatos;
  public
     { Public declarations }
     procedure Propagar(Modo: smallint);
  end;

var
  DMPropagaEstructura : TDMPropagaEstructura;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno;

procedure TDMPropagaEstructura.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbrirDatos;

  insertando := False;
end;

procedure TDMPropagaEstructura.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMPropagaEstructura.QMPropagacionAfterOpen(DataSet: TDataSet);
begin
  xEmpresaO.Close;
  xEmpresaO.Open;
  xEmpresaD.Close;
  xEmpresaD.Open;
  xCanalO.Close;
  xCanalO.Open;
  xCanalD.Close;
  xCanalD.Open;
  xPlan.Close;
  xPlan.Open;
end;

procedure TDMPropagaEstructura.QMPropagacionNewRecord(DataSet: TDataSet);
begin
  QMPropagacionEMPRESA_O.AsInteger := REntorno.Empresa;
  QMPropagacionEJERCICIO_O.AsInteger := REntorno.Ejercicio;
  QMPropagacionCANAL_O.AsInteger := REntorno.Canal;
  QMPropagacionEMPRESA_D.AsInteger := REntorno.Empresa;
  QMPropagacionPLANTILLAS.AsInteger := 1;
  QMPropagacionCUENTAS.AsInteger := 1;
end;

procedure TDMPropagaEstructura.QMPropagacionPLAN_CONTABLEChange(Sender: TField);
begin
  xPlan.Close;
  xPlan.Open;
end;

procedure TDMPropagaEstructura.QMPropagacionCANAL_DChange(Sender: TField);
begin
  xCanalD.Close;
  xCanalD.Open;
end;

procedure TDMPropagaEstructura.AbrirDatos;
begin
  with QMPropagacion do
  begin
     Close;
     Params.ByName['EMPRESA_O'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO_O'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL_O'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMPropagaEstructura.Propagar(Modo: smallint);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure n_plan_ana_propaga(?empresa_o,?ejercicio_o,' +
           '?canal_o,?plan_contable,?empresa_d,?ejercicio_d,?canal_d,' +
           '?plantillas,?cuentas,?modo)';
        Params.ByName['EMPRESA_O'].AsInteger := QMPropagacionEMPRESA_O.AsInteger;
        Params.ByName['EJERCICIO_O'].AsInteger := QMPropagacionEJERCICIO_O.AsInteger;
        Params.ByName['CANAL_O'].AsInteger := QMPropagacionCANAL_O.AsInteger;
        Params.ByName['PLAN_CONTABLE'].AsString := QMPropagacionPLAN_CONTABLE.AsString;
        Params.ByName['EMPRESA_D'].AsInteger := QMPropagacionEMPRESA_D.AsInteger;
        Params.ByName['EJERCICIO_D'].AsInteger := QMPropagacionEJERCICIO_D.AsInteger;
        Params.ByName['CANAL_D'].AsInteger := QMPropagacionCANAL_D.AsInteger;
        Params.ByName['PLANTILLAS'].AsInteger := QMPropagacionPLANTILLAS.AsInteger;
        Params.ByName['CUENTAS'].AsInteger := QMPropagacionCUENTAS.AsInteger;
        Params.ByName['MODO'].AsInteger := Modo;
        TFParada.Create(Self).ExecQuery(Q);
        //showmessage('Estructura propagada');
     finally
        Free;
     end;
end;

procedure TDMPropagaEstructura.QMPropagacionAfterPost(DataSet: TDataSet);
begin
  Graba(QMPropagacion);
  if (insertando) then
     Propagar(0); // (modo)

  insertando := False; //Se acabo la inserción
end;

procedure TDMPropagaEstructura.QMPropagacionAfterInsert(DataSet: TDataSet);
begin
  insertando := True;  //Estamos insertando
end;

procedure TDMPropagaEstructura.QMPropagacionAfterCancel(DataSet: TDataSet);
begin
  insertando := False; //Cancelamos la inserción
end;

end.
