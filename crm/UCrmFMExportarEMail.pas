unit UCrmFMExportarEMail;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Dialogs, rxPlacemnt, StdCtrls, Controls, ExtCtrls, Classes,
  ComCtrls, Messages, SysUtils, Variants, Graphics, Forms, UFormGest, ULFLabel,
  ULFPanel;

type
  TCrmFMExportarEMail = class(TG2kForm)
     LVAmbitos: TListView;
     LblExportarAmbitos: TLFLabel;
     PNLTop: TLFPanel;
     PNLPie: TLFPanel;
     ButtInvertir: TButton;
     ButtCerrar: TButton;
     ButtExportar: TButton;
     FormStorage: TFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButtInvertirClick(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure ButtExportarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMExportarEMail : TCrmFMExportarEMail;

implementation

uses UCrmDMCorreos, UUtiles;

{$R *.dfm}

procedure TCrmFMExportarEMail.FormCreate(Sender: TObject);
var
  Item : TListItem;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  LVAmbitos.Clear;

  with CrmDMCorreos.xExportaAmbitos do
  begin
     Close;
     Open;
     First;
     while not EOF do
     begin
        Item := LVAmbitos.Items.Add;
        Item.ImageIndex := CrmDMCorreos.xExportaAmbitosAMBITO.AsInteger;
        Item.Caption := CrmDMCorreos.xExportaAmbitosDESCRIPCION.AsString;
        Item.Checked := True;
        Next;
     end;
  end;
end;

procedure TCrmFMExportarEMail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCrmFMExportarEMail.ButtInvertirClick(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to LVAmbitos.Items.Count - 1 do
  begin
     LVAmbitos.Items[i].Checked := not LVAmbitos.Items[i].Checked;
  end;
end;

procedure TCrmFMExportarEMail.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TCrmFMExportarEMail.ButtExportarClick(Sender: TObject);
var
  i, x : integer;
  where : string;
  f : TextFile;
  Archivo : string;
begin
  x := 0;
  for i := 0 to LVAmbitos.Items.Count - 1 do
  begin
     if LVAmbitos.Items[i].Checked then
     begin
        Inc(x);
        if x = 1 then
           where := ' and (det.ambito='
        else
           where := where + ' or det.ambito=';
        where := where + IntToStr(LVAmbitos.Items[i].ImageIndex);
     end; //if
  end; //for
  if x = 0 then
     Application.MessageBox(PChar(string(_('Para realizar la exportación hay que marcar, al menos, un ámbito'))), PChar(string(_('Error'))), MB_OK or MB_ICONERROR or MB_DEFBUTTON1)
  else
  begin
     if x = LVAmbitos.Items.Count then
        where := ''
     else
        where := where + ')';
     with CrmDMCorreos.xExportaEMails do
     begin
        Close;
        SelectSQL.Text := 'select distinct cab.direccion_email ' +
           '  from crm_sys_emails cab' +
           '  join crm_sys_emails_ambitos det on (cab.id_email=det.id_email)' +
           '  where cab.activo=1 ' + where;
        Open;
        if CrmDMCorreos.xExportaEMails.RecordCount = 0 then
           Application.MessageBox(PChar(string(_('No hay E-Mails activos para los ámbitos seleccionados'))), PChar(string(_('Error'))), MB_OK or MB_ICONERROR or MB_DEFBUTTON1)
        else
        begin
           Archivo := Format(_('Emails_%s.txt'), [FormatDateTime('yyyymmdd_hhnnss', Now)]);
           if MySaveDialog(Archivo, 'TXT', '', 'CrmFMExportarEMail') then
           begin
              AssignFile(f, Archivo);
              Rewrite(f);
              First;
              while not EOF do
              begin
                 WriteLn(f, Fields[0].AsString);
                 Next;
              end; //while
              CloseFile(f);
           end; //if then else if

           Application.MessageBox(PChar(string(Format(_('Exportación realizada con éxito.'#13#10 +
              '%d E-Mails exportados al archivo.'), [CrmDMCorreos.xExportaEMails.RecordCount]))), PChar(string(_('Información'))),
              MB_OK or MB_ICONINFORMATION or MB_DEFBUTTON1);
        end; //if then else
     end; //with
  end;
end;

end.
