unit UDMEmpEjerCanal;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Graphics, Forms, DB, FIBDataSet, FIBTableDataSet,
  ImgList, ComCtrls, StdCtrls, Menus, FIBDatabase, UFIBModificados, Controls,
  FIBQuery, FIBDataSetRO, HYFIBQuery, ExtCtrls, DBTables, jpeg, GIFImage, Dialogs;

type
  TDMEmpEjerCanal = class(TDataModule)
     xEjercicios: TFIBDataSetRO;
     xCanales: TFIBDataSetRO;
     xEmpresas: TFIBDataSetRO;
     ILEmpresas: TImageList;
     DSxEmpresas: TDataSource;
     DSxTerceroEmpresa: TDataSource;
     xTerceroEmpresa: TFIBDataSetRO;
     TLocal: THYTransaction;
     xTerceroEmpresaTERCERO: TIntegerField;
     xTerceroEmpresaNIF: TFIBStringField;
     xTerceroEmpresaTELEFONO01: TFIBStringField;
     xTerceroEmpresaTELEFONO02: TFIBStringField;
     xTerceroEmpresaTELEFAX: TFIBStringField;
     xTerceroEmpresaEMAIL: TFIBStringField;
     xTerceroEmpresaWEB: TFIBStringField;
     xTerceroEmpresaTIPO_RAZON: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMEmpEjerCanalCreate(Sender: TObject);
     procedure DMEmpEjerCanalDestroy(Sender: TObject);
     procedure xEmpresasAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure CargaEmpresas(Lista: TListView);
     procedure CargaEjercicios(Empresa: integer; Combo: TComboBox);
     procedure CargaDatosCabecera;
     procedure CargaSysConstantes;
     procedure CargaAlmacenDefecto;
     procedure DameUltimoAcceso(var Empresa, Ejercicio, Canal: integer; var Serie: string; var MemorizarFecha: boolean; var FechaTrabajo: TDateTime);
     procedure DameUltimoAccesoEEC(Empresa: integer; var Ejercicio, Canal: integer; var Serie: string; var MemorizarFecha: boolean; var FechaTrabajo: TDateTime);
     procedure GuardarUltimoAcceso(Empresa, Ejercicio, Canal: integer; Serie: string; MemorizarFecha: boolean; FechaTrabajo: TDateTime);
     procedure CalculaSerieActiva;
     function VerificaFecha(Empresa, Ejercicio: integer; Fecha: TDateTime): TDateTime;
  end;

var
  DMEmpEjerCanal : TDMEmpEjerCanal;

implementation

uses UDMMain, DBCtrls, UEntorno, UNavigator, UUtiles, UImagenes;

{$R *.DFM}

procedure TDMEmpEjerCanal.DMEmpEjerCanalCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xEmpresas.Close;
  xEjercicios.Close;
  xCanales.Close;

  xEmpresas.Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
  xEmpresas.Open;
  xEmpresas.Last;
  xEmpresas.First;
  xEjercicios.Open;
  xCanales.Open;
end;

procedure TDMEmpEjerCanal.DMEmpEjerCanalDestroy(Sender: TObject);
begin
  xEmpresas.Close;
end;

procedure TDMEmpEjerCanal.CargaEmpresas(Lista: TListView);
var
  Item : TListItem;
  RDim : TRect;
  Imagen : TImage;
begin
  CargaSysConstantes; // Cargar las constantes del sistema

  ILEmpresas.Clear;
  RDim.Top := 0;
  RDim.Left := 0;
  RDim.Right := ILEmpresas.Width;
  RDim.Bottom := ILEmpresas.Height;

  Imagen := TImage.Create(Self);
  try
     // Recorremos los registros de empresas y creamos
     // los iconos correspondientes...
     xEmpresas.First;
     while not xEmpresas.EOF do
     begin
        Item := Lista.Items.Add;
        Item.Caption := xEmpresas.FieldByName('TITULO').AsString;
        Item.Data := Pointer(xEmpresas.FieldByName('EMPRESA').AsInteger);

        RefrescarImagen(Imagen, xEmpresas.FieldByName('E_IMAGEN').AsInteger);
        Imagen.Picture.Bitmap.Canvas.StretchDraw(RDim, Imagen.Picture.Graphic);
        Imagen.Picture.Bitmap.Height := ILEmpresas.Height;
        Imagen.Picture.Bitmap.Width := ILEmpresas.Width;
        Item.ImageIndex := ILEmpresas.Add(Imagen.Picture.Bitmap, nil);

        xEmpresas.Next;
     end;
  finally
     Imagen.Free;
  end;
