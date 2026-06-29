unit UProDMTrabExt;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery,
  Windows, Controls, Forms;

type
  TProDMTrabExt = class(TDataModule)
     TLocal: THYTransaction;
     QMTrabExt: TFIBTableSet;
     QMTrabExtEMPRESA: TIntegerField;
     QMTrabExtEJERCICIO: TIntegerField;
     QMTrabExtCANAL: TIntegerField;
     QMTrabExtSERIE: TFIBStringField;
     QMTrabExtRIG_OF: TIntegerField;
     QMTrabExtSUBORDEN: TIntegerField;
     QMTrabExtLINEA_FASE: TIntegerField;
     QMTrabExtLINEA_TAREA: TIntegerField;
     QMTrabExtID_ORDEN: TIntegerField;
     QMTrabExtID_E_PEDIDO: TIntegerField;
     DSQMTrabExt: TDataSource;
     xTarea: TFIBDataSetRO;
     xTareaEMPRESA: TIntegerField;
     xTareaEJERCICIO: TIntegerField;
     xTareaCANAL: TIntegerField;
     xTareaSERIE: TFIBStringField;
     xTareaRIG_OF: TIntegerField;
     xTareaSUBORDEN: TIntegerField;
     xTareaLINEA_FASE: TIntegerField;
     xTareaLINEA_TAREA: TIntegerField;
     xTareaTAREA: TFIBStringField;
     xTareaORDEN: TIntegerField;
     xTareaTIPOTAREA: TFIBStringField;
     xTareaCOMENTARIO: TMemoField;
     xTareaRECURSO: TFIBStringField;
     xTareaCANTIDAD: TFloatField;
     xTareaARTICULO: TFIBStringField;
     xTareaPRE_COS_UNI_PRE: TFloatField;
     xTareaTOTAL_VAR_PRE: TFloatField;
     xTareaPRECIO_FIJO_PRE: TFloatField;
     xTareaTOTAL_PRE: TFloatField;
     xTareaPRE_COS_UNI_REAL: TFloatField;
     xTareaTOTAL_VAR_REAL: TFloatField;
     xTareaPRECIO_FIJO_REAL: TFloatField;
     xTareaTOTAL_REAL: TFloatField;
     xTareaESTADO: TIntegerField;
     xTareaFECHA_FIN_TAREA: TDateTimeField;
     xTareaIDENTIFICADOR: TIntegerField;
     xTareaENTRADA: TIntegerField;
     xTareaID_ORDEN: TIntegerField;
     xTareaCANTIDAD_UTIL: TFloatField;
     xTareaID_UTILLAJE: TFIBStringField;
     DSxTarea: TDataSource;
     xFase: TFIBDataSetRO;
     DSxFase: TDataSource;
     xFaseEMPRESA: TIntegerField;
     xFaseEJERCICIO: TIntegerField;
     xFaseCANAL: TIntegerField;
     xFaseSERIES: TFIBStringField;
     xFaseRIG_OF: TIntegerField;
     xFaseSUBORDEN: TIntegerField;
     xFaseLINEA_FASE: TIntegerField;
     xFaseFASE: TFIBStringField;
     xFaseORDEN: TIntegerField;
     xFaseTIPOFASE: TFIBStringField;
     xFaseNOTAS: TMemoField;
     xFaseDIBUJO: TFIBStringField;
     xFaseESTADO: TIntegerField;
     xFaseVALORCALIDAD: TIntegerField;
     xFaseFECHA_FIN_FASE: TDateTimeField;
     xFaseENTRADA: TIntegerField;
     xFaseID_ORDEN: TIntegerField;
     xPedido: TFIBDataSetRO;
     DSxPedido: TDataSource;
     xAlbaranes: TFIBDataSetRO;
     DSxAlbaranes: TDataSource;
     xPedidoEMPRESA: TIntegerField;
     xPedidoEJERCICIO: TIntegerField;
     xPedidoCANAL: TIntegerField;
     xPedidoSERIE: TFIBStringField;
     xPedidoTIPO: TFIBStringField;
     xPedidoRIG: TIntegerField;
     xPedidoALMACEN: TFIBStringField;
     xPedidoMONEDA: TFIBStringField;
     xPedidoFECHA: TDateTimeField;
     xPedidoPROVEEDOR: TIntegerField;
     xPedidoTERCERO: TIntegerField;
     xPedidoTITULO: TFIBStringField;
     xPedidoNOTAS: TBlobField;
     xPedidoESTADO: TIntegerField;
     xPedidoBULTOS: TIntegerField;
     xPedidoLINEAS: TIntegerField;
     xPedidoBRUTO: TFloatField;
     xPedidoI_DTO_LINEAS: TFloatField;
     xPedidoS_BASES: TFloatField;
     xPedidoS_CUOTA_IVA: TFloatField;
     xPedidoS_CUOTA_RE: TFloatField;
     xPedidoB_DTO_LINEAS: TFloatField;
     xPedidoDTO_PP: TFloatField;
     xPedidoDTO_CIAL: TFloatField;
     xPedidoI_DTO_CIAL: TFloatField;
     xPedidoI_DTO_PP: TFloatField;
     xPedidoLIQUIDO: TFloatField;
     xPedidoENTRADA: TIntegerField;
     xPedidoNOMBRE_COMERCIAL: TFIBStringField;
     xPedidoPOR_FINANCIACION: TFloatField;
     xPedidoI_FINANCIACION: TFloatField;
     xPedidoFORMA_DE_PAGO: TFIBStringField;
     xPedidoSU_REFERENCIA: TFIBStringField;
     xPedidoID_E: TIntegerField;
     xPedidoFECHA_PRE_CAB: TDateTimeField;
     xPedidoFECHA_REC_CAB: TDateTimeField;
     xAlbaranesRIG: TIntegerField;
     xAlbaranesFECHA: TDateTimeField;
     xAlbaranesID_E_ALBARAN: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMTrabExtAfterOpen(DataSet: TDataSet);
     procedure QMTrabExtBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     procedure CrearPedidoTrabajoExterno(Proveedor: integer; Almacen, Articulo: string);
  public
     { Public declarations }
     procedure AbreTrabajoExt(id_orden, linea_fase, linea_tarea: integer);
     procedure CrearPedido(Proveedor: integer; Almacen, Articulo: string);
     procedure RecepcionPedido;
     procedure EnlazaAlbaran;
     procedure AbrePedido;
     procedure AbreAlbaran;
     function DameProveedorDeAlmacen(Empresa: integer; Almacen: string): integer;
  end;

