unit UDMEstadisticaTubosParis;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, frxClass, frxHYReport, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport;

type
  TDMEstadisticaTubosParis = class(TDataModule)
     xEstFamAgeCliArt: TFIBDataSetRO;
     DSxEstFamAgeCliArt: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xEstAgeCliFam: TFIBDataSetRO;
     DSxEstAgeCliFam: TDataSource;
     xEstAgeCli: TFIBDataSetRO;
     DSxEstAgeCli: TDataSource;
     xEstAgeFamCli: TFIBDataSetRO;
     DSxEstAgeFamCli: TDataSource;
     xEstCli: TFIBDataSetRO;
     DSxEstCli: TDataSource;
     frListado: TfrHYReport;
     frDBxEstAgeCliArtFam: TfrDBDataSet;
     frxListado: TfrxHYReport;
     frDBxEstAgeCliFam: TfrDBDataSet;
     frDBxEstAgeFamCli: TfrDBDataSet;
     frDBxEstAgeCli: TfrDBDataSet;
     frDBxEstCli: TfrDBDataSet;
     xTotEstAgeCliArtFam: TFIBDataSetRO;
     xTotEstAgeCli: TFIBDataSetRO;
     xTotEstCli: TFIBDataSetRO;
     xEstFam: TFIBDataSetRO;
     DSxEstFam: TDataSource;
     xEstFamArt: TFIBDataSetRO;
     DSxEstFamArt: TDataSource;
     xTotEstAgeCliFam: TFIBDataSetRO;
     xEstAgente: TFIBDataSetRO;
     DSxEstAgente: TDataSource;
     frDBDxEstAgente: TfrDBDataSet;
     xTotEstAgente: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
     procedure frListadoEnterRect(Memo: TStringList; View: TfrView);
     procedure frxListadoBeforePrint(Sender: TfrxReportComponent);
     procedure frxListadoGetValue(const VarName: string; var Value: variant);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xEstAgeCliAfterOpen(DataSet: TDataSet);
     procedure xEstAgeCliBeforeClose(DataSet: TDataSet);
     procedure xEstCliAfterOpen(DataSet: TDataSet);
     procedure xEstCliBeforeClose(DataSet: TDataSet);
     procedure xEstFamAgeCliArtAfterOpen(DataSet: TDataSet);
     procedure xEstFamAgeCliArtBeforeClose(DataSet: TDataSet);
     procedure xEstFamAgeCliArtAfterScroll(DataSet: TDataSet);
     procedure xEstAgeCliAfterScroll(DataSet: TDataSet);
     procedure xEstAgeCliFamAfterOpen(DataSet: TDataSet);
     procedure xEstAgeCliFamBeforeClose(DataSet: TDataSet);
     procedure xEstAgeCliFamAfterScroll(DataSet: TDataSet);
     procedure xEstAgenteAfterOpen(DataSet: TDataSet);
     procedure xEstAgenteBeforeClose(DataSet: TDataSet);
     procedure xEstAgenteAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     FechaDesde, FechaHasta: TDateTime;
     FechaListado: TDateTime;
     Titulo: string;
     xEstAgeCli_ID: string;
     xEstCli_ID: string;
     xEstAgeCliArtFam_ID: string;
     xEstAgeCliFam_ID: string;
     xEstAgente_ID: string;
  public
     { Public declarations }
     EstFamAgeCliArt: boolean;
     EstAgeCliFam: boolean;
     EstAgeFamCli: boolean;
     EstAgeCli: boolean;
     EstCli: boolean;
     EstFam: boolean;
     EstFamArt: boolean;
     EstAgentes: boolean;
     procedure MostrarInforme(Modo, Grupo: smallint; aTitulo: string; aFechaListado: TDateTime; aFechaDesde, aFechaHasta: TDateTime);
  end;

var
  DMEstadisticaTubosParis : TDMEstadisticaTubosParis;

implementation

uses UDMListados, UFormGest, UDMMain, UUtiles, UEntorno, UFSendCorreo, UHojaCalc, Forms, Graphics, UDameDato;

{$R *.dfm}

procedure TDMEstadisticaTubosParis.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMEstadisticaTubosParis.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMEstadisticaTubosParis.MostrarInforme(Modo, Grupo: smallint; aTitulo: string; aFechaListado: TDateTime; aFechaDesde, aFechaHasta: TDateTime);
var
  HCalc : THojaCalc;
  c, f : integer;
  Archivo : string;
  AgrupNombre : string;
  AgrupFamilia : string;
  AgrupCliente : integer;
  AgrupAgente : integer;
  Agente : integer;
  FilaAgrupFamilia : integer;
  FilaAgrupCliente : integer;
  FilaAgrupAgente : integer;
  ColumnaCliente : integer;
  ColumnaAgente : integer;
  ColumnaNombre : integer;
  ColumnaFamilia : integer;
  ColumnaArticulo : integer;
  ColumnaAgrupUdsLogistica : integer;
  ColumnaAgrupUnidades : integer;
  ColumnaAgrupPeso : integer;
  ColumnaAgrupImporte : integer;
  ColumnaAgrupCoste : integer;
  ColumnaAgrupMargen : integer;
  ColorResaltado : TColor;
