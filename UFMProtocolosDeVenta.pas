unit UFMProtocolosDeVenta;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMProtocolosDeVenta = class(TFPEdit)
     LProtocolo: TLFLabel;
     DBEProtocolo: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBCBDefecto: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMProtocolosDeVenta : TFMProtocolosDeVenta;

implementation

uses UDMMain, UFormGest, UDMProtocolosDeVenta;

{$R *.dfm}

procedure TFMProtocolosDeVenta.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMProtocolosDeVenta, DMProtocolosDeVenta);
  NavMain.DataSource := DMProtocolosDeVenta.DSQMProtocolos;
  DBGMain.DataSource := DMProtocolosDeVenta.DSQMProtocolos;
  G2kTableLoc.DataSource := DMProtocolosDeVenta.DSQMProtocolos;
end;

procedure TFMProtocolosDeVenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMProtocolosDeVenta);
end;

procedure TFMProtocolosDeVenta.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
