unit UProFPregDeslanza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, FIBTableDataSet, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ComCtrls, ToolWin,
  ULFToolBar;

type
  TProFPregDeslanza = class(TForm)
     DBGDeslanza: TDBGridFind2000;
     LFToolBar1: TLFToolBar;
     ToolButton1: TToolButton;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure ToolButton2Click(Sender: TObject);
     procedure ToolButton1Click(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFPregDeslanza : TProFPregDeslanza;

implementation

uses UDMMain, UProDMPregDeslanza, UFormGest, FIBQuery, UEntorno;

{$R *.dfm}

procedure TProFPregDeslanza.FormCreate(Sender: TObject);
begin
  AbreData(TProDMPregDeslanza, ProDMPregDeslanza);
end;

procedure TProFPregDeslanza.ToolButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TProFPregDeslanza.ToolButton1Click(Sender: TObject);
begin
  with ProDMPregDeslanza.SPUpdateSituacion do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
  end;
  ProDMPregDeslanza.QMLanza_Masivo.Close;
  ProDMPregDeslanza.QMLanza_Masivo.Open;
end;

procedure TProFPregDeslanza.FormActivate(Sender: TObject);
begin
  inherited;
  // DBGDeslanza.Options:=DBGDeslanza.Options-[dgRowSelect]+[dgEditing];
end;

procedure TProFPregDeslanza.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ProDMPregDeslanza);
end;

end.
