unit UFMIntroduccionOperario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Mask, rxToolEdit, ULFDateEdit, ULFEdit, Buttons,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ULFLabel, ComCtrls, UDBDateTimePicker, HYFIBQuery, DBCtrls,
  ULFDBEditFind2000, ULFDBEdit, ExtCtrls, ULFPanel, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel, ToolWin, ULFToolBar;

type
  TFMIntroduccionOperario = class(TFPEditSinNavegador)
     LOperario: TLFLabel;
     LFechaFinal: TLFLabel;
     LComentario: TLFLabel;
     EComentario: TLFEdit;
     DEFechaInicio: TLFDateEdit;
     BAceptar: TButton;
     LHoja: TLFLabel;
     BCerrar: TButton;
     ETituloResponsable: TLFEdit;
     EFOperario: TLFEditFind2000;
     EFHoja: TLFEditFind2000;
     ETituloHoja: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BAceptarClick(Sender: TObject);
     procedure BCerrarClick(Sender: TObject);
     procedure EFOperarioChange(Sender: TObject);
     procedure EFHojaChange(Sender: TObject);
  private
     { Private declarations }
     idEmpleado: integer;
  public
     { Public declarations }
  end;

var
  FMIntroduccionOperario : TFMIntroduccionOperario;

implementation

uses UDMMain, UEntorno, UDMIntroduccionOperario;

{$R *.dfm}

procedure TFMIntroduccionOperario.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMIntroduccionOperario, DMIntroduccionOperario);
  DEFechaInicio.Date := Now;
end;

procedure TFMIntroduccionOperario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMIntroduccionOperario);
end;

procedure TFMIntroduccionOperario.BAceptarClick(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CABECERAS_S_PRE ');
        SQL.Add(' SET ');
        SQL.Add(' RESPONSABLE = :RESPONSABLE ');
        SQL.Add(' ,TITUTLO_RESPONSABLE = :TITUTLO_RESPONSABLE ');
        SQL.Add(' ,FECHA_FIN = :FECHA_FIN ');
        SQL.Add(' ,COMENTARIO = :COMENTARIO ');
        SQL.Add(' ,ESTADO = :ESTADO ');
        SQL.Add(' ,ID_EMPLEADO = :ID_EMPLEADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' HOJA = :HOJA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['HOJA'].AsInteger := StrToIntDef(EFHoja.Text, 0);
        //Params.ByName['EMPLEADO'].AsInteger := StrToIntDef(EFOperario.Text,0);
        Params.ByName['RESPONSABLE'].AsInteger := StrToIntDef(EFOperario.Text, 0);
        Params.ByName['TITUTLO_RESPONSABLE'].AsString := ETituloResponsable.Text;
        Params.ByName['FECHA_FIN'].AsDateTime := DEFechaInicio.Date;
        Params.ByName['COMENTARIO'].AsString := EComentario.Text;
        Params.ByName['ESTADO'].AsInteger := 3;//sfg.albert - Listo para albaranar
        Params.ByName['ID_EMPLEADO'].AsInteger := idEmpleado;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Close;
end;

procedure TFMIntroduccionOperario.BCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMIntroduccionOperario.EFOperarioChange(Sender: TObject);
begin
  inherited;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO, ID_EMPLEADO FROM VER_EMPLEADOS_EF WHERE EMPRESA = :EMPRESA AND EMPLEADO = :EMPLEADO ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := StrToIntDef(EFOperario.Text, 0);
        ExecQuery;
        ETituloResponsable.Text := FieldByName['TITULO'].AsString;
        idEmpleado := FieldByName['ID_EMPLEADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMIntroduccionOperario.EFHojaChange(Sender: TObject);
begin
  inherited;
  //sfg.albert - Se pone elnombre del cliente de la Hoja
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT NOMBRE_R_SOCIAL FROM VER_CABECERAS_S_PRE WHERE EMPRESA = :EMPRESA AND HOJA = :HOJA ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['HOJA'].AsInteger := StrToIntDef(EFHoja.Text, 0);
        ExecQuery;
        ETituloHoja.Text := FieldByName['NOMBRE_R_SOCIAL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
