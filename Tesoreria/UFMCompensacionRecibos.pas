unit UFMCompensacionRecibos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, Mask, rxToolEdit, ULFDateEdit, ULFEdit,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ULFLabel, DBCtrls, ULFDBEdit, DB;

type
  TFMCompensacionRecibos = class(TFPEdit)
     TBTercero: TLFToolBar;
     PNLRecibosProveedor: TLFPanel;
     PNLRecibosCliente: TLFPanel;
     LRecibosProveedor: TLFLabel;
     LRecibosCliente: TLFLabel;
     Splitter1: TSplitter;
     TBRecibosProveedor: TLFToolBar;
     TBRecibosCliente: TLFToolBar;
     NavRecibosProveedor: THYMNavigator;
     NavRecibosCliente: THYMNavigator;
     PNLTercero: TLFPanel;
     LTercero: TLFLabel;
     EFTercero: TLFEditFind2000;
     ETercero: TLFEdit;
     TButtAgrupar: TToolButton;
     AAgrupar: TAction;
     PNLSaldo: TLFPanel;
     LSaldo: TLFLabel;
     PNLFecha: TLFPanel;
     LFecha: TLFLabel;
     DEFecha: TLFDateEdit;
     ToolButton3: TToolButton;
     TButtRefrescar: TToolButton;
     ARefrescar: TAction;
     DBGRecibosProveedor: TDBGridFind2000;
     DBGRecibosCliente: TDBGridFind2000;
     LPagos: TLFLabel;
     LCobros: TLFLabel;
     DBEPagos: TLFDbedit;
     DBECobros: TLFDbedit;
     DBESaldo: TLFDbedit;
     PNLSeleccionProveedorAcreedor: TLFPanel;
     PNLSeleccionCliente: TLFPanel;
     LCliente: TLFLabel;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     EFCliente: TLFEditFind2000;
     ECliente: TLFEdit;
     EProveedor: TLFEdit;
     PNLSerieAgrupacion: TLFPanel;
     LSerieAgrupacion: TLFLabel;
     EFSerieAgrupacion: TLFEditFind2000;
     ESerieAgrupacion: TLFEdit;
     procedure AAgruparExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARefrescarExecute(Sender: TObject);
     procedure EFTerceroChange(Sender: TObject);
     procedure DEFechaChange(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure EFClienteBusqueda(Sender: TObject);
     procedure EFProveedorBusqueda(Sender: TObject);
     procedure LProveedorClick(Sender: TObject);
     procedure DBGRecibosCellClick(Column: TColumn);
     procedure EFSerieAgrupacionChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCompensacionRecibos : TFMCompensacionRecibos;

implementation

uses UDMMain, UDMCompensacionRecibos, UFormGest, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMCompensacionRecibos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCompensacionRecibos, DMCompensacionRecibos);
  DBGRecibosProveedor.ColumnasChecked.Strings[DBGRecibosProveedor.ColumnasCheckBoxes.IndexOf('ENTRADA')] := REntorno.EntradaStr;
  DBGRecibosCliente.ColumnasChecked.Strings[DBGRecibosCliente.ColumnasCheckBoxes.IndexOf('ENTRADA')] := REntorno.EntradaStr;
  FormResize(Sender);
  DEFecha.Date := REntorno.FechaTrabSH;
  REntorno.Asiento_CAR_C := 'CRE';
  REntorno.Asiento_CAR_P := 'PRE';

  if (REntorno.SerieRestringida > '') then
  begin
     EFSerieAgrupacion.Text := REntorno.SerieRestringida;
     EFSerieAgrupacion.Color := clInfoBk;
     EFSerieAgrupacion.ReadOnly := True;
     EFSerieAgrupacion.Enabled := True;
  end
  else
     EFSerieAgrupacion.Text := REntorno.Serie;
end;

procedure TFMCompensacionRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCompensacionRecibos);
end;

procedure TFMCompensacionRecibos.AAgruparExecute(Sender: TObject);
begin
  inherited;
  if (DMCompensacionRecibos.xTotalesSALDO.AsFloat <> 0) then
  begin
     if (DMCompensacionRecibos.xTotalesSALDO.AsFloat > 0) then
     begin
        if (LProveedor.Caption = _('Proveedor')) then
           DMCompensacionRecibos.Agrupa('FAP', StrToIntDef(EFProveedor.Text, 0), DEFecha.Date, EFSerieAgrupacion.Text)
        else
           DMCompensacionRecibos.Agrupa('FCR', StrToIntDef(EFProveedor.Text, 0), DEFecha.Date, EFSerieAgrupacion.Text);
     end
     else
        DMCompensacionRecibos.Agrupa('FAC', StrToIntDef(EFCliente.Text, 0), DEFecha.Date, EFSerieAgrupacion.Text);
  end;

  ARefrescar.Execute;
