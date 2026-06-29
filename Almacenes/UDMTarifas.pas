unit UDMTarifas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMTarifas = class(TDataModule)
     QMTarifas: TFIBTableSet;
     QMTarifasEMPRESA: TIntegerField;
     QMTarifasTARIFA: TFIBStringField;
     QMTarifasTITULO: TFIBStringField;
     QMTarifasACTIVA: TIntegerField;
     QMTarifasMONEDA: TFIBStringField;
     DSQMTarifas: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleTARIFA: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCALCULO: TIntegerField;
     QMDetalleTIT_CALCULO: TFIBStringField;
     QMDetalleUNID_MINIMAS: TFloatField;
     QMDetalleUNID_MAXIMAS: TFloatField;
     QMTarifasIVA_INCLUIDO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMTarifasCreate(Sender: TObject);
     procedure QMTarifasNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMTarifasMONEDAChange(Sender: TField);
     procedure QMDetalleCALCULOChange(Sender: TField);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMTarifasAfterOpen(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMTarifasBeforeEdit(DataSet: TDataSet);
  private
     { Private declarations }
     LocalMascaraE: string;
     MonedaOld: string;
     procedure RefrescaDetalle;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure CambiaMascara;
     procedure GrabaCabacera;
     procedure RecalculaTarifa;
     procedure RecalculaPrecioMercado;
  end;

var
  DMTarifas : TDMTarifas;

implementation

uses UDMMain, UEntorno, UFBusca, DateUtils, UUtiles, UFMSeleccion, UDameDato;

{$R *.DFM}

procedure TDMTarifas.DMTarifasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMTarifas, '10000', True);
  CambiaMascara;
end;

procedure TDMTarifas.QMTarifasNewRecord(DataSet: TDataSet);
begin
  QMTarifasEMPRESA.AsInteger := REntorno.Empresa;
  QMTarifasACTIVA.AsInteger := 1;
  QMTarifasIVA_INCLUIDO.AsInteger := 0;
  QMTarifasMONEDA.AsString := REntorno.Moneda;
end;

procedure TDMTarifas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  if (MonedaOld <> QMTarifasMONEDA.AsString) then
     RecalculaTarifa;
end;

procedure TDMTarifas.QMTarifasMONEDAChange(Sender: TField);
begin
  CambiaMascara;
end;

procedure TDMTarifas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTarifas, '10000');
end;

procedure TDMTarifas.CambiaMascara;
begin
  LocalMascaraE := DMMain.MascaraMoneda(QMTarifasMONEDA.AsString, 0);
end;

procedure TDMTarifas.GrabaCabacera;
begin
  if ((QMTarifas.State = dsInsert) or (QMTarifas.State = dsEdit)) then
     QMTarifas.Post;
end;

procedure TDMTarifas.QMDetalleCALCULOChange(Sender: TField);
begin
  QMDetalleTIT_CALCULO.AsString := DameTituloCalculo(QMDetalle.FieldByName('CALCULO').AsInteger);
end;

procedure TDMTarifas.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMTarifas.State = dsInsert) or (QMTarifas.State = dsEdit)) then
  begin
     QMDetalle.Cancel;
     QMTarifas.Post;
     QMTarifas.Refresh;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleTARIFA.AsString := QMTarifasTARIFA.AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_TARIFAS_D_LINEA(:EMPRESA, :TARIFA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARIFA'].AsString := QMTarifasTARIFA.AsString;
        ExecQuery;
        QMDetalleLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTarifas.QMTarifasAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TDMTarifas.RefrescaDetalle;
begin
  // Trato de posicionarme en la linea que acabo de modificar
  Refrescar(QMDetalle, 'LINEA', QMDetalleLINEA.AsInteger, False, True);
end;

procedure TDMTarifas.QMDetalleAfterPost(DataSet: TDataSet);
begin
  RefrescaDetalle;
end;

procedure TDMTarifas.RecalculaTarifa;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_TARIFAS_AJUSTA_TAR_B(:EMPRESA, :TARIFA, :ENTRADA, :MONEDAOLD)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARIFA'].AsString := QMTarifasTARIFA.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MONEDAOLD'].AsString := MonedaOld;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTarifas.QMTarifasBeforeEdit(DataSet: TDataSet);
begin
  MonedaOld := QMTarifasMONEDA.AsString;
end;

procedure TDMTarifas.RecalculaPrecioMercado;
var
  Factor : double;
  Fecha : TDateTime;
begin
  // Esto lo utiliza TDP Dominicana
  // Busco Factor de Cambio + Cargo Lineal para recalcular el precio de mercado.
  // P_MERADO = P_MANUAL * (FACTOR + CARGO_LINEAL)

  Fecha := Now;
  if (PideDato('DTM', Fecha, _('Fecha de cambio de moneda'))) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST(1) (CAMBIO + CARGO_LINEAL) AS FACTOR ');
           SQL.Add(' FROM SYS_MONEDAS_CAMBIOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ORIGEN = :ORIGEN AND ');
           SQL.Add(' DESTINO = :DESTINO AND ');
           SQL.Add(' ((:FECHA BETWEEN F_ALTA AND F_BAJA) or (:FECHA > F_ALTA AND F_BAJA IS NULL)) ');
           SQL.Add(' ORDER BY F_ALTA DESC ');
           Params.ByName['ORIGEN'].AsString := 'USD';
           Params.ByName['DESTINO'].AsString := 'DOM';
           Params.ByName['FECHA'].AsDateTime := Fecha;
           ExecQuery;
           Factor := FieldByName['FACTOR'].AsFloat;
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
           SQL.Text := 'UPDATE ART_ARTICULOS_PRECIOS SET ENTRADA = :ENTRADA, PRECIO_MERCADO = PRECIO_MANUAL * (:FACTOR) WHERE EMPRESA = :EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['FACTOR'].AsFloat := Factor;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
