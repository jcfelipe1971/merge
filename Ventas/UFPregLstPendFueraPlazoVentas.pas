unit UFPregLstPendFueraPlazoVentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, StdCtrls, ULFCheckBox, ActnList, ULFActionList,
  ComCtrls, ULFPageControl, ToolWin, ULFToolBar, rxToolEdit, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel,
  ULFComboBox, ULFEdit, ULFEditFind2000, ULFDBEdit, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregLstPendFueraPlazoVentas = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     LFPPendFueraPlazo: TLFPanel;
     LBLCliH: TLFLabel;
     LBLCliD: TLFLabel;
     LDesdeFecha: TLFLabel;
     EFCliD: TLFEditFind2000;
     EClienteD: TLFEdit;
     EFCliH: TLFEditFind2000;
     EClienteH: TLFEdit;
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
     TBMultiSerie: TToolButton;
     AMultiSerie: TAction;
     LDesdeFamilia: TLabel;
     LHastaFamilia: TLabel;
     EFDesdeFamilia: TLFEditFind2000;
     EFHastaFamilia: TLFEditFind2000;
     EDesdeFamiliaTitulo: TLFEdit;
     EHastaFamiliaTitulo: TLFEdit;
     procedure ASalirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure CBOrdenChange(Sender: TObject);
     procedure EFCliHChange(Sender: TObject);
     procedure EFCliDChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AMultiSerieExecute(Sender: TObject);
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
  FPregLstPendFueraPlazoVentas : TFPregLstPendFueraPlazoVentas;

implementation

uses UEntorno, UFormGest, UFMListConfig, UDMLstPendFueraPlazoVentas, UFMMultiSerie, UUtiles,
  UDMMain, UDameDato;

{$R *.dfm}

procedure TFPregLstPendFueraPlazoVentas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPendFueraPlazoVentas, DMLstPendFueraPlazoVentas);
  CBOrden.Clear;
  CBOrden.Items.Add(_('Por cliente'));
  CBOrden.Items.Add(_('Por pedido'));
  CBOrden.ItemIndex := 0;
  // Copio el stringlist a formulario del listado
  SentenciaWhere := TStringList.Create;
  SentenciaWhere.Add('(' + chr(39) + REntorno.Serie + chr(39) + ')');
  Carga;
  CBOrdenChange(Sender);
  Grupo := 189;
  Listado := DMLstPendFueraPlazoVentas.frPendFueraPlazo;
  EFDesdeFamilia.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
  EFHastaFamilia.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstPendFueraPlazoVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMLstPendFueraPlazoVentas.BorraTMP;
  CierraData(DMLstPendFueraPlazoVentas);
  SentenciaWhere.Free;
end;

procedure TFPregLstPendFueraPlazoVentas.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregLstPendFueraPlazoVentas.APrevExecute(Sender: TObject);
begin
  MostrarListado(0);
end;

procedure TFPregLstPendFueraPlazoVentas.AImprimirExecute(Sender: TObject);
begin
  MostrarListado(1);
end;

procedure TFPregLstPendFueraPlazoVentas.MostrarListado(Modo: smallint);
var
  tipo_servido, tipo_servido2 : integer;
begin
  DMLstPendFueraPlazoVentas.Comentario := EComentario.Text;
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
  DMLstPendFueraPlazoVentas.Muestra(Modo, EFDesdeFamilia.Text, EFHastaFamilia.Text, DTPFechaD.Date, DTPFechaH.Date,
     StrToInt(EFCliD.Text),
     StrToInt(EFCliH.Text), tipo_servido, tipo_servido2);
end;

procedure TFPregLstPendFueraPlazoVentas.EFCliDChange(Sender: TObject);
begin
  EClienteD.Text := DameTituloCliente(StrToIntDef(EFCliD.Text, 0));
end;

procedure TFPregLstPendFueraPlazoVentas.EFCliHChange(Sender: TObject);
begin
  EClienteH.Text := DameTituloCliente(StrToIntDef(EFCliH.Text, 0));
end;

procedure TFPregLstPendFueraPlazoVentas.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPregLstPendFueraPlazoVentas.CBOrdenChange(Sender: TObject);
begin
  inherited;
  DMLstPendFueraPlazoVentas.xPendFueraPlazo.Close;
  with DMLstPendFueraPlazoVentas.xPendFueraPlazo.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM LST_PED_FUERA_PLAZO_S ');
     Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :FAMILIA_DESDE, :FAMILIA_HASTA, ');
     Add(' :FECHAD, :FECHAH, :CLIENTED, :CLIENTEH, :TIPO_SERVIDO, :TIPO_SERVIDO2, :ENTRADA) ');
     // SelectSql.Add('where v_serie in ' + SentenciaWhere.Strings[0]);

     if (CBOrden.ItemIndex = 0) then //Orden por cliente
        Add(' ORDER BY V_CODCLIENTE, V_SERIE ');
     if (CBOrden.ItemIndex = 1) then //Orden por  pedido
        Add(' ORDER BY V_SERIE, V_RIGPEP ');
  end;
end;

procedure TFPregLstPendFueraPlazoVentas.Carga;
var
  sMin, sMax : string;
  iMin, iMax : integer;
begin
  DameMinMax('CLI', iMin, iMax);
  EFCliD.Text := IntToStr(iMin);
  EFCliH.Text := IntToStr(iMax);

  DameMinMax('FAM', sMin, sMax);
  EFDesdeFamilia.Text := sMin;
  EFHastaFamilia.Text := sMax;

  DTPFechaD.Date := DMLstPendFueraPlazoVentas.FechaPrimerPedido;
  DTPFechaH.Date := REntorno.FechaTrabSH;
  DTPFechaListado.Date := REntorno.FechaTrabSH;

  RGPlazos.ItemIndex := 3;
  RGServidos.ItemIndex := 3;
end;

procedure TFPregLstPendFueraPlazoVentas.AMultiSerieExecute(Sender: TObject);
begin
  inherited;
  TFMMultiSerie.Create(Self).RellenaSeries(SentenciaWhere);
end;

procedure TFPregLstPendFueraPlazoVentas.EFDesdeFamiliaChange(Sender: TObject);
begin
  inherited;
  EDesdeFamiliaTitulo.Text := DameTituloFamilia(EFDesdeFamilia.Text);
end;

procedure TFPregLstPendFueraPlazoVentas.EFHastaFamiliaChange(Sender: TObject);
begin
  inherited;
  EHastaFamiliaTitulo.Text := DameTituloFamilia(EFHastaFamilia.Text);
end;

end.
