unit UFMFichaTecnica;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, ULFFIBDBEditFind, StdCtrls, Mask, DBCtrls,
  ULFDBEdit, ULFLabel, ULFDBMemo, ULFEdit, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, ULFDBEditFind2000, Buttons, UFPEdit, ShellAPI;

type
  TFMFichaTecnica = class(TFPEdit)
     LMatricula: TLFLabel;
     LMarca: TLFLabel;
     LModelo: TLFLabel;
     LBastidor: TLFLabel;
     LRenting: TLFLabel;
     LCliente: TLFLabel;
     LFechaCompra: TLFLabel;
     LFechaProximaITV: TLFLabel;
     DBEMatricula: TLFDbedit;
     DBEModelo: TLFDbedit;
     DBEBastidor: TLFDbedit;
     DBERenting: TLFDbedit;
     DBECliente: TLFDBEditFind2000;
     DBEMarca: TLFDBEditFind2000;
     DBDEFechaCompra: TLFDBDateEdit;
     DBDEFechaProximaITV: TLFDBDateEdit;
     ECliente: TLFEdit;
     EMarca: TLFEdit;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     LImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     Imagen: TImage;
     TSGaleria: TTabSheet;
     LGaleria: TLFLabel;
     DBEFGaleria: TLFDBEditFind2000;
     ETituloGaleria: TLFEdit;
     AGaleria: TAction;
     LFCategoryAction1: TLFCategoryAction;
     SBAGaleria: TSpeedButton;
     SBACliente: TSpeedButton;
     ACliente: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AAdjuntoFicha: TAction;
     BClipboard: TButton;
     DBETitulo: TLFDbedit;
     LTitulo: TLFLabel;
     LFechaUltimaITV: TLFLabel;
     DBDEFecUltimaITV: TLFDBDateEdit;
     LMotor: TLFLabel;
     DBEMotor: TLFDbedit;
     LColor: TLFLabel;
     LAnyoFabricacion: TLFLabel;
     DBEColor: TLFDbedit;
     DBEAnyoFabricacion: TLFDbedit;
     LMedidasNeumatico: TLFLabel;
     DBEMedidasNeumatico: TLFDbedit;
     PNLFicha: TLFPanel;
     PNLImagen: TLFPanel;
     TBGaleria: TLFToolBar;
     PNLTBGaleria: TLFPanel;
     LGaleriaMatricula: TLFLabel;
     DBEGaleriaMatricula: TLFDbedit;
     DBEGaleriaTitulo: TLFDbedit;
     LKilomentraje: TLFLabel;
     DBEKilomentraje: TLFDbedit;
     LVGaleria: TListView;
     SPHistoricoReparaciones: TSplitter;
     PNLHistoricoReparaciones: TLFPanel;
     DBGHistoricoReparaciones: THYTDBGrid;
     DBEIdFicheTecnica: TLFDbedit;
     LIdFichaTecnica: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFImagenChange(Sender: TObject);
     procedure DBEMarcaChange(Sender: TObject);
     procedure DBEClienteChange(Sender: TObject);
     procedure AGaleriaExecute(Sender: TObject);
     procedure EClienteDblClick(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure SBAGaleriaDblClick(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure AAdjuntoFichaExecute(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure BCargarImagenClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEMatriculaChange(Sender: TObject);
     procedure TSGaleriaShow(Sender: TObject);
     procedure DBEFGaleriaChange(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure PMainResize(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGHistoricoReparacionesDblClick(Sender: TObject);
     procedure DBGHistoricoReparacionesCellClick(Column: TColumn);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure LVGaleriaDblClick(Sender: TObject);
     procedure DBEGaleriaTituloDblClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure RefrescaGaleria;
  public
     { Public declarations }
     procedure FiltraFicha(IdFichaTecnica: string);
  end;

var
  FMFichaTecnica : TFMFichaTecnica;

implementation

uses UFormGest, UDMFichaTecnica, UEntorno, UDMMain, UFMain, UUtiles, UDMReparaciones, UFMAdjunto,
  UDMAdjunto, URecibeFicheros, UDMOfertas, UFMostrarImagen, UDameDato, UImagenes;

{$R *.dfm}

procedure TFMFichaTecnica.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMFichaTecnica, DMFichaTecnica);
  Campo := DMFichaTecnica.QMFichaTecnicaID_FICHA_TECNICA;
  NavMain.DataSource := DMFichaTecnica.DSQMFichaTecnica;
  EPMain.DataSource := DMFichaTecnica.DSQMFichaTecnica;
  DBGMain.DataSource := DMFichaTecnica.DSQMFichaTecnica;
  G2KTableLoc.DataSource := DMFichaTecnica.DSQMFichaTecnica;

  SolapaControles(SBAGaleria, ETituloGaleria);
  ETituloGaleria.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBACliente, ECliente);
  ECliente.Color := REntorno.ColorEnlaceActivo;
  ColorCampoID(DBEIdFicheTecnica);
end;

procedure TFMFichaTecnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFichaTecnica);
end;

procedure TFMFichaTecnica.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMFichaTecnica.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSFicha) then
  begin
     RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
     ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
  end;
end;

procedure TFMFichaTecnica.DBEMarcaChange(Sender: TObject);
begin
  inherited;
  EMarca.Text := DMFichaTecnica.DameTituloMarca(DBEMarca.Text);
end;

procedure TFMFichaTecnica.DBEClienteChange(Sender: TObject);
begin
  inherited;
  ECliente.Text := DameTituloCliente(StrToIntDef(DBECliente.Text, 0));
end;

procedure TFMFichaTecnica.AGaleriaExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFGaleria.Text, -1) > 0) then
     FMain.EjecutaAccion(FMain.AGaleriaImagen, 'ID=' + DBEFGaleria.Text);
