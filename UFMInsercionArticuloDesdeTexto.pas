unit UFMInsercionArticuloDesdeTexto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFToolBar, ULFEdit, ULFPanel, ULFCheckBox,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, ULFMemo,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UEditPanel, ULFDBCheckBox, ULFComboBox,
  Grids;

type
  TFMInsercionArticuloDesdeTexto = class(TFPEditSinNavegador)
     TButtInserta: TToolButton;
     MemListaArticulos: TLFMemo;
     chModifica: TLFCheckBox;
     TButtSep1: TToolButton;
     PNLConfiguracion: TLFPanel;
     CBCampo1: TLFComboBox;
     CBCampo2: TLFComboBox;
     CBCampo3: TLFComboBox;
     CBCampo4: TLFComboBox;
     CBCampo5: TLFComboBox;
     CBCampo6: TLFComboBox;
     CBCampo7: TLFComboBox;
     CBCampo8: TLFComboBox;
     LCampo1: TLFLabel;
     LCampo2: TLFLabel;
     LCampo3: TLFLabel;
     LCampo4: TLFLabel;
     LCampo5: TLFLabel;
     LCampo6: TLFLabel;
     LCampo7: TLFLabel;
     LCampo8: TLFLabel;
     LSeparador: TLFLabel;
     ESeparador: TLFEdit;
     DBCBTabulador: TLFDBCheckBox;
     CBIgnorarPrimeraLinea: TLFCheckBox;
     SGPrevisualizacion: TStringGrid;
     TSep2: TToolButton;
     TButtPrevisualizar: TToolButton;
     Split: TSplitter;
     LCodigosIgnorar: TLFLabel;
     ECodIgnorar1: TLFEdit;
     ECodIgnorar2: TLFEdit;
     ECodIgnorar3: TLFEdit;
     ECodIgnorar4: TLFEdit;
     ECodIgnorar5: TLFEdit;
     LNoCrearEscandallo: TLFLabel;
     ENoCrearEscandallo1: TLFEdit;
     ENoCrearEscandallo2: TLFEdit;
     ENoCrearEscandallo3: TLFEdit;
     ENoCrearEscandallo4: TLFEdit;
     ENoCrearEscandallo5: TLFEdit;
     PNLProgreso: TLFPanel;
     LProgreso: TLFLabel;
     PBProgreso: TProgressBar;
     CBIgnorarUnidadesCero: TLFCheckBox;
     procedure TButtInsertaClick(Sender: TObject);
     procedure DBCBTabuladorChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure TButtPrevisualizarClick(Sender: TObject);
     procedure PMainResize(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure CadenaDelimitada(var cadena: array of string; const Value, delimiter: string; num_camps: integer);
     procedure RellenaCampos(Lista: TStrings);
     procedure RefrescaItemIndex;
     procedure Insertar(Previsualizar: boolean = False);
  public
     { Public declarations }
     DM: TDataModule;
  end;

var
  FMInsercionArticuloDesdeTexto : TFMInsercionArticuloDesdeTexto;

implementation

uses UDMMovManStock, UDMOfertas, UDMPedidos, UDMAlbaranes, UDMFacturas, UDMPropuestas,
  UDMPropuestasConfirm, UDMPedidosAProveedor, UDMAlbaranesAProveedor, UDMFacturasAProveedor,
  UProDMEscandallo, UEntorno, UUtiles;

{$R *.dfm}

const
  CantidadDatos = 15;

procedure TFMInsercionArticuloDesdeTexto.FormCreate(Sender: TObject);
begin
  inherited;
  RellenaCampos(CBCampo1.Items);
  RellenaCampos(CBCampo2.Items);
  RellenaCampos(CBCampo3.Items);
  RellenaCampos(CBCampo4.Items);
  RellenaCampos(CBCampo5.Items);
  RellenaCampos(CBCampo6.Items);
  RellenaCampos(CBCampo7.Items);
  RellenaCampos(CBCampo8.Items);

  PNLProgreso.Visible := False;
  PMainResize(Sender);
end;

procedure TFMInsercionArticuloDesdeTexto.TButtInsertaClick(Sender: TObject);
begin
  inherited;
  Insertar;
end;

procedure TFMInsercionArticuloDesdeTexto.TButtPrevisualizarClick(Sender: TObject);
begin
  inherited;
  Insertar(True);
end;

procedure TFMInsercionArticuloDesdeTexto.Insertar(Previsualizar: boolean = False);
var
  i, j, l : integer;
  PrimeraLinea : integer;
  delimitador : string;
  num_camps : integer;
  cadena : array of string;
  IdxArticulo, IdxUnidades, IdxLote, IdxIdUbicacion, IdxPrecio, IdxDescripcion : integer;
  IdxFamilia, IdxSubFamilia, IdxProveedor, IdxCodProveedor, IdxPCoste : integer;
  IdxDescuento1, IdxDescuento2, IdxDescuento3, IdxFechaPrevista : integer;
  Articulo : string;
  Unidades : double;
  Lote : string;
  IdUbicacion : integer;
  Precio : double;
  PCoste : double;
  Descuento1 : double;
  Descuento2 : double;
  Descuento3 : double;
  FechaPrevista : TDateTime;
  Descripcion : string;
  Familia : string;
  Subfamilia : string;
  Proveedor : integer;
  CodProveedor : string;
  CodIgnorar : array[0..4] of string;
  NoCrearEscandallo : array[0..4] of string;

  function DameIdxCampo(Id: integer): integer;
  begin
     Result := -1;
     if (CBCampo1.ItemIndex = Id) then
        Result := 0;
     if (CBCampo2.ItemIndex = Id) then
        Result := 1;
     if (CBCampo3.ItemIndex = Id) then
        Result := 2;
     if (CBCampo4.ItemIndex = Id) then
        Result := 3;
     if (CBCampo5.ItemIndex = Id) then
        Result := 4;
     if (CBCampo6.ItemIndex = Id) then
        Result := 5;
     if (CBCampo7.ItemIndex = Id) then
        Result := 6;
     if (CBCampo8.ItemIndex = Id) then
        Result := 7;
  end;

begin
  RefrescaItemIndex;

  IdxArticulo := DameIdxCampo(1);
  IdxUnidades := DameIdxCampo(2);
  IdxLote := DameIdxCampo(3);
  IdxIdUbicacion := DameIdxCampo(4);
  IdxPrecio := DameIdxCampo(5);
  IdxDescripcion := DameIdxCampo(6);
  IdxFamilia := DameIdxCampo(7);
  IdxSubFamilia := DameIdxCampo(8);
  IdxProveedor := DameIdxCampo(9);
  IdxCodProveedor := DameIdxCampo(10);
  IdxPCoste := DameIdxCampo(11);
  IdxDescuento1 := DameIdxCampo(12);
  IdxDescuento2 := DameIdxCampo(13);
  IdxDescuento3 := DameIdxCampo(14);
  IdxFechaPrevista := DameIdxCampo(15);

  CodIgnorar[0] := ECodIgnorar1.Text;
  CodIgnorar[1] := ECodIgnorar2.Text;
  CodIgnorar[2] := ECodIgnorar3.Text;
  CodIgnorar[3] := ECodIgnorar4.Text;
  CodIgnorar[4] := ECodIgnorar5.Text;

  NoCrearEscandallo[0] := ENoCrearEscandallo1.Text;
  NoCrearEscandallo[1] := ENoCrearEscandallo2.Text;
  NoCrearEscandallo[2] := ENoCrearEscandallo3.Text;
  NoCrearEscandallo[3] := ENoCrearEscandallo4.Text;
  NoCrearEscandallo[4] := ENoCrearEscandallo5.Text;

  with SGPrevisualizacion do
  begin
     RowCount := 2;
     RowCount := 100;
     ColCount := CantidadDatos;

     // Para borrar contenido
     for i := 0 to ColCount - 1 do
        for j := 0 to RowCount - 1 do
           Cells[i, j] := '';

     // Titulos de columna
     Cells[0, 0] := 'Articulo';
     Cells[1, 0] := 'Unidades';
     Cells[2, 0] := 'Lote';
     Cells[3, 0] := 'IdUbicacion';
     Cells[4, 0] := 'Precio';
     Cells[5, 0] := 'Descripcion';
     Cells[6, 0] := 'Familia';
     Cells[7, 0] := 'Subfamilia';
     Cells[8, 0] := 'Proveedor';
     Cells[9, 0] := 'CodProveedor';
     Cells[10, 0] := 'PCoste';
     Cells[11, 0] := 'Desc. 1';
     Cells[12, 0] := 'Desc. 2';
     Cells[13, 0] := 'Desc. 3';
     Cells[14, 0] := 'FecEntrega';
  end;

  delimitador := ESeparador.Text;
  if (DBCBTabulador.Checked) then
     delimitador := #9;

  // Numero de ComboBox disponibles.
  num_camps := 8;
  SetLength(cadena, num_camps);

  PrimeraLinea := 0;
  if CBIgnorarPrimeraLinea.Checked then
     PrimeraLinea := 1;
  PNLProgreso.Visible := True;
  PBProgreso.Max := MemListaArticulos.Lines.Count;
  try
     for i := PrimeraLinea to MemListaArticulos.Lines.Count - 1 do
     begin
        PBProgreso.Position := i;
        Application.ProcessMessages;

        CadenaDelimitada(cadena, MemListaArticulos.Lines[i], delimitador, num_camps - 1);

        Articulo := REntorno.ArtTextoLibre;
        Unidades := 1;
        Lote := '';
        IdUbicacion := -1;
        Precio := -1;
        Descripcion := '';
        Familia := '';
        Subfamilia := '';
        Proveedor := 0;
        CodProveedor := '';
        PCoste := -1;
        Descuento1 := -1;
        Descuento2 := -1;
        Descuento3 := -1;
        FechaPrevista := 0;

        if (IdxArticulo <> -1) then
           Articulo := cadena[IdxArticulo];
        if (IdxUnidades <> -1) then
           Unidades := StrToFloat(cadena[IdxUnidades]);
        if (idxLote <> -1) then
           Lote := cadena[IdxLote];
        if (IdxIdUbicacion <> -1) then
           IdUbicacion := StrToInt(cadena[IdxIdUbicacion]);
        if (IdxPrecio <> -1) then
           Precio := StrToFloat(cadena[IdxPrecio]);
        if (IdxDescripcion <> -1) then
           Descripcion := cadena[IdxDescripcion];
        if (idxFamilia <> -1) then
           Familia := cadena[IdxFamilia];
        if (IdxSubFamilia <> -1) then
           Subfamilia := cadena[IdxSubFamilia];
        if (idxProveedor <> -1) then
           Proveedor := StrToInt(cadena[IdxProveedor]);
        if (IdxCodProveedor <> -1) then
           CodProveedor := cadena[IdxCodProveedor];
        if (IdxPCoste <> -1) then
           PCoste := StrToFloat(cadena[IdxPCoste]);
        if (IdxDescuento1 <> -1) then
           Descuento1 := StrToFloat(cadena[IdxDescuento1]);
        if (IdxDescuento2 <> -1) then
           Descuento2 := StrToFloat(cadena[IdxDescuento2]);
        if (IdxDescuento3 <> -1) then
           Descuento3 := StrToFloat(cadena[IdxDescuento3]);
        if (IdxFechaPrevista <> -1) then
           FechaPrevista := StrToDate(cadena[IdxFechaPrevista]);

        for j := 0 to 4 do
        begin
           if (Pos(CodIgnorar[j], Articulo) > 0) then
              Articulo := '';
        end;

        if CBIgnorarUnidadesCero.Checked and (Unidades = 0) then
           Articulo := '';

        if (Articulo <> '') then
        begin
           if Previsualizar then
           begin
              // Relleno con primeros 10 registros
              if (i < 100) then
              begin
                 l := i;
                 if (PrimeraLinea = 0) then
                    l := i + 1;
                 with SGPrevisualizacion do
                 begin
                    Cells[0, l] := Articulo;
                    Cells[1, l] := Format('%.2f', [Unidades]);
                    Cells[2, l] := Lote;
                    Cells[3, l] := IntToStr(IdUbicacion);

                    if (Precio >= 0) then
                       Cells[4, l] := Format('%.2f', [Precio])
                    else
                       Cells[4, l] := '-';

                    Cells[5, l] := Descripcion;
                    Cells[6, l] := Familia;
                    Cells[7, l] := Subfamilia;
                    Cells[8, l] := IntToStr(Proveedor);
                    Cells[9, l] := CodProveedor;

                    if (PCoste >= 0) then
                       Cells[10, l] := Format('%.2f', [PCoste])
                    else
                       Cells[10, l] := '-';

                    if (Descuento1 >= 0) then
                       Cells[11, l] := Format('%.2f', [Descuento1])
                    else
                       Cells[11, l] := '-';

                    if (Descuento2 >= 0) then
                       Cells[12, l] := Format('%.2f', [Descuento2])
                    else
                       Cells[12, l] := '-';

                    if (Descuento3 >= 0) then
                       Cells[13, l] := Format('%.2f', [Descuento3])
                    else
                       Cells[13, l] := '-';

                    if (FechaPrevista > 0) then
                       Cells[14, l] := DateToStr(FechaPrevista)
                    else
                       Cells[14, l] := '';
                 end;
              end;
           end
           else
           begin
              if (DM is TDMMovManStock) then
                 TDMMovManStock(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste);
              if (DM is TDMOfertas) then
                 TDMOfertas(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TDMPedidos) then
                 TDMPedidos(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TDMAlbaranes) then
                 TDMAlbaranes(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TDMFacturas) then
                 TDMFacturas(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TDMPropuestas) then
                 TDMPropuestas(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TDMPropuestasConfirm) then
                 TDMPropuestasConfirm(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TDMPedidosAProveedor) then
                 TDMPedidosAProveedor(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TDMAlbaranesAProveedor) then
                 TDMAlbaranesAProveedor(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TDMFacturasAProveedor) then
                 TDMFacturasAProveedor(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista);
              if (DM is TProDMEscandallo) then
                 TProDMEscandallo(DM).InsertaMaterial(Articulo, Descripcion, Familia, Subfamilia, CodProveedor, Unidades, Precio, Proveedor, PCoste, NoCrearEscandallo);
           end;
        end;
     end;
  finally
     PNLProgreso.Visible := False;
  end;

  if (not Previsualizar) then
  begin
     MemListaArticulos.Lines.Clear;
     ShowMessage(_('Importación realizada'));
     Close;
  end;
end;

procedure TFMInsercionArticuloDesdeTexto.CadenaDelimitada(var cadena: array of string; const Value, delimiter: string; num_camps: integer);
var
  dx, i : integer;
  ns : string;
  txt : string;
  delta : integer;
begin
  // S'inicialitza l'array
  i := 0;
  while (i <= num_camps) do
  begin
     cadena[i] := '0';
     Inc(i);
  end;

  i := 0;
  delta := Length(delimiter);
  txt := Value + delimiter;
  while ((Length(txt) > 0) and (i <= num_camps)) do
  begin
     dx := Pos(delimiter, txt);
     ns := Copy(txt, 0, dx - 1);
     cadena[i] := Trim(ns);
     Inc(i);
     txt := Copy(txt, dx + delta, MaxInt);
  end;
end;

procedure TFMInsercionArticuloDesdeTexto.DBCBTabuladorChange(Sender: TObject);
begin
  inherited;
  if (DBCBTabulador.Checked) then
  begin
     ESeparador.Enabled := False;
     ESeparador.Text := '[TAB]';
  end
  else
  begin
     ESeparador.Enabled := True;
     ESeparador.Text := ';';
  end;
end;

procedure TFMInsercionArticuloDesdeTexto.FormActivate(Sender: TObject);
begin
  inherited;
  RefrescaItemIndex;
end;

procedure TFMInsercionArticuloDesdeTexto.RefrescaItemIndex;
begin
  inherited;
  // Reviso la propiedad ItemIndex. Al crear el formulario se recuerdan los textos, pero no los indices.
  CBCampo1.ItemIndex := CBCampo1.Items.IndexOf(CBCampo1.Text);
  CBCampo2.ItemIndex := CBCampo2.Items.IndexOf(CBCampo2.Text);
  CBCampo3.ItemIndex := CBCampo3.Items.IndexOf(CBCampo3.Text);
  CBCampo4.ItemIndex := CBCampo4.Items.IndexOf(CBCampo4.Text);
  CBCampo5.ItemIndex := CBCampo5.Items.IndexOf(CBCampo5.Text);
  CBCampo6.ItemIndex := CBCampo6.Items.IndexOf(CBCampo6.Text);
  CBCampo7.ItemIndex := CBCampo7.Items.IndexOf(CBCampo7.Text);
  CBCampo8.ItemIndex := CBCampo8.Items.IndexOf(CBCampo8.Text);

  CBCampo1.Text := CBCampo1.Items[CBCampo1.ItemIndex];
  CBCampo2.Text := CBCampo2.Items[CBCampo2.ItemIndex];
  CBCampo3.Text := CBCampo3.Items[CBCampo3.ItemIndex];
  CBCampo4.Text := CBCampo4.Items[CBCampo4.ItemIndex];
  CBCampo5.Text := CBCampo5.Items[CBCampo5.ItemIndex];
  CBCampo6.Text := CBCampo6.Items[CBCampo6.ItemIndex];
  CBCampo7.Text := CBCampo7.Items[CBCampo7.ItemIndex];
  CBCampo8.Text := CBCampo8.Items[CBCampo8.ItemIndex];
end;

procedure TFMInsercionArticuloDesdeTexto.RellenaCampos(Lista: TStrings);
begin
  Lista.Clear;
  Lista.AddObject(_('No importar'), Pointer(0));
  Lista.AddObject(_('Artículo'), Pointer(0));
  Lista.AddObject(_('Unidades'), Pointer(0));
  Lista.AddObject(_('Lote'), Pointer(0));
  Lista.AddObject(_('Id Ubicacion'), Pointer(0));
  Lista.AddObject(_('Precio'), Pointer(0));
  Lista.AddObject(_('Descripcion'), Pointer(0));
  Lista.AddObject(_('Familia'), Pointer(0));
  Lista.AddObject(_('Subfamilia'), Pointer(0));
  Lista.AddObject(_('Proveedor'), Pointer(0));
  Lista.AddObject(_('Ref. Proveedor'), Pointer(0));
  Lista.AddObject(_('P. Coste'), Pointer(0));
  Lista.AddObject(_('Descuento 1'), Pointer(0));
  Lista.AddObject(_('Descuento 2'), Pointer(0));
  Lista.AddObject(_('Descuento 3'), Pointer(0));
  Lista.AddObject(_('Fec. Prevista'), Pointer(0));
end;

procedure TFMInsercionArticuloDesdeTexto.PMainResize(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with SGPrevisualizacion do
  begin
     for i := 0 to ColCount - 1 do
     begin
        SGPrevisualizacion.ColWidths[i] := (PMain.Width - 30) div CantidadDatos;
     end;
  end;
end;

procedure TFMInsercionArticuloDesdeTexto.FormShow(Sender: TObject);
var
  DMName : string;
begin
  inherited;

  DMName := '';
  if Assigned(DM) then
  begin
     LNoCrearEscandallo.Visible := (DM is TProDMEscandallo);
     ENoCrearEscandallo1.Visible := (DM is TProDMEscandallo);
     ENoCrearEscandallo2.Visible := (DM is TProDMEscandallo);
     ENoCrearEscandallo3.Visible := (DM is TProDMEscandallo);
     ENoCrearEscandallo4.Visible := (DM is TProDMEscandallo);
     ENoCrearEscandallo5.Visible := (DM is TProDMEscandallo);

     DMName := DM.Name;
  end;

  CBCampo1.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo1', '');
  CBCampo2.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo2', '');
  CBCampo3.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo3', '');
  CBCampo4.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo4', '');
  CBCampo5.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo5', '');
  CBCampo6.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo6', '');
  CBCampo7.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo7', '');
  CBCampo8.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo8', '');

  CBIgnorarPrimeraLinea.Checked := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBIgnorarPrimeraLinea', True);
  CBIgnorarUnidadesCero.Checked := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBIgnorarUnidadesCero', True);
  DBCBTabulador.Checked := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'DBCBTabulador', False);
  ESeparador.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ESeparador', '');

  ECodIgnorar1.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar1', '');
  ECodIgnorar2.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar2', '');
  ECodIgnorar3.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar3', '');
  ECodIgnorar4.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar4', '');
  ECodIgnorar5.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar5', '');

  ENoCrearEscandallo1.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo1', '');
  ENoCrearEscandallo2.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo2', '');
  ENoCrearEscandallo3.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo3', '');
  ENoCrearEscandallo4.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo4', '');
  ENoCrearEscandallo5.Text := LeeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo5', '');
end;

procedure TFMInsercionArticuloDesdeTexto.FormClose(Sender: TObject; var Action: TCloseAction);
var
  DMName : string;
begin
  inherited;

  DMName := '';
  if Assigned(DM) then
     DMName := DM.Name;

  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo1', CBCampo1.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo2', CBCampo2.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo3', CBCampo3.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo4', CBCampo4.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo5', CBCampo5.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo6', CBCampo6.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo7', CBCampo7.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBCampo8', CBCampo8.Text);

  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBIgnorarPrimeraLinea', CBIgnorarPrimeraLinea.Checked);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'CBIgnorarUnidadesCero', CBIgnorarUnidadesCero.Checked);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'DBCBTabulador', DBCBTabulador.Checked);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ESeparador', ESeparador.Text);

  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar1', ECodIgnorar1.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar2', ECodIgnorar2.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar3', ECodIgnorar3.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar4', ECodIgnorar4.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ECodIgnorar5', ECodIgnorar5.Text);

  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo1', ENoCrearEscandallo1.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo2', ENoCrearEscandallo2.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo3', ENoCrearEscandallo3.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo4', ENoCrearEscandallo4.Text);
  EscribeDatoIni('FMInsercionArticuloDesdeTexto' + '-' + DMName, 'ENoCrearEscandallo5', ENoCrearEscandallo5.Text);
end;

end.
