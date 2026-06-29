unit UFMFacturacionAlbCliDet;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UControlEdit, UFormGest,
  rxToolEdit, NsDBGrid, ULFDateEdit, ULFPanel, ULFDBEdit, ULFEditFind2000,
  ULFLabel, ULFToolBar, ULFEdit, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UEditPanel,
  ULFDBMemo, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMFacturacionAlbCliDet = class(TFPEditSinNavegador)
     TButtSep4: TToolButton;
     LCliente: TLFLabel;
     TButtSep3: TToolButton;
     TButtRegenera: TToolButton;
     TButtSep1: TToolButton;
     DBGFAlbaranes: TDBGridFind2000;
     EFCliente: TLFEditFind2000;
     TButtSep2: TToolButton;
     TButtLineasServidas: TToolButton;
     TButtLineasNoServidas: TToolButton;
     TButtGenerarFactura: TToolButton;
     LSerie: TLFLabel;
     TBOpciones: TLFToolBar;
     LFechaCont: TLFLabel;
     DEFechaCont: TLFDateEdit;
     LBLSerieDestino: TLFLabel;
     ToolButton1: TToolButton;
     DTPFechaContHora: TDateTimePicker;
     PNLSerie: TLFPanel;
     EFSerie: TLFEditFind2000;
     ESerie: TLFEdit;
     PNLCliente: TLFPanel;
     ECliente: TLFEdit;
     PNLSerieDestino: TLFPanel;
     EFSerieDestino: TLFEditFind2000;
     ESerieDestino: TLFEdit;
     PNLFechaCont: TLFPanel;
     PNTotal: TLFPanel;
     LTotalFactura: TLFLabel;
     RETotalFactura: THYGRightEdit;
     PNLDetalle: TLFPanel;
     DBGFSerializacion: TDBGridFind2000;
     Splitter: TSplitter;
     PNLDetalles: TLFPanel;
     DBMAvisos: TLFDBMemo;
     PNLAvisos: TLFPanel;
     LAvisos: TLFLabel;
     PNLFechaDoc: TLFPanel;
     LFechaDoc: TLFLabel;
     DEFechaDoc: TLFDateEdit;
     DTPFechaDocHora: TDateTimePicker;
     TButtSepTodos: TToolButton;
     TBAsignaUnidadesAFacturar: TToolButton;
     TBTBQuitaUnidadesAFacturar: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFClienteExiste(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure TButtLineasServidasClick(Sender: TObject);
     procedure TButtLineasNoServidasClick(Sender: TObject);
     procedure TButtGenerarFacturaClick(Sender: TObject);
     procedure EFSerieDestinoChange(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure DBGFAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFAlbaranesDblClick(Sender: TObject);
     procedure DBGFSerializacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TBAsignaUnidadesAFacturarClick(Sender: TObject);
     procedure TBTBQuitaUnidadesAFacturarClick(Sender: TObject);
  private
     { Private declarations }
     procedure RefrescaDatos;
     procedure AcutalizaHora;
  public
     { Public declarations }
     procedure Importe(Importe: string);
  end;

var
  FMFacturacionAlbCliDet : TFMFacturacionAlbCliDet;

implementation

uses UDMFacturacionAlbCliDet, UDMMain, UEntorno, UUtiles, UFMain, UDameDato;

{$R *.DFM}

procedure TFMFacturacionAlbCliDet.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMFacturacionAlbCliDet, DMFacturacionAlbCliDet);

  DBGFAlbaranes.ColumnasChecked.Strings[DBGFAlbaranes.ColumnasCheckBoxes.IndexOf('ENTRADA_FACTURACION')] := IntToStr(REntorno.Entrada);
  DBGFSerializacion.ColumnasChecked.Strings[DBGFSerializacion.ColumnasCheckBoxes.IndexOf('ENTRADA_FACTURACION')] := IntToStr(REntorno.Entrada);

  EFSerie.Text := REntorno.Serie;
  DEFechaCont.Date := REntorno.FechaTrab;
  DEFechaDoc.Date := REntorno.FechaTrab;

  AcutalizaHora;
end;

procedure TFMFacturacionAlbCliDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFacturacionAlbCliDet);
end;

