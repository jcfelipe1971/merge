unit UFInfoHistorico;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UHYDBGrid, StdCtrls, Mask, DBCtrls, ComCtrls, ExtCtrls,
  ToolWin, UFormGest, Menus, UTeclas, UControlEdit, UNavigator, ULFDBEdit,
  ULFPanel, ULFToolBar, NsDBGrid, ULFLabel, UFPEditSimple, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, UEditPanel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFComboBox;

type
  TFInfoHistorico = class(TFPEditSimple)
     DBGInfo: THYTDBGrid;
     LBLCodigo: TLFLabel;
     LBLArticulo: TLFLabel;
     DBECliente: TLFDbedit;
     DBEArticulo: TLFDbedit;
     PNLDatos: TLFPanel;
     CBSoloEjercicio: TLFCheckBox;
     CBSoloSerie: TLFCheckBox;
     CBSoloCanal: TLFCheckBox;
     CBTipoDocumento: TLFComboBox;
     PNLFiltros: TLFPanel;
     LTipoDocumento: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure CBChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGInfoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     CodCliProv, Tipo: integer;
     Serie, Articulo: string;
  public
     { Public declarations }
     procedure Mostrar(const aSerie, aArticulo: string; aCodCliProv, aTipo: integer);
  end;

var
  FInfoHistorico : TFInfoHistorico;

implementation

uses UDMMain, UDMInfoHistorico, UUtiles;

{$R *.DFM}

procedure TFInfoHistorico.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMInfoHistorico, DMInfoHistorico);
  ControlEdit := CEMain;
  OwnerDrawMenus(Self);
  SalirConEscape;
end;

procedure TFInfoHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMInfoHistorico);
end;

procedure TFInfoHistorico.Mostrar(const aSerie, aArticulo: string; aCodCliProv, aTipo: integer);
begin
  Tipo := aTipo;
  Serie := aSerie;
  Articulo := aArticulo;
  CodCliProv := aCodCliProv;

  if (Tipo = 0) then
  begin
     LBLCodigo.Caption := _('Cliente');
     with CBTipoDocumento.Items do
     begin
        Clear;
        Add(_('Todos'));
        Add('OFC - ' + _('Oferta'));
        Add('PEC - ' + _('Pedido'));
        Add('ALB - ' + _('Albaran'));
        Add('FAC - ' + _('Factura'));
     end;
  end
  else
  begin
     LBLCodigo.Caption := _('Prov.');
     with CBTipoDocumento.Items do
     begin
        Clear;
        Add(_('Todos'));
        Add('OFP - ' + _('Propuesta'));
        Add('OCP - ' + _('Propuesta Confirmada'));
        Add('PEP - ' + _('Pedido'));
        Add('ALP - ' + _('Albaran'));
        Add('FAP - ' + _('Factura'));
     end;
  end;

  // Refresco datos
  CBChange(nil);

  ShowModal;
end;

procedure TFInfoHistorico.CBChange(Sender: TObject);
var
  TipoDocumento : string;
begin
  inherited;
  TipoDocumento := Copy(CBTipoDocumento.Text, 1, 3);
  if (CBTipoDocumento.ItemIndex <= 0) then
     TipoDocumento := 'ALL';

  DMInfoHistorico.FiltrarHist(Serie, Articulo, CodCliProv, Tipo, TipoDocumento, CBSoloEjercicio.Checked, CBSoloSerie.Checked, CBSoloCanal.Checked);
end;

procedure TFInfoHistorico.FormShow(Sender: TObject);
begin
  inherited;
  CBChange(nil);
end;

procedure TFInfoHistorico.DBGInfoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'UNIDADES_SEC') then
        begin
           if (DMInfoHistorico.xHist_PreciosAPLICA_UNIDADES_SECUNDARIAS.AsInteger = 1) then
              ColorInfo(Canvas)
           else
              ColorInactivo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
