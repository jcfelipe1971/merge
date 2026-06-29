unit ZUFMAnulacionFacturas;

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
  ULFComboBox, ULFEditFind2000, UFormGest, UFPEditSinNavegador;

type
  TZFMAnulacionFacturas = class(TFPEditSinNavegador)
     TButtAnulaFactura: TToolButton;
     LMotivoAnulacion: TLFLabel;
     RMotivo1: TRadioButton;
     RMotivo2: TRadioButton;
     AAnula: TAction;
     TButtDesAnula: TToolButton;
     ADesAnula: TAction;
     RMotivo3: TRadioButton;
     EMotivos: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure RMotivo1Click(Sender: TObject);
     procedure RMotivo2Click(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AAnulaExecute(Sender: TObject);
     procedure RMotivo3Click(Sender: TObject);
     procedure ADesAnulaExecute(Sender: TObject);
     procedure EMotivosEnter(Sender: TObject);
  private
     { Private declarations }
     id: integer;
     Motivo: integer;
     Tipo: string;
  public
     { Public declarations }
     procedure Muestra(aid: integer; atipo: string);
  end;

var
  ZFMAnulacionFacturas : TZFMAnulacionFacturas;

implementation

uses UDMMain, ZUDMAnulacionFacturas;

{$R *.dfm}

procedure TZFMAnulacionFacturas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMAnulacionFacturas, ZDMAnulacionFacturas);
  Motivo := 1;
  RMotivo1.Checked := True;
end;

procedure TZFMAnulacionFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMAnulacionFacturas);
end;

procedure TZFMAnulacionFacturas.Muestra(aId: integer; aTipo: string);
begin
  id := aId;
  tipo := aTipo;
  // No se puede hacer modal una ventana visible.
  Hide;
  ShowModal;
end;

procedure TZFMAnulacionFacturas.RMotivo1Click(Sender: TObject);
begin
  Motivo := 1;
end;

procedure TZFMAnulacionFacturas.RMotivo2Click(Sender: TObject);
begin
  Motivo := 2;
end;

procedure TZFMAnulacionFacturas.RMotivo3Click(Sender: TObject);
begin
  Motivo := 3;
end;

procedure TZFMAnulacionFacturas.AAnulaExecute(Sender: TObject);
begin
  if (Motivo <> 3) then
     EMotivos.Text := '';
  ZDMAnulacionFacturas.Z_AnulaFacturas(id, 1, Motivo, EMotivos.Text, Tipo);
  Close;
end;

procedure TZFMAnulacionFacturas.ADesAnulaExecute(Sender: TObject);
begin
  ZDMAnulacionFacturas.Z_AnulaFacturas(id, 2, Motivo, EMotivos.Text, Tipo);
  Close;
end;

procedure TZFMAnulacionFacturas.EMotivosEnter(Sender: TObject);
begin
  RMotivo3.Checked := True;
end;

end.
