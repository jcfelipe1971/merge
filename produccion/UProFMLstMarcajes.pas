unit UProFMLstMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  ToolWin, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  Grids, DBGrids, Dateutils, rxToolEdit, ULFActionList, ULFComboBox, ULFEdit,
  ULFPanel, ULFPageControl, ULFToolBar, ULFDBEdit, ULFEditFind2000,
  ULFFIBDBEditFind, ULFLabel, ULFDateEdit, rxPlacemnt, ULFFormStorage;

type
  TProFMLstMarcajes = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     TSOperario: TTabSheet;
     Panel5: TLFPanel;
     LClienteD: TLFLabel;
     LClienteH: TLFLabel;
     EOperarioD: TLFEdit;
     EOperarioH: TLFEdit;
     TSMaquina: TTabSheet;
     Panel4: TLFPanel;
     LMaquinaD: TLFLabel;
     LMaquinaH: TLFLabel;
     DBEArticuloD: TLFDbedit;
     DBEArticuloH: TLFDbedit;
     EFMaquinaD: TLFEditFind2000;
     EFMaquinaH: TLFEditFind2000;
     TSTrabExt: TTabSheet;
     Panel3: TLFPanel;
     TSVarios: TTabSheet;
     Panel6: TLFPanel;
     LabelAgenteD: TLFLabel;
     LabelAgenteH: TLFLabel;
     DBEVariosD: TLFDbedit;
     DBEVariosH: TLFDbedit;
     EFVariosD: TLFEditFind2000;
     EFVariosH: TLFEditFind2000;
     EFOrdenD: TLFEditFind2000;
     EFOrdenH: TLFEditFind2000;
     LabelOrdenD: TLFLabel;
     LabelOrdenH: TLFLabel;
     EFFaseD: TLFEditFind2000;
     EFFaseH: TLFEditFind2000;
     LabelFaseD: TLFLabel;
     LabelFaseH: TLFLabel;
     DTFechaD: TLFDateEdit;
     DTFEchaH: TLFDateEdit;
     LabelFechaD: TLFLabel;
     LabelFechaH: TLFLabel;
     EFTareaD: TLFEditFind2000;
     EFTareaH: TLFEditFind2000;
     LabelTareaD: TLFLabel;
     LabelTareaH: TLFLabel;
     EFOperarioD: TLFEditFind2000;
     Label4: TLFLabel;
     Label5: TLFLabel;
     Label6: TLFLabel;
     Label7: TLFLabel;
     Label8: TLFLabel;
     Label9: TLFLabel;
     EFOrdenMaqD: TLFEditFind2000;
     EFFaseMaqD: TLFEditFind2000;
     EFTareaMaqD: TLFEditFind2000;
     EFOrdenMaqH: TLFEditFind2000;
     EFFaseMaqH: TLFEditFind2000;
     EFTareaMaqH: TLFEditFind2000;
     EFOperarioH: TLFEditFind2000;
     Label10: TLFLabel;
     Label11: TLFLabel;
     EFProveedorH: TLFEditFind2000;
     EFProveedorD: TLFEditFind2000;
     DBEProveedorD: TLFDbedit;
     DBEProveedorH: TLFDbedit;
     Label12: TLFLabel;
     Label13: TLFLabel;
     Label14: TLFLabel;
     EFTareaProvD: TLFEditFind2000;
     Label15: TLFLabel;
     Label16: TLFLabel;
     Label17: TLFLabel;
     EFOrdenProvD: TLFEditFind2000;
     EFFaseProvD: TLFEditFind2000;
     EFFaseProvH: TLFEditFind2000;
     EFOrdenProvH: TLFEditFind2000;
     EFTareaProvH: TLFEditFind2000;
     Label18: TLFLabel;
     EFOrdenVarD: TLFEditFind2000;
     Label19: TLFLabel;
     EFOrdenVarH: TLFEditFind2000;
     EFFaseVarH: TLFEditFind2000;
     Label20: TLFLabel;
     EFTareaVarH: TLFEditFind2000;
     Label21: TLFLabel;
     EFTareaVarD: TLFEditFind2000;
     Label22: TLFLabel;
     Label23: TLFLabel;
     EFFaseVarD: TLFEditFind2000;
     LabelIDTarea: TLFLabel;
     LabelIDTareaH: TLFLabel;
     EFIDTareaD: TLFEditFind2000;
     EFIDTareaH: TLFEditFind2000;
     RGTipoLst: TRadioGroup;
     LCompuestoD: TLFLabel;
     LFCompuestoD: TLFEditFind2000;
     LFCompuestoH: TLFEditFind2000;
     Label26: TLFLabel;
     Label27: TLFLabel;
     LCompuestoH: TLFLabel;
     LFCompuestoMaqD: TLFEditFind2000;
     LFCompuestoMaqH: TLFEditFind2000;
     LFCompuestoProvD: TLFEditFind2000;
     LFCompuestoProvH: TLFEditFind2000;
     Label24: TLFLabel;
     Label25: TLFLabel;
     Label28: TLFLabel;
     LFCompuestoVarD: TLFEditFind2000;
     Label29: TLFLabel;
     LFCompuestoVarH: TLFEditFind2000;
     procedure EFOperarioDChange(Sender: TObject);
     procedure EFOperarioHChange(Sender: TObject);
     procedure CBOrdenChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure EFMaquinaDChange(Sender: TObject);
     procedure EFMaquinaHChange(Sender: TObject);
     procedure EFProveedorDChange(Sender: TObject);
     procedure EFProveedorHChange(Sender: TObject);
     procedure EFVariosDChange(Sender: TObject);
     procedure EFVariosHChange(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFIDTareaDChange(Sender: TObject);
     procedure EFIDTareaHChange(Sender: TObject);
     procedure RGTipoLstClick(Sender: TObject);
     procedure LFCompuestoDChange(Sender: TObject);
     procedure LFCompuestoMaqDChange(Sender: TObject);
     procedure LFCompuestoProvDChange(Sender: TObject);
     procedure LFCompuestoVarDChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     tipo_lst: integer;
  end;

var
  ProFMLstMarcajes : TProFMLstMarcajes;

implementation

uses UDMMain, UProDMLSTMarcajes, UEntorno, UFormGest, FIBQuery, UDameDato;

{$R *.dfm}

procedure TProFMLstMarcajes.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
begin
  inherited;
  AbreData(TProDMLstMarcajes, ProDMLstMarcajes);
  PNLTop.Visible := True;

  Grupo := 8012;
  Listado := ProDMLstMarcajes.frMarcajes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  RGTipoLst.ItemIndex := 0;
  tipo_lst := 1;

  // Cerrar datos
  ProDMLstMarcajes.xMaquinaD.Close;
  ProDMLstMarcajes.xMaquinaH.Close;
  ProDMLstMarcajes.xProveedorD.Close;
  ProDMLstMarcajes.xProveedorH.Close;

  PCMain.ActivePage := TSOperario;
  CBOrden.Clear;
  CBOrden.Items.Add(_('Por Operario'));
  CBOrden.Items.Add(_('Por Fecha'));
  // CBOrden.Items.Add('Por Fase');
  // CBOrden.Items.Add('Por Tarea');
  CBOrden.ItemIndex := 0;

  ARecargar.Execute;

  EFOrdenD.Enabled := True;
  EFFaseD.Enabled := True;
  EFTareaD.Enabled := True;
  EFOrdenH.Enabled := True;
  EFFaseH.Enabled := True;
  EFTareaH.Enabled := True;
  EFIDTareaD.Tag := 0;

  // Agafo el mes el primer dia del mes i el últim
  ProDMLstMarcajes.TFiltro := 1;
  DecodeDate(Date, Year, Month, Day);
  DTFechaD.Date := EncodeDate(Year, Month, StrToInt('01'));
  DTFechaH.Date := EncodeDate(Year, Month, DaysInAMonth(Year, Month));
  TDPFechaListado.Date := Date;
end;

procedure TProFMLstMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstMarcajes);
end;

