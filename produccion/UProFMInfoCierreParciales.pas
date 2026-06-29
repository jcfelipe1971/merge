unit UProFMInfoCierreParciales;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind;

type
  TProFMInfoCierresParciales = class(TFPEditSinNavegador)
     PNLGrid: TLFPanel;
     DBGCierresParciales: TFIBHYGGridFind;
     ToolButton1: TToolButton;
     TButtRefrescar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGCierresParcialesDblClick(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure DBGCierresParcialesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbrirCierres(id_orden: integer);
  end;

var
  ProFMInfoCierresParciales : TProFMInfoCierresParciales;

implementation

uses UProDMInfoCierreParciales, UFormGest, UDMMain, UFMain, UUtiles;

{$R *.dfm}

procedure TProFMInfoCierresParciales.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMInfoCierresParciales, ProDMInfoCierresParciales);
  DBGCierresParciales.DataSource := ProDMInfoCierresParciales.DSQCierresParciales;
end;

procedure TProFMInfoCierresParciales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMInfoCierresParciales);
end;

procedure TProFMInfoCierresParciales.AbrirCierres(id_orden: integer);
begin
  ProDMInfoCierresParciales.AbrirCierres(id_orden);
end;

procedure TProFMInfoCierresParciales.DBGCierresParcialesDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ACierreParcialOrden, ProDMInfoCierresParciales.QCierresParcialesID.AsString);
end;

procedure TProFMInfoCierresParciales.TButtRefrescarClick(Sender: TObject);
begin
  inherited;
  ProDMInfoCierresParciales.Refrescar;
end;

procedure TProFMInfoCierresParciales.DBGCierresParcialesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TFIBHYGGridFind(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'ESTADO') then
     begin
        if (ProDMInfoCierresParciales.QCierresParcialesESTADO.AsInteger = 0) then
           ColorError(Canvas)
        else
        begin
           if (gdFocused in State) then
              ColorFocused(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {with DBGridFind2000}
end;

end.
