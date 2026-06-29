unit UProFMIntroduceDatosCierre;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UFormGest, StdCtrls, ULFLabel, Buttons,
  rxPlacemnt, ULFFormStorage, UNavigator, ToolWin, ComCtrls, ULFToolBar,
  ULFPageControl, Mask, DBCtrls, ULFDBEdit, UHYDescription,
  ULFHYDBDescription, ULFEdit, UProDMIntroduceDatosCierre, DB;

type
  TProFMIntroduceDatosCierre = class(TG2KForm)
     PMain: TLFPanel;
     DBGLot_Ubi: TDBGridFind2000;
     BSeguir: TBitBtn;
     BCancelar: TBitBtn;
     FSMain: TLFFibFormStorage;
     TBLotes: TLFToolBar;
     NavComponentes: THYMNavigator;
     PCMain: TLFPageControl;
     TSComponentes: TTabSheet;
     TSCompuestos: TTabSheet;
     PNLCompuesto: TLFPanel;
     LFPMain: TLFPanel;
     LFPDatosGen: TLFPanel;
     LIDOrden: TLFLabel;
     LCompuesto: TLFLabel;
     LFecha: TLFLabel;
     LUnidades: TLFLabel;
     DBEFechaOrden: TLFDbedit;
     DBEUnidades: TLFDbedit;
     DBEIDOrden: TLFDbedit;
     DBECompuesto: TLFDbedit;
     ETituloCompuesto: TLFEdit;
     PNLComponentesBotonera: TLFPanel;
     PNLComponentes: TLFPanel;
     TBCompuesto: TLFToolBar;
     NavCompuesto: THYMNavigator;
     DBGFCompuesto: TDBGridFind2000;
     TSSeriesCompuesto: TTabSheet;
     TSSeriesComponente: TTabSheet;
     TBSerializacionComponentes: TLFToolBar;
     PNLSerieComponente: TLFPanel;
     TBSerializacionCompuesto: TLFToolBar;
     PNLSeriesCompuesto: TLFPanel;
     NavSerializacionComponentes: THYMNavigator;
     NavSerializacionCompuesto: THYMNavigator;
     DBGSerieComponente: TDBGridFind2000;
     DBGSerieCompuesto: TDBGridFind2000;
     DSQMMaterialesLot_Ubi: TDataSource;
     DSQMCompuesto: TDataSource;
     DSSerieComponente: TDataSource;
     DSSerieCompuesto: TDataSource;
     ToolButton1: TToolButton;
     TButtAsignarLotesAutomaticamente: TToolButton;
     LUnidadesReservadas: TLFLabel;
     DBELUnidadesReservadas: TLFDbedit;
     LReservas: TLFLabel;
     DBEReservas: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BCancelarClick(Sender: TObject);
     procedure BSeguirClick(Sender: TObject);
     procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFCompuestoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormShow(Sender: TObject);
     procedure DBGLot_UbiKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFCompuestoBusqueda(Sender: TObject);
     procedure DBGLot_UbiBusqueda(Sender: TObject);
     procedure DBGSerieComponenteBusqueda(Sender: TObject);
     procedure DBGSerieCompuestoBusqueda(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure DBECompuestoChange(Sender: TObject);
     procedure TButtAsignarLotesAutomaticamenteClick(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     DM: TProDMIntroduceDatosCierre;
     { Private declarations }
  public
     { Public declarations }
     Situacion: integer;
     procedure FiltraSituacion(aSituacion: integer);
     function PuedeCerrar: boolean;
     function DameCierre: boolean;
  end;

var
  ProFMIntroduceDatosCierre : TProFMIntroduceDatosCierre;

implementation

uses UDMMain, UEntorno, UFMain, UProDMOrden, UUtiles, UDameDato;

{$R *.dfm}

procedure TProFMIntroduceDatosCierre.FormCreate(Sender: TObject);
var
  Habilitado : boolean;
  Columna : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMIntroduceDatosCierre, DM);
  PCMain.ActivePageIndex := 0;
  {
  Asigno el DataSet a los DataSource en vez de cambiar los DataSource de cada componente

  DBGLot_Ubi.DataSource := DM.DSQMMaterialesLot_Ubi;
  NavComponentes.DataSource := DM.DSQMMaterialesLot_Ubi;
  DBGFCompuesto.DataSource := DM.DSQMCompuesto;
  NavCompuesto.DataSource := DM.DSQMCompuesto;
  }
  DSQMMaterialesLot_Ubi.DataSet := DM.DSQMMaterialesLot_Ubi.DataSet;
  DSQMCompuesto.DataSet := DM.DSQMCompuesto.DataSet;
  DSSerieComponente.DataSet := DM.DSSerieComponente.DataSet;
  DSSerieCompuesto.DataSet := DM.DSSerieCompuesto.DataSet;

  // Habilito la edicion de ID_LOTE e ID_UBICACION del compuesto si todavía no está lanzada la orden
  Habilitado := (DM.QMCompuestoESTADO.AsInteger = 0);
  DBGFCompuesto.ReadOnly := not Habilitado;
  Columna := EncuentraField(DBGFCompuesto, 'ID_LOTE');
  if (Columna <> -1) then
  begin
     with DBGFCompuesto.Columns[Columna] do
     begin
        ReadOnly := Habilitado;
        if (Habilitado) then
           Color := clWindow
        else
           Color := clInfoBk;
     end;
  end;

  Columna := EncuentraField(DBGFCompuesto, 'ID_UBICACION');
  if (Columna <> -1) then
  begin
     with DBGFCompuesto.Columns[Columna] do
     begin
        ReadOnly := Habilitado;
        if (Habilitado) then
           Color := clWindow
        else
           Color := clInfoBk;
     end;
  end;

  // Asigno Imagenes a BitdBtn
  GetBitmapFromImageList(BSeguir, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BCancelar, 1, DMMain.ILMain_Ac, 20);
end;

procedure TProFMIntroduceDatosCierre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TProFMIntroduceDatosCierre.FormDestroy(Sender: TObject);
begin
  if Assigned(DM) then
  begin
     CierraData(DM);
     DM := nil;
  end;
end;

procedure TProFMIntroduceDatosCierre.BCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TProFMIntroduceDatosCierre.BSeguirClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TProFMIntroduceDatosCierre.DBGLot_UbiKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key in [VK_F3{VK_PRIOR, VK_NEXT, VK_END, VK_HOME, VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN}]) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
     begin
        DM.InfoLotes(True);
        DM.QMMaterialesLot_Ubi.Refresh;
     end;
  end;
