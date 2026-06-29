unit UFMSeleccionArticulo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, ULFEdit, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel,
  ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Mask, rxToolEdit,
  ULFDateEdit, ULFLabel, Grids, DBGrids, NsDBGrid, FIBDatabase,
  UFIBModificados, DB, FIBDataSet, UHYDBGrid, FIBTableDataSet,
  TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMSeleccionArticulo = class(TFPEditSinNavegador)
     TBOk: TToolButton;
     TBSep1: TToolButton;
     PNLFiltros: TLFPanel;
     PNLArticulos: TLFPanel;
     LBusqueda: TLFLabel;
     EBusqueda: TLFEdit;
     LCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     LAlmacen: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     DBGArticulos: THYTDBGrid;
     TmrBusqueda: TTimer;
     TLocal: THYTransaction;
     DSBusqueda: TDataSource;
     xBusqueda: TFIBTableSet;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     EFSubFamilia: TLFEditFind2000;
     LSubfamilia: TLFLabel;
     xBusquedaID_A: TIntegerField;
     xBusquedaARTICULO: TFIBStringField;
     xBusquedaTITULO: TFIBStringField;
     xBusquedaFAMILIA: TFIBStringField;
     xBusquedaSUBFAMILIA: TFIBStringField;
     xBusquedaALFA_1: TFIBStringField;
     xBusquedaALFA_2: TFIBStringField;
     xBusquedaALFA_3: TFIBStringField;
     xBusquedaALFA_4: TFIBStringField;
     xBusquedaALFA_5: TFIBStringField;
     xBusquedaALFA_6: TFIBStringField;
     xBusquedaALFA_7: TFIBStringField;
     xBusquedaALFA_8: TFIBStringField;
     xBusquedaSTOCK1: TFloatField;
     xBusquedaPEDIDOS_D_CLI: TFloatField;
     xBusquedaPEDIDOS_A_PRO: TFloatField;
     CBCaseInsensitive: TLFCheckBox;
     xBusquedaCODIGO_CLIENTE: TFIBStringField;
     xBusquedaCODIGO_PROVEEDOR: TFIBStringField;
     LAlto: TLFLabel;
     EAlto: TLFEdit;
     LAncho: TLFLabel;
     EAncho: TLFEdit;
     xBusquedaALTO: TFloatField;
     xBusquedaANCHO: TFloatField;
     xBusquedaFONDO: TFloatField;
     LAlmacen2: TLFLabel;
     EFAlmacen2: TLFEditFind2000;
     xBusquedaSTOCK2: TFloatField;
     xBusquedaPEDIDOS_D_CLI2: TFloatField;
     xBusquedaPEDIDOS_A_PRO2: TFloatField;
     CBCalcularStock: TLFCheckBox;
     CBCalcularPedidos: TLFCheckBox;
     EFTarifa: TLFEditFind2000;
     LTarifa: TLFLabel;
     xBusquedaTITULO_FAMILIA: TFIBStringField;
     xBusquedaTITULO_SUBFAMILIA: TFIBStringField;
     xBusquedaMARCA: TFIBStringField;
     EFMarca: TLFEditFind2000;
     LMaca: TLFLabel;
     EFTipoArticulo: TLFEditFind2000;
     LTipoArticulo: TLFLabel;
     xBusquedaTIPO_ARTICULO: TFIBStringField;
     ETituloTarifa: TLFEdit;
     EFTtuloMarca: TLFEdit;
     EFTipoArticuloTitulo: TLFEdit;
     xBusquedaPRECIO: TFloatField;
     BSImilar: TButton;
     PNLImagen: TLFPanel;
     IArticulo: TImage;
     xBusquedaIMAGEN: TIntegerField;
     PNLBusqueda: TLFPanel;
     TmrImagenArticulo: TTimer;
     xBusquedaPRECIO_IVA_INCLUIDO: TFloatField;
     CBSoloDisponibleVenta: TLFCheckBox;
     xBusquedaDISPONIBILIDAD: TIntegerField;
     xBusquedaBLOQUEO_VENTAS: TIntegerField;
     xBusquedaBLOQUEO_COMPRAS: TIntegerField;
     xBusquedaBAJA: TIntegerField;
     CBBloqueadoEnCompras: TLFCheckBox;
     CBBloqueadoEnVentas: TLFCheckBox;
     procedure TBOkClick(Sender: TObject);
     procedure OnKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure TmrBusquedaTimer(Sender: TObject);
     procedure EBusquedaChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure xBusquedaAfterScroll(DataSet: TDataSet);
     procedure EBusquedaKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGArticulosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFSubFamiliaBusqueda(Sender: TObject);
     procedure DBGArticulosDblClick(Sender: TObject);
     procedure EFTarifaChange(Sender: TObject);
     procedure EFMarcaChange(Sender: TObject);
     procedure EFTipoArticuloChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure BSImilarClick(Sender: TObject);
     procedure TmrImagenArticuloTimer(Sender: TObject);
     procedure DBGArticulosTitleClick(Column: TColumn);
     procedure xBusquedaCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     ColumnaOrden: integer;
     StockAlm, StockAlm2, StockAlm3: TStrings;
     procedure InicializaDatos;
  public
     { Public declarations }
     ResultadoBusqueda: string;
  end;

