unit UFMControlAgrupOfertas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, ExtCtrls, rxPlacemnt,
  UNavigator, Menus, UTeclas, UControlEdit, DB, ULFPanel, ULFToolBar;

type
  TFMControlAgrupOfertas = class(TG2KForm)
     PNLMain: TLFPanel;
     TBMain: TLFToolBar;
     DBGMain: TDBGridFind2000;
     FSMain: TFormStorage;
     NavMain: THYMNavigator;
     TButtSalir: TToolButton;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     TButtCanalDest: TToolButton;
     procedure TButtSalirClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGMainDblClick(Sender: TObject);
     procedure TButtCanalDestClick(Sender: TObject);
  private
     { Private declarations }
     CambiaCanal: boolean;
     procedure AbreCanalDestino;
  public
     { Public declarations }
     function Inicializa: boolean;
     procedure AsignaDataSource(DS: TDataSource);
  end;

var
  FMControlAgrupOfertas : TFMControlAgrupOfertas;

implementation

uses UDMMain, UUtiles, UEntorno;

{$R *.dfm}

procedure TFMControlAgrupOfertas.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMControlAgrupOfertas.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  ControlEdit := CEMain;
  CambiaCanal := False;
  DBGMain.Columns.Items[EncuentraField(DBGMain, 'RIG')].Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMControlAgrupOfertas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMControlAgrupOfertas.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  {if (UpperCase(Column.FieldName) = 'RIG') then
    with DBGMain.Canvas do
      begin
        Brush.Color := REntorno.ColorEnlaceActivo;
        Font.Color  := clWindowText ;
        FillRect(Rect);
      end}
end;

procedure TFMControlAgrupOfertas.DBGMainDblClick(Sender: TObject);
begin
  AbreCanalDestino;
end;

procedure TFMControlAgrupOfertas.AbreCanalDestino;
begin
  CambiaCanal := (Application.MessageBox(PChar(string(_('Se va a cerrar el canal actual para abrir el canal del documento'))),
     PChar(string(_('Confirmación'))),
     mb_iconstop + mb_yesno) = id_yes);
  Close;
end;

procedure TFMControlAgrupOfertas.TButtCanalDestClick(Sender: TObject);
begin
  AbreCanalDestino;
end;

function TFMControlAgrupOfertas.Inicializa: boolean;
begin
  ShowModal;
  Result := CambiaCanal;
end;

procedure TFMControlAgrupOfertas.AsignaDataSource(DS: TDataSource);
begin
  DBGMain.DataSource := DS;
  NavMain.DataSource := DS;
end;

end.
