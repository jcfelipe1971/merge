unit UDMGenEjercicios;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  HYFIBQuery;

type
  TDMGenEjercicios = class(TDataModule)
     QMGenEjercicios: TFIBTableSet;
     QMGenEjerciciosEMPRESA: TIntegerField;
     QMGenEjerciciosEJERCICIO: TIntegerField;
     QMGenEjerciciosACTIVO: TIntegerField;
     QMGenEjerciciosAPERTURA: TDateTimeField;
     QMGenEjerciciosCIERRE: TDateTimeField;
     DSQMGenEjercicios: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMGenEjerciciosCOLOR: TFloatField;
     procedure DMGenEjerciciosCreate(Sender: TObject);
     procedure QMGenEjerciciosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ActivarEjercicio(Accion: smallint);
     procedure LimpiaEjeTodo;
  end;

var
  DMGenEjercicios : TDMGenEjercicios;

implementation

uses UDMMain, UEntorno, UFParada;

{$R *.DFM}

procedure TDMGenEjercicios.DMGenEjerciciosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMGenEjercicios, '10000', True);
end;

procedure TDMGenEjercicios.ActivarEjercicio(Accion: smallint);
begin
  with QMGenEjercicios do
  begin
     Edit;
     QMGenEjerciciosACTIVO.AsInteger := Accion;
     Post;
     Refresh;
  end;
end;

procedure TDMGenEjercicios.LimpiaEjeTodo;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE LIM_EMP_EJE(?EMPRESA, ?EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMGenEjerciciosEJERCICIO.AsInteger;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMGenEjercicios.Close;
  QMGenEjercicios.Open;
end;

procedure TDMGenEjercicios.QMGenEjerciciosBeforePost(DataSet: TDataSet);
begin
  if (QMGenEjerciciosCOLOR.AsFloat = 0) then
     QMGenEjerciciosCOLOR.AsFloat := clBtnFace;
end;

end.
