unit ZUFMImgRibetes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  dbcgrids, ULFDBCtrlGrid;

type
  TZFMImgRibetes = class(TForm)
     DBCGRibetes: TLFDBCtrlGrid;
     DBEDescRibete: TLFDbedit;
     DBERibete: TLFDbedit;
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
  ZFMImgRibetes : TZFMImgRibetes;

implementation

uses UFormGest, ZUDMImgRibetes;

{$R *.dfm}

procedure TZFMImgRibetes.FormCreate(Sender: TObject);
begin
  AbreData(TZDMImgRibetes, ZDMImgRibetes);
end;

procedure TZFMImgRibetes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ZDMImgRibetes);
  Action := caFree;
end;

procedure TZFMImgRibetes.DBImageDblClick(Sender: TObject);
begin
  ZDMImgRibetes.DevuelveValor;

  Close;
end;

end.
