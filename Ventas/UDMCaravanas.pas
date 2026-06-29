unit UDMCaravanas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, UHYReportMail, UHYReport, UFormGest, FIBDataSetRO,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, HYFIBQuery;

type
  TDMCaravanas = class(TDataModule)
     TLocal: THYTransaction;
     xCaravana: TFIBTableSet;
     DSxCaravana: TDataSource;
     xCaravanaID: TIntegerField;
     xCaravanaPEDIDO: TFIBStringField;
     xCaravanaCLIENTE: TIntegerField;
     xCaravanaFECHA_ENVIO_PED: TDateTimeField;
     xCaravanaFECHA_RECEPCION: TDateTimeField;
     xCaravanaMODELO: TFIBStringField;
     xCaravanaANO: TIntegerField;
     xCaravanaPEDIDO_HOBBY: TFIBStringField;
     xCaravanaORDEN_CONF: TFIBStringField;
     xCaravanaFECHA_PREV_ENTREGA: TDateTimeField;
     xCaravanaFECHA_ENTREGA: TDateTimeField;
     xCaravanaBASTIDOR: TFIBStringField;
     xCaravanaACCESORIOS: TBlobField;
     xCaravanaFACTURA: TFIBStringField;
     xCaravanaIMPORTE: TFloatField;
     xCaravanaPLAN_PAGO: TFIBStringField;
     HYReportMail: THYReportMail;
     xLstCaravana: TFIBTableSet;
     xLstCliente: TFIBDataSetRO;
     xLstTercero: TFIBDataSetRO;
     xLstArticulo: TFIBDataSetRO;
     HYRMxLstCaravana: THYReportMailSource;
     HYRMxLstCliente: THYReportMailSource;
     HYRMxLstTercero: THYReportMailSource;
     HYRMxLstArticulo: THYReportMailSource;
     frDBxLstCaravana: TfrDBDataSet;
     frDBxLstCliente: TfrDBDataSet;
     frDBxLstTercero: TfrDBDataSet;
     frDBxLstArticulo: TfrDBDataSet;
     frCaravana: TfrHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure xCaravanaNewRecord(DataSet: TDataSet);
     procedure xLstCaravanaAfterOpen(DataSet: TDataSet);
     procedure xLstClienteAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure EnviarMail;
     procedure Imprimir;
  end;

var
  DMCaravanas : TDMCaravanas;

implementation

uses UDMMain, UEntorno, UDMListados, UFSendCorreo;

{$R *.dfm}

procedure TDMCaravanas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  xCaravanaIMPORTE.DisplayFormat := MascaraN;

  xCaravana.Open;
end;

procedure TDMCaravanas.xCaravanaNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT MAX(ID) FROM HOB_CARAVANAS';
     ExecQuery;
     xCaravanaID.AsInteger := FieldByName['MAX'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  xCaravanaFECHA_ENVIO_PED.AsDateTime := Now;
  xCaravanaFECHA_RECEPCION.AsDateTime := Now;
  xCaravanaFECHA_PREV_ENTREGA.AsDateTime := Now;
  xCaravanaFECHA_ENTREGA.AsDateTime := Now;
  xCaravanaANO.AsInteger := REntorno.Ejercicio;
  xCaravanaIMPORTE.AsFloat := 0;
  xCaravanaPLAN_PAGO.AsString := '1';
end;

procedure TDMCaravanas.EnviarMail;
var
  Memo : TStrings;
  Subject, serie, str : string;
  DMListadosCargado : boolean;
begin
  // Esto es porque el assigned no va
  DMListadosCargado := False;
  serie := '';

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando el pedido por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           with xLstCaravana do
           begin
              Close;
              Params.ByName['ID'].AsInteger := xCaravanaID.AsInteger;
              Open;
           end;
           AbreData(TDMListados, DMListados);
           DMListadosCargado := True;
           Memo := TStringList.Create;
           DMListados.CargarMail(2002, serie);
           if (REntorno.TipoListado = 'HYM') then
           begin
              // Pagina := 0;
              HYReportMail.LoadFromFIB(REntorno.Formato, str);
              HYReportMail.Prepare;
              HYReportMail.Preview;
              HYReportMail.PrintinMemo(Memo);
              DMListados.LimpiaEntorno;
           end;
           CierraData(DMListados);
           DMListadosCargado := False;

           AbreData(TDMListados, DMListados);
           DMListadosCargado := True;
           with xLstCaravana do
           begin
              Close;
              Params.ByName['ID'].AsInteger := xCaravanaID.AsInteger;
              Open;
           end;
           {Crear el Subject}
           Subject := _('Confirmación de Pedido');
           FSendCorreo.Texto(_('Enviando Mensaje  ...'));
           // Application.ProcessMessages;
           DMListados.SendMailCliente(DMCaravanas.xLstCaravana.FieldByName('CLIENTE').AsInteger, Memo, Subject);
           Memo.Free;
           CierraData(DMListados);
           DMListadosCargado := False;
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
        end;
     except
        begin
           // Application.ProcessMessages;
           FSendCorreo.Texto(_('ERROR!! Error en el envío.'));

           // Liberamos objetos creados
           if DMListadosCargado then
              CierraData(DMListados);
        end;
     end;

     FSendCorreo.BitBtnOk.Visible := True;
     FSendCorreo.Visible := False;
     FSendCorreo.SePuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TDMCaravanas.Imprimir;
var
  serie, str : string;
begin
  with xLstCaravana do
  begin
     Close;
     Params.ByName['ID'].AsInteger := xCaravanaID.AsInteger;
     Open;
  end;
  AbreData(TDMListados, DMListados);

  DMListados.Cargar(2003, serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     // Pagina := 0;
     frCaravana.LoadFromFIB(REntorno.Formato, str);
     frCaravana.PrepareReport;
     frCaravana.ShowPreparedReport;
     {frCaravana.PrintPreparedReport(' ', REntorno.Copias);}
     DMListados.LimpiaEntorno;
  end;
  CierraData(DMListados);
end;

procedure TDMCaravanas.xLstCaravanaAfterOpen(DataSet: TDataSet);
begin
  with xLstCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := xLstCaravana.FieldByName('ANO').AsInteger;
     Params.ByName['CLIENTE'].AsInteger := xLstCaravana.FieldByName('CLIENTE').AsInteger;
     Open;
  end;
  with xLstArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := xLstCaravana.FieldByName('ANO').AsInteger;
     Params.ByName['ARTICULO'].AsString := xLstCaravana.FieldByName('MODELO').AsString;
     Open;
  end;
end;

procedure TDMCaravanas.xLstClienteAfterOpen(DataSet: TDataSet);
begin
  with xLstTercero do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := xLstCliente.FieldByName('TERCERO').AsInteger;
     Open;
  end;
end;

end.
