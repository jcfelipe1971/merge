unit UFMAlquiler;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit, Buttons, ULFEdit,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBEditFind2000;

type
  TFMAlquiler = class(TFPEdit)
     PNLDetalle: TLFPanel;
     PNLCuotas: TLFPanel;
     PNLRevisiones: TLFPanel;
     PNLArticulo: TLFPanel;
     TBCuotas: TLFToolBar;
     TBRevisiones: TLFToolBar;
     TBArticulos: TLFToolBar;
     NavCuotas: THYMNavigator;
     NavRevisiones: THYMNavigator;
     NavNrosSerie: THYMNavigator;
     DBGCuotas: TDBGridFind2000;
     DBGRevisiones: TDBGridFind2000;
     DBGNrosSerie: TDBGridFind2000;
     LCuotas: TLFLabel;
     LRevisiones: TLFLabel;
     LArticulo: TLFLabel;
     LPedidoAlbaranDeposito: TLFLabel;
     LAlquiler: TLFLabel;
     DBEAlquiler: TLFDbedit;
     LPedido: TLFLabel;
     DBEPedido: TLFDbedit;
     SBAPedido: TSpeedButton;
     AOtros: TLFCategoryAction;
     AVerPedido: TAction;
     LEstadoPedido: TLFLabel;
     DBEEstadoPedido: TLFDbedit;
     LAlbaran: TLFLabel;
     DBEAlbaran: TLFDbedit;
     LEstadoAlbaran: TLFLabel;
     DBEEstadoAlbaran: TLFDbedit;
     SBAAlbaran: TSpeedButton;
     AVerAlbaran: TAction;
     AProcesos: TLFCategoryAction;
     ATraspasarAlbaran: TAction;
     AGeneraDeposito: TAction;
     ACrearCuota: TAction;
     DBETituloCliente: TLFDbedit;
     AGeneraDevolucion: TAction;
     TButtSep1: TToolButton;
     TButtGeneraDeposito: TToolButton;
     DBGNroSerieActivo: TDBGridFind2000;
     LUnidadesSerializadas: TLFLabel;
     DBEUnidadesSerializadas: TLFDbedit;
     DBDEFechaUltimaCuota: TLFDBDateEdit;
     LFechaUltimaCuota: TLFLabel;
     TButtSep2: TToolButton;
     TButtCuota: TToolButton;
     AVerCuota: TAction;
     DBEFAlmacenDeposito: TLFDBEditFind2000;
     LAlmacenDeposito: TLFLabel;
     EAlmacenDeposito: TLFEdit;
     LFechaProximaCuota: TLFLabel;
     DBEFechaProximaCuota: TLFDBDateEdit;
     TButtSep3: TToolButton;
     TButtGenerarDepositos: TToolButton;
     AGenerarDeposito: TAction;
     PNLNrosSerie: TLFPanel;
     TBNrosSerie: TLFToolBar;
     TButtGeneraDevolucion: TToolButton;
     LUnidadesPorSerializar: TLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure SBAPedidoDblClick(Sender: TObject);
     procedure SBAAlbaranDblClick(Sender: TObject);
     procedure AVerPedidoExecute(Sender: TObject);
     procedure AVerAlbaranExecute(Sender: TObject);
     procedure ATraspasarAlbaranExecute(Sender: TObject);
     procedure AGeneraDepositoExecute(Sender: TObject);
     procedure ACrearCuotaExecute(Sender: TObject);
     procedure DBGCuotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGCuotasDblClick(Sender: TObject);
     procedure AGeneraDevolucionExecute(Sender: TObject);
     procedure DBGRevisionesDblClick(Sender: TObject);
     procedure DBGRevisionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGNrosSerieDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEAlquilerChange(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AVerCuotaExecute(Sender: TObject);
     procedure DBEFAlmacenDepositoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure TbuttCompClick(Sender: TObject);
     procedure AGenerarDepositoExecute(Sender: TObject);
  private
     { Private declarations }
     procedure ActualizarDatos;
  public
     { Public declarations }
     procedure FiltraAlquiler(Filtro: string);
  end;

var
  FMAlquiler : TFMAlquiler;

implementation

uses
  UDMAlquiler, UFormGest, UEntorno, UDMMain, UFMain, UUtiles, UFMPedidos, UFMAlbaranes, UFMClienteCuotas, HYFIBQuery, DateUtils, UDameDato;

{$R *.dfm}

procedure TFMAlquiler.FiltraAlquiler(Filtro: string);
begin
  DMAlquiler.FiltraAlquiler(Filtro);
end;

procedure TFMAlquiler.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAlquiler, DMAlquiler);
  SolapaControles(SBAPedido, DBEPedido);
  DBEPedido.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAAlbaran, DBEAlbaran);
  DBEPedido.Color := REntorno.ColorEnlaceActivo;
  NavMain.DataSource := DMAlquiler.DSQMAqluiler;
  DBGMain.DataSource := DMAlquiler.DSQMAqluiler;
  G2kTableLoc.DataSource := DMAlquiler.DSQMAqluiler;
  DBEAlquilerChange(Sender);
