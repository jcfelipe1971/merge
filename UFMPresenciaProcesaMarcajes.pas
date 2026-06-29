unit UFMPresenciaProcesaMarcajes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UFormGest,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  FIBDataSet, FIBDatabase, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, DBCtrls, ULFDBEdit, StdCtrls,
  ULFEditFind2000, Mask, rxToolEdit, ULFDateEdit, ULFLabel, ULFEdit, HYFIBQuery,
  ULFMemo;

type
  TFMPresenciaProcesaMarcajes = class(TFPEditSimple)
     PNLFiltros: TLFPanel;
     PNLDetalle: TLFPanel;
     DBDetalle: TDBGridFind2000;
     LFechaDesde: TLFLabel;
     DEFechaDesde: TLFDateEdit;
     LFechaHasta: TLFLabel;
     DEFechaHasta: TLFDateEdit;
     LDesdeOperario: TLFLabel;
     EFDesdeOperario: TLFEditFind2000;
     EDesdeOperario: TLFEdit;
     LHastaOperario: TLFLabel;
     EFHastaOperario: TLFEditFind2000;
     EHastaOperario: TLFEdit;
     TBSep01: TToolButton;
     TBDesmarcar: TToolButton;
     TBMarcar: TToolButton;
     TSep02: TToolButton;
     TBProcesar: TToolButton;
     CBSoloPendientes: TCheckBox;
     PNLCabecera: TLFPanel;
     PNLImportacionMarcajes: TLFPanel;
     MImportacionMarcajes: TLFMemo;
     TBImportacionMarcajes: TLFToolBar;
     TButtImportacionMarcajes: TToolButton;
     LImportacionMarcajes: TLFLabel;
     Splitter: TSplitter;
     BMesAnterio: TButton;
     BEjercicio: TButton;
     BMes: TButton;
     BHoy: TButton;
     BMesSiguiente: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFDesdeOperarioChange(Sender: TObject);
     procedure EFHastaOperarioChange(Sender: TObject);
     procedure ChangeFiltro(Sender: TObject);
     procedure TBDesmarcarClick(Sender: TObject);
     procedure TBMarcarClick(Sender: TObject);
     procedure TBProcesarClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TButtImportacionMarcajesClick(Sender: TObject);
     procedure DBDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure BMesAnterioClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure BEjercicioClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BHoyClick(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
  private
     { Private declarations }
     InicializandoValores: boolean;
  public
     { Public declarations }
     procedure ImportaMarcajes(ImportacionMarcajes: TStrings; LProgreso: TLabel);
     procedure Filtrar(DesdeFecha, HastaFecha: TDateTime; DesdeEmpleado, HastaEmpleado: integer; SoloPendientes: boolean);
  end;

var
  FMPresenciaProcesaMarcajes : TFMPresenciaProcesaMarcajes;

implementation

uses UDMMain, UDMPresenciaProcesaMarcajes, UUtiles, UEntorno, UParam, UDameDato,
  UFMPresenciaEdicionMarcajes;

{$R *.dfm}

procedure TFMPresenciaProcesaMarcajes.FormCreate(Sender: TObject);
var
  MinFecha, MaxFecha : TDateTime;
  // MinEmp, MaxEmp : integer;
begin
  inherited;
  AbreData(TDMPresenciaProcesaMarcajes, DMPresenciaProcesaMarcajes);
  ControlEdit := CEMain;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  NavMain.DataSource := DMPresenciaProcesaMarcajes.DSQMDetalle;
  DBDetalle.DataSource := DMPresenciaProcesaMarcajes.DSQMDetalle;

  // Valor para marcado
  DBDetalle.ColumnasChecked.Strings[DBDetalle.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] := REntorno.EntradaStr;

  InicializandoValores := True;

  DameMinMax('EJE', MinFecha, MaxFecha);
  DEFechaDesde.Date := MinFecha;
  DEFechaHasta.Date := MaxFecha;

  // Inicializo vacio para que no filtre y muestre todos los marcajes, incluso con empleados erroneos.
  // DameMinMax('IDE', MinEmp, MaxEmp);
  EFDesdeOperario.Text := ''; // IntToStr(MinEmp);
  EFHastaOperario.Text := ''; // IntToStr(MaxEmp);

  InicializandoValores := False;

  ChangeFiltro(Sender);

  LImportacionMarcajes.Visible := False;
end;

procedure TFMPresenciaProcesaMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPresenciaProcesaMarcajes);
end;

