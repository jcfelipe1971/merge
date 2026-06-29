unit UOpeFMRazonCalenEmpr;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ULFEdit, ULFLabel, ExtCtrls;

type
  TOpeFMRazonCalenEmpr = class(TForm)
     LRazon: TLFLabel;
     ERazonFiesta: TLFEdit;
     BBCancel: TBitBtn;
     BBOk: TBitBtn;
     PMain: TPanel;
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMRazonCalenEmpr : TOpeFMRazonCalenEmpr;

function RellenaRazon(var Razon: string): boolean;

implementation

uses UDMMain, UUtiles;

{$R *.DFM}

procedure TOpeFMRazonCalenEmpr.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Asigno Imagenes a BitdBtn
  GetBitmapFromImageList(BBOk, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancel, 1, DMMain.ILMain_Ac, 20);
end;

function RellenaRazon(var Razon: string): boolean;
begin
  with TOpeFMRazonCalenEmpr.Create(nil) do
  begin
     try
        Razon := '';
        Result := (ShowModal = mrOk);
        if (Result) then
           Razon := ERazonFiesta.Text;
     finally
        Free;
     end;
  end;
end;

end.
