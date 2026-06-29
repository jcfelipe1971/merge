unit UFPregEtiArticulosKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  ULFEditFind2000, ULFLabel, ULFPageControl, ULFEdit, ULFActionList,
  ULFToolBar, HYFIBQuery, TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt,
  ULFFormStorage, ULFPanel, UFPEditListadoSimple;

type
  TFPregEtiArticulosKri = class(TFPEditListadoSimple)
     GBArticulos: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArtDesde: TLFEditFind2000;
     EFArtHasta: TLFEditFind2000;
     GBFamilias: TGroupBox;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamiliaDesde: TLFEditFind2000;
     EFFamiliaHasta: TLFEditFind2000;
     RBCatidad: TRadioGroup;
     ECantidad: TLFEdit;
     EArticuloDesde: TLFEdit;
     EArticuloHasta: TLFEdit;
     EFamiliaDesde: TLFEdit;
     EFamiliaHasta: TLFEdit;
     TButtConfRapida: TToolButton;
     CBMustraPVP: TLFCheckBox;
     AConfiguracion: TAction;
     EFAlmacen: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure EFArtDesdeChange(Sender: TObject);
     procedure EFArtHastaChange(Sender: TObject);
     procedure EFFamiliaDesdeChange(Sender: TObject);
     procedure EFFamiliaHastaChange(Sender: TObject);
     procedure RBCatidadClick(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBMustraPVPClick(Sender: TObject);
     procedure AConfiguracionExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregEtiArticulosKri : TFPregEtiArticulosKri;

implementation

uses UDMMain, UDMLstEtiArticulosKri, UEntorno, UDameDato, UFMListConfig;

{$R *.dfm}

procedure TFPregEtiArticulosKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstEtiArticulosKri, DMLstEtiArticulosKri);
  ARecargarExecute(Sender);
end;

procedure TFPregEtiArticulosKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstEtiArticulosKri);
end;

procedure TFPregEtiArticulosKri.EFArtDesdeChange(Sender: TObject);
begin
  inherited;
  EArticuloDesde.Text := DameTituloArticulo(EFArtDesde.Text);
  if (EArticuloDesde.Text = '') then
     EArticuloDesde.Text := DameTituloArticulo(DameArticuloBarras(EFArtDesde.Text));
end;

procedure TFPregEtiArticulosKri.EFArtHastaChange(Sender: TObject);
begin
  inherited;
  EArticuloHasta.Text := DameTituloArticulo(EFArtHasta.Text);
  if (EArticuloHasta.Text = '') then
     EArticuloHasta.Text := DameTituloArticulo(DameArticuloBarras(EFArtHasta.Text));
end;

procedure TFPregEtiArticulosKri.EFFamiliaDesdeChange(Sender: TObject);
begin
  inherited;
  EFamiliaDesde.Text := DameTituloFamilia(EFFamiliaDesde.Text);
end;

procedure TFPregEtiArticulosKri.EFFamiliaHastaChange(Sender: TObject);
begin
  inherited;
  EFamiliaHasta.Text := DameTituloFamilia(EFFamiliaHasta.Text);
end;

procedure TFPregEtiArticulosKri.RBCatidadClick(Sender: TObject);
begin
  inherited;
  if (RBCatidad.ItemIndex = 0) then
     ECantidad.Enabled := False
  else
     ECantidad.Enabled := True;
end;

procedure TFPregEtiArticulosKri.ARecargarExecute(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  inherited;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select min(barras), max(barras) from art_articulos_barras where empresa = ' + REntorno.EmpresaStr;
        ExecQuery;
        EFArtDesde.Text := FieldByName['MIN'].AsString;
        EFArtHasta.Text := FieldByName['MAX'].AsString;
        FreeHandle;

        Close;
        SQL.Text := 'select min(familia), max(familia) from con_cuentas_ges_fam ' +
           'where familia <> ''' + REntorno.FamSistema + ''' and ' +
           'empresa = ' + REntorno.EmpresaStr + ' and ' +
           'ejercicio = ' + REntorno.EjercicioStr + ' and ' +
           'canal = ' + REntorno.CanalStr;
        ExecQuery;
        EFFamiliaDesde.Text := FieldByName['MIN'].AsString;
        EFFamiliaHasta.Text := FieldByName['MAX'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  if (Trim(REntorno.AlmacenRestringido) > ' ') then
  begin
     EFAlmacen.Text := REntorno.AlmacenRestringido;
     EFAlmacen.Color := clInfoBk;
     EFAlmacen.Enabled := False;
  end
  else
  begin
     EFAlmacen.Text := REntorno.AlmacenDefecto;
     EFAlmacen.Color := clWindow;
     EFAlmacen.Enabled := True;
  end;
end;

procedure TFPregEtiArticulosKri.APrevExecute(Sender: TObject);
var
  Cantidad : integer;
begin
  inherited;
  if (RBCatidad.ItemIndex = 0) then
     Cantidad := -1
  else
     Cantidad := StrToInt(ECantidad.Text);
  DMLstEtiArticulosKri.MostrarListado(0, EFArtDesde.Text, EFArtHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, Cantidad, EFAlmacen.Text);
end;

procedure TFPregEtiArticulosKri.AImprimirExecute(Sender: TObject);
var
  Cantidad : integer;
begin
  inherited;
  if (RBCatidad.ItemIndex = 0) then
     Cantidad := -1
  else
     Cantidad := StrToInt(ECantidad.Text);
  DMLstEtiArticulosKri.MostrarListado(1, EFArtDesde.Text, EFArtHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, Cantidad, EFAlmacen.Text);
end;

procedure TFPregEtiArticulosKri.CBMustraPVPClick(Sender: TObject);
begin
  inherited;
  DMLstEtiArticulosKri.MostrarPVP := CBMustraPVP.Checked;
end;

procedure TFPregEtiArticulosKri.AConfiguracionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(96, Formato, Cabecera, Copias,
     Pijama, '', DMLstEtiArticulosKri.frCodBarras);
end;

end.
