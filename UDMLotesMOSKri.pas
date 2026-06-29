unit UDMLotesMOSKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMLotesMOSKri = class(TDataModule)
     TLocal: THYTransaction;
     TCommit: THYTransaction;
     xArticulo: TFIBDataSetRO;
     xArticuloTITULO: TFIBStringField;
     xArticuloABIERTO: TIntegerField;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     QEscandallo: TFIBDataSetRO;
     QEscandalloDETALLE: TFIBStringField;
     QEscandalloCANTIDAD: TFloatField;
     xAsignado: TFIBDataSetRO;
     DSAsignado: TDataSource;
     xDisponible: TFIBDataSetRO;
     DSDisponible: TDataSource;
     QAsignaNroSerie: TFIBQuery;
     QSacaNroSerie: TFIBQuery;
     QBorraLoteAnt: TFIBQuery;
     xArticuloLOTES_KRI: TIntegerField;
     xAsignadoCOUNT: TIntegerField;
     xAsignadoEMPRESA: TIntegerField;
     xAsignadoARTICULO: TFIBStringField;
     xAsignadoEJERCICIO_SAL: TIntegerField;
     xAsignadoCANAL_SAL: TIntegerField;
     xAsignadoSERIE_SAL: TFIBStringField;
     xAsignadoRIG_SAL: TIntegerField;
     xAsignadoLINEA_SAL: TIntegerField;
     xAsignadoLOTE: TFIBStringField;
     xAsignadoCADUCIDAD: TDateTimeField;
     xDisponibleCOUNT: TIntegerField;
     xDisponibleEMPRESA: TIntegerField;
     xDisponibleARTICULO: TFIBStringField;
     xDisponibleEJERCICIO_MOS: TIntegerField;
     xDisponibleCANAL_MOS: TIntegerField;
     xDisponibleSERIE_MOS: TFIBStringField;
     xDisponibleRIG_MOS: TIntegerField;
     xDisponibleLINEA_MOS: TIntegerField;
     xDisponibleLOTE: TFIBStringField;
     xDisponibleCADUCIDAD: TDateTimeField;
     xDisponibleALMACEN_ENT: TFIBStringField;
     QAsignados: TFIBQuery;
     QAsignar: TFIBQuery;
     QDesAsignar: TFIBQuery;
     QAAsignar: TFIBDataSetRO;
     QAAsignarID: TIntegerField;
     procedure DataModuleDestroy(Sender: TObject);
     procedure xArticuloAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     Escandallo: boolean;
     Loteado: boolean;
     Titulo: string;
     Asignados: integer;
     Cantidad: integer;
     SinAsignar: integer;
     Empresa: integer;
     Ejercicio: integer;
     Canal: integer;
     Serie: string;
     rig: integer;
     Articulo: string;
     Almacen: string;
     Fecha: TDateTime;
     Linea: integer;
     procedure Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
     procedure Refresca;
     procedure Asignar(Cant: integer);
     procedure DesAsignar;
  end;

var
  DMLotesMOSKri : TDMLotesMOSKri;

implementation

{$R *.dfm}

procedure TDMLotesMOSKri.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
begin
  empresa := emp;
  ejercicio := eje;
  canal := can;
  serie := ser;
  rig := ri;
  linea := lin;
  articulo := art;
  almacen := alm;
  cantidad := cant;
  fecha := fec;
  Asignados := 0;
  if (not xArticulo.Transaction.InTransaction) then
     xArticulo.Transaction.StartTransaction;
  xArticulo.Close;
  xArticulo.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xArticulo.Params.ByName['ARTICULO'].AsString := Articulo;
  xArticulo.Open;
  Loteado := False;
  if (xArticuloLOTES_KRI.AsInteger = 1) then
     Loteado := True;
  if (not VieneDeEsc) then
  begin
     if (not QArticuloAnterior.Transaction.InTransaction) then
        QArticuloAnterior.Transaction.StartTransaction;
     QArticuloAnterior.Close;
     QArticuloAnterior.Params.ByName['EMPRESA'].AsInteger := Empresa;
     QArticuloAnterior.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     QArticuloAnterior.Params.ByName['SERIE'].AsString := Serie;
     QArticuloAnterior.Params.ByName['RIG'].AsInteger := Rig;
     QArticuloAnterior.Params.ByName['LINEA'].AsInteger := Linea;
     QArticuloAnterior.Open;
     if ((QArticuloAnteriorARTICULO.AsString <> Articulo) and (Loteado = True)) then
     begin
        if (not QBorraLoteAnt.Transaction.InTransaction) then
           QBorraLoteAnt.Transaction.StartTransaction;
        QBorraLoteAnt.Close;
        QBorraLoteAnt.Params.ByName['EMPRESA'].AsInteger := Empresa;
        QBorraLoteAnt.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        QBorraLoteAnt.Params.ByName['CANAL'].AsInteger := Canal;
        QBorraLoteAnt.Params.ByName['SERIE'].AsString := Serie;
        QBorraLoteAnt.Params.ByName['RIG'].AsInteger := Rig;
        QBorraLoteAnt.Params.ByName['LINEA'].AsInteger := Linea;
        QBorraLoteAnt.ExecQuery;
        QBorraLoteAnt.Transaction.Commit;
     end;
  end;
  Refresca;
