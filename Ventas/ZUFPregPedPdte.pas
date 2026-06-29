unit ZUFPregPedPdte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, StdCtrls, ComCtrls, ExtCtrls,
  ToolWin, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, DateUtils,
  UDBDateTimePicker, Grids, DBGrids, rxToolEdit, ULFDBEdit, ULFActionList,
  ULFComboBox, ULFEdit, ULFPanel, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, ULFDateEdit, rxPlacemnt, ULFFormStorage;

type
  TZFPregPedPdte = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     TSCliente: TTabSheet;
     TSArticulo: TTabSheet;
     TSFechaE: TTabSheet;
     Panel3: TLFPanel;
     Panel4: TLFPanel;
     Panel5: TLFPanel;
     LClienteD: TLFLabel;
     EFClienteD: TLFEditFind2000;
     DBEClienteD: TLFDbedit;
     DBEClienteH: TLFDbedit;
     EFClienteH: TLFEditFind2000;
     LClienteH: TLFLabel;
     Label5: TLFLabel;
     Label6: TLFLabel;
     DTPFechaD: TDateEdit;
     DTPFechaH: TDateEdit;
     LArtFechaD: TLFLabel;
     DTPFechaArtD: TDateEdit;
     DTPFechaArtH: TDateEdit;
     LArtFechaH: TLFLabel;
     RBServido: TRadioButton;
     RBPdteServir: TRadioButton;
     RBTodos: TRadioButton;
     DTPFechaED: TDateEdit;
     DTPFechaEH: TDateEdit;
     LFechaD: TLFLabel;
     LFechaEH: TLFLabel;
     TSAgente: TTabSheet;
     Panel6: TLFPanel;
     LabelAgenteD: TLFLabel;
     LabelAgenteH: TLFLabel;
     DBEAgenteD: TLFDbedit;
     DBEAgenteH: TLFDbedit;
     EFAgenteD: TLFEditFind2000;
     EFAgenteH: TLFEditFind2000;
     LabelFechaD: TLFLabel;
     LabelFechaH: TLFLabel;
     DTPFechaAgenteD: TDateEdit;
     DTPFechaAgenteH: TDateEdit;
     TButtMultiSerie: TToolButton;
     AMultiSerie: TAction;
     LBLFamDesde: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     DBEFamiliaD: TLFDbedit;
     LBLFamHasta: TLFLabel;
     EFFamiliaH: TLFEditFind2000;
     DBEFamiliaH: TLFDbedit;
     LArticuloD: TLFLabel;
     EFArticuloD: TLFEditFind2000;
     DBEArticuloD: TLFDbedit;
     LArticuloH: TLFLabel;
     EFArticuloH: TLFEditFind2000;
     DBEArticuloH: TLFDbedit;
     GBCanal: TGroupBox;
     LCanalD: TLFLabel;
     LCanalH: TLFLabel;
     EFCanalD: TLFEditFind2000;
     EFCanalH: TLFEditFind2000;
     DBECanadD: TLFDbedit;
     DBECanalH: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure CBOrdenChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
     procedure AMultiSerieExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure EFCanalDChange(Sender: TObject);
     procedure EFCanalHChange(Sender: TObject);
  private
     { Private declarations }
     SentenciaWhere: TStringList;
  public
     { Public declarations }
  end;

var
  ZFPregPedPdte : TZFPregPedPdte;

implementation

uses UDMMain, ZUDMLstPedPdte, UFormGest, UFMain, UEntorno, UFMMultiSerie, UFMListConfig,
  UDMMultiSerie, UUtiles;

{$R *.dfm}

procedure TZFPregPedPdte.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstPedPdte, ZDMLstPedPdte);
  AbreData(TDMMultiSerie, DMMultiSerie);
  PNLTop.Visible := True;
  ARecargar.Execute;
  PCMain.ActivePage := TSCliente;
  CBOrden.Clear;
  CBOrden.Items.Add(_('Por Cliente'));
  CBOrden.Items.Add(_('Por Fecha del Pedido'));
  CBOrden.Items.Add(_('Por Número de Pedido'));
  CBOrden.ItemIndex := 0;

  // Copio el stringlist al formulario del listado
  SentenciaWhere := TStringList.Create;
  SentenciaWhere.Add('where v_serie in (' + chr(39) + REntorno.Serie + chr(39) + ')');

  CBOrdenChange(Sender);
  TDPFechaListado.Date := REntorno.FechaTrabSH;
