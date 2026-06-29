unit UFMImpConEspVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPImportaciones, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, ValEdit, Grids, ExtCtrls,
  TFlatCheckBoxUnit, ULFCheckBox, ComCtrls, StdCtrls, ULFComboBox, ULFEdit,
  ULFLabel, ULFPageControl, UEditPanel, ToolWin, ULFToolBar, ULFPanel,
  Mask, rxToolEdit, RXDBCtrl, ULFDBDateEdit, UHYDescription,
  ULFHYDBDescription, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFEditFind2000, ULFMemo,
  ULFDateEdit;

type
  TFMImpConEspVentas = class(TFPImportaciones)
     LFechaAlta: TLFLabel;
     LFechaBaja: TLFLabel;
     LTipoCondicion: TLFLabel;
     CBTipoCondicion: TLFComboBox;
     EUdsMin: TEdit;
     LUdsMinimas: TLFLabel;
     LUdsMaximas: TLFLabel;
     EUdsMax: TEdit;
     LCliente: TLFLabel;
     ETituloCliente: TLFEdit;
     EFCliente: TLFEditFind2000;
     CBModificar: TCheckBox;
     BtImportar: TButton;
     DEAlta: TLFDateEdit;
     DEBaja: TLFDateEdit;
     LArticulo: TLFLabel;
     EFArticulo: TLFEditFind2000;
     ETituloArticulo: TLFEdit;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     ETituloFamilia: TLFEdit;
     LPrecio: TLFLabel;
     EPrecio: TEdit;
     LDescuentos: TLFLabel;
     EDesc1: TEdit;
     EDesc2: TEdit;
     EDesc3: TEdit;
     EFPerfil: TLFEditFind2000;
     LFPerfil: TLFLabel;
     LFAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     ETituloPerfil: TLFEdit;
     ETituloAgrupacion: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure BtImportarClick(Sender: TObject);
     procedure CBTipoCondicionChange(Sender: TObject);
     function ChequeaCondiciones: boolean;
     procedure EFArticuloChange(Sender: TObject);
     procedure EFFamiliaChange(Sender: TObject);
     procedure EFPerfilChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure EFAgrupacionBusqueda(Sender: TObject);
  private
     { Private declarations }
     TipoCondicion: string;
     ColCliente, ColArticulo, ColFamilia, ColPerfil, ColAgrupacion, ColAlta, ColBaja, ColUdsMin, ColUdsMax, ColPrecio, ColDesc1, ColDesc2, ColDesc3: integer;
  public
     { Public declarations }
  end;

var
  FMImpConEspVentas : TFMImpConEspVentas;

implementation

uses UFormGest, UDMMain, UEntorno, HYFIBQuery, UUtiles, UDameDato, UDMImpConEspVentas;

{$R *.dfm}

procedure TFMImpConEspVentas.FormCreate(Sender: TObject);
var
  Min, Max : TDateTime;
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  CBTipoCondicion.ItemIndex := 0;
  TipoCondicion := '';

  // Campos para importar a ART_CONDICIONES_C
  AgregaCampo('CLIENTE');
  AgregaCampo('ARTICULO');
  AgregaCampo('FAMILIA');
  AgregaCampo('PERFIL');
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

procedure TFMImpConEspVentas.EFClienteChange(Sender: TObject);
begin
  inherited;
  ETituloCliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
end;

procedure TFMImpConEspVentas.BtImportarClick(Sender: TObject);
var
  i : integer;
  Cliente : integer;
  Articulo, Familia, Perfil, Agrupacion : string;
  Alta, Baja : TDateTime;
  UdsMin, UdsMax, Precio, Desc1, Desc2, Desc3 : double;
