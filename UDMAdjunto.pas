unit UDMAdjunto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, ShellApi, Forms, HYFIBQuery;

type
  TDMAdjunto = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMAdjuntos: TFIBTableSet;
     DSQMAdjuntos: TDataSource;
     QMAdjuntosEMPRESA: TIntegerField;
     QMAdjuntosTIPO: TFIBStringField;
     QMAdjuntosID: TIntegerField;
     QMAdjuntosTITULO: TFIBStringField;
     QMAdjuntosID_ADJUNTO: TIntegerField;
     QMAdjuntosTITULO_ADJUNTO: TFIBStringField;
     QMAdjuntosARCHIVO: TBlobField;
     QMAdjuntosNOMBRE: TFIBStringField;
     QMAdjuntosFECHA: TDateTimeField;
     QMAdjuntosREPOSITORIO: TIntegerField;
     QMAdjuntosDESCRIPCION_REPOSITORIO: TStringField;
     QMAdjuntosWEB: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAdjuntosNewRecord(DataSet: TDataSet);
     procedure QMAdjuntosBeforePost(DataSet: TDataSet);
     procedure QMAdjuntosBeforeInsert(DataSet: TDataSet);
     procedure QMAdjuntosBeforeEdit(DataSet: TDataSet);
     procedure QMAdjuntosDESCRIPCION_REPOSITORIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAdjuntosREPOSITORIOChange(Sender: TField);
     procedure QMAdjuntosNOMBREGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     ID: integer;
     Tipo: string;
     Tercero: integer;
     DescripcionRepositorio: array[0..3] of string[30];
     Parametro_ADJNOMB001: boolean;
     function DameTerceroID(Tipo: string; ID: integer): integer;
     function DameCaption: string;
  public
     { Public declarations }
     function Filtra(aTipo: string; aID: integer): string;
     procedure AbrirAdjunto;
     procedure GuardarComo;
     procedure EnviarAdjunto;
     procedure ImprimirAdjunto;
     procedure CambiaDestinoAdjunto(IdAdjunto, RepositorioDestino: integer);
     function DameAdjunto(Id: integer; NombreDestino: string = ''): string;
     function CreaAdjunto(aTipo: string; aID: integer; Fichero: string; Descripcion: string = ''; Repositorio: integer = -1): integer;
     procedure BorraAdjunto(Tipo: string; ID, IdAdjunto: integer);
  end;

var
  DMAdjunto : TDMAdjunto;

implementation

uses UDMMain, UEntorno, UFMain, UFSendCorreo, UDMListados, UFormGest, UUtiles, idGlobalProtocols, UParam, UDameDato;

{$R *.dfm}

{ TDMAdjunto }

procedure TDMAdjunto.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DescripcionRepositorio[0] := _('En carpeta compartida');
  DescripcionRepositorio[1] := _('En base de datos');
  DescripcionRepositorio[2] := _('En base secundaria');
  DescripcionRepositorio[3] := _('Puntero a fichero');

  Parametro_ADJNOMB001 := (LeeParametro('ADJNOMB001', '') = 'S');
end;

