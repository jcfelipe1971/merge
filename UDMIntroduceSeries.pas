unit UDMIntroduceSeries;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, Dialogs, FIBDataSetRO,
  FIBDataSetRW;

type
  TDMIntroduceSeries = class(TDataModule)
     TLocal: THYTransaction;
     QMTmpAsignar: TFIBTableSet;
     DSQMTmpAsignar: TDataSource;
     QMTmpAsignarID: TIntegerField;
     QMTmpAsignarID_DETALLES: TIntegerField;
     QMTmpAsignarLINEA: TIntegerField;
     QMTmpAsignarARTICULO: TFIBStringField;
     QMTmpAsignarUNIDADES: TFloatField;
     QMTmpAsignarNSERIE: TFIBStringField;
     xAsignados: TFIBDataSetRO;
     DSxAsignados: TDataSource;
     xComprobarAsignados: TFIBDataSetRO;
     DSxCompAsignados: TDataSource;
     xComprobarAsignadosASIGNADOS: TIntegerField;
     xDetalles: TFIBDataSetRO;
     DSxDetalles: TDataSource;
     xDetallesEMPRESA: TIntegerField;
     xDetallesCANAL: TIntegerField;
     xDetallesEJERCICIO: TIntegerField;
     xDetallesSERIE: TFIBStringField;
     xDetallesLINEA: TIntegerField;
     xDetallesRIG: TIntegerField;
     xDetallesUNIDADES: TFloatField;
     xDetallesARTICULO: TFIBStringField;
     xDetallesID_DOC: TIntegerField;
     xDetallesTIPO: TFIBStringField;
     xDetallesALMACEN: TFIBStringField;
     TUpdate: THYTransaction;
     QMArticulos: TFIBDataSetRO;
     DSArticulos: TDataSource;
     QMArticulosTIPO: TFIBStringField;
     QMArticulosARTICULO: TFIBStringField;
     QMArticulosID_DETALLES: TIntegerField;
     xAsignadosARTICULO: TFIBStringField;
     xAsignadosNSERIE: TFIBStringField;
     xAsignadosID_GDS: TIntegerField;
     QMArticulosEMPRESA: TIntegerField;
     QMArticulosEJERCICIO: TIntegerField;
     QMArticulosCANAL: TIntegerField;
     QMArticulosSERIE: TFIBStringField;
     QMArticulosTIPO1: TFIBStringField;
     QMArticulosRIG: TIntegerField;
     QMArticulosLINEA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMTmpAsignarBeforePost(DataSet: TDataSet);
     procedure QMArticulosAfterOpen(DataSet: TDataSet);
     procedure QMArticulosBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     TipoOrigen: string;
     id_detalles: integer;
  public
     { Public declarations }
     procedure BorrarContenido(id_detalles: integer);
     procedure AsignarSeries;
     function NrosSeriesAsignados: boolean;
     function ComprobarAsignados: boolean;
     procedure LlenaSeries;
     function AsignarNroSerie(NroSerie: string): boolean;
     procedure Inicializar(aid_detalles: integer; aTipo: string);
  end;

var
  DMIntroduceSeries : TDMIntroduceSeries;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMIntroduceSeries.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (Tlocal.InTransaction) then
     Tlocal.StartTransaction;
end;

