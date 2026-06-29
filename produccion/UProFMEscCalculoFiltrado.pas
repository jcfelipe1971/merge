unit UProFMEscCalculoFiltrado;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, StdCtrls, FIBTableDataSet, ULFLabel,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox;

type
  TProFMEscCalculoFiltrado = class(TG2kForm)
     PNLMain: TLFPanel;
     LBLTitulo: TLFLabel;
     LFaltan: TLFLabel;
     LBLFaltan: TLFLabel;
     ButtComenzar: TButton;
     LProcesandoRIC: TLFLabel;
     LBLRic: TLFLabel;
     ButtSalir: TButton;
     CBFormulas: TLFCheckBox;
     CBPrecios: TLFCheckBox;
     PNLProgreso: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure ButtComenzarClick(Sender: TObject);
     procedure ButtSalirClick(Sender: TObject);
  private
     { Private declarations }
     Faltan: integer;
     Salir: boolean;
     Procesando: boolean;
  public
     { Public declarations }
  end;

var
  ProFMEscCalculoFiltrado : TProFMEscCalculoFiltrado;

implementation

uses UProDMEscandallo, UDMMain, FIBDataSet, DB, UEntorno;

{$R *.dfm}

procedure TProFMEscCalculoFiltrado.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  Faltan := ProDMEscandallo.TotalEscandallosFiltro;
  LBLFaltan.Caption := IntToStr(Faltan);
  LBLTitulo.Caption := _('Calculos escandallo');
end;

procedure TProFMEscCalculoFiltrado.ButtComenzarClick(Sender: TObject);
var
  TablaEsc : TFIBTableSet;
begin
  Salir := False;
  Procesando := True;
  ButtComenzar.Enabled := False;
  ButtSalir.Caption := _('Cancelar');
  try
     Faltan := ProDMEscandallo.TotalEscandallosFiltro;
     LBLFaltan.Caption := IntToStr(Faltan);

     TablaEsc := TFIBTableSet.Create(nil);
     try
        with TablaEsc do
        begin
           Database := DMMain.DataBase;
           Name := 'TablaEsc';
           TableName := ProDMEscandallo.QMProEscandallo.TableName;
           SelectSQL := ProDMEscandallo.QMProEscandallo.SelectSQL;
           Transaction := ProDMEscandallo.QMProEscandallo.Transaction;
           UpdateTransaction := ProDMEscandallo.QMProEscandallo.UpdateTransaction;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TIPO'].AsString := 'EPR';
           Open;
        end;

        // Screen.Cursor := crHourGlass;
        LBLTitulo.Caption := _('Calculos escandallo.');
        ButtComenzar.Enabled := False;

        with TablaEsc do
        begin
           First;

           while (not EOF) do
           begin
              if (Salir) then
                 Break;

              Dec(Faltan);
              LBLFaltan.Caption := IntToStr(Faltan);
              LBLRic.Caption := FieldByName('ESCANDALLO').AsString;
              Application.ProcessMessages;

              if (CBFormulas.Checked) then
                 ProDMEscandallo.CalculaFormulas(FieldByName('TIPO').AsString, FieldByName('ESCANDALLO').AsInteger);
              if (CBPrecios.Checked) then
                 ProDMEscandallo.ActualizarPrecios(FieldByName('ESCANDALLO').AsInteger, FieldByName('TIPO').AsString);

              Next;
           end;
        end;

        if (Salir) then
           ShowMessage(_('Cálculo cancelado'))
        else
           ShowMessage(_('Cálculo completado'));
     finally
        Screen.Cursor := crDefault;
        TablaEsc.Free;
        ButtComenzar.Enabled := True;
        Procesando := False;
     end;
  finally
     ButtComenzar.Enabled := True;
     ButtSalir.Caption := _('Salir');
  end;

  Close;
end;

procedure TProFMEscCalculoFiltrado.ButtSalirClick(Sender: TObject);
begin
  if Procesando then
     Salir := True
  else
     Close;
end;

end.