procedure TFMPresenciaProcesaMarcajes.EFDesdeOperarioChange(Sender: TObject);
begin
  inherited;
  EDesdeOperario.Text := DameTituloIdEmpleado(StrToIntDef(EFDesdeOperario.Text, 0));
  ChangeFiltro(Sender);
end;

procedure TFMPresenciaProcesaMarcajes.EFHastaOperarioChange(Sender: TObject);
begin
  inherited;
  EHastaOperario.Text := DameTituloIdEmpleado(StrToIntDef(EFHastaOperario.Text, 0));
  ChangeFiltro(Sender);
end;

procedure TFMPresenciaProcesaMarcajes.ChangeFiltro(Sender: TObject);
begin
  inherited;
  if not InicializandoValores then
     DMPresenciaProcesaMarcajes.FiltraMarcajes(StrToIntDef(EFDesdeOperario.Text, 0), StrToIntDef(EFHastaOperario.Text, 0), DEFechaDesde.Date, DEFechaHasta.Date, CBSoloPendientes.Checked);
end;

procedure TFMPresenciaProcesaMarcajes.TBDesmarcarClick(Sender: TObject);
begin
  inherited;
  DMPresenciaProcesaMarcajes.MarcaMarcajes(0);
end;

procedure TFMPresenciaProcesaMarcajes.TBMarcarClick(Sender: TObject);
begin
  inherited;
  DMPresenciaProcesaMarcajes.MarcaMarcajes(1);
end;

procedure TFMPresenciaProcesaMarcajes.TBProcesarClick(Sender: TObject);
begin
  inherited;
  DMPresenciaProcesaMarcajes.ProcesaMarcajesMarcados;
end;

procedure TFMPresenciaProcesaMarcajes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPresenciaProcesaMarcajes.BusquedaCompleja;
end;

procedure TFMPresenciaProcesaMarcajes.TButtImportacionMarcajesClick(Sender: TObject);
begin
  ImportaMarcajes(MImportacionMarcajes.Lines, LImportacionMarcajes);
end;

