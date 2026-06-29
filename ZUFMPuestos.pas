unit ZUFMPuestos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UHYDescription, ULFHYDBDescription,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, StdCtrls, Mask, DBCtrls,
  ULFDBEdit, ULFLabel;

type
  TZFMPuestos = class(TFPEdit)
     LblPuesto: TLFLabel;
     LblDescripcion: TLFLabel;
     DBEPuesto: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     DBEFTarea: TLFDBEditFind2000;
     LFDBCheckBox1: TLFDBCheckBox;
     LFLabel1: TLFLabel;
     DescTarea: TLFHYDBDescription;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFTareaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMPuestos : TZFMPuestos;

implementation

uses UFormGest, ZUDMPuestos, UDMMain;

{$R *.dfm}

procedure TZFMPuestos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMPuestos, ZDMPuestos);

  NavMain.DataSource := ZDMPuestos.DSQMPuestos;
  DBGMain.DataSource := ZDMPuestos.DSQMPuestos;
end;

procedure TZFMPuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMPuestos);
end;

procedure TZFMPuestos.DBEFTareaChange(Sender: TObject);
begin
  inherited;
  DescTarea.ActualizaDatos('TAREA', DBEFTarea.Text);
end;

end.
