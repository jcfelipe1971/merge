unit ZUDMPedidosAAlbaran;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBDataSetRO, HYFIBQuery;

type
  TZDMPedidosAAlbaran = class(TDataModule)
     TLocal: THYTransaction;
     DSxCabecera: TDataSource;
     xCabecera: TFIBTableSet;
     DSxDetalle: TDataSource;
     xCabeceraID: TIntegerField;
     xCabeceraFECHA_SERVIR: TDateTimeField;
     xCabeceraBULTOS: TFloatField;
     xCabeceraPESO: TFloatField;
     xCabeceraRIG_ALBARAN: TIntegerField;
     xCabeceraEMPRESA: TIntegerField;
     xCabeceraEJERCICIO: TIntegerField;
     xCabeceraCANAL: TIntegerField;
     xCabeceraSERIE: TFIBStringField;
     xDetalle: TFIBTableSet;
     xDetalleID_D: TIntegerField;
     xDetalleID_C: TIntegerField;
     xDetallePEDIDO: TIntegerField;
     xDetalleBULTOS: TFloatField;
     xDetalleCOD_BARRAS: TIntegerField;
     xCabeceraCLIENTE: TIntegerField;
     xDetallePESO: TFloatField;
     xCabeceraDESC_CLIENTE: TStringField;
     xDetalleID_S: TIntegerField;
     xProcesar: TFIBDataSetRO;
     xProcesarENTRADA: TIntegerField;
     xProcesarID_S: TIntegerField;
     xProcesarID_S_D: TIntegerField;
     xProcesarEMPRESA: TIntegerField;
     xProcesarEJERCICIO: TIntegerField;
     xProcesarCANAL: TIntegerField;
     xProcesarSERIE: TFIBStringField;
     xProcesarRIG: TIntegerField;
     xProcesarSERIED: TFIBStringField;
     xProcesarRIGD: TIntegerField;
     xRecorre: TFIBDataSetRO;
     xRecorreEJERCICIODEV: TIntegerField;
     xRecorreCANALDEV: TIntegerField;
     xRecorreSERIEDEV: TFIBStringField;
     xRecorreRIG: TIntegerField;
     xRecorreID_S: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure xDetalleNewRecord(DataSet: TDataSet);
     procedure xCabeceraBeforeOpen(DataSet: TDataSet);
     procedure xCabeceraAfterScroll(DataSet: TDataSet);
     procedure xCabeceraNewRecord(DataSet: TDataSet);
     procedure xCabeceraAfterDelete(DataSet: TDataSet);
  private
     { Private declarations }
     procedure InformaNombre;
  public
     { Public declarations }
     Fecha_rec: TDateTime;
     Proceso_auto: integer;
     SerieDestino: string;
     Imprimir_portes: boolean;
     Imprimir_albaran: boolean;
     serie_pedido: string;
     procedure InsertaPedido(cod_barras: integer);
     function ExistePedido(cod_barras: integer): boolean;
     procedure InicializaTraspaso;
     procedure BorraTemporales;
     function DameMinTransportista(Cliente: integer): integer;
     procedure GeneraCabeceras(ejercicio, canal, rig, id_s: integer; serie, tipo: string; Transportista, Portes, Rango, Indice, Canal_Destino: integer; I_Portes, Por_Portes: double);
     procedure InsertaErrores(ejercicio, canal, rig: integer; serie: string);
     procedure CorrigeError(ejercicio, canal, rig, id_s: integer; serie: string);
     procedure TraspasaPedido(id_s, id_s_d: integer; tipo: string);
     procedure ActualizaPedidos(id_s, id_s_d: integer);
     procedure ZCierraPedido(id_s: integer);
     procedure InformarCliente;
     procedure RecalculaPeso;
     procedure RecalculaBultos;
     procedure AbreDocumentos(Destino, Ser: string; Contador: integer; Imprimir_portes, Imprimir_albaran, Imprimir_etiquetas: boolean; num_eti: integer);
     function HayErrores: boolean;
     procedure BorrarTablas;
     function BuscaIdSAlbaran: integer;
     procedure BorraAlbaran;
  end;

var
  ZDMPedidosAAlbaran : TZDMPedidosAAlbaran;

implementation

