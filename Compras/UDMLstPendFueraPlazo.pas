unit UDMLstPendFueraPlazo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FR_DSet, FR_DBSet,
  FIBQuery, HYFIBQuery, FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport,
  Forms, UUtiles, frxClass, frxHYReport;

type
  TDMLstPendFueraPlazo = class(TDataModule)
     frPendFueraPlazo: TfrHYReport;
     TLocal: THYTransaction;
     frDBDSLstPendFueraPlazo: TfrDBDataSet;
     xLstPendFueraPlazo: TFIBDataSetRO;
     DSxLstPendFueraPlazo: TDataSource;
     frxPendFueraPlazo: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure frPendFueraPlazoBeforePrint(Memo: TStringList; View: TfrView);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPendFueraPlazoGetValue(const ParName: string; var ParValue: variant);
     procedure frxPendFueraPlazoBeforePrint(Sender: TfrxReportComponent);
     procedure frxPendFueraPlazoGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     Servido, Servido2: integer;
     FechaD, FechaH: TDateTime;
     ProveedorD, ProveedorH: integer;
     FamiliaD, FamiliaH: string;
  public
     { Public declarations }
     comentario: string;
     procedure Muestra(Modo: smallint; Familia_desde, Familia_hasta: string; Min_fecha, Max_fecha: TDateTime; ProvD, ProvH, tipo_servido, tipo_servido2: integer);
     function FechaPrimerPedido: TDateTime;
     procedure BorraTMP;
     procedure DameFamiliaMinMax(var FamiliaMin: string; var FamiliaMax: string);
  end;

var
  DMLstPendFueraPlazo : TDMLstPendFueraPlazo;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UFPregLstPendFueraPlazo;

{$R *.dfm}

procedure TDMLstPendFueraPlazo.frPendFueraPlazoBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstPendFueraPlazo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMlistados, DMListados);
end;

procedure TDMLstPendFueraPlazo.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPendFueraPlazo.Muestra(Modo: smallint; Familia_desde, Familia_hasta: string; Min_fecha, Max_fecha: TDateTime; ProvD, ProvH, tipo_servido, tipo_servido2: integer);
var
  str : string;
begin
  fechaD := min_fecha;
  fechaH := max_fecha;
  FamiliaD := Familia_desde;
  FamiliaH := Familia_hasta;
  ProveedorD := provD;
  proveedorH := provH;
  servido := tipo_servido;
  servido2 := tipo_servido2;
  DMListados.Normalizar_Desde_Hasta(min_fecha, max_fecha);
  DMListados.Normalizar_Desde_Hasta(ProvD, ProvH);

  with xLstPendFueraPlazo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['FAMILIA_DESDE'].AsString := FamiliaD;
     Params.ByName['FAMILIA_HASTA'].AsString := FamiliaH;
     Params.ByName['FECHAD'].AsDateTime := fechaD;
     Params.ByName['FECHAH'].AsDateTime := fechaH;
     Params.ByName['PROVD'].AsInteger := ProvD;
     Params.ByName['PROVH'].AsInteger := ProvH;
     Params.ByName['SERVIDO'].AsInteger := tipo_servido;
     Params.ByName['SERVIDO2'].AsInteger := tipo_servido2;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  DMListados.Cargar(157, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frPendFueraPlazo.LoadFromFIB(REntorno.Formato, str);
     frPendFueraPlazo.PrepareReport;
     case Modo of
        0: frPendFueraPlazo.ShowPreparedReport;
        1: frPendFueraPlazo.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxPendFueraPlazo.LoadFromFIB(REntorno.Formato, str);
     frxPendFueraPlazo.PrepareReport;
     case Modo of
        0: frxPendFueraPlazo.ShowPreparedReport;
        1: frxPendFueraPlazo.PrintPreparedReport('', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstPendFueraPlazo.frPendFueraPlazoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'PROVEEDORD' then
     ParValue := IntToStr(ProveedorD);

  if ParName = 'PROVEEDORH' then
     ParValue := IntToStr(ProveedorH);

  if ParName = 'FAMILIAD' then
     ParValue := FamiliaD;

  if ParName = 'FAMILIAH' then
     ParValue := FamiliaH;

  if ParName = 'FECHAD' then
     ParValue := DateTimeToStr(FechaD);

  if ParName = 'FECHAH' then
     ParValue := DateTimeToStr(FechaH);

  if Trim(ParName) = 'Comentario' then
     ParValue := Comentario;

  if Trim(ParName) = 'FechaListado' then
     ParValue := FPregLstPendFueraPlazo.DTPFechaListado.Date;

  if Trim(ParName) = 'Orden' then
     ParValue := FPregLstPendFueraPlazo.CBOrden.Items[FPregLstPendFueraPlazo.CBOrden.ItemIndex];

  if Trim(ParName) = 'filtro' then
     ParValue := Format(_('Desde el Proveedor %d Hasta el Proveedor %d Desde la Fecha %s  Hasta la Fecha %s Desde la Familia %s  Hasta la Familia %s'), [ProveedorD, ProveedorH, DateTimeToStr(FechaD), DateTimeToStr(FechaH), FamiliaD, FamiliaH]);

  if Trim(ParName) = 'ESTADO' then
  begin
     if (Servido = 0) then // Pendientes
        ParValue := _('Pendientes');
     if (Servido = 1) then // Servidos Parcial
        ParValue := _('Servidos Parcial');
     if (Servido = 10) then // Servidos Total
        ParValue := _('Servidos Total');
     if (Servido = 11) then //tTodos
        ParValue := _('Todos');
  end;

  if Trim(ParName) = 'PLAZO' then
  begin
     if (Servido2 = 0) then // Fuera de plazo
        ParValue := _('Fuera de Plazo');
     if (Servido2 = 1) then // Plazo
        ParValue := _('Plazo');
     if (Servido2 = 10) then // Recibir
        ParValue := _('Por Recibir');
     if (Servido2 = 11) then // Todos
        ParValue := _('Todos');
  end;
end;

function TDMLstPendFueraPlazo.FechaPrimerPedido: TDateTime;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(FECHA) FROM VER_CABECERAS_PEDIDO_PROV WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['MIN'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstPendFueraPlazo.BorraTMP;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_MULTISERIE WHERE ENTRADA=?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstPendFueraPlazo.frxPendFueraPlazoBeforePrint(Sender: TfrxReportComponent);
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
        end;
end;

procedure TDMLstPendFueraPlazo.frxPendFueraPlazoGetValue(const VarName: string; var Value: variant);
begin
  frPendFueraPlazoGetValue(VarName, Value);
end;

procedure TDMLstPendFueraPlazo.DameFamiliaMinMax(var FamiliaMin: string; var FamiliaMax: string);
begin
  DameMinMax('FAM', FamiliaMin, FamiliaMax);
end;

end.
