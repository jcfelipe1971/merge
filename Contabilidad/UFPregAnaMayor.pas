unit UFPregAnaMayor;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, ExtCtrls, ActnList, ComCtrls, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregAnaMayor = class(TFPEditListadoSimple)
     PNLLstMayor: TLFPanel;
     Label1: TLFLabel;
     Label2: TLFLabel;
     EFCentroCosteDesde: TLFEditFind2000;
     EFCentroCosteHasta: TLFEditFind2000;
     DBETituloCDesde: TLFDbedit;
     DBETituloCHasta: TLFDbedit;
     CBCanales: TLFComboBox;
     LBLDesde: TLFLabel;
     DTPDesde: TLFDateEdit;
     LBLHasta: TLFLabel;
     DTPHasta: TLFDateEdit;
     Label3: TLFLabel;
     Label4: TLFLabel;
     EFMoneda: TLFEditFind2000;
     DBETitMoneda: TLFDbedit;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     LFLabel1: TLFLabel;
     EFPlanContable: TLFEditFind2000;
     DEBTituloPlanContable: TLFDbedit;
     CHKOrdenarCC: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure EFCentroCosteDesdeChange(Sender: TObject);
     procedure EFCentroCosteHastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure CBCanalesChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFCentroCosteDesdeExit(Sender: TObject);
     procedure EFCentroCosteDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFCentroCosteHastaExit(Sender: TObject);
     procedure EFCentroCosteHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure EFPlanContableChange(Sender: TObject);
     procedure EFCentroCosteDesdeBusqueda(Sender: TObject);
     procedure EFCentroCosteHastaBusqueda(Sender: TObject);
  private
     { Private declarations }

     Canal, Alcance: integer;

     procedure EnablePointCount;
     procedure DisablePointCount;
     //procedure ExpandeCentroCosteEF(EFind: TEditFind2000);
  public
     { Public declarations }

     procedure Mostrar(PlanContable, CentroCoste: string; FechaDesde, FechaHasta: TDate);
  end;

var
  FPregAnaMayor : TFPregAnaMayor;

implementation

{$R *.DFM}

uses UDMMain, UFormGest, UEntorno, UDMRAnaMayor, UDMAnaMayor, UUtiles, UFMain,
  UFMListConfig, URellenaLista;

procedure TFPregAnaMayor.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRAnaMayor, DMRAnaMayor);
  AbreData(TDMAnaMayor, DMAnaMayor);
end;

procedure TFPregAnaMayor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DisablePointCount;
  CierraData(DMRAnaMayor);
  CierraData(DMAnaMayor);
end;

procedure TFPregAnaMayor.Mostrar(PlanContable, CentroCoste: string; FechaDesde, FechaHasta: TDate);
begin
  DTPDesde.Date := FechaDesde;
  DTPHasta.Date := FechaHasta;
  EFMoneda.Text := REntorno.Moneda;
  EnablePointCount;  // Habilitar el punto

  //Rellenar el ComboBox de Canales
  //CBCanales.Items := DMAnaMayor.RellenaCanales;
  RellenaCanales(CBCanales.Items); {dji lrk kri - Memory Leak}
  CBCanales.ItemIndex := REntorno.Canal;
  Canal := REntorno.Canal;
  Alcance := 1;

  EFPlanContable.Text := PlanContable;

  CentroCoste := Trim(CentroCoste);
  if (CentroCoste = '') then
     ARecargarExecute(Self)
  else
  begin
     EFCentroCosteDesde.Text := CentroCoste;
     EFCentroCosteHasta.Text := CentroCoste;
  end;

  ShowModal;  // Mostrar el formulario
end;

procedure TFPregAnaMayor.AImprimirExecute(Sender: TObject);
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  if CHKOrdenarCC.Checked then
     DMAnaMayor.ListadoMayorOrdCC(Canal, EFCentroCosteDesde.Text, EFCentroCosteHasta.Text,
        DTPDesde.Date, DTPHasta.Date, EFMoneda.Text, Alcance, 1, EFPlanContable.Text)
  else
     DMAnaMayor.ListadoMayor(Canal, EFCentroCosteDesde.Text, EFCentroCosteHasta.Text,
        DTPDesde.Date, DTPHasta.Date, EFMoneda.Text, Alcance, 1, EFPlanContable.Text);
end;

