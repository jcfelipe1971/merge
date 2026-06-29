unit UDMPonderarDocs;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB, FIBDataSetRO,
  FIBDataSet;

type
  TDMPonderarDocs = class(TDataModule)
     xAlmacen: TFIBDataSetRO;
     DSxAlmacen: TDataSource;
     xArt_Desde: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     xArt_Hasta: TFIBDataSetRO;
     DSxArt_Hasta: TDataSource;
     TLocal: THYTransaction;
     xSerie: TFIBDataSetRO;
     xSerieSERIE: TFIBStringField;
     xSerieTITULO: TFIBStringField;
     DSxSerie: TDataSource;
     QGeneral: THYFIBQuery;
     procedure DMPonderarDocsCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     MinNDoc, MaxNDoc, MinSerie, MinAlmacen: string;
     MinFecha, MaxFecha: TDateTime;
     procedure Recargar(const Tipo: string);
     procedure RefrescarAlmacen(const Almacen: string);
     procedure RefrescarSerie(const Serie: string);
     procedure RefrescarArtDesde(const Articulo: string);
     procedure RefrescarArtHasta(const Articulo: string);
     procedure Ponderar(Serie, Tipo, Almacen, ArtD, ArtH: string; FechaD, FechaH: TDateTime; DocD, DocH: integer; Modo: smallint);
  end;

var
  DMPonderarDocs : TDMPonderarDocs;

implementation

uses UEntorno, UUtiles, UFParada, UDMMain;

{$R *.DFM}

procedure TDMPonderarDocs.DMPonderarDocsCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMPonderarDocs.RefrescarAlmacen(const Almacen: string);
begin
  with xAlmacen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Open;
  end;
end;

procedure TDMPonderarDocs.RefrescarSerie(const Serie: string);
begin
  with xSerie do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMPonderarDocs.RefrescarArtDesde(const Articulo: string);
begin
  with xArt_Desde do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMPonderarDocs.RefrescarArtHasta(const Articulo: string);
begin
  with xArt_Hasta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

// Ponderar Documentos
procedure TDMPonderarDocs.Ponderar(Serie, Tipo, Almacen, ArtD, ArtH: string; FechaD, FechaH: TDateTime; DocD, DocH: integer; Modo: smallint);
var
  art_aux : string;
  fecha_aux : TDateTime;
  doc_aux : integer;
  Q : THYFIBQuery;
begin
  if (ArtD > ArtH) then
  begin
     art_aux := ArtH;
     ArtH := ArtD;
     ArtD := art_aux;
  end;

  if (FechaD > FechaH) then
  begin
     fecha_aux := FechaH;
     FechaH := FechaD;
     FechaD := fecha_aux;
  end;

  if (DocD > DocH) then
  begin
     doc_aux := DocH;
     DocH := DocD;
     DocD := doc_aux;
  end;

  FechaD := HourIntoDate(FechaD, '00:00:00');
  FechaH := HourIntoDate(FechaH, '23:59:59');

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_PONDERA_DOCS (?EMPRESA, ?CANAL, ?SERIE, ?TIPO, ?ALMACEN, ?DOC_D, ?DOC_H, ?FECHA_D, ?FECHA_H, ?ART_D, ?ART_H, ?MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['DOC_D'].AsInteger := DocD;
        Params.ByName['DOC_H'].AsInteger := DocH;
        Params.ByName['FECHA_D'].AsDateTime := FechaD;
        Params.ByName['FECHA_H'].AsDateTime := FechaH;
        Params.ByName['ART_D'].AsString := ArtD;
        Params.ByName['ART_H'].AsString := ArtH;
        Params.ByName['MODO'].AsInteger := Modo;
        TFParada.Create(Self).ExecQuery(Q);
        // ExecQuery;
        FreeHandle;
     finally
        Q.Free;
     end;
  end;
end;

procedure TDMPonderarDocs.Recargar(const Tipo: string);
begin
  with QGeneral do
  begin
     Close;
     SQL.Text := 'SELECT MIN(RIG), MAX(RIG) FROM GES_CABECERAS_S WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND TIPO = ?TIPO';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := Tipo;
     ExecQuery;
     MinNDoc := IntToStr(FieldByName['MIN'].AsInteger);
     MaxNDoc := IntToStr(FieldByName['MAX'].AsInteger);
     FreeHandle;

     Close;
     SQL.Text := 'SELECT MIN(FECHA), MAX(FECHA) FROM GES_CABECERAS_S WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND TIPO = ?TIPO';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := Tipo;
     ExecQuery;
     MinFecha := FieldByName['MIN'].AsDateTime;
     MaxFecha := FieldByName['MAX'].AsDateTime;
     FreeHandle;

     Close;
     SQL.Text := 'SELECT MIN(SERIE) FROM EMP_SERIES WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND ACTIVO = 1';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     MinSerie := FieldByName['MIN'].AsString;
     FreeHandle;

     SQL.Text := 'SELECT MIN(ALMACEN) FROM ART_ALMACENES WHERE EMPRESA = ?EMPRESA';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     MinAlmacen := FieldByName['MIN'].AsString;
     FreeHandle;
  end;
end;

end.
