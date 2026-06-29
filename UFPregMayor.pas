unit UFPregMayor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, ExtCtrls, ActnList, ComCtrls, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, ULFLabel, ULFDateEdit, TFlatCheckBoxUnit,
  ULFCheckBox, rxPlacemnt, ULFFormStorage, ULFEdit, UFPEditListadoSimple;

type
  TFPregMayor = class(TFPEditListadoSimple)
     PNLLstMayor: TLFPanel;
     LDesdeCuenta: TLFLabel;
     LHastaCuenta: TLFLabel;
     EFCuentaDesde: TLFEditFind2000;
     EFCuentaHasta: TLFEditFind2000;
     ETituloCDesde: TLFEdit;
     ETituloCHasta: TLFEdit;
     CBCanales: TLFComboBox;
     LBLDesde: TLFLabel;
     DTPDesde: TLFDateEdit;
     LBLHasta: TLFLabel;
     DTPHasta: TLFDateEdit;
     LAlcance: TLFLabel;
     LMoneda: TLFLabel;
     EFMoneda: TLFEditFind2000;
     ETituloMoneda: TLFEdit;
     TButtConfRapida: TToolButton;
     CBSaldoCero: TLFCheckBox;
     PNLCentroCoste: TLFPanel;
     LCentroCoste: TLFLabel;
     EFDigito1: TLFEditFind2000;
     EFDigito2: TLFEditFind2000;
     EFDigito3: TLFEditFind2000;
     EFDigito4: TLFEditFind2000;
     EFDigito5: TLFEditFind2000;
     CBNivel: TLFComboBox;
     LNivel: TLFLabel;
     TBExportar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFCuentaDesdeChange(Sender: TObject);
     procedure EFCuentaHastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBCanalesChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFCuentaDesdeExit(Sender: TObject);
     procedure EFCuentaDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFCuentaHastaExit(Sender: TObject);
     procedure EFCuentaHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure CBSaldoCeroClick(Sender: TObject);
  private
     { Private declarations }
     Canal, Alcance: integer;
     procedure EnablePointCount;
     procedure DisablePointCount;
  public
     { Public declarations }
     procedure Mostrar(Cuenta: string; FechaDesde, FechaHasta: TDate; D1, D2, D3, D4, D5: string);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  end;

var
  FPregMayor : TFPregMayor;

implementation

{$R *.DFM}

uses UDMMain, UFormGest, UEntorno, UDMRMayor, UDMMayor, UUtiles, UFMain,
  UFMListConfig, UDameDato, URellenaLista;

procedure TFPregMayor.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRMayor, DMRMayor);

  Grupo := 4;
  Listado := DMRMayor.frMayor;
  ListadoFR3 := DMRMayor.frxMayor;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  EnablePointCount;  // Habilitar el punto

  // Agregamos combo con los niveles
  CBNivel.Items := TSLNiveles;
  // Borro item "Todos"
  CBNivel.Items.Delete(0);

  // Me posiciono en el ultimo nivel
  CBNivel.ItemIndex := CBNivel.Items.Count - 1;

  // En Chile se pide a nivel 4
  if (REntorno.Pais = 'CHL') then
     CBNivel.ItemIndex := CBNivel.Items.Count - 2;
end;

procedure TFPregMayor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DisablePointCount;
  CierraData(DMRMayor);
end;

procedure TFPregMayor.Mostrar(Cuenta: string; FechaDesde, FechaHasta: TDate; D1, D2, D3, D4, D5: string);
begin
  Cuenta := Trim(Cuenta);
  if (Cuenta = '') then
     ARecargarExecute(Self)
  else
  begin
     EFCuentaDesde.Text := Cuenta;
     EFCuentaHasta.Text := Cuenta;
  end;

  DTPDesde.Date := FechaDesde;
  DTPHasta.Date := FechaHasta;
  EFMoneda.Text := REntorno.Moneda;

  // Centro de Coste
  EFDigito1.Text := D1;
  EFDigito2.Text := D2;
  EFDigito3.Text := D3;
  EFDigito4.Text := D4;
  EFDigito5.Text := D5;

  //Rellenar el ComboBox de Canales
  RellenaCanales(CBCanales.Items);
  CBCanales.ItemIndex := REntorno.Canal;
  Canal := REntorno.Canal;
  Alcance := 1;

  ShowModal;  // Mostrar el formulario
end;

procedure TFPregMayor.EFCuentaDesdeChange(Sender: TObject);
begin
  ETituloCDesde.Text := DameTituloCuenta(EFCuentaDesde.Text);
end;

procedure TFPregMayor.EFCuentaHastaChange(Sender: TObject);
begin
  ETituloCHasta.Text := DameTituloCuenta(EFCuentaHasta.Text);
end;

procedure TFPregMayor.ARecargarExecute(Sender: TObject);
var
  auxDesde, auxHasta : string;
begin
  DMRMayor.Recargar(auxDesde, auxHasta);
  EFCuentaDesde.Text := auxDesde;
  EFCuentaHasta.Text := auxHasta;
end;

procedure TFPregMayor.CBCanalesChange(Sender: TObject);
begin
  if (CBCanales.ItemIndex = 0) then
  begin
     Alcance := 0;
     Canal := REntorno.Canal;
  end
  else
  begin
     Alcance := 1;
     Canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);
  end;
end;

procedure TFPregMayor.EFMonedaChange(Sender: TObject);
begin
  ETituloMoneda.Text := DameTituloMoneda(EFMoneda.Text);
end;

procedure TFPregMayor.EFCuentaDesdeExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFCuentaDesde);
end;

procedure TFPregMayor.EFCuentaDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCuentaDesde);
end;

procedure TFPregMayor.EFCuentaHastaExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFCuentaHasta);
end;

procedure TFPregMayor.EFCuentaHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCuentaHasta);
end;

procedure TFPregMayor.EnablePointCount;
begin
  // Añadir a los campos de Cuentas el punto para poder expandir
  FMain.AddComponentePunto(EFCuentaDesde);
  FMain.AddComponentePunto(EFCuentaHasta);

  // Ajustar el tamaño de la cuenta por EEC
  EFCuentaDesde.MaxLength := REntorno.DigitosSub;
  EFCuentaHasta.MaxLength := REntorno.DigitosSub;
end;

procedure TFPregMayor.DisablePointCount;
begin
  // Liberar los campos de Cuentas
  FMain.DelComponentePunto(EFCuentaDesde);
  FMain.DelComponentePunto(EFCuentaHasta);
end;

procedure TFPregMayor.CBSaldoCeroClick(Sender: TObject);
begin
  inherited;
  if CBSaldoCero.Checked then
     DMRMayor.SaldoCero := 1
  else
     DMRMayor.SaldoCero := 0;
end;

procedure TFPregMayor.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  Archivo : string;
begin
  if (Modo = 2) then
  begin
     Archivo := Format(_('Mayor_%s.xls'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if not MySaveDialog(Archivo, 'XLS,ODS', '', 'FPregMayor') then
        Archivo := '';
  end;

  DMMayor.ListadoMayor(Canal, EFCuentaDesde.Text, EFCuentaHasta.Text, DTPDesde.Date, DTPHasta.Date, EFMoneda.Text, Alcance, Modo, EFDigito1.Text, EFDigito2.Text, EFDigito3.Text, EFDigito4.Text, EFDigito5.Text, CBNivel.ItemIndex + 1, Archivo, PBListado);
end;

end.
