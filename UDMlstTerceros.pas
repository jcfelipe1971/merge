unit UDMLstTerceros;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, FR_DSet, FR_DBSet, FIBDataSet, FIBTableDataSet, FR_Class,
  Fr_HYReport, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, frxDBSet;

type
  TDMLstTerceros = class(TDataModule)
     frTerceros: TfrHYReport;
     QMTerceros: TFIBDataSetRO;
     DSQMTerceros: TDataSource;
     frDSQMTerceros: TfrDBDataSet;
     frDSQMJustifica: TfrDBDataSet;
     DSQMJustifica: TDataSource;
     QMJustifica: TFIBDataSetRO;
     QMFormasdePago: TFIBDataSetRO;
     DSFormasdePago: TDataSource;
     frDSQMFormasdePago: TfrDBDataSet;
     frDSQMIvaModos: TfrDBDataSet;
     DSIvaModos: TDataSource;
     QMIvaModos: TFIBDataSetRO;
     QMIRPF: TFIBDataSetRO;
     DSIRPF: TDataSource;
     frDSQMIRPF: TfrDBDataSet;
     frDSQMTipoTerceros: TfrDBDataSet;
     DSTipoTerceros: TDataSource;
     QMTipoTercero: TFIBDataSetRO;
     TLocal: THYTransaction;
     frxTerceros: TfrxHYReport;
     QMBanco: TFIBDataSetRO;
     DSQMBanco: TDataSource;
     frDSQMBanco: TfrDBDataSet;
     QMEntidad: TFIBDataSetRO;
     DSQMEntidad: TDataSource;
     frDSQMEntidad: TfrDBDataSet;
     xLstFirmas: TFIBDataSetRO;
     DSxLstFirmas: TDataSource;
     frDBDLstFirmas: TfrDBDataSet;
     frxDBxLstFirmas: TfrxDBDataset;
     xEmpresa: TFIBDataSetRO;
     QMContacto: TFIBDataSetRO;
     DSQMContacto: TDataSource;
     frDBDSQMContacto: TfrDBDataSet;
     QMUsuarioWeb: TFIBDataSetRO;
     DSQMUsuarioWeb: TDataSource;
     frDBDSQMUsuarioWeb: TfrDBDataSet;
     frDBxDirContacto: TfrDBDataSet;
     DSxDirContacto: TDataSource;
     xDirContacto: TFIBDataSetRO;
     procedure frTercerosGetValue(const ParName: string; var ParValue: variant);
     procedure frTercerosEnterRect(Memo: TStringList; View: TfrView);
     procedure DMlstTercerosDestroy(Sender: TObject);
     procedure DMlstTercerosCreate(Sender: TObject);
     procedure frxTercerosBeforePrint(Sender: TfrxReportComponent);
     procedure frxTercerosGetValue(const VarName: string; var Value: variant);
     procedure QMTercerosBeforeClose(DataSet: TDataSet);
     procedure QMTercerosAfterOpen(DataSet: TDataSet);
     procedure QMBancoAfterOpen(DataSet: TDataSet);
     procedure QMBancoBeforeClose(DataSet: TDataSet);
     procedure QMContactoBeforeClose(DataSet: TDataSet);
     procedure QMContactoAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraTerceros(SQL: TStrings);
     procedure MostrarListadoFiltrado(Modo: byte);
     procedure MuestraCartaSEPA(Modo: byte; Tercero, Banco: integer; Archivo: string = '');
     procedure MuestraCartaSpeedlock(Modo: byte; Tercero, Contacto: integer; Archivo: string = '');
     procedure MuestraCartaLOPD(Modo: byte; TipoFirma: string; Tercero, IdDocFirma: integer; Archivo: string = '');
  end;

var
  DMLstTerceros : TDMLstTerceros;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, ExtCtrls, UUtiles, UImagenes;

{$R *.DFM}

procedure TDMLstTerceros.DMlstTercerosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  DMMain.FiltraRO(QMFormasdePago, '11100', True);
end;

procedure TDMLstTerceros.DMlstTercerosDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstTerceros.MostrarListadoFiltrado(modo: byte);
begin
  QMTerceros.Close;
  QMTerceros.Open;

  DMListados.Imprimir(5, 0, Modo, '', '', frTerceros, frxTerceros, nil);
end;

