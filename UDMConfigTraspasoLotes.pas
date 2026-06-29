unit UDMConfigTraspasoLotes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO, FIBTableDataSetRO;

type
  TDMConfigTraspasoLotes = class(TDataModule)
     TLocal: THYTransaction;
     QMConfigLotes: TFIBTableSet;
     DSQMConfigLotes: TDataSource;
     QMConfigLotesENTRADA: TIntegerField;
     QMConfigLotesID_DETALLES: TIntegerField;
     QMConfigLotesLINEA: TIntegerField;
     QMConfigLotesLOTE: TFIBStringField;
     QMConfigLotesUNIDADES: TFloatField;
     QMConfigLotesF_ENVASADO: TDateTimeField;
     QMConfigLotesF_CADUCIDAD: TDateTimeField;
     QMConfigLotesF_FABRICACION: TDateTimeField;
     QMConfigLotesALMACEN: TFIBStringField;
     QMConfigLotesARTICULO: TFIBStringField;
     QMConfigLotesSERIE: TFIBStringField;
     QMConfigLotesCLASIFICACION: TFIBStringField;
     QMConfigLotesID_A: TIntegerField;
     xLotesExistentes: TFIBTableSetRO;
     DSxLotesExistentes: TDataSource;
     QMConfigLotesTIPO: TFIBStringField;
     QMConfigLotesPROVEEDOR: TIntegerField;
     QMConfigLotesID_LOTE: TIntegerField;
     xLotesExistentesEMPRESA: TIntegerField;
     xLotesExistentesCANAL: TIntegerField;
     xLotesExistentesARTICULO: TFIBStringField;
     xLotesExistentesLOTE: TFIBStringField;
     xLotesExistentesSERIE: TFIBStringField;
     xLotesExistentesCLASIFICACION: TFIBStringField;
     xLotesExistentesF_ENVASADO: TDateTimeField;
     xLotesExistentesF_CADUCIDAD: TDateTimeField;
     xLotesExistentesF_FABRICACION: TDateTimeField;
     xLotesExistentesID_A: TIntegerField;
     xLotesExistentesAUTO_REETIQUETADO: TIntegerField;
     xLotesExistentesCODIGO: TIntegerField;
     xLotesExistentesPROVEEDOR: TIntegerField;
     xLotesExistentesID_LOTE: TIntegerField;
     xLotesExistentesALMACEN: TFIBStringField;
     xLotesExistentesSTOCK: TFloatField;
     xLotesExistentesID_UBICACION: TIntegerField;
     xLotesExistentesID_A_UBICACION: TIntegerField;
     xLotesExistentesMEDIDA1: TFloatField;
     xLotesExistentesMEDIDA2: TFloatField;
     xLotesExistentesMEDIDA3: TFloatField;
     xLotesExistentesMEDIDA4: TFloatField;
     xLotesExistentesCALLE: TFIBStringField;
     xLotesExistentesESTANTERIA: TFIBStringField;
     xLotesExistentesREPISA: TFIBStringField;
     xLotesExistentesPOSICION: TFIBStringField;
     xLotesExistentesTITULO: TFIBStringField;
     xLotesExistentesCOMPOSICION: TFIBStringField;
     xLotesExistentesGENERAL: TIntegerField;
     xUnidadesEtiquetar: TFIBTableSetRO;
     DSxUnidadesEtiquetar: TDataSource;
     xUnidadesEtiquetarTOTAL: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMConfigLotesNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMConfigLotesAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     U_Servidas, U_Totales: double;
     RIG: integer;
     Articulo, Almacen, Lote, SerieLote, clasificacion: string;
     F_Caducidad, F_Envasado, F_Fabricacion: TDateTime;
     IdDetalles: integer;
     TipoDoc: string;
     function DameUnidadesTotal: double;
     procedure QuitaErrores;
  public
     { Public declarations }
     IdA: integer;
     U_Resto: double;
     procedure FiltraLotes(IdA, Proveedor: integer; aAlmacen: string);
     procedure InsertaPrimerLote(aTipoDoc, Serie, aArticulo, aAlmacen: string; Ejercicio, Canal, aIdA, aRIG, aIdDetalles: integer; Unidades: double);
     procedure InsertaRegistro;
     procedure Cancela;
     function CompruebaSalida: boolean;
     procedure CreaLotesSegunParametro(Clasificacion: string; CantidadLotes: integer; UnidadesPorLote: double);
     procedure RefrescaUnidadesEtiquetar;
  end;

var
  DMConfigTraspasoLotes : TDMConfigTraspasoLotes;

implementation

uses UDMMain, UEntorno, UDMRecepcionPedidos, UParam, UDameDato;

{$R *.dfm}

