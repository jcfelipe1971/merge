unit UDMArtProveedor;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMArtProveedor = class(TDataModule)
     QMTarifasProv: TFIBTableSet;
     DSQMTarifasProv: TDataSource;
     QMTarifasProvArt: TFIBTableSet;
     DSQMTarifasProvArt: TDataSource;
     QMTarifasProvEMPRESA: TIntegerField;
     QMTarifasProvEJERCICIO: TIntegerField;
     QMTarifasProvCANAL: TIntegerField;
     QMTarifasProvPROVEEDOR: TIntegerField;
     QMTarifasProvTARIFA: TFIBStringField;
     QMTarifasProvTITULO: TFIBStringField;
     QMTarifasProvFECHA_INICIO: TDateTimeField;
     QMTarifasProvFECHA_FINAL: TDateTimeField;
     QMTarifasProvDESCUENTO1: TFloatField;
     QMTarifasProvDESCUENTO2: TFloatField;
     QMTarifasProvDESCUENTO3: TFloatField;
     QMTarifasProvArtEMPRESA: TIntegerField;
     QMTarifasProvArtEJERCICIO: TIntegerField;
     QMTarifasProvArtCANAL: TIntegerField;
     QMTarifasProvArtPROVEEDOR: TIntegerField;
     QMTarifasProvArtTARIFA: TFIBStringField;
     QMTarifasProvArtARTICULO: TFIBStringField;
     QMTarifasProvArtTITULO: TFIBStringField;
     QMTarifasProvArtARTICULO_PROVEEDOR: TFIBStringField;
     QMTarifasProvArtP_COSTE: TFloatField;
     SPIncrementoPorcentual: THYFIBQuery;
     xMonedas: TFIBDataSetRO;
     QMTarifasProvMONEDA: TFIBStringField;
     DSxMonedas: TDataSource;
     TLocal: THYTransaction;
     QArtProveedor: THYFIBQuery;
     SPCambiaMoneda: THYFIBQuery;
     TUpdate: THYTransaction;
     QMTarifasProvArtALFA_1: TFIBStringField;
     QMTarifasProvArtALFA_2: TFIBStringField;
     QMTarifasProvArtALFA_3: TFIBStringField;
     QMTarifasProvArtALFA_4: TFIBStringField;
     QMTarifasProvArtALFA_5: TFIBStringField;
     QMTarifasProvArtALFA_6: TFIBStringField;
     QMTarifasProvArtALFA_7: TFIBStringField;
     QMTarifasProvArtALFA_8: TFIBStringField;
     QMTarifasProvTITULO_PROVEEDOR: TFIBStringField;
     QMTarifasProvULT_MODIFICACION: TDateTimeField;
     QMTarifasProvArtULT_MODIFICACION: TDateTimeField;
     procedure DMArtProvCreate(Sender: TObject);
     procedure QMTarifasProvNewRecord(DataSet: TDataSet);
     procedure QMTarifasProvAfterOpen(DataSet: TDataSet);
     procedure QMTarifasProvArtARTICULOChange(Sender: TField);
     procedure QMTarifasProvArtNewRecord(DataSet: TDataSet);
     procedure QMTarifasProvArtBeforePost(DataSet: TDataSet);
     procedure QMTarifasProvBeforePost(DataSet: TDataSet);
     procedure QMTarifasProvArtBeforeInsert(DataSet: TDataSet);
     procedure QMTarifasProvArtBeforeEdit(DataSet: TDataSet);
     procedure QMTarifasProvMONEDAChange(Sender: TField);
     procedure QMTarifasProvBeforeEdit(DataSet: TDataSet);
     procedure QMTarifasProvAfterPost(DataSet: TDataSet);
     procedure QMTarifasProvPROVEEDORChange(Sender: TField);
     procedure QMTarifasProvBeforeClose(DataSet: TDataSet);
  private
     monedaold: string;
     procedure AbreQueries;
     procedure CambiaMonedaDetalle;
     { Private declarations }
  public
     LocalMascaraL: string;
     procedure MascarasMoneda;
     procedure IncPorcent(Porcent: double);
     procedure Refresca;
     procedure BusquedaCompleja;
     procedure DameDatos(var Articulo: string; var Proveedor: integer);
     procedure FiltrarAgrupacion(Agrupacion: string);
     procedure ModificarPrecioArtFiltrados(Precio: double);
     procedure TraspasaPreciosAArticulos(Proveedor: integer; tarifa: string);
  end;

var
  DMArtProveedor : TDMArtProveedor;

implementation

