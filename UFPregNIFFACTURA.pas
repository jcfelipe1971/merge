unit UFPregNIFFACTURA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, UEditPanel, ToolWin, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, UControlEdit, UFormGest, ULFDBEdit, ULFPanel,
  ULFToolBar, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, ULFLabel, DB, ULFDBMemo, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  ULFEdit, Buttons, FIBDataSet, FIBDataSetRO, FIBDatabase, UFIBModificados,
  RxLookup;

type
  TFPregNIFFactura = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     LBLNif: TLFLabel;
     LDireccion: TLFLabel;
     LCodPostal: TLFLabel;
     LProvincia: TLFLabel;
     DBENif: TLFDbedit;
     DBEDireccion: TLFDbedit;
     DBECodPostal: TLFDbedit;
     DBEProvincia: TLFDbedit;
     TButtBorrar: TToolButton;
     LBLNombre: TLFLabel;
     DBENombre: TLFDbedit;
     LBLPais: TLFLabel;
     DBEFPais: TLFDBEditFind2000;
     ETituloPais: TLFEdit;
     LLocalidad: TLFLabel;
     DBELocalidad: TLFDbedit;
     LTelefono01: TLFLabel;
     DBETelefono01: TLFDbedit;
     DBETelefono02: TLFDbedit;
     LTelefono02: TLFLabel;
     DBETelefax: TLFDbedit;
     LTelefax: TLFLabel;
     LEmail: TLFLabel;
     DBEEmail: TLFDbedit;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     LColonia: TLFLabel;
     DBEColonia: TLFDbedit;
     Sep1: TToolButton;
     BActualizarTercero: TToolButton;
     PNLTercero: TLFPanel;
     LTercero: TLFLabel;
     DBETercero: TLFDbedit;
     PNLRellenarDatos: TLFPanel;
     SBRellenarDatos: TSpeedButton;
     LRellenarDatos: TLFLabel;
     AVisualizarCartaLOPD: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AImprimirCartaLOPD: TAction;
     AEnviarEmailCartaLOPD: TAction;
     AEnviarEmailCartaLOPD2: TAction;
     APedirFirma: TAction;
     ABorrarFirma: TAction;
     PNLFirma: TLFPanel;
     ImgFirma: TImage;
     DBTFirmaNombre: TDBText;
     DBTNIFFirma: TDBText;
     LFirma: TLFLabel;
     QMFirmas: TFIBDataSetRO;
     QMFirmasID_FIRMA: TIntegerField;
     QMFirmasNOMBRE: TFIBStringField;
     QMFirmasNIF: TFIBStringField;
     DSQMFirmas: TDataSource;
     ARefrescarImagenFirma: TAction;
     SBRefrescarFirma: TBitBtn;
     AGuardarComoAdjunto: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ACrearTercero: TAction;
     ACrearCliente: TAction;
     TLocal: THYTransaction;
     DBENombreContacto: TLFDbedit;
     LBLNombreContacto: TLFLabel;
     CBGrabaCrmContacto: TCheckBox;
     QMComoNosConocieron: TFIBDataSetRO;
     QMComoNosConocieronMODO: TIntegerField;
     QMComoNosConocieronTITULO: TFIBStringField;
     DSQMComoNosConocieron: TDataSource;
     LDBLCComoNosConocieron: TLFLabel;
     DBLCComoNosConocieron: TRxDBLookupCombo;
     LPaisDocumento: TLFLabel;
     DBEFPaisDocIdent: TLFDBEditFind2000;
     LTipoDocumento: TLFLabel;
     DBEFTipoDocIdent: TLFDBEditFind2000;
     ETipoDocumentoTitulo: TLFEdit;
     LValidacionDocumento: TLFLabel;
     DBTValidacionResultado: TDBText;
     DBTValidacionNombre: TDBText;
     DBTValidacionFechaCombrobacion: TDBText;
     xValidacionDoc: TFIBDataSetRO;
     xValidacionDocRESULTADO: TFIBStringField;
     xValidacionDocRESULTADO_NOMBRE: TFIBStringField;
     xValidacionDocFECHA_COMPROBACION: TDateTimeField;
     DSxValidacionDoc: TDataSource;
     TmrValidacion: TTimer;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure TButtBorrarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure DBEFPaisChange(Sender: TObject);
     procedure DBENifChange(Sender: TObject);
     procedure SBRellenarDatosClick(Sender: TObject);
     procedure AVisualizarCartaLOPDExecute(Sender: TObject);
     procedure AImprimirCartaLOPDExecute(Sender: TObject);
     procedure AEnviarEmailCartaLOPDExecute(Sender: TObject);
     procedure ABorrarFirmaExecute(Sender: TObject);
     procedure APedirFirmaExecute(Sender: TObject);
     procedure AEnviarEmailCartaLOPD2Execute(Sender: TObject);
     procedure DBETerceroChange(Sender: TObject);
     procedure ImgFirmaDblClick(Sender: TObject);
     procedure ARefrescarImagenFirmaExecute(Sender: TObject);
     procedure AGuardarComoAdjuntoExecute(Sender: TObject);
     procedure ACrearTerceroExecute(Sender: TObject);
     procedure ACrearClienteExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBENombreExit(Sender: TObject);
     procedure DBEFTipoDocIdentChange(Sender: TObject);
     procedure DBEFPaisDocIdentExit(Sender: TObject);
     procedure DBEFTipoDocIdentBusqueda(Sender: TObject);
     procedure xValidacionDocAfterOpen(DataSet: TDataSet);
     procedure TmrValidacionTimer(Sender: TObject);
  private
     { Private declarations }
     Tipo: string;
     IdDoc: integer;
     IdDocE, IdDocS, Tercero: integer;
     function ImprimirCartaLOPD(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False): string;
     function DameTipoFirma(Tipo: string): string;
     procedure CreaCrMContacto;
     procedure RefrescaValidacionDoc;
  public
     { Public declarations }
     procedure Inicializa(Datos: TDataSource; Titulo: string; Estado: smallint; aTercero: integer = 0; NIF: string = ''; TituloTercero: string = '');
  end;

implementation

uses UDMMain, UEntorno, UUtiles, HYFIBQuery, UParam, UDMLstTerceros,
  UDMListados, FIBTableDataSet, UDMAdjunto, UDMClientes, DateUtils, UDameDato,
  UImagenes;

{$R *.DFM}

