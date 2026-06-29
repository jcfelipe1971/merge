unit UDMUsuariosMensajes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBTableDataSet, frxClass, frxHYReport, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet, HYFIBQuery, Controls, Dialogs;

type
  TDMUsuariosMensajes = class(TDataModule)
     QMUsuariosMensajes: TFIBTableSet;
     TLocal: THYTransaction;
     xUsuario: TFIBDataSetRO;
     xUsuarioFin: TFIBDataSetRO;
     xTercero: TFIBDataSetRO;
     DSUsuario: TDataSource;
     DSUsuarioFin: TDataSource;
     DSTercero: TDataSource;
     DSQMUsuariosMensajes: TDataSource;
     xUsuarioNOMBRE: TFIBStringField;
     xUsuarioFinNOMBRE: TFIBStringField;
     xTerceroNOMBRE_R_SOCIAL: TFIBStringField;
     QMUsuariosMensajesAVISO: TIntegerField;
     QMUsuariosMensajesUSUARIO: TIntegerField;
     QMUsuariosMensajesTERCERO: TIntegerField;
     QMUsuariosMensajesFECHA_RESPUESTA: TDateTimeField;
     QMUsuariosMensajesURGENTE: TIntegerField;
     QMUsuariosMensajesACTIVO: TIntegerField;
     QMUsuariosMensajesMENSAJE: TBlobField;
     QMUsuariosMensajesFECHA_VAL: TDateTimeField;
     QMUsuariosMensajesRESULTADO: TBlobField;
     QMUsuariosMensajesFECHA_INI: TDateTimeField;
     TUpdate: THYTransaction;
     DSxAvisoImpresion: TDataSource;
     xAvisoImpresion: TFIBTableSet;
     frListado: TfrHYReport;
     frDBxAvisoImpresion: TfrDBDataSet;
     frxListado: TfrxHYReport;
     QMUsuariosMensajesNOMBRE_USUARIO: TFIBStringField;
     QMUsuariosMensajesTITULO_TERCERO: TFIBStringField;
     QMUsuariosMensajesDest: TFIBTableSet;
     DSQMUsuariosMensajesDest: TDataSource;
     QMUsuariosMensajesDestAVISO: TIntegerField;
     QMUsuariosMensajesDestUSUARIO: TIntegerField;
     QMUsuariosMensajesDestACTIVO: TIntegerField;
     QMUsuariosMensajesDestNOMBRE_USUARIO: TStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMUsuariosMensajesUSUARIOChange(Sender: TField);
     procedure QMUsuariosMensajesTERCEROChange(Sender: TField);
     procedure QMUsuariosMensajesAfterDelete(DataSet: TDataSet);
     procedure QMUsuariosMensajesAfterPost(DataSet: TDataSet);
     procedure QMUsuariosMensajesNewRecord(DataSet: TDataSet);
     procedure QMUsuariosMensajesBeforePost(DataSet: TDataSet);
     procedure QMUsuariosMensajesAfterOpen(DataSet: TDataSet);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
     procedure frxListadoGetValue(const VarName: string; var Value: variant);
     procedure frListadoBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxListadoBeforePrint(Sender: TfrxReportComponent);
     procedure QMUsuariosMensajesBeforeDelete(DataSet: TDataSet);
     procedure QMUsuariosMensajesDestAfterOpen(DataSet: TDataSet);
     procedure QMUsuariosMensajesDestBeforeClose(DataSet: TDataSet);
     procedure QMUsuariosMensajesDestNOMBRE_USUARIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMUsuariosMensajesAfterScroll(DataSet: TDataSet);
     procedure QMUsuariosMensajesBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     ActualizandoAviso: boolean;
     SoloPendientes: boolean;
     procedure MarcaDestinatario;
  public
     { Public declarations }
     function BusquedaCompleja: integer;
     procedure AvisosDeInicio;
     procedure MostrarListado(FechaDe, FechaHasta: TDateTime; RecibidoUsuarioDesde, RecibidoUsuarioHasta, EnviadodoUsuarioDesde, EnviadodoUsuarioHasta: integer; Activos: boolean; Modo: integer);
     procedure DameMinMaxUsuario(var min, max: integer);
     procedure Refrescar(aSoloPendientes: boolean);
     procedure ActualizaUltimoAvisoMostrado;
     procedure DesmarcarActivo;
  end;

var
  DMUsuariosMensajes : TDMUsuariosMensajes;

implementation

uses UDMMain, UEntorno, UFormGest, UFBusca, UUtiles, UDMListados, UFMUsuariosMensajes, UDameDato;

{$R *.dfm}