end;

procedure TDMEmpEjerCanal.CargaEjercicios(Empresa: integer; Combo: TComboBox);
var
  dia, mes, anyo : word;
begin
  Combo.Clear;
  with xEjercicios do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Open;
     while not EOF do
     begin
        Combo.Items.Add(FieldByName('EJERCICIO').AsString);
        Next;
     end;
     DecodeDate(REntorno.FechaTrab, anyo, mes, dia);
     if Combo.Items.IndexOf(IntToStr(anyo)) <> -1 then
        Combo.ItemIndex := Combo.Items.IndexOf(IntToStr(anyo))
     else
        Combo.ItemIndex := Combo.Items.Count - 1;
     Close;
  end;
end;

procedure TDMEmpEjerCanal.xEmpresasAfterOpen(DataSet: TDataSet);
begin
  xTerceroEmpresa.Open;
end;

procedure TDMEmpEjerCanal.CargaDatosCabecera;
begin
  // Hemos de lanzar un select que situe la empresa

  with xEmpresas do
  begin
     First;
     while (not EOF) and (xEmpresas.FieldByName('EMPRESA').AsInteger <> REntorno.Empresa) do
        Next;
  end;

  if (xEmpresas.FieldByName('EMPRESA').AsInteger = REntorno.Empresa) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT FIRST 1 DIRECCION, CODPOB, PROVINCIA, COLONIA FROM UT_JUSTIFICA_DOMICILIO(?TERCERO)';
           Params.ByName['TERCERO'].AsInteger := xTerceroEmpresa.FieldByName('TERCERO').AsInteger;
           ExecQuery;
           REntorno.DirEmpresa := FieldByName['DIRECCION'].AsString;
           REntorno.PobEmpresa := FieldByName['CODPOB'].AsString;
           REntorno.ProvEmpresa := FieldByName['PROVINCIA'].AsString;
           REntorno.ColoniaEmpresa := FieldByName['COLONIA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with REntorno do
     begin
        CifEmpresa := xTerceroEmpresa.FieldByName('NIF').AsString;
        Tel1Empresa := xTerceroEmpresa.FieldByName('TELEFONO01').AsString;
        Tel2Empresa := xTerceroEmpresa.FieldByName('TELEFONO02').AsString;
        FaxEmpresa := xTerceroEmpresa.FieldByName('TELEFAX').AsString;
        EmailEmpresa := xTerceroEmpresa.FieldByName('EMAIL').AsString;
        WebEmpresa := xTerceroEmpresa.FieldByName('WEB').AsString;
        Tercero := xEmpresas.FieldByName('TERCERO').AsInteger;
        Cliente_aut := (xEmpresas.FieldByName('CLIENTE_AUT').AsInteger = 1);
        Proveedor_aut := (xEmpresas.FieldByName('PROVEEDOR_AUT').AsInteger = 1);
        Acreedor_aut := (xEmpresas.FieldByName('ACREEDOR_AUT').AsInteger = 1);
        Riesgo := 0;
        NombreEmpresa := xEmpresas.FieldByName('TITULO').AsString;
        ListaPedCompra := xEmpresas.FieldByName('LISTAR_PEDIDOS').AsInteger;
        ImagenEmpresa := xEmpresas.FieldByName('E_IMAGEN').AsInteger;
        ImagenFondo := xEmpresas.FieldByName('F_IMAGEN').AsInteger;
        RECC := xEmpresas.FieldByName('RECC').AsInteger;
     end;

     UNavigator.Ronly := False;  // Se fuerza a false por supuestos problemas

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT PAIS, MONEDA, PGC FROM VER_CANALES_PAISES WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           REntorno.Pais := FieldByName['PAIS'].AsString;
           REntorno.Moneda := FieldByName['MONEDA'].AsString;
           REntorno.Pgc := FieldByName['PGC'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

// Cargar las constantes del sistema
procedure TDMEmpEjerCanal.CargaSysConstantes;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FAM_SYS_CODIGO, FAM_CODIGO, TAR_CODIGO, ART_TEXTO_LIBRE_CODIGO, PVP_POR_UD_SECUNDARIA, MONEDA_SEC, PRECIO_COSTE_MOV FROM SYS_CONSTANTES';
        ExecQuery;
        REntorno.FamSistema := FieldByName['FAM_SYS_CODIGO'].AsString;
        REntorno.FamDefecto := FieldByName['FAM_CODIGO'].AsString;
        REntorno.TarifaDefecto := FieldByName['TAR_CODIGO'].AsString;
        // REntorno.AlmacenDefecto := FieldByName['ALM_CODIGO'].AsString;
        REntorno.ArtTextoLibre := FieldByName['ART_TEXTO_LIBRE_CODIGO'].AsString;
        REntorno.PVP_Ud_Sec := (FieldByName['PVP_POR_UD_SECUNDARIA'].AsInteger = 1);
        REntorno.Moneda_Sec := FieldByName['MONEDA_SEC'].AsString;
        REntorno.Precio_coste_mov := (FieldByName['PRECIO_COSTE_MOV'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEmpEjerCanal.CargaAlmacenDefecto;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ALMACEN FROM ART_ALMACENES WHERE EMPRESA = ?EMPRESA AND DEFECTO = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        REntorno.AlmacenDefecto := FieldByName['ALMACEN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEmpEjerCanal.DameUltimoAcceso(var Empresa, Ejercicio, Canal: integer; var Serie: string; var MemorizarFecha: boolean; var FechaTrabajo: TDateTime);
begin
  // Busco los datos de la última entrada a la aplicacion
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 EMPRESA, EJERCICIO, CANAL, SERIE, MEMORIZAR_FECHA, FECHA_TRABAJO ');
           SQL.Add(' FROM SYS_USUARIOS_ULTIMO_ACCESO ');
           SQL.Add(' WHERE USUARIO=:USUARIO ');
           SQL.Add(' ORDER BY ULT_MODIFICACION DESC ');
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           ExecQuery;
           Empresa := FieldByName['EMPRESA'].AsInteger;
           Ejercicio := FieldByName['EJERCICIO'].AsInteger;
           Canal := FieldByName['CANAL'].AsInteger;
           Serie := FieldByName['SERIE'].AsString;
           MemorizarFecha := (FieldByName['MEMORIZAR_FECHA'].AsInteger = 1);
           FechaTrabajo := FieldByName['FECHA_TRABAJO'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     Empresa := 0;
  end;

  // Si no encuentro datos, tomo los del INI
  if (Empresa = 0) then
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
     Serie := REntorno.Serie;
     MemorizarFecha := REntorno.Memorizar_Fecha;
     FechaTrabajo := REntorno.FechaTrab;
  end;
end;

procedure TDMEmpEjerCanal.DameUltimoAccesoEEC(Empresa: integer; var Ejercicio, Canal: integer; var Serie: string; var MemorizarFecha: boolean; var FechaTrabajo: TDateTime);
begin
  // Busco los datos de la última entrada a la aplicacion
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT ');
           if (Ejercicio = 0) then
              SQL.Add(' EJERCICIO, ');
           if (Canal = 0) then
              SQL.Add(' CANAL, ');
           SQL.Add(' SERIE, MEMORIZAR_FECHA, FECHA_TRABAJO ');
           SQL.Add(' FROM SYS_USUARIOS_ULTIMO_ACCESO ');
           SQL.Add(' WHERE ');
           SQL.Add(' USUARIO=:USUARIO AND ');
           SQL.Add(' EMPRESA=:EMPRESA ');
           if (Ejercicio <> 0) then
              SQL.Add(' AND EJERCICIO=:EJERCICIO ');
           if (Canal <> 0) then
              SQL.Add(' AND CANAL=:CANAL ');
           SQL.Add(' ORDER BY ULT_MODIFICACION DESC ');
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           if (Ejercicio <> 0) then
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           if (Canal <> 0) then
              Params.ByName['CANAL'].AsInteger := Canal;
           ExecQuery;
           if (Ejercicio = 0) then
              Ejercicio := FieldByName['EJERCICIO'].AsInteger;
           if (Canal = 0) then
              Canal := FieldByName['CANAL'].AsInteger;
           Serie := FieldByName['SERIE'].AsString;
           MemorizarFecha := (FieldByName['MEMORIZAR_FECHA'].AsInteger = 1);
           FechaTrabajo := FieldByName['FECHA_TRABAJO'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     Ejercicio := 0;
     Canal := 0;
     Serie := '';
  end;

  // Si no encuentro datos, tomo los del INI
  if (Ejercicio = 0) then
     Ejercicio := REntorno.Ejercicio;
  if (Canal = 0) then
     Canal := REntorno.Canal;
  if (Serie = '') then
  begin
     Serie := REntorno.Serie;
     MemorizarFecha := REntorno.Memorizar_Fecha;
     FechaTrabajo := REntorno.FechaTrab;
  end;
end;

procedure TDMEmpEjerCanal.GuardarUltimoAcceso(Empresa, Ejercicio, Canal: integer; Serie: string; MemorizarFecha: boolean; FechaTrabajo: TDateTime);
var
  ExisteRegistro : boolean;
begin
  // Busco el registro que contiene los datos
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT EMPRESA ');
           SQL.Add(' FROM SYS_USUARIOS_ULTIMO_ACCESO ');
           SQL.Add(' WHERE ');
           SQL.Add(' USUARIO=:USUARIO AND ');
           SQL.Add(' EMPRESA=:EMPRESA AND ');
           SQL.Add(' EJERCICIO=:EJERCICIO AND ');
           SQL.Add(' CANAL=:CANAL ');
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           ExecQuery;
           ExisteRegistro := (FieldByName['EMPRESA'].AsInteger <> 0);
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

           if (ExisteRegistro) then
           begin
              SQL.Add(' UPDATE SYS_USUARIOS_ULTIMO_ACCESO ');
              SQL.Add(' SET ');
              SQL.Add(' SERIE=:SERIE, ');
              SQL.Add(' MEMORIZAR_FECHA=:MEMORIZAR_FECHA, ');
              SQL.Add(' FECHA_TRABAJO=:FECHA_TRABAJO ');
              SQL.Add(' WHERE ');
              SQL.Add(' USUARIO=:USUARIO AND ');
              SQL.Add(' EMPRESA=:EMPRESA AND ');
              SQL.Add(' EJERCICIO=:EJERCICIO AND ');
              SQL.Add(' CANAL=:CANAL ');
           end
           else
           begin
              SQL.Add(' INSERT INTO SYS_USUARIOS_ULTIMO_ACCESO ');
              SQL.Add(' (USUARIO, EMPRESA, EJERCICIO, CANAL, SERIE, MEMORIZAR_FECHA, FECHA_TRABAJO) ');
              SQL.Add(' VALUES ');
              SQL.Add(' (:USUARIO, :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :MEMORIZAR_FECHA, :FECHA_TRABAJO) ');
           end;

           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['MEMORIZAR_FECHA'].AsInteger := BoolToInt(MemorizarFecha);
           Params.ByName['FECHA_TRABAJO'].AsDateTime := FechaTrabajo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     // Si hubo un error al guardar estos datos no me importa
  end;
end;

procedure TDMEmpEjerCanal.CalculaSerieActiva;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(SERIE) FROM EMP_SERIES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=' + REntorno.EmpresaStr);
        SQL.Add(' AND EJERCICIO=' + REntorno.EjercicioStr);
        SQL.Add(' AND CANAL=' + REntorno.CanalStr);
        SQL.Add(' AND ACTIVO=1 ');
        ExecQuery;
        REntorno.Serie := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMEmpEjerCanal.VerificaFecha(Empresa, Ejercicio: integer; Fecha: TDateTime): TDateTime;
var
  DesdeFecha, HastaFecha : TDateTime;
begin
  /// Verifica que la fecha esté dentro del ejercicio de la empresa.
  /// Si la fecha no está dentro del ejercicio devuelve la fecha inicial o final del ejercicio dependeindo de la fecha de hoy.

  DameDesdeHastaPeriodo('19', DesdeFecha, HastaFecha, Empresa, Ejercicio);

  if ((Fecha >= DesdeFecha) and (Fecha <= HastaFecha)) then
     Result := Fecha
  else
  begin
     if (Now > Fecha) then
        Result := HastaFecha
     else
        Result := DesdeFecha;
  end;
end;

end.
