unit UOpeFMHorarioCalenEmpl;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, FIBDatabase, UFIBModificados, ULFLabel, ExtCtrls;

type
  TOpeFMHorarioCalenEmpl = class(TForm)
     LHorarioEspecial: TLFLabel;
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
  OpeFMHorarioCalenEmpl : TOpeFMHorarioCalenEmpl;

function RellenaHorario(var Horario: string): boolean;

implementation

uses UDMMain, UUtiles;

{$R *.DFM}

procedure TOpeFMHorarioCalenEmpl.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Asigno Imagenes a BitBtn
  GetBitmapFromImageList(BBOk, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancel, 1, DMMain.ILMain_Ac, 20);
end;

function RellenaHorario(var Horario: string): boolean;
begin
  with TOpeFMHorarioCalenEmpl.Create(nil) do
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
