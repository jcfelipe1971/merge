unit UFMDashboard;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFLabel,
  DB, FIBDatabase, FIBQuery, FIBDataSet, UFIBModificados, TeEngine, Series,
  TeeProcs, Chart, MXGRAPH, UHYDBGrid, ULFPageControl,
  UComponentesBusquedaFiltrada, UFIBDBEditfind, ULFEditFind2000;

type
  TFMPanelMetrica = class(TLFPanel)
     PNLMetricas: TLFPanel;
     procedure LabelDblClick(Sender: TObject);
     procedure PintaTotales(Sender: TObject);
  private
     { Private declarations }
     DB: THYDatabase;
     T: TFIBDataSet;
     TransaccionRO: boolean;
     DS: TDataSource;
     Grafico: TDecisionGraph;
     Grid: THYTDBGrid;
     PNLTotales: TLFPanel;
     Tipo: string;
     SQL: string;
     Configuracion: string;
     Pagina: integer;
     Totales: array of double;
  public
     { Public declarations }
     constructor Create(AOwner: TComponent);
     destructor Destroy;
     procedure SetNombre(s: string);
     procedure SetDataBase(aDB: THYDatabase);
     procedure SetTransaccionRO(b: boolean);
     procedure SetPadre(p: TWinControl);
     procedure SetLabel(s: string);
     procedure SetPosition(x, y, w, h: integer);
     procedure SetTipo(aTipo: string);
     procedure SetSQL(aSQL: string);
     procedure SetConfiguracion(aConfiguracion: string);
     procedure SetPagina(i: integer);
     procedure Refrescar;
  end;

  TFMDashboard = class(TFPEditSinNavegador)
     PNLMetricas: TLFPanel;
     TBSep1: TToolButton;
     TBRefrescar: TToolButton;
     ARefrescar: TAction;
     PCMetricas: TLFPageControl;
     ALDashboard: TActionList;
     EntornoDash: TEntornoFind2000;
     PNLFiltros: TLFPanel;
     LEjercicio: TLFLabel;
     EFEjercicio: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TabSheetResize(Sender: TObject);
     procedure ARefrescarExecute(Sender: TObject);
     procedure EFEjercicioChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Metricas: TList;
  end;

var
  FMDashboard : TFMDashboard;

implementation

uses
  UDMMain, UFormGest, UDMDashboard, UUtiles, UEntorno, Grids, DBGrids;

{$R *.dfm}

{ TFMPanelMetrica }

constructor TFMPanelMetrica.Create(AOwner: TComponent);
begin
  inherited;
  T := TFIBDataSet.Create(Self);
  DS := TDataSource.Create(Self);
  DS.DataSet := T;
  Grafico := nil;
  TransaccionRO := True;
end;

destructor TFMPanelMetrica.Destroy;
begin
  Grafico.Free;
  DS.Free;
  T.Free;
end;

procedure TFMPanelMetrica.SetNombre(s: string);
begin
  Name := s;
  Caption := '';
end;

procedure TFMPanelMetrica.SetDataBase(aDB: THYDatabase);
begin
  DB := aDB;
  T.DataBase := DB;

  if TransaccionRO then
     T.Transaction := DameTransactionRO(DB, T)
  else
     T.Transaction := DameTransactionRW(DB, T);
end;

procedure TFMPanelMetrica.SetTransaccionRO(b: boolean);
begin
  TransaccionRO := b;

  if Assigned(T.Transaction) then
     T.Transaction.Free;

  if TransaccionRO then
     T.Transaction := DameTransactionRO(DB, T)
  else
     T.Transaction := DameTransactionRW(DB, T);
end;

procedure TFMPanelMetrica.SetPadre(p: TWinControl);
begin
  inherited;
  Parent := p;
end;

procedure TFMPanelMetrica.SetLabel(s: string);
begin
  with TLFLabel.Create(Self) do
  begin
     Name := Self.Name + 'LabelTop';
     Parent := Self;
     Caption := s;
     Align := alTop;
     Alignment := taCenter;
     Font.Style := [fsBold];
     OnDblClick := LabelDblClick;
  end;
end;

procedure TFMPanelMetrica.SetPosition(x, y, w, h: integer);
var
  i : integer;
