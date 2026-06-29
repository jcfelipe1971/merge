unit UProDMRelPedidosV;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery;

type
  TProDMRelPedidosV = class(TDataModule)
     xEscandallo: TFIBDataSetRO;
     DSEscandallo: TDataSource;
     TLocal: THYTransaction;
     xInsertarPedido: THYFIBQuery;
     xDuplicarPedido: THYFIBQuery;
     xBuscarUltimEscandall: THYFIBQuery;
     xEscandalloTITULO: TFIBStringField;
     xEscandalloCOMPUESTO: TFIBStringField;
     xAsignarEscPedido: THYFIBQuery;
     xIDEscandallo: THYFIBQuery;
     xBuscaEscandallo: TFIBDataSetRO;
     xBuscaEscandalloESCANDALLO: TIntegerField;
     xBuscaEscandalloTIPO: TFIBStringField;
     DSxBuscaEscandallo: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function ComprobarValorDefecto: integer;
     procedure Generar(TipoAccion, TipoPlantilla, Seleccion: integer);
     procedure AbreEscandallo(TipoAccion: integer);
  end;

var
  ProDMRelPedidosV : TProDMRelPedidosV;

implementation

uses UDMMain, UFormGest, UEntorno, UDMPedidos, UFMain, Dialogs;

{$R *.dfm}

{ TProDMRelPedidosV }

function TProDMRelPedidosV.ComprobarValorDefecto: integer;
begin
  Result := DMMain.DameConstanteProduccion('GEST_FILTRO_ESC_PED');
end;

