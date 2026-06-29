unit ZUFMLstRecibos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, DBCtrls,
  Mask, rxToolEdit, ULFEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFCheckBox, TFlatCheckBoxUnit, ULFLabel, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  ULFEditFind2000, ULFDateEdit, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TZFMLstRecibos = class(TFPEditListadoSimple)
     LHastaFecha: TLFLabel;
     DTPFechaDesde: TLFDateEdit;
     PNLTesoreria: TLFPanel;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     ETituloClienteDesde: TLFEdit;
     LDesdeFecha: TLFLabel;
     LFClienteDesde: TLFEditFind2000;
     DTPFechaHasta: TLFDateEdit;
     ETituloClienteHasta: TLFEdit;
     LFClienteHasta: TLFEditFind2000;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimir(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure LFClienteDesdeChange(Sender: TObject);
     procedure LFClienteHastaChange(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMLstRecibos : TZFMLstRecibos;

implementation

{$R *.DFM}

uses UDMMain, UFormGest, UEntorno, UFMListConfig, ZUDMLstRecibos, UUtiles, UDameDato;

procedure TZFMLstRecibos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstRecibos, ZDMLstRecibos);
  ARecargarExecute(Self);
end;

procedure TZFMLstRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLstRecibos);
end;

procedure TZFMLstRecibos.AImprimir(Sender: TObject);
begin
  ZDMLstRecibos.MostrarListadoLimites(1, DTPFechaDesde.Date, DTPFechaHasta.Date,
     LFClienteDesde.Text, LFClienteHasta.Text);
end;

procedure TZFMLstRecibos.ARecargarExecute(Sender: TObject);
begin
  DTPFechaDesde.Date := REntorno.FechaTrab;
  DTPFechaHasta.Date := REntorno.FechaTrab;
end;

procedure TZFMLstRecibos.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(9007, Formato, Cabecera, Copias,
     Pijama, '', ZDMLstRecibos.frRecibosIngresos);
end;

procedure TZFMLstRecibos.LFClienteDesdeChange(Sender: TObject);
begin
  inherited;
  ETituloClienteDesde.Text := DameTituloCliente(StrToIntDef(LFClienteDesde.Text, 0));
end;

procedure TZFMLstRecibos.LFClienteHastaChange(Sender: TObject);
begin
  inherited;
  ETituloClienteHasta.Text := DameTituloCliente(StrToIntDef(LFClienteHasta.Text, 0));
end;

procedure TZFMLstRecibos.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TZFMLstRecibos.APrevExecute(Sender: TObject);
begin
  ZDMLstRecibos.MostrarListadoLimites(0, DTPFechaDesde.Date, DTPFechaHasta.Date,
     LFClienteDesde.Text, LFClienteHasta.Text);
end;

procedure TZFMLstRecibos.FormShow(Sender: TObject);
var
  Min, Max : integer;
begin
  inherited;
  DameMinMax('CLI', Min, Max);
  LFClienteDesde.Text := IntToStr(Min);
  LFClienteHasta.Text := IntToStr(Max);
end;

end.