uses UDMMain, UFMain, UEntorno, UFBusca, UUtiles, UFormGest,
  ZUFMPedidosAAlbaran, UFMAlbaranes, UParam, UDameDato;

{$R *.dfm}

procedure TZDMPedidosAAlbaran.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xCabecera.Close;
  xCabecera.Open;
end;

procedure TZDMPedidosAAlbaran.Graba(DataSet: TDataSet);
var
  pedido : integer;
  Q : THYFIBQuery;
begin
  // comprobar que hay algún pedido a traspasar
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) PEDIDO FROM Z_PEDIDOS_A_ALBARAN_D WHERE ID_C = ?ID';
        Params.ByName['ID'].AsInteger := xCabeceraID.AsInteger;
        ExecQuery;
        pedido := FieldByName['PEDIDO'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (pedido <> 0) then
     ZFMPedidosAAlbaran.ATraspasaPedido.Execute;

  xCabecera.Refresh;
end;

procedure TZDMPedidosAAlbaran.xDetalleNewRecord(DataSet: TDataSet);
begin
  xDetalleID_C.AsInteger := xCabeceraID.AsInteger;
end;

procedure TZDMPedidosAAlbaran.xCabeceraBeforeOpen(DataSet: TDataSet);
begin
  with xCabecera do
  begin
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
  end;
end;

procedure TZDMPedidosAAlbaran.xCabeceraAfterScroll(DataSet: TDataSet);
begin
  InformaNombre;
  xDetalle.Close;
  xDetalle.Open;
end;

procedure TZDMPedidosAAlbaran.InformaNombre;
begin
  xCabeceraDESC_CLIENTE.AsString := DameTituloCliente(xCabeceraCLIENTE.AsInteger);
end;

procedure TZDMPedidosAAlbaran.xCabeceraNewRecord(DataSet: TDataSet);
begin
  xCabeceraEMPRESA.Value := REntorno.Empresa;
  xCabeceraEJERCICIO.Value := REntorno.Ejercicio;
  xCabeceraCANAL.Value := REntorno.Canal;
  xCabeceraFECHA_SERVIR.Value := REntorno.FechaTrab;
  xCabeceraBULTOS.Value := 0;
  xCabeceraPESO.Value := 0;

  // nuevo id de cabecera
  xCabeceraID.AsInteger := DMMain.ContadorGen('ID_PEDIDOS_A_ALBARAN_C');

  Xdetalle.Close;
  Xdetalle.Open;
end;

procedure TZDMPedidosAAlbaran.InsertaPedido(cod_barras: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_INSERTA_PEDIDO(?ID_CAB, ?COD_BARRAS, ?BULTOS)';
        Params.ByName['ID_CAB'].AsInteger := xCabeceraID.AsInteger;
        Params.ByName['COD_BARRAS'].AsInteger := cod_barras;
        Params.ByName['BULTOS'].AsFloat := StrToFloat(ZFMPedidosAAlbaran.LFBultos.Text);
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  xDetalle.Close;
  xDetalle.Open;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SERIE FROM GES_CABECERAS_S_PED WHERE Z_COD_BARRAS_PED = ?COD_BARRAS';
        Params.ByName['COD_BARRAS'].AsInteger := xDetalleCOD_BARRAS.AsInteger;
        ExecQuery;
        xCabeceraSERIE.AsString := FieldByName['SERIE'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TZDMPedidosAAlbaran.ExistePedido(cod_barras: integer): boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) AS NUM FROM GES_CABECERAS_S_PED WHERE Z_COD_BARRAS_PED = ?COD_BARRAS';
        Params.ByName['COD_BARRAS'].AsInteger := cod_barras;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger > 0);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.InicializaTraspaso;
var
  Q : THYFIBQuery;
begin
  BorraTemporales;

  Proceso_auto := DMMain.ContadorGen('CONTA_TMP_PROC_AUTO');

  // Actualiza la tabla a generar
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_ACTUALIZA_PEDIDO_AGRUP(?ID_CAB, ?ENTRADA)';
        Params.ByName['ID_CAB'].AsInteger := xCabeceraID.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  with xRecorre do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := xCabeceraSERIE.AsString;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     First;
  end;
end;

procedure TZDMPedidosAAlbaran.BorraTemporales;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_FACTURA_PEDIDOS WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TZDMPedidosAAlbaran.DameMinTransportista(Cliente: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TRANSPORTISTA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Result := FieldByName['TRANSPORTISTA'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.GeneraCabeceras(ejercicio, canal, rig, id_s: integer; serie, tipo: string; Transportista, Portes, Rango, Indice, Canal_Destino: integer; I_Portes, Por_Portes: double);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_PED_CLI_PROCESA_PEC ');
        SQL.Add(' (?EMPRESA, ?O_EJERCICIO, ?CANAL, ?SERIE, ?FECHA, ?ID_S, ?ENTRADA, ');
        SQL.Add(' ?TIPO_DEST, ?EJERCICIO, ?PROC_AUTO, ?TRANSPORTISTA, ?TIPO_PORTES, ');
        SQL.Add(' ?RANGO, ?INDICE, ?I_PORTES, ?POR_PORTES, ?D_CANAL, ?DIRECCION, ?FORZAR_PORTE, ');
        SQL.Add(' ?DIVIDIR_POR_DIRECCION, ?FACTURABLE, 0) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := ejercicio;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['SERIE'].AsString := serie;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO_DEST'].AsString := tipo;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['PROC_AUTO'].AsInteger := Proceso_auto;
        Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
        Params.ByName['TIPO_PORTES'].AsInteger := Portes;
        Params.ByName['RANGO'].AsInteger := Rango;
        Params.ByName['INDICE'].AsInteger := Indice;
        Params.ByName['I_PORTES'].AsFloat := I_Portes;
        Params.ByName['POR_PORTES'].AsFloat := Por_Portes;
        Params.ByName['D_CANAL'].AsInteger := Canal_destino;

        // Esto debe venir por parametros. Ver UDMAgupacionPedidosVentas
        Params.ByName['DIRECCION'].AsInteger := 0;
        Params.ByName['FORZAR_PORTE'].AsInteger := 0;
        Params.ByName['DIVIDIR_POR_DIRECCION'].AsInteger := 0;

        Params.ByName['FACTURABLE'].AsInteger := BoolToInt(LeeParametro('ALBFACT001') = 'S');
        ExecQuery;
        SerieDestino := FieldByName['SERIE_DESTINO'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.InsertaErrores(ejercicio, canal, rig: integer; serie: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     // si hi ha un error es carrega l'albarà generat i dona un error
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE INSERTA_ERRORES_AGRUP_PEC(?ENTRADA, ?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?PROC_AUTO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := ejercicio;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['SERIE'].AsString := serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['RIG'].AsInteger := rig;
        Params.ByName['PROC_AUTO'].AsInteger := Proceso_auto;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.TraspasaPedido(id_s, id_s_d: integer; tipo: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_PED_CLI_TRASPASA_PEC(?ID_S, ?ID_S_D, ?ENTRADA, ?TIPO_DEST, ?FECHA_REC, 0, 0';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['ID_S_D'].AsInteger := id_s_d;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO_DEST'].AsString := Tipo;
        Params.ByName['FECHA_REC'].AsDateTime := Fecha_rec;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.CorrigeError(ejercicio, canal, rig, id_s: integer; serie: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE BORRA_CABECERA_AGRUP_PEC(?ENTRADA, ?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?PROC_AUTO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := ejercicio;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['SERIE'].AsString := serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['RIG'].AsInteger := rig;
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['PROC_AUTO'].AsInteger := Proceso_auto;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  InsertaErrores(ejercicio, canal, rig, serie);
end;

procedure TZDMPedidosAAlbaran.ActualizaPedidos(id_s, id_s_d: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_PED_CLI_ACT_PEC(?ID_S, ?ID_S_D, ?ENTRADA, ?FECHA_REC)';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['ID_S_D'].AsInteger := id_s_d;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA_REC'].AsDateTime := Fecha_Rec;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.ZCierraPedido(id_s: integer);
var
  rig : integer;
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_CIERRA_PEDIDOS_AGRU(?ID_S)';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RIG FROM GES_CABECERAS_S WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        RIG := FieldByName['RIG'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE Z_PEDIDOS_A_ALBARAN_C SET RIG_ALBARAN = ?RIG WHERE ID = ?ID';
        Params.ByName['RIG'].AsInteger := rig;
        Params.ByName['ID'].AsInteger := xCabeceraID.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // cierra pedidos y ajusta
  // Los portes se ajustan en dmalbaranes pq se tiene que hace un edit
  // para que rellene los datos restantes de carta portes

  // se actualiza la fecha de entrega
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE Z_VER_CABECERAS_ALBARAN SET FECHA = ?FECHA WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['FECHA'].AsDateTime := xCabeceraFECHA_SERVIR.AsDateTime;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.InformarCliente;
var
  id_s : integer;
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) ID_S FROM Z_PEDIDOS_A_ALBARAN_D WHERE ID_C = ?ID_CAB';
        Params.ByName['ID_CAB'].AsInteger := xCabeceraID.AsInteger;
        ExecQuery;
        id_s := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CLIENTE FROM GES_CABECERAS_S WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        xCabeceraCLIENTE.AsString := FieldByName['CLIENTE'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  InformaNombre;
end;

procedure TZDMPedidosAAlbaran.RecalculaPeso;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(PESO) FROM Z_PEDIDOS_A_ALBARAN_D WHERE ID_C =?ID_CAB';
        Params.ByName['ID_CAB'].AsInteger := xCabeceraID.AsInteger;
        ExecQuery;
        xCabeceraPESO.AsFloat := FieldByName['SUM'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  ZFMPedidosAAlbaran.LFPeso.Text := FloatToStr(xCabeceraPESO.AsFloat);
end;

procedure TZDMPedidosAAlbaran.RecalculaBultos;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(BULTOS) FROM Z_PEDIDOS_A_ALBARAN_D WHERE ID_C =?ID_CAB';
        Params.ByName['ID_CAB'].AsInteger := xCabeceraID.AsInteger;
        ExecQuery;
        xCabeceraBULTOS.AsFloat := FieldByName['SUM'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  ZFMPedidosAAlbaran.LFBultos.Text := FloatToStr(xCabeceraBULTOS.AsFloat);
end;

procedure TZDMPedidosAAlbaran.AbreDocumentos(Destino, Ser: string; Contador: integer; Imprimir_portes, Imprimir_albaran, Imprimir_etiquetas: boolean; num_eti: integer);
begin
  if (destino = 'ALB') then
     {Esto está en FMAlbaranes}
     ZAbreImpresion(Ser, Contador, xCabeceraPESO.AsInteger,
        xCabeceraBULTOS.AsInteger, Imprimir_portes,
        Imprimir_albaran, Imprimir_etiquetas, num_eti);
end;

function TZDMPedidosAAlbaran.HayErrores: boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_ERRORES_AGRUP_PEDIDOS WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (0 < FieldByName['COUNT'].AsInteger);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.BorrarTablas;

  procedure BorraUnaTabla(Tabla: string);
  var
     Q : THYFIBQuery;
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM ' + Tabla;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

begin
  BorraUnaTabla('Z_PEDIDOS_A_ALBARAN_D');
  BorraUnaTabla('Z_PEDIDOS_A_ALBARAN_C');
end;

procedure TZDMPedidosAAlbaran.xCabeceraAfterDelete(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

function TZDMPedidosAAlbaran.BuscaIdSAlbaran: integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_S ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE  ');
        SQL.Add(' EMPRESA=?EMPRESA ');
        SQL.Add(' AND EJERCICIO=?EJERCICIO ');
        SQL.Add(' AND SERIE=?SERIE ');
        SQL.Add(' AND CANAL=?CANAL ');
        SQL.Add(' AND RIG=?RIG ');
        SQL.Add(' AND TIPO=''ALB'' ');
        Params.ByName['EMPRESA'].AsInteger := xCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xCabeceraEJERCICIO.AsInteger;
        Params.ByName['SERIE'].AsString := xCabeceraSERIE.AsString;
        Params.ByName['CANAL'].AsInteger := xCabeceraCANAL.AsInteger;
        Params.ByName['RIG'].AsInteger := xCabeceraRIG_ALBARAN.AsInteger;
        ExecQuery;
        Result := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TZDMPedidosAAlbaran.BorraAlbaran;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM VER_CABECERAS_ALBARAN  WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := xProcesarID_S_D.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
