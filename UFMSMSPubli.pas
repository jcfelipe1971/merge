unit UFMSMSPubli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, Mask, DBCtrls, ULFDBEdit,
  ULFMemo, ULFEdit;

type
  TFMSMSPubli = class(TFPEditSimple)
     LApiKey: TLFLabel;
     LReportUrl: TLFLabel;
     LMessageFrom: TLFLabel;
     LEncoding: TLFLabel;
     DBEApiKey: TLFDbedit;
     DBEReportUrl: TLFDbedit;
     DBEMessageFrom: TLFDbedit;
     DBEEncoding: TLFDbedit;
     DBCBConcat: TLFDBCheckBox;
     LTo: TLFLabel;
     LMensaje: TLFLabel;
     ETo: TLFEdit;
     MMensaje: TLFMemo;
     CBPrueba: TLFCheckBox;
     LCaracteres: TLFLabel;
     BEnviar: TButton;
     LResultado: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure MMensajeChange(Sender: TObject);
     procedure BEnviarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSMSPubli : TFMSMSPubli;

implementation

uses
  UDMMain, UDMSMSPubli, UFormGest;

{$R *.dfm}

procedure TFMSMSPubli.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSMSPubli, DMSMSPubli);
  MMensajeChange(Sender);
  LResultado.Caption := '';
end;

procedure TFMSMSPubli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSMSPubli);
end;

procedure TFMSMSPubli.MMensajeChange(Sender: TObject);
begin
  inherited;
  LCaracteres.Caption := format(_('Caracteres: %d'), [Length(MMensaje.Lines.Text)]);
end;

procedure TFMSMSPubli.BEnviarClick(Sender: TObject);
begin
  inherited;
  DMSMSPubli.NuevoMensaje(ETo.Text, MMensaje.Text, Now, 'Test_' + FormatDateTime('yyyy-mm-dd_hh:nn:ss', Now));
  if DMSMSPubli.Enviar(CBPrueba.Checked) then
     LResultado.Caption := _('Enviado')
  else
     LResultado.Caption := _('Error');
end;

end.
