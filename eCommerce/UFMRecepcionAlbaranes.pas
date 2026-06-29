unit UFMRecepcionAlbaranes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UControlEdit, UFormGest,
  NsDBGrid, rxToolEdit, rxPlacemnt, ULFFormStorage, ULFPanel, ULFDBEdit,
  ULFToolBar, RXDBCtrl, ULFEditFind2000, ULFLabel, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, Menus, UTeclas, UNavigator,
  UFPEditSimple, ActnList, ULFActionList, UEditPanel;

type
  TFMRecepcionAlbaranes = class(TFPEditSimple)
     DBGFAlbaranes: TDBGridFind2000;
     PDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     TSep1: TToolButton;
     TButtRegenera: TToolButton;
     TButtMarcarTodas: TToolButton;
     TbuttDesmarcar: TToolButton;
     TSep2: TToolButton;
     TButtTraspasa: TToolButton;
     TbuttBorrarecepcion: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure TButtMarcarTodasClick(Sender: TObject);
     procedure TButtTraspasaClick(Sender: TObject);
     procedure TbuttDesmarcarClick(Sender: TObject);
     procedure TbuttBorrarecepcionClick(Sender: TObject);
     procedure FormActivate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMRecepcionAlbaranes : TFMRecepcionAlbaranes;

implementation

uses UDMRecepcionalbaranes, UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMRecepcionAlbaranes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRecepcionalbaranes, DMRecepcionalbaranes);
  DBGFAlbaranes.ColumnasChecked.Strings[DBGFAlbaranes.ColumnasCheckBoxes.IndexOf('RECEPCIONAR')] :=
     IntToStr(REntorno.Entrada);
end;

procedure TFMRecepcionAlbaranes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRecepcionalbaranes);
end;

procedure TFMRecepcionAlbaranes.TButtRegeneraClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMRecepcionalbaranes.RefrescaCabecera;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMRecepcionAlbaranes.TButtMarcarTodasClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMRecepcionalbaranes.MarcarRecepciones(REntorno.Entrada);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMRecepcionAlbaranes.TButtTraspasaClick(Sender: TObject);
begin
  DMRecepcionAlbaranes.TraspasaAlbaranes;
end;

procedure TFMRecepcionAlbaranes.TbuttDesmarcarClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMRecepcionalbaranes.MarcarRecepciones(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMRecepcionAlbaranes.TbuttBorrarecepcionClick(Sender: TObject);
begin
  if (Confirma) then
     try
        Screen.Cursor := crHourGlass;
        DMRecepcionalbaranes.BorraRecepcion;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TFMRecepcionAlbaranes.FormActivate(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

end.
