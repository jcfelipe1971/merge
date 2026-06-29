unit UDMLstListados;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, {UDMLst,} frxClass, frxHYReport, FIBQuery, HYFIBQuery, FR_Class,
  Fr_HYReport, FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBDataSet,
  ULFEditFind2000, FR_DSet, FR_DBSet, Menus, FIBTableDataSet, FIBMiscellaneous,
  frxDBSet, ULFDateEdit, ULFComboBox, Grids, ValEdit, StdCtrls;

type
  TDMLstListados = class(TDataModule)
     QMListado: TFIBDataSetRO;
     DSQMListado: TDataSource;
     TLocal: THYTransaction;
     frxInforme: TfrxHYReport;
     QListados: TFIBDataSetRO;
     QListadosEMPRESA: TIntegerField;
     QListadosGRUPO: TIntegerField;
     QListadosLISTADO: TIntegerField;
     QListadosNUMERO: TIntegerField;
     QListadosTITULO: TFIBStringField;
     QListadosDEF_LISTADO: TBlobField;
     QListadosEDITABLE: TIntegerField;
     QListadosCABECERA: TIntegerField;
     QListado: TFIBDataSetRO;
     QFiltros: TFIBDataSetRO;
     QMConf: TFIBTableSet;
     DSQMConf: TDataSource;
     frDBDSQMListado: TfrxDBDataset;
     QListadoEMPRESA: TIntegerField;
     QListadoGRUPO: TIntegerField;
     QListadoLISTADO: TIntegerField;
     QListadoTITULO: TFIBStringField;
     QListadoDESCRIPCION: TBlobField;
     QListadoCONSULTA: TBlobField;
     QListadoMOSTRAR_OPCIONES: TIntegerField;
     QListadoMOSTRAR_SALIDA: TIntegerField;
     QListadoMOSTRAR_TIPO: TIntegerField;
     QListadoMOSTRAR_RESUMIDO: TIntegerField;
     QListadoMOSTRAR_GENERAL: TIntegerField;
     QListadoPOR_DEFECTO: TIntegerField;
     QMConfEMPRESA: TIntegerField;
     QMConfGRUPO: TIntegerField;
     QMConfLISTADO: TIntegerField;
     QMConfNUMERO: TIntegerField;
     QMConfTITULO: TFIBStringField;
     QMConfDEF_LISTADO: TBlobField;
     QMConfEDITABLE: TIntegerField;
     QMConfCABECERA: TIntegerField;
     QListadoPERMITIR_NUEVOS_LISTADOS: TIntegerField;
     QListadoPERMITIR_MODIFICAR_LISTADOS: TIntegerField;
     QListadoPERMITIR_ELIMINAR: TIntegerField;
     QMEdicionListado: TFIBTableSet;
     DSQMEdicionListado: TDataSource;
     QMEdicionListadoEMPRESA: TIntegerField;
     QMEdicionListadoGRUPO: TIntegerField;
     QMEdicionListadoLISTADO: TIntegerField;
     QMEdicionListadoTITULO: TFIBStringField;
     QMEdicionListadoDESCRIPCION: TBlobField;
     QMEdicionListadoCONSULTA: TBlobField;
     QMEdicionListadoMOSTRAR_OPCIONES: TIntegerField;
     QMEdicionListadoMOSTRAR_SALIDA: TIntegerField;
     QMEdicionListadoMOSTRAR_TIPO: TIntegerField;
     QMEdicionListadoMOSTRAR_RESUMIDO: TIntegerField;
     QMEdicionListadoMOSTRAR_GENERAL: TIntegerField;
     QMEdicionListadoPOR_DEFECTO: TIntegerField;
     QMEdicionListadoPERMITIR_NUEVOS_LISTADOS: TIntegerField;
     QMEdicionListadoPERMITIR_MODIFICAR_LISTADOS: TIntegerField;
     QMEdicionListadoPERMITIR_ELIMINAR: TIntegerField;
     QMEdicionListadoORDEN: TIntegerField;
     QMFiltros: TFIBTableSet;
     DSQMFiltros: TDataSource;
     QMFiltrosEMPRESA: TIntegerField;
     QMFiltrosGRUPO: TIntegerField;
     QMFiltrosLISTADO: TIntegerField;
     QMFiltrosPARAMETRO: TFIBStringField;
     QMFiltrosTIPO: TIntegerField;
     QMFiltrosMOSTRAR_TITULO: TIntegerField;
     QMFiltrosTEXTO: TFIBStringField;
     QMFiltrosTABLA: TFIBStringField;
     QMFiltrosCAMPO_CODIGO: TFIBStringField;
     QMFiltrosCAMPO_TITULO: TFIBStringField;
     QMFiltrosCONDICION_BUSQUEDA: TFIBStringField;
     QMFiltrosORDEN: TIntegerField;
     QMOrdenes: TFIBTableSet;
     DSQMOrdenes: TDataSource;
     QMOrdenesEMPRESA: TIntegerField;
     QMOrdenesGRUPO: TIntegerField;
     QMOrdenesLISTADO: TIntegerField;
     QMOrdenesNUMERO: TIntegerField;
     QMOrdenesORDEN: TFIBStringField;
     QMOrdenesSQL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMFiltrosNewRecord(DataSet: TDataSet);
     procedure frxInformeGetValue(const VarName: string; var Value: variant);
     procedure frxInformeBeforePrint(Sender: TfrxReportComponent);
     function frxInformeUserFunction(const MethodName: string; var Params: variant): variant;
  private
     Grupo, Listado, Orden: integer;
     slListBox, slOrdenes, slValores, slFiltros: TStringList;
     procedure RepasaListas;
     function GetMinimoListado: integer;
     function DameValorParametro(parametro: string): string;
     {function CampoComillas(tabla, campo: string): boolean; No se utiliza}
     function DevuelveSQl(elsql: string): string;
  public
     function DameNombreListado: string;
     function DameNombreGrupo: string;
     procedure AbreDesarrollo;
     function GetOrden(Orden: integer): string;
     function CargaOrdenes(aComboBox: TLFComboBox): integer;
     procedure RecargaDE(DE: TLFDateEdit);
     procedure EstaBlecePorDefecto(Numero: integer);
     procedure AbreDatos;
     procedure TomaValorParametro(Parametro, Valor: string);
     function DameTitulo(aEdit: TLFEditFind2000): string;
     procedure SetDatos(_grupo, _listado: integer; var pm, pnl, permitir_eliminar, ver_salida, mostrar_tipo: boolean; var Titulo: string);
     procedure Imprimir(Previsualizar: boolean);
     procedure GuardaListado(donde: string);
     procedure AbreFiltros;
     function DameListado: integer;
     function ExisteListado(Numero: integer): boolean;
     function DameListadoMinimo: integer;
     procedure DatosSQL(Memo: TMemo; vle: TValueListEditor);
     procedure AddFiltro(Orden: integer; Filtro: string);
     function GetCondicionBusqueda(Orden: integer): string;
     procedure Elimina(Numero: integer);
     procedure RecargaEF(aEdit: TLFEditFind2000);
     procedure MenuListados(aPopupMenu: TPopupMenu);
     procedure CargaListado(Numero: integer);
     procedure TomaOrden(n: integer);
     procedure AbreDataSets(AbreValores: boolean = True);
     procedure Limpia;
     procedure DiseniaListado(Numero: integer);
     procedure Parametros(vle: TValueListEditor);
     procedure Filtros(vle: TValueListEditor);
     procedure Ordenes(vle: TValueListEditor);
     function NuevoListadoCarga(nombre: string): integer;
     procedure DeleteLB(Tag, Numero: integer);
     procedure AddLB(Tag, Numero: integer; valor: string);
     procedure ClearLB(Tag: integer);
     procedure AbreEdicion;
     function NuevoGrupo(texto: string): integer;
     procedure TomaSQLListado(Grupo, Listado: integer; donde: string);
     function DameNumeroListado(Grupo, Listado: integer; texto: string): integer;
     procedure TomaFR3listado(Grupo, Listado: integer; Donde, Nombre: string);
     procedure TomaDefListado(Grupo, Listado: integer; Donde: string);
     function NuevoListado(Grupo: integer; texto: string): integer;
  end;

