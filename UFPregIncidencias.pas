unit UFPregIncidencias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, rxToolEdit, StdCtrls, Mask, DBCtrls,
  ULFDBEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ExtCtrls, ULFComboBox, ULFLabel, ULFEdit, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  UFPEditListadoSimple;

type
  TFPregIncidencias = class(TFPEditListadoSimple)
     EFMaestroD: TLFEditFind2000;
     EFMaestroH: TLFEditFind2000;
     DBETitMaestroD: TLFDbedit;
     DBETitMaestroH: TLFDbedit;
     LBLFechas: TLFLabel;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     LBLMaestroD: TLFLabel;
     LBLMaestroH: TLFLabel;
     TBConfig: TToolButton;
     LTipoAMostrar: TLFLabel;
     CBTipo: TLFComboBox;
     CBDesglosado: TLFCheckBox;
     EFAgenteD: TLFEditFind2000;
     EFAgenteH: TLFEditFind2000;
     ETituloAgenteD: TLFEdit;
     ETituloAgenteH: TLFEdit;
     LAgenteD: TLFLabel;
     LAgenteH: TLFLabel;
     LDireccionH: TLFLabel;
     LDireccionD: TLFLabel;
     EDireccionD: TLFEdit;
     EDireccionH: TLFEdit;
     CBTipoIncidencia: TLFComboBox;
     LTipoIncidencia: TLFLabel;
     LUsuarioD: TLFLabel;
     LUsuarioH: TLFLabel;
     EFUsuarioD: TLFEditFind2000;
     EFUsuarioH: TLFEditFind2000;
     EUsuarioD: TLFEdit;
     EUsuarioH: TLFEdit;
     DBETipoIncidencia: TLFDbedit;
     LFinalizada: TLFLabel;
     CBFinalizada: TLFComboBox;
     procedure ARecargarExecute(Sender: TObject);
     procedure EFMaestroDChange(Sender: TObject);
     procedure EFMaestroHChange(Sender: TObject);
     procedure CBTipoChange(Sender: TObject);
     procedure CBDesglosadoClick(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure CBTipoIncidenciaChange(Sender: TObject);
     procedure EFUsuarioDChange(Sender: TObject);
     procedure EFUsuarioHChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     Maestro: integer;
     procedure Muestra(Maestro: integer; TipoTer: smallint);
     procedure ColocaMaestro(TipoTer: smallint);
  end;

var
  FPregIncidencias : TFPregIncidencias;

implementation

uses UDMLstIncidencias, UFormGest, UEntorno, UDMMain, UParam, UUtiles, UDameDato;

{$R *.dfm}

procedure TFPregIncidencias.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstIncidencias, DMLstIncidencias);

  if (LeeParametro('MODREST016') = 'S') then
     CBTipo.Items.Add(_('Potenciales'));

  ImprimirPrevisualizar := MyImprimirPrevisualizar;
  Grupo := 515;
  Listado := DMLstIncidencias.frIncidencias;
  ListadoFR3 := DMLstIncidencias.frxIncidencias;
end;

procedure TFPregIncidencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstIncidencias);
end;

procedure TFPregIncidencias.Muestra(Maestro: integer; TipoTer: smallint);
begin
  Self.Maestro := Maestro;
  CBTipo.ItemIndex := TipoTer;
  CBDesglosadoClick(Self);
  CBTipoChange(Self);
  CBTipoIncidencia.Items.Clear;
  DMLstIncidencias.RellenaTipoIncidencia(CBTipoIncidencia.Items);
  ShowModal;
end;

procedure TFPregIncidencias.ColocaMaestro(TipoTer: smallint);
begin
  with EFMaestroD do
  begin
     case TipoTer of
        0:
        begin
           Tabla_a_Buscar := 'VER_CLIENTES_EF';
           CampoNum := 'CLIENTE';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        1:
        begin
           Tabla_a_Buscar := 'VER_PROVEEDORES_CUENTAS';
           CampoNum := 'PROVEEDOR';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        2:
        begin
           Tabla_a_Buscar := 'VER_ACREEDORES_CUENTAS';
           CampoNum := 'ACREEDOR';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end;
        3:
        begin
           Tabla_a_Buscar := 'VER_AGENTES_CUENTAS';
           CampoNum := 'AGENTE';
           Filtros := [obEmpresa, obEjercicio, obCanal];
        end
        else
        begin
           Tabla_a_Buscar := 'VER_CLIENTES_POTENCIALES';
           CampoNum := 'CLIENTE';
           Filtros := [obEmpresa];
        end;
     end;
     CampoStr := 'TITULO';
     OrdenadoPor.Text := CampoNum;
  end;

  EFMaestroH.Tabla_a_Buscar := EFMaestroD.Tabla_a_Buscar;
  EFMaestroH.CampoNum := EFMaestroD.CampoNum;
  EFMaestroH.CampoStr := EFMaestroD.CampoStr;
  EFMaestroH.OrdenadoPor.Text := EFMaestroH.CampoNum;
  EFMaestroH.Filtros := EFMaestroD.Filtros;
