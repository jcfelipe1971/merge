unit UDMImprimeRecibos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, SysUtils, Classes, Forms, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBTableDataSetRO;

type
  TDMImprimeRecibos = class(TDataModule)
     DSQMRecibos: TDataSource;
     QMRecibos: TFIBTableSetRO;
     TLocal: THYTransaction;
     QMRecibosEMPRESA: TIntegerField;
     QMRecibosEJERCICIO: TIntegerField;
     QMRecibosCANAL: TIntegerField;
     QMRecibosSIGNO: TFIBStringField;
     QMRecibosREGISTRO: TIntegerField;
     QMRecibosLINEA: TIntegerField;
     QMRecibosCOD_CLI_PRO: TIntegerField;
     QMRecibosVENCIMIENTO: TDateTimeField;
     QMRecibosCTA_PAGO: TFIBStringField;
     QMRecibosLIQUIDO: TFloatField;
     QMRecibosPAGADO: TIntegerField;
     QMRecibosIMPAGADO: TIntegerField;
     QMRecibosFORMA_PAGO: TFIBStringField;
     QMRecibosTIPO_EFECTO: TFIBStringField;
     QMRecibosACEPTADO: TIntegerField;
     QMRecibosREMESAR: TIntegerField;
     QMRecibosESTADO: TIntegerField;
     QMRecibosREMESA: TIntegerField;
     QMRecibosDOC_NUMERO: TIntegerField;
     QMRecibosDOC_SERIE: TFIBStringField;
     QMRecibosDOC_FECHA: TDateTimeField;
     QMRecibosDOC_TIPO: TFIBStringField;
     QMRecibosRIC: TIntegerField;
     QMRecibosRIVA: TIntegerField;
     QMRecibosFECHA_CIERRE: TDateTimeField;
     QMRecibosESTADO_RECIBO: TFIBStringField;
     QMRecibosRECIBIDO: TIntegerField;
     QMRecibosFECHA_REGISTRO: TDateTimeField;
     QMRecibosMONEDA: TFIBStringField;
     QMRecibosFECHA_VALOR: TDateTimeField;
     QMRecibosBANCO: TIntegerField;
     QMRecibosID_CARTERA: TIntegerField;
     QMRecibosID_CARTERA_DETALLE: TIntegerField;
     QMRecibosID_DOC: TIntegerField;
     QMRecibosID_REMESAS: TIntegerField;
     QMRecibosLISTADO: TIntegerField;
     QMRecibosTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMRecibosFOLIO: TIntegerField;
     QMRecibosNUM_FACTURA: TFIBStringField;
     QMRecibosLIQUIDO_CANAL: TFloatField;
     QMRecibosFP_TITULO: TFIBStringField;
     QMRecibosMONEDA_CANAL: TFIBStringField;
     QMRecibosTEXTO: TFIBStringField;
     QMRecibosOBSERVACIONES: TFIBStringField;
     QMRecibosNOMBRE_R_SOCIAL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     Signo: string;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure ImprimeRecibos(Sender: TForm; TipoListado: byte);
     procedure ImprimeRecibosFiltrados(aSigno: integer);
     procedure MarcaTodas(Sender: TForm);
     procedure MarcaHasta(Sender: TForm);
     procedure Filtra(Maestro: TDataSet);
     procedure CambiarSeleccion(SoloPendientes: boolean; DesdeDocumento, HastaDocumento: integer; aSigno: integer; Agente, DesdeCliente, HastaCliente: integer; DesdeFormaPago, HastaFormaPago, DesdeTipoEfecto, HastaTipoEfecto, Serie: string; DesdeFactura, HastaFactura: integer);
     procedure Refrescar;
  end;

var
  DMImprimeRecibos : TDMImprimeRecibos;

implementation

uses UFBuscaRO, UDMMain, UDMLstCarteraRecibos, UEntorno, UFormGest, UFMImprimeRecibos, UUtiles;

{$R *.dfm}

procedure TDMImprimeRecibos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMRecibos, MascaraN, MascaraI, ShortDateFormat);
  QMRecibosLIQUIDO.DisplayFormat := MascaraE;
