unit UFMPresenciaIncidencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  RxDBComb, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMPresenciaIncidencia = class(TFPEdit)
     LTipo: TLFLabel;
     LDescripcion: TLFLabel;
     DBETipo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LId: TLFLabel;
     DBEId: TLFDbedit;
     LIdentificadorInicidencia: TLFLabel;
     DBEIdentificadorInicidencia: TLFDbedit;
     LComportamiento: TLFLabel;
     DBCBComportamiento: TRxDBComboBox;
     LBolsaHoras: TLFLabel;
     DBCBBolsaHora: TRxDBComboBox;
     DBCBDefecto: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPresenciaIncidencia : TFMPresenciaIncidencia;

implementation

uses UDMPresenciaIncidencia, UFormGest;

{$R *.dfm}

procedure TFMPresenciaIncidencia.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPresenciaIncidencia, DMPresenciaIncidencia);
  NavMain.DataSource := DMPresenciaIncidencia.DSQMIncPre;
  DBGMain.DataSource := DMPresenciaIncidencia.DSQMIncPre;
  G2KTableLoc.DataSource := DMPresenciaIncidencia.DSQMIncPre;
end;

procedure TFMPresenciaIncidencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPresenciaIncidencia);
end;

procedure TFMPresenciaIncidencia.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button <> nbInsert) then
  begin
     DBEId.Color := clInfoBk;
     DBEId.Enabled := False;
     DBEId.TabStop := False;
  end
  else
  begin
     DBEId.Color := clWindow;
     DBEId.Enabled := True;
     DBEId.TabStop := True;
  end;
end;

procedure TFMPresenciaIncidencia.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
