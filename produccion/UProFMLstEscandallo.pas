unit UProFMLstEscandallo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  ToolWin, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, DBCtrls,
  Grids, DBGrids, rxToolEdit, ULFActionList, ULFPageControl, ULFToolBar,
  ULFDBEdit, ULFEditFind2000, ULFComboBox, ULFEdit, ULFPanel, ULFLabel,
  ULFDateEdit, rxPlacemnt, ULFFormStorage;

type
  TProFMLstEscandallo = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     PanelCentral: TLFPanel;
     LEscandallo: TLFLabel;
     EFEsc: TLFEditFind2000;
     DBEEscD: TLFDbedit;
     LCompuesto: TLFLabel;
     LDesdeFase: TLFLabel;
     LHastaFase: TLFLabel;
     EFCompuesto: TLFEditFind2000;
     EFFaseD: TLFEditFind2000;
     EFFaseH: TLFEditFind2000;
     ECompuesto: TLFEdit;
     DBEFaseD: TLFDbedit;
     DBEFaseH: TLFDbedit;
     LListarCabbecera: TLFLabel;
     RBCabSi: TRadioButton;
     RBCabNo: TRadioButton;
     LUnidades: TLFLabel;
     EUnidades: TLFEdit;
     PNLTipoEscandallo: TLFPanel;
     RBOfertasE: TRadioButton;
     RBEscandallo: TRadioButton;
     LTipoEscandallo: TLFLabel;
     PNLListarCabecera: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure EFEscChange(Sender: TObject);
     procedure EFCompuestoChange(Sender: TObject);
     procedure EFEscBusqueda(Sender: TObject);
     procedure EFFaseDChange(Sender: TObject);
     procedure EFFaseDBusqueda(Sender: TObject);
     procedure EFFaseHBusqueda(Sender: TObject);
     procedure EFFaseHChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure RBCabSiClick(Sender: TObject);
     procedure RBCabNoClick(Sender: TObject);
     procedure EFCompuestoExit(Sender: TObject);
     procedure RBEscandalloClick(Sender: TObject);
     procedure RBOfertasEClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     TipusE: string;
  end;

var
  ProFMLstEscandallo : TProFMLstEscandallo;

implementation

uses UDMMain, UProDMLstEscandallo, UEntorno, UDameDato, UFormGest, DB;

{$R *.dfm}

procedure TProFMLstEscandallo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLSTEscandallo, ProDMLSTEscandallo);
  PNLTop.Visible := True;
  ARecargar.Execute;

  Grupo := 8008;
  Listado := ProDMLSTEscandallo.frListadoE;
  ListadoFR3 := ProDMLSTEscandallo.frxListadoE;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  EFCompuesto.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TProFMLstEscandallo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLSTEscandallo);
end;

procedure TProFMLstEscandallo.EFEscChange(Sender: TObject);
begin
  inherited;
  if (EFEsc.Text <> '') then
  begin
     ProDMLstEscandallo.CambiaEscandallo(StrToIntDef(EFEsc.Text, 0));
     EFFaseD.Text := ProDMLstEscandallo.xMinMaxFaseMIN.AsString;
     EFFaseH.Text := ProDMLstEscandallo.xMinMaxFaseMAX.AsString;
  end;

  EUnidades.Text := ProDMLstEscandallo.xEscandalloUNIDADES.AsString;
end;

procedure TProFMLstEscandallo.EFCompuestoChange(Sender: TObject);
begin
  inherited;
  ECompuesto.Text := DameTituloArticulo(EFCompuesto.Text);
end;

