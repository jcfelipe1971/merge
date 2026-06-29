unit UCrmDMAsistenteImpContactos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet;

type
  TCrmDMAsistenteImpContactos = class(TDataModule)
     TLocal: THYTransaction;
     XLApp: TExcelApplication;
     QLlenarTemporal: THYFIBQuery;
     QBorrarTemporal: THYFIBQuery;
     QSeleccionarTodas: THYFIBQuery;
     QMContactosImp: TFIBTableSet;
     DSQMContactosImp: TDataSource;
     QInsertarContacto: THYFIBQuery;
     QMContactosImpENTRADA: TIntegerField;
     QMContactosImpLINEA: TIntegerField;
     QMContactosImpEMPRESA: TIntegerField;
     QMContactosImpNOMBRE_CONTACTO: TFIBStringField;
     QMContactosImpCODIGO_POSTAL: TFIBStringField;
     QMContactosImpDIRECCION: TFIBStringField;
     QMContactosImpPERSONA_CONTACTO: TFIBStringField;
     QMContactosImpOBSERVACIONES: TMemoField;
     QMContactosImpTELEFONO1: TFIBStringField;
     QMContactosImpTELEFONO2: TFIBStringField;
     QMContactosImpEMAIL: TFIBStringField;
     QMContactosImpWEB: TFIBStringField;
     QMContactosImpIMPORTAR: TIntegerField;
     QInsertarPContacto: THYFIBQuery;
     QMContactosImpFAX: TFIBStringField;
     QMContactosImpNIF: TFIBStringField;
     QMContactosImpFORMA_PAGO_IMP: TFIBStringField;
     QMContactosImpCLI_PROV_IMP: TFIBStringField;
     QMContactosImpORIGEN_IMP: TFIBStringField;
     xTiposOrigenes: TFIBDataSetRO;
     DSxTiposOrigenes: TDataSource;
     xTiposOrigenesTORIGEN: TFIBStringField;
     xTiposOrigenesDESCRIPCION: TFIBStringField;
     QMContactosImpAGENTE: TIntegerField;
     QMContactosImpZONA: TFIBStringField;
     QMContactosImpNOMBRE_R_SOCIAL: TFIBStringField;
     QMContactosImpNOMBRE_CORTO: TFIBStringField;
     QMContactosImpNOTAS: TBlobField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMContactosImpAfterPost(DataSet: TDataSet);
     procedure QMContactosImpNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     Filas: TObjectList;
     ColNombre, ColCP, ColDireccion, ColPContacto, ColObservaciones, ColTelefono1, ColTelefono2, ColEmail, ColWeb, ColFax, ColNif, ColClienteImp, ColFormaPagoImp, ColZona, ColRSocial, ColNombreCorto, ColNotas{, ColOrigenImp, ColAgenteImp}: smallint;
     {TipoCalculo: smallint;}
     {ActBloq,} FilaSiguiente: boolean;
     {Tarifa: string;}
  public
     { Public declarations }
     function LeerDatos(Archivo: string): boolean;
     function DameFilas: TObjectList;
     function DameColumnas: TStrings;
     function LlenarTablaTemporal(CNombre, CCP, CDireccion, CPContacto, CObservaciones, CTelefono1, CTelefono2, CEmail, CWeb, CFax, CNif, CCliente, CFormaPago, CZona, CRSocial, CNombreCorto, CNotas: smallint; COrigen: string; CAgente: integer): boolean;
     procedure BorrarTablaTemporal;
     procedure AbrirContactosImp;
     procedure SeleccionarTodas(Modo: smallint);
     procedure InsertarContactos;
     function BuscarLocalidad(CodigoPostal: string): string;
     procedure ZonaControl(zona: string);
  end;

var
  CrmDMAsistenteImpContactos : TCrmDMAsistenteImpContactos;

implementation

uses UDMMain, UEntorno, Variants, UUtiles, Dialogs, StrUtils,
  UCrmFMAsistenteImpContactos, UParam;

{$R *.dfm}

procedure TCrmDMAsistenteImpContactos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  Filas := TObjectList.Create;
end;

procedure TCrmDMAsistenteImpContactos.DataModuleDestroy(Sender: TObject);
begin
  Filas.Free;
  XLApp.Quit;
  BorrarTablaTemporal;
end;

