unit UFMRemuneraciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEdit,
  StdCtrls, Mask, DBCtrls, ULFDBEditFind2000, ULFLabel, UDameDato;

type
  TFMRemuneraciones = class(TFPEditSimple)
     LFPCabecera: TLFPanel;
     LPeriodo: TLFLabel;
     DBEFPeriodo: TLFDBEditFind2000;
     DBETituloPeriodo: TLFDbedit;
     DBGMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure DBEFPeriodoChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMRemuneraciones : TFMRemuneraciones;

implementation

uses UDMRemuneraciones, UDMMain, UUtiles, UFormGest;

{$R *.dfm}

procedure TFMRemuneraciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRemuneraciones, DMRemuneraciones);

  NavMain.DataSource := DMRemuneraciones.DSQMNomRemu;
  DBGMain.DataSource := DMRemuneraciones.DSQMNomRemu;
end;

procedure TFMRemuneraciones.DBEFPeriodoChange(Sender: TObject);
begin
  inherited;
  DBETituloPeriodo.Text := DameTituloPeriodo(DBEFPeriodo.Text);
  if not DMRemuneraciones.ExistePeriodo(DBEFPeriodo.Text) then
     DMRemuneraciones.InsertaPeriodo(DBEFPeriodo.Text);
end;

end.
