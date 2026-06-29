unit ZUFMLstOrdenes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UComponentesBusquedaFiltrada, StdCtrls, ExtCtrls, Mask, DBCtrls,
  ActnList, ComCtrls, ToolWin, UFIBDBEditfind, UFormGest, rxPlacemnt,
  TFlatCheckBoxUnit, ULFCheckBox, ULFPanel, ULFEditFind2000, ULFDBEdit,
  ULFLabel, ULFToolBar, rxToolEdit, ULFDateEdit;

type
  TZFMLstOrdenes = class(TG2kForm)
     gbLabel: TGroupBox;
     gbReception: TGroupBox;
     gbOrder: TGroupBox;
     dbeFromLabel: TLFDbedit;
     dbeUntilLabel: TLFDbedit;
     efFromLabel: TLFEditFind2000;
     efUntilLabel: TLFEditFind2000;
     LDesdeEtiqueta: TLFLabel;
     LHastaEtiqueta: TLFLabel;
     dbeUntilOrder: TLFDbedit;
     dbeFromOrder: TLFDbedit;
     efFromOrder: TLFEditFind2000;
     efUntilOrder: TLFEditFind2000;
     LHastaOrden: TLFLabel;
     LDesdeOrden: TLFLabel;
     gbFilters: TGroupBox;
     gbClient: TGroupBox;
     LHastaCliente: TLFLabel;
     LDesdeCliente: TLFLabel;
     dbeUntilClient: TLFDbedit;
     dbeFromClient: TLFDbedit;
     efFromClient: TLFEditFind2000;
     efUntilClient: TLFEditFind2000;
     chbOrder: TLFCheckBox;
     chbClient: TLFCheckBox;
     chbLabel: TLFCheckBox;
     chbDelivery: TLFCheckBox;
     TBMain: TLFToolBar;
     tbPrint: TToolButton;
     tbView: TToolButton;
     tbExit: TToolButton;
     tbDesign: TToolButton;
     chbReception: TLFCheckBox;
     dtpFromReception: TLFDateEdit;
     dtpUntilReception: TLFDateEdit;
     LHastaFechaRecepcion: TLFLabel;
     LDesdeFechaRecepcion: TLFLabel;
     ToolButton1: TToolButton;
     PNLFechas: TLFPanel;
     gbDelivery: TGroupBox;
     LHastaFechaEntrega: TLFLabel;
     LDesdeFechaEntrega: TLFLabel;
     dtpFromDelivery: TLFDateEdit;
     dtpUntilDelivery: TLFDateEdit;
     chbState: TLFCheckBox;
     gbState: TGroupBox;
     xchbPL: TLFCheckBox;
     xchbEX: TLFCheckBox;
     xchbCC: TLFCheckBox;
     xchbIM: TLFCheckBox;
     xchbDI: TLFCheckBox;
     xchbPR: TLFCheckBox;
     PNLTipoYFiltro: TLFPanel;
     rgListType: TRadioGroup;
     FormStorage: TFormStorage;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure tbExitClick(Sender: TObject);
     procedure efFromReceptionChange(Sender: TObject);
     procedure tbViewClick(Sender: TObject);
     procedure chbOrderClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure efFromOrderBusqueda(Sender: TObject);
     procedure dtpdUntilDeliveryChange(Sender: TObject);
  private
     function DateToStrX(d: TDateTime): string;
     function IntToStrX(int, f: integer): string;
     procedure AddAnd(var s: string);
     { Private declarations }
  public
     { Public declarations }
     procedure ShowRig(strRIG: string);
  end;

var
  ZFMLstOrdenes : TZFMLstOrdenes;

implementation

uses
  UDMMain, UEntorno, FIBDataSetRO, DB, ZUDMLstOrdenes, ZUDMOrdenesProd;

const
  EmptyFilter: string = ' where ';

{$R *.dfm}

procedure TZFMLstOrdenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ZDMLstOrdenes);
  Action := caFree;
end;

procedure TZFMLstOrdenes.tbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMLstOrdenes.efFromReceptionChange(Sender: TObject);
var
  Filter : string;
  Other : TEditFind2000;
