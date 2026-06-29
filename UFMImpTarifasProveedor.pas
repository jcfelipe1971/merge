unit UFMImpTarifasProveedor;

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
  TFMImpTarifasProveedor = class(TFPImportaciones)
     BtImportar: TButton;
     CBModificar: TCheckBox;
     LProveedor: TLFLabel;
     ETituloProveedor: TLFEdit;
     LArticulo: TLFLabel;
     EFArticulo: TLFEditFind2000;
     ETituloArticulo: TLFEdit;
     LTarifa: TLFLabel;
     LCodProveedor: TLFLabel;
     ECodProveedor: TLFEdit;
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
     ETarifa: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure BtImportarClick(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     function ChequeaCondiciones: boolean;
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
     ColProveedor, ColTarifa, ColAlta, ColBaja, ColDesc1, ColDesc2, ColDesc3, ColArticulo, ColCodProveedor, ColPrecio: integer;
  public
     { Public declarations }
     procedure Inicializar(Proveedor: integer; Tarifa: string; Alta, Baja: TDateTime; Desc1, Desc2, Desc3: double);
  end;

var
  FMImpTarifasProveedor : TFMImpTarifasProveedor;

implementation

uses UFormGest, UDMMain, UEntorno, HYFIBQuery, UUtiles, UDameDato, UDMImpTarifasProveedor;

{$R *.dfm}

procedure TFMImpTarifasProveedor.FormCreate(Sender: TObject);
var
  Min, Max : TDateTime;
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AgregaCampo('PROVEEDOR');
  AgregaCampo('TARIFA');
  AgregaCampo('ALTA');
  AgregaCampo('BAJA');
  AgregaCampo('ARTICULO');
  AgregaCampo('COD_ART_PROV');
  AgregaCampo('PRECIO');

  DameMinMax('EJE', Min, Max);
  DEAlta.Date := Min;
  DEBaja.Date := Max;
end;

procedure TFMImpTarifasProveedor.FormDestroy(Sender: TObject);
begin
  inherited;
  FMImpTarifasProveedor := nil;
end;

procedure TFMImpTarifasProveedor.EFProveedorChange(Sender: TObject);
begin
  inherited;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMImpTarifasProveedor.EFArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TFMImpTarifasProveedor.BtImportarClick(Sender: TObject);
var
  i : integer;
  Proveedor : integer;
  Articulo, Tarifa, CodProveedor : string;
  Alta, Baja : TDateTime;
  Precio, Desc1, Desc2, Desc3 : double;
begin
  inherited;
  // Obtenemos Columna para cada dato
  ColProveedor := DameColumnaSegunCampo('PROVEEDOR');
  ColTarifa := DameColumnaSegunCampo('TARIFA');
  ColAlta := DameColumnaSegunCampo('ALTA');
  ColBaja := DameColumnaSegunCampo('BAJA');
  ColDesc1 := DameColumnaSegunCampo('DESCUENTO');
  ColDesc2 := DameColumnaSegunCampo('DESCUENTO_2');
  ColDesc3 := DameColumnaSegunCampo('DESCUENTO_3');
  ColArticulo := DameColumnaSegunCampo('ARTICULO');
  ColCodProveedor := DameColumnaSegunCampo('COD_ART_PROV');
  ColPrecio := DameColumnaSegunCampo('PRECIO');

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

        Proveedor := 0;
        Tarifa := '';
        Alta := 0;
        Baja := 0;
        Articulo := '';
        CodProveedor := '';
        Precio := 0;
        Desc1 := 0;
        Desc2 := 0;
        Desc3 := 0;

        try
           // Busco dato, si esta enlazado busco la columna de excel, si no lo esta busco el dato fijo
           if (ColProveedor >= 0) then
              Proveedor := StrToIntDef(SGDatosImp.Cells[ColProveedor, i], 0)
           else
              Proveedor := StrToIntDef(EFProveedor.Text, 0);

           if (ColTarifa >= 0) then
              Tarifa := SGDatosImp.Cells[ColTarifa, i]
           else
              Tarifa := ETarifa.Text;

           if (ColAlta >= 0) then
              Alta := StrToDate(SGDatosImp.Cells[ColAlta, i])
           else
              Alta := DEAlta.Date;

           if (ColBaja >= 0) then
              Baja := StrToDate(SGDatosImp.Cells[ColBaja, i])
           else
              Baja := DEBaja.Date;

           if (ColArticulo >= 0) then
              Articulo := Trim(SGDatosImp.Cells[ColArticulo, i])
           else
              Articulo := EFArticulo.Text;

           if (ColCodProveedor >= 0) then
              CodProveedor := UpperCase(Trim(SGDatosImp.Cells[ColCodProveedor, i]))
           else
              CodProveedor := UpperCase(ECodProveedor.Text);

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

           if (Articulo = '') then
           begin
              Articulo := DMImpTarifasProveedor.DameArticulo(Proveedor, CodProveedor);
           end;

           if (Articulo <> '') and (Precio <> 0) then
           begin
              try
                 DMImpTarifasProveedor.InsertaTarifa(Proveedor, Tarifa, Alta, Baja, Desc1, Desc2, Desc3, Articulo, CodProveedor, Precio, CBModificar.Checked);
              except
                 on E: Exception do
                 begin
                    // Para acelerar inserción de muchas líneas  BeginUpdate..EndUpdate
                    MLog.Lines.BeginUpdate;
                    MLog.Lines.Add(format(_('Linea %d - Error importando Tarifa de compra'), [i]) + #13#10 + e.Message);
                    MLog.Lines.Add(format('      ' + 'Tarifa: %s', [Tarifa]));
                    MLog.Lines.Add(format('      ' + 'Proveedor: %d', [Proveedor]));
                    MLog.Lines.Add(format('      ' + 'Alta: %s', [FormatDateTime(ShortDateFormat, Alta)]));
                    MLog.Lines.Add(format('      ' + 'Baja: %s', [FormatDateTime(ShortDateFormat, Baja)]));
                    MLog.Lines.Add(format('      ' + 'Desc1: %.2f', [Desc1]));
                    MLog.Lines.Add(format('      ' + 'Desc2: %.2f', [Desc2]));
                    MLog.Lines.Add(format('      ' + 'Desc3: %.2f', [Desc3]));
                    MLog.Lines.Add(format('      ' + 'Articulo: %s', [Articulo]));
                    MLog.Lines.Add(format('      ' + 'Cod. Proveedor: %s', [CodProveedor]));
                    MLog.Lines.Add(format('      ' + 'Precio: %.2f', [Precio]));
                    MLog.Lines.Add('');
                    MLog.Lines.EndUpdate;
                 end;
              end;
           end
           else
           begin
              if (Articulo <> '') then
                 MLog.Lines.Add(format(_('Linea %d - No se encontro articulo para codigo de proveedor %s'), [i, CodProveedor]))
              else
              if (Precio <> 0) then
                 MLog.Lines.Add(format(_('Linea %d - Precio de tarifa es 0 para el articulo %s (Cod. Proveedor %s)'), [i, Articulo, CodProveedor]));
           end;
        except
           on E: Exception do
           begin
              // Para acelerar inserción de muchas líneas  BeginUpdate..EndUpdate
              MLog.Lines.BeginUpdate;
              MLog.Lines.Add(format(_('Linea %d - Error obteniendo datos a importar en las Tarifa de compras.'), [i]) + #13#10 + e.Message);
              MLog.Lines.Add(format('      ' + 'Tarifa: %s', [Tarifa]));
              MLog.Lines.Add(format('      ' + 'Proveedor: %d', [Proveedor]));
              MLog.Lines.Add(format('      ' + 'Alta: %s', [FormatDateTime(ShortDateFormat, Alta)]));
              MLog.Lines.Add(format('      ' + 'Baja: %s', [FormatDateTime(ShortDateFormat, Baja)]));
              MLog.Lines.Add(format('      ' + 'Desc1: %.2f', [Desc1]));
              MLog.Lines.Add(format('      ' + 'Desc2: %.2f', [Desc2]));
              MLog.Lines.Add(format('      ' + 'Desc3: %.2f', [Desc3]));
              MLog.Lines.Add(format('      ' + 'Articulo: %s', [Articulo]));
              MLog.Lines.Add(format('      ' + 'Cod. Proveedor: %s', [CodProveedor]));
              MLog.Lines.Add(format('      ' + 'Precio: %.2f', [Precio]));
              MLog.Lines.Add('');
              MLog.Lines.EndUpdate;
           end;
        end;
     end;

     MLog.Lines.Add(format('Importacion de Tarifa de Compra Finalizada - %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
     LProgreso.Caption := _('Importacion de Tarifa de Compra Finalizada');
     PBProgreso.Position := 0;
     PBProgreso.Visible := False;
  end;
end;

function TFMImpTarifasProveedor.ChequeaCondiciones: boolean;
begin
  /// Chequea condiciones necesarias para importar

  Result := True;
  if (DameColumnaSegunCampo('PROVEEDOR') < 0) and (EFProveedor.Text = '') then
  begin
     MessageDlg(_('Debe escoger un Proveedor o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if (DameColumnaSegunCampo('ARTICULO') < 0) and (EFArticulo.Text = '') then
  begin
     MessageDlg(_('Debe escoger un Articulo o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if (DameColumnaSegunCampo('TARIFA') < 0) and (ETarifa.Text = '') then
  begin
     MessageDlg(_('Debe escoger una Tarifa o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if (DameColumnaSegunCampo('PRECIO') < 0) and (EPrecio.Text = '') then
  begin
     MessageDlg(_('Debe escoger un Precio o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;
end;

procedure TFMImpTarifasProveedor.Inicializar(Proveedor: integer; Tarifa: string; Alta, Baja: TDateTime; Desc1, Desc2, Desc3: double);
begin
  EFProveedor.Text := IntToStr(Proveedor);
  ETarifa.Text := Tarifa;
  DEAlta.Date := Alta;
  DEBaja.Date := Baja;
  EDesc1.Text := FloatToStr(Desc1);
  EDesc2.Text := FloatToStr(Desc2);
  EDesc3.Text := FloatToStr(Desc3);
end;

end.
