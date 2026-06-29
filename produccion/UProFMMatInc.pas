unit UProFMMatInc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls,
  UDBDateTimePicker, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UFormGest, NsDBGrid, rxPlacemnt, rxToolEdit,
  RXDBCtrl, DB, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEdit, ULFDBEditFind2000, UG2kTBLoc,
  ULFLabel, ULFEdit, strUtils, UHYDescription, ULFHYDBDescription, Buttons, ULFDBDateEdit;

type
  TProFMMatInc = class(TFPEdit)
     DBEFIdOrden: TLFDBEditFind2000;
     LIdOrden: TLFLabel;
     DBETitulo: TLFDbedit;
     LFecha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     PNDetalle: TLFPanel;
     ToolBar1: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBMIncidencia: TLFDBMemo;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGMateriales: TDBGridFind2000;
     DBEFFase: TLFDBEditFind2000;
     LLineaFase: TLFLabel;
     LParte: TLFLabel;
     DBERig: TLFDbedit;
     LIDOrden2: TLFLabel;
     LFase: TLFLabel;
     EIdOrden: TLFEdit;
     EFase: TLFEdit;
     LFDBEFAlmSal: TLFDBEditFind2000;
     LFDBEFAlmLanz: TLFDBEditFind2000;
     LAlmacenSalida: TLFLabel;
     LAlmacenLanzamiento: TLFLabel;
     LFDescAlmSal: TLFEdit;
     LFDescAlmLanz: TLFEdit;
     DBEDescCompuesto: TLFDbedit;
     DBETituloCompuesto: TLFDbedit;
     LTotal: TLFLabel;
     LFDBTotal: TLFDbedit;
     LMovManStock: TLFLabel;
     DBEMovManStock: TLFDbedit;
     SBAMovManStock: TSpeedButton;
     AMovManStock: TAction;
     LOrden: TLFLabel;
     DBEOrden: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure DBEFIdOrdenBusqueda(Sender: TObject);
     procedure DBEFFaseBusqueda(Sender: TObject);
     procedure DBGMaterialesBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFaseKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure LFDBEFAlmSalChange(Sender: TObject);
     procedure LFDBEFAlmLanzChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AMovManStockExecute(Sender: TObject);
     procedure SBAMovManStockDblClick(Sender: TObject);
     procedure DBGMaterialesKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EIdOrdenKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     origen: string;
     moduldades: TDataModule;  // Modul de dades origen (producció)
     procedure InsertaCabecera(IdOrden: integer; Fase: string; Linea_fase: integer; AlmSal, AlmLanz: string);
     procedure FiltraCabecera(id_inc_c: integer);
  end;

var
  ProFMMatInc : TProFMMatInc;

implementation

uses UProDMMatInc, UDMMain, UFMain, UUtiles, UEntorno, UDameDato;

{$R *.dfm}

procedure TProFMMatInc.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMatInc, ProDMMatInc);
  NavMain.DataSource := ProDMMatInc.DSQMProCabInc;
  DBGMain.DataSource := ProDMMatInc.DSQMProCabInc;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  NavDetalle.DataSource := ProDMMatInc.DSQMProDetInc;
  DBGMateriales.DataSource := ProDMMatInc.DSQMProDetInc;
  G2KTableLoc.DataSource := ProDMMatInc.DSQMProCabInc;
  SolapaControles(SBAMovManStock, DBEMovManStock);
  DBEMovManStock.Color := REntorno.ColorEnlaceActivo;
end;

procedure TProFMMatInc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (origen = 'produccion') then
     ProDMMatInc.ComprobarExisteDetalle(ProDMMatInc.QMProCabIncID_INC_C.AsInteger);

  CierraData(ProDMMatInc);
end;

procedure TProFMMatInc.DBEFIdOrdenBusqueda(Sender: TObject);
begin
  inherited;
  DBEFIdOrden.CondicionBusqueda := 'SITUACION <> 0';
end;

procedure TProFMMatInc.DBEFFaseBusqueda(Sender: TObject);
begin
  inherited;
  if (DBEFIdOrden.Text <> '') then
     DBEFFase.CondicionBusqueda := 'ID_ORDEN = ' + IntToStr(StrToIntDef(DBEFIdOrden.Text, 0));
end;

