unit UFMDatosFactRectificacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ExtCtrls, StdCtrls, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFPanel,
  ULFToolBar, Mask, DBCtrls, ULFDBEdit, ULFEdit, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel;

type
  TFMDatosFactRectificacion = class(TFPEditSinNavegador)
     LFEFEjercicio: TLFEditFind2000;
     LFEFSerie: TLFEditFind2000;
     LFEFRig: TLFEditFind2000;
     LEjercicio: TLFLabel;
     LSerie: TLFLabel;
     LRig: TLFLabel;
     GBMain: TGroupBox;
     TButtAceptar: TToolButton;
     LFEDCliente: TLFDbedit;
     LFEDTitCliente: TLFDbedit;
     LFMaestro: TLFLabel;
     LBaseImponible: TLFLabel;
     LFEDBase: TLFDbedit;
     LFEDIVA: TLFDbedit;
     LIVA: TLFLabel;
     LFEDRecargo: TLFDbedit;
     LRecargo: TLFLabel;
     LFEDLiquido: TLFDbedit;
     LLiquido: TLFLabel;
     LTotal: TLFLabel;
     LFEDMoneda: TLFDbedit;
     LMoneda: TLFLabel;
     LFEDTitMoneda: TLFDbedit;
     LFEDTotal: TLFDbedit;
     ETituloSerie: TLFEdit;
     procedure LFEFRigBusqueda(Sender: TObject);
     procedure LFEFSerieChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFEFEjercicioChange(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure LFEFRigChange(Sender: TObject);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     Ejercicio, Rig, IdDoc: integer;
     Serie: string;
     Tipo: string;
     procedure PasaTipo(TipoFac: string);
  end;

var
  FMDatosFactRectificacion : TFMDatosFactRectificacion;

implementation

uses UDMMain, UEntorno, UDMDatosFactRectificacion, UDameDato;

{$R *.dfm}

procedure TFMDatosFactRectificacion.LFEFRigBusqueda(Sender: TObject);
begin
  LFEFRig.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ' +
     'EJERCICIO=' + LFEFEjercicio.Text + ' AND ' +
     'CANAL=' + REntorno.CanalStr + ' AND ' +
     'SERIE=''' + LFEFSerie.Text + '''' + ' AND ' +
     'TIPO=''' + Tipo + ''' AND ESTADO > 4';
end;

procedure TFMDatosFactRectificacion.LFEFSerieChange(Sender: TObject);
begin
  LFEFRig.Text := '';
  if (LFEFSerie.Text <> '') then
     ETituloSerie.Text := DameTituloSerie(LFEFSerie.Text);
end;

procedure TFMDatosFactRectificacion.FormCreate(Sender: TObject);
begin
  AbreData(TDMDatosFactRectificacion, DMDatosFactRectificacion);

  IdDoc := 0;
  Ejercicio := 0;
  Rig := 0;
  Serie := '';
end;

procedure TFMDatosFactRectificacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMDatosFactRectificacion);
end;

procedure TFMDatosFactRectificacion.LFEFEjercicioChange(Sender: TObject);
begin
  LFEFSerie.Text := '';
  LFEFRig.Text := '';
end;

procedure TFMDatosFactRectificacion.TButtAceptarClick(Sender: TObject);
begin
  // Controlar datos
  IdDoc := DMDatosFactRectificacion.xDatosFacID_DOC.AsInteger;
  Ejercicio := StrToIntDef(LFEFEjercicio.Text, 0);
  Rig := StrToIntDef(LFEFRig.Text, 0);
  Serie := LFEFSerie.Text;

  Close;
  ModalResult := mrOk;
end;

procedure TFMDatosFactRectificacion.LFEFRigChange(Sender: TObject);
begin
  if (LFEFRig.Text <> '') then
     DMDatosFactRectificacion.DatosFactura(StrToIntDef(LFEFEjercicio.Text, 0), StrToIntDef(LFEFRig.Text, 0), LFEFSerie.Text, Tipo);
end;

procedure TFMDatosFactRectificacion.PasaTipo(TipoFac: string);
begin
  Tipo := TipoFac;

  // Cambio de Vista para la busqueda segun tipo.
  if (Tipo = 'FAC') then
  begin
     LFEFRig.Tabla_a_buscar := 'VER_FACTURAS_CLIENTE';
     LFMaestro.Caption := _('Cliente');
  end;

  if (Tipo = 'FCR') then
  begin
     LFEFRig.Tabla_a_buscar := 'VER_FACTURAS_ACREEDOR';
     LFMaestro.Caption := _('Acr.');
  end;

  if (Tipo = 'FAP') then
  begin
     LFEFRig.Tabla_a_buscar := 'VER_FACTURAS_PROVEEDOR';
     LFMaestro.Caption := _('Prov.');
  end;
end;

procedure TFMDatosFactRectificacion.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  ModalResult := mrCancel;
  inherited;
end;

end.
