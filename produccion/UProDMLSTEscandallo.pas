unit UProDMLSTEscandallo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBDataSet, FIBQuery,
  HYFIBQuery, FIBTableDataSet, ExtCtrls, jpeg, frxClass, frxHYReport;

type
  TProDMLSTEscandallo = class(TDataModule)
     frListadoE: TfrHYReport;
     frDBListadoE: TfrDBDataSet;
     TLocal: THYTransaction;
     xEscandallo: TFIBDataSetRO;
     DSEscandallo: TDataSource;
     DSFaseD: TDataSource;
     DSFaseH: TDataSource;
     xFaseD: TFIBDataSetRO;
     xFaseH: TFIBDataSetRO;
     xEscandalloCOMPUESTO: TFIBStringField;
     QMLstFase: TFIBDataSetRO;
     DSLstFase: TDataSource;
     DSLstMateriales: TDataSource;
     DSLstTareas: TDataSource;
     QMLstMateriales: TFIBDataSetRO;
     QMLstTareas: TFIBDataSetRO;
     QMLstEscandallo: TFIBDataSetRO;
     DSLstEscandallo: TDataSource;
     frDBListadoFase: TfrDBDataSet;
     frDBListadoMate: TfrDBDataSet;
     frDBListadoTareas: TfrDBDataSet;
     xFaseDFASE: TFIBStringField;
     xFaseHFASE: TFIBStringField;
     xEscandalloUNIDADES: TFloatField;
     xMinMaxFase: TFIBDataSetRO;
     xMinMaxFaseMIN: TIntegerField;
     xMinMaxFaseMAX: TIntegerField;
     xDibEsc: TFIBDataSetRO;
     xEscandalloDESCRIPCION: TFIBStringField;
     frxListadoE: TfrxHYReport;
     DSComponente: TDataSource;
     QMComponente: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frListadoEGetValue(const ParName: string; var ParValue: variant);
     procedure frListadoEEnterRect(Memo: TStringList; View: TfrView);
     procedure frxListadoEGetValue(const VarName: string; var Value: variant);
     procedure frxListadoEBeforePrint(Sender: TfrxReportComponent);
     procedure QMLstMaterialesAfterClose(DataSet: TDataSet);
  private
     { Private declarations }
     TextoFiltro: string;
     UnidadesArt: double;
  public
     { Public declarations }
     Capsalera: integer;
     Tipo_Esc: string;
     procedure CambiaEscandallo(Escandallo: integer);
     procedure CambiaFaseD(Escandallo, fase: integer);
     procedure CambiaFaseH(Escandallo, fase: integer);
     procedure CanviaOrdenFechaFases(var FaseDesde: string; var FaseHasta: string);
     procedure MostrarListado(Modo: integer; Escandallo: integer; FaseDesde, FaseHasta: string; TipoServido: integer; Comentario: string; FechaListado: TDateTime; aUnidadesArt: double; aTextoFiltro, TipoEsc: string);
     procedure ObrirFases(escandallo_esc, FaseDesde, FaseHasta: integer);
  end;

var
  ProDMLSTEscandallo : TProDMLSTEscandallo;

implementation

uses UDMMain, UEntorno, UFBusca, UDMListados, UFormGest, Mask;

{$R *.dfm}

procedure TProDMLSTEscandallo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Capsalera := 1;
end;

procedure TProDMLSTEscandallo.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLSTEscandallo.CambiaEscandallo(Escandallo: integer);
begin
  with xEscandallo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
     Params.ByName['TIPO'].AsString := Tipo_Esc;
     Open;
  end;

  with xMinMaxFase do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
     Params.ByName['TIPO'].AsString := Tipo_Esc;
     Open;
  end;
end;

procedure TProDMLSTEscandallo.CambiaFaseD(Escandallo, Fase: integer);
begin
  with xFaseD do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
     Params.ByName['LINEAFASE'].AsInteger := Fase;
     Params.ByName['TIPO'].AsString := Tipo_Esc;
     Open;
  end;
end;

procedure TProDMLSTEscandallo.CambiaFaseH(Escandallo, Fase: integer);
begin
  with xFaseH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
     Params.ByName['LINEAFASE'].AsInteger := Fase;
     Params.ByName['TIPO'].AsString := Tipo_Esc;
     Open;
  end;
end;

procedure TProDMLstEscandallo.CanviaOrdenFechaFases(var FaseDesde: string; var FaseHasta: string);
var
  aux : string;
begin
  if (StrToInt(FaseDesde) > StrToInt(FaseHasta)) then
  begin
     aux := FaseDesde;
     FaseDesde := FaseHasta;
     FaseHasta := aux;
  end;
end;

procedure TProDMLstEscandallo.MostrarListado(Modo: integer; Escandallo: integer; FaseDesde, FaseHasta: string; TipoServido: integer; Comentario: string; FechaListado: TDateTime; aUnidadesArt: double; aTextoFiltro, TipoEsc: string);
begin
  Tipo_Esc := TipoEsc;
  TextoFiltro := aTextoFiltro;
  UnidadesArt := aUnidadesArt;

  DMListados.DatosInforme(FechaListado, Comentario);

  if (StrToInt(FaseDesde) = 0) or (StrToInt(FaseHasta) = 0) then
  begin //Si no informem alguna de les fases, busquem el minim i el maxim
     with xEscandallo do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
        Params.ByName['TIPO'].AsString := TipoEsc;
        Open;
     end;

     with xMinMaxFase do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
        Params.ByName['TIPO'].AsString := Tipo_Esc;
        Open;
     end;

     FaseDesde := xMinMaxFaseMIN.AsString;
     FaseHasta := xMinMaxFaseMAX.AsString;
     if (FaseDesde = '') then
        FaseDesde := '0';
     if (FaseHasta = '') then
        FaseHasta := '0';
  end
  else
     CanviaOrdenFechaFases(FaseDesde, FaseHasta);

  ObrirFases(Escandallo, StrToInt(FaseDesde), StrToInt(FaseHasta));
  DMListados.Imprimir(8008, 0, Modo, '', '', frListadoE, frxListadoE, nil, nil);
