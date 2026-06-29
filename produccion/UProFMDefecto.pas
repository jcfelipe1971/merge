unit UProFMDefecto;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel, ToolWin, ComCtrls,
  ULFToolBar, StdCtrls, ULFLabel, Mask, rxToolEdit, ULFDateEdit, ULFComboBox,
  UNavigator, ULFPageControl, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit;

type
  TProFMDefecto = class(TG2KForm)
     TBMain: TLFToolBar;
     PnlMain: TLFPanel;
     TButtSalir: TToolButton;
     TSep1: TToolButton;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     CEMainMifirst: TMenuItem;
     CEMainMiprior: TMenuItem;
     CEMainMinext: TMenuItem;
     CEMainMilast: TMenuItem;
     CEMainMiinsert: TMenuItem;
     CEMainMidelete: TMenuItem;
     CEMainMiedit: TMenuItem;
     CEMainMipost: TMenuItem;
     CEMainMicancel: TMenuItem;
     CEMainMirefresh: TMenuItem;
     CEMainMiSep: TMenuItem;
     CEMainMibuscar: TMenuItem;
     CEMainMiaprox: TMenuItem;
     CEMainMiexacta: TMenuItem;
     CEMainMiimprime: TMenuItem;
     CEMainMirango: TMenuItem;
     CEMainMireport: TMenuItem;
     CEMainMicopy: TMenuItem;
     CEMainMicut: TMenuItem;
     CEMainMipaste: TMenuItem;
     CEMainMisalir: TMenuItem;
     ALMain: TLFActionList;
     FSMain: TLFFibFormStorage;
     CEDetallePMEdit: TPopUpTeclas;
     CEDetalleMifirst: TMenuItem;
     CEDetalleMiprior: TMenuItem;
     CEDetalleMinext: TMenuItem;
     CEDetalleMilast: TMenuItem;
     CEDetalleMiinsert: TMenuItem;
     CEDetalleMidelete: TMenuItem;
     CEDetalleMiedit: TMenuItem;
     CEDetalleMipost: TMenuItem;
     CEDetalleMicancel: TMenuItem;
     CEDetalleMirefresh: TMenuItem;
     CEDetalle: TControlEdit;
     PCDefecto: TLFPageControl;
     TSFicha: TTabSheet;
     DBGFDefecto: TDBGridFind2000;
     PnlNavFiltros: TLFPanel;
     LblEstado: TLFLabel;
     LblDesdeFecha: TLFLabel;
     LblHastaFecha: TLFLabel;
     CBEstado: TLFComboBox;
     DEDesde: TLFDateEdit;
     DEHasta: TLFDateEdit;
     ButtFiltrar: TButton;
     ToolButton1: TToolButton;
     TBActualizarFiltrados: TToolButton;
     PnlDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     ToolButton2: TToolButton;
     Splitter1: TSplitter;
     ASalir: TAction;
     SActualizarFiltrados: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBEstadoChange(Sender: TObject);
     procedure DBGFDefectoBusqueda(Sender: TObject);
     procedure ButtFiltrarClick(Sender: TObject);
     procedure DEDesdeChange(Sender: TObject);
     procedure DEHastaChange(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure SActualizarFiltradosExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtrar;
  end;

var
  ProFMDefecto : TProFMDefecto;

implementation

uses UProDMDefecto, UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TProFMDefecto.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TProDMDefecto, ProDMDefecto);

  NavMain.DataSource := ProDMDefecto.DSQMDefecto;
  DBGFDefecto.DataSource := ProDMDefecto.DSQMDefecto;
  NavDetalle.DataSource := ProDMDefecto.DSQMDetalle;
  DBGFDetalle.DataSource := ProDMDefecto.DSQMDetalle;

  DBGFDetalle.ColumnaInicial := DBGFDetalle.FindColumn('CODIGO_DEFECTO').Index;

  CBEstado.ItemIndex := 0;
  DEDesde.Date := REntorno.FechaTrabSH;
  DEHasta.Date := REntorno.FechaTrabSH;

  Filtrar;
end;

procedure TProFMDefecto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMDefecto);
  Action := caFree;
end;

procedure TProFMDefecto.CBEstadoChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TProFMDefecto.Filtrar;
begin
  ProDMDefecto.FiltraMarcajes(CBEstado.ItemIndex, DEDesde.Date, DEHasta.Date);
end;

procedure TProFMDefecto.DBGFDefectoBusqueda(Sender: TObject);
begin
  with DBGFDefecto do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if ((Trim(TablaABuscar) = 'VER_EMPLEADOS_EF') and (ColumnaActual = 'OPERARIO')) then
        CondicionBusqueda := 'ACTIVO = 1';

     if ((Trim(TablaABuscar) = 'PRO_ORD') and (ColumnaActual = 'OP')) then
        CondicionBusqueda := '(SITUACION > 1) AND (SITUACION < 4)';

     if ((Trim(TablaABuscar) = 'PRO_ORD_FASES') and (ColumnaActual = 'FASE')) then
        CondicionBusqueda := 'ID_ORDEN =' + ProDMDefecto.QMDefectoOP.AsString;
  end;
end;

procedure TProFMDefecto.ButtFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TProFMDefecto.DEDesdeChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TProFMDefecto.DEHastaChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TProFMDefecto.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TProFMDefecto.SActualizarFiltradosExecute(Sender: TObject);
begin
  ProDMDefecto.MarcarFiltrados(DEDesde.Date, DEHasta.Date);
end;

end.
