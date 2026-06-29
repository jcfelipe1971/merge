unit UFMImpTarifasTyC;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPImportaciones, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, StdCtrls, ULFMemo, ValEdit,
  Grids, ExtCtrls, TFlatCheckBoxUnit, ULFCheckBox, ComCtrls, ULFComboBox,
  ULFEdit, ULFLabel, ULFPageControl, UEditPanel, ToolWin, ULFToolBar,
  ULFPanel, Mask, rxToolEdit, ULFDateEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, UHYDescription,
  ULFHYDBDescription, DBCtrls;

type
  TFMImpTarifasTyC = class(TFPImportaciones)
     BtImportar: TButton;
     CBModificar: TCheckBox;
     LModelo: TLFLabel;
     LTipoLona: TLFLabel;
     LFLabel1: TLFLabel;
     DBEFModelo: TLFEditFind2000;
     DBETipoLona: TLFEditFind2000;
     DBETarifa: TLFEditFind2000;
     DescTipoLona: TLFEdit;
     DescTarifa: TLFEdit;
     CBBloqueado: TCheckBox;
     EModelo: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure BtImportarClick(Sender: TObject);
     function ChequeaCondiciones: boolean;
     procedure FormDestroy(Sender: TObject);
     procedure DBETarifaChange(Sender: TObject);
     procedure DBEFModeloChange(Sender: TObject);
     procedure DBETipoLonaChange(Sender: TObject);
  private
     { Private declarations }
     ColModelo, ColTipoLona, ColTarifa, ColArticulo, ColPrecio, ColBloqueado: integer;
  public
     { Public declarations }
  end;

var
  FMImpTarifasTyC : TFMImpTarifasTyC;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, HYFIBQuery, UDMImpTarifasTyC;

{$R *.dfm}

procedure TFMImpTarifasTyC.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AgregaCampo('MODELO');
  AgregaCampo('TIPO_LONA');
  AgregaCampo('TARIFA');
  AgregaCampo('ARTICULO');
  AgregaCampo('P_VENTA_MODIFICADO');
  AgregaCampo('BLOQUEO_PVENTA');
end;

procedure TFMImpTarifasTyC.FormDestroy(Sender: TObject);
begin
  inherited;
  FMImpTarifasTyC := nil;
end;

procedure TFMImpTarifasTyC.BtImportarClick(Sender: TObject);
var
  i : integer;
  Bloqueado : integer;
  Modelo, TipoLona, Tarifa, Articulo : string;
  Precio : double;
