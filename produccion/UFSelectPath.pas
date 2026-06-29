unit UFSelectPath;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ShellCtrls, rxPlacemnt,
  ULFPanel, ULFComboBox;

type
  TFSelectPath = class(TForm)
     stvPath: TShellTreeView;
     PNLPie: TLFPanel;
     bbSelect: TBitBtn;
     bbCancel: TBitBtn;
     FormStorage: TFormStorage;
     PNLPath: TLFPanel;
     cbPaths: TLFComboBox;
     cbScore: TLFComboBox;
     procedure PNLPieResize(Sender: TObject);
     procedure PNLPathResize(Sender: TObject);
     procedure stvPathChange(Sender: TObject; Node: TTreeNode);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure stvPathEnter(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     procedure AddPath(s: string);
  public
     { Public declarations }
  end;

var
  FSelectPath : TFSelectPath;

function GetDirectory(var Path: string): boolean;

implementation

uses UDMMain, UUtiles;

{$R *.dfm}

var
  GlobalPath : string;

function GetDirectory(var Path: string): boolean;
var
  SelectPath : TFSelectPath;
begin
  SelectPath := TFSelectPath.Create(nil);
  try
     // if (Path <> '') then
     //    SelectPath.stvPath.Root := Path;

     Result := (SelectPath.ShowModal = mrOk);
     if Result then
        Path := GlobalPath;
  finally
     SelectPath.Free;
  end;
end;

procedure TFSelectPath.AddPath(s: string);
var
  index : integer;
  i : integer;
  ScoreAux : string;
const
  ini_value: integer = 0;
begin
  cbPaths.Text := s; // texto del comobo será la ruta
  index := cbPaths.Items.IndexOf(s);  // donde esta esa ruta en los items???
  if index = -1 then
  begin // si no está meterlo en primera posición
     cbPaths.Items.Insert(0, s); // inserta
     if cbScore.Items.Count = 0 then
        // si la lista está vacía ponerlo de primero y con score=ini_value
        cbScore.Items.Insert(0, IntToStr(ini_value))
     else  // si no está vacía la lista ponerlo de primero con los mismos puntos que está en primero
        cbScore.Items.Insert(0, IntToStr(StrToIntDef(cbScore.Items[0], 0)));
  end
  else
  begin // si está
     cbScore.Items[index] := IntToStr(StrToIntDef(cbScore.Items[index], 0) + 1);
     // aumentarle en 1 su score
     for i := 0 to cbPaths.Items.Count - 1 do
        // quitarle uno al score del resto de elementos
        if i <> index then
           cbScore.Items[i] := IntToStr(StrToIntDef(cbScore.Items[i], 0) - 1);
     i := index; // ponerlo en la nuevo posición merecida
     while (StrToIntDef(cbScore.Items[index], 0) >= StrToIntDef(cbScore.Items[i], 0)) and (i > 0) do
        Dec(i);
     if i < index then
     begin // si merece subir se sube
        ScoreAux := cbScore.Items[index];
        cbPaths.Items.Delete(index);
        cbScore.Items.Delete(index);
        cbPaths.Items.Insert(i, s);
        cbScore.Items.Insert(i, ScoreAux);
     end; // if
  end; // if index...
end;

procedure TFSelectPath.PNLPieResize(Sender: TObject);
begin
  bbSelect.Left := PNLPie.Width - bbSelect.Width;
  bbCancel.Left := bbSelect.Left - bbCancel.Width - 7;
end;

procedure TFSelectPath.PNLPathResize(Sender: TObject);
begin
  cbPaths.Width := PNLPath.Width;
end;

procedure TFSelectPath.stvPathChange(Sender: TObject; Node: TTreeNode);
begin
  cbPaths.Text := stvPath.Path;
end;

procedure TFSelectPath.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  cbPaths.Text := LowerCase(cbPaths.Text);
  GlobalPath := cbPaths.Text;
  if ModalResult = mrOk then
  begin
     if Trim(cbPaths.Text) <> '' then
        AddPath(Trim(cbPaths.Text))
     else
        CanClose := False;
  end;
end;

procedure TFSelectPath.stvPathEnter(Sender: TObject);
begin
  cbPaths.Text := stvPath.Path;
end;

procedure TFSelectPath.FormCreate(Sender: TObject);
begin
  // Asigno Imagenes a Botones
  GetBitmapFromImageList(bbSelect, 19, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(bbCancel, 20, DMMain.ILMain_Ac, 0);
end;

end.
