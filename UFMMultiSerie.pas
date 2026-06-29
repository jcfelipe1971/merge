unit UFMMultiSerie;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, UFPEditSimple, ToolWin, ComCtrls, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, UNavigator, Menus,
  UTeclas, UControlEdit, NsDBGrid, ULFActionList, ULFPanel, ULFToolBar,
  rxPlacemnt, ULFFormStorage, UEditPanel;

type
  TFMMultiSerie = class(TFPEditSimple)
     TButtMarcarTodos: TToolButton;
     TButtDesmarcarTodos: TToolButton;
     AMarcarTodos: TAction;
     ADesmarcarTodos: TAction;
     ASalir: TAction;
     DBGMain: TDBGridFind2000;
     TBSep: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AMarcarTodosExecute(Sender: TObject);
     procedure ADesmarcarTodosExecute(Sender: TObject);
  private
     { Private declarations }
     ListaSerieMarcados: TStringList;
     SentenciaWhere: TStrings;
  public
     { Public declarations }
     procedure PonerWhere;
     procedure RellenaSeries(ASentenciaWhere: TStrings = nil);
  end;

var
  FMMultiSerie : TFMMultiSerie;

implementation

uses UDMMain, UDMMultiSerie, FIBDataSetRO, UFPregPedPdteProv,
  UFPregPedPdte, UDMLstPedPdte, UDMLstPedPdteProv, UDMLstAlbPdte,
  UFPregAlbPdte;

{$R *.dfm}

procedure TFMMultiSerie.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMultiserie, DMMultiserie);
  NavMain.DataSource := DMMultiserie.DSQMSeries;
  DBGMain.DataSource := DMMultiserie.DSQMSeries;
end;

procedure TFMMultiSerie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaSerieMarcados := TStringList.Create;
  DMMultiSerie.GuardarMarcados(ListaSerieMarcados);
  PonerWhere;
  CierraData(DMMultiSerie);
  ListaSerieMarcados.Free;
  Action := caFree;
end;

procedure TFMMultiSerie.AMarcarTodosExecute(Sender: TObject);
begin
  DMMultiserie.MarcarTodos(1);
end;

procedure TFMMultiSerie.ADesmarcarTodosExecute(Sender: TObject);
begin
  DMMultiserie.MarcarTodos(0);
end;

procedure TFMMultiSerie.PonerWhere;
var
  i : integer;
  S : string;
begin
  if (SentenciaWhere <> nil) then
  begin
     i := 0;
     if ListaSerieMarcados.Count > 0 then
     begin
        s := '(';
        while (i <= ListaSerieMarcados.Count - 1) do
        begin
           if (i < ListaSerieMarcados.Count - 1) then
              s := s + chr(39) +
                 ListaSerieMarcados[i] + chr(39) + ',';
           if (i = ListaSerieMarcados.Count - 1) then
              s := s + chr(39) +
                 ListaSerieMarcados[i] + chr(39) + ')';
           Inc(i);
        end;
        SentenciaWhere.Clear;
        SentenciaWhere.Add(s);
     end;
  end;
end;

procedure TFMMultiSerie.RellenaSeries(ASentenciaWhere: TStrings = nil);
begin
  SentenciaWhere := ASentenciaWhere;
  DMMultiSerie.RellenarSeleccion;
  DMMultiSerie.FiltrarSeleccion;
  ShowModal;
end;

end.