end;

procedure TFMFichaTecnica.EClienteDblClick(Sender: TObject);
begin
  inherited;
  ACliente.Execute;
end;

procedure TFMFichaTecnica.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  ACliente.Execute;
end;

procedure TFMFichaTecnica.AClienteExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBECliente.Text, 0) <> 0) then
  begin
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DBECliente.Text);
  end;
end;

procedure TFMFichaTecnica.SBAGaleriaDblClick(Sender: TObject);
begin
  inherited;
  AGaleria.Execute;
end;

procedure TFMFichaTecnica.FormActivate(Sender: TObject);
var
  Cliente : integer;
begin
  inherited;
  if FMain.EnlaceCrea then
  begin
     Cliente := -1;
     if (Assigned(DMReparaciones)) then
        Cliente := DMReparaciones.QMCabRepararCLIENTE.AsInteger
     else
     if (Assigned(DMOfertas)) then
        Cliente := DMOfertas.QMCabeceraCLIENTE.AsInteger;
     DMFichaTecnica.NuevaFicha(Cliente);
     DBEMatricula.SetFocus;
  end;
end;

procedure TFMFichaTecnica.FiltraFicha(IdFichaTecnica: string);
begin
  if (IdFichaTecnica <> '') then
     DMFichaTecnica.FiltraFicha(StrToIntDef(IdFichaTecnica, 0));
end;

procedure TFMFichaTecnica.AAdjuntoFichaExecute(Sender: TObject);
begin
  inherited;
  TFMAdjunto.Create(Self).Muestra('FIT', DMFichaTecnica.QMFichaTecnicaID_FICHA_TECNICA.AsInteger);
end;

procedure TFMFichaTecnica.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMFichaTecnica.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMFichaTecnica.QMFichaTecnicaID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMFichaTecnica.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMFichaTecnica.QMFichaTecnicaID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMFichaTecnica.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMFichaTecnica.BusquedaCompleja;
end;

procedure TFMFichaTecnica.RefrescaGaleria;
begin
  DMMain.CargaImageListGaleria(DMFichaTecnica.QMFichaTecnicaID_GALERIA.AsInteger, LVGaleria, LVGaleria.Width div 3, LVGaleria.Width div 3);
end;

procedure TFMFichaTecnica.DBEMatriculaChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSGaleria) then
     RefrescaGaleria;
end;

procedure TFMFichaTecnica.TSGaleriaShow(Sender: TObject);
begin
  inherited;
  RefrescaGaleria;
end;

