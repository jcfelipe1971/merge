unit UFPregCuotasCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFCheckBox, ULFDBEdit, ULFPanel, ULFToolBar,
  TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, ULFEdit, UFPEditListado,
  rxPlacemnt, ULFFormStorage, ULFPageControl, UFPEditListadoSimple,
  rxToolEdit, ULFDateEdit;

type
  TFPregCuotasCliente = class(TFPEditListadoSimple)
     PNLListArt: TLFPanel;
     TButtConfRapida: TToolButton;
     GBCli: TGroupBox;
     LHastaCliente: TLFLabel;
     LDesdeCliente: TLFLabel;
     EFDesdeCliente: TLFEditFind2000;
     EFHastaCliente: TLFEditFind2000;
     RGOpciones: TRadioGroup;
     EClienteD: TLFEdit;
     EClienteH: TLFEdit;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFDesdeClienteChange(Sender: TObject);
     procedure EFHastaClienteChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     Cliente: integer;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(aCliente: integer = 0);
  end;

var
  FPregCuotasCliente : TFPregCuotasCliente;

implementation

uses UDMLstCuotasCliente, UUtiles, UEntorno, UFMListConfig, UDMMain, UDameDato;

{$R *.DFM}

procedure TFPregCuotasCliente.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstCuotasCliente, DMLstCuotasCliente);
  Cliente := 0;

  Grupo := 191;
  Listado := DMLstCuotasCliente.frCuotas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregCuotasCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstCuotasCliente);
end;

procedure TFPregCuotasCliente.Muestra(aCliente: integer = 0);
begin
  Self.Cliente := aCliente;
  ARecargarExecute(Self);
  ShowModal;
end;

procedure TFPregCuotasCliente.EFDesdeClienteChange(Sender: TObject);
begin
  EClienteD.Text := DameTituloCliente(StrToIntDef(EFDesdeCliente.Text, 0));
end;

procedure TFPregCuotasCliente.EFHastaClienteChange(Sender: TObject);
begin
  EClienteH.Text := DameTituloCliente(StrToIntDef(EFHastaCliente.Text, 0));
end;

procedure TFPregCuotasCliente.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
  MinD, MaxD : TDateTime;
begin
  if (Cliente <> 0) then
  begin
     EFDesdeCliente.Text := IntToStr(Cliente);
     EFHastaCliente.Text := IntToStr(Cliente);
     Cliente := 0;
  end
  else
  begin
     DameMinMax('CLI', Min, Max);
     EFDesdeCliente.Text := IntToStr(Min);
     EFHastaCliente.Text := IntToStr(Max);
  end;

  DameMinMax('EJE', MinD, MaxD);
  DEDesdeFecha.Date := MinD;
  DEHastaFecha.Date := MaxD;

  RGOpciones.ItemIndex := 1;
end;

procedure TFPregCuotasCliente.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstCuotasCliente.MostrarListadoFiltrado(RGOpciones.ItemIndex, Modo, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), DEDesdeFecha.Date, DEHastaFecha.Date);
end;

end.
