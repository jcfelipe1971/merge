unit ZUDMOrdenesProd;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery, UComponentesBusquedaFiltrada,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet;

type
  TZDMOrdenesProd = class(TDataModule)
     QMOrdProd: TFIBTableSet;
     DSQMOrdProd: TDataSource;
     TLocal: THYTransaction;
     QMOrdProdEMPRESA: TIntegerField;
     QMOrdProdEJERCICIO: TIntegerField;
     QMOrdProdCANAL: TIntegerField;
     QMOrdProdSERIE: TFIBStringField;
     QMOrdProdTIPO: TFIBStringField;
     QMOrdProdRIG: TIntegerField;
     QMOrdProdCLIENTE: TIntegerField;
     QMOrdProdTERCERO: TIntegerField;
     QMOrdProdDIREC_ENTR: TIntegerField;
     QMOrdProdS_REFERENCIA: TFIBStringField;
     QMOrdProdARTICULO: TFIBStringField;
     QMOrdProdTITULO: TFIBStringField;
     QMOrdProdFECHA_EMISION: TDateTimeField;
     QMOrdProdFECHA_ENTREGA: TDateTimeField;
     QMOrdProdFECHA_FABRICA: TDateTimeField;
     QMOrdProdESTADO: TFIBStringField;
     QMOrdProdCANTIDAD: TFloatField;
     QMOrdProdPRECIO: TFloatField;
     QMOrdProdGTOS_INICIALES: TFloatField;
     QMOrdProdDESC_GTOS_INI: TBlobField;
     QMOrdProdMAQUINA: TFIBStringField;
     QMOrdProdNOTAS: TBlobField;
     QMOrdProdENTRADA: TIntegerField;
     QMOrdProdFECHA_ENVIO: TDateTimeField;
     QMOrdProdZ_NUM_EXPED: TFIBStringField;
     QMOrdProdTRANSPORTISTA: TIntegerField;
     xClientes: TFIBDataSetRO;
     xDirClientes: TFIBDataSetRO;
     xArticulos: TFIBDataSetRO;
     xEstado: TFIBDataSetRO;
     xMaquinas: TFIBDataSetRO;
     DSxClientes: TDataSource;
     DSxDirClientes: TDataSource;
     DSxArticulos: TDataSource;
     DSxEstado: TDataSource;
     DSxMaquinas: TDataSource;
     DSxTransportistas: TDataSource;
     xTransportistas: TFIBDataSetRO;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     xTransportistasTITULO: TFIBStringField;
     QMOrdProdDescCliente: TStringField;
     QMOrdProdDescDireccionCliente: TStringField;
     QMOrdProdDescEstado: TStringField;
     QMOrdProdDescMaquina: TStringField;
     QMOrdProdDescTransportista: TStringField;
     QMOrdProdz_codigo_cliente: TStringField;
     xArticulos_codigocli: TFIBDataSetRO;
     DSxArticulos_codigocli: TDataSource;
     xArticulos_codigocliZ_CODIGO_CLIENTE: TFIBStringField;
     QMOrdProdPUBLICAR_WEB: TIntegerField;
     QMOrdProdCANTIDAD_GAST_ESPECIALES: TFloatField;
     QMOrdProdPEDIDO: TIntegerField;
     QMOrdProdLINEA: TIntegerField;
     QMOrdProdTIPODOC: TFIBStringField;
     EFFiltro: TEntornoFind2000;
     xPedido_C: TFIBDataSetRO;
     xPedido_CEMPRESA: TIntegerField;
     xPedido_CEJERCICIO: TIntegerField;
     xPedido_CCANAL: TIntegerField;
     xPedido_CSERIE: TFIBStringField;
     xPedido_CTIPO: TFIBStringField;
     xPedido_CRIG: TIntegerField;
     xPedido_CTITULO: TFIBStringField;
     xPedido_CDIRECCION: TIntegerField;
     xPedido_CCLIENTE: TIntegerField;
     xPedido_D: TFIBDataSetRO;
     xPedido_DEMPRESA: TIntegerField;
     xPedido_DEJERCICIO: TIntegerField;
     xPedido_DCANAL: TIntegerField;
     xPedido_DSERIE: TFIBStringField;
     xPedido_DTIPO: TFIBStringField;
     xPedido_DRIG: TIntegerField;
     xPedido_DLINEA: TIntegerField;
     xPedido_DARTICULO: TFIBStringField;
     xPedido_DTITULO: TFIBStringField;
     xPedido_DUNIDADES: TFloatField;
     xPedido_DPRECIO: TFloatField;
     QMOrdProdLINEA_GTOS_INI: TIntegerField;
     QMOrdProdARTICULO_GTOS_INI: TFIBStringField;
     QMOrdProdTITULO_GTOS_INI: TFIBStringField;
     QMOrdProdPRECIO_GTOS_INI: TFloatField;
     xPedido_D_gtos_ini: TFIBDataSetRO;
     xPedido_D_gtos_iniEMPRESA: TIntegerField;
     xPedido_D_gtos_iniEJERCICIO: TIntegerField;
     xPedido_D_gtos_iniCANAL: TIntegerField;
     xPedido_D_gtos_iniSERIE: TFIBStringField;
     xPedido_D_gtos_iniTIPO: TFIBStringField;
     xPedido_D_gtos_iniRIG: TIntegerField;
     xPedido_D_gtos_iniLINEA: TIntegerField;
     xPedido_D_gtos_iniARTICULO: TFIBStringField;
     xPedido_D_gtos_iniTITULO: TFIBStringField;
     xPedido_D_gtos_iniUNIDADES: TFloatField;
     xPedido_D_gtos_iniPRECIO: TFloatField;
     QAjustaCont: THYFIBQuery;
     xPedido_CSU_REFERENCIA: TFIBStringField;
     xPedido_CFECHA_ENTREGA_PREV: TDateTimeField;
     QSetTransportista: THYFIBQuery;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure QMOrdProdBeforePost(DataSet: TDataSet);
     procedure QMOrdProdCLIENTEChange(Sender: TField);
     procedure ZDMOrdenesProdCreate(Sender: TObject);
     procedure QMOrdProdNewRecord(DataSet: TDataSet);
     procedure QMOrdProdDescClienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOrdProdDIREC_ENTRChange(Sender: TField);
     procedure QMOrdProdDescDireccionClienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOrdProdARTICULOChange(Sender: TField);
     procedure QMOrdProdESTADOChange(Sender: TField);
     procedure QMOrdProdDescEstadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOrdProdMAQUINAChange(Sender: TField);
     procedure QMOrdProdDescMaquinaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOrdProdTRANSPORTISTAChange(Sender: TField);
     procedure QMOrdProdDescTransportistaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOrdProdz_codigo_clienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOrdProdPEDIDOChange(Sender: TField);
     procedure QMOrdProdLINEAChange(Sender: TField);
     procedure QMOrdProdLINEA_GTOS_INIChange(Sender: TField);
     procedure QMOrdProdAfterPost(DataSet: TDataSet);
     procedure QMOrdProdAfterOpen(DataSet: TDataSet);
     procedure QMOrdProdBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     NuevoTransportista: integer;
     procedure SerieChange(SerieVar: string);
     procedure SetTransportista(Transportista: integer);
  public
     { Public declarations }
     Transportista: integer;
     procedure CambiaSerie(SerieVar: string);
     procedure BusquedaCompleja;
  end;

