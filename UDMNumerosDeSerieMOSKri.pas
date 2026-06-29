unit UDMNumerosDeSerieMOSKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBQuery;

type
  TDMNumerosDeSerieMOSKri = class(TDataModule)
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
     DSDisponible: TDataSource;
     QAsignaNroSerie: TFIBQuery;
     QSacaNroSerie: TFIBQuery;
     xDisponibleID: TIntegerField;
     xDisponibleEMPRESA: TIntegerField;
     xDisponibleARTICULO: TFIBStringField;
     xDisponibleNRO_SERIE: TFIBStringField;
     QBorraSerieAnt: TFIBQuery;
     xDisponibleALMACEN: TFIBStringField;
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
     procedure Refresca;
     procedure AsignaNroSerie;
     procedure SacaNroSerie;
  end;

var
  DMNumerosDeSerieMOSKri : TDMNumerosDeSerieMOSKri;

implementation

{$R *.dfm}

procedure TDMNumerosDeSerieMOSKri.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
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

procedure TDMNumerosDeSerieMOSKri.Refresca;
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
  if (not xDisponible.Transaction.InTransaction) then
     xDisponible.Transaction.StartTransaction;
  xDisponible.Close;
  xDisponible.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xDisponible.Params.ByName['ARTICULO'].AsString := Articulo;
  xDisponible.Params.ByName['ALMACEN'].AsString := Almacen;
  xDisponible.Open;
end;

procedure TDMNumerosDeSerieMOSKri.AsignaNroSerie;
begin
  if (not QAsignaNroSerie.Transaction.InTransaction) then
     QAsignaNroSerie.Transaction.StartTransaction;
  QAsignaNroSerie.Params.ByName['ID'].AsInteger := xDisponibleID.AsInteger;
  QAsignaNroSerie.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QAsignaNroSerie.Params.ByName['CANAL'].AsInteger := Canal;
  QAsignaNroSerie.Params.ByName['SERIE'].AsString := Serie;
  QAsignaNroSerie.Params.ByName['RIG'].AsInteger := Rig;
  QAsignaNroSerie.Params.ByName['LINEA'].AsInteger := Linea;
  QAsignaNroSerie.Params.ByName['ALMACEN'].AsString := Almacen;
  QAsignaNroSerie.Params.ByName['FECHA'].AsDateTime := Fecha;
  QAsignaNroSerie.ExecQuery;
  QAsignaNroSerie.Transaction.Commit;
  Refresca;
end;

procedure TDMNumerosDeSerieMOSKri.SacaNroSerie;
begin
  if (not QSacaNroSerie.Transaction.InTransaction) then
     QSacaNroSerie.Transaction.StartTransaction;
  QSacaNroSerie.Params.ByName['ID'].AsInteger := xAsignadoID.AsInteger;
  QSacaNroSerie.ExecQuery;
  QSacaNroSerie.Transaction.Commit;
  Refresca;
end;

procedure TDMNumerosDeSerieMOSKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TCommit.InTransaction) then
     TCommit.Commit;
end;

procedure TDMNumerosDeSerieMOSKri.xArticuloAfterOpen(DataSet: TDataSet);
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
