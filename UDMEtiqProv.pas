unit UDMEtiqProv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, FIBQuery, DB, FIBDataSet, FIBTableDataSet,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, HYFIBQuery, frxClass, frxDBSet,
  frxHYReport;

type
  TDMEtiqProv = class(TDataModule)
     QMEtiqProvCab: TFIBTableSet;
     DSQMEtiqProvCab: TDataSource;
     QMEtiqProvDetalle: TFIBTableSet;
     DSQMEtiqProvDetalle: TDataSource;
     TLocal: THYTransaction;
     QMEtiqProvCabEMPRESA: TIntegerField;
     QMEtiqProvCabEJERCICIO: TIntegerField;
     QMEtiqProvCabCANAL: TIntegerField;
     QMEtiqProvCabNUMERO: TIntegerField;
     QMEtiqProvCabTITULO: TFIBStringField;
     QMEtiqProvDetalleEMPRESA: TIntegerField;
     QMEtiqProvDetalleEJERCICIO: TIntegerField;
     QMEtiqProvDetalleCANAL: TIntegerField;
     QMEtiqProvDetalleNUMERO: TIntegerField;
     QMEtiqProvDetalleLINEA: TIntegerField;
     QMEtiqProvDetallePROVEEDOR: TIntegerField;
     QMEtiqProvDetalleNUM_COPIAS: TIntegerField;
     QMEtiqProvDetalleTITULO: TFIBStringField;
     QMEtiqProvDetalleTERCERO: TIntegerField;
     frEtiqProv: TfrHYReport;
     frDBQMEtiqProvDetalle: TfrDBDataSet;
     frUserDSEtiqProv: TfrUserDataset;
     QMEtiqListado: TFIBTableSet;
     DSQMEtiqListado: TDataSource;
     QMEtiqListadoEMPRESA: TIntegerField;
     QMEtiqListadoEJERCICIO: TIntegerField;
     QMEtiqListadoCANAL: TIntegerField;
     QMEtiqListadoNUMERO: TIntegerField;
     QMEtiqListadoLINEA: TIntegerField;
     QMEtiqListadoPROVEEDOR: TIntegerField;
     QMEtiqListadoNUM_COPIAS: TIntegerField;
     QMEtiqListadoTITULO: TFIBStringField;
     QMEtiqListadoTERCERO: TIntegerField;
     SPLineaSiguiente: THYFIBQuery;
     QNomProv: THYFIBQuery;
     QDatosProv: THYFIBQuery;
     SPAddAgrupacion: THYFIBQuery;
     frxEtiqProv: TfrxHYReport;
     frxDBQMEtiqProvDetalle: TfrxDBDataset;
     frxUserDSEtiqProv: TfrxUserDataSet;
     TUpdate: THYTransaction;
     procedure DMEtiqProvCreate(Sender: TObject);
     procedure DMEtiqProvDestroy(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMEtiqProvCabAfterOpen(DataSet: TDataSet);
     procedure QMEtiqProvCabBeforePost(DataSet: TDataSet);
     procedure QMEtiqProvCabNewRecord(DataSet: TDataSet);
     procedure QMEtiqProvDetalleNewRecord(DataSet: TDataSet);
     procedure QMEtiqProvDetallePROVEEDORChange(Sender: TField);
     procedure frDBQMEtiqProvDetalleFirst(Sender: TObject);
     procedure frDBQMEtiqProvDetalleNext(Sender: TObject);
     procedure frEtiqProvGetValue(const ParName: string; var ParValue: variant);
     procedure frEtiqProvEnterRect(Memo: TStringList; View: TfrView);
     procedure frxEtiqProvBeforePrint(Sender: TfrxReportComponent);
     procedure frxDBQMEtiqProvDetalleFirst(Sender: TObject);
     procedure frxDBQMEtiqProvDetalleNext(Sender: TObject);
     procedure frxEtiqProvGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     NombreProv, DirProv, CPProv, PobProv, ProvProv, PaisProv: string;
     EtiqVacias: integer;
     HayEtiqVacias: boolean;
     function Calcular_Linea_Sig: integer;
     procedure Actualizar_Nombre_Prov;
     procedure RegenerarProv(tercero: integer);
  public
     { Public declarations }
     procedure ImprimirEtiquetas(Etiq, Modo: integer);
     procedure AddAgrupacion(Agrupacion: string);
  end;

var
  DMEtiqProv : TDMEtiqProv;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.DFM}