procedure TDMConfigTraspasoLotes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  SerieLote := 'GEN';
  Clasificacion := 'GEN';
  F_Envasado := REntorno.FechaTrabSH;
  F_Caducidad := REntorno.FechaTrabSH;
  F_Fabricacion := REntorno.FechaTrabSH;

  // Establecemos las mascaras de las fechas
  QMConfigLotesF_ENVASADO.DisplayFormat := ShortDateFormat;
  QMConfigLotesF_CADUCIDAD.DisplayFormat := ShortDateFormat;
  QMConfigLotesF_FABRICACION.DisplayFormat := ShortDateFormat;
  xLotesExistentesF_ENVASADO.DisplayFormat := ShortDateFormat;
  xLotesExistentesF_CADUCIDAD.DisplayFormat := ShortDateFormat;
  xLotesExistentesF_FABRICACION.DisplayFormat := ShortDateFormat;
end;

procedure TDMConfigTraspasoLotes.InsertaPrimerLote(aTipoDoc, Serie, aArticulo, aAlmacen: string; Ejercicio, Canal, aIdA, aRIG, aIdDetalles: integer; Unidades: double);
begin
  U_Resto := Unidades;
  U_Totales := Unidades;
  U_Servidas := 0;
  Articulo := Articulo;
  IdDetalles := aIdDetalles;
  TipoDoc := aTipoDoc;
  Almacen := aAlmacen;
  IdA := aIdA;
  RIG := aRIG;

  Lote := '0';
  SerieLote := 'GEN';
  Clasificacion := 'GEN';
  F_Envasado := REntorno.FechaTrabSH;
  F_Caducidad := REntorno.FechaTrabSH;
  F_Fabricacion := REntorno.FechaTrabSH;

  with QMConfigLotes do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ID_DETALLES'].AsInteger := IdDetalles;
     Params.ByName['TIPO'].AsString := TipoDoc;
     Open;
  end;

  RefrescaUnidadesEtiquetar;
end;

procedure TDMConfigTraspasoLotes.QMConfigLotesNewRecord(DataSet: TDataSet);
var
  Linea : integer;
  aux : double;
  Lote : integer;
