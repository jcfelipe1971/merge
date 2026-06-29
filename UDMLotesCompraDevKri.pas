unit UDMLotesCompraDevKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMLotesCompraDevKri = class(TDataModule)
     TLocal: THYTransaction;
     TGeneral: THYTransaction;
     QArticulo: TFIBDataSetRO;
     QArticuloTITULO: TFIBStringField;
     QArticuloLOTES_KRI: TIntegerField;
     QArticuloABIERTO: TIntegerField;
     QEscandallo: TFIBDataSetRO;
     QEscandalloDETALLE: TFIBStringField;
     QEscandalloCANTIDAD: TFloatField;
     QBorraLoteAnt: TFIBQuery;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     QLotesDevueltos: TFIBDataSetRO;
     DSQLotesDevueltos: TDataSource;
     QAsignados: TFIBQuery;
     DSQLotesDisponibles: TDataSource;
     QLotesDisponibles: TFIBDataSetRO;
     SPDevuelve: TFIBQuery;
     TDevolucion: TFIBTransaction;
     SPDesDevuelve: TFIBQuery;
     QLotesDevueltosCOUNT: TIntegerField;
     QLotesDevueltosEMPRESA: TIntegerField;
     QLotesDevueltosARTICULO: TFIBStringField;
     QLotesDevueltosEJERCICIO_DEC: TIntegerField;
     QLotesDevueltosCANAL_DEC: TIntegerField;
     QLotesDevueltosSERIE_DEC: TFIBStringField;
     QLotesDevueltosRIG_DEC: TIntegerField;
     QLotesDevueltosLINEA_DEC: TIntegerField;
     QLotesDevueltosLOTE: TFIBStringField;
     QLotesDevueltosCADUCIDAD: TDateTimeField;
     QLotesDevueltosALMACEN_DEC: TFIBStringField;
     QLotesDisponiblesCOUNT: TIntegerField;
     QLotesDisponiblesEMPRESA: TIntegerField;
     QLotesDisponiblesARTICULO: TFIBStringField;
     QLotesDisponiblesEJERCICIO_DEC: TIntegerField;
     QLotesDisponiblesCANAL_DEC: TIntegerField;
     QLotesDisponiblesSERIE_DEC: TFIBStringField;
     QLotesDisponiblesRIG_DEC: TIntegerField;
     QLotesDisponiblesLINEA_DEC: TIntegerField;
     QLotesDisponiblesLOTE: TFIBStringField;
     QLotesDisponiblesCADUCIDAD: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QArticuloAfterOpen(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     procedure Refresca;
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
     procedure Devuelve(Cant: integer);
     procedure DesDevuelve(Cant: integer);
  end;

var
  DMLotesCompraDevKri : TDMLotesCompraDevKri;

implementation

{$R *.dfm}

procedure TDMLotesCompraDevKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
  if (not TGeneral.InTransaction) then
     TGeneral.StartTransaction;
end;

procedure TDMLotesCompraDevKri.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
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
  if Loteado then
  begin
     Refresca;
  end
  else
     SinAsignar := 0;
end;

procedure TDMLotesCompraDevKri.QArticuloAfterOpen(DataSet: TDataSet);
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

procedure TDMLotesCompraDevKri.Devuelve(Cant: integer);
begin
  if (not QLotesDisponibles.IsEmpty) then
  begin
     if not SPDevuelve.Transaction.InTransaction then
        SPDevuelve.Transaction.StartTransaction;
     SPDevuelve.Params.ByName['EMPRESA'].AsInteger := Empresa;
     SPDevuelve.Params.ByName['ARTICULO'].AsString := Articulo;
     SPDevuelve.Params.ByName['LOTE'].AsString := QLotesDisponiblesLOTE.AsString;
     SPDevuelve.Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     SPDevuelve.Params.ByName['CANTIDAD'].AsInteger := Cant;
     SPDevuelve.Params.ByName['EJERCICIO_DEC'].AsInteger := ejercicio;
     SPDevuelve.Params.ByName['CANAL_DEC'].AsInteger := canal;
     SPDevuelve.Params.ByName['SERIE_DEC'].AsString := serie;
     SPDevuelve.Params.ByName['RIG_DEC'].AsInteger := rig;
     SPDevuelve.Params.ByName['LINEA_DEC'].AsInteger := linea;
     SPDevuelve.Params.ByName['ALMACEN_DEC'].AsString := almacen;
     SPDevuelve.Params.ByName['FECHA_DEC'].AsDateTime := fecha;
     SPDevuelve.ExecQuery;
     SPDevuelve.Transaction.Commit;
     Refresca;
  end;
end;

procedure TDMLotesCompraDevKri.DesDevuelve(Cant: integer);
begin
  if (not QLotesDevueltos.IsEmpty) then
  begin
     if not SPDesDevuelve.Transaction.InTransaction then
        SPDesDevuelve.Transaction.StartTransaction;
     SPDesDevuelve.Close;
     SPDesDevuelve.Params.ByName['EMPRESA'].AsInteger :=
        QLotesDevueltosEMPRESA.AsInteger;
     SPDesDevuelve.Params.ByName['ARTICULO'].AsString :=
        QLotesDevueltosARTICULO.AsString;
     SPDesDevuelve.Params.ByName['LOTE'].AsString := QLotesDevueltosLOTE.AsString;
     SPDesDevuelve.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     SPDesDevuelve.Params.ByName['CANAL'].AsInteger := Canal;
     SPDesDevuelve.Params.ByName['SERIE'].AsString := Serie;
     SPDesDevuelve.Params.ByName['RIG'].AsInteger := Rig;
     SPDesDevuelve.Params.ByName['LINEA'].AsInteger := Linea;
     SPDesDevuelve.Params.ByName['CANTIDAD'].AsInteger :=
        QLotesDevueltosCOUNT.AsInteger;
     SPDesDevuelve.ExecQuery;
     SPDesDevuelve.Transaction.Commit;
     SPDesDevuelve.Transaction.StartTransaction;
     Refresca;
  end;
end;

procedure TDMLotesCompraDevKri.Refresca;
begin
  if (not QLotesDevueltos.Transaction.InTransaction) then
     QLotesDevueltos.Transaction.StartTransaction;
  QLotesDevueltos.Close;
  QLotesDevueltos.Params.ByName['EMPRESA'].AsInteger := Empresa;
  QLotesDevueltos.Params.ByName['ARTICULO'].AsString := Articulo;
  QLotesDevueltos.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QLotesDevueltos.Params.ByName['CANAL'].AsInteger := Canal;
  QLotesDevueltos.Params.ByName['SERIE'].AsString := Serie;
  QLotesDevueltos.Params.ByName['RIG'].AsInteger := Rig;
  QLotesDevueltos.Params.ByName['LINEA'].AsInteger := Linea;
  QLotesDevueltos.Open;

  if (not QLotesDisponibles.Transaction.InTransaction) then
     QLotesDisponibles.Transaction.StartTransaction;
  QLotesDisponibles.Close;
  QLotesDisponibles.Params.ByName['EMPRESA'].AsInteger := empresa;
  QLotesDisponibles.Params.ByName['ARTICULO'].AsString := articulo;
  QLotesDisponibles.Params.ByName['PROVEEDOR'].AsInteger := proveedor;
  QLotesDisponibles.Open;

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

  QAsignados.Transaction.Commitretaining;
  Asignados := QAsignados.FieldByName['COUNT'].AsInteger;
  SinAsignar := (-1) * Cantidad - Asignados;
end;

procedure TDMLotesCompraDevKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TGeneral.InTransaction) then
     TGeneral.Commit;
  if (TDevolucion.InTransaction) then
     TDevolucion.Commit;
end;

end.
