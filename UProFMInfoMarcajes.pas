unit UProFMInfoMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind;

type
  TProFMInfoMarcajes = class(TFPEditSinNavegador)
     DBGMarcajes: TFIBHYGGridFind;
     ToolButton1: TToolButton;
     TButtRefrescar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure DBGMarcajesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Marcajes(IdOrden: integer);
  end;

var
  ProFMInfoMarcajes : TProFMInfoMarcajes;

implementation

uses UProDMInfoMarcajes, UFormGest, UDMMain, {UFMain, UProFMIntroduceDatosReserva,} UUtiles;

{$R *.dfm}

procedure TProFMInfoMarcajes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMInfoMarcajes, ProDMInfoMarcajes);
  DBGMarcajes.DataSource := ProDMInfoMarcajes.DSQMarcajes;
end;

procedure TProFMInfoMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(ProDMInfoMarcajes);
end;

procedure TProFMInfoMarcajes.Marcajes(IdOrden: integer);
begin
  ProDMInfoMarcajes.AbrirMarcajes(IdOrden);
end;

procedure TProFMInfoMarcajes.TButtRefrescarClick(Sender: TObject);
begin
  inherited;
  ProDMInfoMarcajes.Refrescar;
end;

procedure TProFMInfoMarcajes.DBGMarcajesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TFIBHYGGridFind(Sender) do
  begin
     if (Column.FieldName = 'ESTADO') then
     begin
        if (ProDMInfoMarcajes.QMarcajesESTADO.AsInteger = 5) then
           ColorResaltado2(Canvas)
        else
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