end;

procedure TFMAlquiler.FormResize(Sender: TObject);
begin
  inherited;
  PNLCuotas.Width := PNLDetalle.Width div 3;
  PNLArticulo.Width := PNLCuotas.Width;
end;

procedure TFMAlquiler.SBAPedidoDblClick(Sender: TObject);
begin
  inherited;
  AVerPedido.Execute;
end;

procedure TFMAlquiler.SBAAlbaranDblClick(Sender: TObject);
begin
  inherited;
  AVerAlbaran.Execute;
end;

procedure TFMAlquiler.AVerPedidoExecute(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMAlquiler.QMAqluilerID_S_PEC.AsInteger);
end;

procedure TFMAlquiler.AVerAlbaranExecute(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMAlquiler.QMAqluilerID_S_ALB.AsInteger);
end;

procedure TFMAlquiler.ATraspasarAlbaranExecute(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMAlquiler.QMAqluilerID_S_PEC.AsInteger);
  FMPedidos.AAAlbaran.Execute;
  DMAlquiler.Refresca;
end;

procedure TFMAlquiler.AGeneraDepositoExecute(Sender: TObject);
var
  Id_Alb : integer;
begin
  inherited;
  /// Genero albaran, lo muestro y espero a que entren los nros. de serie y generen mov. deposito.
  Id_Alb := DMAlquiler.GeneraAlbaranDeposito;
  FMain.TraspasoDeDocumentosSalida(Id_Alb);
  DMAlquiler.Refresca;
end;

procedure TFMAlquiler.ACrearCuotaExecute(Sender: TObject);
var
  Cliente, Cuota : integer;
  Importe : double;
