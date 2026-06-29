unit UFOrdenaLineas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, UNavigator, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  dbcgrids, ULFDBCtrlGrid, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel;

type
  TFOrdenaLineas = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     LVLineas: TListView;
     TSep1: TToolButton;
     TButtMoverInicio: TToolButton;
     TButtMoverArriba: TToolButton;
     TButtMoverAbajo: TToolButton;
     TButtMoverFinal: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtConfirmarClick(Sender: TObject);
     procedure TButtMoverInicioClick(Sender: TObject);
     procedure TButtMoverArribaClick(Sender: TObject);
     procedure TButtMoverAbajoClick(Sender: TObject);
     procedure TButtMoverFinalClick(Sender: TObject);
     procedure LVLineasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure LVLineasDeletion(Sender: TObject; Item: TListItem);
     procedure LVLineasCompare(Sender: TObject; Item1, Item2: TListItem; Data: integer; var Compare: integer);
     procedure LVLineasDragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
     procedure LVLineasDragDrop(Sender, Source: TObject; X, Y: integer);
     procedure LVLineasClick(Sender: TObject);
     procedure LVLineasColumnClick(Sender: TObject; Column: TListColumn);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     TipoOrden: boolean;
     procedure MoverItem(Direccion, Cantidad: integer);
     procedure HabilitarBotones(Habilitar: boolean);
  public
     { Public declarations }
     procedure PonerDatos(Tipo: string; Id: integer);
  end;

var
  FOrdenaLineas : TFOrdenaLineas;

procedure OrdenaLineas(Tipo: string; Id: integer; Padre: TComponent);

implementation

{$R *.dfm}

uses
  UDMMain, UDMOrdenaLineas;

type
  PDatos = ^TDatos;

  TDatos = record
     Orden,
     Linea,
     Id_Det: integer;
  end;

procedure OrdenaLineas(Tipo: string; Id: integer; Padre: TComponent);
var
  FOrdenaLineas : TFOrdenaLineas;
begin
  FOrdenaLineas := TFOrdenaLineas.Create(Padre);
  try
     FOrdenaLineas.PonerDatos(Tipo, Id);
     FOrdenaLineas.ShowModal;
  finally
     FOrdenaLineas.Free;
  end;
end;

procedure TFOrdenaLineas.FormCreate(Sender: TObject);
begin
  AbreData(TDMOrdenaLineas, DMOrdenaLineas);
  HabilitarBotones(False);
  TipoOrden := False;
end;

procedure TFOrdenaLineas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LVLineas.Free;
  CierraData(DMOrdenaLineas);
end;

procedure TFOrdenaLineas.TButtConfirmarClick(Sender: TObject);
var
  i : integer;
begin
  ModalResult := mrOk;

  with LVLineas do
     for i := 0 to Items.Count - 1 do
        DMOrdenaLineas.ActualizaOrden(PDatos(Items.Item[i].Data)^.Id_Det,
           PDatos(Items.Item[i].Data)^.Orden);
end;

procedure TFOrdenaLineas.TButtMoverInicioClick(Sender: TObject);
begin
  if LVLineas.Selected.Index <> 0 then
     MoverItem(0, 0);
end;

procedure TFOrdenaLineas.TButtMoverArribaClick(Sender: TObject);
begin
  if LVLineas.Selected.Index <> 0 then
     MoverItem(1, 1);
end;

procedure TFOrdenaLineas.TButtMoverAbajoClick(Sender: TObject);
begin
  if LVLineas.Selected.Index <> LVLineas.Items.Count - 1 then
     MoverItem(2, 1);
end;

procedure TFOrdenaLineas.TButtMoverFinalClick(Sender: TObject);
begin
  if LVLineas.Selected.Index <> LVLineas.Items.Count - 1 then
     MoverItem(3, 0);
end;

procedure TFOrdenaLineas.HabilitarBotones(Habilitar: boolean);
begin
  TButtMoverInicio.Enabled := Habilitar;
  TButtMoverArriba.Enabled := Habilitar;
  TButtMoverAbajo.Enabled := Habilitar;
  TButtMoverFinal.Enabled := Habilitar;
end;

procedure TFOrdenaLineas.MoverItem(Direccion, Cantidad: integer);
var
  i : integer;
  DestItem : TListItem;
