unit ZUFPregPedEntrega;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ULFLabel, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, ULFDateEdit, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, DateUtils,
  TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt, ULFFormStorage;

type
  TZFPregPedEntrega = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     TSListado: TTabSheet;
     RBCamion: TRadioButton;
     RBRecoge: TRadioButton;
     RBEnvio: TRadioButton;
     DateEFechaD: TLFDateEdit;
     DateEFechaH: TLFDateEdit;
     LClienteD: TLFLabel;
     LClienteH: TLFLabel;
     LblFechaD: TLFLabel;
     LblFechaH: TLFLabel;
     EFClienteD: TLFEditFind2000;
     DBEClienteD: TLFDbedit;
     DBEClienteH: TLFDbedit;
     EFClienteH: TLFEditFind2000;
     LblTransportistaD: TLFLabel;
     LblTransportistaH: TLFLabel;
     EFTransportistaD: TLFEditFind2000;
     DBETransportistaD: TLFDbedit;
     DBETransportistaH: TLFDbedit;
     EFTransportistaH: TLFEditFind2000;
     EFDiaD: TLFEditFind2000;
     LblDiaD: TLFLabel;
     EFDiaH: TLFEditFind2000;
     LblDiaH: TLFLabel;
     LblFechaPrevD: TLFLabel;
     DateEFechaPrevD: TLFDateEdit;
     LblFechaPrevH: TLFLabel;
     DateEFechaPrevH: TLFDateEdit;
     ChkBValorado: TLFCheckBox;
     CBSeries: TLFComboBox;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     EFCanalD: TLFEditFind2000;
     EFCanalH: TLFEditFind2000;
     DBECanalH: TLFDbedit;
     DBECanadD: TLFDbedit;
     LFLabel3: TLFLabel;
     LFLabel4: TLFLabel;
     LFDAgrupacion: TLFEditFind2000;
     LFHAgrupacion: TLFEditFind2000;
     DescAgrupaD: TLFDbedit;
     DescAgrupaH: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBOrdenChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure RBChange(Sender: TObject);
     procedure EFTransportistaDChange(Sender: TObject);
     procedure EFTransportistaHChange(Sender: TObject);
     procedure EFCanalDChange(Sender: TObject);
     procedure EFCanalHChange(Sender: TObject);
     procedure LFDAgrupacionChange(Sender: TObject);
     procedure LFHAgrupacionChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(Modo: byte);
  end;

var
  ZFPregPedEntrega : TZFPregPedEntrega;

implementation

uses ZUDMLstPedEntrega, UFormGest, UEntorno, UFMListConfig, UUtiles, UDMMain, URellenaLista;

{$R *.dfm}

procedure TZFPregPedEntrega.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstPedEntrega, ZDMLstPedEntrega);
  PNLTop.Visible := True;

  RellenaSeries(CBSeries.Items);
  ARecargar.Execute;
  PCMain.ActivePage := TSListado;
  CBOrden.Clear;
  CBOrden.Items.Add(_('Por Cliente'));
  CBOrden.Items.Add(_('Por Fecha del Pedido'));
  CBOrden.Items.Add(_('Por Fecha de Entrega Prevista'));
  CBOrden.Items.Add(_('Por Número de Pedido'));
  CBOrden.ItemIndex := 0;

  CBOrdenChange(Sender);
  TDPFechaListado.Date := REntorno.FechaTrabSH;
end;

procedure TZFPregPedEntrega.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLstPedEntrega);
end;

procedure TZFPregPedEntrega.CBOrdenChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedEntrega.QMListado.Close;
  if PCMain.ActivePage = TSListado then
  begin
     ZDMLstPedEntrega.QMListado.SelectSQL.Clear;
     ZDMLstPedEntrega.QMListado.SelectSQL.Add('select * from z_lst_pedidos_pdte_entrega(?empresa, ?ejercicio, ?canal, ?serie,');
     ZDMLstPedEntrega.QMListado.SelectSQL.Add(' ?fechaD, ?fechaH, ?fechaPrevD, ?fechaPrevH, ?clienteD, ?clienteH,');
     ZDMLstPedEntrega.QMListado.SelectSQL.Add(' ?transportistaD, ?transportistaH, ?canald, ?canalh,?agrupacionD,?agrupacionH)');
     if (RBCamion.Checked) then
        ZDMLstPedEntrega.QMListado.SelectSQL.Add(' where dias_entrega>=?diasD and dias_entrega<=?diasH ')
     else if (RBEnvio.Checked) then
        ZDMLstPedEntrega.QMListado.SelectSQL.Add(' where transportista<>7067 and transportista<>7068 '); //Quitamos del filtro de transportista a Recoger en fabrica y Camion Propio TyC

     if (CBOrden.ItemIndex = 0) then //Orden por cliente y num. pedido
        ZDMLstPedEntrega.QMListado.SelectSQL.Add('order by cliente,z_cod_barras_ped');
     if (CBOrden.ItemIndex = 1) then //Orden por fecha del pedido
        ZDMLstPedEntrega.QMListado.SelectSQL.Add('order by fecha, z_cod_barras_ped');
     if (CBOrden.ItemIndex = 2) then //Orden por fecha prevista de entrega del pedido
        ZDMLstPedEntrega.QMListado.SelectSQL.Add('order by fecha_entrega_prev, fecha, z_cod_barras_ped');
     if (CBOrden.ItemIndex = 3) then //Orden por número de pedido
        ZDMLstPedEntrega.QMListado.SelectSQL.Add('order by z_cod_barras_ped');
  end;
end;

procedure TZFPregPedEntrega.ARecargarExecute(Sender: TObject);
var
  year, month, day, dias : word;
