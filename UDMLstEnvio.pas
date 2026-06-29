unit UDMLstEnvio;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FR_DSet, FR_DBSet, FIBDatabase,
  UFIBModificados, FR_Class, Fr_HYReport, FIBDataSet, FIBTableDataSet,
  Forms, HYFIBQuery, FIBQuery;

type
  TDMLstEnvio = class(TDataModule)
     frEnvio: TfrHYReport;
     TLocal: THYTransaction;
     frDBQMCabecera: TfrDBDataSet;
     DSQMCabecera: TDataSource;
     QMCabecera: TFIBDataSetRO;
     DSxRuta: TDataSource;
     xRuta: TFIBDataSetRO;
     DSxArticUnid: TDataSource;
     xArticUnid: TFIBDataSetRO;
     DSxNumFac: TDataSource;
     xNumFac: TFIBDataSetRO;
     DSxNumAlb: TDataSource;
     xNumAlb: TFIBDataSetRO;
     DSxTotalFac: TDataSource;
     xTotalFac: TFIBDataSetRO;
     DSxTotalAlb: TDataSource;
     xTotalAlb: TFIBDataSetRO;
     QMEnvio: TFIBDataSetRO;
     DSQMEnvio: TDataSource;
     frDBQMEnvio: TfrDBDataSet;
     frDBxArticUnid: TfrDBDataSet;
     QNumPep: THYFIBQuery;
     xDirecciones: TFIBDataSetRO;
     DSxDirecciones: TDataSource;
     frDBDirecciones: TfrDBDataSet;
     frPeticion: TfrHYReport;
     xLstPeticionCab: TFIBDataSetRO;
     xLstPeticionDet: TFIBDataSetRO;
     DSxLstPeticionDet: TDataSource;
     DSxLstPeticionCab: TDataSource;
     frDBDSPeticionDet: TfrDBDataSet;
     frDBDSPeticionCab: TfrDBDataSet;
     frContenido: TfrHYReport;
     xLstContenido: TFIBDataSetRO;
     DSxLstContenido: TDataSource;
     frDBDSContenido: TfrDBDataSet;
     xLstContenidoCab: TFIBDataSetRO;
     xLstContenidoEMPRESA: TIntegerField;
     xLstContenidoRIG: TIntegerField;
     xLstContenidoCLIENTE: TIntegerField;
     xLstContenidoTERCERO: TIntegerField;
     xLstContenidoDIRECCION: TIntegerField;
     xLstContenidoNOMBRE_R_SOCIAL: TFIBStringField;
     xLstContenidoNOMBRE_COMERCIAL: TFIBStringField;
     xLstContenidoDIR_COMPLETA: TFIBStringField;
     xLstContenidoDIR_NOMBRE_2: TFIBStringField;
     xLstContenidoDIR_NOMBRE_3: TFIBStringField;
     xLstContenidoDIR_TELEFONO01: TFIBStringField;
     xLstContenidoCODIGO_POSTAL: TFIBStringField;
     xLstContenidoTIT_LOCALIDAD: TFIBStringField;
     xLstContenidoTIT_PROVINCIA: TFIBStringField;
     xLstContenidoPAIS: TFIBStringField;
     xLstContenidoPESO: TFloatField;
     xLstContenidoBULTOS: TFloatField;
     xLstContenidoLINEA: TIntegerField;
     xLstContenidoARTICULO: TFIBStringField;
     xLstContenidoTITULO: TFIBStringField;
     xLstContenidoALMACEN: TFIBStringField;
     xLstContenidoCANAL: TIntegerField;
     xLstContenidoUD: TFloatField;
     xLstContenidoUE_UD: TFloatField;
     xLstContenidoUE: TFloatField;
     xLstContenidostock_ue: TFloatField;
     xLstContenidostock_ud: TFloatField;
     DSxTransportista: TDataSource;
     xTransportista: TFIBDataSetRO;
     DSxCartaPorte: TDataSource;
     xCartaPorte: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frEnvioGetValue(const ParName: string; var ParValue: variant);
     procedure frEnvioEnterRect(Memo: TStringList; View: TfrView);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMEnvioAfterOpen(DataSet: TDataSet);
     procedure xLstContenidostock_ueGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xLstContenidostock_udGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMEnvioBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
     total_alb, total_fac: integer;
  public
     { Public declarations }
     procedure MostrarListadoFiltrado(Envio, Modo, Empresa, TipoLst: integer);
     procedure ListadoPeticion(Modo, Empresa, Envio: integer);
     procedure ListadoContenido(Modo, Empresa, Envio: integer);
  end;