procedure TFMFacturacionAlbCliDet.EFClienteExiste(Sender: TObject);
begin
  ECliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
  RefrescaDatos;
end;

procedure TFMFacturacionAlbCliDet.TButtRegeneraClick(Sender: TObject);
begin
  DMFacturacionAlbCliDet.RefrescarAlbaranes;
  AcutalizaHora;
end;

procedure TFMFacturacionAlbCliDet.TButtLineasServidasClick(Sender: TObject);
begin
  DMFacturacionAlbCliDet.MostrarLineasServidas(True);
end;

procedure TFMFacturacionAlbCliDet.TButtLineasNoServidasClick(Sender: TObject);
begin
  DMFacturacionAlbCliDet.MostrarLineasServidas(False);
end;

procedure TFMFacturacionAlbCliDet.TButtGenerarFacturaClick(Sender: TObject);
begin
  DMFacturacionAlbCliDet.TraspasarAlbaranesAFactura(EFSerieDestino.Text, Trunc(DEFechaDoc.Date) + Frac(DTPFechaDocHora.DateTime), Trunc(DEFechaCont.Date) + Frac(DTPFechaContHora.DateTime));
  AcutalizaHora;
end;

procedure TFMFacturacionAlbCliDet.RefrescaDatos;
begin
  DMFacturacionAlbCliDet.FiltrarAlbaranes(EFSerie.Text, StrToIntDef(EFCliente.Text, 0));
  AcutalizaHora;
end;

procedure TFMFacturacionAlbCliDet.EFSerieDestinoChange(Sender: TObject);
begin
  ESerieDestino.Text := DameTituloSerie(EFSerieDestino.Text);
end;

procedure TFMFacturacionAlbCliDet.EFSerieChange(Sender: TObject);
begin
  ESerie.Text := DameTituloSerie(EFSerie.Text);
  EFSerieDestino.Text := EFSerie.Text;
  RefrescaDatos;
end;

procedure TFMFacturacionAlbCliDet.Importe(Importe: string);
begin
  RETotalFactura.Text := Importe;
end;

procedure TFMFacturacionAlbCliDet.DBGFAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if ((UpperCase(Column.FieldName) = 'EJERCICIO') or
     (UpperCase(Column.FieldName) = 'SERIE') or
     (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMFacturacionAlbCliDet.QMDetalleFACTURABLE.AsInteger = 0) then
           ColorInactivo(Canvas)
        else
        begin
           if ((Column.FieldName = 'ENTRADA_FACTURACION') or (Column.FieldName = 'UNIDADES_A_FACTURAR')) then
              ColorEdicion(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMFacturacionAlbCliDet.DBGFAlbaranesDblClick(Sender: TObject);
begin
  FMain.TraspasoDeDocumentosSalida(DMFacturacionAlbCliDet.QMDetalleID_S.AsInteger);
end;

procedure TFMFacturacionAlbCliDet.DBGFSerializacionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (Column.FieldName = 'ARTICULO') then
        begin
           if (DMFacturacionAlbCliDet.QMDetalleARTICULO.AsString = DMFacturacionAlbCliDet.xSerializacionARTICULO.AsString) then
              ColorEdicion(Canvas)
           else
              ColorResaltado(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMFacturacionAlbCliDet.AcutalizaHora;
begin
  if (DEFechaCont.Date = Trunc(REntorno.FechaTrab)) then
     DTPFechaContHora.Time := Time;
  if (DEFechaDoc.Date = Trunc(REntorno.FechaTrab)) then
     DTPFechaDocHora.Time := Time;
end;

procedure TFMFacturacionAlbCliDet.TBAsignaUnidadesAFacturarClick(Sender: TObject);
begin
  inherited;
  DMFacturacionAlbCliDet.AsignaUnidadesAFacturar;
end;

procedure TFMFacturacionAlbCliDet.TBTBQuitaUnidadesAFacturarClick(Sender: TObject);
begin
  inherited;
  DMFacturacionAlbCliDet.QuitaUnidadesAFacturar;
end;

end.
