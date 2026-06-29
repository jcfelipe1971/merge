unit UProFMMaquinas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBMemo, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox,
  UG2kTBLoc, UHYDescription, ULFHYDBDescription, ULFLabel, DB, ULFDBDateEdit,
  ULFComboBox, ULFEdit;

type
  TProFMMaquinas = class(TFPEdit)
     LCodigo: TLFLabel;
     DBECodigo: TLFDbedit;
     LTipo: TLFLabel;
     LCodId: TLFLabel;
     DBECodIdentificacion: TLFDbedit;
     LFechaCompra: TLFLabel;
     DBDTPFechaCompra: TLFDBDateEdit;
     LFabricante: TLFLabel;
     DBEFabricante: TLFDbedit;
     LNSerie: TLFLabel;
     DBENSerie: TLFDbedit;
     LblDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LSeccion: TLFLabel;
     DBMNotas: TLFDBMemo;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDet: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBEFTipo: TLFDBEditFind2000;
     DBEFSeccion: TLFDBEditFind2000;
     LFrecuencia: TLFLabel;
     DBEFrecuencia: TLFDbedit;
     LblFechaCert: TLFLabel;
     DBDTPFechaCert: TLFDBDateEdit;
     DBCBCertificado: TLFDBCheckBox;
     PCDetalle: TLFPageControl;
     TSRevision: TTabSheet;
     TSReparaciones: TTabSheet;
     DBGFDetalle: TDBGridFind2000;
     DBGFDetRep: TDBGridFind2000;
     CEDetReparaciones: TControlEdit;
     CEDetReparacionesPMEdit: TPopUpTeclas;
     AListadoMaquinas: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LblRecurso: TLFLabel;
     DBEFRecurso: TLFDBEditFind2000;
     DBERecurso: TLFDBEdit;
     ALstConfig: TAction;
     LblCalendario: TLFLabel;
     LblHorario: TLFLabel;
     DBEFCalendario: TLFDBEditFind2000;
     DBECalendario: TLFDBEdit;
     DBEFHorario: TLFDBEditFind2000;
     DescHorario: TLFHYDBDescription;
     DescTipo: TLFHYDBDescription;
     DescSeccion: TLFHYDBDescription;
     ALstCodBarrasMaq: TAction;
     TBDocumentos: TToolButton;
     ALMaquinas: TLFActionList;
     ADocumentos: TAction;
     ToolButton1: TToolButton;
     TButtNotasDetalle: TToolButton;
     ANotasDetalle: TAction;
     ToolButton3: TToolButton;
     TButtMaqRevision: TToolButton;
     AMaqRevision: TAction;
     ALstRevision: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ALstConfigMaqRevision: TAction;
     LFDBNotasRev: TLFDBMemo;
     LFDBNotasRep: TLFDBMemo;
     TSCola: TTabSheet;
     DBGFCola: TDBGridFind2000;
     TSep1: TToolButton;
     CBSeccion: TLFComboBox;
     LBLImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     Imagen: TImage;
     LColorLanzada: TLFLabel;
     LColorReservada: TLFLabel;
     LColorCerradaParcialmente: TLFLabel;
     PNLColores: TLFPanel;
     Butt1: TToolButton;
     TButtAsignar: TToolButton;
     TButtDesasignar: TToolButton;
     Butt2: TToolButton;
     AAsignar: TAction;
     ADesasignar: TAction;
     BClipboard: TButton;
     DBCBVirtual: TLFDBCheckBox;
     DBCBWeb: TLFDBCheckBox;
     TSParametros: TTabSheet;
     PEditParametros: TPanel;
     LFLabel1: TLFLabel;
     DBEMPrep: TLFDbedit;
     LFLabel2: TLFLabel;
     DBEMLPrep: TLFDbedit;
     LFLabel3: TLFLabel;
     DBEAnchoMax1: TLFDbedit;
     LFLabel4: TLFLabel;
     DBEVelocidad: TLFDbedit;
     LFLabel5: TLFLabel;
     DBEAnchoMax3: TLFDbedit;
     LFLabel6: TLFLabel;
     DBEAnchoMin: TLFDbedit;
     LFLabel7: TLFLabel;
     DBEAnchoMax2: TLFDbedit;
     TBDetalleTBCostes: TLFToolBar;
     DBECodMaqEti: TLFDbedit;
     Navparametros: THYMNavigator;
     EDescripcionMaquina: TLFEdit;
     DBEFFase: TLFDBEditFind2000;
     LFase: TLFLabel;
     DescFase: TLFHYDBDescription;
     LCentroTrabajo: TLFLabel;
     DBEFCentroTrabajo: TLFDBEditFind2000;
     ECentroTrabajo: TLFEdit;
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSRevisionShow(Sender: TObject);
     procedure TSReparacionesShow(Sender: TObject);
     procedure PCDetalleChange(Sender: TObject);
     procedure AListadoMaquinasExecute(Sender: TObject);
     procedure DBEFRecursoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ALstConfigExecute(Sender: TObject);
     procedure DBEFCalendarioChange(Sender: TObject);
     procedure DBEFHorarioChange(Sender: TObject);
     procedure DBEFTipoChange(Sender: TObject);
     procedure DBEFSeccionChange(Sender: TObject);
     procedure ALstCodBarrasMaqExecute(Sender: TObject);
     procedure ADocumentosExecute(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure AMaqRevisionExecute(Sender: TObject);
     procedure ALstRevisionExecute(Sender: TObject);
     procedure ALstConfigMaqRevisionExecute(Sender: TObject);
     procedure TSColaShow(Sender: TObject);
     procedure DBGFColaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFColaCellClick(Column: TColumn);
     procedure DBGFColaDblClick(Sender: TObject);
     procedure CBSeccionChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure AAsignarExecute(Sender: TObject);
     procedure ADesasignarExecute(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure BClipboardClick(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure TSParametrosShow(Sender: TObject);
     procedure DBECodMaqEtiChange(Sender: TObject);
     procedure DBEFFaseChange(Sender: TObject);
     procedure DBEFCentroTrabajoChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  ProFMMaquinas : TProFMMaquinas;

implementation

uses UDMMain, UFormGest, UUtiles, UEntorno, UProDMMaquinas, UDMListados, UFMListConfig, UProFMLstCodBarras,
  UProFMFicherosCliente, UFMNotasCampo, UProFMMaquinasRevisiones,
  UProFMLstRevisiones, UFMain, UDameDato, URellenaLista, UImagenes;

{$R *.DFM}

procedure TProFMMaquinas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMaquinas, ProDMMaquinas);
  NavMain.DataSource := ProDMMaquinas.DSQMMaquinasC;
  EPMain.DataSource := ProDMMaquinas.DSQMMaquinasC;
  DBGMain.DataSource := ProDMMaquinas.DSQMMaquinasC;
  NavDet.DataSource := ProDMMaquinas.DSQMMaquinasD;
  DBGFDetalle.DataSource := ProDMMaquinas.DSQMMaquinasD;
  CEMainPMEdit.Teclas := DMMain.teclas;
  PCDetalle.ActivePage := TSRevision;
  RellenaSecciones(CBSeccion.Items, True);
  CBSeccion.ItemIndex := 0;
  CBSeccionChange(Self);

  // Color campo ID
  ColorCampoID(DBECodigo);
end;

procedure TProFMMaquinas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMaquinas);
end;

procedure TProFMMaquinas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMaquinas.BusquedaCompleja;
end;

procedure TProFMMaquinas.TSRevisionShow(Sender: TObject);
begin
  inherited;
  NavDet.ControlEdit := CEDetalle;
  NavDet.DataSource := ProDMMaquinas.DSQMMaquinasD;
end;

procedure TProFMMaquinas.TSReparacionesShow(Sender: TObject);
begin
  inherited;
  NavDet.ControlEdit := CEDetReparaciones;
  NavDet.DataSource := ProDMMaquinas.DSQMMaquinasRep;
end;

procedure TProFMMaquinas.TSColaShow(Sender: TObject);
begin
  inherited;
  NavDet.ControlEdit := CEDetalle;
  NavDet.DataSource := ProDMMaquinas.DSxCola;
end;

procedure TProFMMaquinas.PCDetalleChange(Sender: TObject);
begin
  inherited;
  // Controlo el canvi de pàgina - sfg.albert
  if (PCDetalle.ActivePage = TSReparaciones) then
  begin
     NavDet.EditaControl := DBGFDetRep;
     NavDet.InsertaControl := DBGFDetRep;
  end
  else
  if (PCDetalle.ActivePage = TSRevision) then
  begin
     NavDet.EditaControl := DBGFDetalle;
     NavDet.InsertaControl := DBGFDetalle;
  end
  else
  if (PCDetalle.ActivePage = TSCola) then
  begin
     NavDet.EditaControl := DBGFCola;
     NavDet.InsertaControl := DBGFCola;
  end;

  LColorLanzada.Visible := (PCDetalle.ActivePage = TSCola);
  LColorReservada.Visible := (PCDetalle.ActivePage = TSCola);
  LColorCerradaParcialmente.Visible := (PCDetalle.ActivePage = TSCola);
end;

procedure TProFMMaquinas.AListadoMaquinasExecute(Sender: TObject);
begin
  inherited;
  ProDMMaquinas.ListadoMaquinas;
end;

procedure TProFMMaquinas.DBEFRecursoChange(Sender: TObject);
begin
  inherited;
  DBERecurso.Text := DameTituloRecurso(DBEFRecurso.Text);
end;

procedure TProFMMaquinas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableloc.Click;
end;

procedure TProFMMaquinas.ALstConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8011, Formato, Cabecera, Copias, Pijama, '', ProDMMaquinas.frHYMaquinas);
end;

