unit UProFMIntroduceDatosReserva;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UFormGest, StdCtrls, ULFLabel, Buttons,
  rxPlacemnt, ULFFormStorage, UNavigator, ToolWin, ComCtrls, ULFToolBar,
  ULFPageControl, Mask, DBCtrls, ULFDBEdit, UHYDescription,
  ULFHYDBDescription, ULFEdit, UProDMIntroduceDatosReserva, DB, HYFIBQuery,
  ULFDBMemo, rxToolEdit, RXDBCtrl, ULFDBDateEdit;

type
  TProFMIntroduceDatosReserva = class(TG2KForm)
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
     DBEFCompuesto: TLFDbedit;
     EDescCompuesto: TLFEdit;
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
     LUnidadesPosibles: TLFLabel;
     LMinUnidadesPosibles: TLFLabel;
     DSQMMaterialesLot_Ubi: TDataSource;
     DSQMCompuesto: TDataSource;
     DSSerieComponente: TDataSource;
     DSSerieCompuesto: TDataSource;
     LUnidadesAReservar: TLFLabel;
     DBEUnidadesAReservar: TLFDbedit;
     ToolButton1: TToolButton;
     TButtAsignarLotesAutomaticamente: TToolButton;
     LUnidadesReservadas: TLFLabel;
     DBELUnidadesReservadas: TLFDbedit;
     LReservas: TLFLabel;
     DBEReservas: TLFDbedit;
     BBorrarReserva: TBitBtn;
     LUnidadesPendientesReservar: TLFLabel;
     DBEUnidadesPendientesReservar: TLFDbedit;
     BBReservar: TBitBtn;
     BDesreservar: TBitBtn;
     DBEEsado: TLFDbedit;
     EEstado: TLFEdit;
     btnImprimirPreparacion: TBitBtn;
     btnImprimirReserva: TBitBtn;
     BtnImprimirEtiqueta: TBitBtn;
     PNLComentarioReserva: TLFPanel;
     MComentarioReserva: TLFDBMemo;
     NavNotasReserva: THYMNavigator;
     TBNotasreserva: TLFToolBar;
     DBDEFechaReserva: TLFDBDateEdit;
     LFechaReserva: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFCompuestoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormShow(Sender: TObject);
     procedure DBGLot_UbiKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFCompuestoBusqueda(Sender: TObject);
     procedure DBGLot_UbiBusqueda(Sender: TObject);
     procedure DBGSerieComponenteBusqueda(Sender: TObject);
     procedure DBGSerieCompuestoBusqueda(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure DBEFCompuestoChange(Sender: TObject);
     procedure TButtAsignarLotesAutomaticamenteClick(Sender: TObject);
     procedure DBEUnidadesAReservarKeyPress(Sender: TObject; var Key: char);
     procedure DBEUnidadesAReservarExit(Sender: TObject);
     procedure BDesreservarClick(Sender: TObject);
     procedure BBReservarClick(Sender: TObject);
     procedure DBEEsadoChange(Sender: TObject);
     procedure BBorrarReservaClick(Sender: TObject);
     procedure BSeguirClick(Sender: TObject);
     procedure btnImprimirPreparacionClick(Sender: TObject);
     procedure btnImprimirReservaClick(Sender: TObject);
     procedure BtnImprimirEtiquetaClick(Sender: TObject);
     procedure DBEUnidadesAReservarChange(Sender: TObject);
     procedure DBEUnidadesAReservarEnter(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     DM: TProDMIntroduceDatosReserva;
     fIdReserva: integer;
     ModoReadOnly: boolean;
     CreandoReserva: boolean;
     { Private declarations }
  public
     { Public declarations }
     Situacion: integer;
     UnidadesAReservar: double;
     procedure FiltraSituacion(aSituacion: integer; ForzarReserva: boolean = False);
     function PuedeReservar: boolean;
     function PuedeCerrar: boolean;
     function DameIdReserva: integer;
     property IdReserva: integer Read fIdReserva;
     procedure Muestra(IdReserva: integer);
  end;

var
  ProFMIntroduceDatosReserva : TProFMIntroduceDatosReserva;

implementation

uses UDMMain, UEntorno, UFMain, UProDMOrden, UUtiles, UDameDato, UDMPreparacionReserva,
  UFMSeleccionGrid, UFMSeleccion;

{$R *.dfm}

procedure TProFMIntroduceDatosReserva.FormCreate(Sender: TObject);
var
  Habilitado : boolean;
  Columna : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMIntroduceDatosReserva, DM);
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
  Columna := EncuentraField(DBGFCompuesto, 'ID_LOTE_RESERVA');
  if (Columna <> -1) then
  begin
     with DBGFCompuesto.Columns[Columna] do
     begin
        ReadOnly := not Habilitado;
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
        ReadOnly := not Habilitado;
        if (Habilitado) then
           Color := clWindow
        else
           Color := clInfoBk;
     end;
  end;

  fIdReserva := 0;
  ModoReadOnly := False;
  CreandoReserva := False;

  // Asigno Imagenes a BitBtn
  GetBitmapFromImageList(BBorrarReserva, 1, DMMain.ILMain_Ac, 39);
  GetBitmapFromImageList(BBorrarReserva, 2, DMMain.ILMain_In, 39);
  GetBitmapFromImageList(BBReservar, 1, DMMain.ILMain_Ac, 7);
  GetBitmapFromImageList(BDesreservar, 1, DMMain.ILMain_Ac, 6);
  GetBitmapFromImageList(btnImprimirPreparacion, 1, DMMain.ILMain_Ac, 14);
  GetBitmapFromImageList(btnImprimirReserva, 1, DMMain.ILMain_Ac, 14);
  GetBitmapFromImageList(BtnImprimirEtiqueta, 1, DMMain.ILMain_Ac, 95);
  GetBitmapFromImageList(BSeguir, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BSeguir, 2, DMMain.ILMain_In, 19);
  GetBitmapFromImageList(BCancelar, 1, DMMain.ILMain_Ac, 20);
  GetBitmapFromImageList(BCancelar, 2, DMMain.ILMain_In, 20);
end;

procedure TProFMIntroduceDatosReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ProDMOrden.xInfoActualizada.Refresh;

  Action := caHide;
end;

procedure TProFMIntroduceDatosReserva.FormDestroy(Sender: TObject);
begin
  if Assigned(DM) then
  begin
     CierraData(DM);
     DM := nil;
  end;
end;

procedure TProFMIntroduceDatosReserva.DBGLot_UbiKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (DBEEsado.Text = '0') then
  begin
     // if not (Key in [VK_PRIOR, VK_NEXT, VK_END, VK_HOME, VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN]) then
     if (Key = VK_F3) then
     begin
        with TDBGridFind2000(Sender) do
        begin
           // Primero grabo los datos para tener en la tabla las cantidades
           if (DataSource.DataSet.State = dsEdit) then
              DataSource.DataSet.Post;

           if (ColumnaActual = 'ID_LOTE') then
              DM.InfoLotes(True);

           // Refresco los datos para mostrar el lote asignado
           DataSource.DataSet.Refresh;
        end;
     end;
  end;
end;

procedure TProFMIntroduceDatosReserva.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
              if ((UpperCase(Column.FieldName) = 'ID_LOTE_RESERVA') or
                 (UpperCase(Column.FieldName) = 'ID_LOTE') or
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

                 if ((UpperCase(Column.FieldName) = 'ID_LOTE') or
                    (UpperCase(Column.FieldName) = 'ID_LOTE_RESERVA')) then
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

procedure TProFMIntroduceDatosReserva.DBGFCompuestoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Seleccion : TFMSeleccionGrid;
  s : TStrings;
  Lote, Clasificacion : string;
  IdLote : integer;
  ExisteLote : boolean;
  Familia : string;
begin
  Lote := '';
  Familia := '';
  //Obtenemos la familia del compuesto
  if (DBEEsado.Text = '0') then
  begin
     if (Key = VK_F3) then
     begin
        if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE_RESERVA') then
        begin
           // Verificamos si existen lotes en reservas de ordenes relacionadas
           ExisteLote := DM.ExistenLotesOrdenesRelacionadas(DM.QMCompuestoID_ORDEN.AsInteger, DM.QMCompuestoID_RESERVA.AsInteger);
           //Si existe lote y la familia no es Profin
           if ((ExisteLote) and (DM.QMCompuestoFAMILIA.AsString <> '33')) then
           begin
              Seleccion := TFMSeleccionGrid.Create(Self);
              with Seleccion do
              begin
                 Caption := _('Asigna Lote');
                 try
                    s := TStringList.Create;
                    try
                       with s do
                       begin
                          Add(' SELECT LP.ID_LOTE, LP.LOTE, LP.CLASIFICACION, LP.NOTAS ');
                          Add(' FROM PRO_DAME_LOTES_POSIBLES_JVV(' + IntToStr(DM.QMCompuestoID_RESERVA.AsInteger) + ') P ');
                          Add(' JOIN ART_ARTICULOS_LOTES LP ON (P.ID_LOTE = LP.ID_LOTE) ');
                       end;
                       Caption := _('Selección de clasificación');
                       AsignaSQL(s.Text);
                    finally
                       s.Free
                    end;
                    //MostrarColumna('ID_LOTE', _('Clasificacion'), 60);
                    MostrarColumna('CLASIFICACION', _('Clasificacion'), 200);
                    Lote := '';
                    if (ShowModal = mrOk) then
                    begin
                       Lote := FDS.FieldByName('LOTE').AsString;
                       Clasificacion := FDS.FieldByName('CLASIFICACION').AsString;
                       IdLote := DMMain.CrearLote(DameIDArticulo(DM.QMCompuestoCOMPUESTO.AsString), '', Clasificacion);
                       // Copiamos las notas del lote seleccionado al nuevo lote
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'UPDATE ART_ARTICULOS_LOTES SET NOTAS = :NOTAS WHERE ID_LOTE = :ID_LOTE ';
                             Params.ByName['NOTAS'].AsString := FDS.FieldByName('NOTAS').AsString;
                             Params.ByName['ID_LOTE'].AsInteger := IdLote;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                       // Finalmente lo asigno a la reserva
                       DM.AsignaLoteReserva(DM.QMCompuestoID_RESERVA.AsInteger, DM.QMCompuestoID_ORDEN.AsInteger, IdLote);
                    end;
                 finally
                    FreeAndNil(Seleccion);
                 end;
              end;
           end
           else
           begin
              // KRICONF-493 - Temas especificos de JVV
              if ((DM.QMCompuestoFAMILIA.AsString = '33') and (DMMain.EstadoKri(493) = 1)) then
              begin
                 // Verificamos si la reserva tiene mas un SEMI, si es asi la clasificacion del compuesto sera el id_lote del compuesto
                 if (ProDMIntroduceDatosReserva.ReservaTieneMultiplesSemielaborados(DM.QMMaterialesLot_UbiID_ORDEN.AsInteger, DM.QMMaterialesLot_UbiLINEA_RES.AsInteger)) then
                 begin
                    // Asignamos directamente el lote al compuesto
                    IdLote := DMMain.CrearLote(DameIDArticulo(DM.QMCompuestoCOMPUESTO.AsString), '', 'CLASIFICACION <- ID_LOTE');
                    Lote := IntToStr(IdLote);

                    // Finalmente lo asigno a la reserva
                    DM.AsignaLoteReserva(DM.QMCompuestoID_RESERVA.AsInteger, DM.QMCompuestoID_ORDEN.AsInteger, IdLote);
                 end
                 else
                 begin
                    // Si se trata de un profin, se deberian buscarlos id_lote de los componentes
                    Seleccion := TFMSeleccionGrid.Create(Self);
                    with Seleccion do
                    begin
                       Caption := _('Asigna Lote');
                       try
                          s := TStringList.Create;
                          try
                             with s do
                             begin
                                Add(' SELECT CLASIFICACION ');
                                Add(' FROM DAME_CLASIFICACION_PROFIN_JVV(' + IntToStr(DM.QMCompuestoID_RESERVA.AsInteger) + ') ');
                             end;
                             AsignaSQL(s.Text);
                          finally
                             s.Free
                          end;
                          //MostrarColumna('ID_LOTE', _('Clasificacion'), 60);
                          MostrarColumna('CLASIFICACION', _('Clasificacion'), 200);
                          Lote := '';
                          if (ShowModal = mrOk) then
                          begin
                             //Lote := FDS.FieldByName('LOTE').AsString;
                             Clasificacion := FDS.FieldByName('CLASIFICACION').AsString;
                             IdLote := DMMain.CrearLote(DameIDArticulo(DM.QMCompuestoCOMPUESTO.AsString), '', Clasificacion);
                             Lote := IntToStr(IdLote);
                             // Finalmente lo asigno a la reserva
                             DM.AsignaLoteReserva(DM.QMCompuestoID_RESERVA.AsInteger, DM.QMCompuestoID_ORDEN.AsInteger, IdLote);
                          end;
                       finally
                          FreeAndNil(Seleccion);
                       end;
                    end;
                 end;
              end;
           end;

           if (Lote = '') then
              DM.InfoLotes(False);

           DM.QMCompuesto.Refresh;
        end;
     end;
  end;
end;

procedure TProFMIntroduceDatosReserva.FormShow(Sender: TObject);
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

  with LMinUnidadesPosibles do
  begin
     // Si es el valor inicial por defecto, vacio el caption.
     if (DM.MinUnidadesPosibles = 999999999) then
        Caption := ''
     else
        Caption := DMMain.DameUnidadesConFormato(DBEFCompuesto.Text, DM.MinUnidadesPosibles);

     if (DM.MinUnidadesPosibles >= ProDMOrden.QMProOrdUNI_TOTAL.AsFloat) then
     begin
        Font.Color := clWindowText;
        Color := clLime;
     end
     else
     begin
        Font.Color := clWhite;
        Color := clRed;
     end;
  end;
end;

procedure TProFMIntroduceDatosReserva.DBGFCompuestoBusqueda(Sender: TObject);
begin
  if (Trim(DBGFCompuesto.TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
     DBGFCompuesto.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + DM.QMCompuestoALMACEN_ENT.AsString + '''';
end;

procedure TProFMIntroduceDatosReserva.DBGLot_UbiBusqueda(Sender: TObject);
begin
  if (Trim(DBGLot_Ubi.TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
     DBGLot_Ubi.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + DM.QMMaterialesLot_UbiALMACEN.AsString + '''';
end;

procedure TProFMIntroduceDatosReserva.DBGSerieComponenteBusqueda(Sender: TObject);
begin
  if Trim(DBGSerieComponente.TablaABuscar) = 'ART_ARTICULOS_SERIALIZACION' then
     DBGSerieComponente.CondicionBusqueda := Format('CANAL = %d AND ARTICULO = ''%s'' AND ALMACEN = ''%s'' AND ESTADO = 1', [DM.QMSerieComponenteCANAL.AsInteger, DBGSerieComponente.Fields[1].Text, ProDMOrden.QMProOrdALMACEN_SAL.AsString]);

  {
  // Acabar de fer la busqueda per buscar les series d'aquell component
  if Trim(DBGSerieComponente.TablaABuscar) = 'VER_DETALLE_SERIALIZACION' then
  begin
     DBGSerieComponente.CondicionBusqueda := 'CANAL = ' + IntToStr(DM.QMSerieComponenteCANAL.AsInteger) +
        ' AND ARTICULO = ''' + DBGSerieComponente.Fields[1].Text +
        ''' ' + ' AND ALMACEN = ''' + ProDMOrden.QMProOrdALMACEN_SAL.AsString + '''' +
        ' AND NSERIE NOT IN (select cod_serializacion from pro_serializacion_orden where tipo = 1 and traspasado = 0 and componente = ''' + DM.QMSerieComponenteCOMPONENTE.AsString + '''' + ')';
  end;
  }
end;

procedure TProFMIntroduceDatosReserva.DBGSerieCompuestoBusqueda(Sender: TObject);
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

function TProFMIntroduceDatosReserva.PuedeReservar: boolean;
var
  error_compuesto_lote, error_compuesto_ubi, error_compuesto_serie, error_componente_lote, error_componente_ubi, error_componente_serie : integer;
begin
  /// Comprueba que los datos esten completos para poder generar la reserva

  Result := True;

  DM.ComprobarInfoCierre(error_compuesto_lote, error_compuesto_ubi, error_compuesto_serie, error_componente_lote, error_componente_ubi,
     error_componente_serie);

  if ((error_componente_lote > 0) or (error_componente_ubi > 0) {or (error_compuesto_lote > 0) or (error_compuesto_ubi > 0)} or
     (error_compuesto_serie > 0) or (error_componente_serie > 0)) then
  begin
     ShowMessage(Format(_('ERROR: No se permite la reserva porque falta informar los siguientes datos:' + #13#10 +
        'Lote (componente): %d articulo/s' + #13#10 +
        'Ubicación (componente): %d articulo/s' + #13#10 +
        'Serialización (componente): %d articulo/s'),
        [error_componente_lote, error_componente_ubi, error_componente_serie]));
     Result := False;
  end;

  if (Result and (error_compuesto_lote > 0)) then
  begin
     Result := (MessageDlg(_('El compuesto no tiene lotes asignados. ¿Desea seguir?'), mtWarning, [mbYes, mbNo], 0) = mrYes);
  end;
end;

function TProFMIntroduceDatosReserva.PuedeCerrar: boolean;
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

procedure TProFMIntroduceDatosReserva.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  // Es comproba si han introduit totes les dades. Si no, no et deixa sortirdel form.
  // Torna 0 si no hi ha cap error. Sinó torna 1
  if (DBEEsado.Text <> '5') then
  begin
     if (ModalResult = mrOk) then
     begin
        // Llançada -> Reservada
        // if (Situacion = 1) then
        CanClose := PuedeReservar;

        {
        // Llançada + Reservada o Cerrada Parcialmente -> Cierre
        if (Situacion >= 2) then
           CanClose := PuedeCerrar;
        }
     end
     else
     if (ModalResult = mrCancel) then
     begin
        if CreandoReserva then
           DM.BorraRegistroReserva;
     end;
  end;
end;

procedure TProFMIntroduceDatosReserva.DBEFCompuestoChange(Sender: TObject);
begin
  EDescCompuesto.Text := DameTituloArticulo(DBEFCompuesto.Text);
end;

procedure TProFMIntroduceDatosReserva.FiltraSituacion(aSituacion: integer; ForzarReserva: boolean = False);
begin
  // Siempre debemos tratarlo como Situacion 1 (Lanzada), porque en este formulario solo se reserva.
  DM.FiltraSituacion(1 {aSituacion});
  Situacion := aSituacion;
  LUnidadesAReservar.Visible := True {(Situacion = 1) or ForzarReserva};
  DBEUnidadesAReservar.Visible := True {(Situacion = 1) or ForzarReserva};
  DBEUnidadesAReservar.Text := DBEUnidades.Text;
  UnidadesAReservar := StrToFloatDef(DBEUnidadesAReservar.Text, 0);

  fIdReserva := DM.CreaRegistroReserva;
end;

procedure TProFMIntroduceDatosReserva.TButtAsignarLotesAutomaticamenteClick(Sender: TObject);
begin
  DM.AsignaLotesAutomaticamente;
end;

procedure TProFMIntroduceDatosReserva.DBEUnidadesAReservarKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
     if (DSQMCompuesto.DataSet.State = dsEdit) then
        DSQMCompuesto.DataSet.Post;
     key := #0;
     DBEUnidadesAReservar.SelectAll;
  end;
end;

function TProFMIntroduceDatosReserva.DameIdReserva: integer;
begin
  Result := 0;
  BDesreservar.Visible := False;
  CreandoReserva := True;
  if (ShowModal = mrOk) then
     Result := fIdReserva;
end;

procedure TProFMIntroduceDatosReserva.DBEUnidadesAReservarExit(Sender: TObject);
begin
  if (DSQMCompuesto.DataSet.State = dsEdit) then
     DSQMCompuesto.DataSet.Post;
end;

procedure TProFMIntroduceDatosReserva.Muestra(IdReserva: integer);
begin
  //  ModoReadOnly := True;

  fIdReserva := IdReserva;
  DM.FiltraReserva(fIdReserva);
  // LUnidadesAReservar.Visible := False;
  // DBEUnidadesAReservar.Visible := False;
  // LUnidadesPosibles.Visible := False;
  // LMinUnidadesPosibles.Visible := False;

  BCancelar.Visible := False;
  BBorrarReserva.Visible := True;

  Situacion := 1;

  {
  DBGLot_Ubi.ReadOnly := True;
  DBGFCompuesto.ReadOnly := True;
  DBGSerieComponente.ReadOnly := True;
  DBGSerieCompuesto.ReadOnly := True;
  }

  ShowModal;
end;

procedure TProFMIntroduceDatosReserva.BDesreservarClick(Sender: TObject);
begin
  if (DBEEsado.Text = '5') then
     DM.DesReservar;
end;

procedure TProFMIntroduceDatosReserva.BBReservarClick(Sender: TObject);
begin
  if (StrToIntDef(DBEEsado.Text, 0) = 0) then
  begin
     if CreandoReserva then
        ModalResult := mrOk
     else
     begin
        UnidadesAReservar := StrToFloatDef(DBEUnidadesAReservar.Text, 0);
        if (PuedeReservar) then
           DM.Reservar;

        // Salgo como si hubiera cancelado para evitar comprobaciones.
        ModalResult := mrCancel;
     end;
  end
  else
  begin
     ModalResult := mrCancel;
  end;
end;

procedure TProFMIntroduceDatosReserva.DBEEsadoChange(Sender: TObject);
begin
  EEstado.Text := DameTituloEstado(StrToIntDef(DBEEsado.Text, 0));
end;

procedure TProFMIntroduceDatosReserva.BBorrarReservaClick(Sender: TObject);
begin
  DM.BorraRegistroReserva;
  ModalResult := mrCancel;
end;

procedure TProFMIntroduceDatosReserva.BSeguirClick(Sender: TObject);
begin
  if CreandoReserva then
     ModalResult := mrIgnore;
end;

procedure TProFMIntroduceDatosReserva.btnImprimirPreparacionClick(Sender: TObject);
begin
  AbreData(TDMPreparacionReserva, DMPreparacionReserva);
  DMPreparacionReserva.MostrarListadoPreparacion(0, fIdReserva);
  CierraData(DMPreparacionReserva);
end;

procedure TProFMIntroduceDatosReserva.btnImprimirReservaClick(Sender: TObject);
begin
  AbreData(TDMPreparacionReserva, DMPreparacionReserva);
  DMPreparacionReserva.MostrarListadoReserva(0, fIdReserva);
  CierraData(DMPreparacionReserva);
end;

procedure TProFMIntroduceDatosReserva.BtnImprimirEtiquetaClick(Sender: TObject);
var
  CantidadEtiquetas : integer;
begin
  CantidadEtiquetas := 1;

  if (PideDato('INT', CantidadEtiquetas, 'Etiqueta')) then
  begin
     AbreData(TDMPreparacionReserva, DMPreparacionReserva);
     DMPreparacionReserva.MostrarListadoEtiqueta(1, fIdReserva, CantidadEtiquetas);
     CierraData(DMPreparacionReserva);
  end;
end;

procedure TProFMIntroduceDatosReserva.DBEUnidadesAReservarChange(Sender: TObject);
begin
  if (StrToFloatDef(DBEUnidadesAReservar.Text, 0) > StrToFloatDef(LMinUnidadesPosibles.Caption, 0)) then
     ColorError(DBEUnidadesAReservar)
  else
     ColorEdicion(DBEUnidadesAReservar);
end;

procedure TProFMIntroduceDatosReserva.DBEUnidadesAReservarEnter(Sender: TObject);
begin
  if (StrToFloatDef(DBEUnidadesAReservar.Text, 0) > StrToFloatDef(LMinUnidadesPosibles.Caption, 0)) then
     ColorError(DBEUnidadesAReservar)
  else
     ColorEdicion(DBEUnidadesAReservar);
end;

end.
