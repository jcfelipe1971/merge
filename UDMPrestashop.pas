unit UDMPrestashop;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, Dialogs,
  FIBDataSetRO, FIBDatabase, UFIBModificados, ADODB, XMLDoc, XMLIntf;

type
  TDMPrestashop = class(TDataModule)
     MYSQLConnection: TADOConnection;
     QMySQL: TADOQuery;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     // Webservice
     WSSecureProtocol: boolean;
     WSURL: string;
     WSKey: string;
     WSDebug: boolean;
     IdShop: integer;
     IdGroupShop: integer;
     Recursos: TStrings;
     TaxRuleGroups: TStrings;

     // Conexion directa MySQL
     DSN: string;
     function EstableceConexionMySQL(Quiet: boolean = False): boolean;
     (*
     procedure EstableceConstantes;
     function DameIdProductAttribute(id_configuracion, id_product, id_attribute: integer): integer;
     procedure DameCodigoPrestashop(ID_A: integer; id_configuracion: integer; var id_product, id_product_attribute: integer; var id_attribute: string);
     *)

     // Webservice
     // function WS_Get(aURL, Token: string): string;
     procedure ClearCData(aXML: TStrings);
     function WS_DoPost(Metodo, Resource: string; id: integer; Opciones: string; Contenido, Respuesta: TStrings): integer;
     function WS_GetResources: integer;
     procedure WS_GetTaxRuleGroups;
     function WS_GetIdCountry(Pais: string): integer;
     function WS_GetIdRootCategory: integer;
  public
     { Public declarations }
     WSVersion: string;
     id_lang: integer;
     id_country: integer;
     id_root_category: integer;

     // Webservice
     function WS_Inicializa(aURL, aKey, aVersion: string; aDebug: boolean): boolean;
     procedure WS_SetShop(aIdShop, aIdGroupShop: integer);
     procedure WS_DameRecursos(aRecursos: TStrings);
     procedure WS_DameTaxRuleGroups(aTaxRuleGroups: TStrings);
     function WS_DameVersion(Legacy: boolean = False): string;
     function WS_Add(Resource: string; xml, Respuesta: TStrings): integer;
     function WS_Get(Resource: string; id: integer; Opciones: string; Respuesta: TStrings): integer;
     function WS_Edit(Resource: string; id: integer; xml, Respuesta: TStrings): integer;
     function WS_Delete(Resource: string; id: integer; Respuesta: TStrings): integer;
     function SuperaVersion(aVersion: string): boolean;

     // Acceso directo a base MySQL
     procedure SetDSN(aDSN, aVersionPrestashop: string);
     function DameFechaServidorMySQL(Quiet: boolean = False): TDateTime;
     function FiltraPacks(Quiet: boolean = False): boolean;
     function FiltraMegaProductCart(DesdeRegistro: integer; Quiet: boolean = False): boolean;

     function DameStockTienda(ID_A: integer): double;
     procedure ModificarStockTienda(ID_A: integer; Unidades: double);
     (*
     procedure FiltraEstadoOrdenPrestashop;
     function DameIdProductAttribute(id_configuracion, id_product, id_attribute: integer): integer;
     procedure DameCodigoPrestashop(ID_A: integer; id_configuracion: integer; var id_product, id_product_attribute: integer; var id_attribute: string);
     procedure ModificarStockTiendaAbsoluto(ID_A: integer; Unidades: double);
     procedure FiltraArticulos(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime; Equivalencia: boolean; Tipo: integer);
     procedure FiltraClientes(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime; SoloClientesConPedidos: boolean = True);
     procedure FiltraProveedores(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime);
     procedure FiltraFabricantes(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime);
     procedure FiltraDireccionesClientes(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime; SoloClientesConPedidos: boolean = True);
     procedure FiltraDireccionesProveedores(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime);
     procedure FiltraOrdenes(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime; ModuloPaypal: boolean);
     procedure FiltraCodProvArticulos(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime);
     *)

     procedure ActualizaStockTicket(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rit, Factor: integer);
  end;

// Utilidades para trabajar con XML
function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
function DameDato(Nodo: IXMLNode; a: array of string): string;
function DameNodoValorAtributo(Nodo: IXMLNode; Atributo: string): string;
function DameNodoLenguage(Nodo: IXMLNode; lang_id: integer): IXMLNode;
function DameDatoLenguage(Nodo: IXMLNode; lang_id: integer): string;
procedure SetDatoLenguage(Nodo: IXMLNode; lang_id: integer; s: string);

var
  DMPrestashop : TDMPrestashop;

implementation

uses {$IFDEF Debug} UFMPruebas, {$ENDIF} UEntorno, UUtiles, UDameDato, UDMMain, HYFIBQuery, IdHttp,
  IdMultipartFormData, IdSSLOpenSSL, WinInet, HttpConnectionWinInet;

{$R *.dfm}

/// Utilidades para trabajar con XML
function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
var
  i : integer;
begin
  Result := nil;
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i]);
     Inc(i);
  end;

  Result := Nodo;
end;

function DameDato(Nodo: IXMLNode; a: array of string): string;
begin
  Result := '';

  Nodo := DameNodo(Nodo, a);
  if Assigned(Nodo) then
  begin
     if Nodo.IsTextElement then
        Result := Nodo.Text
     else
     if Nodo.NodeType = ntCData then
        Result := Nodo.NodeValue
     else
     if Nodo.NodeType = ntElement then
     begin
        Nodo := Nodo.ChildNodes.First;
        if Assigned(Nodo) then
        begin
           if Nodo.IsTextElement then
              Result := Nodo.Text
           else
           if Nodo.NodeType = ntCData then
              Result := Nodo.NodeValue;
        end;
     end;
  end;
end;

function DameNodoValorAtributo(Nodo: IXMLNode; Atributo: string): string;
var
  // i : integer;
  ListaAttr : IXMLNodeList;
  // NodoLang : IXMLNode;
  NodoAttr : IXMLNode;
begin
  /// Dentro de estos nodos (language) hay atributos (id="1")
  {Ejemplo:
  <name>
     <language id="1" xlink:href="http://prestashop.myshop.com/api/languages/1">Clothes</language>
     <language id="2" xlink:href="http://prestashop.myshop.com/api/languages/2">Clothes</language>
     <language id="3" xlink:href="http://prestashop.myshop.com/api/languages/3">Clothes</language>
     <language id="4" xlink:href="http://prestashop.myshop.com/api/languages/4">Clothes</language>
  </name>
  }

  Result := '';

  // Obtengo la lista de atributos del nodo
  ListaAttr := Nodo.AttributeNodes;
  if Assigned(ListaAttr) then
  begin
     // Busco el atributo "id"
     NodoAttr := ListaAttr.FindNode(Atributo);
     if Assigned(NodoAttr) then
        Result := NodoAttr.Text;
  end;
end;

function DameNodoLenguage(Nodo: IXMLNode; lang_id: integer): IXMLNode;
var
  i : integer;
  attr : string;
  ListaAttr : IXMLNodeList;
  NodoLang, NodoAttr : IXMLNode;
begin
  /// Nodo es el nodo padre.
  /// Dentro de este nodo hay varios nodos <language> que tienen un atributo id que identifica al lenguage
  {Ejemplo:
  <name>
     <language id="1" xlink:href="http://prestashop.myshop.com/api/languages/1">Clothes</language>
     <language id="2" xlink:href="http://prestashop.myshop.com/api/languages/2">Clothes</language>
     <language id="3" xlink:href="http://prestashop.myshop.com/api/languages/3">Clothes</language>
     <language id="4" xlink:href="http://prestashop.myshop.com/api/languages/4">Clothes</language>
  </name>
  }

  Result := nil;

  // Recorro los nodos.
  for i := 0 to Nodo.ChildNodes.Count - 1 do
  begin
     NodoLang := Nodo.ChildNodes.Get(i);
     attr := '';

     // Obtengo la lista de atributos del nodo
     ListaAttr := NodoLang.AttributeNodes;
     if Assigned(ListaAttr) then
     begin
        // Busco el atributo "id"
        NodoAttr := ListaAttr.FindNode('id');
        if Assigned(NodoAttr) then
           attr := NodoAttr.Text;

        // Si es el que busco lo devuelvo
        if (StrToInt(attr) = lang_id) then
           Result := NodoLang;
     end;
  end;
end;

function DameDatoLenguage(Nodo: IXMLNode; lang_id: integer): string;
var
  NodoLang : IXMLNode;
begin
  /// Nodo es el nodo padre.
  /// Dentro de este nodo hay varios nodos <language> que tienen un atributo id que identifica al lenguage
  {Ejemplo:
  <name>
     <language id="1" xlink:href="http://prestashop.myshop.com/api/languages/1">Clothes</language>
     <language id="2" xlink:href="http://prestashop.myshop.com/api/languages/2">Clothes</language>
     <language id="3" xlink:href="http://prestashop.myshop.com/api/languages/3">Clothes</language>
     <language id="4" xlink:href="http://prestashop.myshop.com/api/languages/4">Clothes</language>
  </name>
  }

  Result := '';
  NodoLang := DameNodoLenguage(Nodo, lang_id);
  if Assigned(NodoLang) then
     Result := DameDato(NodoLang, []);
end;

procedure SetDatoLenguage(Nodo: IXMLNode; lang_id: integer; s: string);
var
  NodoLang : IXMLNode;
begin
  NodoLang := DameNodoLenguage(Nodo, lang_id);
  if Assigned(NodoLang) then
     NodoLang.Text := s;
end;

procedure TDMPrestashop.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  Recursos := TStringList.Create;
  TaxRuleGroups := TStringList.Create;
end;

procedure TDMPrestashop.DataModuleDestroy(Sender: TObject);
begin
  Recursos.Free;
  TaxRuleGroups.Free;
end;

function TDMPrestashop.DameStockTienda(ID_A: integer): double;
var
  Stock : double;
  (*
  Q : THYFIBQuery;
  aDSN, aVersionPrestashop : string;
  id_configuracion, id_product, id_product_attribute : integer;
  id_attribute : string;
  *)
