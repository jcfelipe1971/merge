unit UDMPrestashop;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, Dialogs, IniFiles,
  FIBDataSetRO, FIBDatabase, UFIBModificados, ADODB;

type
  TDMPrestashop = class(TDataModule)
     dbxMYSQLConnection: TSQLConnection;
     dbxQMySql: TSQLQuery;
     dbxDSMySql: TSQLDataSet;
     MYSQLConnection: TADOConnection;
  private
     { Private declarations }
     procedure EstableceConexionMySQL;
     function DameIdProductAttribute(id_product, id_attribute: integer): integer;
     procedure DameCodigoPrestashop(Articulo: string; var id_product, id_attribute, id_product_attribute: integer);
  public
     { Public declarations }
     function DameStockTienda(Articulo: string): double;
     procedure ModificarStockTienda(Articulo: string; Unidades: double);
     procedure ModificarStockTiendaAbsoluto(Articulo: string; Unidades: double);
     procedure FiltraArticulos(Desde, Hasta: integer);
     procedure ActualizaStockTicket(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rit, Factor: integer);
  end;

var
  DMPrestashop : TDMPrestashop;

implementation

uses UEntorno, UDMMain;

{$R *.dfm}

procedure TDMPrestashop.dbxEstableceConexionMySQL;
var
  oIni : TIniFile;
