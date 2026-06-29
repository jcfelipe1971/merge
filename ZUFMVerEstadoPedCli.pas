unit ZUFMVerEstadoPedCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ComCtrls, ExtCtrls, ULFPanel, ToolWin, ULFToolBar,
  Mask, DBCtrls, ULFDBEdit, StdCtrls, ULFLabel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, Grids, DBGrids, NsDBGrid,
  rxPlacemnt, ULFFormStorage, ULFEdit, TFlatCheckBoxUnit, ULFCheckBox,
  UFPEditSimple, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  UEditPanel, UNavigator;

type
  TZFMVerEstadoPedCli = class(TFPEditSimple)
     PnlCliente: TLFPanel;
     PnlDatosCab: TLFPanel;
     TSep3: TToolButton;
     EFCliente: TLFEditFind2000;
     LCliente: TLFLabel;
     ETituloCliente: TLFEdit;
     DBGFPedPdtes: TDBGridFind2000;
     TButtMultiSeleccion: TToolButton;
     CBDatosCab: TLFCheckBox;
     TButtMultiZonas: TToolButton;
     Splitter1: TSplitter;
     DBGPedidosCompra: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFClienteChange(Sender: TObject);
     procedure DBGFPedPdtesDblClick(Sender: TObject);
     procedure DBGFPedPdtesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TButtMultiSeleccionClick(Sender: TObject);
     procedure CBDatosCabChange(Sender: TObject);
     procedure TButtMultiZonasClick(Sender: TObject);
     procedure DBGPedidosCompraDblClick(Sender: TObject);
     procedure DBGPedidosCompraDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMVerEstadoPedCli : TZFMVerEstadoPedCli;

implementation

uses UDMMain, ZUDMVerEstadoPedCli, UFMain, UEntorno, UUtiles, DateUtils, UFMMultiAgrupacion,
  UFMMultiZona, UDameDato;

{$R *.dfm}

procedure TZFMVerEstadoPedCli.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMVerEstadoPedCli, ZDMVerEstadoPedCli);

  NavMain.DataSource := ZDMVerEstadoPedCli.DSQMVerPedidos;
  DBGFPedPdtes.DataSource := ZDMVerEstadoPedCli.DSQMVerPedidos;

  CBDatosCab.Checked := True;
  ZDMVerEstadoPedCli.AbreDatos(StrToIntDef(EFCliente.Text, 0), BoolToInt(CBDatosCab.Checked));
end;

procedure TZFMVerEstadoPedCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMVerEstadoPedCli);
end;

procedure TZFMVerEstadoPedCli.EFClienteChange(Sender: TObject);
begin
  ETituloCliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
  ZDMVerEstadoPedCli.AbreDatos(StrToIntDef(EFCliente.Text, 0), BoolToInt(CBDatosCab.Checked));
end;

procedure TZFMVerEstadoPedCli.DBGFPedPdtesDblClick(Sender: TObject);
begin
  if (ZDMVerEstadoPedCli.QMVerPedidos.FieldByName('CANAL').AsInteger = REntorno.Canal) then
  begin
     if (ZDMVerEstadoPedCli.QMVerPedidos.FieldByName('ID_S').AsInteger <> 0) then
        FMain.TraspasoDeDocumentosSalida(ZDMVerEstadoPedCli.QMVerPedidos.FieldByName('ID_S').AsInteger);
  end
  else
     ConfirmaMensajeCaption(_('Documento no visible. El documento no pertenece al canal activo.'), _('Mostrar documento'));
end;

