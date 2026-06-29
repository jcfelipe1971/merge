unit UDMImprimePedidos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBDataSetRO, FIBTableDataSetRO, SysUtils,
  HYFIBQuery;

type
  TDMImprimePedidos = class(TDataModule)
     DSQMPedidos: TDataSource;
     QMPedidos: TFIBTableSet;
     TLocal: THYTransaction;
     QMPedidosEMPRESA: TIntegerField;
     QMPedidosEJERCICIO: TIntegerField;
     QMPedidosCANAL: TIntegerField;
     QMPedidosSERIE: TFIBStringField;
     QMPedidosTIPO: TFIBStringField;
     QMPedidosRIG: TIntegerField;
     QMPedidosALMACEN: TFIBStringField;
     QMPedidosMONEDA: TFIBStringField;
     QMPedidosFECHA: TDateTimeField;
     QMPedidosTERCERO: TIntegerField;
     QMPedidosTITULO: TFIBStringField;
     QMPedidosDIRECCION: TIntegerField;
     QMPedidosCLIENTE: TIntegerField;
     QMPedidosCONTACTO: TIntegerField;
     QMPedidosSU_REFERENCIA: TFIBStringField;
     QMPedidosFORMA_PAGO: TFIBStringField;
     QMPedidosCAMPANYA: TIntegerField;
     QMPedidosNOTAS: TBlobField;
     QMPedidosESTADO: TIntegerField;
     QMPedidosBULTOS: TIntegerField;
     QMPedidosLINEAS: TIntegerField;
     QMPedidosBRUTO: TFloatField;
     QMPedidosI_DTO_LINEAS: TFloatField;
     QMPedidosS_BASES: TFloatField;
     QMPedidosM_BRUTO: TFloatField;
     QMPedidosC_TOTAL: TFloatField;
     QMPedidosAGENTE: TIntegerField;
     QMPedidosS_CUOTA_IVA: TFloatField;
     QMPedidosS_CUOTA_RE: TFloatField;
     QMPedidosB_DTO_LINEAS: TFloatField;
     QMPedidosDTO_PP: TFloatField;
     QMPedidosDTO_CIAL: TFloatField;
     QMPedidosI_DTO_CIAL: TFloatField;
     QMPedidosI_DTO_PP: TFloatField;
     QMPedidosB_COMISION: TFloatField;
     QMPedidosI_COMISION: TFloatField;
     QMPedidosPOR_FINANCIACION: TFloatField;
     QMPedidosI_FINANCIACION: TFloatField;
     QMPedidosLIQUIDO: TFloatField;
     QMPedidosENTRADA: TIntegerField;
     QMPedidosFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosFECHA_REC_CAB: TDateTimeField;
     QMPedidosSERVIDO: TIntegerField;
     QMPedidosNOMBRE_COMERCIAL: TFIBStringField;
     QMPedidosPORTES: TIntegerField;
     QMPedidosTARIFA: TFIBStringField;
     QMPedidosAGRUPACION_KRI: TIntegerField;
     QMPedidosID_S: TIntegerField;
     QMPedidosIDIOMA: TFIBStringField;
     QMPedidosUSUARIO: TIntegerField;
     QMPedidosMARGEN_KRI: TFloatField;
     QMPedidosTIPO_PORTES: TIntegerField;
     QMPedidosPOR_PORTES: TFloatField;
     QMPedidosI_PORTES: TFloatField;
     QMPedidosI_PORTES_CANAL: TFloatField;
     QMPedidosCAMBIO_FIJO: TIntegerField;
     QMPedidosVALOR_CAMB_FIJO: TFloatField;
     QMPedidosPROYECTO: TIntegerField;
     QMPedidosNOTAS_INTERNAS_KRI: TBlobField;
     QMPedidosTIPO_LINEA_KRI: TIntegerField;
     QMPedidosFECHA_CLIENTE: TDateTimeField;
     QMPedidosTIT_CONTACTO: TFIBStringField;
     QMPedidosFECHA_CREACION_KRI: TDateTimeField;
     QMPedidosPEDIDO_CLIENTE: TFIBStringField;
     QMPedidosRANGO: TIntegerField;
     QMPedidosINDICE: TIntegerField;
     QMPedidosTRANSPORTISTA: TIntegerField;
     QMPedidosEMAIL: TStringField;
     QMPedidosZ_OBSERVACION: TFIBStringField;
     QMPedidosID_FICHA_TECNICA: TIntegerField;
     procedure DMImprimePedidosCreate(Sender: TObject);
     procedure QMPedidosCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja(SoloPendientes: boolean; Serie: string);
     procedure ImprimePedidos(Sender: TForm; TipoListado: byte);
     procedure MarcaTodas(Sender: TForm);
     procedure MarcaHasta(Sender: TForm);
     procedure Filtra(Maestro: TDataSet);
     procedure Refrescar; {dji lrk kri}
     procedure CambiarSeleccion(SoloPendientes: boolean; Desde, Hasta: integer; Serie: string);
  end;