end;

procedure TProFMIntroduceDatosCierre.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  HayDetalle : boolean;
  Articulo, Almacen : string;
  ControlStock, ControlUbicacion, Loteable : boolean;
begin
  if (Sender = DBGLot_Ubi) then
     HayDetalle := DM.HayDetalle(1)
  else
     HayDetalle := DM.HayDetalle(2);

  if HayDetalle then
  begin
     with TDBGridFind2000(Sender) do
     begin
        begin
           if (gdFocused in State) then
              ColorFocused(Canvas)
           else
           begin
              if ((UpperCase(Column.FieldName) = 'ID_LOTE') or
                 (UpperCase(Column.FieldName) = 'ID_UBICACION') or
                 (UpperCase(Column.FieldName) = 'UDS_POSIBLES')) then
              begin
                 if (Sender = DBGLot_Ubi) then
                 begin
                    Articulo := DM.QMMaterialesLot_UbiCOMPONENTE.AsString;
                    Almacen := DM.QMMaterialesLot_UbiALMACEN_SAL.AsString;
                    ControlStock := (DM.QMMaterialesLot_UbiCONTROL_STOCK.AsInteger = 1);
                    ControlUbicacion := (DM.QMMaterialesLot_UbiUBICABLE.AsInteger = 1);
                    Loteable := (DM.QMMaterialesLot_UbiLOTES.AsInteger = 1);
                 end
                 else
                 begin
                    Articulo := DM.QMCompuestoCOMPUESTO.AsString;
                    Almacen := DM.QMCompuestoALMACEN_SAL.AsString;
                    ControlStock := DMMain.ArticuloControlaStock(Articulo);
                    ControlUbicacion := ArticuloUbicable(Articulo);
                    Loteable := ArticuloLoteable(Articulo);
                 end;

                 if (UpperCase(Column.FieldName) = 'ID_LOTE') then
                 begin
                    if (ControlStock and Loteable) then
                       ColorEdicion(Canvas)
                    else
                       ColorInactivo(Canvas);
                 end;

                 if (UpperCase(Column.FieldName) = 'ID_UBICACION') then
                 begin
                    if (ControlStock and ControlUbicacion and DMMain.CompruebaControlUbicacionAlmacen(Almacen)) then
                       ColorEdicion(Canvas)
                    else
                       ColorInactivo(Canvas);
                 end;

                 { Esto solo si estamos reservando.
                 if (UpperCase(Column.FieldName) = 'UDS_POSIBLES') then
                 begin
                    if (not ControlStock) then
                       ColorInactivo(Canvas)
                    else
                    if (((DM.QMMaterialesLot_UbiUDS_POSIBLES.AsFloat >= 0) and
                       (DM.QMMaterialesLot_UbiUDS_POSIBLES.AsFloat >= ProDMOrden.QMProOrdUNI_TOTAL.AsFloat)) or
                       ((DM.QMMaterialesLot_UbiUDS_POSIBLES.AsFloat < 0) and
                       (DM.QMMaterialesLot_UbiUDS_POSIBLES.AsFloat <= ProDMOrden.QMProOrdUNI_TOTAL.AsFloat))) then
                       ColorInfo(Canvas)
                    else
                       ColorError(Canvas);
                 end;
                 }
              end;

              // Hago invisible el texto para que no se vea si no se controla stock
              { Solo debería funcionar en el caso de los campos que muestran unidades
              if (not ControlStock) then
                 Canvas.Font.Color := Canvas.Brush.Color;
              }
           end;
        end; {Solo pinto si está en estado Browse}
     end; {with DBGridFind2000}
  end; {if HayDetalle}

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TProFMIntroduceDatosCierre.DBGFCompuestoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
     begin
        DM.InfoLotes(False);
        DM.QMCompuesto.Refresh;
     end;
  end;
