unit UFMErrorPedidoEdi;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask,
  DBCtrls, ComCtrls, ExtCtrls, URightMaskEdit, Grids, DBGrids, NsDBGrid,
  ULFLabel, ULFEdit, ULFPanel, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox,
  ULFPageControl;

type
  TFMErrorPedidoEdi = class(TForm)
     Panel1: TLFPanel;
     PCabecera: TLFPanel;
     DBTNroPedido: TDBText;
     LNroPedido: TLFLabel;
     DBTFecha: TDBText;
     LFechaPedido: TLFLabel;
     DBTSucursalQPide: TDBText;
     LSucursal: TLFLabel;
     DBTFechaEntrega: TDBText;
     LFechaEntrega: TLFLabel;
     DBTSucursalSUCURSAL: TDBText;
     PDetalle: TLFPanel;
     DBTLinea: TDBText;
     LLinea: TLFLabel;
     LEAN: TLFLabel;
     DBTEAN: TDBText;
     LRefCliente: TLFLabel;
     DBTArticulo: TDBText;
     DBTReferenciaProveedor: TDBText;
     LReferenciaProveedor: TLFLabel;
     DBTReferenciaEtiqueta: TDBText;
     LReferenciaEtiqueta: TLFLabel;
     DBTDescripcion: TDBText;
     DBTDescripcion2: TDBText;
     DBTCantidad: TDBText;
     LCantidad: TLFLabel;
     LFechaEntregaLinea: TLFLabel;
     DBTFechaEntregaLinea: TDBText;
     DBTPrecioNeto: TDBText;
     LPrecioNeto: TLFLabel;
     DBTPrecioBruto: TDBText;
     LPRecioBruto: TLFLabel;
     PGErroresPedidos: TLFPageControl;
     DBERefProv: TLFDBEdit;
     EFArticulo: TEditFind2000;
     EArticulo: TLFEdit;
     BSeleccionarArticulo: TButton;
     BCancelar: TButton;
     TSErrPrecio: TTabSheet;
     BSelecPrecio: TButton;
     BCancelaPrecio: TButton;
     LPrecioPrecio: TLFLabel;
     LPrecioDescuento: TLFLabel;
     REPrecio: THYGRightEdit;
     REDescuento: THYGRightEdit;
     REDescuento2: THYGRightEdit;
     REDescuento3: THYGRightEdit;
     CHBModificarTarifa: TLFCheckBox;
     LDescuento1: TLFLabel;
     DBTDescuento1: TDBText;
     DBTDescuento2: TDBText;
     LDescuento2: TLFLabel;
     DBTDescuento3: TDBText;
     LDescuento3: TLFLabel;
     DBGSeleccionRapida: TNsDBGrid;
     LFLabel1: TLFLabel;
     TSErrArticulo: TTabSheet;
     DBTLMarca: TDBText;
     DBTModelo: TDBText;
     DBTTamano: TDBText;
     LMarcaModeloTamano: TLFLabel;
     LError: TLFLabel;
     procedure EFArticuloChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure VerificaNro(Sender: TObject);
     procedure DBGSeleccionRapidaDblClick(Sender: TObject);
  private
     { Private declarations }
     ClienteEDI: string;
  public
     { Public declarations }
     procedure ErrorArticulo(aClienteEDI: string);
     procedure ErrorPrecio(var Precio, Desc1, Desc2, Desc3: real; var ModTarifa: boolean);
  end;

var
  FMErrorPedidoEdi : TFMErrorPedidoEdi;

implementation

uses UDMEDI, UDMMain, HYFIBQuery, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMErrorPedidoEdi.EFArticuloChange(Sender: TObject);
var
  ExisteArticulo : boolean;
  ExisteTraduccion : boolean;
  RefCli : string;
  RefProv : string;
  RefEAN : string;
begin
  // Descripcion del articulo seleccionado
  EArticulo.Text := DameTituloArticulo(EFArticulo.Text);
  ExisteArticulo := (EArticulo.Text > '');

  // Verifico si ya existe una traduccion EDI.REFCLI -> ART_ARTICULOS.ARTICULO en la base de datos
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT REFCLI, REFPROV, REFEAN FROM EDI_ARTICULOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA ');
        SQL.Add(' AND ARTICULO = :ARTICULO ');
        SQL.Add(' AND CLIENTE_EDI = :CLIENTE_EDI ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := EFArticulo.Text;
        Params.ByName['CLIENTE_EDI'].AsString := ClienteEDI;
        ExecQuery;
        RefCli := FieldByName['REFCLI'].AsString;
        RefProv := FieldByName['REFPROV'].AsString;
        RefEAN := FieldByName['REFEAN'].AsString;
        ExisteTraduccion := (RefCli <> '');
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ExisteTraduccion then
     LError.Caption := format('El articulo seleccionado ya esta unido a otra referencia de cliente.' + #13#10 + 'REF. CLI.: %s' + #13#10 + 'REF. PROV.: %s' + #13#10 + 'REF. EAN.: %s', [RefCli, RefProv, RefEAN]);
  LError.Visible := ExisteTraduccion;

  // Habilito boton [mrOk] si el artículo existe y la traduccion EDI NO existe.
  BSeleccionarArticulo.Enabled := (ExisteArticulo and (not ExisteTraduccion));
end;

procedure TFMErrorPedidoEdi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMErrorPedidoEdi.ErrorArticulo(aClienteEDI: string);
begin
  ClienteEDI := aClienteEDI;
  PCabecera.Enabled := False;
  PDetalle.Enabled := False;
  BSeleccionarArticulo.Enabled := False;
  LError.Visible := False;
  TSErrPrecio.Hide;
  TSErrArticulo.Show;
end;

procedure TFMErrorPedidoEdi.ErrorPrecio(var Precio, Desc1, Desc2, Desc3: real; var ModTarifa: boolean);
begin
  PCabecera.Enabled := False;
  PDetalle.Enabled := False;
  TSErrArticulo.Hide;
  TSErrPrecio.Show;
  REPrecio.Text := FloatToStr(Precio);
  REDescuento.Text := FloatToStr(Desc1);
  REDescuento2.Text := FloatToStr(Desc2);
  REDescuento3.Text := FloatToStr(Desc3);
  ShowModal;
  Precio := StrToFloat(REPrecio.Text);
  Desc1 := StrToFloat(REDescuento.Text);
  Desc2 := StrToFloat(REDescuento2.Text);
  Desc3 := StrToFloat(REDescuento3.Text);
  ModTarifa := CHBModificarTarifa.Checked;
end;

procedure TFMErrorPedidoEdi.FormShow(Sender: TObject);
begin
  if (PGErroresPedidos.ActivePage = TSErrArticulo) then
     EFArticulo.SetFocus;
  if (PGErroresPedidos.ActivePage = TSErrPrecio) then
  begin
     REPrecio.SetFocus;
     REPrecio.SelectAll;
  end;
end;

procedure TFMErrorPedidoEdi.VerificaNro(Sender: TObject);
var
  s, aux : string;
  i : integer;
begin
  s := THYGRightEdit(Sender).Text;
  aux := '';
  for i := 1 to Length(s) do
  begin
     if (s[i] in ['0'..'9', '+', '-']) then
        aux := aux + s[i];
     if (s[i] in ['.', ',']) then
        aux := aux + ',';
  end;
  THYGRightEdit(Sender).Text := aux;
end;

procedure TFMErrorPedidoEdi.DBGSeleccionRapidaDblClick(Sender: TObject);
begin
  EFArticulo.Text := DMEDI.xArticulosEDIARTICULO.AsString;
end;

end.