procedure TZFMVerEstadoPedCli.DBGFPedPdtesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (UpperCase(Column.FieldName) = 'NUM_PEDIDO') then
     CeldaEnlace(DBGFPedPdtes, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (ZDMVerEstadoPedCli.QMVerPedidosID_S_ALB.AsInteger = 0) then
        begin
           if (UpperCase(Column.FieldName) = 'REF_PEDIDO') then
           begin
              // Verde. Los pedidos a proveedor estan completamente servidos
              if (ZDMVerEstadoPedCli.QMVerPedidosESTADO_PEP.AsInteger = 5) then
                 ColorResaltado4(Canvas)
              else
              // Rojo. Algun pedido a proveedor esta abierto
              if (ZDMVerEstadoPedCli.QMVerPedidosESTADO_PEP.AsInteger >= 0) then
                 ColorError(Canvas)
              else
              // Amarillo. No hay pedidos a proveedor asociados a este pedido.
              if (ZDMVerEstadoPedCli.QMVerPedidosESTADO_PEP.AsInteger < 0) then
                 ColorResaltado(Canvas);
           end;

           if (UpperCase(Column.FieldName) = 'FECHA_ENTREGA_PREV') then
           begin
              // Rojo. Si la fecha de entrega prevista es para hoy o anterior.
              if (ZDMVerEstadoPedCli.QMVerPedidosFECHA_ENTREGA_PREV.AsDateTime < Today + 1) then
                 ColorError(Canvas);
           end;
        end
        else
        begin
           if (UpperCase(Column.FieldName) = 'FECHA_ALB') then
           begin
              // Rojo. Si la fecha de entrega prevista es para hoy o anterior.
              if (ZDMVerEstadoPedCli.QMVerPedidosID_S_ALB.AsInteger > 0) then
                 if (ZDMVerEstadoPedCli.QMVerPedidosFECHA_ALB.AsDateTime < Today + 1) then
                    ColorError(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'FECHA_RUTA') then
           begin
              // Rojo. Si la fecha de entrega prevista es para hoy o anterior.
              if (ZDMVerEstadoPedCli.QMVerPedidosID_RUTA.AsInteger > 0) then
              begin
                 if (ZDMVerEstadoPedCli.QMVerPedidosFECHA_RUTA.AsDateTime < Today + 1) then
                    ColorError(Canvas);
              end
              else
                 ColorResaltado3(Canvas);
           end
           else
              ColorResaltado2(Canvas);
        end;

        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TZFMVerEstadoPedCli.TButtMultiSeleccionClick(Sender: TObject);
begin
  AbreForm(TFMMultiAgrupacion, FMMultiAgrupacion, Sender);
  with FMMultiAgrupacion do
  begin
     SetTipo('C');
     Hide;
     ShowModal;
  end;

  ZDMVerEstadoPedCli.AbreDatos(StrToIntDef(EFCliente.Text, 0), BoolToInt(CBDatosCab.Checked));
end;

procedure TZFMVerEstadoPedCli.CBDatosCabChange(Sender: TObject);
begin
  ZDMVerEstadoPedCli.AbreDatos(StrToIntDef(EFCliente.Text, 0), BoolToInt(CBDatosCab.Checked));
end;

procedure TZFMVerEstadoPedCli.TButtMultiZonasClick(Sender: TObject);
begin
  inherited;
  AbreForm(TFMMultiZona, FMMultiZona, Sender);
  with FMMultiZona do
  begin
     Hide;
     ShowModal;
  end;

  ZDMVerEstadoPedCli.AbreDatos(StrToIntDef(EFCliente.Text, 0), BoolToInt(CBDatosCab.Checked));
end;

procedure TZFMVerEstadoPedCli.DBGPedidosCompraDblClick(Sender: TObject);
begin
  inherited;
  if (ZDMVerEstadoPedCli.QMVerPedidos.FieldByName('CANAL').AsInteger = REntorno.Canal) then
  begin
     if (ZDMVerEstadoPedCli.xPedidosCompra.FieldByName('ID_E').AsInteger <> 0) then
        FMain.TraspasoDeDocumentosEntrada(ZDMVerEstadoPedCli.xPedidosCompra.FieldByName('ID_E').AsInteger);
  end
  else
     ConfirmaMensajeCaption(_('Documento no visible. El documento no pertenece al canal activo.'), _('Mostrar documento'));
end;

procedure TZFMVerEstadoPedCli.DBGPedidosCompraDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(DBGFPedPdtes, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (ZDMVerEstadoPedCli.xPedidosCompraID_E.AsInteger <> 0) then
        begin
           if (UpperCase(Column.FieldName) = 'FECHA_PRE_DET') then
           begin
              // Rojo. Si la fecha de entrega prevista es para hoy o anterior.
              if (ZDMVerEstadoPedCli.xPedidosCompraFECHA_PRE_DET.AsDateTime < Today + 1) then
                 ColorError(Canvas);
           end;
        end;

        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TZFMVerEstadoPedCli.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;
  // Recupero labels de columnas segun los DisplayLabel de los campos
  with DBGFPedPdtes do
     for i := 0 to Columns.Count - 1 do
        Columns[i].Title.Caption := DataSource.DataSet.FieldByName(Columns[i].FieldName).DisplayLabel;

  with DBGPedidosCompra do
     for i := 0 to Columns.Count - 1 do
        Columns[i].Title.Caption := DataSource.DataSet.FieldByName(Columns[i].FieldName).DisplayLabel;
end;

end.