procedure TProFMLstEscandallo.EFEscBusqueda(Sender: TObject);
begin
  inherited;
  EFEsc.CondicionBusqueda := 'compuesto=''' + EFCompuesto.Text + '''' + ' and tipo=''' + TipusE + '''';
end;

procedure TProFMLstEscandallo.EFFaseDChange(Sender: TObject);
begin
  inherited;
  if (EFFaseD.Text <> '') then
     ProDMLstEscandallo.CambiaFaseD(StrToInt(EFEsc.Text), StrToInt(EFFaseD.Text));
end;

procedure TProFMLstEscandallo.EFFaseDBusqueda(Sender: TObject);
begin
  inherited;
  EFFaseD.CondicionBusqueda := 'escandallo=''' + EFEsc.Text + '''' + ' and tipo=''' + TipusE + '''';
end;

procedure TProFMLstEscandallo.EFFaseHBusqueda(Sender: TObject);
begin
  inherited;
  EFFaseH.CondicionBusqueda := 'escandallo=''' + EFEsc.Text + '''' + ' and tipo=''' + TipusE + '''';
end;

procedure TProFMLstEscandallo.EFFaseHChange(Sender: TObject);
begin
  inherited;
  if ((EFFaseH.Text <> '') and (EFCompuesto.Text <> '')) then
     ProDMLstEscandallo.CambiaFaseH(StrToInt(EFEsc.Text), StrToInt(EFFaseH.Text));
end;

procedure TProFMLstEscandallo.ARecargarExecute(Sender: TObject);
begin
  inherited;
  EFCompuesto.Text := '';
  ECompuesto.Text := '';
  EFEsc.Text := '';
  DBEEscD.Text := '';
  EUnidades.Text := '';
  EFFaseD.Text := '';
  DBEFaseD.Text := '';
  EFFaseH.Text := '';
  DBEFaseH.Text := '';
  EComentario.Text := '';

  TDPFechaListado.Date := REntorno.FechaTrabSH;

  if ProFMLstEscandallo.Visible then
     EFCompuesto.SetFocus;

  RBCabSi.Checked := True;
  RBCabSiClick(Sender);
end;

procedure TProFMLstEscandallo.RBCabSiClick(Sender: TObject);
begin
  inherited;
  ProDMLstEscandallo.Capsalera := 1;
end;

procedure TProFMLstEscandallo.RBCabNoClick(Sender: TObject);
begin
  inherited;
  ProDMLstEscandallo.Capsalera := 0;
end;

procedure TProFMLstEscandallo.EFCompuestoExit(Sender: TObject);
begin
  inherited;
  if (EFCompuesto.Text = '') then
  begin
     EFCompuesto.SetFocus;
  end;
end;

procedure TProFMLstEscandallo.RBEscandalloClick(Sender: TObject);
begin
  inherited;
  TipusE := 'EPR';
  ProDMLstEscandallo.Tipo_Esc := 'EPR';
end;

procedure TProFMLstEscandallo.RBOfertasEClick(Sender: TObject);
begin
  inherited;
  TipusE := 'OFE';
  ProDMLstEscandallo.Tipo_Esc := 'OFE';
end;

procedure TProFMLstEscandallo.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  TextoFiltro : string;
begin
  if ((EFCompuesto.Text <> '') and (EFEsc.Text <> '') and (EFFaseD.Text <> '') and
     (EFFaseH.Text <> '')) then
  begin
     TextoFiltro := _('Compuesto') + ': ' + ProFMLstEscandallo.EFCompuesto.Text + '  ' +
        ProFMLstEscandallo.ECompuesto.Text + _('Escandallo') + ': ' + ProFMLstEscandallo.EFEsc.Text +
        ' ' + ProFMLstEscandallo.DBEEscD.Text + '  ' + _('Desde Fase') + ' ' +
        ProFMLstEscandallo.EFFaseD.Text + ' ' + ProFMLstEscandallo.DBEFaseD.Text + ' ' +
        _('Hasta Fase') + ' ' + ProFMLstEscandallo.EFFaseH.Text + ' ' +
        ProFMLstEscandallo.DBEFaseH.Text;

     ProDMLstEscandallo.MostrarListado(Modo, StrToInt(EFEsc.Text), EFFaseD.Text, EFFaseH.Text, 0, EComentario.Text, TDPFechaListado.Date, StrToFloat(EUnidades.Text), TextoFiltro, TipusE);
  end
  else
     ShowMessage(_('Algun parametro de este formulario esta vacio.'));
end;

end.
