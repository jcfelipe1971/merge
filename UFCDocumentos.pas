unit UFCDocumentos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, ToolWin, UHYDBGrid, UControlEdit, UFormGest,
  StdCtrls, RXDBCtrl, NsDBGrid, ULFToolBar;

type
  TFCDocumentos = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtGrabar: TToolButton;
     DBGProcedencia: THYTDBGrid;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtGrabarClick(Sender: TObject);
     procedure DBGProcedenciaDblClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FCDocumentos : TFCDocumentos;

implementation

uses UDMMain, UFMain;

{$R *.DFM}

procedure TFCDocumentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFCDocumentos.TButtGrabarClick(Sender: TObject);
begin
  Close;
end;

procedure TFCDocumentos.DBGProcedenciaDblClick(Sender: TObject);
var
  Ejercicio : integer;
  Tipo : string;
  Rig : integer;
  Serie : string;
begin
  if (DBGProcedencia.Columns[0].Field.Text <> '') and
     (DBGProcedencia.Columns[2].Field.Text <> '') then
  begin
     Ejercicio := StrToInt(DBGProcedencia.Columns[0].Field.Text);
     Tipo := DBGProcedencia.Columns[1].Field.Text;
     Serie := DBGProcedencia.Columns[2].Field.Text;
     Rig := StrToInt(DBGProcedencia.Columns[3].Field.Text);
     FMain.MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
     Close;
  end;
end;

procedure TFCDocumentos.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
