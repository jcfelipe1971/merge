unit UFPregLstPendFueraPlazo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, StdCtrls, ULFCheckBox, ActnList, ULFActionList,
  ComCtrls, ULFPageControl, ToolWin, ULFToolBar, rxToolEdit, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel,
  ULFComboBox, ULFEdit, ULFEditFind2000, ULFDBEdit, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregLstPendFueraPlazo = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     LFPPendFueraPlazo: TLFPanel;
     LHastaProveedor: TLFLabel;
     LDesdeProveedor: TLFLabel;
     LDesdeFecha: TLFLabel;
     EFProvD: TLFEditFind2000;
     DBEProveedorD: TLFEdit;
     EFProvH: TLFEditFind2000;
     DBEProveedorH: TLFEdit;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     LHastaFecha: TLFLabel;
     PNLOrden: TLFPanel;
     LComentario: TLFLabel;
     LOrden: TLFLabel;
     LFechaListado: TLFLabel;
     EComentario: TLFEdit;
     CBOrden: TLFComboBox;
     DTPFechaListado: TLFDateEdit;
     LFPFueraPlazo: TLFPanel;
     RGPlazos: TRadioGroup;
     RGServidos: TRadioGroup;
     TButtMultiserie: TToolButton;
     AMultiserie: TAction;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFDesdeFamilia: TLFEditFind2000;
     EFHastaFamilia: TLFEditFind2000;
     EDesdeFamiliaTitulo: TLFEdit;
     EHastaFamiliaTitulo: TLFEdit;
     procedure ASalirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure CBOrdenChange(Sender: TObject);
     procedure EFProvHChange(Sender: TObject);
     procedure EFProvDChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AMultiserieExecute(Sender: TObject);
     procedure EFDesdeFamiliaChange(Sender: TObject);
     procedure EFHastaFamiliaChange(Sender: TObject);
  private
     { Private declarations }
     SentenciaWhere: TStringList;
     procedure MostrarListado(Modo: smallint);
     procedure Carga;
  public
     { Public declarations }
  end;

var
  FPregLstPendFueraPlazo : TFPregLstPendFueraPlazo;

implementation

uses UEntorno, UFormGest, UFMListConfig, UDMLstPendFueraPlazo, UFMMultiSerie,
  UDMMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TFPregLstPendFueraPlazo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPendFueraPlazo, DMLstPendFueraPlazo);
  Carga;
  CBOrden.Clear;
  CBOrden.Items.Add(_('Por Proveedor'));
  CBOrden.Items.Add(_('Por Pedido'));
  CBOrden.ItemIndex := 0;
  // Copio el StringList a formulario del listado
  SentenciaWhere := TStringList.Create;
  SentenciaWhere.Add('(' + chr(39) + REntorno.Serie + chr(39) + ')');
  CBOrdenChange(Sender);
  Grupo := 157;
  Listado := DMLstPendFueraPlazo.frPendFueraPlazo;
  EFDesdeFamilia.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
  EFHastaFamilia.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstPendFueraPlazo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMLstPendFueraPlazo.BorraTMP;
  SentenciaWhere.Free;
  CierraData(DMLstPendFueraPlazo);
end;

procedure TFPregLstPendFueraPlazo.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregLstPendFueraPlazo.APrevExecute(Sender: TObject);
begin
  MostrarListado(0);
end;

procedure TFPregLstPendFueraPlazo.AImprimirExecute(Sender: TObject);
begin
  MostrarListado(1);
end;

procedure TFPregLstPendFueraPlazo.MostrarListado(Modo: smallint);
var
  tipo_servido, tipo_servido2 : integer;
