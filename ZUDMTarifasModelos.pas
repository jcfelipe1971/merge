unit ZUDMTarifasModelos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, Dialogs;

type
  TZDMTarifasModelos = class(TDataModule)
     TLocal: THYTransaction;
     QMPreciosCab: TFIBTableSet;
     DSPreciosCab: TDataSource;
     QMPreciosCabEMPRESA: TIntegerField;
     QMPreciosCabMODELO: TFIBStringField;
     QMPreciosCabTIPO_LONA: TFIBStringField;
     QMPreciosCabTARIFA: TFIBStringField;
     QMPreciosCabDESCRIPCIO: TFIBStringField;
     QMPreciosCabFECHA_CREACION: TDateTimeField;
     QMPreciosCabID_CAB: TIntegerField;
     QMPreciosDet: TFIBTableSet;
     DSPreciosDet: TDataSource;
     QMPreciosDetEMPRESA: TIntegerField;
     QMPreciosDetMODELO: TFIBStringField;
     QMPreciosDetTIPO_LONA: TFIBStringField;
     QMPreciosDetTARIFA: TFIBStringField;
     QMPreciosDetARTICULO: TFIBStringField;
     QMPreciosDetP_COSTE: TFloatField;
     QMPreciosDetP_VENTA: TFloatField;
     QMPreciosDetMARGEN: TFloatField;
     QMPreciosDetLINEA: TIntegerField;
     QMPreciosDetSALIDA: TIntegerField;
     QMPreciosDetMULTIPLO: TIntegerField;
     QMPreciosDetTOTAL_LINEA: TIntegerField;
     QMPreciosDetTOTAL_SALIDA: TIntegerField;
     QMPreciosDetTOTAL_M2_LONA: TFloatField;
     QMPreciosDetID_CAB: TIntegerField;
     QMPreciosDetP_VENTA_MODIFICADO: TFloatField;
     QMPreciosDetP_COSTE_ARMAZON: TFloatField;
     QMPreciosDetP_COSTE_LONA: TFloatField;
     QMPreciosDetP_VENTA_ARMAZON: TFloatField;
     QMPreciosDetP_VENTA_LONA: TFloatField;
     QMPreciosDetARMAZON: TFIBStringField;
     QMPreciosDetP_COSTE_FABRICACION: TFloatField;
     QMPreciosDetP_VENTA_FABRICACION: TFloatField;
     QMPreciosDetLONA: TFIBStringField;
     QMPreciosDetBLOQUEO_PVENTA: TIntegerField;
     QMPreciosDetmargen_cent: TFloatField;
     QMPreciosCabTARIFA_DEFECTO: TIntegerField;
     QMPreciosCabTIPO_ESCANDALLO: TIntegerField;
     QMPreciosDetColor: TFIBTableSet;
     QMPreciosDetColormargen_cent: TFloatField;
     DSPreciosDetColor: TDataSource;
     QMPreciosDetColorEMPRESA: TIntegerField;
     QMPreciosDetColorMODELO: TFIBStringField;
     QMPreciosDetColorTIPO_LONA: TFIBStringField;
     QMPreciosDetColorTARIFA: TFIBStringField;
     QMPreciosDetColorARTICULO: TFIBStringField;
     QMPreciosDetColorP_COSTE: TFloatField;
     QMPreciosDetColorP_VENTA: TFloatField;
     QMPreciosDetColorMARGEN: TFloatField;
     QMPreciosDetColorLINEA: TIntegerField;
     QMPreciosDetColorSALIDA: TIntegerField;
     QMPreciosDetColorMULTIPLO: TIntegerField;
     QMPreciosDetColorTOTAL_LINEA: TIntegerField;
     QMPreciosDetColorTOTAL_SALIDA: TIntegerField;
     QMPreciosDetColorTOTAL_M2_LONA: TFloatField;
     QMPreciosDetColorID_CAB: TIntegerField;
     QMPreciosDetColorP_VENTA_MODIFICADO: TFloatField;
     QMPreciosDetColorP_COSTE_ARMAZON: TFloatField;
     QMPreciosDetColorP_COSTE_LONA: TFloatField;
     QMPreciosDetColorP_VENTA_ARMAZON: TFloatField;
     QMPreciosDetColorP_VENTA_LONA: TFloatField;
     QMPreciosDetColorARMAZON: TFIBStringField;
     QMPreciosDetColorP_COSTE_FABRICACION: TFloatField;
     QMPreciosDetColorP_VENTA_FABRICACION: TFloatField;
     QMPreciosDetColorLONA: TFIBStringField;
     QMPreciosDetColorBLOQUEO_PVENTA: TIntegerField;
     QMPreciosDetColorCOLOR: TIntegerField;
     QMPreciosDetCOLOR2: TIntegerField;
     QMPreciosDetP_VENTA_ARMAZON_MODIFICADO: TFloatField;
     QMPreciosDetColorP_VENTA_ARMAZON_MODIFICADO: TFloatField;
     QMPreciosDetMARGEN_ARMAZON: TFloatField;
     QMPreciosDetmargen_armazon_cent: TFloatField;
     QMPreciosDetColorMARGEN_ARMAZON: TFloatField;
     QMPreciosDetColormargen_armazon_cent: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPreciosCabAfterOpen(DataSet: TDataSet);
     procedure QMPreciosCabNewRecord(DataSet: TDataSet);
     procedure QMPreciosDetCalcFields(DataSet: TDataSet);
     procedure QMPreciosDetColorCalcFields(DataSet: TDataSet);
     procedure QMPreciosCabBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure GeneraPreciosModelo;
     procedure Bloquear(BloqueaPrecioVenta, Color: integer);
     procedure BusquedaCompleja;
     procedure CambioMargen(Modelo, Tipo_Lona, Tarifa: string; Margen: double; Modo: integer);
     function DameTipoModelo(Modelo: string): string;
  end;