procedure TProFMMatInc.DBGMaterialesBusqueda(Sender: TObject);
begin
  inherited;
  with DBGMateriales do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';
     SalirSiNoExiste := True;
     SalirSiVacio := True;

     if Trim(TablaABuscar) = 'ART_ARTICULOS' then
     begin
        CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
        SalirSiVacio := False;
     end;
     if Trim(TablaABuscar) = 'VER_LOTES_UBICACION_DISP_VEN' then
     begin
        CondicionBusqueda := 'ARTICULO=''' + ProDMMatInc.QMProDetIncCOMPONENTE.AsString + ''' AND ALMACEN=''' + ProDMMatInc.QMProCabIncALMACEN_SAL.AsString + '''';
     end;
     if Trim(TablaABuscar) = 'ART_ALMACENES_UBICACIONES' then
     begin
        if (ArticuloUbicable(ProDMMatInc.QMProDetIncCOMPONENTE.AsString)) then
        begin
           {if (ArticuloLoteable(ProDMMatInc.QMProDetIncCOMPONENTE.AsString)) then
              CondicionBusqueda := 'id_ubicacion in (select id_ubicacion from nro_serie_kri where empresa='+REntorno.EmpresaStr+' and articulo='''+ProDMMatInc.QMProDetIncCOMPONENTE.AsString+''' and lote='''+ProDMMatInc.QMProDetIncNRO_SERIE_LOTE.AsString+''')'
           else if (ArticuloSerializado(ProDMMatInc.QMProDetIncCOMPONENTE.AsString)) then
              CondicionBusqueda := 'id_ubicacion in (select id_ubicacion from nro_serie_kri where empresa='+REntorno.EmpresaStr+' and articulo='''+ProDMMatInc.QMProDetIncCOMPONENTE.AsString+''' and nro_serie='''+ProDMMatInc.QMProDetIncNRO_SERIE_LOTE.AsString+''')'
           else
           }
           CondicionBusqueda := 'ALMACEN=''' + ProDMMatInc.QMProDetIncALMACEN.AsString + '''';
        end
        else
           CondicionBusqueda := 'id_ubicacion = 0';
     end;
  end;
end;

procedure TProFMMatInc.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMatInc.BusquedaCompleja;
end;

procedure TProFMMatInc.EIdOrdenKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  strCadena, strOrden : string;
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
     strCadena := EIdOrden.Text;
     strOrden := RightStr(strCadena, (Length(strCadena) - 1));
     DBEFIdOrden.Text := strOrden;
     DBEFFase.SetFocus;
  end;
end;

procedure TProFMMatInc.EFaseKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
var
  strCadena, strFase : string;
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
     strCadena := EFase.Text;
     strFase := RightStr(strCadena, (Length(strCadena) - 1));
     DBEFFase.Text := ProDMMatInc.BuscarFase(strFase);
     LFDBEFAlmSal.SetFocus;
  end;
end;

procedure TProFMMatInc.LFDBEFAlmSalChange(Sender: TObject);
begin
  inherited;
  LFDescAlmSal.Text := DameTituloAlmacen(LFDBEFAlmSal.Text);
end;

procedure TProFMMatInc.LFDBEFAlmLanzChange(Sender: TObject);
begin
  inherited;
  LFDescAlmLanz.Text := DameTituloAlmacen(LFDBEFAlmLanz.Text);
end;

procedure TProFMMatInc.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TProFMMatInc.InsertaCabecera(IdOrden: integer; Fase: string; Linea_fase: integer; AlmSal, AlmLanz: string);
begin
  inherited;
  ProDMMatInc.InsertaCabecera(IdOrden, Fase, linea_fase, AlmSal, AlmLanz);
end;

procedure TProFMMatInc.FiltraCabecera(id_inc_c: integer);
begin
  ProDMMatInc.FiltrarCabecera(id_inc_c);
  NavMain.Enabled := False;
end;

procedure TProFMMatInc.AMovManStockExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraDocumento(ProDMMatInc.QMProCabIncEJERCICIO.AsInteger, 'MVS', ProDMMatInc.QMProCabIncSERIE.AsString, ProDMMatInc.QMProCabIncRIG_MOV.AsInteger);
end;

procedure TProFMMatInc.SBAMovManStockDblClick(Sender: TObject);
begin
  inherited;
  AMovManStock.Execute;
end;

procedure TProFMMatInc.DBGMaterialesKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        ProDMMatInc.InfoLotes;
  end;
end;

end.