begin
  DMLstPendFueraPlazo.Comentario := EComentario.Text;
  tipo_servido := -1;
  if (RGServidos.ItemIndex = 0) then
     tipo_servido := 0; // Mostrará sólo los pendientes
  if (RGServidos.ItemIndex = 1) then
     tipo_servido := 1; // Mostrará sólo los Servidos Parcial
  if (RGServidos.ItemIndex = 2) then
     tipo_servido := 10; // Mostrará sólo los Servidos Total
  if (RGServidos.ItemIndex = 3) then
     tipo_servido := 11; // Los mostrará todos

  tipo_servido2 := -1;
  if (RGPlazos.ItemIndex = 0) then
     tipo_servido2 := 0; // Mostrará sólo los pedidos Fuera de plazo
  if (RGPlazos.ItemIndex = 1) then
     tipo_servido2 := 1; // Mostrará sólo los pedidos que hayan cumplido el plazo
  if (RGPlazos.ItemIndex = 2) then
     tipo_servido2 := 10; // Mostrará sólo los pedidos que están por recibir
  if (RGPlazos.ItemIndex = 3) then
     tipo_servido2 := 11; // Mostrará todos los pedidos

  CBOrdenChange(Self);
  DMLstPendFueraPlazo.Muestra(Modo, EFDesdeFamilia.Text, EFHastaFamilia.Text, DTPFechaD.Date, DTPFechaH.Date,
     StrToInt(EFProvD.Text),
     StrToInt(EFProvH.Text), tipo_servido, tipo_servido2);
end;

procedure TFPregLstPendFueraPlazo.EFProvDChange(Sender: TObject);
begin
  DBEProveedorD.Text := DameTituloProveedor(StrToIntDef(EFProvD.Text, 0));
end;

procedure TFPregLstPendFueraPlazo.EFProvHChange(Sender: TObject);
begin
  DBEProveedorH.Text := DameTituloProveedor(StrToIntDef(EFProvH.Text, 0));
end;

procedure TFPregLstPendFueraPlazo.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPregLstPendFueraPlazo.CBOrdenChange(Sender: TObject);
begin
  inherited;
  DMLstPendFueraPlazo.xLstPendFueraPlazo.Close;

  with DMLstPendFueraPlazo.xLstPendFueraPlazo.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM LST_PED_FUERA_PLAZO ');
     Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :FAMILIA_DESDE, :FAMILIA_HASTA, ');
     Add(' :FECHAD, :FECHAH, :PROVD, :PROVH, :SERVIDO, :SERVIDO2, :ENTRADA) ');
     // Add('where v_serie in ' + SentenciaWhere.Strings[0]);
     if (CBOrden.ItemIndex = 0) then // Orden por proveedor
        Add(' ORDER BY V_CODPROVEEDOR,V_SERIE ');
     if (CBOrden.ItemIndex = 1) then // Orden por  pedido
        Add(' ORDER BY V_SERIE,V_RIGPEP ');
  end;
end;

procedure TFPregLstPendFueraPlazo.Carga;
var
  sMin, sMax : string;
  iMin, iMax : integer;
begin
  DameMinMax('PRO', iMin, iMax);
  EFProvD.Text := IntToStr(iMin);
  EFProvH.Text := IntToStr(iMax);

  DameMinMax('FAM', sMin, sMax);
  EFDesdeFamilia.Text := sMin;
  EFHastaFamilia.Text := sMax;

  DTPFechaD.Date := DMLstPendFueraPlazo.FechaPrimerPedido;
  DTPFechaH.Date := REntorno.FechaTrabSH;
  DTPFechaListado.Date := REntorno.FechaTrabSH;

  RGPlazos.ItemIndex := 3;
  RGServidos.ItemIndex := 3;
end;

procedure TFPregLstPendFueraPlazo.AMultiserieExecute(Sender: TObject);
begin
  inherited;
  TFMMultiSerie.Create(Self).RellenaSeries(SentenciaWhere);
end;

procedure TFPregLstPendFueraPlazo.EFDesdeFamiliaChange(Sender: TObject);
begin
  inherited;
  EDesdeFamiliaTitulo.Text := DameTituloFamilia(EFDesdeFamilia.Text);
end;

procedure TFPregLstPendFueraPlazo.EFHastaFamiliaChange(Sender: TObject);
begin
  inherited;
  EHastaFamiliaTitulo.Text := DameTituloFamilia(EFHastaFamilia.Text);
end;

end.