procedure TFMPresenciaProcesaMarcajes.ImportaMarcajes(ImportacionMarcajes: TStrings; LProgreso: TLabel);
var
  TipoFichero : integer;
  i : integer;
  s : string;
  Error : boolean;
  IdEmpleado : integer;
  IdEmpleadoReloj : integer;
  Empleado : string;
  Fecha : TDateTime;
  IdIncidencia : integer;
  Incidencia : string;

  procedure DivideString(s: string; Separador: string; var IdEmpleadoReloj: integer; var Empleado: string; var Fecha: TDateTime; var Incidencia: string);
  var
     p, l : integer;
  begin
     if (Separador = '') then
        Separador := ',';

     l := Length(s);

     // IdEmpleadoReloj
     p := Pos(Separador, s);
     if (p > 0) then
     begin
        IdEmpleadoReloj := StrToIntDef(Trim(Copy(s, 1, p - 1)), 0);
        s := Copy(s, p + 1, l);
     end;

     // Empleado
     p := Pos(Separador, s);
     if (p > 0) then
     begin
        Empleado := Copy(s, 1, p - 1);
        s := Copy(s, p + 1, l);
     end;

     // Fecha
     p := Pos(Separador, s);
     if (p > 0) then
     begin
        try
           Fecha := DateISO8601ToDateTime(Copy(s, 1, p - 1));
        except
           Fecha := 0;
        end;
        s := Copy(s, p + 1, l);
     end;

     // Incidencia
     p := Pos(Separador, s);
     if (p = 0) then
        p := Length(s) + 1;
     if (p > 0) then
     begin
        Incidencia := Copy(s, 1, p - 1);
        s := Copy(s, p + 1, l);
     end;
  end;

  procedure DivideStringConva(s: string; Separador: string; var IdEmpleadoReloj: integer; var Empleado: string; var Fecha: TDateTime; var Incidencia: string);
  var
     p, l : integer;
  begin
     // Formato : (Separado por tabuladores
     // IdEmpleadoReloj, Fecha, ?, ?, ?, ?
     // 7   2021-05-03 06:30:39   1   0   0   16
     // IdEmpleadoReloj = OPE_EMPLEADO.TARJETA

     // No estan en el fichero
     Empleado := '';

     // No se sabe cual de los campos es
     { TODO : Averiguar que campo es la incidencia y como unirlo a las incidencias de Merge }
     Incidencia := 'DES';

     if (Separador = '') then
        Separador := #9;

     l := Length(s);

     // IdEmpleadoReloj
     p := Pos(Separador, s);
     if (p > 0) then
     begin
        IdEmpleadoReloj := StrToIntDef(Trim(Copy(s, 1, p - 1)), 0);
        s := Copy(s, p + 1, l);
     end;

     // Fecha
     p := Pos(Separador, s);
     if (p > 0) then
     begin
        try
           Fecha := DateISO8601ToDateTime(Copy(s, 1, p - 1));
        except
           Fecha := 0;
        end;
        s := Copy(s, p + 1, l);
     end;

     // Campo3 : ?
     p := Pos(Separador, s);
     if (p > 0) then
     begin
        // Campo3 := Copy(s, 1, p - 1);
        s := Copy(s, p + 1, l);
     end;

     // Campo4 : ?
     p := Pos(Separador, s);
     if (p > 0) then
     begin
        // Campo4 := Copy(s, 1, p - 1);
        s := Copy(s, p + 1, l);
     end;

     // Campo5 : ?
     p := Pos(Separador, s);
     if (p > 0) then
     begin
        // Campo5 := Copy(s, 1, p - 1);
        s := Copy(s, p + 1, l);
     end;

     // Campo6 : ?
     p := Pos(Separador, s);
     if (p = 0) then
        p := Length(s) + 1;
     if (p > 0) then
     begin
        // Campo6 := Copy(s, 1, p - 1);
        s := Copy(s, p + 1, l);
     end;
  end;