var
  DMLstEnvio : TDMLstEnvio;

implementation

uses UDMMain, UEntorno, UUtiles, UDMListados, UFormGest;

{$R *.dfm}

procedure TDMLstEnvio.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstEnvio.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstEnvio.MostrarListadoFiltrado(Envio, Modo, Empresa, TipoLst: integer);
var
  Titulo : string;
  Grupo : integer;
begin
  with QMCabecera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ENVIO'].AsInteger := Envio;
     Open;
  end;

  Grupo := 0;
  if (TipoLst = 1) then
  begin
     Grupo := 512;
     Titulo := _('Listado Envio');
  end
  else
  if (TipoLst = 2) then
  begin
     Grupo := 8206;
     Titulo := _('Listado Envio Cliente');
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', Titulo, frEnvio, nil, nil, nil);
end;

procedure TDMLstEnvio.frEnvioGetValue(const ParName: string; var ParValue: variant);
var
  serierig_alb, serierig_fac, serierig_pep_sfg : string;
  auxalb, auxfac, auxpep_sfg : integer;
begin
  serierig_alb := '';
  serierig_fac := '';
  serierig_pep_sfg := '';
  auxalb := 0;
  auxfac := 0;
  auxpep_sfg := 0;

  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'serierig_pep_sfg') then //sfg.albert
  begin
     xNumAlb.Close;
     xNumAlb.Open;
     xNumAlb.First;

     while not xNumAlb.EOF do
     begin
        QNumPep.Close;
        QNumPep.Params.ByName['empresa'].AsInteger := xNumAlb.FieldByName('EMPRESA').AsInteger;
        QNumPep.Params.ByName['ejercicio'].AsInteger := xNumAlb.FieldByName('EJERCICIO').AsInteger;
        QNumPep.Params.ByName['canal'].AsInteger := xNumAlb.FieldByName('CANAL').AsInteger;
        QNumPep.Params.ByName['serie'].AsString := xNumAlb.FieldByName('SERIE').AsString;
        QNumPep.Params.ByName['tipo'].AsString := 'ALB';
        QNumPep.Params.ByName['rig'].AsInteger := xNumAlb.FieldByName('RIG').AsInteger;
        QNumPep.ExecQuery;
        if (QNumPep.FieldByName['RRIG'].AsInteger <> 0) then
        begin
           Inc(auxpep_sfg);
           serierig_pep_sfg := serierig_pep_sfg + QNumPep.FieldByName['RSERIE'].AsString + '/' + QNumPep.FieldByName['RRIG'].AsString;
           if ((total_alb > 1) and (auxpep_sfg <= total_alb - 1)) then
              serierig_pep_sfg := serierig_pep_sfg + ', ';
        end;

        QNumPep.FreeHandle;
        xNumAlb.Next;
     end;

     ParValue := serierig_pep_sfg;
  end;

  if ParName = 'serierig_alb' then
  begin
     with xNumAlb do
     begin
        Close;
        Open;
        First;
        while not xNumAlb.EOF do
        begin
           Inc(auxalb);
           serierig_alb := serierig_alb + xNumAlb.FieldByName('serie').AsString;
           serierig_alb := serierig_alb + '/' + IntToStr(xNumAlb.FieldByName('rig').AsInteger);
           if ((total_alb > 1) and (auxalb <= total_alb - 1)) then
              serierig_alb := serierig_alb + ', ';
           Next;
        end;
     end;
     ParValue := serierig_alb;
  end;

  if ParName = 'serierig_fac' then
  begin
     with xNumFac do
     begin
        Close;
        Open;
        First;
        while not xNumFac.EOF do
        begin
           Inc(auxfac);
           serierig_fac := serierig_fac + xNumFac.FieldByName('serie').AsString;
           serierig_fac := serierig_fac + '/' + IntToStr(xNumFac.FieldByName('rig').AsInteger);
           if ((total_fac > 1) and (auxfac <= total_fac - 1)) then
              serierig_fac := serierig_fac + ', ';
           Next;
        end;
     end;
     ParValue := serierig_fac;
  end;

  if ParName = 'TotalAlb' then
     ParValue := total_alb;

  if ParName = 'TotalFac' then
     ParValue := total_fac;

  if ParName = 'PieVisible' then
     if (not QMCabecera.EOF) then
        ParValue := 0
     else
        ParValue := 1;