begin
  DestItem := nil;
  with LVLineas do
  begin
     case Direccion of
        0: DestItem := Items[0]; // Al inicio
        1: DestItem := Items[Selected.Index - Cantidad]; // Arriba
        2: DestItem := Items[Selected.Index + Cantidad]; // Abajo
        3: DestItem := Items[Items.Count - 1]; // Al final
     end;

     Items.BeginUpdate;
     if Direccion in [0, 1] then
     begin
        Selected.Caption := DestItem.Caption;
        PDatos(Selected.Data)^.Orden := PDatos(DestItem.Data)^.Orden;
        for i := Items.IndexOf(DestItem) to Items.IndexOf(Selected) - 1 do
        begin
           Inc(PDatos(Items.Item[i].Data)^.Orden, 1);
           Items.Item[i].Caption := IntToStr(PDatos(Items.Item[i].Data)^.Orden);
        end;
     end
     else
     begin
        Selected.Caption := DestItem.Caption;
        PDatos(Selected.Data)^.Orden := PDatos(DestItem.Data)^.Orden;
        for i := Items.IndexOf(Selected) + 1 to Items.IndexOf(DestItem) do
        begin
           Dec(PDatos(Items.Item[i].Data)^.Orden, 1);
           Items.Item[i].Caption := IntToStr(PDatos(Items.Item[i].Data)^.Orden);
        end;
     end;

     AlphaSort;
     Items.EndUpdate;
  end;
end;

procedure TFOrdenaLineas.PonerDatos(Tipo: string; Id: integer);
var
  Item : TListItem;
  Column : TListColumn;
  Datos : PDatos;
begin
  Column := LVLineas.Columns.Add;
  Column.Caption := _('Orden');
  Column.Width := 45;

  if (Tipo <> 'TESC') then
  begin
     Column := LVLineas.Columns.Add;
     Column.Caption := _('Articulo');
     Column.Width := 113;
  end;

  Column := LVLineas.Columns.Add;
  Column.Caption := _('Título');
  Column.Width := 352;

  if (Tipo <> 'TESC') then
  begin
     Column := LVLineas.Columns.Add;
     Column.Caption := _('Unidades');
     Column.Width := 113;
  end
  else
  begin
     Column := LVLineas.Columns.Add;
     Column.Caption := _('Tarea');
     Column.Width := 45;
  end;

  with DMOrdenaLineas do
  begin
     PonerDatos(Tipo, Id);

     if (Tipo = 'TESC') then
     begin
        while not xLineas.EOF do
        begin
           Item := LVLineas.Items.Add;
           Item.Caption := xLineas.FieldByName('ORDEN').AsString;
           Item.SubItems.Add(xLineas.FieldByName('TITULO').AsString);
           Item.SubItems.Add(xLineas.FieldByName('TIPOTAREA').AsString);
           New(Datos);
           Datos^.Orden := xLineas.FieldByName('ORDEN').AsInteger;
           Datos^.Id_Det := xLineas.FieldByName('ID_DET').AsInteger;
           Item.Data := Datos;
           xLineas.Next;
        end;
     end
     else if (Tipo = 'MESC') then
     begin
        while not xLineas.EOF do
        begin
           Item := LVLineas.Items.Add;
           Item.Caption := xLineas.FieldByName('ORDEN').AsString;
           Item.SubItems.Add(xLineas.FieldByName('COMPONENTE').AsString);
           Item.SubItems.Add(xLineas.FieldByName('TITULO').AsString);
           Item.SubItems.Add(xLineas.FieldByName('UNIDADES').AsString);
           New(Datos);
           Datos^.Orden := xLineas.FieldByName('ORDEN').AsInteger;
           Datos^.Id_Det := xLineas.FieldByName('ID_DET').AsInteger;
           Item.Data := Datos;
           xLineas.Next;
        end;
     end
     else
     begin
        while not xLineas.EOF do
        begin
           Item := LVLineas.Items.Add;
           Item.Caption := xLineas.FieldByName('ORDEN').AsString;
           Item.SubItems.Add(xLineas.FieldByName('ARTICULO').AsString);
           Item.SubItems.Add(xLineas.FieldByName('TITULO').AsString);
           Item.SubItems.Add(xLineas.FieldByName('UNIDADES').AsString);
           New(Datos);
           Datos^.Orden := xLineas.FieldByName('ORDEN').AsInteger;
           Datos^.Linea := xLineas.FieldByName('LINEA').AsInteger;
           Datos^.Id_Det := xLineas.FieldByName('ID_DET').AsInteger;
           Item.Data := Datos;
           xLineas.Next;
        end;
     end;
  end;