procedure TDMUsuariosMensajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  ActualizandoAviso := False;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesUSUARIOChange(Sender: TField);
begin
  with xUsuario do
  begin
     Close;
     Open;
  end;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesTERCEROChange(Sender: TField);
begin
  with xTercero do
  begin
     Close;
     Open;
  end;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesAfterDelete(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesAfterPost(DataSet: TDataSet);
var
  Lista : TStrings;
  ExisteUsuario, Marcado : boolean;
  i, Usuario : integer;
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  Lista := TStringList.Create;

  FMUsuariosMensajes.RellenaUsuariosMarcados(Lista);
  try
     for i := 0 to Lista.Count - 1 do
     begin
        Usuario := StrToInt(Copy(Lista[i], 1, Pos('-', Lista[i]) - 1));
        Marcado := (Copy(Lista[i], Pos('-', Lista[i]) + 1, Length(Lista[i])) = '1');
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT USUARIO FROM SYS_USUARIOS_MENSAJES_DEST WHERE AVISO = ?AVISO AND USUARIO = ?USUARIO';
              Params.ByName['AVISO'].AsInteger := QMUsuariosMensajesAVISO.AsInteger;
              Params.ByName['USUARIO'].AsInteger := Usuario;
              ExecQuery;
              ExisteUsuario := (FieldByName['USUARIO'].AsInteger <> 0);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Marcado and (not ExisteUsuario)) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'INSERT INTO SYS_USUARIOS_MENSAJES_DEST (AVISO, USUARIO, ACTIVO) VALUES (?AVISO, ?USUARIO, 1)';
                 Params.ByName['AVISO'].AsInteger := QMUsuariosMensajesAVISO.AsInteger;
                 Params.ByName['USUARIO'].AsInteger := Usuario;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
        if ((not Marcado) and ExisteUsuario) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'DELETE FROM SYS_USUARIOS_MENSAJES_DEST WHERE AVISO = ?AVISO AND USUARIO = ?USUARIO';
                 Params.ByName['AVISO'].AsInteger := QMUsuariosMensajesAVISO.AsInteger;
                 Params.ByName['USUARIO'].AsInteger := Usuario;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  finally
     Lista.Free;
  end;

  QMUsuariosMensajesDest.Close;
  QMUsuariosMensajesDest.Open;

  ActualizaUltimoAvisoMostrado;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesNewRecord(DataSet: TDataSet);
begin
  QMUsuariosMensajesURGENTE.AsInteger := 0;
  QMUsuariosMensajesACTIVO.AsInteger := 1;
  QMUsuariosMensajesTERCERO.AsInteger := -1;
  QMUsuariosMensajesUSUARIO.AsInteger := REntorno.Usuario;
  QMUsuariosMensajesFECHA_RESPUESTA.AsDateTime := REntorno.FechaTrabSH;
  QMUsuariosMensajesFECHA_VAL.AsDateTime := REntorno.FechaTrabSH;
  QMUsuariosMensajesFECHA_INI.AsDateTime := REntorno.FechaTrabSH;
end;

function TDMUsuariosMensajes.BusquedaCompleja: integer;
var
  POrden, PFiltro : integer;
  Orden : string;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMUsuariosMensajes, '00000', False);

  if (Result in [mrAll]) then
  begin
     with QMUsuariosMensajes do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_USUARIOS_MENSAJES ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' /*ACTIVO=1 AND */ ');
        SelectSQL.Add(' FECHA_VAL <= :FECHA AND ');
        SelectSQL.Add(' ((USUARIO = :USUARIO) OR (AVISO IN (SELECT AVISO ');
        SelectSQL.Add('                                 FROM SYS_USUARIOS_MENSAJES_DEST ');
        SelectSQL.Add('                                 WHERE ');
        SelectSQL.Add('                                 USUARIO = :USUARIO))) ');
        SelectSQL.Add(' ORDER BY ACTIVO DESC, URGENTE DESC,FECHA_VAL DESC, AVISO DESC ');
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        Open;
     end;
  end
  else
  begin
     with QMUsuariosMensajes do
     begin
        Close;
        Orden := OrdenadoPor;
        PFiltro := Pos('WHERE', UpperCase(SelectSQL.Text));
        POrden := Pos('ORDER', UpperCase(SelectSQL.Text));
        if (POrden = 0) then
           POrden := Length(SelectSQL.Text);

        if (PFiltro > 0) then
        begin
           SelectSQL.Text := 'SELECT * FROM VER_USUARIOS_MENSAJES ' +
              Copy(UpperCase(SelectSQL.Text), PFiltro, POrden - PFiltro) +
              ' AND ';
        end
        else
        begin
           SelectSQL.Text := 'SELECT * FROM VER_USUARIOS_MENSAJES WHERE ';
        end;

        SelectSQL.Add(' ( ');
        SelectSQL.Add(' /*ACTIVO=1 AND */ ');
        SelectSQL.Add(' FECHA_VAL <= :FECHA AND ');
        SelectSQL.Add(' ((USUARIO = :USUARIO) OR (AVISO IN (SELECT AVISO ');
        SelectSQL.Add('                                 FROM SYS_USUARIOS_MENSAJES_DEST ');
        SelectSQL.Add('                                 WHERE ');
        SelectSQL.Add('                                 USUARIO = :USUARIO))) ');
        SelectSQL.Add(' ) ');


        Ordenar(Orden);
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        Open;
     end;
  end;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
     DMMain.Contador_Gen(DataSet, 'CONTA_USUARIOS_MENSAJES', 'AVISO');
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesAfterOpen(DataSet: TDataSet);
begin
  xUsuario.Open;
  xTercero.Open;
  QMUsuariosMensajesDest.Open;