end;

procedure TProDMLSTEscandallo.frListadoEGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Titol') then
  begin
     if (Tipo_Esc = 'OFE') then
        ParValue := _('LISTADO OFERTAS ESCANDALLO')
     else if (Tipo_Esc = 'EPR') then
        ParValue := _('LISTADO ESCANDALLOS');
  end;

  if (ParName = 'Unidades_Listado') then
     ParValue := UnidadesArt;

  if ParName = 'TFiltro' then
     ParValue := TextoFiltro;

  if ParName = 'Capsalera' then
     ParValue := Capsalera;

  // SUMATORIOS DE LOS TOTALES NUMÉRICOS DE ESCANDALLO (FASES, TAREAS, MATERIALES)
  if ParName = 'TotalFases' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COUNT(*) FROM PRO_FASES_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['COUNT'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalMateriales' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COUNT(*) FROM PRO_MAT_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['COUNT'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalTareas' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COUNT(*) FROM PRO_TAREA_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['COUNT'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // SUMATORIO DE LAS UNIDADES Y COSTES DE MATERIALES Y TAREAS
  if ParName = 'TotalMatCan' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(UNIDADES) FROM PRO_MAT_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND LINEA_FASE = :LINEA_FASE AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFase.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalMatVar' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(TOTAL_VAR) FROM PRO_MAT_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND LINEA_FASE = :LINEA_FASE AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFase.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalMatFijo' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(PRECIO_FIJO) FROM PRO_MAT_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND LINEA_FASE = :LINEA_FASE AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFase.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalMatTotal' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(TOTAL) FROM PRO_MAT_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND LINEA_FASE = :LINEA_FASE AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFase.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalTarCan' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(CANTIDAD) FROM PRO_TAREA_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND LINEA_FASE = :LINEA_FASE AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFase.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalTarVar' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(TOTAL_VAR) FROM PRO_TAREA_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND LINEA_FASE = :LINEA_FASE AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFase.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalTarFijo' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(PRECIO_FIJO) FROM PRO_TAREA_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND LINEA_FASE = :LINEA_FASE AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFase.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TotalTarTotal' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(TOTAL) FROM PRO_TAREA_ESC WHERE EMPRESA = :EMPRESA AND ESCANDALLO = :ESCANDALLO AND LINEA_FASE = :LINEA_FASE AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMLstFase.FieldByName('LINEA_FASE').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo_Esc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'StockComponente' then
  begin
     ParValue := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QMLstMateriales.FieldByName('COMPONENTE').AsString, QMLstMateriales.FieldByName('ALMACEN_SAL').AsString);
  end;
end;

procedure TProDMLstEscandallo.ObrirFases(escandallo_esc, FaseDesde, FaseHasta: integer);
begin
  with QMLstEscandallo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ESCANDALLO'].AsInteger := Escandallo_esc;
     Params.ByName['TIPO'].AsString := Tipo_Esc;
     Open;
  end;

  with QMLstFase do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FASED'].AsInteger := FaseDesde;
     Params.ByName['FASEH'].AsInteger := FaseHasta;
     Open;
  end;

  with QMLstMateriales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  with QMLstTareas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TProDMLSTEscandallo.frListadoEEnterRect(Memo: TStringList; View: TfrView);
begin
  if (memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[ImatgeEscandall]') and (View is TfrPictureView) then
     begin
        xDibEsc.Close;
        xDibEsc.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        xDibEsc.Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
        xDibEsc.Params.ByName['TIPO'].AsString := Tipo_Esc;
        xDibEsc.Open;
        DMListados.MostrarImagen(xDibEsc.FieldByName('ID_IMAGEN').AsInteger, View);
     end;
  end;
end;

procedure TProDMLSTEscandallo.frxListadoEGetValue(const VarName: string; var Value: variant);
begin
  frListadoEGetValue(VarName, Value);
end;

procedure TProDMLSTEscandallo.frxListadoEBeforePrint(Sender: TfrxReportComponent);
var
  s : string;
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxPictureView) then
  begin
     s := Trim(TfrxPictureView(Sender).TagStr);
     if (s = 'ImatgeEscandall') then
     begin
        xDibEsc.Close;
        xDibEsc.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        xDibEsc.Params.ByName['ESCANDALLO'].AsInteger := QMLstEscandallo.FieldByName('ESCANDALLO').AsInteger;
        xDibEsc.Params.ByName['TIPO'].AsString := Tipo_Esc;
        xDibEsc.Open;

        DMListados.MostrarImagen(xDibEsc.FieldByName('ID_IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
     end;
  end;
end;

procedure TProDMLSTEscandallo.QMLstMaterialesAfterClose(DataSet: TDataSet);
begin
  QMComponente.Open;
end;

end.