end;

procedure TFOrdenaLineas.LVLineasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if (Button = mbLeft) then
  begin
     (Sender as TListView).BeginDrag(False);
  end;
end;

procedure TFOrdenaLineas.LVLineasDeletion(Sender: TObject; Item: TListItem);
begin
  Dispose(Item.Data);
end;

procedure TFOrdenaLineas.LVLineasCompare(Sender: TObject; Item1, Item2: TListItem; Data: integer; var Compare: integer);
begin
  if (PDatos(Item1.Data)^.Orden > PDatos(Item2.Data)^.Orden) then
     Compare := 1
  else if (PDatos(Item1.Data)^.Orden < PDatos(Item2.Data)^.Orden) then
     Compare := -1
  else
     Compare := 0;
end;

procedure TFOrdenaLineas.LVLineasDragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
begin
  Accept := ((Sender is TListView) and (Sender = Source) and
     ((Sender as TListView).GetItemAt(X, Y) <> nil));
end;

procedure TFOrdenaLineas.LVLineasDragDrop(Sender, Source: TObject; X, Y: integer);
var
  i : integer;
begin
  if (LVLineas.DropTarget <> nil) then
  begin
     i := LVLineas.Selected.Index - LVLineas.DropTarget.Index;
     if (i >= 0) then
        MoverItem(1, i)
     else
        MoverItem(2, Abs(i));
  end;
end;

procedure TFOrdenaLineas.LVLineasClick(Sender: TObject);
begin
  if LVLineas.Selected = nil then
     HabilitarBotones(False)
  else
     HabilitarBotones(True);
end;

procedure TFOrdenaLineas.LVLineasColumnClick(Sender: TObject; Column: TListColumn);
var
  i, j, v, ind, swap : integer;
begin
  v := 0;
  ind := Column.Index - 1;

  if ((ind >= 0) and (ind < LVLineas.Columns.Count - 1)) then
  begin
     // Orden Ascendente
     if not (TipoOrden) then
     begin
        with LVLineas do
        begin
           Items.BeginUpdate;
           for i := 0 to Items.Count - 2 do
           begin
              for j := 0 to Items.Count - 2 - v do
              begin
                 if (Items[j].SubItems[ind] > Items[j + 1].SubItems[ind]) then
                 begin
                    swap := PDatos(Items[j].Data)^.Orden;
                    PDatos(Items[j].Data)^.Orden := PDatos(Items[j + 1].Data)^.Orden;
                    PDatos(Items[j + 1].Data)^.Orden := swap;
                    Items.Item[j].Caption := IntToStr(PDatos(Items[j].Data)^.Orden);
                    Items.Item[j + 1].Caption := IntToStr(PDatos(Items[j + 1].Data)^.Orden);
                    AlphaSort;
                 end;
              end;
              Inc(v);
           end;
           Items.EndUpdate;
        end;
        TipoOrden := True;
     end
     else
     begin
        with LVLineas do
        begin
           Items.BeginUpdate;
           for i := 0 to Items.Count - 2 do
           begin
              for j := 0 to Items.Count - 2 - v do
              begin
                 if (Items[j].SubItems[ind] < Items[j + 1].SubItems[ind]) then
                 begin
                    swap := (PDatos(Items[j].Data)^.Orden);
                    PDatos(Items[j].Data)^.Orden := PDatos(Items[j + 1].Data)^.Orden;
                    PDatos(Items[j + 1].Data)^.Orden := swap;
                    Items.Item[j].Caption := IntToStr(PDatos(Items[j].Data)^.Orden);
                    Items.Item[j + 1].Caption := IntToStr(PDatos(Items[j + 1].Data)^.Orden);
                    AlphaSort;
                 end;
              end;
              Inc(v);
           end;
           Items.EndUpdate;
        end;
        TipoOrden := False;
     end;
  end;
end;

procedure TFOrdenaLineas.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
