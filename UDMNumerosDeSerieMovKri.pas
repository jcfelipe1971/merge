unit UDMNumerosDeSerieMovKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, FIBDataSetRO, FIBTableDataSetRO, FIBDataSet, FIBQuery,
  HYFIBQuery, UFIBModificados;

type
  TDMNumerosDeSerieMovKri = class(TDataModule)
     TLocal: THYTransaction;
     TCommit: THYTransaction;
     xArticulo: TFIBDataSetRO;
     xArticuloTITULO: TFIBStringField;
     xArticuloABIERTO: TIntegerField;
     xArticuloSERIALIZADO_KRI: TIntegerField;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     QEscandallo: TFIBDataSetRO;
     QEscandalloDETALLE: TFIBStringField;
     QEscandalloCANTIDAD: TFloatField;
     xAsignado: TFIBDataSetRO;
     xAsignadoID: TIntegerField;
     xAsignadoEMPRESA: TIntegerField;
     xAsignadoARTICULO: TFIBStringField;
     xAsignadoNRO_SERIE: TFIBStringField;
     DSAsignado: TDataSource;
     xDisponible: TFIBDataSetRO;
     xDisponibleID: TIntegerField;
     xDisponibleEMPRESA: TIntegerField;
     xDisponibleARTICULO: TFIBStringField;
     xDisponibleNRO_SERIE: TFIBStringField;
     DSDisponible: TDataSource;
     QAsignaNroSerie: TFIBQuery;
     QSacaNroSerie: TFIBQuery;
     QBorraSerieAnt: TFIBQuery;
     xDisponibleALMACEN: TFIBStringField;
     xAsignadoALMACEN: TFIBStringField;
     procedure DMNumerosDeSerieMovKriDestroy(Sender: TObject);
     procedure xArticuloAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     Escandallo: boolean;
     Serializado: boolean;
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
     procedure AsignaNroSerie;
     procedure SacaNroSerie;
  end;

var
  DMNumerosDeSerieMovKri : TDMNumerosDeSerieMovKri;

implementation

{$R *.DFM}

procedure TDMNumerosDeSerieMovKri.Inicializa(emp: integer; eje: integer; canO, canD: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; almO, almD: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
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
     if (QArticuloAnteriorARTICULO.AsString <> Articulo) then
     begin
        if (not QBorraSerieAnt.Transaction.InTransaction) then
           QBorraSerieAnt.Transaction.StartTransaction;
        QBorraSerieAnt.Close;
        QBorraSerieAnt.Params.ByName['EMPRESA'].AsInteger := Empresa;
        QBorraSerieAnt.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        QBorraSerieAnt.Params.ByName['CANAL'].AsInteger := CanalOrigen;
        QBorraSerieAnt.Params.ByName['SERIE'].AsString := Serie;
        QBorraSerieAnt.Params.ByName['RIG'].AsInteger := Rig;
        QBorraSerieAnt.Params.ByName['LINEA'].AsInteger := Linea;
        QBorraSerieAnt.ExecQuery;
        QBorraSerieAnt.Transaction.Commit;
     end;
  end;
  if (not xArticulo.Transaction.InTransaction) then
     xArticulo.Transaction.StartTransaction;
  xArticulo.Close;
  xArticulo.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xArticulo.Params.ByName['ARTICULO'].AsString := Articulo;
  xArticulo.Open;
  Serializado := False;
  if (xArticuloSERIALIZADO_KRI.AsInteger = 1) then
     Serializado := True;
  Refresca;
end;

procedure TDMNumerosDeSerieMovKri.Refresca;
begin
  with xAsignado do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalOrigen;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
     Asignados := RecordCount;
     SinAsignar := Cantidad - Asignados;
  end;
  with xDisponible do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['CANAL_MOV'].AsInteger := CanalOrigen;
     Params.ByName['ALMACEN_ORI_MOV'].AsString := AlmacenOrigen;
     Open;
  end;
end;

procedure TDMNumerosDeSerieMovKri.AsignaNroSerie;
begin
  with QAsignaNroSerie do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Params.ByName['ID'].AsInteger := xDisponibleID.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalOrigen;
     Params.ByName['CANAL_DST'].AsInteger := CanalDestino;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['LINEA'].AsInteger := Linea;
     Params.ByName['ALMACEN_ORI_MOV'].AsString := AlmacenOrigen;
     Params.ByName['ALMACEN_DEST_MOV'].AsString := AlmacenDestino;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     ExecQuery;
     Transaction.Commit;
  end;
  Refresca;
end;

procedure TDMNumerosDeSerieMovKri.SacaNroSerie;
begin
  with QSacaNroSerie do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Params.ByName['ID'].AsInteger := xAsignadoID.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalOrigen;
     Params.ByName['CANAL_DST'].AsInteger := CanalDestino;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['LINEA'].AsInteger := Linea;
     Params.ByName['ALMACEN_ORI_MOV'].AsString := AlmacenOrigen;
     Params.ByName['ALMACEN_DEST_MOV'].AsString := AlmacenDestino;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     ExecQuery;
     Transaction.Commit;
  end;
  Refresca;
end;

procedure TDMNumerosDeSerieMovKri.DMNumerosDeSerieMovKriDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TCommit.InTransaction) then
     TCommit.Commit;
end;

procedure TDMNumerosDeSerieMovKri.xArticuloAfterOpen(DataSet: TDataSet);
begin
  Titulo := xArticuloTITULO.AsString;
  if (xArticuloSERIALIZADO_KRI.AsInteger = 1) then
     Serializado := True
  else
     Serializado := False;
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
