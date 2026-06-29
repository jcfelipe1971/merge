unit UIsoFMAcciones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEditFind2000, ULFDBEdit,
  ULFDBMemo, rxToolEdit, RXDBCtrl, ULFLabel, ULFEdit, UG2kTBLoc,
  UHYDescription, ULFHYDBDescription, Buttons, ULFDBDateEdit;

type
  TIsoFMAcciones = class(TFPEdit)
     LProcedenciaIncidencia: TLFLabel;
     DBEProcedencia: TLFDbedit;
     LTipo: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     LFecha: TLFLabel;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LPlano: TLFLabel;
     DBEPlano: TLFDbedit;
     LDescripcionInc: TLFLabel;
     LResponsable: TLFLabel;
     LAnalisis: TLFLabel;
     LCausas: TLFLabel;
     LAccion: TLFLabel;
     LResponsableAnalisis: TLFLabel;
     LComprobacion: TLFLabel;
     LFirmaAccion: TLFLabel;
     LFechaCierre: TLFLabel;
     DBMDescripcionInc: TLFDBMemo;
     DBMAnalisisAcciones: TLFDBMemo;
     DBMCausasAcciones: TLFDBMemo;
     DBMAccionAcciones: TLFDBMemo;
     DBMComprobacionSeguimiento: TLFDBMemo;
     DBEFRespInc: TLFDBEditFind2000;
     DBEFRespAna: TLFDBEditFind2000;
     DBEFRespAcc: TLFDBEditFind2000;
     LFirmaComp: TLFLabel;
     DBEFRespComp: TLFDBEditFind2000;
     LFCategoryAction1: TLFCategoryAction;
     AAccionCorrectora: TAction;
     DBDTPFechaCierre: TLFDBDateEdit;
     DBDTPFIFecha: TLFDBDateEdit;
     LRecurso: TLFLabel;
     DBEFRecurso: TLFDBEditFind2000;
     ALstConfig: TAction;
     DescTipo: TLFHYDBDescription;
     DescResponsableInc: TLFEdit;
     DescResponsableAna: TLFEdit;
     DescResponsableAcc: TLFEdit;
     DescResponsableComp: TLFEdit;
     DescRecurso: TLFHYDBDescription;
     LCoste: TLFLabel;
     LFDBCoste: TLFDbedit;
     LFechaPrevEjercicio: TLFLabel;
     DBDateEdit1: TLFDBDateEdit;
     LNroAccion: TLFLabel;
     DBEAccion: TLFDbedit;
     GBAccion: TGroupBox;
     GBAnalisis: TGroupBox;
     GBAccion2: TGroupBox;
     GBSeguimiento: TGroupBox;
     SBAProcedencia: TSpeedButton;
     LFTipoProc: TLFLabel;
     DBETipoProc: TLFDBEditFind2000;
     LEstado: TLFLabel;
     DBETituloEstado: TLFDbedit;
     TButtAbreCierra: TToolButton;
     PNLCabecera: TLFPanel;
     PNLDetalle: TLFPanel;
     PNLDetalleTop: TLFPanel;
     PNLDetalleClient: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure AccinCorrectoraPreventiva1Click(Sender: TObject);
     procedure AAccionCorrectoraExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ALstConfigExecute(Sender: TObject);
     procedure DBEFTipoChange(Sender: TObject);
     procedure DBEFRespIncChange(Sender: TObject);
     procedure DBEFRespAnaChange(Sender: TObject);
     procedure DBEFRespAccChange(Sender: TObject);
     procedure DBEFRespCompChange(Sender: TObject);
     procedure DBEFRecursoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure SBAProcedenciaDblClick(Sender: TObject);
     procedure TButtAbreCierraClick(Sender: TObject);
     procedure DBEFEmpleadoGenericoBusqueda(Sender: TObject);
     procedure PNLDetalleResize(Sender: TObject);
     procedure PNLDetalleTopResize(Sender: TObject);
     procedure PNLDetalleClientResize(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraAcciones(Filtro: string);
     procedure AbreOCierra;
  end;

var
  IsoFMAcciones : TIsoFMAcciones;

implementation

uses UIsoDMAcciones, UDMMain, UFormGest, UDMListados, UFMListconfig,
  UIsoFMInc, UEntorno, UUtiles, UDameDato;

{$R *.DFM}

procedure TIsoFMAcciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMAcciones, IsoDMAcciones);
  AbreData(TDMListados, DMListados);
  NavMain.DataSource := IsoDMAcciones.DSQMIsoAcciones;
  EPMain.DataSource := IsoDMAcciones.DSQMIsoAcciones;
  DBGMain.DataSource := IsoDMAcciones.DSQMIsoAcciones;
  CEMainPMEdit.Teclas := DMMain.teclas;
  DBEProcedencia.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProcedencia, DBEProcedencia);
