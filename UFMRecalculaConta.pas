unit UFMRecalculaConta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, StdCtrls, ULFLabel, ULFPanel;

type
  TFMRecalculaConta = class(TG2kForm)
     PNLMain: TLFPanel;
     LBLTitulo: TLFLabel;
     LFaltan: TLFLabel;
     LBLFaltan: TLFLabel;
     ButtComenzar: TButton;
     LProcesandoRIC: TLFLabel;
     LBLRic: TLFLabel;
     ButtSalir: TButton;
     procedure FormCreate(Sender: TObject);
     procedure ButtComenzarClick(Sender: TObject);
     procedure ButtSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     Faltan: integer;
  public
     { Public declarations }
  end;

var
  FMRecalculaConta : TFMRecalculaConta;

implementation

uses UDMMain, UDMRecalculaConta;

{$R *.dfm}

procedure TFMRecalculaConta.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMRecalculaConta, DMRecalculaConta);

  Faltan := DMRecalculaConta.TotalAsientosRecal;
  LBLFaltan.Caption := IntToStr(Faltan);
  LBLTitulo.Caption := _('Recalculo de Saldos Contables');
end;

procedure TFMRecalculaConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMRecalculaConta);
  Action := caFree;
end;

procedure TFMRecalculaConta.ButtComenzarClick(Sender: TObject);
type
  PMyList = ^AList;

  AList = record
     I: integer;
  end;

var
  MyList : TList;
  ARecord : PMyList;
  i, f : integer;
begin
  try
     Screen.Cursor := crHourGlass;
     LBLTitulo.Caption := _('Recalculando Saldos');
     ButtComenzar.Enabled := False;

     with DMRecalculaConta do
     begin
        MyList := TList.Create;
        try

           DMMain.FiltraRo(xAsientos, '11100', True);
           while not (xAsientos.EOF) do
           begin
              New(ARecord);
              ARecord^.I := xAsientosRIC.AsInteger;
              MyList.Add(ARecord);

              xAsientos.Next;
           end;
           xAsientos.Close;

           f := MyList.Count;

           BorraSaldos;
           i := 0;
           while (i < f) do
           begin
              ARecord := MyList.Items[i];

              Dec(Faltan);
              LBLFaltan.Caption := IntToStr(Faltan);
              LBLRic.Caption := IntToStr(ARecord^.I);
              Application.ProcessMessages;

              RecalculaAsiento(ARecord^.I);

              Inc(i);
           end;

           for i := 0 to (MyList.Count - 1) do
           begin
              ARecord := MyList.Items[i];
              Dispose(ARecord);
           end;

        finally
           MyList.Free;
        end;
     end;

     ShowMessage(_('El recalculo se completo con exito'));
  finally
     Screen.Cursor := crDefault;
  end;

  Close;
end;

procedure TFMRecalculaConta.ButtSalirClick(Sender: TObject);
begin
  Close;
end;

end.
