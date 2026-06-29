unit ZUDMTraspasoMultiCanalMasivo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Forms, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs, FIBDataSetRW, FIBTableDataSet;

type
  TZDMTraspasoMultiCanalMasivo = class(TDataModule)
     TLocal: THYTransaction;
     DSxRecibos: TDataSource;
     xRecibosG: TFIBDataSetRO;
     xRecibos: TFIBDataSetRO;
     DSxRecibosG: TDataSource;
     xBuscarIDDetallesDestino: TFIBDataSetRO;
     xBuscarIDDetallesDestinoID_DETALLES_S: TIntegerField;
     xBuscarIDDetallesNou: TFIBDataSetRO;
     xBuscarIDDetallesNouMAX: TIntegerField;
     xRecibosSUMA_LIQUIDO: TFloatField;
     xRecibosGCTA_PAGO: TFIBStringField;
     QSelecciona: TFIBDataSetRO;
     DSSelecciona: TDataSource;
     QSeleccionaDOC_NUMERO: TIntegerField;
     QSeleccionaID_DOC: TIntegerField;
     QSeleccionaDOC_TIPO: TFIBStringField;
     QSeleccionaTRANSPORTISTA: TIntegerField;
     QSeleccionaEMPRESA: TIntegerField;
     QSeleccionaEJERCICIO: TIntegerField;
     QSeleccionaSERIE: TFIBStringField;
     QSeleccionaCANAL: TIntegerField;
     QSeleccionaID_CARTERA: TIntegerField;
     QSeleccionaLIQUIDO: TFloatField;
     QSeleccionaFECHA: TDateTimeField;
     QSeleccionaTOTAL_A_COBRAR: TFloatField;
     xRecibosGLIQUIDO: TFloatField;
     xRecibosGAct: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     FloatField1: TFloatField;
     DSxRecibosGAct: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     function DameSentenciaSQL(Tipo: integer): string;
     // function DameTextoDoc(Tipo: integer): string;
  public
     { Public declarations }
     procedure TraspasoDocumento(D_Tipo, O_Serie, D_Serie: string; O_Canal, O_Ejercicio, D_Canal, NDoc: integer; BorraMovStock, GeneraMovStock, CierraFac, BorraDoc, GeneraPrec: byte; Porcentaje: real; fechad, fechah: TDateTime; cc: string; idRigD, idRigH: integer);
     function DameMinCanal: string;
     function DameMinSerie(Canal_EF: integer): string;
     procedure MostrarRecibos(serie_or: string; fecha_d, fecha_h: TDateTime; id_rigD, id_rigH: integer);
     function HayTraspasoHerencia(RIG, CanalDst: integer; Serie: string): integer;
     procedure ActualizaREcibosGAct(SerieOri: string; FechaD, FechaH: TDateTime; id_rig: integer);
     function BuscarID_Rig(Serie: string; RIG: integer): integer;
  end;

var
  ZDMTraspasoMultiCanalMasivo : TZDMTraspasoMultiCanalMasivo;
  valorFPtargeta : real;

implementation

uses UDMMain, UFormGest, UEntorno, UUtiles{, UFMain, UFParada};

{$R *.dfm}

procedure TZDMTraspasoMultiCanalMasivo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE   

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xRecibosSUMA_LIQUIDO.DisplayFormat := MascaraN;
  xRecibosGLIQUIDO.DisplayFormat := MascaraN;
end;

procedure TZDMTraspasoMultiCanalMasivo.TraspasoDocumento(D_Tipo, O_Serie, D_Serie: string; O_Canal, O_Ejercicio, D_Canal, NDoc: integer; BorraMovStock,     // Borrar Mov. Stock en doc. origen
  GeneraMovStock, // Generar Mov. Stock en destino
  CierraFac, // Cerrar Factura
  BorraDoc, // Borrar Doc. Origen
  GeneraPrec: byte; // Regenerar Precios del Doc. destino
  Porcentaje: real; fechad, fechah: TDateTime; cc: string; idRigD, idRigH: integer); // compte de la caixa
var
  QMulti : THYFIBQuery;