var
  FMSeleccionArticulo : TFMSeleccionArticulo;

function PideArticulo(var Articulo: string; BloqueadoEnCompras: boolean = True; BloqueadoEnVentas: boolean = True): boolean;

implementation

uses UDMMain, UFormGest, DateUtils, UEntorno, UFMain, HYFIBQuery, UUtiles, UDameDato, UParam, UImagenes;

{$R *.dfm}

function PideArticulo(var Articulo: string; BloqueadoEnCompras: boolean = True; BloqueadoEnVentas: boolean = True): boolean;
begin
  Result := False;
  AbreForm(TFMSeleccionArticulo, FMSeleccionArticulo);
  try
     with FMSeleccionArticulo do
     begin
        CBBloqueadoEnCompras.Checked := BloqueadoEnCompras;
        CBBloqueadoEnVentas.Checked := BloqueadoEnVentas;
        Articulo := Trim(Articulo);
        if (Articulo <> '') then
        begin
           EBusqueda.Text := Articulo;
           EBusqueda.SelStart := Length(EBusqueda.Text);
        end;

        // Oculto para mostrar en modo Modal
        Hide;
        ShowModal;

        Result := False;
        if (ModalResult = mrOk) then
        begin
           Result := True;
           Articulo := ResultadoBusqueda;
        end;
     end;
  except
     CierraForm(FMSeleccionArticulo);
  end;
end;

