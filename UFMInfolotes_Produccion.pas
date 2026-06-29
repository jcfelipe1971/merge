unit UFMInfolotes_Produccion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UFIBDBEditfind, ExtCtrls, UFormGest, UHYDBGrid,
  Menus, UTeclas, ComCtrls, UEditPanel, UControlEdit, UNavigator, StdCtrls,
  ToolWin, UHYDescription, Mask, DBCtrls, UComponentesBusquedaFiltrada,
  NsDBGrid, ULFPanel, ULFToolBar;

type
  TFMInfolotes_Produccion = class(TG2KForm)
     PMain: TLFPanel;
     HYDBGLotes: THYTDBGrid;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     PLotesMateriales: TLFPanel;
     NavLotesMateriales: THYMNavigator;
     HYDBGLotesMateriales: THYTDBGrid;
     CELotesMateriales: TControlEdit;
     CELotesMaterialesPMEdit: TPopUpTeclas;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure HYDBGLotesCellClick(Column: TColumn);
     procedure HYDBGLotesDblClick(Sender: TObject);
     procedure HYDBGLotesColEnter(Sender: TObject);
     procedure HYDBGLotesMaterialesColEnter(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMInfolotes_Produccion : TFMInfolotes_Produccion;

implementation

uses UDMMain, UDMIntroduceLotes, UEntorno, UDMOrdenproduccion;

{$R *.dfm}

procedure TFMInfolotes_Produccion.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  ControlEdit := CEMain;
end;

procedure TFMInfolotes_Produccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := caFree;
end;

procedure TFMInfolotes_Produccion.HYDBGLotesCellClick(Column: TColumn);
begin
  Close;
end;

procedure TFMInfolotes_Produccion.HYDBGLotesDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFMInfolotes_Produccion.HYDBGLotesColEnter(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMInfolotes_Produccion.HYDBGLotesMaterialesColEnter(Sender: TObject);
begin
  ControlEdit := CELotesMateriales;
end;

end.
