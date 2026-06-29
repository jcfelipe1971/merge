unit UFMDatosTecnicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, {Placemnt,} ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  RXDBCtrl, ULFDBDateEdit, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, Buttons, UEntorno, UUtiles, ULFDBMemo, rxToolEdit,
  rxPlacemnt;

type
  TFMDatosTecnicos = class(TFPEdit)
     LblAncho: TLabel;
     LblMaterial: TLabel;
     Label8: TLabel;
     LFDBOT: TLFDbedit;
     LFLabel1: TLFLabel;
     LFDBId: TLFDbedit;
     Label1: TLabel;
     LFDBResponsable: TLFDbedit;
     LFLabel2: TLFLabel;
     LFDBTensionVoltaje: TLFDbedit;
     LFDBLugarEntrega: TLFDbedit;
     Label2: TLabel;
     Label3: TLabel;
     LFDBPedido: TLFDbedit;
     LFLabel3: TLFLabel;
     Label4: TLabel;
     Label5: TLabel;
     LFDBOferta: TLFDbedit;
     LFDBDFecha: TLFDBDateEdit;
     LFDBDFechaPedido: TLFDBDateEdit;
     LFDBDFechaOferta: TLFDBDateEdit;
     LFLabel4: TLFLabel;
     Label6: TLabel;
     LFDBTaller: TLFDbedit;
     LFLabel5: TLFLabel;
     LFDBPresupTaller: TLFDbedit;
     Label7: TLabel;
     LFDBDFechaPlanos: TLFDBDateEdit;
     LFDBDFechaEquipo: TLFDBDateEdit;
     LFLabel6: TLFLabel;
     Label9: TLabel;
     LFDEquipo: TLFDbedit;
     LFLabel8: TLFLabel;
     LFDTaller1: TLFDbedit;
     LFDTamano: TLFDbedit;
     LFLabel10: TLFLabel;
     Label10: TLabel;
     LFLabel11: TLFLabel;
     LFDBTurbina: TLFDbedit;
     LFDBuje: TLFDbedit;
     LFDGiro: TLFDbedit;
     LFDBcbAcero: TLFDBCheckBox;
     LFDBCBINOX304: TLFDBCheckBox;
     LFDBCBCreusabro4000: TLFDBCheckBox;
     LFDBCBINOX316: TLFDBCheckBox;
     LFDBCheckBox1: TLFDBCheckBox;
     LFDBCheckBox2: TLFDBCheckBox;
     LFLabel7: TLFLabel;
     Label11: TLabel;
     LFDBRALGeneral: TLFDbedit;
     LFDBRALProteccion: TLFDbedit;
     LFLabel9: TLFLabel;
     LFLabel12: TLFLabel;
     Label12: TLabel;
     LFLabel13: TLFLabel;
     LFLabel14: TLFLabel;
     Label13: TLabel;
     LFLabel15: TLFLabel;
     LFDBPotMotor: TLFDbedit;
     LFDBPresVent: TLFDbedit;
     LFDBCaudal: TLFDbedit;
     LFDBPosicion: TLFDbedit;
     LFDBAno: TLFDbedit;
     LFDBNumFab: TLFDbedit;
     LFDBPotMotorr: TLFDbedit;
     LFLabel16: TLFLabel;
     LFLabel17: TLFLabel;
     LFDBQBomba: TLFDbedit;
     LFDBPresBomba: TLFDbedit;
     Label14: TLabel;
     LFLabel18: TLFLabel;
     LFDBPotBomba: TLFDbedit;
     LFDBCapacidad: TLFDbedit;
     LFLabel19: TLFLabel;
     Label15: TLabel;
     LFDBSupFilt: TLFDbedit;
     LFDBTipoPlaca: TLFDbedit;
     LFLabel20: TLFLabel;
     GBAccesorios: TGroupBox;
     LFDBCheckBox3: TLFDBCheckBox;
     LFDBCheckBox4: TLFDBCheckBox;
     LFDBCheckBox5: TLFDBCheckBox;
     LFDBCheckBox6: TLFDBCheckBox;
     LFDBCheckBox7: TLFDBCheckBox;
     LFDBCheckBox8: TLFDBCheckBox;
     LFDBCheckBox9: TLFDBCheckBox;
     GroupBox2: TGroupBox;
     LFLabel21: TLFLabel;
     Label16: TLabel;
     LFDBProhibFumGrande: TLFDbedit;
     LFLabel22: TLFLabel;
     LFDBParoSeguridad: TLFDbedit;
     LFLabel23: TLFLabel;
     Label17: TLabel;
     LFLabel24: TLFLabel;
     LFDBProhibFumarMediano: TLFDbedit;
     LFDBParado: TLFDbedit;
     LFDBRecta: TLFDbedit;
     LFLabel25: TLFLabel;
     Label18: TLabel;
     LFDBFuncionamiento: TLFDbedit;
     LFDBRetroceso: TLFDbedit;
     Label19: TLabel;
     LFDBEngrasarLimpiar: TLFDbedit;
     LFDBAtrapamiento: TLFDbedit;
     LFDBMaquinaria: TLFDbedit;
     Label20: TLabel;
     LFLabel26: TLFLabel;
     LFDBPeligro: TLFDbedit;
     LFLabel27: TLFLabel;
     LFDBMascara: TLFDbedit;
     Label21: TLabel;
     LFDBGafas: TLFDbedit;
     LFDBCurvada: TLFDbedit;
     Label22: TLabel;
     LFLabel28: TLFLabel;
     LFDBHandteP: TLFDbedit;
     Label23: TLabel;
     LFLabel29: TLFLabel;
     LFDBHandteG: TLFDbedit;
     LFDBProyecto: TLFDbedit;
     Label24: TLabel;
     Label25: TLabel;
     LFDBCalderin: TLFDbedit;
     ALstDatosTecnicos: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFDbAplicacion: TLFDbedit;
     LFDBProhibidoFumPequeno: TLFDbedit;
     LFDBIdOrden: TLFDBEditFind2000;
     SBAIdOrden: TSpeedButton;
     ALDatosTecnicos: TLFActionList;
     LFCategoryAction2: TLFCategoryAction;
     AOrden: TAction;
     GBObservaciones: TGroupBox;
     LFDBObserv: TLFDBMemo;
     SBAIdPedido: TSpeedButton;
     APedido: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AConfigListado: TAction;
     PNLDatos: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ALstDatosTecnicosExecute(Sender: TObject);
     procedure AOrdenExecute(Sender: TObject);
     procedure SBAIdOrdenDblClick(Sender: TObject);
     procedure APedidoExecute(Sender: TObject);
     procedure SBAIdPedidoDblClick(Sender: TObject);
     procedure AConfigListadoExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMDatosTecnicos : TFMDatosTecnicos;

