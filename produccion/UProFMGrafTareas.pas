unit UProFMGrafTareas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UProFPGrafico, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ToolWin, ComCtrls, ULFToolBar, TeeProcs, TeEngine, Chart,
  DbChart, ExtCtrls, ULFPanel, Series;

type
  TProFMGrafTareas = class(TProFPGrafico)
     Series1: THorizBarSeries;
     Series2: THorizBarSeries;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure VerGrafico(id_orden: integer);
  end;

var
  ProFMGrafTareas : TProFMGrafTareas;

implementation

uses UProDMGrafTareas, UFormGest;

{$R *.dfm}

procedure TProFMGrafTareas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMGrafTareas, ProDMGrafTareas);
end;

procedure TProFMGrafTareas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMGrafTareas);
  Action := caFree;
end;

procedure TProFMGrafTareas.VerGrafico(id_orden: integer);
begin
  ProDMGrafTareas.Datos(id_orden);
end;

end.
