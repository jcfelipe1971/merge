unit UOpeFMLstEtiquetasEmpleados;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ComCtrls, ActnList, ULFActionList,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  ULFDBEdit, ULFEditFind2000, UFPEditListadoSfg, ULFLabel, rxToolEdit,
  ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TOpeFMLstEtiquetasEmpleados = class(TFPEditListadoSfg)
     TabSheet1: TTabSheet;
     EFEmpleadoDesde: TLFEditFind2000;
     EFEmpleadoHasta: TLFEditFind2000;
     EEmpleadoDesde: TLFEdit;
     EEmpleadoHasta: TLFEdit;
     AConfigLst: TAction;
     LFEmpleadoDesde: TLFLabel;
     LEmpleadoHasta: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure EFEmpleadoDesdeChange(Sender: TObject);
     procedure EFEmpleadoHastaChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  OpeFMLstEtiquetasEmpleados : TOpeFMLstEtiquetasEmpleados;

implementation

uses UDMMain, UFormGest, UOpeDMLstEtiquetasEmpleados, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TOpeFMLstEtiquetasEmpleados.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMLstEtiquetasEmpleados, OpeDMLstEtiquetasEmpleados);

  Grupo := 8045;
  Listado := OpeDMLstEtiquetasEmpleados.frListado;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := nil;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargar.Execute;
end;

procedure TOpeFMLstEtiquetasEmpleados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMLstEtiquetasEmpleados);
end;

procedure TOpeFMLstEtiquetasEmpleados.EFEmpleadoDesdeChange(Sender: TObject);
begin
  inherited;
  EEmpleadoDesde.Text := DameTituloEmpleado(StrToIntDef(EFEmpleadoDesde.Text, 0));
end;

procedure TOpeFMLstEtiquetasEmpleados.EFEmpleadoHastaChange(Sender: TObject);
begin
  inherited;
  EEmpleadoHasta.Text := DameTituloEmpleado(StrToIntDef(EFEmpleadoHasta.Text, 0));
end;

procedure TOpeFMLstEtiquetasEmpleados.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
begin
  inherited;
  DameMinMax('EMP', Min, Max);

  EFEmpleadoDesde.Text := IntToStr(Min);
  EFEmpleadoHasta.Text := IntToStr(Max);
end;

procedure TOpeFMLstEtiquetasEmpleados.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  OpeDMLstEtiquetasEmpleados.MostrarListado(Modo, StrToIntDef(EFEmpleadoDesde.Text, 0), StrToIntDef(EFEmpleadoHasta.Text, 0));
end;

end.
