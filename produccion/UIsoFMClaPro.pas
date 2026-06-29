unit UIsoFMClaPro;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEdit,
  ULFDBEditFind2000, rxToolEdit, RXDBCtrl, UG2kTBLoc, Buttons, ULFDBDateEdit,
  ULFLabel, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, DB, ShellAPI;

type
  TIsoFMClaPro = class(TFPEdit)
     LProveedor: TLFLabel;
     DBEFCodPro: TLFDBEditFind2000;
     DBEDescProveedor: TLFDbedit;
     LClasManual: TLFLabel;
     LFecha: TLFLabel;
     LNdeINC: TLFLabel;
     DBENdeINC: TLFDbedit;
     LValorInc: TLFLabel;
     DBEValorINC: TLFDbedit;
     LFactorInc: TLFLabel;
     DBEFactorINC: TLFDbedit;
     DBEClaManual: TLFDbedit;
     DBEFClaManual: TLFDBEditFind2000;
     DBDTPFecha: TLFDBDateEdit;
     TSNotas: TTabSheet;
     PNLNotas: TLFPanel;
     DBMObservaciones: TLFDBMemo;
     TBNotas: TLFToolBar;
     LFPNotas: TLFPanel;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     DBGDetalle: TDBGridFind2000;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     SBAProveedor: TSpeedButton;
     AProveedores: TLFActionList;
     AProveedor: TAction;
     LFCBIso9000: TLFDBCheckBox;
     LFechaCertificacion: TLFLabel;
     LFDBFechaIso: TLFDBDateEdit;
     LFCBBaja: TLFDBCheckBox;
     LFFechaBaja: TLFLabel;
     LFDBFechabaja: TLFDBDateEdit;
     LFMotivoBaja: TLFLabel;
     LFDBMotivobaja: TLFDbedit;
     LProducto: TLFLabel;
     LFDBProducto: TLFDbedit;
     LFEchaVto: TLFLabel;
     LFDBFechaVtoIso: TLFDBDateEdit;
     GBFirmas: TGroupBox;
     ChkBAprobado: TLFDBCheckBox;
     ChkBVerificado: TLFDBCheckBox;
     ChkBValidado: TLFDBCheckBox;
     ToolButton1: TToolButton;
     TButtNotasDetalle: TToolButton;
     ANotasDetalle: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ALstClaProv: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ALstCfgClasProvAct: TAction;
     ALstClaTodosProv: TAction;
     ALstCfgClasProv: TAction;
     ARecalcularDetalle: TAction;
     TButtRecalcularDetalle: TToolButton;
     LFCategoryAction3: TLFCategoryAction;
     AAdjuntoClasificacion: TAction;
     AAdjuntosProveedor: TAction;
     AAdjuntosTercero: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AProveedorExecute(Sender: TObject);
     procedure SBAProveedorDblClick(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure LFCBBajaChange(Sender: TObject);
     procedure DBGDetalleDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
     procedure DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ALstClaProvExecute(Sender: TObject);
     procedure ALstCfgClasProvActExecute(Sender: TObject);
     procedure ALstCfgClasProvExecute(Sender: TObject);
     procedure ALstClaTodosProvExecute(Sender: TObject);
     procedure ARecalcularDetalleExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AAdjuntoClasificacionExecute(Sender: TObject);
     procedure AAdjuntosProveedorExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure DameConfiguracionIso;
  end;

var
  IsoFMClaPro : TIsoFMClaPro;

implementation

uses UDMMain, UIsoDMClaPro, UFormGest, UUtiles, UEntorno,
  UFMain, UFMNotasCampo, UDMListados, UFMListconfig, URecibeFicheros, UFMAdjunto, UDMAdjunto;

{$R *.DFM}

procedure TIsoFMClaPro.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  AbreData(TIsoDMClaPro, IsoDMClaPro);

  NavMain.DataSource := IsoDMClaPro.DSQMIsoClaPro;
  EPMain.DataSource := IsoDMClaPro.DSQMIsoClaPro;
  DBGMain.DataSource := IsoDMClaPro.DSQMIsoClaPro;
  DBGDetalle.DataSource := IsoDMClaPro.DSQMDetIsoClaPro;

  // Faig no visible la data i motiu de baixa
  if (IsoDMClaPro.QMIsoClaProBAJA.AsInteger = 1) then
  begin
     LFFechaBaja.Visible := True;
     LFDBFechabaja.Visible := True;
     LFMotivoBaja.Visible := True;
     LFDBMotivobaja.Visible := True;
  end
  else
  begin
     LFFechaBaja.Visible := False;
     LFDBFechabaja.Visible := False;
     LFMotivoBaja.Visible := False;
     LFDBMotivobaja.Visible := False;
  end;

  DameConfiguracionIso; // sfg.albert - Segons els útiles, es mostren els següents camps

  DBEDescProveedor.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProveedor, DBEDescProveedor);
end;

procedure TIsoFMClaPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMClaPro);
end;

procedure TIsoFMClaPro.AProveedorExecute(Sender: TObject);
begin
  inherited;

  FMain.EjecutaAccion(FMain.AProveedores, 'proveedor=' + IsoDMClaPro.QMIsoClaProPROVEEDOR.AsString);
end;

procedure TIsoFMClaPro.SBAProveedorDblClick(Sender: TObject);
begin
  inherited;
  AProveedor.Execute;
end;

procedure TIsoFMClaPro.ANotasDetalleExecute(Sender: TObject);
begin
  inherited;
  EditarCampoNotas(Self, IsoDMClaPro.DSQMDetIsoClaPro, IsoDMClaPro.QMDetIsoClaProNOTAS);
