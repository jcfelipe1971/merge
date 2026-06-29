unit UFMRecepcionFichaTecnica;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas, UControlEdit, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl,
  UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, UHYDescription,
  ULFHYDBDescription, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBMemo,
  Buttons, ULFEdit, UDBDateTimePicker, DbComboBoxValue;

type
  TFMRecepcionFichaTecnica = class(TFPEdit)
     PNLFicha: TPanel;
     LIdRecepcion: TLFLabel;
     DBEIdRecepcion: TLFDbedit;
     LFecha: TLFLabel;
     DBFecha: TLFDBDateEdit;
     DBEMatricula: TLFDbedit;
     DBEVehiculo: TLFDbedit;
     DBEFFichaTecnica: TLFDBEditFind2000;
     LFichaTecnica: TLFLabel;
     LCliente: TLFLabel;
     DBECliente: TLFDBEditFind2000;
     DBEClienteNombre: TLFDbedit;
     DBEOperario: TLFDbedit;
     DBEEmpleado: TLFDBEditFind2000;
     LBLOperario: TLFLabel;
     LFLabel1: TLFLabel;
     LFDBTESTIGO_AVERIA: TLFDBCheckBox;
     LFDBEstadoPlacas: TLFDBCheckBox;
     LFDBEstadoCristales: TLFDBCheckBox;
     LFDBAntena: TLFDBCheckBox;
     LFDBPilotosFaro: TLFDBCheckBox;
     LFDBPuertasDelanteras: TLFDBCheckBox;
     LFDBPuertasTraseras: TLFDBCheckBox;
     ELElevalunasDelanteros: TLFDBCheckBox;
     LFDBElevalunasTraseros: TLFDBCheckBox;
     LFDBRetrovisores: TLFDBCheckBox;
     LFDBAutorizaPresupuesto: TLFDBCheckBox;
     LFDBAutorizaPruebas: TLFDBCheckBox;
     LFDBPiezasCliente: TLFDBCheckBox;
     LFDBRecogerPiezas: TLFDBCheckBox;
     LMatricula: TLFLabel;
     LTrabajos: TLFLabel;
     DBMTrabajos: TLFDBMemo;
     LComentarioEstado: TLFLabel;
     DBMComentarioEstado: TLFDBMemo;
     LComentarioCliente: TLFLabel;
     DBMComentarioCliente: TLFDBMemo;
     Imagen: TImage;
     LFLabel4: TLFLabel;
     DBEKilometraje: TLFDbedit;
     LFLabel5: TLFLabel;
     LIdReparacion: TLFLabel;
     DBEIdReparacion: TLFDbedit;
     LFLabel7: TLFLabel;
     ImagenFirma: TImage;
     LGaleria: TLFLabel;
     DBEFGaleria: TLFDBEditFind2000;
     ETituloGaleria: TLFEdit;
     TSGaleria: TTabSheet;
     LFLabel9: TLFLabel;
     ACliente: TAction;
     AGaleria: TAction;
     SBAGaleria: TSpeedButton;
     SBACliente: TSpeedButton;
     AFichaTecnica: TAction;
     SBAFichaTecnica: TSpeedButton;
     SBAOperario: TSpeedButton;
     AOperario: TAction;
     DBDTPFecha: TDBDateTimePicker;
     PNLNotas: TLFPanel;
     PNLFirma: TLFPanel;
     PNLImagen: TLFPanel;
     PNLFichas: TLFPanel;
     LVGaleria: TListView;
     TBGaleria: TLFToolBar;
     PNLTBGaleria: TLFPanel;
     LGaleriaMatricula: TLFLabel;
     DBEGaleriaMatricula: TLFDbedit;
     DBEGaleriaTitulo: TLFDbedit;
     SBAReparacion: TSpeedButton;
     AReparacion: TAction;
     AListadoRecepcion: TAction;
     AConfigListadoRecepcion: TAction;
     LFCategoryAction3: TLFCategoryAction;
     DBCBEstadoEscobillas: TLFDBCheckBox;
     actAEnviarRecepcionCorreo: TAction;
     DBCBCombustible: TDBComboBoxValue;
     TSPreITV: TTabSheet;
     PNLPreITV: TLFPanel;
     TBPreITV: TLFToolBar;
     NavPreITV: THYMNavigator;
     PNLPreITVVerificacion: TLFPanel;
     TBPreITVVerificacion: TLFToolBar;
     NavPreITVVerificacion: THYMNavigator;
     DBGPreITVVerificacion: TDBGridFind2000;
     LFichaTecnicaITV: TLFLabel;
     LMatriculaITV: TLFLabel;
     LKilometros: TLFLabel;
     DBEMatriculaITV: TLFDbedit;
     DBETituloITV: TLFDbedit;
     DBEFFichaTecnicaITV: TLFDBEditFind2000;
     DBEKilometros: TLFDbedit;
     LFechaITV: TLFLabel;
     DBDEFechaITV: TLFDBDateEdit;
     DBDTBFechaITV: TDBDateTimePicker;
     DBEIdInspeccion: TLFDbedit;
     LIdInspeccion: TLFLabel;
     LEmpleado: TLFLabel;
     DBEFEmpleado: TLFDBEditFind2000;
     EEmpleado: TLFDbedit;
     LObservaciones: TLFLabel;
     DBMObservaciones: TLFDBMemo;
     TBPreITVCabecera: TLFToolBar;
     PNLTBPreITVMatricula: TLFPanel;
     LPreITVMatricual: TLFLabel;
     DBEPreITVMatricula: TLFDbedit;
     DBEDBEPreITVTitulo: TLFDbedit;
     PNLGaleriaTBRecepcion: TLFPanel;
     LIdRecepcionGaleria: TLFLabel;
     DBERecepcionGaleria: TLFDbedit;
     PNLPreITVTBRecepcion: TLFPanel;
     LPreITVRecacion: TLFLabel;
     DBEPreITVRecacion: TLFDbedit;
     AListadoPreITV: TAction;
     AConfigListadoPreITV: TAction;
     LFechaCierre: TLFLabel;
     DBDEFechaCierre: TLFDBDateEdit;
     DBDTPFechaCierre: TDBDateTimePicker;
     LFLabel2: TLFLabel;
     DEFechaCierrePreITV: TLFDBDateEdit;
     DBDTPFechaCierrePreITV: TDBDateTimePicker;
     DBEIdFirma: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AGaleriaExecute(Sender: TObject);
     procedure DBEClienteNombreDblClick(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure SBAGaleriaDblClick(Sender: TObject);
     procedure AAdjuntoFichaExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AFichaTecnicaExecute(Sender: TObject);
     procedure DBEVehiculoDblClick(Sender: TObject);
     procedure SBAFichaTecnicaDblClick(Sender: TObject);
     procedure AOperarioExecute(Sender: TObject);
     procedure DBEOperarioDblClick(Sender: TObject);
     procedure SBAOperarioDblClick(Sender: TObject);
     procedure PNLNotasResize(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure TSGaleriaShow(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure DBEFGaleriaChange(Sender: TObject);
     procedure SBAReparacionDblClick(Sender: TObject);
     procedure AReparacionExecute(Sender: TObject);
     procedure AListadoRecepcionExecute(Sender: TObject);
     procedure AConfigListadoRecepcionExecute(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure actAEnviarRecepcionCorreoExecute(Sender: TObject);
     procedure DBGPreITVVerificacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AConfigListadoPreITVExecute(Sender: TObject);
     procedure AListadoPreITVExecute(Sender: TObject);
     procedure DBEIdFirmaChange(Sender: TObject);
     procedure DBEGaleriaTituloDblClick(Sender: TObject);
     procedure LVGaleriaDblClick(Sender: TObject);
  private
     { Private declarations }
     procedure RefrescaGaleria;
  public
     { Public declarations }
     procedure Filtra(IdRecepcion: integer; IdReparacion: integer = 0; IdFichaTecnica: integer = 0);
     procedure FiltraFicha(Filtro: string);
  end;

var
  FMRecepcionFichaTecnica : TFMRecepcionFichaTecnica;

implementation

uses
  UDMMain, UDMRecepcionFichaTecnica, UEntorno, UUtiles, UFMain, UParam,
  DateUtils, UFormGest, UFMAdjunto, UDMListados, UFMListconfig, UDMLstRecepcionFichaTecnica,
  UFSendCorreo, UFMostrarImagen, UDameDato, UImagenes;

{$R *.dfm}

procedure TFMRecepcionFichaTecnica.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRecepcionFichaTecnica, DMRecepcionFichaTecnica);

  NavMain.DataSource := DMRecepcionFichaTecnica.DSxRecepcion;
  DBGMain.DataSource := DMRecepcionFichaTecnica.DSxRecepcion;
  G2kTableLoc.DataSource := DMRecepcionFichaTecnica.DSxRecepcion;

  SolapaControles(SBAGaleria, ETituloGaleria);
  ETituloGaleria.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBACliente, DBEClienteNombre);
  DBEClienteNombre.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAFichaTecnica, DBEVehiculo);
  DBEVehiculo.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAOperario, DBEOperario);
  DBEOperario.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAReparacion, DBEIdReparacion);
  DBEIdReparacion.Color := REntorno.ColorEnlaceActivo;

  // Color campo ID
  ColorCampoID(DBEIdRecepcion);
  Campo := DMRecepcionFichaTecnica.xRecepcionID_REP_RECEPCION;
