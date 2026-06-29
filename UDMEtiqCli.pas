unit UDMEtiqCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, HYFIBQuery, frxClass,
  frxHYReport, frxDBSet;

type
  TDMEtiqCli = class(TDataModule)
     TLocal: THYTransaction;
     QMEtiqCliCab: TFIBTableSet;
     DSQMEtiqCliCab: TDataSource;
     QMEtiqCliDetalle: TFIBTableSet;
     DSQMEtiqCliDetalle: TDataSource;
     QMEtiqCliCabEMPRESA: TIntegerField;
     QMEtiqCliCabEJERCICIO: TIntegerField;
     QMEtiqCliCabCANAL: TIntegerField;
     QMEtiqCliCabNUMERO: TIntegerField;
     QMEtiqCliCabTITULO: TFIBStringField;
     SPLineaSiguiente: THYFIBQuery;
     QNomCliente: THYFIBQuery;
     QMEtiqCliDetalleEMPRESA: TIntegerField;
     QMEtiqCliDetalleEJERCICIO: TIntegerField;
     QMEtiqCliDetalleCANAL: TIntegerField;
     QMEtiqCliDetalleNUMERO: TIntegerField;
     QMEtiqCliDetalleLINEA: TIntegerField;
     QMEtiqCliDetalleCLIENTE: TIntegerField;
     QMEtiqCliDetalleNUM_COPIAS: TIntegerField;
     QMEtiqCliDetalleTITULO: TFIBStringField;
     QMEtiqCliDetalleTERCERO: TIntegerField;
     frEtiqCli: TfrHYReport;
     frDBQMEtiqCliDetalle: TfrDBDataSet;
     frUserDSEtiqCli: TfrUserDataset;
     QMEtiqListado: TFIBTableSet;
     DSQMEtiqListado: TDataSource;
     QMEtiqListadoEMPRESA: TIntegerField;
     QMEtiqListadoEJERCICIO: TIntegerField;
     QMEtiqListadoCANAL: TIntegerField;
     QMEtiqListadoNUMERO: TIntegerField;
     QMEtiqListadoLINEA: TIntegerField;
     QMEtiqListadoCLIENTE: TIntegerField;
     QMEtiqListadoNUM_COPIAS: TIntegerField;
     QMEtiqListadoTITULO: TFIBStringField;
     QMEtiqListadoTERCERO: TIntegerField;
     QDatosCliente: THYFIBQuery;
     QMEtiqCliDetalleDIRECC: TIntegerField;
     QMEtiqListadoDIRECC: TIntegerField;
     QDameTercero: THYFIBQuery;
     SPAddAgrupacion: THYFIBQuery;
     frxEtiqCli: TfrxHYReport;
     frxDBQMEtiqCliDetalle: TfrxDBDataset;
     frxUserDSEtiqCli: TfrxUserDataSet;
     TUpdate: THYTransaction;
     procedure DMEtiqCliCreate(Sender: TObject);
     procedure DMEtiqCliDestroy(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMEtiqCliCabAfterOpen(DataSet: TDataSet);
     procedure QMEtiqCliCabBeforePost(DataSet: TDataSet);
     procedure QMEtiqCliCabNewRecord(DataSet: TDataSet);
     procedure QMEtiqCliDetalleNewRecord(DataSet: TDataSet);
     procedure QMEtiqCliDetalleCLIENTEChange(Sender: TField);
     procedure frDBQMEtiqCliDetalleFirst(Sender: TObject);
     procedure frDBQMEtiqCliDetalleNext(Sender: TObject);
     procedure frEtiqCliGetValue(const ParName: string; var ParValue: variant);
     procedure frEtiqCliEnterRect(Memo: TStringList; View: TfrView);
     procedure frxEtiqCliBeforePrint(Sender: TfrxReportComponent);
     procedure frxEtiqCliGetValue(const VarName: string; var Value: variant);
     procedure frxDBQMEtiqCliDetalleFirst(Sender: TObject);
     procedure frxDBQMEtiqCliDetalleNext(Sender: TObject);
     procedure QMEtiqCliCabBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     // Variables del listado
     NombreCli, DirCli, CPCli, PobCli, ProvCli, PaisCli: string;
     TerCli, CodCli: integer;
     EtiqVacias: integer;
     HayEtiqVacias: boolean;
     function Calcular_Linea_Sig: integer;
     procedure Actualizar_Nombre_Cliente;
     procedure RegenerarCliente(tercero, direcc: integer);
  public
     { Public declarations }
     function DameTercero: string;
     procedure ImprimirEtiquetas(Etiq, Modo: integer);
     procedure AddAgrupacion(Agrupacion: string);
  end;

var
  DMEtiqCli : TDMEtiqCli;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.DFM}