begin
  inherited;

  // Datos para crear/mostrar la cuota
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT P.CLIENTE, P.LIQUIDO, C.CUOTA FROM GES_CABECERAS_S P ');
        SQL.Add(' LEFT JOIN EMP_CLIENTES_CUOTAS C ');
        SQL.Add(' ON C.ID_ORIGEN = P.ID_S AND C.TIPO_ORIGEN = P.TIPO ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := DMAlquiler.QMAqluilerID_S_PEC.AsInteger;
        ExecQuery;
        Cliente := FieldByName['CLIENTE'].AsInteger;
        Importe := FieldByName['LIQUIDO'].AsFloat;
        Cuota := FieldByName['CUOTA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbreForm(TFMClienteCuotas, FMClienteCuotas, FMain);
  if (Cuota = 0) then
     FMClienteCuotas.CrearCuota(Cliente, Importe, 'PEC', DMAlquiler.QMAqluilerID_S_PEC.AsInteger)
  else
     FMClienteCuotas.Muestra(Cliente, 'PEC', DMAlquiler.QMAqluilerID_S_PEC.AsInteger);

  // Calcula y genera cuotas hasta la fecha de trabajo
  DMAlquiler.CalculaCuotas;

  DMAlquiler.Refresca;
end;

procedure TFMAlquiler.DBGCuotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'CUOTA') or (UpperCase(Column.FieldName) = 'TIPO_DOC')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     if (DMAlquiler.xCuotaDetalleID_S.AsInteger > 0) then
        ColorResaltado2(Canvas)
     else
        ColorInfo(Canvas);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAlquiler.DBGCuotasDblClick(Sender: TObject);
begin
  inherited;
  if (DMAlquiler.xCuotaDetalleID_S.AsInteger > 0) then
     FMain.TraspasoDeDocumentosSalida(DMAlquiler.xCuotaDetalleID_S.AsInteger);
end;

procedure TFMAlquiler.AGeneraDevolucionExecute(Sender: TObject);
var
  Id_Alb : integer;
begin
  inherited;
  /// Creo albaran de devolucion del deposito en el que estoy. Luego lo muestro.
  Id_Alb := DMAlquiler.GeneraAlbaranDevolucionDeposito;
  FMain.TraspasoDeDocumentosSalida(Id_Alb);
  DMAlquiler.Refresca;
end;

procedure TFMAlquiler.DBGRevisionesDblClick(Sender: TObject);
begin
  inherited;
  if (DMAlquiler.xAlquilerRevisionID_S_ALB.AsInteger > 0) then
     FMain.TraspasoDeDocumentosSalida(DMAlquiler.xAlquilerRevisionID_S_ALB.AsInteger);
end;

procedure TFMAlquiler.DBGRevisionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ALBARAN') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     if (DataSource.DataSet.FieldByName('NUM_MOV_DEPOSITO').AsInteger = 0) then
        ColorError(Canvas)
     else
        ColorInfo(Canvas);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAlquiler.DBGNrosSerieDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     if (DataSource.DataSet.FieldByName('TIPO').AsString = 'MVE') then
        ColorResaltado2(Canvas)
     else
        ColorInfo(Canvas);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAlquiler.DBEAlquilerChange(Sender: TObject);
begin
  inherited;
  if (DMAlquiler.QMAqluilerUNIDADES_SERIALIZADAS.AsFloat <> DMAlquiler.TmpNrosSerie.RecordCount) then
     ColorError(DBEUnidadesSerializadas)
  else
     ColorInfo(DBEUnidadesSerializadas);

  if (DMAlquiler.QMAqluilerUNIDADES_SERIALIZADAS.AsFloat <> DMAlquiler.TmpNrosSerie.RecordCount) then
     LUnidadesPorSerializar.Caption := Format(_('Faltan %d unidades'), [Trunc(DMAlquiler.QMAqluilerUNIDADES_SERIALIZADAS.AsFloat) - DMAlquiler.TmpNrosSerie.RecordCount]);
  LUnidadesPorSerializar.Visible := (Trunc(DMAlquiler.QMAqluilerUNIDADES_SERIALIZADAS.AsFloat) - DMAlquiler.TmpNrosSerie.RecordCount) <> 0;

  if ((DMAlquiler.QMAqluilerFECHA_FIN_CUOTA.AsDateTime < Today) and (DMAlquiler.QMAqluilerFECHA_FIN_CUOTA.AsDateTime > 0)) then
     ColorError(DBDEFechaUltimaCuota)
  else
     ColorInfo(DBDEFechaUltimaCuota);
end;

procedure TFMAlquiler.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  DBEAlquilerChange(Sender);
end;

procedure TFMAlquiler.AVerCuotaExecute(Sender: TObject);
var
  Cliente : integer;
begin
  inherited;

  // Datos para mostrar la cuota
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CLIENTE FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := DMAlquiler.QMAqluilerID_S_PEC.AsInteger;
        ExecQuery;
        Cliente := FieldByName['CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbreForm(TFMClienteCuotas, FMClienteCuotas, FMain);
  FMClienteCuotas.Muestra(Cliente, 'PEC', DMAlquiler.QMAqluilerID_S_PEC.AsInteger);
end;

procedure TFMAlquiler.DBEFAlmacenDepositoChange(Sender: TObject);
begin
  inherited;
  EAlmacenDeposito.Text := DameTituloAlmacen(DBEFAlmacenDeposito.Text);
end;

// FMain.MuestraDocumento(DMAlquiler.QMAqluilerEJERCICIO_ALBARAN.AsInteger, 'MVE', DMAlquiler.QMAqluilerSERIE_ALBARAN.AsString, DMAlquiler.QMAqluilerNUM_MOV_DEPOSITO.AsInteger);

procedure TFMAlquiler.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
  ActualizarDatos;
end;

procedure TFMAlquiler.TbuttCompClick(Sender: TObject);
begin
  inherited;
  ActualizarDatos;
end;

procedure TFMAlquiler.ActualizarDatos;
begin
  DMAlquiler.Refresca;
  DBEAlquilerChange(nil);
end;

procedure TFMAlquiler.AGenerarDepositoExecute(Sender: TObject);
begin
  inherited;
  DMAlquiler.GenerarDeposito;
  ActualizarDatos;
end;

end.
