unit UFMCuerpoMailPDF;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ULFDBMemo, ExtCtrls, ULFPanel, ULFMemo, UFormGest,
  TFlatButtonUnit, DB, FIBDataSetRO, ULFComboBox, CheckLst, FIBQuery,
  ULFLabel, TFlatCheckBoxUnit, ULFCheckBox, ComCtrls, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel, ToolWin, ULFToolBar, ULFEdit;

type
  TFMCuerpoMailPDF = class(TFPEditSinNavegador)
     PnlBotones: TLFPanel;
     PnlNotas: TLFPanel;
     MmCuerpo: TLFMemo;
     FBtnAceptar: TFlatButton;
     FBtnCancelar: TFlatButton;
     PNMail: TLFPanel;
     LBLMail: TLFLabel;
     LFCBMail: TLFComboBox;
     CBEnvioTodasDirecciones: TLFCheckBox;
     LVDirecciones: TListView;
     TSep1: TToolButton;
     TButSeleccionarTodo: TToolButton;
     TButtDeseleccionarTodo: TToolButton;
     LVAdjuntos: TListView;
     ESubject: TLFEdit;
     PNLMensaje: TLFPanel;
     PNLSubject: TLFPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FBtnAceptarClick(Sender: TObject);
     procedure FBtnCancelarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
     procedure TButSeleccionarTodoClick(Sender: TObject);
     procedure TButtDeseleccionarTodoClick(Sender: TObject);
  private
     { Private declarations }
     procedure Marcar(Marca: boolean);
  public
     { Public declarations }
     SoloAdjuntos: boolean;
     procedure AddAdjunto(Tipo: string; ID: integer);
  end;

var
  FMCuerpoMailPDF : TFMCuerpoMailPDF;

function EditarCuerpo(Owner: TComponent; Cuerpo: TStrings; var Subject: string; Tipo: string; ID: integer; Adjuntos, Mails, NombreMails: TStrings; SoloAdj: boolean = False): boolean;

implementation

uses UDMMain, UEntorno, UUtiles, UDMAdjunto, UParam;

{$R *.dfm}