var
  ZDMOrdenesProd : TZDMOrdenesProd;
  Serie : string;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca, ZUFMOrdenesProd, Variants;

{$R *.DFM}

procedure TZDMOrdenesProd.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMOrdProd, '11110', True, Serie);
end;

procedure TZDMOrdenesProd.ZDMOrdenesProdCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  // Máscaras
  QMOrdProdCANTIDAD.DisplayFormat := MascaraN;
  QMOrdProdPRECIO.DisplayFormat := MascaraN;
  QMOrdProdCANTIDAD_GAST_ESPECIALES.DisplayFormat := MascaraN;
  QMOrdProdPRECIO_GTOS_INI.DisplayFormat := MascaraN;
  QMOrdProdGTOS_INICIALES.DisplayFormat := MascaraN;

  // Apertura de datos
  DMMain.FiltraTabla(QMOrdProd, '11110', False);
  SerieChange(Serie);

  //DMMain.FiltraRO(xLstOrdProd, '11110', True);
end;

procedure TZDMOrdenesProd.SetTransportista(Transportista: integer);
begin
  with QSetTransportista do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := QMOrdProdEMPRESA.AsInteger;
     Params.ByName['ejercicio'].AsInteger := QMOrdProdEJERCICIO.AsInteger;
     Params.ByName['canal'].AsInteger := QMOrdProdCANAL.AsInteger;
     Params.ByName['serie'].AsString := QMOrdProdSERIE.AsString;
     Params.ByName['tipo'].AsString := QMOrdProdTIPO.AsString;
     Params.ByName['rig'].AsInteger := QMOrdProdRIG.AsInteger;
     if QMOrdProdESTADO.AsString = 'EX' then
        Params.ByName['transportista'].AsInteger := Transportista
     else
        Params.ByName['transportista'].AsVariant := Null;
     ExecQuery;
     Transaction.Commit;
     FreeHandle;
  end;
