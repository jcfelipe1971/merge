unit UOpeFMRazonCalenEmpl;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ULFEdit, ULFLabel, ExtCtrls;

type
  TOpeFMRazonCalenEmpl = class(TForm)
     EHorasTrab: TLFEdit;
     ERazonFiesta: TLFEdit;
     LHorasTrab: TLFLabel;
     LRazonFiesta: TLFLabel;
     BBCancel: TBitBtn;
     BBOk: TBitBtn;
     PMain: TPanel;
     procedure BBOkClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMRazonCalenEmpl : TOpeFMRazonCalenEmpl;

function RellenaRazon(var Razon: string; var Horas: double; PreguntaHoras: boolean): boolean;

implementation

uses UDMMain, UUtiles;

{$R *.DFM}

procedure TOpeFMRazonCalenEmpl.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Asigno Imagenes a BitBtn
  GetBitmapFromImageList(BBOk, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancel, 1, DMMain.ILMain_Ac, 20);
end;

function RellenaRazon(var Razon: string; var Horas: double; PreguntaHoras: boolean): boolean;
begin
  with TOpeFMRazonCalenEmpl.Create(nil) do
  begin
     try
        Razon := '';
        Horas := 0;

        if (PreguntaHoras) then
           LRazonFiesta.Caption := _('Comentario')
        else
        begin
           LHorasTrab.Visible := False;
           EHorasTrab.Visible := False;
        end;

        Result := (ShowModal = mrOk);
        if (Result) then
        begin
           Razon := ERazonFiesta.Text;
           Horas := StrToFloat(EHorasTrab.Text);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TOpeFMRazonCalenEmpl.BBOkClick(Sender: TObject);
var
  dummy : double;
begin
  try
     dummy := StrToFloat(EHorasTrab.Text);
  except
     ShowMessage(_('La hora esta mal introducida.'));
  end;
end;

end.
