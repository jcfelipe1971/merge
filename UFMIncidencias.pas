unit UFMIncidencias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ComCtrls, ULFPageControl, UEditPanel, UNavigator, ToolWin, ULFToolBar,
  ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, rxToolEdit,
  RXDBCtrl, ULFDBMemo, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, ULFComboBox, URecursos, UG2kTBLoc, ULFLabel, DB,
  Buttons, ULFEdit, ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFDBDateEdit;

type
  TFMIncidencias = class(TFPEdit)
     LBLIncidencia: TLFLabel;
     LFDbTitIncidencia: TLFDbedit;
     LBLRespuesta: TLFLabel;
     DBMMDatosIncidencia: TLFDBMemo;
     LFDBRespuestaIncidencia: TLFDBMemo;
     DBDTPFecha: TLFDBDateEdit;
     DBDEFechaResp: TLFDBDateEdit;
     LBLFecha: TLFLabel;
     LBLRecepcion: TLFLabel;
     DBDEFechaRecep: TLFDBDateEdit;
     GBDoc: TLFPanel;
     LBLEjercicio: TLFLabel;
     LBLSerie: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     DBEFEjercicio: TLFDBEditFind2000;
     LBLTipo: TLFLabel;
     LBLNumero: TLFLabel;
     DBERig: TLFDbedit;
     LBLCanal: TLFLabel;
     DBEFCanal: TLFDBEditFind2000;
     DBETitTipo: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AListadoIncidencias: TAction;
     DBEFTipoMov: TLFDBEditFind2000;
     DBETitCanal: TLFDbedit;
     DBETitSerie: TLFDbedit;
     CBTipo: TLFComboBox;
     LBUsuario: TLFLabel;
     DBEUsuario: TLFDbedit;
     DBETituloUsuario: TLFDbedit;
     LTipoIncidenciaKri: TLFLabel;
     DBEFTipoIncidenciaKri: TLFDBEditFind2000;
     DBETipoIncidenciaKri: TLFDbedit;
     SBAAgente: TSpeedButton;
     SBAContacto: TSpeedButton;
     ALIncidencias: TLFActionList;
     AAgente: TAction;
     AContacto: TAction;
     ACodCliPro: TAction;
     SBCodCliPro: TSpeedButton;
     SBDireccion: TSpeedButton;
     ADireccion: TAction;
     DBMMDatosIncidenciaNotas: TLFDBMemo;
     ToolButton1: TToolButton;
     LMaestroFiltro: TLFLabel;
     EFMaestroFiltro: TLFEditFind2000;
     ETituloMaestroFiltro: TLFEdit;
     LFiltraDireccionFiltro: TLFLabel;
     EFDireccionFiltro: TLFEditFind2000;
     ETituloDireccionFiltro: TLFEdit;
     LHoras: TLFLabel;
     DBHoras: TLFDbedit;
     DBCBFinalizada: TLFDBCheckBox;
     PNLFiltro: TLFPanel;
     PNLDireccion: TLFPanel;
     LFDBEDireccionKri: TLFDbedit;
     LDireccionKri: TLFLabel;
     LContactoKri: TLFLabel;
     LBLMaestro: TLFLabel;
     LAgenteKri: TLFLabel;
     DBERTitulo: TLFDbedit;
     DBEFMaestro: TLFDBEditFind2000;
     DBEFDireccionKri: TLFDBEditFind2000;
     DBEFContactoKri: TLFDBEditFind2000;
     DBEFAgenteKri: TLFDBEditFind2000;
     DBEContactoKri: TLFDbedit;
     DBEAgenteKri: TLFDbedit;
     LContactoKri2: TLFLabel;
     DBEFContactoKri2: TLFDBEditFind2000;
     DBEContactoKri2: TLFDbedit;
     LContactoKri3: TLFLabel;
     DBEFContactoKri3: TLFDBEditFind2000;
     DBEContactoKri3: TLFDbedit;
     SBAContacto2: TSpeedButton;
     SBAContacto3: TSpeedButton;
     DBEHorasDec: TLFDbedit;
     TSVentas: TTabSheet;
     TBVentas: TLFToolBar;
     NavVentas: THYMNavigator;
     DBGVentas: THYTDBGrid;
     PNLVentasCliente: TLFPanel;
     LVentasCliente: TLFLabel;
     DBEVentasCliente: TLFEditFind2000;
     LFCategoryAction2: TLFCategoryAction;
     ADuplicarIncidencia: TAction;
     DBGVentasDetalle: THYTDBGrid;
     ETituloClientesVentas: TLFEdit;
     PNLVentasDireccion: TLFPanel;
     LVentasDireccion: TLFLabel;
     EFVentasDireccion: TLFEditFind2000;
     EVentasDireccion: TLFEdit;
     LFCategoryAction3: TLFCategoryAction;
     AAdjuntoIncidencia: TAction;
     LDocumento: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AListadoIncidenciasExecute(Sender: TObject);
     procedure DBEFTipoMovBusqueda(Sender: TObject);
     procedure CBTipoChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBEFMaestroExit(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAgenteExecute(Sender: TObject);
     procedure SBAAgenteDblClick(Sender: TObject);
     procedure DBEAgenteKriDblClick(Sender: TObject);
     procedure AContactoExecute(Sender: TObject);
     procedure DBEContactoKriDblClick(Sender: TObject);
     procedure SBAContactoDblClick(Sender: TObject);
     procedure DBEFDireccionKriBusqueda(Sender: TObject);
     procedure DBEFContactoKriBusqueda(Sender: TObject);
     procedure ACodCliProExecute(Sender: TObject);
     procedure SBCodCliProDblClick(Sender: TObject);
     procedure SBDireccionDblClick(Sender: TObject);
     procedure ADireccionExecute(Sender: TObject);
     procedure LFDBEDireccionKriDblClick(Sender: TObject);
     procedure DBERTituloDblClick(Sender: TObject);
     procedure EFMaestroFiltroChange(Sender: TObject);
     procedure EFDireccionFiltroBusqueda(Sender: TObject);
     procedure EFDireccionFiltroChange(Sender: TObject);
     procedure DBEFContactoKriChange(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBGVentasDblClick(Sender: TObject);
     procedure ADuplicarIncidenciaExecute(Sender: TObject);
     procedure DBEVentasClienteChange(Sender: TObject);
     procedure EFVentasDireccionChange(Sender: TObject);
     procedure AAdjuntoIncidenciaExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
     { Private declarations }
     TerceroFiltro: integer;
     procedure HabilitaEnlaces;
  public
     { Public declarations }
     ModoCB: boolean;
     procedure Muestra(Maestro, Tercero: integer; Tipo: smallint; Incidencia: integer; Modo: smallint; DireccionKri: integer = 0);
     procedure CambiaEF(Tipo: smallint);
     procedure TipoForm(Maestro, Tercero: integer; Tipo: smallint; Incidencia: integer; Modo, DireccionKri: smallint);
  end;

var
  FMIncidencias : TFMIncidencias;

implementation

uses UDMIncidencias, UFormGest, UDMMain, UFMain, UUtiles, UEntorno, UParam,
  UFMTerceros, UFMAdjunto, ShellApi, URecibeFicheros, UDMAdjunto, UDameDato;

{$R *.dfm}

procedure TFMIncidencias.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMIncidencias, DMIncidencias);
  if (LeeParametro('MODREST016') = 'S') then
     CBTipo.Items.Add(_('Potenciales'));
  NavMain.DataSource := DMIncidencias.DSQMIncidencias;
  DBGMain.DataSource := DMIncidencias.DSQMIncidencias;
  CEMain.DataSource := DMIncidencias.DSQMIncidencias;
  HabilitaEnlaces;
  TSVentas.TabVisible := (DMMain.EstadoKri(409) = 1);
end;

procedure TFMIncidencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMIncidencias);
end;