end;

procedure TDMImprimeRecibos.BusquedaCompleja;
var
  Orden : string;
begin
  QMRecibos.Close;
  if TFBuscaRO.Create(Self).SeleccionaBusqueda(QMRecibos, '11100', False) = mrOk then
  begin
     Orden := QMRecibos.OrdenadoPor;
     QMRecibos.Ordenar('');
     if QMRecibos.SelectSQL.Count <> 0 then
        QMRecibos.SelectSQL.Add(' AND SIGNO=''' + Signo + '''');
     QMRecibos.Ordenar(Orden);
  end;
  QMRecibos.Open;
end;

procedure TDMImprimeRecibos.CambiarSeleccion(SoloPendientes: boolean; DesdeDocumento, HastaDocumento: integer; aSigno: integer; Agente, DesdeCliente, HastaCliente: integer; DesdeFormaPago, HastaFormaPago, DesdeTipoEfecto, HastaTipoEfecto, Serie: string; DesdeFactura, HastaFactura: integer);
var
  Orden : string;
begin
  Orden := QMRecibos.OrdenadoPor;

  case aSigno of
     0: Signo := 'C';
     1: Signo := 'P';
  end;

  with QMRecibos do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * ');
        Add(' FROM VER_RECIBOS_CARTERA ');
        Add(' WHERE  ');
        Add(' EMPRESA = ?EMPRESA AND ');
        Add(' EJERCICIO = ?EJERCICIO AND ');
        Add(' CANAL = ?CANAL AND ');
        Add(' SIGNO = ?SIGNO ');
        if (SoloPendientes) then
           Add(' AND LISTADO = 0 ');
        if (DesdeDocumento <> 0) then
           Add(' AND REGISTRO >= ' + IntToStr(DesdeDocumento));
        if (HastaDocumento <> 0) then
           Add(' AND REGISTRO <= ' + IntToStr(HastaDocumento));
        if (DesdeFormaPago <> '') then
           Add(' AND FORMA_PAGO >= ''' + DesdeFormaPago + '''');
        if (HastaFormaPago <> '') then
           Add(' AND FORMA_PAGO <= ''' + HastaFormaPago + '''');
        if (DesdeTipoEfecto <> '') then
           Add(' AND TIPO_EFECTO >= ''' + DesdeTipoEfecto + '''');
        if (HastaTipoEfecto <> '') then
           Add(' AND TIPO_EFECTO <= ''' + HastaTipoEfecto + '''');
        if (Serie <> '') then
           Add(' AND DOC_SERIE = ''' + Serie + '''');
        if (DesdeFactura <> 0) then
           Add(' AND DOC_NUMERO >= ' + IntToStr(DesdeFactura));
        if (HastaFactura <> 0) then
           Add(' AND DOC_NUMERO <= ' + IntToStr(HastaFactura));
        if (Signo = 'C') then
        begin
           if (DesdeCliente <> 0) then
              Add(' AND COD_CLI_PRO >= ' + IntToStr(DesdeCliente));
           if (HastaCliente <> 0) then
              Add(' AND COD_CLI_PRO <= ' + IntToStr(HastaCliente));
           if (Agente <> 0) then
           begin
              Add(' AND ID_DOC IN ');
              Add(' ( ');
              Add(' SELECT ID_S FROM GES_CABECERAS_S ');
              Add(' WHERE ');
              Add(' EMPRESA = ?EMPRESA AND ');
              Add(' EJERCICIO <= ?EJERCICIO AND ');
              Add(' CANAL = ?CANAL AND ');
              if (Serie <> '') then
                 Add(' SERIE = ''' + Serie + ''' AND ');
              Add(' TIPO = ''FAC'' AND ');
              Add(' AGENTE = ' + IntToStr(Agente));
              Add(' ) ');
           end;
        end;

        Add(' ORDER BY ' + Orden);
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Open;
  end;
end;

procedure TDMImprimeRecibos.Filtra(Maestro: TDataSet);
begin
  with QMRecibos do
  begin
     if Active then
        Close;
     Params.ByName['EMPRESA'].AsInteger := Maestro.FieldByName('EMPRESA').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := Maestro.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := Maestro.FieldByName('CANAL').AsInteger;
     Open;
  end;
end;

procedure TDMImprimeRecibos.ImprimeRecibos(Sender: TForm; TipoListado: byte);
var
  Listado, Grupo, Cabecera, Copias : integer;
  Tipo : string;
  // Subject : string;
  // CuerpoMail : TStrings;
begin
  with QMRecibos do
  begin
     DisableControls;
     try
        Open;
        First;

        AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);

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

           if TFMImprimeRecibos(Sender).Seleccionado then
           begin
              case TipoListado of
                 0: DMLstCarteraRecibos.ImprimirUnRecibo(1, Signo, QMRecibosEJERCICIO.AsInteger, QMRecibosREGISTRO.AsInteger, QMRecibosLINEA.AsInteger);
                 {
                 1:
                 DMLstPedidos.MostrarListadoMatricialDirecta(QMRecibosRIG.AsInteger,QMRecibossSERIE.AsString,1,QMRecibosEJERCICIO.AsInteger);
                 3:
                 begin
                    DMLstCarteraRecibos.MostrarListadomail(QMRecibosID_S.AsInteger, QMRecibosSERIE.AsString,
                       2, QMRecibosEJERCICIO.AsInteger);

                    CreaSubject(Subject, QMRecibosSERIE.AsString, IntToStr(QMRecibosRIG.AsInteger), _('Pedido'),
                       IntToStr(QMRecibosEJERCICIO.AsInteger));

                    CreaBody(CuerpoMail, DMLstPedidos.nombreFich, _('Pedido'), QMRecibosSERIE.AsString,
                       DateToStr(QMRecibosFECHA.AsDateTime), IntToStr(QMRecibosRIG.AsInteger), '', '');
                    try
                       AbreData(TDMListados, DMListados);
                       DMLstCarteraRecibos.SendMailClientePDF(QMRecibosCLIENTE.AsInteger, CuerpoMail, DMLstPedidos.rutaFich,
                          DMLstPedidos.nombreFich, Subject, '', 0, False);
                       CierraData(DMListados);
                    finally
                       CuerpoMail.Free;
                    end;
                 end;
                 }
              end;
           end;

           Next;
        until EOF;

        CierraData(DMLstCarteraRecibos);
     finally
        EnableControls;
     end;
  end;

  Refrescar;
end;

procedure TDMImprimeRecibos.MarcaHasta(Sender: TForm);
var
  Puntero : pointer;
begin
  with QMRecibos do
  begin
     Puntero := GetBookmark;
     DisableControls;
     try
        while not (TFMImprimeRecibos(Sender).HYTDBGRecibos.SelectedRows.CurrentRowSelected) do
        begin
           TFMImprimeRecibos(Sender).Marca;
           Prior;
        end;

        try
           GotoBookmark(Puntero);
        except
           First;
        end;
     finally
        EnableControls;
        FreeBookmark(Puntero);
     end;
  end;
end;

procedure TDMImprimeRecibos.MarcaTodas(Sender: TForm);
var
  m : pointer;
begin
  with QMRecibos do
  begin
     m := GetBookmark;
     DisableControls;
     try
        First;
        repeat
           TFMImprimeRecibos(Sender).Marca;
           Next;
        until EOF;
        try
           GotoBookmark(m);
        except
           First;
        end;
     finally
        EnableControls;
        FreeBookmark(m);
     end;
  end;
end;

procedure TDMImprimeRecibos.Refrescar;
begin
  UUtiles.Refrescar(QMRecibos, 'ID_CARTERA_DETALLE', -1);
end;

procedure TDMImprimeRecibos.ImprimeRecibosFiltrados(aSigno: integer);
var
  Signo : string;
begin
  Signo := 'C';
  if aSigno = 1 then
     Signo := 'P';

  AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);

  DMLstCarteraRecibos.ImprimirRecibosFiltrados(QMRecibos.SelectSQL.Text, REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, Signo);

  CierraData(DMLstCarteraRecibos);

  Refrescar;
end;

end.