procedure TProDMRelPedidosV.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TProDMRelPedidosV.Generar(TipoAccion, TipoPlantilla, Seleccion: integer);
begin
  if (TipoAccion = 0) then  // Crear escandallos
  begin
     xInsertarPedido.Close;
     xInsertarPedido.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     xInsertarPedido.Params.ByName['tipo_esc'].AsString := 'EPR';
     xInsertarPedido.Params.ByName['compuesto'].AsString := DMPedidos.QMDetalleARTICULO.AsString;
     xInsertarPedido.Params.ByName['unidades'].AsFloat := DMPedidos.QMDetalleUNIDADES.AsFloat;
     xInsertarPedido.Params.ByName['unidad'].AsString := '-';
     // xInsertarPedido.Params.ByName['id_detalles'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
     xInsertarPedido.Prepare;
     xInsertarPedido.ExecQuery;

     // Es busca l'escandall generat
     xBuscarUltimEscandall.Close;
     xBuscarUltimEscandall.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     xBuscarUltimEscandall.Params.ByName['Tipo'].AsString := 'EPR';
     xBuscarUltimEscandall.Prepare;
     xBuscarUltimEscandall.ExecQuery;

     // S'asigna l'escandall a la comanda i es fa el commit
     xAsignarEscPedido.Close;
     xAsignarEscPedido.Params.ByName['valor_escandallo'].AsInteger := xBuscarUltimEscandall.Fields[0].AsInteger;
     xAsignarEscPedido.Params.ByName['id_detalles_s'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
     xAsignarEscPedido.Prepare;
     xAsignarEscPedido.ExecQuery;
  end
  // ****DUPLICACIÓ*****
  // Crear escandallo a partir d'una oferta
  else
  if ((TipoAccion = 1) and (TipoPlantilla = 0)) then
  begin
     xDuplicarPedido.Close;
     xDuplicarPedido.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     xDuplicarPedido.Params.ByName['tipo_ori'].AsString := 'OFE';
     xDuplicarPedido.Params.ByName['escandallo_ori'].AsInteger := Seleccion;
     xDuplicarPedido.Params.ByName['tipo_dest'].AsString := 'EPR';
     xDuplicarPedido.Params.ByName['compuesto_dest'].AsString := DMPedidos.QMDetalleARTICULO.AsString;
     xDuplicarPedido.Params.ByName['id_detalles_ofertas_v'].AsInteger := 0;
     xDuplicarPedido.Params.ByName['id_detalles_pedidos_v'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
     xDuplicarPedido.Params.ByName['entrada'].AsInteger := REntorno.Entrada;
     xDuplicarPedido.Prepare;
     xDuplicarPedido.ExecQuery;

     ShowMessage(Format(_('Oferta de escandallo creada con éxito. Núm. %s'), [xDuplicarPedido.Fields[0].AsString]));
     AbreEscandallo(TipoAccion);

     // S'asigna l'escandall a la comanda i es fa el commit
     xAsignarEscPedido.Close;
     xAsignarEscPedido.Params.ByName['valor_escandallo'].AsInteger := xDuplicarPedido.Fields[1].AsInteger;
     xAsignarEscPedido.Params.ByName['id_detalles_s'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
     xAsignarEscPedido.Prepare;
     xAsignarEscPedido.ExecQuery;
  end
  // Crear escandallo a partir d'un escandall
  else if ((TipoAccion = 1) and (TipoPlantilla = 1)) then
  begin
     xDuplicarPedido.Close;
     xDuplicarPedido.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     xDuplicarPedido.Params.ByName['tipo_ori'].AsString := 'EPR';
     xDuplicarPedido.Params.ByName['escandallo_ori'].AsInteger := Seleccion;
     xDuplicarPedido.Params.ByName['tipo_dest'].AsString := 'EPR';
     xDuplicarPedido.Params.ByName['compuesto_dest'].AsString := DMPedidos.QMDetalleARTICULO.AsString;
     xDuplicarPedido.Params.ByName['id_detalles_ofertas_v'].AsInteger := 0;
     xDuplicarPedido.Params.ByName['id_detalles_pedidos_v'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
     xDuplicarPedido.Params.ByName['entrada'].AsInteger := REntorno.Entrada;
     xDuplicarPedido.Prepare;
     xDuplicarPedido.ExecQuery;

     ShowMessage(Format(_('Escandallo creado con éxito. Núm. %s'), [xDuplicarPedido.Fields[0].AsString]));
     AbreEscandallo(TipoAccion);

     // S'asigna l'escandall a la comanda i es fa el commit
     xAsignarEscPedido.Close;
     xAsignarEscPedido.Params.ByName['valor_escandallo'].AsInteger := xDuplicarPedido.Fields[1].AsInteger;
     xAsignarEscPedido.Params.ByName['id_detalles_s'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
     xAsignarEscPedido.Prepare;
     xAsignarEscPedido.ExecQuery;
  end
  //Assignar l'escandall
  else if (TipoAccion = 2) then
  begin
     //Es busca el id de l'escandall
     xIDEscandallo.Close;
     xIDEscandallo.Params.ByName['empresa'].AsInteger := REntorno.empresa;
     xIDEscandallo.Params.ByName['tipo'].AsString := 'EPR';
     xIDEscandallo.Params.ByName['escandallo'].AsInteger := Seleccion;
     xIDEscandallo.Prepare;
     xIDEscandallo.ExecQuery;

     // S'assigna el nou escandall a la comanda
     xAsignarEscPedido.Close;
     xAsignarEscPedido.Params.ByName['valor_escandallo'].AsInteger := xIDEscandallo.Fields[0].AsInteger;
     xAsignarEscPedido.Params.ByName['id_detalles_s'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
     xAsignarEscPedido.Prepare;
     xAsignarEscPedido.ExecQuery;
  end;

  DMPedidos.RefrescaTabla;
end;

procedure TProDMRelPedidosV.AbreEscandallo(TipoAccion: integer);
var
  Escandallo : integer;
begin
  Escandallo := 0;

  if ((TipoAccion = 0)) then
  begin
     xBuscaEscandallo.Close;
     xBuscaEscandallo.Params.ByName['id_esc'].AsInteger := xBuscarUltimEscandall.Fields[0].AsInteger;
     xBuscaEscandallo.Open;
     Escandallo := xBuscaEscandallo.Fields[0].AsInteger;
  end
  else if (TipoAccion = 1) then
  begin
     Escandallo := xDuplicarPedido.Fields[0].AsInteger;
  end
  else if (TipoAccion = 2) then
  begin
     xBuscaEscandallo.Close;
     xBuscaEscandallo.Params.ByName['id_esc'].AsInteger := xIDEscandallo.Fields[0].AsInteger;
     xBuscaEscandallo.Open;
     Escandallo := xBuscaEscandallo.Fields[0].AsInteger;
  end;

  if (Escandallo <> 0) then
     FMain.EjecutaAccion(FMain.AProEscandallosF, 'Escandallo = ' + IntToStr(Escandallo));
end;

end.