end;

procedure TDMLotesMOSKri.Refresca;
begin
  if (not xAsignado.Transaction.InTransaction) then
     xAsignado.Transaction.StartTransaction;
  xAsignado.Close;
  xAsignado.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xAsignado.Params.ByName['ARTICULO'].AsString := Articulo;
  xAsignado.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  xAsignado.Params.ByName['CANAL'].AsInteger := Canal;
  xAsignado.Params.ByName['SERIE'].AsString := Serie;
  xAsignado.Params.ByName['RIG'].AsInteger := Rig;
  xAsignado.Params.ByName['LINEA'].AsInteger := Linea;
  xAsignado.Open;
  if (not xDisponible.Transaction.InTransaction) then
     xDisponible.Transaction.StartTransaction;
  xDisponible.Close;
  xDisponible.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xDisponible.Params.ByName['ARTICULO'].AsString := Articulo;
  xDisponible.Open;

  if (not QAsignados.Transaction.InTransaction) then
     QAsignados.Transaction.StartTransaction;
  QAsignados.Close;
  QAsignados.Params.ByName['EMPRESA'].AsInteger := Empresa;
  QAsignados.Params.ByName['ARTICULO'].AsString := Articulo;
  QAsignados.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QAsignados.Params.ByName['CANAL'].AsInteger := Canal;
  QAsignados.Params.ByName['SERIE'].AsString := Serie;
  QAsignados.Params.ByName['RIG'].AsInteger := Rig;
  QAsignados.Params.ByName['LINEA'].AsInteger := Linea;
  QAsignados.ExecQuery;
  Asignados := QAsignados.FieldByName['COUNT'].AsInteger;
  SinAsignar := Cantidad - Asignados;
  QAsignados.Transaction.CommitRetaining;
end;

procedure TDMLotesMOSKri.Asignar(Cant: integer);
begin
  if (not QAAsignar.Transaction.InTransaction) then
     QAAsignar.Transaction.StartTransaction;
  QAAsignar.Close;
  QAAsignar.Params.ByName['EMPRESA'].AsInteger := xDisponibleEMPRESA.AsInteger;
  QAAsignar.Params.ByName['ARTICULO'].AsString := xDisponibleARTICULO.AsString;
  QAAsignar.Params.ByName['LOTE'].AsString := xDisponibleLOTE.AsString;
  QAAsignar.Open;
  while ((not QAAsignar.EOF) and (Cant > 0)) do
  begin
     if (not QAsignar.Transaction.InTransaction) then
        QAsignar.Transaction.StartTransaction;
     QAsignar.Close;
     QAsignar.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     QAsignar.Params.ByName['CANAL'].AsInteger := Canal;
     QAsignar.Params.ByName['SERIE'].AsString := Serie;
     QAsignar.Params.ByName['RIG'].AsInteger := Rig;
     QAsignar.Params.ByName['LINEA'].AsInteger := Linea;
     QAsignar.Params.ByName['ALMACEN'].AsString := Almacen;
     QAsignar.Params.ByName['FECHA'].AsDateTime := Fecha;
     QAsignar.Params.ByName['ID'].AsInteger := QAAsignarID.AsInteger;
     QAsignar.ExecQuery;
     QAsignar.Transaction.Commit;
     Dec(Cant);
     QAAsignar.Next;
  end;
  Refresca;
end;

procedure TDMLotesMOSKri.DesAsignar;
begin
  if (not QDesAsignar.Transaction.InTransaction) then
     QDesAsignar.Transaction.StartTransaction;
  QDesAsignar.Close;
  QDesAsignar.Params.ByName['EMPRESA'].AsInteger := xAsignadoEMPRESA.AsInteger;
  QDesAsignar.Params.ByName['ARTICULO'].AsString := xAsignadoARTICULO.AsString;
  QDesAsignar.Params.ByName['LOTE'].AsString := xAsignadoLOTE.AsString;
  QDesAsignar.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QDesAsignar.Params.ByName['CANAL'].AsInteger := Canal;
  QDesAsignar.Params.ByName['SERIE'].AsString := Serie;
  QDesAsignar.Params.ByName['RIG'].AsInteger := Rig;
  QDesAsignar.Params.ByName['LINEA'].AsInteger := Linea;
  QDesAsignar.ExecQuery;
  QDesAsignar.Transaction.Commit;
  Refresca;
end;

procedure TDMLotesMOSKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TCommit.InTransaction) then
     TCommit.Commit;
end;

procedure TDMLotesMOSKri.xArticuloAfterOpen(DataSet: TDataSet);
begin
  Titulo := xArticuloTITULO.AsString;
  if (xArticuloLOTES_KRI.AsInteger = 1) then
     Loteado := True
  else
     Loteado := False;
  if (xArticuloABIERTO.AsInteger = 1) then
     Escandallo := True
  else
     Escandallo := False;
  if (Escandallo) then
  begin
     QEscandallo.Close;
     QEscandallo.Params.ByName['EMPRESA'].AsInteger := Empresa;
     QEscandallo.Params.ByName['ARTICULO'].AsString := Articulo;
     QEscandallo.Open;
  end;
end;

end.
