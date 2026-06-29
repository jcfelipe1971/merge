unit UFPregAgrupacionCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFCheckBox,
  ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregAgrupacionCli = class(TFPEditListadoSimple)
     PNLAgrupacion: TLFPanel;
     LBLAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     DBETitulo: TLFDbedit;
     TButtConfRapida: TToolButton;
     ChkBMostrarEMail: TLFCheckBox;
     RGOrden: TRadioGroup;
     procedure FormCreate(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregAgrupacionCli : TFPregAgrupacionCli;

implementation

uses UDMMain, UFormGest, {UDMClientes, UFMListConfig,} UEntorno, UDMLSTClientes;

{$R *.DFM}

procedure TFPregAgrupacionCli.FormCreate(Sender: TObject);
begin
  Grupo := 16;
  Listado := DMLstClientes.frClientes;
  ListadoFR3 := DMLstClientes.frxClientes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargar.Execute;

  ShowModal;
end;

procedure TFPregAgrupacionCli.FormShow(Sender: TObject);
begin
  EFAgrupacion.SetFocus;
end;

procedure TFPregAgrupacionCli.ARecargarExecute(Sender: TObject);
var
  Agrupacion : string;
begin
  DMLstClientes.DameAgrupacion(Agrupacion);
  EFAgrupacion.Text := Agrupacion;
  ChkBMostrarEMail.Checked := True;
  RGOrden.ItemIndex := 0;
end;

procedure TFPregAgrupacionCli.EFAgrupacionChange(Sender: TObject);
begin
  DMLstClientes.TituloAgrupacion(EFAgrupacion.Text);
end;

procedure TFPregAgrupacionCli.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstClientes.MostrarFiltradoAgrup(Modo, EFAgrupacion.Text, ChkBMostrarEMail.Checked,
     RGOrden.ItemIndex);
end;

end.
