unit ZUFMLstTroqueles;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  ToolWin, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, DBCtrls,
  Grids, DBGrids, rxToolEdit, Math, ULFActionList, ULFPageControl, ULFToolBar,
  ULFComboBox, ULFEdit, ULFPanel, ULFEditFind2000, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDateEdit, NsDBGrid, ULFLabel,
  rxPlacemnt, ULFFormStorage;

type
  TZFMLstTroqueles = class(TFPEditListadoSfg)
     PanelCentral: TLFPanel;
     LblTroquel: TLFLabel;
     EFTroquel: TLFEditFind2000;
     procedure ARecargarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  ZFMLstTroqueles : TZFMLstTroqueles;

implementation

uses UDMMain, ZUDMLstTroqueles, UEntorno, UFormGest, UFMListConfig;

{$R *.dfm}

procedure TZFMLstTroqueles.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstTroqueles, ZDMLstTroqueles);

  Grupo := 9900;
  Listado := ZDMLstTroqueles.frListadoE;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargar.Execute;
end;

procedure TZFMLstTroqueles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLstTroqueles);
end;

procedure TZFMLstTroqueles.ARecargarExecute(Sender: TObject);
begin
  inherited;
  EFTroquel.Text := '';
end;

procedure TZFMLstTroqueles.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  ZDMLstTroqueles.MostrarListado(Modo, Grupo, EFTroquel.Text);
  // CierraData(DMLstTroqueles);
end;

end.
