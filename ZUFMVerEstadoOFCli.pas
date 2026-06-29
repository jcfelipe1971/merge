unit ZUFMVerEstadoOFCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ComCtrls, ExtCtrls, ULFPanel, ToolWin, ULFToolBar,
  Mask, DBCtrls, ULFDBEdit, StdCtrls, ULFLabel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel, ULFEdit;

type
  TZFMVerEstadoOFCli = class(TFPEditSinNavegador)
     TVArbol: TTreeView;
     PnlCliente: TLFPanel;
     TButtVerArbol: TToolButton;
     TSep: TToolButton;
     EFCliente: TLFEditFind2000;
     LCliente: TLFLabel;
     ETituloCliente: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFClienteChange(Sender: TObject);
     procedure TButtVerArbolClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RegeneraArbol;
  end;

var
  ZFMVerEstadoOFCli : TZFMVerEstadoOFCli;

implementation

uses UDMMain, ZUDMVerEstadoOFCli, UDameDato;

{$R *.dfm}

procedure TZFMVerEstadoOFCli.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMVerEstadoOFCli, ZDMVerEstadoOFCli);
end;

procedure TZFMVerEstadoOFCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMVerEstadoOFCli);
end;

procedure TZFMVerEstadoOFCli.EFClienteChange(Sender: TObject);
begin
  ETituloCliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
end;

procedure TZFMVerEstadoOFCli.TButtVerArbolClick(Sender: TObject);
begin
  RegeneraArbol;
end;

procedure TZFMVerEstadoOFCli.RegeneraArbol;
var
  NodoPed, NodoOF, NodoFase : TTreeNode;
  NumPedido, NumOF, NumFase : string;
begin
  TVArbol.Items.Clear;

  if EFCliente.Text <> '' then
  begin
     NumPedido := '';
     NumOF := '';
     NumFase := '';
     NodoPed := nil;
     NodoOF := nil;
     NodoFase := nil;
     with ZDMVerEstadoOFCli do
     begin
        AbreDatos(StrToIntDef(EFCliente.Text, 0));
        xVerPedidos.First;
        while not xVerPedidos.EOF do
        begin
           if (NumPedido <> xVerPedidosNUM_PEDIDO.AsString) then
           begin
              NodoPed := TVArbol.Items.Add(nil, Format(_('S/Ref: %s'), [xVerPedidosREF_PEDIDO.AsString]));
              NumPedido := xVerPedidosNUM_PEDIDO.AsString;
           end;

           if (NumOF <> xVerPedidosNUM_OF.AsString) then
           begin
              NodoOF := TVArbol.Items.AddChild(NodoPed, Format(_('Núm. OF: %s'), [xVerPedidosNUM_OF.AsString]));
              NumOF := xVerPedidosNUM_OF.AsString;
           end;

           if (NumFase <> xVerPedidosNUM_OF.AsString + xVerPedidosLINEA_FASE.AsString) then
           begin
              NodoFase := TVArbol.Items.AddChild(NodoOF, _('Fase') + ' ' + xVerPedidosTIPOFASE.AsString + ': ' + xVerPedidosFASE.AsString);
              NumFase := xVerPedidosNUM_OF.AsString + xVerPedidosLINEA_FASE.AsString;
           end;

           if (xVerPedidosESTADO.AsInteger = 0) then
              TVArbol.Items.AddChild(NodoFase, _('Tarea') + ' ' + xVerPedidosTIPOTAREA.AsString + ': ' + xVerPedidosTAREA.AsString + ' (' + _('PENDIENTE') + ')')
           else
              TVArbol.Items.AddChild(NodoFase, _('Tarea') + ' ' + xVerPedidosTIPOTAREA.AsString + ': ' + xVerPedidosTAREA.AsString + ' (' + xVerPedidosFECHA.AsString + ')');

           xVerPedidos.Next;
        end;

        TVArbol.FullExpand;
     end;
  end;
end;

end.