end;

procedure TFMRecepcionFichaTecnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRecepcionFichaTecnica);
end;

procedure TFMRecepcionFichaTecnica.FormShow(Sender: TObject);
begin
  inherited;
  PNLNotasResize(Sender);
end;

procedure TFMRecepcionFichaTecnica.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMRecepcionFichaTecnica.AGaleriaExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFGaleria.Text, -1) > 0) then
     FMain.EjecutaAccion(FMain.AGaleriaImagen, 'ID=' + IntToStr(DMRecepcionFichaTecnica.xRecepcionID_GALERIA_RECEPCION.AsInteger));
end;

procedure TFMRecepcionFichaTecnica.DBEClienteNombreDblClick(Sender: TObject);
begin
  inherited;
  ACliente.Execute;
end;

procedure TFMRecepcionFichaTecnica.AClienteExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBECliente.Text, 0) <> 0) then
  begin
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMRecepcionFichaTecnica.xRecepcionCLIENTE.AsInteger));
  end;
end;

procedure TFMRecepcionFichaTecnica.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  ACliente.Execute;
end;

procedure TFMRecepcionFichaTecnica.SBAGaleriaDblClick(Sender: TObject);
begin
  inherited;
  AGaleria.Execute;
end;

procedure TFMRecepcionFichaTecnica.AAdjuntoFichaExecute(Sender: TObject);
begin
  inherited;
  TFMAdjunto.Create(Self).Muestra('FIT', DMRecepcionFichaTecnica.xRecepcionID_FICHA_TECNICA.AsInteger);
