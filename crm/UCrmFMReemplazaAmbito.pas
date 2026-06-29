unit UCrmFMReemplazaAmbito;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Dialogs, rxPlacemnt, StdCtrls, Controls, ExtCtrls, Classes,
  ComCtrls, Messages, SysUtils, Variants, Graphics, Forms, UFormGest, ULFLabel,
  ULFPanel;

type
  TCrmFMReemplazaAmbito = class(TG2kForm)
     LVAmbitos: TListView;
     LblReemplazarAmbitos: TLFLabel;
     PNLTop: TLFPanel;
     PNLPie: TLFPanel;
     ButtInvertir: TButton;
     ButtCerrar: TButton;
     ButtReemplazar: TButton;
     FormStorage: TFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButtInvertirClick(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure ButtReemplazarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMReemplazaAmbito : TCrmFMReemplazaAmbito;

implementation

uses UCrmDMAmbitos;

{$R *.dfm}

procedure TCrmFMReemplazaAmbito.FormCreate(Sender: TObject);
var
  Item : TListItem;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  LVAmbitos.Clear;

  LblReemplazarAmbitos.Caption := Format(_('Reemplazar los siguientes ámbitos por %s'), [CrmDMAmbitos.QMAmbitosAMBITO.AsString]);

  with CrmDMAmbitos.xReemplazaAmbitos do
  begin
     Close;
     Open;
     First;
     while not EOF do
     begin
        // Seleccionamos todos excepto el origen
        if (CrmDMAmbitos.xReemplazaAmbitosAMBITO.AsInteger <> CrmDMAmbitos.QMAmbitosAMBITO.AsInteger) then
        begin
           Item := LVAmbitos.Items.Add;
           Item.ImageIndex := CrmDMAmbitos.xReemplazaAmbitosAMBITO.AsInteger;
           Item.Caption := CrmDMAmbitos.xReemplazaAmbitosDESCRIPCION.AsString;
           Item.Checked := False;
        end;
        Next;
     end;
  end;
end;

procedure TCrmFMReemplazaAmbito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCrmFMReemplazaAmbito.ButtInvertirClick(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to LVAmbitos.Items.Count - 1 do
  begin
     LVAmbitos.Items[i].Checked := not LVAmbitos.Items[i].Checked;
  end;
end;

procedure TCrmFMReemplazaAmbito.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TCrmFMReemplazaAmbito.ButtReemplazarClick(Sender: TObject);
var
  i, x : integer;
begin
  x := 0;
  for i := 0 to LVAmbitos.Items.Count - 1 do
  begin
     if LVAmbitos.Items[i].Checked then
     begin
        Inc(x);
        CRMDMAmbitos.ReemplazarAmbitos(LVAmbitos.Items[i].ImageIndex);
     end; //if
  end; //for

  if x = 0 then
     Application.MessageBox(PChar(string(_('Para realizar la exportación hay que marcar, al menos, un ámbito'))), PChar(string(_('Error'))), MB_OK or MB_ICONERROR or MB_DEFBUTTON1)
  else
     Application.MessageBox(PChar(string(_('Proceso finalizado.'))), PChar(string(_('Información'))), MB_OK or MB_ICONINFORMATION or MB_DEFBUTTON1);

  Close;
end;

end.