procedure TFMIncidencias.Muestra(Maestro, Tercero: integer; Tipo: smallint; Incidencia: integer; Modo: smallint; DireccionKri: integer = 0);
begin
  CambiaEF(Tipo);
  ModoCB := True;
  TipoForm(Maestro, Tercero, Tipo, Incidencia, Modo, DireccionKri);
end;

procedure TFMIncidencias.AListadoIncidenciasExecute(Sender: TObject);
begin
  DMIncidencias.MuestraListado;
end;

procedure TFMIncidencias.DBEFTipoMovBusqueda(Sender: TObject);
begin
  DBEFTipoMov.CondicionBusqueda := 'Tipo in (''PEP'',''ALP'',''FAP'',''PEC'',''ALB'',''FAC'',''OFC'',''FCR'')';
end;

procedure TFMIncidencias.CBTipoChange(Sender: TObject);
begin
  if CBTipo.Text > '' then
     with DMIncidencias do
     begin
        CambiaTipo(CBTipo.ItemIndex);
        LBLMaestro.Caption := CBTipo.Text;
        FiltraMaestro(0, 0, 0);
        CambiaEF(CBTipo.ItemIndex);
        EFMaestroFiltro.Text := '';
        EFDireccionFiltro.Text := '';
     end;
  TSVentas.TabVisible := ((DMMain.EstadoKri(409) = 1) and (CBTipo.Text = _('Cliente')));
