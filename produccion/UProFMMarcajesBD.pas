unit UProFMMarcajesBD;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel, ToolWin, ComCtrls,
  ULFToolBar, StdCtrls, ULFLabel, Mask, rxToolEdit, ULFDateEdit, ULFComboBox,
  UNavigator;

type
  TProFMMarcajesBD = class(TG2KForm)
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
     ToolButton1: TToolButton;
     TMarcajeManual: TToolButton;
     TBorrarMarcaje: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtSalirClick(Sender: TObject);
     procedure ButtFiltrarClick(Sender: TObject);
     procedure CBEstadoChange(Sender: TObject);
     procedure TButtBorraProcesadosClick(Sender: TObject);
     procedure TMarcajeManualClick(Sender: TObject);
     procedure DEDesdeChange(Sender: TObject);
     procedure DEHastaChange(Sender: TObject);
     procedure TBorrarMarcajeClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtrar;
  end;

var
  ProFMMarcajesBD : TProFMMarcajesBD;

implementation

uses UProDMMarcajesBD, UDMMain, UEntorno, UUtiles, UProFMMarcajeCOM;

{$R *.dfm}

procedure TProFMMarcajesBD.FormCreate(Sender: TObject);
begin
  AbreData(TProDMMarcajesBD, ProDMMarcajesBD);

  DEDesde.Date := REntorno.FechaTrabSH;
  DEHasta.Date := REntorno.FechaTrabSH;

  Filtrar;
end;

procedure TProFMMarcajesBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMMarcajesBD);
  Action := caFree;
end;

procedure TProFMMarcajesBD.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMMarcajesBD.ButtFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TProFMMarcajesBD.CBEstadoChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TProFMMarcajesBD.TButtBorraProcesadosClick(Sender: TObject);
begin
  if ConfirmaMensaje('¿Desea eliminar los marcajes filtrados?') then
     if ConfirmaGrave then
     begin
        ProDMMarcajesBD.BorraMarcajes;
        Filtrar;
     end;
end;

procedure TProFMMarcajesBD.Filtrar;
begin
  ProDMMarcajesBD.FiltraMarcajes(CBEstado.ItemIndex, DEDesde.Date, DEHasta.Date);
end;

procedure TProFMMarcajesBD.TMarcajeManualClick(Sender: TObject);
begin
  AbreForm(TProFMMarcajeCom, ProFMMarcajeCom, Sender);
end;

procedure TProFMMarcajesBD.DEDesdeChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TProFMMarcajesBD.DEHastaChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TProFMMarcajesBD.TBorrarMarcajeClick(Sender: TObject);
begin
  ProDMMarcajesBD.BorrarMarcaje;
end;

end.
