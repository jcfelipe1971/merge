unit UFPregModelo347;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, ExtCtrls, ULFPanel,
  ULFComboBox, ULFLabel, rxPlacemnt, ULFFormStorage, UFPEditListadoSimple,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, UNavigator, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEdit, Mask, rxToolEdit, ULFDateEdit;

type
  TFPregModelo347 = class(TFPEditListadoSimple)
     PNLOrden: TLFPanel;
     LOrdenListado: TLFLabel;
     CBOrden: TLFComboBox;
     TButtConfigurar: TToolButton;
     AExportarMod347: TAction;
     TButtExportar: TToolButton;
     PNLImportesDeclarar: TLFPanel;
     TBImportesDeclarar: TLFToolBar;
     NavImportesDeclarar: THYMNavigator;
     DBGImportesDelcarar: TDBGridFind2000;
     AImprimirCarta: TAction;
     TButtCarta: TToolButton;
     PNLFiltroTipo: TLFPanel;
     CBTipo: TLFComboBox;
     LTipo: TLFLabel;
     PNLEjercicio: TLFPanel;
     LEjercicio: TLFLabel;
     CBEjercicio: TLFComboBox;
     TBSep1: TToolButton;
     TBSep2: TToolButton;
     TButtTodos: TToolButton;
     TButtDesmarcar: TToolButton;
     PNLCarta: TLFPanel;
     LblFecha: TLFLabel;
     DTPFecha: TLFDateEdit;
     LBLLugar: TLFLabel;
     ELugar: TLFEdit;
     PNLFiltroImpresos: TLFPanel;
     LImpresos: TLFLabel;
     CBImpresos: TLFComboBox;
     TBEnviarCorreo: TToolButton;
     AEnviarCorreo: TAction;
     TBConfigurarCorreo: TToolButton;
     AConfigurarCorreo: TAction;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AExportarMod347Execute(Sender: TObject);
     procedure AImprimirCartaExecute(Sender: TObject);
     procedure CBOrdenChange(Sender: TObject);
     procedure DBGImportesDelcararDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGImportesDelcararDblClick(Sender: TObject);
     procedure TButtTodosClick(Sender: TObject);
     procedure TButtDesmarcarClick(Sender: TObject);
     procedure AEnviarCorreoExecute(Sender: TObject);
     procedure AConfigurarCorreoExecute(Sender: TObject);
  private
     { Private declarations }
     ImprimiendoCarta, EnviandoCorreo: boolean;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregModelo347 : TFPregModelo347;

implementation

uses UDMMain, UEntorno, UUtiles, UFMListConfig, UDMRMayoresCantidad,
  UDMListados, UFormGest, UDMRModelosHacienda, UFPregCarta347, DateUtils,
  UFMain, URellenaLista;

{$R *.dfm}

procedure TFPregModelo347.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRMayoresCantidad, DMRMayoresCantidad);

  Grupo := 100;
  Listado := DMRMayoresCantidad.frMayoresCantidad;
  ListadoFR3 := DMRMayoresCantidad.frxMayoresCantidad;
  ListadoHYM := DMRMayoresCantidad.HYReportMail;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  // Valor para marcado
  DBGImportesDelcarar.ColumnasChecked.Strings[DBGImportesDelcarar.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] := REntorno.EntradaStr;

  DTPFecha.Date := Today;
  ELugar.Text := Copy(REntorno.PobEmpresa, 7, Length(REntorno.PobEmpresa) - 6);

  CBOrden.ItemIndex := 0;
  CBTipo.ItemIndex := 2;
  CBImpresos.ItemIndex := 0;

  RellenaEjercicios(CBEjercicio.Items);
  CBEjercicio.Items.Delete(0);
  if (CBEjercicio.Items.IndexOf(IntToStr(YearOf(Now) - 1)) >= 0) then
     CBEjercicio.ItemIndex := CBEjercicio.Items.IndexOf(IntToStr(YearOf(Now) - 1));

  ARecargar.Execute;
end;

procedure TFPregModelo347.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRMayoresCantidad);
end;

procedure TFPregModelo347.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRMayoresCantidad.CalculaInforme(2, StrToIntDef(CBEjercicio.Text, 0), CBOrden.ItemIndex, CBTipo.ItemIndex, CBImpresos.ItemIndex);
end;

