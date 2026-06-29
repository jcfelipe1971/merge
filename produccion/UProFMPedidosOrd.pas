unit UProFMPedidosOrd;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, StdCtrls, DBCtrls,
  UDBDateTimePicker, Mask, UHYEdits, ExtCtrls, UNavigator, DB, NsDBGrid,
  rxToolEdit, RXDBCtrl, UFPEdit, ULFDBMemo, ULFToolBar, Menus, UEditPanel, ULFLabel,
  ULFPanel, ULFPageControl, ULFComboBox, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, UTeclas, UControlEdit;

type
  TProFMPedidosOrd = class(TFPEditSinNavegador)
     TButtGenerar: TToolButton;
     DBGCierres: TDBGridFind2000;
     DBGLineasPedidos: TDBGridFind2000;
     LNotas: TLFLabel;
     CBFiltro: TLFComboBox;
     TSep2: TToolButton;
     LSituacion: TLFLabel;
     TSep1: TToolButton;
     TBCierre: TToolButton;
     DBMNotas: TLFDBMemo;
     PMMarcats: TPopupMenu;
     MIMarcar: TMenuItem;
     MIDesmarcar: TMenuItem;
     TBDeslanza: TToolButton;
     TButtBorraRelacion: TToolButton;
     PNLPedidos: TLFPanel;
     PNLDetalles: TLFPanel;
     PNLFiltroSituacion: TLFPanel;
     TSep3: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGLineasPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure CBFiltroChange(Sender: TObject);
     procedure TButtGenerarClick(Sender: TObject);
     procedure DBGLineasPedidosBusqueda(Sender: TObject);
     procedure TBCierreClick(Sender: TObject);
     procedure MIMarcarClick(Sender: TObject);
     procedure MIDesmarcarClick(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure TBDeslanzaClick(Sender: TObject);
     procedure TButtBorraRelacionClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

const
  ColoresSituacion: array [0..3] of TColor = (clRed, clBlue, clBlack, clRed);

var
  ProFMPedidosOrd : TProFMPedidosOrd;

implementation

uses UProDMPedidosOrd, UDMMain, UEntorno, FIBQuery,
  UProFPregDeslanza, HYFIBQuery, UUtiles;

{$R *.dfm}

procedure TProFMPedidosOrd.FormCreate(Sender: TObject);
begin
  AbreData(TProDMPedidosOrd, ProDMPedidosOrd);

  CBFiltro.ItemIndex := 0;
  CBFiltroChange(Self);
end;

procedure TProFMPedidosOrd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ProDMPedidosOrd.QMDetallePedidos.Cancel;
  CierraData(ProDMPedidosOrd);
end;

procedure TProFMPedidosOrd.DBGLineasPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (DataCol = 0) then
     DBGLineasPedidos.Canvas.Font.Color := ColoresSituacion[ProDMPedidosOrd.QMDetallePedidosESTADO.Value];
  DBGLineasPedidos.DefaultDrawColumnCell(rect, datacol, column, State);
end;

procedure TProFMPedidosOrd.CBFiltroChange(Sender: TObject);
var
  ColumnaMarca : integer;
begin
  ProDMPedidosOrd.Filtra(CBFiltro.ItemIndex);

  TBCierre.Enabled := True;

  ColumnaMarca := EncuentraField(DBGLineasPedidos, 'MARCA');
  if (ColumnaMarca >= 0) then
     DBGLineasPedidos.Columns[ColumnaMarca].Visible := (CBFiltro.ItemIndex < 2);

  if (CBFiltro.ItemIndex < 2) then
     DBGLineasPedidos.Options := DBGLineasPedidos.Options - [dgRowSelect] + [dgEditing]
  else
     DBGLineasPedidos.Options := DBGLineasPedidos.Options + [dgRowSelect] - [dgEditing];

  TBCierre.Enabled := ((ProDMPedidosOrd.QMDetallePedidos.RecordCount > 0) and (CBFiltro.ItemIndex <> 2));

  // Si hi ha algun registre ho habilito
  DBGLineasPedidos.Enabled := (ProDMPedidosOrd.QMDetallePedidos.RecordCount > 0);
end;

procedure TProFMPedidosOrd.TButtGenerarClick(Sender: TObject);
begin
  {  if (ProDMPedidosOrd.QMDetallePedidos.IsEmpty = False) then
  begin
    if MessageDlg('El proceso de generar la orden es irreversible,' + #13#10 +
      '¿ Desea continuar ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    begin
      ProDMPedidosOrd.QMDetallePedidos.First;
      while not ProDMPedidosOrd.QMDetallePedidos.EOF do
      begin
        if ProDMPedidosOrd.QMDetallePedidosMARCA.Value = 1 then
        begin
          with ProDMPedidosOrd.QVarios do
          begin
            Sql.Clear;
            Sql.Add(
              'Insert into PRO_PEDIDOS_ORD (Empresa,Ejercicio,Canal,Serie,Rig,Linea,Fecha,Unidades,Cliente,Almacen_Lan,Almacen_sal,Almacen_Ent,Articulo,Titulo,Fecha_Pedido) ');
            Sql.Add(
              'VALUES (:Empresa,:Ejercicio,:Canal,:Serie,:Rig,:Linea,:Fecha,:Unidades,:Cliente,:Almacen_Lan,:Almacen_Sal,:Almacen_Ent,:Articulo,:Titulo,:Fecha_Pedido)');
            Params.ByName['EMPRESA'].AsInteger := ProDMPedidosOrd.QMDetallePedidosEmpresa.Value;
            Params.ByName['EJERCICIO'].AsInteger :=
              ProDMPedidosOrd.QMDetallePedidosEjercicio.Value;
            Params.ByName['CANAL'].AsInteger := ProDMPedidosOrd.QMDetallePedidosCanal.Value;
            Params.ByName['SERIE'].AsString := ProDMPedidosOrd.QMDetallePedidosSerie.Value;
            Params.ByName['RIG'].AsInteger := ProDMPedidosOrd.QMDetallePedidosRig.Value;
            Params.ByName['LINEA'].AsInteger := ProDMPedidosOrd.QMDetallePedidosLinea.Value;
            Params.ByName['FECHA'].AsDateTime := StrToDateTime(REntorno.FechaTrabStr);
            Params.ByName['UNIDADESS'].AsFloat := ProDMPedidosOrd.QMDetallePedidosUnidades.Value -
              ProDMPedidosOrd.QMDetallePedidosProUNIDADES.Value;
            Params.ByName['CLIENTE'].AsInteger := ProDMPedidosOrd.QMDetallePedidosCliente.Value;
            Params.ByName['ALMACEN_LAN'].AsString :=
              ProDMPedidosOrd.QMDetallePedidosAlmacen.Value;
            Params.ByName['ALMACEN_SAL'].AsString :=
              ProDMPedidosOrd.QMDetallePedidosAlmacen.Value;
            Params.ByName['ALMACEN_ENT'].AsString :=
              ProDMPedidosOrd.QMDetallePedidosAlmacen.Value;
            Params.ByName['ARTICULO'].AsString := ProDMPedidosOrd.QMDetallePedidosArticulo.Value;
            Params.ByName['TITULO'].AsString := ProDMPedidosOrd.QMDetallePedidosTitulo.Value;
            Params.ByName['FECHA_PEDIDO'].AsDateTime :=
              ProDMPedidosOrd.QMDetallePedidosFECHA_PEDIDO.Value;
            ExecQuery;

            with ProDMPedidosOrd.QVarios do
            begin
              Sql.Clear;
              Sql.Add('Update PRO_DET_PEDIDOS_ORD set Estado=2,Marca=0,Pro_Unidades=:VProUnidades,Pro_B_Imponible=:VPro_B_Imponible');
              Sql.Add('Where Empresa=:Empresa and');
              Sql.Add('Ejercicio=:Ejercicio and');
              Sql.Add('Canal=:Canal and');
              Sql.Add('Serie=:Serie and');
              Sql.Add('Rig=:Rig and');
              Sql.Add('Linea=:Linea');
              Params.ByName['VPROUNIDADES'].AsFloat := ProDMPedidosOrd.QMDetallePedidosUnidades.Value;
              Params.ByName['VPRO_B_IMPONIBLE'].AsFloat :=
                ProDMPedidosOrd.QMDetallePedidosB_IMPONIBLE.Value;
              Params.ByName['EMPRESA'].AsInteger := ProDMPedidosOrd.QMDetallePedidosEmpresa.Value;
              Params.ByName['EJERCICIO'].AsInteger :=
                ProDMPedidosOrd.QMDetallePedidosEjercicio.Value;
              Params.ByName['CANAL'].AsInteger := ProDMPedidosOrd.QMDetallePedidosCanal.Value;
              Params.ByName['SERIE'].AsString := ProDMPedidosOrd.QMDetallePedidosSerie.Value;
              Params.ByName['RIG'].AsInteger := ProDMPedidosOrd.QMDetallePedidosRig.Value;
              Params.ByName['LINEA'].AsInteger := ProDMPedidosOrd.QMDetallePedidosLinea.Value;
              ExecQuery;
            end;
          end;
        end;
        ProDMPedidosOrd.QMDetallePedidos.Next;

  with ProDMPedidosOrd do if (QMDetallePedidos.IsEmpty = False) then
  begin
    if MessageDlg('El proceso de generar la orden es irreversible,' + #13#10 +
      '¿ Desea continuar ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    begin
      QMDetallePedidos.First;
      while not QMDetallePedidos.EOF do
      begin
        if QMDetallePedidosMARCA.Value = 1 then
        begin
          with QVarios do
          begin
            Sql.Clear;
            Sql.Add(
              'Insert into PRO_PEDIDOS_ORD (Empresa,Ejercicio,Canal,Serie,Rig,Linea,Fecha,Unidades,Cliente,Almacen_Lan,Almacen_sal,Almacen_Ent,Articulo,Titulo,Fecha_Pedido) ');
            Sql.Add(
              'VALUES (:Empresa,:Ejercicio,:Canal,:Serie,:Rig,:Linea,:Fecha,:Unidades,:Cliente,:Almacen_Lan,:Almacen_Sal,:Almacen_Ent,:Articulo,:Titulo,:Fecha_Pedido)');
            Params.ByName['EMPRESA'].AsInteger := QMDetallePedidosEmpresa.Value;
            Params.ByName['EJERCICIO'].AsInteger :=
              QMDetallePedidosEjercicio.Value;
            Params.ByName['CANAL'].AsInteger := QMDetallePedidosCanal.Value;
            Params.ByName['SERIE'].AsString := QMDetallePedidosSerie.Value;
            Params.ByName['RIG'].AsInteger := QMDetallePedidosRig.Value;
            Params.ByName['LINEA'].AsInteger := QMDetallePedidosLinea.Value;
            Params.ByName['FECHA'].AsDateTime := StrToDateTime(REntorno.FechaTrabStr);
            Params.ByName['UNIDADES'].AsFloat := QMDetallePedidosUnidades.Value -
              QMDetallePedidosProUnidades.Value;
            Params.ByName['CLIENTE'].AsInteger := QMDetallePedidosCliente.Value;
            Params.ByName['ALMACEN_LAN'].AsString :=
              QMDetallePedidosAlmacen.Value;
            Params.ByName['ALMACEN_SAL'].AsString :=
              QMDetallePedidosAlmacen.Value;
            Params.ByName['ALMACEN_ENT'].AsString :=
              QMDetallePedidosAlmacen.Value;
            Params.ByName['ARTICULO'].AsString := QMDetallePedidosArticulo.Value;
            Params.ByName['TITULO'].AsString := QMDetallePedidosTitulo.Value;
            Params.ByName['FECHA_PEDIDO'].AsDateTime :=
              QMDetallePedidosFECHA_PEDIDO.Value;
            ExecQuery;

            with QVarios do
            begin
              Sql.Clear;
              Sql.Add('Update PRO_DET_PEDIDOS_ORD set Estado=2,Marca=0,ProUnidades=:VProUnidades,Pro_B_Imponible=:VPro_B_Imponible');
              Sql.Add('Where Empresa=:Empresa and');
              Sql.Add('Ejercicio=:Ejercicio and');
              Sql.Add('Canal=:Canal and');
              Sql.Add('Serie=:Serie and');
              Sql.Add('Rig=:Rig and');
              Sql.Add('Linea=:Linea');
              Params.ByName['VPROUNIDADES'].AsFloat := QMDetallePedidosUnidades.Value;
              Params.ByName['VPRO_B_IMPONIBLE'].AsFloat :=
                QMDetallePedidosB_IMPONIBLE.Value;
              Params.ByName['EMPRESA'].AsInteger := QMDetallePedidosEmpresa.Value;
              Params.ByName['EJERCICIO'].AsInteger :=
                QMDetallePedidosEjercicio.Value;
              Params.ByName['CANAL'].AsInteger := QMDetallePedidosCanal.Value;
              Params.ByName['SERIE'].AsString := QMDetallePedidosSerie.Value;
              Params.ByName['RIG'].AsInteger := QMDetallePedidosRig.Value;
              Params.ByName['LINEA'].AsInteger := QMDetallePedidosLinea.Value;
              ExecQuery;
            end;
          end;
        end;
        QMDetallePedidos.Next;
      end;
      ProDMPedidosOrd.QMDetallePedidos.Close;
      ProDMPedidosOrd.QMDetallePedidos.Open;
    end;
  end;
 end;
end;
end;}
end;

procedure TProFMPedidosOrd.DBGLineasPedidosBusqueda(Sender: TObject);
begin
  with DBGLineasPedidos do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if Trim(TablaABuscar) = 'PRO_ESCANDALLO' then
        CondicionBusqueda := 'TIPO=''EPR'' AND COMPUESTO =''' + ProDMPedidosOrd.QMDetallePedidos.FieldByName('ARTICULO').AsString + '''';
  end;
end;

procedure TProFMPedidosOrd.TBCierreClick(Sender: TObject);
begin
  ProDMPedidosOrd.Cerrar;
end;

procedure TProFMPedidosOrd.MIMarcarClick(Sender: TObject);
begin
  ProDMPedidosOrd.Marcar(1);
end;

procedure TProFMPedidosOrd.MIDesmarcarClick(Sender: TObject);
begin
  ProDMPedidosOrd.Marcar(0);
end;

procedure TProFMPedidosOrd.FormActivate(Sender: TObject);
begin
  inherited;
  // Si hi ha algun registre ho habilito
  DBGLineasPedidos.Enabled := (ProDMPedidosOrd.QMDetallePedidos.RecordCount > 0);
end;

procedure TProFMPedidosOrd.TBDeslanzaClick(Sender: TObject);
begin
  AbreForm(TProFPregDeslanza, ProFPregDeslanza, Sender);
end;

procedure TProFMPedidosOrd.TButtBorraRelacionClick(Sender: TObject);
begin
  ProDMPedidosOrd.BorraRelacion;
end;

end.