var
  ProDMTrabExt : TProDMTrabExt;

implementation

uses UDMMain, UFMain, UEntorno, UFormGest, UFMRecepcionPedidos;

{$R *.dfm}

procedure TProDMTrabExt.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMTrabExt.AbreTrabajoExt(id_orden, linea_fase, linea_tarea: integer);
begin
  with QMTrabExt do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := id_orden;
     Params.ByName['LINEA_FASE'].AsInteger := linea_fase;
     Params.ByName['LINEA_TAREA'].AsInteger := linea_tarea;
     Open;
  end;
end;

procedure TProDMTrabExt.QMTrabExtAfterOpen(DataSet: TDataSet);
begin
  xFase.Open;
  xTarea.Open;
  xPedido.Open;
  xAlbaranes.Open;
end;

procedure TProDMTrabExt.QMTrabExtBeforeClose(DataSet: TDataSet);
begin
  xFase.Close;
  xTarea.Close;
  xPedido.Close;
  xAlbaranes.Close;
end;

procedure TProDMTrabExt.CrearPedidoTrabajoExterno(Proveedor: integer; Almacen, Articulo: string);
var
  Q : THYFIBQuery;
begin
  // Genero el pedido
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_CREAR_PEDIDO_TEX(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :PROVEEDOR, :FECHA, :ENTRADA, :ID_ORDEN, :LINEA_FASE, :LINEA_TAREA, :ARTICULO, :ALMACEN)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_ORDEN'].AsInteger := QMTrabExtID_ORDEN.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMTrabExtLINEA_FASE.AsInteger;
        Params.ByName['LINEA_TAREA'].AsInteger := QMTrabExtLINEA_TAREA.AsInteger;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['ALMACEN'].AsString := Almacen;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Modifico el almacen de lanzamiento al almacen sa ha utilizado en el pedido
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD_MAT ');
        SQL.Add(' SET ');
        SQL.Add(' ALMACEN = :ALMACEN ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_ORDEN = :ID_ORDEN AND ');
        SQL.Add(' LINEA_FASE = :LINEA_FASE AND ');
        SQL.Add(' LINEA_TAREA = :LINEA_TAREA ');
        Params.ByName['ID_ORDEN'].AsInteger := QMTrabExtID_ORDEN.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMTrabExtLINEA_FASE.AsInteger;
        Params.ByName['LINEA_TAREA'].AsInteger := QMTrabExtLINEA_TAREA.AsInteger;
        Params.ByName['ALMACEN'].AsString := Almacen;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMTrabExt.Refresh;