function TCrmDMAsistenteImpContactos.LeerDatos(Archivo: string): boolean;
var
  WorkBk : _WorkBook;
  WorkSheet : _WorkSheet;
  f, c, x, y, i, j : integer;
  IIndex : olevariant;
  Matrix : variant;
  Columnas : TObjectList;
  StrList : TStrings;
begin
  IIndex := 1;
  Result := True;
  FilaSiguiente := False;
  try
     Columnas := TObjectList.Create;
     XLApp.Connect;
     try
        XLApp.WorkBooks.Open(Archivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, 0);

        WorkBk := XLApp.WorkBooks.Item[IIndex];
        WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;

        WorkSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

        with XLApp.Range['A1', XLApp.ActiveCell] do
        begin
           x := Rows.Count;
           y := Columns.Count;
           Matrix := Value;
        end;

        // XLApp.Quit;
        // XLApp.Disconnect;

        // se eliminan las columnas vacías
        Columnas.Capacity := y;
        for c := 1 to y do
        begin
           StrList := TStringList.Create;
           for f := 1 to x do
              StrList.Add(LimpiaCeldaExcel(Matrix[f, c]));
           if Trim(StrList.Text) <> '' then
              Columnas.Add(StrList)
           else
              StrList.Free;
        end;

        // Matrix := Unassigned;

        // se elimanan las filas vacías.
        Filas.Clear;
        Filas.Capacity := x;
        for f := 0 to x - 1 do
        begin
           StrList := TStringList.Create;
           for c := 0 to Columnas.Count - 1 do
              StrList.Add((Columnas.Items[c] as TStrings)[f]);
           if Trim(StrList.Text) <> '' then
              Filas.Add(StrList)
           else
              StrList.Free;
        end;

        // asegurarse que las columnas tenga el título correcto
        i := 0;
        while (i < Columnas.Count) and
           ((IsValidIdent(Trim((Filas.Items[0] as TStrings)[i]))) or
              (Trim((Filas.Items[0] as TStrings)[i]) = '')) do
           i := i + 1;
        if ((i < Columnas.Count) and
           (Pos('ARTICULO', UpperCase((Filas.Items[0] as TStrings)[i])) = 0)) then
        begin
           StrList := TStringList.Create;
           for j := 0 to Columnas.Count - 1 do
              StrList.Add('Columna ' + IntToStr(j + 1));
           Filas.Insert(0, StrList);
           FilaSiguiente := True;
        end
        else
        if (Trim((Filas.Items[0] as TStrings)[j]) = '') then
        begin
           (Filas.Items[0] as TStrings)[j] := 'Columna ' + IntToStr(j + 1);
           FilaSiguiente := True;
        end;
     finally
        Matrix := Unassigned;
        XLApp.Disconnect;
        XLApp.Quit;
        Columnas.Free;
     end;
  except
     on E: Exception do
     begin
        MensajesDeError(E);
        Result := False;
     end;
  end;
end;

function TCrmDMAsistenteImpContactos.DameFilas: TObjectList;
begin
  Result := Filas;
end;

function TCrmDMAsistenteImpContactos.DameColumnas: TStrings;
begin
  Result := (Filas.Items[0] as TStrings);
end;

function TCrmDMAsistenteImpContactos.LlenarTablaTemporal(CNombre, CCP, CDireccion, CPContacto, CObservaciones, CTelefono1, CTelefono2, CEmail, CWeb, CFax, CNif, CCliente, CFormaPago, cZona, CRSocial, CNombreCorto, CNotas: smallint; COrigen: string; CAgente: integer): boolean;
var
  {NumFila,} colIni, I : integer;
  cp, nombre, direccion, observaciones, telefono1, telefono2, email, web, pcontacto, fax, nif, cliente_imp, formapago_imp, zona, rsocial, nombrecorto, notas : string;