end;

procedure TFMCompensacionRecibos.DEFechaChange(Sender: TObject);
begin
  inherited;
  ARefrescar.Execute;
end;

procedure TFMCompensacionRecibos.EFTerceroChange(Sender: TObject);
begin
  inherited;
  ETercero.Text := DameTituloTercero(StrToIntDef(EFTercero.Text, 0));
  ARefrescar.Execute;
  LProveedor.Caption := _('Proveedor');
  EFProveedor.Text := '';
  EFCliente.Text := '';
end;

procedure TFMCompensacionRecibos.ARefrescarExecute(Sender: TObject);
begin
  inherited;
  DMCompensacionRecibos.RefrescarDatos(StrToIntDef(EFTercero.Text, 0), DEFecha.Date);
end;

procedure TFMCompensacionRecibos.FormResize(Sender: TObject);
begin
  inherited;
  PNLRecibosProveedor.Width := PEdit.Width div 2;
end;

procedure TFMCompensacionRecibos.EFProveedorChange(Sender: TObject);
begin
  inherited;
  if (LProveedor.Caption = _('Proveedor')) then
     EProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0))
  else
     EProveedor.Text := DameTituloAcreedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMCompensacionRecibos.EFClienteChange(Sender: TObject);
begin
  inherited;
  ECliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
end;

procedure TFMCompensacionRecibos.EFClienteBusqueda(Sender: TObject);
begin
  inherited;
  EFCliente.CondicionBusqueda := 'TERCERO=' + IntToStr(StrToIntDef(EFTercero.Text, 0));
end;

procedure TFMCompensacionRecibos.EFProveedorBusqueda(Sender: TObject);
begin
  inherited;
  EFProveedor.CondicionBusqueda := 'TERCERO=' + IntToStr(StrToIntDef(EFTercero.Text, 0));
end;

procedure TFMCompensacionRecibos.LProveedorClick(Sender: TObject);
begin
  inherited;
  if (LProveedor.Caption = _('Proveedor')) then
  begin
     LProveedor.Caption := _('Acreedor');
     EFProveedor.Tabla_a_buscar := 'VER_ACREEDORES';
     EFProveedor.CampoNum := 'ACREEDOR';
     EFProveedor.OrdenadoPor.Text := 'ACREEDOR';
  end
  else
  begin
     LProveedor.Caption := _('Proveedor');
     EFProveedor.Tabla_a_buscar := 'VER_PROVEEDORES';
     EFProveedor.CampoNum := 'PROVEEDOR';
     EFProveedor.OrdenadoPor.Text := 'PROVEEDOR';
  end;
end;

procedure TFMCompensacionRecibos.DBGRecibosCellClick(Column: TColumn);
var
  DS : TDataSet;
begin
  inherited;
  DS := Column.Field.DataSet;
  if ((DS.FieldByName('DOC_TIPO').AsString = 'FCR') or (DS.FieldByName('DOC_TIPO').AsString = 'AGR') or
     (DS.FieldByName('DOC_TIPO').AsString = 'NRA') or (DS.FieldByName('DOC_TIPO').AsString = 'AFA')) then
  begin
     if (LProveedor.Caption = _('Proveedor')) then
        LProveedorClick(Self);
     EFProveedor.Text := DS.FieldByName('COD_CLI_PRO').AsString;
  end
  else
  begin
     if ((DS.FieldByName('DOC_TIPO').AsString = 'FAP') or (DS.FieldByName('DOC_TIPO').AsString = 'AGP') or
        (DS.FieldByName('DOC_TIPO').AsString = 'NRP') or (DS.FieldByName('DOC_TIPO').AsString = 'AFP')) then
     begin
        if (LProveedor.Caption = _('Acreedor')) then
           LProveedorClick(Self);
        EFProveedor.Text := DS.FieldByName('COD_CLI_PRO').AsString;
     end
     else
     begin
        EFCliente.Text := DS.FieldByName('COD_CLI_PRO').AsString;
     end;
  end;
end;

procedure TFMCompensacionRecibos.EFSerieAgrupacionChange(Sender: TObject);
begin
  inherited;
  ESerieAgrupacion.Text := DameTituloSerie(EFSerieAgrupacion.Text);
end;

end.
