unit UProFMGantt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet,
  ExtCtrls, UGantt, ULFPanel, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  StdCtrls, Menus, FIBQuery, HYFIBQuery, ComCtrls, ToolWin, ULFToolBar,
  UEditPanel, UNavigator, UTeclas, UControlEdit, UFormGest;

type
  TProFMGantt = class(TG2KForm)
     PNLMain: TLFPanel;
     DBGGantt: TFIBHYGGridFind;
     GT: TGantt;
     PopupMenuDiagrama: TPopupMenu;
     MINuevaTarea: TMenuItem;
     MINuevoRecurso: TMenuItem;
     TBMain: TLFToolBar;
     EPPanel: THYMEditPanel;
     ToolButton1: TToolButton;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     TBActualizar: TToolButton;
     ToolButton3: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure GTItemDblClick(Sender: TObject; Item: TGanttItem);
     procedure MINuevaTareaClick(Sender: TObject);
     procedure MINuevoRecursoClick(Sender: TObject);
     procedure GTItemPaint(Sender: TObject; Item: TGanttItem);
     procedure TBActualizarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMGantt : TProFMGantt;

implementation

uses UDMMain, UProDMGantt;

{$R *.dfm}

procedure TProFMGantt.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMGantt, ProDMGantt);
  // Cargar los datos en el Gantt
  GT.LeeDatos;
end;

procedure TProFMGantt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ProDMGantt);
end;

procedure TProFMGantt.GTItemDblClick(Sender: TObject; Item: TGanttItem);
begin
  // Ejemplo de lo que se puede mostrar al hacer doble-click en un item
  ShowMessage(Item.Datos.EjeY_Desc);
end;

procedure TProFMGantt.GTItemPaint(Sender: TObject; Item: TGanttItem);
begin
  // Ejemplo de lo que se puede pintar en la barra de cada item
  Item.Texto := IntToStr(Item.Datos.Tiempo);
end;

procedure TProFMGantt.MINuevaTareaClick(Sender: TObject);
begin
  // No es normal dar de alta los datos por aquí, pero para pruebas...
  // Aquí se da de alta una nueva tarea
  ProDMGantt.NuevaTarea;
  GT.LeeDatos;
end;

procedure TProFMGantt.MINuevoRecursoClick(Sender: TObject);
begin
  // No es normal dar de alta los datos por aquí, pero para pruebas...
  // Aquí se da de alta un nuevo recurso en la tarea seleccionada
  ProDMGantt.NuevoRecurso;
  GT.LeeDatos;
end;

procedure TProFMGantt.TBActualizarClick(Sender: TObject);
var
  Marca : TBookmark;
begin
  with ProDMGantt.QMGantt do
  begin
     Marca := GetBookmark;
     try
        Close;
        Open;
        DisableControls;
        GT.LeeDatos;
        GotoBookmark(marca);
     finally
        EnableControls;
        FreeBookmark(marca);
     end;
  end;
end;

end.
