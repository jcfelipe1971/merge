unit UProFMImputaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UControlEdit, UFormGest,
  NsDBGrid, rxToolEdit, rxPlacemnt, ULFFormStorage, ULFPanel, ULFDBEdit,
  ULFToolBar, RXDBCtrl, ULFEditFind2000, ULFLabel, UFPEditSinNavegador,
  ActnList, ULFActionList, Menus, UTeclas, UEditPanel, TFlatCheckBoxUnit,
  ULFCheckBox;

type
  TProFMImputaciones = class(TFPEditSinNavegador)
     TButtRegenera: TToolButton;
     DBGFImputaciones: TDBGridFind2000;
     TButtLineasImp: TToolButton;
     TButtLineasNoImp: TToolButton;
     TButtMarcarTodas: TToolButton;
     TButtImputarOrdenes: TToolButton;
     TButtImputarUnidadesLinea: TToolButton;
     ToolButton3: TToolButton;
     TButtImputar: TToolButton;
     ToolButton1: TToolButton;
     PNLProduccion: TLFPanel;
     TButtMarcarTodasImp: TToolButton;
     LblFechaImp: TLFLabel;
     DEFechaImputacion: TDateEdit;
     CBUtilizarFechaDocumento: TLFCheckBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure TButtLineasImpClick(Sender: TObject);
     procedure TButtLineasNoImpClick(Sender: TObject);
     procedure TButtMarcarTodasClick(Sender: TObject);
     procedure TButtProduccionClick(Sender: TObject);
     procedure TButtImputarUnidadesLineaClick(Sender: TObject);
     procedure TButtImputarClick(Sender: TObject);
     procedure TButtMarcarTodasImpClick(Sender: TObject);
     procedure DBGFImputacionesBusqueda(Sender: TObject);
     procedure DEFechaImputacionChange(Sender: TObject);
     procedure CBUtilizarFechaDocumentoChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     Marca: boolean;
     IdDocumento: integer;
     procedure RefrescaBotones;
  public
     { Public declarations }
     procedure FiltraDoc(aIdDocumento: integer);
  end;

var
  ProFMImputaciones : TProFMImputaciones;

implementation

uses UProDMImputaciones, UEntorno, UUtiles, UDMMain;

{$R *.DFM}

procedure TProFMImputaciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMImputaciones, ProDMImputaciones);

  Marca := True;
  IdDocumento := 0;
  DBGFImputaciones.ColumnasChecked.Strings[DBGFImputaciones.ColumnasCheckBoxes.IndexOf('ENTRADA_IMPUTACION')] := IntToStr(REntorno.Entrada);
  DEFechaImputacion.Date := REntorno.FechaTrab;

  RefrescaBotones;
end;

procedure TProFMImputaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMImputaciones);
end;

procedure TProFMImputaciones.FiltraDoc(aIdDocumento: integer);
begin
  IdDocumento := aIdDocumento;
  TButtRegeneraClick(Self);
  ShowModal;
end;

procedure TProFMImputaciones.TButtRegeneraClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     ProDMImputaciones.InsertarLineasProd(IdDocumento);
     ProDMImputaciones.FiltrarDocumento(IdDocumento);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TProFMImputaciones.TButtLineasImpClick(Sender: TObject);
begin
  ProDMImputaciones.MostrarLineasImputables(True);
end;

procedure TProFMImputaciones.TButtLineasNoImpClick(Sender: TObject);
begin
  ProDMImputaciones.MostrarLineasImputables(False);
end;

procedure TProFMImputaciones.TButtMarcarTodasClick(Sender: TObject);
begin
  if Confirma then
     try
        Screen.Cursor := crHourGlass;
        ProDMImputaciones.MarcarLineasDocumento;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TProFMImputaciones.TButtProduccionClick(Sender: TObject);
var
  s : string;
begin
  // Modifico caption de formulario para debugar en el cliente donde se para
  // Una captura de pantalla nos dira el punto exacto

  s := Self.Caption;

  if ((ProDMImputaciones.QMDetalleFASE_ORDEN.AsInteger = 0) or
     (ProDMImputaciones.QMDetalleID_ORDEN.AsInteger = 0)) then
     ShowMessage(_('Faltan datos: Orden de producción o Fase de la OF'))
  else
  begin
     Self.Caption := s + ' - crHourGlass';
     Application.ProcessMessages;

     Screen.Cursor := crHourGlass;
     try
        Self.Caption := s + ' - TraspasarDocumento';
        Application.ProcessMessages;

        ProDMImputaciones.TraspasarDocumento;
     finally
        Self.Caption := s + ' - crDefault';
        Application.ProcessMessages;

        Screen.Cursor := crDefault;
     end;

     Self.Caption := s + ' - Marca';
     Application.ProcessMessages;

     Marca := True;

     Self.Caption := s + ' - RefrescaBotones';
     Application.ProcessMessages;

     RefrescaBotones;

     Self.Caption := s + ' - Proceso finalizado.';
     Application.ProcessMessages;

     ShowMessage(_('Proceso finalizado.'));
  end;

  Self.Caption := s;
end;

procedure TProFMImputaciones.TButtImputarUnidadesLineaClick(Sender: TObject);
begin
  ProDMImputaciones.ImputarUnidadesLinea;
end;

procedure TProFMImputaciones.TButtImputarClick(Sender: TObject);
begin
  if Confirma then
     ProDMImputaciones.ImputarMarcados;
end;

procedure TProFMImputaciones.TButtMarcarTodasImpClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     ProDMImputaciones.MarcarLineasDocImp(Marca);
     Marca := not Marca;
     RefrescaBotones;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TProFMImputaciones.RefrescaBotones;
begin
  if Marca then
  begin
     TButtMarcarTodasImp.Hint := _('Marcar como imputadas todas las lineas');
     TButtMarcarTodasImp.ImageIndex := 19;
  end
  else
  begin
     TButtMarcarTodasImp.Hint := _('Desmarcar todas las lineas marcadas como imputadas');
     TButtMarcarTodasImp.ImageIndex := 27;
  end;
end;

procedure TProFMImputaciones.DBGFImputacionesBusqueda(Sender: TObject);
begin
  if Trim(DBGFImputaciones.TablaABuscar) = 'PRO_ORD' then
     DBGFImputaciones.CondicionBusqueda := 'situacion < 4'
  else if Trim(DBGFImputaciones.TablaABuscar) = 'PRO_ORD_FASES' then
     DBGFImputaciones.CondicionBusqueda := 'id_orden = ' + IntToStr(ProDMImputaciones.QMDetalleID_ORDEN.AsInteger);
end;

procedure TProFMImputaciones.DEFechaImputacionChange(Sender: TObject);
begin
  ProDMImputaciones.FechaImputacion := DEFechaImputacion.Date;
end;

procedure TProFMImputaciones.CBUtilizarFechaDocumentoChange(Sender: TObject);
begin
  inherited;
  ProDMImputaciones.UtilizarFechaDocumento := CBUtilizarFechaDocumento.Checked;
  DEFechaImputacion.Enabled := not CBUtilizarFechaDocumento.Checked;
end;

procedure TProFMImputaciones.FormShow(Sender: TObject);
begin
  inherited;
  DEFechaImputacionChange(Sender);
  CBUtilizarFechaDocumentoChange(Sender);
end;

end.
