unit UFMCuAnualesValorExistencias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, URightMaskEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UFormGest, ULFLabel, ULFPanel, ULFComboBox;

type
  TFMCuAnualesValorExistencias = class(TG2KForm)
     PNLMain: TLFPanel;
     LCuenta: TLFLabel;
     LImporte: TLFLabel;
     EFCuentas: TEditFind2000;
     EImporte: TRightMaskEdit;
     BOk: TButton;
     LNivel: TLFLabel;
     CBoxNivel: TLFComboBox;
     procedure BOkClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCuAnualesValorExistencias : TFMCuAnualesValorExistencias;

implementation

uses UDMMain, UFMCuAnuales, UEntorno;

{$R *.dfm}

procedure TFMCuAnualesValorExistencias.FormCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  EFCuentas.Text := FMCuAnuales.cuenta_existencias_kri;
  EImporte.Valor := FMCuAnuales.importe_existencias_kri;
  CBoxNivel.Items.Clear;
  for i := 1 to REntorno.NivelesCont do
     CBoxNivel.Items.Add(IntToStr(i));
  CBoxNivel.ItemIndex := 3;
end;

procedure TFMCuAnualesValorExistencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMCuAnualesValorExistencias.BOkClick(Sender: TObject);
begin
  FMCuAnuales.cuenta_existencias_kri := EFCuentas.Text;
  FMCuAnuales.importe_existencias_kri := EImporte.Valor;
  FMCuAnuales.nivel_kri := CBoxNivel.ItemIndex + 1;
  Close;
end;

end.