end;

procedure TFMRecepcionFichaTecnica.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRecepcionFichaTecnica.BusquedaCompleja;
end;

procedure TFMRecepcionFichaTecnica.AFichaTecnicaExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFFichaTecnica.Text, 0) <> 0) then
  begin
     FMain.EjecutaAccion(FMain.AFichaTecnica, IntToStr(DMRecepcionFichaTecnica.xRecepcionID_FICHA_TECNICA.AsInteger));
  end;
end;

procedure TFMRecepcionFichaTecnica.DBEVehiculoDblClick(Sender: TObject);
begin
  inherited;
  AFichaTecnica.Execute;
end;

procedure TFMRecepcionFichaTecnica.SBAFichaTecnicaDblClick(Sender: TObject);
begin
  inherited;
  AFichaTecnica.Execute;
end;

procedure TFMRecepcionFichaTecnica.AOperarioExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEEmpleado.Text, 0) <> 0) then
  begin
     FMain.EjecutaAccion(FMain.AOpeEmpleados, 'ID_EMPLEADO = ' + IntToStr(DMRecepcionFichaTecnica.xRecepcionID_EMPLEADO.AsInteger));
  end;
end;

procedure TFMRecepcionFichaTecnica.DBEOperarioDblClick(Sender: TObject);
begin
  inherited;
  AOperario.Execute;
end;

procedure TFMRecepcionFichaTecnica.SBAOperarioDblClick(Sender: TObject);
begin
  inherited;
  AOperario.Execute;
end;

