unit UFPregTransportistaCarga;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  ULFCheckBox, ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, ULFEdit, UFPEditListadoSimple;

type
  TFPregTransportistaCarga = class(TFPEditListadoSimple)
     PNLAgrupacion: TLFPanel;
     TButtConfRapida: TToolButton;
     GBClientes: TGroupBox;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EFCliHasta: TLFEditFind2000;
     EFCliDesde: TLFEditFind2000;
     ECliHasta: TLFEdit;
     ECliDesde: TLFEdit;
     GBAcreedores: TGroupBox;
     LDesdeTransportista: TLFLabel;
     LHastaTransportista: TLFLabel;
     EFAcrDesde: TLFEditFind2000;
     EFAcrHasta: TLFEditFind2000;
     ETransDesde: TLFEdit;
     ETransHasta: TLFEdit;
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     LCanal: TLFLabel;
     LSerie: TLFLabel;
     CBCanal: TLFComboBox;
     CBSerie: TLFComboBox;
     CBFacturados: TLFCheckBox;
     CBResumido: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFAcrDesdeChange(Sender: TObject);
     procedure EFAcrHastaChange(Sender: TObject);
     procedure EFCliHastaChange(Sender: TObject);
     procedure EFCliDesdeChange(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MostrarListado(Modo: byte);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregTransportistaCarga : TFPregTransportistaCarga;

implementation

uses UDMMain, UFormGest, UDMLstAcreedor, UEntorno, UFMListConfig, UUtiles, DateUtils, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFPregTransportistaCarga.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLSTAcreedor, DMLSTAcreedor);

  RellenaCanales(CBCanal.Items);
  RellenaSeries(CBSerie.Items);

  ARecargar.Execute;

  Grupo := 0;
  Listado := DMLSTAcreedor.frAcreedor;
  ListadoFR3 := DMLSTAcreedor.frxAcreedor;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregTransportistaCarga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMLSTAcreedor);
end;

procedure TFPregTransportistaCarga.MostrarListado(Modo: byte);
var
  Serie : string;
  Canal : integer;
begin
  if (CBserie.ItemIndex = 0) then
     Serie := ' '
  else
     Serie := Trim(Copy(CBSerie.Text, 1, Pos(' ', CbSerie.Text) - 1));

  Canal := integer(CBCanal.Items.Objects[CBCanal.ItemIndex]);

  DTPDesde.Date := RecodeTime(DTPDesde.Date, 00, 00, 00, 00);
  DTPHasta.Date := RecodeTime(DTPHasta.Date, 23, 59, 59, 999);

  DMLstAcreedor.MostrarCarga(0, Canal, Serie, DTPDesde.Date, DTPHasta.Date, StrToIntDef(EFCliDesde.Text, 0), StrToIntDef(EFCliHasta.Text, 0), StrToIntDef(EFAcrDesde.Text, 0), StrToIntDef(EFAcrHasta.Text, 0), CBFacturados.Checked, CBResumido.Checked);
end;

procedure TFPregTransportistaCarga.ARecargarExecute(Sender: TObject);
var
  MinCli, MaxCli, MinTransp, MaxTransp : integer;
  FechaD, FechaH : TDateTime;
begin
  DMLstAcreedor.RecargaTransportistaCarga(MinCli, MaxCli, MinTransp, MaxTransp, FechaD, FechaH);

  EFCliDesde.Text := IntToStr(MinCli);
  EFCliHasta.Text := IntToStr(MaxCli);
  EFacrDesde.Text := IntToStr(MinTransp);
  EFacrHasta.Text := IntToStr(MaxTransp);
  DTPDesde.Date := FechaD;
  DTPHasta.Date := FechaH;

  CBCanal.ItemIndex := 0;
  CBSerie.ItemIndex := 0;
  CBResumido.Checked := False;
  CBFacturados.Checked := False;
end;

procedure TFPregTransportistaCarga.FormShow(Sender: TObject);
begin
  EFAcrDesde.SetFocus;
end;

procedure TFPregTransportistaCarga.EFAcrDesdeChange(Sender: TObject);
begin
  ETransDesde.Text := DameTituloAcreedor(StrToIntDef(EFAcrDesde.Text, 0));
end;

procedure TFPregTransportistaCarga.EFAcrHastaChange(Sender: TObject);
begin
  ETransHasta.Text := DameTituloAcreedor(StrToIntDef(EFAcrHasta.Text, 0));
end;

procedure TFPregTransportistaCarga.EFCliDesdeChange(Sender: TObject);
begin
  ECliDesde.Text := DameTituloCliente(StrToIntDef(EFCliDesde.Text, 0));
end;

procedure TFPregTransportistaCarga.EFCliHastaChange(Sender: TObject);
begin
  ECliHasta.Text := DameTituloCliente(StrToIntDef(EFCliHasta.Text, 0));
end;

procedure TFPregTransportistaCarga.AConfigurarExecute(Sender: TObject);
begin
  if (CBResumido.Checked) then
     Grupo := 147
  else
     Grupo := 119;

  inherited;
end;

procedure TFPregTransportistaCarga.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  MostrarListado(Modo);
end;

end.