begin
  inherited;
  // Obtenemos Columna para cada dato
  ColCliente := DameColumnaSegunCampo('CLIENTE');
  ColArticulo := DameColumnaSegunCampo('ARTICULO');
  ColFamilia := DameColumnaSegunCampo('FAMILIA');
  ColPerfil := DameColumnaSegunCampo('PERFIL');
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
           if (ColCliente >= 0) then
              Cliente := StrToIntDef(SGDatosImp.Cells[ColCliente, i], 0)
           else
              Cliente := StrToIntDef(EFCliente.Text, 0);

           if (ColArticulo >= 0) then
              Articulo := Trim(SGDatosImp.Cells[ColArticulo, i])
           else
              Articulo := EFArticulo.Text;

           if (ColFamilia >= 0) then
              Familia := Trim(SGDatosImp.Cells[ColFamilia, i])
           else
              Familia := EFFamilia.Text;


           if (ColPerfil >= 0) then
              Perfil := Trim(SGDatosImp.Cells[ColPerfil, i])
           else
              Perfil := EFPerfil.Text;

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
           MLog.Lines.Add(format(_('Linea %d - Insertando condicion'), [i]));
           MLog.Lines.Add(format('Tipo: %s', [TipoCondicion]));
           MLog.Lines.Add(format('Cliente: %d', [Cliente]));
           MLog.Lines.Add(format('Articulo: %s', [Articulo]));
           MLog.Lines.Add(format('Familia: %s', [Familia]));
           MLog.Lines.Add(format('Perfil: %s', [Perfil]));
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
              DMImpConEspVentas.InsertaCondicionEspecial(TipoCondicion, Cliente, Articulo, Familia, Perfil, Agrupacion, Alta, Baja, UdsMin, UdsMax, Precio, Desc1, Desc2, Desc3, CBModificar.Checked);
           except
              on E: Exception do
              begin
                 MLog.Lines.Add(format(_('Linea %d - Error importando linea'), [i]) + #13#10 + e.Message);
              end;
           end;
        except
           on E: Exception do
           begin
              MLog.Lines.Add(format(_('Linea %d - Error obteniendo datos a importar.'), [i]) + #13#10 + e.Message);
           end;
        end;

        MLog.Lines.Add('');
     end;

     MLog.Lines.Add(format('Importacion Finalizada - %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
     LProgreso.Caption := _('Importacion Finalizada');
     PBProgreso.Position := 0;
     PBProgreso.Visible := False;
  end;
end;

function TFMImpConEspVentas.ChequeaCondiciones: boolean;
begin
  /// Chequea condiciones necesarias para importar

  Result := True;
  if (CBTipoCondicion.ItemIndex = 0) then
  begin
     MessageDlg(_('Debe escoger un tipo de condicion a importar'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if ((DameColumnaSegunCampo('CLIENTE') < 0) and (EFCliente.Text = '') and (CBTipoCondicion.ItemIndex in [1, 5, 11])) then
  begin
     MessageDlg(_('Debe escoger un cliente o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if ((DameColumnaSegunCampo('ARTICULO') < 0) and (EFArticulo.Text = '') and (CBTipoCondicion.ItemIndex in [1, 2, 3, 4])) then
  begin
     MessageDlg(_('Debe escoger un Articulo o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if ((DameColumnaSegunCampo('FAMILIA') < 0) and (EFFamilia.Text = '') and (CBTipoCondicion.ItemIndex in [5, 6, 7, 8])) then
  begin
     MessageDlg(_('Debe escoger una Familia o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  {
  TODO: EFPerfil, EFAGrupacionCliente

     1 : TipoCondicion := 'CCA'; // Condicion Cliente / Articulo
     2 : TipoCondicion := 'CAA'; // Condicion Agrupación Clientes / Artículo
     3 : TipoCondicion := 'CPA'; // Condicion Perfil / Artículo
     4 : TipoCondicion := 'CAR'; // Condicion Articulo
     5 : TipoCondicion := 'CCF'; // Condicion Cliente / Familia
     6 : TipoCondicion := 'CAF'; // Condicion Agrupación Clientes / Familia
     7 : TipoCondicion := 'CPF'; // Condicion Perfil / Familia
     8 : TipoCondicion := 'CFA'; // Condicion Familia
     9 : TipoCondicion := 'CAG'; // Condicion Agrupación Clientes
     10 : TipoCondicion := 'CPE'; // Condicion Perfil
     11 : TipoCondicion := 'CAT'; // Condicion Cliente / Agrupación  Artículo
  }
end;

procedure TFMImpConEspVentas.CBTipoCondicionChange(Sender: TObject);
begin
  inherited;
  case CBTipoCondicion.ItemIndex of
     0: TipoCondicion := ''; // No seleccionada
     1: TipoCondicion := 'CCA'; // Condicion Cliente / Articulo
     2: TipoCondicion := 'CAA'; // Condicion Agrupación Clientes / Artículo
     3: TipoCondicion := 'CPA'; // Condicion Perfil / Artículo
     4: TipoCondicion := 'CAR'; // Condicion Articulo
     5: TipoCondicion := 'CCF'; // Condicion Cliente / Familia
     6: TipoCondicion := 'CAF'; // Condicion Agrupación Clientes / Familia
     7: TipoCondicion := 'CPF'; // Condicion Perfil / Familia

     8: TipoCondicion := 'CFA'; // Condicion Familia
     9: TipoCondicion := 'CAG'; // Condicion Agrupación Clientes
     10: TipoCondicion := 'CPE'; // Condicion Perfil
     11: TipoCondicion := 'CAT'; // Condicion Cliente / Agrupación  Artículo
  end;
end;

procedure TFMImpConEspVentas.EFArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TFMImpConEspVentas.EFFamiliaChange(Sender: TObject);
begin
  inherited;
  ETituloFamilia.Text := DameTituloFamilia(EFFamilia.Text);
end;

procedure TFMImpConEspVentas.EFPerfilChange(Sender: TObject);
begin
  inherited;
  ETituloPerfil.Text := DameTituloPerfilCliente(EFPerfil.Text);
end;

procedure TFMImpConEspVentas.EFAgrupacionChange(Sender: TObject);
begin
  inherited;
  if ((TipoCondicion = 'CAA') or (TipoCondicion = 'CAF')) then
     ETituloAgrupacion.Text := DameTituloAgrupacion('C', EFAgrupacion.Text);
  if (TipoCondicion = 'CAT') then
     ETituloAgrupacion.Text := DameTituloAgrupacion('A', EFAgrupacion.Text);
end;

procedure TFMImpConEspVentas.EFAgrupacionBusqueda(Sender: TObject);
begin
  inherited;
  if ((TipoCondicion = 'CAA') or (TipoCondicion = 'CAF')) then
     EFAgrupacion.CondicionBusqueda := 'TIPO=''C''';
  if (TipoCondicion = 'CAT') then
     EFAgrupacion.CondicionBusqueda := 'TIPO=''A''';
end;

end.