end;

procedure TZDMOrdenesProd.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  //SFG_RSP per compilar DMMain.Graba;
  SetTransportista(Transportista);
  (*
  if QMOrdProdESTADO.AsString = 'EX' then
  begin
     {with QSetTransportista do
     begin
        Close;
        Params.ByName['empresa'].AsInteger := QMOrdProdEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMOrdProdEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMOrdProdCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMOrdProdSERIE.AsString;
        Params.ByName['tipo'].AsString := QMOrdProdTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMOrdProdRIG.AsInteger;
        Params.ByName['transportista'].AsInteger := Transportista;
        ExecQuery;
        Transaction.Commit;
        FreeHandle;
     end}
     //SFG_RSP per compilarDMMain.Graba;
  end
  else
  begin
     SetTransportista(Transportista);
     {with QSetTransportista do
     begin
        Close;
        Params.ByName['empresa'].AsInteger := QMOrdProdEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMOrdProdEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMOrdProdCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMOrdProdSERIE.AsString;
        Params.ByName['tipo'].AsString := QMOrdProdTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMOrdProdRIG.AsInteger;
        Params.ByName['transportista'].AsVariant := Null;
        ExecQuery;
        Transaction.Commit;
        FreeHandle;
     end;}
     //SFG_RSP per compilarDMMain.Graba;
  end; //if
  *)
  DataSet.Refresh;
end;

procedure TZDMOrdenesProd.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;
  with QMOrdProd do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
  SerieChange(Serie);
  EFFiltro.Empresa := REntorno.Empresa;
  EFFiltro.Ejercicio := REntorno.Ejercicio;
  EFFiltro.Canal := REntorno.Canal;
  EFFiltro.Serie := Serie;
end;

procedure TZDMOrdenesProd.SerieChange(SerieVar: string);
begin
  with xSeries do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := SerieVar;
     Open;
  end;
end;

procedure TZDMOrdenesProd.QMOrdProdBeforePost(DataSet: TDataSet);
begin
  if ZFMOrdenesProd.DBETitTransportista.Text = '' then
     QMOrdProdTRANSPORTISTA.AsVariant := Null;
  if (DataSet.State = dsInsert) then
     QMOrdProdRIG.AsInteger := DMMain.Contador_Libre_EECS(QMOrdProdSERIE.AsString, 'ZOF', QMOrdProdRIG.AsInteger);
  NuevoTransportista := StrToIntDef(ZFMOrdenesProd.EFTransportista.Text, 0);
end;

