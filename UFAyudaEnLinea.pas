unit UFAyudaenLinea;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, UControlEdit, StdCtrls, ComCtrls, DBCtrls, UFormGest, ExtCtrls;

type
  TFAyudaenLinea = class(TG2KForm)
     DBREMain: TDBRichEdit;
     RichEdit1: TRichEdit;
     Splitter1: TSplitter;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormResize(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InfoFormulario(Formulario: string);
  end;

var
  FAyudaenLinea : TFAyudaenLinea;

implementation

uses UFMain, UDMAyudaenLinea;

{$R *.DFM}

procedure TFAyudaenLinea.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMAyudaEnLinea, DMAyudaEnLinea);
end;

procedure TFAyudaenLinea.InfoFormulario(Formulario: string);
var
  str : string;
begin
  str := DMAyudaenLinea.Filtra(Formulario);
  Caption := Format(_('Ayuda en línea - %s'), [Formulario]);
end;

procedure TFAyudaenLinea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAyudaEnLinea);
  Action := caFree;
  FMain.AyudaEnLinea := False;
end;

procedure TFAyudaenLinea.FormResize(Sender: TObject);
begin
  DBREMain.Height := Self.Height div 2;
end;

end.
