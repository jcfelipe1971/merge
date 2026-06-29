unit UFPregCuAnuales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, ComCtrls, ExtCtrls, ActnList, ToolWin, DBCtrls,
  Mask, rxToolEdit, ULFEdit, ULFCheckBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregCuAnuales = class(TFPEditListadoSimple)
     PNLFechaMoneda: TLFPanel;
     Fecha_del_listado: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     Comentario: TLFLabel;
     EComentario: TLFEdit;
     LMoneda: TLFLabel;
     PNLComentario: TLFPanel;
     TButtConfiguracion: TToolButton;
     DBETitMoneda: TLFDbedit;
     DBEMoneda: TLFDbedit;
     ChkBDesglosado: TLFCheckBox;
     CBDesglosadoPri: TLFCheckBox;
     CBCuentasSaldoCero: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure ChkBDesglosadoClick(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure CalculaGrupo;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregCuAnuales : TFPregCuAnuales;

implementation

uses UDMCuAnuales, UEntorno, UFMListConfig;

{$R *.DFM}

procedure TFPregCuAnuales.FormCreate(Sender: TObject);
begin
  inherited;
  ARecargarExecute(Self);

  Grupo := 0;
  Listado := DMCuAnuales.frHYCuentasAn;
  ListadoFR3 := DMCuAnuales.frxHYCuentasAn;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregCuAnuales.ARecargarExecute(Sender: TObject);
begin
  inherited;

  DTPFechaListado.Date := REntorno.FechaTrab;
  EComentario.Text := '';
  ChkBDesglosado.Checked := False;
  CBDesglosadoPri.Checked := False;
end;

procedure TFPregCuAnuales.ChkBDesglosadoClick(Sender: TObject);
begin
  CBDesglosadoPri.Visible := ChkBDesglosado.Checked;
end;

procedure TFPregCuAnuales.CalculaGrupo;
begin
  Grupo := 0;
  if ChkBDesglosado.Checked then
  begin
     if CBDesglosadoPri.Checked then
        case DMCUAnuales.QMCuentasAnTIPO.AsInteger of
           1, 2, 3: Grupo := 190;
           4: Grupo := 1032;
           5: Grupo := 1033;
           6: Grupo := 1034;
           7: Grupo := 1035;
           8: Grupo := 1036;
        end
     else
        case DMCUAnuales.QMCuentasAnTIPO.AsInteger of
           1, 2, 3: Grupo := 135;
           4: Grupo := 1027;
           5: Grupo := 1028;
           6: Grupo := 1029;
           7: Grupo := 1030;
           8: Grupo := 1031;
        end;
  end
  else
     case DMCUAnuales.QMCuentasAnTIPO.AsInteger of
        1, 2, 3: Grupo := 32;
        4: Grupo := 1022;
        5: Grupo := 1023;
        6: Grupo := 1024;
        7: Grupo := 1025;
        8: Grupo := 1026;
     end;
end;

procedure TFPregCuAnuales.AConfigurarExecute(Sender: TObject);
begin
  CalculaGrupo;
  inherited;
end;

procedure TFPregCuAnuales.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMCuAnuales.CalculaInforme(CBCuentasSaldoCero.Checked);
  DMCuAnuales.MostrarListado(Modo, DTPFechaListado.Date,
     ChkBDesglosado.Checked, CBDesglosadoPri.Checked, EComentario.Text);
end;

end.