procedure TZDMOrdenesProd.QMOrdProdNewRecord(DataSet: TDataSet);
begin
  QMOrdProdEMPRESA.AsInteger := REntorno.Empresa;
  QMOrdProdEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMOrdProdCANAL.AsInteger := REntorno.Canal;
  QMOrdProdSERIE.AsString := Serie;
  QMOrdProdTIPO.AsString := 'ZOF';
  QMOrdProdRIG.AsInteger := 0;
  QMOrdProdENTRADA.AsInteger := REntorno.Entrada;
  QMOrdProdFECHA_EMISION.AsDateTime := REntorno.FechaTrab;
  QMOrdProdTERCERO.AsInteger := 0;
  QMOrdProdZ_NUM_EXPED.AsString := '';
  QMOrdProdCANTIDAD.AsFloat := 1;
  QMOrdProdESTADO.AsString := 'DI';
  QMOrdProdPUBLICAR_WEB.AsInteger := 0;
  QMOrdProdTIPODOC.AsString := 'PEC';
end;

procedure TZDMOrdenesProd.QMOrdProdCLIENTEChange(Sender: TField);
begin
  if (QMOrdProd.State in [dsInsert, dsEdit]) then
  begin
     xClientes.Close;
     xClientes.Open;
     QMOrdProdTERCERO.AsInteger := xClientes.FieldByName('TERCERO').AsInteger;
     QMOrdProdDescCliente.AsString := xClientes.FieldByName('TITULO').AsString;
  end;
end;

procedure TZDMOrdenesProd.QMOrdProdDescClienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := '';
  if (xClientes.Active) then
     Text := xClientes.FieldByName('TITULO').AsString;
end;

procedure TZDMOrdenesProd.QMOrdProdDIREC_ENTRChange(Sender: TField);
begin
  if (QMOrdProd.State in [dsInsert, dsEdit]) then
  begin
     xDirClientes.Close;
     xDirClientes.Open;
     QMOrdProdDescDireccionCliente.AsString := xDirClientes.FieldByName('TITULO').AsString;
  end;
end;

procedure TZDMOrdenesProd.QMOrdProdDescDireccionClienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := '';
  if (xDirClientes.Active) then
     Text := xDirClientes.FieldByName('TITULO').AsString;
end;

procedure TZDMOrdenesProd.QMOrdProdARTICULOChange(Sender: TField);
begin
  if (QMOrdProd.State in [dsInsert, dsEdit]) then
  begin
     xArticulos.Close;
     xArticulos.Open;
     QMOrdProdTITULO.AsString := xArticulos.FieldByName('TITULO').AsString;

     xArticulos_codigocli.Close;
     xArticulos_codigocli.Open;
     QMOrdProdz_codigo_cliente.AsString := xArticulos_codigocliZ_CODIGO_CLIENTE.AsString;
  end;
end;

procedure TZDMOrdenesProd.QMOrdProdz_codigo_clienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xArticulos_codigocliZ_CODIGO_CLIENTE.AsString;
end;

procedure TZDMOrdenesProd.QMOrdProdESTADOChange(Sender: TField);
begin
  if (QMOrdProd.State in [dsInsert, dsEdit]) then
  begin
     xEstado.Close;
     xEstado.Open;
     QMOrdProdDescEstado.AsString := xEstado.FieldByName('DESCRIPCION').AsString;
  end;
end;

procedure TZDMOrdenesProd.QMOrdProdDescEstadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := '';
  if (xEstado.Active) then
     Text := xEstado.FieldByName('DESCRIPCION').AsString;
end;

procedure TZDMOrdenesProd.QMOrdProdMAQUINAChange(Sender: TField);
begin
  if (QMOrdProd.State in [dsInsert, dsEdit]) then
  begin
     xMaquinas.Close;
     xMaquinas.Open;
     QMOrdProdDescMaquina.AsString := xMaquinas.FieldByName('DESCRIPCION').AsString;
  end;
end;

procedure TZDMOrdenesProd.QMOrdProdDescMaquinaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := '';
  if (xMaquinas.Active) then
     Text := xMaquinas.FieldByName('DESCRIPCION').AsString;
end;

procedure TZDMOrdenesProd.QMOrdProdTRANSPORTISTAChange(Sender: TField);
begin
  if (QMOrdProd.State in [dsInsert, dsEdit]) then
  begin
     xTransportistas.Close;
     xTransportistas.Open;
     QMOrdProdDescTransportista.AsString := xTransportistas.FieldByName('TITULO').AsString;
  end;
