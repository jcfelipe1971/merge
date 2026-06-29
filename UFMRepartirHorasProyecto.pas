unit UFMRepartirHorasProyecto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFMemo, ULFEdit, Mask,
  rxToolEdit, ULFDateEdit, ULFLabel, ULFComboBox;

type
  TFMRepartirHorasProyecto = class(TFPEditSinNavegador)
     PEdit: TLFPanel;
     LRepartirFecha: TLFLabel;
     LRepartirUnidades: TLFLabel;
     LRepartirTitulo: TLFLabel;
     LRepartirotas: TLFLabel;
     LRepartirUnidadesProyeto: TLFLabel;
     LRepartirProyecto: TLFLabel;
     DERepartirFecha: TLFDateEdit;
     ERepartirUnidades: TLFEdit;
     MRepartirNotas: TLFMemo;
     ERepartirUnidadesProyecto: TLFEdit;
     EFRepartirProyecto: TLFEditFind2000;
     MRepartirUnidadesProyecto: TLFMemo;
     BRepartir: TButton;
     BGuardarReparticion: TButton;
     MonthCalendar: TMonthCalendar;
     CBRepartirTitulo: TLFComboBox;
     LUsuario: TLFLabel;
     EUsuario: TLFEdit;
     procedure BRepartirClick(Sender: TObject);
     procedure BGuardarReparticionClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure MonthCalendarClick(Sender: TObject);
     procedure CBRepartirTituloChange(Sender: TObject);
  private
     { Private declarations }
     Separador: string;
  public
     { Public declarations }
  end;

var
  FMRepartirHorasProyecto : TFMRepartirHorasProyecto;

implementation

uses UDMProyectos, UDMMain, UFormGest, UEntorno, DateUtils, HYFIBQuery, UDameDato;

{$R *.dfm}

procedure TFMRepartirHorasProyecto.BRepartirClick(Sender: TObject);
begin
  inherited;
  // Agregar a memo
  if ((StrToIntDef(ERepartirUnidadesProyecto.Text, 0) > 0) and ((StrToIntDef(EFRepartirProyecto.Text, 0) > 0) or (CBRepartirTitulo.ItemIndex > 0))) then
     MRepartirUnidadesProyecto.Lines.Add(ERepartirUnidadesProyecto.Text + ' ' + Separador + ' ' + EFRepartirProyecto.Text + ' | ' + CBRepartirTitulo.Text + '| ' + DateToStr(DERepartirFecha.Date) + '| ' + StringReplace(MRepartirNotas.Text, #13#10, '[NewLine]', [rfReplaceAll]));

  // Volvwer a pedir unidades
  ERepartirUnidadesProyecto.Text := '';
  EFRepartirProyecto.Text := '';
  ERepartirUnidadesProyecto.SetFocus;
end;

procedure TFMRepartirHorasProyecto.BGuardarReparticionClick(Sender: TObject);
var
  i, p : integer;
  s : string;
begin
  inherited;

  for i := 0 to MRepartirUnidadesProyecto.Lines.Count - 1 do
  begin
     s := MRepartirUnidadesProyecto.Lines[i];
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO EMP_PROYECTOS_OTROS ');
           SQL.Add(' (EMPRESA, PROYECTO, UNIDADES, NOTAS, IMPORTE, FECHA, LINEA, TITULO, MONEDA, USUARIO) ');
           SQL.Add(' VALUES ');
           SQL.Add(' (:EMPRESA, :PROYECTO, :UNIDADES, :NOTAS, :IMPORTE, :FECHA, :LINEA, :TITULO, :MONEDA, :USUARIO) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           p := Pos(Separador, s);
           Params.ByName['UNIDADES'].AsFloat := StrToInt(Trim(Copy(s, 1, p - 1)));
           s := Trim(Copy(s, p + Length(Separador), Length(s)));
           p := Pos('|', s);
           Params.ByName['PROYECTO'].AsInteger := StrToInt(Trim(Copy(s, 1, p - 1)));
           s := Trim(Copy(s, p + 1, Length(s)));
           p := Pos('|', s);
           Params.ByName['TITULO'].AsString := Trim(Copy(s, 1, p - 1));
           s := Trim(Copy(s, p + 1, Length(s)));
           p := Pos('|', s);
           Params.ByName['FECHA'].AsDateTime := StrToDate(Trim(Copy(s, 1, p - 1)));
           s := Trim(Copy(s, p + 1, Length(s)));
           p := Pos('|', s);
           Params.ByName['NOTAS'].AsString := StringReplace(Trim(Copy(s, p + 1, Length(s))), '[NewLine]', #13, [rfReplaceAll]);
           Params.ByName['IMPORTE'].AsFloat := 0;
           Params.ByName['LINEA'].AsInteger := 0;
           Params.ByName['MONEDA'].AsString := REntorno.Moneda;
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  MRepartirUnidadesProyecto.Lines.Clear;
end;

procedure TFMRepartirHorasProyecto.FormCreate(Sender: TObject);
begin
  inherited;
  DERepartirFecha.Date := REntorno.FechaTrabSH;
  Separador := _('Hrs. ->');
  EUsuario.Text := DameTituloUsuario(REntorno.Usuario);
end;

procedure TFMRepartirHorasProyecto.MonthCalendarClick(Sender: TObject);
begin
  inherited;
  // Busco el lunes de la semana de la fecha
  DERepartirFecha.Date := MonthCalendar.Date;
  DERepartirFecha.Date := DERepartirFecha.Date - (DayOfTheWeek(DERepartirFecha.Date) - 1);
  // Marco la semana en el calendario
  MonthCalendar.Date := DERepartirFecha.Date;
  MonthCalendar.EndDate := DERepartirFecha.Date + 6;
  CBRepartirTitulo.SetFocus;
end;

procedure TFMRepartirHorasProyecto.CBRepartirTituloChange(Sender: TObject);
begin
  inherited;
  if (CBRepartirTitulo.ItemIndex = 0) then
  begin
     EFRepartirProyecto.Enabled := False;
     EFRepartirProyecto.Color := clInfoBk;
     EFRepartirProyecto.Text := '0';
  end
  else
  begin
     EFRepartirProyecto.Enabled := True;
     EFRepartirProyecto.Color := clWindow;
     EFRepartirProyecto.Text := '';
  end;
end;

end.
