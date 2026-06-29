unit UFMConfiguracionServidorCorreo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMConfiguracionServidorCorreo = class(TFPEdit)
     LNombre: TLFLabel;
     LServidorSMTP: TLFLabel;
     LPuertoSMTP: TLFLabel;
     LCorreo: TLFLabel;
     LUsuarioSMTP: TLFLabel;
     DBENombre: TLFDbedit;
     DBEServidorSmtp: TLFDbedit;
     DBEPuertoSmtp: TLFDbedit;
     DBECorreo: TLFDbedit;
     DBEUsuario: TLFDbedit;
     CBAutenticar: TLFDBCheckBox;
     CBTLS: TLFDBCheckBox;
     LPasswordSMTP: TLFLabel;
     DBEPassword: TLFDbedit;
     LConfiguracionSMTP: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMConfiguracionServidorCorreo : TFMConfiguracionServidorCorreo;

implementation

uses
  UDMConfiguracionServidorCorreo, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMConfiguracionServidorCorreo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMConfiguracionServidorCorreo, DMConfiguracionServidorCorreo);

  NavMain.DataSource := DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos;
  DBGMain.DataSource := DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos;
  G2kTableLoc.DataSource := DMConfiguracionServidorCorreo.DSQMConfiguracionCorreos;
end;

procedure TFMConfiguracionServidorCorreo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMConfiguracionServidorCorreo);
end;

procedure TFMConfiguracionServidorCorreo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
