unit UCrmFMVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ToolWin, ComCtrls, ExtCtrls, UNavigator, Menus, UTeclas, UControlEdit,
  rxPlacemnt, ULFFormStorage, UEditPanel, StdCtrls, ULFToolBar, NsDBGrid,
  UFormGest, DBCtrls, Mask, UHYEdits,
  UDBDateTimePicker, DB, rxToolEdit, RXDBCtrl, ULFDBMemo,
  ULFPanel, ULFLabel, ULFPageControl;

type
  TCrmFMVentas = class(TG2KForm)
     TBMain: TLFToolBar;
     NavVentas: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     HYMEditPanel1: THYMEditPanel;
     TSep2: TToolButton;
     FSMain: TLFFibFormStorage;
     PnlMain: TLFPanel;
     PCDefecto: TLFPageControl;
     TSFicha: TTabSheet;
     DBGFCrmVentas: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure HYMEditPanel1ClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     seleccionar: integer;
  end;

var
  CrmFMVentas : TCrmFMVentas;

implementation

uses UDMMain, UCrmDmVentas, UEntorno, UProFMSelecImpEsc, FIBDataSet;

{$R *.dfm}

procedure TCrmFMVentas.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TCrmDMVentas, CrmDMVentas);
  // DataSources
  NavVentas.DataSource := CrmDMVentas.DSQMCrmVentas;
  DBGFCrmVentas.DataSource := CrmDMVentas.DSQMCrmVentas;
end;

procedure TCrmFMVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(CrmDMVentas);
end;

procedure TCrmFMVentas.HYMEditPanel1ClickRango(Sender: TObject; var Continua: boolean);
begin
  CrmDMVentas.BusquedaCompleja;
  Continua := False;
end;

end.
