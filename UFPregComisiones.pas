unit UFPregComisiones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ComCtrls, ExtCtrls, ActnList, ToolWin, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UControlEdit, UFormGest,
  rxToolEdit, ULFCheckBox, ULFToolBar, ULFDBEdit, ULFPanel, ULFPageControl,
  TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, ULFEdit, ULFDateEdit,
  UFPEditListado, rxPlacemnt, ULFFormStorage, ULFActionList,
  UFPEditListadoSimple;

type
  TFPregComisiones = class(TFPEditListadoSimple)
     PNLMain: TLFPanel;
     GBFechas: TGroupBox;
     LFechaDesde: TLFLabel;
     LFechaHasta: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     GBTitulo: TGroupBox;
     LAgenteDesde: TLFLabel;
     LAgenteHasta: TLFLabel;
     RGTipo: TRadioGroup;
     EFAgenteDesde: TLFEditFind2000;
     EFAgenteHasta: TLFEditFind2000;
     TButtConfiguracionRapida: TToolButton;
     ChkMostrarImporteCero: TLFCheckBox;
     RGOpciones: TRadioGroup;
     LMesDesde: TLFLabel;
     EmesDesde: TLFEdit;
     LAnyo: TLFLabel;
     EAnioDesde: TLFEdit;
     TBMulticanal: TToolButton;
     EDesdeAgente: TLFEdit;
     EHastaAgente: TLFEdit;
     AMulticanal: TAction;
     TBExportar: TToolButton;
     PBProgreso: TProgressBar;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgenteDesdeChange(Sender: TObject);
     procedure EFAgenteHastaChange(Sender: TObject);
     procedure RGTipoClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EmesDesdeChange(Sender: TObject);
     procedure EAnioDesdeChange(Sender: TObject);
     procedure DTPDesdeChange(Sender: TObject);
     procedure RGOpcionesClick(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AMulticanalExecute(Sender: TObject);
  private
     { Private declarations }
     Canal: integer;
     ListaCanales: TStringList;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregComisiones : TFPregComisiones;

implementation

uses UDMLstComisiones, UUtiles, UFMListConfig, UDMLstComisionesKri, UEntorno,
  UFMultiSeleccion, UDMMain, UDameDato;

{$R *.DFM}

procedure TFPregComisiones.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCanales := TStringList.Create;

  AbreData(TDMLstComisiones, DMLstComisiones);
  ARecargarExecute(Self);
  AbreData(TDMLstComisionesKri, DMLstComisionesKri);

  if (DMMain.EstadoKri(153) = 1) then  // TB que pida mes y año
  begin
     LMesDesde.Visible := True;
     LAnyo.Visible := True;
     EmesDesde.Visible := True;
     EanioDesde.Visible := True;
     LFechaDesde.Visible := False;
     LFechaHasta.Visible := False;
     DTPDesde.Visible := False;
     DTPHasta.Visible := False;
  end
  else
  begin
     LMesDesde.Visible := False;
     LAnyo.Visible := False;
     EmesDesde.Visible := False;
     EanioDesde.Visible := False;
     LFechaDesde.Visible := True;
     LFechaHasta.Visible := True;
     DTPDesde.Visible := True;
     DTPHasta.Visible := True;
  end;

  Grupo := 13;
  Listado := DMLstComisiones.frLstComisiones;
  ListadoFR3 := DMLstComisiones.frxLstComisiones;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
  PBProgreso.Visible := False;
end;

procedure TFPregComisiones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ListaCanales.Free;
  CierraData(DMLstComisiones);
  CierraData(DMLstComisionesKri);
end;

procedure TFPregComisiones.EFAgenteDesdeChange(Sender: TObject);
begin
  EDesdeAgente.Text := DameTituloAgente(StrToIntDef(EFAgenteDesde.Text, 0));
end;

procedure TFPregComisiones.EFAgenteHastaChange(Sender: TObject);
begin
  EHastaAgente.Text := DameTituloAgente(StrToIntDef(EFAgenteHasta.Text, 0));
end;

procedure TFPregComisiones.RGTipoClick(Sender: TObject);
begin
  if RGTipo.ItemIndex = 0 then
  begin
     RGOpciones.Enabled := False;
     ChkMostrarImporteCero.Enabled := False;
     Grupo := 13;
  end
  else
  begin
     RGOpciones.Enabled := True;
     ChkMostrarImporteCero.Enabled := True;
     if RGOpciones.ItemIndex <> 3 then
        Grupo := 15
     else
        Grupo := 5100;
  end;
end;

procedure TFPregComisiones.FormShow(Sender: TObject);
begin
  if (EMesDesde.Visible) then
     EMesDesde.SetFocus
  else
     DTPDesde.SetFocus;
end;

procedure TFPregComisiones.EmesDesdeChange(Sender: TObject);
begin
  try
     if ((StrToIntDef(EMesDesde.Text, 0) <> 0) and (StrToIntDef(EAnioDesde.Text, 0) <> 0)) then
     begin
        if StrToInt(EMesDesde.Text) > 12 then
           EMesDesde.Text := '1';
        if StrToInt(EMesDesde.Text) < 1 then
           EMesDesde.Text := '12';
        DTPDesde.Date := EncodeDate(StrToIntDef(EAnioDesde.Text, 0), StrToInt(EMesDesde.Text), 1);
        DTPDesdeChange(Sender);
     end;
  except
     EMesDesde.Text := '';
  end;
end;

procedure TFPregComisiones.EAnioDesdeChange(Sender: TObject);
var
  Year, Month, Day : word;
begin
  try
     if (StrToIntDef(EAnioDesde.Text, 0) <> 0) then
     begin
        DecodeDate(DTPDesde.Date, Year, Month, Day);
        DTPDesde.Date := EncodeDate(StrToInt(EAnioDesde.Text), Month, 1);
        DTPHasta.Date := DTPDesde.Date;
        DTPDesdeChange(Sender);
     end;
  except
     EAnioDesde.Text := IntToStr(REntorno.Ejercicio);
  end;
end;

procedure TFPregComisiones.DTPDesdeChange(Sender: TObject);
var
  Year, Month, Month_Hasta, Day : word;
begin
  DecodeDate(DTPDesde.Date, Year, Month, Day);
  Month_Hasta := 0;
  DTPHasta.Date := DTPHasta.Date + 32;
  while (Month <> Month_Hasta) do
  begin
     DTPHasta.Date := DTPHasta.Date - 1;
     DecodeDate(DTPHasta.Date, Year, Month_Hasta, Day);
  end;
  if (DTPHasta.Date - DTPDesde.Date < 0) then
  begin
     DTPHasta.Date := DTPDesde.Date;
     DTPDesdeChange(Sender);
  end;
  DTPHasta.Date := DTPHasta.Date + 0.999;
end;

procedure TFPregComisiones.RGOpcionesClick(Sender: TObject);
begin
  if RGTipo.ItemIndex = 0 then
     Grupo := 13
  else
  begin
     if RGOpciones.ItemIndex <> 3 then
        Grupo := 15
     else
        Grupo := 5100;
  end;

  if (RGOpciones.ItemIndex = 3) then
  begin
     LMesDesde.Visible := True;
     LAnyo.Visible := True;
     EmesDesde.Visible := True;
     EanioDesde.Visible := True;
     LFechaDesde.Visible := False;
     LFechaHasta.Visible := False;
     DTPDesde.Visible := False;
     DTPHasta.Visible := False;
  end
  else
  begin
     LMesDesde.Visible := False;
     LAnyo.Visible := False;
     EmesDesde.Visible := False;
     EanioDesde.Visible := False;
     LFechaDesde.Visible := True;
     LFechaHasta.Visible := True;
     DTPDesde.Visible := True;
     DTPHasta.Visible := True;
  end;
end;

procedure TFPregComisiones.ARecargarExecute(Sender: TObject);
var
  Desde, Hasta : integer;
  Year, Month, Day : word;
begin
  inherited;

  RGTipo.ItemIndex := 0;
  DTPDesde.Date := Date;
  DTPHasta.Date := Date;
  DameMinMax('AGC', Desde, Hasta);
  EFAgenteDesde.Text := IntToStr(Desde);
  EFAgenteHasta.Text := IntToStr(Hasta);
  RGOpciones.Enabled := False;
  DecodeDate(Now, Year, Month, Day);
  EMesDesde.Text := IntToStr(Month);
  EAnioDesde.Text := IntToStr(REntorno.Ejercicio);
  Canal := REntorno.Canal;
end;

procedure TFPregComisiones.AMulticanalExecute(Sender: TObject);
begin
  inherited;
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFPregComisiones.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  Desde, Hasta : integer;
begin
  Hasta := StrToInt(EFAgenteHasta.Text);
  Desde := StrToInt(EFAgenteDesde.Text);

  case RGTipo.ItemIndex of
     0: DMLstComisiones.ListadoAgentes(Modo, Desde, Hasta);
     1:
     begin
        if (RGOpciones.ItemIndex <> 3) then
           DMLstComisiones.ListadoComisiones(HourIntoDate(DTPDesde.Date, '00:00:00')
              , HourIntoDate(DTPHasta.Date, '23:59:59'), Desde, Hasta, Modo, ChkMostrarImporteCero.Checked, RGOpciones.ItemIndex, ListaCanales, PBProgreso)
        else
           DMLstComisionesKri.ListadoComisiones(
              HourIntoDate(DTPDesde.Date, '00:00:00'), HourIntoDate(DTPHasta.Date, '23:59:59'), Desde, Hasta, Modo, ChkMostrarImporteCero.Checked, Canal);
     end;
  end;
end;

end.