begin
  with TLFPanel(Self) do
  begin
     Left := x;
     Top := y;
     Width := w;
     Height := h;
  end;

  if (Tipo = 'GRD') then
  begin
     if Assigned(Grid) then
     begin
        with Grid do
        begin
           i := EncuentraField(Grid, 'INDICE');
           if (i >= 0) then
              Columns[i].Width := TLFPanel(Self).Width - 130;

           i := EncuentraField(Grid, 'VALOR');
           if (i >= 0) then
              Columns[i].Width := 90;
        end;
     end;
  end;
end;

procedure TFMPanelMetrica.SetSQL(aSQL: string);
begin
  SQL := aSQL;
end;

procedure TFMPanelMetrica.SetConfiguracion(aConfiguracion: string);
begin
  Configuracion := aConfiguracion;
end;

procedure TFMPanelMetrica.SetPagina(i: integer);
begin
  Pagina := i;
end;

procedure TFMPanelMetrica.SetTipo(aTipo: string);
begin
  Tipo := aTipo;

  if (Tipo = 'GR1') then
  begin
     Grafico := TDecisionGraph.Create(Self);
     with Grafico do
     begin
        Parent := Self;
        Align := alClient;
        Title.Text.Clear;
        Title.Text.Add('');
        Legend.LegendStyle := lsSeries;
     end;
  end
  else
  if (Tipo = 'GR2') then
  begin
     Grafico := TDecisionGraph.Create(Self);
     with Grafico do
     begin
        Parent := Self;
        Align := alClient;
        Title.Text.Clear;
        Title.Text.Add('');
        Legend.LegendStyle := lsSeries;
     end;
  end
  else
  if (Tipo = 'GR3') then
  begin
     Grafico := TDecisionGraph.Create(Self);
     with Grafico do
     begin
        Parent := Self;
        Align := alClient;
        Title.Text.Clear;
        Title.Text.Add('');
        Legend.LegendStyle := lsSeries;
     end;
  end
  else
  if (Tipo = 'GRD') then
  begin
     Grid := THYTDBGrid.Create(Self);
     with Grid do
     begin
        Parent := Self;
        Align := alClient;
        DataSource := DS;
        ReadOnly := True;
        Color := clInfoBk;
        OnColenter := PintaTotales;
        Options := [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit];
     end;

     PNLTotales := TLFPanel.Create(Self);
     with PNLTotales do
     begin
        Parent := Self;
        Align := alBottom;
        Height := 24;
        BorderStyle := bsNone;
        OnResize := PintaTotales;
     end;
  end;
end;

procedure TFMPanelMetrica.Refrescar;
var
  i, s : integer;
  n : string;
  Config : TStringList;
  LineSeries : TLineSeries;
  BarSeries : TBarSeries;
  PieSeries : TPieSeries;
  // Colores : array[0..5] of TColor;
  //f : TField;

  function DameTituloCampo(s: string): string;
  var
     i, f : integer;
     si, sf : string;
  begin
     i := Pos('[', s);
     f := Pos(']', s);
     if (i > 0) and (f > 0) then
     begin
        si := Copy(s, 1, i - 1);
        sf := Copy(s, f + 1, f - i);

        s := Copy(s, i + 1, f - i - 1);

        if Copy(UpperCase(s), 1, 9) = 'EJERCICIO' then
        begin
           s := IntToStr(FMDashboard.EntornoDash.Ejercicio + StrToIntDef(Copy(s, 10, Length(s)), 0));
        end;

        Result := si + s + sf;
     end
     else
        Result := s;
  end;

