unit UFMPerfiles;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, Spin, UDBSpin,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, DBCtrls, Mask,
  rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBCheckBox, ULFDBEdit,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, ULFEdit;

type
  TFMPerfiles = class(TFPEdit)
     LPerfil: TLFLabel;
     DBEPerfil: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBCBDefecto: TLFDBCheckBox;
     GBFormularios: TGroupBox;
     LOferta: TLFLabel;
     LPedido: TLFLabel;
     LAlbaran: TLFLabel;
     LFactura: TLFLabel;
     EFOferta: TLFDBEditFind2000;
     ETituloOferta: TLFEdit;
     DBSECopiasOfertas: TDBSpinEdit;
     EFPedido: TLFDBEditFind2000;
     ETituloPedido: TLFEdit;
     DBSECopiasPedido: TDBSpinEdit;
     EFAlbaran: TLFDBEditFind2000;
     ETituloAlbaran: TLFEdit;
     DBSECopiasAlbaran: TDBSpinEdit;
     EFFactura: TLFDBEditFind2000;
     ETituloFactura: TLFEdit;
     DBSECopiasFactura: TDBSpinEdit;
     LNroListado: TLFLabel;
     LNombreFormulario: TLFLabel;
     LNroCopias: TLFLabel;
     DBCBImponerListadosOferta: TLFDBCheckBox;
     DBCBImponerCopiasOferta: TLFDBCheckBox;
     DBCBImponerListadosPedido: TLFDBCheckBox;
     DBCBImponerCopiasPedido: TLFDBCheckBox;
     DBCBImponerListadosAlbaran: TLFDBCheckBox;
     DBCBImponerCopiasAlbaran: TLFDBCheckBox;
     DBCBImponerListadosFactura: TLFDBCheckBox;
     DBCBImponerCopiasFacturas: TLFDBCheckBox;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     LFLabel3: TLFLabel;
     LFLabel4: TLFLabel;
     EFOfertaMail: TLFDBEditFind2000;
     ETituloOfertaMail: TLFEdit;
     EFPedidoMail: TLFDBEditFind2000;
     ETituloPedidoMail: TLFEdit;
     EFAlbaranMail: TLFDBEditFind2000;
     ETituloAlbaranMail: TLFEdit;
     EFFacturaMail: TLFDBEditFind2000;
     ETituloFacturaMail: TLFEdit;
     DBCBImponerListadosOfertaMail: TLFDBCheckBox;
     DBCBImponerListadosPedidoMail: TLFDBCheckBox;
     DBCBImponerListadosAlbaranMail: TLFDBCheckBox;
     DBCBImponerListadosFacturaMail: TLFDBCheckBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EFOfertaChange(Sender: TObject);
     procedure EFPedidoChange(Sender: TObject);
     procedure EFAlbaranChange(Sender: TObject);
     procedure EFFacturaChange(Sender: TObject);
     procedure EFOfertaMailChange(Sender: TObject);
     procedure EFPedidoMailChange(Sender: TObject);
     procedure EFAlbaranMailChange(Sender: TObject);
     procedure EFFacturaMailChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPerfiles : TFMPerfiles;

implementation

uses UDMPerfiles, UDMMain, UFormGest, UDameDato;

{$R *.DFM}

procedure TFMPerfiles.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPerfiles, DMPerfiles);
  NavMain.DataSource := DMPerfiles.DSPerfiles;
  DBGMain.DataSource := DMPerfiles.DSPerfiles;
end;

procedure TFMPerfiles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPerfiles);
end;

procedure TFMPerfiles.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPerfiles.BusquedaCompleja;
  Continua := False;
end;

procedure TFMPerfiles.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMPerfiles.EFOfertaChange(Sender: TObject);
begin
  inherited;
  ETituloOferta.Text := DameTituloListado(StrToIntDef(EFOferta.Text, 0));
end;

procedure TFMPerfiles.EFPedidoChange(Sender: TObject);
begin
  inherited;
  ETituloPedido.Text := DameTituloListado(StrToIntDef(EFPedido.Text, 0));
end;

procedure TFMPerfiles.EFAlbaranChange(Sender: TObject);
begin
  inherited;
  ETituloAlbaran.Text := DameTituloListado(StrToIntDef(EFAlbaran.Text, 0));
end;

procedure TFMPerfiles.EFFacturaChange(Sender: TObject);
begin
  inherited;
  ETituloFactura.Text := DameTituloListado(StrToIntDef(EFFactura.Text, 0));
end;

procedure TFMPerfiles.EFOfertaMailChange(Sender: TObject);
begin
  inherited;
  ETituloOfertaMail.Text := DameTituloListado(StrToIntDef(EFOfertaMail.Text, 0));
end;

procedure TFMPerfiles.EFPedidoMailChange(Sender: TObject);
begin
  inherited;
  ETituloPedidoMail.Text := DameTituloListado(StrToIntDef(EFPedidoMail.Text, 0));
end;

procedure TFMPerfiles.EFAlbaranMailChange(Sender: TObject);
begin
  inherited;
  ETituloAlbaranMail.Text := DameTituloListado(StrToIntDef(EFAlbaranMail.Text, 0));
end;

procedure TFMPerfiles.EFFacturaMailChange(Sender: TObject);
begin
  inherited;
  ETituloFacturaMail.Text := DameTituloListado(StrToIntDef(EFFacturaMail.Text, 0));
end;

end.
