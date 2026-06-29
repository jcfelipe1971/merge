unit UFMCanalesTraspasa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, UHYDBGrid, StdCtrls, Buttons, UFormGest,
  ULFEditFind2000, ULFLabel, ExtCtrls;

type
  TFMCanalesTraspasa = class(TG2KForm)
     LCanalAPropagar: TLFLabel;
     EFCanal: TLFEditFind2000;
     BtnOK: TBitBtn;
     BtnCancel: TBitBtn;
     PNLMain: TPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function Muestra(var canal: smallint): integer;
  end;

var
  FMCanalesTraspasa : TFMCanalesTraspasa;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

function TFMCanalesTraspasa.Muestra(var canal: smallint): integer;
begin
  Result := ShowModal;
  canal := StrToIntDef(EFCanal.Text, 0);
end;

procedure TFMCanalesTraspasa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := caFree;
end;

procedure TFMCanalesTraspasa.FormCreate(Sender: TObject);
begin
  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BtnOK, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BtnCancel, 1, DMMain.ILMain_Ac, 0);
end;

end.