function TDMAdjunto.DameTerceroID(Tipo: string; ID: integer): integer;
begin
  // Si se modifica procedimiento, aplicar tambien a código web

  Result := 0;
  if (Tipo = 'AMO') then
     Result := -1
  else
  if (Tipo = 'ART') then
     Result := -1
  else
  if (Tipo = 'ASI') then
     Result := -1
  else
  if (Tipo = 'CON') then
     Result := ID
  else
  if (Tipo = 'DSP') then
     // Despiece de produccion
     Result := -1
  else
  if (Tipo = 'ESP') then
     // Escandallo de produccion
     Result := -1
  else
  if (Tipo = 'FIT') then
     Result := -1
  else
  if (Tipo = 'IPL') then
     Result := -1
  else
  if (Tipo = 'INC') then
     Result := -1
  else
  if (Tipo = 'MED') then
     Result := -1
  else
  if (Tipo = 'MOD') then
     Result := -1
  else
  if (Tipo = 'MTC') then
     Result := -1
  else
  if (Tipo = 'NOM') then
     Result := -1
  else
  if (Tipo = 'PRY') then
     // to-do
     Result := -1
  else
  if (Tipo = 'REP') then
     Result := -1
  else
  if (Tipo = 'SII') then
     Result := -1
  else
  if (Tipo = 'TER') then
     Result := ID
  else
  if (Tipo = 'PER') then
     Result := -1
  else
  if (Tipo = 'PHA') then
     Result := -1
  else
  if (Tipo = 'SIE') then
     Result := -1
  else
  if (ID <> 0) and (Tipo > ' ') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (Tipo = 'CLI') then
              SQL.Text := 'SELECT TERCERO FROM EMP_CLIENTES WHERE ID_CLIENTE=' + IntToStr(ID);
           if (Tipo = 'PRO') then
              SQL.Text := 'SELECT TERCERO FROM EMP_PROVEEDORES WHERE ID_PROVEEDOR=' + IntToStr(ID);
           if (Tipo = 'ACR') then
              SQL.Text := 'SELECT TERCERO FROM EMP_ACREEDORES WHERE ID_ACREEDOR=' + IntToStr(ID);
           if (Tipo = 'AGE') then
              SQL.Text := 'SELECT TERCERO FROM EMP_AGENTES WHERE ID_AGENTE=' + IntToStr(ID);
           if (Tipo = 'POT') then
              SQL.Text := 'SELECT TERCERO FROM EMP_CLIENTES_POTENCIALES WHERE ID_CLIENTE=' + IntToStr(ID);
           if (Tipo = 'OFC') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
           if (Tipo = 'PEC') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
           if (Tipo = 'ALB') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
           if (Tipo = 'FAC') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
           if (Tipo = 'PEP') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_PED WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'ALP') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_ALB WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'FAP') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_FAC WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'FCR') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_FCR WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'CON') then
              SQL.Text := 'SELECT TERCERO FROM CRM_CONTACTOS WHERE ID_CONTACTO=' + IntToStr(ID);
           if (Tipo = 'OFP') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_OFP WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'OCP') then
              SQL.Text := 'SELECT TERCERO FROM GES_CABECERAS_E_OCP WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'OPR') then
              // Orden de produccion
              SQL.Text := 'SELECT C.TERCERO FROM PRO_ORD P JOIN EMP_CLIENTES C ON C.EMPRESA = P.EMPRESA AND C.CLIENTE = P.CLIENTE WHERE P.ID_ORDEN =' + IntToStr(ID);
           if (Tipo = 'CUO') then
              SQL.Text := 'SELECT TERCERO FROM EMP_CLIENTES_CUOTAS WHERE ID_CUOTA =' + IntToStr(ID);
           if (Tipo = 'OPE') then
              SQL.Text := 'SELECT TERCERO FROM OPE_EMPLEADO WHERE ID_EMPLEADO =' + IntToStr(ID);
           if (Tipo = 'EMP') then
              SQL.Text := 'SELECT TERCERO FROM SYS_EMPRESAS WHERE EMPRESA =' + IntToStr(ID);
           if (Tipo = 'NOM') then
              SQL.Text := 'SELECT TERCERO FROM VER_EMP_NOMINAS_CABECERA WHERE ID =' + IntToStr(ID);
           if (Tipo = 'INC') then
              SQL.Text := 'SELECT TERCERO FROM EMP_INCIDENCIAS WHERE INCIDENCIA =' + IntToStr(ID);
           if (Tipo = 'NCO') then
              SQL.Text := 'SELECT CLI_PRO_INTE AS TERCERO FROM ISO_NO_CONFORMIDAD WHERE RIC =' + IntToStr(ID);
           if (Tipo = 'PER') then
              SQL.Text := 'SELECT TERCERO FROM VER_RH_PERSONA WHERE ID_PERSONA =' + IntToStr(ID);
           if (Tipo = 'CLP') then
              SQL.Text := 'SELECT TERCERO FROM ISO_CLAS_PROV WHERE ID_PROVEEDOR =' + IntToStr(ID);

           ExecQuery;
           Result := FieldByName['TERCERO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMAdjunto.DameCaption: string;
begin
  // Si se modifica procedimiento, aplicar tambien a código web

  Result := '';
  if (ID <> 0) and (Tipo > ' ') then
  begin
     if Tipo = 'CON' then
        Result := _('Adjunto Contacto CRM') + ' - ' + DameTituloContactoCRM(ID);
     if Tipo = 'TER' then
        Result := _('Adjunto Tercero') + ' - ' + DameTituloTercero(Tercero);
     if Tipo = 'CLI' then
        Result := _('Adjunto Cliente') + ' - ' + DameTituloTercero(Tercero);
     if Tipo = 'CLP' then
        Result := _('Adjunto Clasificiacion Prov.') + ' - ' + DameTituloTercero(Tercero);
     if Tipo = 'MED' then
        Result := _('Adjunto Medicion Equipos') + ' - ' + DameTituloTercero(Tercero);
     if Tipo = 'PRO' then
        Result := _('Adjunto Proveedor') + ' - ' + DameTituloTercero(Tercero);
     if Tipo = 'ACR' then
        Result := _('Adjunto Acreedor') + ' - ' + DameTituloTercero(Tercero);
     if Tipo = 'AGE' then
        Result := _('Adjunto Agente') + ' - ' + DameTituloTercero(Tercero);
     if Tipo = 'OPE' then
        Result := _('Adjunto Empleado') + ' - ' + DameTituloTercero(Tercero);
     if Tipo = 'NCO' then
        Result := _('Adjunto Inf. No Conformidad') + ' - ' + DameTituloTercero(Tercero);
     if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              if (Tipo = 'OFC') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Oferta') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
              if (Tipo = 'PEC') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Pedido') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
              if (Tipo = 'ALB') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Albaran') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
              if (Tipo = 'FAC') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Factura') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if ((Tipo = 'PEP') or (Tipo = 'ALP') or (Tipo = 'FAP') or (Tipo = 'FCR')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              if (Tipo = 'OFP') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Oferta Prov.') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
              if (Tipo = 'OCP') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Oferta Confirmada Prov.') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
              if (Tipo = 'PEP') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Pedido') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
              if (Tipo = 'ALP') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Albaran') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
              if (Tipo = 'FAP') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Factura') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
              if (Tipo = 'FCR') then
                 SQL.Text := 'SELECT ''' + _('Adjuntos Factura') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'AMO') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ''' + _('Adjuntos Inmovilizado') + ' - ''||ARTICULO||'' - ''||TITULO FROM CON_INMOVILIZADOS WHERE ID_INMOVILIZADO=' + IntToStr(ID);
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'ART') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ''' + _('Adjuntos Articulo') + ' - ''||ARTICULO||'' - ''||TITULO_LARGO FROM ART_ARTICULOS WHERE ID_A=' + IntToStr(ID);
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'ASI') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ''' + _('Adjuntos Asiento') + ' - '' || TITULO FROM CON_CUENTAS_ASIENTOS WHERE ID_ASIENTO=' + IntToStr(ID);
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'MOD') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ''' + _('Adjuntos Modelo') + ' - ''||REF_PROVEEDOR||'' - ''||TITULO FROM ART_ARTICULOS_MODELOS WHERE ID_A_M=' + IntToStr(ID);
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'MTC') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ''' + _('Adjuntos Modelo') + ''' || '' - '' || DESCRIPCION FROM Z_SYS_MODELOS WHERE ID = ' + IntToStr(ID);
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'NOM') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ''' + _('Adjuntos Nomina') + ' - '' || ID || '' - '' || NOMBRE_R_SOCIAL FROM VER_EMP_NOMINAS_CABECERA WHERE ID=' + IntToStr(ID);
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'ESP') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Escandallo Produccion') + ' - ''||E.ESCANDALLO||'' - ''||A.TITULO ');
              SQL.Add(' FROM PRO_ESCANDALLO E JOIN ART_ARTICULOS A ON (A.EMPRESA = E.EMPRESA AND A.ARTICULO = E.COMPUESTO) ');
              SQL.Add(' WHERE E.ID_ESC = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'DSP') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Despiece Produccion') + ' - ''||TITULO ');
              SQL.Add(' FROM PRO_DESPIECE_CAB  ');
              SQL.Add(' WHERE ID_DESPIECE_CAB = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'REP') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Reparacion') + ' - ''||SERIE||''/''||REPARACION||'' - ''||MARCA||''-''||MODELO ');
              SQL.Add(' FROM REPAR_CAB_REPARACIONES WHERE IDCABREPARAR = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'FIT') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Fic. Tecnica') + ' - ''||MATRICULA||''-''||TITULO ');
              SQL.Add(' FROM VER_FICHA_TECNICA  WHERE ID_FICHA_TECNICA = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'OPR') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Orden Produccion') + ' - ''||EJERCICIO||''.''||SERIES||''/''||RIG_OF ');
              SQL.Add(' FROM PRO_ORD WHERE ID_ORDEN = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'PRY') then
     begin
        Result := _('Adjuntos Proyecto') + ' - ' + DameTituloIdProyecto(ID);
     end;
     if (Tipo = 'CUO') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Cuota Cliente') + ' ''||CLIENTE||'' Nro. ''||CUOTA ');
              SQL.Add(' FROM EMP_CLIENTES_CUOTAS ');
              SQL.Add(' WHERE ID_CUOTA = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'IPL') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Planning') + ' - ''||EJERCICIO||''/''||RIG ');
              SQL.Add(' FROM ISO_CAB_PLANNING WHERE ID_CAB_PLANNING = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'INC') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Incidencia') + ' - '' || INCIDENCIA || '' '' ||TITULO');
              SQL.Add(' FROM EMP_INCIDENCIAS WHERE INCIDENCIA = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'EMP') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Empresa') + ' - ''||TITULO ');
              SQL.Add(' FROM SYS_EMPRESAS WHERE EMPRESA = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'PHA') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT ''' + _('Adjuntos Presentacion  MOD.') + ''' || MODELO || '' - '' || TITULO ');
              SQL.Add(' FROM VER_EMP_PRESENTACIONES_HACIENDA WHERE ID_MODELO = ' + IntToStr(ID));
              ExecQuery;
              Result := Fields[0].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     if (Tipo = 'SIE') then
     begin
        Format(_('Adjunto de Email de intercambio %d'), [ID]);
     end;
  end;
end;

function TDMAdjunto.Filtra(aTipo: string; aID: integer): string;
begin
  Tipo := aTipo;
  ID := aID;
  with QMAdjuntos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ID'].AsInteger := ID;
     Open;
  end;
  Tercero := DameTerceroID(Tipo, ID);
  Result := DameCaption;
end;

procedure TDMAdjunto.QMAdjuntosNewRecord(DataSet: TDataSet);
begin
  QMAdjuntosEMPRESA.AsInteger := REntorno.Empresa;
  QMAdjuntosTIPO.AsString := Tipo;
  QMAdjuntosID.AsInteger := ID;
  QMAdjuntosREPOSITORIO.AsInteger := StrToIntDef(LeeParametro('ADJUBIC001', ''), 1);
  QMAdjuntosWEB.AsInteger := StrToIntDef(LeeParametro('ADJCONF001', ''), 1);
end;

procedure TDMAdjunto.QMAdjuntosBeforePost(DataSet: TDataSet);
var
  PudoCopiarAdjunto : boolean;
  Archivo : string;
  i : integer;
  StreamDestino, StreamOrigen : TStream;
  Carpeta_UserProfile : string;
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'CONTA_ADJUNTO', 'ID_ADJUNTO');
     PudoCopiarAdjunto := True;

     Archivo := '';
     with TOpenDialog.Create(nil) do
     begin
        try
           Options := Options + [ofAllowMultiSelect];
           Filter := _('Documentos Word|*.doc;*.docx|Documentos Excel|*.xls;*.xlsx|LibreOffice Writer (*.odt)|*.odt|LibreOffice Calc (*.ods)|*.ods|Archivos de texto|*.txt|Acrobat PDF|*.pdf|Todos los archivos|*.*');
           FilterIndex := 7;
           InitialDir := LeeDatoIni('FicherosCliente', 'UltimaRutaAbrir', GetSpecialFolderPath(CSIDL_PERSONAL, True));
           Title := _('Carga adjunto');
           if (Execute) then
           begin
              if (Files.Count > 0) then
              begin
                 // Importo Primer archivo.
                 Archivo := Files[0];
                 EscribeDatoIni('FicherosCliente', 'UltimaRutaAbrir', ExtractFilePath(Archivo));

                 // Si se guarda como puntero a fichero
                 if (QMAdjuntosREPOSITORIO.AsInteger = 3) then
                 begin
                    // Reemplazo carpeta por variable de sistema.
                    Carpeta_UserProfile := GetSpecialFolderPath(UUtiles.CSIDL_PROFILE { HEX 0028}, True);
                    if (Pos(Carpeta_UserProfile, Archivo) = 1) then
                       Archivo := StringReplace(Archivo, Carpeta_UserProfile, '$userprofile', []);
                 end;

                 QMAdjuntosNOMBRE.AsString := Archivo;

                 // Donde se debe copiar el fichero (0:Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Adjuntos, 3: No se debe tocar.
                 if (QMAdjuntosREPOSITORIO.AsInteger = 2) then
                 begin
                    DMMain.ConectaAdjuntos;
                    with TFIBDataSet.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBaseAdjuntos;
                          Transaction := DameTransactionRW(DMMain.DataBaseAdjuntos);
                          try
                             if (not Transaction.InTransaction) then
                                Transaction.StartTransaction;

                             SelectSQL.Add(' SELECT * FROM ADJUNTOS WHERE ID=0 ');

                             InsertSQL.Add(' INSERT INTO ADJUNTOS (TITULO, ARCHIVO, NOMBRE, ID_ORIGEN) ');
                             InsertSQL.Add(' VALUES (:TITULO, :ARCHIVO, :NOMBRE, :ID_ORIGEN) ');

                             // Abro Dataset
                             Open;

                             // Se pone en modo Insert
                             Insert;

                             FieldByName('TITULO').AsString := QMAdjuntosTITULO_ADJUNTO.AsString;
                             FieldByName('NOMBRE').AsString := QMAdjuntosNOMBRE.AsString;
                             FieldByName('ID_ORIGEN').AsInteger := QMAdjuntosID_ADJUNTO.AsInteger;

                             StreamDestino := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
                             try
                                try
                                   StreamOrigen := TFileStream.Create(Archivo, fmOpenRead);
                                   try
                                      StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                                   finally
                                      StreamOrigen.Free;
                                   end;
                                finally
                                   StreamDestino.Free;
                                end;

                                // Si no se pudo copiar el fichero al repositorio de adjuntos devuelvo un error
                             except
                                Cancel;
                             end;

                             Post;

                             Close;
                             Transaction.Commit;
                          finally
                             Transaction.Free;
                          end;
                       finally
                          Free;
                       end;
                    end;
                 end
                 else
                 begin
                    if (QMAdjuntosREPOSITORIO.AsInteger = 0) then
                       PudoCopiarAdjunto := CopyFileTo(Archivo, REntorno.RutaFicheros + 'ADJ-' + QMAdjuntosID_ADJUNTO.AsString + ExtractFileExt(Archivo))
                    else
                    if (QMAdjuntosREPOSITORIO.AsInteger = 1) then
                       QMAdjuntosARCHIVO.LoadFromFile(Archivo);
                 end;

                 for i := 1 to Files.Count - 1 do
                 begin
                    Archivo := Files.Strings[i];
                    CreaAdjunto(QMAdjuntosTIPO.AsString, QMAdjuntosID.AsInteger, Archivo, QMAdjuntosTITULO_ADJUNTO.AsString, QMAdjuntosREPOSITORIO.AsInteger);
                 end;
              end;
           end;
        finally
           Free;
        end;
     end;

     if (not PudoCopiarAdjunto) then
        DataSet.Cancel;
  end;
end;

procedure TDMAdjunto.AbrirAdjunto;
var
  Fichero : string;
begin
  Fichero := DameAdjunto(QMAdjuntosID_ADJUNTO.AsInteger);
  DMMain.AbrirArchivo(Fichero);
end;

procedure TDMAdjunto.EnviarAdjunto;
var
  Subject : string;
  DMListadosCargado : boolean;
  CuerpoMail : TStrings;
  Fichero : string;
begin
  inherited;
  DMListadosCargado := False;
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando la carta por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando carta ...'));

     Fichero := DameAdjunto(QMAdjuntosID_ADJUNTO.AsInteger);
     try
        begin
           AbreData(TDMListados, DMListados);
           DMListadosCargado := True;

           Subject := QMAdjuntosTITULO_ADJUNTO.AsString;

           CuerpoMail := TStringList.Create;
           try
              CuerpoMail.Add(_('Este correo ha sido enviado desde:') + ' ');
              CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
              CuerpoMail.Add('');
              CuerpoMail.Add(_('y contiene el fichero adjunto') + ' ' + UpperCase(ExtractFileName(QMAdjuntosNOMBRE.AsString)));
              CuerpoMail.Add('------------------------------------------------------------');
              CuerpoMail.Add('This email has been sent from: ');
              CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
              CuerpoMail.Add('');
              CuerpoMail.Add('And contains the attached file ' + UpperCase(ExtractFileName(QMAdjuntosNOMBRE.AsString)));

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              DMListados.SendMailTerceroPDF(Tercero, CuerpoMail, Fichero, ExtractFileName(Fichero), Subject);
           finally
              CuerpoMail.Free;
           end;
           CierraData(DMListados);
           DMListadosCargado := False;
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
        end;
     except
        begin
           FSendCorreo.Texto(_('¡¡ERROR!! Error en el envío.'));

           // Liberamos objetos creados
           if DMListadosCargado then
              CierraData(DMListados);
        end;
     end;

     FSendCorreo.BitBtnOk.Visible := True;
     Application.ProcessMessages;
     FSendCorreo.Visible := False;
     FSendCorreo.SePuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TDMAdjunto.GuardarComo;
var
  Archivo : string;
begin
  Archivo := ExtractFileName(QMAdjuntosNOMBRE.AsString);
  if MySaveDialog(Archivo, '', '', 'DMAdjunto') then
     DameAdjunto(QMAdjuntosID_ADJUNTO.AsInteger, Archivo);
end;

procedure TDMAdjunto.ImprimirAdjunto;
var
  Fichero : string;
begin
  Fichero := DameTempPath + ExtractFileName(QMAdjuntosNOMBRE.AsString);
  DameAdjunto(QMAdjuntosID_ADJUNTO.AsInteger, Fichero);
  ShellExecute(FMain.Handle, 'Print', PChar(Fichero), nil, nil, SW_SHOW);
end;

procedure TDMAdjunto.QMAdjuntosBeforeInsert(DataSet: TDataSet);
begin
  QMAdjuntosREPOSITORIO.ReadOnly := False;
end;

procedure TDMAdjunto.QMAdjuntosBeforeEdit(DataSet: TDataSet);
begin
  QMAdjuntosREPOSITORIO.ReadOnly := True;
end;

procedure TDMAdjunto.CambiaDestinoAdjunto(IdAdjunto, RepositorioDestino: integer);
var
  Fichero, Nombre, Titulo : string;
  RepositorioOrigen : integer;
  StreamDestino, StreamOrigen : TStream;
begin
  if (IdAdjunto <> 0) then
  begin
     // Obtengo datos del adjunto
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TITULO_ADJUNTO, NOMBRE, REPOSITORIO FROM VER_ADJUNTOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_ADJUNTO = :ID_ADJUNTO ');
           Params.ByName['ID_ADJUNTO'].AsInteger := IdAdjunto;
           ExecQuery;
           Nombre := FieldByName['NOMBRE'].AsString;
           Titulo := FieldByName['TITULO_ADJUNTO'].AsString;
           RepositorioOrigen := FieldByName['REPOSITORIO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if ((RepositorioDestino = 2) or (RepositorioOrigen = 2)) then
        DMMain.ConectaAdjuntos;

     if ((RepositorioDestino = 2) and (not DMMain.DataBaseAdjuntos.Connected)) then
        raise Exception.Create(_('No hay base de datos de adjuntos conectada.'));

     if ((RepositorioDestino = 0) and ((REntorno.RutaFicheros = '') or (not DirectoryExists(REntorno.RutaFicheros)))) then
        raise Exception.Create(_('No existe la ruta a la carpeta compartida.'));

     if (RepositorioOrigen <> RepositorioDestino) then
     begin
        // Obtengo el fichero en la carpeta temporal
        Fichero := DameAdjunto(IdAdjunto);

        // Si es traspaso a una base aparte
        if (RepositorioDestino = 2) then
        begin
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBaseAdjuntos;
                 Transaction := DameTransactionRW(DMMain.DataBaseAdjuntos);
                 try
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;

                    SelectSQL.Add(' SELECT * FROM ADJUNTOS WHERE ID=0 ');

                    InsertSQL.Add(' INSERT INTO ADJUNTOS (TITULO, ARCHIVO, NOMBRE, ID_ORIGEN) ');
                    InsertSQL.Add(' VALUES (:TITULO, :ARCHIVO, :NOMBRE, :ID_ORIGEN) ');

                    // Abro Dataset
                    Open;

                    // Se pone en modo Insert
                    Insert;

                    FieldByName('TITULO').AsString := Titulo;
                    FieldByName('NOMBRE').AsString := ExtractFileName(Fichero);
                    FieldByName('ID_ORIGEN').AsInteger := IdAdjunto;

                    StreamDestino := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
                    try
                       try
                          StreamOrigen := TFileStream.Create(Fichero, fmOpenRead);
                          try
                             StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                          finally
                             StreamOrigen.Free;
                          end;
                       finally
                          StreamDestino.Free;
                       end;

                       // Si no se podu copiar el fichero al repositorio de adjuntos devuelvo un error
                    except
                       Cancel;
                    end;

                    Post;

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

        // Si es traspaso a la base de datos
        if (RepositorioDestino = 1) then
        begin
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 Transaction := DameTransactionRW(DMMain.DataBase);
                 try
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;

                    SelectSQL.Add(' SELECT * FROM EMP_ADJUNTOS WHERE ID = :ID ');

                    UpdateSQL.Add(' UPDATE EMP_ADJUNTOS ');
                    UpdateSQL.Add(' SET ');
                    UpdateSQL.Add(' ARCHIVO = :ARCHIVO ');
                    UpdateSQL.Add(' WHERE ');
                    UpdateSQL.Add(' ID = :ID ');

                    // Abro Dataset
                    Params.ByName['ID'].AsInteger := IdAdjunto;
                    Open;

                    // Se pone en modo Insert
                    Edit;

                    StreamDestino := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
                    try
                       try
                          StreamOrigen := TFileStream.Create(Fichero, fmOpenRead);
                          try
                             StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                          finally
                             StreamOrigen.Free;
                          end;
                       finally
                          StreamDestino.Free;
                       end;

                       // Si no se podu copiar el fichero al repositorio de adjuntos devuelvo un error
                    except
                       Cancel;
                    end;

                    Post;

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

        // Si es traspaso a carpeta compartida
        if (RepositorioDestino = 0) then
        begin
           if (not CopyFileTo(Fichero, REntorno.RutaFicheros + 'ADJ-' + IntToStr(IdAdjunto) + ExtractFileExt(Nombre))) then
              raise Exception.Create(_('No se pudo copiar el archivo'));
        end;

        // Actualizo repositorio del adjunto
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE EMP_ADJUNTOS ');
              SQL.Add(' SET ');
              SQL.Add(' REPOSITORIO = :REPOSITORIO ');
              // Borro el adjunto si estaba en la base de datos.
              if (RepositorioOrigen = 1) then
                 SQL.Add(' ,ARCHIVO = NULL ');
              SQL.Add(' WHERE ID = :ID ');
              Params.ByName['REPOSITORIO'].AsInteger := RepositorioDestino;
              Params.ByName['ID'].AsInteger := IdAdjunto;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Si viene de la base de datos aparte, borro el adjunto
        if ((RepositorioOrigen = 2) and (DMMain.DataBaseAdjuntos.Connected)) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBaseAdjuntos;
                 SQL.Add(' DELETE FROM ADJUNTOS ');
                 SQL.Add(' WHERE ID_ORIGEN = :ID_ORIGEN ');
                 Params.ByName['ID_ORIGEN'].AsInteger := IdAdjunto;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Si viene de carpeta compartida, borro el fichero
        if (RepositorioOrigen = 0) then
        begin
           DeleteFile(REntorno.RutaFicheros + 'ADJ-' + IntToStr(IdAdjunto) + ExtractFileExt(Nombre));
        end;

        // Borro el fichero temporal
        DeleteFile(Fichero);
     end;
  end;
end;

procedure TDMAdjunto.BorraAdjunto(Tipo: string; ID, IdAdjunto: integer);
var
  Archivo : string;
  Repositorio : integer;
  Existe : boolean;
begin
  // Obtengo el repositorio del adjunto
  // 0: Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Adjuntos, 3: Puntero a fichero
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT REPOSITORIO, NOMBRE FROM EMP_ADJUNTOS WHERE ID = :ID_ADJUNTO';
        Params.ByName['ID_ADJUNTO'].AsInteger := IdAdjunto;
        ExecQuery;
        Repositorio := FieldByName['REPOSITORIO'].AsInteger;
        Archivo := FieldByName['NOMBRE'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Borro el adjunto para el TIPO-ID. La vista borra el adjunto si ya quedan tiene relaciones
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM VER_ADJUNTOS WHERE TIPO = :TIPO AND ID = :ID AND ID_ADJUNTO = :ID_ADJUNTO';
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID'].AsInteger := ID;
        Params.ByName['ID_ADJUNTO'].AsInteger := IdAdjunto;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si ya no existe y el repositorio es en base externa, debo borrar el registro de la base externa
  if ((Repositorio = 0) or (Repositorio = 2)) then
  begin
     // Verifico si el adjunto todavia existe
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID_ADJUNTO FROM EMP_ADJUNTOS WHERE ID = :ID_ADJUNTO';
           Params.ByName['ID_ADJUNTO'].AsInteger := IdAdjunto;
           ExecQuery;
           Existe := (FieldByName['ID_ADJUNTO'].AsInteger <> 0);
           FreeHandle;
        finally
           Free;
        end;
     end;

     if not Existe then
     begin
        if (Repositorio = 0) then
        begin
           // Borro fichero de la Carpeta compartida
           DeleteFile(REntorno.RutaFicheros + 'ADJ-' + IntToStr(IdAdjunto) + ExtractFileExt(Archivo));
        end
        else
        if (Repositorio = 2) then
        begin
           // Borro de la Base de Datos de Adjuntos
           DMMain.ConectaAdjuntos;
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBaseAdjuntos;
                 SQL.Text := 'DELETE FROM EMP_ADJUNTOS WHERE ID = :ID_ADJUNTO';
                 Params.ByName['ID_ADJUNTO'].AsInteger := IdAdjunto;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  end;
end;

function TDMAdjunto.DameAdjunto(Id: integer; NombreDestino: string = ''): string;
var
  Fichero : string;
  Repositorio : integer;
  s, f : TStream;
  Carpeta_UserProfile : string;
begin
  /// Devuelve la ruta y nombre del fichero adjunto

  // Si se modifica procedimiento, aplicar tambien a código web

  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add('SELECT NOMBRE, REPOSITORIO, ARCHIVO FROM EMP_ADJUNTOS WHERE ID=?ID');
           Params.ByName['ID'].AsInteger := Id;
           Open;

           // Donde esta el fichero. 0: Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Adjuntos, 3: Puntero a fichero
           Repositorio := FieldByName('REPOSITORIO').AsInteger;
           if (NombreDestino = '') then
              Fichero := DameTempPath + ExtractFileName(FieldByName('NOMBRE').AsString)
           else
              Fichero := NombreDestino;

           if (Repositorio <> 2) then
           begin
              // Si *NO* está en esta base de datos secundaria
              if (Repositorio = 3) then
              begin
                 // Si es un puntero a fichero
                 if (NombreDestino = '') then
                 begin
                    Fichero := FieldByName('NOMBRE').AsString;

                    // Si empieza con una variable de sistema la reemplazo
                    if (Pos('$userprofile', Fichero) = 1) then
                    begin
                       Carpeta_UserProfile := GetSpecialFolderPath(UUtiles.CSIDL_PROFILE { HEX 0028}, True);
                       Fichero := StringReplace(Fichero, '$userprofile', Carpeta_UserProfile, []);
                    end;
                 end
                 else
                    CopyFileTo(FieldByName('NOMBRE').AsString, Fichero);
              end
              else
              begin
                 // Si está en esta base de datos o en la carpeta compartida
                 s := nil;
                 if (Repositorio = 0) then
                    s := TFileStream.Create(REntorno.RutaFicheros + 'ADJ-' + IntToStr(Id) + ExtractFileExt(FieldByName('NOMBRE').AsString), fmOpenRead)
                 else
                 if (Repositorio = 1) then
                    s := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);

                 try
                    f := TFileStream.Create(Fichero, fmCreate);
                    try
                       f.CopyFrom(s, s.Size);
                    finally
                       f.Free;
                    end;
                 finally
                    s.Free;
                 end;
              end;
           end;

           Result := Fichero;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  if (Repositorio = 2) then
     DMMain.ConectaAdjuntos;

  if ((Repositorio = 2) and (DMMain.DataBaseAdjuntos.Connected)) then
  begin
     // Si está en una base de datos secundaria
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBaseAdjuntos;
           Transaction := DameTransactionRW(DMMain.DataBaseAdjuntos);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Add(' SELECT ARCHIVO FROM ADJUNTOS WHERE ID_ORIGEN = :ID_ORIGEN ');
              Params.ByName['ID_ORIGEN'].AsInteger := Id;
              Open;

              s := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
              try
                 f := TFileStream.Create(Fichero, fmCreate);
                 try
                    f.CopyFrom(s, s.Size);
                 finally
                    f.Free;
                 end;
              finally
                 s.Free;
              end;

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

function TDMAdjunto.CreaAdjunto(aTipo: string; aID: integer; Fichero: string; Descripcion: string = ''; Repositorio: integer = -1): integer;
var
  DS : TFIBDataSet;
  StreamDestino, StreamOrigen : TStream;
  // PudoCopiarAdjunto : boolean;
begin
  /// Carga un fichero como adjunto y devuelve su ID
  /// Si hay un error devuelve 0

  // Si se modifica procedimiento, aplicar tambien a código web

  Tipo := aTipo;
  ID := aID;

  Tercero := DameTerceroID(Tipo, ID);
  if (Descripcion = '') then
     Descripcion := ExtractFileName(Fichero);

  if (Repositorio = -1) then
     Repositorio := StrToIntDef(LeeParametro('ADJUBIC001', ''), 1);

  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRW(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT * FROM VER_ADJUNTOS WHERE ID=0 ');

           InsertSQL.Add(' INSERT INTO VER_ADJUNTOS ');
           InsertSQL.Add(' (EMPRESA, TIPO, ID, ID_ADJUNTO, TITULO_ADJUNTO, ARCHIVO, NOMBRE, REPOSITORIO, WEB) ');
           InsertSQL.Add(' VALUES ');
           InsertSQL.Add(' (?EMPRESA, ?TIPO, ?ID, ?ID_ADJUNTO, ?TITULO_ADJUNTO, ?ARCHIVO, ?NOMBRE, ?REPOSITORIO, ?WEB) ');

           // Abro Dataset
           Open;

           // Se pone en modo Insert
           Insert;

           // Se cargan los datos a los campos
           DMMain.Contador_Gen(DS, 'CONTA_ADJUNTO', 'ID_ADJUNTO');
           FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
           FieldByName('TIPO').AsString := Tipo;
           FieldByName('ID').AsInteger := ID;
           FieldByName('REPOSITORIO').AsInteger := Repositorio;
           FieldByName('NOMBRE').AsString := Fichero;
           FieldByName('TITULO_ADJUNTO').AsString := Descripcion;
           FieldByName('WEB').AsInteger := StrToIntDef(LeeParametro('ADJCONF001', ''), 1);

           // Donde se debe copiar el fichero (0:Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Adjuntos.
           try
              if (FieldByName('REPOSITORIO').AsInteger = 2) then
              begin
                 DMMain.ConectaAdjuntos;

                 with TFIBDataSet.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBaseAdjuntos;
                       Transaction := DameTransactionRW(DMMain.DataBaseAdjuntos);
                       try
                          if (not Transaction.InTransaction) then
                             Transaction.StartTransaction;

                          SelectSQL.Add(' SELECT * FROM ADJUNTOS WHERE ID=0 ');

                          InsertSQL.Add(' INSERT INTO ADJUNTOS (TITULO, ARCHIVO, NOMBRE, ID_ORIGEN) ');
                          InsertSQL.Add(' VALUES (:TITULO, :ARCHIVO, :NOMBRE, :ID_ORIGEN) ');

                          // Abro Dataset
                          Open;

                          // Se pone en modo Insert
                          Insert;

                          FieldByName('TITULO').AsString := Descripcion;
                          FieldByName('NOMBRE').AsString := Fichero;
                          FieldByName('ID_ORIGEN').AsInteger := DS.FieldByName('ID_ADJUNTO').AsInteger;

                          StreamDestino := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);
                          try
                             try
                                StreamOrigen := TFileStream.Create(Fichero, fmOpenRead);
                                try
                                   StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                                finally
                                   StreamOrigen.Free;
                                end;
                             finally
                                StreamDestino.Free;
                             end;

                             // Si no se pudo copiar el fichero al repositorio de adjuntos devuelvo un error
                          except
                             DS.Cancel;
                          end;

                          Post;

                          Close;
                          Transaction.Commit;
                       finally
                          Transaction.Free;
                       end;
                    finally
                       Free;
                    end;
                 end;
              end
              else
              begin
                 if (FieldByName('REPOSITORIO').AsInteger <> 3) then
                 begin
                    if (FieldByName('REPOSITORIO').AsInteger = 0) then
                       StreamDestino := TFileStream.Create(REntorno.RutaFicheros + 'ADJ-' + IntToStr(Id) + ExtractFileExt(FieldByName('NOMBRE').AsString), fmOpenRead)
                    else
                       StreamDestino := CreateBlobStream(FieldByName('ARCHIVO'), bmRead);

                    try
                       StreamOrigen := TFileStream.Create(Fichero, fmOpenRead);
                       try
                          StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                       finally
                          StreamOrigen.Free;
                       end;
                    finally
                       StreamDestino.Free;
                    end;
                 end;
              end;

              Post;
              Result := ID;

              // Si no se pudo copiar el fichero al repositorio de adjuntos devuelvo un error
           except
              on E: Exception do
              begin
                 ShowMessage(_('Error cargando fichero') + #13#10 + E.Message);
                 DS.Cancel;
                 Result := 0;
              end;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

procedure TDMAdjunto.QMAdjuntosDESCRIPCION_REPOSITORIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DescripcionRepositorio[QMAdjuntosREPOSITORIO.AsInteger];
end;

procedure TDMAdjunto.QMAdjuntosREPOSITORIOChange(Sender: TField);
begin
  QMAdjuntosDESCRIPCION_REPOSITORIO.AsString := DescripcionRepositorio[QMAdjuntosREPOSITORIO.AsInteger];
end;

procedure TDMAdjunto.QMAdjuntosNOMBREGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if Parametro_ADJNOMB001 then
     Text := ExtractFileName(QMAdjuntosNOMBRE.AsString)
  else
     Text := QMAdjuntosNOMBRE.AsString;
end;

end.
