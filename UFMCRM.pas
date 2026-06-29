unit UFMCRM;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, DBCtrls, ULFDBMemo,
  rxToolEdit, RXDBCtrl, Mask, ULFDBEdit, ULFLabel, DateUtils,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, FIBQuery, FibDatabase, ULFDateEdit,
  ULFEditFind2000, ULFDBDateEdit;

type
  TFMCRM = class(TFPEdit)
     LFDbTitIncidencia: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     DBMMDatosIncidencia: TLFDBMemo;
     DBDEFechaResp: TLFDBDateEdit;
     DBEFCliente: TLFDBEditFind2000;
     LCliente: TLFLabel;
     LIncidencia: TLFLabel;
     LFecha: TLFLabel;
     LRecepcion: TLFLabel;
     ECliente: TLFEdit;
     LRuta: TLFLabel;
     DBERuta: TLFDbedit;
     DBESemana: TLFDbedit;
     LSemana: TLFLabel;
     TSSemana: TTabSheet;
     PNLSemana: TLFPanel;
     PNLSemanaTop: TLFPanel;
     PNLDetSemana: TLFPanel;
     PNLPieSemana: TLFPanel;
     LSemSemana: TLFLabel;
     LSemRuta: TLFLabel;
     ESemSemana: TLFEdit;
     ESemRuta: TLFEdit;
     HYTDBGrid1: THYTDBGrid;
     LKilometros: TLFLabel;
     LGasolina: TLFLabel;
     LBilletes: TLFLabel;
     LPeajes: TLFLabel;
     DBEKilometros: TLFDbedit;
     DBEGasolina: TLFDbedit;
     DBEBilletes: TLFDbedit;
     DBEPeajes: TLFDbedit;
     LParking: TLFLabel;
     LTelefono: TLFLabel;
     LHotel: TLFLabel;
     LComidasViaje: TLFLabel;
     DBEParking: TLFDbedit;
     DBETelefono: TLFDbedit;
     DBEHotel: TLFDbedit;
     DBEComidasViaje: TLFDbedit;
     LComidasInvitacion: TLFLabel;
     LGastosPequenos: TLFLabel;
     LVarios: TLFLabel;
     LTotal: TLFLabel;
     DBEComidasInvitacion: TLFDbedit;
     DBEGastosPequenos: TLFDbedit;
     DBEVarios: TLFDbedit;
     DBETotal: TLFDbedit;
     BGuardar: TButton;
     AListadoCRM: TAction;
     AListadoSemana: TAction;
     ADisenarListadoCRM: TAction;
     ADisenarListadoSemana: TAction;
     ADisenarListadoVisitas: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     GBIncidencia: TGroupBox;
     DBCHKClienteActivo: TLFDBCheckBox;
     DBCHKClienteNuevo: TLFDBCheckBox;
     DBCHKVisitaEfectuada: TLFDBCheckBox;
     DBCHKAusente: TLFDBCheckBox;
     DBCHKVolver: TLFDBCheckBox;
     DBCHKAnular: TLFDBCheckBox;
     DBCHKVisitaComercial: TLFDBCheckBox;
     DBCHKGestionDeCobro: TLFDBCheckBox;
     DBCHKEntregaMaterial: TLFDBCheckBox;
     DBRGTipo: TDBRadioGroup;
     TSVisitas: TTabSheet;
     PNLTop: TLFPanel;
     LBUsuario: TLFLabel;
     DBEUsuario: TLFDbedit;
     EUsuario: TLFEdit;
     LAgente: TLFLabel;
     DBEAgente: TLFDbedit;
     EAgente: TLFEdit;
     PNLVisitasTop: TLFPanel;
     PNLVisitas: TLFPanel;
     LVisitasRuta: TLFLabel;
     EVisitaRuta: TLFEdit;
     AListadoVisitas: TAction;
     BRegenerarVisitas: TButton;
     DEFechaVisita: TLFDateEdit;
     LDesdeFEcha: TLFLabel;
     EFAgente: TLFEditFind2000;
     LSelAgente: TLFLabel;
     DBGVisitas: TDBGridFind2000;
     BDuplicaDatos: TButton;
     DBEEfectivo: TLFDbedit;
     DBETarjeta: TLFDbedit;
     LEfectivo: TLFLabel;
     LTarjeta: TLFLabel;
     AListadoVisitasxDias: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ToolButton1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEUsuarioChange(Sender: TObject);
     procedure DBEAgenteChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure TSSemanaShow(Sender: TObject);
     procedure ESemSemanaChange(Sender: TObject);
     procedure ESemRutaChange(Sender: TObject);
     procedure BGuardarClick(Sender: TObject);
     procedure AListadoCRMExecute(Sender: TObject);
     procedure AListadoSemanaExecute(Sender: TObject);
     procedure AListadoVisitasExecute(Sender: TObject);
     procedure ADisenarListadoSemanaExecute(Sender: TObject);
     procedure ADisenarListadoCRMExecute(Sender: TObject);
     procedure ADisenarListadoVisitasExecute(Sender: TObject);
     procedure HYTDBGrid1DblClick(Sender: TObject);
     procedure DBRGTipoChange(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure EVisitaRutaChange(Sender: TObject);
     procedure BRegenerarVisitasClick(Sender: TObject);
     procedure DEFechaVisitaChange(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure LClienteClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure BDuplicaDatosClick(Sender: TObject);
     procedure AListadoVisitasxDiasExecute(Sender: TObject);
     procedure ANuevoExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCRM : TFMCRM;

implementation

uses UDMCRM, UFormGest, UDMMain, UEntorno, UDMLstCRM, UFMListConfig,
  UFMLstCRM, UDameDato;

{$R *.dfm}

procedure TFMCRM.FormCreate(Sender: TObject);
var
  Q : TFIBQuery;
  s : string;
  NuevaAccion : TAction;
begin
  inherited;
  AbreData(TDMCRM, DMCRM);
  NavMain.DataSource := DMCRM.DSXCRM;
  DBGMain.DataSource := DMCRM.DSXCRM;

  G2KTableLoc.DataSource := DMCRM.DSXCRM;
  if (DMCRM.Agente <> 0) then
  begin
     EFAgente.Enabled := False;
     EFAgente.ReadOnly := True;
     EFAgente.Color := clInfoBk;
     EFAgente.Text := IntToStr(DMCRM.Agente);
  end
  else
  begin
     EFAgente.Enabled := True;
     EFAgente.ReadOnly := False;
     EFAgente.Color := clWindow;
     EFAgente.Text := '0';
  end;
  ESemSemana.Text := IntToStr(WeekOf(Now));
  ESemRuta.Text := '1';
  DMCRM.FiltraSemana(StrToIntDef(Trim(EFAgente.Text), 0), StrToIntDef(Trim(ESemSemana.Text), 0), StrToIntDef(Trim(ESemRuta.Text), 0));
  DEFechaVisita.Date := Today;
  EVisitaRuta.Text := '1';

  Q := TFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     Transaction := TFIBTransaction.Create(Self);
     Transaction.DefaultDatabase := DMMain.Database;
     Transaction.StartTransaction;
     SQL.Text := 'SELECT TIPO,TITULO FROM SYS_TIPO_CRM ORDER BY TIPO';
     ExecQuery;
     while not EOF do
     begin
        DBRGTipo.Items.Add(FieldByName['TITULO'].AsString);
        DBRGTipo.Values.Add(FieldByName['TIPO'].AsString);
        //ALMain.Actions.ActionList
        //NuevaAccion := ALMain.Actions.Create(Self);
        NuevaAccion := TAction.Create(Self);
        NuevaAccion.ActionList := ALMain;
        NuevaAccion.ImageIndex := 99;
        NuevaAccion.Caption := FieldByName['TITULO'].AsString;
        NuevaAccion.Tag := FieldByName['TIPO'].AsInteger;
        NuevaAccion.Category := 'Nuevo';
        NuevaAccion.OnExecute := ANuevoExecute;
        Next;
     end;
     Transaction.Free;
  end;
  Q.Free;
  {esto lo tengo que hacer para que refresque DBRGTipo y marque los radiobuttons}
  DMCRM.xCRM.Close;
  DMCRM.xCRM.Open;
  {Pasa a Cliente Potencial y vuelve a Cliente}
  s := LCliente.Caption;
  LClienteClick(Sender);
  while (LCliente.Caption <> s) do
     LClienteClick(Sender);
end;

procedure TFMCRM.EFAgenteChange(Sender: TObject);
begin
  inherited;
  G2KTableLoc.CondicionBusqueda := 'agente=' + EFAgente.Text;
  G2KTableLoc.OrdenadoPor.Text := 'incidencia';
  DBEFCliente.CondicionBusqueda := 'agente=' + EFAgente.Text;
  DBEFCliente.OrdenadoPor.Text := 'cliente';
  with DMCRM do
  begin
     Agente := StrToIntDef(EFAgente.Text, 0);
     xCRM.Close;
     xCRM.Params.ByName['AGENTE'].AsInteger := StrToIntDef(EFAgente.Text, 0);
     xCRM.Open;

     xVisitas.Close;
     xVisitas.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     xVisitas.Params.ByName['RUTA'].AsInteger := StrToIntDef(EVisitaRuta.Text, 0);
     xVisitas.Params.ByName['AGENTE'].AsInteger := DMCRM.Agente;
     xVisitas.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     xVisitas.Open;
  end;
end;

procedure TFMCRM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCRM);
end;

procedure TFMCRM.DBEUsuarioChange(Sender: TObject);
begin
  inherited;
  EUsuario.Text := DameTituloUsuario(StrToIntDef(DBEUsuario.Text, 0));
end;

procedure TFMCRM.DBEAgenteChange(Sender: TObject);
begin
  inherited;
  EAgente.Text := DameTituloAgente(StrToIntDef(DBEAgente.Text, 0));
end;

procedure TFMCRM.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  if (DMCRM.xCRMCLIENTE_POTENCIAL.AsInteger = 1) then
  begin
     ECliente.Text := DameTituloClientePotencial(StrToIntDef(DBEFCliente.Text, 0));
     LCliente.Caption := _('Potencial');
  end
  else
  begin
     ECliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0));
     LCliente.Caption := _('Cliente');
  end;
