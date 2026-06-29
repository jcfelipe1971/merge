unit UOpeFMLstFormacion;

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
  TOpeFMLstFormacion = class(TFPEditListadoSfg)
     TabSheet1: TTabSheet;
     LFDBEmpleadosDesde: TLFEditFind2000;
     LFDBEmpleadosHasta: TLFEditFind2000;
     DescEmpleadoD: TLFDbedit;
     DescEmpleadoH: TLFDbedit;
     AConfigLst: TAction;
     LDesdeEmpleado: TLFLabel;
     LHastaEmpleado: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure LFDBEmpleadosDesdeChange(Sender: TObject);
     procedure LFDBEmpleadosHastaChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMLstFormacion : TOpeFMLstFormacion;

implementation

uses UDMMain, UFormGest, UEntorno, UOpeDMLstFormacion;

{$R *.dfm}

procedure TOpeFMLstFormacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMLstFormacion, OpeDMLstFormacion);

  Listado := OpeDMLstFormacion.frFormacion;
  Grupo := 8033;

  ARecargar.Execute;
end;

procedure TOpeFMLstFormacion.LFDBEmpleadosDesdeChange(Sender: TObject);
begin
  inherited;
  OpeDMLstFormacion.xEmpleadoD.Close;
  OpeDMLstFormacion.xEmpleadoD.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  OpeDMLstFormacion.xEmpleadoD.Params.ByName['Empleado'].AsInteger := StrToInt(LFDBEmpleadosDesde.Text);
  OpeDMLstFormacion.xEmpleadoD.Open;
end;

procedure TOpeFMLstFormacion.LFDBEmpleadosHastaChange(Sender: TObject);
begin
  inherited;
  OpeDMLstFormacion.xEmpleadoH.Close;
  OpeDMLstFormacion.xEmpleadoH.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  OpeDMLstFormacion.xEmpleadoH.Params.ByName['Empleado'].AsInteger := StrToInt(LFDBEmpleadosHasta.Text);
  OpeDMLstFormacion.xEmpleadoH.Open;
end;

procedure TOpeFMLstFormacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMLstFormacion);
end;

procedure TOpeFMLstFormacion.APrevExecute(Sender: TObject);
begin
  inherited;
  OpeDMLstFormacion.MostrarListado(0, StrToInt(LFDBEmpleadosDesde.Text), StrToInt(LFDBEmpleadosHasta.Text));
end;

procedure TOpeFMLstFormacion.AImprimirExecute(Sender: TObject);
begin
  inherited;
  OpeDMLstFormacion.MostrarListado(1, StrToInt(LFDBEmpleadosDesde.Text), StrToInt(LFDBEmpleadosHasta.Text));
end;

end.
