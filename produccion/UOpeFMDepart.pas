unit UOpeFMDepart;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel;

type
  TOpeFMDepart = class(TFPEdit)
     LDepartamento: TLFLabel;
     DBEDepart: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescrip: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMDepart : TOpeFMDepart;

implementation

uses UOpeDMDepart, UFormGest, UDMMain;

{$R *.DFM}

procedure TOpeFMDepart.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDmDepart, OpeDmDepart);
  NavMain.DataSource := OpeDmDepart.DSQMDepartamento;
  EPMain.DataSource := OpeDmDepart.DSQMDepartamento;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  DBGMain.DataSource := OpeDmDepart.DSQMDepartamento;
end;

procedure TOpeFMDepart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDmDepart);
end;

procedure TOpeFMDepart.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDmDepart.BusquedaCompleja;
  Continua := False;
end;

end.