begin
  { Tomamos los colores por defecto del componente
  Colores[0] := clRed;
  Colores[1] := clGreen;
  Colores[2] := clYellow;
  Colores[3] := clBlue;
  Colores[4] := clWhite;
  Colores[5] := clTeal;
  }
  TLFPanel(Self).Color := clGray;
  Config := TStringList.Create;
  try
     Application.ProcessMessages;
     Config.Text := Configuracion;
     with T do
     begin
        try
           Close;
           try
              if (Transaction.InTransaction) then
                 Transaction.Commit;

              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Text := SQL;

              for i := 0 to Params.Count - 1 do
              begin
                 if Params[i].Name = 'EMPRESA' then
                    Params.ByName['EMPRESA'].AsInteger := FMDashboard.EntornoDash.Empresa
                 else
                 if Params[i].Name = 'EJERCICIO' then
                    Params.ByName['EJERCICIO'].AsInteger := FMDashboard.EntornoDash.Ejercicio
                 else
                 if Params[i].Name = 'CANAL' then
                    Params.ByName['CANAL'].AsInteger := FMDashboard.EntornoDash.Canal;
              end;

              Open;

              AsignaDisplayFormat(T, MascaraN, MascaraI, ShortDateFormat);

              if (Tipo = 'GR1') then
              begin
                 with Grafico do
                 begin
                    // Quito todas las series
                    for i := SeriesList.Count - 1 downto 0 do
                       SeriesList[i].Free;

                    // Agrego series segun cantidad de valores
                    // s := 0;
                    for i := 0 to T.Fields.Count - 1 do
                    begin
                       if (Copy(T.Fields[i].FieldName, 1, 5) = 'VALOR') then
                       begin
                          LineSeries := TLineSeries.Create(Grafico);
                          // LineSeries.LegendItemColor(Colores[s mod 6]);
                          if (Config.Values[T.Fields[i].FieldName] <> '') then
                             LineSeries.Title := DameTituloCampo(Config.Values[T.Fields[i].FieldName])
                          else
                             LineSeries.Title := 'VALOR - ' + IntToStr(i);
                          AddSeries(LineSeries);
                          // Inc(s);
                       end;
                    end;

                    while not T.EOF do
                    begin
                       n := '';
                       try
                          n := T.FieldByName('INDICE').AsString;
                       except
                       end;
                       s := 0;
                       for i := 0 to T.Fields.Count - 1 do
                       begin
                          if (Copy(T.Fields[i].FieldName, 1, 5) = 'VALOR') then
                          begin
                             TLineSeries(SeriesList[s]).AddY(T.Fields[i].AsFloat, n{, Colores[s mod 6]});
                             Inc(s);
                          end;
                       end;

                       T.Next;
                    end;
                 end;
              end
              else
              if (Tipo = 'GR2') then
              begin
                 with Grafico do
                 begin
                    // Quito todas las series

                    for i := SeriesList.Count - 1 downto 0 do
                       SeriesList[i].Free;

                    // Agrego series segun cantidad de valores
                    // s := 0;
                    for i := 0 to T.Fields.Count - 1 do
                    begin
                       if (Copy(T.Fields[i].FieldName, 1, 5) = 'VALOR') then
                       begin
                          BarSeries := TBarSeries.Create(Grafico);
                          // BarSeries.LegendItemColor(Colores[s mod 6]);
                          if (Config.Values[T.Fields[i].FieldName] <> '') then
                             BarSeries.Title := DameTituloCampo(Config.Values[T.Fields[i].FieldName])
                          else
                             BarSeries.Title := 'VALOR - ' + IntToStr(i);
                          AddSeries(BarSeries);
                          // Inc(s);
                       end;
                    end;

                    while not T.EOF do
                    begin
                       n := '';
                       try
                          n := T.FieldByName('INDICE').AsString;
                       except
                       end;

                       s := 0;
                       for i := 0 to T.Fields.Count - 1 do
                       begin
                          if (Copy(T.Fields[i].FieldName, 1, 5) = 'VALOR') then
                          begin
                             TBarSeries(SeriesList[s]).AddY(T.Fields[i].AsFloat, n {, Colores[s mod 6]});
                             Inc(s);
                          end;
                       end;

                       T.Next;
                    end;
                 end;
              end
              else
              if (Tipo = 'GR3') then
              begin
                 with Grafico do
                 begin
                    // Quito todas las series

                    for i := SeriesList.Count - 1 downto 0 do
                       SeriesList[i].Free;

                    // Agrego series segun cantidad de valores
                    // s := 0;
                    for i := 0 to T.Fields.Count - 1 do
                    begin
                       if (Copy(T.Fields[i].FieldName, 1, 5) = 'VALOR') then
                       begin
                          PieSeries := TPieSeries.Create(Grafico);
                          // TCircledSeries.LegendItemColor(Colores[s mod 6]);
                          if (Config.Values[T.Fields[i].FieldName] <> '') then
                             PieSeries.Title := DameTituloCampo(Config.Values[T.Fields[i].FieldName])
                          else
                             PieSeries.Title := 'VALOR - ' + IntToStr(i);
                          AddSeries(PieSeries);
                          // Inc(s);
                       end;
                    end;

                    while not T.EOF do
                    begin
                       n := '';
                       try
                          n := T.FieldByName('INDICE').AsString;
                       except
                       end;
                       s := 0;
                       for i := 0 to T.Fields.Count - 1 do
                       begin
                          if (Copy(T.Fields[i].FieldName, 1, 5) = 'VALOR') then
                          begin
                             TPieSeries(SeriesList[s]).Add(T.Fields[i].AsFloat, n {, Colores[s mod 6]});
                             Inc(s);
                          end;
                       end;

                       T.Next;
                    end;
                 end;
              end
              else
              if (Tipo = 'GRD') then
              begin
                 for i := 0 to T.Fields.Count - 1 do
                 begin
                    if (Config.Values[T.Fields[i].FieldName] <> '') then
                       T.Fields[i].DisplayLabel := DameTituloCampo(Config.Values[T.Fields[i].FieldName]);
                 end;

                 with Grid do
                 begin
                    i := EncuentraField(Grid, 'INDICE');
                    if (i >= 0) then
                       Columns[i].Width := Self.Width - 130;

                    i := EncuentraField(Grid, 'VALOR');
                    if (i >= 0) then
                       Columns[i].Width := 90;
                 end;

                 // Calculo Totales
                 try
                    SetLength(Totales, Grid.Columns.Count);
                    UUtiles.CalculaTotales(Grid, Totales);
                    PintaTotales(Self);
                 except
                    on E: Exception do
                       ShowMessage('ATotales' + #13#10 + E.Message);
                 end;
              end;
           finally
           end;
        except
           on E: Exception do
           begin
              if Assigned(Self.Grafico) then
                 Self.Grafico.Visible := False;
              if Assigned(Self.Grid) then
                 Self.Grid.Visible := False;
              Self.Caption := E.Message;
              Self.Color := clRed;
              Self.Font.Color := clWhite;
           end;
        end;
     end;
  finally
     Config.Free;
     TLFPanel(Self).Color := clBtnFace;
  end;
end;

procedure TFMPanelMetrica.LabelDblClick(Sender: TObject);
var
  s : string;
begin
  s := TLFLabel(Sender).Caption;
  TLFLabel(Sender).Caption := _('Refrescando ...');
  Application.ProcessMessages;

  Refrescar;

  TLFLabel(Sender).Caption := s;
end;

{------------------------------------------------------------------------------}

procedure TFMDashboard.FormCreate(Sender: TObject);
var
  P : TFMPanelMetrica;
  i, j : integer;
  TS : TTabSheet;
begin
  inherited;
  AbreData(TDashboard, Dashboard);

  EntornoDash.Empresa := REntorno.Empresa;
  EntornoDash.Ejercicio := REntorno.Ejercicio;
  EntornoDash.Canal := REntorno.Canal;
  EntornoDash.Serie := REntorno.Serie;
  EntornoDash.Pais := REntorno.Pais;
  EntornoDash.Pgc := REntorno.Pgc;
  EntornoDash.Tercero := REntorno.Tercero;

  Metricas := TList.Create;

  i := 0;
  Dashboard.xDashboard.First;

  // Asumo que las configuraciones vienen ordenadas por PAGINA+ORDEN de manera ascendente
  while not Dashboard.xDashboard.EOF do
  begin
     Inc(i);

     // Creo página si no existe
     if (PCMetricas.PageCount < Dashboard.xDashboardPAGINA.AsInteger) then
     begin
        for j := PCMetricas.PageCount + 1 to Dashboard.xDashboardPAGINA.AsInteger do
        begin
           TS := TTabSheet.Create(PCMetricas);
           with TS do
           begin
              PageControl := PCMetricas;
              Caption := Format('Pagina %d', [j]);
              PageIndex := j - 1;
              OnResize := TabSheetResize;
           end;
        end;
     end;

     // Incremento cantidad de metricas en esta pagina
     TS.Tag := TS.Tag + 1;

     // Creo metrica
     P := TFMPanelMetrica.Create(TS);
     with P do
     begin
        SetPadre(TS);
        SetNombre('Metrica' + IntToStr(i));
        SetTransaccionRO((Dashboard.xDashBoardTRANSACCION_READONLY.AsInteger = 1));
        SetDataBase(DMMain.DataBase);
        SetLabel(Dashboard.xDashboardDESCRIPCION.AsString);
        SetTipo(Dashboard.xDashboardTIPO.AsString);
        SetSQL(Dashboard.xDashboardSQL.AsString);
        SetConfiguracion(Dashboard.xDashboardCONFIGURACION.AsString);
        SetPagina(Dashboard.xDashboardPAGINA.AsInteger);
        SetPosition(0, 0, TS.Height, TS.Width);
     end;

     // Agrego a lista de metricas
     Metricas.Add(P);

     Dashboard.xDashboard.Next;
  end;

  // Refresco todas las TabSheets
  for i := 0 to PCMetricas.PageCount - 1 do
     TabSheetResize(PCMetricas.Pages[i]);

  EFEjercicio.Text := REntorno.EjercicioStr;
end;

procedure TFMDashboard.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  inherited;
  for i := Metricas.Count - 1 downto 0 do
  begin
     TFMPanelMetrica(Metricas[i]).Free;
     Metricas.Delete(i);
  end;

  Metricas.Free;

  CierraData(Dashboard);
end;

procedure TFMDashboard.TabSheetResize(Sender: TObject);
var
  CantidadMetricas : integer;
  Filas : integer;
  Columnas : integer;
  i, m, x, y, w, h : integer;
begin
  inherited;

  CantidadMetricas := TTabSheet(Sender).Tag;
  if (CantidadMetricas <> 0) then
  begin
     // Calculo cuandas filas y columnas necesito
     Filas := Trunc(sqrt(CantidadMetricas));
     Columnas := CantidadMetricas div Filas;
     if (Filas * Columnas) < CantidadMetricas then
        Inc(Columnas);

     // Calculo ancho y alto de cada panel de metricas
     w := TTabSheet(Sender).Width div Columnas;
     h := TTabSheet(Sender).Height div Filas;

     // Reposiciono paneles de Metricas
     m := 0;
     for i := 0 to Metricas.Count - 1 do
     begin
        if (TFMPanelMetrica(Metricas[i]).Pagina = TTabSheet(Sender).PageIndex + 1) then
        begin
           x := m mod Columnas;
           y := m div Columnas;
           TFMPanelMetrica(Metricas[i]).SetPosition(x * w, y * h, w, h);
           Inc(m);
        end;
     end;
  end;
end;

procedure TFMDashboard.ARefrescarExecute(Sender: TObject);
var
  i : integer;
  TS : TTabSheet;
begin
  inherited;

  TS := PCMetricas.ActivePage;
  try
     for i := 0 to Metricas.Count - 1 do
     begin
        TTabSheet(TFMPanelMetrica(Metricas[i]).Parent).Show;
        TFMPanelMetrica(Metricas[i]).Refrescar;
     end;
  finally
     PCMetricas.ActivePage := TS;
  end;
end;

procedure TFMDashboard.EFEjercicioChange(Sender: TObject);
begin
  inherited;
  if (EntornoDash.Ejercicio <> StrToIntDef(EFEjercicio.Text, 0)) then
  begin
     EntornoDash.Ejercicio := StrToIntDef(EFEjercicio.Text, 0);
     // ARefrescar.Execute;
  end;
end;

procedure TFMPanelMetrica.PintaTotales(Sender: TObject);
begin
  UUtiles.PintaTotales(PNLTotales, Grid, Totales, 'EMPRESA,EJERCICIO,CANAL,RIG,CLIENTE,PROVEEDOR,ACREEDOR,AGENTE,TERCERO,DIRECCION');
end;

procedure TFMDashboard.FormShow(Sender: TObject);
begin
  inherited;
  ARefrescar.Execute;
end;

end.
