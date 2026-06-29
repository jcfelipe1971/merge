unit UFMCodigoCliente;

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
  TFMCodigoCliente = class(TFPEditSimple)
     PNLFiltro: TLFPanel;
     PNLDetalle: TLFPanel;
     LCodigoCliente: TLFLabel;
     EFCodigoCliente: TLFEditFind2000;
     DSxArticulos: TDataSource;
     DBGArticulos: THYTDBGrid;
     TLocal: THYTransaction;
     xArticulos: TFIBTableSet;
     xArticulosEMPRESA: TIntegerField;
     xArticulosCODIGO_CLIENTE: TFIBStringField;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     xArticulosCLIENTE: TIntegerField;
     xArticulosNOMBRE_R_SOCIAL: TFIBStringField;
     procedure EFCodigoClienteChange(Sender: TObject);
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
  FMCodigoCliente : TFMCodigoCliente;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TFMCodigoCliente.FormCreate(Sender: TObject);
begin
  inherited;
  EFCodigoCliente.Text := '';
  EFCodigoClienteChange(Sender);
end;

procedure TFMCodigoCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ArticuloSeleccionado := xArticulosARTICULO.AsString;
  if (xArticulos.Transaction.InTransaction) then
     xArticulos.Transaction.Commit;

  Action := caHide;
end;

function TFMCodigoCliente.BuscaArticulo: string;
begin
  Result := '';
  Hide;
  ShowModal;
  if (ModalResult = mrOk) then
     Result := ArticuloSeleccionado;
end;

procedure TFMCodigoCliente.EFCodigoClienteChange(Sender: TObject);
begin
  with xArticulos do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CODIGO_CLIENTE'].AsString := '%' + Trim(EFCodigoCliente.Text) + '%';
     Open;
  end;
end;

procedure TFMCodigoCliente.DBGArticulosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
