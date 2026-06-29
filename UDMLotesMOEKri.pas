unit UDMLotesMOEKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMLotesMOEKri = class(TDataModule)
     DSAsignado: TDataSource;
     TLocal: THYTransaction;
     xAsignado: TFIBDataSetRO;
     xArticulo: TFIBDataSetRO;
     xArticuloTITULO: TFIBStringField;
     xArticuloABIERTO: TIntegerField;
     QEscandallo: TFIBDataSetRO;
     QEscandalloDETALLE: TFIBStringField;
     QEscandalloCANTIDAD: TFloatField;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     QBorraLoteAnt: TFIBQuery;
     QInsertaLote: TFIBQuery;
     TCommit: THYTransaction;
     QBorraLote: TFIBQuery;
     xArticuloLOTES_KRI: TIntegerField;
     xAsignadoCOUNT: TIntegerField;
     xAsignadoEMPRESA: TIntegerField;
     xAsignadoARTICULO: TFIBStringField;
     xAsignadoEJERCICIO_MOE: TIntegerField;
     xAsignadoCANAL_MOE: TIntegerField;
     xAsignadoSERIE_MOE: TFIBStringField;
     xAsignadoRIG_MOE: TIntegerField;
     xAsignadoLINEA_MOE: TIntegerField;
     xAsignadoLOTE: TFIBStringField;
     xAsignadoCADUCIDAD: TDateTimeField;
     QAsignados: TFIBQuery;
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
     procedure InsertaLote(Lote: string; Caducidad: TDateTime; Cant: integer);
     procedure BorraLote;
     procedure Refresca;
  end;

var
  DMLotesMOEKri : TDMLotesMOEKri;

implementation

{$R *.dfm}

procedure TDMLotesMOEKri.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
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

procedure TDMLotesMOEKri.Refresca;
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
end;

procedure TDMLotesMOEKri.InsertaLote(Lote: string; Caducidad: TDateTime; Cant: integer);
var
  i : integer;
begin
  if (not QInsertaLote.Transaction.InTransaction) then
     QInsertaLote.Transaction.StartTransaction;
  for i := 1 to Cant do
  begin
     QInsertaLote.Close;
     QInsertaLote.Params.ByName['EMPRESA'].AsInteger := Empresa;
     QInsertaLote.Params.ByName['ARTICULO'].AsString := Articulo;
     QInsertaLote.Params.ByName['LOTE'].AsString := Lote;
     QInsertaLote.Params.ByName['CADUCIDAD'].AsDateTime := Caducidad;
     QInsertaLote.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     QInsertaLote.Params.ByName['CANAL'].AsInteger := Canal;
     QInsertaLote.Params.ByName['SERIE'].AsString := Serie;
     QInsertaLote.Params.ByName['RIG'].AsInteger := Rig;
     QInsertaLote.Params.ByName['LINEA'].AsInteger := Linea;
     QInsertaLote.Params.ByName['ALMACEN'].AsString := Almacen;
     QInsertaLote.Params.ByName['FECHA'].AsDateTime := Fecha;
     QInsertaLote.ExecQuery;
     QInsertaLote.Transaction.Commit;
     QInsertaLote.Transaction.StartTransaction;
  end;
  Refresca;
end;

procedure TDMLotesMOEKri.BorraLote;
begin
  with QBorraLote do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := xAsignadoEMPRESA.AsInteger;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['LOTE'].AsString := xAsignadoLOTE.AsString;
     ExecQuery;
     Transaction.Commit;
  end;
  Refresca;
end;

procedure TDMLotesMOEKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TCommit.InTransaction) then
     TCommit.Commit;
end;

procedure TDMLotesMOEKri.xArticuloAfterOpen(DataSet: TDataSet);
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
