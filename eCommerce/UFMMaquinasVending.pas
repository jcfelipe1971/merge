unit UFMMaquinasVending;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, NsDBGrid,
  ULFPageControl, ULFToolBar, ULFPanel, ULFEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFDBEdit, UG2kTBLoc, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMMaquinasVending = class(TFPEdit)
     LMaquina: TLFLabel;
     DBEMaquina: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBCBActivo: TLFDBCheckBox;
     LCLiente: TLFLabel;
     ECliente: TLFEdit;
     DBEFCliente: TLFDBEditFind2000;
     LParamCliente: TLFLabel;
     DBEParamCliente: TLFDbedit;
     LParamMaquina: TLFLabel;
     DBEParamMaquina: TLFDbedit;
     LParamUbicacion: TLFLabel;
     DBEParamUbicacion: TLFDbedit;
     LNotaUbicacion: TLFLabel;
     LParamDominio: TLFLabel;
     DBEParamDominio: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFClienteChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMaquinasVending : TFMMaquinasVending;

implementation

{$R *.DFM}

uses UDMMain, UDMMaquinasVending, UFormGest, UFMain, UDameDato;

procedure TFMMaquinasVending.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMaquinasVending, DMMaquinasVending);

  NavMain.DataSource := DMMaquinasVending.DSQMMaquinas;
  EPMain.DataSource := DMMaquinasVending.DSQMMaquinas;
  DBGMain.DataSource := DMMaquinasVending.DSQMMaquinas;
  G2kTableLoc.DataSource := DMMaquinasVending.DSQMMaquinas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMMaquinasVending.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMaquinasVending);
end;

procedure TFMMaquinasVending.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMMaquinasVending.BusquedaCompleja;
end;

procedure TFMMaquinasVending.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMMaquinasVending.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  ECliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0));
end;

end.
