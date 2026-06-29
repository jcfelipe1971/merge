unit UProFMRelPedidosV;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ULFPanel, ULFLabel, UFormGest, ComCtrls,
  ToolWin, UEditPanel, UDMMain, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEdit, UEntorno, ULFDBEdit, ULFToolBar,
  ActnList, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ULFActionList,
  Menus, UTeclas, UControlEdit;

type
  TProFMRelPedidosV = class(TFPEditSinNavegador)
     RBSeleccionar: TRadioGroup;
     PNLBuscar: TLFPanel;
     PnlSelec: TLFPanel;
     LblSelec: TLFLabel;
     TBGenerar: TToolButton;
     EFSelecc: TEditFind2000;
     LblBusca: TLFLabel;
     LblPlantilla: TLFLabel;
     LFDescSelecc: TLFDbedit;
     LFDArticle: TLFDbedit;
     AOfertesE: TAction;
     AEscandalls: TAction;
     RGPlantilla: TRadioGroup;
     LBarraEstado: TLFLabel;
     procedure RBSeleccionarClick(Sender: TObject);
     procedure EFSeleccBusqueda(Sender: TObject);
     procedure RGPlantillaClick(Sender: TObject);
     procedure EFSeleccChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBGenerarClick(Sender: TObject);
     procedure AOfertesEExecute(Sender: TObject);
     procedure AEscandallsExecute(Sender: TObject);
  private
     { Private declarations }
     procedure PNLBuscarPlantillaHabilitado(Mostrar: boolean);
  public
     { Public declarations }
     procedure Seleccionar(Indice: integer);
  end;

var
  ProFMRelPedidosV : TProFMRelPedidosV;

implementation

uses UProDMRelPedidosV, UDMPedidos, DB, UFMain, UDameDato;

{$R *.dfm}

procedure TProFMRelPedidosV.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMRelPedidosV, ProDMRelPedidosV);
  Seleccionar(0);
end;

procedure TProFMRelPedidosV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMRelPedidosV);
end;

procedure TProFMRelPedidosV.Seleccionar(Indice: integer);
begin
  RBSeleccionar.ItemIndex := Indice;
  RBSeleccionarClick(nil);
end;

procedure TProFMRelPedidosV.RBSeleccionarClick(Sender: TObject);
begin
  if (RBSeleccionar.ItemIndex = 1) then
  begin
     RGPlantilla.Visible := True;
     RGPlantilla.ItemIndex := -1;
     PnlBuscar.Visible := True;
     PnlBuscar.Enabled := True;
     LblBusca.Caption := _('Buscar plantilla para escandallo');
     LblPlantilla.Caption := _('Plantilla');
     EFSelecc.Left := 65;
     LFDArticle.Left := 119;
     LFDescSelecc.Left := 191;
     PNLBuscarPlantillaHabilitado(True);
  end
  else if (RBSeleccionar.ItemIndex = 0) then
  begin
     PNLBuscarPlantillaHabilitado(False);
     RGPlantilla.Visible := False;
     PnlBuscar.Visible := True;
     PnlBuscar.Enabled := True;
     // Barra d'estat
     LBarraEstado.Caption := Format(_('Crear escandallo de: %s - %s'), [DMPedidos.QMDetalleARTICULO.AsString, DMPedidos.QMDetalleTITULO.AsString]);
  end
  else if (RBSeleccionar.ItemIndex = 2) then
  begin
     PNLBuscarPlantillaHabilitado(True);
     RGPlantilla.Visible := False;
     RGPlantilla.ItemIndex := 1;
     PnlBuscar.Visible := True;
     PnlBuscar.Enabled := True;
     LblBusca.Caption := _('Asignar nuevo escandallo');
     LblPlantilla.Caption := _('Escandallo');
     EFSelecc.Left := 80;
     LFDArticle.Left := 134;
     LFDescSelecc.Left := 206;

     // Barra d'estat
     ProDMRelPedidosV.xBuscaEscandallo.Close;
     ProDMRelPedidosV.xBuscaEscandallo.Params.ByName['ID_ESC'].AsInteger := DMPedidos.QMDetalleID_ESC.AsInteger;
     ProDMRelPedidosV.xBuscaEscandallo.Open;
     LBarraEstado.Caption := Format(_('Escandallo actual asignado: %s - %s'), [ProDMRelPedidosV.xBuscaEscandallo.Fields[0].AsString, DameTituloIdEscandalloProduccion(DMPedidos.QMDetalleID_ESC.AsInteger)]);
  end;

  EFSelecc.Clear;
  LFDescSelecc.Clear;
  LFDArticle.Clear;
end;

procedure TProFMRelPedidosV.EFSeleccBusqueda(Sender: TObject);
begin
  with EFSelecc do
  begin
     case RGPlantilla.ItemIndex of
        0: CondicionBusqueda := 'TIPO = ''OFE'' ';
        1: CondicionBusqueda := 'TIPO = ''EPR'' ';
        else
           CondicionBusqueda := 'TIPO = '''' ';
     end;

     if ((RBSeleccionar.ItemIndex = 2) and (ProDMRelPedidosV.ComprobarValorDefecto = 1)) then
     begin
        CondicionBusqueda := CondicionBusqueda +
           ' AND COMPUESTO=''' + DMPedidos.QMDetalleARTICULO.AsString + '''';
     end;
  end;
end;

procedure TProFMRelPedidosV.RGPlantillaClick(Sender: TObject);
begin
  // Es posa a enabled el panell de selecció
  PnlBuscar.Enabled := True;
  EFSelecc.Clear;
  LFDescSelecc.Clear;
  LFDArticle.Clear;
  EFSelecc.SetFocus;
end;

procedure TProFMRelPedidosV.EFSeleccChange(Sender: TObject);
var
  TipoEsc : string;
begin
  if (EFSelecc.Text <> '') then
  begin
     if (RGPlantilla.ItemIndex = 0) then
        TipoEsc := 'OFE'
     else if (RGPlantilla.ItemIndex = 1) then
        TipoEsc := 'EPR';

     with ProDMRelPedidosV.xEscandallo do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ESCANDALLO'].AsInteger := StrToInt(EFSelecc.Text);
        Params.ByName['TIPO'].AsString := TipoEsc;
        Open;
     end;
  end;
end;

procedure TProFMRelPedidosV.TBGenerarClick(Sender: TObject);
begin
  ProDMRelPedidosV.Generar(RBSeleccionar.ItemIndex, RGPlantilla.ItemIndex, StrToInt(EFSelecc.Text));
  Close;
end;

procedure TProFMRelPedidosV.AOfertesEExecute(Sender: TObject);
var
  Valor : string;
begin
  if ((RBSeleccionar.ItemIndex = 0){ or (RBSeleccionar.ItemIndex=1)}) then
     Valor := ProDMRelPedidosV.xBuscarUltimEscandall.Fields[0].AsString
  else if (RBSeleccionar.ItemIndex = 1) then
     Valor := ProDMRelPedidosV.xDuplicarPedido.Fields[0].AsString;

  if (Valor <> '') then
     FMain.EjecutaAccion(FMain.AProOfertasE, 'ESCANDALLO = ' + Valor);
end;

procedure TProFMRelPedidosV.AEscandallsExecute(Sender: TObject);
begin
  ProDMRelPedidosV.AbreEscandallo(RBSeleccionar.ItemIndex);
end;

procedure TProFMRelPedidosV.PNLBuscarPlantillaHabilitado(Mostrar: boolean);
begin
  PNLBuscar.Visible := Mostrar;
  // PNLBuscar.Height := 216;
end;

end.