procedure TProFMMaquinas.ALstConfigMaqRevisionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8204, Formato, Cabecera, Copias, Pijama, '', ProDMMaquinas.frLstMaqRevision);
end;

procedure TProFMMaquinas.DBEFCalendarioChange(Sender: TObject);
begin
  inherited;
  DBECalendario.Text := DameTituloCalendario(StrToIntDef(DBEFCalendario.Text, 0));
end;

procedure TProFMMaquinas.DBEFHorarioChange(Sender: TObject);
begin
  inherited;
  DescHorario.ActualizaDatos('HORARIO', DBEFHorario.Text);
end;

procedure TProFMMaquinas.DBEFTipoChange(Sender: TObject);
begin
  inherited;
  DescTipo.ActualizaDatos('TIPO', DBEFTipo.Text);
end;

procedure TProFMMaquinas.DBEFSeccionChange(Sender: TObject);
begin
  inherited;
  DescSeccion.ActualizaDatos('SECCION', DBEFSeccion.Text);
end;

procedure TProFMMaquinas.ALstCodBarrasMaqExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstCodBarras, ProFMLstCodBarras, Sender);
  ProFMLstCodBarras.PCMain.ActivePage := ProFMLstCodBarras.TSMaquines;
end;

procedure TProFMMaquinas.ADocumentosExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ADocumentos);
  ProFMFicherosCliente.Filtra(ProDMMaquinas.QMMaquinasCID_MAQUINA.AsString, 'PRO_MAQUINAS_C(ID_MAQUINA)', 'DELFOS-MAQUINA', _('Ficheros de Maquina'));