procedure TDMLstTerceros.frTercerosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstTerceros.frTercerosEnterRect(Memo: TStringList; View: TfrView);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[TextoCartaLOPD]') then
     begin
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add('SELECT TEXTO_LOPD FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Open;
                 Memo.Text := FieldByName('TEXTO_LOPD').AsString;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
     end;

     if (Memo[0] = '[ImgTercero]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(QMTerceros.FieldByName('IMAGEN').AsInteger, View);

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     s := Trim(Memo[0]);
     if ((Pos('[Firma-', s) > 0) and (View is TfrPictureView)) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 8, Length(s) - Pos(']', s) + 1);
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrPictureView(View).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;
  end;
end;

procedure TDMLstTerceros.frxTercerosBeforePrint(Sender: TfrxReportComponent);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
  begin
     with TfrxCustomMemoView(Sender) do
     begin
        if (Pos('[TextoCartaLOPD]', Memo[0]) > 0) then
        begin
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 Transaction := DameTransactionRO(DMMain.DataBase);
                 try
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;
                    SelectSQL.Add('SELECT TEXTO_LOPD FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Open;
                    Memo.Text := FieldByName('TEXTO_LOPD').AsString;
                    Close;
                    Transaction.Commit;
                 finally
                    Transaction.Free;
                 end;
              finally
                 Free;
              end;
           end;
        end;
     end;
  end;

  // Tratamiento de las Imagenes
  if (Sender is TfrxPictureView) then
  begin
     if (TfrxPictureView(Sender).TagStr = '[ImgTercero]') then
     begin
        if (QMTerceros.FieldByName('IMAGEN').AsInteger <> 0) then
        begin
           DMListados.MostrarImagen(QMTerceros.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
           TfrxPictureView(Sender).Visible := True;
        end
        else
           TfrxPictureView(Sender).Visible := False;
     end;

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     if (Pos('Firma-', s) > 0) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 7, Length(s));
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              Imagen.Transparent := True;
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;
  end;
end;

procedure TDMLstTerceros.frxTercerosGetValue(const VarName: string; var Value: variant);
begin
  frTercerosGetValue(VarName, Value);
end;

procedure TDMLstTerceros.FiltraTerceros(SQL: TStrings);
begin
  QMTerceros.Close;
  QMTerceros.SelectSQL.Assign(SQL);
end;

procedure TDMLstTerceros.MuestraCartaSEPA(Modo: byte; Tercero, Banco: integer; Archivo: string = '');
begin
  with QMBanco do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Params.ByName['BANCO'].AsInteger := Banco;
     Open;
  end;

  // Hago que el tercero dependa del banco.
  with QMTerceros do
  begin
     Close;
     DataSource := DSQMBanco;
     SelectSQL.Text := 'SELECT * FROM VER_TERCEROS_EDICION WHERE TERCERO = ?TERCERO';
     Open;
  end;

  DMListados.Imprimir(2009, 0, Modo, '', '', frTerceros, frxTerceros, nil, Archivo);
end;

procedure TDMLstTerceros.MuestraCartaSpeedlock(Modo: byte; Tercero, Contacto: integer; Archivo: string = '');
begin
  with QMContacto do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Params.ByName['CONTACTO'].AsInteger := Contacto;
     Open;
  end;

  // Hago que el tercero dependa del contacto.
  with QMTerceros do
  begin
     Close;
     DataSource := DSQMContacto;
     SelectSQL.Text := 'SELECT * FROM VER_TERCEROS_EDICION WHERE TERCERO = ?TERCERO';
     Open;
  end;

  DMListados.Imprimir(649, 0, Modo, '', '', frTerceros, frxTerceros, nil, Archivo);
end;

procedure TDMLstTerceros.MuestraCartaLOPD(Modo: byte; TipoFirma: string; Tercero, IdDocFirma: integer; Archivo: string = '');
var
  Grupo : integer;
begin
  Grupo := 2014;
  if (TipoFirma <> 'LOP') then
  begin
     Tercero := 0;
     Grupo := 2017;
  end;

  with QMTerceros do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_TERCEROS_EDICION WHERE TERCERO = ?TERCERO';
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;

  with xLstFirmas do
  begin
     Close;
     Params.ByName['TIPO'].AsString := TipoFirma;
     Params.ByName['TERCERO'].AsInteger := IdDocFirma;
     Open;
  end;

  with xEmpresa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frTerceros, frxTerceros, nil, Archivo);
end;

procedure TDMLstTerceros.QMTercerosBeforeClose(DataSet: TDataSet);
begin
  QMJustifica.Close;
end;

procedure TDMLstTerceros.QMTercerosAfterOpen(DataSet: TDataSet);
begin
  QMJustifica.Open;
end;

procedure TDMLstTerceros.QMBancoAfterOpen(DataSet: TDataSet);
begin
  QMEntidad.Open;
end;

procedure TDMLstTerceros.QMBancoBeforeClose(DataSet: TDataSet);
begin
  QMEntidad.Close;
end;

procedure TDMLstTerceros.QMContactoBeforeClose(DataSet: TDataSet);
begin
  QMUsuarioWeb.Close;
  xDirContacto.Close;
end;

procedure TDMLstTerceros.QMContactoAfterOpen(DataSet: TDataSet);
begin
  QMUsuarioWeb.Open;
  xDirContacto.Open;
end;

end.
