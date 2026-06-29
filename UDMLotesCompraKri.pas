unit UDMLotesCompraKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBQuery, FIBDataSet;

type
  TDMLotesCompraKri = class(TDataModule)
     TLocal: THYTransaction;
     TGeneral: THYTransaction;
     QArticulo: TFIBDataSetRO;
     QEscandallo: TFIBDataSetRO;
     QArticuloTITULO: TFIBStringField;
     QArticuloLOTES_KRI: TIntegerField;
     QArticuloABIERTO: TIntegerField;
     QEscandalloDETALLE: TFIBStringField;
     QBorraLoteAnt: TFIBQuery;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QLotes: TFIBDataSetRO;
     QLotesCOUNT: TIntegerField;
     QLotesEMPRESA: TIntegerField;
     QLotesEJERCICIO_ENT: TIntegerField;
     QLotesCANAL_ENT: TIntegerField;
     QLotesSERIE_ENT: TFIBStringField;
     QLotesRIG_ENT: TIntegerField;
     QLotesLINEA_ENT: TIntegerField;
     QLotesLOTE: TFIBStringField;
     QLotesCADUCIDAD: TDateTimeField;
     DSQLotes: TDataSource;
     QInsertaLote: TFIBQuery;
     QBorraLote: TFIBQuery;
     QLotesARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     QAsignados: TFIBQuery;
     QEscandalloCANTIDAD: TFloatField;
     procedure QArticuloAfterOpen(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
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
     Proveedor: integer;
     Linea: integer;
     procedure Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
     procedure InsertaLote(Lote: string; Caducidad: TDateTime; Cant: integer);
     procedure BorraLote;
  end;

var
  DMLotesCompraKri : TDMLotesCompraKri;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMLotesCompraKri.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
begin
  empresa := emp;
  ejercicio := eje;
  canal := can;
  serie := ser;
  rig := ri;
  linea := lin;
  articulo := art;
  almacen := alm;
  proveedor := pro;
  cantidad := cant;
  fecha := fec;
  Asignados := 0;
  if (not VieneDeEsc) then
  begin
     QArticuloAnterior.Close;
     QArticuloAnterior.Params.ByName['EMPRESA'].AsInteger := Empresa;
     QArticuloAnterior.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     QArticuloAnterior.Params.ByName['CANAL'].AsInteger := Canal;
     QArticuloAnterior.Params.ByName['SERIE'].AsString := Serie;
     QArticuloAnterior.Params.ByName['RIG'].AsInteger := Rig;
     QArticuloAnterior.Params.ByName['LINEA'].AsInteger := Linea;
     QArticuloAnterior.Open;
     if (QArticuloAnteriorARTICULO.AsString <> Articulo) then
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
  QArticulo.Close;
  QArticulo.Params.ByName['EMPRESA'].AsInteger := Empresa;
  QArticulo.Params.ByName['ARTICULO'].AsString := Articulo;
  QArticulo.Open;
  if (not QAsignados.Transaction.InTransaction) then
     QAsignados.Transaction.StartTransaction;
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
  QAsignados.Transaction.Commit;
  QAsignados.Transaction.StartTransaction;
  if (not QLotes.Transaction.InTransaction) then
     QLotes.Transaction.StartTransaction;
  QLotes.Close;
  QLotes.Params.ByName['EMPRESA'].AsInteger := Empresa;
  QLotes.Params.ByName['ARTICULO'].AsString := Articulo;
  QLotes.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QLotes.Params.ByName['CANAL'].AsInteger := Canal;
  QLotes.Params.ByName['SERIE'].AsString := Serie;
  QLotes.Params.ByName['RIG'].AsInteger := Rig;
  QLotes.Params.ByName['LINEA'].AsInteger := Linea;
  QLotes.Open;
end;

procedure TDMLotesCompraKri.QArticuloAfterOpen(DataSet: TDataSet);
begin
  Titulo := QArticuloTITULO.AsString;
  if (QArticuloLOTES_KRI.AsInteger = 1) then
     Loteado := True
  else
     Loteado := False;
  if (QArticuloABIERTO.AsInteger = 1) then
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

procedure TDMLotesCompraKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
  if (not TGeneral.InTransaction) then
     TGeneral.StartTransaction;
end;

procedure TDMLotesCompraKri.InsertaLote(Lote: string; Caducidad: TDateTime; Cant: integer);
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
     QInsertaLote.Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     QInsertaLote.ExecQuery;
     QInsertaLote.Transaction.CommitRetaining;
  end;
  QInsertaLote.Transaction.Commit;
  QInsertaLote.Transaction.StartTransaction;

  if (not QAsignados.Transaction.InTransaction) then
     QAsignados.Transaction.StartTransaction;
  QAsignados.Params.ByName['EMPRESA'].AsInteger := Empresa;
  QAsignados.Params.ByName['ARTICULO'].AsString := Articulo;
  QAsignados.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QAsignados.Params.ByName['CANAL'].AsInteger := Canal;
  QAsignados.Params.ByName['SERIE'].AsString := Serie;
  QAsignados.Params.ByName['RIG'].AsInteger := Rig;
  QAsignados.Params.ByName['LINEA'].AsInteger := Linea;
  QAsignados.ExecQuery;
  Asignados := QAsignados.FieldByName['COUNT'].AsInteger;
  QAsignados.Transaction.Commit;
  QAsignados.Transaction.StartTransaction;

  SinAsignar := Cantidad - Asignados;

  QLotes.Close;
  QLotes.Open;
end;

procedure TDMLotesCompraKri.BorraLote;
begin
  if (not QBorraLote.Transaction.InTransaction) then
     QBorraLote.Transaction.StartTransaction;
  QBorraLote.Close;
  QBorraLote.Params.ByName['EMPRESA'].AsInteger := QLotesEMPRESA.AsInteger;
  QBorraLote.Params.ByName['ARTICULO'].AsString := QLotesARTICULO.AsString;
  QBorraLote.Params.ByName['LOTE'].AsString := QLotesLOTE.AsString;
  QBorraLote.ExecQuery;
  QBorraLote.Transaction.Commit;
  QBorraLote.Transaction.StartTransaction;
  if (not QAsignados.Transaction.InTransaction) then
     QAsignados.Transaction.StartTransaction;
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

  QAsignados.Transaction.Commit;
  QAsignados.Transaction.StartTransaction;
  QLotes.Close;
  QLotes.Open;
end;

procedure TDMLotesCompraKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TGeneral.InTransaction) then
     TGeneral.Commit;
end;

end.
