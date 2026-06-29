unit UIsoFMCapacitacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEditFind2000, ULFDBEdit, UG2kTBLoc, Buttons, ULFLabel;

type
  TIsoFMCapacitacion = class(TFPEdit)
     LEmpleado: TLFLabel;
     LSeccion: TLFLabel;
     LCapacitacion: TLFLabel;
     DBETotalCapac: TLFDbedit;
     LTotReal: TLFLabel;
     DBETotalReal: TLFDbedit;
     LTotPosible: TLFLabel;
     DBETotalPosible: TLFDbedit;
     DBEFEmpleado: TLFDBEditFind2000;
     DBEDesEmpleado: TLFDbedit;
     PDetalle: TLFPanel;
     DBEDescSeccion: TLFDbedit;
     DBEFSeccion: TLFDBEditFind2000;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     TBDetalle: TLFToolBar;
     NavDet: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     SBAEmpleado: TSpeedButton;
     SBASeccion: TSpeedButton;
     ALCapacitacion: TLFActionList;
     AEmpleado: TAction;
     ASeccion: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure InformedeNoconformidad1Click(Sender: TObject);
     procedure SBAEmpleadoDblClick(Sender: TObject);
     procedure SBASeccionDblClick(Sender: TObject);
     procedure AEmpleadoExecute(Sender: TObject);
     procedure ASeccionExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFEmpleadoBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMCapacitacion : TIsoFMCapacitacion;

implementation

{$R *.DFM}

uses UDMMain, UIsoDMCapacitacion, UFormGest, UUtiles, UEntorno,
  UDMListados, UFMain;

procedure TIsoFMCapacitacion.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TIsoDMCapacitacion, IsoDMCapacitacion);
  NavMain.DataSource := IsoDMCapacitacion.DSQMIsoCapacitacionC;
  EPMain.DataSource := IsoDMCapacitacion.DSQMIsoCapacitacionC;
  DBGMain.DataSource := IsoDMCapacitacion.DSQMIsoCapacitacionC;
  NavDet.DataSource := IsoDMCapacitacion.DSQMIsoCapacitacionD;
  DBGFDetalle.DataSource := IsoDMCapacitacion.DSQMIsoCapacitacionD;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  DBEDesEmpleado.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEmpleado, DBEDesEmpleado);

  DBEDescSeccion.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBASeccion, DBEDescSeccion);
end;

procedure TIsoFMCapacitacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(IsoDMCapacitacion);
end;

procedure TIsoFMCapacitacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMCapacitacion.BusquedaCompleja;
end;

procedure TIsoFMCapacitacion.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  DBGFDetalle.CondicionBusqueda :=
     'Seccion=''' + IsoDMCapacitacion.QMIsoCapacitacionCSECCION.AsString + '''';
end;

procedure TIsoFMCapacitacion.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TIsoFMCapacitacion.InformedeNoconformidad1Click(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8019, 0, '', str, IsoDMCapacitacion.frIsoCapacitacion, nil);
end;

procedure TIsoFMCapacitacion.SBAEmpleadoDblClick(Sender: TObject);
begin
  inherited;
  AEmpleado.Execute;
end;

procedure TIsoFMCapacitacion.SBASeccionDblClick(Sender: TObject);
begin
  inherited;
  ASeccion.Execute;
end;

procedure TIsoFMCapacitacion.AEmpleadoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeEmpleados, 'empleado = ' +
     IntToStr(IsoDMCapacitacion.QMIsoCapacitacionCEMPLEADO.AsInteger));
end;

procedure TIsoFMCapacitacion.ASeccionExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeSecciones, 'seccion = ''' +
     IsoDMCapacitacion.QMIsoCapacitacionCSECCION.AsString + '''');
end;

procedure TIsoFMCapacitacion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMCapacitacion.DBEFEmpleadoBusqueda(Sender: TObject);
begin
  inherited;
  // TLFDBEditFind2000(Sender).CondicionBusqueda := 'BAJA=0';
end;

end.