end;

procedure TDMLstEnvio.frEnvioEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TDMLstEnvio.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  with QMEnvio do
  begin
     Close;
     Open;
  end;

  with xArticUnid do
  begin
     Close;
     Open;
  end;

  with xRuta do
  begin
     Close;
     Open;
  end;

  with xTotalAlb do
  begin
     Close;
     Open;
     total_alb := FieldByName('total_alb').AsInteger;
  end;

  with xTotalFac do
  begin
     Close;
     Open;
     total_fac := FieldByName('total_fac').AsInteger;
  end;
end;

procedure TDMLstEnvio.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMEnvio.Close;
  xArticUnid.Close;
  xRuta.Close;
  xTotalAlb.Close;
  xTotalFac.Close;
end;

procedure TDMLstEnvio.QMEnvioAfterOpen(DataSet: TDataSet);
begin
  xDirecciones.Close;
  xDirecciones.Open;
  xTransportista.Open;
end;

procedure TDMLstEnvio.QMEnvioBeforeOpen(DataSet: TDataSet);
begin
  xTransportista.Close;
end;

procedure TDMLstEnvio.ListadoPeticion(Modo, Empresa, Envio: integer);
var
  Titulo : string;
  Grupo : integer;
begin
  with xLstPeticionCab do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ENVIO'].AsInteger := Envio;
     Open;
  end;

  with xLstPeticionDet do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ENVIO'].AsInteger := Envio;
     Open;
  end;

  Grupo := 9005;
  Titulo := _('Listado de Peticion de Envio');
  DMListados.Imprimir(Grupo, 0, Modo, '', Titulo, frPeticion, nil, nil, nil);
end;

procedure TDMLstEnvio.ListadoContenido(Modo, Empresa, Envio: integer);
var
  Titulo : string;
  Grupo : integer;
begin
  with xLstContenido do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ENVIO'].AsInteger := Envio;
     Open;
  end;

  with xLstContenidoCab do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ENVIO'].AsInteger := Envio;
     Open;
  end;

  Grupo := 9007;
  Titulo := _('Listado de Contenido de Envio');
  DMListados.Imprimir(Grupo, 0, Modo, '', Titulo, frContenido, nil, nil, nil);
end;

procedure TDMLstEnvio.xLstContenidostock_ueGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT UNIDADES_EXT FROM ');
        SQL.Add(' A_ART_DAME_STOCK (:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) ');
        Params.ByName['EMPRESA'].AsInteger := xLstContenidoEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
        Params.ByName['ARTICULO'].AsString := xLstContenidoARTICULO.AsString;
        ExecQuery;
        Text := FieldByName['UNIDADES_EXT'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstEnvio.xLstContenidostock_udGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(EXISTENCIAS) FROM ');
        SQL.Add(' A_ART_DAME_STOCK_ARTICULO (:EMPRESA, :CANAL, :ARTICULO, 1) ');
        Params.ByName['EMPRESA'].AsInteger := xLstContenidoEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := xLstContenidoARTICULO.AsString;
        ExecQuery;
        Text := FieldByName['SUM'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
