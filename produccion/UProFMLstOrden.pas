unit UProFMLstOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  ToolWin, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, DBCtrls,
  Grids, DBGrids, rxToolEdit, Math, ULFActionList, ULFPageControl, ULFToolBar,
  ULFComboBox, ULFEdit, ULFPanel, ULFEditFind2000, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDateEdit, NsDBGrid, ULFLabel,
  rxPlacemnt, ULFFormStorage;

type
  TProFMLstOrden = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     PanelCentral: TLFPanel;
     LabelCab: TLFLabel;
     RBCabSi: TRadioButton;
     RBCabNo: TRadioButton;
     EFIdOrden: TLFEditFind2000;
     DBECompuesto: TLFDbedit;
     ETituloCompuesto: TLFEdit;
     DBEFaseD: TLFDbedit;
     DBEFaseH: TLFDbedit;
     EFFaseH: TLFEditFind2000;
     EFFaseD: TLFEditFind2000;
     LDesdeFase: TLFLabel;
     LOrdenProd: TLFLabel;
     LHastaFase: TLFLabel;
     RGTipoListado: TRadioGroup;
     CBAgruparTareas: TLFCheckBox;
     CBFechaImputacion: TLFCheckBox;
     LGuionFechas: TLFLabel;
     LFFechaDesde: TLFDateEdit;
     LFFechaHasta: TLFDateEdit;
     CBListarNrosSeries: TLFCheckBox;
     CBListarLotes: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure EFIdOrdenChange(Sender: TObject);
     procedure EFFaseDChange(Sender: TObject);
     procedure EFFaseDBusqueda(Sender: TObject);
     procedure EFFaseHBusqueda(Sender: TObject);
     procedure EFFaseHChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure RBCabSiClick(Sender: TObject);
     procedure RBCabNoClick(Sender: TObject);
     procedure EFIdOrdenExit(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure EFIdOrdenBusqueda(Sender: TObject);
     procedure CBFechaImputacionChange(Sender: TObject);
     procedure DBECompuestoChange(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure Recarga;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Configurar(Modo: integer; Tipo: integer; IDOrden: integer = 0);
     procedure Previsualizar;
  end;

var
  ProFMLstOrden : TProFMLstOrden;

implementation

uses UDMMain, UEntorno, UFormGest, UProDMLSTOrden, UUtiles, UDameDato, UFMListConfig;

{$R *.dfm}

procedure TProFMLstOrden.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLSTOrden, ProDMLSTOrden);
  PNLTop.Visible := True;
  ARecargar.Execute;
  ProDMLstOrden.Capsalera := 1;

  // Ocultar límites por fecha imputación
  CBFechaImputacion.Checked := False;
  LFFEchaDesde.Visible := False;
  LFFEchaHasta.Visible := False;
  LGuionFechas.Visible := False;

  Listado := ProDMLSTOrden.frListadoO;
  ListadoFR3 := ProDMLSTOrden.frxListadoO;

  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TProFMLstOrden.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(ProDMLSTOrden);
end;

procedure TProFMLstOrden.EFIdOrdenChange(Sender: TObject);
begin
  inherited;
  if (EFIdOrden.Text <> '') then
  begin
     ProDMLstOrden.CambiaOrden(StrToIntDef(EFIdOrden.Text, 0));
     EFFaseD.Text := ProDMLstOrden.xMinMaxFaseMIN.AsString;
     EFFaseH.Text := ProDMLstOrden.xMinMaxFaseMAX.AsString;
  end;
end;

procedure TProFMLstOrden.EFFaseDChange(Sender: TObject);
begin
  inherited;
  if ((EFFaseD.Text <> '') and (EFIdOrden.Text <> '')) then
     ProDMLstOrden.CambiaFaseD(StrToIntDef(EFIdOrden.Text, 0), StrToInt(EFFaseD.Text));
end;

procedure TProFMLstOrden.EFFaseDBusqueda(Sender: TObject);
begin
  inherited;
  EFFaseD.CondicionBusqueda := 'id_orden=' + '''' + EFIdOrden.Text + '''';
end;

procedure TProFMLstOrden.EFFaseHBusqueda(Sender: TObject);
begin
  inherited;
  EFFaseH.CondicionBusqueda := 'id_orden=' + '''' + EFIdOrden.Text + '''';
end;

procedure TProFMLstOrden.EFFaseHChange(Sender: TObject);
begin
  inherited;
  if ((EFFaseH.Text <> '') and (EFIdOrden.Text <> '')) then
     ProDMLstOrden.CambiaFaseH(StrToIntDef(EFIdOrden.Text, 0), StrToInt(EFFaseH.Text));
end;

procedure TProFMLstOrden.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  if ((EFIdOrden.Text <> '') and (EFFaseD.Text <> '') and (EFFaseH.Text <> '')) then
  begin
     ProDMLstOrden.TFiltro := Format(_('Orden: %s %s Desde Fase: %s %s Hasta Fase: %s %s'), [EFIdOrden.Text, ETituloCompuesto.Text, EFFaseD.Text, DBEFaseD.Text, EFFaseH.Text, DBEFaseH.Text]);

     // Si listo hojas de montaje, PNLTop esta visible
     // Llistat normal
     if (PNLTop.Visible) then
     begin
        if (RGTipoListado.ItemIndex = 1) then
           Grupo := 8030
        else
           Grupo := 8009;

        ProDMLstOrden.MostrarListado(Modo, StrToIntDef(EFIdOrden.Text, 0), StrToIntDef(EFFaseD.Text, 0), StrToIntDef(EFFaseH.Text, 0),
           0, EComentario.Text, TDPFechaListado.Date, CBAgruparTareas.Checked, RGTipoListado.ItemIndex, Grupo,
           CBListarNrosSeries.Checked, CBListarLotes.Checked, LFFechaDesde.Date, LFFechaHasta.Date);
     end
     else
     begin
        Grupo := 8016;

        ProDMLstOrden.MostrarListadoMontaje(Modo, Grupo, StrToIntDef(EFIdOrden.Text, 0),
           StrToIntDef(EFFaseD.Text, 0), StrToIntDef(EFFaseH.Text, 0),
           0, EComentario.Text, TDPFechaListado.Date, LFFechaDesde.Date, LFFechaHasta.Date);
     end;
  end;
end;

procedure TProFMLstOrden.Recarga;
begin
  EFIdOrden.Text := '';
  ETituloCompuesto.Text := '';
  DBECompuesto.Text := '';
  ETituloCompuesto.Text := '';
  EFFaseD.Text := '';
  DBEFaseD.Text := '';
  EFFaseH.Text := '';
  DBEFaseH.Text := '';
  EComentario.Text := '';

  TDPFechaListado.Date := REntorno.FechaTrabSH;

  if ProFMLstOrden.Visible then
     EFIdOrden.SetFocus;

  RBCabSi.Checked := True;
end;

procedure TProFMLstOrden.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Recarga;
end;

procedure TProFMLstOrden.RBCabSiClick(Sender: TObject);
begin
  inherited;
  ProDMLstOrden.Capsalera := 1;
end;

procedure TProFMLstOrden.RBCabNoClick(Sender: TObject);
begin
  inherited;
  ProDMLstOrden.Capsalera := 0;
end;

procedure TProFMLstOrden.EFIdOrdenExit(Sender: TObject);
begin
  inherited;
  if (EFIdOrden.Text = '') then
  begin
     EFIdOrden.SetFocus;
  end;
end;

procedure TProFMLstOrden.EFIdOrdenBusqueda(Sender: TObject);
begin
  inherited;
  EFIdOrden.CondicionBusqueda := 'series=''' + REntorno.Serie + ''' and ((ejercicio=' + REntorno.EjercicioStr + ') or ((ejercicio <' + REntorno.EjercicioStr + ') and (situacion<3)))';
end;

procedure TProFMLstOrden.CBFechaImputacionChange(Sender: TObject);
begin
  inherited;

  LFFEchaDesde.Visible := CBFechaImputacion.Checked;
  LFFEchaHasta.Visible := CBFechaImputacion.Checked;
  LGuionFechas.Visible := CBFechaImputacion.Checked;
  ProDMLstOrden.FiltraFechaImputacion := CBFechaImputacion.Checked;
end;

procedure TProFMLstOrden.Configurar(Modo: integer; Tipo: integer; IDOrden: integer = 0);
begin
  case Modo of
     0:
     begin
        Caption := _('Listado de orden de producción');
        PNLTop.Visible := True;
        RGTipoListado.Visible := True;
        case Tipo of
           1: RGTipoListado.ItemIndex := 0;
           2: RGTipoListado.ItemIndex := 1;
        end;

        if (RGTipoListado.ItemIndex = 1) then
           Grupo := 8030
        else
           Grupo := 8009;
     end;
     1:
     begin
        Caption := _('Listado de hoja de montaje');
        PNLTop.Visible := False;
        RGTipoListado.Visible := False;
        Grupo := 8016;
     end;
  end;

  if (IDOrden <> 0) then
     EFIdOrden.Text := IntToStr(IDOrden);
end;

procedure TProFMLstOrden.Previsualizar;
begin
  APrev.Execute;
end;

procedure TProFMLstOrden.DBECompuestoChange(Sender: TObject);
begin
  inherited;
  ETituloCompuesto.Text := DameTituloArticulo(DBECompuesto.Text);
end;

procedure TProFMLstOrden.AConfigurarExecute(Sender: TObject);
begin
  if (PNLTop.Visible) then
  begin
     if (RGTipoListado.ItemIndex = 1) then
        Grupo := 8030
     else
        Grupo := 8009;
  end
  else
     Grupo := 8016;

  inherited;
end;

end.
