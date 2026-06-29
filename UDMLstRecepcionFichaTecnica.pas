unit UDMLstRecepcionFichaTecnica;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FR_DSet, FR_DBSet, frxClass, frxDBSet,
  frxHYReport, FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados,
  FIBDataSetRO, UFormGest, UHYReport, UHYReportMail;

type
  TDMLstRecepcionFichaTecnica = class(TDataModule)
     xRecepcion: TFIBDataSetRO;
     TLocal: THYTransaction;
     frLstRecepcion: TfrHYReport;
     frxLstRecepcion: TfrxHYReport;
     frxDBxRecepcion: TfrxDBDataset;
     frDBxRecepcion: TfrDBDataSet;
     DSxRecepcion: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     frDBxCliente: TfrDBDataSet;
     frxDBxCliente: TfrxDBDataset;
     xFichaTecnica: TFIBDataSetRO;
     DSxFichaTecnica: TDataSource;
     frDBxFichaTecnica: TfrDBDataSet;
     frxDBxFichaTecnica: TfrxDBDataset;
     xCabReparacion: TFIBDataSetRO;
     DSxCabReparacion: TDataSource;
     frDBxCabReparacion: TfrDBDataSet;
     frxDBxCabReparacion: TfrxDBDataset;
     HYReportMail: THYReportMail;
     HYReport: THYReport;
     xDocOrigen: TFIBDataSetRO;
     DSxDocOrigen: TDataSource;
     frDBxDocOrigen: TfrDBDataSet;
     frxDBxDocOrigen: TfrxDBDataset;
     xPreITV: TFIBDataSetRO;
     DSxPreITV: TDataSource;
     xPreITVVerificacion: TFIBDataSetRO;
     DSPreITVVerificacion: TDataSource;
     frDBxPreITV: TfrDBDataSet;
     frxDBxDBPreITV: TfrxDBDataset;
     frDBxPreITVVerificacion: TfrDBDataSet;
     frxDBxPreITVVerificacion: TfrxDBDataset;
     procedure DataModuleCreate(Sender: TObject);
     procedure xRecepcionAfterOpen(DataSet: TDataSet);
     procedure xRecepcionBeforeClose(DataSet: TDataSet);
     procedure frLstRecepcionGetValue(const ParName: string; var ParValue: variant);
     procedure frLstRecepcionBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxLstRecepcionBeforePrint(Sender: TfrxReportComponent);
     procedure xCabReparacionAfterOpen(DataSet: TDataSet);
     procedure xCabReparacionBeforeClose(DataSet: TDataSet);
     procedure xPreITVAfterOpen(DataSet: TDataSet);
     procedure xPreITVBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     nombreFich, rutaFich: string;
     procedure MostrarListado(IdRepRecepcion: integer);
     procedure MostrarListadoMail(IdRepRecepcion: integer; Modo: integer; var Memo: TStrings);
     procedure MostrarListadoPreITV(IdInspeccion, IdRepRecepcion: integer);
     procedure DameDatosClienteTercero(Cliente: integer; var Mail: string);
  end;

var
  DMLstRecepcionFichaTecnica : TDMLstRecepcionFichaTecnica;

implementation

uses
  UDMMain, UDMListados, UEntorno, ExtCtrls, UUtiles, Dialogs, HYFIBQuery, UImagenes;

{$R *.dfm}

procedure TDMLstRecepcionFichaTecnica.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLstRecepcionFichaTecnica.MostrarListado(IdRepRecepcion: integer);
begin
  with xRecepcion do
  begin
     Close;
     Params.ByName['ID_REP_RECEPCION'].AsInteger := IdRepRecepcion;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(656, 0, 0, '', _('Listado de recepcion de reparaciones'), frLstRecepcion, frxLstRecepcion, nil, nil);
  CierraData(DMListados);
end;