end;

procedure TProFMIntroduceDatosCierre.FormShow(Sender: TObject);
begin
  if (Situacion = 0) then // Deslanzada->Lanzada
  begin
     TSComponentes.TabVisible := False;
     TSSeriesComponente.TabVisible := False;
     TSCompuestos.TabVisible := True;
     TSSeriesCompuesto.TabVisible := True;
     if ((DMMain.DameConstanteProduccion('OF_CREAR_LOTE_LANZAR_OP') = 1) and
        (ArticuloLoteable(DM.QMCompuestoCOMPUESTO.AsString)) and
        ({(ProDMOrden.QMProOrdID_LOTE.AsInteger = 0) or }(DM.QMCompuestoID_LOTE.AsInteger = 0))) then
        DM.CrearLoteCompuestoAuto;

     // Es mira si té marcat el check de creació automàtica de series de compost
     if (DMMain.DameConstanteProduccion('CONTADOR_CREACION_AUTO') = 1) then
        DM.CrearSeriesCompuesto;
  end
  else
  begin
     TSComponentes.TabVisible := True;
     TSSeriesComponente.TabVisible := True;
     TSCompuestos.TabVisible := True;
     TSSeriesCompuesto.TabVisible := True;
  end;
end;

procedure TProFMIntroduceDatosCierre.DBGFCompuestoBusqueda(Sender: TObject);
begin
  if (Trim(DBGFCompuesto.TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
     DBGFCompuesto.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + DM.QMCompuestoALMACEN_ENT.AsString + '''';
end;

procedure TProFMIntroduceDatosCierre.DBGLot_UbiBusqueda(Sender: TObject);
begin
  if (Trim(DBGLot_Ubi.TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
     DBGLot_Ubi.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + DM.QMMaterialesLot_UbiALMACEN.AsString + '''';
end;

procedure TProFMIntroduceDatosCierre.DBGSerieComponenteBusqueda(Sender: TObject);
begin
  // Acabar de fer la busqueda per buscar les series d'aquell component
  if Trim(DBGSerieComponente.TablaABuscar) = 'VER_DETALLE_SERIALIZACION' then
  begin
     DBGSerieComponente.CondicionBusqueda := 'CANAL = ' + IntToStr(DM.QMSerieComponenteCANAL.AsInteger) +
        ' AND ARTICULO = ''' + DBGSerieComponente.Fields[1].Text +
        ''' ' + ' AND ALMACEN = ''' + ProDMOrden.QMProOrdALMACEN_SAL.AsString + '''' +
        ' AND NSERIE NOT IN (select cod_serializacion from pro_serializacion_orden where tipo = 1 and traspasado = 0 and componente = ''' + DM.QMSerieComponenteCOMPONENTE.AsString + '''' + ')';
  end;
end;

procedure TProFMIntroduceDatosCierre.DBGSerieCompuestoBusqueda(Sender: TObject);
begin
  // Acabar de fer la busqueda per buscar les series d'aquell compost
  if Trim(DBGSerieCompuesto.TablaABuscar) = 'ART_ARTICULOS_SERIALIZACION' then
  begin
     DBGSerieCompuesto.CondicionBusqueda := 'CANAL = ' + IntToStr(DM.QMSerieCompuestoCANAL.AsInteger) +
        ' AND ARTICULO = ''' + DM.QMSerieCompuestoCOMPONENTE.AsString +
        ''' ' + ' AND ALMACEN = ''' + DM.QMSerieCompuestoALMACEN.AsString + '''' +
        ' AND NSERIE NOT IN (select cod_serializacion from pro_serializacion_orden where componente = ''' + DM.QMSerieCompuestoCOMPONENTE.AsString + '''' + ')';
  end;
end;

function TProFMIntroduceDatosCierre.PuedeCerrar: boolean;
var
  error_compuesto_lote, error_compuesto_ubi, error_compuesto_serie, error_componente_lote, error_componente_ubi, error_componente_serie : integer;
begin
  /// Comprueba que los datos esten completos para poder generar el cierre

  Result := True;

  DM.ComprobarInfoCierre(error_compuesto_lote, error_compuesto_ubi, error_compuesto_serie, error_componente_lote, error_componente_ubi,
     error_componente_serie);

  if ((error_componente_lote > 0) or (error_componente_ubi > 0) or (error_compuesto_lote > 0) or (error_compuesto_ubi > 0) or
     (error_compuesto_serie > 0) or (error_componente_serie > 0)) then
  begin
     ShowMessage(Format(_('ERROR: No se permite el cierre porque falta informar los siguientes datos:' + #13#10 +
        'Lote (componente): %d articulo/s' + #13#10 +
        'Ubicación (componente): %d articulo/s' + #13#10 +
        'Lote(compuesto): %d articulo/s' + #13#10 +
        'Ubicación(compuesto): %d articulo/s' + #13#10 +
        'Serialización (compuesto): %d articulo/s' + #13#10 +
        'Serialización (componente): %d articulo/s'),
        [error_componente_lote, error_componente_ubi, error_compuesto_lote, error_compuesto_ubi,
        error_compuesto_serie, error_componente_serie]));
     Result := False;
  end;
end;

procedure TProFMIntroduceDatosCierre.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  // Es comproba si han introduit totes les dades. Si no, no et deixa sortirdel form.
  // Torna 0 si no hi ha cap error. Sinó torna 1
  if (ModalResult <> mrCancel) then
  begin
     // Llançada + Reservada o Cerrada Parcialmente -> Cierre
     if (Situacion >= 2) then
        CanClose := PuedeCerrar;
  end;
end;

procedure TProFMIntroduceDatosCierre.DBECompuestoChange(Sender: TObject);
begin
  ETituloCompuesto.Text := DameTituloArticulo(DBECompuesto.Text);
end;

procedure TProFMIntroduceDatosCierre.FiltraSituacion(aSituacion: integer);
begin
  DM.FiltraSituacion(aSituacion);
  Situacion := aSituacion;
  DM.CreaRegistro;
  NavCompuesto.EditaControl := DBGFCompuesto;
end;

procedure TProFMIntroduceDatosCierre.TButtAsignarLotesAutomaticamenteClick(Sender: TObject);
begin
  DM.AsignaLotesAutomaticamente;
end;

function TProFMIntroduceDatosCierre.DameCierre: boolean;
begin
  Result := (ShowModal = mrOk);
end;

end.
