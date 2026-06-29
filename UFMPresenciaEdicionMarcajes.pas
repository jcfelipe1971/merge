unit UFMPresenciaEdicionMarcajes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, ULFEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel,
  UDBDateTimePicker, rxToolEdit, RXDBCtrl, ULFDBDateEdit, Mask, DBCtrls,
  ULFDBEditFind2000, ULFDBEdit, UFPEditSimple, ULFDBMemo, UNavigator;

type
  TFMPresenciaEdicionMarcajes = class(TFPEditSimple)
     LIdEmpleado: TLFLabel;
     DBEFIdEmpleado: TLFDBEditFind2000;
     EEmpelado: TLFEdit;
     LFechaMarcaje: TLFLabel;
     DBDEFechaMarcaje: TLFDBDateEdit;
     DBDTPFechaMarcaje: TDBDateTimePicker;
     LTipoMarcaje: TLFLabel;
     DBEFTipoMarcaje: TLFDBEditFind2000;
     ETipoMarcaje: TLFEdit;
     LIncidencia: TLFLabel;
     DBEFIncidencia: TLFDBEditFind2000;
     EIncidencia: TLFEdit;
     LDispositivo: TLFLabel;
     DBEFDispositivo: TLFDBEditFind2000;
     EDispositivo: TLFEdit;
     LEstado: TLFLabel;
     DBEFEstado: TLFDBEditFind2000;
     EEstado: TLFEdit;
     LMotivo: TLFLabel;
     DBEMotivo: TLFDbedit;
     LValoresOriginales: TLFLabel;
     DBMValoresOriginales: TLFDBMemo;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure DBEFIdEmpleadoChange(Sender: TObject);
     procedure DBEFIncidenciaChange(Sender: TObject);
     procedure DBEFDispositivoChange(Sender: TObject);
     procedure DBEFEstadoChange(Sender: TObject);
     procedure DBEFTipoMarcajeChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(id: integer);
  end;

var
  FMPresenciaEdicionMarcajes : TFMPresenciaEdicionMarcajes;

implementation

{$R *.dfm}

uses
  UDameDato, UDMPresenciaEdicionMarcajes, UFormGest;

procedure TFMPresenciaEdicionMarcajes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPresenciaEdicionMarcajes, DMPresenciaEdicionMarcajes);

  // Aseguro que no se pueda tocar
  DBMValoresOriginales.Enabled := False;
  DBMValoresOriginales.ReadOnly := True;
end;

procedure TFMPresenciaEdicionMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPresenciaEdicionMarcajes);
end;

procedure TFMPresenciaEdicionMarcajes.Filtra(id: integer);
begin
  DMPresenciaEdicionMarcajes.Filtra(id);
end;

procedure TFMPresenciaEdicionMarcajes.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;

  if DMPresenciaEdicionMarcajes.QMDetalle.Active then
  begin
     if (DMPresenciaEdicionMarcajes.QMDetalleID_OPE_PRESENCIA_MARCAJE.AsInteger <> 0) then
     begin
        if (DMPresenciaEdicionMarcajes.QMDetalleESTADO.AsInteger <> 5) then
           DMPresenciaEdicionMarcajes.QMDetalle.Edit;
     end
     else
        DMPresenciaEdicionMarcajes.QMDetalle.Insert;

     if (DMPresenciaEdicionMarcajes.QMDetalleESTADO.AsInteger = 5) then
     begin
        for i := 0 to Self.ComponentCount - 1 do
        begin
           if (Self.Components[i] is TDBEdit) then
           begin
              with TDBEdit(Self.Components[i]) do
              begin
                 ReadOnly := True;
                 Enabled := False;
                 Color := clInfoBk;
              end;
           end
           else
           if (Self.Components[i] is TLFDBDateEdit) then
           begin
              with TLFDBDateEdit(Self.Components[i]) do
              begin
                 ReadOnly := True;
                 Enabled := False;
                 Color := clInfoBk;
              end;
           end
           else
           if (Self.Components[i] is TDBDateTimePicker) then
           begin
              with TDBDateTimePicker(Self.Components[i]) do
              begin
                 ReadOnly := True;
                 Enabled := False;
                 Color := clInfoBk;
              end;
           end;
        end;
     end;
  end;
end;

procedure TFMPresenciaEdicionMarcajes.DBEFIdEmpleadoChange(Sender: TObject);
begin
  inherited;
  EEmpelado.Text := DameTituloIdEmpleado(StrToIntDef(DBEFIdEmpleado.Text, 0));
end;

procedure TFMPresenciaEdicionMarcajes.DBEFIncidenciaChange(Sender: TObject);
begin
  inherited;
  EIncidencia.Text := DameTituloIncidencia(StrToIntDef(DBEFIncidencia.Text, 0));
end;

procedure TFMPresenciaEdicionMarcajes.DBEFDispositivoChange(Sender: TObject);
begin
  inherited;
  EDispositivo.Text := DameTituloDispositivo(StrToIntDef(DBEFDispositivo.Text, 0));
end;

procedure TFMPresenciaEdicionMarcajes.DBEFEstadoChange(Sender: TObject);
begin
  inherited;
  EEstado.Text := DameTituloEstado(StrToIntDef(DBEFEstado.Text, 0));
end;

procedure TFMPresenciaEdicionMarcajes.DBEFTipoMarcajeChange(Sender: TObject);
begin
  inherited;
  ETipoMarcaje.Text := DameTituloTipoPresencia(DBEFTipoMarcaje.Text);
end;

end.
