unit UFMRectificacionAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  StdCtrls, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UHYDBGrid, ULFComboBox, ULFLabel,
  UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UEditPanel, UNavigator, UFPEditSinNavegador;

type
  TFMRectificacionAsientos = class(TFPEditSinNavegador)
     TBAceptar: TToolButton;
     LFPCentral: TLFPanel;
     DBGAsientos: THYTDBGrid;
     TBSeparador1: TToolButton;
     TBRefresca: TToolButton;
     CBCanal: TLFComboBox;
     LBInformacion: TLFLabel;
     PNLSeleccionCanal: TLFPanel;
     LCanal: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBAceptarClick(Sender: TObject);
     procedure TBRefrescaClick(Sender: TObject);
     procedure CBCanalChange(Sender: TObject);
     procedure DBGAsientosDblClick(Sender: TObject);
     procedure DBGAsientosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGAsientosCellClick(Column: TColumn);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMRectificacionAsientos : TFMRectificacionAsientos;

implementation

uses UDMMain, UDMRectificacionAsientos, UEntorno, UFMain, UUtiles, URellenaLista;

{$R *.dfm}

procedure TFMRectificacionAsientos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRectificacionAsientos, DMRectificacionAsientos);

  // Rellenamos el combo de canales
  RellenaCanales(CBCanal.Items);
  CBCanal.ItemIndex := REntorno.Canal;
end;

procedure TFMRectificacionAsientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRectificacionAsientos);
end;

procedure TFMRectificacionAsientos.TBAceptarClick(Sender: TObject);
begin
  if (DMRectificacionAsientos.HayDatos and
     ConfirmaMensaje(_('Se va a proceder a rectificar los asientos contables con apuntes negativos. ' + #13#10 +
     '¿Desea continuar?'))) then
  begin
     DMRectificacionAsientos.rectificaAsientosNegativos(integer(CBCanal.Items.Objects[CBCanal.ItemIndex]));
     DMRectificacionAsientos.RefrescarTabla(integer(CBCanal.Items.Objects[CBCanal.ItemIndex]));
  end;
end;

procedure TFMRectificacionAsientos.TBRefrescaClick(Sender: TObject);
begin
  DMRectificacionAsientos.RefrescarTabla(integer(CBCanal.Items.Objects[CBCanal.ItemIndex]));
end;

procedure TFMRectificacionAsientos.CBCanalChange(Sender: TObject);
begin
  DMRectificacionAsientos.RefrescarTabla(integer(CBCanal.Items.Objects[CBCanal.ItemIndex]));
end;

procedure TFMRectificacionAsientos.DBGAsientosDblClick(Sender: TObject);
begin
  if DMRectificacionAsientos.HayDatos then
     if (UpperCase(ColActual.FieldName) = 'ASIENTO') then
        FMain.MuestraMovConta(' RIC= ' + DMRectificacionAsientos.xRectificacion_TablaRIC.AsString +
           ' and ejercicio=' + IntToStr(REntorno.Ejercicio),
           DMRectificacionAsientos.xRectificacion_TablaCANAL_R.AsString);
end;

procedure TFMRectificacionAsientos.DBGAsientosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMRectificacionAsientos.HayDatos then
     if (UpperCase(Column.FieldName) = 'ASIENTO') then
        CeldaEnlace(DBGAsientos, Rect);
end;

procedure TFMRectificacionAsientos.DBGAsientosCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

end.
