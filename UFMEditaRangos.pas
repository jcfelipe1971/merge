unit UFMEditaRangos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, ULFToolBar, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, UFormGest, Menus, UTeclas, UControlEdit, UNavigator,
  UEditPanel, ActnList, ULFActionList, ULFLabel, ULFPanel, UFPEditSimple,
  rxPlacemnt, ULFFormStorage;

type
  TFMEditaRangos = class(TFPEditSimple)
     DBGFRangos: TDBGridFind2000;
     DBEDescripcion: TLFDbedit;
     LRango: TLFLabel;
     TBSeparador: TToolButton;
     TButtAceptar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEditaRangos : TFMEditaRangos;

implementation

uses UDMMain, UEntorno, UDMRangosPortes;

{$R *.dfm}

procedure TFMEditaRangos.FormCreate(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMEditaRangos.TButtAceptarClick(Sender: TObject);
begin
  DMRangosPortes.InsertaRangos;
  ModalResult := mrOk;
end;

procedure TFMEditaRangos.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  DMRangosPortes.xRangosTMP.Close;
  DMRangosPortes.BorraTemporal;
end;

end.
