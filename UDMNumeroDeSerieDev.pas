unit UDMNumeroDeSerieDev;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMNumeroDeSerieDev = class(TDataModule)
     DSDevuelto: TDataSource;
     DSAsignado: TDataSource;
     TLocal: THYTransaction;
     xDevuelto: TFIBDataSetRO;
     xAsignado: TFIBDataSetRO;
     xDevueltoID: TIntegerField;
     xDevueltoNRO_SERIE: TFIBStringField;
     xAsignadoID: TIntegerField;
     xAsignadoEMPRESA: TIntegerField;
     xAsignadoARTICULO: TFIBStringField;
     xAsignadoNRO_SERIE: TFIBStringField;
     xAsignadoEJERCICIO_SAL: TIntegerField;
     xAsignadoCANAL_SAL: TIntegerField;
     xAsignadoSERIE_SAL: TFIBStringField;
     xAsignadoLINEA_SAL: TIntegerField;
     xAsignadoFECHA_SAL: TDateTimeField;
     xAsignadoRIG_SAL: TIntegerField;
     SPDevuelve: TFIBQuery;
     TDevolucion: TFIBTransaction;
     xArticulo: TFIBDataSetRO;
     SPDesDevuelve: TFIBQuery;
     xArticuloTITULO: TFIBStringField;
     xArticuloABIERTO: TIntegerField;
     QEscandallo: TFIBDataSetRO;
     QEscandalloDETALLE: TFIBStringField;
     QEscandalloCANTIDAD: TFloatField;
     QCantidadDevueltos: TFIBQuery;
     xArticuloSERIALIZADO_KRI: TIntegerField;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     ID_a_Borrar: TFIBDataSetRO;
     ID_a_BorrarID: TIntegerField;
     procedure xArticuloAfterOpen(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Articulo: string;
     Titulo: string;
     Empresa: integer;
     Ejercicio: integer;
     Canal: integer;
     Serie: string;
     rig: integer;
     Linea: integer;
     Almacen: string;
     Fecha: TDateTime;
     Serializado: boolean;
     Escandallo: boolean;
     Devolucion: integer;
     Asignados: integer;
     Cantidad: integer;
     Cliente: integer;
     procedure Devuelve;
     procedure DesDevuelve;
     procedure Refresca;
     procedure Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
  end;

var
  DMNumeroDeSerieDev : TDMNumeroDeSerieDev;

implementation

{$R *.dfm}

procedure TDMNumeroDeSerieDev.Devuelve;
begin
  if (not xAsignado.IsEmpty) then
  begin
     if not SPDevuelve.Transaction.InTransaction then
        SPDevuelve.Transaction.StartTransaction;
     SPDevuelve.Params.ByName['ID'].AsInteger := xAsignadoID.AsInteger;
     SPDevuelve.Params.ByName['EJERCICIO_DEV'].AsInteger := ejercicio;
     SPDevuelve.Params.ByName['CANAL_DEV'].AsInteger := canal;
     SPDevuelve.Params.ByName['SERIE_DEV'].AsString := serie;
     SPDevuelve.Params.ByName['RIG_DEV'].AsInteger := rig;
     SPDevuelve.Params.ByName['LINEA_DEV'].AsInteger := linea;
     SPDevuelve.Params.ByName['ALMACEN_DEV'].AsString := almacen;
     SPDevuelve.Params.ByName['FECHA_DEV'].AsDateTime := fecha;
     SPDevuelve.ExecQuery;
     SPDevuelve.Transaction.Commit;
     Refresca;
  end;
end;

procedure TDMNumeroDeSerieDev.DesDevuelve;
begin
  if (not xDevuelto.IsEmpty) then
  begin
     if not SPDesDevuelve.Transaction.InTransaction then
        SPDesDevuelve.Transaction.StartTransaction;
     SPDesDevuelve.Params.ByName['ID'].AsInteger := xDevueltoID.AsInteger;
     SPDesDevuelve.Params.ByName['EJERCICIO_DEV'].AsInteger := ejercicio;
     SPDesDevuelve.Params.ByName['CANAL_DEV'].AsInteger := canal;
     SPDesDevuelve.Params.ByName['SERIE_DEV'].AsString := serie;
     SPDesDevuelve.Params.ByName['RIG_DEV'].AsInteger := rig;
     SPDesDevuelve.Params.ByName['LINEA_DEV'].AsInteger := linea;
     SPDesDevuelve.Params.ByName['ALMACEN_DEV'].AsString := almacen;
     SPDesDevuelve.Params.ByName['FECHA_DEV'].AsDateTime := fecha;
     SPDesDevuelve.ExecQuery;
     SPDesDevuelve.Transaction.Commit;
     Refresca;
  end;
end;

procedure TDMNumeroDeSerieDev.Refresca;
begin
  xAsignado.Close;
  xAsignado.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xAsignado.Params.ByName['ARTICULO'].AsString := Articulo;
  xAsignado.Params.ByName['CLIENTE'].AsInteger := Cliente;
  xAsignado.Open;
  xDevuelto.Close;
  xDevuelto.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xDevuelto.Params.ByName['ARTICULO'].AsString := Articulo;
  xDevuelto.Params.ByName['EJERCICIO_DEV'].AsInteger := Ejercicio;
  xDevuelto.Params.ByName['CANAL_DEV'].AsInteger := Canal;
  xDevuelto.Params.ByName['SERIE_DEV'].AsString := Serie;
  xDevuelto.Params.ByName['RIG_DEV'].AsInteger := Rig;
  xDevuelto.Params.ByName['LINEA_DEV'].AsInteger := Linea;
  xDevuelto.Open;
  QCantidadDevueltos.Close;
  QCantidadDevueltos.Params.ByName['EMPRESA'].AsInteger := empresa;
  QCantidadDevueltos.Params.ByName['ARTICULO'].AsString := articulo;
  QCantidadDevueltos.Params.ByName['EJERCICIO_DEV'].AsInteger := ejercicio;
  QCantidadDevueltos.Params.ByName['CANAL_DEV'].AsInteger := canal;
  QCantidadDevueltos.Params.ByName['SERIE_DEV'].AsString := serie;
  QCantidadDevueltos.Params.ByName['RIG_DEV'].AsInteger := rig;
  QCantidadDevueltos.Params.ByName['LINEA_DEV'].AsInteger := linea;
  QCantidadDevueltos.ExecQuery;
  QCantidadDevueltos.Transaction.Commitretaining;
  Devolucion := QCantidadDevueltos.FieldByName['COUNT'].AsInteger;
  Asignados := (-1) * Cantidad - Devolucion;
end;

procedure TDMNumeroDeSerieDev.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
begin
  articulo := art;
  empresa := emp;
  ejercicio := eje;
  canal := can;
  serie := ser;
  rig := ri;
  linea := lin;
  almacen := alm;
  fecha := fec;
  Cantidad := cant;
  Cliente := cli;

  if (not VieneDeEsc) then
  begin
     if (not QArticuloAnterior.Transaction.InTransaction) then
        QArticuloAnterior.Transaction.StartTransaction;
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
        if (not ID_a_Borrar.Transaction.InTransaction) then
           ID_a_Borrar.Transaction.StartTransaction;
        ID_a_Borrar.Close;
        ID_a_Borrar.Params.ByName['EMPRESA'].AsInteger := Empresa;
        ID_a_Borrar.Params.ByName['ARTICULO'].AsString :=
           QArticuloAnteriorARTICULO.AsString;
        ID_a_Borrar.Params.ByName['EJERCICIO_DEV'].AsInteger := Ejercicio;
        ID_a_Borrar.Params.ByName['CANAL_DEV'].AsInteger := Canal;
        ID_a_Borrar.Params.ByName['SERIE_DEV'].AsString := Serie;
        ID_a_Borrar.Params.ByName['RIG_DEV'].AsInteger := Rig;
        ID_a_Borrar.Params.ByName['LINEA_DEV'].AsInteger := Linea;
        ID_a_Borrar.Open;
        while not ID_a_Borrar.EOF do
        begin
           if (not SPDesDevuelve.Transaction.InTransaction) then
              SPDesDevuelve.Transaction.StartTransaction;
           SPDesDevuelve.Close;
           SPDesDevuelve.Params.ByName['ID'].AsInteger := ID_a_BorrarID.AsInteger;
           SPDesDevuelve.Params.ByName['EJERCICIO_DEV'].AsInteger := Ejercicio;
           SPDesDevuelve.Params.ByName['CANAL_DEV'].AsInteger := Canal;
           SPDesDevuelve.Params.ByName['SERIE_DEV'].AsString := Serie;
           SPDesDevuelve.Params.ByName['RIG_DEV'].AsInteger := Rig;
           SPDesDevuelve.Params.ByName['LINEA_DEV'].AsInteger := Linea;
           SPDesDevuelve.Params.ByName['ALMACEN_DEV'].AsString := '   ';
           SPDesDevuelve.Params.ByName['FECHA_DEV'].AsDateTime := Now;
           SPDesDevuelve.ExecQuery;
           SPDesDevuelve.Transaction.Commit;
           ID_a_Borrar.Next;
        end;
     end;
  end;

  if not xArticulo.Transaction.InTransaction then
     xArticulo.Transaction.StartTransaction;
  xArticulo.Close;
  xArticulo.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xArticulo.Params.ByName['ARTICULO'].AsString := Articulo;
  xArticulo.Open;

  Refresca;
end;

procedure TDMNumeroDeSerieDev.xArticuloAfterOpen(DataSet: TDataSet);
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

procedure TDMNumeroDeSerieDev.DataModuleDestroy(Sender: TObject);
begin
  if TLocal.InTransaction then
     TLocal.Commit;
  if TDevolucion.InTransaction then
     TDevolucion.Commit;
end;

end.
