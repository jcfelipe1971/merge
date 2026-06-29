unit UProDMLstHojaTrabajo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBDataSet;

type
  TProDMLstHojaTrabajo = class(TDataModule)
     TLocal: THYTransaction;
     frListadoHoja: TfrHYReport;
     frDBLstFases: TfrDBDataSet;
     xEntrePedidos: TFIBDataSetRO;
     xEntrePedidosMIN: TIntegerField;
     xEntrePedidosMAX: TIntegerField;
     xEntreClientes: TFIBDataSetRO;
     xEntreClientesMIN: TIntegerField;
     xEntreClientesMAX: TIntegerField;
     xLstFases: TFIBDataSetRO;
     DSxLstFases: TDataSource;
     xLstPedidos: TFIBDataSetRO;
     frDBLstPedidos: TfrDBDataSet;
     DSxLstPedidos: TDataSource;
     frDBLstMateriales: TfrDBDataSet;
     DSxLstMateriales: TDataSource;
     xLstMateriales: TFIBDataSetRO;
     frDBLstTareas: TfrDBDataSet;
     DSxLstTareas: TDataSource;
     xLstTareas: TFIBDataSetRO;
     xPedidoD: TFIBDataSetRO;
     DSxPedidoD: TDataSource;
     xPedidoH: TFIBDataSetRO;
     DSxPedidoH: TDataSource;
     xClienteD: TFIBDataSetRO;
     DSxClienteD: TDataSource;
     xClienteH: TFIBDataSetRO;
     DSxClienteH: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoHojaGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     FechaListado: TDateTime;
     TFiltro: string;
     Comentario: string;
     procedure EntrePedidos;
     procedure EntreClientes;
     procedure DescPedidoD(Pedido: integer);
     procedure DescPedidoH(Pedido: integer);
     procedure DescClienteD(Cliente: integer);
     procedure DescClienteH(Cliente: integer);
     procedure MostrarListado(Modo, PedidoD, PedidoH, ClienteD, ClienteH: integer);
  end;

var
  ProDMLstHojaTrabajo : TProDMLstHojaTrabajo;

implementation

uses UDMMain, UFormGest, UDMListados, UEntorno, UProFMLstHojaTrabajo;

{$R *.dfm}

procedure TProDMLstHojaTrabajo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMLstHojaTrabajo.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLstHojaTrabajo.EntrePedidos;
begin
  with xEntrePedidos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  ProFMLstHojaTrabajo.EFPedidoD.Text := xEntrePedidosMIN.AsString;
  ProFMLstHojaTrabajo.EFPedidoH.Text := xEntrePedidosMAX.AsString;
end;

procedure TProDMLstHojaTrabajo.EntreClientes;
begin
  with xEntreClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  ProFMLstHojaTrabajo.EFClienteD.Text := xEntreClientesMIN.AsString;
  ProFMLstHojaTrabajo.EFClienteH.Text := xEntreClientesMAX.AsString;
end;

procedure TProDMLstHojaTrabajo.DescPedidoD(Pedido: integer);
begin
  with xPedidoD do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['RIG'].AsInteger := Pedido;
     Open;
  end;
end;

procedure TProDMLstHojaTrabajo.DescPedidoH(Pedido: integer);
begin
  with xPedidoH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['RIG'].AsInteger := Pedido;
     Open;
  end;
end;

procedure TProDMLstHojaTrabajo.DescClienteD(Cliente: integer);
begin
  with xClienteD do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TProDMLstHojaTrabajo.DescClienteH(Cliente: integer);
begin
  with xClienteH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TProDMLstHojaTrabajo.MostrarListado(Modo, PedidoD, PedidoH, ClienteD, ClienteH: integer);
begin
  with xLstPedidos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'PEC';
     Params.ByName['PEDIDO_D'].AsInteger := PedidoD;
     Params.ByName['PEDIDO_H'].AsInteger := PedidoH;
     Params.ByName['CLIENTE_D'].AsInteger := ClienteD;
     Params.ByName['CLIENTE_H'].AsInteger := ClienteH;
     Open;
  end;

  xLstFases.Close;
  xLstFases.Open;

  xLstMateriales.Close;
  xLstMateriales.Open;

  xLstTareas.Close;
  xLstTareas.Open;

  DMListados.Imprimir(8052, Modo, '', '', frListadoHoja, nil);
end;

procedure TProDMLstHojaTrabajo.frListadoHojaGetValue(const ParName: string; var ParValue: variant);
begin
  // CABECERA LISTADO
  if Trim(ParName) = 'Comentario' then
     ParValue := Comentario;
  if Trim(ParName) = 'FechaListado' then
     ParValue := FechaListado;
  if Trim(ParName) = 'Empresa' then
     ParValue := REntorno.NombreEmpresa;
  if Trim(ParName) = 'TFiltro' then
     ParValue := TFiltro;
end;

end.
