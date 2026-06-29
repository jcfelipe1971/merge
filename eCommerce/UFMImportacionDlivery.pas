unit UFMImportacionDlivery;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UFPEditSimple, UNavigator,
  StdCtrls, Buttons, ULFEdit, ULFLabel, ULFEditFind2000, Mask, rxToolEdit,
  ULFDateEdit, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMImportacionDlivery = class(TFPEditSimple)
     DBGPedidosDlivery: TDBGridFind2000;
     AImportarDlivery: TAction;
     PNLProgreso: TPanel;
     TSep1: TToolButton;
     AMarcarTodos: TAction;
     ADesmarcarTodos: TAction;
     PNLFiltro: TPanel;
     ARecargar: TAction;
     GBCliente: TGroupBox;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EFHastaCliente: TLFEditFind2000;
     EFDesdeCliente: TLFEditFind2000;
     ETituloClienteDesde: TLFEdit;
     ETituloClienteHasta: TLFEdit;
     TButtMarcarTodos: TToolButton;
     TButtDesmarcarTodos: TToolButton;
     TButtRefrescar: TToolButton;
     TButtGeneraPedidos: TToolButton;
     AGeneraPedidos: TAction;
     GBFechas: TGroupBox;
     DEHastaFecha: TLFDateEdit;
     DEDesdeFecha: TLFDateEdit;
     Desde: TLFLabel;
     Hasta: TLFLabel;
     TBSep1: TToolButton;
     TBSep2: TToolButton;
     TBSep3: TToolButton;
     TBVerTodos: TToolButton;
     TBVerPendientes: TToolButton;
     AVerTodos: TAction;
     AVerPendientes: TAction;
     ABorraRegistrosPendientes: TAction;
     RGOrden: TRadioGroup;
     procedure FormCreate(Sender: TObject);
     procedure AImportarDliveryExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGPedidosDliveryDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGPedidosDliveryCellClick(Column: TColumn);
     procedure DBGPedidosDliveryDblClick(Sender: TObject);
     procedure DBGPedidosDliveryBusqueda(Sender: TObject);
     procedure EFDesdeClienteChange(Sender: TObject);
     procedure EFHastaClienteChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AGeneraPedidosExecute(Sender: TObject);
     procedure DEDesdeFechaChange(Sender: TObject);
     procedure DEHastaFechaChange(Sender: TObject);
     procedure AMarcarTodosExecute(Sender: TObject);
     procedure ADesmarcarTodosExecute(Sender: TObject);
     procedure AVerTodosExecute(Sender: TObject);
     procedure AVerPendientesExecute(Sender: TObject);
     procedure ABorraRegistrosPendientesExecute(Sender: TObject);
     procedure CBClienteChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     VerSoloPendientes: boolean;
     procedure Filtrar;
  public
     { Public declarations }
  end;

var
  FMImportacionDlivery : TFMImportacionDlivery;

implementation

uses
  UDMMain, UFormGest, UHojaCalc, UDMImportacionDlivery, UUtiles, DateUtils,
  UFMain, UEntorno, HYFIBQuery, UDameDato;

{$R *.dfm}

procedure TFMImportacionDlivery.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImportacionDlivery, DMImportacionDlivery);
  NavMain.DataSource := DMImportacionDlivery.DSQMPedidosDlivery;
  DBGPedidosDlivery.DataSource := DMImportacionDlivery.DSQMPedidosDlivery;
  DBGPedidosDlivery.ColumnasChecked.Strings[DBGPedidosDlivery.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] := IntToStr(REntorno.Entrada);
  ColActual := DBGPedidosDlivery.Columns[0];

  ARecargarExecute(Self);
end;

procedure TFMImportacionDlivery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImportacionDlivery);
end;