end;

procedure TFMCRM.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMCRM.TSSemanaShow(Sender: TObject);
begin
  inherited;
  DMCRM.FiltraSemana(StrToIntDef(Trim(EFAgente.Text), 0), StrToIntDef(Trim(ESemSemana.Text), 0), StrToIntDef(Trim(ESemRuta.Text), 0));
end;

procedure TFMCRM.ESemSemanaChange(Sender: TObject);
begin
  inherited;
  DMCRM.FiltraSemana(StrToIntDef(Trim(EFAgente.Text), 0), StrToIntDef(Trim(ESemSemana.Text), 0), StrToIntDef(Trim(ESemRuta.Text), 0));
end;

procedure TFMCRM.ESemRutaChange(Sender: TObject);
begin
  inherited;
  DMCRM.FiltraSemana(StrToIntDef(Trim(EFAgente.Text), 0), StrToIntDef(Trim(ESemSemana.Text), 0), StrToIntDef(Trim(ESemRuta.Text), 0));
end;

procedure TFMCRM.BGuardarClick(Sender: TObject);
begin
  inherited;
  with DMCRM do
  begin
     if (xTotSemanaTOTAL.AsFloat <> (xTotSemanaEFECTIVO.AsFloat + xTotSemanaTARJETA.AsFloat)) then
        ShowMessage(_('La suma de Efectivo + Tarjeta no es igual al total'))
     else
        xTotSemana.Post;
  end;
