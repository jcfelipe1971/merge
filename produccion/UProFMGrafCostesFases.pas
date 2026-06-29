unit UProFMGrafCostesFases;

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
  TProFMGrafCostesFases = class(TProFPGrafico)
     Series1: TBarSeries;
     Series2: TBarSeries;
     Series3: TBarSeries;
     Series4: TBarSeries;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure VerGrafico(id_orden: integer);
  end;

var
  ProFMGrafCostesFases : TProFMGrafCostesFases;

implementation

uses UFormGest, UProDMGrafCostesFases;

{$R *.dfm}

procedure TProFMGrafCostesFases.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMGrafCostesFases, ProDMGrafCostesFases);
end;

procedure TProFMGrafCostesFases.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMGrafCostesFases);
  Action := caFree;
end;

procedure TProFMGrafCostesFases.VerGrafico(id_orden: integer);
begin
  ProDMGrafCostesFases.Datos(id_orden);
end;

end.