begin
  // Color para resaltado de algunos valores
  ColorResaltado := Brighten(clRed, 50);

  Titulo := aTitulo;
  FechaListado := aFechaListado;
  FechaDesde := HourIntoDate(aFechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(aFechaHasta, '23:59:59');
  xEstAgeCli_ID := '';
  xEstCli_ID := '';
  xEstAgeCliArtFam_ID := '';
  xEstAgeCliFam_ID := '';
  xEstAgente_ID := '';
  ColumnaAgrupImporte := 0;
  ColumnaAgrupCoste := 0;
  ColumnaAgrupPeso := 0;
  ColumnaAgrupUdsLogistica := 0;
  ColumnaAgrupUnidades := 0;
  ColumnaAgrupMargen := 0;

  with xEstFamAgeCliArt do
  begin
     Close;
     if EstFamAgeCliArt then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with xEstAgeCliFam do
  begin
     Close;
     if EstAgeCliFam then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with xEstAgeFamCli do
  begin
     Close;
     if EstAgeFamCli then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with xEstAgeCli do
  begin
     Close;
     if EstAgeCli then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with xTotEstCli do
  begin
     Close;
     if EstCli then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
  end;

  with xEstAgente do
  begin
     Close;
     if EstAgentes then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with xTotEstAgente do
  begin
     Close;
     if EstAgentes then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
  end;

  with xEstCli do
  begin
     Close;
     if EstCli then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with xEstFam do
  begin
     Close;
     if EstFam then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with xEstFamArt do
  begin
     Close;
     if EstFamArt then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  if (Modo < 2) then
  begin
     DMListados.DatosInforme(FechaListado, Titulo);
     DMListados.Imprimir(Grupo, 0, Modo, '', Titulo, frListado, frxListado, nil);
  end
  else
  begin
     Archivo := Format(_('Estadistica-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS,CSV', '', 'DMEstadisticaTubosParis') then
     begin
        if (UpperCase(ExtractFileExt(Archivo)) = '.ODS') then
           HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
        else
           HCalc := THojaCalc.Create(thcExcel, False);

        HCalc.FileName := Archivo; //Needs a file name before you SaveDoc!
        //--end of creation.

        try
           FSendCorreo := TFSendCorreo.Create(Self);
           try
              FSendCorreo.Titulo(Format(_('Exportando Estadistica Fam-Age-Cli-Art (%d / 7)'), [1]));
              FSendCorreo.Show;
              FSendCorreo.Texto('');

              HCalc.AddNewSheet(_('Fam-Age-Cli-Art'), True);
              HCalc.ActivateSheetByName(_('Fam-Age-Cli-Art'), True);

              DMMain.Log(_('Fam-Age-Cli-Art'));
              with xEstFamAgeCliArt do
              begin
                 // Encabezado
                 f := 1;
                 HCalc.CellText[f, 1] := _('Fecha');
                 HCalc.CellText[f, 2] := FormatDateTime('dd/mm/yyyy hh:nn', Now);
                 HCalc.CellText[f, 3] := _('Estadistica Fam-Age-Cli-Art');
                 for c := 0 to FieldCount - 1 do
                    HCalc.BackgroundColor(f, c + 1, clSkyBlue);

                 f := 4;
                 for c := 0 to FieldCount - 1 do
                 begin
                    HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                    HCalc.BackgroundColor(f, c + 1, clSilver);

                    if (Fields[c].FieldName = 'FAMILIA') then
                       ColumnaFamilia := c;
                    if (Fields[c].FieldName = 'UNIDADES_LOGISTICAS') then
                       ColumnaAgrupUdsLogistica := c;
                    if (Fields[c].FieldName = 'UNIDADES') then
                       ColumnaAgrupUnidades := c;
                    if (Fields[c].FieldName = 'PESO') then
                       ColumnaAgrupPeso := c;
                    if (Fields[c].FieldName = 'IMPORTE') then
                       ColumnaAgrupImporte := c;
                    if (Fields[c].FieldName = 'COSTE') then
                       ColumnaAgrupCoste := c;
                    if (Fields[c].FieldName = 'MARGEN') then
                       ColumnaAgrupMargen := c;

                    if (Fields[c] is TFloatField) then
                    begin
                       if (HCalc.IsOpenOffice) then
                       begin
                          if (c = ColumnaAgrupPeso) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0')
                          else
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                       end;
                    end;

                    if (Fields[c] is TDateTimeField) then
                       HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                 end;

                 AgrupFamilia := '';
                 FilaAgrupFamilia := 0;
                 First;
                 while not EOF do
                 begin
                    if (AgrupFamilia <> FieldByName('FAMILIA').AsString) then
                    begin
                       // Agrego sumatorias
                       if (AgrupFamilia <> '') then
                       begin
                          HCalc.CellText[FilaAgrupFamilia, ColumnaFamilia + 1] := Trim(AgrupFamilia);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupPeso + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupImporte + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupCoste + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia, Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia, Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia]);

                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaFamilia + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUnidades + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupPeso + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupImporte + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupCoste + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupMargen + 1, clYellow);
                       end;

                       AgrupFamilia := FieldByName('FAMILIA').AsString;
                       Inc(f);
                       FilaAgrupFamilia := f;
                    end;

                    Inc(f);
                    // Dec(CantidadRegistros);
                    FSendCorreo.Texto(Format(_('Exportando Registro %d'), [f]));
                    for c := 0 to FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (Fields[c] is TStringField) then
                          HCalc.CellText[f, c + 1] := Trim(Fields[c].AsString);

                       // Campo tipo Float
                       if (Fields[c] is TFloatField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat);

                       // Campo tipo Integer
                       if (Fields[c] is TIntegerField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger);

                       // Campo tipo Fecha
                       if (Fields[c] is TDateTimeField) then
                       begin
                          // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                          if (HCalc.IsOpenOffice) then
                             HCalc.CellText[f, c + 1] := DateToStr(Fields[c].AsDateTime)
                          else
                             HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[c].AsDateTime));
                       end;

                       // Campo tipo Blob
                       // Los blobs exportan solo caracteres basicos.
                       if (Fields[c] is TBlobField) then
                       begin
                          try
                             HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(Fields[c].AsString));
                          except
                             HCalc.CellText[f, c + 1] := 'BLOB';
                          end;
                       end;

                       if (Fields[c].FieldName = 'ARTICULO') and (FieldByName('STOCK_MINIMO').AsFloat <= 0.1) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                       if (Fields[c].FieldName = 'FAMILIA') and (Fields[c].AsString = 'VAR') then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                       if (Fields[c].FieldName = 'MARGEN') and (Fields[c].AsFloat < 8) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                    end;

                    Next;
                    Application.ProcessMessages;
                 end;

                 // Agrego sumatorias
                 if (AgrupFamilia <> '') then
                 begin
                    HCalc.CellText[FilaAgrupFamilia, ColumnaFamilia + 1] := Trim(AgrupFamilia);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupPeso + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupImporte + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupCoste + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia, Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia, Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia]);

                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaFamilia + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUnidades + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupPeso + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupImporte + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupCoste + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupMargen + 1, clYellow);
                 end;

                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c] is TStringField) then
                    begin
                       HCalc.AutoFit(c + 1);
                       DMMain.Log(format('Autofit %d', [c + 1]));
                    end;
                 end;
              end;

              FSendCorreo.Titulo(Format(_('Exportando Estadistica Age-Cli-Fam (%d / 7)'), [2]));
              FSendCorreo.Texto('');

              HCalc.AddNewSheet(_('Age-Cli-Fam'), True);
              HCalc.ActivateSheetByName(_('Age-Cli-Fam'), True);

              DMMain.Log(_('Age-Cli-Fam'));
              with xEstAgeCliFam do
              begin
                 // Encabezado
                 f := 1;
                 HCalc.CellText[f, 1] := _('Fecha');
                 HCalc.CellText[f, 2] := FormatDateTime('dd/mm/yyyy hh:nn', Now);
                 HCalc.CellText[f, 3] := _('Estadistica Age-Cli-Fam');
                 for c := 0 to FieldCount - 1 do
                    HCalc.BackgroundColor(f, c + 1, clSkyBlue);

                 f := 4;
                 for c := 0 to FieldCount - 1 do
                 begin
                    HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                    HCalc.BackgroundColor(f, c + 1, clSilver);

                    if (Fields[c].FieldName = 'CLIENTE') then
                       ColumnaCliente := c;
                    if (Fields[c].FieldName = 'NOMBRE_R_SOCIAL') then
                       ColumnaNombre := c;
                    if (Fields[c].FieldName = 'UNIDADES_LOGISTICAS') then
                       ColumnaAgrupUdsLogistica := c;
                    if (Fields[c].FieldName = 'UNIDADES') then
                       ColumnaAgrupUnidades := c;
                    if (Fields[c].FieldName = 'PESO') then
                       ColumnaAgrupPeso := c;
                    if (Fields[c].FieldName = 'IMPORTE') then
                       ColumnaAgrupImporte := c;
                    if (Fields[c].FieldName = 'COSTE') then
                       ColumnaAgrupCoste := c;
                    if (Fields[c].FieldName = 'MARGEN') then
                       ColumnaAgrupMargen := c;

                    if (Fields[c] is TFloatField) then
                    begin
                       if (HCalc.IsOpenOffice) then
                       begin
                          if (c = ColumnaAgrupPeso) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0')
                          else
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                       end;
                    end;

                    if (Fields[c] is TDateTimeField) then
                       HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                 end;

                 AgrupCliente := 0;
                 FilaAgrupCliente := 0;
                 AgrupNombre := '';
                 First;
                 while not EOF do
                 begin
                    if (AgrupCliente <> FieldByName('CLIENTE').AsInteger) then
                    begin
                       // Agrego sumatorias
                       if (AgrupCliente <> 0) then
                       begin
                          HCalc.SendNumber(FilaAgrupCliente, ColumnaCliente + 1, AgrupCliente);
                          HCalc.CellText[FilaAgrupCliente, ColumnaNombre + 1] := Trim(AgrupNombre);
                          HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                          HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                          HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupPeso + 65), f]);
                          HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupImporte + 65), f]);
                          HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupCoste + 65), f]);
                          HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente, Chr(ColumnaAgrupCoste + 65), FilaAgrupCliente, Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente]);

                          HCalc.BackgroundColor(FilaAgrupCliente, ColumnaCliente + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupCliente, ColumnaNombre + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupUdsLogistica + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupUnidades + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupPeso + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupImporte + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupCoste + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupMargen + 1, clYellow);
                       end;

                       AgrupCliente := FieldByName('CLIENTE').AsInteger;
                       AgrupNombre := FieldByName('NOMBRE_R_SOCIAL').AsString;
                       Inc(f);
                       FilaAgrupCliente := f;
                    end;

                    Inc(f);
                    // Dec(CantidadRegistros);
                    FSendCorreo.Texto(Format(_('Exportando Registro %d'), [f]));
                    for c := 0 to FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (Fields[c] is TStringField) then
                          HCalc.CellText[f, c + 1] := Trim(Fields[c].AsString);

                       // Campo tipo Float
                       if (Fields[c] is TFloatField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat);

                       // Campo tipo Integer
                       if (Fields[c] is TIntegerField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger);

                       // Campo tipo Fecha
                       if (Fields[c] is TDateTimeField) then
                       begin
                          // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                          if (HCalc.IsOpenOffice) then
                             HCalc.CellText[f, c + 1] := DateToStr(Fields[c].AsDateTime)
                          else
                             HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[c].AsDateTime));
                       end;

                       // Campo tipo Blob
                       // Los blobs exportan solo caracteres basicos.
                       if (Fields[c] is TBlobField) then
                       begin
                          try
                             HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(Fields[c].AsString));
                          except
                             HCalc.CellText[f, c + 1] := 'BLOB';
                          end;
                       end;

                       if (Fields[c].FieldName = 'FAMILIA') and (Fields[c].AsString = 'VAR') then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                       if (Fields[c].FieldName = 'MARGEN') and (Fields[c].AsFloat < 8) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                    end;

                    Next;
                    Application.ProcessMessages;
                 end;

                 // Agrego sumatorias
                 if (AgrupCliente <> 0) then
                 begin
                    HCalc.SendNumber(FilaAgrupCliente, ColumnaCliente + 1, AgrupCliente);
                    HCalc.CellText[FilaAgrupCliente, ColumnaNombre + 1] := Trim(AgrupNombre);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupPeso + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupImporte + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupCoste + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente, Chr(ColumnaAgrupCoste + 65), FilaAgrupCliente, Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente]);

                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaCliente + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaNombre + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupUdsLogistica + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupUnidades + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupPeso + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupImporte + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupCoste + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupMargen + 1, clYellow);
                 end;

                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c] is TStringField) then
                    begin
                       HCalc.AutoFit(c + 1);
                       DMMain.Log(format('Autofit %d', [c + 1]));
                    end;
                 end;
              end;

              FSendCorreo.Titulo(Format(_('Exportando Estadistica Age-Fam-Cli (%d / 7)'), [3]));
              FSendCorreo.Texto('');

              HCalc.AddNewSheet(_('Age-Fam-Cli'), True);
              HCalc.ActivateSheetByName(_('Age-Fam-Cli'), True);

              DMMain.Log(_('Age-Fam-Cli'));
              with xEstAgeFamCli do
              begin
                 // Encabezado
                 f := 1;
                 HCalc.CellText[f, 1] := _('Fecha');
                 HCalc.CellText[f, 2] := FormatDateTime('dd/mm/yyyy hh:nn', Now);
                 HCalc.CellText[f, 3] := _('Estadistica Age-Fam-Cli');
                 for c := 0 to FieldCount - 1 do
                    HCalc.BackgroundColor(f, c + 1, clSkyBlue);

                 f := 4;
                 for c := 0 to FieldCount - 1 do
                 begin
                    HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                    HCalc.BackgroundColor(f, c + 1, clSilver);

                    if (Fields[c].FieldName = 'FAMILIA') then
                       ColumnaFamilia := c;
                    if (Fields[c].FieldName = 'UNIDADES_LOGISTICAS') then
                       ColumnaAgrupUdsLogistica := c;
                    if (Fields[c].FieldName = 'UNIDADES') then
                       ColumnaAgrupUnidades := c;
                    if (Fields[c].FieldName = 'PESO') then
                       ColumnaAgrupPeso := c;
                    if (Fields[c].FieldName = 'IMPORTE') then
                       ColumnaAgrupImporte := c;
                    if (Fields[c].FieldName = 'COSTE') then
                       ColumnaAgrupCoste := c;
                    if (Fields[c].FieldName = 'MARGEN') then
                       ColumnaAgrupMargen := c;

                    if (Fields[c] is TFloatField) then
                    begin
                       if (HCalc.IsOpenOffice) then
                       begin
                          if (c = ColumnaAgrupPeso) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0')
                          else
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                       end;
                    end;

                    if (Fields[c] is TDateTimeField) then
                       HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                 end;

                 AgrupFamilia := '';
                 FilaAgrupFamilia := 0;
                 First;
                 while not EOF do
                 begin
                    if (AgrupFamilia <> FieldByName('FAMILIA').AsString) then
                    begin
                       // Agrego sumatorias
                       if (AgrupFamilia <> '') then
                       begin
                          HCalc.CellText[FilaAgrupFamilia, ColumnaFamilia + 1] := Trim(AgrupFamilia);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupPeso + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupImporte + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupCoste + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia, Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia, Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia]);

                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaFamilia + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUnidades + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupPeso + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupImporte + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupCoste + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupMargen + 1, clYellow);
                       end;

                       AgrupFamilia := FieldByName('FAMILIA').AsString;
                       Inc(f);
                       FilaAgrupFamilia := f;
                    end;

                    Inc(f);
                    // Dec(CantidadRegistros);
                    FSendCorreo.Texto(Format(_('Exportando Registro %d'), [f]));
                    for c := 0 to FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (Fields[c] is TStringField) then
                          HCalc.CellText[f, c + 1] := Trim(Fields[c].AsString);

                       // Campo tipo Float
                       if (Fields[c] is TFloatField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat);

                       // Campo tipo Integer
                       if (Fields[c] is TIntegerField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger);

                       // Campo tipo Fecha
                       if (Fields[c] is TDateTimeField) then
                       begin
                          // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                          if (HCalc.IsOpenOffice) then
                             HCalc.CellText[f, c + 1] := DateToStr(Fields[c].AsDateTime)
                          else
                             HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[c].AsDateTime));
                       end;

                       // Campo tipo Blob
                       // Los blobs exportan solo caracteres basicos.
                       if (Fields[c] is TBlobField) then
                       begin
                          try
                             HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(Fields[c].AsString));
                          except
                             HCalc.CellText[f, c + 1] := 'BLOB';
                          end;
                       end;

                       if (Fields[c].FieldName = 'FAMILIA') and (Fields[c].AsString = 'VAR') then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                       if (Fields[c].FieldName = 'MARGEN') and (Fields[c].AsFloat < 8) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                    end;

                    Next;
                    Application.ProcessMessages;
                 end;

                 // Agrego sumatorias
                 if (AgrupFamilia <> '') then
                 begin
                    HCalc.CellText[FilaAgrupFamilia, ColumnaFamilia + 1] := Trim(AgrupFamilia);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupPeso + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupImporte + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupCoste + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia, Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia, Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia]);

                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaFamilia + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUnidades + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupPeso + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupImporte + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupCoste + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupMargen + 1, clYellow);
                 end;

                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c] is TStringField) then
                    begin
                       HCalc.AutoFit(c + 1);
                       DMMain.Log(format('Autofit %d', [c + 1]));
                    end;
                 end;
              end;

              FSendCorreo.Titulo(Format(_('Exportando Estadistica Age-Cli (%d / 7)'), [4]));
              FSendCorreo.Texto('');

              HCalc.AddNewSheet(_('Age-Cli'), True);
              HCalc.ActivateSheetByName(_('Age-Cli'), True);

              DMMain.Log(_('Age-Cli'));
              with xEstAgeCli do
              begin
                 // Encabezado
                 f := 1;
                 HCalc.CellText[f, 1] := _('Fecha');
                 HCalc.CellText[f, 2] := FormatDateTime('dd/mm/yyyy hh:nn', Now);
                 HCalc.CellText[f, 3] := _('Estadistica Age-Cli');
                 for c := 0 to FieldCount - 1 do
                    HCalc.BackgroundColor(f, c + 1, clSkyBlue);

                 f := 4;
                 for c := 0 to FieldCount - 1 do
                 begin
                    HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                    HCalc.BackgroundColor(f, c + 1, clSilver);

                    if (Fields[c].FieldName = 'AGENTE') then
                       ColumnaAgente := c;
                    if (Fields[c].FieldName = 'NOMBRE_R_SOCIAL') then
                       ColumnaNombre := c;
                    if (Fields[c].FieldName = 'UNIDADES_LOGISTICAS') then
                       ColumnaAgrupUdsLogistica := c;
                    if (Fields[c].FieldName = 'UNIDADES') then
                       ColumnaAgrupUnidades := c;
                    if (Fields[c].FieldName = 'PESO') then
                       ColumnaAgrupPeso := c;
                    if (Fields[c].FieldName = 'IMPORTE') then
                       ColumnaAgrupImporte := c;
                    if (Fields[c].FieldName = 'COSTE') then
                       ColumnaAgrupCoste := c;
                    if (Fields[c].FieldName = 'MARGEN') then
                       ColumnaAgrupMargen := c;

                    if (Fields[c] is TFloatField) then
                    begin
                       if (HCalc.IsOpenOffice) then
                       begin
                          if (c = ColumnaAgrupPeso) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0')
                          else
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                       end;
                    end;

                    if (Fields[c] is TDateTimeField) then
                       HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                 end;

                 AgrupAgente := 0;
                 FilaAgrupAgente := 0;
                 // AgrupNombre := '';
                 First;
                 while not EOF do
                 begin
                    if (AgrupAgente <> FieldByName('AGENTE').AsInteger) then
                    begin
                       // Agrego sumatorias
                       if (AgrupAgente <> 0) then
                       begin
                          HCalc.SendNumber(FilaAgrupAgente, ColumnaAgente + 1, AgrupAgente);
                          // HCalc.CellText[FilaAgrupAgente, ColumnaNombre + 1] := Trim(AgrupNombre);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupPeso + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupImporte + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupCoste + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente, Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente, Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente]);

                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgente + 1, clYellow);
                          // HCalc.BackgroundColor(FilaAgrupAgente, ColumnaNombre + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUnidades + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupPeso + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupImporte + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupCoste + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupMargen + 1, clYellow);
                       end;

                       AgrupAgente := FieldByName('AGENTE').AsInteger;
                       // AgrupNombre := FieldByName('NOMBRE_R_SOCIAL').AsString;
                       Inc(f);
                       FilaAgrupAgente := f;
                    end;

                    Inc(f);
                    // Dec(CantidadRegistros);
                    FSendCorreo.Texto(Format(_('Exportando Registro %d'), [f]));
                    for c := 0 to FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (Fields[c] is TStringField) then
                          HCalc.CellText[f, c + 1] := Trim(Fields[c].AsString);

                       // Campo tipo Float
                       if (Fields[c] is TFloatField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat);

                       // Campo tipo Integer
                       if (Fields[c] is TIntegerField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger);

                       // Campo tipo Fecha
                       if (Fields[c] is TDateTimeField) then
                       begin
                          // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                          if (HCalc.IsOpenOffice) then
                             HCalc.CellText[f, c + 1] := DateToStr(Fields[c].AsDateTime)
                          else
                             HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[c].AsDateTime));
                       end;

                       // Campo tipo Blob
                       // Los blobs exportan solo caracteres basicos.
                       if (Fields[c] is TBlobField) then
                       begin
                          try
                             HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(Fields[c].AsString));
                          except
                             HCalc.CellText[f, c + 1] := 'BLOB';
                          end;
                       end;

                       if (Fields[c].FieldName = 'MARGEN') and (Fields[c].AsFloat < 8) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                    end;

                    Next;
                    Application.ProcessMessages;
                 end;

                 // Agrego sumatorias
                 if (AgrupAgente <> 0) then
                 begin
                    HCalc.SendNumber(FilaAgrupAgente, ColumnaAgente + 1, AgrupAgente);
                    // HCalc.CellText[FilaAgrupAgente, ColumnaNombre + 1] := Trim(AgrupNombre);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupPeso + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupImporte + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupCoste + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente, Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente, Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente]);

                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgente + 1, clYellow);
                    // HCalc.BackgroundColor(FilaAgrupAgente, ColumnaNombre + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUnidades + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupPeso + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupImporte + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupCoste + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupMargen + 1, clYellow);
                 end;

                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c] is TStringField) then
                    begin
                       HCalc.AutoFit(c + 1);
                       DMMain.Log(format('Autofit %d', [c + 1]));
                    end;
                 end;
              end;

              FSendCorreo.Titulo(Format(_('Exportando Estadistica Cli (%d / 7)'), [5]));
              FSendCorreo.Texto('');

              HCalc.AddNewSheet(_('Cli'), True);
              HCalc.ActivateSheetByName(_('Cli'), True);

              DMMain.Log(_('Cli'));
              with xEstCli do
              begin
                 // Encabezado
                 f := 1;
                 HCalc.CellText[f, 1] := _('Fecha');
                 HCalc.CellText[f, 2] := FormatDateTime('dd/mm/yyyy hh:nn', Now);
                 HCalc.CellText[f, 3] := _('Estadistica Cli');
                 for c := 0 to FieldCount - 1 do
                    HCalc.BackgroundColor(f, c + 1, clSkyBlue);

                 f := 4;
                 for c := 0 to FieldCount - 1 do
                 begin
                    HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                    HCalc.BackgroundColor(f, c + 1, clSilver);

                    if (Fields[c] is TDateTimeField) then
                       HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');

                    if (Fields[c].FieldName = 'UNIDADES_LOGISTICAS') then
                       ColumnaAgrupUdsLogistica := c;
                    if (Fields[c].FieldName = 'UNIDADES') then
                       ColumnaAgrupUnidades := c;
                    if (Fields[c].FieldName = 'PESO') then
                       ColumnaAgrupPeso := c;
                    if (Fields[c].FieldName = 'IMPORTE') then
                       ColumnaAgrupImporte := c;
                    if (Fields[c].FieldName = 'COSTE') then
                       ColumnaAgrupCoste := c;
                    if (Fields[c].FieldName = 'MARGEN') then
                       ColumnaAgrupMargen := c;

                    if (Fields[c] is TFloatField) then
                    begin
                       if (HCalc.IsOpenOffice) then
                       begin
                          if (c = ColumnaAgrupPeso) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0')
                          else
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                       end;
                    end;

                    if (Fields[c] is TDateTimeField) then
                       HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                 end;

                 Inc(f);
                 FilaAgrupCliente := f;
                 First;
                 while not EOF do
                 begin
                    Inc(f);
                    // Dec(CantidadRegistros);
                    FSendCorreo.Texto(Format(_('Exportando Registro %d'), [f]));
                    for c := 0 to FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (Fields[c] is TStringField) then
                          HCalc.CellText[f, c + 1] := Trim(Fields[c].AsString);

                       // Campo tipo Float
                       if (Fields[c] is TFloatField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat);

                       // Campo tipo Integer
                       if (Fields[c] is TIntegerField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger);

                       // Campo tipo Fecha
                       if (Fields[c] is TDateTimeField) then
                       begin
                          // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                          if (HCalc.IsOpenOffice) then
                             HCalc.CellText[f, c + 1] := DateToStr(Fields[c].AsDateTime)
                          else
                             HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[c].AsDateTime));
                       end;

                       // Campo tipo Blob
                       // Los blobs exportan solo caracteres basicos.
                       if (Fields[c] is TBlobField) then
                       begin
                          try
                             HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(Fields[c].AsString));
                          except
                             HCalc.CellText[f, c + 1] := 'BLOB';
                          end;
                       end;

                       if (Fields[c].FieldName = 'MARGEN') and (Fields[c].AsFloat < 8) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                    end;

                    Next;
                    Application.ProcessMessages;
                 end;

                 // Agrego sumatorias
                 if (True) then
                 begin
                    // HCalc.SendNumber(FilaAgrupCliente, ColumnaAgente + 1, AgrupAgente);
                    // HCalc.CellText[FilaAgrupCliente, ColumnaNombre + 1] := Trim(AgrupNombre);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupPeso + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupImporte + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupCliente + 1, Chr(ColumnaAgrupCoste + 65), f]);
                    HCalc.CellFormula[FilaAgrupCliente, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente, Chr(ColumnaAgrupCoste + 65), FilaAgrupCliente, Chr(ColumnaAgrupImporte + 65), FilaAgrupCliente]);

                    // HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgente + 1, clYellow);
                    // HCalc.BackgroundColor(FilaAgrupCliente, ColumnaNombre + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupUdsLogistica + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupUnidades + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupPeso + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupImporte + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupCoste + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupCliente, ColumnaAgrupMargen + 1, clYellow);
                 end;

                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c] is TStringField) then
                    begin
                       HCalc.AutoFit(c + 1);
                       DMMain.Log(format('Autofit %d', [c + 1]));
                    end;
                 end;
              end;

              FSendCorreo.Titulo(Format(_('Exportando Estadistica Fam (%d / 7)'), [6]));
              FSendCorreo.Texto('');

              HCalc.AddNewSheet(_('Fam'), True);
              HCalc.ActivateSheetByName(_('Fam'), True);

              DMMain.Log(_('Fam'));
              with xEstFam do
              begin
                 // Encabezado
                 f := 1;
                 HCalc.CellText[f, 1] := _('Fecha');
                 HCalc.CellText[f, 2] := FormatDateTime('dd/mm/yyyy hh:nn', Now);
                 HCalc.CellText[f, 3] := _('Estadistica Fam');
                 for c := 0 to FieldCount - 1 do
                    HCalc.BackgroundColor(f, c + 1, clSkyBlue);

                 f := 4;
                 for c := 0 to FieldCount - 1 do
                 begin
                    HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                    HCalc.BackgroundColor(f, c + 1, clSilver);

                    if (Fields[c].FieldName = 'UNIDADES_LOGISTICAS') then
                       ColumnaAgrupUdsLogistica := c;
                    if (Fields[c].FieldName = 'UNIDADES') then
                       ColumnaAgrupUnidades := c;
                    if (Fields[c].FieldName = 'PESO') then
                       ColumnaAgrupPeso := c;
                    if (Fields[c].FieldName = 'IMPORTE') then
                       ColumnaAgrupImporte := c;
                    if (Fields[c].FieldName = 'COSTE') then
                       ColumnaAgrupCoste := c;
                    if (Fields[c].FieldName = 'MARGEN') then
                       ColumnaAgrupMargen := c;

                    if (Fields[c] is TFloatField) then
                    begin
                       if (HCalc.IsOpenOffice) then
                       begin
                          if (c = ColumnaAgrupPeso) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0')
                          else
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                       end;
                    end;

                    if (Fields[c] is TDateTimeField) then
                       HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                 end;

                 Inc(f);
                 FilaAgrupFamilia := f;
                 First;
                 while not EOF do
                 begin
                    Inc(f);
                    // Dec(CantidadRegistros);
                    FSendCorreo.Texto(Format(_('Exportando Registro %d'), [f]));
                    for c := 0 to FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (Fields[c] is TStringField) then
                          HCalc.CellText[f, c + 1] := Trim(Fields[c].AsString);

                       // Campo tipo Float
                       if (Fields[c] is TFloatField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat);

                       // Campo tipo Integer
                       if (Fields[c] is TIntegerField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger);

                       // Campo tipo Fecha
                       if (Fields[c] is TDateTimeField) then
                       begin
                          // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                          if (HCalc.IsOpenOffice) then
                             HCalc.CellText[f, c + 1] := DateToStr(Fields[c].AsDateTime)
                          else
                             HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[c].AsDateTime));
                       end;

                       // Campo tipo Blob
                       // Los blobs exportan solo caracteres basicos.
                       if (Fields[c] is TBlobField) then
                       begin
                          try
                             HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(Fields[c].AsString));
                          except
                             HCalc.CellText[f, c + 1] := 'BLOB';
                          end;
                       end;

                       if (Fields[c].FieldName = 'FAMILIA') and (Fields[c].AsString = 'VAR') then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                       if (Fields[c].FieldName = 'MARGEN') and (Fields[c].AsFloat < 8) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                    end;

                    Next;
                    Application.ProcessMessages;
                 end;

                 // Agrego sumatorias
                 if (True) then
                 begin
                    // HCalc.SendNumber(FilaAgrupCliente, ColumnaAgente + 1, AgrupAgente);
                    // HCalc.CellText[FilaAgrupFamilia, ColumnaNombre + 1] := Trim(AgrupNombre);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupPeso + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupImporte + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupCoste + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia, Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia, Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia]);

                    // HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgente + 1, clYellow);
                    // HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaNombre + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUnidades + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupPeso + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupImporte + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupCoste + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupMargen + 1, clYellow);
                 end;

                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c] is TStringField) then
                    begin
                       HCalc.AutoFit(c + 1);
                       DMMain.Log(format('Autofit %d', [c + 1]));
                    end;
                 end;
              end;

              FSendCorreo.Titulo(Format(_('Exportando Estadistica Fam-Art (%d / 7)'), [7]));
              FSendCorreo.Texto('');

              HCalc.AddNewSheet(_('Fam-Art'), True);
              HCalc.ActivateSheetByName(_('Fam-Art'), True);

              DMMain.Log(_('Fam-Art'));
              with xEstFamArt do
              begin
                 // Encabezado
                 f := 1;
                 HCalc.CellText[f, 1] := _('Fecha');
                 HCalc.CellText[f, 2] := FormatDateTime('dd/mm/yyyy hh:nn', Now);
                 HCalc.CellText[f, 3] := _('Estadistica Fam-Art');
                 for c := 0 to FieldCount - 1 do
                    HCalc.BackgroundColor(f, c + 1, clSkyBlue);

                 f := 4;
                 for c := 0 to FieldCount - 1 do
                 begin
                    HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                    HCalc.BackgroundColor(f, c + 1, clSilver);

                    if (Fields[c].FieldName = 'FAMILIA') then
                       ColumnaFamilia := c;
                    if (Fields[c].FieldName = 'ARTICULO') then
                       ColumnaArticulo := c;
                    if (Fields[c].FieldName = 'UNIDADES_LOGISTICAS') then
                       ColumnaAgrupUdsLogistica := c;
                    if (Fields[c].FieldName = 'UNIDADES') then
                       ColumnaAgrupUnidades := c;
                    if (Fields[c].FieldName = 'PESO') then
                       ColumnaAgrupPeso := c;
                    if (Fields[c].FieldName = 'IMPORTE') then
                       ColumnaAgrupImporte := c;
                    if (Fields[c].FieldName = 'COSTE') then
                       ColumnaAgrupCoste := c;
                    if (Fields[c].FieldName = 'MARGEN') then
                       ColumnaAgrupMargen := c;

                    if (Fields[c] is TFloatField) then
                    begin
                       if (HCalc.IsOpenOffice) then
                       begin
                          if (c = ColumnaAgrupPeso) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0')
                          else
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                       end;
                    end;

                    if (Fields[c] is TDateTimeField) then
                       HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                 end;

                 AgrupFamilia := '';
                 FilaAgrupFamilia := 0;
                 // AgrupNombre := '';
                 First;
                 while not EOF do
                 begin
                    if (AgrupFamilia <> FieldByName('FAMILIA').AsString) then
                    begin
                       // Agrego sumatorias
                       if (AgrupFamilia <> '') then
                       begin
                          HCalc.CellText[FilaAgrupFamilia, ColumnaFamilia + 1] := AgrupFamilia;
                          // HCalc.CellText[FilaAgrupFamilia, ColumnaNombre + 1] := Trim(AgrupNombre);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupPeso + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupImporte + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupCoste + 65), f]);
                          HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia, Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia, Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia]);

                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaFamilia + 1, clYellow);
                          // HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaNombre + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUnidades + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupPeso + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupImporte + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupCoste + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupMargen + 1, clYellow);
                       end;

                       AgrupFamilia := FieldByName('FAMILIA').AsString;
                       // AgrupNombre := FieldByName('NOMBRE_R_SOCIAL').AsString;
                       Inc(f);
                       FilaAgrupFamilia := f;
                    end;

                    Inc(f);
                    // Dec(CantidadRegistros);
                    FSendCorreo.Texto(Format(_('Exportando Registro %d'), [f]));
                    for c := 0 to FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (Fields[c] is TStringField) then
                          HCalc.CellText[f, c + 1] := Trim(Fields[c].AsString);

                       // Campo tipo Float
                       if (Fields[c] is TFloatField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat);

                       // Campo tipo Integer
                       if (Fields[c] is TIntegerField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger);

                       // Campo tipo Fecha
                       if (Fields[c] is TDateTimeField) then
                       begin
                          // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                          if (HCalc.IsOpenOffice) then
                             HCalc.CellText[f, c + 1] := DateToStr(Fields[c].AsDateTime)
                          else
                             HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[c].AsDateTime));
                       end;

                       // Campo tipo Blob
                       // Los blobs exportan solo caracteres basicos.
                       if (Fields[c] is TBlobField) then
                       begin
                          try
                             HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(Fields[c].AsString));
                          except
                             HCalc.CellText[f, c + 1] := 'BLOB';
                          end;
                       end;

                       if (Fields[c].FieldName = 'ARTICULO') and (FieldByName('STOCK_MINIMO').AsFloat <= 0.1) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                       if (Fields[c].FieldName = 'FAMILIA') and (Fields[c].AsString = 'VAR') then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                       if (Fields[c].FieldName = 'MARGEN') and (Fields[c].AsFloat < 8) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                    end;

                    Next;
                    Application.ProcessMessages;
                 end;

                 // Agrego sumatorias
                 if (AgrupFamilia <> '') then
                 begin
                    HCalc.CellText[FilaAgrupFamilia, ColumnaFamilia + 1] := AgrupFamilia;
                    // HCalc.CellText[FilaAgrupFamilia, ColumnaNombre + 1] := Trim(AgrupNombre);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupPeso + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupImporte + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia + 1, Chr(ColumnaAgrupCoste + 65), f]);
                    HCalc.CellFormula[FilaAgrupFamilia, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupFamilia, Chr(ColumnaAgrupCoste + 65), FilaAgrupFamilia, Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente]);

                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaFamilia + 1, clYellow);
                    // HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaNombre + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUdsLogistica + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupUnidades + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupPeso + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupImporte + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupCoste + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupFamilia, ColumnaAgrupMargen + 1, clYellow);
                 end;

                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c] is TStringField) then
                    begin
                       HCalc.AutoFit(c + 1);
                       DMMain.Log(format('Autofit %d', [c + 1]));
                    end;
                 end;
              end;

              FSendCorreo.Titulo(_('Exportando Estadistica Agentes'));
              FSendCorreo.Texto('');

              DMMain.Log(_('Agentes'));
              Agente := 0;
              AgrupAgente := 0;
              FilaAgrupAgente := 0;
              // AgrupNombre := '';
              with xEstAgente do
              begin
                 Close;
                 if EstAgentes then
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
                 else
                    Params.ByName['EMPRESA'].AsInteger := 0;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
                 Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
                 Open;

                 First;
                 while not EOF do
                 begin
                    if (Agente <> FieldByName('AGENTE').AsInteger) then
                    begin
                       // Agrego sumatorias
                       if (AgrupAgente <> 0) then
                       begin
                          HCalc.SendNumber(FilaAgrupAgente, ColumnaAgente + 1, AgrupAgente);
                          // HCalc.CellText[FilaAgrupAgente, ColumnaNombre + 1] := Trim(AgrupNombre);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupPeso + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupImporte + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupCoste + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente, Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente, Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente]);

                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgente + 1, clYellow);
                          // HCalc.BackgroundColor(FilaAgrupAgente, ColumnaNombre + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUnidades + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupPeso + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupImporte + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupCoste + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupMargen + 1, clYellow);
                       end;

                       for c := 0 to FieldCount - 1 do
                       begin
                          if (Fields[c] is TStringField) then
                          begin
                             HCalc.AutoFit(c + 1);
                             // DMMain.Log(format('Autofit %d', [c + 1]));
                          end;
                       end;

                       Agente := FieldByName('AGENTE').AsInteger;
                       DMMain.Log(Format('Agente: %d', [Agente]));
                       // HCalc.AddNewSheet(Format(_('Age-%d'), [Agente]), True);
                       HCalc.AddNewSheet(Format(_('Age-%s'), [DameTituloAgente(Agente)]), True);
                       HCalc.ActivateSheetByName(Format(_('Age-%s'), [DameTituloAgente(Agente)]), True);

                       // Encabezado
                       f := 1;
                       HCalc.CellText[f, 1] := _('Fecha');
                       HCalc.CellText[f, 2] := FormatDateTime('dd/mm/yyyy hh:nn', Now);
                       HCalc.CellText[f, 3] := DameTituloAgente(Agente);
                       for c := 0 to FieldCount - 1 do
                          HCalc.BackgroundColor(f, c + 1, clSkyBlue);

                       f := 4;
                       for c := 0 to FieldCount - 1 do
                       begin
                          HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                          HCalc.BackgroundColor(f, c + 1, clSilver);

                          if (Fields[c].FieldName = 'AGENTE') then
                             ColumnaAgente := c;
                          if (Fields[c].FieldName = 'NOMBRE_R_SOCIAL') then
                             ColumnaNombre := c;
                          if (Fields[c].FieldName = 'UNIDADES_LOGISTICAS') then
                             ColumnaAgrupUdsLogistica := c;
                          if (Fields[c].FieldName = 'UNIDADES') then
                             ColumnaAgrupUnidades := c;
                          if (Fields[c].FieldName = 'PESO') then
                             ColumnaAgrupPeso := c;
                          if (Fields[c].FieldName = 'IMPORTE') then
                             ColumnaAgrupImporte := c;
                          if (Fields[c].FieldName = 'COSTE') then
                             ColumnaAgrupCoste := c;
                          if (Fields[c].FieldName = 'MARGEN') then
                             ColumnaAgrupMargen := c;

                          if (Fields[c] is TFloatField) then
                          begin
                             if (HCalc.IsOpenOffice) then
                             begin
                                if (c = ColumnaAgrupPeso) then
                                   HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0')
                                else
                                   HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                             end;
                          end;

                          if (Fields[c] is TDateTimeField) then
                             HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                       end;

                       AgrupAgente := 0;
                       FilaAgrupAgente := 0;
                       // AgrupNombre := '';
                    end;

                    if (AgrupAgente <> FieldByName('AGENTE').AsInteger) then
                    begin
                       // Agrego sumatorias
                       if (AgrupAgente <> 0) then
                       begin
                          HCalc.SendNumber(FilaAgrupAgente, ColumnaAgente + 1, AgrupAgente);
                          // HCalc.CellText[FilaAgrupAgente, ColumnaNombre + 1] := Trim(AgrupNombre);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupPeso + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupImporte + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupCoste + 65), f]);
                          HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente, Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente, Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente]);

                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgente + 1, clYellow);
                          // HCalc.BackgroundColor(FilaAgrupAgente, ColumnaNombre + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUnidades + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupPeso + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupImporte + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupCoste + 1, clYellow);
                          HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupMargen + 1, clYellow);
                       end;

                       AgrupAgente := FieldByName('AGENTE').AsInteger;
                       // AgrupNombre := FieldByName('NOMBRE_R_SOCIAL').AsString;
                       Inc(f);
                       FilaAgrupAgente := f;
                    end;

                    Inc(f);
                    // Dec(CantidadRegistros);
                    FSendCorreo.Texto(Format(_('Exportando Registro %d'), [f]));
                    for c := 0 to FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (Fields[c] is TStringField) then
                          HCalc.CellText[f, c + 1] := Trim(Fields[c].AsString);

                       // Campo tipo Float
                       if (Fields[c] is TFloatField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat);

                       // Campo tipo Integer
                       if (Fields[c] is TIntegerField) then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger);

                       // Campo tipo Fecha
                       if (Fields[c] is TDateTimeField) then
                       begin
                          // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                          if (HCalc.IsOpenOffice) then
                             HCalc.CellText[f, c + 1] := DateToStr(Fields[c].AsDateTime)
                          else
                             HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[c].AsDateTime));
                       end;

                       // Campo tipo Blob
                       // Los blobs exportan solo caracteres basicos.
                       if (Fields[c] is TBlobField) then
                       begin
                          try
                             HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(Fields[c].AsString));
                          except
                             HCalc.CellText[f, c + 1] := 'BLOB';
                          end;
                       end;

                       if (Fields[c].FieldName = 'FAMILIA') and (Fields[c].AsString = 'VAR') then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                       if (Fields[c].FieldName = 'MARGEN') and (Fields[c].AsFloat < 8) then
                          HCalc.BackgroundColor(f, c + 1, ColorResaltado);
                    end;

                    Next;
                    Application.ProcessMessages;
                 end;

                 // Agrego sumatorias
                 if (AgrupAgente <> 0) then
                 begin
                    HCalc.SendNumber(FilaAgrupAgente, ColumnaAgente + 1, AgrupAgente);
                    // HCalc.CellText[FilaAgrupAgente, ColumnaNombre + 1] := Trim(AgrupNombre);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUdsLogistica + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUdsLogistica + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupUnidades + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupUnidades + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupUnidades + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupPeso + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupPeso + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupPeso + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupImporte + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupImporte + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupCoste + 1] := format('=SUM(%s%d:%s%d)', [Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente + 1, Chr(ColumnaAgrupCoste + 65), f]);
                    HCalc.CellFormula[FilaAgrupAgente, ColumnaAgrupMargen + 1] := format('=((%s%d-%s%d)*100)/%s%d', [Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente, Chr(ColumnaAgrupCoste + 65), FilaAgrupAgente, Chr(ColumnaAgrupImporte + 65), FilaAgrupAgente]);

                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgente + 1, clYellow);
                    // HCalc.BackgroundColor(FilaAgrupAgente, ColumnaNombre + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUdsLogistica + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupUnidades + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupPeso + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupImporte + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupCoste + 1, clYellow);
                    HCalc.BackgroundColor(FilaAgrupAgente, ColumnaAgrupMargen + 1, clYellow);
                 end;

                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c] is TStringField) then
                    begin
                       HCalc.AutoFit(c + 1);
                       DMMain.Log(format('Autofit %d', [c + 1]));
                    end;
                 end;
              end;

              FSendCorreo.Texto(_('Guardando fichero'));
              Application.ProcessMessages;
              HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));

              FSendCorreo.Texto(_('Exportacion finalizada'));
              FSendCorreo.BitBtnOk.Visible := True;
           finally
              FreeAndNil(FSendCorreo);
           end;
        finally
           Sleep(1000);
           Application.ProcessMessages;
           HCalc.Free;
        end;
     end;
  end;
