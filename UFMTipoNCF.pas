unit UFMTipoNCF;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  DbComboBoxValue;

type
  TFMTipoNCF = class(TFPEdit)
     LTipo: TLFLabel;
     LTitulo: TLFLabel;
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBCBVTipoDocumento: TDBComboBoxValue;
     LTipoDocumento: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTipoNCF : TFMTipoNCF;

implementation

uses UDMTipoNCF, UFormGest;

{$R *.dfm}

procedure TFMTipoNCF.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoNCF, DMTipoNCF);
  NavMain.DataSource := DMTipoNCF.DSQMTipoNCF;
  DBGMain.DataSource := DMTipoNCF.DSQMTipoNCF;
  EPMain.DataSource := DMTipoNCF.DSQMTipoNCF;
  G2KTableLoc.DataSource := DMTipoNCF.DSQMTipoNCF;
end;

procedure TFMTipoNCF.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMTipoNCF.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  // Si edito, deshabilito el campo TIPO_NCF
  if (Button = nbEdit) then
  begin
     DBETipo.Enabled := False;
     DBETipo.Color := clInfoBk;
  end
  else
  begin
     DBETipo.Enabled := True;
     DBETipo.Color := clWindow;
  end;
end;

end.
