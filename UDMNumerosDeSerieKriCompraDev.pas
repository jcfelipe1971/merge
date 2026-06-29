unit UDMNumerosDeSerieKriCompraDev;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMNumerosDeSerieKriCompraDev = class(TDataModule)
     DSDevuelto: TDataSource;
     DSAsignado: TDataSource;
     TLocal: THYTransaction;
     xDevuelto: TFIBDataSetRO;
     xAsignado: TFIBDataSetRO;
     SPDevuelve: TFIBQuery;
     TDevolucion: TFIBTransaction;
     xArticulo: TFIBDataSetRO;
     xArticuloTITULO: TFIBStringField;
     xArticuloABIERTO: TIntegerField;
     xArticuloSERIALIZADO_KRI: TIntegerField;
     SPDesDevuelve: TFIBQuery;
     QEscandallo: TFIBDataSetRO;
     QEscandalloDETALLE: TFIBStringField;
     QEscandalloCANTIDAD: TFloatField;
     QCantidadDevueltos: TFIBQuery;
     QArticuloAnterior: TFIBDataSetRO;
     QArticuloAnteriorARTICULO: TFIBStringField;
     QArticuloAnteriorUNIDADES: TFloatField;
     ID_a_Borrar: TFIBDataSetRO;
     ID_a_BorrarID: TIntegerField;
     xAsignadoID: TIntegerField;
     xAsignadoEMPRESA: TIntegerField;
     xAsignadoARTICULO: TFIBStringField;
     xAsignadoNRO_SERIE: TFIBStringField;
     xAsignadoEJERCICIO_ENT: TIntegerField;
     xAsignadoCANAL_ENT: TIntegerField;
     xAsignadoSERIE_ENT: TFIBStringField;
     xAsignadoRIG_ENT: TIntegerField;
     xAsignadoLINEA_ENT: TIntegerField;
     xAsignadoFECHA_ENT: TDateTimeField;
     xDevueltoID: TIntegerField;
     xDevueltoNRO_SERIE: TFIBStringField;
     xAsignadoALMACEN_ENT: TFIBStringField;
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
     Proveedor: integer;
     procedure Devuelve;
     procedure DesDevuelve;
     procedure Refresca;
     procedure Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
  end;

var
  DMNumerosDeSerieKriCompraDev : TDMNumerosDeSerieKriCompraDev;

implementation

{$R *.dfm}

procedure TDMNumerosDeSerieKriCompraDev.Devuelve;
begin
  if (not xAsignado.IsEmpty) then
  begin
     if not SPDevuelve.Transaction.InTransaction then
        SPDevuelve.Transaction.StartTransaction;
     SPDevuelve.Params.ByName['ID'].AsInteger := xAsignadoID.AsInteger;
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

procedure TDMNumerosDeSerieKriCompraDev.DesDevuelve;
begin
  if (not xDevuelto.IsEmpty) then
  begin
     if not SPDesDevuelve.Transaction.InTransaction then
        SPDesDevuelve.Transaction.StartTransaction;
     SPDesDevuelve.Params.ByName['ID'].AsInteger := xDevueltoID.AsInteger;
     {      SPDesDevuelve.Params.ByName['EJERCICIO_DEC'].AsInteger := ejercicio;
      SPDesDevuelve.Params.ByName['CANAL_DEC'].AsInteger := canal;
      SPDesDevuelve.Params.ByName['SERIE_DEC'].AsString := serie;
      SPDesDevuelve.Params.ByName['RIG_DEC'].AsInteger := rig;
      SPDesDevuelve.Params.ByName['LINEA_DEC'].AsInteger := linea;
      SPDesDevuelve.Params.ByName['ALMACEN_DEC'].AsString := almacen;
      SPDesDevuelve.Params.ByName['FECHA_DEC'].AsDateTime := fecha;
}      SPDesDevuelve.ExecQuery;
     SPDesDevuelve.Transaction.Commit;
     Refresca;
  end;
end;