procedure TFPregNIFFactura.FormCreate(Sender: TObject);
begin
  inherited;

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  GetBitmapFromImageList(SBRellenarDatos, 1, DMMain.ILMain_Ac, 85);
  GetBitmapFromImageList(SBRellenarDatos, 2, DMMain.ILMain_In, 85);

  GetBitmapFromImageList(SBRefrescarFirma, 1, DMMain.ILMain_Ac, 26);
  GetBitmapFromImageList(SBRefrescarFirma, 2, DMMain.ILMain_In, 26);

  // Determino si se ve el Edit de Colonia.
  // Si no se ve, debo hacerlo invisible y mover los demás Edits hacia arriba
  if (DMMain.EstadoKri(427) <> 1) then
  begin
     // Extiendo la nota para ocupar la linea que sobra
     DBMNotas.Height := DBMNotas.Height + LNotas.Top - LEmail.Top + 1;
     // Cuarta Linea
     LNotas.Top := LEmail.Top;
     DBMNotas.Top := DBEEmail.Top;
     PNLFirma.Top := DBMNotas.Top;
     PNLFirma.Height := DBMNotas.Height;
     LFirma.Top := LNotas.Top;

     // Tercera Linea
     LEmail.Top := LTelefono01.Top;
     DBEEmail.Top := DBETelefono01.Top;
     // Segunda Linea
     LTelefono01.Top := LBLPais.Top;
     LTelefono02.Top := LBLPais.Top;
     LTelefax.Top := LBLPais.Top;
     DBETelefono01.Top := DBEFPais.Top;
     DBETelefono02.Top := DBEFPais.Top;
     DBETelefax.Top := DBEFPais.Top;
     // Primeara Linea
     LBLPais.Top := LColonia.Top;
     DBEFPais.Top := DBEColonia.Top;
     ETituloPais.Top := DBEColonia.Top;

     LColonia.Visible := False;
     DBEColonia.Visible := False;
  end;

  // Campos obligatorios.
  if (LeeParametro('CLIVARI001') = 'S') then
  begin
     DBENombre.Color := clLime;
     DBEDireccion.Color := clLime;
     DBECodPostal.Color := clLime;
     DBETelefono01.Color := clLime;
     DBEEmail.Color := clLime;
  end;

  CBGrabaCrmContacto.Checked := (LeeParametro('CLIVARI003') <> 'N');

  IdDocE := 0;
  IdDocS := 0;
  Tercero := 0;
  Tipo := '';
  IdDoc := 0;
  PNLRellenarDatos.Visible := ((IdDocE <> 0) or (IdDocS <> 0) or (Tercero <> 0));
end;

procedure TFPregNIFFactura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TFPregNIFFactura.TButtConfirmarClick(Sender: TObject);

  function ContieneTexto(s: string): boolean;
  var
     i : integer;
  begin
     /// Verifica que al menos exista una letra

     Result := False;

     s := Trim(s);
     if (s <> '') then
     begin
        // Recorro cadena hasta que encuentro una letra
        i := 1;
        while ((i < Length(s)) and (not (s[i] in ['A'..'Z', 'a'..'z']))) do
           Inc(i);

        // Resultado depende de que haya encontrado una letra
        Result := (s[i] in ['A'..'Z', 'a'..'z']);
     end;
  end;

  function ContieneTextoONumeros(s: string): boolean;
  var
     i : integer;
  begin
     /// Verifica que al menos exista una letra o número

     Result := False;

     s := Trim(s);
     if (s <> '') then
     begin
        // Recorro cadena hasta que encuentro una letra
        i := 1;
        while ((i < Length(s)) and (not (s[i] in ['A'..'Z', 'a'..'z', '0'..'9']))) do
           Inc(i);

        // Resultado depende de que haya encontrado una letra
        Result := (s[i] in ['A'..'Z', 'a'..'z', '0'..'9']);
     end;
  end;

