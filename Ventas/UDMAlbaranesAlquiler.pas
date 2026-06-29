unit UDMAlbaranesAlquiler;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMAlbaranes, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, UComponentesBusquedaFiltrada, FIBDataSetRO, DB, FIBDataSet,
  FIBTableDataSet, UDameDato;

type
  TDMAlbaranesAlquiler = class(TDMAlbaranes)
     QMDetalleUNIDADES_ROTAS: TIntegerField;
     QMCabeceraSERIE_ROTURAS: TFIBStringField;
     QMCabeceraID_S_FAC_ROTURAS: TIntegerField;
     QMCabeceraID_S_FAC_ALQUILER: TIntegerField;
     QMCabeceraID_ST_DEVOLUCION: TIntegerField;
     xInfoActualizadaFAC_ALQUILER: TFIBStringField;
     xInfoActualizadaFAC_ROTURAS: TFIBStringField;
     xInfoActualizadaMOV_DEVOLUCION: TFIBStringField;
     procedure DMDocsAlbaranCreate(Sender: TObject);
  private
     { Private declarations }
     SQLFind: string;
  public
     { Public declarations }
     procedure TraspasarAlbaranActual(tipo_destino: string);
     procedure BuscaNumSerie(NroSerie: string; Filtro: boolean);
     procedure FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
     procedure AgrupacionPedidos(Serie: string; Contador: integer);
     procedure FiltraPendiente(Serie, Filtro: string);
     procedure FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente: integer);
     // procedure CreaMovimientoDevolucion;
  end;

var
  DMAlbaranesAlquiler : TDMAlbaranesAlquiler;

implementation

uses UDMMain, UEntorno, UFMAlbaranesAlquiler, UUtiles, UFMFacturas;

{$R *.dfm}

