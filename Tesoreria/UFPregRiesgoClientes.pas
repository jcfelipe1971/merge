unit UFPregRiesgoClientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, UHYDescription,
  StdCtrls, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxToolEdit, ULFEdit, ULFDBEdit, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, ULFDateEdit, rxPlacemnt, ULFFormStorage,
  ExtCtrls, ULFPanel, UFPEditListadoSimple;

type
  TFPregRiesgoClientes = class(TFPEditListadoSimple)
     GBClientes: TGroupBox;
     GBFechas: TGroupBox;
     LBLClienteD: TLFLabel;
     LBLClienteH: TLFLabel;
     LBLFechaD: TLFLabel;
     LBLFechaH: TLFLabel;
     ToolButton1: TToolButton;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     GBDatos: TGroupBox;
     Comentario: TLFLabel;
     EComentario: TLFEdit;
     LBLFechaListado: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     Moneda: TLFLabel;
     DBLCBMoneda: TDBLookupComboBox;
     EFClienteD: TLFEditFind2000;
     EFClienteH: TLFEditFind2000;
     DBEClienteH: TLFEdit;
     DBEClienteD: TLFEdit;
     GBAgentes: TGroupBox;
     EFAgenteDesde: TLFEditFind2000;
     EFAgenteHasta: TLFEditFind2000;
     LHastaAgente: TLFLabel;
     LDesdeAgente: TLFLabel;
     EAgenteDesde: TLFEdit;
     EAgenteHasta: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFAgenteDesdeChange(Sender: TObject);
     procedure EFAgenteHastaChange(Sender: TObject);
  private
     { Private declarations }
     procedure MostrarListado(Modo: byte);
  public
     { Public declarations }
  end;

var
  FPregRiesgoClientes : TFPregRiesgoClientes;

implementation

uses UDMMain, UUtiles, UFMListConfig, UFormGest, UDMLstRiesgoClientes,
  UEntorno, UDameDato;

{$R *.dfm}

procedure TFPregRiesgoClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMLstRiesgoClientes);
  Action := caFree;
end;

procedure TFPregRiesgoClientes.FormCreate(Sender: TObject);
begin
  AbreData(TDMLstRiesgoClientes, DMLstRiesgoClientes);

  Grupo := 203;
  Listado := DMLstRiesgoClientes.frRiesgoClientes;
  ListadoFR3 := DMLstRiesgoClientes.frxRiesgoClientes;

  ARecargarExecute(Sender);
end;

procedure TFPregRiesgoClientes.ARecargarExecute(Sender: TObject);
begin
  DMLstRiesgoClientes.Rangos;
  EFClienteD.Text := '-1';
  EFClienteH.Text := IntToStr(DMLstRiesgoClientes.DameClienteH);
  EFAgenteDesde.Text := '1';
  EFAgenteHasta.Text := IntToStr(DMLstRiesgoClientes.DameAgenteH);
  DTPFechaD.Date := DMLstRiesgoClientes.Fecha_Desde; // REntorno.FechaTrabSH;
  DTPFechaH.Date := DMLstRiesgoClientes.Fecha_Hasta; // REntorno.FechaTrabSH + 10;
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
  DBLCBMoneda.KeyValue := REntorno.Moneda;
end;

procedure TFPregRiesgoClientes.APrevExecute(Sender: TObject);
begin
  MostrarListado(0);
end;

procedure TFPregRiesgoClientes.AImprimirExecute(Sender: TObject);
begin
  MostrarListado(1);
end;

procedure TFPregRiesgoClientes.MostrarListado(Modo: byte);
begin
  DMLstRiesgoClientes.MostrarListadoFiltrado(Modo, StrToInt(EFClienteD.Text),
     StrToInt(EFClienteH.Text), StrToInt(EFAgenteDesde.Text), StrToInt(EFAgenteHasta.Text),
     DTPFechaD.Date, DTPFechaH.Date, DTPFechaListado.Date, EComentario.Text);
end;

procedure TFPregRiesgoClientes.EFClienteDChange(Sender: TObject);
begin
  DBEClienteD.Text := DameTituloCliente(StrToInt(EFClienteD.Text));
end;

procedure TFPregRiesgoClientes.EFClienteHChange(Sender: TObject);
begin
  DBEClienteH.Text := DameTituloCliente(StrToInt(EFClienteH.Text));
end;

procedure TFPregRiesgoClientes.EFAgenteDesdeChange(Sender: TObject);
begin
  inherited;
  EAgenteDesde.Text := DameTituloAgente(StrToInt(EFAgenteDesde.Text));
end;

procedure TFPregRiesgoClientes.EFAgenteHastaChange(Sender: TObject);
begin
  inherited;
  EAgenteHasta.Text := DameTituloAgente(StrToInt(EFAgenteHasta.Text));
end;

end.