procedure TFMFichaTecnica.DBEFGaleriaChange(Sender: TObject);
begin
  inherited;
  ETituloGaleria.Text := DameTituloGaleria(DMFichaTecnica.QMFichaTecnicaID_GALERIA.AsInteger);
end;

procedure TFMFichaTecnica.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('FIT', DMFichaTecnica.QMFichaTecnicaID_FICHA_TECNICA.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoFicha.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMFichaTecnica.PMainResize(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSGaleria) then
     RefrescaGaleria;
end;

procedure TFMFichaTecnica.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'IDCABREPARAR') or
     (UpperCase(Column.FieldName) = 'CLIENTE') or
     (UpperCase(Column.FieldName) = 'ID_REP_RECEPCION') or
     (UpperCase(Column.FieldName) = 'EJERCICIO_ORIGEN') or
     (UpperCase(Column.FieldName) = 'CANAL_ORIGEN') or
     (UpperCase(Column.FieldName) = 'SERIE_ORIGEN') or
     (UpperCase(Column.FieldName) = 'TIPO_ORIGEN') or
     (UpperCase(Column.FieldName) = 'RIG_ORIGEN') or
     (UpperCase(Column.FieldName) = 'EJERCICIO_DESTINO') or
     (UpperCase(Column.FieldName) = 'CANAL_DESTINO') or
     (UpperCase(Column.FieldName) = 'SERIE_DESTINO') or
     (UpperCase(Column.FieldName) = 'TIPO_DESTINO') or
     (UpperCase(Column.FieldName) = 'RIG_DESTINO')) then
  begin
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
  end;

  { Por si tenemos que pintar segun stiucacion, estado, etc.
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = '???') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('???').AsString) <> 'N') then
              ColorInactivo(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  }
end;

procedure TFMFichaTecnica.DBGHistoricoReparacionesDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'IDCABREPARAR') then
     FMain.EjecutaAccion(FMain.AReparaciones, 'IDCABREPARAR = ' + IntToStr(DMFichaTecnica.QMCabRepararIDCABREPARAR.AsInteger));

  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
     ACliente.Execute;

  if (UpperCase(ColActual.FieldName) = 'ID_REP_RECEPCION') then
     FMain.EjecutaAccion(FMain.ARecepcionFichaTecnica, 'ID_REP_RECEPCION = ' + IntToStr(DMFichaTecnica.QMCabRepararID_REP_RECEPCION.AsInteger));

  if ((UpperCase(ColActual.FieldName) = 'EJERCICIO_ORIGEN') or
     (UpperCase(ColActual.FieldName) = 'CANAL_ORIGEN') or
     (UpperCase(ColActual.FieldName) = 'SERIE_ORIGEN') or
     (UpperCase(ColActual.FieldName) = 'TIPO_ORIGEN') or
     (UpperCase(ColActual.FieldName) = 'RIG_ORIGEN')) then
     FMain.TraspasoDeDocumentosSalida(DMFichaTecnica.QMCabRepararID_S_ORIGEN.AsInteger);

  if ((UpperCase(ColActual.FieldName) = 'EJERCICIO_DESTINO') or
     (UpperCase(ColActual.FieldName) = 'CANAL_DESTINO') or
     (UpperCase(ColActual.FieldName) = 'SERIE_DESTINO') or
     (UpperCase(ColActual.FieldName) = 'TIPO_DESTINO') or
     (UpperCase(ColActual.FieldName) = 'RIG_DESTINO')) then
     FMain.TraspasoDeDocumentosSalida(DMFichaTecnica.QMCabRepararID_S.AsInteger);
end;

procedure TFMFichaTecnica.DBGHistoricoReparacionesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMFichaTecnica.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if FMain.sourcecall = True then
  begin
     FMain.sourcecall := False;
     Close;
  end;
end;

procedure TFMFichaTecnica.LVGaleriaDblClick(Sender: TObject);
begin
  inherited;
  try
     MuestraImagen(integer(LVGaleria.Selected.Data));
  except
  end;
end;

procedure TFMFichaTecnica.DBEGaleriaTituloDblClick(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFGaleria.Text, -1) > 0) then
     FMain.EjecutaAccion(FMain.AGaleriaImagen, 'ID=' + IntToStr(DMFichaTecnica.QMFichaTecnicaID_GALERIA.AsInteger));
end;

end.
