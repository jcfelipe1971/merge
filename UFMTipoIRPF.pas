unit UFMTipoIRPF;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DbComboBoxValue,
  Mask, DBCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UG2kTBLoc;

type
  TFMTipoIRPF = class(TFPEdit)
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LIRPF: TLFLabel;
     DBEP_Iva: TLFDbedit;
     LAplicableA: TLFLabel;
     DBCBVMetodo: TDBComboBoxValue;
     LFDBCBTipoGanadero: TLFDBCheckBox;
     LFDBCBIncEnModelo: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTipoIRPF : TFMTipoIRPF;

implementation

uses UDMTipoIRPF, UFormGest, UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMTipoIRPF.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoIRPF, DMTipoIRPF);
  NavMain.DataSource := DMTipoIRPF.DSTipoIRPF;
  EPMain.DataSource := DMTipoIRPF.DSTipoIRPF;
  DBGMain.DataSource := DMTipoIRPF.DSTipoIRPF;
  G2KTableLoc.DataSource := DMTipoIRPF.DSTipoIRPF;
end;

procedure TFMTipoIRPF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTipoIRPF);
end;

procedure TFMTipoIRPF.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoIRPF.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTipoIRPF.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
