unit UFMAsignaEmpleado;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, ULFEdit, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel,
  ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Mask, rxToolEdit,
  ULFDateEdit, ULFLabel;

type
  TFMAsignaEmpleado = class(TFPEditSinNavegador)
     LEmpleadoResponsable: TLFLabel;
     EEmpleadoTituloResponsable: TLFEdit;
     TBOk: TToolButton;
     ToolButton2: TToolButton;
     EFEmpleadoAtencion: TLFEditFind2000;
     EEmpleadoTituloAtencion: TLFEdit;
     EFEmpleadoResponsable: TLFEditFind2000;
     LEmpleadoAtencion: TLFLabel;
     procedure TBOkClick(Sender: TObject);
     procedure OnKeyPress(Sender: TObject; var Key: char);
     procedure EFEmpleadoAtencionChange(Sender: TObject);
     procedure EFEmpleadoResponsableChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAsignaEmpleado : TFMAsignaEmpleado;

procedure PideDato(id_s: integer);

implementation

uses UDMMain, UFormGest, DateUtils, UEntorno, HYFIBQuery, UDameDato;

{$R *.dfm}

procedure PideDato(id_s: integer);
var
  EmpleadoResponsable, EmpleadoAtencion : integer;
  Tipo, Tabla : string;
begin
  // Obtengo tipo de documento
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        Tipo := FieldByName['TIPO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Calculo tabla donde estan los datos
  if (Tipo = 'OFC') then
     Tabla := 'GES_CABECERAS_S_OFC';
  if (Tipo = 'PEC') then
     Tabla := 'GES_CABECERAS_S_PED';
  if (Tipo = 'ALB') then
     Tabla := 'GES_CABECERAS_S_ALB';
  if (Tipo = 'FAC') then
     Tabla := 'GES_CABECERAS_S_FAC';

  // Obtengo empleados
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPLEADO_RESPONSABLE, EMPLEADO_ATENCION FROM ' + Tabla + ' WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        EmpleadoResponsable := FieldByName['EMPLEADO_RESPONSABLE'].AsInteger;
        EmpleadoAtencion := FieldByName['EMPLEADO_ATENCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbreForm(TFMAsignaEmpleado, FMAsignaEmpleado);
  try
     with FMAsignaEmpleado do
     begin
        // Poner Empleados en EditFinds.
        EFEmpleadoResponsable.Text := '';
        EFEmpleadoAtencion.Text := '';
        if (EmpleadoResponsable <> 0) then
           EFEmpleadoResponsable.Text := IntToStr(EmpleadoResponsable);
        if (EmpleadoAtencion <> 0) then
           EFEmpleadoAtencion.Text := IntToStr(EmpleadoAtencion);

        // Oculto para mostrar en modo Modal
        Hide;
        ShowModal;

        if ((ModalResult = mrOk) and (id_s > 0)) then
        begin
           EmpleadoResponsable := StrToIntDef(EFEmpleadoResponsable.Text, 0);
           EmpleadoAtencion := StrToIntDef(EFEmpleadoAtencion.Text, 0);

           // Actualizo empleados
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE ' + Tabla);
                 SQL.Add(' SET ');
                 SQL.Add(' EMPLEADO_RESPONSABLE = :EMPLEADO_RESPONSABLE, ');
                 SQL.Add(' EMPLEADO_ATENCION = :EMPLEADO_ATENCION ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S ');
                 Params.ByName['EMPLEADO_RESPONSABLE'].AsInteger := EmpleadoResponsable;
                 Params.ByName['EMPLEADO_ATENCION'].AsInteger := EmpleadoAtencion;
                 Params.ByName['ID_S'].AsInteger := id_s;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  finally
     CierraForm(FMAsignaEmpleado);
  end;
end;

procedure TFMAsignaEmpleado.TBOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;


procedure TFMAsignaEmpleado.OnKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = chr(13)) then
     ModalResult := mrOk;
  if (Key = chr(27)) then
     ModalResult := mrCancel;
end;

procedure TFMAsignaEmpleado.EFEmpleadoAtencionChange(Sender: TObject);
begin
  inherited;
  EEmpleadoTituloAtencion.Text := DameTituloEmpleado(StrToIntDef(EFEmpleadoAtencion.Text, 0));
end;

procedure TFMAsignaEmpleado.EFEmpleadoResponsableChange(Sender: TObject);
begin
  inherited;
  EEmpleadoTituloResponsable.Text := DameTituloEmpleado(StrToIntDef(EFEmpleadoResponsable.Text, 0));
end;

end.