end;

procedure TProFMMaquinas.ANotasDetalleExecute(Sender: TObject);
var
  Marca : TBookmark;
begin
  inherited;
  with NavDet do
  begin
     Marca := DataSource.DataSet.GetBookmark;
     try
        ProDMMaquinas.PreparaNotasDetalle(DataSource);

        if (DataSource = ProDMMaquinas.DSQMMaquinasRep) then
           EditarCampoNotas(Self, ProDMMaquinas.DSQMMaquinasRep, ProDMMaquinas.QMMaquinasRepNOTAS)
        else
        if (DataSource = ProDMMaquinas.DSQMMaquinasD) then
           EditarCampoNotas(Self, ProDMMaquinas.DSQMMaquinasD, ProDMMaquinas.QMMaquinasDNOTAS);

        DataSource.DataSet.GotoBookmark(Marca);
     finally
        DataSource.DataSet.FreeBookmark(Marca);
     end;
  end;
end;

procedure TProFMMaquinas.AMaqRevisionExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProTMaquinaRevision);
end;

procedure TProFMMaquinas.ALstRevisionExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstRevisiones, ProFMLstRevisiones);
end;

procedure TProFMMaquinas.DBGFColaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'ID_ORDEN') or (UpperCase(Column.FieldName) = 'RIG_OF') or (UpperCase(Column.FieldName) = 'LINEA_FASE') or (UpperCase(Column.FieldName) = 'LINEA_TAREA') or (UpperCase(Column.FieldName) = 'COMPUESTO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (ProDMMaquinas.xColaID_ORDEN.AsInteger <> 0) then
     begin
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        begin
           if (not Column.ReadOnly) then
              ColorEdicion(Canvas)
           else
              case ProDMMaquinas.xColaSITUACION.AsInteger of
                 1: ColorResaltado(Canvas); // Lanzada;
                 2: ColorResaltado6(Canvas); // Reservada
                 3: ColorResaltado5(Canvas); // Cerrada Parcialmente
              end;

           if (UpperCase(Column.FieldName) = 'ESTADO_HOJA_TRABAJO') then
           begin
              if (ProDMMaquinas.xColaESTADO_HOJA_TRABAJO.Text = _('Finalizada')) then
                 ColorResaltado3(Canvas)
              else
                 ColorInfo(Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TProFMMaquinas.DBGFColaCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TProFMMaquinas.DBGFColaDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'ID_ORDEN') or (UpperCase(ColActual.FieldName) = 'RIG_OF') or (UpperCase(ColActual.FieldName) = 'LINEA_FASE') or (UpperCase(ColActual.FieldName) = 'LINEA_TAREA')) then
  begin
     if (ProDMMaquinas.xColaID_ORDEN.AsInteger <> 0) then
        FMain.EjecutaAccion(FMain.AProOrden, IntToStr(ProDMMaquinas.xColaID_ORDEN.AsInteger));
  end;

  if (UpperCase(ColActual.FieldName) = 'COMPUESTO') then
  begin
     if (ProDMMaquinas.xColaCOMPUESTO.AsString <> '') then
        FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + ProDMMaquinas.xColaCOMPUESTO.AsString + '''');
  end;
end;

procedure TProFMMaquinas.CBSeccionChange(Sender: TObject);
var
  Seccion : string;
begin
  inherited;
  with CBSeccion do
  begin
     if (Text <> '') then
     begin
        Seccion := '';
        if (CBSeccion.ItemIndex > 0) then
           Seccion := Copy(Text, 1, Pos(' ', Text) - 1);

        ProDMMaquinas.FiltraSeccion(Seccion);
     end;
  end;
end;

procedure TProFMMaquinas.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ProDMMaquinas.QMMaquinasCID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TProFMMaquinas.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TProFMMaquinas.AAsignarExecute(Sender: TObject);
begin
  inherited;
  ProDMMaquinas.Asignar;
end;

procedure TProFMMaquinas.ADesasignarExecute(Sender: TObject);
begin
  inherited;
  ProDMMaquinas.Desasignar;
end;

procedure TProFMMaquinas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TProFMMaquinas.BClipboardClick(Sender: TObject);
begin
  inherited;
  ProDMMaquinas.QMMaquinasCID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TProFMMaquinas.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMain.ActivePage = TSParametros) then
     ProDMMaquinas.QMMaquinasEti.Close;
end;

procedure TProFMMaquinas.TSParametrosShow(Sender: TObject);
begin
  inherited;
  ProDMMaquinas.QMMaquinasEti.Open;
end;

procedure TProFMMaquinas.DBECodMaqEtiChange(Sender: TObject);
begin
  inherited;
  EDescripcionMaquina.Text := DameTituloMaquina(StrToIntDef(DBECodMaqEti.Text, 0));
end;

procedure TProFMMaquinas.DBEFFaseChange(Sender: TObject);
begin
  inherited;
  DescFase.ActualizaDatos('FASE', DBEFFase.Text);
end;

procedure TProFMMaquinas.DBEFCentroTrabajoChange(Sender: TObject);
begin
  inherited;
  ECentroTrabajo.Text := DameTituloCentroTrabajo(DBEFCentroTrabajo.Text);
end;

end.