begin
  aux := DameUnidadesTotal;

  if (aux >= u_totales) then
     aux := u_totales;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA) ');
        SQL.Add(' FROM TMP_TRASPASO_PEDIDO_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA AND ');
        SQL.Add(' ID_DETALLES = :ID_DETALLES AND ');
        SQL.Add(' TIPO = :TIPO ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := IdDetalles;
        Params.ByName['TIPO'].AsString := TipoDoc;
        ExecQuery;
        Linea := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMConfigLotesLINEA.AsInteger := Linea;
  QMConfigLotesENTRADA.AsInteger := REntorno.Entrada;
  QMConfigLotesID_DETALLES.AsInteger := IdDetalles;
  QMConfigLotesARTICULO.AsString := Articulo;
  QMConfigLotesUNIDADES.AsFloat := U_Totales - Aux;
  QMConfigLotesTIPO.AsString := TipoDoc;
  QMConfigLotesALMACEN.AsString := Almacen;
  QMConfigLotesID_A.AsInteger := IdA;
  QMConfigLotesPROVEEDOR.AsInteger := -1;

  if ((LeeParametro('LOTEMOD001') = '3') and (TipoDoc = 'PEP')) then
  begin
     Lote := StrToIntDef(DMMain.DameLoteSiguiente(DMConfigTraspasoLotes.QMConfigLotesID_A.AsInteger, DMRecepcionPedidos.QMDetalleRIG.AsInteger, 'REG', DMRecepcionPedidos.QMDetalleID_E.AsInteger), 1);
     Lote := Lote + QMConfigLotesLINEA.AsInteger - 1;
     QMConfigLotesLOTE.AsString := IntToStr(Lote);
  end
  else
     QMConfigLotesLOTE.AsString := DMMain.DameLoteSiguiente(IdA, RIG, 'ALP');

  QMConfigLotesSERIE.AsString := SerieLote;
  QMConfigLotesCLASIFICACION.AsString := Clasificacion;
  QMConfigLotesF_ENVASADO.AsDateTime := F_Envasado;
  QMConfigLotesF_CADUCIDAD.AsDateTime := F_Caducidad;
  QMConfigLotesF_FABRICACION.AsDateTime := F_Fabricacion;
end;

procedure TDMConfigTraspasoLotes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  // DataSet.Refresh;
end;

procedure TDMConfigTraspasoLotes.FiltraLotes(IdA, Proveedor: integer; aAlmacen: string);
begin
  with xLotesExistentes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := DameArticulo(IdA);
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := aAlmacen;
     Open;
  end;
end;

procedure TDMConfigTraspasoLotes.InsertaRegistro;
begin
  QMConfigLotes.Insert;
  QMConfigLotesLOTE.AsString := xLotesExistentesLOTE.AsString;
  QMConfigLotesF_ENVASADO.AsDateTime := xLotesExistentesF_Envasado.AsDateTime;
  QMConfigLotesF_CADUCIDAD.AsDateTime := xLotesExistentesF_CADUCIDAD.AsDateTime;
  QMConfigLotesF_FABRICACION.AsDateTime := xLotesExistentesF_FABRICACION.AsDateTime;
  QMConfigLotesSERIE.AsString := xLotesExistentesSERIE.AsString;
  QMConfigLotesCLASIFICACION.AsString := xLotesExistentesCLASIFICACION.AsString;
  QMConfigLotesPROVEEDOR.AsInteger := xLotesExistentesPROVEEDOR.AsInteger;
  QMConfigLotesID_LOTE.AsInteger := xLotesExistentesID_LOTE.AsInteger;

  QMConfigLotes.Post;

  xLotesExistentes.Close;
end;

function TDMConfigTraspasoLotes.DameUnidadesTotal: double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(UNIDADES) ');
        SQL.Add(' FROM TMP_TRASPASO_PEDIDO_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA AND ');
        SQL.Add(' ID_DETALLES = :ID_DETALLES AND ');
        SQL.Add(' TIPO = :TIPO ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := IdDetalles;
        Params.ByName['TIPO'].AsString := TipoDoc;
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMConfigTraspasoLotes.CompruebaSalida: boolean;
var
  aux : double;
begin
  // Si está en edicion grabo los cambios
  if (QMConfigLotes.State in [dsEdit, dsInsert]) then
     QMConfigLotes.Post;

  aux := DameUnidadesTotal;

  if ((U_Totales < aux) or (U_Totales > aux)) then
     Result := False
  else
  begin
     Result := True;
     QuitaErrores;
  end;
end;

procedure TDMConfigTraspasoLotes.Cancela;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_TRASPASO_PEDIDO_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA AND ');
        SQL.Add(' ID_DETALLES = :ID_DETALLES AND ');
        SQL.Add(' TIPO = :TIPO ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := IdDetalles;
        Params.ByName['TIPO'].AsString := TipoDoc;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMConfigLotes.Close;
  QMConfigLotes.Open;
end;

procedure TDMConfigTraspasoLotes.QuitaErrores;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_TRASPASO_PEDIDO_LOTES ');
        SQL.Add(' SET ERROR = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA AND ');
        SQL.Add(' ID_DETALLES = :ID_DETALLES AND ');
        SQL.Add(' TIPO = :TIPO ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := IdDetalles;
        Params.ByName['TIPO'].AsString := TipoDoc;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfigTraspasoLotes.CreaLotesSegunParametro(Clasificacion: string; CantidadLotes: integer; UnidadesPorLote: double);
var
  IdLote : integer;
begin
  if ((CantidadLotes <> 0) and (UnidadesPorLote <> 0)) then
  begin
     Clasificacion := Trim(Clasificacion);

     with QMConfigLotes do
     begin
        // Last;
        // Creo tantos lotes como CantidadLotes, con la Clasificacion pasada
        while (CantidadLotes > 0) do
        begin
           Insert;
           IdLote := DMMain.CrearLote(DMRecepcionPedidos.QMDetalleID_A.AsInteger, '', Clasificacion);
           QMConfigLotesLOTE.AsString := IntToStr(IdLote);
           if (Clasificacion <> '') then
              QMConfigLotesCLASIFICACION.AsString := Clasificacion
           else
              QMConfigLotesCLASIFICACION.AsString := IntToStr(IdLote);
           QMConfigLotesUNIDADES.AsFloat := UnidadesPorLote;
           QMConfigLotesTIPO.AsString := TipoDoc;
           QMConfigLotesID_DETALLES.AsInteger := IdDetalles;

           Post;
           Dec(CantidadLotes);
        end;
     end;
  end;
end;

procedure TDMConfigTraspasoLotes.QMConfigLotesAfterPost(DataSet: TDataSet);
begin
  RefrescaUnidadesEtiquetar;

  F_Envasado := QMConfigLotesF_ENVASADO.AsDateTime;
  F_Caducidad := QMConfigLotesF_CADUCIDAD.AsDateTime;
  F_Fabricacion := QMConfigLotesF_FABRICACION.AsDateTime;
end;

procedure TDMConfigTraspasoLotes.RefrescaUnidadesEtiquetar;
begin
  // Graba(QMConfigLotes);

  with xUnidadesEtiquetar do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ID_DETALLES'].AsInteger := IdDetalles;
     Params.ByName['TIPO'].AsString := TipoDoc;
     Open;
  end;
end;

end.