begin
  //Conecto si no está conectada
  with dbxMYSQLConnection do
  begin
     try
        if (not Connected) then
        begin
           oIni := TIniFile.Create(REntorno.FicheroINI);
           try
              DriverName := 'dbxmysql';
              GetDriverFunc := 'getSQLDriverMYSQL50';
              LibraryName := 'dbxopenmysql50.dll';
              VendorLib := 'libmysql.dll';
              LoginPrompt := False;
              Params.Clear;
              Params.Append('BlobSize=-1');
              Params.Append('ErrorResourceFile=');
              Params.Append('LocaleCode=0000');
              Params.Append('Database=' + oIni.ReadString('TiendaVirtual', 'Database ', ''));
              Params.Append('User_Name=' + oIni.ReadString('TiendaVirtual', 'User_Name ', ''));
              Params.Append('Password=' + oIni.ReadString('TiendaVirtual', 'Password ', ''));
              Params.Append('HostName=' + oIni.ReadString('TiendaVirtual', 'HostName ', ''));
           finally
              oIni.Free;
           end;
           Open;
        end;
     except
        on e: Exception do
           ShowMessage(_('Error al abrir conexion MySQL') + #13 + e.Message);
     end;
  end;
end;

procedure TDMPrestashop.EstableceConexionMySQL;
var
  oIni : TIniFile;
begin
  //Conecto si no está conectada
  with MYSQLConnection do
  begin
     try
        if (not Connected) then
        begin
           oIni := TIniFile.Create(REntorno.FicheroINI);
           try
              ConnextionString := 'DSN=' + oIni.ReadString('TiendaVirtual', 'DSN', '');
           finally
              oIni.Free;
           end;
           Open;
        end;
     except
        on e: Exception do
           ShowMessage(_('Error al abrir conexion MySQL') + #13 + e.Message);
     end;
  end;
end;

function TDMPrestashop.DameIdProductAttribute(id_product, id_attribute: integer): integer;
begin
  Result := 0;
  if (MYSQLConnection.Connected) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add('select a.id_product_attribute from ps_product_attribute a ');
           SQL.Add('join ps_product_attribute_combination c ');
           SQL.Add('on a.id_product_attribute=c.id_product_attribute ');
           SQL.Add('where a.id_product=:id_product and c.id_attribute=:id_attribute');
           Params.FindParam('id_product').Value := id_product;
           Params.FindParam('id_attribute').Value := id_attribute;
           Open;
           if (not IsEmpty) then
              Result := Fields[0].Value;
           Close;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener id_product_attribute') + #13 + e.Message);
        end;
     end;
  end;
end;

function TDMPrestashop.DameIdProductAttribute(id_product, id_attribute: integer): integer;
begin
  Result := 0;
  if (MYSQLConnection.Connected) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add('select a.id_product_attribute from ps_product_attribute a ');
           SQL.Add('join ps_product_attribute_combination c ');
           SQL.Add('on a.id_product_attribute=c.id_product_attribute ');
           SQL.Add('where a.id_product=:id_product and c.id_attribute=:id_attribute');
           Params.FindParam('id_product').Value := id_product;
           Params.FindParam('id_attribute').Value := id_attribute;
           Open;
           if (not IsEmpty) then
              Result := Fields[0].Value;
           Close;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener id_product_attribute') + #13 + e.Message);
        end;
     end;
  end;
end;

function TDMPrestashop.DameStockTienda(Articulo: string): double;
var
  Stock : double;
  id_product, id_attribute : integer;
begin
  // El codigo del articulo es la combinacion de id_product-id_attribute.
  // Si el articulo no tiene atributos el codigo es solo id_product
  Stock := 0;
  id_attribute := 0;
  if (Pos('-', Articulo) > 0) then
  begin
     id_product := StrToIntDef(Copy(articulo, 1, Pos('-', Articulo) - 1), 0);
     id_attribute := StrToIntDef(Copy(articulo, Pos('-', Articulo) + 1, Length(articulo)), 0);
  end
  else
     id_product := StrToIntDef(articulo, 0);

  // Si pude obtener el codigo sigo, de lo contrario no es un articulo de la tienda
  if (id_product > 0) then
  begin
     EstableceConexionMySQL;
     if (MYSQLConnection.Connected) then
     begin
        if (id_attribute > 0) then
           id_product := DameIdProductAttribute(id_product, id_attribute);
     end;
     // Veo el stock del articulo
     if (MYSQLConnection.Connected) then
     begin
        with QMySql do
        begin
           try
              if (Active) then
                 Close;
              if (id_attribute = 0) then
                 SQL.Text := 'select quantity from ps_product where id_product = :id_product'
              else
                 SQL.Text := 'select quantity from ps_product_attribute where id_product_attribute = :id_product';
              Params.FindParam('id_product').Value := id_product;
              Open;
              if (not IsEmpty) then
                 Stock := Fields[0].Value;
              Close;
           except
              on e: Exception do
                 ShowMessage(_('Error al obtener stock') + #13 + e.Message);
           end;
        end;
     end;
  end;
  Result := Stock;
end;

procedure TDMPrestashop.DameCodigoPrestashop(Articulo: string; var id_product, id_attribute, id_product_attribute: integer);
begin
  // El codigo del articulo es la combinacion de id_product-id_attribute.
  // Si el articulo no tiene atributos el codigo es solo id_product
  id_attribute := 0;
  id_product_attribute := 0;
  if (Pos('-', Articulo) > 0) then
  begin
     id_product := StrToIntDef(Copy(articulo, 1, Pos('-', Articulo) - 1), 0);
     id_attribute := StrToIntDef(Copy(articulo, Pos('-', Articulo) + 1, Length(articulo)), 0);
     id_product_attribute := DameIdProductAttribute(id_product, id_attribute);
  end
  else
     id_product := StrToIntDef(articulo, 0);
end;

procedure TDMPrestashop.ModificarStockTienda(Articulo: string; Unidades: double);
var
  id_product, id_attribute, id_product_attribute : integer;
begin
  /// Modifica las unidades de la tienda, sumando [Unidades] a las que tenga.

  DameCodigoPrestashop(Articulo, id_product, id_attribute, id_product_attribute);

  // Si pude obtener el codigo sigo, de lo contrario no es un articulo de la tienda
  if (id_product > 0) then
  begin
     EstableceConexionMySQL;
     // Veo el stock del articulo
     if (MYSQLConnection.Connected) then
     begin
        with QMySql do
        begin
           try
              if (Active) then
                 Close;
              if (id_attribute = 0) then
              begin
                 SQL.Text := 'update ps_product set quantity = quantity + :quantity where id_product = :id_product';
                 Params.FindParam('id_product').Value := id_product;
                 Params.FindParam('quantity').Value := Unidades;
              end
              else
              begin
                 SQL.Text := 'update ps_product_attribute set quantity = quantity + :quantity where id_product_attribute = :id_product_attribute';
                 Params.FindParam('id_product_attribute').Value := id_product_attribute;
                 Params.FindParam('quantity').Value := Unidades;
              end;
              ExecSQL;
              Close;
           except
              on e: Exception do
                 ShowMessage(_('Error al actualizar el stock') + #13 + e.Message);
           end;
        end;
     end;
  end;
end;

procedure TDMPrestashop.ModificarStockTiendaAbsoluto(Articulo: string; Unidades: double);
var
  id_product, id_attribute, id_product_attribute : integer;
begin
  /// Modifica las unidades de la tienda. Establece [Unidades] como stock.

  DameCodigoPrestashop(Articulo, id_product, id_attribute, id_product_attribute);

  // Si pude obtener el codigo sigo, de lo contrario no es un articulo de la tienda
  if (id_product > 0) then
  begin
     EstableceConexionMySQL;
     // Veo el stock del articulo
     if (MYSQLConnection.Connected) then
     begin
        with QMySql do
        begin
           try
              if (Active) then
                 Close;
              if (id_attribute = 0) then
              begin
                 SQL.Text := 'update ps_product set quantity = :quantity where id_product = :id_product';
                 Params.FindParam('id_product').Value := id_product;
                 Params.FindParam('quantity').Value := Unidades;
              end
              else
              begin
                 SQL.Text := 'update ps_product_attribute set quantity = :quantity where id_product_attribute = :id_product_attribute';
                 Params.FindParam('id_product_attribute').Value := id_product_attribute;
                 Params.FindParam('quantity').Value := Unidades;
              end;
              ExecSQL;
              Close;
           except
              on e: Exception do
                 ShowMessage(_('Error al actualizar el stock') + #13 + e.Message);
           end;
        end;
     end;
  end;
end;

procedure TDMPrestashop.FiltraArticulos(Desde, Hasta: integer);
var
  Q : TSQLQuery;
  DS : TSQLDataSet;
  i : integer;
begin
  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     DS := TSQLDataSet.Create(nil);
     try
        with DS do
        begin
           try
              SQLConnection := MYSQLConnection;
              if (Active) then
                 Close;
              CommandText := 'select p.id_product, p.reference from ps_product p ' +
                 'join ps_product_lang l ' +
                 'on p.id_product = l.id_product ' +
                 'where p.id_product >= :desde1 and p.id_product <= :hasta1';
              //PrepareStatement;
              Params.FindParam('desde1').Value := Desde;
              Params.FindParam('hasta1').Value := Hasta;
              Open;
              for i := 0 to Fields.Count - 1 do
                 ShowMessage('DisplayName ' + Fields[i].DisplayName + ' - FullName ' + Fields[i].FullName + ' - FieldName ' + Fields[i].FieldName + ' - Origin ' + Fields[i].Origin + '.');

              while (not EOF) do
              begin
                 ShowMessage(FieldByName('id_product').AsString + '-' {+ FieldByName('articulo').AsString} + '-' + FieldByName('reference').AsString);
                 Next;
              end;
              Close;
           except
              on e: Exception do
                 ShowMessage(_('Error al obtener id_product, nombre') + #13 + e.Message);
           end;
        end;
     finally
        DS.Free;
     end;
  end;

  (*
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Text :='(select '
           +' p.id_product, '
           +' p.id_product as articulo, '
           +' p.id_product as name '
           +'from ps_product p '
           +'where '
           +'p.id_product >= 0 and p.id_product <= 24) ';

           //+' concat(l.name,'' '',coalesce(p.peso_neto,'''')) name, '
           {+' p.id_supplier, '
           +' p.id_manufacturer, '
           +' p.quantity, '
           +' p.price, '
           +' p.weight, '
           +' x.rate, '
           //+' coalesce(x.rate, 0) rate, '
           +' p.date_upd '}
           {+'join ps_product_lang l '
           +'on (p.id_product = l.id_product) '
           +'left join ps_tax x '
           +'on (x.id_tax = p.id_tax) '
           +'left join ps_product_attribute pa '
           +'on (p.id_product = pa.id_product) '
           }
           //+'l.id_lang = 3 and p.id_product >= :desde1 and p.id_product <= :hasta1 and pa.id_product_attribute is null) ');

           {
           SQL.Add('(select '
           +' p.id_product, '
           +' p.id_product articulo, '
           +' concat(l.name,'' '',coalesce(p.peso_neto,'''')) name, '
           +' p.id_supplier, '
           +' p.id_manufacturer, '
           +' p.quantity, '
           +' p.price, '
           +' p.weight, '
           +' coalesce(x.rate, 0) rate, '
           +' p.date_upd '
           +'from ps_product p '
           +'join ps_product_lang l '
           +'on (p.id_product = l.id_product) '
           +'left join ps_tax x '
           +'on (x.id_tax = p.id_tax) '
           +'left join ps_product_attribute pa '
           +'on (p.id_product = pa.id_product) '
           +'where '
           +'l.id_lang = 3 and p.id_product >= :desde1 and p.id_product <= :hasta1 and pa.id_product_attribute is null) '
           +'union '
           +'(select '
           +' p.id_product, '
           +' concat(pa.id_product,''-'',ac.id_attribute) articulo, '
           +' concat(l.name,'' '',al.name,'' '',coalesce(p.peso_neto,'''')) name, '
           +' p.id_supplier, '
           +' p.id_manufacturer, '
           +' pa.quantity, '
           +' p.price, '
           +' p.weight, '
           +' coalesce(x.rate, 0) rate, '
           +' p.date_upd '
           +'from ps_product_attribute_combination ac '
           +'join ps_product_attribute pa '
           +'on (ac.id_product_attribute = pa.id_product_attribute) '
           +'join ps_product p '
           +'on (p.id_product = pa.id_product) '
           +'join ps_product_lang l '
           +'on (p.id_product = l.id_product) '
           +'left join ps_tax x '
           +'on (x.id_tax = p.id_tax) '
           +'join ps_attribute_lang al '
           +'on (ac.id_attribute = al.id_attribute) '
           +'where l.id_lang=3 and al.id_lang=3 and p.id_product >= :desde2 and p.id_product <= :hasta2) '
           +'order by 1 ');
           }
           //Params.FindParam('desde1').Value := Desde;
           //Params.FindParam('hasta1').Value := Hasta;
           //Params.FindParam('desde2').Value := Desde;
           //Params.FindParam('hasta2').Value := Hasta;
{
           SQL.Add('select a.id_product_attribute from ps_product_attribute a ');
           SQL.Add('join ps_product_attribute_combination c ');
           SQL.Add('on a.id_product_attribute=c.id_product_attribute ');
           SQL.Add('where a.id_product=:id_product and c.id_attribute=:id_attribute');
           Params.FindParam('id_product').Value := 103;
           Params.FindParam('id_attribute').Value := 29;
}
           Open;
           while (not EOF) do
           begin
              ShowMessage(FieldByName('id_product').AsString + '-' + FieldByName('articulo').AsString + '-' + FieldByName('name').AsString);
              //ShowMessage(FieldByName('id_product_attribute').AsString +'-');
              Next;
           end;
           Close;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener articulos') + #13 + e.Message);
        end;
     end;
  end;
*)
end;

procedure TDMPrestashop.ActualizaStockTicket(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rit, Factor: integer);
var
  DS : TFIBDataSetRO;
begin
  // Aqui debo recorrer las lineas y actualizar las unidades en la tienda virtual
  DS := TFIBDataSetRO.Create(nil);
  try
     with DS do
     begin
        DataBase := DMMain.DataBase;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT ARTICULO, UNIDADES FROM GES_TICKET_DETALLE ');
        SelectSQL.Add('WHERE EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add('EJERCICIO = ?EJERCICIO AND ');
        SelectSQL.Add('CANAL = ?CANAL AND ');
        SelectSQL.Add('SERIE =?SERIE AND ');
        SelectSQL.Add('TIPO = ?TIPO AND ');
        SelectSQL.Add('RIT = ?RIT ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIT'].AsInteger := Rit;
        Open;
        while not EOF do
        begin
           DMPrestashop.ModificarStockTienda(FieldByName('ARTICULO').AsString, Factor * FieldByName('UNIDADES').AsFloat);
           Next;
        end;
        Close;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

end.
