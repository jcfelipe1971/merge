unit UProFMInfoReservas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind;

type
  TProFMInfoReservas = class(TFPEditSinNavegador)
     DBGReservas: TFIBHYGGridFind;
     ToolButton1: TToolButton;
     TButtRefrescar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure DBGReservasDblClick(Sender: TObject);
     procedure DBGReservasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Reservas(id_orden: integer);
  end;

var
  ProFMInfoReservas : TProFMInfoReservas;

implementation

uses UProDMInfoReservas, UFormGest, UDMMain, UFMain, UProFMIntroduceDatosReserva, UUtiles;

{$R *.dfm}

procedure TProFMInfoReservas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMInfoReservas, ProDMInfoReservas);
  DBGReservas.DataSource := ProDMInfoReservas.DSQReservas;
end;

procedure TProFMInfoReservas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMInfoReservas);
end;

procedure TProFMInfoReservas.Reservas(id_orden: integer);
begin
  ProDMInfoReservas.AbrirReservas(id_orden);
end;

procedure TProFMInfoReservas.TButtRefrescarClick(Sender: TObject);
begin
  inherited;
  ProDMInfoReservas.Refrescar;
end;

procedure TProFMInfoReservas.DBGReservasDblClick(Sender: TObject);
var
  FMIntroduceDatosReserva : TProFMIntroduceDatosReserva;
begin
  inherited;
  FMIntroduceDatosReserva := TProFMIntroduceDatosReserva.Create(Self);
  FMIntroduceDatosReserva.Muestra(ProDMInfoReservas.QReservasID_RESERVA.AsInteger);
  ProDMInfoReservas.Refrescar;
end;

procedure TProFMInfoReservas.DBGReservasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TFIBHYGGridFind(Sender) do
  begin
     if (Column.FieldName = 'ESTADO') then
     begin
        if (ProDMInfoReservas.QReservasESTADO.AsInteger = 5) then
           ColorResaltado2(DBGReservas.Canvas)
        else
           ColorInfo(DBGReservas.Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