var
  DMLstListados : TDMLstListados;

implementation

uses UDMMain, UEntorno, UFMLstListados, UFMListConfig, UDMListados, UUtiles;

{$R *.dfm}

procedure TDMLstListados.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  slFiltros := TStringList.Create;
  slValores := TStringList.Create;
  slOrdenes := TStringList.Create;
  slListBox := TStringList.Create;
  if not TLocal.Active then
     TLocal.StartTransaction;
end;

procedure TDMLstListados.DataModuleDestroy(Sender: TObject);
begin
  slFiltros.Free;
  slValores.Free;
  slOrdenes.Free;
  slListBox.Free;
end;

procedure TDMLstListados.SetDatos(_grupo, _listado: integer; var pm, pnl, permitir_eliminar, ver_salida, mostrar_tipo: boolean; var Titulo: string);
var
  por_defecto : integer;
begin
  Grupo := _grupo;
  Listado := _listado;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT * FROM LST_LISTADOS WHERE EMPRESA=?EMPRESA AND GRUPO=?GRUPO AND LISTADO=?LISTADO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        ExecQuery;
        pm := FieldByName['PERMITIR_MODIFICAR_LISTADOS'].AsInteger = 1;
        pnl := FieldByName['PERMITIR_NUEVOS_LISTADOS'].AsInteger = 1;
        permitir_eliminar := FieldByName['PERMITIR_ELIMINAR'].AsInteger = 1;
        ver_salida := FieldByName['MOSTRAR_SALIDA'].AsInteger = 1;
        mostrar_tipo := FieldByName['MOSTRAR_TIPO'].AsInteger = 1;
        por_defecto := FieldByName['POR_DEFECTO'].AsInteger;
        Titulo := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if not ExisteListado(por_defecto) then
     por_defecto := DameListadoMinimo;

  CargaListado(por_defecto);
end;

procedure TDMLstListados.Limpia;
begin
  slListBox.Clear;
  slOrdenes.Clear;
  slValores.Clear;
  slFiltros.Clear;
end;

function TDMLstListados.CargaOrdenes(aComboBox: TLFComboBox): integer;
var
  Orden : integer;
begin
  aComboBox.ItemIndex := -1;
  aComboBox.Items.Clear;
  Result := 0;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT ORDEN, SQL FROM LST_LISTADOS_ORDENES WHERE EMPRESA = ?EMPRESA AND GRUPO = ?GRUPO AND LISTADO = ?LISTADO ORDER BY NUMERO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['GRUPO'].AsInteger := Grupo;
           Params.ByName['LISTADO'].AsInteger := Listado;
           Open;
           while not EOF do
           begin
              Orden := aComboBox.Items.Add(FieldByName('ORDEN').AsString);
              slOrdenes.Values[IntToStr(Orden)] := FieldByName('SQL').AsString;
              Inc(Result);
              Next;
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

  if Result > 0 then
     aComboBox.ItemIndex := 0;
end;

procedure TDMLstListados.AbreFiltros;
begin
  with QFiltros do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['LISTADO'].AsInteger := Listado;
     Open;
  end;
end;

procedure TDMLstListados.TomaOrden(n: integer);
begin
  Orden := n;
end;

procedure TDMLstListados.AddFiltro(Orden: integer; Filtro: string);
begin
  slFIltros.Values[IntToStr(Orden)] := Filtro;
end;

function TDMLstListados.GetOrden(Orden: integer): string;
begin
  Result := slOrdenes.Values[IntToStr(Orden)];