procedure TDMEtiqProv.DMEtiqProvCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMEtiqProvCab, '11100', True);
  AbreData(TDMListados, DMListados);  // Abrir DM de Listados
end;

procedure TDMEtiqProv.DMEtiqProvDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMEtiqProv.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

{ **********  Métodos de la cabecera  ********** }

procedure TDMEtiqProv.QMEtiqProvCabAfterOpen(DataSet: TDataSet);
begin
  QMEtiqProvDetalle.Open;
end;

procedure TDMEtiqProv.QMEtiqProvCabBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMEtiqProvCabNUMERO.AsInteger = 0)) then
     QMEtiqProvCabNUMERO.AsInteger := DMMain.Contador_EEC('ETP');  // contador
end;

procedure TDMEtiqProv.QMEtiqProvCabNewRecord(DataSet: TDataSet);
begin
  QMEtiqProvCabEMPRESA.AsInteger := REntorno.Empresa;
  QMEtiqProvCabEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMEtiqProvCabCANAL.AsInteger := REntorno.Canal;
  QMEtiqProvCabNUMERO.AsInteger := 0;
end;

{ **********  Métodos del detalle  ********** }

procedure TDMEtiqProv.QMEtiqProvDetalleNewRecord(DataSet: TDataSet);
begin
  // Antes de grabar el detalle, grabamos la cabecera
  if ((QMEtiqProvCab.State = dsInsert) or (QMEtiqProvCab.State = dsEdit)) then
  begin
     QMEtiqProvCab.Post;
     QMEtiqProvDetalle.Edit;
  end;

  // Valores por defecto
  QMEtiqProvDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMEtiqProvDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMEtiqProvDetalleCANAL.AsInteger := REntorno.Canal;
  QMEtiqProvDetalleNUMERO.AsInteger := QMEtiqProvCabNUMERO.AsInteger;
  QMEtiqProvDetalleNUM_COPIAS.AsInteger := 1;

  QMEtiqProvDetalleLINEA.AsInteger := Calcular_Linea_Sig;
end;

