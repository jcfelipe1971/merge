unit UDMCondicionesAgeCliArt;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  UComponentesBusquedaFiltrada, FIBQuery, FIBDataSetRO, HYFIBQuery;

type
  TDMCondicionesAgecliArt = class(TDataModule)
     TLocal: THYTransaction;
     DSxAgentes: TDataSource;
     QMCondArticulos: TFIBTableSet;
     DSQMCondArticulos: TDataSource;
     xAgentes: TFIBDataSetRO;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     QMCondFamilias: TFIBTableSet;
     DSQMCondFamilias: TDataSource;
     QControlaDuplicados: THYFIBQuery;
     QControlaDuplicadosFam: THYFIBQuery;
     xAgentesEMPRESA: TIntegerField;
     xAgentesAGENTE: TIntegerField;
     xAgentesTERCERO: TIntegerField;
     xClientesEMPRESA: TIntegerField;
     xClientesEJERCICIO: TIntegerField;
     xClientesCANAL: TIntegerField;
     xClientesCLIENTE: TIntegerField;
     xClientesTITULO: TFIBStringField;
     QMCondArticulosEMPRESA: TIntegerField;
     QMCondArticulosEJERCICIO: TIntegerField;
     QMCondArticulosCANAL: TIntegerField;
     QMCondArticulosAGENTE: TIntegerField;
     QMCondArticulosCLIENTE: TIntegerField;
     QMCondArticulosTITULO_CLIENTE: TFIBStringField;
     QMCondArticulosARTICULO: TFIBStringField;
     QMCondArticulosTITULO_ARTICULO: TFIBStringField;
     QMCondArticulosP_COMISION: TFloatField;
     QMCondArticulosACTIVO: TIntegerField;
     xArticulos: TFIBDataSetRO;
     DSXArticulos: TDataSource;
     xArticulosEMPRESA: TIntegerField;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     xFamilias: TFIBDataSetRO;
     DSxFamilias: TDataSource;
     xFamiliasEMPRESA: TIntegerField;
     xFamiliasFAMILIA: TFIBStringField;
     xFamiliasTITULO: TFIBStringField;
     QMCondFamiliasEMPRESA: TIntegerField;
     QMCondFamiliasEJERCICIO: TIntegerField;
     QMCondFamiliasCANAL: TIntegerField;
     QMCondFamiliasAGENTE: TIntegerField;
     QMCondFamiliasCLIENTE: TIntegerField;
     QMCondFamiliasTITULO_CLIENTE: TFIBStringField;
     QMCondFamiliasFAMILIA: TFIBStringField;
     QMCondFamiliasTITULO_FAMILIA: TFIBStringField;
     QMCondFamiliasP_COMISION: TFloatField;
     QMCondFamiliasACTIVO: TIntegerField;
     xAgentesTITULO: TFIBStringField;
     QMCondArticulosCOMISION_LINEAL: TFloatField;
     QMCondFamiliasCOMISION_LINEAL: TFloatField;
     TUpdate: THYTransaction;
     procedure DMCondicionescliCreate(Sender: TObject);
     procedure QMCondArticulosNewRecord(DataSet: TDataSet);
     procedure QMCondArticulosAfterOpen(DataSet: TDataSet);
     procedure QMCondFamiliasNewRecord(DataSet: TDataSet);
     procedure QMCondFamiliasAfterOpen(DataSet: TDataSet);
     procedure QMCondArticulosBeforePost(DataSet: TDataSet);
     procedure QMCondArticulosAfterCancel(DataSet: TDataSet);
     procedure QMCondFamiliasAfterCancel(DataSet: TDataSet);
     procedure QMCondArticulosARTICULOChange(Sender: TField);
     procedure QMCondFamiliasFAMILIAChange(Sender: TField);
     procedure QMCondFamiliasBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     procedure ControlaDupArt;
     procedure ControlaDupFam;
  public
     { Public declarations }
     procedure FiltrarAgente(Agente: integer);
     procedure FiltrarCliente(Agente: integer; Cliente: integer);
  end;

var
  DMCondicionesAgecliArt : TDMCondicionesAgecliArt;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TDMCondicionesAgecliArt.DMCondicionescliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCondArticulosP_COMISION.DisplayFormat := MascaraP;
  QMCondFamiliasP_COMISION.DisplayFormat := MascaraP;

  xAgentes.Close;
  xClientes.Close;
  xArticulos.Close;
  xFamilias.Close;
end;

procedure TDMCondicionesAgecliArt.FiltrarAgente(Agente: integer);
var
  Actualizar_Cliente : boolean;
  cliente : integer;
