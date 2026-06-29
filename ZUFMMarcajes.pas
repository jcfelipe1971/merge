unit ZUFMMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel, ToolWin, ComCtrls,
  ULFToolBar, StdCtrls, ULFLabel, Mask, rxToolEdit, ULFDateEdit, ULFComboBox,
  UNavigator;

type
  TZFMMarcajes = class(TG2KForm)
     TBMain: TLFToolBar;
     PnlMain: TLFPanel;
     DBGFMarcajes: TDBGridFind2000;
     TButtSalir: TToolButton;
     TSep1: TToolButton;
     PnlDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     DBGFDetalle: TDBGridFind2000;
     NavMain: THYMNavigator;
     TSep2: TToolButton;
     NavDetalle: THYMNavigator;
     PnlNavDet: TLFPanel;
     LblIncidencias: TLFLabel;
     PnlNavFiltros: TLFPanel;
     LblEstado: TLFLabel;
     LblDesdeFecha: TLFLabel;
     LblHastaFecha: TLFLabel;
     CBEstado: TLFComboBox;
     DEDesde: TLFDateEdit;
     DEHasta: TLFDateEdit;
     ButtFiltrar: TButton;
     TButtBorraProcesados: TToolButton;
     TButtBorraTodos: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtSalirClick(Sender: TObject);
     procedure ButtFiltrarClick(Sender: TObject);
     procedure CBEstadoChange(Sender: TObject);
     procedure TButtBorraProcesadosClick(Sender: TObject);
     procedure TButtBorraTodosClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtrar;
  end;

var
  ZFMMarcajes : TZFMMarcajes;

implementation

uses ZUDMMarcajes, UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TZFMMarcajes.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TZDMMarcajes, ZDMMarcajes);

  DEDesde.Date := REntorno.FechaTrabSH;
  DEHasta.Date := REntorno.FechaTrabSH;

  Filtrar;
end;

procedure TZFMMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ZDMMarcajes);
  Action := caFree;
end;

procedure TZFMMarcajes.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMMarcajes.ButtFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TZFMMarcajes.CBEstadoChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TZFMMarcajes.TButtBorraProcesadosClick(Sender: TObject);
begin
  if ConfirmaMensaje(_('¿Desea eliminar los marcajes ya procesados?')) then
     if ConfirmaGrave then
     begin
        ZDMMarcajes.BorraMarcajes(1);
        Filtrar;
     end;
end;

procedure TZFMMarcajes.TButtBorraTodosClick(Sender: TObject);
begin
  if ConfirmaMensaje(_('¿Desea eliminar TODOS los marcajes?')) then
     if ConfirmaGrave then
     begin
        ZDMMarcajes.BorraMarcajes(-1);
        Filtrar;
     end;
end;

procedure TZFMMarcajes.Filtrar;
begin
  ZDMMarcajes.FiltraMarcajes(CBEstado.ItemIndex, DEDesde.Date, DEHasta.Date);
end;

end.
