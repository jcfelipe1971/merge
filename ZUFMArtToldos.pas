unit ZUFMArtToldos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UHYDescription, ULFHYDBDescription,
  ULFDBEditFind2000, StdCtrls, Mask, DBCtrls, ULFDBEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFLabel, ULFEdit, UFPEditDetalle;

type
  TZFMArtToldos = class(TFPEditDetalle)
     LblTarifa: TLFLabel;
     DBChkBMotor: TLFDBCheckBox;
     DBEPCoste: TLFDbedit;
     DBEPVenta: TLFDbedit;
     LblPCoste: TLFLabel;
     LblPVenta: TLFLabel;
     LblMargen: TLFLabel;
     DBEMargen: TLFDbedit;
     DBEFTarifa: TLFDBEditFind2000;
     DescTarifa: TLFHYDBDescription;
     LblToldo: TLFLabel;
     EToldo: TLFEdit;
     EDescToldo: TLFEdit;
     DBEFLona: TLFDBEditFind2000;
     LblLona: TLFLabel;
     DescLona: TLFHYDBDescription;
     DBEArmazon: TLFDbedit;
     LblArmazon: TLFLabel;
     DescArmazon: TLFHYDBDescription;
     DBEPCosteLona: TLFDbedit;
     DBEPVentaLona: TLFDbedit;
     DBEPMargenLona: TLFDbedit;
     DBEPCosteArmazon: TLFDbedit;
     DBEPVentaArmazon: TLFDbedit;
     DBEPMargenArmazon: TLFDbedit;
     DBCBDefecto: TLFDBCheckBox;
     DBChkBIncr: TLFDBCheckBox;
     DBEIncr: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFLonaChange(Sender: TObject);
     procedure DBEFTarifaChange(Sender: TObject);
     procedure DBEArmazonChange(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     procedure AbreDatos(DM: TDataModule; Articulo, Titulo: string);
  end;

var
  ZFMArtToldos : TZFMArtToldos;

implementation

uses UFormGest, ZUDMArtToldos, UDMMain, UEntorno, UFMain, UUtiles;

{$R *.dfm}

procedure TZFMArtToldos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMArtToldos, ZDMArtToldos);
  ZDMArtToldos.VerIncr := False;

  NavMain.DataSource := ZDMArtToldos.DSQMToldos;
  DBGMain.DataSource := ZDMArtToldos.DSQMToldos;
end;

procedure TZFMArtToldos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMArtToldos);
end;

procedure TZFMArtToldos.AbreDatos(DM: TDataModule; Articulo, Titulo: string);
begin
  ZDMArtToldos.AbreDatos(DM, Articulo);
  EToldo.Text := Articulo;
  EDescToldo.Text := Titulo;

  ShowModal;
end;

procedure TZFMArtToldos.DBEFLonaChange(Sender: TObject);
begin
  inherited;
  DescLona.ActualizaDatos('LONA', DBEFLona.Text);
end;

procedure TZFMArtToldos.DBEFTarifaChange(Sender: TObject);
begin
  inherited;
  DescTarifa.ActualizaDatos('TARIFA', DBEFTarifa.Text);
end;

procedure TZFMArtToldos.DBEArmazonChange(Sender: TObject);
begin
  inherited;
  DescArmazon.ActualizaDatos('ARMAZON', DBEArmazon.Text);
end;

procedure TZFMArtToldos.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  if (DBGFDetalle.ColumnaActual = 'ESCANDALLO_DEF') then
     DBGFDetalle.CondicionBusqueda := 'compuesto="' +
        ZDMArtToldos.QMToldosDetDETALLE.AsString + '"'
  else if (DBGFDetalle.ColumnaActual = 'DETALLE') then
     DBGFDetalle.CondicionBusqueda := 'familia<>"' + REntorno.FamSistema + '"'
  else
     DBGFDetalle.CondicionBusqueda := '';
end;

procedure TZFMArtToldos.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  // Se habilita la lona sólo al insertar
  if Button = nbInsert then
  begin
     DBEFLona.ReadOnly := False;
     DBEFLona.Font.Color := clWindowText;
     DBEFLona.Color := clWindow;
     DBEFTarifa.ReadOnly := False;
     DBEFTarifa.Font.Color := clWindowText;
     DBEFTarifa.Color := clWindow;
  end
  else
  begin
     DBEFLona.ReadOnly := True;
     DBEFLona.Color := clInfoBk;
     DBEFLona.Font.Color := clGrayText;
     DBEFTarifa.ReadOnly := True;
     DBEFTarifa.Color := clInfoBk;
     DBEFTarifa.Font.Color := clGrayText;
  end;
end;

procedure TZFMArtToldos.FormShow(Sender: TObject);
begin
  inherited;
  ZDMArtToldos.VerIncr := True;
end;

procedure TZFMArtToldos.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TZFMArtToldos.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if ZDMArtToldos.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ESCANDALLO_DEF') then
     begin
        FMain.EjecutaAccion(FMain.AProEscandalloSF, 'Escandallo = "' +
           ZDMArtToldos.QMToldosDetESCANDALLO_DEF.AsString + '"');
     end;
  end;
end;

procedure TZFMArtToldos.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ZDMArtToldos.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ESCANDALLO_DEF') then
        CeldaEnlace(DBGFDetalle, Rect);
  end;
end;

end.
