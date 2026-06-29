unit UFMAnticipos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls,
  DBCtrls, UDBDateTimePicker, Mask, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl,
  ULFComboBox, ULFEdit, ULFDBEditFind2000, ULFDBEdit, ULFDBCheckBox,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc,
  DbComboBoxValue, Buttons, ULFDBDateEdit;

type
  TFMAnticipos = class(TFPEdit)
     CtaContrapartida: TLFLabel;
     LBLCliente: TLFLabel;
     LBLFecha: TLFLabel;
     LBLAnticipo: TLFLabel;
     DBCAntidad: TLFDbedit;
     DBEFCliente: TLFDBEditFind2000;
     DBEFCta: TLFDBEditFind2000;
     CBTipo: TLFComboBox;
     DBEDescCta: TLFDbedit;
     DBEDescCliente: TLFDbedit;
     LCantidadAnticipo: TLFLabel;
     DBEAnticipo: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     ToolButton1: TToolButton;
     LBLAsiento: TLFLabel;
     DBEAsiento: TLFDbedit;
     LBLSaldo: TLFLabel;
     LTipoAsientoKri: TLFLabel;
     DBEFTipoAsientoKri: TLFDBEditFind2000;
     AContabAnticipo: TAction;
     LFCategoryAction1: TLFCategoryAction;
     DBCBEstado: TDBComboBoxValue;
     SBVerAsientos: TSpeedButton;
     DBESaldo: TLFDbedit;
     DBCBCreaCarteraNegativa: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure CBTipoChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFCtaVerificacion(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFTipoAsientoKriExiste(Sender: TObject);
     procedure AContabAnticipoExecute(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure SBVerAsientosDblClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     procedure Filtra;
     procedure AsientoColor;
  public
     { Public declarations }
  end;

var
  FMAnticipos : TFMAnticipos;

implementation

uses UDMAnticipos, UDMMain, UEntorno, UUtiles, UFMain;

{$R *.DFM}

procedure TFMAnticipos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAnticipos, DMAnticipos);
  NavMain.DataSource := DMAnticipos.DSQMAnticipos;
  DBGMain.DataSource := DMAnticipos.DSQMAnticipos;

  DBEFTipoAsientoKri.Text := REntorno.Asiento_ANT;
  CBTipo.ItemIndex := 0;
  CBTipoChange(nil);
  DBEFCta.MaxLength := REntorno.DigitosSub;
  FMain.AddComponentePunto(DBEFCta);
  AsientoColor;
  DBEAsiento.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMAnticipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(DBEFCta);
  CierraData(DMAnticipos);
end;

procedure TFMAnticipos.CBTipoChange(Sender: TObject);
var
  Tipo : string;
begin
  Tipo := 'CLI';
  case CBTipo.ItemIndex of
     1: Tipo := 'PRO';
     2: Tipo := 'ACR';
  end;
  Filtra;
  DMAnticipos.Filtra(Tipo);
  AsientoColor;
end;

procedure TFMAnticipos.Filtra;
begin
  case CBTipo.ItemIndex of
     0:
     begin
        DBEFCliente.Tabla_a_buscar := 'VER_CLIENTES_EF';
        DBEFCliente.CampoNum := 'CLIENTE';
        DBEFCliente.OrdenadoPor.Text := 'CLIENTE';
        DBEDescCliente.DataSource := DMAnticipos.DSxClientes;
        LBLCliente.Caption := _('Cliente');
        DBGMain.FindColumn('COD_CLI_PRO').Title.Caption := _('Cliente');
        G2KTableLoc.CondicionBusqueda := 'TIPO_TERCERO = ''CLI''';
     end;
     1:
     begin
        DBEFCliente.Tabla_a_buscar := 'VER_PROVEEDORES';
        DBEFCliente.CampoNum := 'PROVEEDOR';
        DBEFCliente.OrdenadoPor.Text := 'PROVEEDOR';
        DBEDescCliente.DataSource := DMAnticipos.DSxProveedores;
        LBLCliente.Caption := _('Proveedor');
        DBGMain.FindColumn('COD_CLI_PRO').Title.Caption := _('Proveedor');
        G2KTableLoc.CondicionBusqueda := 'TIPO_TERCERO = ''PRO''';
     end;
     2:
     begin
        DBEFCliente.Tabla_a_buscar := 'VER_ACREEDORES';
        DBEFCliente.CampoNum := 'ACREEDOR';
        DBEFCliente.OrdenadoPor.Text := 'ACREEDOR';
        DBEDescCliente.DataSource := DMAnticipos.DSxAcreedores;
        LBLCliente.Caption := _('Acreedor');
        DBGMain.FindColumn('COD_CLI_PRO').Title.Caption := _('Acreedor');
        G2KTableLoc.CondicionBusqueda := 'TIPO_TERCERO = ''ACR''';
     end;
  end;
end;

procedure TFMAnticipos.DBEFCtaVerificacion(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCta);
end;

procedure TFMAnticipos.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  AsientoColor;
end;

procedure TFMAnticipos.DBEFTipoAsientoKriExiste(Sender: TObject);
begin
  inherited;
  REntorno.Asiento_ANT := DBEFTipoAsientoKri.Text;
end;

procedure TFMAnticipos.AContabAnticipoExecute(Sender: TObject);
begin
  inherited;
  if DBCBEstado.ItemIndex = 0 then
  begin
     DMAnticipos.Contabilizar(1);
     DBCBEstado.Color := $00CECEFF;
     ShowMessage(_('Anticipo pasado a contabilidad'));
  end
  else
  begin
     DMAnticipos.Contabilizar(0);
     DBCBEstado.Color := $00ECFFD9;
     ShowMessage(_('Anticipo extraido de la contabilidad'));
  end;
end;

procedure TFMAnticipos.AsientoColor;
begin
  if DBCBEstado.ItemIndex = 0 then
     FMAnticipos.DBCBEstado.Color := $00ECFFD9
  else
     DBCBEstado.Color := $00CECEFF;
end;

procedure TFMAnticipos.PCMainChange(Sender: TObject);
begin
  AsientoColor;
end;

procedure TFMAnticipos.SBVerAsientosDblClick(Sender: TObject);
begin
  if DMAnticipos.Enlace then
     FMain.MuestraMovConta('RIC = ' + DMAnticipos.QMAnticiposREGISTRO.AsString + ' AND EJERCICIO = ' +
        DMAnticipos.QMAnticiposEJERCICIO.AsString, DMAnticipos.QMAnticiposCANAL.AsString);
end;

procedure TFMAnticipos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
