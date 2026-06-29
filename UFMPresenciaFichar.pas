unit UFMPresenciaFichar;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, StdCtrls, ULFEdit,
  ULFLabel, Grids, DBGrids, NsDBGrid;

type
  TFMPresenciaFichar = class(TFPEditSinNavegador)
     LCodigoTarjeta: TLFLabel;
     ECodigoTarjeta: TLFEdit;
     BEntrada: TButton;
     BSalida: TButton;
     LIncidencia: TLFLabel;
     LEmpleado: TLFLabel;
     EEmpleado: TLFEdit;
     EENombreEmpleado: TLFEdit;
     EFIncidencia: TLFEditFind2000;
     EIncidencia: TLFEdit;
     PNLRegistro: TLFPanel;
     DBGPresencia: TNsDBGrid;
     DBGMarcajes: TNsDBGrid;
     BMarcaje: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ECodigoTarjetaChange(Sender: TObject);
     procedure EEmpleadoChange(Sender: TObject);
     procedure EFIncidenciaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure BMarcajeClick(Sender: TObject);
     procedure PNLRegistroResize(Sender: TObject);
     procedure DBGPresenciaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGMarcajesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     IdEmpleado, Empleado: integer;
  public
     { Public declarations }
  end;

var
  FMPresenciaFichar : TFMPresenciaFichar;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, UDMPresenciaFichar, UFMain,
  UDMPresencia, DateUtils, UParam;

{$R *.dfm}

procedure TFMPresenciaFichar.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPresenciaFichar, DMPresenciaFichar);
end;

procedure TFMPresenciaFichar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPresenciaFichar);
end;

procedure TFMPresenciaFichar.FormShow(Sender: TObject);
begin
  inherited;
  if LeeParametro('PRECNTL001') = 'S' then
  begin
     BEntrada.Visible := False;
     BSalida.Visible := False;
     BMarcaje.Visible := True;

     BMarcaje.Left := BEntrada.Left;
  end
  else
  begin
     BEntrada.Visible := True;
     BSalida.Visible := True;
     BMarcaje.Visible := False;

     BMarcaje.Left := BEntrada.Left;
  end;

  PNLRegistroResize(Sender);
  EFIncidencia.Text := IntToStr(DameIdIncidenciaDefecto);
  ECodigoTarjeta.Text := LeeDatoIni('FMPresenciaFichar', 'CodigoTarjeta', '');
end;

procedure TFMPresenciaFichar.ECodigoTarjetaChange(Sender: TObject);
begin
  inherited;
  Empleado := DameEmpleadoTarjeta(Trim(ECodigoTarjeta.Text));
  if (Empleado <> 0) then
     EEmpleado.Text := IntToStr(Empleado)
  else
     EEmpleado.Text := '';

  DMPresenciaFichar.RefrescarHistorico(Empleado);
end;

procedure TFMPresenciaFichar.EEmpleadoChange(Sender: TObject);
begin
  inherited;
  IdEmpleado := DameIDEmpleado(StrToIntDef(EEmpleado.Text, 0));
  EENombreEmpleado.Text := DameTituloEmpleado(StrToIntDef(EEmpleado.Text, 0));
end;

procedure TFMPresenciaFichar.EFIncidenciaChange(Sender: TObject);
begin
  inherited;
  EIncidencia.Text := DameTituloIncidencia(StrToIntDef(EFIncidencia.Text, 0));
end;

procedure TFMPresenciaFichar.BMarcajeClick(Sender: TObject);
var
  TipoMarcaje : string;
  ErrorCode : integer;
begin
  inherited;
  EscribeDatoIni('FMPresenciaFichar', 'CodigoTarjeta', Trim(ECodigoTarjeta.Text));

  if TButton(Sender).Tag = 1 then
     TipoMarcaje := 'ENT'
  else
  if TButton(Sender).Tag = 2 then
     TipoMarcaje := 'SAL'
  else
     TipoMarcaje := 'PRE';

  ErrorCode := DMPresenciaFichar.InsertaMarcaje(Trim(ECodigoTarjeta.Text), TipoMarcaje, StrToIntDef(EFIncidencia.Text, 0));

  if (ErrorCode <> 0) then
  begin
     case ErrorCode of
        1: ShowMessage(_('Codigo de tarjeta inexistente'));
        5: ShowMessage(_('Tipo de marcaje erroneo'));
        6: ShowMessage(_('Error en marcaje'));
        else
           ShowMessage(_('Error desconocido en marcaje') + #13#10 + _('Codigo') + ' ' + IntToStr(ErrorCode));
     end;
  end;

  DMPresenciaFichar.RefrescarHistorico(Empleado);
end;

procedure TFMPresenciaFichar.PNLRegistroResize(Sender: TObject);
begin
  inherited;
  DBGPresencia.Width := PNLRegistro.Width div 2;
end;

procedure TFMPresenciaFichar.DBGPresenciaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'FECHA') then
        begin
           if (DataSource.DataSet.FieldByName(Column.FieldName).AsDateTime >= Today) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPresenciaFichar.DBGMarcajesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'FECHA_MARCAJE') then
        begin
           if (DataSource.DataSet.FieldByName(Column.FieldName).AsDateTime >= Today) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
