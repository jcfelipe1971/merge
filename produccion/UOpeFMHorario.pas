unit UOpeFMHorario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel,
  UFPEditDetalle;

type
  TOpeFMHorario = class(TFPEditDetalle)
     LHorario: TLFLabel;
     LDescripcion: TLFLabel;
     DBEHorario: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     DBEHorasProd: TLFDbedit;
     DBEHorasNoProd: TLFDbedit;
     DBEHorasLab: TLFDbedit;
     LHorasProd: TLFLabel;
     LHorasNoProd: TLFLabel;
     LHorasLab: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraHorario(Filtro: string);
  end;

var
  OpeFMHorario : TOpeFMHorario;

implementation

uses UOpeDMHorario, UDMMain, UFormGest, UEntorno;

{$R *.dfm}

procedure TOpeFMHorario.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMHorario, OpeDMHorario);
  NavMain.DataSource := OpeDMHorario.DSQMHorario;
  DBGMain.DataSource := OpeDMHorario.DSQMHorario;
end;

procedure TOpeFMHorario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMHorario);
end;

procedure TOpeFMHorario.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMHorario.BusquedaCompleja;
  Continua := False;
end;

procedure TOpeFMHorario.FiltraHorario(Filtro: string);
begin
  with OpeDMHorario.QMHorario do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM OPE_HORARIOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     if (Filtro <> '') then
        SelectSQL.Add(' AND ' + Filtro);
     SelectSQL.Add(' ORDER BY HORARIO ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TOpeFMHorario.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
