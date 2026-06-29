unit UDMLotesVentaKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, DB, FIBQuery, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMLotesVentaKri = class(TDataModule)
     TLocal: THYTransaction;
     TGeneral: THYTransaction;
     QArticulo: TFIBDataSetRO;
     QArticuloTITULO: TFIBStringField;
     QArticuloLOTES_KRI: TIntegerField;
     QArticuloABIERTO: TIntegerField;
     QEscandallo: TFIBDataSetRO;
     QEscandalloDETALLE: TFIBStringField;
     QBorraLoteAnt: TFIBQuery;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     QLotesDisponibles: TFIBDataSetRO;
     DSQLotesDisponibles: TDataSource;
     QAsignar: TFIBQuery;
     QDesAsignar: TFIBQuery;
     QAsignados: TFIBQuery;
     DSQLotesAsignados: TDataSource;
     QLotesAsignados: TFIBDataSetRO;
     QAAsignar: TFIBDataSetRO;
     QAAsignarID: TIntegerField;
     QLotesAsignadosCOUNT: TIntegerField;
     QLotesAsignadosEMPRESA: TIntegerField;
     QLotesAsignadosARTICULO: TFIBStringField;
     QLotesAsignadosEJERCICIO_SAL: TIntegerField;
     QLotesAsignadosCANAL_SAL: TIntegerField;
     QLotesAsignadosSERIE_SAL: TFIBStringField;
     QLotesAsignadosRIG_SAL: TIntegerField;
     QLotesAsignadosLINEA_SAL: TIntegerField;
     QLotesAsignadosLOTE: TFIBStringField;
     QLotesAsignadosCADUCIDAD: TDateTimeField;
     QEscandalloCANTIDAD: TFloatField;
     QLotesDisponiblesCOUNT: TIntegerField;
     QLotesDisponiblesEMPRESA: TIntegerField;
     QLotesDisponiblesARTICULO: TFIBStringField;
     QLotesDisponiblesEJERCICIO_ENT: TIntegerField;
     QLotesDisponiblesCANAL_ENT: TIntegerField;
     QLotesDisponiblesSERIE_ENT: TFIBStringField;
     QLotesDisponiblesRIG_ENT: TIntegerField;
     QLotesDisponiblesLINEA_ENT: TIntegerField;
     QLotesDisponiblesLOTE: TFIBStringField;
     QLotesDisponiblesCADUCIDAD: TDateTimeField;
     QLotesDisponiblesALMACEN_ENT: TFIBStringField;
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
     Cliente: integer;
     Linea: integer;
     procedure Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
     procedure Asignar(Cant: integer);
     procedure DesAsignar;
  end;

var
  DMLotesVentaKri : TDMLotesVentaKri;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMLotesVentaKri.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
begin
  empresa := emp;
  ejercicio := eje;
  canal := can;
  serie := ser;
  rig := ri;
  linea := lin;
  articulo := art;
  almacen := alm;
  cliente := cli;
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
     if (not QLotesAsignados.Transaction.InTransaction) then
        QLotesAsignados.Transaction.StartTransaction;
     QLotesAsignados.Close;
     QLotesAsignados.Params.ByName['EMPRESA'].AsInteger := Empresa;
     QLotesAsignados.Params.ByName['ARTICULO'].AsString := Articulo;
     QLotesAsignados.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     QLotesAsignados.Params.ByName['CANAL'].AsInteger := Canal;
     QLotesAsignados.Params.ByName['SERIE'].AsString := Serie;
     QLotesAsignados.Params.ByName['RIG'].AsInteger := Rig;
     QLotesAsignados.Params.ByName['LINEA'].AsInteger := Linea;
     QLotesAsignados.Open;
     if (not QLotesDisponibles.Transaction.InTransaction) then
        QLotesDisponibles.Transaction.StartTransaction;
     QLotesDisponibles.Close;
     QLotesDisponibles.Params.ByName['EMPRESA'].AsInteger := Empresa;
     QLotesDisponibles.Params.ByName['ARTICULO'].AsString := Articulo;
     QLotesDisponibles.Params.ByName['CANAL'].AsInteger := Canal;
     QLotesDisponibles.Open;
  end
  else
     SinAsignar := 0;
