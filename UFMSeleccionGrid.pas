unit UFMSeleccionGrid;

{dji lrk kri
MODO DE UTILIZARLO:

var
  Empresa, Titulo : string;
begin
  ...
  with TFMSeleccionGrid.Create(Self) do
  begin
     try
        AsignaSQL('SELECT EMPRESA, TITULO FROM SYS_EMPRESAS ORDER BY EMPRESA');
        MostrarColumna('EMPRESA',_('Empresa'), 50);
        MostrarColumna('TITULO',_('Nombre'), 200);
        if (ShowModal = mrOk) then
        begin
           Empresa := FDS.FieldByName('EMPRESA').AsString;
           Titulo := FDS.FieldByName('TITULO').AsString;
        end;
     finally
        Free;
     end;
  end;
   ...
}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid, DB,
  FIBDataSet, FIBDatabase;

type
  TFMSeleccionGrid = class(TFPEditSinNavegador)
     DSFDS: TDataSource;
     TLocal: TFIBTransaction;
     FDS: TFIBDataSet;
     DBGSeleccion: TNsDBGrid;
     ToolButton1: TToolButton;
     TBOK: TToolButton;
     AOk: TAction;
     ACancel: TAction;
     procedure AOkExecute(Sender: TObject);
     procedure ACancelExecute(Sender: TObject);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure DBGSeleccionDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarColumna(Nombre, Titulo: string; Ancho: integer);
     procedure AsignaSQL(s: string);
     procedure Muestra;
  end;

var
  FMSeleccionGrid : TFMSeleccionGrid;

implementation

uses UDMMain;

{$R *.dfm}

procedure TFMSeleccionGrid.AOkExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFMSeleccionGrid.ACancelExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFMSeleccionGrid.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ACancel.Execute;
end;

procedure TFMSeleccionGrid.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Width := 20;
end;

procedure TFMSeleccionGrid.DBGSeleccionDblClick(Sender: TObject);
begin
  inherited;
  AOk.Execute;
end;

procedure TFMSeleccionGrid.AsignaSQL(s: string);
var
  i : integer;
begin
  with FDS do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     SelectSQL.Text := s;
     Open;
  end;

  for i := DBGSeleccion.Columns.Count - 1 downto 0 do
     DBGSeleccion.Columns.Delete(i);
end;

procedure TFMSeleccionGrid.MostrarColumna(Nombre, Titulo: string; Ancho: integer);
var
  Col : TColumn;
begin
  Col := DBGSeleccion.Columns.Add;

  with Col do
  begin
     Title.Caption := Titulo;
     FieldName := Nombre;
     ReadOnly := True;
     Color := clInfoBk;
     Width := Ancho;
  end;

  if (FDS.FieldByName(Nombre) is TFloatField) then
     TFloatField(FDS.FieldByName(Nombre)).DisplayFormat := '.0,00';

  if ((Self.Width + Ancho + 1) < Screen.Width) then
     Self.Width := Self.Width + Ancho + 1;

  Application.ProcessMessages;
end;

procedure TFMSeleccionGrid.Muestra;
begin
  ShowModal;
end;

end.