end;

procedure TZDMOrdenesProd.QMOrdProdDescTransportistaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := '';
  if (xTransportistas.Active) then
     Text := xTransportistas.FieldByName('TITULO').AsString;
end;

procedure TZDMOrdenesProd.QMOrdProdPEDIDOChange(Sender: TField);
begin
  //Pedido --> Cuando cambia hay que insertar los campos cliente, ...
  xPedido_C.Close;
  xPedido_C.Open;
  QMOrdProdCLIENTE.AsInteger := xPedido_CCLIENTE.AsInteger;
  QMOrdProdDIREC_ENTR.AsString := xPedido_CDIRECCION.AsString;
  QMOrdProdS_REFERENCIA.AsString := xPedido_CSU_REFERENCIA.AsString;
  QMOrdProdFECHA_ENTREGA.AsDateTime := xPedido_CFECHA_ENTREGA_PREV.AsDateTime;
  QMOrdProdLineaChange(QMOrdProdLINEA);
end;

procedure TZDMOrdenesProd.QMOrdProdLINEAChange(Sender: TField);
begin
  // ---> cuando cambia tiene que insertar datos --> Articulo, ...
  xPedido_D.Close;
  xPedido_D.Open;
  QMOrdProdARTICULO.AsString := xPedido_DARTICULO.AsString;
  QMOrdProdTITULO.AsString := xPedido_DTITULO.AsString;
  QMOrdProdCANTIDAD.AsFloat := xPedido_DUNIDADES.AsFloat;
  QMOrdProdPRECIO.AsFloat := xPedido_DPRECIO.AsFloat;
end;

procedure TZDMOrdenesProd.QMOrdProdLINEA_GTOS_INIChange(Sender: TField);
begin
  xPedido_D_gtos_ini.Close;
  xPedido_D_gtos_ini.Open;
  QMOrdProdARTICULO_GTOS_INI.AsString := xPedido_D_gtos_iniARTICULO.AsString;
  QMOrdProdTITULO_GTOS_INI.AsString := xPedido_D_gtos_iniTITULO.AsString;
  QMOrdProdCANTIDAD_GAST_ESPECIALES.AsFloat := xPedido_D_gtos_iniUNIDADES.AsFloat;
  QMOrdProdPRECIO_GTOS_INI.AsFloat := xPedido_D_gtos_iniPRECIO.AsFloat;
  QMOrdProdGTOS_INICIALES.AsFloat := QMOrdProdCANTIDAD_GAST_ESPECIALES.AsFloat * QMOrdProdPRECIO_GTOS_INI.AsFloat;
end;

procedure TZDMOrdenesProd.QMOrdProdAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);

  if QMOrdProdESTADO.AsString = 'EX' then
  begin
     SetTransportista(NuevoTransportista);
     {with QSetTransportista do
     begin
        Close;
        Params.ByName['empresa'].AsInteger := QMOrdProdEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMOrdProdEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMOrdProdCANAL.AsInteger;
        Params.ByName['serie'].AsString := QMOrdProdSERIE.AsString;
        Params.ByName['tipo'].AsString := QMOrdProdTIPO.AsString;
        Params.ByName['rig'].AsInteger := QMOrdProdRIG.AsInteger;
        Params.ByName['transportista'].AsInteger := NuevoTransportista;
        ExecQuery;
        Transaction.Commit;
        FreeHandle;
     end;}
  end;
end;

procedure TZDMOrdenesProd.QMOrdProdAfterOpen(DataSet: TDataSet);
begin
  xClientes.Open;
  xDirClientes.Open;
  xArticulos.Open;
  xArticulos_codigocli.Open;
  xEstado.Open;
  xMaquinas.Open;
  xTransportistas.Open;
end;

procedure TZDMOrdenesProd.QMOrdProdBeforeClose(DataSet: TDataSet);
begin
  xClientes.Close;
  xDirClientes.Close;
  xArticulos.Close;
  xArticulos_codigocli.Close;
  xEstado.Close;
  xMaquinas.Close;
  xTransportistas.Close;
end;

end.