function TDMEtiqProv.Calcular_Linea_Sig: integer;
begin
  // Calculamos el número de línea siguiente
  with SPLineaSiguiente do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Numero'].AsInteger := QMEtiqProvDetalleNUMERO.AsInteger;
     ExecQuery;
     Result := FieldByName['Linea'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMEtiqProv.Actualizar_Nombre_Prov;
begin
  with QNomProv do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Proveedor'].AsInteger := QMEtiqProvDetallePROVEEDOR.AsInteger;
     ExecQuery;
     QMEtiqProvDetalleTITULO.AsString := FieldByName['Titulo'].AsString;
     FreeHandle;
  end;
end;

procedure TDMEtiqProv.QMEtiqProvDetallePROVEEDORChange(Sender: TField);
begin
  Actualizar_Nombre_Prov;
end;

{ ************************************************* }

procedure TDMEtiqProv.ImprimirEtiquetas(Etiq, Modo: integer);
var
  str : string;
begin
  with QMEtiqListado do
  begin
     Close;
     Open;
  end;

  EtiqVacias := Etiq;
  DMListados.Cargar(71, ''); // Cargar grupo
  if (REntorno.TipoListado = 'FRF') then
  begin
     frEtiqProv.LoadFromFIB(REntorno.Formato, str);
     frEtiqProv.PrepareReport;
     frEtiqProv.ShowPreparedReport;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxEtiqProv.LoadFromFIB(REntorno.Formato, str);
     frxEtiqProv.PrepareReport;
     frxEtiqProv.ShowPreparedReport;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMEtiqProv.frDBQMEtiqProvDetalleFirst(Sender: TObject);
begin
  HayEtiqVacias := (EtiqVacias > 0);
  if (HayEtiqVacias) then
     frUserDSEtiqProv.RangeEndCount := EtiqVacias
  else
  begin
     frUserDSEtiqProv.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarProv(QMEtiqListadoTERCERO.AsInteger);
  end;
end;

procedure TDMEtiqProv.frDBQMEtiqProvDetalleNext(Sender: TObject);
begin
  if (HayEtiqVacias) then
  begin
     HayEtiqVacias := False;
     // Después de visualizar las etiquetas vacias, hay que regenerar
     // el origen de los datos
     QMEtiqListado.Close;
     QMEtiqListado.Open;
     frUserDSEtiqProv.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarProv(QMEtiqListadoTERCERO.AsInteger);
  end
  else
  begin
     frUserDSEtiqProv.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarProv(QMEtiqListadoTERCERO.AsInteger);
  end;
end;

procedure TDMEtiqProv.frEtiqProvGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Nombre' then
     ParValue := NombreProv;
  if ParName = 'Direccion' then
     ParValue := DirProv;
  if ParName = 'CP' then
     ParValue := CPProv;
  if ParName = 'Poblacion' then
     ParValue := PobProv;
  if ParName = 'Provincia' then
     ParValue := ProvProv;
  if ParName = 'Pais' then
     ParValue := PaisProv;
end;

procedure TDMEtiqProv.RegenerarProv(tercero: integer);
begin
  with QDatosProv do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := tercero;
     ExecQuery;
     NombreProv := QMEtiqListadoTITULO.AsString;
     DirProv := FieldByName['Direccion'].AsString;
     CPProv := FieldByName['CodPostal'].AsString;
     PobProv := FieldByName['Poblacion'].AsString;
     ProvProv := FieldByName['Provincia'].AsString;
     PaisProv := FieldByName['Pais'].AsString;
     FreeHandle;
  end;
end;

procedure TDMEtiqProv.frEtiqProvEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[Nombre]') then
        View.Visible := (not HayEtiqVacias);  // Si HayEtiqVacias => Invisible
  end;
end;

procedure TDMEtiqProv.AddAgrupacion(Agrupacion: string);
begin
  if ((QMEtiqProvCab.State = dsInsert) or
     (QMEtiqProvCab.State = dsEdit)) then
     QMEtiqProvCab.Post;

  if ((QMEtiqProvDetalle.State = dsInsert) or
     (QMEtiqProvDetalle.State = dsEdit)) then
     QMEtiqProvDetalle.Post;

  with SPAddAgrupacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     ExecQuery;
     FreeHandle;
  end;

  QMEtiqProvCab.Close;
  QMEtiqProvCab.Open;
  QMEtiqProvCab.Last;
end;

procedure TDMEtiqProv.frxEtiqProvBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[Nombre]', Memo[0]) > 0 then
              Visible := (not HayEtiqVacias);  // Si HayEtiqVacias => Invisible
        end;
end;

procedure TDMEtiqProv.frxDBQMEtiqProvDetalleFirst(Sender: TObject);
begin
  HayEtiqVacias := (EtiqVacias > 0);
  if (HayEtiqVacias) then
     frxUserDSEtiqProv.RangeEndCount := EtiqVacias
  else
  begin
     frxUserDSEtiqProv.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarProv(QMEtiqListadoTERCERO.AsInteger);
  end;
end;

procedure TDMEtiqProv.frxDBQMEtiqProvDetalleNext(Sender: TObject);
begin
  if (HayEtiqVacias) then
  begin
     HayEtiqVacias := False;
     // Después de visualizar las etiquetas vacias, hay que regenerar
     // el origen de los datos
     QMEtiqListado.Close;
     QMEtiqListado.Open;
     frxUserDSEtiqProv.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarProv(QMEtiqListadoTERCERO.AsInteger);
  end
  else
  begin
     frxUserDSEtiqProv.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarProv(QMEtiqListadoTERCERO.AsInteger);
  end;
end;

procedure TDMEtiqProv.frxEtiqProvGetValue(const VarName: string; var Value: variant);
begin
  frEtiqProvGetValue(VarName, Value);
end;

end.
