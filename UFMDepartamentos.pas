unit UFMDepartamentos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit;

type
  TFMDepartamentos = class(TFPEdit)
     DBEDepartamento: TLFDbedit;
     DBETitulo: TLFDbedit;
     LDepartamento: TLFLabel;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMDepartamentos : TFMDepartamentos;

implementation

uses UDMMain, UFormGest, UDMDepartamentos;

{$R *.dfm}

procedure TFMDepartamentos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDepartamentos, DMDepartamentos);
  NavMain.DataSource := DMDepartamentos.DSQMDepartamentos;
  DBGMain.DataSource := DMDepartamentos.DSQMDepartamentos;
  G2kTableLoc.DataSource := DMDepartamentos.DSQMDepartamentos;
end;

procedure TFMDepartamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDepartamentos);
end;

procedure TFMDepartamentos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
