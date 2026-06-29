unit UFMArtProveedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, DBCtrls, StdCtrls, Mask,
  UDBDateTimePicker, UFIBDBEditfind, UComponentesBusquedaFiltrada, Buttons, DB,
  rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBEdit,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFLabel, UG2kTBLoc, ULFDBDateEdit, ULFEdit, ULFEditFind2000;

type
  TFMArtProveedor = class(TFPEdit)
     LblTarifa: TLFLabel;
     DBETarifa: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LblProveedor: TLFLabel;
     LBLInicio: TLFLabel;
     LBLFinal: TLFLabel;
     DBEFProveedor: TLFDBEditFind2000;
     DBTICKInicio: TLFDBDateEdit;
     DBTICKFin: TLFDBDateEdit;
     LBLDescuento1: TLFLabel;
     DBEDescuento1: TLFDbedit;
     DBEDescuento2: TLFDbedit;
     LBLDescuento2: TLFLabel;
     DBEDescuento3: TLFDbedit;
     LBLDescuento3: TLFLabel;
     DBETitProveedor: TLFDbedit;
     LblMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     DBEMoneda: TLFDbedit;
     PEdDetalle: TLFPanel;
     DBGDetalle: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     ToolButton1: TToolButton;
     TBVerArticulosPorTarifaKri: TToolButton;
     TBInc: TToolButton;
     TBSep: TToolButton;
     TBEstablecerPrecio: TToolButton;
     PNLFiltroAgrupacion: TLFPanel;
     LAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     EAgrupacion: TLFEdit;
     TBSep2: TToolButton;
     TBTraspasoPreciosCosteArticulo: TToolButton;
     LUltimaModificacion: TLFLabel;
     DBEUltModificacion: TLFDbedit;
     AArticulo: TAction;
     AProveedor: TAction;
     ALOtros: TLFActionList;
     SBAProveedor: TSpeedButton;
     TBImportar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGDetalleColEnter(Sender: TObject);
     procedure DBGDetalleBusqueda(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure TBVerArticulosPorTarifaKriClick(Sender: TObject);
     procedure TBIncClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure TBEstablecerPrecioClick(Sender: TObject);
     procedure TBTraspasoPreciosCosteArticuloClick(Sender: TObject);
     procedure DBGDetalleDblClick(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure DBGDetalleCellClick(Column: TColumn);
     procedure DBETitProveedorDblClick(Sender: TObject);
     procedure AProveedorExecute(Sender: TObject);
     procedure DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TBImportarClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMArtProveedor : TFMArtProveedor;

implementation

uses UFormGest, UDMArtProveedor, UDMMain, UUtiles, UEntorno, UFMain,
  UFMVerArticulosPorTarifaKri, UFMSeleccion, UParam, UFMImpTarifasProveedor, UDameDato;

{$R *.DFM}

procedure TFMArtProveedor.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMArtProveedor, DMArtProveedor);
  NavMain.DataSource := DMArtProveedor.DSQMTarifasProv;
  DBGMain.DataSource := DMArtProveedor.DSQMTarifasProv;

  NavDetalle.DataSource := DMArtProveedor.DSQMTarifasProvArt;
  DBGDetalle.DataSource := DMArtProveedor.DSQMTarifasProvArt;

  DBGDetalle.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';

  ColActual := DBGDetalle.Columns[0];

  SolapaControles(SBAProveedor, DBETitProveedor);
  DBETitProveedor.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMArtProveedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMArtProveedor);
  FMArtProveedor := nil;
end;

procedure TFMArtProveedor.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGDetalle, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGDetalle.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMArtProveedor.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbEdit then
  begin
     DBEFProveedor.Enabled := False;
     DBEFProveedor.Color := clInfoBk;
     DBETarifa.Enabled := False;
     DBETarifa.Color := clInfoBk;
  end
  else
  begin
     DBEFProveedor.Enabled := True;
     DBEFProveedor.Color := clWindow;
     DBETarifa.Enabled := True;
     DBETarifa.Color := clWindow;
  end;
end;

procedure TFMArtProveedor.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMArtProveedor.BusquedaCompleja;
end;

procedure TFMArtProveedor.DBGDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMArtProveedor.DBGDetalleBusqueda(Sender: TObject);
var
  Articulo : string;
  Proveedor : integer;
