unit UDMLotesMOVKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, FIBQuery, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMLotesMOVKri = class(TDataModule)
     TLocal: THYTransaction;
     TCommit: THYTransaction;
     xArticulo: TFIBDataSetRO;
     xArticuloTITULO: TFIBStringField;
     xArticuloABIERTO: TIntegerField;
     xArticuloLOTES_KRI: TIntegerField;
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
     QAsignados: TFIBQuery;
     QAsignar: TFIBQuery;
     QDesAsignar: TFIBQuery;
     QAAsignar: TFIBDataSetRO;
     QAAsignarID: TIntegerField;
     xAsignadoCOUNT: TIntegerField;
     xAsignadoEMPRESA: TIntegerField;
     xAsignadoARTICULO: TFIBStringField;
     xAsignadoEJERCICIO_MOV: TIntegerField;
     xAsignadoCANAL_MOV: TIntegerField;
     xAsignadoSERIE_MOV: TFIBStringField;
     xAsignadoRIG_MOV: TIntegerField;
     xAsignadoLINEA_MOV: TIntegerField;
     xAsignadoLOTE: TFIBStringField;
     xAsignadoCADUCIDAD: TDateTimeField;
     xDisponibleCOUNT: TIntegerField;
     xDisponibleEMPRESA: TIntegerField;
     xDisponibleARTICULO: TFIBStringField;
     xDisponibleEJERCICIO_ENT: TIntegerField;
     xDisponibleCANAL_ENT: TIntegerField;
     xDisponibleSERIE_ENT: TFIBStringField;
     xDisponibleRIG_ENT: TIntegerField;
     xDisponibleLINEA_ENT: TIntegerField;
     xDisponibleLOTE: TFIBStringField;
     xDisponibleCADUCIDAD: TDateTimeField;
     xDisponibleALMACEN_ENT: TFIBStringField;
     xDisponibleF_1: TFIBStringField;
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
     CanalOrigen: integer;
     CanalDestino: integer;
     Serie: string;
     rig: integer;
     Articulo: string;
     AlmacenOrigen: string;
     AlmacenDestino: string;
     Fecha: TDateTime;
     Linea: integer;
     procedure Inicializa(emp: integer; eje: integer; canO, canD: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; almO, almD: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
     procedure Refresca;
     procedure Asignar(Cant: integer);
     procedure DesAsignar;
  end;

var
  DMLotesMOVKri : TDMLotesMOVKri;

implementation

{$R *.dfm}

procedure TDMLotesMOVKri.Inicializa(emp: integer; eje: integer; canO, canD: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; almO, almD: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
begin
  empresa := emp;
  ejercicio := eje;
  canalOrigen := canO;
  canalDestino := canD;
  serie := ser;
  rig := ri;
  linea := lin;
  articulo := art;
  almacenOrigen := almO;
  almacenDestino := almD;
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
        QBorraLoteAnt.Params.ByName['CANAL'].AsInteger := CanalOrigen;
        QBorraLoteAnt.Params.ByName['SERIE'].AsString := Serie;
        QBorraLoteAnt.Params.ByName['RIG'].AsInteger := Rig;
        QBorraLoteAnt.Params.ByName['LINEA'].AsInteger := Linea;
        QBorraLoteAnt.ExecQuery;
        QBorraLoteAnt.Transaction.Commit;
     end;
  end;
  Refresca;
end;

procedure TDMLotesMOVKri.Refresca;
begin
  if (not xAsignado.Transaction.InTransaction) then
     xAsignado.Transaction.StartTransaction;
  xAsignado.Close;
  xAsignado.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xAsignado.Params.ByName['ARTICULO'].AsString := Articulo;
  xAsignado.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  xAsignado.Params.ByName['CANAL'].AsInteger := CanalOrigen;
  xAsignado.Params.ByName['SERIE'].AsString := Serie;
  xAsignado.Params.ByName['RIG'].AsInteger := Rig;
  xAsignado.Params.ByName['LINEA'].AsInteger := Linea;
  xAsignado.Open;
  if (not xDisponible.Transaction.InTransaction) then
     xDisponible.Transaction.StartTransaction;
  xDisponible.Close;
  xDisponible.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xDisponible.Params.ByName['ARTICULO'].AsString := Articulo;
  xDisponible.Params.ByName['CANAL_MOV'].AsInteger := CanalOrigen;
  xDisponible.Params.ByName['ALMACEN_ORI_MOV'].AsString := AlmacenOrigen;
  xDisponible.Open;

  if (not QAsignados.Transaction.InTransaction) then
     QAsignados.Transaction.StartTransaction;
  QAsignados.Close;
  QAsignados.Params.ByName['EMPRESA'].AsInteger := Empresa;
  QAsignados.Params.ByName['ARTICULO'].AsString := Articulo;
  QAsignados.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QAsignados.Params.ByName['CANAL'].AsInteger := CanalOrigen;
  QAsignados.Params.ByName['SERIE'].AsString := Serie;
  QAsignados.Params.ByName['RIG'].AsInteger := Rig;
  QAsignados.Params.ByName['LINEA'].AsInteger := Linea;
  QAsignados.ExecQuery;
  Asignados := QAsignados.FieldByName['COUNT'].AsInteger;
  SinAsignar := Cantidad - Asignados;
  QAsignados.Transaction.CommitRetaining;
end;

procedure TDMLotesMOVKri.Asignar(Cant: integer);
begin
  if (not QAAsignar.Transaction.InTransaction) then
     QAAsignar.Transaction.StartTransaction;
  QAAsignar.Close;
  QAAsignar.Params.ByName['EMPRESA'].AsInteger := xDisponibleEMPRESA.AsInteger;
  QAAsignar.Params.ByName['ARTICULO'].AsString := xDisponibleARTICULO.AsString;
  QAAsignar.Params.ByName['LOTE'].AsString := xDisponibleLOTE.AsString;
  QAAsignar.Params.ByName['TIPO'].AsString := xDisponibleF_1.AsString;
  QAAsignar.Params.ByName['CANAL'].AsString := xDisponibleCANAL_ENT.AsString;
  QAAsignar.Params.ByName['ALMACEN'].AsString := xDisponibleALMACEN_ENT.AsString;
  QAAsignar.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QAAsignar.Params.ByName['CANAL'].AsInteger := CanalDestino;
  QAAsignar.Params.ByName['SERIE'].AsString := Serie;
  QAAsignar.Params.ByName['RIG'].AsInteger := Rig;
  QAAsignar.Params.ByName['LINEA'].AsInteger := Linea;
  QAAsignar.Open;
  while ((not QAAsignar.EOF) and (Cant > 0)) do
  begin
     if (not QAsignar.Transaction.InTransaction) then
        QAsignar.Transaction.StartTransaction;
     QAsignar.Close;
     QAsignar.Params.ByName['EJERCICIO_MOV'].AsInteger := Ejercicio;
     QAsignar.Params.ByName['CANAL_MOV'].AsInteger := CanalOrigen;
     QAsignar.Params.ByName['CANAL_DST_MOV'].AsInteger := CanalDestino;
     QAsignar.Params.ByName['SERIE_MOV'].AsString := Serie;
     QAsignar.Params.ByName['RIG_MOV'].AsInteger := Rig;
     QAsignar.Params.ByName['LINEA_MOV'].AsInteger := Linea;
     QAsignar.Params.ByName['ALMACEN_ORI_MOV'].AsString := AlmacenOrigen;
     QAsignar.Params.ByName['ALMACEN_DEST_MOV'].AsString := AlmacenDestino;
     QAsignar.Params.ByName['FECHA_MOV'].AsDateTime := Fecha;
     QAsignar.Params.ByName['ID'].AsInteger := QAAsignarID.AsInteger;
     QAsignar.ExecQuery;
     QAsignar.Transaction.Commit;
     Dec(Cant);
     QAAsignar.Next;
  end;
  Refresca;
end;

procedure TDMLotesMOVKri.DesAsignar;
begin
  if (not QDesAsignar.Transaction.InTransaction) then
     QDesAsignar.Transaction.StartTransaction;
  QDesAsignar.Close;
  QDesAsignar.Params.ByName['EMPRESA'].AsInteger := xAsignadoEMPRESA.AsInteger;
  QDesAsignar.Params.ByName['ARTICULO'].AsString := xAsignadoARTICULO.AsString;
  QDesAsignar.Params.ByName['LOTE'].AsString := xAsignadoLOTE.AsString;
  QDesAsignar.Params.ByName['EJERCICIO_MOV'].AsInteger := Ejercicio;
  QDesAsignar.Params.ByName['CANAL_MOV'].AsInteger := CanalOrigen;
  QDesAsignar.Params.ByName['CANAL_DST_MOV'].AsInteger := CanalDestino;
  QDesAsignar.Params.ByName['SERIE_MOV'].AsString := Serie;
  QDesAsignar.Params.ByName['RIG_MOV'].AsInteger := Rig;
  QDesAsignar.Params.ByName['LINEA_MOV'].AsInteger := Linea;
  QDesAsignar.Params.ByName['ALMACEN_ORI_MOV'].AsString := AlmacenOrigen;
  QDesAsignar.Params.ByName['ALMACEN_DEST_MOV'].AsString := AlmacenDestino;
  QDesAsignar.Params.ByName['FECHA_MOV'].AsDateTime := Fecha;
  QDesAsignar.ExecQuery;
  QDesAsignar.Transaction.Commit;
  Refresca;
end;

procedure TDMLotesMOVKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TCommit.InTransaction) then
     TCommit.Commit;
end;

procedure TDMLotesMOVKri.xArticuloAfterOpen(DataSet: TDataSet);
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
