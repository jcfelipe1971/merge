unit UProFMInfoMedidasOF;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, ExtCtrls, ULFPanel,
  ULFEdit, Buttons, UEditPanel, ToolWin, ComCtrls, ULFToolBar;

type
  TProFMInfoMedidasOF = class(TForm)
     PNLMain: TLFPanel;
     LMedida1: TLFLabel;
     LMedida2: TLFLabel;
     LMedida3: TLFLabel;
     LMedida4: TLFLabel;
     EMedida1: TLFEdit;
     EMedida2: TLFEdit;
     EMedida3: TLFEdit;
     EMedida4: TLFEdit;
     BCalcular: TBitBtn;
     BCancelar: TBitBtn;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BCalcularClick(Sender: TObject);
     procedure BCancelarClick(Sender: TObject);
     procedure EMedida1KeyPress(Sender: TObject; var Key: char);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Inicializa(Medida1, Medida2, Medida3, Medida4: double);
  end;

var
  ProFMInfoMedidasOF : TProFMInfoMedidasOF;

implementation

uses UDMMain, UProDMOrden, DB, UUtiles;

{$R *.dfm}

procedure TProFMInfoMedidasOF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TProFMInfoMedidasOF.BCalcularClick(Sender: TObject);
var
  IDOrden : integer;
begin
  Screen.Cursor := crHourGlass;
  try
     IDOrden := ProDMOrden.QMProOrdID_ORDEN.AsInteger;
     ProDMOrden.ActualizaMedidas(IDOrden, StrToFloat(EMedida1.Text), StrToFloat(EMedida2.Text), StrToFloat(EMedida3.Text), StrToFloat(EMedida4.Text));
     ProDMOrden.CalculaFormulas(IDOrden);
     ProDMOrden.PosicionaIdOrden(IDOrden);
  finally
     Screen.Cursor := crDefault;
  end;

  Close;
end;

procedure TProFMInfoMedidasOF.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMInfoMedidasOF.EMedida1KeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, {'-', ThousandSeparator,} DecimalSeparator]) then
     Key := #0;
end;

procedure TProFMInfoMedidasOF.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Asigno Imagenes a BitdBtn
  GetBitmapFromImageList(BCalcular, 1, DMMain.ILMain_Ac, 3);
  GetBitmapFromImageList(BCancelar, 1, DMMain.ILMain_Ac, 0);
end;

procedure TProFMInfoMedidasOF.Inicializa(Medida1, Medida2, Medida3, Medida4: double);
begin
  EMedida1.Text := FloatToStr(Medida1);
  EMedida2.Text := FloatToStr(Medida2);
  EMedida3.Text := FloatToStr(Medida3);
  EMedida4.Text := FloatToStr(Medida4);
end;

end.
