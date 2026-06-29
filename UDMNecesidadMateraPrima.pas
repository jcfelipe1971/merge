unit UDMNecesidadMateraPrima;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBQuery, FIBDataSetRW, FIBDataSet, FIBTableDataSet;

type
  TDMNecesidadMateraPrima = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xNecesidades: TFIBDataSetRW;
     DSxPedidos: TDataSource;
     xPedidos: TFIBTableSet;
     xPedidosEMPRESA: TIntegerField;
     xPedidosEJERCICIO: TIntegerField;
     xPedidosCANAL: TIntegerField;
     xPedidosSERIE: TFIBStringField;
     xPedidosTIPO: TFIBStringField;
     xPedidosRIG: TIntegerField;
     xPedidosLINEA: TIntegerField;
     xPedidosID_S: TIntegerField;
     xPedidosID_DETALLES_S: TIntegerField;
     xPedidosCLIENTE: TIntegerField;
     xPedidosNOMBRE_R_SOCIAL: TFIBStringField;
     xPedidosARTICULO: TFIBStringField;
     xPedidosTITULO: TFIBStringField;
     xPedidosUNIDADES: TFloatField;
     xPedidosU_PENDIENTES: TFloatField;
     xPedidosU_SERVIDAS: TFloatField;
     xPedidosENTRADA_AGRUPACION: TIntegerField;
     xPedidosFECHA_ENTREGA_PREV: TDateTimeField;
     xProveedoresArticulo: TFIBDataSetRO;
     DSxProveedoresArticulos: TDataSource;
     xProveedoresArticuloEMPRESA: TIntegerField;
     xProveedoresArticuloARTICULO: TFIBStringField;
     xProveedoresArticuloPROVEEDOR: TIntegerField;
     xProveedoresArticuloPRIORIDAD: TIntegerField;
     xProveedoresArticuloPEDIDO_MINIMO: TFloatField;
     xProveedoresArticuloPEDIDO_OPTIMO: TFloatField;
     xProveedoresArticuloACTIVO: TIntegerField;
     xProveedoresArticuloDESCUENTO: TFloatField;
     xProveedoresArticuloP_COSTE: TFloatField;
     xProveedoresArticuloINCR_PEDIDO: TFloatField;
     xProveedoresArticuloID_A: TIntegerField;
     xProveedoresArticuloDIAS_ENTREGA: TIntegerField;
     xProveedoresArticuloNOMBRE_R_SOCIAL: TFIBStringField;
     xPedidosFAMILIA: TFIBStringField;
     xPedidosSUBFAMILIA: TFIBStringField;
     xPedidosFECHA: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RefrescaPedidosCompras;
     procedure RefrescaPedidosVentas(TodosLosPedidos: boolean);
     procedure RefrescaNecesidades(TodosLosPedidos: boolean);
     procedure RefrescaPropuestaPedidos;
     function DameStockArticulo(Empresa, Canal: integer; Articulo: string): double;
     procedure ActivarPedidos(Abrir: boolean);
     procedure MarcarTodosPedidos(Marca: integer);
     procedure MarcarPorFecha(FechaIni, FechaFin: TDateTime; Marca: integer);
     procedure MarcarPorCliente(Desde, Hasta: integer; Marca: integer);
     procedure Proponer(Serie, Almacen, Articulo: string; Proveedor: integer; Unidades: double; FechaEntrega: TDateTime);
     procedure MuestraProveedoresArticulo(Articulo: string);
  end;

var
  DMNecesidadMateraPrima : TDMNecesidadMateraPrima;

implementation

uses UDMMain, UEntorno, HYFIBQuery, UUtiles;

{$R *.dfm}

{ TDMNecesidadMateraPrima }