begin
  Result := True;

  ColNombre := cnombre;
  ColCP := ccp;
  ColDireccion := cdireccion;
  ColPContacto := cpcontacto;
  ColObservaciones := cobservaciones;
  ColTelefono1 := ctelefono1;
  ColTelefono2 := ctelefono2;
  ColEmail := cemail;
  ColWeb := cweb;
  ColFax := cfax;
  ColNif := cnif;
  ColClienteImp := ccliente;
  ColFormaPagoImp := cformapago;
  ColZona := cZona;
  ColRSocial := crsocial;
  ColNombreCorto := cnombrecorto;
  ColNotas := cnotas;

  colIni := 1;  // evitamos que copie la primera linea que es la de los titulos
  i := 0;
  BorrarTablaTemporal;
  try
     for I := colIni to Filas.Count - 1 do
     begin
        if not (FilaSiguiente) then
        begin
           with QLlenarTemporal do
           begin
              // NumFila := I;
              // sfg.albert - Es comprova si hi ha nom. si no hi és, s'obvia la fila
              if (((Filas.Items[I] as TStrings)[ColNombre - 1]) <> '') then
              begin
                 if (ColNombre > 0) then
                    Nombre := Copy(((Filas.Items[I] as TStrings)[ColNombre - 1]), 1, 60)
                 else
                    Nombre := '';

                 if (ColCP > 0) then
                 begin
                    if (((Filas.Items[I] as TStrings)[ColCP - 1]) <> '') then
                       CP := BuscarLocalidad(((Filas.Items[I] as TStrings)[ColCP - 1]));

                    if ((cp = '') or (cp = '0')) then
                       cp := '99999999';
                 end
                 else
                    CP := '99999999';

                 if (ColDireccion > 0) then
                    Direccion := Copy(((Filas.Items[I] as TStrings)[ColDireccion - 1]), 1, 60)
                 else
                    Direccion := '';

                 if (ColPContacto > 0) then
                    PContacto := Copy(((Filas.Items[I] as TStrings)[ColPContacto - 1]), 1, 40);

                 if (ColObservaciones > 0) then
                    Observaciones := ((Filas.Items[I] as TStrings)[ColObservaciones - 1])
                 else
                    Observaciones := '';

                 if (ColTelefono1 > 0) then
                    Telefono1 := Copy(((Filas.Items[I] as TStrings)[ColTelefono1 - 1]), 1, 15)
                 else
                    Telefono1 := '';

                 if (ColTelefono2 > 0) then
                    Telefono2 := Copy(((Filas.Items[I] as TStrings)[ColTelefono2 - 1]), 1, 15)
                 else
                    Telefono2 := '';

                 if (ColEmail > 0) then
                    Email := Copy(((Filas.Items[I] as TStrings)[ColEmail - 1]), 1, 100)
                 else
                    Email := '';

                 if (ColWeb > 0) then
                    Web := Copy(((Filas.Items[I] as TStrings)[ColWeb - 1]), 1, 60)
                 else
                    web := '';

                 if (ColFax > 0) then
                    Fax := Copy(((Filas.Items[I] as TStrings)[ColFax - 1]), 1, 15)
                 else
                    Fax := '';

                 if (ColNif > 0) then
                    Nif := Copy(((Filas.Items[I] as TStrings)[ColNif - 1]), 1, 20)
                 else
                    Nif := '';

                 if (ColClienteImp > 0) then
                    Cliente_Imp := ((Filas.Items[I] as TStrings)[ColClienteImp - 1])
                 else
                    Cliente_Imp := '';

                 if (ColFormaPagoImp > 0) then
                    FormaPago_Imp := ((Filas.Items[I] as TStrings)[ColFormaPagoImp - 1])
                 else
                    FormaPago_Imp := '';

                 if (ColZona > 0) then
                    Zona := Copy(((Filas.Items[I] as TStrings)[ColZona - 1]), 1, 15)
                 else
                    Zona := '';

                 if (ColRSocial > 0) then
                    RSocial := Copy(((Filas.Items[I] as TStrings)[ColRSocial - 1]), 1, 60)
                 else
                    RSocial := '';

                 if (ColNombreCorto > 0) then
                    NombreCorto := Copy(((Filas.Items[I] as TStrings)[ColNombreCorto - 1]), 1, 60)
                 else
                    NombreCorto := '';

                 if (ColNotas > 0) then
                    Notas := ((Filas.Items[I] as TStrings)[ColNotas - 1])
                 else
                    Notas := '';
                 {
                 if (ColAgenteImp > 0 ) then
                    Agente_Imp := ((Filas.Items[I] as TStrings)[ColAgenteImp - 1])
                 else
                    Agente_Imp := '';
                 }
                 {
                 if (ColOrigenImp > 0 ) then
                    Origen_Imp := ((Filas.Items[I] as TStrings)[ColOrigenImp - 1])
                 else
                    Origen_Imp := '';
                 }

                 //Es comprova que no hi hagi valors nuls

                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['LINEA'].AsInteger := I;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['NOMBRE_CONTACTO'].AsString := Nombre;
                 Params.ByName['NOMBRE_R_SOCIAL'].AsString := RSocial;
                 Params.ByName['NOMBRE_CORTO'].AsString := NombreCorto;
                 Params.ByName['CODIGO_POSTAL'].AsString := CP;
                 Params.ByName['PERSONA_CONTACTO'].AsString := PContacto;
                 Params.ByName['DIRECCION'].AsString := Direccion;
                 Params.ByName['OBSERVACIONES'].AsString := Observaciones;
                 Params.ByName['TELEFONO1'].AsString := Telefono1;
                 Params.ByName['TELEFONO2'].AsString := Telefono2;
                 Params.ByName['EMAIL'].AsString := Email;
                 Params.ByName['WEB'].AsString := Web;
                 Params.ByName['FAX'].AsString := Fax;
                 Params.ByName['NIF'].AsString := Nif;
                 Params.ByName['CLI_PROV_IMP'].AsString := Cliente_Imp;
                 Params.ByName['FORMA_PAGO_IMP'].AsString := FormaPago_Imp;
                 Params.ByName['ORIGEN_IMP'].AsString := COrigen;
                 Params.ByName['AGENTE'].AsInteger := CAgente;
                 Params.ByName['ZONA'].AsString := Zona;
                 Params.ByName['NOTAS'].AsString := Notas;
                 ExecQuery;
                 FreeHandle;
              end //fi pregunta si existeix el NOM_COMERCIAL
              else
              begin
                 CrmFMAsistenteImpcontactos.Log(Format(_('No será traspasada la fila %d por falta de nombre comercial'), [i]));
              end;
           end; //fi with
        end;  //fi for
        FilaSiguiente := False;
     end;
  except
     on E: Exception do
     begin
        ShowMessage(Format(_('Ha ocurrido un error en la fila numero %d: )'), [I + colIni]) + #13#10 + E.Message);
        FilaSiguiente := True;
        Result := False;
     end;
  end;

  if (Result) then
     AbrirContactosImp;
end;

procedure TCrmDMAsistenteImpContactos.BorrarTablaTemporal;
begin
  with QBorrarTemporal do
  begin
     Params.ByName['entrada'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TCrmDMAsistenteImpContactos.SeleccionarTodas(Modo: smallint);
begin
  with QSeleccionarTodas do
  begin
     Params.ByName['MODO'].AsInteger := Modo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;

  AbrirContactosImp;
end;

procedure TCrmDMAsistenteImpContactos.QMContactosImpAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TCrmDMAsistenteImpContactos.QMContactosImpNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TCrmDMAsistenteImpContactos.AbrirContactosImp;
begin
  with QMContactosImp do
  begin
     DisableControls;
     try
        Close;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TCrmDMAsistenteImpContactos.InsertarContactos;
var
  IdContacto : integer;
begin
  QMContactosImp.First;

  while (not QMContactosImp.EOF) do
  begin
     if (QMContactosImpIMPORTAR.AsInteger = 1) then
     begin
        // Generem contador de id_contacto de CRM automàticament
        IdContacto := DMMain.ContadorGen('CRM_ID_CONTACTOS');

        ZonaControl(Copy(QMContactosImpZONA.AsString, 1, 15));

        QInsertarContacto.Close;
        QInsertarContacto.Params.ByName['IPAD_VISIBLE'].AsInteger := BoolToInt((LeeParametro('CRMIPAD001') = 'S'));
        QInsertarContacto.Params.ByName['ID_CONTACTO'].AsInteger := IdContacto;
        QInsertarContacto.Params.ByName['TERCERO'].AsInteger := -1;
        QInsertarContacto.Params.ByName['NOMBRE_COMERCIAL'].AsString := QMContactosImpNOMBRE_CONTACTO.AsString;
        QInsertarContacto.Params.ByName['NOMBRE_R_SOCIAL'].AsString := QMContactosImpNOMBRE_R_SOCIAL.AsString;
        QInsertarContacto.Params.ByName['NOMBRE_CORTO'].AsString := QMContactosImpNOMBRE_CORTO.AsString;
        QInsertarContacto.Params.ByName['DIR_LOCALIDAD'].AsString := QMContactosImpCODIGO_POSTAL.AsString;
        QInsertarContacto.Params.ByName['DIR_NOMBRE'].AsString := QMContactosImpDIRECCION.AsString;
        QInsertarContacto.Params.ByName['NOTAS'].AsString := QMContactosImpOBSERVACIONES.AsString;
        QInsertarContacto.Params.ByName['TELEFONO01'].AsString := QMContactosImpTELEFONO1.AsString;
        QInsertarContacto.Params.ByName['TELEFONO02'].AsString := QMContactosImpTELEFONO2.AsString;
        QInsertarContacto.Params.ByName['TELEFAX'].AsString := QMContactosImpFAX.AsString;
        QInsertarContacto.Params.ByName['NIF'].AsString := QMContactosImpNIF.AsString;
        QInsertarContacto.Params.ByName['EMAIL'].AsString := QMContactosImpEMAIL.AsString;
        QInsertarContacto.Params.ByName['WEB'].AsString := QMContactosImpWEB.AsString;
        QInsertarContacto.Params.ByName['ORIGEN_CONTACTO'].AsString := QMContactosImpORIGEN_IMP.AsString;
        QInsertarContacto.Params.ByName['FECHA_ALTA'].AsDateTime := Now;
        QInsertarContacto.Params.ByName['CLI_PROV_IMP'].AsString := QMContactosImpCLI_PROV_IMP.AsString;
        QInsertarContacto.Params.ByName['ZONA'].AsString := Copy(QMContactosImpZONA.AsString, 1, 15);
        QInsertarContacto.Params.ByName['OBSERVACIONES'].AsString := QMContactosImpOBSERVACIONES.AsString;
        QInsertarContacto.Params.ByName['NOTAS'].AsString := QMContactosImpNOTAS.AsString;

        if (QMContactosImpFORMA_PAGO_IMP.AsString = '') then
           QMContactosImpFORMA_PAGO_IMP.AsString := 'CON';

        QInsertarContacto.Params.ByName['FORMA_DE_PAGO_IMP'].AsString := QMContactosImpFORMA_PAGO_IMP.AsString;
        QInsertarContacto.Params.ByName['TIPO_RAZON'].AsString := 'DES';
        QInsertarContacto.Params.ByName['AGENTE'].AsInteger := QMContactosImpAGENTE.AsInteger;
        QInsertarContacto.Params.ByName['PAIS'].AsString := REntorno.Pais;
        QInsertarContacto.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;

        QInsertarContacto.Prepare;
        QInsertarContacto.ExecQuery;
        QInsertarContacto.FreeHandle;

        // Inserció persona de contacte
        QInsertarPContacto.Close;
        QInsertarPContacto.Params.ByName['ID_CONTACTO'].AsInteger := IdContacto;
        QInsertarPContacto.Params.ByName['NOMBRE'].AsString := QMContactosImpPERSONA_CONTACTO.AsString;
        QInsertarPContacto.Prepare;
        QInsertarPContacto.ExecQuery;
        QInsertarPContacto.FreeHandle;

        CrmFMAsistenteImpContactos.Log(_('Se traspaso con éxito') + ': ' + QMContactosImpNOMBRE_CONTACTO.AsString);
     end;
     QMContactosImp.Next;
  end;

  ShowMessage(_('Importación realizada'));
end;

function TCrmDMAsistenteImpContactos.BuscarLocalidad(CodigoPostal: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) LOCALIDAD FROM VER_LOCALIDADES WHERE CODPOSTAL = :CODPOSTAL';
        Params.ByName['CODPOSTAL'].AsString := CodigoPostal;
        ExecQuery;
        Result := FieldByName['LOCALIDAD'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMAsistenteImpContactos.ZonaControl(Zona: string);
var
  Existe : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM SYS_ZONAS WHERE ZONA = ?ZONA';
        Params.ByName['ZONA'].AsString := Zona;
        ExecQuery;
        Existe := FieldByName['COUNT'].AsInteger > 0;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (not Existe) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO SYS_ZONAS (ZONA, TITULO, DEFECTO) VALUES (?ZONA, ?TITULO, ?DEFECTO)';
           Params.ByName['ZONA'].AsString := Zona;
           Params.ByName['TITULO'].AsString := UpperCase(Zona);
           Params.ByName['DEFECTO'].AsInteger := 0;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