begin
  Stock := 0;

  { TODO : Implementar mediante webservice }

  (*
  // Busco la conexion según la empresa a la que pertenece el articulo y conecto
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID, DSN, VERSION_PRESTASHOP FROM SYS_CONF_PRESTASHOP WHERE EMPRESA = (SELECT EMPRESA FROM ART_ARTICULOS WHERE ID_A = :ID_A)';
        Params.ByName['ID_A'].AsInteger := ID_A;
        ExecQuery;
        id_configuracion := FieldByName['ID'].AsInteger;
        aDSN := Trim(FieldByName['DSN'].AsString);
        aVersionPrestashop := FieldByName['VERSION_PRESTASHOP'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if ((id_configuracion > 0) and (aDSN <> '')) then
  begin
     SetDSN(aDSN, aVersionPrestashop);
     EstableceConexionMySQL;

     if (MYSQLConnection.Connected) then
     begin
        // Busco los codigos prestashop para el artículo
        DameCodigoPrestashop(ID_A, id_configuracion, id_product, id_product_attribute, id_attribute);

        // Si pude obtener el codigo sigo, de lo contrario no es un articulo de la tienda
        if (id_product > 0) then
        begin
           // Veo el stock del articulo
           with QMySql do
           begin
              try
                 if (Active) then
                    Close;

                 if (id_product_attribute = 0) then
                 begin
                    SQL.Text := 'select quantity from ps_product where id_product = :id_product';
                    Parameters.FindParam('id_product').Value := id_product;
                 end
                 else
                 begin
                    SQL.Text := 'select quantity from ps_product_attribute where id_product_attribute = :id_product_attribute';
                    Parameters.FindParam('id_product_attribute').Value := id_product_attribute;
                 end;

                 Open;

                 if (not IsEmpty) then
                    Stock := Fields[0].Value;

                 Close;
              except
                 on e: Exception do
                    ShowMessage(_('Error al obtener stock Prestashop') + #13#10 + e.Message);
              end;
           end;
        end;
     end;
  end;
  *)

  Result := Stock;
end;

(*
function TDMPrestashop.DameIdProductAttribute(id_configuracion, id_product, id_attribute: integer): integer;
begin
  /// Devuelve la combinacion en la que se encuentra este producto y atributo
  /// Devuelve el primero que encuentra pero puede estar en mas de una combinacion
  /// Ejemplo:
  ///     Pantalon Talla 40 Color Blanco, Pantalon Talla 42 Color Blanco, Pantalon Talla 44 Color Blanco
  ///     Si busco el atributo "Blanco" puede estar en las 3 combinaciones de TALLA

  Result := 0;

  if (MYSQLConnection.Connected) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add(' select a.id_product_attribute from ps_product_attribute a ');
           SQL.Add(' join ps_product_attribute_combination c ');
           SQL.Add(' on a.id_product_attribute = c.id_product_attribute ');
           SQL.Add(' where ');
           SQL.Add(' a.id_product = :id_product and ');
           SQL.Add(' c.id_attribute = :id_attribute ');
           Parameters.FindParam('id_product').Value := id_product;
           Parameters.FindParam('id_attribute').Value := id_attribute;
           Open;
           if (not IsEmpty) then
              Result := Fields[0].Value;
           Close;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener id_product_attribute') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
(*
procedure TDMPrestashop.DameCodigoPrestashop(ID_A: integer; id_configuracion: integer; var id_product, id_product_attribute: integer; var id_attribute: string);
var
  Q : THYFIBQuery;
begin
  id_product := 0;
  id_attribute := '';
  id_product_attribute := 0;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTES FROM SYS_CONF_PRESTASHOP_ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_A = :ID_A ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := id_configuracion;
        Params.ByName['ID_A'].AsInteger := ID_A;
        ExecQuery;
        id_product := FieldByName['ID_PRODUCT'].AsInteger;
        id_product_attribute := FieldByName['ID_PRODUCT_ATTRIBUTE'].AsInteger;
        id_attribute := FieldByName['ID_ATTRIBUTES'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Si no encontré la combinación, pero hay un solo atributo
  if ((id_product_attribute = 0) and (StrToIntDef(id_attribute, 0) > 0)) then
     id_product_attribute := DameIdProductAttribute(id_configuracion, id_product, StrToIntDef(id_attribute, 0));
end;
*)

(*
procedure TDMPrestashop.FiltraEstadoOrdenPrestashop;
begin
  {
select  s.id_order_state, l.name
from ps_order_state s
join ps_order_state_lang l
on (s.id_order_state = l.id_order_state)
where
l.id_lang = :id_lang
order by 1, 2
}

  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           if (Active) then
              Close;
           Connection := MYSQLConnection;
           SQL.Clear;
           SQL.Add(' select s.id_order_state, l.name ');
           SQL.Add(' from ps_order_state s ');
           SQL.Add(' join ps_order_state_lang l ');
           SQL.Add(' on (s.id_order_state = l.id_order_state) ');
           SQL.Add(' where ');
           SQL.Add(' l.id_lang = ' + IntToStr(id_lang) + ' ');
           SQL.Add(' order by 1, 2 ');

           // PrepareStatement;
           {
           Parameters.FindParam('id_lang').Value := id_lang;
           }
           Open;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener Estados de MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
procedure TDMPrestashop.ModificarStockTienda(ID_A: integer; Unidades: double);
(*
var
  Q : THYFIBQuery;
  aDSN, aVersionPrestashop : string;
  id_configuracion, id_product, id_product_attribute : integer;
  id_attribute : string;
*)
begin
  /// Modifica las unidades de la tienda, sumando [Unidades] a las que tenga.

  { TODO : Implementar mediante webservice }
  (*
  // Busco la conexion según la empresa a la que pertenece el articulo y conecto
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID, DSN, VERSION_PRESTASHOP FROM SYS_CONF_PRESTASHOP WHERE EMPRESA = (SELECT EMPRESA FROM ART_ARTICULOS WHERE ID_A = :ID_A)';
        Params.ByName['ID_A'].AsInteger := ID_A;
        ExecQuery;
        id_configuracion := FieldByName['ID'].AsInteger;
        aDSN := FieldByName['DSN'].AsString;
        aVersionPrestashop := FieldByName['VERSION_PRESTASHOP'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (id_configuracion > 0) then
  begin
     SetDSN(aDSN, aVersionPrestashop);
     EstableceConexionMySQL;

     if (MYSQLConnection.Connected) then
     begin
        // Busco los codigos prestashop para el artículo
        DameCodigoPrestashop(ID_A, id_configuracion, id_product, id_product_attribute, id_attribute);

        // Si pude obtener el codigo sigo, de lo contrario no es un articulo de la tienda
        if (id_product > 0) then
        begin
           // Veo el stock del articulo
           with QMySql do
           begin
              try
                 if (Active) then
                    Close;
                 if (id_product_attribute = 0) then
                 begin
                    SQL.Text := 'update ps_product set quantity = quantity + :quantity where id_product = :id_product';
                    Parameters.FindParam('id_product').Value := id_product;
                 end
                 else
                 begin
                    SQL.Text := 'update ps_product_attribute set quantity = quantity + :quantity where id_product_attribute = :id_product_attribute';
                    Parameters.FindParam('id_product_attribute').Value := id_product_attribute;
                 end;
                 Parameters.FindParam('quantity').Value := Unidades;
                 ExecSQL;
                 Close;
              except
                 on e: Exception do
                    ShowMessage(_('Error al actualizar el stock relativo en tienda Prestashop') + #13#10 + e.Message);
              end;
           end;
        end;
     end;
  end;
  *)
end;

(*
procedure TDMPrestashop.ModificarStockTiendaAbsoluto(ID_A: integer; Unidades: double);
var
  Q : THYFIBQuery;
  aDSN, aVersionPrestashop : string;
  id_configuracion, id_product, id_product_attribute : integer;
  id_attribute : string;
begin
  /// Modifica las unidades de la tienda. Establece [Unidades] como stock.

  // Busco la conexion según la empresa a la que pertenece el articulo y conecto
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID, DSN, VERSION_PRESTASHOP FROM SYS_CONF_PRESTASHOP WHERE EMPRESA = (SELECT EMPRESA FROM ART_ARTICULOS WHERE ID_A = :ID_A)';
        Params.ByName['ID_A'].AsInteger := ID_A;
        ExecQuery;
        id_configuracion := FieldByName['ID'].AsInteger;
        aDSN := FieldByName['DSN'].AsString;
        aVersionPrestashop := FieldByName['VERSION_PRESTASHOP'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (id_configuracion > 0) then
  begin
     SetDSN(aDSN, aVersionPrestashop);
     EstableceConexionMySQL;

     if (MYSQLConnection.Connected) then
     begin
        // Busco los codigos prestashop para el artículo
        DameCodigoPrestashop(ID_A, id_configuracion, id_product, id_product_attribute, id_attribute);

        // Si pude obtener el codigo sigo, de lo contrario no es un articulo de la tienda
        if (id_product > 0) then
        begin
           // Veo el stock del articulo
           with QMySql do
           begin
              try
                 if (Active) then
                    Close;
                 if (id_product_attribute = 0) then
                 begin
                    SQL.Text := 'update ps_product set quantity = :quantity where id_product = :id_product';
                    Parameters.FindParam('id_product').Value := id_product;
                 end
                 else
                 begin
                    SQL.Text := 'update ps_product_attribute set quantity = :quantity where id_product_attribute = :id_product_attribute';
                    Parameters.FindParam('id_product_attribute').Value := id_product_attribute;
                 end;
                 Parameters.FindParam('quantity').Value := Unidades;
                 ExecSQL;
                 Close;
              except
                 on e: Exception do
                    ShowMessage(_('Error al actualizar el stock absoluto en tienda Prestashop') + #13#10 + e.Message);
              end;
           end;
        end;
     end;
  end;
end;
*)

(*
procedure TDMPrestashop.FiltraArticulos(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime; Equivalencia: boolean; Tipo: integer);
var
  sDesdeFecha, sHastaFecha : string;
  f : integer;
begin
{SQL que se ejecutará

(select
/**/
cast(coalesce(ep.idProducto, "0") as integer) id_product_equi, cast("" as char) id_attribute_equi,
cast(0 as integer) id_product_equi, cast("" as char) id_attribute_equi,
/**/
p.id_product, cast("" as char) id_attribute, 0 id_product_attribute, p.reference, p.ean13, p.upc, l.name name, p.id_supplier, p.id_manufacturer,
p.quantity, p.price, p.weight,
coalesce((select x.rate
from ps_tax_rule tr
left join ps_tax x on (tr.id_tax = x.id_tax)
where
tr.id_country = 6 and
p.id_tax_rules_group = tr.id_tax_rules_group and
x.rate is not null
order by x.rate desc limit 1, 1), 0) rate,
(case
when (p.date_upd < p.date_add) then p.date_add
else p.date_upd
end) as date_upd
from ps_product p
join ps_product_lang l on (p.id_product = l.id_product)
left join ps_product_attribute pa on (p.id_product = pa.id_product)
/**/
left join ps_imax_general_equi_products ep on p.id_product = ep.idProductoPrestashop
/**/
where
p.active = 1 and
l.id_lang = 1 and
p.id_product >= 0 and
p.id_product <= 999999 and
pa.id_product_attribute is null
and (p.date_upd > "2018-06-01" or ((p.date_add > "2018-06-01")  and (p.date_upd is null)))
)
union
(select
/**/
cast(coalesce(min(ep.idProducto), "0") as integer) id_product_equi, coalesce(group_concat(ea.idAttribute order by ea.idAttribute), "") id_attribute_equi,
cast(0 as integer) id_product_equi, cast("" as char) id_attribute_equi,
/**/
p.id_product, group_concat(ac.id_attribute order by ac.id_attribute) id_attribute, ac.id_product_attribute, pa.reference, pa.ean13, pa.upc,
concat(l.name, " ", group_concat(al.name order by ag.position)) name, p.id_supplier, p.id_manufacturer,
pa.quantity, p.price, p.weight,
coalesce((select x.rate
from ps_tax_rule tr
left join ps_tax x on (tr.id_tax = x.id_tax)
where
tr.id_country = 6 and
p.id_tax_rules_group = tr.id_tax_rules_group and
x.rate is not null
order by x.rate desc limit 1, 1), 0) rate,
(case
when (p.date_upd < p.date_add) then p.date_add
else p.date_upd
end) as date_upd
from ps_product_attribute_combination ac
join ps_product_attribute pa on (ac.id_product_attribute = pa.id_product_attribute)
join ps_product p on (p.id_product = pa.id_product)
join ps_product_lang l on (p.id_product = l.id_product)
left join ps_attribute_lang al on (ac.id_attribute = al.id_attribute)
left join ps_attribute a on (a.id_attribute = ac.id_attribute)
left join ps_attribute_group ag on (ag.id_attribute_group = a.id_attribute_group)
/**/
left join ps_imax_general_equi_products ep on p.id_product = ep.idProductoPrestashop
left join ps_imax_general_equi_attribute ea on a.id_attribute = ea.idAttributePrestashop
/**/
where
p.active = 1 and
l.id_lang = 1 and
al.id_lang = 1 and
p.id_product >= 0 and
p.id_product <= 999999
and (p.date_upd > "2018-06-01" or ((p.date_add > "2018-06-01")  and (p.date_upd is null)))
group by p.id_product, ac.id_product_attribute)
order by id_product, id_attribute
}

  sDesdeFecha := FormatDateTime('yyyy"-"mm"-"dd', DesdeFecha);
  sHastaFecha := FormatDateTime('yyyy"-"mm"-"dd', HastaFecha);
  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           Connection := MYSQLConnection;
           if (Active) then
              Close;
           SQL.Clear;

           if (Tipo = 1) then
           begin
              SQL.Add(' (select ');
              SQL.Add('         p.id_product, cast("" as char) id_attribute, 0 id_product_attribute, p.reference, p.ean13, p.upc, l.name name, p.id_supplier, p.id_manufacturer, ');
              SQL.Add('         p.quantity, p.price, p.weight, ');
              SQL.Add('         coalesce((select x.rate ');
              SQL.Add('         from ps_tax_rule tr ');
              SQL.Add('         left join ps_tax x on (tr.id_tax = x.id_tax) ');
              SQL.Add('         where ');
              SQL.Add('         tr.id_country = ' + IntToStr(id_country) + ' and ');
              SQL.Add('         p.id_tax_rules_group = tr.id_tax_rules_group and ');
              SQL.Add('         x.rate is not null ');
              SQL.Add('         order by x.rate desc limit 1, 1), 0) rate, ');
              SQL.Add('         (case ');
              SQL.Add('           when (p.date_upd < p.date_add) then p.date_add ');
              SQL.Add('           else p.date_upd ');
              SQL.Add('         end) as date_upd ');

              if Equivalencia then
                 SQL.Add('         ,cast(coalesce(ep.idProducto, "0") as integer) id_product_equi, cast("" as char) id_attribute_equi ');
              {
              else
                 SQL.Add('         ,cast(0 as integer) id_product_equi, cast("" as char) id_attribute_equi ');
              }

              SQL.Add(' from ps_product p ');
              SQL.Add(' join ps_product_lang l on (p.id_product = l.id_product) ');
              SQL.Add(' left join ps_product_attribute pa on (p.id_product = pa.id_product) ');
              if Equivalencia then
                 SQL.Add(' left join ps_imax_general_equi_products ep on p.id_product = ep.idProductoPrestashop ');
              SQL.Add(' where ');
              SQL.Add(' p.active = 1 and ');
              SQL.Add(' l.id_lang = ' + IntToStr(id_lang) + ' and ');
              SQL.Add(' p.id_product >= ' + IntToStr(Desde) + ' and ');
              SQL.Add(' p.id_product <= ' + IntToStr(Hasta) + ' and ');
              SQL.Add(' pa.id_product_attribute is null ');
              SQL.Add(' and (p.date_upd > "' + sDesdeFecha + '" or ((p.date_add > "' + sDesdeFecha + '")  and (p.date_upd is null))) ');
              SQL.Add(' ) ');
           end;
           {
           SQL.Add(' union ');
           }
           if (Tipo = 2) then
           begin
              SQL.Add(' (select ');
              SQL.Add('         p.id_product, ac.id_product_attribute, pa.reference, pa.ean13, pa.upc, ');
              SQL.Add('         concat(l.name, " ", group_concat(al.name order by ag.position)) name, p.id_supplier, p.id_manufacturer, ');
              SQL.Add('         pa.quantity, p.price, p.weight, ');
              SQL.Add('         coalesce((select x.rate ');
              SQL.Add('         from ps_tax_rule tr ');
              SQL.Add('         left join ps_tax x on (tr.id_tax = x.id_tax) ');
              SQL.Add('         where ');
              SQL.Add('         tr.id_country = ' + IntToStr(id_country) + ' and ');
              SQL.Add('         p.id_tax_rules_group = tr.id_tax_rules_group and ');
              SQL.Add('         x.rate is not null ');
              SQL.Add('         order by x.rate desc limit 1, 1), 0) rate, ');
              SQL.Add('         (case ');
              SQL.Add('           when (p.date_upd < p.date_add) then p.date_add ');
              SQL.Add('           else p.date_upd ');
              SQL.Add('         end) as date_upd ');

              SQL.Add('         ,substring(group_concat(ac.id_attribute order by ac.id_attribute) from 1 for 25) id_attribute ');

              if Equivalencia then
                 SQL.Add('         ,cast(coalesce(min(ep.idProducto), "0") as integer) id_product_equi, coalesce(group_concat(ea.idAttribute order by ea.idAttribute), "") id_attribute_equi ');
              {
              else
                 SQL.Add('         ,cast(0 as integer) id_product_equi, cast("" as char) id_attribute_equi ');
              }

              SQL.Add(' from ps_product_attribute_combination ac ');
              SQL.Add(' join ps_product_attribute pa on (ac.id_product_attribute = pa.id_product_attribute) ');
              SQL.Add(' join ps_product p on (p.id_product = pa.id_product) ');
              SQL.Add(' join ps_product_lang l on (p.id_product = l.id_product) ');
              SQL.Add(' left join ps_attribute_lang al on (ac.id_attribute = al.id_attribute) ');
              SQL.Add(' left join ps_attribute a on (a.id_attribute = ac.id_attribute) ');
              SQL.Add(' left join ps_attribute_group ag on (ag.id_attribute_group = a.id_attribute_group) ');
              if Equivalencia then
              begin
                 SQL.Add(' left join ps_imax_general_equi_products ep on p.id_product = ep.idProductoPrestashop ');
                 SQL.Add(' left join ps_imax_general_equi_attribute ea on a.id_attribute = ea.idAttributePrestashop ');
              end;
              SQL.Add(' where ');
              SQL.Add(' p.active = 1 and ');
              SQL.Add(' l.id_lang = ' + IntToStr(id_lang) + ' and ');
              SQL.Add(' al.id_lang = ' + IntToStr(id_lang) + ' and ');
              SQL.Add(' p.id_product >= ' + IntToStr(Desde) + ' and ');
              SQL.Add(' p.id_product <= ' + IntToStr(Hasta) + ' ');
              SQL.Add(' and (p.date_upd > "' + sDesdeFecha + '" or ((p.date_add > "' + sDesdeFecha + '")  and (p.date_upd is null))) ');
              SQL.Add(' group by p.id_product, ac.id_product_attribute) ');
           end;
           SQL.Add(' order by coalesce(date_upd, date_add), id_product, id_attribute ');
           DMMain.Log(SQL.Text);

           // PrepareStatement;

           {
           if (Tipo = 1) then
           begin
              Parameters.FindParam('id_lang1').Value := id_lang;
              Parameters.FindParam('desde1').Value := Desde;
              Parameters.FindParam('hasta1').Value := Hasta;
              Parameters.FindParam('id_country1').Value := id_country;
           end;
           }
           {
           if (Tipo = 2) then
           begin
              Parameters.FindParam('desde2').Value := Desde;
              Parameters.FindParam('hasta2').Value := Hasta;
              Parameters.FindParam('id_lang2').Value := id_lang;
              Parameters.FindParam('id_lang3').Value := id_lang;
              Parameters.FindParam('id_country2').Value := id_country;
           end;
           }

           {
           Parameters.FindParam('desdefecha1').Value := DesdeFecha;
           Parameters.FindParam('desdefecha2').Value := DesdeFecha;
           Parameters.FindParam('hastafecha1').Value := HastaFecha;
           Parameters.FindParam('hastafecha2').Value := HastaFecha;
           }
           DMMain.Log('BeforOpen');
           Open;
           DMMain.Log('AfterOpen');
        except
           on e: Exception do
           begin
              ShowMessage(_('Error al obtener Articulos de MySQL') + #13#10 + Format('Fechas: %s - %s', [sDesdeFecha, sDesdeFecha]) + #13#10 + e.Message);

              if Active then
              begin
                 for f := 0 to FieldCount - 1 do
                    DMMain.Log(Fields[f].FieldName + '=' + Fields[f].AsString + '.');
              end;
           end;
        end;
     end;
  end;
end;
*)
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
        SelectSQL.Add('SELECT ID_A, ARTICULO, UNIDADES FROM GES_TICKET_DETALLE ');
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
           ModificarStockTienda(FieldByName('ID_A').AsInteger, Factor * FieldByName('UNIDADES').AsFloat);
           Next;
        end;
        Close;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

(*
function TDMPrestashop.DameFechaServidorMySQL: TDateTime;
begin
  Result := 0;
  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add(' select current_timestamp() ');
           Open;
           if (not IsEmpty) then
              Result := Fields[0].AsDateTime;
           Close;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener la fecha del servidor MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
(*
procedure TDMPrestashop.FiltraClientes(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime; SoloClientesConPedidos: boolean = True);
var
  sDesdeFecha, sHastaFecha : string;
begin
{ SQL que se ejecutará

select c.id_customer, c.lastname, c.firstname, coalesce(c.company, '') company, c.email,
       (select a.dni
        from ps_address a
        where
        a.id_customer = c.id_customer
        order by id_address limit 1) dni,
       (select a.vat_number
       from ps_address a
       where a.id_customer = c.id_customer
       order by id_address limit 1) vat_number,
       c.deleted,
       (
       case
         when (c.date_upd < c.date_add) then c.date_add
         else c.date_upd
       end) as date_upd
from ps_customer c
where
c.id_customer >= 1 /*desde*/ and
c.id_customer <= 999999 /*hasta*/
/* if Desde <> Hasta */
   and c.deleted = 0
/* if SoloClientesConPedidos */
   and (exists(select o.id_order
        from ps_orders o
        where
        o.id_customer = c.id_customer))
}
  sDesdeFecha := FormatDateTime('yyyy"-"mm"-"dd', DesdeFecha);
  sHastaFecha := FormatDateTime('yyyy"-"mm"-"dd', HastaFecha);

  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           if (Active) then
              Close;
           Connection := MYSQLConnection;
           SQL.Clear;
           SQL.Add(' select c.id_customer, c.lastname, c.firstname, coalesce(c.company, '''') company, c.email, ');
           SQL.Add(' (select a.dni from ps_address a where a.id_customer = c.id_customer order by id_address limit 1) dni, ');
           SQL.Add(' (select a.vat_number from ps_address a where a.id_customer = c.id_customer order by id_address limit 1) vat_number, ');
           SQL.Add(' c.deleted, ');
           SQL.Add(' (case ');
           SQL.Add(' when (c.date_upd < c.date_add) ');
           SQL.Add(' then c.date_add ');
           SQL.Add(' else c.date_upd ');
           SQL.Add(' end) as date_upd ');
           SQL.Add(' from ps_customer c ');
           SQL.Add(' where c.id_customer >= ' + IntToStr(Desde) + ' and c.id_customer <= ' + IntToStr(Hasta) + ' ');
           if (Desde <> Hasta) then
              SQL.Add(' and c.deleted = 0');
           if (SoloClientesConPedidos) then
              SQL.Add(' and (exists(select o.id_order from ps_orders o where o.id_customer = c.id_customer)) ');
           SQL.Add(' and (c.date_upd > "' + sDesdeFecha + '" or ((c.date_add > "' + sDesdeFecha + '")  and (c.date_upd is null))) ');
           // SQL.Add(' and c.date_upd >= :desdefecha and c.date_upd < :hastafecha ');
           SQL.Add(' order by c.id_customer ');

           // PrepareStatement;
           {
           Parameters.FindParam('desde').Value := Desde;
           Parameters.FindParam('hasta').Value := Hasta;
           }
           {
           Parameters.FindParam('desdefecha').Value := DesdeFecha;
           Parameters.FindParam('hastafecha').Value := HastaFecha;
           }
           Open;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener Clientes de MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
(*
procedure TDMPrestashop.FiltraProveedores(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime);
begin
{SQL que se ejecutará

select s.id_supplier, s.name as firstname, '' as lastname, '' as company, '' as email,
       (select a.dni
        from ps_address a
        where
        a.id_supplier = s.id_supplier
        order by id_address limit 1) dni,
       (select a.vat_number
        from ps_address a
        where a.id_supplier = s.id_supplier
        order by id_address limit 1) vat_number,
       (
       case
         when (s.date_upd < s.date_add) then s.date_add
         else s.date_upd
       end) as date_upd
from ps_supplier s
where
s.id_supplier >= 1 /*desde*/ and
s.id_supplier <= 999999 /*hasta*/
and
s.active = 1
/* //  and s.date_upd >= :desdefecha and s.date_upd < :hastafecha */
order by s.id_supplier
}

  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           if (Active) then
              Close;
           Connection := MYSQLConnection;
           SQL.Clear;
           SQL.Add(' select s.id_supplier, s.name as firstname, '''' as lastname, '' as company, '''' as email, ');
           SQL.Add('        (select a.dni ');
           SQL.Add('         from ps_address a ');
           SQL.Add('         where ');
           SQL.Add('         a.id_supplier = s.id_supplier ');
           SQL.Add('         order by id_address limit 1) dni, ');
           SQL.Add('        (select a.vat_number ');
           SQL.Add('         from ps_address a ');
           SQL.Add('         where a.id_supplier = s.id_supplier ');
           SQL.Add('         order by id_address limit 1) vat_number, ');
           SQL.Add(' (case ');
           SQL.Add('    when (s.date_upd < s.date_add) ');
           SQL.Add('    then s.date_add ');
           SQL.Add('    else s.date_upd ');
           SQL.Add(' end) as date_upd ');
           SQL.Add(' from ps_supplier s ');
           SQL.Add(' where s.id_supplier >= :desde and s.id_supplier <= :hasta ');
           SQL.Add(' and s.active = 1 ');
           // SQL.Add(' and s.date_upd >= :desdefecha and s.date_upd < :hastafecha ');
           SQL.Add(' order by s.id_supplier ');

           // PrepareStatement;
           Parameters.FindParam('desde').Value := Desde;
           Parameters.FindParam('hasta').Value := Hasta;
           {
           Parameters.FindParam('desdefecha').Value := DesdeFecha;
           Parameters.FindParam('hastafecha').Value := HastaFecha;
           }
           Open;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener Proveedor de MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)

(*
procedure TDMPrestashop.FiltraDireccionesClientes(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime; SoloClientesConPedidos: boolean = True);
var
  sDesdeFecha, sHastaFecha : string;
begin
{SQL que se ejecutará

select a.id_address, a.id_customer, a.address1, coalesce(a.address2, '') address2,
a.postcode, a.city, c.iso_code, a.phone, a.phone_mobile, a.dni,
coalesce(a.company, '') company, a.lastname, a.firstname,
(case
when (a.date_upd < a.date_add)
then a.date_add
else a.date_upd
end) as date_upd
from ps_address a
join ps_country c
on (a.id_country = c.id_country)
where a.id_address >= 0 and a.id_address <= 99999
and a.id_customer > 0
}

  sDesdeFecha := FormatDateTime('yyyy"-"mm"-"dd', DesdeFecha);
  sHastaFecha := FormatDateTime('yyyy"-"mm"-"dd', HastaFecha);

  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           if (Active) then
              Close;
           Connection := MYSQLConnection;
           SQL.Clear;
           SQL.Add(' select a.id_address, a.id_customer, a.address1, coalesce(a.address2, '''') address2, ');
           SQL.Add(' a.postcode, a.city, c.iso_code, a.phone, a.phone_mobile, a.dni, ');
           SQL.Add(' coalesce(a.company, '''') company, a.lastname, a.firstname, ');
           SQL.Add(' (case ');
           SQL.Add(' when (a.date_upd < a.date_add) ');
           SQL.Add(' then a.date_add ');
           SQL.Add(' else a.date_upd ');
           SQL.Add(' end) as date_upd ');
           SQL.Add(' from ps_address a ');
           SQL.Add(' join ps_country c ');
           SQL.Add(' on (a.id_country = c.id_country) ');
           SQL.Add(' where a.id_address >= ' + IntToStr(Desde) + ' and a.id_address <= ' + IntToStr(Hasta) + ' ');
           SQL.Add(' and a.id_customer > 0 ');
           if (SoloClientesConPedidos) then
              SQL.Add(' and (exists(select o.id_order from ps_orders o where o.id_customer = a.id_customer)) ');
           SQL.Add(' and (a.date_upd > "' + sDesdeFecha + '" or ((a.date_add > "' + sDesdeFecha + '")  and (a.date_upd is null))) ');
           // SQL.Add(' and a.date_upd >= :desdefecha and a.date_upd < :hastafecha ');
           SQL.Add(' order by a.id_address ');

           // PrepareStatement;
           {
           Parameters.FindParam('desde').Value := Desde;
           Parameters.FindParam('hasta').Value := Hasta;
           }
           {
           Parameters.FindParam('desdefecha').Value := DesdeFecha;
           Parameters.FindParam('hastafecha').Value := HastaFecha;
           }
           Open;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener Direcciones de Clientes de MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
(*
procedure TDMPrestashop.FiltraDireccionesProveedores(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime);
begin
{SQL que se ejecutará

select a.id_address, a.id_supplier, a.address1, coalesce(a.address2, '') address2,
a.postcode, c.iso_code, a.city, a.phone, a.phone_mobile, a.dni,
coalesce(a.company, '') company, a.lastname, a.firstname,
(case
when (a.date_upd < a.date_add)
then a.date_add
else a.date_upd
end) as date_upd
from ps_address a
join ps_country c
on (a.id_country = c.id_country)
where a.id_address >= 0 and a.id_address <= 999999
and a.id_supplier > 0
/* and a.date_upd >= :desdefecha and a.date_upd < :hastafecha */
order by a.id_address
}

  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           if (Active) then
              Close;
           Connection := MYSQLConnection;
           SQL.Clear;
           SQL.Add(' select a.id_address, a.id_supplier, a.address1, coalesce(a.address2, '''') address2, ');
           SQL.Add(' a.postcode, c.iso_code, a.city, a.phone, a.phone_mobile, a.dni, ');
           SQL.Add(' coalesce(a.company, '''') company, a.lastname, a.firstname, ');
           SQL.Add(' (case ');
           SQL.Add(' when (a.date_upd < a.date_add) ');
           SQL.Add(' then a.date_add ');
           SQL.Add(' else a.date_upd ');
           SQL.Add(' end) as date_upd ');
           SQL.Add(' from ps_address a ');
           SQL.Add(' join ps_country c ');
           SQL.Add(' on (a.id_country = c.id_country) ');
           SQL.Add(' where a.id_address >= :desde and a.id_address <= :hasta ');
           SQL.Add(' and a.id_supplier > 0 ');
           // SQL.Add(' and a.date_upd >= :desdefecha and a.date_upd < :hastafecha ');
           SQL.Add(' order by a.id_address ');

           // PrepareStatement;
           Parameters.FindParam('desde').Value := Desde;
           Parameters.FindParam('hasta').Value := Hasta;
           {
           Parameters.FindParam('desdefecha').Value := DesdeFecha;
           Parameters.FindParam('hastafecha').Value := HastaFecha;
           }
           Open;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener Direcciones de Proveedores de MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
(*
procedure TDMPrestashop.FiltraOrdenes(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime; ModuloPaypal: boolean);
var
  sDesdeFecha, sHastaFecha : string;
begin
{SQL que se ejecutará

(select d.id_order, d.id_order_detail, o.total_paid_real, o.id_customer, o.id_address_invoice, o.id_address_delivery,
       d.product_id id_product, group_concat(ac.id_attribute order by ac.id_attribute) id_attribute,
       ac.id_product_attribute, d.product_quantity, d.unit_price_tax_excl /*product_price*/, ta.rate tax_rate,
       o.date_add, o.reference, o.total_shipping_tax_excl, o.total_shipping_tax_incl, o.current_state,
       /*if ModuloPaypal*/
          coalesce(p.id_transaction, ' ') paypal_id_transaction, coalesce(p.total_paid, '0.0') paypal_total_paid,
          /*if Version < 1.7*/
             coalesce(p.shipping, '0.0') paypal_shipping, coalesce(p.currency, ' ') paypal_currency,
          /*else*/
             coalesce(p.total_prestashop, '0.0') paypal_shipping, coalesce(p.currency, ' ') paypal_currency,
       /*else
          ' ' paypal_id_transaction, '0.0' paypal_total_paid,
          '0.0' paypal_shipping, ' ' paypal_currency,
       end*/
       (case
          when (o.date_upd < o.date_add) then o.date_add
          else o.date_upd
        end) as date_upd
from ps_orders o
join ps_order_detail d on (o.id_order = d.id_order)
join ps_product_attribute_combination ac on (d.product_attribute_id = ac.id_product_attribute)
join ps_order_state s on (o.current_state = s.id_order_state)
join ps_order_detail_tax t on (t.id_order_detail = d.id_order_detail)
/*LEFT*/ join ps_tax ta on (ta.id_tax = t.id_tax)
left join ps_attribute a on (a.id_attribute = ac.id_attribute)
left join ps_attribute_group ag on (ag.id_attribute_group = a.id_attribute_group)
/*if ModuloPaypal*/
left join ps_paypal_order p on (o.id_order = p.id_order)
/*end*/
where
d.product_attribute_id <> 0 and
/*s.invoice = 1 and*/
o.id_order >= 0 and
o.id_order <= 999999
and o.date_upd > "2016-06-16" or ((o.date_add > "2016-06-16") and (o.date_upd is null))
group by d.id_order, d.id_order_detail
)
union
(select d.id_order, d.id_order_detail, o.total_paid_real, o.id_customer, o.id_address_invoice, o.id_address_delivery,
       d.product_id id_product, "" id_attribute, 0 id_product_attribute, d.product_quantity,
       d.unit_price_tax_excl /*product_price*/ , ta.rate tax_rate, o.date_add, o.reference, o.total_shipping_tax_excl,
       o.total_shipping_tax_incl, o.current_state,
       /*if ModuloPaypal*/
          coalesce(p.id_transaction, ' ') paypal_id_transaction, coalesce(p.total_paid, '0.0') paypal_total_paid,
          /*if Version < 1.7*/
             coalesce(p.shipping, '0.0') paypal_shipping, coalesce(p.currency, ' ') paypal_currency,
          /*else*/
             coalesce(p.total_prestashop, '0.0') paypal_shipping, coalesce(p.currency, ' ') paypal_currency,
       /*else
          ' ' paypal_id_transaction, '0.0' paypal_total_paid,
          '0.0' paypal_shipping, ' ' paypal_currency,
       end*/
       (
       case
         when (o.date_upd < o.date_add) then o.date_add
         else o.date_upd
       end) as date_upd
from ps_orders o
join ps_order_detail d on (o.id_order = d.id_order)
join ps_order_state s on (o.current_state = s.id_order_state)
join ps_order_detail_tax t on (t.id_order_detail = d.id_order_detail)
/*LEFT*/ join ps_tax ta on (ta.id_tax = t.id_tax)
/*if ModuloPaypal*/
left join ps_paypal_order p on (o.id_order = p.id_order)
/*end*/
where
d.product_attribute_id = 0 and
/*s.invoice = 1 and*/
o.id_order >= 0 and
o.id_order <= 999999
and o.date_upd > "2016-06-16" or ((o.date_add > "2016-06-16") and (o.date_upd is null))
)
order by 1, 2
}

  sDesdeFecha := FormatDateTime('yyyy"-"mm"-"dd', DesdeFecha);
  sHastaFecha := FormatDateTime('yyyy"-"mm"-"dd', HastaFecha);
  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           if (Active) then
              Close;
           Connection := MYSQLConnection;
           SQL.Clear;
           SQL.Add(' (select d.id_order, d.id_order_detail, o.total_paid_real, o.id_customer, o.id_address_invoice, o.id_address_delivery, ');
           SQL.Add('        d.product_id id_product, group_concat(ac.id_attribute order by ac.id_attribute) id_attribute, ');
           SQL.Add('        ac.id_product_attribute, d.product_quantity, d.unit_price_tax_excl /*product_price*/, ta.rate tax_rate, ');
           SQL.Add('        o.date_add, o.reference, o.total_shipping_tax_excl, o.total_shipping_tax_incl, o.current_state, ');
           if (ModuloPaypal) then
           begin
              SQL.Add('        coalesce(p.id_transaction, '' '') paypal_id_transaction, coalesce(p.total_paid, ''0.0'') paypal_total_paid, ');
              if VersionPrestashop < '1.7' then
                 SQL.Add('        coalesce(p.shipping, ''0.0'') paypal_shipping, coalesce(p.currency, '' '') paypal_currency, ')
              else
                 SQL.Add('        coalesce(p.total_prestashop, ''0.0'') paypal_shipping, coalesce(p.currency, '' '') paypal_currency, ');
           end
           else
           begin
              SQL.Add('        '' '' paypal_id_transaction, ''0.0'' paypal_total_paid, ');
              SQL.Add('        ''0.0'' paypal_shipping, '' '' paypal_currency, ');
           end;
           SQL.Add('        (case ');
           SQL.Add('           when (o.date_upd < o.date_add) then o.date_add ');
           SQL.Add('           else o.date_upd ');
           SQL.Add('         end) as date_upd ');
           SQL.Add(' from ps_orders o ');
           SQL.Add(' join ps_order_detail d on (o.id_order = d.id_order) ');
           SQL.Add(' join ps_product_attribute_combination ac on (d.product_attribute_id = ac.id_product_attribute) ');
           SQL.Add(' join ps_order_state s on (o.current_state = s.id_order_state) ');
           SQL.Add(' join ps_order_detail_tax t on (t.id_order_detail = d.id_order_detail) ');
           SQL.Add(' left join ps_tax ta on (ta.id_tax = t.id_tax) ');
           SQL.Add(' left join ps_attribute a on (a.id_attribute = ac.id_attribute) ');
           SQL.Add(' left join ps_attribute_group ag on (ag.id_attribute_group = a.id_attribute_group) ');
           if (ModuloPaypal) then
           begin
              SQL.Add(' left join ps_paypal_order p on (o.id_order = p.id_order) ');
           end;
           SQL.Add(' where ');
           SQL.Add(' d.product_attribute_id <> 0 and ');
           SQL.Add(' /*s.invoice = 1 and*/ ');
           SQL.Add(' o.id_order >= ' + IntToStr(Desde) + ' and ');
           SQL.Add(' o.id_order <= ' + IntToStr(Hasta) + ' ');
           SQL.Add(' and o.date_upd > "' + sDesdeFecha + '" or ((o.date_add > "' + sDesdeFecha + '") and (o.date_upd is null)) ');
           SQL.Add(' group by d.id_order, d.id_order_detail ');
           SQL.Add(' ) ');
           SQL.Add(' union ');
           SQL.Add(' (select d.id_order, d.id_order_detail, o.total_paid_real, o.id_customer, o.id_address_invoice, o.id_address_delivery, ');
           SQL.Add('        d.product_id id_product, "" id_attribute, 0 id_product_attribute, d.product_quantity, ');
           SQL.Add('        d.unit_price_tax_excl /*product_price*/ , ta.rate tax_rate, o.date_add, o.reference, o.total_shipping_tax_excl, ');
           SQL.Add('        o.total_shipping_tax_incl, o.current_state, ');
           if (ModuloPaypal) then
           begin
              SQL.Add('        coalesce(p.id_transaction, '' '') paypal_id_transaction, coalesce(p.total_paid, ''0.0'') paypal_total_paid, ');
              if VersionPrestashop < '1.7' then
                 SQL.Add('        coalesce(p.shipping, ''0.0'') paypal_shipping, coalesce(p.currency, '' '') paypal_currency, ')
              else
                 SQL.Add('        coalesce(p.total_prestashop, ''0.0'') paypal_shipping, coalesce(p.currency, '' '') paypal_currency, ');
           end
           else
           begin
              SQL.Add('        '' '' paypal_id_transaction, ''0.0'' paypal_total_paid, ');
              SQL.Add('        ''0.0'' paypal_shipping, '' '' paypal_currency, ');
           end;
           SQL.Add('        (case ');
           SQL.Add('          when (o.date_upd < o.date_add) then o.date_add ');
           SQL.Add('          else o.date_upd ');
           SQL.Add('        end) as date_upd ');
           SQL.Add(' from ps_orders o ');
           SQL.Add(' join ps_order_detail d on (o.id_order = d.id_order) ');
           SQL.Add(' join ps_order_state s on (o.current_state = s.id_order_state) ');
           SQL.Add(' join ps_order_detail_tax t on (t.id_order_detail = d.id_order_detail) ');
           SQL.Add(' left join ps_tax ta on (ta.id_tax = t.id_tax) ');
           if (ModuloPaypal) then
           begin
              SQL.Add(' left join ps_paypal_order p on (o.id_order = p.id_order) ');
           end;
           SQL.Add(' where ');
           SQL.Add(' d.product_attribute_id = 0 and ');
           SQL.Add(' /*s.invoice = 1 and*/ ');
           SQL.Add(' o.id_order >= ' + IntToStr(Desde) + ' and ');
           SQL.Add(' o.id_order <= ' + IntToStr(Hasta) + ' ');
           SQL.Add(' and o.date_upd > "' + sDesdeFecha + '" or ((o.date_add > "' + sDesdeFecha + '") and (o.date_upd is null)) ');
           SQL.Add(' ) ');
           SQL.Add(' order by 1, 2 ');

           //PrepareStatement;
           {
           Parameters.FindParam('desde1').Value := Desde;
           Parameters.FindParam('hasta1').Value := Hasta;
           Parameters.FindParam('desde2').Value := Desde;
           Parameters.FindParam('hasta2').Value := Hasta;
           }
           Open;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener Pedidos de MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
(*
procedure TDMPrestashop.SetDSN(aDSN, aVersionPrestashop: string);
begin
  if (DSN <> aDSN) then
  begin
     DSN := aDSN;
     VersionPrestashop := aVersionPrestashop;
     MYSQLConnection.Connected := False;
     MYSQLConnection.ConnectionString := '';
  end;
end;
*)
(*
procedure TDMPrestashop.FiltraCodProvArticulos(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime);
begin
{SQL que se ejecutará

(select
s.id_supplier, s.id_product, 0 id_product_attribute, "" as id_attribute, s.product_supplier_reference, s.product_supplier_price_te, s.id_currency
from ps_product_supplier s
join ps_product p on s.id_product = p.id_product 
left join ps_product_attribute pa on (p.id_product = pa.id_product) 
where 
s.id_product >= 0 and 
s.id_product <= 999999 and 
pa.id_product_attribute is null 
) 
union 
(select 
s.id_supplier, s.id_product, s.id_product_attribute, group_concat(ac.id_attribute order by ac.id_attribute) id_attribute, 
s.product_supplier_reference, s.product_supplier_price_te, s.id_currency 
from ps_product_supplier s 
join ps_product_attribute pa 
on (s.id_product_attribute = pa.id_product_attribute) 
join ps_product_attribute_combination ac 
on (ac.id_product_attribute = s.id_product_attribute) 
left join ps_attribute a on (a.id_attribute = ac.id_attribute)
left join ps_attribute_group ag on (ag.id_attribute_group = a.id_attribute_group)
where 
s.id_product >= 0 and 
s.id_product <= 999999
group by s.id_product, s.id_product_attribute
) 
order by 1,2,3
}

  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           if (Active) then
              Close;
           Connection := MYSQLConnection;
           SQL.Clear;
           SQL.Add(' (select ');
           SQL.Add(' s.id_supplier, s.id_product, 0 id_product_attribute, "" as id_attribute, s.product_supplier_reference, s.product_supplier_price_te, s.id_currency ');
           SQL.Add(' from ps_product_supplier s ');
           SQL.Add(' join ps_product p on s.id_product = p.id_product ');
           SQL.Add(' left join ps_product_attribute pa on (p.id_product = pa.id_product) ');
           SQL.Add(' where ');
           SQL.Add(' s.id_product >= :desde1 and ');
           SQL.Add(' s.id_product <= :hasta1 and ');
           SQL.Add(' pa.id_product_attribute is null ');
           SQL.Add(' ) ');
           SQL.Add(' union ');
           SQL.Add(' (select ');
           SQL.Add(' s.id_supplier, s.id_product, s.id_product_attribute, group_concat(ac.id_attribute order by ac.id_attribute) id_attribute, ');
           SQL.Add(' s.product_supplier_reference, s.product_supplier_price_te, s.id_currency ');
           SQL.Add(' from ps_product_supplier s ');
           SQL.Add(' join ps_product_attribute pa ');
           SQL.Add(' on (s.id_product_attribute = pa.id_product_attribute) ');
           SQL.Add(' join ps_product_attribute_combination ac ');
           SQL.Add(' on (ac.id_product_attribute = s.id_product_attribute) ');
           SQL.Add(' left join ps_attribute a on (a.id_attribute = ac.id_attribute) ');
           SQL.Add(' left join ps_attribute_group ag on (ag.id_attribute_group = a.id_attribute_group) ');
           SQL.Add(' where ');
           SQL.Add(' s.id_product >= :desde2 and ');
           SQL.Add(' s.id_product <= :hasta2 ');
           SQL.Add(' group by s.id_product, s.id_product_attribute ');
           SQL.Add(' ) ');
           SQL.Add(' order by 1,2,3 ');

           // PrepareStatement;
           Parameters.FindParam('desde1').Value := Desde;
           Parameters.FindParam('hasta1').Value := Hasta;
           Parameters.FindParam('desde2').Value := Desde;
           Parameters.FindParam('hasta2').Value := Hasta;
           {
           Parameters.FindParam('desdefecha1').Value := DesdeFecha;
           Parameters.FindParam('desdefecha2').Value := DesdeFecha;
           Parameters.FindParam('hastafecha1').Value := HastaFecha;
           Parameters.FindParam('hastafecha2').Value := HastaFecha;
           }
           Open;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener Cod. Proveedor de MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
(*
procedure TDMPrestashop.FiltraFabricantes(Desde, Hasta: integer; DesdeFecha, HastaFecha: TDateTime);
var
  sDesdeFecha, sHastaFecha : string;
begin
  // En la ficha del artículo lo espera como un tercero.

  (* SQL que se ejecutará

select
m.id_manufacturer, "" as lastname, "" as firstname, coalesce(m.name, "") company, "" as email,
       (select a.dni
        from ps_address a
        where
        a.id_manufacturer = m.id_manufacturer
        order by id_address limit 1) dni, 0 as deleted,
       (
       case
         when (m.date_upd < m.date_add) then m.date_add
         else m.date_upd
       end) as date_upd
from ps_manufacturer m
join ps_manufacturer_lang ml
on m.id_manufacturer = ml.id_manufacturer
left join ps_address a
on m.id_manufacturer = a.id_manufacturer
where
ml.id_lang = 1 and
m.id_manufacturer >= 1 /*desde*/ and
m.id_manufacturer <= 999999 /*hasta*/
and
m.active = 1
and (m.date_add > "2000-01-01" or ((m.date_upd > "2000-01-01")  or (m.date_upd is null)))
order by m.id_manufacturer
}

  sDesdeFecha := FormatDateTime('yyyy"-"mm"-"dd', DesdeFecha);
  sHastaFecha := FormatDateTime('yyyy"-"mm"-"dd', HastaFecha);

  EstableceConexionMySQL;

  if (MYSQLConnection.Connected) then
  begin
     with QMySQL do
     begin
        try
           if (Active) then
              Close;
           Connection := MYSQLConnection;
           SQL.Clear;
           SQL.Add(' select m.id_manufacturer, "" as lastname, "" as firstname, coalesce(m.name, "") company, "" as email, ');
           SQL.Add('        (select a.dni ');
           SQL.Add('         from ps_address a ');
           SQL.Add('         where ');
           SQL.Add('         a.id_manufacturer = m.id_manufacturer ');
           SQL.Add('         order by id_address limit 1) dni, 0 as deleted, ');
           SQL.Add('        ( ');
           SQL.Add('        case ');
           SQL.Add('          when (m.date_upd < m.date_add) then m.date_add ');
           SQL.Add('          else m.date_upd ');
           SQL.Add('        end) as date_upd ');
           SQL.Add(' from ps_manufacturer m ');
           SQL.Add(' join ps_manufacturer_lang ml ');
           SQL.Add(' on m.id_manufacturer = ml.id_manufacturer ');
           SQL.Add(' left join ps_address a ');
           SQL.Add(' on m.id_manufacturer = a.id_manufacturer ');
           SQL.Add(' where ');
           SQL.Add(' ml.id_lang = ' + IntToStr(id_lang) + ' and ');
           SQL.Add(' m.id_manufacturer >= ' + IntToStr(Desde) + ' and ');
           SQL.Add(' m.id_manufacturer <= ' + IntToStr(Hasta) + ' ');
           SQL.Add(' and m.active = 1 ');
           SQL.Add(' and (m.date_add > "' + sDesdeFecha + '" or ((m.date_upd > "' + sDesdeFecha + '")  or (m.date_upd is null))) ');
           SQL.Add(' order by m.id_manufacturer ');

           // PrepareStatement;
           {
           Parameters.FindParam('id_lang').Value := id_lang;
           Parameters.FindParam('desde').Value := Desde;
           Parameters.FindParam('hasta').Value := Hasta;
           }
           {
           Parameters.FindParam('desdefecha').Value := DesdeFecha;
           Parameters.FindParam('hastafecha').Value := HastaFecha;
           }
           Open;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener Fabricante de MySQL') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
function TDMPrestashop.WS_DoPost(Metodo, Resource: string; id: integer; Opciones: string; Contenido, Respuesta: TStrings): integer;
var
  aURL : string;

  HttpConnectionWinInet : THttpConnectionWinInet;
  AContent, AResponse : TStream;
begin
  // Construyo la URL
  if WSSecureProtocol then
     aURL := 'https://'
  else
     aURL := 'http://';

  aURL := aURL + WSURL + '/api/' + Resource;
  if (id <> 0) then
     aURL := aURL + '/' + IntToStr(id);

  // Asigno Token para validadar la conexion
  aURL := aURL + '?ws_key=' + WSKey;

  if (IdShop <> 0) then
     aURL := aURL + '&id_shop=' + IntToStr(IdShop);

  if (IdGroupShop <> 0) then
     aURL := aURL + '&id_group_shop=' + IntToStr(IdGroupShop);

  if (Opciones > '') then
     aURL := aURL + Opciones;

  // Transmision
  HttpConnectionWinInet := THttpConnectionWinInet.Create;
  AContent := TStringStream.Create('');
  AResponse := TStringStream.Create('');
  try
     DMMain.LogIni('WebService');
     try
        DMMain.Log('Metodo: ' + Metodo);
        DMMain.Log('URL: ' + aURL);
        if Assigned(Contenido) then
           DMMain.Log('Content: ' + Contenido.Text);

        if Assigned(Contenido) then
           Contenido.SaveToStream(AContent);

        with HttpConnectionWinInet do
        begin
           BasicAuthentication_UserName := WSKey;
           BasicAuthentication_Password := '';

           // Headers.Add('Username='+Token);
           // Headers.Add('Authorization='+Token);
           // Headers.Add('ws_key='+Token);
           Headers.Add('Accept=*/*');
           Headers.Add('Content-Type=application/x-www-form-urlencoded');
           if Assigned(Contenido) then
              Headers.Add('ContentLength=' + IntToStr(Length(Contenido.Text)));

           // AcceptCharSet := 'ISO-8859-1, *;q=0.8';
           // ContentType := 'application/x-www-form-urlencoded';

           if (Metodo = 'POST') then
              Post(aURL, AContent, AResponse);
           if (Metodo = 'GET') then
              Get(aURL, AResponse);
           if (Metodo = 'PUT') then
              Put(aURL, AContent, AResponse);
           if (Metodo = 'DELETE') then
              Delete(aURL, AContent, AResponse);

           Result := GetResponseCode;
        end;

        if Assigned(Respuesta) then
        begin
           AResponse.Position := 0;
           Respuesta.LoadFromStream(AResponse);
        end;
        DMMain.Log('ResponseCode: ' + IntToStr(Result));
     finally
        DMMain.LogFin('');
     end;

     {$IFDEF Debug}
     if Assigned(FMPruebas) then
     begin
       FMPruebas.Log('------------------------------------------------------------');
       FMPruebas.Log('Metodo: ' + Metodo);
       FMPruebas.Log('Resource: ' + Resource);
       FMPruebas.Log('id: ' + IntToStr(id));
       FMPruebas.Log('Opciones: ' + Opciones);
       FMPruebas.Log('URL: ' + aURL);
       if Assigned(Contenido) then
          FMPruebas.Log('Contenido: ' + Contenido.Text);
       FMPruebas.Log('ResponseCode: ' + IntToStr(Result));
       FMPruebas.Log(Respuesta.Text);
     end;
     {$ENDIF}
  finally
     HttpConnectionWinInet.Free;
     AContent.Free;
     AResponse.Free;
  end;
end;

function TDMPrestashop.WS_Inicializa(aURL, aKey, aVersion: string; aDebug: boolean): boolean;
begin
  // Quito protocolo delante de la direccion
  WSSecureProtocol := False;
  if (Pos('https://', aURL) > 0) then
  begin
     WSURL := Copy(aURL, 9, Length(aURL));
     WSSecureProtocol := True;
  end
  else
  if (Pos('http://', aURL) > 0) then
     WSURL := Copy(aURL, 8, Length(aURL))
  else
     WSURL := aURL;

  WSKey := aKey;
  if (Trim(aVersion) = '') then
     WSVersion := WS_DameVersion
  else
     WSVersion := aVersion;
  WSDebug := aDebug;

  IdShop := 0;
  IdGroupShop := 0;

  // Inicializacion correcta si se puede realizar conexión y obtener recursos habilitados
  try
     Result := (WS_GetResources = 200);

     // Id del pais de la empresa.
     if Result then
        id_country := WS_GetIdCountry(DamePaisC2(REntorno.Pais));

     // Id del root category.
     if Result then
        id_root_category := WS_GetIdRootCategory;

     WS_GetTaxRuleGroups;
  except
     Result := False;
  end;
end;

procedure TDMPrestashop.WS_SetShop(aIdShop, aIdGroupShop: integer);
begin
  IdShop := aIdShop;
  IdGroupShop := aIdGroupShop;
end;

function TDMPrestashop.WS_Add(Resource: string; xml, Respuesta: TStrings): integer;
begin
  /// Crea recurso xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('POST', Resource, 0, '', xml, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMPrestashop.WS_Get(Resource: string; id: integer; Opciones: string; Respuesta: TStrings): integer;
begin
  /// Obtiene recurso y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP
  /// Opciones : filter, display, sort, limit

  Result := WS_DoPost('GET', Resource, id, Opciones, nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMPrestashop.WS_Edit(Resource: string; id: integer; xml, Respuesta: TStrings): integer;
begin
  /// Modifica recurso de xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('PUT', Resource, id, '', xml, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMPrestashop.WS_Delete(Resource: string; id: integer; Respuesta: TStrings): integer;
begin
  /// Borra recurso con id y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('DELETE', Resource, id, '', nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

procedure TDMPrestashop.ClearCData(aXML: TStrings);
var
  {
  i, c : integer;
  Documento : TXMLDocument;
  DentroCDATA : boolean;
  }
  pi, pf : integer;
  x, s, r : string;
begin
  x := aXML.Text;
  r := '';

  pi := Pos('<![CDATA[', x);
  pf := Pos(']]>', x);
  while ((pi > 0) and (pf > 0)) do
  begin
     // Lo que está dentro de CDATA
     s := Copy(x, pi + 9, pf - pi - 9);

     // Limpio caracteres no validos dentro de un XML
     s := StringReplace(s, '&', '&amp;', [rfReplaceAll]);
     s := StringReplace(s, '<', '&lt;', [rfReplaceAll]);
     s := StringReplace(s, '>', '&gt;', [rfReplaceAll]);

     // Acumulo respuesta
     r := r + Copy(x, 1, pi - 1) + s;

     // Tomo el resto para seguir verificando
     x := Copy(x, pf + 3, Length(x));

     pi := Pos('<![CDATA[', x);
     pf := Pos(']]>', x);
  end;

  aXML.Text := r + x;
  (*
  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        // Doy formato al XML para facilitar el recorrido posterior.
        // XML.Text := FormatXMLData(aXML.Text);
        XML.Text := aXML.Text;

        pi := Pos('<![CDATA[', XML.Text);
        pf := Pos(']]>', XML.Text);
        while ((pi > 0) and (pf > 0)) do
        begin
          s := copy(XML.Text , pi+9, pf-pi-9);

             s := StringReplace(s, '&amp;', '&', [rfReplaceAll]);
             s := StringReplace(s, '&quot;', '"', [rfReplaceAll]);
             s := StringReplace(s, '&lt;', '<', [rfReplaceAll]);
             s := StringReplace(s, '&gt;', '>', [rfReplaceAll]);
             s := StringReplace(s, '&apos;', '''', [rfReplaceAll]);

             s := StringReplace(s, '&aacute;', 'á', [rfReplaceAll]);
             s := StringReplace(s, '&eacute;', 'é', [rfReplaceAll]);
             s := StringReplace(s, '&iacute;', 'í', [rfReplaceAll]);
             s := StringReplace(s, '&oacute;', 'ó', [rfReplaceAll]);
             s := StringReplace(s, '&uacute;', 'ú', [rfReplaceAll]);
             s := StringReplace(s, '&Aacute;', 'Á', [rfReplaceAll]);
             s := StringReplace(s, '&Eacute;', 'É', [rfReplaceAll]);
             s := StringReplace(s, '&Iacute;', 'Í', [rfReplaceAll]);
             s := StringReplace(s, '&Oacute;', 'Ó', [rfReplaceAll]);
             s := StringReplace(s, '&Uacute;', 'Ú', [rfReplaceAll]);
             s := StringReplace(s, '&agrave;', 'à', [rfReplaceAll]);
             s := StringReplace(s, '&egrave;', 'è', [rfReplaceAll]);
             s := StringReplace(s, '&igrave;', 'ì', [rfReplaceAll]);
             s := StringReplace(s, '&ograve;', 'ò', [rfReplaceAll]);
             s := StringReplace(s, '&ugrave;', 'ù', [rfReplaceAll]);
             s := StringReplace(s, '&Agrave;', 'À', [rfReplaceAll]);
             s := StringReplace(s, '&Egrave;', 'È', [rfReplaceAll]);
             s := StringReplace(s, '&Igrave;', 'Ì', [rfReplaceAll]);
             s := StringReplace(s, '&Ograve;', 'Ò', [rfReplaceAll]);
             s := StringReplace(s, '&Ugrave;', 'Ù', [rfReplaceAll]);
             s := StringReplace(s, '&iuml;', 'ï', [rfReplaceAll]);
             s := StringReplace(s, '&Iuml;', 'Ï', [rfReplaceAll]);
             s := StringReplace(s, '&ntilde;', 'ñ', [rfReplaceAll]);
             s := StringReplace(s, '&Ntilde;', 'Ñ', [rfReplaceAll]);

          XML.Text := copy(XML.Text, 1, pi-1) + s + copy(XML.Text, pf+3, Length(XML.Text));

          pi := Pos('<![CDATA[', XML.Text);
          pf := Pos(']]>', XML.Text);
        end;

        {
        // Recorro el texto
        i := 0;
        c := XML.Count - 1;
        while (i <= c) do
        begin
           s := XML[i];

           // Si la linea contiene CDATA borro el tag y lo pego al anterior (posiblemente en la línea anterior)
           if (Pos('<![CDATA[', s) > 0) then
           begin
              DentroCDATA := True;
              s := StringReplace(s, '<![CDATA[', '', [rfReplaceAll]);

              if (i > 0) then
              begin
                 XML.Delete(i);

                 Dec(i);
                 Dec(c);
                 XML[i] := XML[i] + Trim(s);
                 s := XML[i];
              end;
           end;

           if DentroCDATA then
           begin
             s := StringReplace(s, '&amp;', '&', [rfReplaceAll]);
             s := StringReplace(s, '&quot;', '"', [rfReplaceAll]);
             s := StringReplace(s, '&lt;', '<', [rfReplaceAll]);
             s := StringReplace(s, '&gt;', '>', [rfReplaceAll]);
             s := StringReplace(s, '&apos;', '''', [rfReplaceAll]);

             s := StringReplace(s, '&aacute;', 'á', [rfReplaceAll]);
             s := StringReplace(s, '&eacute;', 'é', [rfReplaceAll]);
             s := StringReplace(s, '&iacute;', 'í', [rfReplaceAll]);
             s := StringReplace(s, '&oacute;', 'ó', [rfReplaceAll]);
             s := StringReplace(s, '&uacute;', 'ú', [rfReplaceAll]);
             s := StringReplace(s, '&Aacute;', 'Á', [rfReplaceAll]);
             s := StringReplace(s, '&Eacute;', 'É', [rfReplaceAll]);
             s := StringReplace(s, '&Iacute;', 'Í', [rfReplaceAll]);
             s := StringReplace(s, '&Oacute;', 'Ó', [rfReplaceAll]);
             s := StringReplace(s, '&Uacute;', 'Ú', [rfReplaceAll]);
             s := StringReplace(s, '&agrave;', 'à', [rfReplaceAll]);
             s := StringReplace(s, '&egrave;', 'è', [rfReplaceAll]);
             s := StringReplace(s, '&igrave;', 'ì', [rfReplaceAll]);
             s := StringReplace(s, '&ograve;', 'ò', [rfReplaceAll]);
             s := StringReplace(s, '&ugrave;', 'ù', [rfReplaceAll]);
             s := StringReplace(s, '&Agrave;', 'À', [rfReplaceAll]);
             s := StringReplace(s, '&Egrave;', 'È', [rfReplaceAll]);
             s := StringReplace(s, '&Igrave;', 'Ì', [rfReplaceAll]);
             s := StringReplace(s, '&Ograve;', 'Ò', [rfReplaceAll]);
             s := StringReplace(s, '&Ugrave;', 'Ù', [rfReplaceAll]);
             s := StringReplace(s, '&iuml;', 'ï', [rfReplaceAll]);
             s := StringReplace(s, '&Iuml;', 'Ï', [rfReplaceAll]);
             s := StringReplace(s, '&ntilde;', 'ñ', [rfReplaceAll]);
             s := StringReplace(s, '&Ntilde;', 'Ñ', [rfReplaceAll]);
           end;

           // Si la linea contiene ]]> (Cierre de CData) borro el tag y lo pego al sigiente (posiblemente en la línea siguiente)
           if (Pos(']]>', s) > 0) then
           begin
              s := StringReplace(s, ']]>', '', [rfReplaceAll]);
              DentroCDATA := False;
              if (i < c) then
              begin
                 XML[i] := s + Trim(XML[i + 1]);

                 XML.Delete(i + 1);
                 Dec(c);
              end;
           end;

           Inc(i);
        end;
        }

        // Devuelvo el XML limpio y formateado
        aXML.Text := FormatXMLData(XML.Text);
     end;
  finally
     Documento.Free;
  end;
  *)
end;

function TDMPrestashop.WS_GetResources: integer;
var
  i : integer;
  Respuesta : TStrings;
  Documento : TXMLDocument;
  NodoApi : IXMLNode;
  Nodo : IXMLNode;
begin
  /// Obtiene recursos habilitados
  /// Devuelve el resultado de la consulta http

  Recursos.Clear;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     Result := WS_DoPost('GET', '', 0, '', nil, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-resources.xml');
     {$ENDIF}

     if (Result = 200) then
     begin
        ClearCData(Respuesta);

        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoApi := DameNodo(Documento.DocumentElement, ['api']);
           if Assigned(NodoApi) then
           begin
              for i := 0 to NodoApi.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoApi.ChildNodes.Get(i);
                 Recursos.Add(Nodo.NodeName);
              end;
           end;
        end;
     end;
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

procedure TDMPrestashop.WS_GetTaxRuleGroups;
var
  i, id, Resultado : integer;
  Respuesta : TStrings;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
begin
  /// Obtiene Tipos de IVA
  /// https://prestashop.delfos.net/api/tax_rule_groups/?ws_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxx&filter[active]=[1]&filter[deleted]=[0]&display=[id,name]

  TaxRuleGroups.Clear;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Resultado := WS_DoPost('GET', 'tax_rule_groups', 0, '&filter[active]=[1]&filter[deleted]=[0]&display=[id,name]', nil, Respuesta);
     Resultado := WS_DoPost('GET', 'tax_rule_groups', 0, '&filter[active]=[1]&display=[id,name]', nil, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-tax_rule_groups.xml');
     {$ENDIF}

     if (Resultado = 200) then
     begin
        ClearCData(Respuesta);

        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoPadre := DameNodo(Documento.DocumentElement, ['tax_rule_groups']);
           if Assigned(NodoPadre) then
           begin
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToInt(DameDato(Nodo, ['id']));
                 TaxRuleGroups.AddObject(DameDato(Nodo, ['name']), Pointer(id));
              end;
           end;
        end;
     end;
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMPrestashop.WS_GetIdCountry(Pais: string): integer;
var
  Respuesta : TStrings;
  Opciones : string;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
  CodigoRespuesta : integer;
begin
  // Pais debe ser el codigo ISO en dos caracteres. (España = ES)

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     Opciones := '&display=full';

     if SuperaVersion('1.6.0.6') then
        Opciones := '&filter[iso_code]=[' + Pais + ']&display=full';

     CodigoRespuesta := DMPrestashop.WS_Get('countries', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-countries.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['countries', 'country']);
           while Assigned(Nodo) do
           begin
              if (DameDato(Nodo, ['iso_code']) = Pais) then
              begin
                 Result := StrToInt(DameDato(Nodo, ['id']));
                 Nodo := nil;
              end
              else
                 Nodo := Nodo.NextSibling;
           end;
        end;
     end
     else
        ShowMessage('(countries)' + _('No se pudo obtener dato de Prestashop. (WS_GetIdCountry)') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMPrestashop.WS_GetIdRootCategory: integer;
var
  Respuesta : TStrings;
  Opciones : string;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
  CodigoRespuesta : integer;
begin
  // Pais debe ser el codigo ISO en dos caracteres. (España = ES)

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     Opciones := '&display=full';
     if SuperaVersion('1.6.0.6') then
        Opciones := '&filter[is_root_category]=[1]&display=full';

     CodigoRespuesta := DMPrestashop.WS_Get('categories', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-categories-root.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['categories', 'category']);
           while Assigned(Nodo) do
           begin
              if (DameDato(Nodo, ['is_root_category']) = '1') then
              begin
                 Result := StrToInt(DameDato(Nodo, ['id']));
                 Nodo := nil;
              end
              else
                 Nodo := Nodo.NextSibling;
           end;
        end;
     end
     else
        ShowMessage('(categories-root)' + _('No se pudo obtener dato de Prestashop. (WS_WS_GetIdRootCategory)') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

procedure TDMPrestashop.WS_DameRecursos(aRecursos: TStrings);
begin
  aRecursos.Clear;
  aRecursos.AddStrings(Recursos);
end;

procedure TDMPrestashop.WS_DameTaxRuleGroups(aTaxRuleGroups: TStrings);
begin
  aTaxRuleGroups.Clear;
  aTaxRuleGroups.AddStrings(TaxRuleGroups);
end;

function TDMPrestashop.WS_DameVersion(Legacy: boolean = False): string;
var
  Respuesta : TStrings;
  Opciones : string;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
  CodigoRespuesta : integer;
begin
  /// Devuelve la versión de Prestashop
  /// Si se llama con Legacy, se evita filtrar. Esto no funciona en versiones anteriores a 1.6.0.5.

  Result := '';

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     Opciones := '&display=full';
     if not Legacy then
        Opciones := Opciones + '&filter[name]=[PS_VERSION_DB]';

     CodigoRespuesta := DMPrestashop.WS_Get('configurations', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-configurations.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['configurations', 'configuration']);
           while Assigned(Nodo) do
           begin
              if (DameDato(Nodo, ['name']) = 'PS_VERSION_DB') then
              begin
                 Result := DameDato(Nodo, ['value']);
                 Nodo := nil;
              end
              else
                 Nodo := Nodo.NextSibling;
           end;
        end;
     end
     else
     if not Legacy then
        Result := WS_DameVersion(True)
     else
        ShowMessage('(configurations)' + _('No se pudo obtener dato de Prestashop. (configurations)') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMPrestashop.SuperaVersion(aVersion: string): boolean;
var
  MajorVer, MinorVer, Release, Buid : integer;
  PSMajorVer, PSMinorVer, PSRelease, PSBuid : integer;
  vPS, v : string;
begin
  // Obtengo valores de version Prestashop como enteros
  vPS := WSVersion;
  PSMajorVer := StrToIntDef(Copy(vPS, 1, Pos('.', vPS) - 1), 0);
  vPS := Copy(vPS, Pos('.', vPS) + 1, Length(vPS));
  PSMinorVer := StrToIntDef(Copy(vPS, 1, Pos('.', vPS) - 1), 0);
  vPS := Copy(vPS, Pos('.', vPS) + 1, Length(vPS));
  PSRelease := StrToIntDef(Copy(vPS, 1, Pos('.', vPS) - 1), 0);
  vPS := Copy(vPS, Pos('.', vPS) + 1, Length(vPS));
  PSBuid := StrToIntDef(vPS, 0);

  // Obtengo valores de version como enteros
  v := aVersion;
  MajorVer := StrToIntDef(Copy(v, 1, Pos('.', v) - 1), 0);
  v := Copy(v, Pos('.', v) + 1, Length(v));
  MinorVer := StrToIntDef(Copy(v, 1, Pos('.', v) - 1), 0);
  v := Copy(v, Pos('.', v) + 1, Length(v));
  Release := StrToIntDef(Copy(v, 1, Pos('.', v) - 1), 0);
  v := Copy(v, Pos('.', v) + 1, Length(v));
  Buid := StrToIntDef(v, 0);

  // Transformo en strings comparables (Ej. "001.017.006.003")
  vPS := format('%.3d-%.3d-%.3d-%.3d', [PSMajorVer, PSMinorVer, PSRelease, PSBuid]);
  v := format('%.3d-%.3d-%.3d-%.3d', [MajorVer, MinorVer, Release, Buid]);

  // Comparo que los valores de la version sean mayores o iguales a los de Prestashop.
  // DMMain.Log(format('SuperaVersion(%s) // VerPS(%s) >= Ver(%s) // %s >= %s', [aVersion, WSVersion,aVersion,vPS,v]));
  Result := (vPS >= v);
end;

// Acceso directo a MySQL
procedure TDMPrestashop.SetDSN(aDSN, aVersionPrestashop: string);
begin
  if (DSN <> aDSN) then
  begin
     DSN := Trim(aDSN);

     // VersionPrestashop := aVersionPrestashop;
     MYSQLConnection.Connected := False;
     MYSQLConnection.ConnectionString := '';
  end;
end;

function TDMPrestashop.EstableceConexionMySQL(Quiet: boolean = False): boolean;
begin
  Result := False;
  // Conecto si no está conectada
  if (DSN <> '') then
  begin
     with MYSQLConnection do
     begin
        try
           if (not Connected) then
           begin
              ConnectionString := 'DSN=' + DSN;
              Connected := True;
           end;

           Result := True;
        except
           on e: Exception do
           begin
              DMMain.Log('DMPrestashop.EstableceConexionMySQL' + ' - ' + _('Error al abrir conexion MySQL') + #13#10 + 'DSN=' + DSN + #13#10 + e.Message);

              if not Quiet then
                 ShowMessage(_('Error al abrir conexion MySQL') + #13#10 + 'DSN=' + DSN + #13#10 + e.Message);
           end
        end;
     end;
  end;
end;

function TDMPrestashop.DameFechaServidorMySQL(Quiet: boolean = False): TDateTime;
begin
  Result := 0;

  if EstableceConexionMySQL(Quiet) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add(' select current_timestamp() ');
           Open;
           if (not IsEmpty) then
              Result := Fields[0].AsDateTime;
           Close;
        except
           on e: Exception do
           begin
              DMMain.Log('DMPrestashop.DameFechaServidorMySQL' + ' - ' + _('Error al obtener la fecha del servidor MySQL') + #13#10 + e.Message);

              if not Quiet then
                 ShowMessage(_('Error al obtener la fecha del servidor MySQL') + #13#10 + e.Message);
           end;
        end;
     end;
  end;
end;

function TDMPrestashop.FiltraPacks(Quiet: boolean = False): boolean;
begin
  DMMain.Log('DMPrestashop.FiltraPacks');
  Result := False;
  if (MYSQLConnection.Connected) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add('select * from ps_pack order by id_product_pack, id_product_item, id_product_attribute_item ');
           Open;

           Result := True;
        except
           on e: Exception do
           begin
              DMMain.Log('DMPrestashop.FiltraPacks' + ' - ' + _('Error al obtener ps_pack') + #13#10 + e.Message);

              if not Quiet then
                 ShowMessage(_('Error al obtener ps_pack') + #13#10 + e.Message);
           end;
        end;
     end;
  end;
end;

function TDMPrestashop.FiltraMegaProductCart(DesdeRegistro: integer; Quiet: boolean = False): boolean;
begin
  DMMain.Log('DMPrestashop.FiltraMegaProductCart(' + IntToStr(DesdeRegistro) + ')');
  Result := False;
  if (MYSQLConnection.Connected) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add('select * from ps_megaproductcart where id_megacart > ' + IntToStr(DesdeRegistro) + ' order by id_megacart, id_cart, id_product, id_product_attribute ');
           Open;

           Result := True;
        except
           on e: Exception do
           begin
              DMMain.Log('DMPrestashop.FiltraMegaProductCart' + ' - ' + _('Error al obtener ps_megaproductcart') + #13#10 + e.Message);

              if not Quiet then
                 ShowMessage(_('Error al obtener ps_megaproductcaer') + #13#10 + e.Message);
           end;
        end;
     end;
  end;
end;

(*
procedure TDMPrestashop.EstableceConstantes;
begin
  id_lang := 0;
  id_country := 0;
  if (MYSQLConnection.Connected) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add('select id_lang from ps_lang where iso_code = ''es'' ');
           Open;
           if (not IsEmpty) then
              id_lang := Fields[0].Value;
           Close;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener id_lang') + #13#10 + e.Message);
        end;
     end;

     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add('select id_country from ps_country where iso_code = ''ES'' ');
           Open;
           if (not IsEmpty) then
              id_country := Fields[0].Value;
           Close;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener id_conutry') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)

end.