procedure TDMNecesidadMateraPrima.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMNecesidadMateraPrima.RefrescaPedidosVentas(TodosLosPedidos: boolean);
begin
  with xNecesidades do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' /* ----------------------------------------------------------------- */ ');
     SelectSQL.Add(' /* Cantidad necesaria de articulos fabricables por semana de entrega */ ');
     SelectSQL.Add(' /* ----------------------------------------------------------------- */ ');
     SelectSQL.Add(' select d.articulo, a.titulo_largo as titulo, a.familia, sum(p.u_pendientes) unidades, extract(year from p.fecha_entrega_prev) as anyo, ');
     SelectSQL.Add('        extract(week from p.fecha_entrega_prev) as semana, min((select first 1 plazo_fabricacion ');
     SelectSQL.Add('                                                                from pro_escandallo ');
     SelectSQL.Add('                                                                where ');
     SelectSQL.Add('                                                                id_esc = p.id_esc and ');
     SelectSQL.Add('                                                                estado = 1)) plazo_fabricacion ');
     SelectSQL.Add(' from ges_detalles_s d ');
     SelectSQL.Add(' join ges_detalles_s_ped p on d.id_detalles_s = p.id_detalles_s ');
     SelectSQL.Add(' join ges_cabeceras_s c on d.id_s = c.id_s ');
     SelectSQL.Add(' join art_articulos a on d.id_a = a.id_a ');
     SelectSQL.Add(' where ');
     SelectSQL.Add(' d.empresa = :empresa and ');
     // SelectSQL.Add(' d.ejercicio <= :ejercicio and ');
     // SelectSQL.Add(' d.canal = :canal and ');
     SelectSQL.Add(' d.tipo = ''PEC'' and ');
     SelectSQL.Add(' c.estado = 0 and ');
     SelectSQL.Add(' p.servido = 0 and ');
     SelectSQL.Add(' p.id_esc <> 0 ');
     if (not TodosLosPedidos) then
        SelectSQL.Add(' and p.entrada_agrupacion = :entrada_agrupacion ');
     SelectSQL.Add(' group by d.articulo, a.titulo_largo, a.familia, extract(year from p.fecha_entrega_prev), extract(week from p.fecha_entrega_prev) ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     // Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (not TodosLosPedidos) then
        Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;

     Open;
     Last;
     First;
  end;
end;

procedure TDMNecesidadMateraPrima.RefrescaPedidosCompras;
begin
  with xNecesidades do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' /* ----------------------------------------------------------------- */ ');
     SelectSQL.Add(' /* Cantidad pendiente de recibir por semana                          */ ');
     SelectSQL.Add(' /* ----------------------------------------------------------------- */ ');
     SelectSQL.Add(' ');
     SelectSQL.Add(' select d.articulo, a.titulo_largo as titulo, a.familia, sum(p.unidades_por_servir) unidades, extract(year from p.fecha_pre_det) as anyo, ');
     SelectSQL.Add('        extract(week from p.fecha_pre_det) as semana, ');
     SelectSQL.Add('        min(( select first 1 dias_entrega ');
     SelectSQL.Add('             from art_articulos_proveedores ');
     SelectSQL.Add('             where ');
     SelectSQL.Add('             empresa = d.empresa and ');
     SelectSQL.Add('             articulo = d.articulo and ');
     SelectSQL.Add('             activo = 1 ');
     SelectSQL.Add('             order by prioridad)) dias_entrega ');
     SelectSQL.Add(' from ges_detalles_e d ');
     SelectSQL.Add(' join ges_detalles_e_ped p on d.id_detalles_e = p.id_detalles_e ');
     SelectSQL.Add(' join ges_cabeceras_e c on d.id_e = c.id_e ');
     SelectSQL.Add(' join art_articulos a on d.id_a = a.id_a ');
     SelectSQL.Add(' where ');
     SelectSQL.Add(' c.empresa = :empresa and ');
     SelectSQL.Add(' c.estado = 0 ');
     SelectSQL.Add(' group by d.articulo, a.titulo_largo, a.familia, extract(year from p.fecha_pre_det), extract(week from p.fecha_pre_det) ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;

     Open;
     Last;
     First;
  end;
end;

procedure TDMNecesidadMateraPrima.RefrescaPropuestaPedidos;
begin
  with xNecesidades do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT D.ARTICULO, A.FAMILIA, SUM(D.UNIDADES) UNIDADES, EXTRACT(YEAR FROM DD.FECHA_PRE_DET) AS ANYO, EXTRACT(WEEK FROM DD.FECHA_PRE_DET) AS SEMANA ');
     SelectSQL.Add(' /*C.ID_E, D.ID_DETALLES_E, C.ESTADO, C.MODIFICA_DOC, O.TERCERO, O.PROVEEDOR, DD.FECHA_PRE_DET, DD.PLAZO_ENTREGA_DET,*/ ');
     SelectSQL.Add(' FROM GES_CABECERAS_E C ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E_OFP O ON C.ID_E = O.ID_E ');
     SelectSQL.Add(' JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E ');
     SelectSQL.Add(' JOIN GES_DETALLES_E_OFP DD ON D.ID_DETALLES_E = DD.ID_DETALLES_E ');
     SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DD.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' /* ');
     SelectSQL.Add(' C.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' C.CANAL = :CANAL AND ');
     SelectSQL.Add(' C.SERIE = :SERIE AND ');
     SelectSQL.Add(' C.TIPO = :TIPO AND ');
     SelectSQL.Add(' */ ');
     SelectSQL.Add(' C.ESTADO = 0 ');
     SelectSQL.Add(' GROUP BY D.ARTICULO, A.FAMILIA, EXTRACT(YEAR FROM DD.FECHA_PRE_DET), EXTRACT(WEEK FROM DD.FECHA_PRE_DET) ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;

     Open;
     Last;
     First;
  end;
end;

procedure TDMNecesidadMateraPrima.RefrescaNecesidades(TodosLosPedidos: boolean);
begin
  with xNecesidades do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT N.*, A.FAMILIA FROM PRO_NECESIDAD_MATERIA_PRIMA (:EMPRESA, :ENTRADA) N ');
     SelectSQL.Add(' JOIN ART_ARTICULOS A ON N.EMPRESA = A.EMPRESA AND N.COMPONENTE = A.ARTICULO ');
     SelectSQL.Add(' ORDER BY N.COMPONENTE ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if TodosLosPedidos then
        Params.ByName['ENTRADA'].AsInteger := 0
     else
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

     Open;
     Last;
     First;
  end;
end;

function TDMNecesidadMateraPrima.DameStockArticulo(Empresa, Canal: integer; Articulo: string): double;
begin
  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EXISTENCIAS_TOT FROM A_ART_DAME_STOCK_ALMACENES(:EMPRESA, :CANAL_D, :CANAL_H, :ARTICULO, :ALMACEN_D, :ALMACEN_H, ''TODAY'')';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['CANAL_D'].AsInteger := Canal;
           Params.ByName['CANAL_H'].AsInteger := Canal;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['ALMACEN_D'].AsString := '000';
           Params.ByName['ALMACEN_H'].AsString := '002';
           ExecQuery;
           Result := FieldByName['EXISTENCIAS_TOT'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMNecesidadMateraPrima.MarcarTodosPedidos(Marca: integer);
var
  IdDetallesS : integer;
begin
  with xPedidos do
  begin
     DisableControls;
     try
        // Guardo la posicion
        IdDetallesS := FieldByName('ID_DETALLES_S').AsInteger;

        // Marco lineas
        First;
        while not EOF do
        begin
           if (FieldByName('ENTRADA_AGRUPACION').AsInteger <> Marca) then
           begin
              Edit;
              FieldByName('ENTRADA_AGRUPACION').AsInteger := Marca;
              Post;
           end;

           Next;
        end;

        // Reposiciono
        First;
        Posicionar(xPedidos, 'ID_DETALLES_S', IdDetallesS);
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMNecesidadMateraPrima.ActivarPedidos(Abrir: boolean);
begin
  with xPedidos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Abrir) then
        Open;
  end;
end;

procedure TDMNecesidadMateraPrima.MarcarPorFecha(FechaIni, FechaFin: TDateTime; Marca: integer);
var
  IdDetallesS : integer;
begin
  with xPedidos do
  begin
     DisableControls;
     try
        // Guardo la posicion
        IdDetallesS := FieldByName('ID_DETALLES_S').AsInteger;

        // Marco lineas
        First;
        while not EOF do
        begin
           if ((FieldByName('FECHA_ENTREGA_PREV').AsDateTime >= FechaIni) and (FieldByName('FECHA_ENTREGA_PREV').AsDateTime <= FechaFin) and (FieldByName('ENTRADA_AGRUPACION').AsInteger <> Marca)) then
           begin
              Edit;
              FieldByName('ENTRADA_AGRUPACION').AsInteger := Marca;
              Post;
           end;

           Next;
        end;

        // Reposiciono
        First;
        Posicionar(xPedidos, 'ID_DETALLES_S', IdDetallesS);
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMNecesidadMateraPrima.MarcarPorCliente(Desde, Hasta, Marca: integer);
var
  IdDetallesS : integer;
begin
  with xPedidos do
  begin
     DisableControls;
     try
        // Guardo la posicion
        IdDetallesS := FieldByName('ID_DETALLES_S').AsInteger;

        // Marco lineas
        First;
        while not EOF do
        begin
           if ((FieldByName('CLIENTE').AsInteger >= Desde) and (FieldByName('CLIENTE').AsInteger <= Hasta) and (FieldByName('ENTRADA_AGRUPACION').AsInteger <> Marca)) then
           begin
              Edit;
              FieldByName('ENTRADA_AGRUPACION').AsInteger := Marca;
              Post;
           end;

           Next;
        end;

        // Reposiciono
        First;
        Posicionar(xPedidos, 'ID_DETALLES_S', IdDetallesS);
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMNecesidadMateraPrima.Proponer(Serie, Almacen, Articulo: string; Proveedor: integer; Unidades: double; FechaEntrega: TDateTime);
var
  Q : THYFIBQuery;
  // IdPropuesta : integer;
begin
  if ((Articulo = '') or (Proveedor = 0) or (Unidades = 0)) then
     raise Exception.Create(_('Alguno de los datos no es valido'));

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE GENERAR_PROPUESTA_PEDIDO( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :PROVEEDOR, :REFERENCIA, ');
        SQL.Add(' :ALMACEN, :FECHA_DOC, :ARTICULO, :UNIDADES, :FECHA_ENTEGA_PREVISTA, :ENTRADA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'OFP';
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['REFERENCIA'].AsString := '';
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['FECHA_DOC'].AsDateTime := Now;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['UNIDADES'].AsFloat := Unidades;
        Params.ByName['FECHA_ENTEGA_PREVISTA'].AsDateTime := FechaEntrega;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        // IdPropuesta := FieldByName['ID_E'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMNecesidadMateraPrima.MuestraProveedoresArticulo(Articulo: string);
begin
  with xProveedoresArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

end.