end;

procedure TFMIncidencias.CambiaEF(Tipo: smallint);
begin
  with DBEFMaestro do
  begin
     case Tipo of
        1:
        begin
           Tabla_a_Buscar := 'VER_PROVEEDORES_CUENTAS';
           CampoNum := 'PROVEEDOR';
           CampoStr := 'TITULO';
           OrdenadoPor.Text := 'PROVEEDOR';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        2:
        begin
           Tabla_a_Buscar := 'VER_ACREEDORES_CUENTAS';
           CampoNum := 'ACREEDOR';
           CampoStr := 'TITULO';
           OrdenadoPor.Text := 'ACREEDOR';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        3:
        begin
           Tabla_a_Buscar := 'VER_AGENTES_CUENTAS';
           CampoNum := 'AGENTE';
           CampoStr := 'TITULO';
           OrdenadoPor.Text := 'AGENTE';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        0:
        begin
           Tabla_a_Buscar := 'VER_CLIENTES_EF';
           CampoNum := 'CLIENTE';
           CampoStr := 'NOMBRE_COMERCIAL';
           OrdenadoPor.Text := 'CLIENTE';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end
        else
        begin
           Tabla_a_Buscar := 'VER_CLIENTES_POTENCIALES';
           CampoNum := 'CLIENTE';
           CampoStr := 'NOMBRE_COMERCIAL';
           OrdenadoPor.Text := 'CLIENTE';
           Filtros := [obEmpresa];
        end;
     end;
  end;

  with EFMaestroFiltro do
  begin
     case Tipo of
        1:
        begin
           Tabla_a_Buscar := 'VER_PROVEEDORES_CUENTAS';
           CampoNum := 'PROVEEDOR';
           CampoStr := 'TITULO';
           OrdenadoPor.Text := 'PROVEEDOR';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        2:
        begin
           Tabla_a_Buscar := 'VER_ACREEDORES_CUENTAS';
           CampoNum := 'ACREEDOR';
           CampoStr := 'TITULO';
           OrdenadoPor.Text := 'ACREEDOR';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        3:
        begin
           Tabla_a_Buscar := 'VER_AGENTES_CUENTAS';
           CampoNum := 'AGENTE';
           CampoStr := 'TITULO';
           OrdenadoPor.Text := 'AGENTE';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        0:
        begin
           Tabla_a_Buscar := 'VER_CLIENTES_EF';
           CampoNum := 'CLIENTE';
           CampoStr := 'NOMBRE_COMERCIAL';
           OrdenadoPor.Text := 'CLIENTE';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end
        else
        begin
           Tabla_a_Buscar := 'VER_CLIENTES_POTENCIALES';
           CampoNum := 'CLIENTE';
           CampoStr := 'NOMBRE_COMERCIAL';
           OrdenadoPor.Text := 'CLIENTE';
           Filtros := [obEmpresa];
        end;
     end;
  end;
end;