end;

procedure TProDMTrabExt.EnlazaAlbaran;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_ENLAZA_ALB_A_TRAB_EXT(:ID_E_PEDIDO, :ID_ORDEN, :LINEA_FASE, :LINEA_TAREA)';
        Params.ByName['ID_E_PEDIDO'].AsInteger := QMTrabExtID_E_PEDIDO.AsInteger;
        Params.ByName['ID_ORDEN'].AsInteger := QMTrabExtID_ORDEN.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMTrabExtLINEA_FASE.AsInteger;
        Params.ByName['LINEA_TAREA'].AsInteger := QMTrabExtLINEA_TAREA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMTrabExt.Refresh;
end;

procedure TProDMTrabExt.CrearPedido(Proveedor: integer; Almacen, Articulo: string);
begin
  if ((Proveedor <> 0) and (Almacen <> '') and (Articulo <> '')) then
  begin
     CrearPedidoTrabajoExterno(Proveedor, Almacen, Articulo);
     AbrePedido;
  end;
end;

procedure TProDMTrabExt.RecepcionPedido;
begin
  Application.CreateForm(TFMRecepcionPedidos, FMRecepcionPedidos);
  FMRecepcionPedidos.Filtra(REntorno.Ejercicio, REntorno.Serie, xPedidoPROVEEDOR.AsInteger, xPedidoRIG.AsInteger, False);

  // Oculto para abrir en modo Modal
  FMRecepcionPedidos.Hide;
  FMRecepcionPedidos.ShowModal;
end;

procedure TProDMTrabExt.AbrePedido;
begin
  if (xPedidoID_E.AsInteger <> 0) then
     FMain.TraspasoDeDocumentosEntrada(xPedidoID_E.AsInteger);
end;

procedure TProDMTrabExt.AbreAlbaran;
begin
  if (xAlbaranesID_E_ALBARAN.AsInteger <> 0) then
     FMain.TraspasoDeDocumentosEntrada(xAlbaranesID_E_ALBARAN.AsInteger);
end;

function TProDMTrabExt.DameProveedorDeAlmacen(Empresa: integer; Almacen: string): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  try
     with Q do
     begin
        Database := DMMain.DataBase;
        Close;
        SQL.Text := ' select pro.proveedor from art_almacenes alm join sys_terceros ter on(alm.tercero = ter.tercero and alm.empresa = :empresa ) join emp_proveedores pro on(pro.empresa=:empresa and pro.tercero=ter.tercero) where alm.almacen=:almacen';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ALMACEN'].AsString := Almacen;
        ExecQuery;
        Result := FieldByName['PROVEEDOR'].AsInteger;
        Close;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