begin
  ZDMLstOrdenes.RefreshDRO((Sender as TEditFind2000).Text, ZDMLstOrdenes.
     FindComponent('x' + Copy((Sender as TComponent).Name, 3,
     Length((Sender as TComponent).Name) - 2)) as TFIBDataSetRO);
  if Copy((Sender as TEditFind2000).Name, 1, 6) = 'efFrom' then
  begin
     Filter := Copy((Sender as TEditFind2000).Name, 7, Length((Sender as TEditFind2000).Name) - 6);
     Other := FindComponent('efUntil' + Filter) as TEditFind2000;
     if Other.Text = '' then
        Other.Text := (Sender as TEditFind2000).Text;
  end;
end;

function TZFMLstOrdenes.IntToStrX(int, f: integer): string;
begin
  Result := IntToStr(int);
  while Length(Result) < f do
     Result := '0' + Result;
end;

function TZFMLstOrdenes.DateToStrX(d: TDateTime): string;
var
  yy, mm, dd : word;
begin
  DecodeDate(d, yy, mm, dd);
  Result := IntToStrX(mm, 2) + '/' + IntToStrX(dd, 2) + '/' + IntToStrX(yy, 4);
end;

procedure TZFMLstOrdenes.AddAnd(var s: string);
const
  sAnd = ' and ';
begin
  if (s <> EmptyFilter) and
     (Copy(s, Length(s) - 4, 5) <> sAnd) then
     s := s + sAnd;
end;

procedure TZFMLstOrdenes.tbViewClick(Sender: TObject);
var
  i, j, marcados, marc : integer;
  Filter : string;
  strCommas, SQLFilters : string;
