unit UFMPromoIndirectas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, ULFEditFind2000, Mask, rxToolEdit,
  ULFDateEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFLabel,
  ExtCtrls, ULFPanel, UFormGest, ULFComboBox, DBCtrls, ULFDBEdit,
  UEditPanel, ComCtrls, ToolWin, ULFToolBar, Menus, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, UTeclas,
  UControlEdit, ULFEdit;

type
  TFMPromoIndirectas = class(TFPEditSinNavegador)
     TSep2: TToolButton;
     TButtFacturar: TToolButton;
     TBFiltroClientes: TLFToolBar;
     PNLClientes: TLFPanel;
     EFClienteDesde: TLFEditFind2000;
     ETituloClienteDesde: TLFEdit;
     EFClienteHasta: TLFEditFind2000;
     ETituloClienteHasta: TLFEdit;
     TBFiltroFecha: TLFToolBar;
     PNLFechas: TLFPanel;
     DBGFPromoIndire: TDBGridFind2000;
     DTPDesdeFecha: TLFDateEdit;
     DTPHastaFecha: TLFDateEdit;
     TBttGenera: TToolButton;
     TButtListar: TToolButton;
     LBLFechas: TLFLabel;
     LBLFDesde: TLFLabel;
     LBLFHasta: TLFLabel;
     LBLClientes: TLFLabel;
     LBLCDesde: TLFLabel;
     LBLCHasta: TLFLabel;
     ToolButton3: TToolButton;
     PNLDocumentos: TLFPanel;
     LBLDocumentos: TLFLabel;
     CBDocumentos: TLFComboBox;
     TButtTodas: TToolButton;
     TButtDesmarcar: TToolButton;
     TSep1: TToolButton;
     PMListar: TPopupMenu;
     MIConfigurarListado: TMenuItem;
     procedure FormCreate(Sender: TObject);
     procedure EFClienteDesdeChange(Sender: TObject);
     procedure EFClienteHastaChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBttGeneraClick(Sender: TObject);
     procedure TButtTodasClick(Sender: TObject);
     procedure TButtDesmarcarClick(Sender: TObject);
     procedure TButtFacturarClick(Sender: TObject);
     procedure TButtListarClick(Sender: TObject);
     procedure MIConfigurarListadoClick(Sender: TObject);
  private
     { Private declarations }
     function DevuelveTipo: string;
  public
     { Public declarations }
  end;

var
  FMPromoIndirectas : TFMPromoIndirectas;

implementation

uses UDMMain, UDMPromoIndirectas, UEntorno, UDMLstPromoIndirectas,
  UFMListConfig, UDameDato;

{$R *.dfm}

procedure TFMPromoIndirectas.FormCreate(Sender: TObject);
var
  FechaD, FechaH : TDateTime;
  ClienteD, ClienteH : integer;
begin
  inherited;

  AbreData(TDMPromoIndirectas, DMPromoIndirectas);

  CBDocumentos.ItemIndex := 0;
  DMPromoIndirectas.DevuelveParametrosIniciales(FechaD, FechaH, ClienteD, ClienteH);
  DTPDesdeFecha.Date := FechaD;
  DTPHastaFecha.Date := FechaH;
  EFClienteDesde.Text := IntToStr(ClienteD);
  EFClienteHasta.Text := IntToStr(ClienteH);
end;

procedure TFMPromoIndirectas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMPromoIndirectas);
end;

procedure TFMPromoIndirectas.EFClienteDesdeChange(Sender: TObject);
begin
  ETituloClienteDesde.Text := DameTituloCliente(StrToIntDef(EFClienteDesde.Text, 0));
end;

procedure TFMPromoIndirectas.EFClienteHastaChange(Sender: TObject);
begin
  ETituloClienteHasta.Text := DameTituloCliente(StrToIntDef(EFClienteHasta.Text, 0));
end;

function TFMPromoIndirectas.DevuelveTipo: string;
begin
  case CBDocumentos.ItemIndex of
     0: Result := '';
     1: Result := 'ALB';
     2: Result := 'FAC';
  end;
end;

procedure TFMPromoIndirectas.TBttGeneraClick(Sender: TObject);
begin
  DMPromoIndirectas.Rellena(DevuelveTipo,
     DTPDesdeFecha.Date,
     DTPHastaFecha.Date,
     StrToIntDef(EFClienteDesde.Text, 0),
     StrToIntDef(EFClienteHasta.Text, 0));
end;

procedure TFMPromoIndirectas.TButtTodasClick(Sender: TObject);
begin
  DMPromoIndirectas.Marcar(1);
end;

procedure TFMPromoIndirectas.TButtDesmarcarClick(Sender: TObject);
begin
  DMPromoIndirectas.Marcar(0);
end;

procedure TFMPromoIndirectas.TButtFacturarClick(Sender: TObject);
begin
  DMPromoIndirectas.GenerarFacturas;
end;

procedure TFMPromoIndirectas.TButtListarClick(Sender: TObject);
begin
  AbreData(TDMLstPromoIndirectas, DMLstPromoIndirectas);
  DMLstPromoIndirectas.MostrarListado(ETituloclienteDesde.Text, ETituloClienteHasta.Text,
     DTPDesdeFecha.Date, DTPHastaFecha.Date, 0);
  CierraData(DMLstPromoIndirectas);
end;

procedure TFMPromoIndirectas.MIConfigurarListadoClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama{, Grupo} : integer;
begin
  AbreData(TDMLstPromoIndirectas, DMLstPromoIndirectas);
  TFMListConfig.Create(Self).Muestra(170, Formato, Cabecera, Copias, Pijama, '', DMLstPromoIndirectas.frPromocionesIndirectas);
  CierraData(DMLstPromoIndirectas);
end;

end.