procedure TDMNumerosDeSerieKriCompraDev.Refresca;
begin
  xAsignado.Close;
  xAsignado.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xAsignado.Params.ByName['ARTICULO'].AsString := Articulo;
  xAsignado.Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
  xAsignado.Open;
  xDevuelto.Close;
  xDevuelto.Params.ByName['EMPRESA'].AsInteger := Empresa;
  xDevuelto.Params.ByName['ARTICULO'].AsString := Articulo;
  xDevuelto.Params.ByName['EJERCICIO_DEC'].AsInteger := Ejercicio;
  xDevuelto.Params.ByName['CANAL_DEC'].AsInteger := Canal;
  xDevuelto.Params.ByName['SERIE_DEC'].AsString := Serie;
  xDevuelto.Params.ByName['RIG_DEC'].AsInteger := Rig;
  xDevuelto.Params.ByName['LINEA_DEC'].AsInteger := Linea;
  xDevuelto.Open;
  QCantidadDevueltos.Close;
  QCantidadDevueltos.Params.ByName['EMPRESA'].AsInteger := empresa;
  QCantidadDevueltos.Params.ByName['ARTICULO'].AsString := articulo;
  QCantidadDevueltos.Params.ByName['EJERCICIO_DEC'].AsInteger := ejercicio;
  QCantidadDevueltos.Params.ByName['CANAL_DEC'].AsInteger := canal;
  QCantidadDevueltos.Params.ByName['SERIE_DEC'].AsString := serie;
  QCantidadDevueltos.Params.ByName['RIG_DEC'].AsInteger := rig;
  QCantidadDevueltos.Params.ByName['LINEA_DEC'].AsInteger := linea;
  QCantidadDevueltos.ExecQuery;
  QCantidadDevueltos.Transaction.Commitretaining;
  Devolucion := QCantidadDevueltos.FieldByName['COUNT'].AsInteger;
  Asignados := (-1) * Cantidad - Devolucion;
end;

procedure TDMNumerosDeSerieKriCompraDev.Inicializa(emp: integer; eje: integer; can: integer; ser: string; ri: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; VieneDeEsc: boolean; ForzarEntrada: boolean);
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
  Proveedor := pro;

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
        ID_a_Borrar.Params.ByName['EJERCICIO_DEC'].AsInteger := Ejercicio;
        ID_a_Borrar.Params.ByName['CANAL_DEC'].AsInteger := Canal;
        ID_a_Borrar.Params.ByName['SERIE_DEC'].AsString := Serie;
        ID_a_Borrar.Params.ByName['RIG_DEC'].AsInteger := Rig;
        ID_a_Borrar.Params.ByName['LINEA_DEC'].AsInteger := Linea;
        ID_a_Borrar.Open;
        while not ID_a_Borrar.EOF do
        begin
           if (not SPDesDevuelve.Transaction.InTransaction) then
              SPDesDevuelve.Transaction.StartTransaction;
           SPDesDevuelve.Close;
           SPDesDevuelve.Params.ByName['ID'].AsInteger := ID_a_BorrarID.AsInteger;
           SPDesDevuelve.Params.ByName['EJERCICIO_DEC'].AsInteger := Ejercicio;
           SPDesDevuelve.Params.ByName['CANAL_DEC'].AsInteger := Canal;
           SPDesDevuelve.Params.ByName['SERIE_DEC'].AsString := Serie;
           SPDesDevuelve.Params.ByName['RIG_DEC'].AsInteger := Rig;
           SPDesDevuelve.Params.ByName['LINEA_DEC'].AsInteger := Linea;
           SPDesDevuelve.Params.ByName['ALMACEN_DEC'].AsString := '   ';
           SPDesDevuelve.Params.ByName['FECHA_DEC'].AsDateTime := Now;
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

procedure TDMNumerosDeSerieKriCompraDev.xArticuloAfterOpen(DataSet: TDataSet);
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

procedure TDMNumerosDeSerieKriCompraDev.DataModuleDestroy(Sender: TObject);
begin
  if TLocal.InTransaction then
     TLocal.Commit;
  if TDevolucion.InTransaction then
     TDevolucion.Commit;
end;

end.