end;

procedure TDMLstListados.TomaValorParametro(Parametro, Valor: string);
begin
  slValores.Values[UpperCase(Parametro)] := Valor;
end;

function TDMLstListados.DameValorParametro(parametro: string): string;
begin
  parametro := UpperCase(parametro);

  Result := slValores.Values[parametro];

  if Result = EmptyStr then
  begin
     if parametro = 'EMPRESA' then
        Result := IntToStr(REntorno.Empresa);
     if parametro = 'EJERCICIO' then
        Result := IntToStr(REntorno.Ejercicio);
     if parametro = 'CANAL' then
        Result := IntToStr(REntorno.Canal);
     if parametro = 'ENTRADA' then
        Result := IntToStr(REntorno.Entrada);
  end;
end;

function TDMLstListados.GetCondicionBusqueda(Orden: integer): string;
var
  x, y : integer;
  parametro : string;
begin
  Result := Trim(slFiltros.Values[IntToStr(Orden)]);
  // en el stringlist tenemos la condicion busqueda
  // ahora buscamos :empresa para cambiarlo por la empresa...
  y := 0;
  for x := 1 to Length(Result) do
  begin
     if (y = 0) then
     begin
        // No estamos en un parametro, buscamos un :
        if (Result[x] = '?') then
           y := x;
     end
     else
     begin
        // Tenemos un parametro... buscamos ';' o ' ' o ')'
        if (Result[x] in [';', ' ', ')']) then
        begin
           parametro := Copy(Result, y + 1, x - y - 1);
           Result := StringReplace(Result, '?' + parametro, DameValorParametro(parametro), [rfReplaceAll]);
           y := 0;
        end;
     end;
  end;

  if (y > 0) then
  begin
     parametro := Copy(Result, y + 1, x - y - 1);
     Result := StringReplace(Result, '?' + parametro, DameValorParametro(parametro), [rfReplaceAll]);
  end;
end;

function TDMLstListados.DameTitulo(aEdit: TLFEditFind2000): string;
var
  Q : THYFIBQuery;
