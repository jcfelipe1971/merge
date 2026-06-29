unit ZUFMImgBambalinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  dbcgrids, ULFDBCtrlGrid;

type
  TZFMImgBambalinas = class(TForm)
     DBCGBambalinas: TLFDBCtrlGrid;
     DBEDescBambalina: TLFDbedit;
     DBEBambalina: TLFDbedit;
     DBImage: TDBImage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBImageDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMImgBambalinas : TZFMImgBambalinas;

implementation

uses UFormGest, ZUDMImgBambalinas;

{$R *.dfm}

procedure TZFMImgBambalinas.FormCreate(Sender: TObject);
begin
  AbreData(TZDMImgBambalinas, ZDMImgBambalinas);
end;

procedure TZFMImgBambalinas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ZDMImgBambalinas);
  Action := caFree;
end;

procedure TZFMImgBambalinas.DBImageDblClick(Sender: TObject);
begin
  ZDMImgBambalinas.DevuelveValor;

  Close;
end;

end.
