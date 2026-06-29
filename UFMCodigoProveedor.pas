unit UFMCodigoProveedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, FIBDataSetRO, FIBDatabase, UFIBModificados,
  Grids, DBGrids, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ULFPanel, ULFLabel, ULFEditFind2000, NsDBGrid, UHYDBGrid,
  UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin,
  ULFToolBar, FIBTableDataSet;

type
  TFMCodigoProveedor = class(TFPEditSimple)
     PNLFiltro: TLFPanel;
     PNLDetalle: TLFPanel;
     LCodigoProveedor: TLFLabel;
     EFCodigoProveedor: TLFEditFind2000;
     DSxArticulos: TDataSource;
     DBGArticulos: THYTDBGrid;
     TLocal: THYTransaction;
     xArticulos: TFIBTableSet;
     xArticulosEMPRESA: TIntegerField;
     xArticulosCODIGO_PROVEEDOR: TFIBStringField;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     xArticulosPROVEEDOR: TIntegerField;
     xArticulosNOMBRE_R_SOCIAL: TFIBStringField;
     procedure EFCodigoProveedorChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGArticulosDblClick(Sender: TObject);
  private
     { Private declarations }
     ArticuloSeleccionado: string;
  public
     { Public declarations }
     function BuscaArticulo: string;
  end;

var
  FMCodigoProveedor : TFMCodigoProveedor;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TFMCodigoProveedor.FormCreate(Sender: TObject);
begin
  inherited;
  EFCodigoProveedor.Text := '';
  EFCodigoProveedorChange(Sender);
end;

procedure TFMCodigoProveedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ArticuloSeleccionado := xArticulosARTICULO.AsString;
  if (xArticulos.Transaction.InTransaction) then
     xArticulos.Transaction.Commit;

  Action := caHide;
end;

function TFMCodigoProveedor.BuscaArticulo: string;
begin
  Result := '';
  Hide;
  ShowModal;
  if (ModalResult = mrOk) then
     Result := ArticuloSeleccionado;
end;

procedure TFMCodigoProveedor.EFCodigoProveedorChange(Sender: TObject);
begin
  with xArticulos do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CODIGO_PROVEEDOR'].AsString := '%' + Trim(EFCodigoProveedor.Text) + '%';
     Open;
  end;
end;

procedure TFMCodigoProveedor.DBGArticulosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
