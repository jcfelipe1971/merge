unit UFMGeneraInventario;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FIBQuery, HYFIBQuery, FIBDatabase, UFIBModificados, ULFLabel,
  ULFComboBox;

type
  TFMGeneraInventario = class(TForm)
     TLocal: THYTransaction;
     SPGeneraInventario: THYFIBQuery;
     Label1: TLFLabel;
     ComboBoxMes: TLFComboBox;
     Button1: TButton;
     procedure FormCreate(Sender: TObject);
     procedure Button1Click(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGeneraInventario : TFMGeneraInventario;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TFMGeneraInventario.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DecodeDate(Date, Year, Month, Day);
  if Month < 10 then
     ComboBoxMes.Text := '0' + IntToStr(Month)
  else
     ComboBoxMes.Text := IntToStr(Month);
end;

procedure TFMGeneraInventario.Button1Click(Sender: TObject);
begin
  with SPGeneraInventario do
  begin
     Transaction.StartTransaction;
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Mes'].AsInteger := StrToInt(ComboBoxMes.Text);
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     try
        ExecQuery;
        Transaction.Commit;
     except
        MessageDlg('Ha habido un error al generar la tabla de Inventario',
           mtWarning, [mbOK], 0);
     end;
  end;
end;

end.