procedure TFMIncidencias.TipoForm(Maestro, Tercero: integer; Tipo: smallint; Incidencia: integer; Modo, DireccionKri: smallint);
begin
  { dji lrk kri - 090331 - Iberfluid no lo quiere asi
  if Modo = 1 then
    EPMain.VisibleButtons := [neSalir]
  else
    EPMain.VisibleButtons := [neRango, neSalir];
}
  with DMIncidencias do
  begin
     CodCliPro := Maestro;
     // Ter  := Tercero;
     ModoForm := Modo;
     CambiaTipo(Tipo);
     FiltraMaestro(Incidencia, Maestro, DireccionKri);
  end;

  { dji lrk kri - 090331 - Iberfluid no lo quiere asi
  with DBEFMaestro do
  begin
    Enabled  := Modo = 0;
    ReadOnly := Modo = 1;
    if Modo = 0 then
    begin
      Font.Color := clWindowText;
      Color      := clWindow;
    end
    else
    begin
      Font.Color := clGrayText;
      Color      := clInfoBk;
    end;
  end;}

  { dji lrk kri - 090331 - Iberfluid no lo quiere asi
  with NavMain do
  begin
    if Modo = 0 then
      EditaControl := DBEFMaestro
    else
      EditaControl := LFDbTitIncidencia;
    InsertaControl := EditaControl;
  end;}

  { dji lrk kri - 090331 - Iberfluid no lo quiere asi
  with CBTipo do
  begin
    Enabled := Modo = 0;
    if Modo = 0 then
    begin
      Font.Color := clWindowText;
      Color      := clWindow;
      Style      := csDropDownList;
    end
    else
    begin
      Font.Color := clGrayText;
      Color      := clInfoBk;
      Style      := csSimple;
    end;
    ItemIndex := Tipo;
  end;}

  CBTipo.ItemIndex := Tipo;
  LBLMaestro.Caption := CBTipo.Text;
end;

procedure TFMIncidencias.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  EFMaestroFiltro.Text := '';
  EFDireccionFiltro.Text := '';
  DMIncidencias.BusquedaCompleja;
end;

procedure TFMIncidencias.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMIncidencias.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  { dji lrk kri - 090331 - Iberfluid no lo quiere asi
  CBTipo.Enabled := ModoCB;}
end;

procedure TFMIncidencias.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  ModoCB := CBTipo.Enabled;
end;

procedure TFMIncidencias.DBEFMaestroExit(Sender: TObject);
var
  tipo : string;
begin
  inherited;
  if (CBTipo.Text = _('Cliente')) then
     tipo := 'CLI';
  if (CBTipo.Text = _('Proveedor')) then
     tipo := 'PRO';
  if (CBTipo.Text = _('Acreedor')) then
     tipo := 'ACR';
  if (CBTipo.Text = _('Agente')) then
     tipo := 'AGE';
  if (CBTipo.Text = _('Potenciales')) then
     tipo := 'POT';
end;

procedure TFMIncidencias.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMIncidencias.DBEFDireccionKriBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccionKri.CondicionBusqueda := 'TERCERO=' + IntToStr(DMIncidencias.QMIncidenciasTERCERO.AsInteger);
end;

procedure TFMIncidencias.DBEFContactoKriBusqueda(Sender: TObject);
begin
  inherited;
  with DMIncidencias do
  begin
     if (QMIncidenciasDIRECCION.AsInteger <> 0) then
        TLFDBEditFind2000(Sender).CondicionBusqueda := 'TERCERO=' + IntToStr(QMIncidenciasTERCERO.AsInteger) + ' AND DIRECCION=' + IntToStr(QMIncidenciasDIRECCION.AsInteger)
     else
        TLFDBEditFind2000(Sender).CondicionBusqueda := 'TERCERO=' + IntToStr(QMIncidenciasTERCERO.AsInteger);
  end;
end;

procedure TFMIncidencias.HabilitaEnlaces;
begin
  SolapaControles(SBAAgente, DBEAgenteKri);
  DBEAgenteKri.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAContacto, DBEContactoKri);
  SolapaControles(SBAContacto2, DBEContactoKri2);
  SolapaControles(SBAContacto3, DBEContactoKri3);
  DBEContactoKri.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBCodCliPro, DBERTitulo);
  DBERTitulo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBDireccion, LFDBEDireccionKri);
  LFDBEDireccionKri.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMIncidencias.AAgenteExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
     FMain.EjecutaAccion(FMain.AAgentes, 'Agente=' +
        IntToStr(DMIncidencias.QMIncidenciasAGENTE.AsInteger) + ' and Ejercicio=' + REntorno.EjercicioStr);
