unit UFMultiSeleccion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, ToolWin, ComCtrls, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, UNavigator, Menus,
  UTeclas, UControlEdit, NsDBGrid, ULFActionList, ULFPanel, ULFToolBar;

type

  TFMultiSeleccion = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtMarcarTodos: TToolButton;
     TButtDesmarcarTodos: TToolButton;
     PMain: TLFPanel;
     DBGSeleccion: TDBGridFind2000;
     TButtSalir: TToolButton;
     ALMain: TLFActionList;
     AMarcarTodos: TAction;
     ADesmarcarTodos: TAction;
     ASalir: TAction;
     NavMain: THYMNavigator;
     ToolButton1: TToolButton;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ASalirExecute(Sender: TObject);
     procedure AMarcarTodosExecute(Sender: TObject);
     procedure ADesmarcarTodosExecute(Sender: TObject);
  private
     { Private declarations }
     ListaCanales, ListaAlmacenes: TStringList;
  public
     //procedure Mostrar(var CanalOut:integer; Lista : TStringList);
     procedure Mostrar(var CanalOut: integer; var AlmOut: string; LCanales, LAlm: TStringList; Modo: smallint);
     procedure MostrarCanal(var CanalOut: integer; LCanales: TStringList);
  end;

var
  FMultiSeleccion : TFMultiSeleccion;

implementation

uses UDMMultiSeleccion, UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMultiSeleccion.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMMultiSeleccion, DMMultiSeleccion);
end;

procedure TFMultiSeleccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMMultiSeleccion.ActualizarListas(ListaCanales, ListaAlmacenes);
  CierraData(DMMultiSeleccion);
  Action := caFree;
end;

procedure TFMultiSeleccion.Mostrar(var CanalOut: integer; var AlmOut: string; LCanales, LAlm: TStringList; Modo: smallint);
begin
  ListaCanales := LCanales;
  ListaAlmacenes := LAlm;
  DMMultiSeleccion.OcultarAlmacen := (Modo = 0);
  DMMultiSeleccion.RellenarSeleccion;
  DMMultiSeleccion.FiltrarSeleccion;
  ShowModal;
  case ListaCanales.Count of
     0:
     begin
        CanalOut := REntorno.Canal;
        AlmOut := 'EditFind'; //Para que coja el del EditFind
        // AlmOut := REntorno.AlmacenDefecto;
        ListaCanales.Add(IntToStr(CanalOut));
        // ListaAlmacenes.Add( AlmOut );
     end;
     1:
     begin
        CanalOut := StrToIntDef(ListaCanales[0], REntorno.Canal);
        AlmOut := ListaAlmacenes[0];
     end;
     else
     begin
        CanalOut := 0;
        AlmOut := '';
     end;
  end;
end;

procedure TFMultiSeleccion.MostrarCanal(var CanalOut: integer; LCanales: TStringList);
var
  c : smallint;
begin
  ListaCanales := LCanales;
  ListaAlmacenes := nil;
  // Ocultar Almacén
  c := EncuentraField(DBGSeleccion, 'ALMACEN');
  if (c >= 0) then
     DBGSeleccion.Columns[c].Visible := False;
  c := EncuentraField(DBGSeleccion, 'TITULO_CANAL');
  if (c >= 0) then
     DBGSeleccion.Columns[1].Width := 290;

  DMMultiSeleccion.OcultarAlmacen := True;
  DMMultiSeleccion.RellenarSeleccion;
  DMMultiSeleccion.FiltrarSeleccion;
  ShowModal;
  case ListaCanales.Count of
     0:
     begin
        CanalOut := REntorno.Canal;
        ListaCanales.Add(IntToStr(CanalOut));
     end;
     1:
     begin
        CanalOut := StrToIntDef(ListaCanales[0], REntorno.Canal);
     end;
     else
     begin
        CanalOut := 0;
     end;
  end;
end;

procedure TFMultiSeleccion.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMultiSeleccion.AMarcarTodosExecute(Sender: TObject);
begin
  DMMultiSeleccion.MarcarTodos(1);
end;

procedure TFMultiSeleccion.ADesmarcarTodosExecute(Sender: TObject);
begin
  DMMultiSeleccion.MarcarTodos(0);
end;

end.
