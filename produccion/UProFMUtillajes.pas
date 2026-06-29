{ TODO : TSPROYECTOS tiene propiedad TabVisible = False. Hay que terminar de analizar la funcionalidad de esta pagina }
unit UProFMUtillajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ComCtrls, ULFPageControl, UEditPanel, UNavigator, ToolWin, ULFToolBar,
  ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, UFIBDBEditfind,
  ULFFIBDBEditFind, UG2kTBLoc, ULFLabel, ULFEdit,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, Buttons, UHYDescription,
  ULFHYDBDescription, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBMemo;

type
  TProFMUtillajes = class(TFPEdit)
     LblUtillaje: TLFLabel;
     LblDescripcion: TLFLabel;
     DBCodigo: TLFDbedit;
     DBDescripcion: TLFDbedit;
     CEImatgesUtil: TControlEdit;
     CEPMImatges: TPopUpTeclas;
     LblArticulo: TLFLabel;
     DBETituloArticulo: TLFDbedit;
     EFArticulo: TLFDBEditFind2000;
     LblImagen: TLFLabel;
     DBEFImagen: TLFFibDBEditFind;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     Imagen: TImage;
     SBAArticulo: TSpeedButton;
     TSUtilizacion: TTabSheet;
     TBUtilizacion: TLFToolBar;
     NavUtilizacion: THYMNavigator;
     PNLTituloUtilizacion: TLFPanel;
     LUtillajeUtilizacion: TLFLabel;
     DBEUtillajeUtilizacion: TLFDbedit;
     DBETituloUtillajeUtilizacion: TLFDbedit;
     PNLUtilizacion: TLFPanel;
     DBGUtilizacion: THYTDBGrid;
     BClipboard: TButton;
     TSIntervencion: TTabSheet;
     TBIntervencion: TLFToolBar;
     PNLTituloIntervencion: TLFPanel;
     LUtillajeIntervencion: TLFLabel;
     DBEUtillajeIntervencion: TLFDbedit;
     DBETituloUtillajeIntervencion: TLFDbedit;
     PCIntervencion: TPageControl;
     TSIntervencionFicha: TTabSheet;
     TSIntervencionTabla: TTabSheet;
     DBGIntervencion: THYTDBGrid;
     PEditIntervencion: TLFPanel;
     LMaquina: TLFLabel;
     DBEFCodMaq: TLFDBEditFind2000;
     NavIntervencion: THYMNavigator;
     DBEDescric: TLFDbedit;
     LDireccionesTelefonos: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     LMatricero: TLFLabel;
     DBEFMatricero: TLFDBEditFind2000;
     EDescMatricero: TLFEdit;
     LVerificador: TLFLabel;
     DBEFVerificador: TLFDBEditFind2000;
     EDescVerificador: TLFEdit;
     LIntervencionFecha: TLFLabel;
     DBDTPFechaCalidad: TLFDBDateEdit;
     LInicio: TLFLabel;
     DBDTPInicioRep: TLFDBDateEdit;
     LFinal: TLFLabel;
     DBDTPFinalRep: TLFDBDateEdit;
     DBDescInterv: TLFDbedit;
     LDescInterv: TLFLabel;
     DBCBConformidad: TLFDBCheckBox;
     ALOperario: TLFActionList;
     AAMatricero: TAction;
     AAVerificador: TAction;
     EDescMaquina: TLFEdit;
     CEIntervencion: TControlEdit;
     CEIntervencionPMEdit: TPopUpTeclas;
     DBMNotas: TLFDBMemo;
     Splitter1: TSplitter;
     LNotas: TLFLabel;
     DBETituloCliente: TLFDbedit;
     LCliente: TLFLabel;
     PNLEditDatos: TLFPanel;
     DBEFCliente: TLFDBEditFind2000;
     TSProyectos: TTabSheet;
     DBGProyectos: THYTDBGrid;
     SBACliente: TSpeedButton;
     DBCBActivo: TLFDBCheckBox;
     DBCBBaja: TLFDBCheckBox;
     LProyecto: TLFLabel;
     DBEFProyecto: TLFDBEditFind2000;
     DBETituloProyecto: TLFDbedit;
     SBAProyecto: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFImagenChange(Sender: TObject);
     procedure NavImatgesClick(Sender: TObject; Button: TNavigateBtn);
     procedure BCargarImagenClick(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure DBETituloArticuloDblClick(Sender: TObject);
     procedure SBAArticuloDblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BClipboardClick(Sender: TObject);
     procedure TSUtilizacionShow(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure TSIntervencionShow(Sender: TObject);
     procedure DBEFCodMaqChange(Sender: TObject);
     procedure AAMatriceroExecute(Sender: TObject);
     procedure EDescMatriceroDblClick(Sender: TObject);
     procedure AAVerificadorExecute(Sender: TObject);
     procedure EDescVerificadorDblClick(Sender: TObject);
     procedure DBEFMatriceroChange(Sender: TObject);
     procedure DBEFVerificadorChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure PEditResize(Sender: TObject);
     procedure NavMainChangeState(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure DBGUtilizacionDblClick(Sender: TObject);
     procedure DBGUtilizacionCellClick(Column: TColumn);
     procedure PNLEditDatosResize(Sender: TObject);
     procedure DBGUtilizacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure SBAProyectoDblClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     procedure FiltraUtillaje(Utillaje: string);
  end;

var
  ProFMUtillajes : TProFMUtillajes;

implementation

uses UProDMUtillajes, UFormGest, UDMMain, UEntorno, UUtiles, UDameDato, UFMain, DB, UImagenes;

{$R *.dfm}

procedure TProFMUtillajes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMUtillajes, ProDMUtillajes);

  NavMain.DataSource := ProDMUtillajes.DSQMProSysUtillajes;
  DBGMain.DataSource := ProDMUtillajes.DSQMProSysUtillajes;
  G2KTableLoc.DataSource := ProDMUtillajes.DSQMProSysUtillajes;

  NavUtilizacion.DataSource := ProDMUtillajes.DSUtilizacion;
  DBGUtilizacion.DataSource := ProDMUtillajes.DSUtilizacion;

  NavIntervencion.DataSource := ProDMUtillajes.DSQMIntervencion;
  DBGIntervencion.DataSource := ProDMUtillajes.DSQMIntervencion;

  ControlEdit := CEMain;

  SolapaControles(SBAArticulo, DBETituloArticulo);
  DBETituloArticulo.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBACliente, DBETituloCliente);
  DBETituloCliente.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAProyecto, DBETituloProyecto);
  DBETituloProyecto.Color := REntorno.ColorEnlaceActivo;
