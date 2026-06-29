unit ZUFMPedidosArtDet;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, UNavigator, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  ULFEdit, Mask, DBCtrls, ULFDBEdit, ULFLabel, UG2kTBLoc, ExtCtrls,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UHYDescription,
  ULFHYDBDescription, ULFDBEditFind2000, Menus, UTeclas, UControlEdit,
  UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  UEditPanel;

type
  TZFMPedidosArtDet = class(TFPEditSimple)
     G2KTableLoc: TG2KTBLoc;
     LblPCoste: TLFLabel;
     LblPVenta: TLFLabel;
     LblMargen: TLFLabel;
     LblCompuesto: TLFLabel;
     DBEPCoste: TLFDbedit;
     DBEPVenta: TLFDbedit;
     DBEMargen: TLFDbedit;
     ECompuesto: TLFEdit;
     EDescCompuesto: TLFEdit;
     PnlDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     DBGFDetalle: TDBGridFind2000;
     NavDetalle: THYMNavigator;
     LblLacado: TLFLabel;
     EFLacado: TLFDBEditFind2000;
     DescLacado: TLFHYDBDescription;
     DBChkBMotor: TLFDBCheckBox;
     CEDet: TControlEdit;
     CEDetPMEdit: TPopUpTeclas;
     DBChkBIncr: TLFDBCheckBox;
     DBEIncLacado: TLFDbedit;
     LblModelo: TLFLabel;
     LblLineal: TLFLabel;
     LblSalida: TLFLabel;
     DBELineal: TLFDbedit;
     DBESalida: TLFDbedit;
     DBEFModelo: TLFDBEditFind2000;
     LblM2: TLFLabel;
     DBEM2Lona: TLFDbedit;
     DBEUdsLona: TLFDbedit;
     LblUdsLona: TLFLabel;
     EM2Lona: TLFEdit;
     LAsociarOrden: TLFLabel;
     DBELINEA_PEDIDO_ASOCIADA: TLFDbedit;
     TSepDet1: TToolButton;
     TButEscandalloCorte: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EFLacadoChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBELINEA_PEDIDO_ASOCIADAKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure TButEscandalloCorteClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     HayOrden: boolean;
     procedure AbreDatos(ID: integer; Articulo, Titulo, TipoArt: string; AHayOrden: boolean);
  end;

var
  ZFMPedidosArtDet : TZFMPedidosArtDet;

implementation

uses UDMMain, ZUDMPedidosArtDet, UEntorno, UFMain, UUtiles, UFMSeleccionGrid;

{$R *.dfm}

procedure TZFMPedidosArtDet.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMPedidosArtDet, ZDMPedidosArtDet);

  ControlEdit := CEMain;
end;

procedure TZFMPedidosArtDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMPedidosArtDet);
end;

