unit ZUFMMotivo;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, UDBDateTimePicker, ExtDlgs, DB, NsDBGrid, rxPlacemnt, rxToolEdit,
  RXDBCtrl, ImgList, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEditFind2000,
  ULFDBCheckBox, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox, Buttons,
  TeEngine, Series, TeeProcs, Chart, DbChart, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, ULFLabel, ULFEdit,
  ULFComboBox, ULFEditFind2000;

type
  TZFMMotivo = class(TForm)
     TBMain: TLFToolBar;
     TSalir: TToolButton;
     TAnulaFactura: TToolButton;
     LMotivoAnulacion: TLFLabel;
     ALMain: TLFActionList;
     ASalir: TAction;
     AAnula: TAction;
     LFMotivos: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ASalirExecute(Sender: TObject);
     procedure AAnulaExecute(Sender: TObject);
  private
     { Private declarations }
     id: integer;
  public
     { Public declarations }
     procedure Muestra(aid: integer);
  end;

var
  ZFMMotivo : TZFMMotivo;

implementation

uses UDMMain, ZUDMMotivo, UFormGest;

{$R *.dfm}

procedure TZFMMotivo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TZDMMotivo, ZDMMotivo);
end;

procedure TZFMMotivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ZDMMotivo);
end;

procedure TZFMMotivo.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TZFMMotivo.AAnulaExecute(Sender: TObject);
begin
  //LFMotivos.MaxLength=50 - LFMotivos.text := Trim(copy(TextoMotivo, 1, 50));
  ZDMMotivo.Z_MotivoAnula(id, LFMotivos.Text);
  Close;
end;

procedure TZFMMotivo.Muestra(aid: integer);
begin
  id := aid;
end;

end.