end;

procedure TFPregIncidencias.ARecargarExecute(Sender: TObject);
var
  Max, Min : integer;
  dMax, dMin : TDateTime;
begin
  DMLstIncidencias.Rangos(Max, Min);
  EFMaestroD.Text := IntToStr(Min);
  EFMaestroH.Text := IntToStr(Max);

  DameMinMax('AGE', Min, Max);
  EFAgenteD.Text := '0' {IntToStr(Min)};
  EFAgenteH.Text := IntToStr(Max);

  DMLstIncidencias.RangosUsuario(Max, Min);
  EFUsuarioD.Text := IntToStr(Min);
  EFUsuarioH.Text := IntToStr(Max);

  EDireccionD.Text := '0';
  EDireccionH.Text := '9999';

  DameMinMax('EJE', dMin, dMax);
  DTPFechaD.Date := dMin;
  DTPFechaH.Date := REntorno.FechaTrabSH;

  CBTipoIncidencia.ItemIndex := 0;
  CBFinalizada.ItemIndex := 0;
end;

procedure TFPregIncidencias.EFMaestroDChange(Sender: TObject);
begin
  DMLstIncidencias.OnChangeMaestroD(StrToIntDef(EFMaestroD.Text, 0));
end;

procedure TFPregIncidencias.EFMaestroHChange(Sender: TObject);
begin
  DMLstIncidencias.OnChangeMaestroH(StrToIntDef(EFMaestroH.Text, 0));
end;

procedure TFPregIncidencias.CBTipoChange(Sender: TObject);
begin
  with CBTipo do
  begin
     if Text > '' then
     begin
        EFMaestroD.Text := '';
        EFMaestroH.Text := '';
        DMLstIncidencias.CambiaTipo(ItemIndex);
        ColocaMaestro(ItemIndex);
        DMLstIncidencias.CambiaMaestro(ItemIndex);
        AReCargarExecute(Self);
        LBLMaestroD.Caption := Format(_('Desde %s'), [Text]);
        LBLMaestroH.Caption := Format(_('Hasta %s'), [Text]);
     end;
  end;
end;

procedure TFPregIncidencias.CBDesglosadoClick(Sender: TObject);
begin
  DMLstIncidencias.Desglosado := CBDesglosado.Checked;
end;

procedure TFPregIncidencias.EFAgenteDChange(Sender: TObject);
begin
  inherited;
  ETituloAgenteD.Text := DameTituloAgente(StrToIntDef(EFAgenteD.Text, 0));
end;

procedure TFPregIncidencias.EFAgenteHChange(Sender: TObject);
begin
  inherited;
  ETituloAgenteH.Text := DameTituloAgente(StrToIntDef(EFAgenteH.Text, 32760));
end;

procedure TFPregIncidencias.CBTipoIncidenciaChange(Sender: TObject);
begin
  inherited;
  DMLstIncidencias.PosicionaTipoIncidencia(CBTipoIncidencia.Text);
end;

procedure TFPregIncidencias.EFUsuarioDChange(Sender: TObject);
begin
  inherited;
  EUsuarioD.Text := DameTituloUsuario(StrToIntDef(EFUsuarioD.Text, 0));
end;

procedure TFPregIncidencias.EFUsuarioHChange(Sender: TObject);
begin
  inherited;
  EUsuarioH.Text := DameTituloUsuario(StrToIntDef(EFUsuarioH.Text, 9999));
end;

procedure TFPregIncidencias.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstIncidencias.MuestraFiltrado(StrToIntDef(EFMaestroD.Text, 0), StrToIntDef(EFMaestroH.Text, 0),
     DTPFechaD.Date, DTPFechaH.Date, Modo, StrToIntDef(EFAgenteD.Text, 0), StrToIntDef(EFAgenteH.Text, 999999), StrToIntDef(EDireccionD.Text, 0), StrToIntDef(EDireccionH.Text, 32760), StrToIntDef(EFUsuarioD.Text, 0), StrToIntDef(EFUsuarioH.Text, 9999), CBTipoIncidencia.Text, CBFinalizada.ItemIndex);
end;

end.