const
  Field: array [0..5] of string = ('ord.RIG', 'ord.CLIENTE', 'ord.ARTICULO', 'ord.FECHA_EMISION',
     'ord.FECHA_ENTREGA', 'ord.ESTADO');
  Commas: array [0..5] of string = ('', '', '''', '''', '''', '''');
  Lists: array [0..1] of integer = (9901, 9902);
begin
  SQLFilters := EmptyFilter;
  marcados := 0;
  marc := 0;
  for i := 0 to ComponentCount - 1 do
  begin
     if (Components[i] is TLFCheckBox) and ((Components[i] as TLFCheckBox).Checked) and ((Components[i] as TLFCheckBox).Name[1] <> 'x') then
     begin
        Inc(marcados);
        marc := (Components[i] as TLFCheckBox).Tag;

        strCommas := Commas[(Components[i] as TLFCheckBox).Tag];
        Filter := Copy((Components[i] as TLFCheckBox).Name, 4, Length(
           (Components[i] as TLFCheckBox).Name) - 3);
        //      if SQLFilters<>EmptyFilter then
        AddAnd(SQLFilters);// := SQLFilters + ' and ';
        case (Components[i] as TLFCheckBox).Tag of
           0, 1, 2: SQLFilters :=
                 SQLFilters + '(' + Field[(Components[i] as TLFCheckBox).Tag] +
                 '>=' + strCommas + (FindComponent('efFrom' + Filter) as TEditFind2000).Text +
                 strCommas + ') and (' + Field[(Components[i] as TLFCheckBox).Tag] +
                 '<=' + strCommas + (FindComponent('efUntil' + Filter) as TEditFind2000).Text +
                 strCommas + ')';
           3, 4: SQLFilters :=
                 SQLFilters + '(' + Field[(Components[i] as TLFCheckBox).Tag] +
                 '>=' + strCommas + DateToStrX((FindComponent('dtpFrom' + Filter) as TLFDateEdit).Date) +
                 '' + strCommas + ') and (' + Field[(Components[i] as TLFCheckBox).Tag] +
                 '<' + strCommas + DateToStrX((FindComponent('dtpUntil' + Filter) as TLFDateEdit).Date + 1) +
                 ' ' + strCommas + ')';
           5: for j := 0 to ComponentCount - 1 do
                 if (Components[j] is TLFCheckBox) and (not (Components[j] as TLFCheckBox).Checked) and ((Components[j] as TLFCheckBox).Name[1] = 'x') then
                 begin
                    //                  if (SQLFilters<>EmptyFilter) then
                    AddAnd(SQLFilters);// := SQLFilters + ' and ';
                    SQLFilters := SQLFilters + '(' + Field[(Components[i] as TLFCheckBox).Tag] +
                       '<>' + strcommas + Copy((Components[j] as TLFCheckBox).Name, 5, 2) +
                       strcommas + ')';
                 end;
        end;
     end;
  end;
  if SQLFilters <> EmptyFilter then
     SQLFilters := SQLFilters + ' and ';
  SQLFilters := SQLFilters + '(ord.empresa   =' + IntToStr(REntorno.Empresa) + ')';
  SQLFilters := SQLFilters + ' and (ord.ejercicio =' + IntToStr(REntorno.Ejercicio) + ')';
  SQLFilters := SQLFilters + ' and (ord.canal     =' + IntToStr(REntorno.Canal) + ')';
  SQLFilters := SQLFilters + ' and (ord.serie     =''' + REntorno.Serie + ''')';
  SQLFilters := SQLFilters + ' and (ord.tipo      =''ZOF'') ';
  ZDMLstOrdenes.Filters := SQLFilters;

  if (marcados = 1) then
  begin
     case marc of
        0, 1, 2: ZDMLstOrdenes.Ordenacion := 'order by ord.cliente, ord.rig';
        3: ZDMLstOrdenes.Ordenacion := 'order by ord.cliente, ord.fecha_fabrica';
        4: ZDMLstOrdenes.Ordenacion := 'order by ord.cliente, ord.fecha_entrega';
        5: ZDMLstOrdenes.Ordenacion := 'order by ord.cliente, ord.estado';
     end;
  end
  else
     ZDMLstOrdenes.Ordenacion := 'order by ord.cliente, ord.rig';

  if rgListType.ItemIndex = 0 then
  begin
     AbreData(TZDMOrdenesProd, ZDMOrdenesProd);
  end;
  ZDMLstOrdenes.ShowList(Lists[rgListType.ItemIndex], (Sender as TComponent).Tag);
end;

procedure TZFMLstOrdenes.chbOrderClick(Sender: TObject);
var
  str : string;
begin
  str := (Sender as TLFCheckBox).Name;
  Delete(str, 1, 3);
  (FindComponent('gb' + str) as TGroupBox).Visible := (Sender as TLFCheckBox).Checked;
  if (str = 'Delivery') or (str = 'Reception') then
     PNLFechas.Visible := chbDelivery.Checked or chbReception.Checked;
end;

procedure TZFMLstOrdenes.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TZDMLstOrdenes, ZDMLstOrdenes);
  dtpUntilReception.Date := Date;
  dtpUntilDelivery.Date := Date;
end;

procedure TZFMLstOrdenes.efFromOrderBusqueda(Sender: TObject);
var
  Filter : string;
  This, Other : TEditFind2000;
begin
  This := Sender as TEditFind2000;
  if Copy(This.Name, 1, 6) = 'efFrom' then
  begin
     Filter := Copy(This.Name, 7, Length(This.Name) - 6);
     Other := FindComponent('efUntil' + Filter) as TEditFind2000;
     if Other.Text <> '' then
     begin
        This.CondicionBusqueda := This.CampoNum + '<=''' + Other.Text + '''';
     end;
  end
  else
  begin
     Filter := Copy(This.Name, 8, Length(This.Name) - 7);
     Other := FindComponent('efFrom' + Filter) as TEditFind2000;
     if Other.Text <> '' then
     begin
        This.CondicionBusqueda := This.CampoNum + '>=''' + Other.Text + '''';
     end;
  end;
end;

procedure TZFMLstOrdenes.dtpdUntilDeliveryChange(Sender: TObject);
var
  str : string;
  this : TLFDateEdit;
begin
  this := Sender as TLFDateEdit;
  str := this.Name;
  Delete(str, 1, 3);
  if str[1] = 'd' then
     Delete(str, 1, 1);
  (FindComponent('dtp' + str) as TLFDateEdit).Date := This.Date;
  (FindComponent('dtpd' + str) as TLFDateEdit).Date := This.Date;
end;

procedure TZFMLstOrdenes.ShowRig(strRIG: string);
begin
  chbOrder.Checked := True;
  chbOrderClick(chbOrder);
  efFromOrder.Text := strRIG;
  efFromReceptionChange(efFromOrder);
end;

end.