var
  DMImprimePedidos : TDMImprimePedidos;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFBusca, UFMImprimePedidos, UDMLstPedidos, UFormGest,
  UDMListados;

{$R *.DFM}

procedure TDMImprimePedidos.DMImprimePedidosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not QMPedidos.Transaction.InTransaction then
     QMPedidos.Transaction.StartTransaction;

  QMPedidosFECHA.DisplayFormat := ShortDateFormat;
  QMPedidosFECHA_ENTREGA_PREV.DisplayFormat := ShortDateFormat;
  QMPedidosFECHA_REC_CAB.DisplayFormat := ShortDateFormat;
  QMPedidosLIQUIDO.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMPedidos, '11100', True);
end;

procedure TDMImprimePedidos.Filtra(Maestro: TDataSet);
begin
  with QMPedidos do
  begin
     if Active then
        Close;
     Params.ByName['EMPRESA'].AsInteger := maestro.FieldByName('EMPRESA').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := maestro.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := maestro.FieldByName('CANAL').AsInteger;
     Open;
  end;
end;

procedure TDMImprimePedidos.ImprimePedidos(Sender: TForm; TipoListado: byte);
var
  Listado, Grupo, Cabecera, Copias : integer;
  Tipo : string;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  QMPedidos.DisableControls;
  try
     QMPedidos.Open;
     QMPedidos.First;
     Listado := REntorno.Formato;
     Grupo := REntorno.Grupo;
     Copias := REntorno.Copias;
     Cabecera := REntorno.Cabecera;
     Tipo := REntorno.TipoListado;
     repeat
        REntorno.Formato := Listado;
        REntorno.Grupo := Grupo;
        REntorno.Copias := Copias;
        REntorno.Cabecera := Cabecera;
        REntorno.TipoListado := Tipo;
        if TFMImprimePedidos(Sender).Seleccionado then
        begin
           AbreData(TDMLstPedidos, DMLstPedidos);
           case TipoListado of
              0: DMLstPedidos.MostrarListado(1, 1, QMPedidosSERIE.AsString, QMPedidosEJERCICIO.AsInteger, QMPedidosID_S.AsInteger);
              // 1:
              // DMLstPedidos.MostrarListadoMatricialDirecta(QMPedidosRIG.AsInteger,QMPedidossSERIE.AsString,1,QMPedidosEJERCICIO.AsInteger);
              3:
              begin
                 DMLstPedidos.MostrarListadoMail(QMPedidosID_S.AsInteger, QMPedidosSERIE.AsString,
                    2, QMPedidosEJERCICIO.AsInteger);

                 InicializaVariableEmail(QMPedidosTIPO.AsString);
                 with VariableEmail do
                 begin
                    Ejercicio := QMPedidosEJERCICIO.AsInteger;
                    Serie := QMPedidosSERIE.AsString;
                    NumeroDocumento := QMPedidosRIG.AsInteger;
                    Fecha := QMPedidosFECHA.AsDateTime;
                    SuReferencia := QMPedidosSU_REFERENCIA.AsString;
                    SuPedido := QMPedidosPEDIDO_CLIENTE.AsString;
                    Folio := '';
                    TituloDocTributario := '';
                    NombreFichero := DMLstPedidos.nombreFich;
                    Matricula := DMMain.DameMatriculaFichaTecnica(QMPedidosID_FICHA_TECNICA.AsInteger);
                    if (QMPedidosCLIENTE.AsInteger > 0) then
                    begin
                       NombreComercial := QMPedidosNOMBRE_COMERCIAL.AsString;
                       RazonSocial := QMPedidosTITULO.AsString;
                    end
                    else
                    begin
                       NombreComercial := DameNombreTercerosVarios(QMPedidos.FieldByName('TIPO').AsString, QMPedidos.FieldByName('ID_S').AsInteger);
                       RazonSocial := NombreComercial;
                    end;
                    OrdenTrabajo := 0;
                    UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(QMPedidosENTRADA.AsInteger));
                 end;

                 DamePartesEmail(Asunto, CuerpoMail);
                 try
                    AbreData(TDMListados, DMListados);
                    DMListados.SendMailClientePDF(QMPedidosCLIENTE.AsInteger, CuerpoMail, DMLstPedidos.rutaFich,
                       DMLstPedidos.nombreFich, Asunto, QMPedidosSERIE.AsString, QMPedidosID_S.AsInteger, False, DMMain.DameCorreoCopiaAgente(QMPedidosAGENTE.AsInteger, 'PEC'));
                 finally
                    CuerpoMail.Free;
                 end;
                 CierraData(DMListados);
              end;
           end;
           CierraData(DMLstPedidos);
        end;
        QMPedidos.Next;
     until QMPedidos.EOF;

     QMPedidos.First;
  finally
     QMPedidos.EnableControls;
  end;

  Refrescar;
