unit UFPregLstAgentes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  ULFCheckBox, ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregLSTAgentes = class(TFPEditListadoSimple)
     PNLAgrupacion: TLFPanel;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     GroupBox2: TGroupBox;
     Label3: TLFLabel;
     Label4: TLFLabel;
     EFCliHasta: TLFEditFind2000;
     EFCliDesde: TLFEditFind2000;
     DBECliHasta: TLFDbedit;
     DBECliDesde: TLFDbedit;
     GBAcreedores: TGroupBox;
     Label5: TLFLabel;
     Label6: TLFLabel;
     EFAgeDesde: TLFEditFind2000;
     EFAgeHasta: TLFEditFind2000;
     DBEAgeDesde: TLFDbedit;
     DBEAgeHasta: TLFDbedit;
     GBFechas: TGroupBox;
     Label1: TLFLabel;
     Label2: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     Label7: TLFLabel;
     Label8: TLFLabel;
     CBCanal: TLFComboBox;
     CBSerie: TLFComboBox;
     CBFacturados: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFAgeDesdeChange(Sender: TObject);
     procedure EFAgeHastaChange(Sender: TObject);
     procedure EFCliHastaChange(Sender: TObject);
     procedure EFCliDesdeChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure tomardatos;
  end;

var
  FPregLSTAgentes : TFPregLSTAgentes;

implementation

uses UDMMain, UFormGest, UDMLSTAgente, UEntorno, UFMListConfig, UUtiles;

{$R *.DFM}

procedure TFPregLSTAgentes.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLSTAgente, DMLSTAgente);
  DMLSTAgente.cargarcombos(CBCanal, CBSerie);
  ARecargar.Execute;

  Grupo := 120;
  Listado := DMLSTAgente.frAgente;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregLSTAgentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMLSTAgente);
end;

procedure TFPregLSTAgentes.APrevExecute(Sender: TObject);
begin
  Tomardatos;
end;

procedure TFPregLSTAgentes.AImprimirExecute(Sender: TObject);
begin
  Tomardatos;
end;

procedure TFPregLSTAgentes.ARecargarExecute(Sender: TObject);
begin
  DMLSTAgente.recargaAgenteCarga;
  EFAgeDesde.Text := IntToStr(DMLSTAgente.AgenteD);
  EFAgehasta.Text := IntToStr(DMLSTAgente.AgenteH);
  EFCliDesde.Text := IntToStr(DMLSTAgente.clienteD);
  EFCliHasta.Text := IntToStr(DMLSTAgente.clienteH);
  DTPdesde.Date := DMLSTAgente.fechaD;
  DTPhasta.Date := DMLSTAgente.fechah;
  cbcanal.ItemIndex := 0;
  cbserie.ItemIndex := 0;
end;

procedure TFPregLSTAgentes.FormShow(Sender: TObject);
begin
  EFAgeDesde.SetFocus;
end;

procedure TFPregLSTAgentes.EFAgeDesdeChange(Sender: TObject);
begin
  DMLSTAgente.CambiaAgenteD(StrToIntDef(EFAgeDesde.Text, 0));
end;

procedure TFPregLSTAgentes.EFAgeHastaChange(Sender: TObject);
begin
  DMLSTAgente.CambiaAgenteH(StrToIntDef(EFAgeHasta.Text, 0));
end;

procedure TFPregLSTAgentes.EFCliDesdeChange(Sender: TObject);
begin
  DMLSTAgente.CambiaClienteD(StrToIntDef(EFCliDesde.Text, 0));
end;

procedure TFPregLSTAgentes.EFCliHastaChange(Sender: TObject);
begin
  DMLSTAgente.CambiaClienteH(StrToIntDef(EFCliHasta.Text, 0));
end;

procedure TFPregLSTAgentes.tomardatos;
var
  posicion : integer;
begin
  DTPDesde.Date := DTPDesde.Date + StrToTime('00:00:00');
  DTPHasta.Date := DTPHasta.Date + StrToTime('23:59:59');
  posicion := Pos('-', CbSerie.Text);
  if (CBserie.ItemIndex = 0) then
     DMLSTAgente.Serie := ' '
  else
     DMLSTAgente.serie := Trim(Copy(CBSerie.Text, 1, posicion - 1));
  posicion := Pos('-', CbCanal.Text);
  DMLSTAgente.Canal := StrToIntDef((Trim(Copy(CBCanal.Text, 1, posicion - 1))), 0);
  DMLSTAgente.FechaD := DTPDesde.Date;
  DMLSTAgente.FechaH := DTPHasta.Date;
  if (CBFacturados.State = cbchecked) then
     DMLSTAgente.Facturados := 1
  else
     DMLSTAgente.Facturados := 0;
end;

procedure TFPregLSTAgentes.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLSTAgente.MostrarCarga(Modo);
end;

end.