implementation

uses UDMDatosTecnicos, UFormGest, UDMLstDatosTecnicos, UDMMain, UFMain, UFMListConfig;

{$R *.dfm}

procedure TFMDatosTecnicos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMDatosTecnicos, DMDatosTecnicos);

  NavMain.DataSource := DMDatosTecnicos.DSQMDatosTecnicos;
  DBGMain.DataSource := DMDatosTecnicos.DSQMDatosTecnicos;
  G2KTableLoc.DataSource := DMDatosTecnicos.DSQMDatosTecnicos;

  LFDBIdOrden.Color := REntorno.ColorEnlaceActivo;
  LFDBPedido.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAIdOrden, LFDBIdOrden);
  SolapaControles(SBAIdPedido, LFDBPedido);
end;

procedure TFMDatosTecnicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDatosTecnicos);
end;

procedure TFMDatosTecnicos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMDatosTecnicos.BusquedaCompleja;
end;

procedure TFMDatosTecnicos.AOrdenExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProOrden, DMDatosTecnicos.QMDatosTecnicosID_ORDEN.AsString);
end;

procedure TFMDatosTecnicos.SBAIdOrdenDblClick(Sender: TObject);
begin
  inherited;
  with DMDatosTecnicos.xExisteOF do
  begin
     Close;
     Open;

     if (FieldByName('COUNT').AsInteger <> 0) then
        AOrden.Execute;
  end;
end;

procedure TFMDatosTecnicos.APedidoExecute(Sender: TObject);
var
  Year, Month, Day : word;
begin
  inherited;
  //sfg.albert - Es busca la data de la comanda per saber sobre quin any
  //s'ha de buscar la comanda

  DecodeDate(DMDatosTecnicos.xDadesOPFECHA_PED.AsDateTime, Year, Month, Day);

  if (Year = REntorno.Ejercicio) then
     FMain.MuestraDocumento(REntorno.Ejercicio, 'PEC', REntorno.Serie, DMDatosTecnicos.xDadesOPPEDIDO.AsInteger)
  else
     FMain.MuestraDocumento(Year, 'PEC', REntorno.Serie, DMDatosTecnicos.xDadesOPPEDIDO.AsInteger);
end;

procedure TFMDatosTecnicos.SBAIdPedidoDblClick(Sender: TObject);
begin
  inherited;
  if (DMDatosTecnicos.xDadesOPPEDIDO.AsInteger <> 0) then
     APedido.Execute;
end;

procedure TFMDatosTecnicos.ALstDatosTecnicosExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstdatosTecnicos, DMLstDatosTecnicos);
  try
     DMLstDatosTecnicos.MostrarListado(DMDatosTecnicos.QMDatosTecnicosID.AsInteger
        , DMDatosTecnicos.QMDatosTecnicosEMPRESA.AsInteger, 0);
  finally
     CierraData(DMLstDatosTecnicos);
  end;
end;

procedure TFMDatosTecnicos.AConfigListadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstdatosTecnicos, DMLstDatosTecnicos);

  { TODO : Pasar a otro grupo. Se pisa con produccion. }
  {        Tenerlo en cuenta para DMLstDatosTecnicos.MostrarListado() }

  TFMListConfig.Create(Self).Muestra(9000, Formato, Cabecera, Copias,
     Pijama, '', DMLstDatosTecnicos.frDatosTecnicos);
  CierraData(DMLstDatosTecnicos);
end;

end.