procedure TFMImportacionDlivery.AImportarDliveryExecute(Sender: TObject);
var
  HCalc : THojaCalc;
  Archivo : string;
  i, LineaInicial, Lineas, Columnas, c : integer;
  Cancelar : boolean;

  ContieneFilaTitulos : boolean;
  Columna_IDOrigen, Columna_Fecha, Columna_NombreCliente, Columna_DireccionRecogida, Columna_ComunaRecogida, Columna_Persona, Columna_TelefonoEntrega, Columna_DireccionEntrega, Columna_ComunaEntrega, Columna_Comentario, Columna_Movil, Columna_Estado, Columna_FechaEntrega, Columna_ComentarioEntrega{, Columna_FechaRetiro} : integer;

  IdOrigen : integer;
  Fecha, FechaEntrega{, FechaRetiro} : TDateTime;

  Excel_IDOrigen, Excel_Fecha, Excel_NombreCliente, Excel_DireccionRecogida, Excel_ComunaRecogida, Excel_Persona, Excel_TelefonoEntrega, Excel_DireccionEntrega, Excel_ComunaEntrega, Excel_CodPostalEntrega, Excel_Comentario, Excel_Movil, Excel_Estado, Excel_FechaEntrega, Excel_ComentarioEntrega{, Excel_FechaRetiro} : string;

  function DameDatoCelda(Hoja: THojaCalc; Linea, Columna: integer): string;
  begin
     if (Columna > 0) then
     begin
        try
           Result := Hoja.CellText[Linea, Columna];
        except
           Result := '';
        end;
     end;
  end;