uses UDMMain, UUtiles, UDameDato, URecursos, UEntorno, UFMArtProveedor, UFBusca, UParam;

{$R *.DFM}

procedure TDMArtProveedor.DMArtProvCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreQueries;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMTarifasProvArt.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
end;

procedure TDMArtProveedor.AbreQueries;
begin
  AsignaDisplayFormat(QMTarifasProv, MascaraN, MascaraI, ShortDateFormat);
  QMTarifasProvDESCUENTO1.DisplayFormat := MascaraP;
  QMTarifasProvDESCUENTO2.DisplayFormat := MascaraP;
  QMTarifasProvDESCUENTO3.DisplayFormat := MascaraP;
  QMTarifasProvULT_MODIFICACION.DisplayFormat := ShortDateFormat + ' hh:nn';

  AsignaDisplayFormat(QMTarifasProvArt, MascaraN, MascaraI, ShortDateFormat);
  QMTarifasProvArtULT_MODIFICACION.DisplayFormat := ShortDateFormat + ' hh:nn';

  DMMain.FiltraTabla(QMTarifasProv, '11100', True);
  MascarasMoneda;
end;

procedure TDMArtProveedor.QMTarifasProvNewRecord(DataSet: TDataSet);
begin
  QMTarifasProvEMPRESA.AsInteger := REntorno.Empresa;
  QMTarifasProvEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMTarifasProvCANAL.AsInteger := REntorno.Canal;
  QMTarifasProvMONEDA.AsString := REntorno.Moneda;
  QMTarifasProvFECHA_INICIO.AsDateTime := REntorno.FechaTrab{SH};
  QMTarifasProvFECHA_FINAL.AsDateTime := REntorno.FechaTrab{SH};
end;

procedure TDMArtProveedor.QMTarifasProvAfterOpen(DataSet: TDataSet);
begin
  QMTarifasProvArt.Open;
  xMonedas.Open;
end;

procedure TDMArtProveedor.QMTarifasProvArtARTICULOChange(Sender: TField);
begin
  QMTarifasProvArtTITULO.AsString := DameTituloArticulo(Sender.AsString);

  // Obtenemos el código de proveedor
  with QArtProveedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PROVEEDOR'].AsInteger := QMTarifasProvArtPROVEEDOR.AsInteger;
     Params.ByName['ARTICULO'].AsString := QMTarifasProvArtARTICULO.AsString;
     ExecQuery;
     if (HayDatos) then
        QMTarifasProvArtARTICULO_PROVEEDOR.AsString :=
           FieldByName['CODIGO_PROVEEDOR'].AsString;
     FreeHandle;
  end;
end;

procedure TDMArtProveedor.QMTarifasProvArtNewRecord(DataSet: TDataSet);
begin
  if ((QMTarifasProv.State = dsInsert) or (QMTarifasProv.State = dsEdit)) then
  begin
     QMTarifasProv.Post;
     QMTarifasProvArt.Edit;
  end;

  QMTarifasProvArtEMPRESA.AsInteger := QMTarifasProvEMPRESA.AsInteger;
  QMTarifasProvArtEJERCICIO.AsInteger := QMTarifasProvEJERCICIO.AsInteger;
  QMTarifasProvArtCANAL.AsInteger := QMTarifasProvCANAL.AsInteger;
  QMTarifasProvArtPROVEEDOR.AsInteger := QMTarifasProvPROVEEDOR.AsInteger;
  QMTarifasProvArtTARIFA.AsString := QMTarifasProvTARIFA.AsString;
end;

procedure TDMArtProveedor.QMTarifasProvArtBeforePost(DataSet: TDataSet);
begin
  if ((QMTarifasProvArt.State = dsInsert) or (QMTarifasProvArt.State = dsEdit)) then
     QMTarifasProvArtARTICULO_PROVEEDOR.Value :=
        UpperCase(QMTarifasProvArtARTICULO_PROVEEDOR.Value);
end;

procedure TDMArtProveedor.QMTarifasProvBeforePost(DataSet: TDataSet);
begin
  if ((QMTarifasProv.State = dsInsert) or (QMTarifasProvArt.State = dsEdit)) then
     QMTarifasProvTARIFA.Value := UpperCase(QMTarifasProvTARIFA.Value);
end;

procedure TDMArtProveedor.QMTarifasProvArtBeforeInsert(DataSet: TDataSet);
begin
  if ((QMTarifasProv.State = dsInsert) or (QMTarifasProv.State = dsEdit)) then
     QMTarifasProv.Post;
end;

