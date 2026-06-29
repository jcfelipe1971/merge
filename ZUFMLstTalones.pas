unit ZUFMLstTalones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

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
  TZFMLstTalones = class(TFPEditListadoSimple)
     Fecha_del_listado: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     Vencimiento: TGroupBox;
     Desde: TLFLabel;
     Hasta: TLFLabel;
     DTPHasta: TLFDateEdit;
     DTPDesde: TLFDateEdit;
     PNLComentarios: TLFPanel;
     Comentario: TLFLabel;
     DBLCBMoneda: TDBLookupComboBox;
     Moneda: TLFLabel;
     EComentario: TLFEdit;
     PNLTesoreria: TLFPanel;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     LBLComP: TLFLabel;
     EComPagos: TLFEdit;
     LBLComC: TLFLabel;
     EComCobros: TLFEdit;
     CBTitCuen: TLFCheckBox;
     CBNumDoc: TLFCheckBox;
     DBETituloTercero: TLFDbedit;
     LFLabel1: TLFLabel;
     LFTercero: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure Imprimir(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure LFTerceroChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMLstTalones : TZFMLstTalones;

implementation

{$R *.DFM}

uses UDMMain, UFormGest, ZUDMLstTalones, UEntorno, UFMListConfig;

procedure TZFMLstTalones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstTalones, ZDMLstTalones);
  ARecargarExecute(Self);
end;

procedure TZFMLstTalones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLstTalones);
end;

procedure TZFMLstTalones.Imprimir(Sender: TObject);
begin
  ZDMLstTalones.CalculaInforme(EComPagos.Text, EComCobros.Text, CBNumDoc.Checked,
     CBTitCuen.Checked);
  ZDMLstTalones.MostrarListado(TAction(Sender).Tag);
end;

procedure TZFMLstTalones.ARecargarExecute(Sender: TObject);
begin
  DTPFechaListado.Date := REntorno.FechaTrab;
  ZDMLstTalones.Rangos;
  DTPDesde.Date := Fecha_Desde;
  DTPHasta.Date := Fecha_Hasta;
  DBLCBMoneda.KeyValue := REntorno.Moneda;
  EComentario.Text := '';
  EComPagos.Text := 'Pago S / f  ';
  EComCobros.Text := 'Cobro N / f  ';
  CBNumDoc.Checked := True;
  CBTitCuen.Checked := False;
end;

procedure TZFMLstTalones.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(3000, Formato, Cabecera, Copias,
     Pijama, '', ZDMLstTalones.frHYTesoreria);
end;

procedure TZFMLstTalones.LFTerceroChange(Sender: TObject);
begin
  inherited;
  ZDMLstTalones.xTerceros.Close;
  ZDMLstTalones.xTerceros.Open;
end;

end.