procedure TDMIntroduceSeries.BorrarContenido(id_detalles: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ASIGNAR_SERIALIZACION WHERE ID_DETALLES = :ID_DETALLES';
        Params.ByName['ID_DETALLES'].AsInteger := id_detalles;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMIntroduceSeries.AsignarSeries;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE GENERA_SERIALIZACION(:TIPO, :ID_DETALLES)';
        Params.ByName['TIPO'].AsString := TipoOrigen;
        Params.ByName['ID_DETALLES'].AsInteger := id_detalles;
        ExecQuery;
        if (FieldByName['CUANTOS'].AsInteger = 0) then
           ShowMessage(_('Los números de serie ya estaban generados'));
        // else
        //    ShowMessage(Format(_('Números de serie generados/asignados: %d'), [FieldByName['CUANTOS'].AsInteger]))
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMIntroduceSeries.NrosSeriesAsignados: boolean;
begin
  /// Comprueba que todos los numeros de serie esten introducidos

  Result := True;
  QMArticulos.First;
  while (not QMArticulos.EOF) and Result do
  begin
     with QMTmpAsignar do
     begin
        First;
        while (not EOF) and Result do
        begin
           Result := (Trim(QMTmpAsignarNSERIE.AsString) <> '');
           Next;
        end;
     end;

     QMArticulos.Next;
  end;
end;

// Devuelve true si hay el mismo número de asignado que unidades el articulo
function TDMIntroduceSeries.ComprobarAsignados: boolean;
begin
  Result := False;

  // Es comproben si assignat són igual al total de registres
  with xComprobarAsignados do
  begin
     Close;
     Open;
  end;

  if (xComprobarAsignadosASIGNADOS.AsInteger = Abs(xDetallesUNIDADES.AsInteger)) then
  begin
     xAsignados.Close;
     xAsignados.Open;
     Result := True;
  end;
end;

procedure TDMIntroduceSeries.QMTmpAsignarBeforePost(DataSet: TDataSet);
begin
  // SFG.ALBERT - Es comprova si existeix el número de serie. Això es fa perquè
  // a ALP no es poden crear noves series i aquí es comprova que si no existeix
  // no farà la inserció
  if (QMTmpAsignarNSERIE.AsString <> '') then
  begin
     if ((TipoOrigen = 'ALB') or (TipoOrigen = 'MVS')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT EMPRESA FROM ART_ARTICULOS_SERIALIZACION ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' NSERIE = :NSERIE AND ');
              SQL.Add(' ARTICULO = :ARTICULO ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['NSERIE'].AsString := QMTmpAsignarNSERIE.AsString;
              Params.ByName['ARTICULO'].AsString := QMTmpAsignarARTICULO.AsString;
              ExecQuery;
              if (FieldByName['EMPRESA'].AsInteger = 0) then
              begin
                 ShowMessage(Format(_('En número de serie "%s" no existe para este artículo'), [QMTmpAsignarNSERIE.AsString]));
                 QMTmpAsignar.Cancel;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMIntroduceSeries.LlenaSeries;
begin
  // Crea registros en blanco en tabla temporal para rellenar con los nros. de serie.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE LLENA_SERIALIZACION_ART(?ID_DETALLES, ?TIPO)';
        Params.ByName['ID_DETALLES'].AsInteger := id_detalles;
        Params.ByName['TIPO'].AsString := TipoOrigen;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMTmpAsignar do
  begin
     Close;
     Open;
  end;
end;

function TDMIntroduceSeries.AsignarNroSerie(NroSerie: string): boolean;
begin
  Result := False;

  NroSerie := UpperCase(NroSerie);
  with QMTmpAsignar do
  begin
     // Busco el primer registro vacio
     DisableControls;
     try
        First;
        while ((not EOF) and (Trim(FieldByName('NSERIE').AsString) <> '')) do
           Next;
     finally
        EnableControls;
     end;

     if (not EOF) then
     begin
        Edit;
        FieldByName('NSERIE').AsString := NroSerie;
        Post;

        Result := True;
     end;
  end;
end;

procedure TDMIntroduceSeries.Inicializar(aid_detalles: integer; aTipo: string);
begin
  id_detalles := aid_detalles;
  TipoOrigen := aTipo;

  with xDetalles do
  begin
     Close;
     SelectSQL.Clear;
     // S'obtenen les dades del document origen
     if (TipoOrigen = 'ALP') then
     begin
        SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, UNIDADES, ALMACEN, ID_E AS ID_DOC ');
        SelectSQL.Add(' FROM GES_DETALLES_E ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_DETALLES_E = :ID_DETALLES AND ');
        SelectSQL.Add(' TIPO = :TIPO ');
     end
     else
     if (TipoOrigen = 'ALB') then
     begin
        SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, UNIDADES, ALMACEN, ID_S AS ID_DOC ');
        SelectSQL.Add(' FROM GES_DETALLES_S ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_DETALLES_S = :ID_DETALLES AND ');
        SelectSQL.Add(' TIPO = :TIPO ');
     end
     else
     if (TipoOrigen = 'MVE') or (TipoOrigen = 'MVS') or (TipoOrigen = 'MVT') then
     begin
        // En el caso den entrada o salida CANAL_ORI y CANAL_DST son iguales. Lo mismo sucede con ALMACEN_ORI y ALMACEN_DST
        // Si se trata de un traspaso solo nos interesa el origen, para saber cuales son los Nros de Serie disponibles.
        SelectSQL.Add(' SELECT D.EMPRESA, D.EJERCICIO, C.CANAL_ORI AS CANAL, D.SERIE, CAST(:TIPO AS VARCHAR(3)) AS TIPO, D.RIG, D.LINEA, D.ARTICULO, D.UNIDADES, C.ALMACEN_ORI AS ALMACEN, D.ID_ST AS ID_DOC ');
        SelectSQL.Add(' FROM GES_DETALLES_ST D ');
        SelectSQL.Add(' JOIN GES_CABECERAS_ST C ON D.ID_ST = C.ID_ST ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' D.ID_DETALLES_ST = :ID_DETALLES ');
        // SelectSQL.Add(' AND TIPO = :TIPO ');
     end;
     Open;
  end;

  with QMArticulos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ''ART'' AS TIPO_ART, A.ARTICULO, D.EMPRESA, D.EJERCICIO, D.SERIE, D.RIG, D.LINEA,');

     if (TipoOrigen = 'ALP') then
        SelectSQL.Add(' D.TIPO, D.CANAL, D.ID_DETALLES_E AS ID_DETALLES FROM GES_DETALLES_E D ')
     else
     if (TipoOrigen = 'ALB') then
        SelectSQL.Add(' D.TIPO, D.CANAL, D.ID_DETALLES_S AS ID_DETALLES FROM GES_DETALLES_S D ')
     else
        SelectSQL.Add(' (SELECT ''MV'' || TIPO_OPERACION FROM GES_CABECERAS_ST WHERE ID_ST = D.ID_ST) AS TIPO, (SELECT CANAL_ORI FROM GES_CABECERAS_ST WHERE ID_ST = D.ID_ST) AS CANAL, D.ID_DETALLES_ST AS ID_DETALLES FROM GES_DETALLES_ST D ');

     SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO = A.ARTICULO ');
     SelectSQL.Add(' WHERE ');

     if (TipoOrigen = 'ALP') then
        SelectSQL.Add(' D.ID_DETALLES_E = :ID_DETALLES ')
     else
     if (TipoOrigen = 'ALB') then
        SelectSQL.Add(' D.ID_DETALLES_S = :ID_DETALLES ')
     else
        SelectSQL.Add(' D.ID_DETALLES_ST = :ID_DETALLES ');

     SelectSQL.Add(' AND A.SERIALIZADO = 1 ');
     SelectSQL.Add(' UNION ');
     SelectSQL.Add(' SELECT ''ESC'' AS TIPO_ART, A.ARTICULO, D.EMPRESA, D.EJERCICIO, D.SERIE, D.RIG, D.LINEA, ');

     if (TipoOrigen = 'ALP') then
        SelectSQL.Add(' D.TIPO, D.CANAL, D.ID_DETALLES_E AS ID_DETALLES FROM GES_DETALLES_E D ')
     else
     if (TipoOrigen = 'ALB') then
        SelectSQL.Add(' D.TIPO, D.CANAL, D.ID_DETALLES_S AS ID_DETALLES FROM GES_DETALLES_S D ')
     else
        SelectSQL.Add(' (SELECT ''MV'' || TIPO_OPERACION FROM GES_CABECERAS_ST WHERE ID_ST = D.ID_ST) AS TIPO, (SELECT CANAL_ORI FROM GES_CABECERAS_ST WHERE ID_ST = D.ID_ST) AS CANAL, D.ID_DETALLES_ST AS ID_DETALLES FROM GES_DETALLES_ST D ');

     SelectSQL.Add(' JOIN ART_ARTICULOS_ESCANDALLO E ON D.EMPRESA = E.EMPRESA AND D.ARTICULO = E.ARTICULO ');
     SelectSQL.Add(' JOIN ART_ARTICULOS A ON E.EMPRESA = A.EMPRESA AND E.DETALLE = A.ARTICULO ');
     SelectSQL.Add(' WHERE ');

     if (TipoOrigen = 'ALP') then
        SelectSQL.Add(' D.ID_DETALLES_E = :ID_DETALLES ')
     else
     if (TipoOrigen = 'ALB') then
        SelectSQL.Add(' D.ID_DETALLES_S = :ID_DETALLES ')
     else
        SelectSQL.Add(' D.ID_DETALLES_ST = :ID_DETALLES ');

     SelectSQL.Add(' AND A.SERIALIZADO = 1 ');

     DMMain.Log(SelectSQL.Text);

     Params.ByName['ID_DETALLES'].AsInteger := id_detalles;
     Open;
  end;

  LlenaSeries;
end;

procedure TDMIntroduceSeries.QMArticulosAfterOpen(DataSet: TDataSet);
begin
  xDetalles.Open;
  xComprobarAsignados.Open;
  xAsignados.Open;
end;

procedure TDMIntroduceSeries.QMArticulosBeforeClose(DataSet: TDataSet);
begin
  xDetalles.Close;
  xComprobarAsignados.Close;
  xAsignados.Close;
end;

end.