procedure TFPregModelo347.AExportarMod347Execute(Sender: TObject);
begin
  inherited;
  ARecargar.Execute;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  DMRModelosHacienda.FormatoModelo347(StrToIntDef(CBEjercicio.Text, 0));
  CierraData(DMRModelosHacienda);
end;

procedure TFPregModelo347.AImprimirCartaExecute(Sender: TObject);
begin
  inherited;
  // AbreForm(TFPregCarta347, FPregCarta347, Sender);

  if ImprimiendoCarta then
     DMRMayoresCantidad.CancelarMostrarCarta347
  else
  begin
     ImprimiendoCarta := True;
     AImprimirCarta.Caption := _('Cancelar');
     TButtCarta.Caption := _('Cancelar');
     DMRMayoresCantidad.MostrarCarta347(1, Trunc(DTPFecha.Date), ELugar.Text);
  end;

  AImprimirCarta.Caption := _('Imprimir Carta');
  TButtCarta.Caption := _('Imprimir Carta');
  ImprimiendoCarta := False;
end;

procedure TFPregModelo347.AEnviarCorreoExecute(Sender: TObject);
begin
  inherited;
  // AbreForm(TFPregCarta347, FPregCarta347, Sender);

  if EnviandoCorreo then
     DMRMayoresCantidad.CancelarMostrarCorreo347
  else
  begin
     EnviandoCorreo := True;
     AEnviarCorreo.Caption := _('Cancelar');
     TBEnviarCorreo.Caption := _('Cancelar');
     DMRMayoresCantidad.MostrarCorreo347(0, Trunc(DTPFecha.Date), ELugar.Text);
  end;

  AEnviarCorreo.Caption := _('Enviar Correo');
  TBEnviarCorreo.Caption := _('Enviar Correo');
  EnviandoCorreo := False;
end;

procedure TFPregModelo347.CBOrdenChange(Sender: TObject);
begin
  inherited;
  DMRMayoresCantidad.Filtra(2, StrToIntDef(CBEjercicio.Text, 0), CBOrden.ItemIndex, CBTipo.ItemIndex, CBImpresos.ItemIndex);
end;

procedure TFPregModelo347.DBGImportesDelcararDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'TERCERO') or (UpperCase(Column.FieldName) = 'NIF')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if ((UpperCase(Column.FieldName) = 'IMPORTE_T1') or (UpperCase(Column.FieldName) = 'IMPORTE_T2') or (UpperCase(Column.FieldName) = 'IMPORTE_T3') or (UpperCase(Column.FieldName) = 'IMPORTE_T4') or (UpperCase(Column.FieldName) = 'IMPORTE_TOTAL')) then
        begin
           if (DMRMayoresCantidad.xImportesDeclararMODIFICADO.AsInteger = 1) then
              ColorInactivo(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if ((UpperCase(Column.FieldName) = 'IMPORTE_T1_PRESENTAR') or (UpperCase(Column.FieldName) = 'IMPORTE_T2_PRESENTAR') or (UpperCase(Column.FieldName) = 'IMPORTE_T3_PRESENTAR') or (UpperCase(Column.FieldName) = 'IMPORTE_T4_PRESENTAR') or (UpperCase(Column.FieldName) = 'IMPORTE_TOTAL_PRESENTAR')) then
        begin
           if (DMRMayoresCantidad.xImportesDeclararMODIFICADO.AsInteger = 1) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFPregModelo347.DBGImportesDelcararDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ATerceros, 'TERCERO = ' + IntToStr(DMRMayoresCantidad.xImportesDeclararTERCERO.AsInteger));
end;

procedure TFPregModelo347.TButtTodosClick(Sender: TObject);
begin
  inherited;
  DMRMayoresCantidad.Marcar(True);
end;

procedure TFPregModelo347.TButtDesmarcarClick(Sender: TObject);
begin
  inherited;
  DMRMayoresCantidad.Marcar(False);
end;

procedure TFPregModelo347.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMRMayoresCantidad.CalculaInforme(2, StrToIntDef(CBEjercicio.Text, 0), CBOrden.ItemIndex, CBTipo.ItemIndex, CBImpresos.ItemIndex);
  DMRMayoresCantidad.MostrarListado(Modo, 2);
end;

procedure TFPregModelo347.AConfigurarCorreoExecute(Sender: TObject);
begin
  inherited;
  Grupo := 134;
  AConfigurar.Execute;
  Grupo := 100;
end;

end.
