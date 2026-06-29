unit UFMParametrizacionLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, StdCtrls, ULFLabel,
  ULFEdit;

type
  TFMParametrizacionLotes = class(TFPEditSinNavegador)
     ECantidadLotes: TLFEdit;
     EUnidadesPorLote: TLFEdit;
     EUnidades: TLFEdit;
     LCantidadLotes: TLFLabel;
     LUnidadesPorLote: TLFLabel;
     LUnidades: TLFLabel;
     LClasificacion: TLFLabel;
     EFClasificacion: TLFEditFind2000;
     ButtAceptar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure VerificcionSoloNumeros(Sender: TObject; var Key: char);
     procedure EFClasificacionBusqueda(Sender: TObject);
     procedure ButtAceptarClick(Sender: TObject);
     procedure ECantidadLotesChange(Sender: TObject);
     procedure EUnidadesChange(Sender: TObject);
  private
     { Private declarations }
     procedure CalculaUnidadesLote;
  public
     { Public declarations }
  end;

var
  FMParametrizacionLotes : TFMParametrizacionLotes;

implementation

uses
  UDMMain, {UDMRecepcionPedidos,} UEntorno, UDMConfigTraspasoLotes, HYFIBQuery, UUtiles;

{$R *.dfm}

procedure TFMParametrizacionLotes.FormCreate(Sender: TObject);
begin
  inherited;
  ECantidadLotes.Text := '0';
  EUnidades.Text := '0';
  EUnidadesPorLote.Text := FloatToStr(DMMain.DamePedidoMinimoArticuloProveedor(DMConfigTraspasoLotes.QMConfigLotesID_A.AsInteger, DMConfigTraspasoLotes.QMConfigLotesPROVEEDOR.AsInteger));
end;

procedure TFMParametrizacionLotes.CalculaUnidadesLote;
begin
  if (StrToIntDef(ECantidadLotes.Text, 0) > 0) then
     if (StrToIntDef(EUnidades.Text, 0) mod StrToInt(ECantidadLotes.Text) = 0) then
        EUnidadesPorLote.Text := FloatToStr(StrToInt(EUnidades.Text) / StrToInt(ECantidadLotes.Text))
     else
        EUnidadesPorLote.Text := '0';
end;

procedure TFMParametrizacionLotes.VerificcionSoloNumeros(Sender: TObject; var Key: char);
begin
  inherited;
  if not (key in ['0'..'9', #8, '-', {ThousandSeparator,} DecimalSeparator]) then
     Key := #0;
end;

procedure TFMParametrizacionLotes.EFClasificacionBusqueda(Sender: TObject);
begin
  inherited;
  EFClasificacion.CondicionBusqueda := ' ID_A = ' + IntToStr(DMConfigTraspasoLotes.IdA);
end;

procedure TFMParametrizacionLotes.ButtAceptarClick(Sender: TObject);
var
  CantidadLotes : integer;
  CrearLotes : boolean;
begin
  inherited;
  CantidadLotes := StrToInt(ECantidadLotes.Text);
  CrearLotes := True;

  // Mostramos advertencia si la cantidad de etiquetas-lote superan el limite determinano por JVV
  if ((DMMain.EstadoKri(493) = 1) and (CantidadLotes >= 80)) then
     CrearLotes := ConfirmaMensaje(Format(_('Esta a punto de generar %d lotes, Desea continuar?'), [CantidadLotes]));

  if CrearLotes then
     DMConfigTraspasoLotes.CreaLotesSegunParametro(EFClasificacion.Text, CantidadLotes, StrToFloatDef(EUnidadesPorLote.Text, 0));

  Close;
end;

procedure TFMParametrizacionLotes.ECantidadLotesChange(Sender: TObject);
begin
  inherited;
  if ((EUnidades.Text <> '') and (ECantidadLotes.Text <> '')) then
     CalculaUnidadesLote;
end;

procedure TFMParametrizacionLotes.EUnidadesChange(Sender: TObject);
begin
  inherited;
  if ((EUnidades.Text <> '') and (ECantidadLotes.Text <> '')) then
     CalculaUnidadesLote;
end;

end.
