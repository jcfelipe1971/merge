unit UFMImportarPreciosTarProvKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ULFComboBox, ULFEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel, ExtCtrls,
  ULFPanel, UFormGest, HYFIBQuery;

type
  TFMImportarPreciosTarProvKri = class(TG2KForm)
     PNLTarifaVenta: TLFPanel;
     PNLTarifaCompra: TLFPanel;
     LTarifa: TLFLabel;
     LMoneda: TLFLabel;
     EFTarifa: TLFEditFind2000;
     ETituloTarifa: TLFEdit;
     EMoneda: TLFEdit;
     ETituloMoneda: TLFEdit;
     LTarifaProveedor: TLFLabel;
     EFTarifaProveedor: TLFEditFind2000;
     ETituloTarifaProveedor: TLFEdit;
     LMonedaTarifaProveedor: TLFLabel;
     EMonedaTarifaProveedor: TLFEdit;
     ETituloMonedaTarifaProveedor: TLFEdit;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     ETituloProveedor: TLFEdit;
     PNLCalculo: TLFPanel;
     LPrecioVenta: TLFLabel;
     CBPrecioCoste: TLFComboBox;
     ECalculo: TLFEdit;
     PNLFamilias: TLFPanel;
     LDesdeFamilia: TLFLabel;
     EFDesdeFamilia: TLFEditFind2000;
     ETituloDesdeFamilia: TLFEdit;
     LHastaFamilia: TLFLabel;
     EFHastaFamilia: TLFEditFind2000;
     ETituloHastaFamilia: TLFEdit;
     PNLEjecutar: TLFPanel;
     BImportarPrecios: TButton;
     procedure EMonedaChange(Sender: TObject);
     procedure EMonedaTarifaProveedorChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTarifaChange(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure EFTarifaProveedorChange(Sender: TObject);
     procedure EFDesdeFamiliaChange(Sender: TObject);
     procedure EFHastaFamiliaChange(Sender: TObject);
     procedure BImportarPreciosClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMImportarPreciosTarProvKri : TFMImportarPreciosTarProvKri;

implementation

uses UDMMain, UEntorno, UDMImportarPreciosTarProvKri, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMImportarPreciosTarProvKri.EMonedaChange(Sender: TObject);
begin
  ETituloMoneda.Text := DameTituloMoneda(EMoneda.Text);
end;

procedure TFMImportarPreciosTarProvKri.EMonedaTarifaProveedorChange(Sender: TObject);
begin
  ETituloMonedaTarifaProveedor.Text := DameTituloMoneda(EMonedaTarifaProveedor.Text);
end;

procedure TFMImportarPreciosTarProvKri.FormCreate(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMImportarPreciosTarProvKri, DMImportarPreciosTarProvKri);

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT MIN(FAMILIA),MAX(FAMILIA) FROM CON_CUENTAS_GES_FAM WHERE EMPRESA = ' +
        REntorno.EmpresaStr + ' AND EJERCICIO = ' + REntorno.EjercicioStr +
        ' AND CANAL = ' + REntorno.CanalStr;
     ExecQuery;
     EFDesdeFamilia.Text := FieldByName['MIN'].AsString;
     EFHastaFamilia.Text := FieldByName['MAX'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TFMImportarPreciosTarProvKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMImportarPreciosTarProvKri);
  Action := caFree;
end;

procedure TFMImportarPreciosTarProvKri.EFTarifaChange(Sender: TObject);
begin
  EMoneda.Text := DMImportarPreciosTarProvKri.DameMonedaTarifa(REntorno.Empresa, EFTarifa.Text);
  ETituloTarifa.Text := DameTituloTarifa(EFTarifa.Text);
end;

procedure TFMImportarPreciosTarProvKri.EFProveedorChange(Sender: TObject);
begin
  EFTarifaProveedor.CondicionBusqueda := 'PROVEEDOR=' + EFProveedor.Text;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMImportarPreciosTarProvKri.EFTarifaProveedorChange(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT TITULO,MONEDA FROM ART_TARIFAS_PROVEEDOR WHERE EMPRESA = ' +
        REntorno.EmpresaStr + ' AND EJERCICIO = ' + REntorno.EjercicioStr +
        ' AND CANAL = ' + REntorno.CanalStr + ' AND PROVEEDOR = ' + IntToStr(StrToIntDef(EFProveedor.Text, 0)) + ' AND TARIFA=''' + EFTarifaProveedor.Text + '''';
     ExecQuery;
     ETituloTarifaProveedor.Text := FieldByName['TITULO'].AsString;
     EMonedaTarifaProveedor.Text := FieldByName['MONEDA'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TFMImportarPreciosTarProvKri.EFDesdeFamiliaChange(Sender: TObject);
begin
  ETituloDesdeFamilia.Text := DameTituloFamilia(EFDesdeFamilia.Text);
end;

procedure TFMImportarPreciosTarProvKri.EFHastaFamiliaChange(Sender: TObject);
begin
  ETituloHastaFamilia.Text := DameTituloFamilia(EFHastaFamilia.Text);
end;

procedure TFMImportarPreciosTarProvKri.BImportarPreciosClick(Sender: TObject);
var
  Q : THYFIBQuery;
  Desc1, Desc2, Desc3, PCoste, Aux : double;
  Moneda, Familia, PCosteStr : string;
  Cantidad : integer;
begin
  if Confirma then
     if ConfirmaGrave then
     begin
        BImportarPrecios.Visible := False;
        try
           { TODO : Todo esto debería ser un procedimiento en el DataModule }
           with DMImportarPreciosTarProvKri do
           begin
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT DESCUENTO1,DESCUENTO2,DESCUENTO3,MONEDA FROM ART_TARIFAS_PROVEEDOR WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND EJERCICIO = ' + REntorno.EjercicioStr +
                    ' AND CANAL = ' + REntorno.CanalStr + ' AND PROVEEDOR = ' + IntToStr(StrToIntDef(EFProveedor.Text, 0)) + ' AND TARIFA=''' + EFTarifaProveedor.Text + '''';
                 ExecQuery;
                 Desc1 := FieldByName['DESCUENTO1'].AsFloat;
                 Desc2 := FieldByName['DESCUENTO2'].AsFloat;
                 Desc3 := FieldByName['DESCUENTO3'].AsFloat;
                 Moneda := FieldByName['MONEDA'].AsString;
                 FreeHandle;
              end;
              FreeAndNil(Q);

              with TArticulos do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['PROVEEDOR'].AsInteger := StrToIntDef(EFProveedor.Text, 0);
                 Params.ByName['TARIFA'].AsString := EFTarifaProveedor.Text;
                 Open;
                 FetchAll;
                 Cantidad := TArticulos.RecordCount;
                 First;
              end;

              while not TArticulos.EOF do
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT FAMILIA FROM ART_ARTICULOS WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND ARTICULO=''' + TArticulosARTICULO.AsString + '''';
                    ExecQuery;
                    Familia := FieldByName['FAMILIA'].AsString;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 if ((Familia >= EFDesdeFamilia.Text) and (Familia <= EFHastaFamilia.Text)) then
                 begin
                    {Aplico los descuentos a PCoste si procede}
                    PCoste := TArticulosP_COSTE.AsFloat;
                    if (CBPrecioCoste.ItemIndex = 1) then {PCoste - Descuentos}
                    begin
                       if (desc1 > 0) then
                          PCoste := PCoste - (PCoste * Desc1 / 100);
                       if (desc2 > 0) then
                          PCoste := PCoste - (PCoste * Desc2 / 100);
                       if (desc3 > 0) then
                          PCoste := PCoste - (PCoste * Desc3 / 100);
                    end;

                    {Cambiar el precio de coste segun moneda y descuentos}
                    if (moneda <> REntorno.MonedaEmpresa) then
                    begin
                       DMMain.Cambios(Moneda, REntorno.MonedaEmpresa, Now, PCoste, Aux, PCoste);
                    end;
                    PCosteStr := FloatToStrF(PCoste, ffFixed, 15, 2);
                    PCosteStr[Pos(',', FloatToStrF(PCoste, ffFixed, 15, 2))] := '.';
                    PNLEjecutar.Caption := Format(_('Faltan: %d - Articulo: %s - %s %s --> Tarifa: %s'), [Cantidad, TArticulosARTICULO.AsString, PCosteStr, ECalculo.Text, EFTarifa.Text]);
                    Application.ProcessMessages;
                    {Poner el precio de venta}
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE ART_TARIFAS_PRECIOS SET BLOQUEADO=1, PRECIO_VENTA=' + PCosteStr + ' ' + ECalculo.Text +
                          ' WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND TARIFA=''' + EFTarifa.Text + ''' AND ARTICULO=''' + TArticulosARTICULO.AsString + '''';
                       ExecQuery;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 TArticulos.Next;
                 Dec(Cantidad);
              end; {TArticulos.EOF}
           end; {with DMImportarPreciosTarProvKri}
        finally
           BImportarPrecios.Visible := True;
           PNLEjecutar.Caption := '';
        end;
     end;
end;

end.
