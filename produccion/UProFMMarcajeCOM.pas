unit UProFMMarcajeCOM;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ULFEdit, ComCtrls, ExtCtrls, ULFPanel, ToolWin,
  ULFToolBar, Mask, rxToolEdit, ULFDateEdit;

type
  TProFMMarcajeCom = class(TForm)
     LFToolBar1: TLFToolBar;
     LFPanel1: TLFPanel;
     EMarcaje: TLFEdit;
     TSalir: TToolButton;
     ToolButton1: TToolButton;
     LFDate: TLFDateEdit;
     LFTime: TDateTimePicker;
     TempMarc: TTimer;
     procedure TSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure Button1KeyPress(Sender: TObject; var Key: char);
     procedure ToolButton1Click(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure TempMarcTimer(Sender: TObject);
     procedure LFTimeClick(Sender: TObject);
     procedure EMarcajeKeyPress(Sender: TObject; var Key: char);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMMarcajeCom : TProFMMarcajeCom;

implementation

uses UProDMMarcajesBD, UProFMMarcajesBD;

{$R *.dfm}

procedure TProFMMarcajeCom.TSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMMarcajeCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TProFMMarcajeCom.Button1KeyPress(Sender: TObject; var Key: char);
{var
  i : integer;}
begin
  {i := i;}
end;

procedure TProFMMarcajeCom.ToolButton1Click(Sender: TObject);
var
  Fecha, HoraAux{, Hora} : string;
  HoraInt : integer;
  i, Pos : integer;
begin
  if (EMarcaje.Text <> '') then
  begin
     Fecha := DateToStr(LFDate.Date);
     HoraAux := TimetoStr(LFTime.Time);
     Pos := 1;

     //Quitar el formato hora y quitar segundos para luego pasar a float
     HoraInt := 0;
     for I := (strlen(PChar(HoraAux)) - 2) downto 1 do
     begin
        if (HoraAux[i] <> ':') then
        begin
           HoraInt := HoraInt + StrToInt(HoraAux[i]) * Pos;
           Pos := Pos * 10;
        end;
     end;

     // Si tiene un cero al principio quitarlo pq sino la conversión la hace mal
     ProDMMarcajesBD.InsertaMarcajeManual(EMarcaje.Text, Fecha, HoraInt);
     EMarcaje.Text := '';
     ProFMMarcajesBD.Filtrar;
  end;
end;

procedure TProFMMarcajeCom.FormCreate(Sender: TObject);
begin
  LFTime.Time := Time;
  LFDate.Date := Date;
  KeyPreview := True;
end;

procedure TProFMMarcajeCom.TempMarcTimer(Sender: TObject);
begin
  LFTime.Time := Time;
  LFTime.Refresh;
end;

procedure TProFMMarcajeCom.LFTimeClick(Sender: TObject);
begin
  TempMarc.Enabled := False;
end;

procedure TProFMMarcajeCom.EMarcajeKeyPress(Sender: TObject; var Key: char);
begin
  //sfg.albert - Aquest codi NOMÉS funcionarà quan a l'usuari el modo tab estigui en TAB
  if (key = #13) then
     ToolButton1Click(Sender);
end;

end.
