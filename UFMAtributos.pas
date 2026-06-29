unit UFMAtributos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, UFPEdit, Grids,
  DBGrids, NsDBGrid, UHYDBGrid, UG2kTBLoc, ULFPageControl, ULFDBEdit,
  StdCtrls, ULFEdit, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFLabel, ULFComboBox;

type
  TFMAtributos = class(TFPEdit)
     LTipo: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     ETituloTipo: TLFEdit;
     LAtributo: TLFLabel;
     DBEAtributo: TLFDbedit;
     PNLFiltroTipoAtributo: TLFPanel;
     CBTipoAtributo: TLFComboBox;
     LFLabel1: TLFLabel;
     DBEFTipoPadre: TLFDBEditFind2000;
     ETituloTipoPadre: TLFEdit;
     LAtributoPadre: TLFLabel;
     DBEFAtributoPadre: TLFDBEditFind2000;
     ETituloAtributoPadre: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBTipoAtributoChange(Sender: TObject);
     procedure DBEFTipoChange(Sender: TObject);
     procedure DBEFTipoPadreChange(Sender: TObject);
     procedure DBEFAtributoPadreChange(Sender: TObject);
     procedure DBEFAtributoPadreBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAtributos : TFMAtributos;

implementation

uses UDMAtributos, UFormGest;

{$R *.dfm}

procedure TFMAtributos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAtributos, DMAtributos);
  NavMain.DataSource := DMAtributos.DSQMAtributos;
  EPMain.DataSource := DMAtributos.DSQMAtributos;
  G2KTableLoc.DataSource := DMAtributos.DSQMAtributos;

  DMAtributos.RellenaTipoAtributo(CBTipoAtributo.Items, True);
  CBTipoAtributo.ItemIndex := 0;
  CBTipoAtributoChange(Sender);
end;

procedure TFMAtributos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMAtributos);
end;

procedure TFMAtributos.CBTipoAtributoChange(Sender: TObject);
var
  Tipo : string;
begin
  inherited;
  Tipo := '';
  if (CBTipoAtributo.ItemIndex >= 1) then
  begin
     Tipo := CBTipoAtributo.Items[CBTipoAtributo.ItemIndex];
     Tipo := Copy(Tipo, 1, Pos('-', Tipo) - 1);
  end;

  DMAtributos.FiltraTipo(Tipo);
end;

procedure TFMAtributos.DBEFTipoChange(Sender: TObject);
begin
  inherited;
  ETituloTipo.Text := DMAtributos.DameTituloTipoAtributo(DBEFTipo.Text);
end;

procedure TFMAtributos.DBEFTipoPadreChange(Sender: TObject);
begin
  inherited;
  ETituloTipoPadre.Text := DMAtributos.DameTituloTipoAtributo(DBEFTipoPadre.Text);
end;

procedure TFMAtributos.DBEFAtributoPadreChange(Sender: TObject);
begin
  inherited;
  ETituloAtributoPadre.Text := DMAtributos.DameTituloAtributo(StrToIntDef(DBEFAtributoPadre.Text, 0));
end;

procedure TFMAtributos.DBEFAtributoPadreBusqueda(Sender: TObject);
begin
  inherited;
  DBEFAtributoPadre.CondicionBusqueda := 'TIPO=''' + DBEFTipoPadre.Text + '''';
end;

end.
