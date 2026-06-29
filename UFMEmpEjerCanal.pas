unit UFMEmpEjerCanal;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ImgList, ComCtrls, Menus, UControlEdit, UFormGest,
  Mask, rxToolEdit, ULFCheckBox, ULFComboBox, TFlatCheckBoxUnit,
  ULFLabel, DateUtils, ULFDateEdit, ULFPanel, ULFEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000;

type
  TFMEmpEjerCanal = class(TG2KForm)
     BBAceptar: TBitBtn;
     CBEjercicio: TLFComboBox;
     LSTICONOS: TListView;
     LBLEjercicio: TLFLabel;
     POPUPCanal: TPopupMenu;
     MICanal: TMenuItem;
     DTPFechaTrabajo: TLFDateEdit;
     LBLFecha: TLFLabel;
     CHKMemoriza: TLFCheckBox;
     BBCancelar: TBitBtn;
     TEspera: TTimer;
     PNLImagenes: TLFPanel;
     PNLDetalles: TLFPanel;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     ESerie: TLFEdit;
     procedure LSTICONOSSelectItem(Sender: TObject; Item: TListItem; Selected: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BBAceptarClick(Sender: TObject);
     procedure POPUPCanalPopup(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure CBEjercicioChange(Sender: TObject);
     procedure LSTICONOSDblClick(Sender: TObject);
     procedure BBCancelarClick(Sender: TObject);
     procedure DTPFechaTrabajoChange(Sender: TObject);
     procedure CHKMemorizaChange(Sender: TObject);
     procedure TEsperaTimer(Sender: TObject);
     procedure LSTICONOSChange(Sender: TObject; Item: TListItem; Change: TItemChange);
     procedure EFSerieChange(Sender: TObject);
  private
     { Private declarations }
     Empresa, Ejercicio, Canal: integer;
     Serie: string;
     MemorizarFecha: boolean;
     FechaTrabajo: TDateTime;
     procedure ReiniciaTimer;
     procedure RecuperaUltimoAcceso;
  public
     { Public declarations }
     procedure EligeCanal(Sender: TObject);
  end;

var
  FMEmpEjerCanal : TFMEmpEjerCanal;

implementation

uses UEntorno, UUtiles, UDMEmpEjerCanal, UDMMain, UFMain, FIBDataSetRO, HYFIBQuery, UParam, UDameDato;

{$R *.DFM}

procedure TFMEmpEjerCanal.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMEmpEjerCanal, DMEmpEjerCanal);
  if (DMMain.Version_Demo) then
     REntorno.Ejercicio := YearOf(DMMain.Fecha_Demo) - 1;
  DMEmpEjerCanal.CargaEmpresas(LSTICONOS);

  if (LeeParametro('LOGSELC001') <> 'S') then
     LSTICONOS.PopupMenu := nil;

  TEspera.Interval := StrToIntDef(LeeParametro('LOGINTM002'), 60) * 1000;
  ReiniciaTimer;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BBAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancelar, 1, DMMain.ILMain_Ac, 0);

  // Control de serie restringida del usuario
  EFSerie.Enabled := True;
  EFSerie.ReadOnly := False;
  EFSerie.Color := clWindow;
  if (REntorno.SerieRestringida <> '') then
  begin
     Serie := REntorno.SerieRestringida;
     EFSerie.Text := REntorno.SerieRestringida;
     EFSerie.Enabled := False;
     EFSerie.ReadOnly := True;
     EFSerie.Color := clInfoBk;
  end;

  // Verificamos si esta permitido modificar la fecha de trabajo
  if (LeeParametro('LOGFECT001') = 'S') then
  begin
     with CHKMemoriza do
     begin
        Enabled := False;
        Checked := False;
     end;

     with DTPFechaTrabajo do
     begin
        Enabled := False;
        ReadOnly := True;
        Color := clInfoBk;
        Date := Today;
     end;
  end;
end;

procedure TFMEmpEjerCanal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEMpEjerCanal);
  Self.LSTICONOS.OnSelectItem := nil;
  Action := caFree;
end;

procedure TFMEmpEjerCanal.EligeCanal(Sender: TObject);
begin
  Canal := TComponent(Sender).Tag;
  RecuperaUltimoAcceso;
end;

procedure TFMEmpEjerCanal.LSTICONOSSelectItem(Sender: TObject; Item: TListItem; Selected: boolean);
begin
  ReiniciaTimer;

  if not (Selected) then
     Exit;

  //Se rellena el combo referente a los ejercicios
  Empresa := integer(Self.LSTICONOS.Selected.Data);
  DMEmpEjerCanal.CargaEjercicios(Empresa, CBEjercicio);
  Ejercicio := 0;
  Canal := StrToIntDef(LeeParametro('SYSCONF009'), 0);
  RecuperaUltimoAcceso;