begin
  inherited;
  /// Se lee en dos pasadas
  /// 1ra - Se verifica que cada linea tenga datos validos
  /// 2da - Se importa a la tabla.
  ///
  /// Ejemplo: 14,  SalvadorSa,2021-03-23 08:18:21,Entrada
  /// Se espera IdEmpleadoReloj, NombreEmpleado, FechaMarcaje, Inicidencia
  /// Solo se tendrán en cuenta IdEmpleadoReloj, FechaMarcaje, Inicidencia

  LProgreso.Visible := True;
  if (ImportacionMarcajes.Count > 0) then
  begin
     // 1 - Defecto
     // 2 - Conva
     TipoFichero := StrToIntDef(LeeParametro('OPEPRES002'), 0);

     // Primera pasada - Verifico datos
     i := 0;
     Error := False;

     while ((not Error) and (i < ImportacionMarcajes.Count)) do
     begin
        LProgreso.Caption := Format(_('Verificando datos. Linea %d.'), [i]);
        s := ImportacionMarcajes[i];
        IdEmpleado := 0;
        IdIncidencia := 0;

        case TipoFichero of
           1:
           begin
              DivideString(s, ',', IdEmpleadoReloj, Empleado, Fecha, Incidencia);
              IdEmpleado := DameIdEmpleadoTarjeta(IntToStr(IdEmpleadoReloj));
              IdIncidencia := DMPresenciaProcesaMarcajes.DameIdIncidencia(Incidencia);
           end;
           2:
           begin
              DivideStringConva(s, #9, IdEmpleadoReloj, Empleado, Fecha, Incidencia);
              IdEmpleado := DameIdEmpleadoTarjeta(IntToStr(IdEmpleadoReloj));
              IdIncidencia := DMPresenciaProcesaMarcajes.DameIdIncidencia(Incidencia);
           end;
           else
           begin
              ShowMessage(_('No esta configurado el tipo de fichero de importacion (Parametro )'));
              Error := True;
           end;
        end;

        if (IdEmpleado = 0) then
        begin
           ShowMessage(Format(_('Linea %d - No existe empleado con tarjeta %d.'), [i, IdEmpleadoReloj]) + #13#10 + s);
           Error := True;
        end;

        if (IdIncidencia = 0) then
        begin
           ShowMessage(Format(_('Linea %d - No existe incidencia %s.'), [i, Incidencia]) + #13#10 + s);
           Error := True;
        end;

        if (Fecha = 0) then
        begin
           ShowMessage(Format(_('Linea %d - El formato de fecha es incorrecto'), [i]) + #13#10 + s);
           Error := True;
        end;

        // Me posiciono en la linea con el error
        if Error then
        begin
           // Posicion de cursor
           MImportacionMarcajes.SelStart := MImportacionMarcajes.Perform(EM_LINEINDEX, i, 0);
           // Scroll a la posicion del cursor
           MImportacionMarcajes.Perform(EM_SCROLLCARET, 0, 0);
        end;

        Inc(i);
     end;

     // Segunda pasada - Importo datos
     i := 0;

     while ((not Error) and (i < ImportacionMarcajes.Count)) do
     begin
        LProgreso.Caption := Format(_('Importando datos. Linea %d.'), [i]);
        s := ImportacionMarcajes[i];
        IdEmpleado := 0;
        IdIncidencia := 0;

        case TipoFichero of
           1:
           begin
              DivideString(s, ',', IdEmpleadoReloj, Empleado, Fecha, Incidencia);
              IdEmpleado := DameIdEmpleadoTarjeta(IntToStr(IdEmpleadoReloj));
              IdIncidencia := DMPresenciaProcesaMarcajes.DameIdIncidencia(Incidencia);
           end;
           2:
           begin
              DivideStringConva(s, #9, IdEmpleadoReloj, Empleado, Fecha, Incidencia);
              IdEmpleado := DameIdEmpleadoTarjeta(IntToStr(IdEmpleadoReloj));
              IdIncidencia := DMPresenciaProcesaMarcajes.DameIdIncidencia(Incidencia);
           end;
        end;

        DMPresenciaProcesaMarcajes.ImportaRegistro(IdEmpleado, Fecha, IdIncidencia);

        Inc(i);
     end;

     if (not Error) then
        ImportacionMarcajes.Clear;

     DMPresenciaProcesaMarcajes.RefrescarDatos(0);
  end;
  LProgreso.Visible := False;
end;

procedure TFMPresenciaProcesaMarcajes.DBDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  ColorearSegunEstado : boolean;
begin
  inherited;

  {
  if ((UpperCase(Column.FieldName) = 'ID_LOTE') or (UpperCase(Column.FieldName) = 'LOTE') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
  }

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        ColorearSegunEstado := False;

        if (UpperCase(Column.FieldName) = 'ID_EMPLEADO') or (UpperCase(Column.FieldName) = 'TITULO_EMPLEADO') then
        begin
           if (DMPresenciaProcesaMarcajes.QMDetalleID_EMPLEADO.AsInteger = 0) then
              ColorError(Canvas)
           else
              ColorearSegunEstado := True;
        end
        else
        if (UpperCase(Column.FieldName) = 'TIPO_MARCAJE') then
        begin
           if ((DMPresenciaProcesaMarcajes.QMDetalleTIPO_MARCAJE.AsString <> 'PRE') and
              (DMPresenciaProcesaMarcajes.QMDetalleTIPO_MARCAJE.AsString <> 'ENT') and
              (DMPresenciaProcesaMarcajes.QMDetalleTIPO_MARCAJE.AsString <> 'SAL')) then
              ColorError(Canvas)
           else
              ColorearSegunEstado := True;
        end
        else
        if (UpperCase(Column.FieldName) = 'ESTADO') or (UpperCase(Column.FieldName) = 'TITULO_ESTADO') then
        begin
           ColorSegunEstado(Canvas, DMPresenciaProcesaMarcajes.QMDetalleESTADO.AsInteger);
        end
        else
        if (UpperCase(Column.FieldName) = 'USUARIO_CREACION') or (UpperCase(Column.FieldName) = 'FECHA_CREACION') then
        begin
           if (DMPresenciaProcesaMarcajes.QMDetalleUSUARIO_CREACION.AsInteger <> 0) then
              ColorResaltado3(Canvas)
           else
              ColorearSegunEstado := True;
        end
        else
        if (UpperCase(Column.FieldName) = 'USUARIO_MODIFICACION') or (UpperCase(Column.FieldName) = 'FECHA_MODIFICACION') then
        begin
           if (DMPresenciaProcesaMarcajes.QMDetalleUSUARIO_MODIFICACION.AsInteger <> 0) then
              ColorResaltado3(Canvas)
           else
              ColorearSegunEstado := True;
        end
        else
        if ((UpperCase(Column.FieldName) = 'IDENTIFICADOR_EMPLEADO') or (UpperCase(Column.FieldName) = 'IDENTIFICADOR_DISPOSITIVO') or (UpperCase(Column.FieldName) = 'IDENTIFICADOR_INCIDENCIA') or (UpperCase(Column.FieldName) = 'IDENTIFICADOR_TIPO_MARCAJE')) then
        begin
           ColorInactivo(Canvas);
        end;

        if ColorearSegunEstado then
        begin
           if (DMPresenciaProcesaMarcajes.QMDetalleESTADO.AsInteger = 0) then
              ColorInfo(Canvas)
           else
           if (DMPresenciaProcesaMarcajes.QMDetalleESTADO.AsInteger = 2) then
              ColorInactivo(Canvas)
           else
           if (DMPresenciaProcesaMarcajes.QMDetalleESTADO.AsInteger = 5) then
              ColorBloqueado(Canvas)
           else
              ColorError(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPresenciaProcesaMarcajes.BMesAnterioClick(Sender: TObject);
begin
  inherited;
  if Abs(DEFechaHasta.Date - DEFechaDesde.Date) < 2 then
     DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'D-')
  else
     DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M-');
end;

procedure TFMPresenciaProcesaMarcajes.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  if Abs(DEFechaHasta.Date - DEFechaDesde.Date) < 2 then
     DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'D+')
  else
     DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M+');
end;

procedure TFMPresenciaProcesaMarcajes.BEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'EJE');
end;

procedure TFMPresenciaProcesaMarcajes.BMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'MES');
end;

procedure TFMPresenciaProcesaMarcajes.BHoyClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'DIA');
end;

procedure TFMPresenciaProcesaMarcajes.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if Button = nbEdit then
  begin
     // Formulario modal para editar marcaje
     AbreForm(TFMPresenciaEdicionMarcajes, FMPresenciaEdicionMarcajes);
     FMPresenciaEdicionMarcajes.Hide;
     FMPresenciaEdicionMarcajes.Filtra(DMPresenciaProcesaMarcajes.QMDetalleID_OPE_PRESENCIA_MARCAJE.AsInteger);
     FMPresenciaEdicionMarcajes.ShowModal;

     DMPresenciaProcesaMarcajes.RefrescarDatos;

     Continua := False;
  end;

  if Button = nbInsert then
  begin
     // Formulario modal para editar marcaje
     AbreForm(TFMPresenciaEdicionMarcajes, FMPresenciaEdicionMarcajes);
     FMPresenciaEdicionMarcajes.Hide;
     FMPresenciaEdicionMarcajes.Filtra(0);
     FMPresenciaEdicionMarcajes.ShowModal;

     DMPresenciaProcesaMarcajes.RefrescarDatos;

     Continua := False;
  end;
end;

procedure TFMPresenciaProcesaMarcajes.Filtrar(DesdeFecha, HastaFecha: TDateTime; DesdeEmpleado, HastaEmpleado: integer; SoloPendientes: boolean);
begin
  DEFechaDesde.Date := DesdeFecha;
  DEFechaHasta.Date := HastaFecha;
  EFDesdeOperario.Text := IntToStr(DesdeEmpleado);
  EFHastaOperario.Text := IntToStr(HastaEmpleado);
  CBSoloPendientes.Checked := SoloPendientes;
end;

end.