end;

procedure TFMCRM.ADisenarListadoSemanaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCRM, DMLstCRM);
  TFMListConfig.Create(Self).Muestra(5701, formato, cabecera, copias,
     pijama, '', DMLstCRM.frCRM);
  CierraData(DMLstCRM);
end;

procedure TFMCRM.ADisenarListadoCRMExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCRM, DMLstCRM);
  TFMListConfig.Create(Self).Muestra(5700, formato, cabecera, copias,
     pijama, '', DMLstCRM.frCRM);
  CierraData(DMLstCRM);
end;

procedure TFMCRM.ADisenarListadoVisitasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCRM, DMLstCRM);
  TFMListConfig.Create(Self).Muestra(5702, formato, cabecera, copias,
     pijama, '', DMLstCRM.frCRM);
  CierraData(DMLstCRM);
end;

procedure TFMCRM.AListadoCRMExecute(Sender: TObject);
begin
  inherited;
  TFMLstCRM.Create(Self).Muestra(StrToIntDef(DBEUsuario.Text, 0), StrToIntDef(DBEAgente.Text, 0));
end;

procedure TFMCRM.AListadoSemanaExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstCRM, DMLstCRM);
  DMLstCRM.ListarSemana(StrToInt(EFAgente.Text), StrToIntDef(Trim(ESemSemana.Text), 0), StrToIntDef(Trim(ESemRuta.Text), 0), 0);
  CierraData(DMLstCRM);
end;

procedure TFMCRM.AListadoVisitasExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstCRM, DMLstCRM);
  DMLstCRM.ListarVisitas(StrToInt(EFAgente.Text), StrToIntDef(EVisitaRuta.Text, 0), DEFechaVisita.Date, 0, 0);
  CierraData(DMLstCRM);
end;

procedure TFMCRM.AListadoVisitasxDiasExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstCRM, DMLstCRM);
  DMLstCRM.ListarVisitas(StrToInt(EFAgente.Text), StrToIntDef(EVisitaRuta.Text, 0), DEFechaVisita.Date, 0, 1);
  CierraData(DMLstCRM);
end;