procedure TFMRecepcionFichaTecnica.PNLNotasResize(Sender: TObject);
begin
  inherited;
  DBMComentarioCliente.Top := 1;
  DBMComentarioCliente.Height := PNLNotas.Height div 3;
  LComentarioCliente.Top := DBMComentarioCliente.Top;

  DBMComentarioEstado.Top := (PNLNotas.Height div 3) + 1;
  DBMComentarioEstado.Height := PNLNotas.Height div 3;
  LComentarioEstado.Top := DBMComentarioEstado.Top;

  DBMTrabajos.Top := ((PNLNotas.Height div 3) * 2) + 1;
  DBMTrabajos.Height := (PNLNotas.Height div 3);
  LTrabajos.Top := DBMTrabajos.Top;
end;

procedure TFMRecepcionFichaTecnica.RefrescaGaleria;
begin
  DMMain.CargaImageListGaleria(DMRecepcionFichaTecnica.xRecepcionID_GALERIA_RECEPCION.AsInteger, LVGaleria, LVGaleria.Width div 3, LVGaleria.Width div 3);
end;

procedure TFMRecepcionFichaTecnica.TSGaleriaShow(Sender: TObject);
begin
  inherited;
  RefrescaGaleria;
end;

procedure TFMRecepcionFichaTecnica.FormResize(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSGaleria) then
     RefrescaGaleria;
end;

procedure TFMRecepcionFichaTecnica.DBEFGaleriaChange(Sender: TObject);
begin
  inherited;
  ETituloGaleria.Text := DameTituloGaleria(DMRecepcionFichaTecnica.xRecepcionID_GALERIA_RECEPCION.AsInteger);
  if (PCMain.ActivePage = TSGaleria) then
     RefrescaGaleria;
end;

procedure TFMRecepcionFichaTecnica.Filtra(IdRecepcion: integer; IdReparacion: integer = 0; IdFichaTecnica: integer = 0);
begin
  DMRecepcionFichaTecnica.Filtra(IdRecepcion, IdReparacion, IdFichaTecnica);
end;

procedure TFMRecepcionFichaTecnica.SBAReparacionDblClick(Sender: TObject);
begin
  inherited;
  AReparacion.Execute;
end;

procedure TFMRecepcionFichaTecnica.AReparacionExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AReparaciones, 'IDCABREPARAR = ' + IntToStr(DMRecepcionFichaTecnica.xRecepcionID_REPARACION.AsInteger));
end;

procedure TFMRecepcionFichaTecnica.FiltraFicha(Filtro: string);
begin
  DMRecepcionFichaTecnica.FiltraFicha(Filtro);
end;

procedure TFMRecepcionFichaTecnica.AListadoRecepcionExecute(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstRecepcionFichaTecnica, DMLstRecepcionFichaTecnica);
  DMLstRecepcionFichaTecnica.MostrarListado(DMRecepcionFichaTecnica.xRecepcionID_REP_RECEPCION.AsInteger);
  CierraData(DMLstRecepcionFichaTecnica);
end;

procedure TFMRecepcionFichaTecnica.AListadoPreITVExecute(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstRecepcionFichaTecnica, DMLstRecepcionFichaTecnica);
  DMLstRecepcionFichaTecnica.MostrarListadoPreITV(DMRecepcionFichaTecnica.xPreITVID_INSPECCION.AsInteger, DMRecepcionFichaTecnica.xRecepcionID_REP_RECEPCION.AsInteger);
  CierraData(DMLstRecepcionFichaTecnica);
end;

procedure TFMRecepcionFichaTecnica.AConfigListadoRecepcionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstRecepcionFichaTecnica, DMLstRecepcionFichaTecnica);
  TFMListConfig.Create(Self).Muestra(656, Formato, Cabecera, Copias, Pijama, '', DMLstRecepcionFichaTecnica.frLstRecepcion);
  CierraData(DMLstRecepcionFichaTecnica);
end;

procedure TFMRecepcionFichaTecnica.AConfigListadoPreITVExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstRecepcionFichaTecnica, DMLstRecepcionFichaTecnica);
  TFMListConfig.Create(Self).Muestra(658, Formato, Cabecera, Copias, Pijama, '', DMLstRecepcionFichaTecnica.frLstRecepcion);
  CierraData(DMLstRecepcionFichaTecnica);
end;

procedure TFMRecepcionFichaTecnica.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AListadoRecepcion.Execute;
end;

procedure TFMRecepcionFichaTecnica.actAEnviarRecepcionCorreoExecute(Sender: TObject);
var
  Memo, Cuerpo : TStrings;
  //FicherosAdj : TStrings;
  Subject, Titulo, email : string;
  DMLstRecepcionFichaTecnicaCargado, DMListadosCargado : boolean;