end;

procedure TDMEstadisticaTubosParis.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FechaDesde' then
     ParValue := FechaDesde;

  if ParName = 'FechaHasta' then
     ParValue := FechaHasta;
end;

procedure TDMEstadisticaTubosParis.frListadoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMEstadisticaTubosParis.frxListadoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMEstadisticaTubosParis.frxListadoGetValue(const VarName: string; var Value: variant);
begin
  frListadoGetValue(VarName, Value);
end;

procedure TDMEstadisticaTubosParis.xEstFamAgeCliArtAfterOpen(DataSet: TDataSet);
begin
  xTotEstAgeCliArtFam.Open;
end;

procedure TDMEstadisticaTubosParis.xEstFamAgeCliArtBeforeClose(DataSet: TDataSet);
begin
  xTotEstAgeCliArtFam.Close;
end;

procedure TDMEstadisticaTubosParis.xEstAgeCliAfterOpen(DataSet: TDataSet);
begin
  xTotEstAgeCli.Open;
end;

procedure TDMEstadisticaTubosParis.xEstAgeCliBeforeClose(DataSet: TDataSet);
begin
  xTotEstAgeCli.Close;
end;

procedure TDMEstadisticaTubosParis.xEstCliAfterOpen(DataSet: TDataSet);
begin
  xTotEstCli.Open;