procedure TFMCRM.HYTDBGrid1DblClick(Sender: TObject);
begin
  with DMCRM.xCRM do
  begin
     DisableControls;
     First;
     while ((DMCRM.xCRMID.AsInteger <> DMCRM.xSemanaID.AsInteger) and (not EOF)) do
        Next;
     EnableControls;
  end;

  inherited;
end;

procedure TFMCRM.DBRGTipoChange(Sender: TObject);
begin
  inherited;
  if (DBRGTipo.Value = '1') then
     GBIncidencia.Visible := True
  else
     GBIncidencia.Visible := False;
end;

procedure TFMCRM.PCMainChange(Sender: TObject);
begin
  inherited;
  AListadoSemana.Enabled := False;
  if (PCMain.ActivePage = TSSemana) then
     AListadoSemana.Enabled := True;
end;

procedure TFMCRM.EVisitaRutaChange(Sender: TObject);
var
  ADAte : TDateTime;
  Ruta : integer;
  i : integer;
begin
  inherited;
  with DMCRM do
  begin
     xVisitas.Close;
     xVisitas.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     xVisitas.Params.ByName['RUTA'].AsInteger := StrToIntDef(EVisitaRuta.Text, 0);
     xVisitas.Params.ByName['AGENTE'].AsInteger := DMCRM.Agente;
     xVisitas.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     xVisitas.Open;
  end;

  ADate := EncodeDate(REntorno.Ejercicio, 01, 01);
  Ruta := StrToIntDef(EVisitaRuta.Text, 0);
  if ((Ruta > 0) and (Ruta <= 7)) then
  begin
     while ((DayOfTheWeek(ADate)) <> Ruta) do
        ADate := ADate - 1;

     for i := 1 to DBGVisitas.Columns.Count - 1 do
     begin
        if ((StrToIntDef(Copy(DBGVisitas.Columns[i].FieldName, 2, 2), 0) > 0) and (Copy(DBGVisitas.Columns[i].FieldName, 1, 1) = 'D')) then
        begin
           DBGVisitas.Columns[i].Title.Caption := IntToStr(DayOf(ADate + (StrToIntDef(Copy(DBGVisitas.Columns[i].FieldName, 2, 2), 0) * 7 - 7)));
        end;
     end;
  end;
end;

procedure TFMCRM.BRegenerarVisitasClick(Sender: TObject);
begin
  inherited;
  DMCRM.CalculaVisitas(StrToIntDef(EVisitaRuta.Text, 0));
end;

procedure TFMCRM.DEFechaVisitaChange(Sender: TObject);
var
  semana : integer;
  i : integer;
begin
  inherited;
  {ruta 1 2 3 4 5 6 7}
  {dow  2 3 4 5 6 7 1}
  semana := WeekOf(DEFechaVisita.Date);
  for i := 1 to DBGVisitas.Columns.Count - 1 do
  begin
     if ((StrToIntDef(Copy(DBGVisitas.Columns[i].FieldName, 2, 2), 0) > 0)) then
        DBGVisitas.Columns[i].Visible := StrToIntDef(Copy(DBGVisitas.Columns[i].FieldName, 2, 2), 0) >= semana;
  end;
end;

procedure TFMCRM.LClienteClick(Sender: TObject);
begin
  inherited;
  if (LCliente.Caption = _('Cliente')) then
  begin
     LCliente.Caption := _('Potencial');
     DBEFCliente.Tabla_a_buscar := 'VER_CLIENTES_POTENCIALES';
     DMCRM.xCRMCLIENTE_POTENCIAL.AsInteger := 1;
  end
  else
  if (LCliente.Caption = _('Potencial')) then
  begin
     LCliente.Caption := _('Cliente');
     DBEFCliente.Tabla_a_buscar := 'VER_CLIENTES_EMPRESA';
     DMCRM.xCRMCLIENTE_POTENCIAL.AsInteger := 0;
  end;
end;

procedure TFMCRM.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbInsert]) then
  begin
     LCliente.Caption := _('Cliente');
     DBEFCliente.Tabla_a_buscar := 'VER_CLIENTES_EMPRESA';
     {if (DMCRM.cliente_ant > 0) then}
     BDuplicaDatos.Visible := True;
  end
  else
     BDuplicaDatos.Visible := False;
end;

procedure TFMCRM.BDuplicaDatosClick(Sender: TObject);
begin
  inherited;
  DMCRM.DuplicaDatos(0);
  DBMMDatosIncidencia.SetFocus;
end;

procedure TFMCRM.ANuevoExecute(Sender: TObject);
begin
  inherited;
  DMCRM.DuplicaDatos(TAction(Sender).Tag);
  DBMMDatosIncidencia.SetFocus;
end;

end.