procedure TDMEtiqCli.DMEtiqCliCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMEtiqCliCab, '11100', True);
  AbreData(TDMListados, DMListados);
end;

procedure TDMEtiqCli.DMEtiqCliDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMEtiqCli.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

{ **********  Métodos de la cabecera  ********** }

procedure TDMEtiqCli.QMEtiqCliCabAfterOpen(DataSet: TDataSet);
begin
  QMEtiqCliDetalle.Close;
  QMEtiqCliDetalle.Open;
end;

procedure TDMEtiqCli.QMEtiqCliCabBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMEtiqCliCabNUMERO.AsInteger = 0)) then
     QMEtiqCliCabNUMERO.AsInteger := DMMain.Contador_EEC('ETC');   // contador
end;

procedure TDMEtiqCli.QMEtiqCliCabNewRecord(DataSet: TDataSet);
begin
  QMEtiqCliCabEMPRESA.AsInteger := REntorno.Empresa;
  QMEtiqCliCabEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMEtiqCliCabCANAL.AsInteger := REntorno.Canal;
  QMEtiqCliCabNUMERO.AsInteger := 0;
end;

{ **********  Métodos del detalle  ********** }

procedure TDMEtiqCli.QMEtiqCliDetalleNewRecord(DataSet: TDataSet);
begin
  // Antes de grabar el detalle, grabamos la cabecera
  if ((QMEtiqCliCab.State = dsInsert) or (QMEtiqCliCab.State = dsEdit)) then
  begin
     QMEtiqCliCab.Post;
     QMEtiqCliDetalle.Edit;
  end;

  // Valores por defecto
  QMEtiqCliDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMEtiqCliDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMEtiqCliDetalleCANAL.AsInteger := REntorno.Canal;
  QMEtiqCliDetalleNUMERO.AsInteger := QMEtiqCliCabNUMERO.AsInteger;
  QMEtiqCliDetalleNUM_COPIAS.AsInteger := 1;
  QMEtiqCliDetalleDIRECC.AsInteger := 1;

  QMEtiqCliDetalleLINEA.AsInteger := Calcular_Linea_Sig;
end;

