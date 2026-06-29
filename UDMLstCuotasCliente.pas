unit UDMLstCuotasCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FR_Class, Fr_HYReport, FIBDataSetRO, Forms, FR_DSet,
  FR_DBSet, HYFIBQuery;

type
  TDMLstCuotasCliente = class(TDataModule)
     frCuotas: TfrHYReport;
     TLocal: THYTransaction;
     QMCuotasDetDoc: TFIBDataSetRO;
     DSQMCuotasDetDoc: TDataSource;
     QMCuotasDocumentoDestino: TFIBDataSetRO;
     DSQMCuotasDocumentoDestino: TDataSource;
     frDBQMCuotaDetDoc: TfrDBDataSet;
     QMCuotasDatosTercero: TFIBDataSetRO;
     DSQMCuotasDatosTercero: TDataSource;
     QMContrato: TFIBDataSetRO;
     DSQMContrato: TDataSource;
     frDBQMContrato: TfrDBDataSet;
     QMContratoDatosTercero: TFIBDataSetRO;
     DSQMContratoDatosTercero: TDataSource;
     QMContratoDireccionTercero: TFIBDataSetRO;
     DSQMContratoDireccionTercero: TDataSource;
     QMCuotasCab: TFIBDataSetRO;
     DSQMCuotasCab: TDataSource;
     frDBQMCuotasCab: TfrDBDataSet;
     QMCuotasProyecto: TFIBDataSetRO;
     DSQMCuotasProyecto: TDataSource;
     QMCuotasDireccionTercero: TFIBDataSetRO;
     DSQMCuotasDireccionTercero: TDataSource;
     QMCuotasDet: TFIBDataSetRO;
     DSQMCuotasDet: TDataSource;
     frDBQMCuotaDet: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frCuotasEnterRect(Memo: TStringList; View: TfrView);
     procedure frCuotasGetValue(const ParName: string; var ParValue: variant);
     procedure QMCuotasDetDocAfterOpen(DataSet: TDataSet);
     procedure QMCuotasDetDocBeforeClose(DataSet: TDataSet);
     procedure QMContratoAfterOpen(DataSet: TDataSet);
     procedure QMContratoBeforeClose(DataSet: TDataSet);
     procedure QMCuotasCabAfterOpen(DataSet: TDataSet);
     procedure QMCuotasCabBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     RangoLst, LocalMascaraN: string;
  public
     { Public declarations }
     procedure MostrarListadoFiltrado(Listado: smallint; Modo: byte; DesdeCliente, HastaCliente: integer; DesdeFecha, HastaFecha: TDateTime);
     procedure MuestraContrato(Modo: byte; ID_Cuota: integer; Archivo: string = '');
  end;

var
  DMLstCuotasCliente : TDMLstCuotasCliente;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, DateUtils, UDameDato;

{$R *.dfm}

procedure TDMLstCuotasCliente.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
end;