begin
  inherited;
  // Inicializamos Configuracion de columnas de Excel
  ContieneFilaTitulos := True;
  Columna_IDOrigen := 0;
  Columna_Fecha := 0;
  // Columna_FechaRetiro := 0;
  Columna_NombreCliente := 0;
  Columna_DireccionRecogida := 0;
  Columna_ComunaRecogida := 0;
  Columna_Persona := 0;
  Columna_TelefonoEntrega := 0;
  Columna_DireccionEntrega := 0;
  Columna_ComunaEntrega := 0;
  Columna_Comentario := 0;
  Columna_Movil := 0;
  Columna_Estado := 0;
  Columna_FechaEntrega := 0;
  Columna_ComentarioEntrega := 0;

  Archivo := '';
  if MyOpenDialog(Archivo, 'XLS,ODS,TXT', '', 'FMImportacionDlivery-ImportarDlivery') then
  begin
     TSep1.Visible := True;
     PNLProgreso.Visible := True;
     PNLProgreso.Align := alClient;
     PNLProgreso.Width := Self.Width - TSep1.Left - TSep1.Width - 10;
     PNLProgreso.Caption := '';
     try
        HCalc := THojaCalc.Create(Archivo, False);
        try
           DMMain.Log('Seleccionando hoja "INPUT"');
           PNLProgreso.Caption := 'Seleccionando hoja "INPUT"';
           try
              HCalc.ActivateSheetByName('INPUT', False);
           except
              DMMain.Log('No se ha podido selecionar la hoja "INPUT"');
           end;

           // TODO Verificamos que la hoja activa sea IMP_DLIBERY?
           // Activamos la hoja de importacion, TODO: Ver si esto es necesario
           // HCalc.ActiveSheetName;
           Lineas := HCalc.LastRow;
           Columnas := HCalc.LastCol;

           PNLProgreso.Caption := Format('LastRow: %d, LastCol: %d', [Lineas, Columnas]);
           DMMain.Log(Format('LastRow: %d, LastCol: %d', [Lineas, Columnas]));

           Cancelar := False;

           LineaInicial := 1;
           if ContieneFilaTitulos then
           begin
              // Configuracion de columnas de Excel
              // Las columnas tienen el titulo del campo a importar
              for c := 1 to Columnas + 1 do
              begin
                 DMMain.Log(Format('Linea: %d, Columna %d, Datos: %s', [LineaInicial, c, DameDatoCelda(HCalc, LineaInicial, c)]));

                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'ID_ORIGEN') then
                    Columna_IDOrigen := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'FECHA_PEDIDO') then
                    Columna_Fecha := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'CLIENTE') then
                    Columna_NombreCliente := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'DIRECCION_RETIRO') then
                    Columna_DireccionRecogida := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'COMUNA_RETIRO') then
                    Columna_ComunaRecogida := c;
                 //Este campo aparentemente se usara solo desde la App para Android
{                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'FECHA_RETIRO') then
                    Columna_FechaRetiro := c;}
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'PERSONA_ENTREGA') then
                    Columna_Persona := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'TEL_ENTREGA') then
                    Columna_TelefonoEntrega := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'DIREC_ENTREGA') then
                    Columna_DireccionEntrega := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'COMUNA_COD_ENTREGA') then
                    Columna_ComunaEntrega := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'REFERENCIA') then
                    Columna_Comentario := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'MOVIL') then
                    Columna_Movil := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'ESTADO') then
                    Columna_Estado := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'FECHA_ENTREGA') then
                    Columna_FechaEntrega := c;
                 if (DameDatoCelda(HCalc, LineaInicial, c) = 'COMENTARIO_ENTREGA') then
                    Columna_ComentarioEntrega := c;
              end;

              LineaInicial := 2;
           end;

           for i := LineaInicial to Lineas do
           begin
              if (not Cancelar) then
              begin
                 // Inicializo valores a importar
                 Excel_IDOrigen := '';
                 Excel_Fecha := '';
                 Excel_NombreCliente := '';
                 Excel_DireccionRecogida := '';
                 Excel_ComunaRecogida := '';
                 // Excel_FechaRetiro := '';
                 Excel_Persona := '';
                 Excel_TelefonoEntrega := '';
                 Excel_DireccionEntrega := '';
                 Excel_ComunaEntrega := '';
                 Excel_CodPostalEntrega := '';
                 Excel_Comentario := '';
                 Excel_Movil := '';
                 // Excel_NombreAgente := '';
                 Excel_Estado := '';
                 Excel_FechaEntrega := '';
                 Excel_ComentarioEntrega := '';

                 Excel_IDOrigen := DameDatoCelda(HCalc, i, Columna_IDOrigen);
                 DMMain.Log(Format('Excel_IDOrigen: %s', [Excel_IDOrigen]));
                 Excel_Fecha := DameDatoCelda(HCalc, i, Columna_Fecha);
                 DMMain.Log(Format('Excel_Fecha: %s', [Excel_Fecha]));
                 Excel_NombreCliente := DameDatoCelda(HCalc, i, Columna_NombreCliente);
                 DMMain.Log(Format('Excel_NombreCliente: %s', [Excel_NombreCliente]));
                 Excel_DireccionRecogida := DameDatoCelda(HCalc, i, Columna_DireccionRecogida);
                 DMMain.Log(Format('Excel_DireccionRecogida: %s', [Excel_DireccionRecogida]));
                 Excel_ComunaRecogida := DameDatoCelda(HCalc, i, Columna_ComunaRecogida);
                 DMMain.Log(Format('Excel_ComunaRecogida: %s', [Excel_ComunaRecogida]));
                 {Excel_FechaRetiro := DameDatoCelda(HCalc, i, Columna_FechaRetiro);
                 DMMain.Log(Format('Excel_FechaRetiro: %s', [Excel_FechaRetiro]));}
                 Excel_Persona := DameDatoCelda(HCalc, i, Columna_Persona);
                 DMMain.Log(Format('Excel_Persona: %s', [Excel_Persona]));
                 Excel_TelefonoEntrega := DameDatoCelda(HCalc, i, Columna_TelefonoEntrega);
                 DMMain.Log(Format('Excel_TelefonoEntrega: %s', [Excel_TelefonoEntrega]));
                 Excel_DireccionEntrega := DameDatoCelda(HCalc, i, Columna_DireccionEntrega);
                 DMMain.Log(Format('Excel_DireccionEntrega: %s', [Excel_DireccionEntrega]));
                 Excel_ComunaEntrega := DameDatoCelda(HCalc, i, Columna_ComunaEntrega);
                 DMMain.Log(Format('Excel_ComunaEntrega: %s', [Excel_ComunaEntrega]));
                 Excel_Comentario := DameDatoCelda(HCalc, i, Columna_Comentario);
                 DMMain.Log(Format('Excel_Comentario: %s', [Excel_Comentario]));
                 Excel_Movil := DameDatoCelda(HCalc, i, Columna_Movil);
                 DMMain.Log(Format('Excel_Movil: %s', [Excel_Movil]));
                 Excel_Estado := DameDatoCelda(HCalc, i, Columna_Estado);
                 DMMain.Log(Format('Excel_Estado: %s', [Excel_Estado]));
                 Excel_FechaEntrega := DameDatoCelda(HCalc, i, Columna_FechaEntrega);
                 DMMain.Log(Format('Excel_FechaEntrega: %s', [Excel_FechaEntrega]));
                 Excel_ComentarioEntrega := DameDatoCelda(HCalc, i, Columna_ComentarioEntrega);
                 DMMain.Log(Format('Excel_ComentarioEntrega: %s', [Excel_ComentarioEntrega]));

                 // Limpio valores
                 Excel_IDOrigen := Trim(Excel_IDOrigen);
                 IdOrigen := StrToIntDef(Trim(Excel_IDOrigen), 0);
                 Excel_NombreCliente := Trim(Copy(Excel_NombreCliente, 1, 256));
                 Excel_DireccionRecogida := Trim(Copy(Excel_DireccionRecogida, 1, 256));
                 Excel_ComunaRecogida := Trim(Copy(Excel_ComunaRecogida, 1, 256));
                 Excel_Persona := Trim(Copy(Excel_Persona, 1, 256));
                 Excel_TelefonoEntrega := Trim(Copy(Excel_TelefonoEntrega, 1, 15));
                 Excel_DireccionEntrega := Trim(Copy(Excel_DireccionEntrega, 1, 256));
                 Excel_ComunaEntrega := Trim(Copy(Excel_ComunaEntrega, 1, 256));
                 Excel_CodPostalEntrega := Trim(Copy(Excel_CodPostalEntrega, 1, 256));
                 Excel_Comentario := Trim(Copy(Excel_Comentario, 1, 256));
                 Excel_Movil := Trim(Copy(Excel_Movil, 1, 15));
                 // Excel_NombreAgente := Trim(Copy(Excel_NombreAgente, 1, 256));
                 Excel_Estado := Trim(Copy(Excel_Estado, 1, 256));
                 Excel_ComentarioEntrega := Trim(Excel_ComentarioEntrega);
                 try
                    Fecha := StrExcelToDateTime(Excel_Fecha);
                 except
                    Fecha := EncodeDate(2000, 1, 1);
                 end;
                 try
                    FechaEntrega := StrExcelToDateTime(Excel_FechaEntrega);
                 except
                    FechaEntrega := EncodeDate(2000, 1, 1);
                 end;
                 {
                 try
                    FechaRetiro := StrExcelToDateTime(Excel_FechaRetiro);
                 except
                    FechaRetiro := EncodeDate(2000, 1, 1);
                 end;
                 }

                 // Solo importamos los que tengan el estado "Entregado", "No Entregado", ""
                 if ((Excel_Estado <> 'Entregado') and (Excel_Estado <> 'No entregado') and (Excel_Estado <> '')) then
                    IdOrigen := 0;

                 // Si el IDOrigen y el nombre del cliente son vacios salimos del proceso de importacion
                 if ((Excel_IDOrigen = '') and (Excel_NombreCliente = '')) then
                    Cancelar := True;

                 // Si he obtenido una linea con IDOrigen la importo
                 if (IdOrigen <> 0) then
                 begin
                    PNLProgreso.Caption := Format(_('Linea %d de %d - Insertando Id Origen: %d - Cliente: %s.'), [i, Lineas, IdOrigen, Excel_NombreCliente]);
                    try
                       // Aqui se importa la línea.
                       // Si ya existe un registro con el mismo IDOrigen no hace nada.
                       DMImportacionDlivery.AgregaDelivery(IdOrigen, Excel_NombreCliente, Fecha,
                          Excel_DireccionRecogida, Excel_ComunaRecogida, Excel_Persona, Excel_TelefonoEntrega, Excel_DireccionEntrega,
                          Excel_ComunaEntrega, Excel_CodPostalEntrega, Excel_Comentario, Excel_Movil, {Excel_NombreAgente,} Excel_Estado, FechaEntrega,{ FechaRetiro,}
                          Excel_ComentarioEntrega);
                    except
                       on E: Exception do
                       begin
                          if (MessageDlg(Format(_('Linea %d - Error al importar datos' + #13#10 + E.Message + #13#10 + '¿Desea continuar?'), [i]), mtWarning, [mbYes, mbNo], 0) = mrNo) then
                             Cancelar := True;
                       end;
                    end;
                 end;
              end;
           end; {for}
        finally
           HCalc.Free;
        end;

        Application.ProcessMessages;
     finally
        PNLProgreso.Visible := False;
        PNLProgreso.Align := alRight;
        PNLProgreso.Width := 10;
        TSep1.Visible := False;

        DMImportacionDlivery.Refrescar;
     end;
  end;
end;

procedure TFMImportacionDlivery.DBGPedidosDliveryDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'AGENTE') or (UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'ID_DETALLES_S')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMImportacionDlivery.QMPedidosDliveryID_DETALLES_S.AsInteger <> 0) then
           ColorInactivo(Canvas)
        else
        begin
           if (UpperCase(Column.FieldName) = 'CLIENTE') then
           begin
              if (DMImportacionDlivery.QMPedidosDliveryCLIENTE.AsInteger = 0) then
                 ColorError(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'DIRECCION') then
           begin
              if (DMImportacionDlivery.QMPedidosDliveryDIRECCION.AsInteger = 0) then
                 ColorError(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'AGENTE') then
           begin
              if (DMImportacionDlivery.QMPedidosDliveryAGENTE.AsInteger = 0) then
                 ColorError(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'ARTICULO') then
           begin
              if (DMImportacionDlivery.QMPedidosDliveryARTICULO.AsString = '') then
                 ColorError(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'ID_DETALLES_S') then
           begin
              if (DMImportacionDlivery.QMPedidosDliveryID_DETALLES_S.AsInteger = 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorInfo(Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMImportacionDlivery.DBGPedidosDliveryCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMImportacionDlivery.DBGPedidosDliveryDblClick(Sender: TObject);
var
  Ejercicio, Rig : integer;
  Tipo, Serie : string;
begin
  inherited;

  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos,
        'ARTICULO = ''' + DMImportacionDlivery.QMPedidosDliveryARTICULO.AsString + '''');

  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMImportacionDlivery.QMPedidosDliveryCLIENTE.AsInteger));

  if (UpperCase(ColActual.FieldName) = 'AGENTE') then
     FMain.EjecutaAccion(FMain.AAgentes, 'AGENTE = ' + IntToStr(DMImportacionDlivery.QMPedidosDliveryAGENTE.AsInteger) + ' AND EJERCICIO = ' + REntorno.EjercicioStr);

  if (UpperCase(ColActual.FieldName) = 'ID_DETALLES_S') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           Database := DMMain.DataBase;
           SQL.Text := 'SELECT EJERCICIO, TIPO, SERIE, RIG FROM GES_DETALLES_S WHERE ID_DETALLES_S = :ID_DETALLES_S';
           Params.ByName['ID_DETALLES_S'].AsInteger := DMImportacionDlivery.QMPedidosDliveryID_DETALLES_S.AsInteger;
           ExecQuery;
           Ejercicio := FieldByName['EJERCICIO'].AsInteger;
           Tipo := FieldByName['TIPO'].AsString;
           Serie := FieldByName['SERIE'].AsString;
           Rig := FieldByName['RIG'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     FMain.MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
  end;
end;

procedure TFMImportacionDlivery.DBGPedidosDliveryBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end
     else
     if (Trim(TablaABuscar) = 'VER_CLIENTES_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CLIENTE';
     end
     else
     if (Trim(TablaABuscar) = 'VER_AGENTES_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'AGENTE';
     end
     else
     if (Trim(TablaABuscar) = 'VER_DIRECCIONES') then
     begin
        CondicionBusqueda :=
           'TERCERO=' + IntToStr(DameTercero('CLI', DMImportacionDlivery.QMPedidosDliveryCLIENTE.AsInteger));
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DIRECCION';
     end;
  end;
end;

procedure TFMImportacionDlivery.EFDesdeClienteChange(Sender: TObject);
begin
  inherited;
  ETituloClienteDesde.Text := DameTituloCliente(StrToIntDef(EFDesdeCliente.Text, 0));
  Filtrar;
end;

procedure TFMImportacionDlivery.EFHastaClienteChange(Sender: TObject);
begin
  inherited;
  ETituloClienteHasta.Text := DameTituloCliente(StrToIntDef(EFHastaCliente.Text, 0));
  Filtrar;
end;

procedure TFMImportacionDlivery.Filtrar;
begin
  inherited;
  DMImportacionDlivery.FiltraDelivery(StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), DEDesdeFecha.Date, DEHastaFecha.Date, VerSoloPendientes, RGOrden.ItemIndex);
end;

procedure TFMImportacionDlivery.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
  Apertura, Cierre : TDateTime;
begin
  DameMinMax('CLI', Min, Max);
  EFDesdeCliente.Text := IntToStr(Min);
  EFHastaCliente.Text := IntToStr(Max);

  DameMinMax('EJE', Apertura, Cierre);
  DEDesdeFecha.Date := Apertura;
  DEHastaFecha.Date := Cierre;

  VerSoloPendientes := True;

  Filtrar;

  DMImportacionDlivery.Marcar(0, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), DEDesdeFecha.Date, DEHastaFecha.Date);
end;

procedure TFMImportacionDlivery.AGeneraPedidosExecute(Sender: TObject);
begin
  inherited;
  DMImportacionDlivery.GeneraPedidos;
  ShowMessage(_('Documentos generados correctamente'));
end;

procedure TFMImportacionDlivery.DEDesdeFechaChange(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

procedure TFMImportacionDlivery.DEHastaFechaChange(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

procedure TFMImportacionDlivery.AMarcarTodosExecute(Sender: TObject);
begin
  inherited;
  DMImportacionDlivery.Marcar(REntorno.Entrada, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), DEDesdeFecha.Date, DEHastaFecha.Date);
end;

procedure TFMImportacionDlivery.ADesmarcarTodosExecute(Sender: TObject);
begin
  inherited;
  DMImportacionDlivery.Marcar(0, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), DEDesdeFecha.Date, DEHastaFecha.Date);
end;

procedure TFMImportacionDlivery.AVerTodosExecute(Sender: TObject);
begin
  inherited;
  VerSoloPendientes := False;
  Filtrar;
end;

procedure TFMImportacionDlivery.AVerPendientesExecute(Sender: TObject);
begin
  inherited;
  VerSoloPendientes := True;
  Filtrar;
end;

procedure TFMImportacionDlivery.ABorraRegistrosPendientesExecute(Sender: TObject);
begin
  inherited;
  if (MessageDlg(_('Esta a punto de borrar los registros pendientes de traspasar. ¿Desea continuar?'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
     DMImportacionDlivery.BorraRegistrosPendientes;
     DMImportacionDlivery.Refrescar;
  end;
end;

procedure TFMImportacionDlivery.CBClienteChange(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

end.