procedure TZFMPedidosArtDet.DBGFDetalleBusqueda(Sender: TObject);
begin
  DBGFDetalle.Filtros := [obEmpresa];

  if (DBGFDetalle.ColumnaActual = 'ESCANDALLO') then
  begin
     if ((ZDMPedidosArtDet.QMPedidosDetTIPO_ARTICULO_TYC.AsString = 'C') and (ZDMPedidosArtDet.QMPedidosDetCORTE.AsInteger = 1)) then
        DBGFDetalle.CondicionBusqueda := 'SUBTIPO = ''COR'' AND TIPO = ''EPR'''
     else
        DBGFDetalle.CondicionBusqueda := 'TIPO = ''EPR'' AND COMPUESTO = ''' + ZDMPedidosArtDet.QMPedidosDetDETALLE.AsString + '''';
  end
  else
  if (DBGFDetalle.ColumnaActual = 'DETALLE') then
  begin
     if (ZDMPedidosArtDet.xDatosDetalleTIPO_ARTICULO_TYC.AsString = 'M') then
     begin
        DBGFDetalle.Filtros := [];
        DBGFDetalle.Tablas[0] := 'Z_SYS_MODELOS_DET_MOTOR';
        DBGFDetalle.Numericos[0] := 'MOTOR';
        DBGFDetalle.Titulos[0] := 'MOTOR';

        with ZDMPedidosArtDet do
        begin
           xLineaCalc.Close;
           xLineaCalc.Params.ByName['MODELO'].AsString := QMPedidosCabMODELO.AsString;
           xLineaCalc.Params.ByName['LINEA'].AsInteger := Trunc(QMPedidosCabLINEAL.AsFloat);
           xLineaCalc.Open;

           xSalidaCalc.Close;
           xSalidaCalc.Params.ByName['MODELO'].AsString := QMPedidosCabMODELO.AsString;
           xSalidaCalc.Params.ByName['LINEA'].AsInteger := xLineaCalcLINEA.AsInteger;
           xSalidaCalc.Params.ByName['SALIDA'].AsInteger := Trunc(QMPedidosCabSALIDA.AsFloat);
           xSalidaCalc.Open;
        end;

        DBGFDetalle.CondicionBusqueda := 'CODIGO = ''' + ZDMPedidosArtDet.QMPedidosCabMODELO.AsString + '''' +
           ' AND LINEA = ' + IntToStr(ZDMPedidosArtDet.xLineaCalcLINEA.AsInteger) +
           ' AND SALIDA = ' + IntToStr(ZDMPedidosArtDet.xSalidaCalcSALIDA.AsInteger);
     end
     else
     begin
        DBGFDetalle.Filtros := [obEmpresa, obEjercicio, obCanal];
        DBGFDetalle.Tablas[0] := 'VER_ARTICULOS_EF';
        DBGFDetalle.Numericos[0] := 'ARTICULO';
        DBGFDetalle.Titulos[0] := 'TITULO';

        if (ZDMPedidosArtDet.xDatosDetalleTIPO_ARTICULO_TYC.AsString = 'C') and
           (ZDMPedidosArtDet.xDatosDetalleFAMILIA.AsString = '1') then
           DBGFDetalle.CondicionBusqueda := 'FAMILIA = ''' + ZDMPedidosArtDet.xDatosDetalleFAMILIA.AsString + ''''
        else
           DBGFDetalle.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
     end;
  end
  else
     DBGFDetalle.CondicionBusqueda := '';
end;

procedure TZFMPedidosArtDet.AbreDatos(ID: integer; Articulo, Titulo, TipoArt: string; AHayOrden: boolean);
begin
  ZDMPedidosArtDet.AbreDatos(ID);
  ECompuesto.Text := Articulo;
  EDescCompuesto.Text := Titulo;
  HayOrden := AHayOrden;

  {TipoArt -> T Toldo, A Armazón, L Lona y C Componente de subtipo corte}

  DBEM2Lona.Visible := (TipoArt[1] in ['L', 'T']);
  LblM2.Visible := (TipoArt[1] in ['L', 'T']);
  DBEUdsLona.Visible := (TipoArt[1] in ['L', 'C']);
  LblUdsLona.Visible := (TipoArt[1] in ['L', 'C']);
  LblLacado.Visible := (TipoArt[1] in ['T', 'A']);
  EFLacado.Visible := (TipoArt[1] in ['T', 'A']);
  DescLacado.Visible := (TipoArt[1] in ['T', 'A']);
  DBChkBMotor.Visible := (TipoArt[1] in ['T', 'A']);
  DBChkBIncr.Visible := (TipoArt[1] in ['T', 'A']);
  DBEIncLacado.Visible := (TipoArt[1] in ['T', 'A']);
  LblSalida.Visible := (TipoArt[1] in ['T', 'A', 'L']);
  DBESalida.Visible := (TipoArt[1] in ['T', 'A', 'L']);
  LAsociarOrden.Visible := (TipoArt[1] in ['C']);
  DBELINEA_PEDIDO_ASOCIADA.Visible := (TipoArt[1] in ['C']);

  NavMain.EditaControl := EFLacado;

  if (HayOrden) then
  begin
     NavMain.Enabled := False;
     NavDetalle.Enabled := False;
     DBGFDetalle.ReadOnly := True;
     DBGFDetalle.Color := clInfoBk;
     DBGFDetalle.Font.Color := clGrayText;
  end
  else
  if (TipoArt[1] in ['L', 'C']) then
  begin
     NavMain.EditaControl := DBELineal;
     DBEFModelo.ReadOnly := True;
     DBEFModelo.TabStop := False;
     DBEFModelo.Color := clInfoBk;
     DBEFModelo.Font.Color := clGrayText;
  end;

  ShowModal;
end;


procedure TZFMPedidosArtDet.EFLacadoChange(Sender: TObject);
begin
  DescLacado.ActualizaDatos('LACADO', EFLacado.Text);
end;

procedure TZFMPedidosArtDet.FormShow(Sender: TObject);
begin
  if not (HayOrden) then
     ZDMPedidosArtDet.QMPedidosCab.Edit;
end;

procedure TZFMPedidosArtDet.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TZFMPedidosArtDet.DBGFDetalleDblClick(Sender: TObject);
begin
  if ZDMPedidosArtDet.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ESCANDALLO') then
     begin
        FMain.EjecutaAccion(FMain.AProEscandalloSF, 'ESCANDALLO = ''' +
           ZDMPedidosArtDet.QMPedidosDetESCANDALLO.AsString + '''');
     end;
  end;
end;

procedure TZFMPedidosArtDet.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if ZDMPedidosArtDet.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ESCANDALLO') then
        CeldaEnlace(DBGFDetalle, Rect);
  end;
end;

procedure TZFMPedidosArtDet.DBELINEA_PEDIDO_ASOCIADAKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Seleccion : TFMSeleccionGrid;
begin
  if (Key = VK_F3) then
  begin
     Seleccion := TFMSeleccionGrid.Create(Self);
     try
        with Seleccion do
        begin
           Caption := _('Selección de linea a asociar');
           AsignaSQL(
              ' SELECT D.RIG, D.LINEA, D.ARTICULO, D.TITULO, D.UNIDADES ' +
              ' FROM GES_DETALLES_S D ' +
              ' JOIN PRO_PEDIDOS_ORD P ON D.EMPRESA = P.EMPRESA AND D.EJERCICIO = P.EJERCICIO AND D.CANAL = P.CANAL AND D.SERIE = P.SERIE AND D.TIPO = P.TIPO AND D.RIG = P.RIG AND D.LINEA = P.LINEA ' +
              ' WHERE D.ID_S = (SELECT D2.ID_S FROM GES_DETALLES_S D2 WHERE D2.ID_DETALLES_S = ' +
              ZDMPedidosArtDet.QMPedidosCabID_DETALLES_S.AsString + ' )');

           MostrarColumna('RIG', _('Pedido'), 70);
           MostrarColumna('LINEA', _('Linea'), 50);
           MostrarColumna('ARTICULO', _('Artículo'), 100);
           MostrarColumna('TITULO', _('Título'), 230);
           MostrarColumna('UNIDADES', _('Unidades'), 70);
           if (ShowModal = mrOk) then
           begin
              DBELINEA_PEDIDO_ASOCIADA.Text := FDS.FieldByName('LINEA').AsString;
           end;
        end;
     finally
        FreeAndNil(Seleccion);
     end;
  end;
end;

procedure TZFMPedidosArtDet.TButEscandalloCorteClick(Sender: TObject);
begin
  ZDMPedidosArtDet.InformaEscandalloCorte;
end;

procedure TZFMPedidosArtDet.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  TButEscandalloCorte.Enabled := (Button in [nbPost, nbDelete, nbCancel]);
end;

procedure TZFMPedidosArtDet.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := ZDMPedidosArtDet.PuedoCerrar;

  if (not CanClose) then
     CanClose := ConfirmaMensaje(_('Existen lineas de componentes tipo corte sin escandallo informado.') + #13#10 + _('¿Desea salir?'));
end;

end.
