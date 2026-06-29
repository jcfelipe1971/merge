unit UProFMRecalculoStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ULFToolBar, ExtCtrls,
  TFlatCheckBoxUnit, ULFCheckBox, ActnList, ULFActionList, rxPlacemnt,
  ULFFormStorage, StdCtrls, ULFLabel, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFEditFind2000, ULFEdit,
  ULFPanel;

type
  TProFmRecalculoStock = class(TG2KForm)
     PNLMain: TLFPanel;
     CBReservadas: TLFCheckBox;
     CBEnProceso: TLFCheckBox;
     TBOptions: TLFToolBar;
     ALMain: TLFActionList;
     ASalir: TAction;
     AProcesar: TAction;
     FSMain: TLFFibFormStorage;
     DBEFArticulo: TLFEditFind2000;
     LArticulo: TLFLabel;
     EArticulo: TLFEdit;
     procedure AProcesarExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFArticuloChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFmRecalculoStock : TProFmRecalculoStock;

implementation

uses UProDMRecalculoStock, UEntorno, UDameDato, UDMMain;

{$R *.dfm}

procedure TProFmRecalculoStock.AProcesarExecute(Sender: TObject);
var
  Option : byte;
begin
  inherited;

  Option := 0;
  if (CBReservadas.Checked) then
     Option := Option + 1;
  if (CBEnProceso.Checked) then
     Option := Option + 2;

  if (Option <> 0) then
     if (Application.MessageBox(PChar(string(_('Atención : Este Proceso es costoso y puede tardar bastante.'))),
        PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes) then
     begin
        ProDMRecalculoStock.RecalculaStock(Option, string(DBEFArticulo.Text), True);
        ShowMessage(_('El Proceso terminó con éxito.'));
     end;
end;

procedure TProFmRecalculoStock.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TProFmRecalculoStock.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TProDMRecalculoStock, ProDMRecalculoStock);
end;

procedure TProFmRecalculoStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TProFmRecalculoStock.DBEFArticuloChange(Sender: TObject);
begin
  EArticulo.Text := DameTituloArticulo(DBEFArticulo.Text);
end;

end.