end;

procedure TProFMUtillajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMUtillajes);
end;

procedure TProFMUtillajes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TProFMUtillajes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMUtillajes.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMUtillajes.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TProFMUtillajes.NavImatgesClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TProFMUtillajes.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ProDMUtillajes.QMProSysUtillajesIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TProFMUtillajes.EFArticuloChange(Sender: TObject);
begin
  inherited;
  DBETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TProFMUtillajes.DBETituloArticuloDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos,
     'Articulo = ''' + ProDMUtillajes.QMProSysUtillajesARTICULO.AsString + '''');
end;

procedure TProFMUtillajes.SBAArticuloDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos,
     'Articulo = ''' + ProDMUtillajes.QMProSysUtillajesARTICULO.AsString + '''');
end;

procedure TProFMUtillajes.BClipboardClick(Sender: TObject);
begin
  inherited;
  ProDMUtillajes.QMProSysUtillajesIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TProFMUtillajes.FiltraUtillaje(Utillaje: string);
begin
  ProDMUtillajes.FiltraUtillaje(Utillaje);
  if (PCMain.ActivePage = TSUtilizacion) then
     ProDMUtillajes.AbreUtilizacion;
  if (PCMain.ActivePage = TSIntervencion) then
     ProDMUtillajes.AbreIntervencion;
end;

procedure TProFMUtillajes.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMain.ActivePage = TSUtilizacion) then
     ProDMUtillajes.CierraUtilizacion;
  if (PCMain.ActivePage = TSIntervencion) then
     ProDMUtillajes.CierraIntervencion;
end;

procedure TProFMUtillajes.TSUtilizacionShow(Sender: TObject);
begin
  inherited;
  ProDMUtillajes.AbreUtilizacion;
end;

procedure TProFMUtillajes.TSIntervencionShow(Sender: TObject);
begin
  inherited;
  ProDMUtillajes.AbreIntervencion;
end;

procedure TProFMUtillajes.DBEFCodMaqChange(Sender: TObject);
begin
  inherited;
  EDescMaquina.Text := DameTituloMaquina(StrToIntDef(DBEFCodMaq.Text, 0));
end;

procedure TProFMUtillajes.AAMatriceroExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO = ''' +
     ProDMUtillajes.QMIntervencionMATRICERO.AsString + '''');
end;

procedure TProFMUtillajes.EDescMatriceroDblClick(Sender: TObject);
begin
  inherited;
  AAMatricero.Execute;
end;

procedure TProFMUtillajes.AAVerificadorExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO = ''' +
     ProDMUtillajes.QMIntervencionVERIFICADOR.AsString + '''');
end;

procedure TProFMUtillajes.EDescVerificadorDblClick(Sender: TObject);
begin
  inherited;
  AAVerificador.Execute;
end;

procedure TProFMUtillajes.DBEFMatriceroChange(Sender: TObject);
begin
  inherited;
  EDescMatricero.Text := DameTituloEmpleado(ProDMUtillajes.QMIntervencionMATRICERO.AsInteger);
end;

procedure TProFMUtillajes.DBEFVerificadorChange(Sender: TObject);
begin
  inherited;
  EDescVerificador.Text := DameTituloEmpleado(ProDMUtillajes.QMIntervencionVERIFICADOR.AsInteger);
end;

procedure TProFMUtillajes.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  DBETituloCliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0));
end;

procedure TProFMUtillajes.PEditResize(Sender: TObject);
begin
  inherited;
  DBMNotas.Width := PEdit.Width div 2;
end;

procedure TProFMUtillajes.NavMainChangeState(Sender: TObject);
begin
  inherited;
  BCargarImagen.Visible := NavMain.DataSource.DataSet.State = dsEdit;
  BClipboard.Visible := NavMain.DataSource.DataSet.State = dsEdit;
end;

procedure TProFMUtillajes.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  if (ProDMUtillajes.QMProSysUtillajesCLIENTE.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(ProDMUtillajes.QMProSysUtillajesCLIENTE.AsInteger));
end;

procedure TProFMUtillajes.DBGUtilizacionDblClick(Sender: TObject);
begin
  inherited;
  if (ProDMUtillajes.QUtilizacionID_ORDEN.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.AProOrden, IntToStr(ProDMUtillajes.QUtilizacionID_ORDEN.AsInteger));
end;

procedure TProFMUtillajes.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  if (ProDMUtillajes.QMProSysUtillajesPROYECTO.AsInteger <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, IntToStr(ProDMUtillajes.QMProSysUtillajesPROYECTO.AsInteger));
end;

procedure TProFMUtillajes.DBGUtilizacionCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TProFMUtillajes.PNLEditDatosResize(Sender: TObject);
begin
  inherited;
  SolapaControles(SBAArticulo, DBETituloArticulo);
  SolapaControles(SBACliente, DBETituloCliente);
  SolapaControles(SBAProyecto, DBETituloProyecto);
end;

procedure TProFMUtillajes.DBGUtilizacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then
     begin
        ColorFocused(Canvas);
     end
     else
     begin
        if (UpperCase(Column.FieldName) = 'SITUACION') then
        begin
           ColorSegunSituacion(Canvas, ProDMUtillajes.QUtilizacionSITUACION.AsInteger);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {with DBGridFind2000}
end;

end.
