unit UFMCampanyas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, UDBDateTimePicker, rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid,
  ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFLabel, ULFDBDateEdit, UG2kTBLoc;

type
  TFMCampanyas = class(TFPEdit)
     LBLCampanya: TLFLabel;
     DBECampanya: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBCHKActiva: TLFDBCheckBox;
     DBDTPInicio: TLFDBDateEdit;
     DBDTPFin: TLFDBDateEdit;
     LBLInicio: TLFLabel;
     LBLFin: TLFLabel;
     LBLValor: TLFLabel;
     DBCBValor: TLFDBCheckBox;
     DBEValor: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCampanyas : TFMCampanyas;

implementation

uses UFormGest, UDMCampanyas, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMCampanyas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCampanyas, DMCampanyas);
  NavMain.DataSource := DMCampanyas.DSQMCampanyas;
  DBGMain.DataSource := DMCampanyas.DSQMCampanyas;

  // Color campo ID
  ColorCampoID(DBECampanya);
end;

procedure TFMCampanyas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMCampanyas);
end;

procedure TFMCampanyas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCampanyas.BusquedaCompleja;
  Continua := False;
end;

end.