procedure TProFMLstMarcajes.FormActivate(Sender: TObject);
begin
  inherited;
  CBOrdenChange(Sender);
end;

procedure TProFMLstMarcajes.EFOperarioDChange(Sender: TObject);
begin
  inherited;
  EOperarioD.Text := DameTituloEmpleado(StrToIntDef(EFOperarioD.Text, 0));
end;

procedure TProFMLstMarcajes.EFOperarioHChange(Sender: TObject);
begin
  inherited;
  EOperarioH.Text := DameTituloEmpleado(StrToIntDef(EFOperarioH.Text, 0));
end;

procedure TProFMLstMarcajes.CBOrdenChange(Sender: TObject);
begin
  inherited;

  if PCMain.ActivePage = TSOperario then
     ProDMLstMarcajes.GeneraSQL('OPE', CBOrden.ItemIndex);
  if PCMain.ActivePage = TSMaquina then
     ProDMLstMarcajes.GeneraSQL('MAQ', CBOrden.ItemIndex);
  if PCMain.ActivePage = TSTrabExt then
     ProDMLstMarcajes.GeneraSQL('TRA', CBOrden.ItemIndex);
  if PCMain.ActivePage = TSVarios then
     ProDMLstMarcajes.GeneraSQL('VAR', CBOrden.ItemIndex);
end;

