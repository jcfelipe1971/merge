unit UFMCambioDivisas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UNavigator, ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  Mask, DBCtrls, ULFDBEdit, ULFLabel, Grids, DBGrids, NsDBGrid, Menus,
  UTeclas, UControlEdit, UFormGest, rxPlacemnt, ULFFormStorage, UEditPanel,
  ActnList, ULFActionList, DB;

type
  TFMCambioDivisas = class(TG2KForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     GBDivisas: TGroupBox;
     LBLOrigen: TLFLabel;
     LBLAlta: TLFLabel;
     LBLDestino: TLFLabel;
     LBLBaja: TLFLabel;
     LBLCambio: TLFLabel;
     LBLFactor: TLFLabel;
     DBETOrigen: TLFDbedit;
     DBETDestino: TLFDbedit;
     DBEAlta: TLFDbedit;
     DBEBaja: TLFDbedit;
     DBECambio: TLFDbedit;
     DBEFactor: TLFDbedit;
     EFDestino: TLFEditFind2000;
     EFOrigen: TLFEditFind2000;
     PHistDivisas: TLFPanel;
     DBGMain: TDBGridFind2000;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     FSMain: TLFFibFormStorage;
     LCambios: TLFLabel;
     ToolButton2: TToolButton;
     TBSalir: TToolButton;
     ALMain: TLFActionList;
     ASalir: TAction;
     TBCambios: TLFToolBar;
     ToolButton3: TToolButton;
     TButtIntercambiarMonedas: TToolButton;
     AIntercambiarMonedas: TAction;
     procedure EFDestinoChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFOrigenChange(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure AIntercambiarMonedasExecute(Sender: TObject);
  private
     { Private declarations }
     procedure HabilitaFecAlta(Habilita: boolean);
  public
     { Public declarations }
     procedure ActualizarDatos;
  end;

var
  FMCambioDivisas : TFMCambioDivisas;

implementation

uses UDMCambioDivisas, UEntorno, UDMMain, UUtiles;

{$R *.dfm}

procedure TFMCambioDivisas.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMCambioDivisas, DMCambioDivisas);
  DBGMain.DataSource := DMCambioDivisas.DSQMCambios;
  NavMain.ControlEdit := CEMain;
  NavMain.DataSource := DMCambioDivisas.DSQMCambios;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  EFOrigen.Text := REntorno.Moneda;
  EFDestino.Text := REntorno.Moneda;
  ActualizarDatos;
  ControlEdit := CEMain;
  HabilitaFecAlta(True);
end;

procedure TFMCambioDivisas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Cerramos el dataset de los factores del DMMain para refrescar cambios.
  DMMain.xFactorMoneda.Close;

  Action := caFree;
  CierraData(DMCambioDivisas);
end;

procedure TFMCambioDivisas.EFDestinoChange(Sender: TObject);
begin
  ActualizarDatos;
end;

procedure TFMCambioDivisas.EFOrigenChange(Sender: TObject);
begin
  ActualizarDatos;
end;

procedure TFMCambioDivisas.ActualizarDatos;
begin
  //abrir tabla con valores del EditFind
  DMCambioDivisas.ValoresIniciales(EFOrigen.Text, EFDestino.Text);
  if (DMCambioDivisas.QMCambios.RecordCount > 0) then
     LCambios.Caption := ''
  else
     LCambios.Caption := _('No existen cambios en la divisa elegida');
end;

procedure TFMCambioDivisas.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMCambioDivisas.HabilitaFecAlta(Habilita: boolean);
var
  Col : integer;
begin
  // Se habilita la columna de la fecha de alta sólo al insertar
  Col := EncuentraField(DBGMain, 'F_ALTA');
  with DBGMain.Columns[Col] do
  begin
     ReadOnly := not Habilita;
     if not Habilita then
     begin
        Font.Color := clGrayText;
        Color := clInfoBk;
     end
     else
     begin
        Color := clWindow;
        Font.Color := clWindowText;
     end;
  end;
end;

procedure TFMCambioDivisas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  HabilitaFecAlta((Button = nbInsert));
end;

procedure TFMCambioDivisas.AIntercambiarMonedasExecute(Sender: TObject);
var
  Moneda : string;
begin
  Moneda := EFOrigen.Text;
  EFOrigen.Text := EFDestino.Text;
  EFDestino.Text := Moneda;
end;

end.
