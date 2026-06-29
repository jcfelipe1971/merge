unit UFMEmpleados;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFDBEditFind2000,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFLabel, UG2kTBLoc, ULFDBDateEdit, ULFEdit;

type
  TFMEmpleados = class(TFPEdit)
     DBETercero: TLFDBEditFind2000;
     ETituloTercero: TLFEdit;
     DBEImporte: TLFDbedit;
     LBLImporte: TLFLabel;
     LBLTercero: TLFLabel;
     LBLFecha: TLFLabel;
     LBLRetencion: TLFLabel;
     DBERetencion: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     LBLRetencionEsp: TLFLabel;
     DBERetencionEs: TLFDbedit;
     LblImporteEspecie: TLFLabel;
     DBEIMporteEsp: TLFDbedit;
     AInfoTercero: TAction;
     DBEDietas: TLFDbedit;
     LDietas: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AInfoTerceroExecute(Sender: TObject);
     procedure DBETerceroChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEmpleados : TFMEmpleados;

implementation

uses UDMEmpleados, UDMMain, UFormGest, UFMain, UDameDato;

{$R *.DFM}

procedure TFMEmpleados.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEmpleados, DMEmpleados);
  NavMain.DataSource := DMEmpleados.DSQMEmpleados;
  EPMain.DataSource := DMEmpleados.DSQMEmpleados;
  DBGMain.DataSource := DMEmpleados.DSQMEmpleados;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMEmpleados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMEmpleados);
end;

procedure TFMEmpleados.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMEmpleados.BusquedaCompleja;
end;

procedure TFMEmpleados.AInfoTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraInfoTercero(StrToIntDef(DBETercero.Text, 0));
end;

procedure TFMEmpleados.DBETerceroChange(Sender: TObject);
begin
  inherited;
  ETituloTercero.Text := DameTituloTercero(StrToIntDef(DBETercero.Text, 0));
end;

end.