end;

procedure TZFPregPedPdte.ARecargarExecute(Sender: TObject);
var
  year, month, day, dias : word;
begin
  inherited;
  ZDMLstPedPdte.Recargar;
  EFClienteD.Text := ZDMLstPedPdte.CliMin;
  EFClienteH.Text := ZDMLstPedPdte.CliMax;
  EFFamiliaD.Text := ZDMLstPedPdte.FamMin;
  EFFamiliaH.Text := ZDMLstPedPdte.FamMax;
  EFArticuloD.Text := ZDMLstPedPdte.ArtMin;
  EFArticuloH.Text := ZDMLstPedPdte.ArtMax;
  EFAgenteD.Text := ZDMLstPedPdte.AgenteMin;
  EFAgenteH.Text := ZDMLstPedPdte.AgenteMax;
  // sfg.albert
  EFCanalD.Text := ZDMLstPedPdte.CanalMin;
  EFCanalH.Text := ZDMLstPedPdte.CanalMax;

  // Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dias := DaysInMonth(REntorno.FechaTrabSH);

  DTPFechaD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  DTPFechaArtD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaArtH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  DTPFechaED.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaEH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  DTPFechaAgenteD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaAgenteH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
end;

procedure TZFPregPedPdte.APrevExecute(Sender: TObject);
var
  tipo_servido : integer;
begin
  inherited;
  ZDMLstPedPdte.Comentario := EComentario.Text;
  tipo_servido := -1;
  if (RBPdteServir.Checked) then
     tipo_servido := 0; // Mostrará sólo los pendientes de servir
  if (RBServido.Checked) then
     tipo_servido := 1; // Mostrará sólo los servidos
  if (RBTodos.Checked) then
     tipo_servido := 10; // Los mostrará todos

  CBOrdenChange(Sender);

  if PCMain.ActivePage = TSCliente then
  begin
     ZDMLstPedPdte.MostrarListado(0, DTPFechaD.Date, DTPFechaH.Date,
        StrToIntDef(EFClienteD.Text, 0),
        StrToIntDef(EFClienteH.Text, 0), ZDMLstPedPdte.FamMin, ZDMLstPedPdte.FamMax,
        ZDMLstPedPdte.ArtMin,
        ZDMLstPedPdte.ArtMax, tipo_servido, 1, '0', TDPFechaListado.Date,
        StrToIntDef(ZDMLstPedPdte.AgenteMin, 0), StrToIntDef(ZDMLstPedPdte.AgenteMax, 0), StrToInt(EFCanalD.Text),
        StrToInt(EFCanalH.Text));
  end;
  if PCMain.ActivePage = TSArticulo then
  begin
     ZDMLstPedPdte.MostrarListado(0, DTPFechaArtD.Date, DTPFechaArtH.Date,
        StrToIntDef(ZDMLstPedPdte.CliMin, 0),
        StrToIntDef(ZDMLstPedPdte.CliMax, 0), EFFamiliaD.Text,
        EFFamiliaH.Text, EFArticuloD.Text,
        EFArticuloH.Text, tipo_servido, 2, '0', TDPFechaListado.Date,
        StrToIntDef(ZDMLstPedPdte.AgenteMin, 0),
        StrToIntDef(ZDMLstPedPdte.AgenteMax, 0), StrToInt(EFCanalD.Text),
        StrToInt(EFCanalH.Text));
  end;
  if PCMain.ActivePage = TSFechaE then
  begin
     ZDMLstPedPdte.MostrarListado(0, DTPFechaED.Date, DTPFechaEH.Date,
        StrToIntDef(ZDMLstPedPdte.CliMin, 0),
        StrToIntDef(ZDMLstPedPdte.CliMax, 0), ZDMLstPedPdte.FamMin,
        ZDMLstPedPdte.FamMax, ZDMLstPedPdte.ArtMin,
        ZDMLstPedPdte.ArtMax, tipo_servido, 3, '0', TDPFechaListado.Date,
        StrToIntDef(ZDMLstPedPdte.AgenteMin, 0),
        StrToIntDef(ZDMLstPedPdte.AgenteMax, 0), StrToInt(EFCanalD.Text),
        StrToInt(EFCanalH.Text));
  end;
  if PCMain.ActivePage = TSAgente then
  begin
     ZDMLstPedPdte.MostrarListado(0, DTPFechaAgenteD.Date, DTPFechaAgenteH.Date,
        StrToIntDef(ZDMLstPedPdte.CliMin, 0),
        StrToIntDef(ZDMLstPedPdte.CliMax, 0), ZDMLstPedPdte.FamMin,
        ZDMLstPedPdte.FamMax, ZDMLstPedPdte.ArtMin,
        ZDMLstPedPdte.ArtMax, tipo_servido, 4, '0', TDPFechaListado.Date,
        StrToIntDef(EFAgenteD.Text, 0),
        StrToIntDef(EFAgenteH.Text, 0), StrToInt(EFCanalD.Text),
        StrToInt(EFCanalH.Text));
  end;