end;

procedure TDMUsuariosMensajes.AvisosDeInicio;
begin
  with QMUsuariosMensajes do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_USUARIOS_MENSAJES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ACTIVO = 1 AND ');
     SelectSQL.Add(' FECHA_VAL <= :FECHA AND ');
     SelectSQL.Add(' ((USUARIO = :USUARIO) OR (AVISO IN (SELECT AVISO ');
     SelectSQL.Add('                                 FROM SYS_USUARIOS_MENSAJES_DEST ');
     SelectSQL.Add('                                 WHERE ');
     SelectSQL.Add('                                 USUARIO = :USUARIO))) ');
     SelectSQL.Add(' ORDER BY ACTIVO DESC, URGENTE DESC,FECHA_VAL DESC, AVISO DESC ');
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
     Open;
  end;
end;

procedure TDMUsuariosMensajes.MostrarListado(FechaDe, FechaHasta: TDateTime; RecibidoUsuarioDesde, RecibidoUsuarioHasta, EnviadodoUsuarioDesde, EnviadodoUsuarioHasta: integer; Activos: boolean; Modo: integer);
var
  Str : string;
begin
  AbreData(TDMListados, DMListados);
  with xAvisoImpresion do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_USUARIOS_MENSAJES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' FECHA_VAL >= :FECHA_DESDE AND ');
     SelectSQL.Add(' FECHA_VAL <= :FECHA_HASTA AND ');
     SelectSQL.Add(' USUARIO >= :USUARIO_RECIBIDO_DESDE AND ');
     SelectSQL.Add(' USUARIO <= :USUARIO_RECIBIDO_HASTA AND ');
     SelectSQL.Add(' (AVISO IN (SELECT AVISO ');
     SelectSQL.Add('            FROM SYS_USUARIOS_MENSAJES_DEST ');
     SelectSQL.Add('            WHERE ');
     SelectSQL.Add('            USUARIO BETWEEN :USUARIO_ENVIADO_DESDE AND :USUARIO_ENVIARO_HASTA )) AND ');
     SelectSQL.Add(' ((USUARIO = :USUARIO) OR (AVISO IN (SELECT AVISO ');
     SelectSQL.Add('                                     FROM SYS_USUARIOS_MENSAJES_DEST ');
     SelectSQL.Add('                                     WHERE ');
     SelectSQL.Add('                                     USUARIO = :USUARIO))) AND ');
     SelectSQL.Add(' ACTIVO >= ?ACTIVO ');
     SelectSQL.Add(' ORDER BY ACTIVO DESC,URGENTE DESC,FECHA_VAL DESC, AVISO DESC ');

     Params.ByName['FECHA_DESDE'].AsDateTime := Trunc(FechaDe);
     Params.ByName['FECHA_HASTA'].AsDateTime := Trunc(FechaHasta) + 0.99999;
     Params.ByName['USUARIO_RECIBIDO_DESDE'].AsInteger := RecibidoUsuarioDesde;
     Params.ByName['USUARIO_RECIBIDO_HASTA'].AsInteger := RecibidoUsuarioHasta;
     Params.ByName['USUARIO_ENVIADO_DESDE'].AsInteger := EnviadodoUsuarioDesde;
     Params.ByName['USUARIO_ENVIARO_HASTA'].AsInteger := EnviadodoUsuarioHasta;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     if Activos then
        Params.ByName['ACTIVO'].AsInteger := 1
     else
        Params.ByName['ACTIVO'].AsInteger := 0;
     Open;
  end;

  DMListados.Cargar(2007, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frListado.LoadFromFIB(REntorno.Formato, str);
     frListado.PrepareReport;
     case Modo of
        0: frListado.ShowPreparedReport;
        1: frListado.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxListado.LoadFromFIB(REntorno.Formato, str);
     frxListado.PrepareReport;
     case Modo of
        0: frxListado.ShowPreparedReport;
        1: frxListado.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;

  xAvisoImpresion.Close;

  CierraData(DMListados);
end;

procedure TDMUsuariosMensajes.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
  if ParName = 'NombreUsuario' then
     ParValue := DameTituloUsuario(xAvisoImpresion.FieldByName('USUARIO').AsInteger);
  if ParName = 'NombreUsuarioFin' then
     ParValue := DameTituloUsuario(xAvisoImpresion.FieldByName('USUARIO_FIN').AsInteger);
end;

procedure TDMUsuariosMensajes.frxListadoGetValue(const VarName: string; var Value: variant);
begin
  frListadoGetValue(VarName, Value);
end;

procedure TDMUsuariosMensajes.frListadoBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMUsuariosMensajes.frxListadoBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMUsuariosMensajes.DameMinMaxUsuario(var min, max: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(USUARIO), MAX(USUARIO) FROM SYS_USUARIOS';
        ExecQuery;
        min := FieldByName['MIN'].AsInteger;
        max := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMUsuariosMensajes.ActualizaUltimoAvisoMostrado;
//var
//Aviso : integer;
begin
  {
  ActualizandoAviso := True;
  try
     with QMUsuariosMensajes do
     begin
        // Guardo el aviso para reposicionarme luego
        Aviso := QMUsuariosMensajesAVISO.AsInteger;

        // Busco el aviso mas grande mostrado
        DisableControls;
        try
           First;
           while (not EOF) do
           begin
              if (DMMain.UltimoAvisoMostrado < QMUsuariosMensajesAVISO.AsInteger) then
                 DMMain.UltimoAvisoMostrado := QMUsuariosMensajesAVISO.AsInteger;
              Next;
           end;

           // Vuelvo a posicionarme donde estaba
           First;
           while ((not EOF) and (Aviso <> QMUsuariosMensajesAVISO.AsInteger)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  finally
     ActualizandoAviso := False;
  end;
  }
end;

procedure TDMUsuariosMensajes.Refrescar(aSoloPendientes: boolean);
begin
  SoloPendientes := aSoloPendientes;
  with QMUsuariosMensajes do
  begin
     Close;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
     Params.ByName['SOLO_PENDIENTES'].AsInteger := BoolToInt(SoloPendientes);
     Open;
  end;

  ActualizaUltimoAvisoMostrado;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesBeforeDelete(DataSet: TDataSet);
begin
  if QMUsuariosMensajesUsuario.AsInteger <> REntorno.Usuario then
  begin
     ShowMessage(_('No se puede eliminar un mensaje de otro usuario'));
     Abort;
  end;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesDestAfterOpen(DataSet: TDataSet);
begin
  xUsuarioFin.Open;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesDestBeforeClose(DataSet: TDataSet);
begin
  xUsuarioFin.Close;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesDestNOMBRE_USUARIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMUsuariosMensajesDest.Active) then
     Text := DameNombreCorreoUsuario(QMUsuariosMensajesDestUSUARIO.AsInteger);
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesAfterScroll(DataSet: TDataSet);
begin
  MarcaDestinatario;

  if (DMMain.UltimoAvisoMostrado < QMUsuariosMensajesAVISO.AsInteger) then
     DMMain.UltimoAvisoMostrado := QMUsuariosMensajesAVISO.AsInteger;
end;

procedure TDMUsuariosMensajes.MarcaDestinatario;
begin
  if not ActualizandoAviso then
  begin
     FMUsuariosMensajes.InicializaListaDestinatarios;
     with QMUsuariosMensajesDest do
     begin
        if Active then
        begin
           First;
           while not EOF do
           begin
              FMUsuariosMensajes.MarcaDestinatario(FieldByName('USUARIO').AsInteger);
              Next;
           end;
        end;
     end;
  end;
end;

procedure TDMUsuariosMensajes.QMUsuariosMensajesBeforeClose(DataSet: TDataSet);
begin
  xUsuario.Close;
  xTercero.Close;
  QMUsuariosMensajesDest.Close;
end;

procedure TDMUsuariosMensajes.DesmarcarActivo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE VER_USUARIOS_MENSAJES SET ACTIVO = 0 WHERE AVISO = :AVISO';
        Params.ByName['AVISO'].AsInteger := QMUsuariosMensajesAVISO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(SoloPendientes);
end;

end.
