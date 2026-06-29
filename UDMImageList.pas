unit UDMImageList;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  TDMImageList = class(TDataModule)
     ILMain_Ac: TImageList;
     ILMain_In: TImageList;
     ILOrdGrid: TImageList;
     ILMainTPV_Ac: TImageList;
     ILMainTPV_In: TImageList;
     ILMainTPV: TImageList;
     ToolbarImages: TImageList;
     ILOrdenFabricacion: TImageList;
     ILTPV_Ac: TImageList;
     ILTPV_In: TImageList;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMImageList : TDMImageList;

implementation

{$R *.dfm}

initialization
  RegisterClass(TDMImageList);
end.
