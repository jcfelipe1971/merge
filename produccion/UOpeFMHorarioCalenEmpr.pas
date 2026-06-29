unit UOpeFMHorarioCalenEmpr;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, FIBDatabase, UFIBModificados, ULFLabel, ExtCtrls;

type
  TOpeFMHorarioCalenEmpr = class(TForm)
     LHorario: TLFLabel;
     BBCancel: TBitBtn;
     BBOk: TBitBtn;
     EFHorario: TLFEditFind2000;
     TLocal: THYTransaction;
     PMain: TPanel;
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMHorarioCalenEmpr : TOpeFMHorarioCalenEmpr;

function RellenaHorario(var Horario: string): boolean;

implementation

{$R *.DFM}

uses UDMMain, UUtiles;

procedure TOpeFMHorarioCalenEmpr.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Asigno Imagenes a BitBtn
  GetBitmapFromImageList(BBOk, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancel, 1, DMMain.ILMain_Ac, 20);
end;

function RellenaHorario(var Horario: string): boolean;
begin
  with TOpeFMHorarioCalenEmpr.Create(nil) do
  begin
     try
        Horario := '';
        Result := (ShowModal = mrOk);
        if (Result) then
           Horario := EFHorario.Text;
     finally
        Free;
     end;
  end;
end;

end.