end;

procedure TFMIncidencias.SBAAgenteDblClick(Sender: TObject);
begin
  inherited;
  AAgente.Execute;
end;

procedure TFMIncidencias.DBEAgenteKriDblClick(Sender: TObject);
begin
  inherited;
  AAgente.Execute;
end;

procedure TFMIncidencias.AContactoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + IntToStr(DMIncidencias.QMIncidenciasTERCERO.AsInteger));
  if (Sender is TLFDBEditFind2000) then
     FMTerceros.PosicionaContacto(TLFDBEditFind2000(Sender).Tag)
  else
  if (Sender is TSpeedButton) then
     FMTerceros.PosicionaContacto(TSpeedButton(Sender).Tag);
end;

procedure TFMIncidencias.DBEContactoKriDblClick(Sender: TObject);
begin
  inherited;
  AContactoExecute(Sender);
end;

procedure TFMIncidencias.SBAContactoDblClick(Sender: TObject);
begin
  inherited;
  AContactoExecute(Sender);
end;

procedure TFMIncidencias.ACodCliProExecute(Sender: TObject);
begin
  inherited;
  case CBTipo.ItemIndex of
     1:
     begin
        FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + IntToStr(DMIncidencias.QMIncidenciasCOD_CLI_PRO.AsInteger));
     end;
     2:
     begin
        FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR = ' + IntToStr(DMIncidencias.QMIncidenciasCOD_CLI_PRO.AsInteger));
     end;
     3:
     begin
        FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' + IntToStr(DMIncidencias.QMIncidenciasCOD_CLI_PRO.AsInteger));
     end;
     0:
     begin
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMIncidencias.QMIncidenciasCOD_CLI_PRO.AsInteger));
     end
     else
     begin
        FMain.EjecutaAccion(FMain.AClientesPotencialesKri, 'CLIENTE = ' + IntToStr(DMIncidencias.QMIncidenciasCOD_CLI_PRO.AsInteger));
     end;
  end;
end;

procedure TFMIncidencias.SBCodCliProDblClick(Sender: TObject);
begin
  inherited;
  ACodCliPro.Execute;
end;

procedure TFMIncidencias.SBDireccionDblClick(Sender: TObject);
begin
  inherited;
  ADireccion.Execute;
end;

procedure TFMIncidencias.ADireccionExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + IntToStr(DMIncidencias.QMIncidenciasTERCERO.AsInteger));
  FMTerceros.PosicionaDireccion(DMIncidencias.QMIncidenciasDIRECCION.AsInteger);
end;

procedure TFMIncidencias.LFDBEDireccionKriDblClick(Sender: TObject);
begin
  inherited;
  ADireccion.Execute;
end;

procedure TFMIncidencias.DBERTituloDblClick(Sender: TObject);
begin
  inherited;
  ACodCliPro.Execute;
end;

procedure TFMIncidencias.EFMaestroFiltroChange(Sender: TObject);
begin
  inherited;
  DMIncidencias.FiltraMaestro(0, StrToIntDef(EFMaestroFiltro.Text, 0), StrToIntDef(EFDireccionFiltro.Text, 0));
  case CBTipo.ItemIndex of
     0: TerceroFiltro := DameTercero('CLI', StrToIntDef(EFMaestroFiltro.Text, 0));
     1: TerceroFiltro := DameTercero('PRO', StrToIntDef(EFMaestroFiltro.Text, 0));
     2: TerceroFiltro := DameTercero('ACR', StrToIntDef(EFMaestroFiltro.Text, 0));
     3: TerceroFiltro := DameTercero('AGE', StrToIntDef(EFMaestroFiltro.Text, 0));
     4: TerceroFiltro := DameTercero('POT', StrToIntDef(EFMaestroFiltro.Text, 0));
  end;
  ETituloMaestroFiltro.Text := DameTituloTercero(TerceroFiltro);
end;

