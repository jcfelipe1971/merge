unit UFMOrdenesPromociones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  UNavigator, UControlEdit, Menus, UTeclas, UFormGest;

type
  TFMOrdenesPromociones = class(TG2kForm)
     PNMain: TLFPanel;
     TBMain: TLFToolBar;
     PNPromociones: TLFPanel;
     DBGFMain: TDBGridFind2000;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     TButtSalir: TToolButton;
     ToolButton2: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFMainColEnter(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMOrdenesPromociones : TFMOrdenesPromociones;

implementation

uses UDMOrdenesPromociones, UDMMain;

{$R *.dfm}

procedure TFMOrdenesPromociones.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMOrdenesPromociones, DMOrdenesPromociones);
end;

procedure TFMOrdenesPromociones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMOrdenesPromociones);
  Action := caFree;
end;

procedure TFMOrdenesPromociones.DBGFMainColEnter(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMOrdenesPromociones.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

end.