begin
  // Si ya hay un cliente, hay que actualizar los datos
  if (xClientes.Active) then
  begin
     cliente := xClientesCLIENTE.AsInteger;
     Actualizar_Cliente := True;
  end
  else
  begin
     Actualizar_Cliente := False;
     cliente := 0;
  end;

  with xAgentes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Open;
  end;

  if (Actualizar_Cliente) then
     FiltrarCliente(Agente, cliente); // Filtrar por Cliente
end;

procedure TDMCondicionesAgecliArt.FiltrarCliente(Agente: integer; Cliente: integer);
begin
  with xClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     // Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;

  with QMCondArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;

  with QMCondFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMCondicionesAgecliArt.QMCondArticulosNewRecord(DataSet: TDataSet);
begin
  QMCondArticulosEMPRESA.AsInteger := REntorno.Empresa;
  QMCondArticulosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondArticulosCANAL.AsInteger := REntorno.Canal;
  QMCondArticulosAGENTE.AsInteger := xAgentesAGENTE.AsInteger;
  QMCondArticulosCLIENTE.AsInteger := xClientesCLIENTE.AsInteger;
  QMCondArticulosACTIVO.AsInteger := 1;
  QMCondArticulosP_COMISION.AsFloat := 0;
  QMCondArticulosCOMISION_LINEAL.AsFloat := 0;
  xArticulos.Close;
end;

procedure TDMCondicionesAgecliArt.QMCondArticulosAfterOpen(DataSet: TDataSet);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     Open;
  end;
end;

procedure TDMCondicionesAgecliArt.QMCondFamiliasNewRecord(DataSet: TDataSet);
begin
  QMCondFamiliasEMPRESA.AsInteger := REntorno.Empresa;
  QMCondFamiliasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondFamiliasCANAL.AsInteger := REntorno.Canal;
  QMCondFamiliasAGENTE.AsInteger := xAgentesAGENTE.AsInteger;
  QMCondFamiliasCLIENTE.AsInteger := xClientesCLIENTE.AsInteger;
  QMCondFamiliasACTIVO.AsInteger := 1;
  QMCondFamiliasP_COMISION.AsFloat := 0;
  QMCondFamiliasCOMISION_LINEAL.AsFloat := 0;
  xFamilias.Close;
end;

procedure TDMCondicionesAgecliArt.QMCondFamiliasAfterOpen(DataSet: TDataSet);
begin
  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     Open;
  end;
end;

procedure TDMCondicionesAgecliArt.ControlaDupArt;
var
  Duplicado : boolean;
begin
  Duplicado := False;
  if (QMCondArticulos.State <> dsInsert) or
     (QMCondArticulosARTICULO.IsNull) then
     Exit;

  with QControlaDuplicados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := QMCondArticulosAGENTE.Value;
     Params.ByName['CLIENTE'].AsInteger := QMCondArticulosCLIENTE.Value;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     ExecQuery;
     if (HayDatos) then
        Duplicado := True;
     Close;
     FreeHandle;
  end;

  if Duplicado then
     raise Exception.Create(_('Clave duplicada'));
end;

procedure TDMCondicionesAgecliArt.ControlaDupFam;
var
  Duplicado : boolean;
begin
  Duplicado := False;
  if (QMCondFamilias.State <> dsInsert) or
     (QMCondFamiliasFAMILIA.IsNull) then
     Exit;

  with QControlaDuplicadosFam do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := QMCondFamiliasAGENTE.AsInteger;
     Params.ByName['CLIENTE'].AsInteger := QMCondFamiliasCLIENTE.AsInteger;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     ExecQuery;
     if (HayDatos) then
        Duplicado := True;
     Close;
     FreeHandle;
  end;

  if Duplicado then
     raise Exception.Create(_('Clave duplicada'));
end;

procedure TDMCondicionesAgecliArt.QMCondArticulosBeforePost(DataSet: TDataSet);
begin
  ControlaDupArt;
end;

procedure TDMCondicionesAgecliArt.QMCondArticulosAfterCancel(DataSet: TDataSet);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     Open;
  end;
end;

procedure TDMCondicionesAgecliArt.QMCondFamiliasAfterCancel(DataSet: TDataSet);
begin
  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     Open;
  end;
end;

procedure TDMCondicionesAgecliArt.QMCondArticulosARTICULOChange(Sender: TField);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     Open;
  end;

  ControlaDupArt;
end;

procedure TDMCondicionesAgecliArt.QMCondFamiliasFAMILIAChange(Sender: TField);
begin
  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     Open;
  end;

  ControlaDupFam;
end;

procedure TDMCondicionesAgecliArt.QMCondFamiliasBeforePost(DataSet: TDataSet);
begin
  ControlaDupFam;
end;

end.
