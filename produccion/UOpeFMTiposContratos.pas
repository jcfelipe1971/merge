unit UOpeFMTiposContratos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEdit, UG2kTBLoc, ULFLabel;

type
  TOpeFMTiposContratos = class(TFPEdit)
     TSNotas: TTabSheet;
     LTipo: TLFLabel;
     DBEContrato: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescrip: TLFDbedit;
     LHorasPorMes: TLFLabel;
     DBEMes: TLFDbedit;
     TBNotas: TLFToolBar;
     PInforma: TLFPanel;
     NavNotas: THYMNavigator;
     DBEContratoNotas: TLFDbedit;
     DBEDescripcionNotas: TLFDbedit;
     LTipoNotas: TLFLabel;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     PNotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMTiposContratos : TOpeFMTiposContratos;

implementation

uses UOpeDMTiposContratos, UDMMain, UFormGest;

{$R *.DFM}

procedure TOpeFMTiposContratos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMTiposContratos, OpeDMTiposContratos);
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TOpeFMTiposContratos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMTiposContratos);
end;

procedure TOpeFMTiposContratos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMTiposContratos.BusquedaCompleja;
  Continua := False;
end;

procedure TOpeFMTiposContratos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