procedure TDMAlbaranesAlquiler.AgrupacionPedidos(Serie: string; Contador: integer);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT VER.* FROM VER_CABECERAS_ALBARAN_ALQ VER');
     SelectSQL.Add(' JOIN TMP_PROCESOS_AUTO TMP ON ');
     SelectSQL.Add(' VER.EMPRESA=TMP.EMPRESA AND ');
     SelectSQL.Add(' VER.EJERCICIO=TMP.EJERCICIO AND ');
     SelectSQL.Add(' VER.CANAL=TMP.CANAL AND ');
     SelectSQL.Add(' VER.SERIE=TMP.SERIE AND ');
     SelectSQL.Add(' VER.TIPO=TMP.TIPO AND ');
     SelectSQL.Add(' VER.RIG=TMP.RIG ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' VER.EMPRESA=?EMPRESA AND ');
     SelectSQL.Add(' VER.EJERCICIO=?EJERCICIO AND ');
     SelectSQL.Add(' VER.CANAL=?CANAL AND ');
     SelectSQL.Add(' VER.SERIE=?SERIE AND ');
     SelectSQL.Add(' VER.TIPO=''ALB'' AND ');
     SelectSQL.Add(' TMP.CONTADOR=' + IntToStr(Contador));
     SelectSQL.Add(' ORDER BY VER.RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMAlbaranesAlquiler.BuscaNumSerie(NroSerie: string; Filtro: boolean);
begin
  // NSerie := NroSerie;

  if Filtro = True then
  begin
     QMCabecera.Close;
     QMCabecera.SelectSQL.Text := '';
  end;

  ModificaSelect(QMCabecera, ' SELECT * FROM VER_CABECERAS_ALBARAN_ALQ WHERE EMPRESA=?EMPRESA' +
     ' AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=''ALB''' +
     ' AND RIG IN (SELECT RIG FROM VER_DETALLE_SERIALIZACION ' +
     ' WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
     REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr +
     ' AND TIPO=''ALB'' AND SERIE=''' + Serie + ''' AND NSERIE =?NSERIE)', Filtro);

  if (Filtrado = False) then
  begin
     DMMain.FiltraTabla(QMCabecera, '11100', False);
  end;
  QMCabecera.Params.ByName['SERIE'].AsString := Serie;
  if (Pos('NSERIE', QMCabecera.SelectSQL.Text) > 0) then
     QMCabecera.Params.ByName['NSERIE'].AsString := NroSerie;

  QMCabecera.Open;
  if ((QMCabecera.RecordCount = 0) and (Filtro = True)) then
  begin
     Application.MessageBox(PChar(string(Format(_('No se han encontrado documentos con el numero de serie %s'), [NroSerie]))),
        PChar(string(_('ATENCION!'))), MB_OK + mb_IconStop);
     with QMCabecera do
     begin
        Close;
        SelectSQL.Text := SQLFind;
     end;
     DMMain.FiltraTabla(QMCabecera, '11100', False);
     QMCabecera.Params.ByName['SERIE'].AsString := Serie;
     QMCabecera.Open;
  end;
end;

{
procedure TDMAlbaranesAlquiler.CreaMovimientoDevolucion;
var
  id_st, rig_mov : integer;
begin
  // Creo cabecera de movimiento
  id_st := DMMain.ContadorGen('ID_GES_CABECERAS_ST');
  rig_mov := DMMain.Contador_EES(QMCabeceraSERIE.AsString, 'MAN');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO GES_CABECERAS_ST ( ');
        SQL.Add(' EMPRESA, EJERCICIO, SERIE, RIG, TIPO_OPERACION, FECHA, ALMACEN_ORI, ALMACEN_DST, CANAL_ORI, CANAL_DST, ');
        SQL.Add(' COMENTARIO, TIPO_VALORACION, ENTRADA, ESTADO, ID_ORIGEN, ORIGEN, ID_ST) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :SERIE, :RIG, :TIPO_OPERACION, :FECHA, :ALMACEN_ORI, :ALMACEN_DEST, :CANAL_ORI, :CANAL_DEST, ');
        SQL.Add(' :COMENTARIO, 1, :ENTRADA, 0, :ID_ORIGEN, :ORIGEN, :ID_ST) ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['RIG'].AsInteger := rig_mov;
        Params.ByName['TIPO_OPERACION'].AsString := 'E';
        Params.ByName['FECHA'].AsDateTime := Now;
        Params.ByName['ALMACEN_ORI'].AsString := QMCabeceraALMACEN.AsString;
        Params.ByName['ALMACEN_DEST'].AsString := QMCabeceraALMACEN.AsString;
        Params.ByName['CANAL_ORI'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['CANAL_DEST'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['COMENTARIO'].AsString := Format(_('Devolucion Alq. %d-%s/%d'), [QMCabeceraEJERCICIO.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger]);
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_ORIGEN'].AsInteger := QMCabeceraID_S.AsInteger;
        Params.ByName['ORIGEN'].AsString := 'ALB';
        Params.ByName['ID_ST'].AsInteger := id_st;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_CABECERAS_S_ALB_ALQ  ');
        SQL.Add(' SET ID_ST_DEVOLUCION = :ID_ST_DEVOLUCION ');
        SQL.Add(' WHERE ID_S = :ID_S ');
        Params.ByName['ID_ST_DEVOLUCION'].AsInteger := id_st;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  InfoActualiza;

  // Copio lineas del documento al movimiento
  QMDetalle.First;
  while not QMDetalle.EOF do
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO GES_DETALLES_ST ( ');
           SQL.Add(' EMPRESA, EJERCICIO, SERIE, RIG, ARTICULO, UNIDADES, PRECIO, ENTRADA, TITULO, ID_ST, ID_ORIGEN_DETALLE) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :EJERCICIO, :SERIE, :RIG, :ARTICULO, :UNIDADES, :PRECIO, :ENTRADA, :TITULO, :ID_ST, :ID_ORIGEN_DETALLE) ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['RIG'].AsInteger := rig_mov;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsFloat;
           Params.ByName['PRECIO'].AsFloat := DMMain.DamePMPArticulo(QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString);
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['TITULO'].AsString := QMDetalleTITULO.AsString;
           Params.ByName['ID_ST'].AsInteger := QMCabeceraID_S.AsInteger;
           Params.ByName['ID_ORIGEN_DETALLE'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     QMDetalle.Next;
  end;

  QMCabecera.Refresh;
end;
}

procedure TDMAlbaranesAlquiler.DMDocsAlbaranCreate(Sender: TObject);
begin
  inherited;
  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_ALBARAN_ALQ ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' ((EJERCICIO = ?EJERCICIO) OR ((EJERCICIO < ?EJERCICIO) AND ((ESTADO = 0) OR (ESTADO = 3)))) AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''ALB'' ');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        Add('AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
     Add('ORDER BY EJERCICIO, RIG ');
  end;

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  SQLFind := QMCabecera.SelectSQL.Text;
end;

procedure TDMAlbaranesAlquiler.FiltraCabecera(Ejercicio: integer; Serie: string; Rig: integer);
begin
  with QMCabecera do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * FROM VER_CABECERAS_ALBARAN_ALQ ');
        Add(' WHERE ');
        Add(' EMPRESA = ?EMPRESA AND ');
        Add(' EJERCICIO = ?EJERCICIO AND ');
        Add(' CANAL = ?CANAL AND ');
        Add(' SERIE = ?SERIE AND ');
        Add(' TIPO = ''ALB'' AND ');
        Add(' RIG = ?RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;

     FMAlbaranesAlquiler.EFSerie.Text := Serie;
  end;
end;

procedure TDMAlbaranesAlquiler.FiltraClienteKri(Ejercicio: integer; Serie: string; Cliente: integer);
begin
  with QMCabecera do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * FROM VER_CABECERAS_ALBARAN_ALQ ');
        Add(' WHERE ');
        Add(' EMPRESA = ?EMPRESA AND ');
        Add(' ((EJERCICIO = ?EJERCICIO) OR ((EJERCICIO < ?EJERCICIO) AND ((ESTADO = 0) OR (ESTADO = 3)))) AND ');
        Add(' CANAL = ?CANAL AND ');
        Add(' SERIE = ?SERIE AND ');
        Add(' TIPO = ''ALB'' AND ');
        Add(' CLIENTE = ?CLIENTE ');
        if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
           Add('AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
        Add(' ORDER BY EJERCICIO, RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMAlbaranesAlquiler.FiltraPendiente(Serie, Filtro: string);
begin
  QMCabecera.Close;

  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_CABECERAS_ALBARAN_ALQ ');
     Add(' WHERE ');
     Add(Filtro);
     Add(' AND SERIE = ''' + Serie + '''');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        Add('AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
     Add(' ORDER BY EJERCICIO, RIG ');
  end;

  QMCabecera.Open;
end;

procedure TDMAlbaranesAlquiler.TraspasarAlbaranActual(tipo_destino: string);
var
  id_s_d : integer;
  Q : THYFIBQuery;
begin
  if (QMCabeceraGARANTIA.AsInteger = 1) then {dji lrk kri}
     raise Exception.Create(_('El albarán es una garantía y no se puede facturar'))
  else
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_ALBARAN_A_O_M_ALQ ');
           SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ');
           SQL.Add(' ?D_TIPO, ?ENTRADA, ?FECHA, ?TRANSPORTISTA, ');
           SQL.Add(' ?D_EJERCICIO, ?D_CANAL, ?D_SERIE, ?ID_S, 0, 0, 0, 0, 0) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := 'ALB';
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['D_TIPO'].AsString := tipo_destino;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           if DMMain.EstadoKri(4) = 1 then {dji lrk kri}
              Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime
           else
              Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
           Params.ByName['TRANSPORTISTA'].AsInteger := QMCabeceraTRANSPORTISTA.AsInteger;
           Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['D_CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['D_SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
           ExecQuery;
           id_s_d := FieldByName['ID_S_D'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     if (REntorno.Ejercicio >= QMCabeceraEJERCICIO.AsInteger) then
     begin
        QMCabecera.Refresh;
        if (tipo_destino = 'FAC') then
           TraspasoAFactura(QMCabeceraSERIE.AsString, id_s_d);
     end
     else
     begin
        QMCabecera.Close;
        QMCabecera.Open;
     end;
  end;
end;

end.
