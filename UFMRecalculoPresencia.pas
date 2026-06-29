unit UFMRecalculoPresencia;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, Mask,
  rxToolEdit, ULFDateEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, ULFLabel;

type
  TFMRecalculoPresencia = class(TFPEditSinNavegador)
     LEmpleado: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     EFEmpleado: TLFEditFind2000;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     EEmpleado: TLFEdit;
     BProcesar: TButton;
     LAdvertencia: TLabel;
     procedure EFEmpleadoChange(Sender: TObject);
     procedure BProcesarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMRecalculoPresencia : TFMRecalculoPresencia;

implementation

uses
  UDMMain, DateUtils, UUtiles, HYFIBQuery, UEntorno, UFParada, UDameDato;

{$R *.dfm}

procedure TFMRecalculoPresencia.FormCreate(Sender: TObject);
var
  Desde, Hasta : TDateTime;
begin
  inherited;
  DameDesdeHastaPeriodo(Format('%.2d', [MonthOf(Today)]), Desde, Hasta);
  DEDesdeFecha.Date := Desde;
  DEHastaFecha.Date := Hasta;
  EFEmpleado.Text := '0';
  EFEmpleadoChange(Sender);
end;

procedure TFMRecalculoPresencia.EFEmpleadoChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFEmpleado.Text, 0) = 0) then
     EEmpleado.Text := _('Todos los empleados')
  else
     EEmpleado.Text := DameTituloEmpleado(StrToIntDef(EFEmpleado.Text, 0));
end;

procedure TFMRecalculoPresencia.BProcesarClick(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  inherited;
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE RECALCULA_PRO_IMP_PRESENCIA(:ENTRADA, :ID_EMPLEADO, :FECHA_INICIO, :FECHA_FIN)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_EMPLEADO'].AsInteger := DameIDEmpleado(StrToIntDef(EFEmpleado.Text, 0));
        Params.ByName['FECHA_INICIO'].AsDateTime := RecodeTime(DEDesdeFecha.Date, 0, 0, 0, 0);
        Params.ByName['FECHA_FIN'].AsDateTime := RecodeTime(DEHastaFecha.Date, 23, 59, 59, 99);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