end;

procedure TDMLotesVentaKri.QArticuloAfterOpen(DataSet: TDataSet);
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

procedure TDMLotesVentaKri.DataModuleCreate(Sender: TObject);
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
  if (not TGeneral.InTransaction) then
     TGeneral.StartTransaction;
end;

procedure TDMLotesVentaKri.Asignar(Cant: integer);
begin
  QAAsignar.Close;
  QAAsignar.Params.ByName['EMPRESA'].AsInteger := QLotesDisponiblesEMPRESA.AsInteger;
  QAAsignar.Params.ByName['ARTICULO'].AsString := QLotesDisponiblesARTICULO.AsString;
  QAAsignar.Params.ByName['CANAL'].AsInteger := QLotesDisponiblesCANAL_ENT.AsInteger;
  QAAsignar.Params.ByName['ALMACEN'].AsString := QLotesDisponiblesALMACEN_ENT.AsString;
  QAAsignar.Params.ByName['LOTE'].AsString := QLotesDisponiblesLOTE.AsString;
  QAAsignar.Open;
  while ((not QAAsignar.EOF) and (Cant > 0)) do
  begin
     QAsignar.Close;
     QAsignar.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     QAsignar.Params.ByName['CANAL'].AsInteger := Canal;
     QAsignar.Params.ByName['SERIE'].AsString := Serie;
     QAsignar.Params.ByName['RIG'].AsInteger := Rig;
     QAsignar.Params.ByName['LINEA'].AsInteger := Linea;
     QAsignar.Params.ByName['ALMACEN'].AsString := Almacen;
     QAsignar.Params.ByName['FECHA'].AsDateTime := Fecha;
     QAsignar.Params.ByName['CLIENTE'].AsInteger := Cliente;
     QAsignar.Params.ByName['ID'].AsInteger := QAAsignarID.AsInteger;
     QAsignar.ExecQuery;
     QAsignar.Transaction.CommitRetaining;
     Dec(Cant);
     QAAsignar.Next;
  end;
  QAsignar.Transaction.Commit;
  QAsignar.Transaction.StartTransaction;
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
  QAsignados.Transaction.Commit;
  QAsignados.Transaction.StartTransaction;
  SinAsignar := Cantidad - Asignados;
  QLotesDisponibles.Close;
  QLotesDisponibles.Open;
  QLotesAsignados.Close;
  QLotesAsignados.Open;
end;

procedure TDMLotesVentaKri.DesAsignar;
begin
  QDesAsignar.Close;
  QDesAsignar.Params.ByName['EMPRESA'].AsInteger := QLotesAsignadosEMPRESA.AsInteger;
  QDesAsignar.Params.ByName['ARTICULO'].AsString := QLotesAsignadosARTICULO.AsString;
  QDesAsignar.Params.ByName['LOTE'].AsString := QLotesAsignadosLOTE.AsString;
  QDesAsignar.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QDesAsignar.Params.ByName['CANAL'].AsInteger := Canal;
  QDesAsignar.Params.ByName['SERIE'].AsString := Serie;
  QDesAsignar.Params.ByName['RIG'].AsInteger := Rig;
  QDesAsignar.Params.ByName['LINEA'].AsInteger := Linea;
  QDesAsignar.ExecQuery;
  QDesAsignar.Transaction.Commit;
  QDesAsignar.Transaction.StartTransaction;
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
  QAsignados.Transaction.Commit;
  QAsignados.Transaction.StartTransaction;
  SinAsignar := Cantidad - Asignados;
  QLotesDisponibles.Close;
  QLotesDisponibles.Open;
  QLotesAsignados.Close;
  QLotesAsignados.Open;
end;

procedure TDMLotesVentaKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TGeneral.InTransaction) then
     TGeneral.Commit;
end;

end.
