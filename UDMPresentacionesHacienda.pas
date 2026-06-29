unit UDMPresentacionesHacienda;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMPresentacionesHacienda = class(TDataModule)
     DSQMPresentacionesHacienda: TDataSource;
     QMPresentacionesHacienda: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPresentacionesHaciendaID_MODELO: TIntegerField;
     QMPresentacionesHaciendaEMPRESA: TIntegerField;
     QMPresentacionesHaciendaEJERCICIO: TIntegerField;
     QMPresentacionesHaciendaMODELO: TFIBStringField;
     QMPresentacionesHaciendaPERIODO: TFIBStringField;
     QMPresentacionesHaciendaNOTAS: TBlobField;
     QMPresentacionesHaciendaPAIS: TFIBStringField;
     QMPresentacionesHaciendaTITULO: TFIBStringField;
     QMAdjuntos: TFIBTableSet;
     QMAdjuntosEMPRESA: TIntegerField;
     QMAdjuntosTIPO: TFIBStringField;
     QMAdjuntosID: TIntegerField;
     QMAdjuntosTITULO: TFIBStringField;
     QMAdjuntosID_ADJUNTO: TIntegerField;
     QMAdjuntosTITULO_ADJUNTO: TFIBStringField;
     QMAdjuntosNOMBRE: TFIBStringField;
     QMAdjuntosFECHA: TDateTimeField;
     QMAdjuntosREPOSITORIO: TIntegerField;
     QMAdjuntosDESCRIPCION_REPOSITORIO: TStringField;
     QMAdjuntosWEB: TIntegerField;
     DSQMAdjuntos: TDataSource;
     procedure DMPresentacionesHaciendaCreate(Sender: TObject);
     procedure QMPresentacionesHaciendaNewRecord(DataSet: TDataSet);
     procedure QMPresentacionesHaciendaMODELOChange(Sender: TField);
     procedure QMPresentacionesHaciendaAfterOpen(DataSet: TDataSet);
     procedure QMPresentacionesHaciendaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     function RecargaComboEjercicios(Items: TStrings): integer;
     procedure Filtra(Ejercicio: integer; Periodo, Modelo: string);
     procedure RefrescarAdjuntos;
  end;

var
  DMPresentacionesHacienda : TDMPresentacionesHacienda;

implementation

uses
  UDMMain, UUtiles, UEntorno, UDameDato;

{$R *.DFM}

procedure TDMPresentacionesHacienda.DMPresentacionesHaciendaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMPresentacionesHacienda, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMAdjuntos, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TDMPresentacionesHacienda.QMPresentacionesHaciendaNewRecord(DataSet: TDataSet);
begin
  QMPresentacionesHaciendaEMPRESA.AsInteger := REntorno.Empresa;
  QMPresentacionesHaciendaEJERCICIO.AsInteger := REntorno.Ejercicio;
end;

function TDMPresentacionesHacienda.RecargaComboEjercicios(Items: TStrings): integer;
var
  i, s : integer;
  DS : TFIBDataSet;
begin
  Items.Clear;
  Items.AddObject(_('Todos los Ejercicios'), Pointer(0));

  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := TFIBTransaction.Create(nil);
        try
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if not InTransaction then
                 StartTransaction;
           end;
           SelectSQL.Add('SELECT DISTINCT EJERCICIO FROM EMP_PRESENTACIONES_HACIENDA WHERE EMPRESA = ?EMPRESA ORDER BY EJERCICIO DESC');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;

           i := 0; // por defecto: Todos los Ejercicios
           while not EOF do
           begin
              s := Items.AddObject(
                 IntToStr(FieldByName('EJERCICIO').AsInteger),
                 Pointer(FieldByName('EJERCICIO').AsInteger));
              if FieldByName('EJERCICIO').AsInteger = REntorno.Ejercicio then
                 i := s;
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  Result := i;
end;

procedure TDMPresentacionesHacienda.Filtra(Ejercicio: integer; Periodo, Modelo: string);
var
  SQL : TStringList;
begin
  SQL := TStringList.Create;
  try
     SQL.Add('SELECT * FROM VER_EMP_PRESENTACIONES_HACIENDA');
     SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr);
     if Ejercicio > 0 then
        SQL.Add('  AND EJERCICIO=' + IntToStr(Ejercicio));
     if Trim(Periodo) <> '' then
        SQL.Add('  AND PERIODO=''' + Trim(Periodo) + '''');
     if Trim(Modelo) <> '' then
        SQL.Add('  AND MODELO=''' + Trim(Modelo) + '''');
     SQL.Add('ORDER BY EJERCICIO, MODELO, PERIODO');

     QMPresentacionesHacienda.Close;
     QMPresentacionesHacienda.SelectSQL.Assign(SQL);
     if not TLocal.InTransaction then
        TLocal.StartTransaction;
     QMPresentacionesHacienda.Open;
  finally
     SQL.Free;
  end;
end;

procedure TDMPresentacionesHacienda.QMPresentacionesHaciendaMODELOChange(Sender: TField);
begin
  QMPresentacionesHaciendaTITULO.AsString := DameTituloModeloHacienda(QMPresentacionesHaciendaMODELO.AsString);
end;

procedure TDMPresentacionesHacienda.RefrescarAdjuntos;
begin
  Refrescar(QMAdjuntos, 'ID_ADJUNTO', QMAdjuntosID_ADJUNTO.AsInteger);
end;

procedure TDMPresentacionesHacienda.QMPresentacionesHaciendaAfterOpen(DataSet: TDataSet);
begin
  QMAdjuntos.Open;
end;

procedure TDMPresentacionesHacienda.QMPresentacionesHaciendaBeforeClose(DataSet: TDataSet);
begin
  QMAdjuntos.Close;
end;

end.
