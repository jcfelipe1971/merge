unit UDMImprimeFacturas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBDataSetRO, FIBTableDataSetRO, SysUtils,
  HYFIBQuery;

type
  TDMImprimeFacturas = class(TDataModule)
     DSQMFacturas: TDataSource;
     QMFacturas: TFIBTableSet;
     QMFacturasEMPRESA: TIntegerField;
     QMFacturasEJERCICIO: TIntegerField;
     QMFacturasCANAL: TIntegerField;
     QMFacturasSERIE: TFIBStringField;
     QMFacturasRIG: TIntegerField;
     QMFacturasFECHA: TDateTimeField;
     QMFacturasTITULO: TFIBStringField;
     QMFacturasCLIENTE: TIntegerField;
     QMFacturasSU_REFERENCIA: TFIBStringField;
     QMFacturasFORMA_PAGO: TFIBStringField;
     QMFacturasTOTAL_A_COBRAR: TFloatField;
     QMFacturasMONEDA: TFIBStringField;
     QMFacturasID_S: TIntegerField;
     QMFacturasTIPO: TFIBStringField;
     QMFacturasPROCESO_AUTO: TIntegerField;
     TLocal: THYTransaction;
     QMFacturasEMAIL: TStringField;
     QMFacturasTERCERO: TIntegerField;
     QMFacturasAGENTE: TIntegerField;
     QMFacturasESTADO: TIntegerField;
     QMFacturasFECHA_ENTREGA_REPARTO: TDateTimeField;
     QMFacturasZ_OBSERVACION: TFIBStringField;
     QMFacturasTITULO_ESTADO: TStringField;
     QMFacturasFECHA_CON: TDateTimeField;
     QMFacturasPEDIDO_CLIENTE: TFIBStringField;
     QMFacturasFOLIO: TIntegerField;
     QMFacturasTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMFacturasID_FICHA_TECNICA: TIntegerField;
     QMFacturasNOMBRE_COMERCIAL: TFIBStringField;
     procedure DMImprimeFacturasCreate(Sender: TObject);
     procedure QMFacturasTOTAL_A_COBRARGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFacturasCalcFields(DataSet: TDataSet);
     procedure QMFacturasTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     CalculaEmail: boolean;
  public
     { Public declarations }
     FechaContabilizacion: TDateTime;
     procedure BusquedaCompleja(SoloPendientes: boolean; Serie: string);
     procedure ImprimeFacturas(Sender: TForm; aTipo: byte; ForzarCopias: boolean; Copias: integer; EnviarSegunConfiguracion: boolean; Carpeta: string = ''; MarcarListado: boolean = True);
     procedure MarcaTodas(Sender: TForm);
     procedure MarcaHasta(Sender: TForm);
     procedure Filtra(Maestro: TDataSet);
     procedure MarcaSesion(Sender: TForm; Contador: integer);
     procedure CambiarSeleccion(SoloPendientes: boolean; Desde, Hasta: integer; Serie: string);
     procedure Refrescar;
  end;

var
  DMImprimeFacturas : TDMImprimeFacturas;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFBusca, UFMImprimeFacturas, UDMLstFactura, UFormGest,
  UDMListados, UParam, UFParada, IdGlobalProtocols;

{$R *.DFM}

procedure TDMImprimeFacturas.DMImprimeFacturasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  CalculaEmail := True;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMImprimeFacturas.Filtra(Maestro: TDataSet);
begin
  with QMFacturas do
  begin
     if Active then
        Close;
     Params.ByName['EMPRESA'].AsInteger := Maestro.FieldByName('EMPRESA').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := Maestro.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := Maestro.FieldByName('CANAL').AsInteger;
     Open;
  end;
end;

procedure TDMImprimeFacturas.ImprimeFacturas(Sender: TForm; aTipo: byte; ForzarCopias: boolean; Copias: integer; EnviarSegunConfiguracion: boolean; Carpeta: string = ''; MarcarListado: boolean = True);
var
  Q : THYFIBQuery;
  Listado, Grupo, Cabecera : integer;
  TipoListado : string;
  Memo : TStrings;
  Asunto : string;
  Errores, CuerpoMail : TStrings;
  Tipo : byte;
  CarpetaForzada : string;