procedure TFMIncidencias.EFDireccionFiltroBusqueda(Sender: TObject);
begin
  inherited;
  EFDireccionFiltro.CondicionBusqueda := 'TERCERO=' + IntToStr(TerceroFiltro);
end;

procedure TFMIncidencias.EFDireccionFiltroChange(Sender: TObject);
begin
  inherited;
  DMIncidencias.FiltraMaestro(0, StrToIntDef(EFMaestroFiltro.Text, 0), StrToIntDef(EFDireccionFiltro.Text, 0));
  ETituloDireccionFiltro.Text := DameDireccionTercero(TerceroFiltro, StrToIntDef(EFDireccionFiltro.Text, 0));
end;

procedure TFMIncidencias.DBEFContactoKriChange(Sender: TObject);
begin
  inherited;
  // Utilizo el Tag para enviar el numero de contacto al Action
  if (Sender = DBEFContactoKri) then
  begin
     DBEContactoKri.Tag := StrToIntDef(TLFDBEditFind2000(Sender).Text, 0);
     SBAContacto.Tag := StrToIntDef(TLFDBEditFind2000(Sender).Text, 0);
  end;

  if (Sender = DBEFContactoKri2) then
  begin
     DBEContactoKri2.Tag := StrToIntDef(TLFDBEditFind2000(Sender).Text, 0);
     SBAContacto2.Tag := StrToIntDef(TLFDBEditFind2000(Sender).Text, 0);
  end;

  if (Sender = DBEFContactoKri3) then
  begin
     DBEContactoKri3.Tag := StrToIntDef(TLFDBEditFind2000(Sender).Text, 0);
     SBAContacto3.Tag := StrToIntDef(TLFDBEditFind2000(Sender).Text, 0);
  end;
end;

procedure TFMIncidencias.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSVentas) then
  begin
     DBEVentasCliente.Text := DBEFMaestro.Text;
     EFVentasDireccion.Text := DBEFDireccionKri.Text;
     DMIncidencias.AbreVentas(StrToIntDef(DBEVentasCliente.Text, 0), StrToIntDef(EFVentasDireccion.Text, 0));
  end
  else
     DMIncidencias.CierraVentas;
end;

procedure TFMIncidencias.DBGVentasDblClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraDocumento(DMIncidencias.xVentasEJERCICIO.AsInteger,
     DMIncidencias.xVentasTIPO.AsString,
     DMIncidencias.xVentasSERIE.AsString,
     DMIncidencias.xVentasRIG.AsInteger);
end;

procedure TFMIncidencias.ADuplicarIncidenciaExecute(Sender: TObject);
begin
  inherited;
  DMIncidencias.DuplicarIncidencia;
end;

procedure TFMIncidencias.DBEVentasClienteChange(Sender: TObject);
begin
  inherited;
  ETituloClientesVentas.Text := DameTituloCliente(StrToIntDef(DBEVentasCliente.Text, 0));
  EFVentasDireccion.Text := '';
  EFVentasDireccion.CondicionBusqueda := 'TERCERO=' + IntToStr(DameTercero('CLI', StrToIntDef(DBEVentasCliente.Text, 0)));
  DMIncidencias.CierraVentas;
  DMIncidencias.AbreVentas(StrToIntDef(DBEVentasCliente.Text, 0), StrToIntDef(EFVentasDireccion.Text, 0));
end;

procedure TFMIncidencias.EFVentasDireccionChange(Sender: TObject);
begin
  inherited;
  EVentasDireccion.Text := DameDireccionTercero(DameTercero('CLI', StrToIntDef(DBEVentasCliente.Text, 0)), StrToIntDef(EFVentasDireccion.Text, 0));
  DMIncidencias.CierraVentas;
  DMIncidencias.AbreVentas(StrToIntDef(DBEVentasCliente.Text, 0), StrToIntDef(EFVentasDireccion.Text, 0));
end;

procedure TFMIncidencias.AAdjuntoIncidenciaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('INC', DMIncidencias.QMIncidenciasINCIDENCIA.AsInteger);
end;

procedure TFMIncidencias.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('INC', DMIncidencias.QMIncidenciasINCIDENCIA.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoIncidencia.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

end.
