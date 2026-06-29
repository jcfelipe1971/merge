unit UFMVentasCliFec;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ComCtrls,
  ExtCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UControlEdit,
  URightMaskEdit, UFormGest, Mask, DBCtrls, UEditPanel, NsDBGrid,
  ULFDBEdit, ULFCheckBox, ULFPanel, ULFToolBar, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFLabel;

type
  TFMVentasCliFec = class(TG2KForm)
     TBMain: TLFToolBar;
     DBGFArticulosCli: TDBGridFind2000;
     TButtImprimir: TToolButton;
     TButtConfigurar: TToolButton;
     EPMain: THYMEditPanel;
     ToolButton5: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMVentasCliFec : TFMVentasCliFec;

implementation

uses UDMMain, UDMVentasCliFec;

{$R *.DFM}

procedure TFMVentasCliFec.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMVentasCliFec, DMVentasCliFec);
end;

procedure TFMVentasCliFec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMVentasCliFec);
end;

end.
