unit UFMSiiConfiguracionCorreo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMSiiConfiguracionCorreo = class(TFPEdit)
     GBRecepcion: TGroupBox;
     LComprasServidorPop3: TLFLabel;
     LComprasPuertoPop3: TLFLabel;
     LComprasUsuarioPop3: TLFLabel;
     LComprasPasswordPop3: TLFLabel;
     DBEComprasServidorPop3: TLFDbedit;
     DBEComprasPuertoPop3: TLFDbedit;
     DBEComprasUsuarioPop3: TLFDbedit;
     DBEComprasPasswordPop3: TLFDbedit;
     GBEnvio: TGroupBox;
     LVentasServidorSmtp: TLFLabel;
     LVentasPuertoSmtp: TLFLabel;
     LVentasUsuarioSmtp: TLFLabel;
     LVentasPasswordSmtp: TLFLabel;
     DBEVentasServidorSmtp: TLFDbedit;
     DBEVentasPuertoSmtp: TLFDbedit;
     DBEVentasUsuarioSmtp: TLFDbedit;
     DBEVentasPasswordSmtp: TLFDbedit;
     DBEVentasEMailSmtp: TLFDbedit;
     LVentasEMailSmtp: TLFLabel;
     CBVentasAutenticarSmtp: TLFDBCheckBox;
     CBVentasTslSmtp: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure PEditResize(Sender: TObject);
     procedure FormActivate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSiiConfiguracionCorreo : TFMSiiConfiguracionCorreo;

implementation

uses
  UDMSiiConfiguracionCorreo, UFormGest;

{$R *.dfm}

procedure TFMSiiConfiguracionCorreo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSiiConfiguracionCorreo, DMSiiConfiguracionCorreo);

  NavMain.DataSource := DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos;
  DBGMain.DataSource := DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos;
  G2kTableLoc.DataSource := DMSiiConfiguracionCorreo.DSQMSiiConfguracionCorreos;
end;

procedure TFMSiiConfiguracionCorreo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSiiConfiguracionCorreo);
end;

procedure TFMSiiConfiguracionCorreo.PEditResize(Sender: TObject);
begin
  inherited;
  GBRecepcion.Height := PEdit.Height div 2;
end;

procedure TFMSiiConfiguracionCorreo.FormActivate(Sender: TObject);
begin
  inherited;

  // Solo habrá un registro por empresa
  TSTabla.TabVisible := False;
end;

end.