function TDMEtiqCli.Calcular_Linea_Sig: integer;
begin
  // Calculamos el número de línea siguiente
  with SPLineaSiguiente do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Numero'].AsInteger := QMEtiqCliDetalleNUMERO.AsInteger;
     ExecQuery;
     Result := FieldByName['Linea'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMEtiqCli.Actualizar_Nombre_Cliente;
begin
  with QNomCliente do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Cliente'].AsInteger := QMEtiqCliDetalleCLIENTE.AsInteger;
     ExecQuery;
     QMEtiqCliDetalleTITULO.AsString := FieldByName['Titulo'].AsString;
     FreeHandle;
  end;
end;

procedure TDMEtiqCli.QMEtiqCliDetalleCLIENTEChange(Sender: TField);
begin
  Actualizar_Nombre_Cliente;
  QMEtiqCliDetalle.FieldByName('DIRECC').AsInteger := 1;
end;

{ ************************************************* }

// ---------------   Impresión de Etiquetas de Clientes   ---------------

procedure TDMEtiqCli.ImprimirEtiquetas(Etiq, Modo: integer);
var
  str : string;
begin
  with QMEtiqListado do
  begin
     Close;
     Open;
  end;
  EtiqVacias := Etiq;
  DMListados.Cargar(70, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frEtiqCli.LoadFromFIB(REntorno.Formato, str);
     frEtiqCli.PrepareReport;
     case Modo of
        0: frEtiqCli.ShowPreparedReport;
        1: frEtiqCli.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxEtiqCli.LoadFromFIB(REntorno.Formato, str);
     frxEtiqCli.PrepareReport;
     case Modo of
        0: frxEtiqCli.ShowPreparedReport;
        1: frxEtiqCli.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMEtiqCli.frDBQMEtiqCliDetalleFirst(Sender: TObject);
begin
  HayEtiqVacias := (EtiqVacias > 0);
  if (HayEtiqVacias) then
     frUserDSEtiqCli.RangeEndCount := EtiqVacias
  else
  begin
     frUserDSEtiqCli.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarCliente(QMEtiqListadoTERCERO.AsInteger, QMEtiqListadoDIRECC.AsInteger);
  end;
end;

procedure TDMEtiqCli.frDBQMEtiqCliDetalleNext(Sender: TObject);
begin
  if (HayEtiqVacias) then
  begin
     HayEtiqVacias := False;
     // Después de visualizar las etiquetas vacias, hay que regenerar
     // el origen de los datos
     QMEtiqListado.Close;
     QMEtiqListado.Open;
     frUserDSEtiqCli.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarCliente(QMEtiqListadoTERCERO.AsInteger, QMEtiqListadoDIRECC.AsInteger);
  end
  else
  begin
     frUserDSEtiqCli.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarCliente(QMEtiqListadoTERCERO.AsInteger, QMEtiqListadoDIRECC.AsInteger);
  end;
end;

procedure TDMEtiqCli.frEtiqCliGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Nombre' then
     ParValue := NombreCli;
  if ParName = 'Direccion' then
     ParValue := DirCli;
  if ParName = 'CP' then
     ParValue := CPCli;
  if ParName = 'Poblacion' then
     ParValue := PobCli;
  if ParName = 'Provincia' then
     ParValue := ProvCli;
  if ParName = 'Pais' then
     ParValue := PaisCli;
  if ParName = 'Tercero' then
     ParValue := TerCli;
  if ParName = 'Cliente' then
     ParValue := CodCli;
end;

procedure TDMEtiqCli.RegenerarCliente(tercero, direcc: integer);
begin
  with QDatosCliente do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := tercero;
     Params.ByName['DIRECC'].AsInteger := direcc;
     ExecQuery;
     NombreCli := QMEtiqListadoTITULO.AsString;
     CodCli := QMEtiqListadoCLIENTE.AsInteger;
     TerCli := QMEtiqListadoTERCERO.AsInteger;
     DirCli := FieldByName['Direccion'].AsString;
     CPCli := FieldByName['CodPostal'].AsString;
     PobCli := FieldByName['Poblacion'].AsString;
     ProvCli := FieldByName['Provincia'].AsString;
     PaisCli := FieldByName['Pais'].AsString;
     FreeHandle;
  end;
end;

procedure TDMEtiqCli.frEtiqCliEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[Nombre]') then
        View.Visible := (not HayEtiqVacias);  // Si HayEtiqVacias => Invisible
  end;
end;

function TDMEtiqCli.DameTercero: string;
begin
  with QDameTercero do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger :=
        QMEtiqCliDetalle.FieldByName('CLIENTE').AsInteger;
     ExecQuery;
     Result := IntToStr(QDameTercero.FieldByName['TERCERO'].AsInteger);
     FreeHandle;
  end;
end;

procedure TDMEtiqCli.AddAgrupacion(Agrupacion: string);
begin
  if ((QMEtiqCliCab.State = dsInsert) or
     (QMEtiqCliCab.State = dsEdit)) then
     QMEtiqCliCab.Post;

  if ((QMEtiqCliDetalle.State = dsInsert) or
     (QMEtiqCliDetalle.State = dsEdit)) then
     QMEtiqCliDetalle.Post;

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

  QMEtiqCliCab.Close;
  QMEtiqCliCab.Open;
  QMEtiqCliCab.Last;
end;

procedure TDMEtiqCli.frxEtiqCliBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMEtiqCli.frxEtiqCliGetValue(const VarName: string; var Value: variant);
begin
  frEtiqCliGetValue(VarName, Value);
end;

procedure TDMEtiqCli.frxDBQMEtiqCliDetalleFirst(Sender: TObject);
begin
  HayEtiqVacias := (EtiqVacias > 0);
  if (HayEtiqVacias) then
     frxUserDSEtiqCli.RangeEndCount := EtiqVacias
  else
  begin
     frxUserDSEtiqCli.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarCliente(QMEtiqListadoTERCERO.AsInteger, QMEtiqListadoDIRECC.AsInteger);
  end;
end;

procedure TDMEtiqCli.frxDBQMEtiqCliDetalleNext(Sender: TObject);
begin
  if (HayEtiqVacias) then
  begin
     HayEtiqVacias := False;
     // Después de visualizar las etiquetas vacias, hay que regenerar
     // el origen de los datos
     QMEtiqListado.Close;
     QMEtiqListado.Open;
     frxUserDSEtiqCli.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarCliente(QMEtiqListadoTERCERO.AsInteger, QMEtiqListadoDIRECC.AsInteger);
  end
  else
  begin
     frxUserDSEtiqCli.RangeEndCount := QMEtiqListadoNUM_COPIAS.AsInteger;
     RegenerarCliente(QMEtiqListadoTERCERO.AsInteger, QMEtiqListadoDIRECC.AsInteger);
  end;
end;

procedure TDMEtiqCli.QMEtiqCliCabBeforeClose(DataSet: TDataSet);
begin
  QMEtiqCliDetalle.Close;
end;

end.
