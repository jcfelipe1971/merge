unit ZUFMMarcManDirecto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, UFIBDBEditfind, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, UComponentesBusquedaFiltrada, dbcgrids, URecursos,
  UFPEdit, ActnList, Buttons, UHYEdits, DbComboBoxValue, Barras,
  UHYDescription, NsDBGrid, rxPlacemnt, ULFCheckBox, ULFDBMemo,
  ULFPageControl, ULFDBCtrlGrid, ULFEdit, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ULFActionList, ULFToolBar, ULFPanel,
  ULFHYDBDescription, DBActns, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  UG2kTBLoc, DB, UFormGest, UFPEditSinNavegador;

type
  TZFMMarcManDirecto = class(TFPEditSinNavegador)
     LbCodBarras: TLFLabel;
     LbTipo: TLFLabel;
     LbOperario: TLFLabel;
     LFDescTipo: TLFEdit;
     LFDescOperario: TLFEdit;
     BProcesa: TToolButton;
     LFTipo: TLFEdit;
     LFBarras: TLFEdit;
     LFOperario: TLFEdit;
     LFMarcaje: TLFEdit;
     LbCadenaMarcaje: TLFLabel;
     LFError: TLFEdit;
     BBorraMarcaje: TToolButton;
     LFDescCliente: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFMarcajeKeyPress(Sender: TObject; var Key: char);
     procedure BProcesaClick(Sender: TObject);
     procedure BBorraMarcajeClick(Sender: TObject);
  private
     { Private declarations }
     procedure GuardaPedido;
     procedure ProcesaCadena;
     procedure MarcajeOperario;
     procedure MarcajeTipo;
     procedure QuitaColor;
     procedure NuevoMarcaje;
  public
     { Public declarations }
  end;

var
  ZFMMarcManDirecto : TZFMMarcManDirecto;

implementation

uses ZUDmMarcManDirecto, UDMMain, UFMain, UDameDato;

{$R *.dfm}

procedure TZFMMarcManDirecto.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDmMarcManDirecto, ZDmMarcManDirecto);
  NuevoMarcaje;
end;

procedure TZFMMarcManDirecto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(ZDmMarcManDirecto);
end;

procedure TZFMMarcManDirecto.LFMarcajeKeyPress(Sender: TObject; var Key: char);
begin
  if ((Key = #13) or (Key = #9)) then
     ProcesaCadena;
end;

procedure TZFMMarcManDirecto.ProcesaCadena;
var
  identifica_cadena : string;
begin
  if (LFMarcaje.Text = 'B999') then
     NuevoMarcaje
  else
  begin
     identifica_cadena := Copy(LFMarcaje.Text, 1, 1);
     if (identifica_cadena = 'P') then
        GuardaPedido;
     if (identifica_cadena = 'T') then
        MarcajeTipo;
     if (identifica_cadena = 'O') then
        MarcajeOperario;
  end;
end;

procedure TZFMMarcManDirecto.BProcesaClick(Sender: TObject);
begin
  ProcesaCadena;
end;

procedure TZFMMarcManDirecto.GuardaPedido;
begin
  LFBarras.Text := Copy(LFMarcaje.Text, 2, Length(LFMarcaje.Text));
  if (ZDmMarcManDirecto.PedidoExiste(StrToInt(LFBarras.Text))) then
  begin
     QuitaColor;
     LFTipo.Color := clAqua;
     LFDescTipo.Color := clAqua;
     LFDescCliente.Text := ZDmMarcManDirecto.DameDescCliente(StrToInt(LFBarras.Text));
  end
  else
  begin
     NuevoMarcaje;
     LFError.Visible := True;
     LFError.Text := _('El pedido no existe');
  end;
end;

procedure TZFMMarcManDirecto.MarcajeTipo;
var
  Tipo : integer;
begin
  // Comprobar que hay pedido y que el tipo existe
  LFTipo.Text := Copy(LFMarcaje.Text, 2, Length(LFMarcaje.Text));
  Tipo := StrToInt(LFTipo.Text);

  if (LFBarras.Text = '') then
  begin
     NuevoMarcaje;
     LFError.Visible := True;
     LFError.Text := _('Falta marcar pedido');
  end;

  if ((Tipo < 1) or (Tipo > 6)) then
  begin
     LFError.Visible := True;
     LFError.Text := _('Tipo inexistente');
  end;

  if ((LFBarras.Text <> '') and (Tipo >= 1) and (Tipo <= 6)) then
  begin
     QuitaColor;
     LFOperario.Color := clAqua;
     LFDescOperario.Color := clAqua;
     ZDmMarcManDirecto.InsertaFecha(StrToInt(LFBarras.Text), Tipo);
     case Tipo of
        1: LFDescTipo.Text := _('Corte');
        2: LFDescTipo.Text := _('Unión');
        3: LFDescTipo.Text := _('Macarrón');
        4: LFDescTipo.Text := _('Montaje');
        5: LFDescTipo.Text := _('Terminado');
        6: LFDescTipo.Text := _('Preparado');
     end;
  end
  else
     LFTipo.Text := '';
end;

procedure TZFMMarcManDirecto.MarcajeOperario;
begin
  LFOperario.Text := Copy(LFMarcaje.Text, 2, Length(LFMarcaje.Text));

  if (LFTipo.Text = '') then
  begin
     LFError.Visible := True;
     LFError.Text := _('Falta marcar tipo');
     LFOperario.Text := '';
  end;

  if (LFBarras.Text = '') then
  begin
     NuevoMarcaje;
     LFError.Visible := True;
     LFError.Text := _('Falta marcar pedido');
  end;

  if ((LFBarras.Text <> '') and (LFTipo.Text <> '')) then
  begin
     if (DameEmpleadoTarjeta(LFOperario.Text) <> 0) then
     begin
        LFDescOperario.Text := ZDmMarcManDirecto.DameDescOperario(LFOperario.Text);
        ZDmMarcManDirecto.MarcaOperario(StrToInt(LFBarras.Text),
           StrToInt(LFTipo.Text), LFOperario.Text);
        QuitaColor;
        NuevoMarcaje;
     end
     else
     begin
        LFError.Visible := True;
        LFError.Text := _('Operario inexistente');
        LFOperario.Text := '';
     end;
  end;
end;

procedure TZFMMarcManDirecto.QuitaColor;
begin
  LFBarras.Color := clInfoBk;
  LFTipo.Color := clInfoBk;
  LFDescTipo.Color := clInfoBk;
  LFOperario.Color := clInfoBk;
  LFDescOperario.Color := clInfoBk;
  LFDescCliente.Color := clInfoBk;
  LFMarcaje.Text := '';
end;

procedure TZFMMarcManDirecto.BBorraMarcajeClick(Sender: TObject);
begin
  NuevoMarcaje;
end;

procedure TZFMMarcManDirecto.NuevoMarcaje;
begin
  LFMarcaje.Text := '';
  LFBarras.Text := '';
  LFTipo.Text := '';
  LFDescTipo.Text := '';
  LFOperario.Text := '';
  LFDescOperario.Text := '';
  LFDescCliente.Text := '';
  QuitaColor;
  LFBarras.Color := clAqua;
  LFDescCliente.Color := clAqua;
  LFError.Visible := False;
  LFError.Text := '';
end;

end.
