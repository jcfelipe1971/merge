unit UFCHerenciaProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, UHYDBGrid, ExtCtrls, UEditPanel,
  UControlEdit, UNavigator, StdCtrls, UFormGest, NsDBGrid, ULFEdit,
  ULFPanel, ULFPageControl, ULFToolBar, ULFLabel, UFPEditSimple,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas;

type
  TFCHerenciaProv = class(TFPEditSimple)
     PCMain: TLFPageControl;
     TSOrigen: TTabSheet;
     TSDestino: TTabSheet;
     PNLDocumentoOrg: TLFPanel;
     DBGOrigen: THYTDBGrid;
     PNLDocumentoDest: TLFPanel;
     DBGDestino: THYTDBGrid;
     EDRig: TLFEdit;
     LBRig: TLFLabel;
     LBReferencia: TLFLabel;
     EDTitulo: TLFEdit;
     LBProveedor: TLFLabel;
     EDProveedor: TLFEdit;
     LBRigOrg: TLFLabel;
     EDRigOrg: TLFEdit;
     LBTituloOrg: TLFLabel;
     EDTituloOrg: TLFEdit;
     LBProveedorOrg: TLFLabel;
     EDProveedorOrg: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure DBGOrigenDblClick(Sender: TObject);
     procedure DBGDestinoDblClick(Sender: TObject);
  private
     { Private declarations }
     procedure MuestraHerencia(Dato: boolean);
  public
     { Public declarations }
     procedure Parametros(Rig, Ejercicio: integer; Tipo, Referencia, Titulo, Serie: string);
  end;

var
  FCHerenciaProv : TFCHerenciaProv;

procedure MuestraHerencia(Rig, Ejercicio: integer; Tipo, Referencia, Titulo, Serie: string; Padre: TComponent);

implementation

uses UDMMain, UDMHerenciaProv, UFMain, UEntorno;

{$R *.DFM}

procedure MuestraHerencia(Rig, Ejercicio: integer; Tipo, Referencia, Titulo, Serie: string; Padre: TComponent);
var
  FCHerenciaProv : TFCHerenciaProv;
begin
  FCHerenciaProv := TFCHerenciaProv.Create(Padre);
  FCHerenciaProv.Parametros(Rig, Ejercicio, Tipo, Referencia, Titulo, Serie);
  FCHerenciaProv.ShowModal;
  FCHerenciaProv.Free;
end;

procedure TFCHerenciaProv.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMHerenciaProv, DMHerenciaProv);
  SalirConEscape;
end;

procedure TFCHerenciaProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMHerenciaProv);
end;

procedure TFCHerenciaProv.PCMainChange(Sender: TObject);
begin
  if PCMain.ActivePage = TSOrigen then
     NavMain.DataSource := DMHerenciaProv.DSxOrigenes
  else
     NavMain.DataSource := DMHerenciaProv.DSxDestinos;
end;

procedure TFCHerenciaProv.Parametros(Rig, Ejercicio: integer; Tipo, Referencia, Titulo, Serie: string);
begin
  DMHerenciaProv.Parametros(Rig, Ejercicio, Tipo, Serie);

  PCMain.ActivePage := TSDestino;
  if (DMHerenciaProv.xOrigenes.RecordCount > 0) then
     PCMain.ActivePage := TSOrigen;

  EDRig.Text := IntToStr(Rig);
  if Tipo = 'OFP' then
     LBRig.Caption := _('Propuesta');
  if Tipo = 'OCP' then
     LBRig.Caption := _('Prop. Conf.');
  if Tipo = 'PEP' then
     LBRig.Caption := _('Pedido');
  if Tipo = 'ALP' then
     LBRig.Caption := _('Albarán');
  if Tipo = 'FAP' then
     LBRig.Caption := _('Factura');

  EDProveedor.Text := Titulo;
  EDTitulo.Text := Referencia;
  EDRigOrg.Text := EDRig.Text;
  LBRigOrg.Caption := LBRig.Caption;
  EDProveedorOrg.Text := EDProveedor.Text;
  EDTituloOrg.Text := EDTitulo.Text;
end;

procedure TFCHerenciaProv.DBGOrigenDblClick(Sender: TObject);
begin
  MuestraHerencia(True);
end;

procedure TFCHerenciaProv.DBGDestinoDblClick(Sender: TObject);
begin
  MuestraHerencia(False);
end;

procedure TFCHerenciaProv.MuestraHerencia(Dato: boolean);
var
  Empresa, Ejercicio, Canal : integer;
  Serie, Tipo : string;
  Rig : integer;
begin
  DMHerenciaProv.DatosHerencia(Empresa, Ejercicio, Canal, Serie, Tipo, Rig, Dato);
  if (Canal <> 0) then
  begin
     if (REntorno.Canal = Canal) then
     begin
        FMain.MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
        Close;
     end
     else
     begin
        if (Application.MessageBox(PChar(string(_('Se va a cerrar el canal actual para abrir el canal del documento'))),
           PChar(string(_('Confirmación'))), mb_iconstop + mb_yesno) = id_yes) then
        begin
           CierraFormsMenos(Self);
           FMain.CambiaEjercicioYCanal(Ejercicio, Canal);
           FMain.MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
           FMain.SetFocus;
        end;
        Close;
     end;
  end;
end;

end.
