unit UFMPrecioReposicion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls,
  ULFEditFind2000, ULFLabel;

type
  TFMPrecioReposicion = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     PNLFiltros: TLFPanel;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     LGama: TLFLabel;
     EFGama: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFFamiliaChange(Sender: TObject);
     procedure DBGMainCellClick(Column: TColumn);
     procedure DBGMainDblClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure Filtra;
  public
     { Public declarations }
  end;

var
  FMPrecioReposicion : TFMPrecioReposicion;

implementation

uses
  UDMPrecioReposicion, UDMMain, UUtiles, UEntorno, UFormGest, UFMain;

{$R *.dfm}

procedure TFMPrecioReposicion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPrecioReposicion, DMPrecioReposicion);
  NavMain.DataSource := DMPrecioReposicion.DSxPrecioReposicion;
  DBGMain.DataSource := DMPrecioReposicion.DSxPrecioReposicion;
end;

procedure TFMPrecioReposicion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPrecioReposicion);
end;

procedure TFMPrecioReposicion.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ARTICULO') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        {
        if (DMPrecioReposicion.QMPedidosESTADO.AsInteger <> 0) then
           ColorInactivo(Canvas)
        else
        begin
           if (Column.FieldName = 'CANAL_DST_PEC') then
           begin
              if (DMServirPedidosVenta.QMPedidosCANAL_DST_PEC.AsInteger <> 0) then
              begin
                 if (DMServirPedidosVenta.QMPedidosCANAL_DST_PEC.AsInteger <> DMServirPedidosVenta.QMPedidosCANAL.AsInteger) then
                    ColorResaltado(Canvas);
              end;
           end
           else
           if (Column.FieldName = 'SERIE_DST_PEC') then
           begin
              if (DMServirPedidosVenta.QMPedidosSERIE_DST_PEC.AsString <> '') then
              begin
                 if (DMServirPedidosVenta.QMPedidosSERIE_DST_PEC.AsString <> DMServirPedidosVenta.QMPedidosSERIE.AsString) then
                    ColorResaltado(Canvas);
              end;
           end
           else
           if (Column.FieldName = 'TIPO_DST_PEC') then
           begin
              if (DMServirPedidosVenta.QMPedidosTIPO_DST_PEC.AsString <> '') then
                 ColorResaltado(Canvas);
           end
           else
           if (Column.FieldName = 'FECHA_ENTREGA_PREV') then
           begin
              Fecha := DMServirPedidosVenta.QMPedidosFECHA_ENTREGA_PREV.AsDateTime;
              if (Fecha < Today) then
                 ColorError(Canvas)
              else
              if (Fecha >= Today) and (Fecha < Tomorrow) then
                 ColorResaltado(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (Column.FieldName = 'LOTE_SIMPLE') then
           begin
              if (Trim(DMServirPedidosVenta.QMDetalleLOTE_SIMPLE.AsString) > '') then
                 ColorResaltado2(Canvas)
              else
              if (DMServirPedidosVenta.QMDetalleREQUIERE_LOTE_SIMPLE.AsInteger = 1) then
                 ColorError(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (Column.FieldName = 'UNIDADES') then
           begin
              if Param_PECSERV001 and (DMServirPedidosVenta.QMDetalleUNIDADES.AsFloat <> 1) then
                 ColorResaltado4(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (Column.FieldName = 'UNIDADES_PENDIENTES') then
           begin
              if Param_PECSERV001 and (DMServirPedidosVenta.QMDetalleUNIDADES_PENDIENTES.AsFloat <> 1) then
                 ColorResaltado4(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (Column.FieldName = 'PRECIO') then
           begin
              if (DMServirPedidosVenta.QMDetallePRECIO.AsFloat = 0) then
                 ColorBloqueado(Canvas);
           end
           else
           if Param_MODSINC003 then
           begin
              if ((Column.FieldName = 'LIQUIDO') or (Column.FieldName = 'TOTAL_PRESTASHOP')) then
              begin
                 if (DMServirPedidosVenta.QMPedidosLIQUIDO.AsFloat <> DMServirPedidosVenta.QMPedidosTOTAL_PRESTASHOP.AsFloat) then
                    ColorError(Canvas)
                 else
                    ColorInfo(Canvas);
              end
              else
              if Param_MODSINC003 then
              begin
                 if (Abs(DMServirPedidosVenta.QMPedidosLIQUIDO.AsFloat - DMServirPedidosVenta.QMPedidosTOTAL_PRESTASHOP.AsFloat) >= 0.01) then
                    ColorBloqueado(Canvas)
                 else
                    ColorInfo(Canvas);
              end;
           end;
        end;
        }
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPrecioReposicion.EFFamiliaChange(Sender: TObject);
begin
  inherited;
  Filtra;
end;

procedure TFMPrecioReposicion.Filtra;
begin
  DMPrecioReposicion.Filtra(EFFamilia.Text, EFGama.Text);
end;

procedure TFMPrecioReposicion.DBGMainCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMPrecioReposicion.DBGMainDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'ARTICULO')) then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMPrecioReposicion.xPrecioReposicionARTICULO.AsString + '''');
end;

end.