procedure TDMArtProveedor.QMTarifasProvArtBeforeEdit(DataSet: TDataSet);
begin
  if ((QMTarifasProv.State = dsInsert) or (QMTarifasProv.State = dsEdit)) then
     QMTarifasProv.Post;
end;

procedure TDMArtProveedor.IncPorcent(Porcent: double);
begin
  with SPIncrementoPorcentual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMTarifasProvEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMTarifasProvEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMTarifasProvCANAL.AsInteger;
     Params.ByName['PROVEEDOR'].AsInteger := QMTarifasProvPROVEEDOR.AsInteger;
     Params.ByName['TARIFA'].AsString := QMTarifasProvTARIFA.AsString;
     Params.ByName['INCREMENTO'].AsFloat := porcent;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMArtProveedor.Refresca;
begin
  QMTarifasProv.Refresh;
end;

procedure TDMArtProveedor.QMTarifasProvMONEDAChange(Sender: TField);
begin
  with xMonedas do
  begin
     Close;
     Open;
  end;
end;

procedure TDMArtProveedor.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTarifasProv, '11100');
end;

procedure TDMArtProveedor.DameDatos(var Articulo: string; var Proveedor: integer);
begin
  Articulo := QMTarifasProvArtARTICULO.AsString;
  Proveedor := QMTarifasProvArtPROVEEDOR.AsInteger;
end;

procedure TDMArtProveedor.MascarasMoneda;
begin
  LocalMascaraL := DMMain.MascaraMoneda(QMTarifasProvMONEDA.AsString, 0);
  QMTarifasProvArtP_COSTE.DisplayFormat := LocalMascaraL;
end;

procedure TDMArtProveedor.QMTarifasProvBeforeEdit(DataSet: TDataSet);
begin
  monedaold := QMTarifasProvMONEDA.AsString;
end;

procedure TDMArtProveedor.QMTarifasProvAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  if (monedaold <> QMTarifasProvMONEDA.AsString) then
     CambiaMonedaDetalle;
end;

procedure TDMArtProveedor.CambiaMonedaDetalle;
begin
  with SPCambiaMoneda do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMTarifasProvEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMTarifasProvEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMTarifasProvCANAL.AsInteger;
     Params.ByName['PROVEEDOR'].AsInteger := QMTarifasProvPROVEEDOR.AsInteger;
     Params.ByName['TARIFA'].AsString := QMTarifasProvTARIFA.AsString;
     Params.ByName['MONEDAOLD'].AsString := monedaold;
     Params.ByName['MONEDA'].AsString := QMTarifasProvMONEDA.AsString;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMArtProveedor.QMTarifasProvPROVEEDORChange(Sender: TField);
begin
  QMTarifasProvTITULO_PROVEEDOR.AsString := DameTituloProveedor(QMTarifasProvPROVEEDOR.AsInteger);
end;

procedure TDMArtProveedor.QMTarifasProvBeforeClose(DataSet: TDataSet);
begin
  QMTarifasProvArt.Close;
  xMonedas.Close;
end;

procedure TDMArtProveedor.FiltrarAgrupacion(Agrupacion: string);
begin
  Agrupacion := Trim(Copy(Agrupacion, 1, 3));
  with QMTarifasProvArt do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_ART_TARIFAS_PROV_DETALLE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add('   EMPRESA=?EMPRESA AND ');
     SelectSQL.Add('   EJERCICIO=?EJERCICIO AND ');
     SelectSQL.Add('   CANAL=?CANAL AND ');
     SelectSQL.Add('   PROVEEDOR=?PROVEEDOR AND ');
     SelectSQL.Add('   TARIFA=?TARIFA ');
     if (Agrupacion <> '') then
        SelectSQL.Add('   AND ARTICULO IN (SELECT ARTICULO FROM EMP_AGRUPACIONES_ART WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND AGRUPACION = ''' + Agrupacion + ''') ');
     SelectSQL.Add(' ORDER BY ARTICULO ');
     Open;
  end;
end;

procedure TDMArtProveedor.ModificarPrecioArtFiltrados(Precio: double);
begin
  with QMTarifasProvArt do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           Edit;
           QMTarifasProvArtP_COSTE.AsFloat := Precio;
           Post;
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMArtProveedor.TraspasaPreciosAArticulos(Proveedor: integer; Tarifa: string);
begin
  /// Traspasa los precios de una tarifa de proveedor a P_COSTE del articulo

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_PREC_COSTE_TARIFA_PROV_A_ART (?EMPRESA, ?EJERCICIO, ?CANAL, ?TARIFA, ?PROVEEDOR)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
