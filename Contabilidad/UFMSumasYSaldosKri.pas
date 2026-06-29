unit UFMSumasYSaldosKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, HYFIBQuery, FIBDatabase, UFIBModificados, StdCtrls, ULFEdit,
  ULFLabel, ULFComboBox;

type
  TFMSumasYSaldosKri = class(TForm)
     LPeriodos: TLFLabel;
     ComboBoxMes: TLFComboBox;
     BGenerar: TButton;
     RBTodosCentros: TRadioButton;
     RBCentro: TRadioButton;
     ECentro: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure BGenerarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure RBTodosCentrosClick(Sender: TObject);
     procedure RBCentroClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSumasYSaldosKri : TFMSumasYSaldosKri;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TFMSumasYSaldosKri.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  ECentro.Text := '_';
  DecodeDate(Date, Year, Month, Day);
  if Month < 10 then
     ComboBoxMes.Text := '0' + IntToStr(Month)
  else
     ComboBoxMes.Text := IntToStr(Month);
end;

procedure TFMSumasYSaldosKri.BGenerarClick(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'execute procedure genera_tmp_balance_kri (?EMPRESA, ?EJERCICIO, ?PERIODO, ?CENTRO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['PERIODO'].AsString := ComboBoxMes.Text;
        Params.ByName['CENTRO'].AsString := ECentro.Text;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TFMSumasYSaldosKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMSumasYSaldosKri.RBTodosCentrosClick(Sender: TObject);
begin
  if (RBTodosCentros.Checked) then
  begin
     ECentro.Text := '_';
     ECentro.Enabled := False;
  end
  else
  begin
     ECentro.Text := '';
     ECentro.Enabled := True;
  end;
end;

procedure TFMSumasYSaldosKri.RBCentroClick(Sender: TObject);
begin
  if (RBTodosCentros.Checked) then
  begin
     ECentro.Text := '_';
     ECentro.Enabled := False;
  end
  else
  begin
     ECentro.Text := '';
     ECentro.Enabled := True;
  end;
end;

end.