end;

procedure TZFPregPedPdte.AImprimirExecute(Sender: TObject);
var
  tipo_servido : integer;
begin
  inherited;
  ZDMLstPedPdte.Comentario := EComentario.Text;
  tipo_servido := -1;
  if (RBPdteServir.Checked) then
     tipo_servido := 0; // Mostrará sólo los pendientes de servir
  if (RBServido.Checked) then
     tipo_servido := 1; // Mostrará sólo los servidos
  if (RBTodos.Checked) then
     tipo_servido := 10; // Los mostrará todos

  CBOrdenChange(Sender);

  if PCMain.ActivePage = TSCliente then
  begin
     ZDMLstPedPdte.MostrarListado(1, DTPFechaD.Date, DTPFechaH.Date,
        StrToIntDef(EFClienteD.Text, 0),
        StrToIntDef(EFClienteH.Text, 0), ZDMLstPedPdte.FamMin, ZDMLstPedPdte.FamMax,
        ZDMLstPedPdte.ArtMin,
        ZDMLstPedPdte.ArtMax, tipo_servido, 1, '0', TDPFechaListado.Date,
        StrToIntDef(ZDMLstPedPdte.AgenteMin, 0), StrToIntDef(ZDMLstPedPdte.AgenteMax, 0), StrToInt(EFCanalD.Text),
        StrToInt(EFCanalH.Text));
  end;
  if PCMain.ActivePage = TSArticulo then
  begin
     ZDMLstPedPdte.MostrarListado(1, DTPFechaArtD.Date, DTPFechaArtH.Date,
        StrToIntDef(ZDMLstPedPdte.CliMin, 0),
        StrToIntDef(ZDMLstPedPdte.CliMax, 0), ZDMLstPedPdte.FamMin,
        ZDMLstPedPdte.FamMax, EFArticuloD.Text,
        EFArticuloH.Text, tipo_servido, 2, '0', TDPFechaListado.Date,
        StrToIntDef(ZDMLstPedPdte.AgenteMin, 0),
        StrToIntDef(ZDMLstPedPdte.AgenteMax, 0), StrToInt(EFCanalD.Text),
        StrToInt(EFCanalH.Text));
  end;
  if PCMain.ActivePage = TSFechaE then
  begin
     ZDMLstPedPdte.MostrarListado(1, DTPFechaED.Date, DTPFechaEH.Date,
        StrToIntDef(ZDMLstPedPdte.CliMin, 0),
        StrToIntDef(ZDMLstPedPdte.CliMax, 0), ZDMLstPedPdte.FamMin,
        ZDMLstPedPdte.FamMax, ZDMLstPedPdte.ArtMin,
        ZDMLstPedPdte.ArtMax, tipo_servido, 3, '0', TDPFechaListado.Date,
        StrToIntDef(ZDMLstPedPdte.AgenteMin, 0),
        StrToIntDef(ZDMLstPedPdte.AgenteMax, 0), StrToInt(EFCanalD.Text),
        StrToInt(EFCanalH.Text));
  end;
  if PCMain.ActivePage = TSAgente then
  begin
     ZDMLstPedPdte.MostrarListado(1, DTPFechaAgenteD.Date, DTPFechaAgenteH.Date,
        StrToIntDef(ZDMLstPedPdte.CliMin, 0),
        StrToIntDef(ZDMLstPedPdte.CliMax, 0), ZDMLstPedPdte.FamMin,
        ZDMLstPedPdte.FamMax, ZDMLstPedPdte.ArtMin,
        ZDMLstPedPdte.ArtMax, tipo_servido, 4, '0', TDPFechaListado.Date,
        StrToIntDef(EFAgenteD.Text, 0),
        StrToIntDef(EFAgenteH.Text, 0), StrToInt(EFCanalD.Text),
        StrToInt(EFCanalH.Text));
  end;