end;

procedure TIsoFMClaPro.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMClaPro.LFCBBajaChange(Sender: TObject);
begin
  inherited;
  if (LFCBBaja.Checked) then
  begin
     LFFechaBaja.Visible := True;
     LFDBFechabaja.Visible := True;
     LFMotivoBaja.Visible := True;
     LFDBMotivobaja.Visible := True;
     LFDBFechaBaja.Text := DateToStr(Date);
     LFDBMotivobaja.Text := '';
  end
  else
  begin
     LFFechaBaja.Visible := False;
     LFDBFechabaja.Visible := False;
     LFMotivoBaja.Visible := False;
     LFDBMotivobaja.Visible := False;
  end;
end;

procedure TIsoFMClaPro.DBGDetalleDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if (Field.FieldName = 'IPR_INDICE') then
     if (Field.AsString = 'C') then
        (Sender as TDBGridFind2000).Canvas.Brush.Color := clRed;
end;

procedure TIsoFMClaPro.DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (column.FieldName = 'IPR_INDICE') then
  begin
     if (column.Field.AsString = 'C') then
        (Sender as TDBGridFind2000).Canvas.Brush.Color := clRed;
     if (column.Field.AsString = 'B') then
        (Sender as TDBGridFind2000).Canvas.Brush.Color := clYellow;
     if (column.Field.AsString = 'A') then
        (Sender as TDBGridFind2000).Canvas.Brush.Color := clGreen;
  end;

  (Sender as TDBGridFind2000).DefaultDrawColumnCell(rect, datacol, column, State);
end;

procedure TIsoFMClaPro.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMClaPro.BusquedaCompleja;
end;

procedure TIsoFMClaPro.ALstClaProvExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  with IsoDMClaPro.xLstCabClaProv do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := IsoDMClaPro.QMIsoClaProEMPRESA.AsInteger;
     Params.ByName['PROVEEDOR'].AsInteger := IsoDMClaPro.QMIsoClaProPROVEEDOR.AsInteger;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(8044, 0, '', str, IsoDMClaPro.frLstClaprov, nil);
  CierraData(DMListados);
end;

procedure TIsoFMClaPro.ALstCfgClasProvActExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8044, Formato, Cabecera, Copias, Pijama, '', IsoDMClaPro.frLstClaprov);
end;

procedure TIsoFMClaPro.ALstCfgClasProvExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8063, Formato, Cabecera, Copias, Pijama, '', IsoDMClaPro.frLstClaTodos);
end;

procedure TIsoFMClaPro.DameConfiguracionIso;
var
  c : integer;
begin
  IsoDMClaPro.xConfigIso.Close;
  IsoDMClaPro.xConfigIso.Open;

  // Si la valoració manual és false, s'amagaran els següents camps
  if (IsoDMClaPro.xConfigIsoVALORACION_MANUAL.AsInteger = 0) then
  begin
     c := EncuentraField(DBGDetalle, 'VAL_CALIDAD_SUMINISTROS');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
     c := EncuentraField(DBGDetalle, 'VAL_CALIDAD_PRODUCTO');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
     c := EncuentraField(DBGDetalle, 'VAL_SERVICIO_ENTREGA');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
     c := EncuentraField(DBGDetalle, 'VAL_PRECIO');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
     c := EncuentraField(DBGDetalle, 'VAL_VARIOS');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
     c := EncuentraField(DBGDetalle, 'VAL_MANUAL');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
  end;

  // Si la valoració inc/ped és false, s'amagaran els següents camps
  if (IsoDMClaPro.xConfigIsoVALORACION_INC_PED.AsInteger = 0) then
  begin
     c := EncuentraField(DBGDetalle, 'VAL_INC_PED');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
  end;

  // Si la valoració coste és false, s'amagaran els següents camps
  if (IsoDMClaPro.xConfigIsoVALORACION_COSTE.AsInteger = 0) then
  begin
     c := EncuentraField(DBGDetalle, 'VAL_COSTE');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
  end;

  // Si la valoració entregas és false, s'amagaran els següents camps
  if (IsoDMClaPro.xConfigIsoVALORACION_ENTREGAS.AsInteger = 0) then
  begin
     c := EncuentraField(DBGDetalle, 'VAL_ENTREGAS');
     if (c >= 0) then
        DBGDetalle.Columns[c].Visible := False;
  end;
end;

procedure TIsoFMClaPro.ALstClaTodosProvExecute(Sender: TObject);
var
  str : string;
begin
  inherited;

  str := '';
  with IsoDMClaPro.xLstCabClaTodos do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Open;
  end;

  with IsoDMClaPro.xLstDetClaTodos do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(8063, 0, '', str, IsoDMClaPro.frLstClaTodos, nil);
  CierraData(DMListados);
end;

procedure TIsoFMClaPro.ARecalcularDetalleExecute(Sender: TObject);
begin
  inherited;
  IsoDMClaPro.CalcularDetalleTodo;
end;

procedure TIsoFMClaPro.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('CLP', IsoDMClaPro.QMIsoClaProID_PROVEEDOR.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoClasificacion.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TIsoFMClaPro.AAdjuntoClasificacionExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('CLP', IsoDMClaPro.QMIsoClaProID_PROVEEDOR.AsInteger);
end;

procedure TIsoFMClaPro.AAdjuntosProveedorExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PRO', IsoDMClaPro.QMIsoClaProID_PROVEEDOR.AsInteger);
end;

procedure TIsoFMClaPro.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', IsoDMClaPro.QMIsoClaProTERCERO.AsInteger);
end;

procedure TIsoFMClaPro.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ALstClaProv.Execute;
end;

end.
