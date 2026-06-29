unit UFMInformacionComercial;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, UNavigator, ULFLabel,
  ULFDBEdit, ULFDBMemo;

type
  TFMInformacionComercial = class(TForm)
     GroupBox1: TGroupBox;
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label24: TLFLabel;
     DBEdit1: TLFDBEdit;
     DBEdit2: TLFDBEdit;
     DBEdit3: TLFDBEdit;
     DBEdit4: TLFDBEdit;
     DBEdit5: TLFDBEdit;
     DBEdit15: TLFDBEdit;
     GroupBox2: TGroupBox;
     Label5: TLFLabel;
     Label6: TLFLabel;
     Label9: TLFLabel;
     DBEdit6: TLFDBEdit;
     DBEdit7: TLFDBEdit;
     DBEdit8: TLFDBEdit;
     DBEdit36: TLFDBEdit;
     DBEdit37: TLFDBEdit;
     DBEdit38: TLFDBEdit;
     GroupBox3: TGroupBox;
     Label23: TLFLabel;
     Label25: TLFLabel;
     Label26: TLFLabel;
     Label27: TLFLabel;
     Label28: TLFLabel;
     Label29: TLFLabel;
     Label30: TLFLabel;
     DBEdit9: TLFDBEdit;
     DBEdit10: TLFDBEdit;
     DBEdit11: TLFDBEdit;
     DBEdit12: TLFDBEdit;
     DBEdit13: TLFDBEdit;
     DBEdit14: TLFDBEdit;
     DBEdit39: TLFDBEdit;
     DBEdit40: TLFDBEdit;
     DBEdit41: TLFDBEdit;
     Label11: TLFLabel;
     Label12: TLFLabel;
     Label13: TLFLabel;
     Label14: TLFLabel;
     DBMemo2: TLFDBMemo;
     DBEdit19: TLFDBEdit;
     DBEdit20: TLFDBEdit;
     DBEdit21: TLFDBEdit;
     DBEdit22: TLFDBEdit;
     GroupBox4: TGroupBox;
     Label10: TLFLabel;
     DBEdit16: TLFDBEdit;
     DBEdit17: TLFDBEdit;
     DBEdit18: TLFDBEdit;
     DBEdit23: TLFDBEdit;
     DBEdit24: TLFDBEdit;
     DBEdit25: TLFDBEdit;
     DBEdit26: TLFDBEdit;
     Label3: TLFLabel;
     DBGrid1: TDBGrid;
     DBMemo1: TLFDBMemo;
     Label4: TLFLabel;
     DBNavigator1: TDBNavigator;
     DBNavigator2: TDBNavigator;
     DBNavigator3: TDBNavigator;
     LFDbedit1: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(cliente: integer);
  end;

var
  FMInformacionComercial : TFMInformacionComercial;

implementation

uses UDMInformacionComercial, UFormGest, UEntorno;

{$R *.DFM}

procedure TFMInformacionComercial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMInformacionComercial);
end;

procedure TFMInformacionComercial.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMInformacionComercial, DMInformacionComercial);
end;

procedure TFMInformacionComercial.Muestra(cliente: integer);
begin
  if not DMInformacionComercial.TLocal.InTransaction then
     DMInformacionComercial.TLocal.StartTransaction;
  DMInformacionComercial.xConCuentasGesCli.Close;
  DMInformacionComercial.xConCuentasGesCli.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  DMInformacionComercial.xConCuentasGesCli.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  DMInformacionComercial.xConCuentasGesCli.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  DMInformacionComercial.xConCuentasGesCli.Params.ByName['CLIENTE'].AsInteger := cliente;
  DMInformacionComercial.xConCuentasGesCli.Open;
  FMInformacionComercial.Caption := 'Informacion Comercial';
  FMInformacionComercial.Show;
  FMInformacionComercial.Refresh;
end;

end.