begin
  Listado := REntorno.Formato;
  Grupo := REntorno.Grupo;
  Cabecera := REntorno.Cabecera;
  TipoListado := REntorno.TipoListado;
  if (not ForzarCopias) then
     Copias := REntorno.Copias;

  // aTipo
  //    0 - FRF/FR3
  //    1 - Matricial
  //    2 - Correo matricial
  //    3 - Correo PDF
  //    4 - Guardar en PDF

  if (aTipo >= 5) then
  begin
     if ((TipoListado = 'FRF') or (TipoListado = 'FR3')) then
        aTipo := 0
     else
        aTipo := 1;
  end;

  CalculaEmail := False;
  Errores := TStringList.Create;
  try
     QMFacturas.Open;
     QMFacturas.First;
     QMFacturas.DisableControls;
     repeat
        REntorno.Formato := Listado;
        REntorno.Grupo := Grupo;
        REntorno.Copias := Copias;
        REntorno.Cabecera := Cabecera;
        REntorno.TipoListado := TipoListado;
        if TFMImprimeFacturas(Sender).Seleccionado then
        begin
           QMFacturas.EnableControls;
           if ((QMFacturasESTADO.AsInteger = 0) and (LeeParametro('FACIMPR001', QMFacturasSERIE.AsString) = 'S')) then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_CIERRA2(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :FECHA, :ENTRADA, :ID_S)';
                    Params.ByName['EMPRESA'].AsInteger := QMFacturasEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMFacturasEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMFacturasCANAL.AsInteger;
                    Params.ByName['SERIE'].AsString := QMFacturasSERIE.AsString;
                    Params.ByName['RIG'].AsInteger := QMFacturasRIG.AsInteger;
                    Params.ByName['FECHA'].AsDateTime := FechaContabilizacion;
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['ID_S'].AsInteger := QMFacturasID_S.AsInteger;
                    TFParada.Create(Self).ExecQuery(Q);
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;

           AbreData(TDMLstFactura, DMLstFactura);

           if (Carpeta = '\') then
              Carpeta := '';

           if (Carpeta > '') then
           begin
              // Carpeta Forzara es la carpeta + Nombre de Agente/Cliente
              // Es una carpeta donde quedarán copias del documento en formato PDF.

              { TODO : Agregar parametrizacion para CONVA }
              if (True) then
                 CarpetaForzada := LimpiaCadena(DameTituloAgente(QMFacturasAGENTE.AsInteger))
              else
                 CarpetaForzada := LimpiaCadena(DameTituloCliente(QMFacturasCLIENTE.AsInteger));

              CarpetaForzada := StringReplace(CarpetaForzada, '.', '_', [rfReplaceAll]);
              CarpetaForzada := StringReplace(CarpetaForzada, ',', '_', [rfReplaceAll]);
              CarpetaForzada := StringReplace(CarpetaForzada, '-', '_', [rfReplaceAll]);
              CarpetaForzada := StringReplace(CarpetaForzada, '/', '_', [rfReplaceAll]);
              CarpetaForzada := StringReplace(CarpetaForzada, ' ', '_', [rfReplaceAll]);

              CarpetaForzada := Trim(CarpetaForzada);
              CarpetaForzada := IncludeTrailingPathDelimiter(Carpeta + CarpetaForzada);
              if (not DirectoryExists(CarpetaForzada)) then
                 if not CreateDir(CarpetaForzada) then
                    raise Exception.Create(Format(_('Imposible crear %'), [CarpetaForzada]));

              DMLstFactura.ForzarGuardado(CarpetaForzada);
           end;

           Tipo := aTipo;

           if (not EnviarSegunConfiguracion) then
              Tipo := aTipo
           else
           begin
              // Verifico si en el canal se desea enviar por email las facturas
              if ((REntorno.Canal = 1) or (LeeParametro('LSTFAC0001', QMFacturasSERIE.AsString) = 'S')) then
              begin
                 // Verifico si el cliente quiere las facturas enviadas por email
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT FACTURAS_POR_EMAIL_KRI FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['CLIENTE'].AsInteger := QMFacturasCLIENTE.AsInteger;
                       ExecQuery;
                       // Si van por email Tipo = 3, de lo contrario, como se haya pedido
                       if (FieldByName['FACTURAS_POR_EMAIL_KRI'].AsInteger = 1) then
                          Tipo := 3
                       else
                          Tipo := aTipo;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
           end;

           case Tipo of
              0:
              begin
                 ShowCursor(False);
                 try
                    DMLstFactura.MostrarListado(QMFacturasID_S.AsInteger,
                       QMFacturasRIG.AsInteger, QMFacturasSERIE.AsString,
                       1, 1, QMFacturasEJERCICIO.AsInteger, ForzarCopias, Copias, MarcarListado);
                 finally
                    ShowCursor(True);
                 end;
              end;
              1:
              begin
                 ShowCursor(False);
                 try
                    DMLstFactura.MostrarListadoMatricialDirecta(QMFacturasID_S.AsInteger,
                       QMFacturasRIG.AsInteger, QMFacturasSERIE.AsString,
                       1, QMFacturasEJERCICIO.AsInteger, ForzarCopias, Copias);
                 finally
                    ShowCursor(True);
                 end;
              end;
              2:
              begin
                 // Esto ya lleva algo de faena
                 Memo := TStringList.Create;
                 try
                    DMLstFactura.MostrarListadoMail(QMFacturasID_S.AsInteger, QMFacturasSERIE.AsString,
                       1, QMFacturasEJERCICIO.AsInteger, Memo, MarcarListado);

                    InicializaVariableEmail(QMFacturas.FieldByName('TIPO').AsString);
                    with VariableEmail do
                    begin
                       Ejercicio := QMFacturas.FieldByName('EJERCICIO').AsInteger;
                       Serie := QMFacturas.FieldByName('SERIE').AsString;
                       NumeroDocumento := QMFacturas.FieldByName('RIG').AsInteger;
                       Fecha := QMFacturas.FieldByName('FECHA').AsDateTime;
                       SuReferencia := QMFacturas.FieldByName('SU_REFERENCIA').AsString;
                       SuPedido := QMFacturas.FieldByName('PEDIDO_CLIENTE').AsString;
                       Folio := IntToStr(QMFacturas.FieldByName('FOLIO').AsInteger);
                       TituloDocTributario := DameTituloTipoDocTributario(QMFacturas.FieldByName('TIPO_DOC_TRIBUTARIO').AsString);
                       NombreFichero := DMLstFactura.nombreFich;
                       Matricula := DMMain.DameMatriculaFichaTecnica(QMFacturas.FieldByName('ID_FICHA_TECNICA').AsInteger);

                       if (QMFacturasCLIENTE.AsInteger > 0) then
                       begin
                          NombreComercial := QMFacturasNOMBRE_COMERCIAL.AsString;
                          RazonSocial := QMFacturasTITULO.AsString;
                       end
                       else
                       begin
                          NombreComercial := DameNombreTercerosVarios(QMFacturas.FieldByName('TIPO').AsString, QMFacturas.FieldByName('ID_TICKET').AsInteger);
                          RazonSocial := NombreComercial;
                       end;
                       OrdenTrabajo := 0;
                       UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(REntorno.Entrada));
                    end;

                    DamePartesEmail(Asunto, CuerpoMail);
                    try
                       // DMListados ya está creado cuando se crea DMLstFacturas
                       // AbreData(TDMListados, DMListados);
                       // try
                       try
                          DMListados.SendMailCliente(QMFacturasCLIENTE.AsInteger, Memo, Asunto, DMMain.DameCorreoCopiaAgente(QMFacturasAGENTE.AsInteger, 'FAC'));
                       except
                          on E: Exception do
                          begin
                             DMMain.Log(format('DMImprimeFacturas.ImprimeFacturas().SendMailCliente() - Error enviando correo electronico. (%d-%s/%d)', [QMFacturas.FieldByName('EJERCICIO').AsInteger, QMFacturas.FieldByName('SERIE').AsString, QMFacturas.FieldByName('RIG').AsInteger]));
                             DMMain.Log(E.Message);
                             Errores.Add(format('Error enviando correo electronico. (FAC %d-%s/%d)', [QMFacturas.FieldByName('EJERCICIO').AsInteger, QMFacturas.FieldByName('SERIE').AsString, QMFacturas.FieldByName('RIG').AsInteger]) + #13#10 + E.Message);
                          end;
                       end;
                       // finally
                       //    CierraData(DMListados);
                       // end;
                    finally
                       FreeAndNil(CuerpoMail);
                    end;
                 finally
                    Memo.Free;
                 end;
              end;
              3:
              begin
                 Memo := TStringList.Create;
                 try
                    DMLstFactura.MostrarListadoMail(QMFacturasID_S.AsInteger, QMFacturasSERIE.AsString,
                       2, QMFacturasEJERCICIO.AsInteger, Memo, MarcarListado);

                    if (ExtractFileName(DMLstFactura.rutaFich) = LimpiaNombreFichero(format('%s_%d-%s-%.5d.pdf', [_('Factura'), QMFacturas.FieldByName('EJERCICIO').AsInteger, QMFacturas.FieldByName('SERIE').AsString, QMFacturas.FieldByName('RIG').AsInteger]))) then
                    begin
                       if (ExtractFileName(DMLstFactura.rutaFich) = DMLstFactura.nombreFich) then
                       begin
                          InicializaVariableEmail(QMFacturas.FieldByName('TIPO').AsString);
                          with VariableEmail do
                          begin
                             Ejercicio := QMFacturas.FieldByName('EJERCICIO').AsInteger;
                             Serie := QMFacturas.FieldByName('SERIE').AsString;
                             NumeroDocumento := QMFacturas.FieldByName('RIG').AsInteger;
                             Fecha := QMFacturas.FieldByName('FECHA').AsDateTime;
                             SuReferencia := QMFacturas.FieldByName('SU_REFERENCIA').AsString;
                             SuPedido := QMFacturas.FieldByName('PEDIDO_CLIENTE').AsString;
                             Folio := IntToStr(QMFacturas.FieldByName('FOLIO').AsInteger);
                             TituloDocTributario := DameTituloTipoDocTributario(QMFacturas.FieldByName('TIPO_DOC_TRIBUTARIO').AsString);
                             NombreFichero := DMLstFactura.nombreFich;
                             Matricula := DMMain.DameMatriculaFichaTecnica(QMFacturas.FieldByName('ID_FICHA_TECNICA').AsInteger);

                             if (QMFacturasCLIENTE.AsInteger <> -1) then
                             begin
                                NombreComercial := QMFacturas.FieldByName('NOMBRE_COMERCIAL').AsString;
                                RazonSocial := QMFacturas.FieldByName('TITULO').AsString;
                             end
                             else
                             begin
                                NombreComercial := DameNombreTercerosVarios(QMFacturas.FieldByName('TIPO').AsString, QMFacturas.FieldByName('ID_S').AsInteger);
                                RazonSocial := NombreComercial;
                             end;
                             OrdenTrabajo := 0;
                             UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(REntorno.Empresa));
                          end;
                          DamePartesEmail(Asunto, CuerpoMail);
                          try
                             // DMListados ya está creado cuando se crea DMLstFacturas
                             // AbreData(TDMListados, DMListados);
                             // try
                             // Envia el correo
                             try
                                DMListados.SendMailClientePDF(QMFacturasCLIENTE.AsInteger, CuerpoMail, DMLstFactura.rutaFich,
                                   DMLstFactura.nombreFich, Asunto, QMFacturasTIPO.AsString, QMFacturasID_S.AsInteger, False, DMMain.DameCorreoCopiaAgente(QMFacturasAGENTE.AsInteger, 'FAC'));

                                // Si llega aqui el envio ha sido correcto. Marco el documento como impreso
                                DMLstFactura.UpdateaDocumentos;
                             except
                                on E: Exception do
                                begin
                                   DMMain.Log(format('DMImprimeFacturas.ImprimeFacturas().SendMailClientePDF() - Error enviando correo electronico. (%d-%s/%d)', [QMFacturas.FieldByName('EJERCICIO').AsInteger, QMFacturas.FieldByName('SERIE').AsString, QMFacturas.FieldByName('RIG').AsInteger]));
                                   DMMain.Log(E.Message);
                                   Errores.Add(format('Error enviando correo electronico. (FAC %d-%s/%d)', [QMFacturas.FieldByName('EJERCICIO').AsInteger, QMFacturas.FieldByName('SERIE').AsString, QMFacturas.FieldByName('RIG').AsInteger]) + #13#10 + E.Message);
                                end;
                             end;
                             // finally
                             //    CierraData(DMListados);
                             // end;
                          finally
                             FreeAndNil(CuerpoMail);
                          end;
                       end
                       else
                       begin
                          ShowMessage(format(_('Error enviando fichero adjunto (1)' + #13#10 + 'Subject: %s' + #13#10 + 'Fichero: %s' + #13#10 + 'Ubicacion: %s'), [Asunto, DMLstFactura.nombreFich, DMLstFactura.rutaFich]));
                       end;
                    end
                    else
                    begin
                       ShowMessage(format(_('Error enviando fichero adjunto (2)' + #13#10 + 'Subject: %s' + #13#10 + 'Fichero: %s' + #13#10 + 'Ubicacion: %s'), [Asunto, DMLstFactura.nombreFich, DMLstFactura.rutaFich]));
                    end;
                 finally
                    Memo.Free;
                 end;
              end;
              4:
              begin
                 Memo := TStringList.Create;
                 try
                    try
                       DMLstFactura.MostrarListadoMail(QMFacturasID_S.AsInteger, QMFacturasSERIE.AsString, 2, QMFacturasEJERCICIO.AsInteger, Memo, MarcarListado);
                    except
                       on E: Exception do
                       begin
                          DMMain.Log(format('DMImprimeFacturas.ImprimeFacturas().MostrarListadoMail() - Error enviando correo electronico. (%d-%s/%d)', [QMFacturas.FieldByName('EJERCICIO').AsInteger, QMFacturas.FieldByName('SERIE').AsString, QMFacturas.FieldByName('RIG').AsInteger]));
                          DMMain.Log(E.Message);
                          Errores.Add(format('Error enviando correo electronico. (FAC %d-%s/%d)', [QMFacturas.FieldByName('EJERCICIO').AsInteger, QMFacturas.FieldByName('SERIE').AsString, QMFacturas.FieldByName('RIG').AsInteger]) + #13#10 + E.Message);
                       end;
                    end;

                    CarpetaForzada := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True));
                    CarpetaForzada := IncludeTrailingPathDelimiter(CarpetaForzada + _('Facturas'));
                    if (not DirectoryExists(CarpetaForzada)) then
                       if not CreateDir(CarpetaForzada) then
                          raise Exception.Create(Format(_('Imposible crear %'), [CarpetaForzada]));

                    if not CopyFileTo(DameTempPath + DMLstFactura.nombreFich, CarpetaForzada + ExtractFileName(DMLstFactura.nombreFich)) then
                       ShowMessage(format(_('No se pudo generar el fichero %s'), [CarpetaForzada + ExtractFileName(DMLstFactura.nombreFich)]));
                 finally
                    Memo.Free;
                 end;
              end;
           end;

           CierraData(DMLstFactura);
           QMFacturas.DisableControls;
        end;

        QMFacturas.Next;
     until QMFacturas.EOF;

     QMFacturas.First;

     if Errores.Count > 0 then
        ShowMessage(Errores.Text);
  finally
     QMFacturas.EnableControls;
     CalculaEmail := True;
     Errores.Free;
  end;

  Refrescar;
end;

procedure TDMImprimeFacturas.MarcaTodas(Sender: TForm);
var
  IdS : integer;
begin
  IdS := QMFacturasID_S.AsInteger;

  with QMFacturas do
  begin
     try
        DisableControls;
        First;
        repeat
           TFMImprimeFacturas(Sender).Marca;
           Next;
        until EOF;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMFacturas, 'ID_S', IdS);
end;

procedure TDMImprimeFacturas.MarcaHasta(Sender: TForm);
var
  IdS : integer;
begin
  IdS := QMFacturasID_S.AsInteger;

  with QMFacturas do
  begin
     DisableControls;
     try
        while not (TFMImprimeFacturas(Sender).DBGFacturas.SelectedRows.CurrentRowSelected) do
        begin
           TFMImprimeFacturas(Sender).Marca;
           Prior;
        end;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMFacturas, 'ID_S', IdS);
end;

procedure TDMImprimeFacturas.BusquedaCompleja(SoloPendientes: boolean; Serie: string);
var
  Orden : string;
begin
  with QMFacturas do
  begin
     Close;
     if TFBusca.Create(Self).SeleccionaBusqueda(QMFacturas, '11100', False) = mrOk then
     begin
        Orden := OrdenadoPor;
        Ordenar('');
        if SelectSQL.Count <> 0 then
        begin
           SelectSQL.Add(' AND TIPO = ''FAC'' ');
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

procedure TDMImprimeFacturas.QMFacturasTOTAL_A_COBRARGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if CalculaEmail then
     Text := FormatFloat(DMMain.MascaraMoneda(QMFacturasMONEDA.AsString, 1),
        QMFacturasTOTAL_A_COBRAR.AsFloat);
end;

procedure TDMImprimeFacturas.MarcaSesion(Sender: TForm; Contador: integer);
var
  IdS : integer;
begin
  IdS := QMFacturasID_S.AsInteger;

  with QMFacturas do
  begin
     DisableControls;
     try
        First;
        repeat
           if (FieldByName('PROCESO_AUTO').AsInteger = Contador) then
              TFMImprimeFacturas(Sender).Marca;
           Next;
        until EOF;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMFacturas, 'ID_S', IdS);
end;

procedure TDMImprimeFacturas.Refrescar;
begin
  UUtiles.Refrescar(QMFacturas, 'ID_S', 0, False, True);
end;

procedure TDMImprimeFacturas.CambiarSeleccion(SoloPendientes: boolean; Desde, Hasta: integer; Serie: string);
begin
  with QMFacturas do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * ');
        Add(' FROM  VER_CABECERAS_FACTURA ');
        Add(' WHERE  ');
        Add(' EMPRESA = ?EMPRESA AND ');
        Add(' EJERCICIO = ?EJERCICIO AND ');
        Add(' CANAL = ?CANAL AND ');
        Add(' TIPO = ''FAC'' AND ');
        Add(' ESTADO >= ?ESTADOD AND ');
        Add(' ESTADO <= ?ESTADOH ');
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

     // FACIMPR002=S no muestra las abiertas
     if (LeeParametro('FACIMPR002', Serie) = 'S') then
        Params.ByName['ESTADOD'].AsInteger := 0
     else
        Params.ByName['ESTADOD'].AsInteger := 5;

     // FACIMPR003=S no muestra las autofacturas
     if (LeeParametro('FACIMPR003', Serie) = 'S') then
        Params.ByName['ESTADOH'].AsInteger := 6
     else
        Params.ByName['ESTADOH'].AsInteger := 5;

     Open;
  end;
end;

procedure TDMImprimeFacturas.QMFacturasCalcFields(DataSet: TDataSet);
begin
  if CalculaEmail then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST(1) EMAIL ');
           SQL.Add(' FROM L_DAME_EMAIL_TERCERO_TIPO(:TERCERO, :TIPO) ');
           Params.ByName['TERCERO'].AsInteger := QMFacturasTERCERO.AsInteger;
           Params.ByName['TIPO'].AsString := 'FAC';
           ExecQuery;
           QMFacturasEMAIL.AsString := FieldByName['EMAIL'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMImprimeFacturas.QMFacturasTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if CalculaEmail then
     Text := DameTituloEstado(QMFacturasESTADO.AsInteger);
end;

end.