end;

procedure TFMEmpEjerCanal.BBAceptarClick(Sender: TObject);
begin
  CBEjercicio.SetFocus;
  DMMain.ValidaFecha(Empresa, Ejercicio, DTPFechaTrabajo.Date);

  if (Self.LSTICONOS.SelCount = 0) then
     raise Exception.Create(_('No hay empresa seleccionada'));
  if (Self.CBEjercicio.Items.Count = 0) then
     raise Exception.Create(_('No hay ejercicios abiertos para esta empresa'));
  if (Canal < 1) then
     raise Exception.Create(_('No hay canales abiertos para esta empresa'));

  REntorno.Empresa := Empresa;
  REntorno.Ejercicio := StrToInt(Self.CBEjercicio.Items.Strings[Self.CBEjercicio.ItemIndex]);
  REntorno.Canal := Canal;
  DMEmpEjerCanal.CargaDatosCabecera;
  DMEmpEjerCanal.CargaAlmacenDefecto;
  REntorno.Memorizar_Fecha := CHKMemoriza.Checked;
  REntorno.FechaTrab := DTPFechaTrabajo.Date;

  REntorno.Serie := EFSerie.Text;
  if (REntorno.Serie = '') then
     DMEmpEjerCanal.CalculaSerieActiva;

  REntorno.NombreEmpresa := Self.LSTICONOS.Selected.Caption;
  REntorno.TipoRazon := DMEmpEjerCanal.xTerceroEmpresa.FieldByName('TIPO_RAZON').Value;

  DMEmpEjerCanal.GuardarUltimoAcceso(Empresa, Ejercicio, Canal, Serie, MemorizarFecha, FechaTrabajo);
  DMMain.AsignaEntornoBusqueda;

  // Refresca el logo de la empresa en el fondo
  FMain.ImagenFondo;

  ModalResult := mrOk;
end;

procedure TFMEmpEjerCanal.POPUPCanalPopup(Sender: TObject);
var
  DS : TFIBDataSetRO;
  mnu_aux : TMenuItem;
  cont : integer;