begin
  if (Trim(DBGDetalle.TablaABuscar) = 'VER_ARTICULOS_CUENTAS') then
  begin
     DBGDetalle.CondicionBusqueda := 'EJERCICIO = ' + REntorno.EjercicioStr +
        ' AND CANAL=' + REntorno.CanalStr + ' AND FAMILIA<>''' + REntorno.FamSistema + '''';
  end
  else // Para el código de proveedor
  begin
     DMArtProveedor.DameDatos(Articulo, Proveedor);
     DBGDetalle.CondicionBusqueda := 'ARTICULO=''' + Articulo +
        ''' AND PROVEEDOR=' + IntToStr(Proveedor);
  end;
end;

procedure TFMArtProveedor.DBEFMonedaChange(Sender: TObject);
begin
  inherited;
  DMArtProveedor.MascarasMoneda;
end;

procedure TFMArtProveedor.TBVerArticulosPorTarifaKriClick(Sender: TObject);
begin
  inherited;
  TFMVerArticulosPorTarifaKri.Create(Self).Muestra(
     DMArtProveedor.QMTarifasProvArtARTICULO.AsString);
end;

procedure TFMArtProveedor.TBIncClick(Sender: TObject);
var
  Porcentaje : double;
begin
  Porcentaje := 0;
  if PideDato('DBL', Porcentaje, 'Porcentaje a Incrementar') then
  begin
     if Porcentaje <> 0 then
     begin
        DMArtProveedor.IncPorcent(Porcentaje);
        DMArtProveedor.Refresca;
     end;
  end;
end;

procedure TFMArtProveedor.EFAgrupacionChange(Sender: TObject);
begin
  inherited;
  EAgrupacion.Text := DameTituloAgrupacion('T', EFAgrupacion.Text);
  DMArtProveedor.FiltrarAgrupacion(EFAgrupacion.Text);
end;

procedure TFMArtProveedor.TBEstablecerPrecioClick(Sender: TObject);
var
  Precio : double;
begin
  inherited;
  Precio := 0;
  if PideDato('DBL', Precio, _('Precio')) then
  begin
     DMArtProveedor.ModificarPrecioArtFiltrados(Precio);
     DMArtProveedor.Refresca;
  end;
end;

procedure TFMArtProveedor.TBTraspasoPreciosCosteArticuloClick(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Esta seguro de que desea modificar todos los precios de coste de los articulos de la tarifa?')) then
  begin
     DMArtProveedor.TraspasaPreciosAArticulos(StrToIntDef(DBEFProveedor.Text, 0), DBETarifa.Text);
     ShowMessage(_('Proceso completado'));
  end;
end;

procedure TFMArtProveedor.DBGDetalleDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     AArticulo.Execute;
end;

procedure TFMArtProveedor.AArticuloExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if DMArtProveedor.QMTarifasProvArt.Active then
        if DMArtProveedor.QMTarifasProvArtARTICULO.AsString <> '' then
           FMain.EjecutaAccion(FMain.AArticulos,
              'Articulo = ''' + DMArtProveedor.QMTarifasProvArtARTICULO.AsString + '''');
end;

procedure TFMArtProveedor.DBGDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMArtProveedor.DBETitProveedorDblClick(Sender: TObject);
begin
  AProveedor.Execute;
end;

procedure TFMArtProveedor.AProveedorExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if DMArtProveedor.QMTarifasProv.Active then
        if DMArtProveedor.QMTarifasProvPROVEEDOR.AsString <> '' then
           FMain.EjecutaAccion(FMain.AProveedores,
              'Proveedor = ' + DMArtProveedor.QMTarifasProvPROVEEDOR.AsString +
              ' and Ejercicio = ' + IntToStr(DMArtProveedor.QMTarifasProvEJERCICIO.AsInteger));
end;

procedure TFMArtProveedor.DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ARTICULO') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMArtProveedor.TBImportarClick(Sender: TObject);
var
  Proveedor : integer;
  Tarifa : string;
  Alta, Baja : TDateTime;
  Desc1, Desc2, Desc3 : double;
begin
  inherited;
  Proveedor := DMArtProveedor.QMTarifasProvPROVEEDOR.AsInteger;
  Tarifa := DMArtProveedor.QMTarifasProvTARIFA.AsString;
  Alta := DMArtProveedor.QMTarifasProvFECHA_INICIO.AsDateTime;
  Baja := DMArtProveedor.QMTarifasProvFECHA_FINAL.AsDateTime;
  Desc1 := DMArtProveedor.QMTarifasProvDESCUENTO1.AsFloat;
  Desc2 := DMArtProveedor.QMTarifasProvDESCUENTO2.AsFloat;
  Desc3 := DMArtProveedor.QMTarifasProvDESCUENTO3.AsFloat;

  AbreForm(TFMImpTarifasProveedor, FMImpTarifasProveedor, Sender);
  FMImpTarifasProveedor.Inicializar(Proveedor, Tarifa, Alta, Baja, Desc1, Desc2, Desc3);
end;

end.