begin
  inherited;
  ZDMLstPedEntrega.Recargar;

  CBSeries.ItemIndex := 0;
  ChkBValorado.State := cbUnchecked;

  EFClienteD.Text := ZDMLstPedEntrega.CliMin;
  EFClienteH.Text := ZDMLstPedEntrega.CliMax;
  EFTransportistaD.Text := ZDMLstPedEntrega.TranspMin;
  EFTransportistaH.Text := ZDMLstPedEntrega.TranspMax;
  EFDiaD.Text := ZDMLstPedEntrega.DiaMin;
  EFDiaH.Text := ZDMLstPedEntrega.DiaMax;
  EFCanalD.Text := ZDMLstPedEntrega.CanalMin;
  EFCanalH.Text := ZDMLstPedEntrega.CanalMax;
  LFDAgrupacion.Text := ZDMLstPedEntrega.AgrupMin;
  LFHAgrupacion.Text := ZDMLstPedEntrega.AgrupMax;

  // Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dias := DaysInMonth(REntorno.FechaTrabSH);

  DateEFechaD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DateEFechaH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  DateEFechaPrevD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DateEFechaPrevH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
end;

procedure TZFPregPedEntrega.APrevExecute(Sender: TObject);
begin
  inherited;
  MostrarListado(0);
end;

procedure TZFPregPedEntrega.AImprimirExecute(Sender: TObject);
begin
  inherited;
  MostrarListado(1);
end;

procedure TZFPregPedEntrega.AConfigurarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama, Grupo : integer;
begin
  Grupo := 9005;

  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias,
     Pijama, '', ZDMLstPedEntrega.frPedEntrega);
end;

procedure TZFPregPedEntrega.EFClienteDChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedEntrega.CambiaClienteD(StrToIntDef(EFClienteD.Text, 0));
end;

procedure TZFPregPedEntrega.EFClienteHChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedEntrega.CambiaClienteH(StrToIntDef(EFClienteH.Text, 0));
end;

procedure TZFPregPedEntrega.RBChange(Sender: TObject);
begin
  inherited;
  LblTransportistaD.Visible := (RBEnvio.Checked);
  LblTransportistaH.Visible := (RBEnvio.Checked);
  EFTransportistaD.Visible := (RBEnvio.Checked);
  EFTransportistaH.Visible := (RBEnvio.Checked);
  DBETransportistaD.Visible := (RBEnvio.Checked);
  DBETransportistaH.Visible := (RBEnvio.Checked);

  LblDiaD.Visible := (RBCamion.Checked);
  LblDiaH.Visible := (RBCamion.Checked);
  EFDiaD.Visible := (RBCamion.Checked);
  EFDiaH.Visible := (RBCamion.Checked);
end;

procedure TZFPregPedEntrega.EFTransportistaDChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedEntrega.CambiaTransportistaD(StrToIntDef(EFTransportistaD.Text, 0));
end;

procedure TZFPregPedEntrega.EFTransportistaHChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedEntrega.CambiaTransportistaH(StrToIntDef(EFTransportistaH.Text, 0));
end;

procedure TZFPregPedEntrega.MostrarListado(Modo: byte);
var
  TransportistaD, TransportistaH : integer;
  DiasD, DiasH : integer;
  Serie : string;
begin
  ZDMLstPedEntrega.Comentario := EComentario.Text;
  ZDMLstPedEntrega.Valorar := (ChkBValorado.State = cbChecked);

  Serie := CBSeries.Text;
  if (Serie = _('Todas las Series')) then
     Serie := ' '
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
  end;

  CBOrdenChange(Self);

  TransportistaD := 1;
  TransportistaH := 7067;
  DiasD := -99;
  DiasH := -99;
  if (RBRecoge.Checked) then
  begin
     {
     TransportistaD := 1;//7067;
     TransportistaH := 7067;
     DiasD := -99;
     DiasH := -99;
     }
  end
  else if (RBCamion.Checked) then
  begin
     // TransportistaD := 1;
     TransportistaH := 7068;
     DiasD := StrToIntDef(EFDiaD.Text, 0);
     DiasH := StrToIntDef(EFDiaH.Text, 0);
  end
  else if (RBEnvio.Checked) then
  begin
     TransportistaD := StrToIntDef(EFTransportistaD.Text, 0);
     TransportistaH := StrToIntDef(EFTransportistaH.Text, 0);
     // DiasD := -99;
     // DiasH := -99;
  end;

  if PCMain.ActivePage = TSListado then
  begin
     ZDMLstPedEntrega.MostrarListado(Modo, Serie, DateEFechaD.Date, DateEFechaH.Date,
        DateEFechaPrevD.Date, DateEFechaPrevH.Date, TDPFechaListado.Date,
        StrToIntDef(EFClienteD.Text, 0), StrToIntDef(EFClienteH.Text, 0),
        TransportistaD, TransportistaH, DiasD, DiasH, StrToInt(EFCanalD.Text), StrToInt(EFCanalH.Text), LFDAgrupacion.Text, LFHAgrupacion.Text);
  end;
end;

procedure TZFPregPedEntrega.EFCanalDChange(Sender: TObject);
begin
  inherited;
  Actualiza_CanalRO(ZDMLstPedEntrega.xCanalDesde, StrToInt(EFCanalD.Text));
end;

procedure TZFPregPedEntrega.EFCanalHChange(Sender: TObject);
begin
  inherited;
  Actualiza_CanalRO(ZDMLstPedEntrega.xCanalHasta, StrToInt(EFCanalH.Text));
end;

procedure TZFPregPedEntrega.LFDAgrupacionChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedEntrega.ActualizaAgrupacion(LFDAgrupacion.Text, 'D');
end;

procedure TZFPregPedEntrega.LFHAgrupacionChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedEntrega.ActualizaAgrupacion(LFHAgrupacion.Text, 'H');
end;

end.
