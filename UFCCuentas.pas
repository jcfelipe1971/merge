unit UFCCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UEditPanel, ComCtrls, ExtCtrls, UNavigator,
  ToolWin, Menus, UTeclas, UControlEdit, UFormGest, ULFEdit, ULFToolBar,
  ULFComboBox, ULFLabel;

type
  TFCCuentas = class(TG2KForm)
     TBNav: TLFToolBar;
     NavMain: THYMNavigator;
     TBBusca: TLFToolBar;
     TButtSeparador1: TToolButton;
     LBLConsCuentas: TLFLabel;
     TButtSeparador2: TToolButton;
     EPMain: THYMEditPanel;
     CBFiltra: TLFComboBox;
     DBGCuentas: TDBGrid;
     TButtSeparador3: TToolButton;
     EDTBusca: TLFEdit;
     TButtSeparador4: TToolButton;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     LBLBusca: TLFLabel;
     LBLNivel: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EDTBuscaChange(Sender: TObject);
     procedure EDTBuscaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     function Muestra(var Cuenta: string; Nivel: integer): integer;
  end;

var
  FCCuentas : TFCCuentas;

implementation

uses UDMCuentas, UEntorno, UDMMain;

{$R *.DFM}

procedure TFCCuentas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  Self.Left := TForm(Self.Owner).Left + 150;
  Self.Top := TForm(Self.Owner).Top + 75;
  CBFiltra.Items := TSLNiveles;
  CBFiltra.ItemIndex := 0;
  AbreData(TDMCuentas, DMCuentas);
  NavMain.DataSource := DMCuentas.DSxCuentas;
  DBGCuentas.DataSource := DMCuentas.DSxCuentas;
  CEMainPMedit.Teclas := DMMain.Teclas;
end;

procedure TFCCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCuentas);
  Action := caFree;
end;

procedure TFCCuentas.EDTBuscaChange(Sender: TObject);
begin
  DMCuentas.BuscaCuenta(EDTBusca.Text, CBFiltra.ItemIndex);
end;

procedure TFCCuentas.EDTBuscaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = 40) then
  begin
     DBGCuentas.SetFocus;
     DBGCuentas.DataSource.DataSet.Next;
  end;
end;

function TFCCuentas.Muestra(var Cuenta: string; Nivel: integer): integer;
begin
  EDTBusca.Text := Cuenta;
  CBFiltra.ItemIndex := Nivel;
  Self.EDTBuscaChange(Self);
  Result := ShowModal;
  Cuenta := DMCuentas.xCuentasCUENTA.AsString;
end;

procedure TFCCuentas.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
end;

end.