procedure TProFMLstMarcajes.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  if PCMain.ActivePage = TSOperario then
  begin
     ProDMLstMarcajes.MostrarListado(tipo_lst, 0, DTFechaD.Date, DTFechaH.Date,
        StrToInt(EFOperarioD.Text),
        StrToInt(EFOperarioH.Text), 0, 0, 0, 0, '', '', EFFaseD.Text, EFFaseH.Text,
        EFTareaD.Text, EFTareaH.Text, 'MO',
        TDPFechaListado.Date, StrToInt(EFOrdenD.Text), StrToInt(EFOrdenH.Text),
        EFIDTareaD.Tag, EFIDTareaD.Text, EFIDTareaH.Text, StrToInt(EFOrdenD.Text),
        StrToInt(EFOrdenH.Text), LFCompuestoD.Text, LFCompuestoH.Text);
  end;

  if PCMain.ActivePage = TSMaquina then
  begin
     ProDMLstMarcajes.MostrarListado(2, 0, DTFechaD.Date, DTFechaH.Date,
        0, 0, StrToInt(EFMaquinaD.Text), StrToInt(EFMaquinaH.Text), 0, 0, '', '',
        EFFaseMaqD.Text, EFFaseMaqH.Text, EFTareaMaqD.Text, EFTareaMaqH.Text,
        'HM', TDPFechaListado.Date,
        StrToInt(EFOrdenMaqD.Text), StrToInt(EFOrdenMaqH.Text), 0, '', '', StrToInt(EFOrdenMaqD.Text),
        StrToInt(EFOrdenMaqH.Text), LFCompuestoMaqD.Text, LFCompuestoMaqH.Text);
  end;

  if PCMain.ActivePage = TSTrabExt then
  begin
     ProDMLstMarcajes.MostrarListado(3, 0, DTFechaD.Date, DTFechaH.Date,
        0, 0, 0, 0, StrToInt(EFProveedorD.Text), StrToInt(EFProveedorH.Text), '', '',
        EFFaseProvD.Text, EFFaseProvH.Text, EFTareaProvD.Text,
        EFTareaProvH.Text, 'TE', TDPFechaListado.Date,
        StrToInt(EFOrdenProvD.Text), StrToInt(EFOrdenProvH.Text), 0, '', '', StrToInt(EFOrdenProvD.Text),
        StrToInt(EFOrdenProvH.Text), LFCompuestoProvD.Text, LFCompuestoProvH.Text);
  end;

  if PCMain.ActivePage = TSVarios then
  begin
     ProDMLstMarcajes.MostrarListado(4, 0, DTFechaD.Date, DTFechaH.Date,
        0, 0, 0, 0, 0, 0, EFVariosD.Text, EFVariosH.Text,
        EFFaseVarD.Text, EFFaseVarH.Text, EFTareaVarD.Text, EFTareaVarH.Text,
        'VAR', TDPFechaListado.Date,
        StrToInt(EFOrdenVarD.Text), StrToInt(EFOrdenVarH.Text), 0, '', '', StrToInt(EFOrdenVarD.Text),
        StrToInt(EFOrdenVarH.Text), LFCompuestoVarD.Text, LFCompuestoVarH.Text);
  end;
end;

procedure TProFMLstMarcajes.EFMaquinaDChange(Sender: TObject);
begin
  inherited;
  if (EFMaquinaD.Text <> '') then
     ProDMLstMarcajes.CambiaMaquinaD(StrToInt(EFMaquinaD.Text));
end;

procedure TProFMLstMarcajes.EFMaquinaHChange(Sender: TObject);
begin
  inherited;
  if (EFMaquinaH.Text <> '') then
     ProDMLstMarcajes.CambiaMaquinaH(StrToInt(EFMaquinaH.Text));
end;

procedure TProFMLstMarcajes.EFProveedorDChange(Sender: TObject);
begin
  inherited;
  if (EFProveedorD.Text <> '') then
     ProDMLstMarcajes.CambiaProveedorD(StrToInt(EFProveedorD.Text));
end;

procedure TProFMLstMarcajes.EFProveedorHChange(Sender: TObject);
begin
  inherited;
  if (EFProveedorH.Text <> '') then
     ProDMLstMarcajes.CambiaProveedorH(StrToInt(EFProveedorH.Text));
end;

procedure TProFMLstMarcajes.EFVariosDChange(Sender: TObject);
begin
  inherited;
  if (EFVariosD.Text <> '') then
     ProDMLstMarcajes.CambiaVariosD(EFVariosD.Text);
end;

procedure TProFMLstMarcajes.EFVariosHChange(Sender: TObject);
begin
  inherited;
  if (EFVariosH.Text <> '') then
     ProDMLstMarcajes.CambiaVariosH(EFVariosH.Text);
end;

