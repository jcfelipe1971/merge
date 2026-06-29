unit UFMImportacionNorma43SLucia;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UFormGest, StdCtrls, ULFMemo, ULFEdit, ULFLabel,
  ULFPanel;

type
  TFMImportacionNorma43SLucia = class(TG2KForm)
     Panel1: TLFPanel;
     PNLDetalles: TLFPanel;
     LCarpeta: TLFLabel;
     ECarpeta: TLFEdit;
     TButtAbrir: TButton;
     MErrores: TLFMemo;
     Panel3: TLFPanel;
     LProceso1: TLFLabel;
     LProceso2: TLFLabel;
     MLog: TLFMemo;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtAbrirClick(Sender: TObject);
     procedure FormResize(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMImportacionNorma43SLucia : TFMImportacionNorma43SLucia;

implementation

uses UDMImportacionNorma43SLucia, UEntorno, UUtiles;

{$R *.dfm}

procedure TFMImportacionNorma43SLucia.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMImportacionNorma43SLucia, DMImportacionNorma43SLucia);
  ECarpeta.Text := REntorno.RutaLibros;
end;

procedure TFMImportacionNorma43SLucia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMImportacionNorma43SLucia);
  Action := caFree;
end;

procedure TFMImportacionNorma43SLucia.TButtAbrirClick(Sender: TObject);
var
  Archivo : string;
begin
  Archivo := '';
  if MyOpenDialog(Archivo, 'TXT', ECarpeta.Text) then
     DMImportacionNorma43SLucia.Importar(Archivo);
end;

procedure TFMImportacionNorma43SLucia.FormResize(Sender: TObject);
begin
  MLog.Height := PNLDetalles.Height div 2;
end;

end.
