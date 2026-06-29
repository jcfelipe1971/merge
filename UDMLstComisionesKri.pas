unit UDMLstComisionesKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBQuery,
  HYFIBQuery, FIBTableDataSet, FIBDataSetRO, FIBDatabase, UFIBModificados;

type
  TDMLstComisionesKri = class(TDataModule)
     TLocal: THYTransaction;
     xLiqRepresentantes: TFIBDataSetRO;
     frLiqRepresentantes: TfrDBDataSet;
     DSLiqRepresentantes: TDataSource;
     frLstComisiones: TfrHYReport;
     xAgente: TFIBDataSetRO;
     frxAgente: TfrDBDataSet;
     DSxAgente: TDataSource;
     procedure DMLstComisionesKriDestroy(Sender: TObject);
     procedure DMLstComisionesKriCreate(Sender: TObject);
     procedure xAgenteAfterScroll(DataSet: TDataSet);
     procedure frLstComisionesGetValue(const ParName: string; var ParValue: variant);
     procedure frLstComisionesEnterRect(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
  public
     { Public declarations }
     Pagina: integer;
     AgenteAux: integer;
     FechaIni: TDateTime;
     FechaFin: TDateTime;
     procedure ListadoComisiones(aFechaIni, aFechaFin: TDateTime; Desde, Hasta, Tipo: integer; MostrarImporteCero: boolean; Canal: integer);
  end;

var
  DMLstComisionesKri : TDMLstComisionesKri;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

{$R *.DFM}

procedure TDMLstComisionesKri.DMLstComisionesKriDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstComisionesKri.DMLstComisionesKriCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  pagina := 0;
end;

procedure TDMLstComisionesKri.ListadoComisiones(aFechaIni, aFechaFin: TDateTime; Desde, Hasta, Tipo: integer; MostrarImporteCero: boolean; Canal: integer);
begin
  if MessageDlg(Format(_('Se regeneraran las comisiones para el período' + #13#10 +
     'desde: %s hasta: %s' + #13#10 +
     'y agentes desde : %d hasta: %d' + #13#10 +
     'Desea Continuar ?'), [DateToStr(aFechaIni), DateToStr(aFechaFin), Desde, Hasta]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     FechaIni := HourIntoDate(aFechaIni, '00:00:00');
     FechaFin := HourIntoDate(aFechaFin, '23:59:59');
     DMListados.Normalizar_Desde_Hasta(Desde, Hasta);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_LIQUIDA_REPRESENTANTES(:ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :FEC_DESDE, :FEC_HASTA, :AG_DESDE, :AG_HASTA)';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := REntorno.Serie;
           Params.ByName['FEC_DESDE'].AsDateTime := FechaIni;
           Params.ByName['FEC_HASTA'].AsDateTime := FechaFin;
           Params.ByName['AG_DESDE'].AsInteger := Desde;
           Params.ByName['AG_HASTA'].AsInteger := Hasta;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with xLiqRepresentantes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        // Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        // Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaIni;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaFin;
        Params.ByName['TIPO'].AsString := 'FAC';
        Open;
     end;

     with xAgente do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['AGENTE_DESDE'].AsInteger := Desde;
        Params.ByName['AGENTE_HASTA'].AsInteger := Hasta;
        Open;
     end;

     SW := 1;
     DMListados.Imprimir(5100, 0, 0{Modo}, '', 'Listado Comisiones', frLstComisiones, nil, nil, nil);
  end;
end;

procedure TDMLstComisionesKri.xAgenteAfterScroll(DataSet: TDataSet);
begin
  with xLiqRepresentantes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     // Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     // Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaIni;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaFin;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['AGENTE'].AsInteger := xAgente.FieldByName('AGENTE').AsInteger;
     Open;
  end;
end;

procedure TDMLstComisionesKri.frLstComisionesGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'Total_Comision' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(I_COMISION) FROM LIQUIDACION_REPRESENTANTES ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' AGENTE = :AGENTE AND ');
           SQL.Add(' FECHA >= :FEC_INI AND ');
           SQL.Add(' FECHA <= :FEC_FIN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['AGENTE'].AsInteger := AgenteAux;
           Params.ByName['FEC_INI'].AsDateTime := FechaIni;
           Params.ByName['FEC_FIN'].AsDateTime := FechaFin;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Pagina' then
  begin
     Inc(Pagina);
     ParValue := Pagina;
  end;

  if ParName = 'Desde_Fecha' then
     ParValue := FechaIni;

  if ParName = 'Hasta_Fecha' then
     ParValue := FechaFin;
end;

procedure TDMLstComisionesKri.frLstComisionesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if Memo[0] = 'Nº' then
        SW := 1;
  end;

  if View.Name = 'Memo24' then
     AgenteAux := xAgente.FieldByName('AGENTE').AsInteger;
end;

end.
