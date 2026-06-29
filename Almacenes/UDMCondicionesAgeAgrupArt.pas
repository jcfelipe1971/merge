unit UDMCondicionesAgeAgrupArt;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  UComponentesBusquedaFiltrada, FIBQuery, FIBDataSetRO, HYFIBQuery;

type
  TDMCondicionesAgeAgrupArt = class(TDataModule)
     TLocal: THYTransaction;
     DSxAgentes: TDataSource;
     QMCondArticulos: TFIBTableSet;
     DSQMCondArticulos: TDataSource;
     xAgentes: TFIBDataSetRO;
     DSxAgrupacion: TDataSource;
     QMCondFamilias: TFIBTableSet;
     DSQMCondFamilias: TDataSource;
     QControlaDuplicados: THYFIBQuery;
     QControlaDuplicadosFam: THYFIBQuery;
     xAgentesEMPRESA: TIntegerField;
     xAgentesAGENTE: TIntegerField;
     xAgentesTITULO: TFIBStringField;
     xArticulos: TFIBDataSetRO;
     DSXArticulos: TDataSource;
     xArticulosEMPRESA: TIntegerField;
     xArticulosARTICULO: TFIBStringField;
     xFamilias: TFIBDataSetRO;
     DSxFamilias: TDataSource;
     xAgrupacion: TFIBDataSetRO;
     QMCondArticulosEMPRESA: TIntegerField;
     QMCondArticulosEJERCICIO: TIntegerField;
     QMCondArticulosCANAL: TIntegerField;
     QMCondArticulosAGENTE: TIntegerField;
     QMCondArticulosAGRUPACION: TFIBStringField;
     QMCondArticulosTITULO_AGRUPACION: TFIBStringField;
     QMCondArticulosARTICULO: TFIBStringField;
     QMCondArticulosTITULO_ARTICULO: TFIBStringField;
     QMCondArticulosP_COMISION: TFloatField;
     QMCondArticulosACTIVO: TIntegerField;
     QMCondFamiliasEMPRESA: TIntegerField;
     QMCondFamiliasEJERCICIO: TIntegerField;
     QMCondFamiliasCANAL: TIntegerField;
     QMCondFamiliasAGENTE: TIntegerField;
     QMCondFamiliasAGRUPACION: TFIBStringField;
     QMCondFamiliasTITULO_AGRUPACION: TFIBStringField;
     QMCondFamiliasFAMILIA: TFIBStringField;
     QMCondFamiliasTITULO_FAMILIA: TFIBStringField;
     QMCondFamiliasP_COMISION: TFloatField;
     QMCondFamiliasACTIVO: TIntegerField;
     xArticulosTITULO: TFIBStringField;
     xAgrupacionEMPRESA: TIntegerField;
     xAgrupacionTITULO: TFIBStringField;
     xAgrupacionAGRUPACION: TFIBStringField;
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
     procedure FiltrarAgrupacion(Agente: integer; Agrupacion: string);
  end;

var
  DMCondicionesAgeAgrupArt : TDMCondicionesAgeAgrupArt;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TDMCondicionesAgeAgrupArt.DMCondicionescliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xAgentes.Close;
  xAgrupacion.Close;
  xArticulos.Close;
  xFamilias.Close;
  QMCondArticulosP_COMISION.DisplayFormat := MascaraP;
  QMCondFamiliasP_COMISION.DisplayFormat := MascaraP;
end;

procedure TDMCondicionesAgeAgrupArt.FiltrarAgente(Agente: integer);
var
  Actualizar_Agrup : boolean;
  agrup : string;
begin
  // Si ya hay una agrupación, hay que actualizar los datos
  if (xAgrupacion.Active) then
  begin
     agrup := xAgrupacionAGRUPACION.AsString;
     Actualizar_Agrup := True;
  end
  else
  begin
     Actualizar_Agrup := False;
     agrup := '';
  end;

  with xAgentes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Open;
  end;

  if (Actualizar_Agrup) then
     FiltrarAgrupacion(Agente, agrup); // Filtrar por Agrupación
end;

procedure TDMCondicionesAgeAgrupArt.FiltrarAgrupacion(Agente: integer; Agrupacion: string);
begin
  with xAgrupacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     //Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;

  with QMCondArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;

  with QMCondFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMCondicionesAgeAgrupArt.QMCondArticulosNewRecord(DataSet: TDataSet);
begin
  QMCondArticulosEMPRESA.AsInteger := REntorno.Empresa;
  QMCondArticulosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondArticulosCANAL.AsInteger := REntorno.Canal;
  QMCondArticulosAGENTE.AsInteger := xAgentesAGENTE.AsInteger;
  QMCondArticulosAGRUPACION.AsString := xAgrupacionAGRUPACION.Value;
  QMCondArticulosACTIVO.AsInteger := 1;
  QMCondArticulosP_COMISION.AsFloat := 0;
  QMCondArticulosCOMISION_LINEAL.AsFloat := 0;
  xArticulos.Close;
end;

procedure TDMCondicionesAgeAgrupArt.QMCondArticulosAfterOpen(DataSet: TDataSet);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     Open;
  end;
end;

procedure TDMCondicionesAgeAgrupArt.QMCondFamiliasNewRecord(DataSet: TDataSet);
begin
  QMCondFamiliasEMPRESA.AsInteger := REntorno.Empresa;
  QMCondFamiliasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondFamiliasCANAL.AsInteger := REntorno.Canal;
  QMCondFamiliasAGENTE.AsInteger := xAgentesAGENTE.AsInteger;
  QMCondFamiliasAGRUPACION.AsString := xAgrupacionAGRUPACION.Value;
  QMCondFamiliasACTIVO.AsInteger := 1;
  QMCondFamiliasP_COMISION.AsFloat := 0;
  QMCondFamiliasCOMISION_LINEAL.AsFloat := 0;
  xFamilias.Close;
end;

procedure TDMCondicionesAgeAgrupArt.QMCondFamiliasAfterOpen(DataSet: TDataSet);
begin
  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     Open;
  end;
end;

procedure TDMCondicionesAgeAgrupArt.ControlaDupArt;
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
     Params.ByName['AGRUPACION'].AsString := QMCondArticulosAGRUPACION.Value;
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

procedure TDMCondicionesAgeAgrupArt.ControlaDupFam;
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
     Params.ByName['AGENTE'].AsInteger := QMCondFamiliasAGENTE.Value;
     Params.ByName['AGRUPACION'].AsString := QMCondFamiliasAGRUPACION.Value;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.Value;
     ExecQuery;
     if (HayDatos) then
        Duplicado := True;
     Close;
     FreeHandle;
  end;

  if Duplicado then
     raise Exception.Create(_('Clave duplicada'));
end;

procedure TDMCondicionesAgeAgrupArt.QMCondArticulosBeforePost(DataSet: TDataSet);
begin
  ControlaDupArt;
end;

procedure TDMCondicionesAgeAgrupArt.QMCondArticulosAfterCancel(DataSet: TDataSet);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     Open;
  end;
end;

procedure TDMCondicionesAgeAgrupArt.QMCondFamiliasAfterCancel(DataSet: TDataSet);
begin
  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     Open;
  end;
end;

procedure TDMCondicionesAgeAgrupArt.QMCondArticulosARTICULOChange(Sender: TField);
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

procedure TDMCondicionesAgeAgrupArt.QMCondFamiliasFAMILIAChange(Sender: TField);
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

procedure TDMCondicionesAgeAgrupArt.QMCondFamiliasBeforePost(DataSet: TDataSet);
begin
  ControlaDupFam;
end;

end.
