unit UDMNomConceptos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMNomConceptos = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMNomConcep: TDataSource;
     QMNomConcep: TFIBTableSet;
     QMNomConcepID: TIntegerField;
     QMNomConcepDESCRIPCION: TFIBStringField;
     QMNomConcepTIPO: TFIBStringField;
     QMNomConcepSEG_SOCIAL: TIntegerField;
     QMNomConcepHORAS: TIntegerField;
     QMNomConcepHORAS_FUERZA_MAYOR: TIntegerField;
     QMNomConcepCLAVE: TFIBStringField;
     QMNomConcepSUB_CLAVE: TIntegerField;
     QMNomConcepPOSITIVO: TIntegerField;
     QMNomConcepACTUALIZA_DE_CONVENIO: TIntegerField;
     QMNomConcepCONCEPTO: TFIBStringField;
     QMNomConcepSIGNO: TIntegerField;
     QMNomConcepTIPO_CONTABILIZACION: TIntegerField;
     QMNomConcepTIPO_IMPORTE: TIntegerField;
     QMNomConcepTIPO_CONCEPTO: TIntegerField;
     QMNomConcepSIGNO_CONTABILIZACION: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMNomConcepBeforePost(DataSet: TDataSet);
     procedure Busqueda;
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure Filtrar(Concepto: string);
  end;

var
  DMNomConceptos : TDMNomConceptos;

implementation

uses UDMMain, UFBusca, Controls;

{$R *.dfm}

procedure TDMNomConceptos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  SQLBase := TStringList.Create;

  SQLBase.Add(' SELECT * FROM SYS_NOMINA_CONCEPTOS ');

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMNomConcep.SelectSQL.Text := SQLBase.Text;
  QMNomConcep.SelectSQL.Add(' ORDER BY CONCEPTO ');

  QMNomConcep.Open;
end;

procedure TDMNomConceptos.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMNomConceptos.Filtrar(Concepto: string);
begin
  { TODO : Falta implementar }
end;

procedure TDMNomConceptos.Busqueda;
var
  Resultado : integer;
begin
  // Filtro
  TFBusca.Create(Self).SeleccionaBusqueda(QMNomConcep, '00000');

  with QMNomConcep do
  begin
     if (Resultado = mrAll) then
     begin
        Close;
        SelectSQL.Text := SQLBase.Text;
        SelectSQL.Add(' ORDER BY CONCEPTO ');
        Open;
     end
     else
     begin
        Open;
     end;
  end;
end;

procedure TDMNomConceptos.QMNomConcepBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMNomConcep, 'ID_SYS_NOMINAS_CONCEPTOS', 'ID');
end;

end.
