unit UDMLstCondiciones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados, Forms, frxClass,
  frxHYReport;

type
  TDMLstCondiciones = class(TDataModule)
     TLocal: THYTransaction;
     frCondiciones: TfrHYReport;
     xCabecera: TFIBDataSetRO;
     DSxCabecera: TDataSource;
     frDBxCabecera: TfrDBDataSet;
     xDetalle: TFIBDataSetRO;
     frDBxDetalle: TfrDBDataSet;
     DSxDetalle: TDataSource;
     xDetalleEMPRESA: TIntegerField;
     xDetalleEJERCICIO: TIntegerField;
     xDetalleCANAL: TIntegerField;
     xDetalleTIPO: TFIBStringField;
     xDetalleRIG: TIntegerField;
     xDetalleLINEA: TIntegerField;
     xDetalleUNID_MINIMAS: TFloatField;
     xDetalleUNID_MAXIMAS: TFloatField;
     xDetallePRECIO: TFloatField;
     xDetalleDESCUENTO: TFloatField;
     xDetalleDESCUENTO_2: TFloatField;
     xDetalleDESCUENTO_3: TFloatField;
     xCabeceraEMPRESA: TIntegerField;
     xCabeceraEJERCICIO: TIntegerField;
     xCabeceraCANAL: TIntegerField;
     xCabeceraTIPO: TFIBStringField;
     xCabeceraRIG: TIntegerField;
     xCabeceraCLIENTE: TIntegerField;
     xCabeceraTITULO_CLIENTE: TFIBStringField;
     xCabeceraARTICULO: TFIBStringField;
     xCabeceraTITULO_ARTICULO: TFIBStringField;
     xCabeceraFAMILIA: TFIBStringField;
     xCabeceraTITULO_FAMILIA: TFIBStringField;
     xCabeceraPERFIL: TFIBStringField;
     xCabeceraTITULO_PERFIL: TFIBStringField;
     xCabeceraAGRUPACION: TFIBStringField;
     xCabeceraTITULO_AGRUPACION: TFIBStringField;
     xCabeceraALTA: TDateTimeField;
     xCabeceraBAJA: TDateTimeField;
     xCabeceraACTIVO: TIntegerField;
     frxCondiciones: TfrxHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frCondicionesGetValue(const ParName: string; var ParValue: variant);
     procedure frCondicionesEnterRect(Memo: TStringList; View: TfrView);
     procedure xCabeceraAfterScroll(DataSet: TDataSet);
     procedure frxCondicionesBeforePrint(Sender: TfrxReportComponent);
     procedure frxCondicionesGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     TipoCondicion: integer;
  public
     { Public declarations }
     procedure MostrarCondicionesFiltradas(Modo: byte; SWFil, TCond: integer);
  end;

var
  DMLstCondiciones : TDMLstCondiciones;
  SW : integer;

implementation

uses UDMListados, UFormGest, UEntorno, UDMMain;

{$R *.dfm}

procedure TDMLstCondiciones.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstCondiciones.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstCondiciones.MostrarCondicionesFiltradas(Modo: byte; SWFil, TCond: integer);
var
  str : string;
begin
  TipoCondicion := TCond;

  with xCabecera do
  begin
     Close;
     if SWFil = 0 then
        DMMain.FiltraRO(xCabecera, '11100', True);
  end;

  SW := 1;
  DMListados.Cargar(139, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frCondiciones.LoadFromFIB(REntorno.Formato, str);
     frCondiciones.PrepareReport;
     case Modo of
        0: frCondiciones.ShowPreparedReport;
        1: frCondiciones.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxCondiciones.LoadFromFIB(REntorno.Formato, str);
     frxCondiciones.PrepareReport;
     case Modo of
        0: frxCondiciones.ShowPreparedReport;
        1: frxCondiciones.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstCondiciones.frCondicionesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TipoTxt' then
     case TipoCondicion of
        1: ParValue := 'Cliente / Artículo';
        2: ParValue := 'Agrupación Clientes / Artículo';
        3: ParValue := 'Perfil / Artículo';
        4: ParValue := 'Artículo';
        5: ParValue := 'Cliente / Familia';
        6: ParValue := 'Agrupación Clientes / Familia';
        7: ParValue := 'Perfil / Familia';
        8: ParValue := 'Familia';
        9: ParValue := 'Agrupación Clientes';
        10: ParValue := 'Perfil';
     end;

  if ParName = 'PRIMERO_TIT' then
     case TipoCondicion of
        1, 5: ParValue := 'Cliente:';
        2, 6, 9: ParValue := 'Agrupación Clientes:';
        3, 7, 10: ParValue := 'Perfil:';
        4: ParValue := 'Artículo:';
        8: ParValue := 'Familia:';
     end;

  if ParName = 'SEGUNDO_TIT' then
     case TipoCondicion of
        1, 2, 3: ParValue := 'Artículo:';
        4, 8, 9, 10: ParValue := '';
        5, 6, 7: ParValue := 'Familia:';
     end;

  if ParName = 'PRIMERO' then
     case TipoCondicion of
        1, 5: ParValue := xCabeceraCLIENTE.AsInteger;
        2, 6, 9: ParValue := xCabeceraAGRUPACION.AsString;
        3, 7, 10: ParValue := xCabeceraPERFIL.AsString;
        4: ParValue := xCabeceraARTICULO.AsString;
        8: ParValue := xCabeceraFAMILIA.AsString;
     end;

  if ParName = 'SEGUNDO' then
     case TipoCondicion of
        1, 2, 3: ParValue := xCabeceraARTICULO.AsString;
        4, 8, 9, 10: ParValue := '';
        5, 6, 7: ParValue := xCabeceraFAMILIA.AsString;
     end;

  if ParName = 'PRIMERO_DESC' then
     case TipoCondicion of
        1, 5: ParValue := xCabeceraTITULO_CLIENTE.AsString;
        2, 6, 9: ParValue := xCabeceraTITULO_AGRUPACION.AsString;
        3, 7, 10: ParValue := xCabeceraTITULO_PERFIL.AsString;
        4: ParValue := xCabeceraTITULO_ARTICULO.AsString;
        8: ParValue := xCabeceraTITULO_FAMILIA.AsString;
     end;

  if ParName = 'SEGUNDO_DESC' then
     case TipoCondicion of
        1, 2, 3: ParValue := xCabeceraTITULO_ARTICULO.AsString;
        4, 8, 9, 10: ParValue := '';
        5, 6, 7: ParValue := xCabeceraTITULO_FAMILIA.AsString;
     end;

  if ParName = 'UnidMaximas' then
  begin
     if (xDetalleUNID_MAXIMAS.AsFloat = 1999999999) then
        ParValue := '--------------'
     else
        ParValue := FormatFloat(MascaraN, xDetalleUNID_MAXIMAS.AsFloat);
  end;
end;

procedure TDMLstCondiciones.frCondicionesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstCondiciones.xCabeceraAfterScroll(DataSet: TDataSet);
begin
  with xDetalle do
  begin
     Close;
     Open;
  end;
end;

procedure TDMLstCondiciones.frxCondicionesBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstCondiciones.frxCondicionesGetValue(const VarName: string; var Value: variant);
begin
  frCondicionesGetValue(VarName, Value);
end;

end.