procedure TDMLstCuotasCliente.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstCuotasCliente.MostrarListadoFiltrado(Listado: smallint; Modo: byte; DesdeCliente, HastaCliente: integer; DesdeFecha, HastaFecha: TDateTime);
begin
  with QMCuotasDet do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM EMP_CLIENTES_CUOTAS_DETALLE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' CUOTA = :CUOTA ');
     SelectSQL.Add(' ORDER BY LINEA');
  end;

  with QMCuotasDetDoc do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' CLIENTE = :CLIENTE AND ');
     SelectSQL.Add(' CUOTA = :CUOTA AND ');
     SelectSQL.Add(' FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     case Listado of
        0: SelectSQL.Add(' AND ID_S > 0 ');
        1: SelectSQL.Add(' AND ID_S = 0 ');
     end;
     SelectSQL.Add(' ORDER BY LINEA, LINEA_DET ');

     Params.ByName['DESDE_FECHA'].AsDateTime := RecodeTime(DesdeFecha, 00, 00, 00, 00);
     Params.ByName['HASTA_FECHA'].AsDateTime := RecodeTime(HastaFecha, 23, 59, 59, 99);
  end;

  with QMCuotasCab do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM EMP_CLIENTES_CUOTAS C ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' C.CANAL = :CANAL AND ');
     SelectSQL.Add(' C.CLIENTE BETWEEN :DESDE_CLIENTE AND :HASTA_CLIENTE ');
     case Listado of
        0:
        begin
           SelectSQL.Add(' AND EXISTS(SELECT EMPRESA FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC ');
           SelectSQL.Add('        WHERE ');
           SelectSQL.Add('        EMPRESA = C.EMPRESA AND ');
           SelectSQL.Add('        CANAL = C.CANAL AND ');
           SelectSQL.Add('        CLIENTE = C.CLIENTE AND ');
           SelectSQL.Add('        CUOTA = C.CUOTA AND ');
           SelectSQL.Add('        PROCESADA = 1 AND ');
           SelectSQL.Add('        ID_S > 0) ');
        end;
        1:
        begin
           SelectSQL.Add(' AND EXISTS(SELECT EMPRESA FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC ');
           SelectSQL.Add('        WHERE ');
           SelectSQL.Add('        EMPRESA = C.EMPRESA AND ');
           SelectSQL.Add('        CANAL = C.CANAL AND ');
           SelectSQL.Add('        CLIENTE = C.CLIENTE AND ');
           SelectSQL.Add('        CUOTA = C.CUOTA AND ');
           SelectSQL.Add('        PROCESADA = 1 AND ');
           SelectSQL.Add('        ID_S = 0) ');
        end;
     end;
     SelectSQL.Add(' ORDER BY C.CLIENTE, C.CUOTA');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     Open;
  end;

  RangoLst := Format(_('Del cliente %d %s al cliente %d %s'), [DesdeCliente, DameTituloCliente(DesdeCliente), HastaCliente, DameTituloCliente(HastaCliente)]);

  DMListados.Imprimir(191, 0, Modo, '', _('Listado de cuotas a clientes'), frCuotas, nil, nil, nil);
end;

procedure TDMLstCuotasCliente.frCuotasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraP]', Memo[0]) > 0) then
        View.FormatStr := MascaraP;
  end;
end;

procedure TDMLstCuotasCliente.frCuotasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Rango' then
     ParValue := RangoLst;
end;

procedure TDMLstCuotasCliente.QMCuotasDetDocAfterOpen(DataSet: TDataSet);
begin
  QMCuotasDocumentoDestino.Open;
end;

procedure TDMLstCuotasCliente.QMCuotasDetDocBeforeClose(DataSet: TDataSet);
begin
  QMCuotasDocumentoDestino.Close;
end;

procedure TDMLstCuotasCliente.MuestraContrato(Modo: byte; ID_Cuota: integer; Archivo: string);
begin
  with QMContrato do
  begin
     Close;
     Params.ByName['ID_CUOTA'].AsInteger := ID_Cuota;
     Open;
  end;

  DMListados.Imprimir(184, 0, Modo, '', '', frCuotas, nil, nil, Archivo);
end;

procedure TDMLstCuotasCliente.QMContratoAfterOpen(DataSet: TDataSet);
begin
  QMContratoDatosTercero.Open;
  QMContratoDireccionTercero.Open;
end;

procedure TDMLstCuotasCliente.QMContratoBeforeClose(DataSet: TDataSet);
begin
  QMContratoDatosTercero.Close;
  QMContratoDireccionTercero.Close;
end;

procedure TDMLstCuotasCliente.QMCuotasCabAfterOpen(DataSet: TDataSet);
begin
  QMCuotasDetDoc.Open;
  QMCuotasDet.Open;
  QMCuotasProyecto.Open;
  QMCuotasDatosTercero.Open;
  QMCuotasDireccionTercero.Open;
end;

procedure TDMLstCuotasCliente.QMCuotasCabBeforeClose(DataSet: TDataSet);
begin
  QMCuotasDetDoc.Close;
  QMCuotasDet.Close;
  QMCuotasProyecto.Close;
  QMCuotasDatosTercero.Close;
  QMCuotasDireccionTercero.Close;
  QMCuotasDet.Close;
end;

end.