begin
  (*
  ******************************************************************************************

  APARENTEMENTE SE FILTRA POR ID_S (DESDE, HASTA)
  Esto es un ***ERROR***, ya que este campo no tiene relación con los datos. Solo identifica un registro
  Verificar que al hacer esto, no mezcle documentos de diferentes series, ejercicios, canales, etc.

  ******************************************************************************************
  *)

  QMulti := THYFIBQuery.Create(nil);
  with QMulti do
  begin
     Close;
     DataBase := DMMain.DataBase;
     QMULTI.SQL.Text := DameSentenciaSQL(NDoc);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := O_Ejercicio;
     Params.ByName['CANAL'].AsInteger := O_Canal;
     Params.ByName['SERIE_OR'].AsString := O_Serie;
     // Params.ByName['SERIE_H'].AsString := D_Serie_h;
     Params.ByName['D_ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['FECHA_D'].AsDateTime := fechad;
     Params.ByName['FECHA_H'].AsDateTime := fechah;
     Params.ByName['D_CANAL'].AsInteger := D_Canal;
     Params.ByName['D_SERIE'].AsString := D_Serie;
     Params.ByName['D_TIPO'].AsString := D_tipo;
     Params.ByName['BORRAORIGEN'].AsInteger := BorraDoc;
     if (Params.ByName['GENERA_MOV_STOCK'] <> nil) then
        Params.ByName['GENERA_MOV_STOCK'].AsInteger := GeneraMovStock;
     if (Params.ByName['BORRA_MOV_STOCK'] <> nil) then
        Params.ByName['BORRA_MOV_STOCK'].AsInteger := BorraMovStock;
     if (Params.ByName['CIERRA_FAC'] <> nil) then
        Params.ByName['CIERRA_FAC'].AsInteger := 0; // CierraFac;
     Params.ByName['GENERAR_PRECIOS'].AsInteger := GeneraPrec;
     Params.ByName['PORCENTAJE'].AsFloat := Porcentaje;
     Params.ByName['CC'].AsString := cc;
     Params.ByName['id_RigD'].AsInteger := idRigD;
     Params.ByName['id_RigH'].AsInteger := idRigH;

     // TFParada.Create(Self).ExecQuery(QMulti);
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(QMulti);
end;

function TZDMTraspasoMultiCanalMasivo.DameMinCanal: string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select min(canal) as minimo from ver_canales_activos where empresa=?empresa and ejercicio=?ejercicio and canal<>?canal';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     if (FieldByName['MINIMO'].AsInteger > 0) then
        Result := IntToStr(FieldByName['MINIMO'].AsInteger)
     else
        Result := REntorno.canalstr;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

function TZDMTraspasoMultiCanalMasivo.DameMinSerie(Canal_EF: integer): string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select min(serie) as minimo from ver_series where empresa=?empresa and ejercicio=?ejercicio and canal=?canal';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal_EF;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

function TZDMTraspasoMultiCanalMasivo.DameSentenciaSQL(Tipo: integer): string;
begin
  case Tipo of
     4: {Facturas} Result := 'execute procedure z_G_TRASPASO_FACTURA_MASIVO' +
           ' (?EMPRESA,?EJERCICIO,?CANAL,?SERIE_OR,' +
           ' ?D_ENTRADA,?FECHA_D,?FECHA_H,' +
           ' ?D_CANAL,?D_SERIE,?D_TIPO,?BORRAORIGEN,?GENERA_MOV_STOCK,' +
           ' ?BORRA_MOV_STOCK,?CIERRA_FAC,?GENERAR_PRECIOS,?PORCENTAJE,?CC,' +
           ' ?id_rigD,?id_rigH)';
  end;
end;

(*
No se utiliza
function TZDMTraspasoMultiCanalMasivo.DameTextoDoc(Tipo: integer): string;
begin
  Result := '';
  case Tipo of
     1: {Ofertras} Result := 'la oferta';
     2: {Pedidos} Result := 'el pedido';
     3: {Albaranes} Result := 'el albarán';
     4: {Facturas} Result := 'la factura';
     5: {Propuesta Prov} Result := 'la propuesta';
     6: {Propuesta Conf. Prov} Result := 'la propuesta conf.';
     7: {Pedidos Prov} Result := 'el pedido';
     8: {Albaran Prov} Result := 'el albarán';
     9: {Factura Prov} Result := 'la factura';
  end;
end;
*)

procedure TZDMTraspasoMultiCanalMasivo.MostrarRecibos(serie_or: string; fecha_d, fecha_h: TDateTime; id_rigD, id_rigH: integer);
begin
  xRecibos.Close;
  xRecibos.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xRecibos.Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
  xRecibos.Params.ByName['canal'].AsInteger := REntorno.Canal;
  xRecibos.Params.ByName['serie_or'].AsString := serie_or;
  // xRecibos.Params.ByName['serie_or'].AsString := serie_or;
  // xRecibos.Params.ByName['id_rigD'].AsInteger := id_rigD;
  // xRecibos.Params.ByName['id_rigH'].AsInteger := id_rigH;
  xRecibos.Params.ByName['fecha_d'].AsDateTime := fecha_d;
  xRecibos.Params.ByName['fecha_h'].AsDateTime := fecha_h;
  xRecibos.Open;

  xRecibosG.Close;
  xRecibosG.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xRecibosG.Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
  xRecibosG.Params.ByName['canal'].AsInteger := REntorno.Canal;
  xRecibosG.Params.ByName['serie_or'].AsString := serie_or;
  // xRecibosG.Params.ByName['serie_or'].AsString := serie_or;
  // xRecibosG.Params.ByName['id_rigD'].AsInteger := id_rigD;
  // xRecibosG.Params.ByName['id_rigH'].AsInteger := id_rigH;
  xRecibosG.Params.ByName['fecha_d'].AsDateTime := fecha_d;
  xRecibosG.Params.ByName['fecha_h'].AsDateTime := fecha_h;
  xRecibosG.Open;
end;

function TZDMTraspasoMultiCanalMasivo.HayTraspasoHerencia(RIG, CanalDst: integer; Serie: string): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM G_RELACIONES_DESTINOS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG) WHERE RCANAL = ?CANAL_DEST';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['RIG'].AsInteger := RIG;
        Params.ByName['CANAL_DEST'].AsInteger := CanalDst;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMTraspasoMultiCanalMasivo.ActualizaREcibosGAct(SerieOri: string; FechaD, FechaH: TDateTime; id_rig: integer);
begin
  with xRecibosGAct do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['serie_or'].AsString := SerieOri;
     Params.ByName['id_rig'].AsInteger := id_rig;
     Params.ByName['fecha_d'].AsDateTime := FechaD;
     Params.ByName['fecha_h'].AsDateTime := FechaH;
     Open;
  end;
end;

function TZDMTraspasoMultiCanalMasivo.BuscarID_Rig(Serie: string; RIG: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_S FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA ');
        SQL.Add(' AND EJERCICIO = ?EJERCICIO ');
        SQL.Add(' AND CANAL = ?CANAL ');
        SQL.Add(' AND SERIE = ?SERIE ');
        SQL.Add(' AND TIPO = ''FAC'' ');
        SQL.Add(' AND RIG = ?RIG ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['RIG'].AsInteger := RIG;
        ExecQuery;
        Result := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