end;

procedure TZFPregPedPdte.PCMainChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedPdte.QMListado.Close;
  if (PCMain.ActivePage = TSCliente) then
  begin
     EFClienteD.SetFocus;
     ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Cliente'));
     CBOrden.Items.Add(_('Por Fecha Pedido'));
     CBOrden.Items.Add(_('Por Número Pedido'));
     CBOrden.ItemIndex := 0;
     // Orden por cliente y num. pedido
     ZDMLstPedPdte.QMListado.SelectSQL.Clear;
     ZDMLstPedPdte.QMListado.SelectSQL.Add
     (
        'select * from Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
     ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
     ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_codcliente,v_rigpec');
  end;
  if (PCMain.ActivePage = TSArticulo) then
  begin
     EFFamiliaD.SetFocus;
     ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Artículo'));
     CBOrden.Items.Add(_('Por Fecha'));
     CBOrden.ItemIndex := 0;
     // Orden por artículo y fecha de pedido
     ZDMLstPedPdte.QMListado.SelectSQL.Clear;
     ZDMLstPedPdte.QMListado.SelectSQL.Add
     (
        'select * from Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
     ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
     ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_articulo,v_fechaped');
  end;
  if (PCMain.ActivePage = TSFechaE) then
  begin
     DTPFechaED.SetFocus;
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Fecha Entrega'));
     CBOrden.ItemIndex := 0;
     // Orden por artículo y fecha de pedido
     ZDMLstPedPdte.QMListado.SelectSQL.Clear;
     ZDMLstPedPdte.QMListado.SelectSQL.Add
     (
        'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
     ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
     ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_fecha_entrega_ped,v_codcliente');
  end;
  if (PCMain.ActivePage = TSAgente) then
  begin
     EFAgenteD.SetFocus;
     ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Agente'));
     CBOrden.Items.Add(_('Por Fecha Pedido'));
     CBOrden.Items.Add(_('Por Número Pedido'));
     CBOrden.ItemIndex := 0;
     // Orden por agente y num. pedido
     ZDMLstPedPdte.QMListado.SelectSQL.Clear;
     ZDMLstPedPdte.QMListado.SelectSQL.Add
     (
        'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
     ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
     ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_codagente,v_rigpec');
  end;
end;

procedure TZFPregPedPdte.CBOrdenChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedPdte.QMListado.Close;
  if PCMain.ActivePage = TSCliente then
  begin
     if (CBOrden.ItemIndex = 0) then // Orden por cliente y num. pedido
     begin
        ZDMLstPedPdte.QMListado.SelectSQL.Clear;
        ZDMLstPedPdte.QMListado.SelectSQL.Add
        (
           'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
        ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
        ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_codcliente,v_rigpec');
     end;
     if (CBOrden.ItemIndex = 1) then // Orden por fecha del pedido
     begin
        ZDMLstPedPdte.QMListado.SelectSQL.Clear;
        ZDMLstPedPdte.QMListado.SelectSQL.Add
        (
           'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
        ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
        ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_fechaped');
     end;
     if (CBOrden.ItemIndex = 2) then // Orden por número de pedido
     begin
        ZDMLstPedPdte.QMListado.SelectSQL.Clear;
        ZDMLstPedPdte.QMListado.SelectSQL.Add
        (
           'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
        ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
        ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_rigpec');
     end;
  end;
  if PCMain.ActivePage = TSArticulo then
  begin
     if (CBOrden.ItemIndex = 0) then // Orden por artículo y fecha de pedido
     begin
        ZDMLstPedPdte.QMListado.SelectSQL.Clear;
        ZDMLstPedPdte.QMListado.SelectSQL.Add
        (
           'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
        ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
        ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_articulo,v_fechaped');
     end;
     if (CBOrden.ItemIndex = 1) then // Orden por fecha
     begin
        ZDMLstPedPdte.QMListado.SelectSQL.Clear;
        ZDMLstPedPdte.QMListado.SelectSQL.Add
        (
           'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
        ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
        ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_fechaped');
     end;
  end;
  if PCMain.ActivePage = TSAgente then
  begin
     if (CBOrden.ItemIndex = 0) then // Orden por agente y num. pedido
     begin
        ZDMLstPedPdte.QMListado.SelectSQL.Clear;
        ZDMLstPedPdte.QMListado.SelectSQL.Add
        (
           'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
        ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
        ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_codagente,v_rigpec');
     end;
     if (CBOrden.ItemIndex = 1) then // Orden por fecha del pedido
     begin
        ZDMLstPedPdte.QMListado.SelectSQL.Clear;
        ZDMLstPedPdte.QMListado.SelectSQL.Add
        (
           'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
        ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
        ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_fechaped');
     end;
     if (CBOrden.ItemIndex = 2) then // Orden por número de pedido
     begin
        ZDMLstPedPdte.QMListado.SelectSQL.Clear;
        ZDMLstPedPdte.QMListado.SelectSQL.Add
        (
           'select * from  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)');
        ZDMLstPedPdte.QMListado.SelectSQL.Add(SentenciaWhere.Strings[0]);
        ZDMLstPedPdte.QMListado.SelectSQL.Add('order by v_rigpec');
     end;
  end;
end;

procedure TZFPregPedPdte.EFClienteDChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedPdte.CambiaClienteD(StrToIntDef(EFClienteD.Text, 0));
end;

procedure TZFPregPedPdte.EFClienteHChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedPdte.CambiaClienteH(StrToIntDef(EFClienteH.Text, 0));
end;

procedure TZFPregPedPdte.EFArticuloDChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedPdte.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TZFPregPedPdte.EFArticuloHChange(Sender: TObject);
begin
  inherited;
  ZDMLstPedPdte.CambiaArticuloH(EFArticuloH.Text);
end;

procedure TZFPregPedPdte.EFAgenteDChange(Sender: TObject);
begin
  inherited;
  ZDMLSTPedPdte.CambiaAgenteD(StrToIntDef(EFAgenteD.Text, 0));
end;

procedure TZFPregPedPdte.EFAgenteHChange(Sender: TObject);
begin
  inherited;
  ZDMLSTPedPdte.CambiaAgenteH(StrToIntDef(EFAgenteH.Text, 0));
end;

procedure TZFPregPedPdte.AMultiSerieExecute(Sender: TObject);
begin
  inherited;
  TFMMultiSerie.Create(Self).RellenaSeries(SentenciaWhere);
end;

procedure TZFPregPedPdte.AConfigurarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama, Grupo : integer;
begin
  Grupo := 141;
  if PCMain.ActivePage = TSCliente then
     Grupo := 141
  else if PCMain.ActivePage = TSArticulo then
     Grupo := 142
  else if PCMain.ActivePage = TSFechaE then
     Grupo := 143
  else if PCMain.ActivePage = TSAgente then
     Grupo := 144;

  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias,
     Pijama, '', ZDMLstPedPdte.frPedPdte);
end;

procedure TZFPregPedPdte.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregPedPdte.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregPedPdte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SentenciaWhere.Free;
  CierraData(ZDMLstPedPdte);
  CierraData(DMMultiSerie);
end;

procedure TZFPregPedPdte.EFFamiliaDChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(ZDMLstPedPdte.xFamiliaD, EFFamiliaD.Text);
end;

procedure TZFPregPedPdte.EFFamiliaHChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(ZDMLstPedPdte.xFamiliaH, EFFamiliaH.Text);
end;

procedure TZFPregPedPdte.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregPedPdte.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregPedPdte.EFCanalDChange(Sender: TObject);
begin
  inherited;
  Actualiza_CanalRO(ZDMLstPedPdte.xCanalDesde, StrToInt(EFCanalD.Text));
end;

procedure TZFPregPedPdte.EFCanalHChange(Sender: TObject);
begin
  inherited;
  Actualiza_CanalRO(ZDMLstPedPdte.xCanalHasta, StrToInt(EFCanalH.Text));
end;

end.
