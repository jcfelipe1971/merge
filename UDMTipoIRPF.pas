unit UDMTipoIRPF;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  HYFIBQuery;

type
  TDMTipoIRPF = class(TDataModule)
     QMTipoIRPF: TFIBTableSet;
     DSTipoIRPF: TDataSource;
     QMTipoIRPFPAIS: TFIBStringField;
     QMTipoIRPFTIPO: TIntegerField;
     QMTipoIRPFTITULO: TFIBStringField;
     QMTipoIRPFP_IRPF: TFloatField;
     QMTipoIRPFBASE: TIntegerField;
     TLocal: THYTransaction;
     QMTipoIRPFTIPO_GANADERO: TIntegerField;
     QMTipoIRPFINCLUIR_ENMODELO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMTipoIRPFCreate(Sender: TObject);
     procedure QMTipoIRPFNewRecord(DataSet: TDataSet);
     procedure QMTipoIRPFAfterPost(DataSet: TDataSet);
     procedure QMTipoIRPFBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMTipoIRPFTIPO_GANADEROChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure AltaCuentasIRPF;
  end;

var
  DMTipoIRPF : TDMTipoIRPF;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca;

{$R *.DFM}

procedure TDMTipoIRPF.DMTipoIRPFCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTipoIRPFP_IRPF.DisplayFormat := MascaraP;
  DMMain.FiltraTabla(QMTipoIRPF, '00001');
end;

procedure TDMTipoIRPF.QMTipoIRPFNewRecord(DataSet: TDataSet);
begin
  QMTipoIRPFPAIS.AsString := REntorno.Pais;
  QMTipoIRPFBASE.AsInteger := 0;
  QMTipoIRPFTITULO.AsString := 'IRPF';
  QMTipoIRPFTIPO_GANADERO.AsInteger := 0;
end;

procedure TDMTipoIRPF.QMTipoIRPFAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  AltaCuentasIRPF;
end;

procedure TDMTipoIRPF.QMTipoIRPFBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
  Numero, Cantidad : integer;
begin
  /// En el caso de Tipo de IRPF puede empezar en 0
  /// Si no hay registros, iniciamos en 0, si hay devolvemos MAX+1

  if DSTipoIRPF.State = dsInsert then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT MAX(TIPO), COUNT(TIPO) FROM SYS_TIPO_IRPF WHERE PAIS=?PAIS');
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        ExecQuery;
        Numero := FieldByName['MAX'].AsInteger;
        Cantidad := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);

     if (Cantidad = 0) then
        Numero := 0
     else
        Inc(Numero);

     QMTipoIRPFTIPO.AsInteger := Numero;
  end;
end;

procedure TDMTipoIRPF.busquedacompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoIRPF, '00000');
end;

procedure TDMTipoIRPF.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTipoIRPF.AltaCuentasIRPF;
var
  Q : THYFIBQuery;
begin
  if (EstructuraCreada) then
     Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE C_CUENTAS_IRPF_ALTA (?EMPRESA, ?EJERCICIO, ?CANAL)');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTipoIRPF.QMTipoIRPFTIPO_GANADEROChange(Sender: TField);
begin
  QMTipoIRPFINCLUIR_ENMODELO.AsInteger := QMTipoIRPFTIPO_GANADERO.AsInteger;
end;

end.