procedure TFMSeleccionArticulo.FormCreate(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;

  StockAlm := TStringList.Create;
  StockAlm2 := TStringList.Create;
  StockAlm3 := TStringList.Create;

  TmrImagenArticulo.Enabled := False;
  ColumnaOrden := -1;

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  FMain.AddComponentePunto(EBusqueda);

  ResultadoBusqueda := '';
  EFAlmacen.Text := REntorno.AlmacenDefecto;

  AsignaDisplayFormat(xBusqueda, MascaraN, MascaraI, ShortDateFormat);

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
  begin
     xBusqueda.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

     IdColumna := EncuentraField(DBGArticulos, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGArticulos.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMSeleccionArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  TmrBusqueda.Enabled := False;
  TmrImagenArticulo.Enabled := False;
  FMain.DelComponentePunto(EBusqueda);

  StockAlm.Free;
  StockAlm2.Free;
  StockAlm3.Free;

  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TFMSeleccionArticulo.TBOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFMSeleccionArticulo.OnKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
end;

procedure TFMSeleccionArticulo.TmrBusquedaTimer(Sender: TObject);
begin
  inherited;
  TmrBusqueda.Enabled := False;
  with xBusqueda do
  begin
     Close;
     if (Transaction.InTransaction) then
        Transaction.Commit;

     Transaction.StartTransaction;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT A.ID_A, A.ARTICULO, A.TITULO, ');
     SelectSQL.Add(' A.FAMILIA, F.TITULO TITULO_FAMILIA, ');
     SelectSQL.Add(' A.SUBFAMILIA, SF.TITULO TITULO_SUBFAMILIA, ');
     SelectSQL.Add(' A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8, A.ALTO, A.ANCHO, A.FONDO, ');
     SelectSQL.Add(' M.TITULO MARCA, ');
     SelectSQL.Add(' T.TITULO TIPO_ARTICULO, A.IMAGEN, ');
     if (EFTarifa.Text > '') then
     begin
        SelectSQL.Add(' (SELECT FIRST 1 ');
        SelectSQL.Add('                CASE ');
        SelectSQL.Add('                  WHEN (TT.IVA_INCLUIDO = 0) THEN ');
        SelectSQL.Add('                      PP.PRECIO_VENTA ');
        SelectSQL.Add('                  ELSE PP.PRECIO_VENTA / (1 + (I.P_IVA / 100)) ');
        SelectSQL.Add('                END ');
        SelectSQL.Add(' FROM ART_TARIFAS_PRECIOS PP ');
        SelectSQL.Add(' JOIN ART_TARIFAS_C TT ON TT.EMPRESA = PP.EMPRESA AND TT.TARIFA = PP.TARIFA ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' PP.EMPRESA = A.EMPRESA AND ');
        SelectSQL.Add(' PP.TARIFA = :TARIFA AND ');
        SelectSQL.Add(' PP.ARTICULO = A.ARTICULO ');
        SelectSQL.Add(' ORDER BY PP.LINEA) PRECIO, ');
        SelectSQL.Add(' -- ');
        SelectSQL.Add(' (SELECT FIRST 1 ');
        SelectSQL.Add('                CASE ');
        SelectSQL.Add('                  WHEN (TT.IVA_INCLUIDO = 0) THEN ');
        SelectSQL.Add('                      PP.PRECIO_VENTA + (PP.PRECIO_VENTA * I.P_IVA / 100) ');
        SelectSQL.Add('                  ELSE PP.PRECIO_VENTA ');
        SelectSQL.Add('                END ');
        SelectSQL.Add(' FROM ART_TARIFAS_PRECIOS PP ');
        SelectSQL.Add(' JOIN ART_TARIFAS_C TT ON TT.EMPRESA = PP.EMPRESA AND TT.TARIFA = PP.TARIFA ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' PP.EMPRESA = A.EMPRESA AND ');
        SelectSQL.Add(' PP.TARIFA = :TARIFA AND ');
        SelectSQL.Add(' PP.ARTICULO = A.ARTICULO ');
        SelectSQL.Add(' ORDER BY PP.LINEA) PRECIO_IVA_INCLUIDO, ');
     end
     else
     begin
        SelectSQL.Add(' 0.0 PRECIO, ');
        SelectSQL.Add(' 0.0 PRECIO_IVA_INCLUIDO, ');
     end;

     if (EFAlmacen.Text <> '') then
     begin
        if CBCalcularPedidos.Checked then
        begin
           SelectSQL.Add('        PC1.PEDIDOS_D_CLI PEDIDOS_D_CLI1, ');
           SelectSQL.Add('        PP1.PEDIDOS_A_PRO PEDIDOS_A_PRO1, ');
        end
        else
        begin
           SelectSQL.Add('        0.0 PEDIDOS_D_CLI1, ');
           SelectSQL.Add('        0.0 PEDIDOS_A_PRO1, ');
        end;
     end
     else
     begin
        SelectSQL.Add('        0.0 PEDIDOS_D_CLI1, ');
        SelectSQL.Add('        0.0 PEDIDOS_A_PRO1, ');
     end;

     if (EFAlmacen2.Text <> '') then
     begin
        if CBCalcularPedidos.Checked then
        begin
           SelectSQL.Add('        PC2.PEDIDOS_D_CLI PEDIDOS_D_CLI2, ');
           SelectSQL.Add('        PP2.PEDIDOS_A_PRO PEDIDOS_A_PRO2, ');
        end
        else
        begin
           SelectSQL.Add('        0.0 PEDIDOS_D_CLI2, ');
           SelectSQL.Add('        0.0 PEDIDOS_A_PRO2, ');
        end;
     end
     else
     begin
        SelectSQL.Add('        0.0 PEDIDOS_D_CLI2, ');
        SelectSQL.Add('        0.0 PEDIDOS_A_PRO2, ');
     end;

     SelectSQL.Add('        CAST(SUBSTRING((SELECT LIST(COALESCE(CODIGO_CLIENTE, ''---''), '', '') ');
     SelectSQL.Add('                        FROM ART_ARTICULOS_CODCLI ');
     SelectSQL.Add('                        WHERE ');
     SelectSQL.Add('                        EMPRESA = A.EMPRESA AND ');
     SelectSQL.Add('                        ARTICULO = A.ARTICULO ');
     if (StrToIntDef(EFCliente.Text, 0) <> 0) then
        SelectSQL.Add('                        AND CLIENTE = ' + EFCliente.Text);
     SelectSQL.Add('        ) FROM 1 FOR 256) AS VARCHAR(256)) CODIGO_CLIENTE, ');

     SelectSQL.Add('        CAST(SUBSTRING((SELECT LIST(COALESCE(CODIGO_PROVEEDOR, ''---''), '', '') ');
     SelectSQL.Add('                        FROM ART_ARTICULOS_CODPROV ');
     SelectSQL.Add('                        WHERE ');
     SelectSQL.Add('                        EMPRESA = A.EMPRESA AND ');
     SelectSQL.Add('                        ARTICULO = A.ARTICULO ');
     if (StrToIntDef(EFProveedor.Text, 0) <> 0) then
        SelectSQL.Add('                        AND PROVEEDOR = ' + EFProveedor.Text);
     SelectSQL.Add('        ) FROM 1 FOR 256) AS VARCHAR(256)) CODIGO_PROVEEDOR, ');
     SelectSQL.Add(' A.DISPONIBILIDAD, A.BAJA, A.BLOQUEO_VENTAS, A.BLOQUEO_COMPRAS ');

     SelectSQL.Add(' FROM VER_ARTICULOS_CUENTAS A ');
     SelectSQL.Add(' JOIN ART_FAMILIAS F ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.FAMILIA ');
     SelectSQL.Add(' JOIN SYS_TIPO_IVA I ON A.TIPO_IVA = I.TIPO AND A.PAIS = I.PAIS ');
     SelectSQL.Add(' LEFT JOIN ART_SUBFAMILIAS SF ON F.ID_FAMILIA = SF.ID_FAMILIA AND A.SUBFAMILIA = SF.SUBFAMILIA ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_MOD_MARCAS M ON M.ID_MARCA = A.ID_MARCA ');
     SelectSQL.Add(' LEFT JOIN SYS_TIPO_ARTICULO T ON T.TIPO = A.TIPO_ARTICULO ');

     if ((EFAlmacen.Text <> '') and (CBCalcularPedidos.Checked)) then
     begin
        SelectSQL.Add(' LEFT JOIN A_ART_DAME_PEDIDOS_CLI(A.EMPRESA, A.CANAL, :ALMACEN1, A.ARTICULO) PC1 ON 1 = 1 ');
        SelectSQL.Add(' LEFT JOIN A_ART_DAME_PEDIDOS_PRO(A.EMPRESA, A.CANAL, :ALMACEN1, A.ARTICULO) PP1 ON 1 = 1 ');
     end;

     if ((EFAlmacen2.Text <> '') and (CBCalcularPedidos.Checked)) then
     begin
        SelectSQL.Add(' LEFT JOIN A_ART_DAME_PEDIDOS_CLI(A.EMPRESA, A.CANAL, :ALMACEN2, A.ARTICULO) PC2 ON 1 = 1 ');
        SelectSQL.Add(' LEFT JOIN A_ART_DAME_PEDIDOS_PRO(A.EMPRESA, A.CANAL, :ALMACEN2, A.ARTICULO) PP2 ON 1 = 1 ');
     end;

     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' A.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' A.EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' A.CANAL = :CANAL AND ');
     SelectSQL.Add(' A.FAMILIA <> ''' + REntorno.FamSistema + ''' ');
     if (Trim(EFFamilia.Text) <> '') then
        SelectSQL.Add(' AND A.FAMILIA = ''' + Copy(Trim(EFFamilia.Text), 1, 5) + ''' ');
     if (Trim(EFSubFamilia.Text) <> '') then
        SelectSQL.Add(' AND A.SUBFAMILIA = ''' + Copy(Trim(EFSubFamilia.Text), 1, 5) + ''' ');
     if (StrToFloatDef(EAlto.Text, 0) <> 0) then
        SelectSQL.Add(' AND A.ALTO = ' + EAlto.Text);
     if (StrToFloatDef(EAncho.Text, 0) <> 0) then
        SelectSQL.Add(' AND A.ANCHO = ' + EAncho.Text);
     if (StrToFloatDef(EFMarca.Text, 0) <> 0) then
        SelectSQL.Add(' AND A.ID_MARCA = ' + EFMarca.Text);
     if (EFTipoArticulo.Text <> '') then
        SelectSQL.Add(' AND A.TIPO_ARTICULO = ''' + EFTipoArticulo.Text + ''' ');
     if (CBSoloDisponibleVenta.Checked) then
        SelectSQL.Add(' AND A.DISPONIBILIDAD IN (1, 2) ');
     if (not CBBloqueadoEnVentas.Checked) then
        SelectSQL.Add(' AND A.BLOQUEO_VENTAS <> 2 ');
     if (not CBBloqueadoEnCompras.Checked) then
        SelectSQL.Add(' AND A.BLOQUEO_COMPRAS <> 2 ');

     SelectSQL.Add(' AND A.ARTICULO IN (SELECT ARTICULO ');
     SelectSQL.Add('                FROM VER_ARTICULOS_EF ');
     SelectSQL.Add('                WHERE ');
     SelectSQL.Add('                EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('                EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add('                CANAL = :CANAL AND ');
     SelectSQL.Add('                ( ');

     if CBCaseInsensitive.Checked then
     begin
        SelectSQL.Add('                (UPPER(ARTICULO) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 15)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(TITULO) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 60)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(ALFA_1) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(ALFA_2) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(ALFA_3) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(ALFA_4) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(ALFA_5) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(ALFA_6) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(ALFA_7) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') OR -- ');
        SelectSQL.Add('                (UPPER(ALFA_8) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') -- ');
     end
     else
     begin
        SelectSQL.Add('                (ARTICULO LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 15) || ''%'') OR -- ');
        SelectSQL.Add('                (TITULO LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 60) || ''%'') OR -- ');
        SelectSQL.Add('                (ALFA_1 LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') OR -- ');
        SelectSQL.Add('                (ALFA_2 LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') OR -- ');
        SelectSQL.Add('                (ALFA_3 LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') OR -- ');
        SelectSQL.Add('                (ALFA_4 LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') OR -- ');
        SelectSQL.Add('                (ALFA_5 LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') OR -- ');
        SelectSQL.Add('                (ALFA_6 LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') OR -- ');
        SelectSQL.Add('                (ALFA_7 LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') OR -- ');
        SelectSQL.Add('                (ALFA_8 LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') -- ');
     end;
     SelectSQL.Add('                ) ');

     SelectSQL.Add('                UNION ');
     SelectSQL.Add('                SELECT ARTICULO ');
     SelectSQL.Add('                FROM VER_ARTICULOS_COD_CLI ');
     SelectSQL.Add('                WHERE ');
     SelectSQL.Add('                EMPRESA = :EMPRESA AND ');
     if CBCaseInsensitive.Checked then
     begin
        SelectSQL.Add('                UPPER(CODIGO_CLIENTE) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'' ');
     end
     else
     begin
        SelectSQL.Add('                CODIGO_CLIENTE LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'' ');
     end;
     if (StrToIntDef(EFCliente.Text, 0) <> 0) then
        SelectSQL.Add('                AND CLIENTE = ' + EFCliente.Text);
     SelectSQL.Add('                UNION ');
     SelectSQL.Add('                SELECT ARTICULO ');
     SelectSQL.Add('                FROM VER_ARTICULOS_COD_PROV ');
     SelectSQL.Add('                WHERE ');
     SelectSQL.Add('                EMPRESA = :EMPRESA AND ');
     if CBCaseInsensitive.Checked then
     begin
        SelectSQL.Add('                ( ');
        SelectSQL.Add('                (UPPER(CODIGO_PROVEEDOR) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40)) || ''%'') OR  ');
        SelectSQL.Add('                (UPPER(TITULO_ART)       LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 60)) || ''%'') ');
        SelectSQL.Add('                ) ');
     end
     else
     begin
        SelectSQL.Add('                ( ');
        SelectSQL.Add('                (CODIGO_PROVEEDOR LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 40) || ''%'') OR  ');
        SelectSQL.Add('                (TITULO_ART       LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 60) || ''%'') ');
        SelectSQL.Add('                ) ');
     end;
     if (StrToIntDef(EFProveedor.Text, 0) <> 0) then
        SelectSQL.Add('                AND PROVEEDOR = ' + EFProveedor.Text);

     SelectSQL.Add('                UNION ');
     SelectSQL.Add('                SELECT ARTICULO ');
     SelectSQL.Add('                FROM ART_ARTICULOS_LOTES ');
     SelectSQL.Add('                WHERE ');
     SelectSQL.Add('                EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('                CANAL = :CANAL AND ');
     if CBCaseInsensitive.Checked then
     begin
        SelectSQL.Add('                UPPER(LOTE) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 20)) || ''%'' ');
     end
     else
     begin
        SelectSQL.Add('                LOTE LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 20) || ''%'' ');
     end;
     SelectSQL.Add('                UNION ');
     SelectSQL.Add('                SELECT ARTICULO ');
     SelectSQL.Add('                FROM ART_ARTICULOS_BARRAS ');
     SelectSQL.Add('                WHERE ');
     SelectSQL.Add('                EMPRESA = :EMPRESA AND ');
     if CBCaseInsensitive.Checked then
     begin
        SelectSQL.Add('                UPPER(BARRAS) LIKE ''%'' || UPPER(SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 25)) || ''%'' )');
     end
     else
     begin
        SelectSQL.Add('                BARRAS LIKE ''%'' || SUBSTRING(CAST(:BUSQUEDA AS VARCHAR(256)) FROM 1 FOR 25) || ''%'' )');
     end;

     if (ColumnaOrden = -1) then
        SelectSQL.Add(' ORDER BY 2 /* ARTICULO */')
     else
     begin
        SelectSQL.Add(' ORDER BY ' + IntToStr(Abs(ColumnaOrden)));
        if (ColumnaOrden < 0) then
           SelectSQL.Add(' DESC ');
     end;

     DMMain.Log(SelectSQL.Text);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if ((EFAlmacen.Text <> '') and (CBCalcularPedidos.Checked)) then
     begin
        Params.ByName['ALMACEN1'].AsString := EFAlmacen.Text;
     end;
     if ((EFAlmacen2.Text <> '') and (CBCalcularPedidos.Checked)) then
     begin
        Params.ByName['ALMACEN2'].AsString := EFAlmacen2.Text;
     end;
     if (EFTarifa.Text > '') then
     begin
        Params.ByName['TARIFA'].AsString := EFTarifa.Text;
     end;
     Params.ByName['BUSQUEDA'].AsString := EBusqueda.Text;
     Open;
  end;
end;

procedure TFMSeleccionArticulo.EBusquedaChange(Sender: TObject);
var
  c : integer;
begin
  inherited;
  TmrBusqueda.Enabled := False;

  c := EncuentraField(DBGArticulos, 'STOCK1');
  if (c >= 0) then
  begin
     if CBCalcularStock.Checked and (Trim(EFAlmacen.Text) <> '') then
        DBGArticulos.Columns[c].Color := clWindow
     else
        DBGArticulos.Columns[c].Color := clInactiveCaption;

     DBGArticulos.Columns[c].Title.Caption := format(_('Stock %s'), [Trim(EFAlmacen.Text)]);
  end;

  c := EncuentraField(DBGArticulos, 'STOCK2');
  if (c >= 0) then
  begin
     if CBCalcularStock.Checked and (Trim(EFAlmacen2.Text) <> '') then
        DBGArticulos.Columns[c].Color := clWindow
     else
        DBGArticulos.Columns[c].Color := clInactiveCaption;
     DBGArticulos.Columns[c].Title.Caption := format(_('Stock %s'), [Trim(EFAlmacen2.Text)]);
  end;

  c := EncuentraField(DBGArticulos, 'PEDIDOS_D_CLI1');
  if (c >= 0) then
  begin
     if CBCalcularPedidos.Checked and (Trim(EFAlmacen.Text) <> '') then
        DBGArticulos.Columns[c].Color := clWindow
     else
        DBGArticulos.Columns[c].Color := clInactiveCaption;
  end;

  c := EncuentraField(DBGArticulos, 'PEDIDOS_D_CLI2');
  if (c >= 0) then
  begin
     if CBCalcularPedidos.Checked and (Trim(EFAlmacen2.Text) <> '') then
        DBGArticulos.Columns[c].Color := clWindow
     else
        DBGArticulos.Columns[c].Color := clInactiveCaption;
  end;

  c := EncuentraField(DBGArticulos, 'PEDIDOS_A_PRO1');
  if (c >= 0) then
  begin
     if CBCalcularPedidos.Checked and (Trim(EFAlmacen.Text) <> '') then
        DBGArticulos.Columns[c].Color := clWindow
     else
        DBGArticulos.Columns[c].Color := clInactiveCaption;
  end;

  c := EncuentraField(DBGArticulos, 'PEDIDOS_A_PRO2');
  if (c >= 0) then
  begin
     if CBCalcularPedidos.Checked and (Trim(EFAlmacen2.Text) <> '') then
        DBGArticulos.Columns[c].Color := clWindow
     else
        DBGArticulos.Columns[c].Color := clInactiveCaption;
  end;

  c := EncuentraField(DBGArticulos, 'PRECIO');
  if (c >= 0) then
  begin
     if (Trim(EFTarifa.Text) > '') then
     begin
        DBGArticulos.Columns[c].Color := clWindow;
        DBGArticulos.Columns[c].Visible := True;
     end
     else
        DBGArticulos.Columns[c].Color := clInactiveCaption;
  end;

  c := EncuentraField(DBGArticulos, 'PRECIO_IVA_INCLUIDO');
  if (c >= 0) then
  begin
     if (Trim(EFTarifa.Text) > '') then
     begin
        DBGArticulos.Columns[c].Color := clWindow;
        DBGArticulos.Columns[c].Visible := True;
     end
     else
        DBGArticulos.Columns[c].Color := clInactiveCaption;
  end;

  TmrBusqueda.Interval := 250;
  // Si no calculo stocks/pedidos la respuesta debe ser inmediata
  if (((EFAlmacen.Text = '') and (EFAlmacen2.Text = '')) or ((not CBCalcularStock.Checked) and (not CBCalcularPedidos.Checked))) then
     TmrBusqueda.Interval := 50;

  TmrBusqueda.Enabled := True;
end;

procedure TFMSeleccionArticulo.xBusquedaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ResultadoBusqueda := xBusqueda.FieldByName('ARTICULO').AsString;
  TmrImagenArticulo.Enabled := True;
end;

procedure TFMSeleccionArticulo.EBusquedaKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
  if (Key = VK_DOWN) then
     DBGArticulos.SetFocus;
end;

procedure TFMSeleccionArticulo.DBGArticulosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
end;

procedure TFMSeleccionArticulo.EFSubFamiliaBusqueda(Sender: TObject);
begin
  inherited;
  EFSubFamilia.CondicionBusqueda := 'ID_FAMILIA = ' + IntToStr(DameIDFamilia(EFFamilia.Text));
end;

procedure TFMSeleccionArticulo.DBGArticulosDblClick(Sender: TObject);
begin
  inherited;
  TBOkClick(Sender);
end;

procedure TFMSeleccionArticulo.EFTarifaChange(Sender: TObject);
begin
  inherited;
  ETituloTarifa.Text := DameTituloTarifa(EFTarifa.Text, REntorno.Empresa);
  EBusquedaChange(Sender);
end;

procedure TFMSeleccionArticulo.EFMarcaChange(Sender: TObject);
begin
  inherited;
  EFTtuloMarca.Text := DameTituloMarcaModelo(StrToIntDef(EFMarca.Text, 0));
  EBusquedaChange(Sender);
end;

procedure TFMSeleccionArticulo.EFTipoArticuloChange(Sender: TObject);
begin
  inherited;
  EFTipoArticuloTitulo.Text := DameTituloTipoArticulo(EFTipoArticulo.Text);
  EBusquedaChange(Sender);
end;

procedure TFMSeleccionArticulo.InicializaDatos;
var
  i : integer;
begin
  // Asigno nombre a campos ALFA
  with DBGArticulos do
  begin
     for i := 1 to 8 do
     begin
        if (EncuentraField(DBGArticulos, Format('ALFA_%d', [i])) >= 0) then
           FindColumn(Format('ALFA_%d', [i])).Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
     end;
  end;
end;

procedure TFMSeleccionArticulo.FormActivate(Sender: TObject);
begin
  inherited;
  InicializaDatos;
end;

procedure TFMSeleccionArticulo.FormShow(Sender: TObject);
begin
  inherited;
  InicializaDatos;
  if REntorno.VerSoloArticulosDisponibles then
     CBSoloDisponibleVenta.Checked := True;
  EBusqueda.SetFocus;
end;

procedure TFMSeleccionArticulo.BSImilarClick(Sender: TObject);
var
  IdArticulo : integer;
begin
  inherited;
  IdArticulo := xBusquedaID_A.AsInteger;

  with xBusqueda do
  begin
     Close;
     if (Transaction.InTransaction) then
        Transaction.Commit;

     Transaction.StartTransaction;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT A.ID_A, A.ARTICULO, A.TITULO, ');
     SelectSQL.Add(' A.FAMILIA, F.TITULO TITULO_FAMILIA, ');
     SelectSQL.Add(' A.SUBFAMILIA, SF.TITULO TITULO_SUBFAMILIA, ');
     SelectSQL.Add(' A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8, A.ALTO, A.ANCHO, A.FONDO, ');
     SelectSQL.Add(' M.TITULO MARCA, ');
     SelectSQL.Add(' T.TITULO TIPO_ARTICULO, A.IMAGEN, ');
     if (EFTarifa.Text > '') then
     begin
        SelectSQL.Add(' (SELECT FIRST 1 ');
        SelectSQL.Add('                CASE ');
        SelectSQL.Add('                  WHEN (TT.IVA_INCLUIDO = 0) THEN ');
        SelectSQL.Add('                      PP.PRECIO_VENTA ');
        SelectSQL.Add('                  ELSE PP.PRECIO_VENTA / (1 + (I.P_IVA / 100)) ');
        SelectSQL.Add('                END ');
        SelectSQL.Add(' FROM ART_TARIFAS_PRECIOS PP ');
        SelectSQL.Add(' JOIN ART_TARIFAS_C TT ON TT.EMPRESA = PP.EMPRESA AND TT.TARIFA = PP.TARIFA ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' PP.EMPRESA = A.EMPRESA AND ');
        SelectSQL.Add(' PP.TARIFA = :TARIFA AND ');
        SelectSQL.Add(' PP.ARTICULO = A.ARTICULO ');
        SelectSQL.Add(' ORDER BY PP.LINEA) PRECIO, ');
        SelectSQL.Add(' -- ');
        SelectSQL.Add(' (SELECT FIRST 1 ');
        SelectSQL.Add('                CASE ');
        SelectSQL.Add('                  WHEN (TT.IVA_INCLUIDO = 0) THEN ');
        SelectSQL.Add('                      PP.PRECIO_VENTA + (PP.PRECIO_VENTA * I.P_IVA / 100) ');
        SelectSQL.Add('                  ELSE PP.PRECIO_VENTA ');
        SelectSQL.Add('                END ');
        SelectSQL.Add(' FROM ART_TARIFAS_PRECIOS PP ');
        SelectSQL.Add(' JOIN ART_TARIFAS_C TT ON TT.EMPRESA = PP.EMPRESA AND TT.TARIFA = PP.TARIFA ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' PP.EMPRESA = A.EMPRESA AND ');
        SelectSQL.Add(' PP.TARIFA = :TARIFA AND ');
        SelectSQL.Add(' PP.ARTICULO = A.ARTICULO ');
        SelectSQL.Add(' ORDER BY PP.LINEA) PRECIO_IVA_INCLUIDO, ');
     end
     else
     begin
        SelectSQL.Add(' 0.0 PRECIO, ');
        SelectSQL.Add(' 0.0 PRECIO_IVA_INCLUIDO, ');
     end;

     if (EFAlmacen.Text <> '') then
     begin
        if CBCalcularPedidos.Checked then
        begin
           SelectSQL.Add('        PC1.PEDIDOS_D_CLI PEDIDOS_D_CLI1, ');
           SelectSQL.Add('        PP1.PEDIDOS_A_PRO PEDIDOS_A_PRO1, ');
        end
        else
        begin
           SelectSQL.Add('        0.0 PEDIDOS_D_CLI1, ');
           SelectSQL.Add('        0.0 PEDIDOS_A_PRO1, ');
        end;
     end
     else
     begin
        SelectSQL.Add('        0.0 PEDIDOS_D_CLI1, ');
        SelectSQL.Add('        0.0 PEDIDOS_A_PRO1, ');
     end;

     if (EFAlmacen2.Text <> '') then
     begin
        if CBCalcularPedidos.Checked then
        begin
           SelectSQL.Add('        PC2.PEDIDOS_D_CLI PEDIDOS_D_CLI2, ');
           SelectSQL.Add('        PP2.PEDIDOS_A_PRO PEDIDOS_A_PRO2, ');
        end
        else
        begin
           SelectSQL.Add('        0.0 PEDIDOS_D_CLI2, ');
           SelectSQL.Add('        0.0 PEDIDOS_A_PRO2, ');
        end;
     end
     else
     begin
        SelectSQL.Add('        0.0 PEDIDOS_D_CLI2, ');
        SelectSQL.Add('        0.0 PEDIDOS_A_PRO2, ');
     end;

     SelectSQL.Add('        CAST(SUBSTRING((SELECT LIST(COALESCE(CODIGO_CLIENTE, ''---''), '', '') ');
     SelectSQL.Add('                        FROM ART_ARTICULOS_CODCLI ');
     SelectSQL.Add('                        WHERE ');
     SelectSQL.Add('                        EMPRESA = A.EMPRESA AND ');
     SelectSQL.Add('                        ARTICULO = A.ARTICULO ');
     if (StrToIntDef(EFCliente.Text, 0) <> 0) then
        SelectSQL.Add('                        AND CLIENTE = ' + EFCliente.Text);
     SelectSQL.Add('        ) FROM 1 FOR 256) AS VARCHAR(256)) CODIGO_CLIENTE, ');

     SelectSQL.Add('        CAST(SUBSTRING((SELECT LIST(COALESCE(CODIGO_PROVEEDOR, ''---''), '', '') ');
     SelectSQL.Add('                        FROM ART_ARTICULOS_CODPROV ');
     SelectSQL.Add('                        WHERE ');
     SelectSQL.Add('                        EMPRESA = A.EMPRESA AND ');
     SelectSQL.Add('                        ARTICULO = A.ARTICULO ');
     if (StrToIntDef(EFProveedor.Text, 0) <> 0) then
        SelectSQL.Add('                        AND PROVEEDOR = ' + EFProveedor.Text);
     SelectSQL.Add('        ) FROM 1 FOR 256) AS VARCHAR(256)) CODIGO_PROVEEDOR, ');
     SelectSQL.Add(' A.DISPONIBILIDAD, A.BAJA, A.BLOQUEO_VENTAS, A.BLOQUEO_COMPRAS ');

     SelectSQL.Add(' FROM VER_ARTICULOS_CUENTAS A ');
     SelectSQL.Add(' JOIN ART_FAMILIAS F ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.FAMILIA ');
     SelectSQL.Add(' JOIN SYS_TIPO_IVA I ON A.TIPO_IVA = I.TIPO AND A.PAIS = I.PAIS ');
     SelectSQL.Add(' LEFT JOIN ART_SUBFAMILIAS SF ON F.ID_FAMILIA = SF.ID_FAMILIA AND A.SUBFAMILIA = SF.SUBFAMILIA ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_MOD_MARCAS M ON M.ID_MARCA = A.ID_MARCA ');
     SelectSQL.Add(' LEFT JOIN SYS_TIPO_ARTICULO T ON T.TIPO = A.TIPO_ARTICULO ');

     if ((EFAlmacen.Text <> '') and (CBCalcularPedidos.Checked)) then
     begin
        SelectSQL.Add(' LEFT JOIN A_ART_DAME_PEDIDOS_CLI(A.EMPRESA, A.CANAL, :ALMACEN1, A.ARTICULO) PC1 ON 1 = 1 ');
        SelectSQL.Add(' LEFT JOIN A_ART_DAME_PEDIDOS_PRO(A.EMPRESA, A.CANAL, :ALMACEN1, A.ARTICULO) PP1 ON 1 = 1 ');
     end;

     if ((EFAlmacen2.Text <> '') and (CBCalcularPedidos.Checked)) then
     begin
        SelectSQL.Add(' LEFT JOIN A_ART_DAME_PEDIDOS_CLI(A.EMPRESA, A.CANAL, :ALMACEN2, A.ARTICULO) PC2 ON 1 = 1 ');
        SelectSQL.Add(' LEFT JOIN A_ART_DAME_PEDIDOS_PRO(A.EMPRESA, A.CANAL, :ALMACEN2, A.ARTICULO) PP2 ON 1 = 1 ');
     end;

     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' A.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' A.EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' A.CANAL = :CANAL AND ');
     SelectSQL.Add(' A.FAMILIA <> ''' + REntorno.FamSistema + ''' AND ');
     SelectSQL.Add(' ((A.ID_A = :ID_A) OR');
     SelectSQL.Add(' (A.ID_A IN (SELECT ID_A_SIMILAR FROM ART_ARTICULOS_SIMILARES ');
     SelectSQL.Add('             WHERE ');
     SelectSQL.Add('             ID_A = :ID_A)))');

     if (ColumnaOrden = -1) then
        SelectSQL.Add(' ORDER BY 2 /* ARTICULO */')
     else
     begin
        SelectSQL.Add(' ORDER BY ' + IntToStr(Abs(ColumnaOrden)));
        if (ColumnaOrden < 0) then
           SelectSQL.Add(' DESC ');
     end;

     DMMain.Log(SelectSQL.Text);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if ((EFAlmacen.Text <> '') and (CBCalcularPedidos.Checked)) then
     begin
        Params.ByName['ALMACEN1'].AsString := EFAlmacen.Text;
     end;
     if ((EFAlmacen2.Text <> '') and (CBCalcularPedidos.Checked)) then
     begin
        Params.ByName['ALMACEN2'].AsString := EFAlmacen2.Text;
     end;
     if (EFTarifa.Text > '') then
     begin
        Params.ByName['TARIFA'].AsString := EFTarifa.Text;
     end;
     Params.ByName['ID_A'].AsInteger := IdArticulo;
     Open;
  end;
end;

procedure TFMSeleccionArticulo.TmrImagenArticuloTimer(Sender: TObject);
begin
  inherited;
  TmrImagenArticulo.Enabled := False;
  RefrescarImagen(IArticulo, xBusquedaIMAGEN.AsInteger);
end;

procedure TFMSeleccionArticulo.DBGArticulosTitleClick(Column: TColumn);
begin
  inherited;
  // El ordenamiento debe hacerse a mano porque el SQL es complejo y tiene la sentencia ORDER BY dentro de subselects
  if (ColumnaOrden = Column.Field.FieldNo) then
     ColumnaOrden := ColumnaOrden * (-1)
  else
     ColumnaOrden := Column.Field.FieldNo;

  TmrBusqueda.Enabled := True;
end;

procedure TFMSeleccionArticulo.xBusquedaCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  Articulo : string;
  Canal : integer;
begin
  inherited;
  Articulo := xBusquedaARTICULO.AsString;
  if (CBCalcularStock.Checked) then
  begin
     {
     Canal := Param_MOVSTKC001;
     if (Canal = 0) then
        Canal := REntorno.Canal;
     }
     Canal := REntorno.Canal;

     Stock := 0;
     if (EFAlmacen.Text <> '') then
     begin
        with StockAlm do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, EFAlmacen.Text);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     xBusquedaSTOCK1.AsFloat := Stock;

     Stock := 0;
     if (EFAlmacen2.Text <> '') then
     begin
        with StockAlm2 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, EFAlmacen2.Text);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     xBusquedaSTOCK2.AsFloat := Stock;

     {
     Stock := 0;
     if (EFAlmacen3.Text <> '') then
     begin
        with StockAlm3 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, EFAlmacen3.Text);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     xBusquedaSTOCK3.AsFloat := Stock;
     }
  end
  else
  begin
     xBusquedaSTOCK1.AsFloat := 0;
     xBusquedaSTOCK2.AsFloat := 0;
     // xBusquedaSTOCK3.AsFloat := 0;
  end;
end;

end.
