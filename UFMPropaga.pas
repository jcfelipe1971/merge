unit UFMPropaga;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFFIBDBEditFind, ULFLabel, UG2kTBLoc;

type
  TFMPropaga = class(TFPEdit)
     GBOrigen: TGroupBox;
     GBDestino: TGroupBox;
     DBEFEmpresa: TLFFibDBEditFind;
     DBEFEjercicio: TLFFibDBEditFind;
     DBEFCanal: TLFFibDBEditFind;
     LBLEmpresa: TLFLabel;
     LBLEjercicio: TLFLabel;
     LBLCanal: TLFLabel;
     DBETitEmpresa: TLFDbedit;
     DBETitCanal: TLFDbedit;
     DBECanalDestino: TLFDbedit;
     DBEEmpresaDestino: TLFDbedit;
     LBLEmpresaDestino: TLFLabel;
     LBLEjercicioDestino: TLFLabel;
     LBLCanalDestino: TLFLabel;
     DBEFEmpresaDestino: TLFDBEditFind2000;
     DBEFEjercicioDestino: TLFDBEditFind2000;
     DBEFCanalDestino: TLFDBEditFind2000;
     GBOpciones: TGroupBox;
     DBCBEjercicios: TLFDBCheckBox;
     DBCBBorrado: TLFDBCheckBox;
     ANITempo: TAnimate;
     DBCBModifica: TLFDBCheckBox;
     APropaga: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APropagaExecute(Sender: TObject);
  private
     { Private declarations }
  public
     procedure Animacion(Activo: boolean);
  end;

var
  FMPropaga : TFMPropaga;

implementation

uses UDMMain, UFormGest, UEntorno, UDMPropaga, UUtiles;

{$R *.DFM}

procedure TFMPropaga.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPropaga, DMPropaga);
  NavMain.DataSource := DMPropaga.DSQMPropaga;
  DBGMain.DataSource := DMPropaga.DSQMpropaga;
end;

procedure TFMPropaga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPropaga);
end;

procedure TFMPropaga.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
  begin
     with DBEFEjercicioDestino do
     begin
        Color := clInfobk;
        Font.Color := clGrayText;
        Enabled := False;
        ReadOnly := True;
     end;
     with DBEFCanalDestino do
     begin
        Color := clInfobk;
        Font.Color := clGrayText;
        Enabled := False;
        ReadOnly := True;
     end;
  end
  else
  begin
     with DBEFEjercicioDestino do
     begin
        Color := clWindow;
        Font.Color := clWindowText;
        Enabled := True;
        ReadOnly := False;
     end;
     with DBEFCanalDestino do
     begin
        Color := clWindow;
        Font.Color := clWindowText;
        Enabled := True;
        ReadOnly := False;
     end;
  end;
end;

procedure TFMPropaga.Animacion(Activo: boolean);
begin
  AniTempo.Visible := Activo;
  AniTempo.Active := Activo;
end;

procedure TFMPropaga.APropagaExecute(Sender: TObject);
begin
  if Confirma then
  begin
     Animacion(True);
     Screen.Cursor := crHourGlass;
     try
        DMPropaga.PropagaCanal;
     finally
        begin
           Screen.Cursor := crDefault;
           Animacion(False);
        end;
     end;
  end;
end;

end.
