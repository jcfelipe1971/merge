unit UFPregProyectos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFDBEdit, ULFToolBar, ULFEditFind2000, rxToolEdit, ULFLabel,
  ULFPanel, ULFEdit, UFPEditListado, rxPlacemnt, ULFFormStorage,
  ULFPageControl, ULFDateEdit;

type
  TFPregProyectos = class(TFPEditListado)
     TButtConfRapida: TToolButton;
     PNLUnProyecto: TLFPanel;
     LProyecto: TLFLabel;
     EFProyecto: TLFEditFind2000;
     ETituloProyecto: TLFEdit;
     TSUnProyecto: TTabSheet;
     TSProyectos: TTabSheet;
     TSOfertas: TTabSheet;
     PNLProyectos: TLFPanel;
     LDesdeProyecto: TLFLabel;
     EFDesdeProyecto: TLFEditFind2000;
     EDesdeProyecto: TLFEdit;
     LHastaProyecto: TLFLabel;
     EFHastaProyecto: TLFEditFind2000;
     EHastaProyecto: TLFEdit;
     LDesdeUsuario: TLFLabel;
     EFDesdeUsuario: TLFEditFind2000;
     EDesdeUsuario: TLFEdit;
     LHastaUsuario: TLFLabel;
     EFHastaUsuario: TLFEditFind2000;
     EHastaUsuario: TLFEdit;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     Label1: TLFLabel;
     EFDesdeProyectoOferta: TLFEditFind2000;
     EDesdeProyectoOferta: TLFEdit;
     Label2: TLFLabel;
     EFHastaProyectoOferta: TLFEditFind2000;
     EHastaProyectoOferta: TLFEdit;
     Label3: TLFLabel;
     EFDesdeUsuarioOferta: TLFEditFind2000;
     EDesdeUsuarioOferta: TLFEdit;
     Label4: TLFLabel;
     EFHastaUsuarioOferta: TLFEditFind2000;
     EHastaUsuarioOferta: TLFEdit;
     DEDesdeFechaOferta: TLFDateEdit;
     DEHastaFechaOferta: TLFDateEdit;
     Label5: TLFLabel;
     Label6: TLFLabel;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EFHastaCliente: TLFEditFind2000;
     EFDesdeCliente: TLFEditFind2000;
     EDesdeCliente: TLFEdit;
     EHastaCliente: TLFEdit;
     PNLOfertas: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFProyectoChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure TSUnProyectoShow(Sender: TObject);
     procedure EFDesdeProyectoChange(Sender: TObject);
     procedure EFHastaProyectoChange(Sender: TObject);
     procedure EFDesdeUsuarioChange(Sender: TObject);
     procedure EFHastaUsuarioChange(Sender: TObject);
     procedure EFDesdeProyectoOfertaChange(Sender: TObject);
     procedure EFHastaProyectoOfertaChange(Sender: TObject);
     procedure EFDesdeUsuarioOfertaChange(Sender: TObject);
     procedure EFHastaUsuarioOfertaChange(Sender: TObject);
     procedure TSProyectosShow(Sender: TObject);
     procedure TSOfertasShow(Sender: TObject);
     procedure EFDesdeClienteChange(Sender: TObject);
     procedure EFHastaClienteChange(Sender: TObject);
  private
     { Private declarations }
     Proyecto: integer;
     procedure MostrarListado(Modo: byte);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure FiltrarProyecto(AProyecto: integer);
  end;

var
  FPregProyectos : TFPregProyectos;

implementation

{$R *.DFM}

uses UEntorno, UUtiles, UDMMain, UDMLstProyectos, DateUtils, UDameDato;

procedure TFPregProyectos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstProyectos, DMLstProyectos);
  ARecargar.Execute;

  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  PCMain.ActivePage := TSUnProyecto;
  Grupo := 5125;
  Listado := DMLstProyectos.frProyectos;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := DMLstProyectos.frxProyectos;
end;

procedure TFPregProyectos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLSTProyectos);
end;

procedure TFPregProyectos.EFProyectoChange(Sender: TObject);
begin
  ETituloProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyecto.Text, 0));
end;

procedure TFPregProyectos.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
  dMin, dMax : TDateTime;
begin
  if (Proyecto <> 0) then
  begin
     EFProyecto.Text := IntToStr(Proyecto);
     EFDesdeProyecto.Text := IntToStr(Proyecto);
     EFHastaProyecto.Text := IntToStr(Proyecto);
     EFDesdeProyectoOferta.Text := IntToStr(Proyecto);
     EFHastaProyectoOferta.Text := IntToStr(Proyecto);
  end
  else
  begin
     DameMinMax('PRY', Min, Max);
     EFProyecto.Text := '';
     EFDesdeProyecto.Text := IntToStr(Min);
     EFHastaProyecto.Text := IntToStr(Max);
     EFDesdeProyectoOferta.Text := IntToStr(Min);
     EFHastaProyectoOferta.Text := IntToStr(Max);
  end;

  DameMinMax('USU', Min, Max);
  EFDesdeUsuario.Text := IntToStr(Min);
  EFHastaUsuario.Text := IntToStr(Max);
  EFDesdeUsuarioOferta.Text := IntToStr(Min);
  EFHastaUsuarioOferta.Text := IntToStr(Max);

  DameMinMax('CLI', Min, Max);
  EFDesdeCliente.Text := IntToStr(Min);
  EFHastaCliente.Text := IntToStr(Max);

  DameMinMax('EJE', dMin, dMax);
  DEDesdeFecha.Date := dMin;
  DEHastaFecha.Date := dMax;
  DEDesdeFechaOferta.Date := dMin;
  DEHastaFechaOferta.Date := dMax;
end;

