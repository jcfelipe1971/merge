unit ZUFMReplicacionModelosDet;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEditPanel, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFEdit,
  ULFLabel, ExtCtrls, ULFPanel, UFormGest, TFlatCheckBoxUnit, ULFCheckBox,
  Grids, DBGrids, NsDBGrid, UNavigator, DB, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit;

type
  TZFMReplicacionModelosDet = class(TFPEditSinNavegador)
     LModelo: TLFLabel;
     LFEModelo: TLFEdit;
     LFEDescModelo: TLFEdit;
     LSalida: TLFLabel;
     LFSalidaModelo: TLFEdit;
     LFLineaModelo: TLFEdit;
     LLinea: TLFLabel;
     LDesdeLinea: TLFLabel;
     LFEFDesdeL: TLFEdit;
     LFEFDesdeS: TLFEdit;
     LDesdeSalida: TLFLabel;
     LHastaSalida: TLFLabel;
     LHastaLinea: TLFLabel;
     LFEFHastaL: TLFEdit;
     LFEFHastaS: TLFEdit;
     GBReplicaciones: TGroupBox;
     CBLona: TLFCheckBox;
     CBConfecc: TLFCheckBox;
     CBLacado: TLFCheckBox;
     CBEscandallo: TLFCheckBox;
     CBMotor: TLFCheckBox;
     TBEjecutar: TToolButton;
     ToolButton2: TToolButton;
     CBTodos: TLFCheckBox;
     LEscandallo: TLFLabel;
     LFEscandallo: TLFEdit;
     DBGReplicar: TDBGridFind2000;
     LSeleccion: TLFLabel;
     CBIncDec: TLFCheckBox;
     ToolButton1: TToolButton;
     TBMarcar: TToolButton;
     TBDesmarcar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure LFEFHastaSBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBEjecutarClick(Sender: TObject);
     procedure CBTodosChange(Sender: TObject);
     procedure TBMarcarClick(Sender: TObject);
     procedure TBDesmarcarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMReplicacionModelosDet : TZFMReplicacionModelosDet;

implementation

uses ZUDMReplicacionModelosDet, UDMMain, ZUDMModelosDet, UEntorno;

{$R *.dfm}

procedure TZFMReplicacionModelosDet.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMReplicacionModelosDet, ZDMReplicacionModelosDet);
end;

procedure TZFMReplicacionModelosDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMReplicacionModelosDet);
end;

procedure TZFMReplicacionModelosDet.LFEFHastaSBusqueda(Sender: TObject);
begin
  // LFEFHastaS.CondicionBusqueda:='codigo='+chr(39)+LFEModelo.Text+chr(39)+' and (linea<>'+LFLineaModelo.Text+' or salida<>'+LFSalidaModelo.Text+')';
end;

procedure TZFMReplicacionModelosDet.TBEjecutarClick(Sender: TObject);
begin
  if (CBEscandallo.Checked = True) then
     ZDMReplicacionModelosDet.ReplicarEscandallo(LFEModelo.Text,
        REntorno.Empresa, REntorno.Entrada, StrToInt(LFEscandallo.Text));

  if (CBMotor.Checked = True) then
     ZDMReplicacionModelosDet.ReplicarMotor(Trim(LFEModelo.Text), REntorno.Entrada, REntorno.Empresa,
        StrToInt(LFLineaModelo.Text), StrToInt(LFSalidaModelo.Text));

  if (CBLona.Checked = True) then
     ZDMReplicacionModelosDet.ReplicarCalcLona(Trim(LFEModelo.Text), REntorno.Entrada, REntorno.Empresa,
        StrToInt(LFLineaModelo.Text), StrToInt(LFSalidaModelo.Text));

  if (CBConfecc.Checked = True) then
     ZDMReplicacionModelosDet.ReplicarTipoConf(Trim(LFEModelo.Text), REntorno.Entrada, REntorno.Empresa,
        StrToInt(LFLineaModelo.Text), StrToInt(LFSalidaModelo.Text));

  if (CBLacado.Checked = True) then
     ZDMReplicacionModelosDet.ReplicarIncrLacado(Trim(LFEModelo.Text), REntorno.Entrada, REntorno.Empresa,
        StrToInt(LFLineaModelo.Text), StrToInt(LFSalidaModelo.Text));

  if (CBIncDec.Checked = True) then
     ZDMReplicacionModelosDet.ReplicarIncrDecr(Trim(LFEModelo.Text), REntorno.Entrada, REntorno.Empresa,
        StrToInt(LFLineaModelo.Text), StrToInt(LFSalidaModelo.Text));

  // S'hauria de mirar si el procés ha finalitzat amb èxit
  ShowMessage('Proceso finalizado.');

  ZDMModelosDet.RefrescaDatos;
end;

procedure TZFMReplicacionModelosDet.CBTodosChange(Sender: TObject);
begin
  if (CBTodos.Checked = True) then
  begin
     CBEscandallo.Checked := True;
     CBMotor.Checked := True;
     CBLona.Checked := True;
     CBConfecc.Checked := True;
     CBLacado.Checked := True;
  end
  else
  begin
     CBEscandallo.Checked := False;
     CBMotor.Checked := False;
     CBLona.Checked := False;
     CBConfecc.Checked := False;
     CBLacado.Checked := False;
  end;
end;

procedure TZFMReplicacionModelosDet.TBMarcarClick(Sender: TObject);
begin
  ZDMReplicacionModelosDet.Seleccionar(1);
end;

procedure TZFMReplicacionModelosDet.TBDesmarcarClick(Sender: TObject);
begin
  ZDMReplicacionModelosDet.Seleccionar(0);
end;

end.
