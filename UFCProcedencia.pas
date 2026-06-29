unit UFCProcedencia;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, ToolWin, UHYDBGrid, UControlEdit, UFormGest,
  StdCtrls, NsDBGrid, ULFToolBar, ExtCtrls, ULFPanel, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UEditPanel;

type
  TFCProcedencia = class(TFPEditSinNavegador)
     DBGProcedencia: THYTDBGrid;
     procedure DBGProcedenciaDblClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FCProcedencia : TFCProcedencia;

implementation

uses UDMMain, UFMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TFCProcedencia.FormCreate(Sender: TObject);
begin
  inherited;
  SalirConEscape;
end;

procedure TFCProcedencia.DBGProcedenciaDblClick(Sender: TObject);
var
  Ejercicio : integer;
  Serie, Tipo : string;
  Rig, Canal : integer;
begin
  with DBGProcedencia do
  begin
     with DataSource.DataSet do
     begin
        // Empresa := FieldByName('EMPRESA_O').AsInteger;
        Ejercicio := FieldByName('EJERCICIO_O').AsInteger;
        Canal := FieldByName('CANAL_O').AsInteger;
        Serie := FieldByName('SERIE_O').AsString;
        Tipo := FieldByName('TIPO_O').AsString;
        RIG := FieldByName('RIG_O').AsInteger;
     end;

     if (Ejercicio <> 0) and
        (Tipo <> '') then
     begin
        if (REntorno.Canal = Canal) then
        begin
           FMain.MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
           Close;
        end
        else
        begin
           if (ConfirmaMensaje(_('Se va a cerrar el canal actual para abrir el canal del documento'))) then
           begin
              CierraFormsMenos(FCProcedencia);
              FMain.CambiaEjercicioYCanal(Ejercicio, Canal);
              FMain.MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
              FMain.SetFocus;
           end;
           Close;
        end;
     end;
  end;
end;

end.