end;

procedure TDMImprimePedidos.MarcaTodas(Sender: TForm);
var
  IdS : integer;
begin
  IdS := QMPedidosID_S.AsInteger;

  with QMPedidos do
  begin
     try
        DisableControls;
        First;
        repeat
           TFMimprimePedidos(Sender).Marca;
           Next;
        until EOF;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMPedidos, 'ID_S', IdS);
end;

procedure TDMImprimePedidos.MarcaHasta(Sender: TForm);
var
  IdS : integer;
begin
  IdS := QMPedidosID_S.AsInteger;

  with QMPedidos do
  begin
     DisableControls;
     try
        while not (TFMimprimePedidos(Sender).DBGPedidos.SelectedRows.CurrentRowSelected) do
        begin
           TFMimprimePedidos(Sender).Marca;
           Prior;
        end;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMPedidos, 'ID_S', IdS);
end;

procedure TDMImprimePedidos.BusquedaCompleja(SoloPendientes: boolean; Serie: string);
var
  Orden : string;
begin
  with QMPedidos do
  begin
     Close;
     if TFBusca.Create(Self).SeleccionaBusqueda(QMPedidos, '11100', False) = mrOk then
     begin
        Orden := OrdenadoPor;
        Ordenar('');
        if SelectSQL.Count <> 0 then
        begin
           SelectSQL.Add(' AND TIPO = ''PEC'' ');
           if (SoloPendientes) then
              SelectSQL.Add(' AND MODIFICA_DOC = 0 ');
        end;
        Ordenar(Orden);
     end
     else
        CambiarSeleccion(SoloPendientes, 0, 9999999, Serie);

     Open;
  end;
end;

procedure TDMImprimePedidos.Refrescar; {dji lrk kri}
begin
  UUtiles.Refrescar(QMPedidos, 'ID_S', 0);
end;

procedure TDMImprimePedidos.CambiarSeleccion(SoloPendientes: boolean; Desde, Hasta: integer; Serie: string);
begin
  with QMPedidos do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * ');
        Add(' FROM  VER_CABECERAS_PEDIDO ');
        Add(' WHERE  ');
        Add(' EMPRESA = ?EMPRESA AND ');
        Add(' EJERCICIO = ?EJERCICIO AND ');
        Add(' CANAL = ?CANAL AND ');
        Add(' TIPO = ''PEC'' ');
        if (Serie <> '') then
           Add(' AND SERIE = :SERIE ');
        if (SoloPendientes) then
           Add(' AND MODIFICA_DOC = 0 ');
        if (Desde <> 0) then
           Add(' AND RIG >= ' + IntToStr(Desde));
        if (Hasta <> 0) then
           Add(' AND RIG <= ' + IntToStr(Hasta));
        Add(' ORDER BY SERIE, RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMImprimePedidos.QMPedidosCalcFields(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST(1) EMAIL ');
        SQL.Add(' FROM L_DAME_EMAIL_TERCERO_TIPO(:TERCERO, :TIPO) ');
        Params.ByName['TERCERO'].AsInteger := QMPedidosTERCERO.AsInteger;
        Params.ByName['TIPO'].AsString := 'PEC';
        ExecQuery;
        QMPedidosEMAIL.AsString := FieldByName['EMAIL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
