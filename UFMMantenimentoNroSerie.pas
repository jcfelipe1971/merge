unit UFMMantenimentoNroSerie;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UHYEdits, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, ExtCtrls, DB, UNavigator, ComCtrls, UControlEdit, UDBDateTimePicker,
  Grids, DBGrids, rxPlacemnt, NsDBGrid, UHYDBGrid, ULFEdit, ULFLabel,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFPageControl;

type
  TFMMantenimientoNroSerie = class(THYForm)
     Panel1: TLFPanel;
     EFNroSerie: TEditFind2000;
     Label1: TLFLabel;
     Label9: TLFLabel;
     EditTitulo: TLFEdit;
     HYMNavigator1: THYMNavigator;
     HYDBENroSerie: THYDBEdit;
     DBEFArticulo: TDBEditFind2000;
     PageControl1: TLFPageControl;
     TSFicha: TTabSheet;
     Panel2: TLFPanel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     Label4: TLFLabel;
     Label5: TLFLabel;
     Label6: TLFLabel;
     Label7: TLFLabel;
     Label8: TLFLabel;
     Label10: TLFLabel;
     Label11: TLFLabel;
     Label12: TLFLabel;
     Label13: TLFLabel;
     DBEditFind20001: TDBEditFind2000;
     DBEditFind20002: TDBEditFind2000;
     HYDBEdit1: THYDBEdit;
     DBEditFind20004: TDBEditFind2000;
     HYDBEdit2: THYDBEdit;
     HYDBEdit3: THYDBEdit;
     HYDBEdit5: THYDBEdit;
     DBEditFind20003: TDBEditFind2000;
     DBEditFind20005: TDBEditFind2000;
     HYDBEdit6: THYDBEdit;
     HYDBEdit7: THYDBEdit;
     DBEditFind20006: TDBEditFind2000;
     DBDateTimePicker1: TDBDateTimePicker;
     DBDateTimePicker2: TDBDateTimePicker;
     EdProveedor: TLFEdit;
     EdCliente: TLFEdit;
     HYDBEdit4: THYDBEdit;
     DBEditFind20008: TDBEditFind2000;
     DBEditFind20009: TDBEditFind2000;
     HYDBEdit9: THYDBEdit;
     HYDBEdit10: THYDBEdit;
     DBEditFind200010: TDBEditFind2000;
     DBDateTimePicker3: TDBDateTimePicker;
     HYDBEdit11: THYDBEdit;
     DBEditFind200011: TDBEditFind2000;
     DBEditFind200012: TDBEditFind2000;
     HYDBEdit12: THYDBEdit;
     HYDBEdit13: THYDBEdit;
     DBEditFind200013: TDBEditFind2000;
     DBDateTimePicker4: TDBDateTimePicker;
     TSTabla: TTabSheet;
     Label14: TLFLabel;
     HYDBEdit14: THYDBEdit;
     DBEditFind200014: TDBEditFind2000;
     DBEditFind200015: TDBEditFind2000;
     HYDBEdit15: THYDBEdit;
     HYDBEdit16: THYDBEdit;
     DBEditFind200016: TDBEditFind2000;
     DBDateTimePicker5: TDBDateTimePicker;
     Label15: TLFLabel;
     HYDBEdit17: THYDBEdit;
     DBEditFind200017: TDBEditFind2000;
     DBEditFind200018: TDBEditFind2000;
     HYDBEdit18: THYDBEdit;
     HYDBEdit19: THYDBEdit;
     DBEditFind200019: TDBEditFind2000;
     DBDateTimePicker6: TDBDateTimePicker;
     DBCHKDevolucionVenta: TLFDBCheckBox;
     DBCHKDevolucionCompra: TLFDBCheckBox;
     LNroSerie: TLFLabel;
     LArticulo: TLFLabel;
     EFArticulo: TEditFind2000;
     TSMovimientos: TTabSheet;
     Panel3: TLFPanel;
     HYTDBGMovimientos: THYTDBGrid;
     FSMain: TFormStorage;
     Panel4: TLFPanel;
     HYTDBGTabla: THYTDBGrid;
     DBEFProveedor: TDBEditFind2000;
     Label16: TLFLabel;
     DBEFCliente: TDBEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure EFNroSerieChange(Sender: TObject);
     {    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
}    procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloChange(Sender: TObject);
     procedure TSMovimientosShow(Sender: TObject);
     procedure HYMNavigator1Click(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFProveedorChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMantenimientoNroSerie : TFMMantenimientoNroSerie;

implementation

uses UFormGest, UDMMain, UDMMantenimentoNroSerie, UEntorno, UDameDato;

{$R *.DFM}

procedure TFMMantenimientoNroSerie.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMMantenimientoNroSerie, DMMantenimientoNroSerie);
  PageControl1.ActivePage := TSFicha;