procedure TProFMLstMarcajes.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSOperario) then
  begin
     EFOperarioD.SetFocus;
     // ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Operario'));
     ProDMLstMarcajes.TFiltro := 1;
  end;

  if (PCMain.ActivePage = TSMaquina) then
  begin
     EFMaquinaD.SetFocus;
     // ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Máquina'));
     ProDMLstMarcajes.TFiltro := 2;
  end;

  if (PCMain.ActivePage = TSTrabExt) then
  begin
     EFProveedorD.SetFocus;
     // ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Proveedor'));
     ProDMLstMarcajes.TFiltro := 3;
  end;

  if (PCMain.ActivePage = TSVarios) then
  begin
     EFVariosD.SetFocus;
     // ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Recurso'));
     ProDMLstMarcajes.TFiltro := 4;
  end;

  // La resta de criteris d'ordenació
  CBOrden.Items.Add(_('Por Fecha'));
  // CBOrden.Items.Add('Por Fase');
  // CBOrden.Items.Add('Por Tarea');
  CBOrden.ItemIndex := 0;
  CBOrdenChange(Sender);
  Grupo := 8012 + pcMain.TabIndex;
  if ((grupo = 8012) and (RGTipoLst.ItemIndex = 1)) then
  begin
     grupo := 8027;
     tipo_lst := 16;
  end;
end;

procedure TProFMLstMarcajes.ARecargarExecute(Sender: TObject);
begin
  inherited;
  ProDMLstMarcajes.Recargar;
  EFIDTareaD.Text := '';
  EFIDTareaH.Text := '';
  EFOrdenD.Enabled := True;
  EFFaseD.Enabled := True;
  EFTareaD.Enabled := True;
  EFOrdenH.Enabled := True;
  EFFaseH.Enabled := True;
  EFTareaH.Enabled := True;

  EFIDTareaD.Tag := 0;
end;

procedure TProFMLstMarcajes.EFIDTareaDChange(Sender: TObject);
begin
  inherited;
  if (EFIDTareaD.Text <> '') then
  begin
     ProDMLstMarcajes.QIdTarea.Close;
     ProDMLstMarcajes.QIdTarea.Params.ByName['IDTarea'].AsInteger :=
        StrToInt(EFIDTareaD.Text);
     ProDMLstMarcajes.QIdTarea.ExecQuery;

     EFOrdenD.Text := ProDMLstMarcajes.QIdTarea.FieldByName['Orden'].AsString;
     EFFaseD.Text := ProDMLstMarcajes.QIdTarea.FieldByName['TipoFase'].AsString;
     EFTareaD.Text := ProDMLstMarcajes.QIdTarea.FieldByName['TipoTarea'].AsString;

     EFOrdenD.Enabled := False;
     EFFaseD.Enabled := False;
     EFTareaD.Enabled := False;

     EFOrdenH.Enabled := False;
     EFFaseH.Enabled := False;
     EFTareaH.Enabled := False;
     EFIDTareaD.Tag := 1;
  end;
end;

procedure TProFMLstMarcajes.EFIDTareaHChange(Sender: TObject);
begin
  inherited;
  if (EFIDTareaH.Text <> '') then
  begin
     ProDMLstMarcajes.QIdTarea.Close;
     ProDMLstMarcajes.QIdTarea.Params.ByName['IDTarea'].AsInteger :=
        StrToInt(EFIDTareaH.Text);
     ProDMLstMarcajes.QIdTarea.ExecQuery;

     EFOrdenH.Text := ProDMLstMarcajes.QIdTarea.FieldByName['Orden'].AsString;
     EFFaseH.Text := ProDMLstMarcajes.QIdTarea.FieldByName['TipoFase'].AsString;
     EFTareaH.Text := ProDMLstMarcajes.QIdTarea.FieldByName['TipoTarea'].AsString;
  end;
end;

procedure TProFMLstMarcajes.RGTipoLstClick(Sender: TObject);
begin
  inherited;
  if (RGTipolst.ItemIndex = 1) then
  begin
     Grupo := 8027;
     tipo_lst := 16;
  end
  else
  begin
     Grupo := 8012;
     tipo_lst := 1;
  end;
end;

procedure TProFMLstMarcajes.LFCompuestoDChange(Sender: TObject);
begin
  inherited;
  LFCompuestoH.Text := LFCompuestoD.Text;
end;

procedure TProFMLstMarcajes.LFCompuestoMaqDChange(Sender: TObject);
begin
  inherited;
  LFCompuestoMaqH.Text := LFCompuestoMaqD.Text;
end;

procedure TProFMLstMarcajes.LFCompuestoProvDChange(Sender: TObject);
begin
  inherited;
  LFCompuestoProvH.Text := LFCompuestoProvD.Text;
end;

procedure TProFMLstMarcajes.LFCompuestoVarDChange(Sender: TObject);
begin
  inherited;
  LFCompuestoVarH.Text := LFCompuestoVarD.Text;
end;

end.