procedure TDMLstRecepcionFichaTecnica.MostrarListadoPreITV(IdInspeccion, IdRepRecepcion: integer);
begin
  with xPreITV do
  begin
     Close;
     DataSource := nil;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PRE_ITV_INSPECCION ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_INSPECCION = :ID_INSPECCION ');

     Params.ByName['ID_INSPECCION'].AsInteger := IdInspeccion;
     Open;
  end;

  with xFichaTecnica do
  begin
     Close;
     DataSource := DSxPreITV;
     Open;
  end;

  if (IdRepRecepcion <> 0) then
  begin
     with xRecepcion do
     begin
        Close;
        Params.ByName['ID_REP_RECEPCION'].AsInteger := IdRepRecepcion;
        Open;
     end;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(658, 0, 0, '', _('Listado Pre-ITV'), frLstRecepcion, frxLstRecepcion, nil, nil);
  CierraData(DMListados);
end;

procedure TDMLstRecepcionFichaTecnica.xRecepcionAfterOpen(DataSet: TDataSet);
begin
  with xCliente do
  begin
     Close;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  xFichaTecnica.Open;
  xCabReparacion.Open;
  xPreITV.Open;
end;

procedure TDMLstRecepcionFichaTecnica.xRecepcionBeforeClose(DataSet: TDataSet);
begin
  xCliente.Close;
  xFichaTecnica.Close;
  xCabReparacion.Close;
  xPreITV.Close;
end;

procedure TDMLstRecepcionFichaTecnica.frLstRecepcionGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstRecepcionFichaTecnica.frLstRecepcionBeforePrint(Memo: TStringList; View: TfrView);
var
  s : string;
  i : integer;
  Imagen : TImage;
begin
  DMListados.BeforePrint(Memo, View);

  s := Trim(Memo[0]);
  if (s = '[Firma]') and (View is TfrPictureView) then
  begin
     Imagen := TImage.Create(nil);
     try
        RefrescarImagenFirma(Imagen, xRecepcion.FieldByName('ID_FIRMA').AsInteger);
        TfrPictureView(View).Picture.Assign(Imagen.Picture);
     finally
        Imagen.Free;
     end;
  end
  else
  if (Copy(s, 1, 14) = '[ImagenGaleria') then
  begin
     // Se espera que el Tag tenga la forma "[ImagenGaleria1]", "[ImagenGaleria2]", "[ImagenGaleriaNN]".

     // Quito corchetes
     s := Copy(s, 2, Length(s) - 2);

     i := StrToIntDef(Copy(s, 13, 2), -1) - 1;
     if (i >= 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT FIRST 1 SKIP ' + IntToStr(i) + ' ID_IMAGEN ');
              SQL.Add(' FROM SYS_GALERIA_IMAGEN ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_GALERIA = :ID_GALERIA ');
              SQL.Add(' ORDER BY ORDEN ');
              Params.ByName['ID_GALERIA'].AsInteger := xRecepcion.FieldByName('ID_GALERIA_RECEPCION').AsInteger;
              ExecQuery;
              Imagen := TImage.Create(nil);
              try
                 Imagen.Transparent := True;
                 RefrescarImagenFirma(Imagen, FieldByName['ID_IMAGEN'].AsInteger);
                 TfrPictureView(View).Picture.Assign(Imagen.Picture);
              finally
                 Imagen.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMLstRecepcionFichaTecnica.frxLstRecepcionBeforePrint(Sender: TfrxReportComponent);
var
  s : string;
  i : integer;
  Imagen : TImage;
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxPictureView) then
  begin
     s := Trim(TfrxPictureView(Sender).TagStr);
     if (s = 'Firma') then
     begin
        Imagen := TImage.Create(nil);
        try
           Imagen.Transparent := True;
           RefrescarImagenFirma(Imagen, xRecepcion.FieldByName('ID_FIRMA').AsInteger);
           TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end
     else
     if (Copy(s, 1, 13) = 'ImagenGaleria') then
     begin
        // Se espera que el Tag tenga la forma "ImagenGaleria1", "ImagenGaleria2", "ImagenGaleriaNN".

        i := StrToIntDef(Copy(s, 14, 2), -1) - 1;
        if (i >= 0) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT FIRST 1 SKIP ' + IntToStr(i) + ' ID_IMAGEN ');
                 SQL.Add(' FROM SYS_GALERIA_IMAGEN ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_GALERIA = :ID_GALERIA ');
                 SQL.Add(' ORDER BY ORDEN ');
                 Params.ByName['ID_GALERIA'].AsInteger := xRecepcion.FieldByName('ID_GALERIA_RECEPCION').AsInteger;
                 ExecQuery;
                 Imagen := TImage.Create(nil);
                 try
                    Imagen.Transparent := True;
                    RefrescarImagen(Imagen, FieldByName['ID_IMAGEN'].AsInteger);
                    TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
                 finally
                    Imagen.Free;
                 end;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  end;
