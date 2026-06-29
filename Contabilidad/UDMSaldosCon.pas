unit UDMSaldosCon;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FIBTableDataSetRO;

type
  TDMSaldosCon = class(TDataModule)
     QMConsultas: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMConsultas: TDataSource;
     QMConsultasCONSULTA: TIntegerField;
     QMConsultasTITULO: TFIBStringField;
     QMConsultasDet: TFIBTableSet;
     DSQMConsultasDet: TDataSource;
     QMConsultasDetCONSULTA: TIntegerField;
     QMConsultasDetCUENTA: TFIBStringField;
     QMConsultasDetMULTIPLICADOR: TIntegerField;
     QMConsultasDetPORCENT: TFloatField;
     QMConsultasDetTITULO: TFIBStringField;
     xCuentas: THYFIBQuery;
     QMConsultasMODO: TIntegerField;
     DSxSalida: TDataSource;
     SPRecalcula: THYFIBQuery;
     xSaldo: TFIBDataSetRO;
     DSxSaldo: TDataSource;
     xSaldoSALDOS: TFloatField;
     xCanales: TFIBQuery;
     QElimina: THYFIBQuery;
     QEliminarTodo: THYFIBQuery;
     xSalida: TFIBTableSetRO;
     xSalidaEMPRESA: TIntegerField;
     xSalidaEJERCICIO: TIntegerField;
     xSalidaCANAL: TIntegerField;
     xSalidaUSUARIO: TIntegerField;
     xSalidaCONSULTA: TIntegerField;
     xSalidaCUENTA: TFIBStringField;
     xSalidaTITULO: TFIBStringField;
     xSalidaFECHA: TDateTimeField;
     xSalidaDEBE: TFloatField;
     xSalidaHABER: TFloatField;
     xSalidaSALDO: TFloatField;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure DMSaldosConCreate(Sender: TObject);
     procedure QMConsultasAfterOpen(DataSet: TDataSet);
     procedure QMConsultasBeforePost(DataSet: TDataSet);
     procedure QMConsultasDetCUENTAChange(Sender: TField);
     procedure QMConsultasDetNewRecord(DataSet: TDataSet);
     procedure QMConsultasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public

     procedure Recalcula(Fecha: TDateTime; Canal: integer; Borrado, Detalle: boolean);
     procedure VerSaldo;
     procedure RellenaCanales(Lista: TStrings);
     procedure Elimina;
     procedure EliminarTodas;
  end;

var
  DMSaldosCon : TDMSaldosCon;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMSaldosCon.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  QMConsultas.Refresh;
end;

procedure TDMSaldosCon.DMSaldosConCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMCOnsultas.Open;

  xSalidaDEBE.DisplayFormat := MascaraN;
  xSalidaHABER.DisplayFormat := MascaraN;
  xSalidaSALDO.DisplayFormat := MascaraN;
  xSaldoSALDOS.DisplayFormat := MascaraN;
end;

procedure TDMSaldosCon.QMConsultasAfterOpen(DataSet: TDataSet);
begin
  QMConsultasDet.Open;
end;

procedure TDMSaldosCon.QMConsultasBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMConsultasCONSULTA.AsInteger := DMMain.Contador_GEN(QMConsultas,
        'conta_consultas', 'consulta', True);
end;

procedure TDMSaldosCon.QMConsultasDetCUENTAChange(Sender: TField);
begin
  with xCuentas do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Sender.AsString;
     ExecQuery;
     QMConsultasDetTITULO.AsString := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMSaldosCon.QMConsultasDetNewRecord(DataSet: TDataSet);
begin
  QMConsultasDetCONSULTA.AsInteger := QMConsultasCONSULTA.AsInteger;
  QMConsultasDetMULTIPLICADOR.AsInteger := 1;
  QMConsultasDetPORCENT.AsFloat := 100;
end;

procedure TDMSaldosCon.Recalcula(Fecha: TDateTime; Canal: integer; Borrado, Detalle: boolean);
var
  Bor, Det : smallint;
begin
  Bor := 0;
  Det := 0;
  if Borrado then
     Bor := 1;
  if Detalle then
     Det := 1;
  with SPRecalcula do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Params.ByName['CONSULTA'].AsInteger := QMConsultasCONSULTA.AsInteger;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     Params.ByName['BORRADO'].AsInteger := Bor;
     Params.ByName['DETALLE'].AsInteger := Det;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMSaldosCon.VerSaldo;
begin
  with xSalida do
  begin
     DisableControls;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     //Params.ByName[ 'CANAL'     ].AsInteger := REntorno.Canal                ;
     Params.ByName['CONSULTA'].AsInteger := QMConsultasCONSULTA.AsInteger;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
     EnableControls;
  end;
  with xSaldo do
  begin
     DisableControls;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     //Params.ByName[ 'CANAL'     ].AsInteger := REntorno.Canal                ;
     Params.ByName['CONSULTA'].AsInteger := QMConsultasCONSULTA.AsInteger;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
     EnableControls;
  end;
end;

procedure TDMSaldosCon.RellenaCanales(Lista: TStrings);
var
  Canal : integer;
begin
  {dji lrk kri - Memory Leak}
  Lista.AddObject('0-Todos los Canales', Pointer(0));
  with xCanales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     while not EOF do
     begin
        Canal := FieldByName['CANAL'].AsInteger;
        Lista.AddObject('Canal ' + IntToStr(Canal), Pointer(Canal));
        Next;
     end;
     Close;
  end;
end;

// Eliminar las Consultas del Usuario
procedure TDMSaldosCon.Elimina;
begin
  with QElimina do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     ExecQuery;
     FreeHandle;
  end;
  Self.VerSaldo;
end;

// Eliminar TODAS las Consultas
procedure TDMSaldosCon.EliminarTodas;
begin
  with QEliminarTodo do
  begin
     Close;
     ExecQuery;
     FreeHandle;
  end;

  VerSaldo;
end;

procedure TDMSaldosCon.QMConsultasNewRecord(DataSet: TDataSet);
begin
  QMConsultasMODO.AsInteger := 0;
end;

end.