procedure TFMCuerpoMailPDF.FormCreate(Sender: TObject);
begin
  inherited;
  GetBitmapFromImageList(FBtnAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(FBtnCancelar, 1, DMMain.ILMain_Ac, 0);
end;

procedure TFMCuerpoMailPDF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TFMCuerpoMailPDF.FBtnAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFMCuerpoMailPDF.FBtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFMCuerpoMailPDF.AddAdjunto(Tipo: string; ID: integer);
var
  ListItem : TListItem;
begin
  /// Agrega a la seleccion de adjuntos disponibles, segun el tipo de adjunto.
  /// Recurisivamente agrega otros adjuntos relacionados. Ejemplo (FAC --> CLI --> TER)

  if (ID > 0) then
  begin
     with TFIBQuery.Create(nil) do
     begin
        try
           Close;
           Database := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SQL.Text := 'SELECT * FROM VER_ADJUNTOS WHERE TIPO=?TIPO AND ID=?ID ORDER BY FECHA DESC';
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['ID'].AsInteger := ID;
              ExecQuery;
              while not EOF do
              begin
                 ListItem := LVAdjuntos.Items.Add;
                 ListItem.Caption := FieldByName['TITULO_ADJUNTO'].AsString;
                 ListItem.SubItems.Add(FieldByName['NOMBRE'].AsString);
                 ListItem.SubItems.Add(Tipo);
                 ListItem.SubItems.Add(FieldByName['ID_ADJUNTO'].AsString);

                 Next;
              end;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Si es un documento de venta muestro adjuntos del cliente y de los articulos
     if ((tipo = 'OFC') or (tipo = 'PEC') or (tipo = 'ALB') or (tipo = 'FAC')) then
     begin
        with TFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SQL.Text := 'SELECT C.ID_CLIENTE FROM GES_CABECERAS_S CC JOIN EMP_CLIENTES C ON CC.EMPRESA = C.EMPRESA AND CC.CLIENTE = C.CLIENTE WHERE CC.ID_S = :ID_S';
                 Params.ByName['ID_S'].AsInteger := ID;
                 ExecQuery;
                 while not EOF do
                 begin
                    AddAdjunto('CLI', FieldByName['ID_CLIENTE'].AsInteger);
                    Next;
                 end;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;

        with TFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SQL.Text := 'SELECT DISTINCT ID_A FROM GES_DETALLES_S WHERE ID_S = :ID_S';
                 Params.ByName['ID_S'].AsInteger := ID;
                 ExecQuery;
                 while not EOF do
                 begin
                    AddAdjunto('ART', FieldByName['ID_A'].AsInteger);
                    Next;
                 end;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Si es un documento de compra muestro adjuntos del proveedor y de los articulos
     if ((tipo = 'OCP') or (tipo = 'OFP') or (tipo = 'PEP') or (tipo = 'ALP') or (tipo = 'FAP')) then
     begin
        with TFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 if (Tipo = 'OFP') then
                    SQL.Text := 'SELECT P.ID_PROVEEDOR FROM GES_CABECERAS_E_OFP C JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR = P.PROVEEDOR WHERE C.ID_E = :ID_E';
                 if (Tipo = 'OCP') then
                    SQL.Text := 'SELECT P.ID_PROVEEDOR FROM GES_CABECERAS_E_OCP C JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR = P.PROVEEDOR WHERE C.ID_E = :ID_E';
                 if (Tipo = 'PEP') then
                    SQL.Text := 'SELECT P.ID_PROVEEDOR FROM GES_CABECERAS_E_PED C JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR = P.PROVEEDOR WHERE C.ID_E = :ID_E';
                 if (Tipo = 'ALP') then
                    SQL.Text := 'SELECT P.ID_PROVEEDOR FROM GES_CABECERAS_E_ALB C JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR = P.PROVEEDOR WHERE C.ID_E = :ID_E';
                 if (Tipo = 'FAP') then
                    SQL.Text := 'SELECT P.ID_PROVEEDOR FROM GES_CABECERAS_E_FAC C JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR = P.PROVEEDOR WHERE C.ID_E = :ID_E';
                 Params.ByName['ID_E'].AsInteger := ID;
                 ExecQuery;
                 while not EOF do
                 begin
                    AddAdjunto('PRO', FieldByName['ID_PROVEEDOR'].AsInteger);
                    Next;
                 end;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;

        with TFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SQL.Text := 'SELECT DISTINCT ID_A FROM GES_DETALLES_E WHERE ID_E = :ID_E';
                 Params.ByName['ID_E'].AsInteger := ID;
                 ExecQuery;
                 while not EOF do
                 begin
                    AddAdjunto('ART', FieldByName['ID_A'].AsInteger);
                    Next;
                 end;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Si es una factura de acreedor muestro adjuntos del acreedor
     if (tipo = 'FCR') then
     begin
        with TFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SQL.Text := 'SELECT A.ID_ACREEDOR FROM GES_CABECERAS_E_FCR C JOIN EMP_ACREEDORES A ON C.EMPRESA = A.EMPRESA AND C.ACREEDOR = A.ACREEDOR WHERE C.ID_E = :ID_E';
                 Params.ByName['ID_E'].AsInteger := ID;
                 ExecQuery;
                 while not EOF do
                 begin
                    AddAdjunto('ACR', FieldByName['ID_ACREEDOR'].AsInteger);
                    Next;
                 end;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Si es cliente agrego adjuntos de tercero
     if (tipo = 'CLI') then
     begin
        with TFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SQL.Text := 'SELECT TERCERO FROM EMP_CLIENTES WHERE ID_CLIENTE = :ID_CLIENTE';
                 Params.ByName['ID_CLIENTE'].AsInteger := ID;
                 ExecQuery;
                 while not EOF do
                 begin
                    AddAdjunto('TER', FieldByName['TERCERO'].AsInteger);
                    Next;
                 end;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Si es proveedor agrego adjuntos de tercero
     if (tipo = 'PRO') then
     begin
        with TFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SQL.Text := 'SELECT TERCERO FROM EMP_PROVEEDORES WHERE ID_PROVEEDOR = :ID_PROVEEDOR';
                 Params.ByName['ID_PROVEEDOR'].AsInteger := ID;
                 ExecQuery;
                 while not EOF do
                 begin
                    AddAdjunto('TER', FieldByName['TERCERO'].AsInteger);
                    Next;
                 end;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Si es acreedor agrego adjuntos de tercero
     if (tipo = 'ACR') then
     begin
        with TFIBQuery.Create(nil) do
        begin
           try
              Close;
              Database := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SQL.Text := 'SELECT TERCERO FROM EMP_ACREEDORES WHERE ID_ACREEDOR = :ID_ACREEDOR';
                 Params.ByName['ID_ACREEDOR'].AsInteger := ID;
                 ExecQuery;
                 while not EOF do
                 begin
                    AddAdjunto('TER', FieldByName['TERCERO'].AsInteger);
                    Next;
                 end;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

function EditarCuerpo(Owner: TComponent; Cuerpo: TStrings; var Subject: string; Tipo: string; ID: integer; Adjuntos, Mails, NombreMails: TStrings; SoloAdj: boolean = False): boolean;
var
  i, j : integer;
  ListItem : TListItem;
  bit : word;
  Marca : array[0..1] of string;
  SubItemDocumento : integer;
  ParamSELMAIL001 : boolean;
begin
  /// Recibe una lista de correos y los nombres asociados
  /// Devolverá la lista rellenada solo con los correos seleccionados.

  with TFMCuerpoMailPDF.Create(Owner) do
  begin
     try
        SoloAdjuntos := SoloAdj;
        if (SoloAdjuntos) then
        begin
           MmCuerpo.Visible := False;
           LVAdjuntos.Align := alClient;
        end;

        // Asigno el texto al Memo para editar y lo borro.
        // Si queda vacio, se ha cancelado este formulario
        MmCuerpo.Clear;
        MmCuerpo.Lines.AddStrings(Cuerpo);
        Cuerpo.Clear;

        ESubject.Text := Subject;

        // Ponemos las direcciones en el ListView
        Marca[0] := ' ';
        Marca[1] := 'X';
        LVDirecciones.Items.Clear;
        for i := 0 to NombreMails.Count - 1 do
        begin
           ListItem := LVDirecciones.Items.Add;
           ListItem.Caption := NombreMails[i];
           bit := integer(TStringList(NombreMails).Objects[i]);

           // Este bit indica que es el email de la ficha de tercero
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 1024) = 1024)]);

           // Estos bit indican a que documento se asocian
           // (1: FAC, 2=ALB, 4=PEC, 8=OFC, 16=FCR, 32=FAP, 64=ALP, 128=PEP, 256=OFP, 512=OCP)
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 1) = 1)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 2) = 2)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 4) = 4)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 8) = 8)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 16) = 16)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 32) = 32)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 64) = 64)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 128) = 128)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 256) = 256)]);
           ListItem.SubItems.Add(Marca[BoolToInt((bit and 512) = 512)]);
        end;

        // Selecciono cuales son los correos a marcar por defecto
        // Primero los que correspondan al tipo de documento.
        // Si no encuentro ninguno, según parámetro Todos o el de la ficha del tercero
        SubItemDocumento := 0;
        if Tipo = 'FAC' then
           SubItemDocumento := 1;
        if Tipo = 'ALB' then
           SubItemDocumento := 2;
        if Tipo = 'PEC' then
           SubItemDocumento := 3;
        if Tipo = 'OFC' then
           SubItemDocumento := 4;
        if Tipo = 'FCR' then
           SubItemDocumento := 5;
        if Tipo = 'FAP' then
           SubItemDocumento := 6;
        if Tipo = 'ALP' then
           SubItemDocumento := 7;
        if Tipo = 'PEP' then
           SubItemDocumento := 8;
        if Tipo = 'OFP' then
           SubItemDocumento := 9;
        if Tipo = 'OCP' then
           SubItemDocumento := 10;

        with LVDirecciones do
        begin
           // Marco las direcciones que corresponden al tipo de documento y las voy contanto
           j := 0;
           for i := 0 to Items.Count - 1 do
           begin
              if (Items[i].SubItems[SubItemDocumento] = 'X') then
              begin
                 Items[i].Checked := True;
                 Inc(j);
              end;
           end;

           // Si no he marcado ninguna direccion marco por defecto dependiendo de parámetro SELMAIL001.
           if (j = 0) then
           begin
              // Si no existen direcciones para el tipo de docummento, enviar a *T*odos los correos asociados al tercero o solo al de la *F*icha de tercero (T/F)
              ParamSELMAIL001 := (LeeParametro('SELMAIL001') = 'T');
              for i := 0 to Items.Count - 1 do
                 Items[i].Checked := (Items[i].SubItems[0] = 'X') or ParamSELMAIL001;
           end;
        end;

        // Agrego los adjuntos segun tipo
        AddAdjunto(Tipo, ID);

        // Si no hay adjuntos o no esta habilitado lo invisibilizo
        if ((LVAdjuntos.Items.Count <= 0) or (DMMain.EstadoKri(242) <> 1)) then
           LVAdjuntos.Visible := False;

        Result := (ShowModal = mrOk);

        if (Result) then
        begin
           // Dejo solo los correos seleccionados
           for i := 0 to LVDirecciones.Items.Count - 1 do
           begin
              if (not LVDirecciones.Items[i].Checked) then
              begin
                 j := NombreMails.IndexOf(LVDirecciones.Items[i].Caption);
                 NombreMails.Delete(j);
                 Mails.Delete(j);
              end;
           end;

           if (Mails.Count > 0) then
           begin
              // Asigno los adjuntos seleccionados
              for i := 0 to LVAdjuntos.Items.Count - 1 do
              begin
                 if (LVAdjuntos.Items[i].Checked) then
                    Adjuntos.Add(DMAdjunto.DameAdjunto(StrToInt((LVAdjuntos.Items[i].SubItems[2]))));
              end;

              // Asigno el texto del cuerpo
              Cuerpo.AddStrings(MmCuerpo.Lines);
           end;
           Subject := ESubject.Text;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMCuerpoMailPDF.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFMCuerpoMailPDF.Marcar(Marca: boolean);
var
  i : integer;
begin
  inherited;
  for i := 0 to LVDirecciones.Items.Count - 1 do
     LVDirecciones.Items[i].Checked := Marca;
end;

procedure TFMCuerpoMailPDF.TButSeleccionarTodoClick(Sender: TObject);
begin
  inherited;
  Marcar(True);
end;

procedure TFMCuerpoMailPDF.TButtDeseleccionarTodoClick(Sender: TObject);
begin
  inherited;
  Marcar(False);
end;

end.
