unit UFMTiposCalculo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, ExtCtrls, DBCtrls, Mask, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMTiposCalculo = class(TFPEdit)
     LBLCalculo: TLFLabel;
     DBECalculo: TLFDbedit;
     LBLNombre: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLComision: TLFLabel;
     DBEComision: TLFDbedit;
     LBLCargo: TLFLabel;
     DBECargoP: TLFDbedit;
     LBLCargoLinea: TLFLabel;
     DBECargoL: TLFDbedit;
     DBEDto: TLFDbedit;
     Label1: TLFLabel;
     DBECargoC: TLFDbedit;
     Label2: TLFLabel;
     LBLTipoRedondeo: TLFLabel;
     DBEFTipoRedondeo: TLFDBEditFind2000;
     DBETipoRedondeo: TLFDbedit;
     LBLPrecioPuntos: TLFLabel;
     DBEPrecioPuntos: TLFDbedit;
     DBEFTipoPrecioBase: TLFDBEditFind2000;
     Label3: TLFLabel;
     DBETitTPB: TLFDbedit;
     LFactor: TLFLabel;
     DBEFactor: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTiposCalculo : TFMTiposCalculo;

implementation

uses UDMTiposCalculo, UDMMain, UFormGest;

{$R *.DFM}

procedure TFMTiposCalculo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTiposCalculo, DMTiposCalculo);
  NavMain.DataSource := DMTiposCalculo.DSQMTiposCalculo;
  DBGMain.DataSource := DMTiposCalculo.DSQMTiposCalculo;
  CEMainPMedit.Teclas := DMMain.Teclas;
end;

procedure TFMTiposCalculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTiposCalculo);
end;

procedure TFMTiposCalculo.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if (Button = nbInsert) then
  begin
     DBECalculo.Color := clWindow;
     DBECalculo.Font.Color := clWindowText;
     DBECalculo.Enabled := True;
  end
  else
  begin
     DBECalculo.Color := clInfoBk;
     DBECalculo.Font.Color := clGrayText;
     DBECalculo.Enabled := False;
  end;
end;

end.