begin
  Result := EmptyStr;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT ' + aEdit.CampoStr);
        SQL.Add(' FROM ' + aEdit.Tabla_a_buscar);
        SQL.Add(' WHERE ' + aEdit.CampoNum + '=:' + aEdit.CampoNum);
        if Trim(aEdit.CondicionBusqueda) <> EmptyStr then
           SQL.Add('AND ' + aEdit.CondicionBusqueda);
        Params.ByName[aEdit.CampoNum].AsString := aEdit.Text;
        try
           ExecQuery;
           Result := FieldByName[aEdit.CampoStr].AsString;
        except
           on E: Exception do
           begin
              ShowMessage(_('Ha ocurrido un error al localizar el titulo de la busqueda') + #13#10 + E.Message);
           end;
        end;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMLstListados.RecargaEF(aEdit: TLFEditFind2000);
var
  Q : THYFIBQuery;
  maxmin : string;
begin
  if Pos(sufijo_hasta, aEdit.Name) = Length(aEdit.Name) - 1 then
     maxmin := 'MAX'
  else
     maxmin := 'MIN';

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT ' + maxmin + '(' + aEdit.CampoNum + ')');
        SQL.Add(' FROM ' + aEdit.Tabla_a_buscar);
        if Trim(aEdit.CondicionBusqueda) <> EmptyStr then
           SQL.Add(' WHERE ' + aEdit.CondicionBusqueda);
        try
           ExecQuery;
           aEdit.Text := FieldByName[maxmin].AsString;
        except
           on E: Exception do
           begin
              ShowMessage(Format(_('Ha ocurrido un error al localizar el %s de la busqueda (%s)'), [maxmin, aEdit.Name]) + #13#10 + E.Message);
           end;
        end;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMLstListados.MenuListados(aPopupMenu: TPopupMenu);
var
  aMenuItem : TMenuItem;
begin
  aPopupMenu.Items.Clear;
  with QListados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['LISTADO'].AsInteger := Listado;
     Open;
     while not EOF do
     begin
        aMenuItem := TMenuItem.Create(aPopupMenu);
        with aMenuItem do
        begin
           Caption := FieldByName('TITULO').AsString;
           Tag := FieldByName('NUMERO').AsInteger;
           aPopupMenu.Items.Add(aMenuItem);
        end;
        Next;
     end;
  end;
end;

procedure TDMLstListados.DiseniaListado(Numero: integer);
var
  Stream : TFIBBlobStream;
  Fichero : string;
begin
  if QMConfNUMERO.AsInteger = 0 then
     raise Exception.Create(_('No hay listados creados'));

  Stream := TFIBBlobStream.Create;
  try
     Stream.Database := DMMain.Database;
     Stream.Transaction := TLocal;
     Stream.Mode := bmReadWrite;
     QMConfDEF_LISTADO.SaveToStream(Stream);
     Stream.Position := 0;
     if Stream.Size > 0 then
        try
           frxInforme.LoadFromStream(Stream);
        except
           on E: Exception do
           begin
              ShowMessage(_('Hubo un error al cargar el listado por defecto'));
           end;
        end;
     Fichero := GetTempFile('.fr3');
     Stream.SaveToFile(Fichero);
     frxInforme.LoadFromFile(Fichero);
     Stream.Finalize;
     AbreDatasets(False);
     frxInforme.DesignReport;
  finally
     Stream.Free;
  end;

  Stream := TFIBBlobStream.Create;
  try
     if ConfirmaMensaje(_('Actualizamos el listado en la bbdd?')) then
     begin
        Stream.Database := DMMain.Database;
        Stream.Transaction := TLocal;
        Stream.Mode := bmReadWrite;
        frxInforme.SaveToStream(Stream);
        Stream.Position := 0;
        QMConf.Edit;
        QMConfDEF_LISTADO.LoadFromStream(Stream);
        QMConf.Post;
     end;
  finally
     Stream.Free;
  end;

  DeleteFile(Fichero);
end;

function TDMLstListados.DameListadoMinimo: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT MIN(NUMERO) FROM LST_LISTADOS_DETALLE WHERE EMPRESA=?EMPRESA AND GRUPO=?GRUPO AND LISTADO=?LISTADO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        ExecQuery;
        Result := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstListados.ExisteListado(Numero: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) FROM LST_LISTADOS_DETALLE WHERE EMPRESA=?EMPRESA AND GRUPO=?GRUPO AND LISTADO=?LISTADO AND NUMERO=?NUMERO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        Params.ByName['NUMERO'].AsInteger := Numero;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger > 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstListados.CargaListado(Numero: integer);
var
  Stream : TFIBBlobStream;
begin
  frxInforme.Clear;
  Stream := TFIBBlobStream.Create;
  try
     Stream.Database := DMMain.Database;
     Stream.Transaction := TLocal;
     Stream.Mode := bmReadWrite;
     with QMConf do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        Params.ByName['NUMERO'].AsInteger := Numero;
        Open;
        QMConfDEF_LISTADO.SaveToStream(Stream);
        frxInforme.PreviewOptions.AllowEdit := QMConfEDITABLE.AsInteger = 1;
     end;

     Stream.Position := 0;
     if Stream.Size > 0 then
        try
           frxInforme.LoadFromStream(Stream);
        except
           ON E: Exception do
           begin
              ShowMessage(_('Hubo un error al cargar el listado por defecto'));
           end;
        end;
  finally
     Stream.Free;
  end;

  frxInforme.AddFunction('function DameSQL(s: String): string', 'Funciones NIL', 'Devuelve el primer campo como cadena del sql');
end;

procedure TDMLstListados.Imprimir(Previsualizar: boolean);
begin
  AbreDatos;
  frxInforme.PrepareReport;
  if Previsualizar then
  begin
     frxInforme.ShowPreparedReport;
  end
  else
  begin
     frxInforme.Print;
  end;
end;

function TDMLstListados.DameListado: integer;
begin
  Result := QMConfNUMERO.AsInteger;
end;

function TDMLstListados.NuevoListadoCarga(nombre: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT MAX(NUMERO) ');
        SQL.Add(' FROM LST_LISTADOS_DETALLE ');
        SQL.Add(' WHERE EMPRESA = ?EMPRESA');
        SQL.Add(' AND GRUPO = ?GRUPO ');
        SQL.Add(' AND LISTADO = ?LISTADO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        ExecQuery;
        Result := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := Result + 1;
  with QMConf do
  begin
     Insert;
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('GRUPO').AsInteger := Grupo;
     FieldByName('LISTADO').AsInteger := Listado;
     FieldByName('NUMERO').AsInteger := Result;
     FieldByName('EDITABLE').AsInteger := 0;
     FieldByName('TITULO').AsString := nombre;
     FieldByName('CABECERA').AsInteger := 0;
     Post;
  end;

  CargaListado(Result);
end;

procedure TDMLstListados.AbreDatos;
begin
end;

procedure TDMLstListados.EstaBlecePorDefecto(Numero: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' UPDATE LST_LISTADOS ');
        SQL.Add(' SET POR_DEFECTO = ?POR_DEFECTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA ');
        SQL.Add(' AND GRUPO = ?GRUPO ');
        SQL.Add(' AND LISTADO = ?LISTADO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        Params.ByName['POR_DEFECTO'].AsInteger := Numero;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CargaListado(Numero);
end;

function TDMLstListados.GetMinimoListado: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('select min(numero) from LST_LISTADOS_DETALLE');
        SQL.Add('where empresa=?empresa');
        SQL.Add('and grupo=?grupo');
        SQL.Add('and listado=?listado');
        Params.ByName['empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['grupo'].AsInteger := Grupo;
        Params.ByName['listado'].AsInteger := Listado;
        ExecQuery;
        Result := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstListados.Elimina(Numero: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' DELETE FROM LST_LISTADOS_DETALLE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA ');
        SQL.Add(' AND GRUPO = ?GRUPO ');
        SQL.Add(' AND LISTADO = ?LISTADO ');
        SQL.Add(' AND NUMERO = ?NUMERO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        Params.ByName['NUMERO'].AsInteger := Numero;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  CargaListado(GetMinimoListado);
end;

procedure TDMLstListados.RecargaDE(DE: TLFDateEdit);
begin
  if DE.Top = 14 then
     DE.Date := REntorno.FechaTrab
  else
     DE.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
end;

procedure TDMLstListados.DeleteLB(Tag, Numero: integer);
begin
  slListBox.Values[IntToStr(Tag) + '.' + IntToStr(Numero)] := EmptyStr;
end;

procedure TDMLstListados.AddLB(Tag, Numero: integer; valor: string);
begin
  slListBox.Values[IntToStr(Tag) + '.' + IntToStr(Numero)] := Valor;
end;

procedure TDMLstListados.ClearLB(Tag: integer);
var
  x : integer;
begin
  x := 0;
  while x < slListBox.Count do
  begin
     if Pos(IntToStr(Tag) + '.', slListBox.Strings[x]) > 0 then
        slListBox.Delete(x)
     else
        Inc(x);
  end;
end;

procedure TDMLstListados.AbreDataSets(AbreValores: boolean = True);
var
  i : integer;
  Consulta : string;
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add('');
           SelectSQL.Text := 'SELECT CONSULTA FROM LST_LISTADOS WHERE EMPRESA = ?EMPRESA AND GRUPO = ?GRUPO AND LISTADO = ?LISTADO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['GRUPO'].AsInteger := Grupo;
           Params.ByName['LISTADO'].AsInteger := Listado;
           Open;
           Consulta := FieldByName('CONSULTA').AsString;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  with QMListado do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(Consulta);
     if slOrdenes.Values[IntToStr(Orden)] <> EmptyStr then
        SelectSQL.Add(slOrdenes.Values[IntToStr(Orden)]);
     RepasaListas;

     if AbreValores then
     begin
        for i := 0 to QMListado.Params.Count - 1 do
        begin
           try
              if (Params[i].DataType in [ftDateTime, ftDate, ftTime]) then
                 Params[i].AsDateTime := StrToDateTime(DameValorParametro(Params[i].Name))
              // if (Params[x].DataType = ftDateTime) then
              //    Params[x].AsString := DameValorParametro(Params[x].Name);
              else
              if (Params[i].DataType in [ftSmallint, ftInteger, ftWord]) then
                 Params[i].AsInteger := StrToIntDef(DameValorParametro(Params[i].Name), 0)
              else
              if (Params[i].DataType in [ftString, ftWideString]) then
                 Params[i].AsString := DameValorParametro(Params[i].Name)
              else
              if (Params[i].DataType in [ftFloat, ftCurrency]) then
                 Params[i].AsFloat := StrToFloat(DameValorParametro(Params[i].Name));
           except
              on E: Exception do
              begin
                 ShowMessage(Format(_('El parametro %s no se encuentra en las variables, se pone a nulo'), [Params[i].Name]));
                 Params[i].Clear;
              end;
           end;
        end;
        Open;
     end;
  end;
end;

procedure TDMLstListados.Parametros(vle: TValueListEditor);
begin
  vle.Strings.Assign(slValores);
end;

procedure TDMLstListados.Filtros(vle: TValueListEditor);
begin
  vle.Strings.Assign(slFiltros);
end;

procedure TDMLstListados.Ordenes(vle: TValueListEditor);
begin
  vle.Strings.Assign(slOrdenes);
end;

procedure TDMLstListados.DatosSQL(Memo: TMemo; vle: TValueListEditor);
var
  i, r : integer;
  Valor, Parametro : string;
begin
  Memo.Clear;
  vle.Strings.Clear;
  AbreDatasets(False);
  Memo.Lines.Assign(QMListado.SelectSQL);
  QMListado.Prepare;
  with QMListado do
     for i := 0 to Params.Count - 1 do
     begin
        Parametro := Params[i].Name;
        Valor := DameValorParametro(Parametro);
        vle.FindRow(Parametro, r);
        if (r >= 0) then
           vle.Strings.Values[Parametro] := Valor
        else
           vle.InsertRow(Parametro, Valor, True);
     end;
end;

procedure TDMLstListados.AbreDesarrollo;
begin
  with QMFiltros do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['LISTADO'].AsInteger := Listado;
     Open;
  end;

  with QMOrdenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['LISTADO'].AsInteger := Listado;
     Open;
  end;
end;

procedure TDMLstListados.AbreEdicion;
begin
  with QMEdicionListado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['LISTADO'].AsInteger := Listado;
     Open;
     Edit;
  end;
end;

procedure TDMLstListados.QMFiltrosNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('GRUPO').AsInteger := Grupo;
     FieldByName('LISTADO').AsInteger := Listado;
  end;
end;

procedure TDMLstListados.frxInformeGetValue(const VarName: string; var Value: variant);
var
  resultado : string;
begin
  DMListados.GetValue(Varname, Value);
  {Todo -oDuilio : Mirar esto, que puede ser interesante DMListados.GetValue_Cab, DMListados.GetValue_Pie}
  // DMListados.GetValue_Cab(VarName, Value);
  // DMListados.GetValue_Pie(VarName, Value);

  resultado := DameValorParametro(VarName);

  if resultado <> EmptyStr then
     Value := resultado;
end;

{No se utiliza
function TDMLstListados.CampoComillas(tabla, campo: string): boolean;
var
  Q : THYFIBQuery;
  tipo : integer;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('select /*fld.rdb$field_name,fld.rdb$field_source,*/cam.rdb$field_type');
        SQL.Add('from RDB$RELATION_FIELDS fld');
        SQL.Add('join RDB$FIELDS cam on (cam.rdb$field_name = fld.rdb$field_source)');
        SQL.Add('where fld.rdb$field_name=?campo');
        SQL.Add('and fld.RDB$RELATION_NAME=?tabla');
        Params.ByName['campo'].AsString := campo;
        Params.ByName['tabla'].AsString := tabla;
        ExecQuery;
        tipo := Fields[0].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  Result := (tipo = 14) or (tipo = 37);
end;
}

procedure TDMLstListados.RepasaListas;
var
  Cadena, Parametro, Valor : string;
  Campo, Tabla : string;
  // comillas : boolean;
  i, Orden : integer;
begin
  AbreFiltros;
  with QFIltros do
     while not EOF do
     begin
        if FieldByName('TIPO').AsInteger = 2 then
        begin
           Parametro := FieldByName('PARAMETRO').AsString;
           Campo := FieldByName('CAMPO_CODIGO').AsString;
           Tabla := FieldByName('TABLA').AsString;
           Orden := FieldByName('ORDEN').AsInteger;
           // comillas := CampoComillas(tabla, campo);
           Valor := EMptyStr;
           for i := 0 to slListBox.Count - 1 do
           begin
              if Pos(IntToStr(Orden) + '.', slListBox.Strings[i]) > 0 then
              begin
                 Cadena := slListBox.Strings[i];
                 Cadena := Copy(Cadena, Pos('=', Cadena) + 1, Length(Cadena));
                 // if comillas then
                 Cadena := QuotedStr(Cadena);

                 if Valor <> EmptyStr then
                    Valor := Valor + ',';

                 Valor := Valor + Cadena;
              end;
           end;
           Valor := '(' + Valor + ')';
           if Valor = '()' then
              Valor := '(SELECT ' + Campo + ' FROM ' + Tabla + ' WHERE ' + GetCondicionBusqueda(Orden) + ')';
        end;
        for i := 0 to QMListado.SelectSQL.Count - 1 do
        begin
           Cadena := QMListado.SelectSQL.Strings[i];
           QMListado.SelectSQL.Strings[i] := StringReplace(Cadena, '[' + Parametro + ']', Valor, [rfReplaceAll, rfIgnoreCase]);
        end;
        Next;
     end;
end;

function TDMLstListados.DameNombreGrupo: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT TITULO FROM LST_GRUPOS WHERE EMPRESA = ?EMPRESA AND GRUPO = ?GRUPO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstListados.GuardaListado(donde: string);
var
  sl : TStringList;
begin
  sl := TStringList.Create;
  try
     sl.Clear;
     sl.Add('delete from lst_listados_filtros where empresa=?empresa and grupo=?grupo and listado=?listado;');

     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT * FROM LST_LISTADOS_FILTROS WHERE EMPRESA=?EMPRESA AND GRUPO=?GRUPO AND LISTADO=?LISTADO ORDER BY ORDEN';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['GRUPO'].AsInteger := Grupo;
              Params.ByName['LISTADO'].AsInteger := Listado;
              Open;
              while not EOF do
              begin
                 sl.Add('INSERT INTO LST_LISTADOS_FILTROS ' +
                    '(EMPRESA, GRUPO, LISTADO, PARAMETRO, TIPO, MOSTRAR_TITULO, ' +
                    ' TEXTO, TABLA, CAMPO_CODIGO, CAMPO_TITULO, CONDICION_BUSQUEDA, ORDEN)' +
                    ' values ' +
                    '(?EMPRESA, ?GRUPO, ?LISTADO, ' + QuotedStr(FieldByName('PARAMETRO').AsString) + ',' + FieldByName('TIPO').AsString + ',' + FieldByName('MOSTRAR_TITULO').AsString + ', ' +
                    QuotedStr(FieldByName('TEXTO').AsString) + ', ' + QuotedStr(FieldByName('TABLA').AsString) + ', ' + QuotedStr(FieldByName('CAMPO_CODIGO').AsString) + ', ' +
                    QuotedStr(FieldByName('CAMPO_TITULO').AsString) + ', ' + QuotedStr(FieldByName('CONDICION_BUSQUEDA').AsString) + ', ' + FieldByName('ORDEN').AsString + ');');
                 Next;
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
     sl.SaveToFile(donde + 'filtros.sql');

     sl.Clear;
     sl.Add('DELETE FROM LST_LISTADOS_ORDENES WHERE EMPRESA=?EMPRESA AND GRUPO=?GRUPO AND LISTADO=?LISTADO;');

     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT * FROM LST_LISTADOS_ORDENES WHERE EMPRESA=?EMPRESA AND GRUPO=?GRUPO AND LISTADO=?LISTADO ORDER BY NUMERO';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['GRUPO'].AsInteger := Grupo;
              Params.ByName['LISTADO'].AsInteger := Listado;
              Open;
              while not EOF do
              begin
                 sl.Add('INSERT INTO LST_LISTADOS_ORDENES ' +
                    '(EMPRESA, GRUPO, LISTADO, NUMERO,ORDEN,SQL) ' +
                    ' values ' +
                    '(?EMPRESA, ?GRUPO, ?LISTADO, ' + FieldByName('NUMERO').AsString + ',' + QuotedStr(FieldByName('ORDEN').AsString) + ',' + QuotedStr(FieldByName('SQL').AsString) + ');');
                 Next;
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
     sl.SaveToFile(donde + 'ordenes.sql');
     sl.Clear;

     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM LST_LISTADOS WHERE EMPRESA=?EMPRESA AND GRUPO=?GRUPO AND LISTADO=?LISTADO');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['GRUPO'].AsInteger := Grupo;
              Params.ByName['LISTADO'].AsInteger := Listado;
              Open;
              sl.Values['TITULO'] := FieldByName('TITULO').AsString;
              sl.Values['MOSTRAR_OPCIONES'] := FieldByName('MOSTRAR_OPCIONES').AsString;
              sl.Values['MOSTRAR_SALIDA'] := FieldByName('MOSTRAR_SALIDA').AsString;
              sl.Values['MOSTRAR_TIPO'] := FieldByName('MOSTRAR_TIPO').AsString;
              sl.Values['MOSTRAR_RESUMIDO'] := FieldByName('MOSTRAR_RESUMIDO').AsString;
              sl.Values['MOSTRAR_GENERAL'] := FieldByName('MOSTRAR_GENERAL').AsString;
              sl.Values['PERMITIR_NUEVOS_LISTADOS'] := FieldByName('PERMITIR_NUEVOS_LISTADOS').AsString;
              sl.Values['PERMITIR_MODIFICAR_LISTADOS'] := FieldByName('PERMITIR_MODIFICAR_LISTADOS').AsString;
              sl.Values['PERMITIR_ELIMINAR'] := FieldByName('PERMITIR_ELIMINAR').AsString;
              sl.Insert(0, '###');
              sl.Insert(0, FieldByName('CONSULTA').AsString);
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;

     sl.SaveToFile(donde + 'consulta.def');

     with QListados do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        Open;
        while not EOF do
        begin
           QListadosDEF_LISTADO.SaveToFile(donde + QListadosTITULO.AsString + '.fr3');
           Next;
        end;
     end;
  finally
     sl.Free;
  end;
end;

function TDMLstListados.DameNombreListado: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT TITULO FROM LST_LISTADOS WHERE EMPRESA=?EMPRESA AND GRUPO=?GRUPO AND LISTADO=?LISTADO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstListados.frxInformeBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

function TDMLstListados.DevuelveSQl(elsql: string): string;
var
  valor : string;
  x : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(elsql);
        for x := 0 to Params.Count - 1 do
        begin
           valor := Emptystr;
           valor := DameValorParametro(Params[x].Name);
           if ((valor = EmptyStr) and (QMListado.Fields.FindField(Params[x].Name) <> nil)) then
              valor := QMListado.Fields.FindField(Params[x].Name).AsString;
           if (valor = EmptyStr) then
              valor := frxInforme.Variables[Params[x].Name];
           Params[x].AsString := valor;
        end;
        try
           ExecQuery;
           Result := Fields[0].AsString;
        except
           Result := EmptyStr;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstListados.frxInformeUserFunction(const MethodName: string; var Params: variant): variant;
begin
  if UpperCase(MethodName) = 'DAMESQL' then
     Result := DevuelveSQl(Params[0]);
end;

function TDMLstListados.NuevoGrupo(texto: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT GRUPO FROM LST_GRUPOS');
        SQL.Add('WHERE EMPRESA=?EMPRESA AND TITULO=?TITULO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
        Params.ByName['TITULO'].AsString := Copy(texto, 0, 60);
        ExecQuery;
        Result := FieldByName['GRUPO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if Result = 0 then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add('SELECT MAX(GRUPO) FROM LST_GRUPOS');
           SQL.Add('WHERE EMPRESA=?EMPRESA');
           Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
           ExecQuery;
           Result := FieldByName['MAX'].AsInteger + 1;
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
           SQL.Clear;
           SQL.Add('INSERT INTO LST_GRUPOS');
           SQL.Add('(EMPRESA,GRUPO,TITULO)');
           SQL.Add('VALUES');
           SQL.Add('(?EMPRESA,?GRUPO,?TITULO)');
           Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
           Params.ByName['GRUPO'].AsInteger := Result;
           Params.ByName['TITULO'].AsString := Copy(texto, 0, 60);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMLstListados.DameNumeroListado(Grupo, Listado: integer; texto: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('select numero from LST_LISTADOS_DETALLE');
        SQL.Add('where empresa=?EMPRESA and grupo=?grupo and listado=?listado and titulo=?TITULO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['LISTADO'].AsInteger := Listado;
        Params.ByName['TITULO'].AsString := Copy(texto, 0, 40);
        ExecQuery;
        Result := FieldByName['NUMERO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if Result = 0 then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add('select max(numero) from LST_LISTADOS_DETALLE');
           SQL.Add('where empresa=?EMPRESA');
           SQL.Add('and grupo=?grupo');
           SQL.Add('and listado=?listado');
           Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
           Params.ByName['GRUPO'].AsInteger := Grupo;
           Params.ByName['LISTADO'].AsInteger := Listado;
           ExecQuery;
           Result := FieldByName['MAX'].AsInteger + 1;
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
           SQL.Clear;
           SQL.Add('insert into LST_LISTADOS_DETALLE');
           SQL.Add('(EMPRESA,GRUPO,LISTADO,NUMERO,TITULO)');
           SQL.Add('values');
           SQL.Add('(?EMPRESA,?GRUPO,?LISTADO,?NUMERO,?TITULO)');
           Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
           Params.ByName['GRUPO'].AsInteger := Grupo;
           Params.ByName['LISTADO'].AsInteger := Listado;
           Params.ByName['NUMERO'].AsInteger := Result;
           Params.ByName['TITULO'].AsString := Copy(texto, 0, 40);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMLstListados.NuevoListado(Grupo: integer; texto: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('select listado from LST_LISTADOS');
        SQL.Add('where empresa=?EMPRESA and grupo=?grupo and titulo=?TITULO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['TITULO'].AsString := Copy(texto, 0, 60);
        ExecQuery;
        Result := FieldByName['LISTADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if Result = 0 then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add('select max(listado) from LST_LISTADOS');
           SQL.Add('where empresa=?EMPRESA and grupo=?grupo');
           Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
           Params.ByName['GRUPO'].AsInteger := Grupo;
           ExecQuery;
           Result := FieldByName['MAX'].AsInteger + 1;
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
           SQL.Clear;
           SQL.Add('insert into LST_LISTADOS (EMPRESA,GRUPO,LISTADO,TITULO)');
           SQL.Add('values (?EMPRESA,?GRUPO,?LISTADO,?TITULO)');
           Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
           Params.ByName['GRUPO'].AsInteger := Grupo;
           Params.ByName['LISTADO'].AsInteger := Result;
           Params.ByName['TITULO'].AsString := Copy(texto, 0, 60);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMLstListados.TomaSQLListado(Grupo, Listado: integer; donde: string);
var
  sl : TStringList;
  i, p : integer;
begin
  sl := TStringList.Create;
  try
     sl.LoadFromFile(donde);
     for i := 0 to sl.Count - 1 do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Clear;
              SQL.Add(sl.Strings[i]);
              for p := 0 to Params.Count - 1 do
              begin
                 if UpperCase(Params[p].Name) = 'EMPRESA' then
                    Params[p].AsInteger := REntorno.Empresa;
                 if UpperCase(Params[p].Name) = 'GRUPO' then
                    Params[p].AsInteger := Grupo;
                 if UpperCase(Params[p].Name) = 'LISTADO' then
                    Params[p].AsInteger := Listado;
              end;
              try
                 ExecQuery;
              except
                 on E: Exception do
                 begin
                    ShowMessage(_('Error al ejecutar') + #13#10 + SQL.Text);
                 end;
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  finally
     sl.Free;
  end;
end;

procedure TDMLstListados.TomaFR3listado(Grupo, Listado: integer; Donde, Nombre: string);
var
  Numero : integer;
  ts : TStrings;
begin
  Numero := DameNumeroListado(Grupo, Listado, Nombre);
  ts := TStringList.Create;
  try
     ts.LoadFromFile(Donde);
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRW(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Add(' SELECT *  FROM LST_LISTADOS_DETALLE ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA=?EMPRESA AND ');
              SelectSQL.Add(' GRUPO=?GRUPO AND ');
              SelectSQL.Add(' LISTADO=?LISTADO AND ');
              SelectSQL.Add(' NUMERO=?NUMERO ');

              UpdateSQL.Add(' UPDATE LST_LISTADOS_DETALLE ');
              UpdateSQL.Add(' SET ');
              UpdateSQL.Add('   DEF_LISTADO=?DEF_LISTADO ');
              UpdateSQL.Add('   ,CABECERA=?CABECERA ');
              UpdateSQL.Add('   ,EDITABLE=?EDITABLE ');
              UpdateSQL.Add('   ,TITULO=?TITULO ');
              UpdateSQL.Add(' WHERE ');
              UpdateSQL.Add('   EMPRESA=?EMPRESA AND ');
              UpdateSQL.Add('   GRUPO=?GRUPO AND ');
              UpdateSQL.Add('   LISTADO=?LISTADO AND ');
              UpdateSQL.Add('   NUMERO=?NUMERO ');

              Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
              Params.ByName['GRUPO'].AsInteger := Grupo;
              Params.ByName['LISTADO'].AsInteger := Listado;
              Params.ByName['NUMERO'].AsInteger := Numero;
              Open;
              Edit;
              FieldByName('DEF_LISTADO').Assign(ts);
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
  finally
     ts.Free;
  end;
end;

procedure TDMLstListados.TomaDefListado(Grupo, Listado: integer; Donde: string);
var
  slSQL, sl : TStringList;
  x : integer;
  DS : TFIBDataSet;
begin
  sl := TStringList.Create;
  slSQL := TStringList.Create;
  try
     sl.LoadFromFile(Donde);
     for x := 0 to sl.Count - 1 do
     begin
        if Pos('###', sl.Strings[x]) = 1 then
           Break;
        slSQL.Add(sl.Strings[x]);
     end;

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

              SelectSQL.Add(' SELECT * FROM LST_LISTADOS ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA=?EMPRESA AND ');
              SelectSQL.Add(' GRUPO=?GRUPO AND ');
              SelectSQL.Add(' LISTADO=?LISTADO ');

              UpdateSQL.Add(' UPDATE LST_LISTADOS ');
              UpdateSQL.Add(' SET ');
              UpdateSQL.Add('   TITULO=?TITULO ');
              UpdateSQL.Add('   ,DESCRIPCION=?DESCRIPCION ');
              UpdateSQL.Add('   ,CONSULTA=?CONSULTA ');
              UpdateSQL.Add('   ,MOSTRAR_OPCIONES=?MOSTRAR_OPCIONES ');
              UpdateSQL.Add('   ,MOSTRAR_SALIDA=?MOSTRAR_SALIDA ');
              UpdateSQL.Add('   ,MOSTRAR_TIPO=?MOSTRAR_TIPO ');
              UpdateSQL.Add('   ,MOSTRAR_RESUMIDO=?MOSTRAR_RESUMIDO ');
              UpdateSQL.Add('   ,MOSTRAR_GENERAL=?MOSTRAR_GENERAL ');
              UpdateSQL.Add('   ,POR_DEFECTO=?POR_DEFECTO ');
              UpdateSQL.Add('   ,ORDEN=?ORDEN ');
              UpdateSQL.Add('   ,PERMITIR_NUEVOS_LISTADOS=?PERMITIR_NUEVOS_LISTADOS ');
              UpdateSQL.Add('   ,PERMITIR_MODIFICAR_LISTADOS=?PERMITIR_MODIFICAR_LISTADOS ');
              UpdateSQL.Add('   ,PERMITIR_ELIMINAR=?PERMITIR_ELIMINAR ');
              UpdateSQL.Add(' WHERE ');
              UpdateSQL.Add('   LISTADO=?LISTADO AND ');
              UpdateSQL.Add('   GRUPO=?GRUPO AND ');
              UpdateSQL.Add('   EMPRESA=?EMPRESA ');

              Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
              Params.ByName['GRUPO'].AsInteger := Grupo;
              Params.ByName['LISTADO'].AsInteger := Listado;
              Open;
              Edit;
              // DS.FieldByName('DEF_LISTADO').Assign(sl);
              DS.FieldByName('CONSULTA').AsString := slSQL.Text;
              DS.FieldByName('MOSTRAR_OPCIONES').AsInteger := StrToIntDef(sl.Values['MOSTRAR_OPCIONES'], 0);
              DS.FieldByName('MOSTRAR_SALIDA').AsInteger := StrToIntDef(sl.Values['MOSTRAR_SALIDA'], 0);
              DS.FieldByName('MOSTRAR_TIPO').AsInteger := StrToIntDef(sl.Values['MOSTRAR_TIPO'], 0);
              DS.FieldByName('MOSTRAR_RESUMIDO').AsInteger := StrToIntDef(sl.Values['MOSTRAR_RESUMIDO'], 0);
              DS.FieldByName('MOSTRAR_GENERAL').AsInteger := StrToIntDef(sl.Values['MOSTRAR_GENERAL'], 0);
              DS.FieldByName('PERMITIR_NUEVOS_LISTADOS').AsInteger := StrToIntDef(sl.Values['PERMITIR_NUEVOS_LISTADOS'], 0);
              DS.FieldByName('PERMITIR_MODIFICAR_LISTADOS').AsInteger := StrToIntDef(sl.Values['PERMITIR_MODIFICAR_LISTADOS'], 0);
              DS.FieldByName('PERMITIR_ELIMINAR').AsInteger := StrToIntDef(sl.Values['PERMITIR_ELIMINAR'], 0);
              Post;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end
     finally
        FreeAndNil(DS);
     end;
  finally
     slSQL.Free;
     sl.Free;
  end;
end;

end.