end;

procedure TFMMantenimientoNroSerie.EFNroSerieChange(Sender: TObject);
begin
  if (EFNroSerie.Text <> '') then
  begin
     EFArticulo.Text := '';
     DMMantenimientoNroSerie.Filtra(EFNroSerie.Text, 1);
  end;
  {   DMMantenimientoNroSerie.xNroSerie.First;
   DMMantenimientoNroSerie.xNroSerie.LocateNext('NRO_SERIE',EditFind20001.Text,[]);}
end;

{
procedure TFMMantenimientoNroSerie.Button1Click(Sender: TObject);
var
   nro_serie_ant : string;
begin
   if DMMantenimientoNroSerie.xNroSerie.State in [dsEdit] then
   begin
     DMMantenimientoNroSerie.xNroSerie.Post;
     DMMantenimientoNroSerie.TLocal.Commit;
     DMMantenimientoNroSerie.TLocal.StartTransaction;
     nro_serie_ant := EditFind20001.Text;
     EditFind20001.Text := '';
     EditFind20001.Text := nro_serie_ant;
   end;
end;

procedure TFMMantenimientoNroSerie.Button2Click(Sender: TObject);
var
   nro_serie_ant : string;
begin
   if DMMantenimientoNroSerie.xNroSerie.State in [dsEdit] then
   begin
     DMMantenimientoNroSerie.xNroSerie.CancelUpdates;
     DMMantenimientoNroSerie.TLocal.Rollback;
     DMMantenimientoNroSerie.TLocal.StartTransaction;
     nro_serie_ant := EditFind20001.Text;
     EditFind20001.Text := '';
     EditFind20001.Text := nro_serie_ant;
   end;
end;
}
procedure TFMMantenimientoNroSerie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMMantenimientoNroSerie);
end;

procedure TFMMantenimientoNroSerie.EFArticuloChange(Sender: TObject);
begin
  if (EFArticulo.Text <> '') then
  begin
     EFNroSerie.Text := '';
     DMMantenimientoNroSerie.Filtra(EFArticulo.Text, 2);
  end;
end;

procedure TFMMantenimientoNroSerie.TSMovimientosShow(Sender: TObject);
begin
  DMMantenimientoNroSerie.MuestraMovimientos;
end;

procedure TFMMantenimientoNroSerie.HYMNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  if (PageControl1.ActivePage = TSMovimientos) then
     DMMantenimientoNroSerie.MuestraMovimientos;
end;

procedure TFMMantenimientoNroSerie.DBEFProveedorChange(Sender: TObject);
begin
  try
     EDProveedor.Text := DameTituloProveedor(StrToInt(DBEFProveedor.Text))
  except
     EDProveedor.Text := '';
  end;
end;

procedure TFMMantenimientoNroSerie.DBEFClienteChange(Sender: TObject);
begin
  try
     EDCliente.Text := DameTituloCliente(StrToInt(DBEFCliente.Text))
  except
     EDCliente.Text := '';
  end;
end;

end.