end;

procedure TDMEstadisticaTubosParis.xEstCliBeforeClose(DataSet: TDataSet);
begin
  xTotEstCli.Close;
end;

procedure TDMEstadisticaTubosParis.xEstFamAgeCliArtAfterScroll(DataSet: TDataSet);
begin
  if (xEstFamAgeCliArt.FieldByName('FAMILIA').AsString <> xEstAgeCliArtFam_ID) then
  begin
     xEstAgeCliArtFam_ID := xEstFamAgeCliArt.FieldByName('FAMILIA').AsString;

     with xTotEstAgeCliArtFam do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        Params.ByName['FAMILIA'].AsString := xEstFamAgeCliArt.FieldByName('FAMILIA').AsString;
        Open;
     end;
  end;
end;

procedure TDMEstadisticaTubosParis.xEstAgeCliAfterScroll(DataSet: TDataSet);
begin
  if (xEstAgeCli.FieldByName('AGENTE').AsString <> xEstAgeCli_ID) then
  begin
     xEstAgeCli_ID := xEstAgeCli.FieldByName('AGENTE').AsString;

     with xTotEstAgeCli do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        Params.ByName['AGENTE'].AsInteger := xEstAgeCli.FieldByName('AGENTE').AsInteger;
     end;
  end;
end;