procedure TFPregProyectos.MostrarListado(Modo: byte);
var
  DesdeProyecto, HastaProyecto, DesdeUsuario, HastaUsuario, DesdeCliente, HastaCliente : integer;
  DesdeFecha, HastaFecha : TDateTime;
begin
  DesdeProyecto := 0;
  HastaProyecto := 32768;
  DesdeUsuario := 0;
  HastaUsuario := 32767;
  DesdeCliente := 0;
  HastaCliente := 99999;
  DesdeFecha := EncodeDate(1900, 1, 1);
  HastaFecha := EncodeDate(3000, 12, 31);
  if (PCMain.ActivePage = TSUnProyecto) then
  begin
     DesdeProyecto := StrToIntDef(EFProyecto.Text, 0);
     HastaProyecto := StrToIntDef(EFProyecto.Text, 0);
  end
  else
  if (PCMain.ActivePage = TSProyectos) then
  begin
     DesdeProyecto := StrToIntDef(EFDesdeProyecto.Text, 0);
     HastaProyecto := StrToIntDef(EFHastaProyecto.Text, 0);
     DesdeUsuario := StrToIntDef(EFDesdeUsuario.Text, 0);
     HastaUsuario := StrToIntDef(EFHastaUsuario.Text, 0);
     DesdeFecha := RecodeTime(DEDesdeFecha.Date, 0, 0, 0, 0);
     HastaFecha := RecodeTime(DEHastaFecha.Date, 23, 59, 59, 999);
  end
  else
  if (PCMain.ActivePage = TSOfertas) then
  begin
     DesdeProyecto := StrToIntDef(EFDesdeProyectoOferta.Text, 0);
     HastaProyecto := StrToIntDef(EFHastaProyectoOferta.Text, 0);
     DesdeUsuario := StrToIntDef(EFDesdeUsuarioOferta.Text, 0);
     HastaUsuario := StrToIntDef(EFHastaUsuarioOferta.Text, 0);
     DesdeCliente := StrToIntDef(EFDesdeCliente.Text, 0);
     HastaCliente := StrToIntDef(EFHastaCliente.Text, 0);
     DesdeFecha := RecodeTime(DEDesdeFechaOferta.Date, 0, 0, 0, 0);
     HastaFecha := RecodeTime(DEHastaFechaOferta.Date, 23, 59, 59, 999);
  end;

  DMLstProyectos.MostrarListado(EFProyecto.Text, Modo, Grupo, DesdeProyecto, HastaProyecto, DesdeUsuario, HastaUsuario, DesdeCliente, HastaCliente, DesdeFecha, HastaFecha);
end;

procedure TFPregProyectos.TSUnProyectoShow(Sender: TObject);
begin
  inherited;
  Grupo := 5125;
end;

procedure TFPregProyectos.TSProyectosShow(Sender: TObject);
begin
  inherited;
  Grupo := 2060;
end;

procedure TFPregProyectos.TSOfertasShow(Sender: TObject);
begin
  inherited;
  Grupo := 2061;
end;

procedure TFPregProyectos.FiltrarProyecto(AProyecto: integer);
begin
  if (AProyecto <> 0) then
  begin
     Proyecto := AProyecto;
     ARecargar.Execute;
  end;
end;

procedure TFPregProyectos.EFDesdeProyectoChange(Sender: TObject);
begin
  inherited;
  EDesdeProyecto.Text := DameTituloProyecto(StrToIntDef(EFDesdeProyecto.Text, 0));
end;

procedure TFPregProyectos.EFHastaProyectoChange(Sender: TObject);
begin
  inherited;
  EHastaProyecto.Text := DameTituloProyecto(StrToIntDef(EFHastaProyecto.Text, 0));
end;

procedure TFPregProyectos.EFDesdeUsuarioChange(Sender: TObject);
begin
  inherited;
  EDesdeUsuario.Text := DameTituloUsuario(StrToIntDef(EFDesdeUsuario.Text, 0));
end;

procedure TFPregProyectos.EFHastaUsuarioChange(Sender: TObject);
begin
  inherited;
  EHastaUsuario.Text := DameTituloUsuario(StrToIntDef(EFHastaUsuario.Text, 0));
end;

procedure TFPregProyectos.EFDesdeProyectoOfertaChange(Sender: TObject);
begin
  inherited;
  EDesdeProyectoOferta.Text := DameTituloProyecto(StrToIntDef(EFDesdeProyectoOferta.Text, 0));
end;

procedure TFPregProyectos.EFHastaProyectoOfertaChange(Sender: TObject);
begin
  inherited;
  EHastaProyectoOferta.Text := DameTituloProyecto(StrToIntDef(EFHastaProyectoOferta.Text, 0));
end;

procedure TFPregProyectos.EFDesdeUsuarioOfertaChange(Sender: TObject);
begin
  inherited;
  EDesdeUsuarioOferta.Text := DameTituloUsuario(StrToIntDef(EFDesdeUsuarioOferta.Text, 0));
end;

procedure TFPregProyectos.EFHastaUsuarioOfertaChange(Sender: TObject);
begin
  inherited;
  EHastaUsuarioOferta.Text := DameTituloUsuario(StrToIntDef(EFHastaUsuarioOferta.Text, 0));
end;

procedure TFPregProyectos.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  MostrarListado(Modo);
end;

procedure TFPregProyectos.EFDesdeClienteChange(Sender: TObject);
begin
  inherited;
  EDesdeCliente.Text := DameTituloCliente(StrToIntDef(EFDesdeCliente.Text, 0));
end;

procedure TFPregProyectos.EFHastaClienteChange(Sender: TObject);
begin
  inherited;
  EHastaCliente.Text := DameTituloCliente(StrToIntDef(EFHastaCliente.Text, 0));
end;

end.