end;

procedure TDMLstRecepcionFichaTecnica.MostrarListadoMail(IdRepRecepcion: integer; Modo: integer; var Memo: TStrings);
var
  str : string;
  //Grupo : integer;
  //Listado : smallint;
begin
  //Listado := 0;

  with xRecepcion do
  begin
     Close;
     Params.ByName['ID_REP_RECEPCION'].AsInteger := IdRepRecepcion;
     Open;
  end;

  nombreFich := _('RecepcionFichaTecnica') + '_' + xRecepcion.FieldByName('ID_REP_RECEPCION').AsString + '_Vehiculo_' + xRecepcion.FieldByName('TITULO_VEHICULO').AsString;

  DMListados.CargarMail(656, '');

  if (Modo <> 2) then
  begin
     if (REntorno.TipoListado = 'HYM') then
     begin
        HYReportMail.LoadFromFIB(REntorno.Formato, str);
        HYReportMail.Prepare;
        case Modo of
           0: HYReportMail.Preview;
           1: HYReportMail.PrintinMemo(Memo);
        end;
     end
     else if (REntorno.TipoListado = 'FR3') then
     begin
        frxLstRecepcion.LoadFromFIB(REntorno.Formato, str);
        if (frxLstRecepcion.DotMatrixReport) then
        begin
           frxLstRecepcion.PrepareReport;
           frxLstRecepcion.PreviewOptions.Zoom := 0.85;
           case Modo of
              0: frxLstRecepcion.ShowPreparedReport;
              1: frxLstRecepcion.PrintInMemo(Memo);
           end;
           frxLstRecepcion.PreviewOptions.Zoom := 1;
        end;
     end;
  end
  else
  begin
     if (REntorno.TipoListado = 'FRF') then
     begin
        with frLstRecepcion do
        begin
           LoadFromFIB(REntorno.Formato, str);
           PrepareReport;
           rutaFich := ExportarPDF(frLstRecepcion, nombreFich);
        end;
     end
     else
     if (REntorno.TipoListado = 'FR3') then
     begin
        with frxLstRecepcion do
        begin
           LoadFromFIB(REntorno.Formato, str);
           PrepareReport;
           rutaFich := ExportarPDF(frxLstRecepcion, nombreFich);
        end;
     end
     else
     begin
        MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
           'El listado debe ser del tipo FRF/FR3.'), mtWarning, [mbOK], 0);
        raise Exception.Create('');
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstRecepcionFichaTecnica.DameDatosClienteTercero(Cliente: integer; var Mail: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ST.EMAIL FROM EMP_CLIENTES EC JOIN SYS_TERCEROS ST ON EC.TERCERO = ST.TERCERO WHERE EC.EMPRESA = :EMPRESA AND EC.CLIENTE = :CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Mail := FieldByName['EMAIL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstRecepcionFichaTecnica.xCabReparacionAfterOpen(DataSet: TDataSet);
begin
  xDocOrigen.Open;
end;

procedure TDMLstRecepcionFichaTecnica.xCabReparacionBeforeClose(DataSet: TDataSet);
begin
  xDocOrigen.Close;
end;

procedure TDMLstRecepcionFichaTecnica.xPreITVAfterOpen(DataSet: TDataSet);
begin
  xPreITVVerificacion.Open;
end;

procedure TDMLstRecepcionFichaTecnica.xPreITVBeforeClose(DataSet: TDataSet);
begin
  xPreITVVerificacion.Close;
end;

end.