begin
  if DBENombre.CanFocus then
     DBENombre.SetFocus;

  if (
     (not ContieneTexto(DBENombre.Text)) or
     (not ContieneTexto(DBEDireccion.Text)) or
     (not ContieneTextoONumeros(DBECodPostal.Text)) or
     (not (Trim(DBETelefono01.Text) > '')) or
     (not FormatoEmailValido(DBEEmail.Text))
     ) then
  begin
     // CLIVARI001 - Obliga a rellenar todos los campos de clientes varios (Prolase)
     // *** Si otro cliente requiere algo distinto, hacer otro parámetro. ***
     if (LeeParametro('CLIVARI001') = 'S') then
     begin
        ShowMessage(_('Alguno de los campos esta vacio'));
        ModalResult := mrNone;
     end
     else
     begin
        if ConfirmaMensaje(_('Alguno de los campos esta vacio') + #13#10 + _('¿Grabar cambios?')) then
           ModalResult := mrOk
        else
           ModalResult := mrNone;
     end;
  end
  else
     ModalResult := mrOk;

  if (CBGrabaCrmContacto.Checked) then
     CreaCrMContacto;
end;

procedure TFPregNIFFactura.TButtBorrarClick(Sender: TObject);
begin
  DBENombre.DataSource.DataSet.FieldByName(DBENombre.DataField).AsString := '';
  DBENif.DataSource.DataSet.FieldByName(DBENif.DataField).AsString := '';
  DBEDireccion.DataSource.DataSet.FieldByName(DBEDireccion.DataField).AsString := '';
  DBECodPostal.DataSource.DataSet.FieldByName(DBECodPostal.DataField).AsString := '';
  DBELocalidad.DataSource.DataSet.FieldByName(DBELocalidad.DataField).AsString := '';
  DBEProvincia.DataSource.DataSet.FieldByName(DBEProvincia.DataField).AsString := '';
  DBEFPais.DataSource.DataSet.FieldByName(DBEFPais.DataField).AsString := '';
  DBETelefono01.DataSource.DataSet.FieldByName(DBETelefono01.DataField).AsString := '';
  DBETelefono02.DataSource.DataSet.FieldByName(DBETelefono02.DataField).AsString := '';
  DBETelefax.DataSource.DataSet.FieldByName(DBETelefax.DataField).AsString := '';
  DBEEmail.DataSource.DataSet.FieldByName(DBEEmail.DataField).AsString := '';
  DBENombreContacto.DataSource.DataSet.FieldByName(DBENombreContacto.DataField).AsString := '';
  ModalResult := mrOk;
end;

procedure TFPregNIFFactura.Inicializa(Datos: TDataSource; Titulo: string; Estado: smallint; aTercero: integer = 0; NIF: string = ''; TituloTercero: string = '');
begin
  DBENombre.DataSource := Datos;
  DBENif.DataSource := Datos;
  DBEFPaisDocIdent.DataSource := Datos;
  DBEFTipoDocIdent.DataSource := Datos;
  DBEDireccion.DataSource := Datos;
  DBECodPostal.DataSource := Datos;
  DBEProvincia.DataSource := Datos;
  DBEColonia.DataSource := Datos;
  DBEFPais.DataSource := Datos;
  DBELocalidad.DataSource := Datos;
  DBETelefono01.DataSource := Datos;
  DBETelefono02.DataSource := Datos;
  DBETelefax.DataSource := Datos;
  DBEEmail.DataSource := Datos;
  DBMNotas.DataSource := Datos;
  DBETercero.DataSource := Datos;
  DBENombreContacto.DataSource := Datos;

  Caption := Titulo;
  Tipo := Datos.DataSet.FieldByName('TIPO').AsString;

  if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
  begin
     IdDoc := Datos.DataSet.FieldByName('ID_S').AsInteger;
     QMComoNosConocieron.DataSource := Datos;
     DBLCComoNosConocieron.DataSource := Datos;
     QMComoNosConocieron.Open;
  end
  else
  if (Tipo = 'TIC') then
  begin
     IdDoc := Datos.DataSet.FieldByName('ID_S').AsInteger;
     QMComoNosConocieron.DataSource := Datos;
     DBLCComoNosConocieron.DataSource := Datos;
     QMComoNosConocieron.Open;
  end
  else
  begin
     IdDoc := Datos.DataSet.FieldByName('ID_E').AsInteger;
     QMComoNosConocieron.DataSource := nil;
  end;

  if (Datos.DataSet.State = dsInsert) then
  begin
     if (aTercero = 0) then
     begin
        Datos.DataSet.FieldByName('NOMBRE').AsString := TituloTercero;
        Datos.DataSet.FieldByName('NIF').AsString := NIF;
     end
     else
     begin
        with TFIBTableSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SelectSQL.Add(' SELECT T.NOMBRE_COMERCIAL, T.NIF, T.PAIS_TERCERO, T.TIPO_DOC_IDENT, D.DIR_COMPLETA_N, L.CODIGO_POSTAL, P.TITULO PROVINCIA, L.PAIS, ');
              SelectSQL.Add('        L.TITULO LOCALIDAD, T.TELEFONO01, T.TELEFONO02, T.TELEFAX, T.EMAIL, T.NOTAS, L.COLONIA, T.CARNET_APLICADOR, T.COMO_NOS_CONOCIERON');
              SelectSQL.Add('        (SELECT FIRST 1 NOMBRE ');
              SelectSQL.Add('         FROM SYS_TERCEROS_CONTACTOS ');
              SelectSQL.Add('         WHERE ');
              SelectSQL.Add('         TERCERO = T.TERCERO) AS NOMBRE_CONTACTO ');
              SelectSQL.Add(' FROM SYS_TERCEROS T ');
              SelectSQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
              SelectSQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
              SelectSQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' T.TERCERO = :TERCERO AND ');
              SelectSQL.Add(' D.DIR_DEFECTO = 1 ');
              Params.ByName['TERCERO'].AsInteger := aTercero;
              Open;
              Datos.DataSet.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE_COMERCIAL').AsString;
              Datos.DataSet.FieldByName('NIF').AsString := FieldByName('NIF').AsString;
              Datos.DataSet.FieldByName('PAIS_DOC_IDENT').AsString := FieldByName('PAIS_TERCERO').AsString;
              Datos.DataSet.FieldByName('TIPO_DOC_IDENT').AsString := FieldByName('TIPO_DOC_IDENT').AsString;
              Datos.DataSet.FieldByName('DIRECCION').AsString := FieldByName('DIR_COMPLETA_N').AsString;
              Datos.DataSet.FieldByName('C_POSTAL').AsString := FieldByName('CODIGO_POSTAL').AsString;
              Datos.DataSet.FieldByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
              Datos.DataSet.FieldByName('LOCALIDAD').AsString := FieldByName('LOCALIDAD').AsString;
              Datos.DataSet.FieldByName('COLONIA').AsString := FieldByName('COLONIA').AsString;
              Datos.DataSet.FieldByName('PAIS').AsString := FieldByName('PAIS').AsString;
              Datos.DataSet.FieldByName('TELEFONO01').AsString := FieldByName('TELEFONO01').AsString;
              Datos.DataSet.FieldByName('TELEFONO02').AsString := FieldByName('TELEFONO02').AsString;
              Datos.DataSet.FieldByName('TELEFAX').AsString := FieldByName('TELEFAX').AsString;
              Datos.DataSet.FieldByName('EMAIL').AsString := FieldByName('EMAIL').AsString;
              Datos.DataSet.FieldByName('NOTAS').AsString := FieldByName('NOTAS').AsString;
              Datos.DataSet.FieldByName('TERCERO').AsInteger := aTercero;
              Datos.DataSet.FieldByName('NOMBRE_CONTACTO').AsString := FieldByName('NOMBRE_CONTACTO').AsString;
              if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
                 Datos.DataSet.FieldByName('CARNET_APLICADOR').AsString := FieldByName('CARNET_APLICADOR').AsString;
              if ((Tipo = 'TIC') or (Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
                 Datos.DataSet.FieldByName('COMO_NOS_CONOCIERON').AsInteger := FieldByName('COMO_NOS_CONOCIERON').AsInteger;
              Close;
           finally
              Free;
           end;
        end;
     end;
  end;

  // Solo permito crear clientes para documentos de venta
  ACrearCliente.Enabled := ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC'));
  ACrearCliente.Visible := ACrearCliente.Enabled;
  DBLCComoNosConocieron.Enabled := ((Tipo = 'TIC') or (Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC'));
  DBLCComoNosConocieron.Visible := DBLCComoNosConocieron.Enabled;

  // CLIVARI004 - Permite editar datos de clientes varios de documentos cerrados.
  if (LeeParametro('CLIVARI004') <> 'S') and (Estado >= 5) then
  begin
     HabilitaEdit(DBENombre, False);
     HabilitaEdit(DBENif, False);
     HabilitaEdit(DBEDireccion, False);
     HabilitaEdit(DBECodPostal, False);
     HabilitaEdit(DBEColonia, False);
     HabilitaEdit(DBEProvincia, False);
     HabilitaEdit(DBEFPais, False);
     HabilitaEdit(DBENombreContacto, False);
     HabilitaEdit(DBEFPaisDocIdent, False);
     HabilitaEdit(DBEFTipoDocIdent, False);
     HabilitaEdit(DBELocalidad, False);
     HabilitaEdit(DBETelefono01, False);
     HabilitaEdit(DBETelefono02, False);
     HabilitaEdit(DBETelefax, False);
     HabilitaEdit(DBEEmail, False);
     HabilitaEdit(DBMNotas, False);
     HabilitaEdit(DBLCComoNosConocieron, False);
     HabilitaEdit(CBGrabaCrmContacto, False);

     TButtConfirmar.Enabled := False;
     TButtBorrar.Enabled := False;
     BActualizarTercero.Enabled := False;
     SBRefrescarFirma.Enabled := False;

     PNLRellenarDatos.Visible := False;
  end
  else
  begin
     DBENifChange(Self);
     PNLRellenarDatos.Visible := ((IdDocE <> 0) or (IdDocS <> 0) or (Tercero <> 0));
  end;

  RefrescaValidacionDoc;
  TmrValidacion.Enabled := True;
  ARefrescarImagenFirma.Execute;
end;

procedure TFPregNIFFactura.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  ETituloPais.Text := DameTituloPais(DBEFPais.Text);
end;

procedure TFPregNIFFactura.DBENifChange(Sender: TObject);
begin
  inherited;
  // Busco el NIF en terceros y en otros documentos de clientes varios
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT (SELECT FIRST 1 ID_S ');
        SQL.Add('         FROM GES_CABECERAS_S_FAC_NIF ');
        SQL.Add('         WHERE ');
        // SQL.Add('         TIPO = :TIPO AND ');
        SQL.Add('         NIF = :NIF AND ');
        SQL.Add('         NIF <> '''' AND ');
        SQL.Add('         ID_S <> :ID_DOC ');
        SQL.Add('         ORDER BY ID_S DESC) ID_DOC_S, ');
        SQL.Add('        (SELECT FIRST 1 ID_E ');
        SQL.Add('         FROM GES_CABECERAS_E_FAC_NIF ');
        SQL.Add('         WHERE ');
        // SQL.Add('         TIPO = :TIPO AND ');
        SQL.Add('         NIF = :NIF AND ');
        SQL.Add('         NIF <> '''' AND ');
        SQL.Add('         ID_E <> :ID_DOC ');
        SQL.Add('         ORDER BY ID_E DESC) ID_DOC_E, ');
        SQL.Add('        (SELECT FIRST 1 TERCERO ');
        SQL.Add('         FROM SYS_TERCEROS ');
        SQL.Add('         WHERE ');
        SQL.Add('         NIF = :NIF AND ');
        SQL.Add('         NIF <> '''' ');
        SQL.Add('         ORDER BY TERCERO DESC) TERCERO ');
        SQL.Add(' FROM RDB$DATABASE ');

        Params.ByName['NIF'].AsString := Trim(DBENif.Text);
        // Params.ByName['TIPO'].AsString := Tipo;

        Params.ByName['ID_DOC'].AsInteger := 0;
        if (Tipo <> '') then
        begin
           if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
              Params.ByName['ID_DOC'].AsInteger := DBETercero.DataSource.DataSet.FieldByName('ID_S').AsInteger
           else
           if (Tipo = 'TIC') then
              Params.ByName['ID_DOC'].AsInteger := DBETercero.DataSource.DataSet.FieldByName('ID_S').AsInteger
           else
              Params.ByName['ID_DOC'].AsInteger := DBETercero.DataSource.DataSet.FieldByName('ID_E').AsInteger;
        end;

        ExecQuery;

        IdDocE := FieldByName['ID_DOC_E'].AsInteger;
        IdDocS := FieldByName['ID_DOC_S'].AsInteger;
        Tercero := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  PNLRellenarDatos.Visible := ((IdDocE <> 0) or (IdDocS <> 0) or (Tercero <> 0));
end;

procedure TFPregNIFFactura.SBRellenarDatosClick(Sender: TObject);
var
  Datos : TDataSet;
begin
  inherited;
  Datos := DBETercero.DataSource.DataSet;

  if (IdDocS <> 0) then
  begin
     with TFIBTableSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           if not Transaction.InTransaction then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT NOMBRE, NIF, PAIS_DOC_IDENT, TIPO_DOC_IDENT, DIRECCION, C_POSTAL, PROVINCIA, PAIS, LOCALIDAD, TELEFONO01, ');
           SelectSQL.Add(' TELEFONO02, TELEFAX, EMAIL, NOTAS, COLONIA, TERCERO, CARNET_APLICADOR, NOMBRE_CONTACTO, COMO_NOS_CONOCIERON ');
           SelectSQL.Add(' FROM GES_CABECERAS_S_FAC_NIF ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_S = :ID_S ');
           Params.ByName['ID_S'].AsInteger := IdDocS;
           Open;
           Datos.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
           Datos.FieldByName('NIF').AsString := FieldByName('NIF').AsString;
           Datos.FieldByName('PAIS_DOC_IDENT').AsString := FieldByName('PAIS_DOC_IDENT').AsString;
           Datos.FieldByName('TIPO_DOC_IDENT').AsString := FieldByName('TIPO_DOC_IDENT').AsString;
           Datos.FieldByName('DIRECCION').AsString := FieldByName('DIRECCION').AsString;
           Datos.FieldByName('C_POSTAL').AsString := FieldByName('C_POSTAL').AsString;
           Datos.FieldByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
           Datos.FieldByName('LOCALIDAD').AsString := FieldByName('LOCALIDAD').AsString;
           Datos.FieldByName('COLONIA').AsString := FieldByName('COLONIA').AsString;
           Datos.FieldByName('PAIS').AsString := FieldByName('PAIS').AsString;
           Datos.FieldByName('TELEFONO01').AsString := FieldByName('TELEFONO01').AsString;
           Datos.FieldByName('TELEFONO02').AsString := FieldByName('TELEFONO02').AsString;
           Datos.FieldByName('TELEFAX').AsString := FieldByName('TELEFAX').AsString;
           Datos.FieldByName('EMAIL').AsString := FieldByName('EMAIL').AsString;
           Datos.FieldByName('NOTAS').AsString := FieldByName('NOTAS').AsString;
           Datos.FieldByName('TERCERO').AsInteger := FieldByName('TERCERO').AsInteger;
           Datos.FieldByName('NOMBRE_CONTACTO').AsString := FieldByName('NOMBRE_CONTACTO').AsString;
           if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
              Datos.FieldByName('CARNET_APLICADOR').AsString := FieldByName('CARNET_APLICADOR').AsString;
           if ((Tipo = 'TIC') or (Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
              Datos.FieldByName('COMO_NOS_CONOCIERON').AsInteger := FieldByName('COMO_NOS_CONOCIERON').AsInteger;
           Close;
        finally
           Transaction.Free;
           Free;
        end;
     end;
  end;

  if (IdDocE <> 0) then
  begin
     with TFIBTableSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           if not Transaction.InTransaction then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT NOMBRE, NIF, PAIS_DOC_IDENT, TIPO_DOC_IDENT, DIRECCION, C_POSTAL, PROVINCIA, PAIS, LOCALIDAD, ');
           SelectSQL.Add(' TELEFONO01, TELEFONO02, TELEFAX, EMAIL, NOTAS, COLONIA, TERCERO ');
           SelectSQL.Add(' FROM GES_CABECERAS_E_FAC_NIF ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_E = :ID_E ');
           Params.ByName['ID_E'].AsInteger := IdDocE;
           Open;
           Datos.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
           Datos.FieldByName('NIF').AsString := FieldByName('NIF').AsString;
           Datos.FieldByName('PAIS_DOC_IDENT').AsString := FieldByName('PAIS_DOC_IDENT').AsString;
           Datos.FieldByName('TIPO_DOC_IDENT').AsString := FieldByName('TIPO_DOC_IDENT').AsString;
           Datos.FieldByName('DIRECCION').AsString := FieldByName('DIRECCION').AsString;
           Datos.FieldByName('C_POSTAL').AsString := FieldByName('C_POSTAL').AsString;
           Datos.FieldByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
           Datos.FieldByName('LOCALIDAD').AsString := FieldByName('LOCALIDAD').AsString;
           Datos.FieldByName('COLONIA').AsString := FieldByName('COLONIA').AsString;
           Datos.FieldByName('PAIS').AsString := FieldByName('PAIS').AsString;
           Datos.FieldByName('TELEFONO01').AsString := FieldByName('TELEFONO01').AsString;
           Datos.FieldByName('TELEFONO02').AsString := FieldByName('TELEFONO02').AsString;
           Datos.FieldByName('TELEFAX').AsString := FieldByName('TELEFAX').AsString;
           Datos.FieldByName('EMAIL').AsString := FieldByName('EMAIL').AsString;
           Datos.FieldByName('NOTAS').AsString := FieldByName('NOTAS').AsString;
           Datos.FieldByName('TERCERO').AsInteger := FieldByName('TERCERO').AsInteger;
           {No esta este dato en compras
              if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
                 Datos.FieldByName('CARNET_APLICADOR').AsString := FieldByName('CARNET_APLICADOR').AsString;
           }
           Close;
        finally
           Transaction.Free;
           Free;
        end;
     end;
  end;

  if (Tercero <> 0) then
  begin
     with TFIBTableSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           if not Transaction.InTransaction then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT T.NOMBRE_COMERCIAL, T.NIF, T.PAIS_TERCERO, T.TIPO_DOC_IDENT, D.DIR_COMPLETA_N, L.CODIGO_POSTAL, P.TITULO PROVINCIA, L.PAIS, L.TITULO LOCALIDAD, ');
           SelectSQL.Add('        T.TELEFONO01, T.TELEFONO02, T.TELEFAX, T.EMAIL, T.NOTAS, L.COLONIA, T.CARNET_APLICADOR, T.COMO_NOS_CONOCIERON ');
           SelectSQL.Add(' FROM SYS_TERCEROS T ');
           SelectSQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
           SelectSQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
           SelectSQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.TERCERO = :TERCERO AND ');
           SelectSQL.Add(' D.DIR_DEFECTO = 1 ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Open;
           Datos.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE_COMERCIAL').AsString;
           Datos.FieldByName('NIF').AsString := FieldByName('NIF').AsString;
           Datos.FieldByName('PAIS_DOC_IDENT').AsString := FieldByName('PAIS_TERCERO').AsString;
           Datos.FieldByName('TIPO_DOC_IDENT').AsString := FieldByName('TIPO_DOC_IDENT').AsString;
           Datos.FieldByName('DIRECCION').AsString := FieldByName('DIR_COMPLETA_N').AsString;
           Datos.FieldByName('C_POSTAL').AsString := FieldByName('CODIGO_POSTAL').AsString;
           Datos.FieldByName('PROVINCIA').AsString := FieldByName('PROVINCIA').AsString;
           Datos.FieldByName('LOCALIDAD').AsString := FieldByName('LOCALIDAD').AsString;
           Datos.FieldByName('COLONIA').AsString := FieldByName('COLONIA').AsString;
           Datos.FieldByName('PAIS').AsString := FieldByName('PAIS').AsString;
           Datos.FieldByName('TELEFONO01').AsString := FieldByName('TELEFONO01').AsString;
           Datos.FieldByName('TELEFONO02').AsString := FieldByName('TELEFONO02').AsString;
           Datos.FieldByName('TELEFAX').AsString := FieldByName('TELEFAX').AsString;
           Datos.FieldByName('EMAIL').AsString := FieldByName('EMAIL').AsString;
           Datos.FieldByName('NOTAS').AsString := FieldByName('NOTAS').AsString;
           Datos.FieldByName('TERCERO').AsInteger := Tercero;
           if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
              Datos.FieldByName('CARNET_APLICADOR').AsString := FieldByName('CARNET_APLICADOR').AsString;
           if ((Tipo = 'TIC') or (Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
              Datos.FieldByName('COMO_NOS_CONOCIERON').AsInteger := FieldByName('COMO_NOS_CONOCIERON').AsInteger;
           Close;
        finally
           Transaction.Free;
           Free;
        end;
     end;
  end;

  ARefrescarImagenFirma.Execute;
end;

function TFPregNIFFactura.ImprimirCartaLOPD(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False): string;
var
  CuerpoMail : TStrings;
  Archivo : string;
  Tercero : integer;
  NIF : string;
  Datos : TDataSet;
  IdDocFirma : integer;
  TipoFirma : string;
begin
  Datos := DBETercero.DataSource.DataSet;
  Tercero := Datos.FieldByName('TERCERO').AsInteger;
  IdDocFirma := 0;
  TipoFirma := 'LOP';
  if (Tercero = 0) then
  begin
     IdDocFirma := IdDoc;
     TipoFirma := DameTipoFirma(Tipo);
  end;

  NIF := Datos.FieldByName('NIF').AsString;

  AbreData(TDMLstTerceros, DMLstTerceros);

  Archivo := _('CartaLOPD') + '-' + NIF + '.pdf';
  Result := Archivo;
  // Modo 3 solo debe guardar el fichero
  if (Modo = 3) then
     DMLstTerceros.MuestraCartaLOPD(2, TipoFirma, Tercero, IdDocFirma, Archivo)
  else
     DMLstTerceros.MuestraCartaLOPD(Modo, TipoFirma, Tercero, IdDocFirma, Archivo);
  CierraData(DMLstTerceros);

  // Modo 2 es para enviar por email. Genera un PDF y lo deja en %TEMP%
  if (Modo = 2) then
  begin
     AbreData(TDMListados, DMListados);
     CuerpoMail := TStringList.Create;
     try
        CuerpoMail.Add('Este correo ha sido enviado desde:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('Y contiene el fichero adjunto ' + UpperCase(Archivo));
        CuerpoMail.Add('Correspondiente al documento: ' + _('Carta de consentimiento del uso de datos'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This email has been sent from:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('And contains the attached file ' + UpperCase(Archivo));
        CuerpoMail.Add('Corresponding to the document: ' + _('Carta de consentimiento del uso de datos'));

        if MedianteClienteCorreo then
           DMListados.SendMailTerceroPDF2(Tercero, CuerpoMail, DameTempPath + Archivo, Archivo, _('Carta de consentimiento del uso de datos'), 'TER', Tercero, MuestraCuerpo)
        else
           DMListados.SendMailTerceroPDF(Tercero, CuerpoMail, DameTempPath + Archivo, Archivo, _('Carta de consentimiento del uso de datos'), 'TER', Tercero, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;

procedure TFPregNIFFactura.AVisualizarCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  ImprimirCartaLOPD(0, False);
end;

procedure TFPregNIFFactura.AImprimirCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  ImprimirCartaLOPD(1, False);
end;

procedure TFPregNIFFactura.AEnviarEmailCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  ImprimirCartaLOPD(2, False);
end;

procedure TFPregNIFFactura.AEnviarEmailCartaLOPD2Execute(Sender: TObject);
begin
  inherited;
  ImprimirCartaLOPD(2, True);
end;

function TFPregNIFFactura.DameTipoFirma(Tipo: string): string;
begin
  Result := '';
  if Tipo = 'OFC' then
     Result := 'LOO';
  if Tipo = 'PEC' then
     Result := 'LOE';
  if Tipo = 'ALB' then
     Result := 'LOA';
  if Tipo = 'FAC' then
     Result := 'LOF';
  if Tipo = 'TIC' then
     Result := 'LOT';
end;

procedure TFPregNIFFactura.APedirFirmaExecute(Sender: TObject);
var
  IdDocFirma : integer;
  PedirFirma : boolean;
  TipoFirma : string;
begin
  inherited;

  PedirFirma := True;
  IdDocFirma := DBETercero.DataSource.DataSet.FieldByName('TERCERO').AsInteger;

  if (IdDocFirma > 0) then
     TipoFirma := 'LOP'
  else
  begin
     IdDocFirma := IdDoc;
     TipoFirma := DameTipoFirma(Tipo);
  end;

  if PedirFirma then
  begin
     if QMFirmas.Active and (QMFirmas.FieldByName('ID_FIRMA').AsInteger <> 0) then
        PedirFirma := ConfirmaMensaje(_('Ya existe una firma. Desea pedir otra firma.'));
     if PedirFirma then
        DMMain.PedirFirma(TipoFirma, IdDocFirma);
  end;
end;

procedure TFPregNIFFactura.ABorrarFirmaExecute(Sender: TObject);
var
  IdDocFirma : integer;
  TipoFirma : string;
begin
  inherited;

  IdDocFirma := DBETercero.DataSource.DataSet.FieldByName('TERCERO').AsInteger;
  if (IdDocFirma > 0) then
     TipoFirma := 'LOP'
  else
  begin
     IdDocFirma := IdDoc;
     TipoFirma := DameTipoFirma(Tipo);
  end;

  DMMain.BorrarFirma(TipoFirma, IdDocFirma);
end;

procedure TFPregNIFFactura.DBETerceroChange(Sender: TObject);
{
var
  Habilitado : boolean;
}
begin
  inherited;
  // Siempre estara habilitado.
  {
  Habilitado := Assigned(DBETercero.DataSource) and (DBETercero.DataSource.DataSet.FieldByName('TERCERO').AsInteger <> 0);

  AImprimirCartaLOPD.Enabled := Habilitado;
  AVisualizarCartaLOPD.Enabled := Habilitado;
  AEnviarEmailCartaLOPD.Enabled := Habilitado;
  AEnviarEmailCartaLOPD2.Enabled := Habilitado;
  APedirFirma.Enabled := Habilitado;
  ABorrarFirma.Enabled := Habilitado;
  }
end;

procedure TFPregNIFFactura.ImgFirmaDblClick(Sender: TObject);
begin
  inherited;
  ARefrescarImagenFirma.Execute;
end;

procedure TFPregNIFFactura.ARefrescarImagenFirmaExecute(Sender: TObject);
var
  IdDocFirma : integer;
  TipoFirma : string;
begin
  inherited;
  IdDocFirma := StrToIntDef(DBETercero.Text, 0);
  TipoFirma := 'LOP';
  if (IdDocFirma = 0) then
  begin
     IdDocFirma := IdDoc;
     TipoFirma := DameTipoFirma(Tipo);
  end;

  with QMFirmas do
  begin
     Close;
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Params.ByName['TIPO'].AsString := TipoFirma;
     Params.ByName['ID_DOC'].AsInteger := IdDocFirma;
     Open;
  end;

  RefrescarImagenFirma(ImgFirma, QMFirmas.FieldByName('ID_FIRMA').AsInteger);
end;

procedure TFPregNIFFactura.AGuardarComoAdjuntoExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  // Modo=3 : Solo crea el fichero pdf.
  Archivo := ImprimirCartaLOPD(3, False);

  Archivo := DameTempPath + Archivo;
  AbreData(TDMAdjunto, DMAdjunto);
  DMAdjunto.CreaAdjunto(Tipo, IdDoc, Archivo, _('Carta LOPD'));
  CierraData(DMAdjunto);
end;

procedure TFPregNIFFactura.ACrearTerceroExecute(Sender: TObject);
var
  Datos : TDataSource;
  Tercero : integer;
  Cliente : integer;
  Localidad : string;
begin
  inherited;
  Datos := DBETercero.DataSource;
  with Datos.DataSet do
  begin
     Tercero := FieldByName('TERCERO').AsInteger;

     // Evito modificar datos de terceros varios o del tercero de la empresa.
     if (Tercero >= 0) and (Tercero <> REntorno.Tercero) then
     begin
        // Creo un tercero si no existe
        if (Tercero = 0) then
        begin
           // Creo un tercero
           Tercero := DMMain.ContadorGen('CONTA_TERCEROS');

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO VER_TERCEROS_EDICION ');
                 SQL.Add(' (TERCERO, NOMBRE_COMERCIAL, NOMBRE_R_SOCIAL, NIF, PAIS_TERCERO, TIPO_DOC_IDENT, DIR_LOCALIDAD, DIR_DEFECTO) ');
                 SQL.Add(' VALUES ');
                 SQL.Add(' (:TERCERO, :NOMBRE_COMERCIAL, :NOMBRE_R_SOCIAL, :NIF, :PAIS_TERCERO, :TIPO_DOC_IDENT, :DIR_LOCALIDAD, :DIR_DEFECTO) ');
                 Params.ByName['TERCERO'].AsInteger := Tercero;
                 Params.ByName['NOMBRE_COMERCIAL'].AsString := DBENombre.Text;
                 Params.ByName['NOMBRE_R_SOCIAL'].AsString := DBENombre.Text;
                 Params.ByName['NIF'].AsString := DBENif.Text;
                 Params.ByName['PAIS_TERCERO'].AsString := DBEFPaisDocIdent.Text;
                 Params.ByName['TIPO_DOC_IDENT'].AsString := DBEFTipoDocIdent.Text;
                 Params.ByName['DIR_LOCALIDAD'].AsString := '99999999';
                 Params.ByName['DIR_DEFECTO'].AsInteger := 1;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           FieldByName('TERCERO').AsInteger := Tercero;
        end;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT CLIENTE FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND TERCERO = :TERCERO ORDER BY CLIENTE';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['TERCERO'].AsInteger := Tercero;
              ExecQuery;
              Cliente := FieldByName['CLIENTE'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Cliente <> 0) then
           ShowMessage(format(_('El tercero ya es el cliente %d.' + #13#10 + 'Modifiquelo desde su ficha.'), [Cliente]))
        else
        begin
           // Modifico el tercero lo mejor que pueda

           // Primero trato de averiguar la localidad
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT LOCALIDAD ');
                 SQL.Add(' FROM SYS_LOCALIDADES ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' PAIS = :PAIS AND ');
                 SQL.Add(' CODIGO_POSTAL = :CODIGO_POSTAL AND ');
                 SQL.Add(' TITULO LIKE ''%'' || :TITULO || ''%'' ');
                 Params.ByName['PAIS'].AsString := DBEFPais.Text;
                 Params.ByName['CODIGO_POSTAL'].AsString := Trim(DBECodPostal.Text);
                 Params.ByName['TITULO'].AsString := Trim(DBELocalidad.Text);
                 ExecQuery;
                 Localidad := Trim(FieldByName['LOCALIDAD'].AsString);
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (Localidad = '') then
           begin
              // Si no encuentro localidad la busco por codigo postal
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT LOCALIDAD ');
                    SQL.Add(' FROM SYS_LOCALIDADES ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' PAIS = :PAIS AND ');
                    SQL.Add(' CODIGO_POSTAL = :CODIGO_POSTAL ');
                    Params.ByName['PAIS'].AsString := DBEFPais.Text;
                    Params.ByName['CODIGO_POSTAL'].AsString := Trim(DBECodPostal.Text);
                    ExecQuery;
                    Localidad := Trim(FieldByName['LOCALIDAD'].AsString);
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           if (Localidad = '') then
           begin
              // Si no encuentro localidad la busco por pais
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT LOCALIDAD ');
                    SQL.Add(' FROM SYS_LOCALIDADES ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' PAIS = :PAIS ');
                    Params.ByName['PAIS'].AsString := DBEFPais.Text;
                    ExecQuery;
                    Localidad := Trim(FieldByName['LOCALIDAD'].AsString);
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           if (Localidad = '') then
              Localidad := '99999999';

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE SYS_TERCEROS_DIRECCIONES ');
                 SQL.Add(' SET ');
                 SQL.Add(' DIR_LOCALIDAD = :DIR_LOCALIDAD, ');
                 SQL.Add(' DIR_NOMBRE = :DIR_NOMBRE, ');
                 SQL.Add(' DIR_TELEFONO01 = :TELEFONO01, ');
                 SQL.Add(' DIR_TELEFONO02 = :TELEFONO02, ');
                 SQL.Add(' DIR_TELEFAX = :TELEFAX ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' TERCERO = :TERCERO AND ');
                 SQL.Add(' DIR_DEFECTO = 1 ');
                 Params.ByName['DIR_LOCALIDAD'].AsString := Localidad;
                 Params.ByName['DIR_NOMBRE'].AsString := DBEDireccion.Text;
                 Params.ByName['TELEFONO01'].AsString := DBETelefono01.Text;
                 Params.ByName['TELEFONO02'].AsString := DBETelefono02.Text;
                 Params.ByName['TELEFAX'].AsString := DBETelefax.Text;
                 Params.ByName['TERCERO'].AsInteger := Tercero;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE SYS_TERCEROS ');
                 SQL.Add(' SET ');
                 SQL.Add(' NOMBRE_R_SOCIAL = :NOMBRE_R_SOCIAL, ');
                 SQL.Add(' NOMBRE_COMERCIAL = :NOMBRE_COMERCIAL, ');
                 SQL.Add(' NIF = :NIF, ');
                 SQL.Add(' PAIS_TERCERO = :PAIS_TERCERO, ');
                 SQL.Add(' TIPO_DOC_IDENT = :TIPO_DOC_IDENT, ');
                 SQL.Add(' NOTAS = :NOTAS, ');
                 SQL.Add(' EMAIL = :EMAIL ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' TERCERO = :TERCERO ');
                 Params.ByName['NOMBRE_R_SOCIAL'].AsString := DBENombre.Text;
                 Params.ByName['NOMBRE_COMERCIAL'].AsString := DBENombre.Text;
                 Params.ByName['NIF'].AsString := DBENif.Text;
                 Params.ByName['PAIS_TERCERO'].AsString := DBEFPaisDocIdent.Text;
                 Params.ByName['TIPO_DOC_IDENT'].AsString := DBEFTipoDocIdent.Text;
                 Params.ByName['NOTAS'].AsString := DBMNotas.Text;
                 Params.ByName['EMAIL'].AsString := DBEEmail.Text;
                 Params.ByName['TERCERO'].AsInteger := Tercero;
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

procedure TFPregNIFFactura.ACrearClienteExecute(Sender: TObject);
var
  Cliente : integer;
  Datos : TDataSet;
begin
  inherited;

  Datos := DBETercero.DataSource.DataSet;

  ACrearTerceroExecute(Sender);

  AbreData(TDMClientes, DMClientes);
  try
     with DMClientes.QMClientes do
     begin
        Insert;
        FieldByName('TERCERO').AsInteger := Datos.FieldByName('TERCERO').AsInteger;
        Post;
        Cliente := FieldByName('CLIENTE').AsInteger;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE GES_CABECERAS_S SET CLIENTE = :CLIENTE WHERE ID_S = :ID_S');
           Params.ByName['ID_S'].AsInteger := IdDoc;
           Params.ByName['CLIENTE'].AsInteger := Cliente;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  finally
     CierraData(DMClientes);
  end;

  ModalResult := mrCancel;
end;

procedure TFPregNIFFactura.DBENombreExit(Sender: TObject);
begin
  inherited;
  if (DBENombreContacto.Text = '') then
     DBENombreContacto.Text := DBENombre.Text;

  DBEFPaisDocIdentExit(Sender);
end;

procedure TFPregNIFFactura.CreaCrMContacto;
var
  IDContacto : integer;
begin
  // Verificamos si ya existe un contacto con ese NIF
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COALESCE(ID_CONTACTO, 0) AS ID_CONTACTO FROM CRM_CONTACTOS WHERE NIF = :NIF AND NIF <> '''' AND TERCERO = -1 ';
        Params.ByName['NIF'].AsString := DBENif.Text;
        ExecQuery;
        IDContacto := FieldByName['ID_CONTACTO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si no existe el Crm Contacto lo creamos
  if (IDContacto <= 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('INSERT INTO CRM_VER_CONTACTOS ( ');
           SQL.Add('ID_CONTACTO, TERCERO, NOMBRE_R_SOCIAL, NOMBRE_COMERCIAL, NIF, TELEFONO01, TELEFONO02, TELEFAX, DIR_NOMBRE, ');
           SQL.Add(' EMAIL, ORIGEN_CONTACTO) ');
           SQL.Add('VALUES ( ');
           SQL.Add('0, -1, :NOMBRE_R_SOCIAL, :NOMBRE_COMERCIAL, :NIF, :TELEFONO01, :TELEFONO02, :TELEFAX, :DIR_NOMBRE, ');
           SQL.Add(':EMAIL, ''DES'') ');
           Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(DBENombreContacto.Text, 1, 60);
           Params.ByName['NOMBRE_COMERCIAL'].AsString := Copy(DBENombreContacto.Text, 1, 60);
           Params.ByName['NIF'].AsString := Copy(DBENif.Text, 1, 20);
           Params.ByName['TELEFONO01'].AsString := Copy(DBETelefono01.Text, 1, 20);
           Params.ByName['TELEFONO02'].AsString := Copy(DBETelefono02.Text, 1, 20);
           Params.ByName['TELEFAX'].AsString := Copy(DBETelefax.Text, 1, 20);
           Params.ByName['DIR_NOMBRE'].AsString := Copy(DBEDireccion.Text + ', ' + DBELocalidad.Text + ', CP: ' + DBECodPostal.Text, 1, 200);
           Params.ByName['EMAIL'].AsString := Copy(DBEEmail.Text, 1, 100);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('UPDATE CRM_VER_CONTACTOS ');
           SQL.Add('SET ');
           SQL.Add('TERCERO = -1, ');
           SQL.Add('NOMBRE_R_SOCIAL = :NOMBRE_R_SOCIAL, ');
           SQL.Add('NOMBRE_COMERCIAL = :NOMBRE_COMERCIAL, ');
           SQL.Add('NIF = :NIF, ');
           SQL.Add('TELEFONO01 = :TELEFONO01, ');
           SQL.Add('TELEFONO02 = :TELEFONO02, ');
           SQL.Add('TELEFAX = :TELEFAX, ');
           SQL.Add('DIR_NOMBRE = :DIR_NOMBRE, ');
           SQL.Add('EMAIL = :EMAIL, ');
           SQL.Add('ORIGEN_CONTACTO = ''DES'' ');
           SQL.Add('WHERE ');
           SQL.Add('ID_CONTACTO = :ID_CONTACTO ');
           Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(DBENombreContacto.Text, 1, 60);
           Params.ByName['NOMBRE_COMERCIAL'].AsString := Copy(DBENombreContacto.Text, 1, 60);
           Params.ByName['NIF'].AsString := Copy(DBENif.Text, 1, 20);
           Params.ByName['TELEFONO01'].AsString := Copy(DBETelefono01.Text, 1, 20);
           Params.ByName['TELEFONO02'].AsString := Copy(DBETelefono02.Text, 1, 20);
           Params.ByName['TELEFAX'].AsString := Copy(DBETelefax.Text, 1, 20);
           Params.ByName['DIR_NOMBRE'].AsString := Copy(DBEDireccion.Text + ', ' + DBELocalidad.Text + ', CP: ' + DBECodPostal.Text, 1, 200);
           Params.ByName['EMAIL'].AsString := Copy(DBEEmail.Text, 1, 100);
           Params.ByName['ID_CONTACTO'].AsInteger := IDContacto;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFPregNIFFactura.DBEFTipoDocIdentChange(Sender: TObject);
begin
  inherited;
  ETipoDocumentoTitulo.Text := DameTituloTipoDocIdentidad(DBENif.DataSource.DataSet.FieldByName('PAIS_DOC_IDENT').AsString, DBENif.DataSource.DataSet.FieldByName('TIPO_DOC_IDENT').AsString);
end;

procedure TFPregNIFFactura.DBEFPaisDocIdentExit(Sender: TObject);
var
  Valido : boolean;
  MensajeError : string;
begin
  inherited;
  if (LeeParametro('TERLNIF001') = 'S') then
  begin
     if (DBENif.DataSource.DataSet.State in [dsEdit, dsInsert]) then
     begin
        DBENif.Text := LimpiaNIF(DBEFPaisDocIdent.Text, DBENif.Text);
        DBENifChange(Sender);
     end;
  end;

  DMMain.VerificaDocumentoIdentificacion(DBEFPaisDocIdent.Text, DBEFTipoDocIdent.Text, DBENif.Text, Valido, MensajeError);
  if Valido then
  begin
     if Valido and (DBEFPaisDocIdent.Text = 'ESP') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE OR INSERT INTO VALIDACION_DOCUMENTO ( ');
              SQL.Add(' PAIS, TIPO_DOC_IDENT, DOCUMENTO, NOMBRE) ');
              SQL.Add(' VALUES ( ');
              SQL.Add(' :PAIS, :TIPO_DOC_IDENT, :DOCUMENTO, :NOMBRE) ');
              SQL.Add(' MATCHING (PAIS, TIPO_DOC_IDENT, DOCUMENTO) ');
              Params.ByName['DOCUMENTO'].AsString := DBENif.Text;
              Params.ByName['PAIS'].AsString := DBEFPaisDocIdent.Text;
              Params.ByName['TIPO_DOC_IDENT'].AsString := DBEFTipoDocIdent.Text;
              Params.ByName['NOMBRE'].AsString := DBENombre.Text;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     RefrescaValidacionDoc;
     TmrValidacion.Enabled := True;

     DBENif.Hint := '';
     ColorEdicion(DBENif);
  end
  else
  begin
     DBENif.Hint := MensajeError;
     ColorError(DBENif);
  end;
end;

procedure TFPregNIFFactura.DBEFTipoDocIdentBusqueda(Sender: TObject);
begin
  inherited;
  DBEFTipoDocIdent.CondicionBusqueda := 'PAIS = ''' + DBEFPaisDocIdent.Text + '''';
end;

procedure TFPregNIFFactura.xValidacionDocAfterOpen(DataSet: TDataSet);
var
  ColorFondo, ColorTexto : TColor;
begin
  inherited;
  if (DBENif.Text = '') or (DBTValidacionResultado.Caption = '') or (DBTValidacionResultado.Caption = 'IDENTIFICADO') or (DBTValidacionResultado.Caption = 'VALIDO') then
  begin
     ColorFondo := clBtnFace;
     ColorTexto := clWindowText;
  end
  else
  begin
     ColorFondo := clRed;
     ColorTexto := clWhite;
  end;

  DBTValidacionResultado.Color := ColorFondo;
  DBTValidacionNombre.Color := ColorFondo;
  DBTValidacionFechaCombrobacion.Color := ColorFondo;
  DBTValidacionResultado.Font.Color := ColorTexto;
  DBTValidacionNombre.Font.Color := ColorTexto;
  DBTValidacionFechaCombrobacion.Font.Color := ColorTexto;
end;

procedure TFPregNIFFactura.RefrescaValidacionDoc;
begin
  with xValidacionDoc do
  begin
     Close;
     Params.ByName['PAIS'].AsString := DBEFPaisDocIdent.Text;
     Params.ByName['TIPO_DOC_IDENT'].AsString := DBEFTipoDocIdent.Text;
     Params.ByName['NIF'].AsString := DBENif.Text;
     Open;
  end;
end;

procedure TFPregNIFFactura.TmrValidacionTimer(Sender: TObject);
begin
  inherited;
  TmrValidacion.Enabled := False;
  try
     RefrescaValidacionDoc;
  finally
     if (YearOf(xValidacionDocFECHA_COMPROBACION.AsDateTime) < 2000) then
     begin
        LValidacionDocumento.Caption := _('Pendiente');
        TmrValidacion.Enabled := True;
     end
     else
     begin
        LValidacionDocumento.Caption := _('Validacion');
     end;
  end;
end;

end.