procedure TDMEstadisticaTubosParis.xEstAgeCliFamAfterOpen(DataSet: TDataSet);
begin
  xTotEstAgeCliFam.Open;
end;

procedure TDMEstadisticaTubosParis.xEstAgeCliFamBeforeClose(DataSet: TDataSet);
begin
  xTotEstAgeCliFam.Close;
end;

procedure TDMEstadisticaTubosParis.xEstAgeCliFamAfterScroll(DataSet: TDataSet);
begin
  if (xEstAgeCliFam.FieldByName('AGENTE').AsString + xEstAgeCliFam.FieldByName('CLIENTE').AsString <> xEstAgeCliFam_ID) then
  begin
     xEstAgeCliFam_ID := xEstAgeCliFam.FieldByName('AGENTE').AsString + xEstAgeCliFam.FieldByName('CLIENTE').AsString;

     with xTotEstAgeCliFam do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        Params.ByName['AGENTE'].AsInteger := xEstAgeCliFam.FieldByName('AGENTE').AsInteger;
        Params.ByName['CLIENTE'].AsInteger := xEstAgeCliFam.FieldByName('CLIENTE').AsInteger;
        // Params.ByName['FAMILIA'].AsInteger := xEstAgeCliFam.FieldByName('FAMILIA').AsInteger;
     end;
  end;
end;

procedure TDMEstadisticaTubosParis.xEstAgenteAfterOpen(DataSet: TDataSet);
begin
  xTotEstAgente.Open;
end;

procedure TDMEstadisticaTubosParis.xEstAgenteBeforeClose(DataSet: TDataSet);
begin
  xTotEstAgente.Close;
end;

procedure TDMEstadisticaTubosParis.xEstAgenteAfterScroll(DataSet: TDataSet);
begin
  if (xEstAgente.FieldByName('AGENTE').AsString <> xEstAgente_ID) then
  begin
     xEstAgente_ID := xEstAgente.FieldByName('AGENTE').AsString;

     with xTotEstAgente do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        Params.ByName['AGENTE'].AsInteger := xEstAgente.FieldByName('AGENTE').AsInteger;
     end;
  end;
end;

end.
