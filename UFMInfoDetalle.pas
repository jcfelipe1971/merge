unit UFMInfoDetalle;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  UControlEdit, UEditPanel, ExtCtrls, Menus, UTeclas, StdCtrls, ToolWin,
  ComCtrls, ULFToolBar, NsDBGrid;

type
  TFMInfoDetalle = class(TG2KForm)
     GBSubnivel: TGroupBox;
     DBGFInfo: TDBGridFind2000;
     TBSubescandallo: TLFToolBar;
     HYMEPSubescandallo: THYMEditPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMInfoDetalle : TFMInfoDetalle;

implementation

uses UDMMain, UDMArtEscandallo;

{$R *.DFM}

procedure TFMInfoDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFMInfoDetalle.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