begin
  inherited;
  // Obtenemos Columna para cada dato

  ColModelo := DameColumnaSegunCampo('MODELO');
  ColTipoLona := DameColumnaSegunCampo('TIPO_LONA');
  ColTarifa := DameColumnaSegunCampo('TARIFA');
  ColArticulo := DameColumnaSegunCampo('ARTICULO');
  ColPrecio := DameColumnaSegunCampo('P_VENTA_MODIFICADO');
  ColBloqueado := DameColumnaSegunCampo('BLOQUEO_PVENTA');

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

        Modelo := '';
        Tarifa := '';
        TipoLona := '';
        Articulo := '';
        Precio := 0;
        Bloqueado := 0;

        try
           // Busco dato, si esta enlazado busco la columna de excel, si no lo esta busco el dato fijo
           if (ColModelo >= 0) then
              Modelo := SGDatosImp.Cells[ColModelo, i]
           else
              Modelo := DBEFModelo.Text;

           if (ColTipoLona >= 0) then
              TipoLona := SGDatosImp.Cells[ColTipoLona, i]
           else
              TipoLona := DBETipoLona.Text;

           if (ColTarifa >= 0) then
              Tarifa := SGDatosImp.Cells[ColTarifa, i]
           else
              Tarifa := DBETarifa.Text;

           if (ColArticulo >= 0) then
              Articulo := Trim(SGDatosImp.Cells[ColArticulo, i]);

           if (ColPrecio >= 0) then
              Precio := StrToFloatDec(SGDatosImp.Cells[ColPrecio, i], ESeparadorDecimal.Text[1]);

           if (ColBloqueado >= 0) then
              Bloqueado := StrToIntDef(SGDatosImp.Cells[ColBloqueado, i], 0)
           else
              Bloqueado := BoolToInt(CBBloqueado.Checked);

           if (Articulo <> '') and (Precio <> 0) then
           begin
              try
                 DMImpTarifasTyC.InsertaTarifa(Modelo, TipoLona, Tarifa, Articulo, Precio, Bloqueado, CBModificar.Checked);
              except
                 on E: Exception do
                 begin
                    // Para acelerar inserción de muchas líneas  BeginUpdate..EndUpdate
                    MLog.Lines.BeginUpdate;
                    MLog.Lines.Add(format(_('Linea %d - Error importando Tarifa de compra'), [i]) + #13#10 + e.Message);
                    MLog.Lines.Add(format('      ' + 'Modelo: %s', [Modelo]));
                    MLog.Lines.Add(format('      ' + 'TipoLona: %s', [TipoLona]));
                    MLog.Lines.Add(format('      ' + 'Tarifa: %s', [Tarifa]));
                    MLog.Lines.Add(format('      ' + 'Articulo: %s', [Articulo]));
                    MLog.Lines.Add(format('      ' + 'Precio: %.2f', [Precio]));
                    MLog.Lines.Add(format('      ' + 'Bloqueado: %d', [Bloqueado]));
                    MLog.Lines.Add('');
                    MLog.Lines.EndUpdate;
                 end;
              end;
           end
           else
           begin
              if (Articulo <> '') then
                 MLog.Lines.Add(format(_('Linea %d - No se encontro articulo %s'), [i, Articulo]))
              else
              if (Precio <> 0) then
                 MLog.Lines.Add(format(_('Linea %d - Precio de tarifa es 0 para el articulo %s'), [i, Articulo]));
           end;
        except
           on E: Exception do
           begin
              // Para acelerar inserción de muchas líneas  BeginUpdate..EndUpdate
              MLog.Lines.BeginUpdate;
              MLog.Lines.Add(format(_('Linea %d - Error obteniendo datos a importar en las Tarifa.'), [i]) + #13#10 + e.Message);
              MLog.Lines.Add(format('      ' + 'Modelo: %s', [Modelo]));
              MLog.Lines.Add(format('      ' + 'TipoLona: %s', [TipoLona]));
              MLog.Lines.Add(format('      ' + 'Tarifa: %s', [Tarifa]));
              MLog.Lines.Add(format('      ' + 'Articulo: %s', [Articulo]));
              MLog.Lines.Add(format('      ' + 'Precio: %.2f', [Precio]));
              MLog.Lines.Add(format('      ' + 'Bloqueado: %d', [Bloqueado]));
              MLog.Lines.Add('');
              MLog.Lines.EndUpdate;
           end;
        end;
     end;

     MLog.Lines.Add(format('Importacion de Tarifa Finalizada - %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
     LProgreso.Caption := _('Importacion de Tarifa Finalizada');
     PBProgreso.Position := 0;
     PBProgreso.Visible := False;
  end;
end;

function TFMImpTarifasTyC.ChequeaCondiciones: boolean;
begin
  /// Chequea condiciones necesarias para importar

  Result := True;
  if (DameColumnaSegunCampo('ARTICULO') < 0) then
  begin
     MessageDlg(_('Debe escoger enlazar la columna ARTICULO de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if (DameColumnaSegunCampo('TARIFA') < 0) and (DBETarifa.Text = '') then
  begin
     MessageDlg(_('Debe escoger una Tarifa o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if (DameColumnaSegunCampo('TIPO_LONA') < 0) and (DBETipoLona.Text = '') then
  begin
     MessageDlg(_('Debe escoger un Tipo de Lona o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if (DameColumnaSegunCampo('MODELO') < 0) and (DBEFModelo.Text = '') then
  begin
     MessageDlg(_('Debe escoger un Modelo o enlazar la columna de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;

  if (DameColumnaSegunCampo('P_VENTA_MODIFICADO') < 0) then
  begin
     MessageDlg(_('Debe escoger enlazar la columna PRECIO de excel'), mtInformation, [mbOK], 0);
     Result := False;
  end;
end;

procedure TFMImpTarifasTyC.DBETarifaChange(Sender: TObject);
begin
  inherited;
  DescTarifa.Text := DameTituloTarifa(DBETarifa.Text);
end;

procedure TFMImpTarifasTyC.DBEFModeloChange(Sender: TObject);
begin
  inherited;
  EModelo.Text := DameTituloModeoTyC(DBEFModelo.Text);
end;

procedure TFMImpTarifasTyC.DBETipoLonaChange(Sender: TObject);
begin
  inherited;
  DescTipoLona.Text := DameTituloTipoLona(DBETipoLona.Text);
end;

end.