procedure TFPregAnaMayor.APrevExecute(Sender: TObject);
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  if CHKOrdenarCC.Checked then
     DMAnaMayor.ListadoMayorOrdCC(Canal, EFCentroCosteDesde.Text, EFCentroCosteHasta.Text,
        DTPDesde.Date, DTPHasta.Date, EFMoneda.Text, Alcance, 0, EFPlanContable.Text)
  else
     DMAnaMayor.ListadoMayor(Canal, EFCentroCosteDesde.Text, EFCentroCosteHasta.Text,
        DTPDesde.Date, DTPHasta.Date, EFMoneda.Text, Alcance, 0, EFPlanContable.Text);
end;

procedure TFPregAnaMayor.EFCentroCosteDesdeChange(Sender: TObject);
begin
  DMRAnaMayor.ActualizaCCDesde(EFCentroCosteDesde.Text);
end;

procedure TFPregAnaMayor.EFCentroCosteHastaChange(Sender: TObject);
begin
  DMRAnaMayor.ActualizaCCHasta(EFCentroCosteHasta.Text);
end;

procedure TFPregAnaMayor.ARecargarExecute(Sender: TObject);
var
  auxDesde, auxHasta : string;
begin
  DMRAnaMayor.Recargar(auxDesde, auxHasta);
  EFCentroCosteDesde.Text := auxDesde;
  EFCentroCosteHasta.Text := auxHasta;
end;

procedure TFPregAnaMayor.CBCanalesChange(Sender: TObject);
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

procedure TFPregAnaMayor.EFMonedaChange(Sender: TObject);
begin
  DMRAnaMayor.CambiaTituloMoneda(EFMoneda.Text);
end;

procedure TFPregAnaMayor.EFCentroCosteDesdeExit(Sender: TObject);
begin
  //  ExpandeCentroCosteEF(EFCentroCosteDesde);
end;

procedure TFPregAnaMayor.EFCentroCosteDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  //  if (Key = VK_RETURN) then
  //    ExpandeCentroCosteEF(EFCentroCosteDesde);
end;

procedure TFPregAnaMayor.EFCentroCosteHastaExit(Sender: TObject);
begin
  //  ExpandirCadenaEdit(EFCentroCosteHasta);
end;

procedure TFPregAnaMayor.EFCentroCosteHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  //  if (Key = VK_RETURN) then
  //    ExpandeCentroCosteEF(EFCentroCosteHasta);
end;

procedure TFPregAnaMayor.EnablePointCount;
begin
  // Añadir a los campos de los Centros de Coste el punto para poder expandir
  //  FMain.AddComponentePunto(EFCentroCosteDesde);
  //  FMain.AddComponentePunto(EFCentroCosteHasta);

  // Ajustar el tamaño del centro de coste
  //  EFCentroCosteDesde.MaxLength := LargoCentroCoste;
  //  EFCentroCosteHasta.MaxLength := LargoCentroCoste;
end;

{ Liberar los campos de Cuentas }
procedure TFPregAnaMayor.DisablePointCount;
begin
  //  FMain.DelComponentePunto(EFCentroCosteDesde);
  //  FMain.DelComponentePunto(EFCentroCosteHasta);
end;

procedure TFPregAnaMayor.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama, Grupo : integer;
begin
  if CHKOrdenarCC.Checked then
     Grupo := 601
  else
     Grupo := 600;

  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '',
     DMRAnaMayor.frAnaMayor);
end;

procedure TFPregAnaMayor.EFPlanContableChange(Sender: TObject);
begin
  DMRAnaMayor.ActualizaPlanContable(Canal, EFPlanContable.Text);
end;

procedure TFPregAnaMayor.EFCentroCosteDesdeBusqueda(Sender: TObject);
begin
  inherited;
  EFCentroCosteDesde.CondicionBusqueda :=
     'CANAL=' + IntToStr(Canal) + ' AND ' +
     'PLAN_CONTABLE=''' + EFPlanContable.Text + '''';
end;

procedure TFPregAnaMayor.EFCentroCosteHastaBusqueda(Sender: TObject);
begin
  inherited;
  EFCentroCosteHasta.CondicionBusqueda :=
     'CANAL=' + IntToStr(Canal) + ' AND ' +
     'PLAN_CONTABLE=''' + EFPlanContable.Text + '''';
end;

{procedure TFPregAnaMayor.ExpandeCentroCosteEF(EFind: TEditFind2000);
begin
  if (EFind.Text = '') then Exit;
  if Pos('.', EFind.Text) <> 0 then
    EFind.Text := Trim(ExpandirCadena(EFind.Text, LargoCentroCoste));
end;}

end.
