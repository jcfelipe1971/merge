unit UProFMGrafMateriales;

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
  TProFMGrafMateriales = class(TProFPGrafico)
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
  ProFMGrafMateriales : TProFMGrafMateriales;

implementation

uses UFormGest, UProDMGrafMateriales;

{$R *.dfm}

procedure TProFMGrafMateriales.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMGrafMateriales, ProDMGrafMateriales);
end;

procedure TProFMGrafMateriales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMGrafMateriales);
  Action := caFree;
end;

procedure TProFMGrafMateriales.VerGrafico(id_orden: integer);
begin
  ProDMGrafMateriales.Datos(id_orden);
end;

end.
