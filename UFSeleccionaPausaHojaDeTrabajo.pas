unit UFSeleccionaPausaHojaDeTrabajo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, ULFEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, HYFIBQuery;

type
  TFSeleccionaPausaHojaDeTrabajo = class(TFPEditSinNavegador)
     EFCodigoIncidencia: TLFEditFind2000;
     ETituloCodigo: TLFEdit;
     LCodigoIncidencia: TLFLabel;
     LComentario: TLFLabel;
     EComentario: TLFEdit;
     ToolButton1: TToolButton;
     TBOk: TToolButton;
     procedure TBOkClick(Sender: TObject);
     procedure EFCodigoIncidenciaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameTituloIncidenciaRep(Tipo: string): string;
  end;

function PideDato(var CodIncidencia: string; var Comentario: string): boolean; overload;

var
  FSeleccionaPausaHojaDeTrabajo : TFSeleccionaPausaHojaDeTrabajo;

implementation

uses
  UDMMain, UFormGest;

{$R *.dfm}

procedure TFSeleccionaPausaHojaDeTrabajo.TBOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

function TFSeleccionaPausaHojaDeTrabajo.DameTituloIncidenciaRep(Tipo: string): string;
begin
  Result := '';
  if (Tipo > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DESCRIPCION FROM SYS_TIPO_INCIDENCIAS_REP WHERE TIPO= :TIPO';
           Params.ByName['TIPO'].AsString := Tipo;
           ExecQuery;
           Result := FieldByName['DESCRIPCION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFSeleccionaPausaHojaDeTrabajo.EFCodigoIncidenciaChange(Sender: TObject);
begin
  inherited;
  ETituloCodigo.Text := DameTituloIncidenciaRep(EFCodigoIncidencia.Text);
end;

function PideDato(var CodIncidencia: string; var Comentario: string): boolean; overload;
begin
  Result := False;
  AbreForm(TFSeleccionaPausaHojaDeTrabajo, FSeleccionaPausaHojaDeTrabajo);
  try
     with FSeleccionaPausaHojaDeTrabajo do
     begin
        EFCodigoIncidencia.Text := CodIncidencia;
        EComentario.Text := Comentario;

        Hide;
        ShowModal;

        if (ModalResult = mrOk) then
        begin
           CodIncidencia := EFCodigoIncidencia.Text;
           Comentario := EComentario.Text;
           Result := True;
        end;
     end;
  finally
     CierraForm(FSeleccionaPausaHojaDeTrabajo);
  end;
end;


end.
