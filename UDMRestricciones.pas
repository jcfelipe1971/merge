unit UDMRestricciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMRestriccion = class(TDataModule)
     QMRestriccion: TFIBTableSet;
     DSRestriccion: TDataSource;
     QMRestriccionEEC: TFIBTableSet;
     QMRestriccionEECPERFIL: TIntegerField;
     QMRestriccionEECLINEA: TIntegerField;
     DSQMRestriccionEEC: TDataSource;
     QMRestriccionEECEMPRESA: TIntegerField;
     QMRestriccionEECEJERCICIO: TIntegerField;
     QMRestriccionEECCANAL: TIntegerField;
     QMRestriccionEECSERIE: TFIBStringField;
     TLocal: THYTransaction;
     xRestriccion: TFIBDataSetRO;
     DSxRestriccion: TDataSource;
     xRestriccionTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     QMRestriccionPERFIL: TIntegerField;
     QMRestriccionTITULO: TFIBStringField;
     QMRestriccionPROTECCION: TMemoField;
     QMRestriccionPERFIL_DE_AGENTE: TIntegerField;
     QMRestriccionAGENTE: TIntegerField;
     QMRestriccionSUPERIOR: TIntegerField;
     QMRestriccionCONTABILIDAD_ANALITICA: TIntegerField;
     QMRestriccionTACTIL: TIntegerField;
     QMRestriccionULT_MODIFICACION: TDateTimeField;
     QMRestriccionPUEDE_ABRIR_FACTURA_VENTA: TIntegerField;
     procedure DMRestriccionCreate(Sender: TObject);
     procedure QMRestriccionBeforePost(DataSet: TDataSet);
     procedure QMRestriccionAfterOpen(DataSet: TDataSet);
     procedure QMRestriccionEECBeforeInsert(DataSet: TDataSet);
     procedure QMRestriccionEECEJERCICIOValidate(Sender: TField);
     procedure QMRestriccionEECCANALValidate(Sender: TField);
     procedure QMRestriccionEECNewRecord(DataSet: TDataSet);
     procedure QMRestriccionSUPERIORChange(Sender: TField);
     procedure QMRestriccionNewRecord(DataSet: TDataSet);
     procedure QMRestriccionBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     CadenaEmpresas, CadenaEjercicios, CadenaCanales: string;
     procedure BusquedaCompleja;
     procedure DameTituloRestriccion(Perfil: integer);
     procedure AsignaProteccion(Proteccion: string);
  end;

var
  DMRestriccion : TDMRestriccion;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, HYFIBQuery;

procedure TDMRestriccion.DMRestriccionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMRestriccion.Open;
end;

procedure TDMRestriccion.QMRestriccionBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'CONTA_PERFILES_USUARIO', 'PERFIL');
end;

procedure TDMRestriccion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMRestriccion, '00000');
end;

procedure TDMRestriccion.QMRestriccionAfterOpen(DataSet: TDataSet);
begin
  xRestriccion.Open;
  DameTituloRestriccion(QMRestriccionSUPERIOR.AsInteger);
  QMRestriccionEEC.Open;
end;

procedure TDMRestriccion.QMRestriccionEECBeforeInsert(DataSet: TDataSet);
begin
  if QMRestriccion.State = dsInsert then
     QMRestriccion.Post;
end;

procedure TDMRestriccion.QMRestriccionEECEJERCICIOValidate(Sender: TField);
begin
  if (Sender.AsString <> '') and (QMRestriccionEECEMPRESA.AsString = '') then
     raise Exception.Create(_('Se debe introducir una empresa para indicar un ejercicio.'));
end;

procedure TDMRestriccion.QMRestriccionEECCANALValidate(Sender: TField);
begin
  if (Sender.AsString <> '') and (QMRestriccionEECEJERCICIO.AsString = '') then
     raise Exception.Create(_('Se debe introducir un ejercicio para indicar un canal.'));
end;

procedure TDMRestriccion.QMRestriccionEECNewRecord(DataSet: TDataSet);
begin
  QMRestriccionEECPERFIL.AsInteger := QMRestriccionPERFIL.AsInteger;
end;

procedure TDMRestriccion.DameTituloRestriccion(Perfil: integer);
begin
  with xRestriccion do
  begin
     Close;
     Params.ByName['PERFIL'].AsInteger := Perfil;
     Open;
  end;
end;

procedure TDMRestriccion.QMRestriccionSUPERIORChange(Sender: TField);
begin
  DameTituloRestriccion(QMRestriccionSUPERIOR.AsInteger);
end;

procedure TDMRestriccion.QMRestriccionNewRecord(DataSet: TDataSet);
begin
  QMRestriccionSUPERIOR.AsInteger := -1;
  QMRestriccionTACTIL.AsInteger := 0;
  QMRestriccionPUEDE_ABRIR_FACTURA_VENTA.AsInteger := 1;
end;

procedure TDMRestriccion.QMRestriccionBeforeClose(DataSet: TDataSet);
begin
  xRestriccion.Close;
  QMRestriccionEEC.Close;
end;

procedure TDMRestriccion.AsignaProteccion(Proteccion: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_USUARIOS_PERFIL SET PROTECCION = :PROTECCION WHERE PERFIL = :PERFIL';
        Params.ByName['PROTECCION'].AsString := Proteccion;
        Params.ByName['PERFIL'].AsInteger := QMRestriccionPERFIL.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMRestriccion.Refresh;
end;

end.