end;
//********************* Fermin **************************
procedure TIsoFMAcciones.AccinCorrectoraPreventiva1Click(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';

  DMListados.Imprimir(8018, 0, '', str, IsoDMAcciones.frIsoAcciones, nil);
  {  with IsoDMAcciones.frHYIsoAcciones do
    begin
      LoadFromFIB(9011,str);
      PrepareReport;
      ShowPreparedReport;
    end;}
end;
//*******************************************************
procedure TIsoFMAcciones.AAccionCorrectoraExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';

  DMListados.Imprimir(8018, 0, '', str, IsoDMAcciones.frIsoAcciones, nil);
  {  with IsoDMAcciones.frHYIsoAcciones do
    begin
      LoadFromFIB(9011,str);
      PrepareReport;
      ShowPreparedReport;
    end;}
end;

procedure TIsoFMAcciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMAcciones);
  CierraData(DMListados);
end;

procedure TIsoFMAcciones.ALstConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8018, Formato, Cabecera, Copias, Pijama, '', IsoDMAcciones.frIsoAcciones);
end;

procedure TIsoFMAcciones.DBEFTipoChange(Sender: TObject);
begin
  inherited;
  DescTipo.ActualizaDatos('TIPO', DBEFTipo.Text);
end;

procedure TIsoFMAcciones.DBEFRespIncChange(Sender: TObject);
begin
  inherited;
  DescResponsableInc.Text := DameTituloEmpleado(StrToIntDef(DBEFRespInc.Text, 0));
end;

procedure TIsoFMAcciones.DBEFRespAnaChange(Sender: TObject);
begin
  inherited;
  DescResponsableAna.Text := DameTituloEmpleado(StrToIntDef(DBEFRespAna.Text, 0));
end;

procedure TIsoFMAcciones.DBEFRespAccChange(Sender: TObject);
begin
  inherited;
  DescResponsableAcc.Text := DameTituloEmpleado(StrToIntDef(DBEFRespAcc.Text, 0));
end;

procedure TIsoFMAcciones.DBEFRespCompChange(Sender: TObject);
begin
  inherited;
  DescResponsableComp.Text := DameTituloEmpleado(StrToIntDef(DBEFRespInc.Text, 0));
end;

procedure TIsoFMAcciones.DBEFRecursoChange(Sender: TObject);
begin
  inherited;
  DescRecurso.ActualizaDatos('RECURSO', DBEFRecurso.Text);
end;

procedure TIsoFMAcciones.FiltraAcciones(Filtro: string);
begin
  IsoDMAcciones.FiltraAcciones(Filtro);
end;

procedure TIsoFMAcciones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMAcciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMAcciones.BusquedaCompleja;
end;

procedure TIsoFMAcciones.SBAProcedenciaDblClick(Sender: TObject);
begin
  inherited;
  AbreForm(TIsoFMInc, IsoFMInc, Sender);
  IsoFMInc.FiltraInciencia(IsoDMAcciones.QMIsoAccionesID_INC.AsInteger);
end;

procedure TIsoFMAcciones.TButtAbreCierraClick(Sender: TObject);
begin
  if Confirma then
     try
        Screen.Cursor := crHourGlass;
        if (TButtAbreCierra.Tag = 0) then
           if (IsoDMAcciones.EstadoDocumento = 1) then
           begin
              IsoDMAcciones.DesBloqueaPedido;
              IsoDMAcciones.BloqueaPedido;
           end
           else
              IsoDMAcciones.BloqueaPedido;

        if (TButtAbreCierra.Tag = 1) then
           IsoDMAcciones.DesBloqueaPedido;
     finally
        Screen.Cursor := crDefault;
        AbreOCierra;
     end;
end;

procedure TIsoFMAcciones.AbreOCierra;
begin
  if (IsoDMAcciones.EstadoDocumento = 5) then
  begin
     TButtAbreCierra.Hint := _('Abrir Acción');
     TButtAbreCierra.ImageIndex := 67;
     TButtAbreCierra.Tag := 1;
     LFechaCierre.Visible := True;
     DBDTPFechaCierre.Visible := True;
  end
  else
  begin
     TButtAbreCierra.Hint := _('Cerrar Acción');
     TButtAbreCierra.ImageIndex := 68;
     TButtAbreCierra.Tag := 0;
     LFechaCierre.Visible := False;
     DBDTPFechaCierre.Visible := False;
  end;
end;

procedure TIsoFMAcciones.DBEFEmpleadoGenericoBusqueda(Sender: TObject);
begin
  inherited;
  TLFDBEditFind2000(Sender).CondicionBusqueda := 'ACTIVO=1';
end;

procedure TIsoFMAcciones.PNLDetalleResize(Sender: TObject);
begin
  inherited;
  PNLDetalleTop.Height := PNLDetalle.Height div 2;
end;

procedure TIsoFMAcciones.PNLDetalleTopResize(Sender: TObject);
begin
  inherited;
  GBAccion.Width := PNLDetalleTop.Width div 2;
end;

procedure TIsoFMAcciones.PNLDetalleClientResize(Sender: TObject);
begin
  inherited;
  GBAccion2.Width := PNLDetalleClient.Width div 2;
end;

procedure TIsoFMAcciones.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AAccionCorrectora.Execute;
end;

end.
