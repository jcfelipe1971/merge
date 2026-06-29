unit URecibeFicheros;

interface

uses
  Windows, ShellAPI;

type
  TRecibeFicheros = class(TObject)
  private
     fDropHandle: HDROP;
     function GetFile(Idx: integer): string;
     function GetFileCount: integer;
     function GetPoint: TPoint;
  public
     constructor Create(DropHandle: HDROP);
     destructor Destroy; override;
     property FileCount: integer Read GetFileCount;
     property Files[Idx: integer]: string Read GetFile;
     property DropPoint: TPoint Read GetPoint;
  end;

implementation

{ TRecibeFicheros }

constructor TRecibeFicheros.Create(DropHandle: HDROP);
begin
  inherited Create;
  fDropHandle := DropHandle;
end;

destructor TRecibeFicheros.Destroy;
begin
  DragFinish(fDropHandle);
  inherited;
end;

function TRecibeFicheros.GetFile(Idx: integer): string;
var
  FileNameLength : integer;
begin
  FileNameLength := DragQueryFile(fDropHandle, Idx, nil, 0);
  SetLength(Result, FileNameLength);
  DragQueryFile(fDropHandle, Idx, PChar(Result), FileNameLength + 1);
end;

function TRecibeFicheros.GetFileCount: integer;
begin
  Result := DragQueryFile(fDropHandle, $FFFFFFFF, nil, 0);
end;

function TRecibeFicheros.GetPoint: TPoint;
begin
  DragQueryPoint(fDropHandle, Result);
end;

end.
 