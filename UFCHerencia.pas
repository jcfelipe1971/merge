unit UFCHerencia;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, UHYDBGrid, ExtCtrls, UEditPanel,
  UControlEdit, UNavigator, StdCtrls, UFormGest, NsDBGrid, ULFEdit,
  ULFPanel, ULFPageControl, ULFToolBar, ULFLabel, UFPEditSimple,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UFPEditSinNavegador;

type
  TFCHerencia = class(TFPEditSinNavegador)
     DBGOrigen: THYTDBGrid;
     DBGDestino: THYTDBGrid;
     LRig: TLFLabel;
     ERig: TLFEdit;
     LTitulo: TLFLabel;
     ETitulo: TLFEdit;
     LBCliente: TLFLabel;
     ECliente: TLFEdit;
     PNLOrigen: TLFPanel;
     PNLDestino: TLFPanel;
     LOrigen: TLFLabel;
     LDestino: TLFLabel;
     PNLDocumento: TLFPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGOrigenDblClick(Sender: TObject);
     procedure DBGDestinoDblClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure PMainResize(Sender: TObject);
  private
     { Private declarations }
     procedure MuestraHerencia(dato: boolean);
  public
     { Public declarations }
     procedure Parametros(Rig, Ejercicio: integer; Tipo, SuReferencia, Titulo, Serie: string);
  end;

var
  FCHerencia : TFCHerencia;

procedure MuestraHerencia(Rig, Ejercicio: integer; Tipo, SuReferencia, Titulo, Serie: string; Padre: TComponent);

implementation

uses UDMMain, UDMHerencia, UFMain, UEntorno;

{$R *.DFM}

procedure MuestraHerencia(Rig, Ejercicio: integer; Tipo, SuReferencia, Titulo, Serie: string; Padre: TComponent);
var
  FCHerencia : TFCHerencia;
begin
  FCHerencia := TFCHerencia.Create(Padre);
  FCHerencia.Parametros(Rig, Ejercicio, Tipo, SuReferencia, Titulo, Serie);
  FCHerencia.ShowModal;
  FCHerencia.Free;
end;

procedure TFCHerencia.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMHerencia, DMHerencia);
  SalirConEscape;
end;

procedure TFCHerencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMHerencia);
end;

procedure TFCHerencia.Parametros(Rig, Ejercicio: integer; Tipo, SuReferencia, Titulo, Serie: string);
begin
  DMHerencia.Parametros(Rig, Ejercicio, Tipo, Serie);

  ERig.Text := IntToStr(Rig);
  if Tipo = 'OFC' then
     LRig.Caption := _('Oferta');
  if Tipo = 'PEC' then
     LRig.Caption := _('Pedido');
  if Tipo = 'ALB' then
     LRig.Caption := _('Albarán');
  if Tipo = 'FAC' then
     LRig.Caption := _('Factura');

  ECliente.Text := Titulo;
  ETitulo.Text := SuReferencia;
end;

procedure TFCHerencia.DBGOrigenDblClick(Sender: TObject);
begin
  MuestraHerencia(True);
end;

procedure TFCHerencia.DBGDestinoDblClick(Sender: TObject);
begin
  MuestraHerencia(False);
end;

procedure TFCHerencia.MuestraHerencia(Dato: boolean);
var
  Empresa, Ejercicio, Canal : integer;
  Serie, Tipo : string;
  Rig : integer;
begin
  DMHerencia.DatosHerencia(Empresa, Ejercicio, Canal, Serie, Tipo, Rig, Dato);
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

procedure TFCHerencia.FormShow(Sender: TObject);
begin
  inherited;
  PMainResize(Sender);
end;

procedure TFCHerencia.PMainResize(Sender: TObject);
begin
  inherited;
  PNLOrigen.Height := (PMain.Height - TBMain.Height) div 2;
end;

end.
