unit UFMImpConEspCompras;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPImportaciones, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, StdCtrls, ULFMemo, ValEdit,
  Grids, ExtCtrls, TFlatCheckBoxUnit, ULFCheckBox, ComCtrls, ULFComboBox,
  ULFEdit, ULFLabel, ULFPageControl, UEditPanel, ToolWin, ULFToolBar,
  ULFPanel, Mask, rxToolEdit, ULFDateEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000;

type
  TFMImpConEspCompras = class(TFPImportaciones)
     LTipoCondicion: TLFLabel;
     CBTipoCondicion: TLFComboBox;
     BtImportar: TButton;
     CBModificar: TCheckBox;
     LProveedor: TLFLabel;
     ETituloProveedor: TLFEdit;
     LArticulo: TLFLabel;
     EFArticulo: TLFEditFind2000;
     ETituloArticulo: TLFEdit;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     ETituloFamilia: TLFEdit;
     LAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     ETituloAgrupacion: TLFEdit;
     LUdsMinimas: TLFLabel;
     EUdsMin: TLFEdit;
     LUdsMaximas: TLFLabel;
     EUdsMax: TLFEdit;
     LPrecio: TLFLabel;
     EPrecio: TLFEdit;
     LDescuentos: TLFLabel;
     EDesc1: TLFEdit;
     EDesc2: TLFEdit;
     EDesc3: TLFEdit;
     DEBaja: TLFDateEdit;
     LFechaBaja: TLFLabel;
     LFechaAlta: TLFLabel;
     DEAlta: TLFDateEdit;
     EFProveedor: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure BtImportarClick(Sender: TObject);
     procedure CBTipoCondicionChange(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFFamiliaChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     function ChequeaCondiciones: boolean;
     procedure EFAgrupacionBusqueda(Sender: TObject);
  private
     { Private declarations }
     TipoCondicion: string;
     ColProveedor, ColArticulo, ColFamilia, ColAgrupacion, ColAlta, ColBaja, ColUdsMin, ColUdsMax, ColPrecio, ColDesc1, ColDesc2, ColDesc3: integer;
  public
     { Public declarations }
  end;

var
  FMImpConEspCompras : TFMImpConEspCompras;

implementation

uses UFormGest, UDMMain, UEntorno, HYFIBQuery, UUtiles, UDameDato, UDMImpConEspCompras;

{$R *.dfm}

procedure TFMImpConEspCompras.FormCreate(Sender: TObject);
var
  Min, Max : TDateTime;
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  CBTipoCondicion.ItemIndex := 0;
  TipoCondicion := '';

  // Campos para importar a ART_CONDICIONES_C
  AgregaCampo('PROVEEDOR');
  AgregaCampo('ARTICULO');
  AgregaCampo('FAMILIA');
  AgregaCampo('AGRUPACION');
  AgregaCampo('ALTA');
  AgregaCampo('BAJA');

  // Campos para importar a ART_CONDICIONES_D
  AgregaCampo('UNID_MINIMAS');
  AgregaCampo('UNID_MAXIMAS');
  AgregaCampo('PRECIO');
  AgregaCampo('DESCUENTO');
  AgregaCampo('DESCUENTO_2');
  AgregaCampo('DESCUENTO_3');

  DameMinMax('EJE', Min, Max);
  DEAlta.Date := Min;
  DEBaja.Date := Max;
  EUdsMin.Text := '0';
  EUdsMax.Text := '1999999999';
end;

procedure TFMImpConEspCompras.EFProveedorChange(Sender: TObject);
begin
  inherited;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMImpConEspCompras.BtImportarClick(Sender: TObject);
var
  i : integer;
  Proveedor : integer;
  Articulo, Familia, Agrupacion : string;
  Perfil : string;
  Alta, Baja : TDateTime;
  UdsMin, UdsMax, Precio, Desc1, Desc2, Desc3 : double;
begin
  inherited;
  // Obtenemos Columna para cada dato
  ColProveedor := DameColumnaSegunCampo('PROVEEDOR');
  ColArticulo := DameColumnaSegunCampo('ARTICULO');
  ColFamilia := DameColumnaSegunCampo('FAMILIA');
  ColAgrupacion := DameColumnaSegunCampo('AGRUPACION');
  ColAlta := DameColumnaSegunCampo('ALTA');
  ColBaja := DameColumnaSegunCampo('BAJA');
  ColUdsMin := DameColumnaSegunCampo('UNID_MINIMAS');
  ColUdsMax := DameColumnaSegunCampo('UNID_MAXIMAS');
  ColPrecio := DameColumnaSegunCampo('PRECIO');
  ColDesc1 := DameColumnaSegunCampo('DESCUENTO');
  ColDesc2 := DameColumnaSegunCampo('DESCUENTO_2');
  ColDesc3 := DameColumnaSegunCampo('DESCUENTO_3');

  if ChequeaCondiciones then
  begin
     PBProgreso.Max := SGDatosImp.RowCount;
     PBProgreso.Visible := True;
     MLog.Lines.Add(format('Inicio importacion - %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
     for i := 1 to SGDatosImp.RowCount - 1 do  //Recorre todas las filas del grid
     begin
        PBProgreso.Position := i;
        LProgreso.Caption := _(format('Procesando linea %d', [i]));
        Application.ProcessMessages;

        try
           // Busco dato, si esta enlazado busco la columna de excel, si no lo esta busco el dato fijo
           if (ColProveedor >= 0) then
              Proveedor := StrToIntDef(SGDatosImp.Cells[ColProveedor, i], 0)
           else
              Proveedor := StrToIntDef(EFProveedor.Text, 0);

           if (ColArticulo >= 0) then
              Articulo := Trim(SGDatosImp.Cells[ColArticulo, i])
           else
              Articulo := EFArticulo.Text;

           if (ColFamilia >= 0) then
              Familia := Trim(SGDatosImp.Cells[ColFamilia, i])
           else
              Familia := EFFamilia.Text;

           if (ColAgrupacion >= 0) then
              Agrupacion := Trim(SGDatosImp.Cells[ColAgrupacion, i])
           else
              Agrupacion := EFAgrupacion.Text;

           if (ColAlta >= 0) then
              Alta := StrToDate(SGDatosImp.Cells[ColAlta, i])
           else
              Alta := DEAlta.Date;

           if (ColBaja >= 0) then
              Baja := StrToDate(SGDatosImp.Cells[ColBaja, i])
           else
              Baja := DEBaja.Date;

           if (ColUdsMin >= 0) then
              UdsMin := StrToFloatDec(SGDatosImp.Cells[ColUdsMin, i], ESeparadorDecimal.Text[1])
           else
              UdsMin := StrToFloatDef(EUdsMin.Text, 0);

           if (ColUdsMax >= 0) then
              UdsMax := StrToFloatDec(SGDatosImp.Cells[ColUdsMax, i], ESeparadorDecimal.Text[1])
           else
              UdsMax := StrToFloatDef(EUdsMax.Text, 0);

           if (ColPrecio >= 0) then
              Precio := StrToFloatDec(SGDatosImp.Cells[ColPrecio, i], ESeparadorDecimal.Text[1])
           else
              Precio := StrToFloatDef(EPrecio.Text, 0);

           if (ColDesc1 >= 0) then
              Desc1 := StrToFloatDec(SGDatosImp.Cells[ColDesc1, i], ESeparadorDecimal.Text[1])
           else
              Desc1 := StrToFloatDef(EDesc1.Text, 0);

           if (ColDesc2 >= 0) then
              Desc2 := StrToFloatDec(SGDatosImp.Cells[ColDesc2, i], ESeparadorDecimal.Text[1])
           else
              Desc2 := StrToFloatDef(EDesc2.Text, 0);

           if (ColDesc3 >= 0) then
              Desc3 := StrToFloatDec(SGDatosImp.Cells[ColDesc3, i], ESeparadorDecimal.Text[1])
           else
              Desc3 := StrToFloatDef(EDesc3.Text, 0);

           // Para acelerar inserción de muchas líneas  BeginUpdate..EndUpdate
           MLog.Lines.BeginUpdate;
           MLog.Lines.Add(format(_('Linea %d - Insertando condicion de compra'), [i]));
           MLog.Lines.Add(format('Tipo: %s', [TipoCondicion]));
           MLog.Lines.Add(format('Proveedor: %d', [Proveedor]));
           MLog.Lines.Add(format('Articulo: %s', [Articulo]));
           MLog.Lines.Add(format('Familia: %s', [Familia]));
           MLog.Lines.Add(format('Agrupacion: %s', [Agrupacion]));
           MLog.Lines.Add(format('Alta: %s', [FormatDateTime(ShortDateFormat, Alta)]));
           MLog.Lines.Add(format('Baja: %s', [FormatDateTime(ShortDateFormat, Baja)]));
           MLog.Lines.Add(format('UdsMin: %.2f', [UdsMin]));
           MLog.Lines.Add(format('UdsMax: %.2f', [UdsMax]));
           MLog.Lines.Add(format('Precio: %.2f', [Precio]));
           MLog.Lines.Add(format('Desc1: %.2f', [Desc1]));
           MLog.Lines.Add(format('Desc2: %.2f', [Desc2]));
           MLog.Lines.Add(format('Desc3: %.2f', [Desc3]));
           MLog.Lines.EndUpdate;

           try
              DMImpConEspCompras.InsertaCondicionEspecialCompra(TipoCondicion, Proveedor, Articulo, Familia, Agrupacion, Alta, Baja, UdsMin, UdsMax, Precio, Desc1, Desc2, Desc3, CBModificar.Checked);
           except
              on E: Exception do
              begin
                 MLog.Lines.Add(format(_('Linea %d - Error importando linea de compra'), [i]) + #13#10 + e.Message);
              end;
           end;
        except
           on E: Exception do
           begin
              MLog.Lines.Add(format(_('Linea %d - Error obteniendo datos a importar en las compras.'), [i]) + #13#10 + e.Message);
           end;
        end;

        MLog.Lines.Add('');
     end;

     MLog.Lines.Add(format('Importacion de Compra Finalizada - %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
     LProgreso.Caption := _('Importacion de Compra Finalizada');
     PBProgreso.Position := 0;
     PBProgreso.Visible := False;
  end;
end;

function TFMImpConEspCompras.ChequeaCondiciones: boolean;
begin
  /// Chequea condiciones necesarias para importar

  Result := True;
  if (CBTipoCondicion.ItemIndex = 0) then
  begin
     MessageDlg(_('Debe escoger un tipo de condicion a importar'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if ((DameColumnaSegunCampo('PROVEEDOR') < 0) and (EFProveedor.Text = '') and (CBTipoCondicion.ItemIndex in [1, 2, 3, 4])) then
  begin
     MessageDlg(_('Debe escoger un Proveedor o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if ((DameColumnaSegunCampo('ARTICULO') < 0) and (EFArticulo.Text = '') and (CBTipoCondicion.ItemIndex in [1, 3])) then
  begin
     MessageDlg(_('Debe escoger un Articulo o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if ((DameColumnaSegunCampo('FAMILIA') < 0) and (EFFamilia.Text = '') and (CBTipoCondicion.ItemIndex = 2)) then
  begin
     MessageDlg(_('Debe escoger una Familia o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;
end;

procedure TFMImpConEspCompras.CBTipoCondicionChange(Sender: TObject);
begin
  inherited;
  case CBTipoCondicion.ItemIndex of
     0: TipoCondicion := ''; // No seleccionada
     1: TipoCondicion := 'PRA'; // Condicion Proveedor / Artículo
     2: TipoCondicion := 'PRF'; // Condicion Proveedor / Familia
     3: TipoCondicion := 'PRG'; // Condicion Proveedor / Agrupación de Artículo
     4: TipoCondicion := 'PRU'; // Condicion Proveedor / Agrupación de Proveedores
  end;
end;

procedure TFMImpConEspCompras.EFArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TFMImpConEspCompras.EFFamiliaChange(Sender: TObject);
begin
  inherited;
  ETituloFamilia.Text := DameTituloFamilia(EFFamilia.Text);
end;

procedure TFMImpConEspCompras.EFAgrupacionChange(Sender: TObject);
begin
  inherited;
  if (TipoCondicion = 'PRU') then
     ETituloAgrupacion.Text := DameTituloAgrupacion('P', EFAgrupacion.Text);
  if (TipoCondicion = 'PRG') then
     ETituloAgrupacion.Text := DameTituloAgrupacion('A', EFAgrupacion.Text);
end;

procedure TFMImpConEspCompras.EFAgrupacionBusqueda(Sender: TObject);
begin
  inherited;
  if (TipoCondicion = 'PRU') then
     EFAgrupacion.CondicionBusqueda := 'TIPO=''P''';
  if (TipoCondicion = 'PRG') then
     EFAgrupacion.CondicionBusqueda := 'TIPO=''A''';
end;

end.
