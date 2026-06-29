unit UFMLotesMateriales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit, dbcgrids, ULFDBCtrlGrid,
  UFIBDBEditfind, ULFFIBDBEditFind;

type
  TFMLotesMateriales = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtSalir: TToolButton;
     PNLLote: TLFPanel;
     DBEProdLote: TLFDbedit;
     TButtSep0: TToolButton;
     LProdLote: TLFLabel;
     LSerie: TLFLabel;
     DBEProdSerie: TLFDbedit;
     LProdArticulo: TLFLabel;
     DBEProdArticulo: TLFDbedit;
     TButtValidar: TToolButton;
     PNLSuperior: TLFPanel;
     DBCGUtilizados: TLFDBCtrlGrid;
     DBEUtilLotes: TLFDbedit;
     DBEUtilFCaducidad: TLFDbedit;
     DBEUtilCantidad: TLFDbedit;
     PNLUtilizados: TLFPanel;
     LUtilLote: TLFLabel;
     LUtilSerie: TLFLabel;
     LUtilFCaducidad: TLFLabel;
     LUtilCantidad: TLFLabel;
     PNLInferior: TLFPanel;
     DBCGEnEscandallo: TLFDBCtrlGrid;
     DBEEscLote: TLFDbedit;
     DBEEscSerie: TLFDbedit;
     DBEEscFCaducidad: TLFDbedit;
     DBEEscCantidad: TLFDbedit;
     PNLEnEscandallo: TLFPanel;
     LEscLote: TLFLabel;
     LEscSerie: TLFLabel;
     LEscFCaducidad: TLFLabel;
     LEscCantidad: TLFLabel;
     PNLArticulos: TLFPanel;
     LBArticulos: TListBox;
     PNLTituloArticulos: TLFPanel;
     LArtEscandallo: TLFLabel;
     DBEUtilSerie: TLFDbedit;
     PNLLotes: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtSalirClick(Sender: TObject);
     procedure DBCGEnEscandalloDblClick(Sender: TObject);
     procedure DBCGUtilizadosDblClick(Sender: TObject);
     procedure TButtValidarClick(Sender: TObject);
     procedure LBArticulosClick(Sender: TObject);
     procedure DBEUtilCantidadKeyPress(Sender: TObject; var Key: char);
     procedure DBCGUtilizadosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure PNLSuperiorResize(Sender: TObject);
     procedure PNLInferiorResize(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     procedure CargaLista;
  public
     { Public declarations }
     procedure AbrirDatos(Orden, Linea: integer);
  end;

var
  AceptaSiNo : boolean;
  FMLotesMateriales : TFMLotesMateriales;

function AsignarLotesMateriales(Owner: TComponent; Orden, Linea: integer): boolean;

implementation

{$R *.dfm}

uses
  UDMMain, UDMLotesMateriales;

function AsignarLotesMateriales(Owner: TComponent; Orden, Linea: integer): boolean;
var
  FMLotesMat : TFMLotesMateriales;
begin
  FMLotesMat := TFMLotesMateriales.Create(Owner);
  FMLotesMat.AbrirDatos(Orden, Linea);
  FMLotesMat.CargaLista;
  FMLotesMat.ShowModal;
  Result := AceptaSiNo;
end;

procedure TFMLotesMateriales.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMLotesMateriales, DMLotesMateriales);

  // Conectamos los datasources
  DBCGUtilizados.DataSource := DMLotesMateriales.DSxLotesUtilizados;
  DBCGEnEscandallo.DataSource := DMLotesMateriales.DSxLotesEnEscandallo;
end;

procedure TFMLotesMateriales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMLotesMateriales);
end;

procedure TFMLotesMateriales.FormShow(Sender: TObject);
begin
  PNLSuperiorResize(Sender);
  PNLInferiorResize(Sender);
end;

procedure TFMLotesMateriales.AbrirDatos(Orden, Linea: integer);
begin
  DMLotesMateriales.AbrirDatos(Orden, Linea);
end;

procedure TFMLotesMateriales.TButtSalirClick(Sender: TObject);
begin
  AceptaSiNo := False;
  DMLotesMateriales.BorraLoteIntroducido;
  Close;
end;

procedure TFMLotesMateriales.DBCGEnEscandalloDblClick(Sender: TObject);
begin
  DMLotesMateriales.InsertarEnUtilizados;
  DMLotesMateriales.AbrirLotesUtilizados(LBArticulos.Items.Strings[LBArticulos.ItemIndex]);
end;

procedure TFMLotesMateriales.DBCGUtilizadosDblClick(Sender: TObject);
begin
  DMLotesMateriales.EliminarDeUtilizados;
  DMLotesMateriales.AbrirLotesUtilizados(LBArticulos.Items.Strings[LBArticulos.ItemIndex]);
end;

procedure TFMLotesMateriales.TButtValidarClick(Sender: TObject);
begin
  AceptaSiNo := True;
  Close;
end;

procedure TFMLotesMateriales.CargaLista;
begin
  with DMLotesMateriales.xArticulosConLoteEsc do
  begin
     First;
     while not EOF do
     begin
        LBArticulos.Items.Add(DMLotesMateriales.xArticulosConLoteEscLINEA.AsString + '-' + DMLotesMateriales.xArticulosConLoteEscDETALLE.AsString);
        Next;
     end;
  end;
  LBArticulos.ItemIndex := 0;
  LBArticulosClick(LBArticulos);
end;

procedure TFMLotesMateriales.LBArticulosClick(Sender: TObject);
begin
  DMLotesMateriales.AbrirLotesUtilizados(LBArticulos.Items.Strings[LBArticulos.ItemIndex]);
end;

procedure TFMLotesMateriales.DBEUtilCantidadKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = #13) then
     DMLotesMateriales.GrabaEnUtilizados;
end;

procedure TFMLotesMateriales.DBCGUtilizadosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     DMLotesMateriales.GrabaEnUtilizados;
end;

procedure TFMLotesMateriales.PNLSuperiorResize(Sender: TObject);
begin
  // DBCGUtilizados.PanelHeight := 26;
  DBCGUtilizados.RowCount := (DBCGUtilizados.Height - PNLSuperior.Height) div 26;
end;

procedure TFMLotesMateriales.PNLInferiorResize(Sender: TObject);
begin
  // DBCGEnEscandallo.PanelHeight := 26;
  DBCGEnEscandallo.RowCount := (DBCGEnEscandallo.Height - PNLEnEscandallo.Height) div 26;
end;

end.