begin
  // Envía Recepción de Ficha Técnica por correo

  DMLstRecepcionFichaTecnicaCargado := False;
  DMListadosCargado := False;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando Recepción de Ficha Técnica por por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     Titulo := _('RecepcionFichaTecnica') + '_' + DBEIdRecepcion.Text + '_Ficha_' + DBEFFichaTecnica.Text + '-' + DMRecepcionFichaTecnica.xRecepcionMATRICULA.AsString;
     Subject := format(_('Recepción %s. Ficha Tecnica %s Matricula %s'), [DBEIdRecepcion.Text, DBEFFichaTecnica.Text, DMRecepcionFichaTecnica.xRecepcionMATRICULA.AsString]);

     try
        begin
           AbreData(TDMLstRecepcionFichaTecnica, DMLstRecepcionFichaTecnica);
           DMLstRecepcionFichaTecnicaCargado := True;
           Memo := TStringList.Create;
           Cuerpo := TStringList.Create;
           try
              DMLstRecepcionFichaTecnica.MostrarListadoMail(DMRecepcionFichaTecnica.xRecepcionID_REP_RECEPCION.AsInteger, 2, Memo);
              Cuerpo.Add(format(_('Se adjunta Recepción de Ficha Técnica de %s,'), [DMRecepcionFichaTecnica.xRecepcionTITULO_VEHICULO.AsString]));
              Cuerpo.Add(format(_('del cliente %d'), [DBEClienteNombre.Text]));

              AbreData(TDMListados, DMListados);
              DMListadosCargado := True;

              FSendCorreo.Texto(_('Enviando Mensaje  ...'));
              DMLstRecepcionFichaTecnica.DameDatosClienteTercero(StrToInt(DBECliente.Text), email);
              if (email <> '') then
              begin
                 DMListados.SendMailPDF(email, Cuerpo, DMLstRecepcionFichaTecnica.rutaFich, Titulo, Subject, '');
                 FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
              end
              else
                 FSendCorreo.Texto(_('El empleado no tiene email asignado'));
           finally
              CierraData(DMLstRecepcionFichaTecnica);
              DMListadosCargado := False;
              Memo.Free;
              Cuerpo.Free;
           end;
           CierraData(DMListados);
           DMListadosCargado := False;
        end;
     except
        begin
           Application.ProcessMessages;
           FSendCorreo.Texto(_('ERROR!! Error en el envío.'));

           // Liberamos objetos creados
           if DMLstRecepcionFichaTecnicaCargado then
              CierraData(DMLstRecepcionFichaTecnica);
           if DMListadosCargado then
              CierraData(DMListados);
        end;
     end;

     FSendCorreo.BitBtnOk.Visible := True;
     Application.ProcessMessages;
     FSendCorreo.Visible := False;
     FSendCorreo.SePuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TFMRecepcionFichaTecnica.DBGPreITVVerificacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'RESULTADO') then
        begin
           if (DMRecepcionFichaTecnica.xPreITVVerificacionRESULTADO.AsString = 'M') then
              ColorError(Canvas)
           else
           if (DMRecepcionFichaTecnica.xPreITVVerificacionRESULTADO.AsString = 'B') then
              ColorResaltado2(Canvas)
           else
           if (DMRecepcionFichaTecnica.xPreITVVerificacionRESULTADO.AsString = 'R') then
              ColorBloqueado(Canvas)
           else
              ColorResaltado(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMRecepcionFichaTecnica.DBEIdFirmaChange(Sender: TObject);
begin
  inherited;
  RefrescarImagenFirma(ImagenFirma, DMRecepcionFichaTecnica.xRecepcionID_FIRMA.AsInteger);

  { TODO: Quizas poner la primera imagen de la galeria
  DMMain.RefrescarImagen(Imagen, DMRecepcionFichaTecnica.xRecepcionID_IMAGEN.AsInteger);
  }
end;

procedure TFMRecepcionFichaTecnica.DBEGaleriaTituloDblClick(Sender: TObject);
begin
  inherited;
  AGaleria.Execute;
end;

procedure TFMRecepcionFichaTecnica.LVGaleriaDblClick(Sender: TObject);
begin
  inherited;
  try
     MuestraImagen(integer(LVGaleria.Selected.Data));
  except
  end;
end;

end.