var
  ZDMTarifasModelos : TZDMTarifasModelos;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles;

{$R *.dfm}

procedure TZDMTarifasModelos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Format camps
  AsignaDisplayFormat(QMPreciosCab, MascaraN, MascaraI, ShortDateFormat);

  AsignaDisplayFormat(QMPreciosDet, MascaraN, MascaraI, ShortDateFormat);
  QMPreciosDetmargen_cent.DisplayFormat := MascaraP;
  QMPreciosDetmargen_armazon_cent.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMPreciosDetColor, MascaraN, MascaraI, ShortDateFormat);

  QMPreciosCab.Close;
  QMPreciosCab.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMPreciosCab.Open;
end;

/// Bloquea o desbloquea TODOS los registros detalle
procedure TZDMTarifasModelos.Bloquear(BloqueaPrecioVenta, Color: integer);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Add(' UPDATE Z_MODELOS_PRECIOS_DET ');
        SQL.Add(' SET ');
        SQL.Add(' BLOQUEO_PVENTA = :BLOQUEO_PVENTA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' MODELO = :MODELO AND ');
        SQL.Add(' TIPO_LONA = :TIPO_LONA AND ');
        SQL.Add(' TARIFA = :TARIFA AND ');
        SQL.Add(' COLOR = :COLOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MODELO'].AsString := QMPreciosCabMODELO.AsString;
        Params.ByName['TIPO_LONA'].AsString := QMPreciosCabTIPO_LONA.AsString;
        Params.ByName['TARIFA'].AsString := QMPreciosCabTARIFA.AsString;
        Params.ByName['BLOQUEO_PVENTA'].AsFloat := BloqueaPrecioVenta;
        Params.ByName['COLOR'].AsInteger := Color;
        prepare;
        ExecQuery;
     finally
        Free;
     end;
  end;

  Refrescar(QMPreciosCab, 'ID_CAB', QMPreciosCabID_CAB.AsInteger);
end;

procedure TZDMTarifasModelos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPreciosCab, '10000');
end;

procedure TZDMTarifasModelos.GeneraPreciosModelo;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_DAME_MODELOS_PRECIOS(:EMPRESA, :MODELO, :TARIFA_MODELO, :TIPO_LONA)';
        Params.ByName['EMPRESA'].AsInteger := QMPreciosCabEMPRESA.AsInteger;
        Params.ByName['MODELO'].AsString := QMPreciosCabMODELO.AsString;
        Params.ByName['TARIFA_MODELO'].AsString := QMPreciosCabTARIFA.AsString;
        Params.ByName['TIPO_LONA'].AsString := QMPreciosCabTIPO_LONA.AsString;
        prepare;
        ExecQuery;
     finally
        Free;
     end;
  end;

  Refrescar(QMPreciosCab, 'ID_CAB', QMPreciosCabID_CAB.AsInteger);

  if (QMPreciosDet.RecordCount = 0) then
     ShowMessage(_('Es posible que deba generar el proceso de "Recrear Toldos" o propagar la tarifa de venta'))
  else
     ShowMessage(_('Proceso finalizado'));
