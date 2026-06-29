unit UFPregAgrupacionProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFCheckBox,
  ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregAgrupacionProv = class(TFPEditListadoSimple)
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
  FPregAgrupacionProv : TFPregAgrupacionProv;

implementation

uses UDMMain, UFormGest, {UDMClientes,} UEntorno, UDMLSTProveedor, UFMListConfig;

{$R *.DFM}

procedure TFPregAgrupacionProv.FormCreate(Sender: TObject);
begin
  inherited;

  ARecargar.Execute;

  Grupo := 1021;
  Listado := DMLSTProveedor.frProveedor;
  ListadoFR3 := DMLSTProveedor.frxProveedor;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ShowModal;
end;

procedure TFPregAgrupacionProv.ARecargarExecute(Sender: TObject);
var
  Agrupacion : string;
begin
  inherited;

  DMLstProveedor.DameAgrupacion(Agrupacion);
  EFAgrupacion.Text := Agrupacion;
  ChkBMostrarEMail.Checked := True;
  RGOrden.ItemIndex := 0;
end;

procedure TFPregAgrupacionProv.EFAgrupacionChange(Sender: TObject);
begin
  DMLstProveedor.TituloAgrupacion(EFAgrupacion.Text);
end;

procedure TFPregAgrupacionProv.FormShow(Sender: TObject);
begin
  EFAgrupacion.SetFocus;
end;

procedure TFPregAgrupacionProv.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstProveedor.MostrarFiltradoAgrup(Modo, EFAgrupacion.Text, ChkBMostrarEMail.Checked,
     RGOrden.ItemIndex);
end;

end.
