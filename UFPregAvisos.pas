unit UFPregAvisos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, DBCtrls, ULFDBEdit, Mask,
  rxToolEdit, ExtCtrls, Grids, DBGrids, UFIBDBEditfind, ULFFIBDBEditFind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFLabel,
  ULFEditFind2000, ULFEdit, DateUtils, ULFDateEdit, ULFPanel, rxPlacemnt,
  ULFFormStorage, TFlatCheckBoxUnit, ULFCheckBox, UFPEditListadoSimple;

type
  TFPregAvisos = class(TFPEditListadoSimple)
     LFechaDesdeAviso: TLFLabel;
     LFechaHastaAviso: TLFLabel;
     LRecibidoUsuarioDesde: TLFLabel;
     LRecibidoUsuarioHasta: TLFLabel;
     DEFechaDesdeAviso: TLFDateEdit;
     DEFechaHastaAviso: TLFDateEdit;
     GBAvisosFecha: TGroupBox;
     GBAvisosUsuarios: TGroupBox;
     GBAvisosActivo: TGroupBox;
     CBAvisosActivos: TLFCheckBox;
     EFEnviadosAvisosUsuarioDesde: TLFEditFind2000;
     EFEnviadosAvisosUsuarioHasta: TLFEditFind2000;
     LEnviadoUsuarioDesde: TLFLabel;
     LEnviadoUsuarioHasta: TLFLabel;
     EFRecibidosAvisosUsuarioDesde: TLFEditFind2000;
     EFRecibidosAvisosUsuarioHasta: TLFEditFind2000;
     LRecibidos: TLFLabel;
     LEnviados: TLFLabel;
     ERecibidosAvisosUsuarioDesde: TLFEdit;
     ERecibidosAvisosUsuarioHasta: TLFEdit;
     EEnviadosAvisosUsuarioDesde: TLFEdit;
     EEnviadosAvisosUsuarioHasta: TLFEdit;
     TButtConfRapida: TToolButton;
     AConfRapida: TAction;
     procedure EFRecibidosAvisosUsuarioDesdeChange(Sender: TObject);
     procedure EFRecibidosAvisosUsuarioHastaChange(Sender: TObject);
     procedure EFEnviadosAvisosUsuarioDesdeChange(Sender: TObject);
     procedure EFEnviadosAvisosUsuarioHastaChange(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     procedure InicializaAvisos;
  public
     { Public declarations }
  end;

var
  FPregAvisos : TFPregAvisos;

implementation

uses UDMUsuariosMensajes, UDMMain, UFMListConfig, UDameDato;

{$R *.dfm}

procedure TFPregAvisos.EFRecibidosAvisosUsuarioDesdeChange(Sender: TObject);
begin
  inherited;
  ERecibidosAvisosUsuarioDesde.Text := DameTituloUsuario(StrToInt(EFRecibidosAvisosUsuarioDesde.Text));
end;

procedure TFPregAvisos.EFRecibidosAvisosUsuarioHastaChange(Sender: TObject);
begin
  inherited;
  ERecibidosAvisosUsuarioHasta.Text := DameTituloUsuario(StrToInt(EFRecibidosAvisosUsuarioHasta.Text));
end;

procedure TFPregAvisos.EFEnviadosAvisosUsuarioDesdeChange(Sender: TObject);
begin
  inherited;
  EEnviadosAvisosUsuarioDesde.Text := DameTituloUsuario(StrToInt(EFEnviadosAvisosUsuarioDesde.Text));
end;

procedure TFPregAvisos.EFEnviadosAvisosUsuarioHastaChange(Sender: TObject);
begin
  inherited;
  EEnviadosAvisosUsuarioHasta.Text := DameTituloUsuario(StrToInt(EFEnviadosAvisosUsuarioHasta.Text));
end;

procedure TFPregAvisos.APrevExecute(Sender: TObject);
begin
  inherited;
  DMUsuariosMensajes.MostrarListado(DEFechaDesdeAviso.Date,
     DEFechaHastaAviso.Date,
     StrToInt(EFRecibidosAvisosUsuarioDesde.Text),
     StrToInt(EFRecibidosAvisosUsuarioHasta.Text),
     StrToInt(EFEnviadosAvisosUsuarioDesde.Text),
     StrToInt(EFEnviadosAvisosUsuarioHasta.Text),
     CBAvisosActivos.Checked, 0);
end;

procedure TFPregAvisos.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMUsuariosMensajes.MostrarListado(DEFechaDesdeAviso.Date,
     DEFechaHastaAviso.Date,
     StrToInt(EFRecibidosAvisosUsuarioDesde.Text),
     StrToInt(EFRecibidosAvisosUsuarioHasta.Text),
     StrToInt(EFEnviadosAvisosUsuarioDesde.Text),
     StrToInt(EFEnviadosAvisosUsuarioHasta.Text),
     CBAvisosActivos.Checked, 1);
end;

procedure TFPregAvisos.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(2007, Formato, Cabecera, Copias,
     Pijama, '', DMUsuariosMensajes.frListado);
end;

procedure TFPregAvisos.InicializaAvisos;
var
  min, max : integer;
begin
  DEFechaDesdeAviso.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  DEFechaHastaAviso.Date := EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));

  DMusuariosMensajes.DameMinMaxUsuario(min, max);
  EFRecibidosAvisosUsuarioDesde.Text := IntToStr(min);
  EFEnviadosAvisosUsuarioDesde.Text := IntToStr(min);
  EFRecibidosAvisosUsuarioHasta.Text := IntToStr(max);
  EFEnviadosAvisosUsuarioHasta.Text := IntToStr(max);
end;

procedure TFPregAvisos.ARecargarExecute(Sender: TObject);
begin
  inherited;
  InicializaAvisos;
end;

procedure TFPregAvisos.FormShow(Sender: TObject);
begin
  inherited;
  ARecargar.Execute;
end;

end.
