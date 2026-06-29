unit UDMNumerosDeSerieMOEKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMNumerosDeSerieMOEKri = class(TDataModule)
     DSAsignado: TDataSource;
     TLocal: THYTransaction;
     xAsignado: TFIBDataSetRO;
     xArticulo: TFIBDataSetRO;
     xArticuloTITULO: TFIBStringField;
     xArticuloABIERTO: TIntegerField;
     xArticuloSERIALIZADO_KRI: TIntegerField;
     QEscandallo: TFIBDataSetRO;
     QEscandalloDETALLE: TFIBStringField;
     QEscandalloCANTIDAD: TFloatField;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     QBorraSerieAnt: TFIBQuery;
     xAsignadoID: TIntegerField;
     xAsignadoEMPRESA: TIntegerField;
     xAsignadoARTICULO: TFIBStringField;
     xAsignadoNRO_SERIE: TFIBStringField;
     QInsertaNroSerie: TFIBQuery;
     TCommit: THYTransaction;
     QBorraNroSerie: TFIBQuery;
     procedure DataModuleDestroy(Sender: TObject);
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
     Canal: integer;
     Serie: string;
     rig: integer;
     Articulo: string;
     Almacen: string;
     Fecha: TDateTime;
     Linea: integer;
     procedure Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
     procedure InsertaNroSerie(NroSerie: string);
     procedure BorraNroSerie;
     procedure Refresca;
  end;

var
  DMNumerosDeSerieMOEKri : TDMNumerosDeSerieMOEKri;

implementation

{$R *.dfm}

procedure TDMNumerosDeSerieMOEKri.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
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
        QBorraSerieAnt.Params.ByName['CANAL'].AsInteger := Canal;
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

procedure TDMNumerosDeSerieMOEKri.InsertaNroSerie(NroSerie: string);
begin
  with QInsertaNroSerie do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['RIG'].AsInteger := RIG;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['NRO_SERIE'].AsString := NroSerie;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['LINEA'].AsInteger := Linea;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     ExecQuery;
     Transaction.Commit;
  end;
  Refresca;
end;

procedure TDMNumerosDeSerieMOEKri.Refresca;
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
  Asignados := xAsignado.RecordCount;
  SinAsignar := Cantidad - Asignados;
end;

procedure TDMNumerosDeSerieMOEKri.BorraNroSerie;
begin
  with QBorraNroSerie do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['ID'].AsInteger := xAsignadoID.AsInteger;
     ExecQuery;
     Transaction.Commit;
  end;
  Refresca;
end;

procedure TDMNumerosDeSerieMOEKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TCommit.InTransaction) then
     TCommit.Commit;
end;

procedure TDMNumerosDeSerieMOEKri.xArticuloAfterOpen(DataSet: TDataSet);
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
