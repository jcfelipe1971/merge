unit UDMProtocoloDeVenta;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery;

type
  TDMProtocoloDeVenta = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMProtocolo: TFIBTableSet;
     QMDetalle: TFIBTableSet;
     DSQMProtocolo: TDataSource;
     DSQMDetalle: TDataSource;
     QMProtocoloEMPRESA: TIntegerField;
     QMProtocoloEJERCICIO: TIntegerField;
     QMProtocoloCANAL: TIntegerField;
     QMProtocoloPROTOCOLO: TFIBStringField;
     QMProtocoloTIPO: TFIBStringField;
     QMProtocoloALTA: TDateTimeField;
     QMProtocoloBAJA: TDateTimeField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetallePROTOCOLO: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleFAMILIA: TFIBStringField;
     QMDetalleUNID_MINIMAS: TFloatField;
     QMDetalleUNID_MAXIMAS: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMProtocoloTITULO: TStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProtocoloAfterOpen(DataSet: TDataSet);
     procedure QMProtocoloBeforeClose(DataSet: TDataSet);
     procedure QMProtocoloTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProtocoloNewRecord(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     TipoProtocolo: string;
  public
     { Public declarations }
     procedure FiltraTipo(Tipo: integer);
     procedure RegenerarCondiciones;
  end;

var
  DMProtocoloDeVenta : TDMProtocoloDeVenta;

implementation

uses UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TDMProtocoloDeVenta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMDetalleUNID_MINIMAS.DisplayFormat := MascaraN;
  QMDetalleUNID_MAXIMAS.DisplayFormat := MascaraN;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetallePRECIO.DisplayFormat := MascaraL;
end;

procedure TDMProtocoloDeVenta.FiltraTipo(Tipo: integer);
begin
  if (Tipo = 0) then
     TipoProtocolo := 'CCA'
  else
     TipoProtocolo := 'CCF';
  with QMProtocolo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := TipoProtocolo;
     Open;
  end;
end;

procedure TDMProtocoloDeVenta.QMProtocoloAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TDMProtocoloDeVenta.QMProtocoloBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

procedure TDMProtocoloDeVenta.QMProtocoloTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloProtocolo(QMProtocoloPROTOCOLO.AsString);
end;

procedure TDMProtocoloDeVenta.QMProtocoloNewRecord(DataSet: TDataSet);
begin
  QMProtocoloEMPRESA.AsInteger := REntorno.Empresa;
  QMProtocoloEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProtocoloCANAL.AsInteger := REntorno.Canal;
  QMProtocoloTIPO.AsString := TipoProtocolo;
  QMProtocoloALTA.AsDateTime := EncodeDate(REntorno.Ejercicio, 1, 1);
  QMProtocoloBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
end;

procedure TDMProtocoloDeVenta.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := QMProtocoloEMPRESA.AsInteger;
  QMDetalleEJERCICIO.AsInteger := QMProtocoloEJERCICIO.AsInteger;
  QMDetalleCANAL.AsInteger := QMProtocoloCANAL.AsInteger;
  QMDetallePROTOCOLO.AsString := QMProtocoloPROTOCOLO.AsString;
  QMDetalleTIPO.AsString := TipoProtocolo;
  QMDetalleUNID_MINIMAS.AsFloat := 0;
  QMDetalleUNID_MAXIMAS.AsFloat := 1999999999;
  QMDetallePRECIO.AsFloat := 0;
  QMDetalleDESCUENTO.AsFloat := 0;
  QMDetalleDESCUENTO_2.AsFloat := 0;
  QMDetalleDESCUENTO_3.AsFloat := 0;
end;

procedure TDMProtocoloDeVenta.QMDetalleBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if (QMDetalle.State = dsInsert) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM ART_PROTOCOLO_D WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TIPO=?TIPO AND PROTOCOLO=?PROTOCOLO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO'].AsString := TipoProtocolo;
        Params.ByName['PROTOCOLO'].AsString := QMProtocoloPROTOCOLO.AsString;
        ExecQuery;
        QMDetalleLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TDMProtocoloDeVenta.QMDetalleAfterPost(DataSet: TDataSet);
var
  linea : integer;
begin
  linea := QMDetalleLINEA.AsInteger;
  with QMDetalle do
  begin
     Close;
     Open;
     while ((not EOF) and (linea <> QMDetalleLINEA.AsInteger)) do
        Next;
  end;
end;

procedure TDMProtocoloDeVenta.RegenerarCondiciones;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE a_art_propaga_protocolo (?empresa, ?ejercicio, ?canal, ?protocolo, ?tipo, ?cliente)';
        Params.ByName['EMPRESA'].AsInteger := QMProtocoloEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProtocoloEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProtocoloCANAL.AsInteger;
        Params.ByName['TIPO'].AsString := QMProtocoloTIPO.AsString;
        Params.ByName['PROTOCOLO'].AsString := QMProtocoloPROTOCOLO.AsString;
        Params.ByName['CLIENTE'].AsInteger := 0; {0 = todos los clientes}
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
