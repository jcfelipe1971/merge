unit UFPregFechasClientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ComCtrls, ToolWin, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UControlEdit, UFormGest, rxToolEdit,
  ULFDBEdit, ULFToolBar, ULFEditFind2000, ULFLabel, ULFEdit, ULFDateEdit,
  ExtCtrls, ULFPanel, UFPEditListadoSimple, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList;

type
  TFPregFechasClientes = class(TFPEditListadoSimple)
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     GBTitulo: TGroupBox;
     EFCliDesde: TLFEditFind2000;
     EFCliHasta: TLFEditFind2000;
     ECliDesde: TLFEdit;
     ECliHasta: TLFEdit;
     TButtConfRapida: TToolButton;
     LDesdeRemesa: TLFLabel;
     LHastaRemesa: TLFLabel;
     LDesdeFormaPago: TLFLabel;
     LHastaFormaPago: TLFLabel;
     EDesdeRemesa: TLFEdit;
     EHastaRemesa: TLFEdit;
     EDesdeFPago: TLFEdit;
     EHastaFPago: TLFEdit;
     procedure EFCliDesdeChange(Sender: TObject);
     procedure EFCliHastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     FDesde, FHasta: TDateTime;
     CDesde, CHasta: integer;
     procedure Cargar;
     procedure TomarDatos;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Mostrar(Remesa: integer);
  end;

var
  FPregFechasClientes : TFPregFechasClientes;

implementation

uses UDMMain, UUtiles, UDMRRemesasBanco, UDameDato;

{$R *.DFM}

procedure TFPregFechasClientes.FormCreate(Sender: TObject);
begin
  inherited;
  Grupo := 1;
  Listado := DMRRemesasBanco.frRemesas;
  ListadoFR3 := DMRRemesasBanco.frxRemesas;
  ListadoHYR := DMRRemesasBanco.HYRRemesas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregFechasClientes.Cargar;
var
  FechaDesde, FechaHasta : TDateTime;
  ClienteDesde, ClienteHasta : integer;
begin
  DMRRemesasBanco.CargaDatos(FechaDesde, FechaHasta, ClienteDesde, ClienteHasta);
  fDesde := FechaDesde;
  fHasta := FechaHasta;
  if (fDesde < EncodeDate(2000, 01, 01)) then
     fDesde := Now;
  if (fHasta < EncodeDate(2000, 01, 01)) then
     fHasta := Now;
  CDesde := ClienteDesde;
  CHasta := ClienteHasta;
  DTPDesde.Date := Fdesde;
  DTPHasta.Date := Fhasta;
  EFCliDesde.Text := IntToStr(CDesde);
  EFCliHasta.Text := IntToStr(CHasta);
end;

procedure TFPregFechasClientes.Mostrar(Remesa: integer);
begin
  if (Remesa <> 0) then
  begin
     EDesdeRemesa.Text := IntToStr(Remesa);
     EHastaRemesa.Text := IntToStr(Remesa);
  end;

  Cargar;
  ShowModal;
end;

procedure TFPregFechasClientes.EFCliDesdeChange(Sender: TObject);
begin
  ECliDesde.Text := DameTituloCliente(StrToIntDef(EFCliDesde.Text, 0));
end;

procedure TFPregFechasClientes.EFCliHastaChange(Sender: TObject);
begin
  ECliHasta.Text := DameTituloCliente(StrToIntDef(EFCliHasta.Text, 0));
end;

procedure TFPregFechasClientes.TomarDatos;
begin
  fDesde := DTPDesde.Date;
  fHasta := DTPHasta.Date;
  CDesde := StrToIntDef(EFCliDesde.Text, 0);
  CHasta := StrToIntDef(EFCliHasta.Text, 0);
end;

procedure TFPregFechasClientes.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Cargar;
end;

procedure TFPregFechasClientes.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  TomarDatos;

  // DMRRemesasBanco.Imprimir(FDesde, FHasta, CDesde, CHasta, rem); dji lrk kri
  DMRRemesasBanco.MostrarListadoRecibos(Modo, FDesde, FHasta, CDesde, CHasta, StrToIntDef(EDesdeRemesa.Text, 0), StrToIntDef(EHastaRemesa.Text, 0), EDesdeFPago.Text, EHastaFPago.Text);
end;

end.