begin
  if (Self.LSTICONOS.Selected = nil) then
     Exit;

  for cont := MICanal.Count - 1 downto 0 do
  begin
     mnu_aux := MICanal.Items[0];
     MICanal.Delete(0);
     mnu_aux.Free;
  end;

  DS := TFIBDataSetRO.Create(nil);
  try
     with DS do
     begin
        DataBase := DMMain.DataBase;
        Transaction := DMEmpEjerCanal.TLocal;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT CANAL, TITULO FROM VER_CANALES_ACTIVOS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO = :EJERCICIO ');
        SelectSQL.Add(' ORDER BY CANAL ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Open;
        while not EOF do
        begin
           mnu_aux := TMenuItem.Create(MICanal);
           mnu_aux.Caption := FieldByName('CANAL').AsString + ' - ' + FieldByName('TITULO').AsString;
           mnu_aux.Tag := FieldByName('CANAL').AsInteger;
           mnu_aux.OnClick := Self.EligeCanal;
           MICanal.Add(mnu_aux);
           Next;
        end;
        Close;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

procedure TFMEmpEjerCanal.FormActivate(Sender: TObject);
var
  cont : integer;
  i : integer;
begin
  inherited;
  Canal := StrToIntDef(LeeParametro('SYSCONF009'), 0);

  DMEmpEjerCanal.DameUltimoAcceso(Empresa, Ejercicio, Canal, Serie, MemorizarFecha, FechaTrabajo);

  // Verificamos si esta permitido modificar la fecha de trabajo
  if (LeeParametro('LOGFECT001') = 'S') then
     MemorizarFecha := False;

  // ¿Se ha memorizado la fecha?
  CHKMemoriza.Checked := MemorizarFecha;
  if MemorizarFecha then
  begin
     // Se introduce la ultima fecha de trabajo
     DTPFechaTrabajo.Date := FechaTrabajo;
  end
  else
     DTPFechaTrabajo.Date := Today;

  // Se selecciona la ultima empresa que uso el usuario actual
  for cont := 0 to LSTICONOS.Items.Count - 1 do
  begin
     if integer(LSTICONOS.Items[cont].Data) = Empresa then
     begin
        LSTICONOS.Selected := Self.LSTICONOS.Items[cont];
        LSTICONOSSelectItem(Self, Self.LSTICONOS.Items[cont], True);
     end;
  end;

  with CBEjercicio do
  begin
     i := Items.IndexOf(IntToStr(Ejercicio));
     if (i < 0) then
        i := 0;
     ItemIndex := i;
  end;

  FocusControl(Self.LSTICONOS);
  if (REntorno.SerieRestringida = '') then
     EFSerie.Text := Serie;
end;

procedure TFMEmpEjerCanal.CBEjercicioChange(Sender: TObject);
begin
  ReiniciaTimer;
  Ejercicio := StrToInt(Self.CBEjercicio.Items.Strings[Self.CBEjercicio.ItemIndex]);

  Canal := StrToIntDef(LeeParametro('SYSCONF009'), 0);

  RecuperaUltimoAcceso;
end;

procedure TFMEmpEjerCanal.LSTICONOSDblClick(Sender: TObject);
begin
  if Assigned(LSTICONOS.Selected) then
  begin
     CHKMemoriza.SetFocus;
     BBAceptarClick(Sender);
     ModalResult := mrOk;
  end;
end;

procedure TFMEmpEjerCanal.BBCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMEmpEjerCanal.ReiniciaTimer;
begin
  TEspera.Enabled := False;
  TEspera.Enabled := True;
end;

procedure TFMEmpEjerCanal.TEsperaTimer(Sender: TObject);
begin
  BBCancelar.Click;
end;

procedure TFMEmpEjerCanal.DTPFechaTrabajoChange(Sender: TObject);
begin
  ReiniciaTimer;
  FechaTrabajo := DTPFechaTrabajo.Date;
end;

procedure TFMEmpEjerCanal.CHKMemorizaChange(Sender: TObject);
begin
  ReiniciaTimer;
  MemorizarFecha := CHKMemoriza.Checked;
end;

procedure TFMEmpEjerCanal.LSTICONOSChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  ReiniciaTimer;
end;

procedure TFMEmpEjerCanal.EFSerieChange(Sender: TObject);
begin
  ESerie.Text := DameTituloSerie(EFSerie.Text);
  Serie := EFSerie.Text;
end;

procedure TFMEmpEjerCanal.RecuperaUltimoAcceso;
var
  i : integer;
  Apertura, Cierre : TDateTime;
begin
  // Obtengo datos de ultimo acceso a esa empresa
  DMEmpEjerCanal.DameUltimoAccesoEEC(Empresa, Ejercicio, Canal, Serie, MemorizarFecha, FechaTrabajo);

  with CBEjercicio do
  begin
     if (Text <> IntToStr(Ejercicio)) then
     begin
        i := Items.IndexOf(IntToStr(Ejercicio));
        if (i < 0) then
           i := 0;

        ItemIndex := i;
     end;
  end;

  // Verificamos si esta permitido modificar la fecha de trabajo
  if (LeeParametro('LOGFECT001') = 'S') then
     MemorizarFecha := False;

  // Si no memorizo la fecha utilizo la de hoy o la de cierre de ejercicio.
  if (not MemorizarFecha) then
  begin
     // Obtengo fecha de Apertura y Cierre del ejercicio al que cambio
     DameMinMax('EJE', Apertura, Cierre, Empresa, Ejercicio);

     // Si la fecha actual no esta entre APERTURA y CIERRE, tomo la fecha CIERRE.
     if ((Apertura <= Today) and (Cierre >= Today)) then
        FechaTrabajo := Today
     else
     if (Cierre < Today) then
        FechaTrabajo := Cierre
     else
     if (Apertura > Today) then
        FechaTrabajo := Apertura;
  end;

  // Verifico que la fecha esté dentro del ejercicio
  FechaTrabajo := DMEmpEjerCanal.VerificaFecha(Empresa, Ejercicio, FechaTrabajo);

  // Establezco la fecha según configuración DEMO
  if (DMMain.Version_Demo) then
     FechaTrabajo := RecodeYear(Now, StrToIntDef(CBEjercicio.Text, 0));

  // Relleno los datos en el formulario
  CHKMemoriza.Checked := MemorizarFecha;
  DTPFechaTrabajo.Date := FechaTrabajo;

  if (REntorno.SerieRestringida = '') then
     { TODO -oDuilio : Verificar si la serie existe para esta EEC }
     EFSerie.Text := Serie;

  // Filtro la búsqueda de serie a la empresa/ejercicio/canal seleccionado
  EFSerie.CondicionBusqueda := 'EMPRESA=' + IntToStr(Empresa) + ' AND EJERCICIO=' + IntToStr(Ejercicio) + ' AND CANAL=' + IntToStr(Canal);
  if (REntorno.SerieRestringida <> '') then
     EFSerie.CondicionBusqueda := EFSerie.CondicionBusqueda + ' AND SERIE=''' + REntorno.SerieRestringida + '''';
end;

end.