end;

procedure TZDMTarifasModelos.QMPreciosCabAfterOpen(DataSet: TDataSet);
begin
  QMPreciosDet.Open;
  QMPreciosDetColor.Open;
end;

procedure TZDMTarifasModelos.QMPreciosCabBeforeClose(DataSet: TDataSet);
begin
  QMPreciosDet.Close;
  QMPreciosDetColor.Close;
end;

procedure TZDMTarifasModelos.QMPreciosCabNewRecord(DataSet: TDataSet);
begin
  QMPreciosCabEMPRESA.AsInteger := REntorno.Empresa;
  QMPreciosCabFECHA_CREACION.AsDateTime := Date;
end;

procedure TZDMTarifasModelos.QMPreciosDetCalcFields(DataSet: TDataSet);
var
  calcul : real;
begin
  if ((QMPreciosDetP_VENTA_MODIFICADO.AsFloat <> 0) and (QMPreciosDetP_COSTE.AsFloat <> 0)) then
  begin
     calcul := ((QMPreciosDetP_COSTE.AsFloat * 100) / (QMPreciosDetP_VENTA_MODIFICADO.AsFloat));
     QMPreciosDetmargen_cent.AsFloat := 100 - calcul;
  end
  else
     QMPreciosDetmargen_cent.AsFloat := 0;

  if ((QMPreciosDetP_VENTA_ARMAZON_MODIFICADO.AsFloat <> 0) and (QMPreciosDetP_COSTE_ARMAZON.AsFloat <> 0)) then
  begin
     calcul := ((QMPreciosDetP_COSTE_ARMAZON.AsFloat * 100) / (QMPreciosDetP_VENTA_ARMAZON_MODIFICADO.AsFloat));
     QMPreciosDetmargen_armazon_cent.AsFloat := 100 - calcul;
  end
  else
     QMPreciosDetmargen_armazon_cent.AsFloat := 0;
end;

procedure TZDMTarifasModelos.CambioMargen(Modelo, Tipo_Lona, Tarifa: string; Margen: double; Modo: integer);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.DataBase;
        AutoTrans := True;
        SQL.Text := 'EXECUTE PROCEDURE Z_MODELO_CAMBIA_MARGEN(:EMPRESA, :MODELO, :TIPO_LONA, :TARIFA, :MARGEN, :MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['TIPO_LONA'].AsString := Tipo_Lona;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['MARGEN'].AsFloat := Margen;
        Params.ByName['MODO'].AsInteger := Modo;
        prepare;
        ExecQuery;
     finally
        Free;
     end;
  end;

  Refrescar(QMPreciosCab, 'ID_CAB', QMPreciosCabID_CAB.AsInteger);
end;

procedure TZDMTarifasModelos.QMPreciosDetColorCalcFields(DataSet: TDataSet);
var
  calcul : real;
begin
  if ((QMPreciosDetColorP_VENTA_MODIFICADO.AsFloat <> 0) and (QMPreciosDetColorP_COSTE.AsFloat <> 0)) then
  begin
     calcul := ((QMPreciosDetColorP_COSTE.AsFloat * 100) / (QMPreciosDetColorP_VENTA_MODIFICADO.AsFloat));
     QMPreciosDetColormargen_cent.AsFloat := 100 - calcul;
  end
  else
     QMPreciosDetColormargen_cent.AsFloat := 0;

  if ((QMPreciosDetColorP_VENTA_ARMAZON_MODIFICADO.AsFloat <> 0) and (QMPreciosDetColorP_COSTE_ARMAZON.AsFloat <> 0)) then
  begin
     calcul := ((QMPreciosDetColorP_COSTE_ARMAZON.AsFloat * 100) / (QMPreciosDetColorP_VENTA_ARMAZON_MODIFICADO.AsFloat));
     QMPreciosDetColormargen_armazon_cent.AsFloat := 100 - calcul;
  end
  else
     QMPreciosDetColormargen_armazon_cent.AsFloat := 0;
end;

function TZDMTarifasModelos.DameTipoModelo(Modelo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_MODELO FROM Z_SYS_MODELOS WHERE CODIGO = :CODIGO';
        Params.ByName['CODIGO'].AsString := Modelo;
        ExecQuery;
        Result := FieldByName['TIPO_MODELO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
