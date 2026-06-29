unit UFMUnidadesExt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, ToolWin, StdCtrls, DB, UFormGest, ULFPanel,
  ULFToolBar, ULFLabel, ULFEdit;

type
  TFMUnidadesExt = class(TG2KForm)
     TButtMain: TLFToolBar;
     PNLUnidades: TLFPanel;
     TButtAceptar: TToolButton;
     TButtCancelar: TToolButton;
     procedure TButtAceptarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtCancelarClick(Sender: TObject);
     procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CreaCampos(DataSet: TDataSet);
  end;

var
  FMUnidadesExt : TFMUnidadesExt;

function DevuelveValor(DataSet: TDataSet; padre: TComponent): double;

implementation

uses UDMMain;

{$R *.DFM}

function DevuelveValor(DataSet: TDataSet; padre: TComponent): double;
var
  FMUnidadesExt : TFMUnidadesExt;
  Unidades : double;
  i : integer;
begin
  Unidades := 1;
  FMUnidadesExt := TFMUnidadesExt.Create(padre);
  try
     FMUnidadesExt.CreaCampos(DataSet);
     if (FMUnidadesExt.ShowModal = mrOk) then
     begin
        for i := 0 to FMUnidadesExt.PNLUnidades.ControlCount - 1 do
           if FMUnidadesExt.PNLUnidades.Controls[i] is TLFEdit then
              Unidades := Unidades * StrToFloat((FMUnidadesExt.PNLUnidades.Controls[i] as
                 TLFEdit).Text);
     end;
     Result := Unidades;
  finally
     FMUnidadesExt.Free;
  end;
end;

procedure TFMUnidadesExt.CreaCampos(DataSet: TDataSet);
var
  i, x, y, NumUnidades : integer;
  auxedit : TLFEdit;
  auxlabel : TLFLabel;
begin
  // Inicializamos las coordenadas x e y para situar los edits
  x := 9;
  y := 5;

  NumUnidades := DataSet.FieldByName('CONTROLA_MEDIDAS').AsInteger;
  //auxlabel := nil;
  // Creamos tantos edits como dimensiones tengan las unidades
  for i := 0 to (NumUnidades - 1) do
  begin
     auxedit := TLFEdit.Create(PNLUnidades);
     auxlabel := TLFLabel.Create(PNLUnidades);
     try
        auxedit.Parent := PNLUnidades;
        auxedit.Top := y;
        auxedit.Left := x;
        auxedit.AutoSize := False;
        auxedit.Width := 45;

        auxlabel.Parent := PNLUnidades;
        auxlabel.Top := y + 2;
        auxlabel.Left := x + 50;
        auxlabel.AutoSize := False;
        auxlabel.Width := 10;
        auxlabel.Caption := 'x';
        x := x + 62;
     except
        auxlabel.Free;
        auxedit.Free;
     end;
  end;

  // Ampliamos el formulario si es necesario
  Width := x + 35;
end;

procedure TFMUnidadesExt.TButtAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFMUnidadesExt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFMUnidadesExt.TButtCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFMUnidadesExt.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
end;

end.
