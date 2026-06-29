unit UIsoDMCapacitacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_Class,
  Fr_HYReport, FIBQuery, HYFIBQuery;

type
  TIsoDMCapacitacion = class(TDataModule)
     QMIsoCapacitacionC: TFIBTableSet;
     DSQMIsoCapacitacionC: TDataSource;
     TLocal: THYTransaction;
     QMIsoCapacitacionCEMPLEADO: TIntegerField;
     QMIsoCapacitacionCSECCION: TFIBStringField;
     QMIsoCapacitacionCCAPACITACION: TFloatField;
     QMIsoCapacitacionCTOTAL_REAL: TIntegerField;
     QMIsoCapacitacionCTOTAL_POSIBLE: TIntegerField;
     QMIsoCapacitacionCEMPRESA: TIntegerField;
     xEmpleado: TFIBTableSet;
     DSxEmpleado: TDataSource;
     xEmpleadoEMPLEADO: TIntegerField;
     xEmpleadoTERCERO: TIntegerField;
     xEmpleadoTITULO: TFIBStringField;
     xEmpleadoNIF: TFIBStringField;
     QMIsoCapacitacionD: TFIBTableSet;
     DSQMIsoCapacitacionD: TDataSource;
     QMIsoCapacitacionDCAPACITACION: TIntegerField;
     QMIsoCapacitacionDTAREA: TIntegerField;
     QMIsoCapacitacionDEMPRESA: TIntegerField;
     QMIsoCapacitacionDSECCION: TFIBStringField;
     QMIsoCapacitacionDEMPLEADO: TIntegerField;
     xSeccion: TFIBTableSet;
     DSxSeccion: TDataSource;
     xSeccionEMPRESA: TIntegerField;
     xSeccionSECCION: TFIBStringField;
     xSeccionDESCRIPCION: TFIBStringField;
     QMIsoCapacitacionDDescTarea: TStringField;
     xTarea: TFIBTableSet;
     DSxTarea: TDataSource;
     xTareaSECCION: TFIBStringField;
     xTareaEMPRESA: TIntegerField;
     xTareaLINEA: TIntegerField;
     xTareaDESCRIPCION: TFIBStringField;
     frIsoCapacitacion: TfrHYReport;
     procedure DMIsoCapacitacionCreate(Sender: TObject);
     procedure QMIsoCapacitacionCEMPLEADOChange(Sender: TField);
     procedure QMIsoCapacitacionCAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMIsoCapacitacionCSECCIONChange(Sender: TField);
     procedure QMIsoCapacitacionDNewRecord(DataSet: TDataSet);
     procedure QMIsoCapacitacionDTAREAChange(Sender: TField);
     procedure QMIsoCapacitacionCNewRecord(DataSet: TDataSet);
     procedure QMIsoCapacitacionDDescTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure frIsoCapacitacionGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMCapacitacion : TIsoDMCapacitacion;

implementation

{$R *.DFM}

uses UIsoFMCapacitacion, UDMMain, UEntorno, UUtiles, uFBusca, URecursos;

procedure TIsoDMCapacitacion.DMIsoCapacitacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMisoCapacitacionC, '00000', True);
end;

procedure TIsoDMCapacitacion.QMIsoCapacitacionCEMPLEADOChange(Sender: TField);
begin
  with xEmpleado do
  begin
     Close;
     Params.ByName['empleado'].AsInteger := Sender.AsInteger;
     Open;
     xEmpleadoTITULO.AsString;
  end;
end;

procedure TIsoDMCapacitacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMIsoCapacitacionC, '10000');
end;

procedure TIsoDMCapacitacion.QMIsoCapacitacionCAfterOpen(DataSet: TDataSet);
begin
  QMIsoCapacitacionD.Open;
  xEmpleado.Open;
  xSeccion.Open;
end;

procedure TIsoDMCapacitacion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  IsoFMCapacitacion.NavMain.BtnClick(nbRefresh);
end;

procedure TIsoDMCapacitacion.QMIsoCapacitacionCSECCIONChange(Sender: TField);
begin
  with xSeccion do
  begin
     Close;
     // SelectSQL.Clear;
     // SelectSQL.Add('SELECT * FROM Z_EMP_SECCIONES where seccion LIKE ''' + Sender.AsString + '%''');
     // SelectSQL.Add(' and empresa= ' + REntorno.EmpresaStr);
     Params.ByName['seccion'].AsString := Sender.AsString;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TIsoDMCapacitacion.QMIsoCapacitacionDNewRecord(DataSet: TDataSet);
begin
  if ((QMIsoCapacitacionC.State = dsInsert) or (QMIsoCapacitacionC.State = dsEdit)) then
  begin
     QMIsoCapacitacionC.Post;
     IsoFMCapacitacion.NavMain.BtnClick(nbRefresh);
     QMIsoCapacitacionD.Edit;
  end;

  QMIsoCapacitacionDEMPRESA.AsInteger := REntorno.Empresa;
  QMIsoCapacitacionDEMPLEADO.AsInteger := QMIsoCapacitacionCEMPLEADO.AsInteger;
  QMIsoCapacitacionDSECCION.AsString := QMIsoCapacitacionCSECCION.AsString;
end;

procedure TIsoDMCapacitacion.QMIsoCapacitacionDTAREAChange(Sender: TField);
begin
  with xTarea do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['seccion'].AsString := QMIsoCapacitacionCSECCION.AsString;
     Params.ByName['tarea'].AsInteger := Sender.AsInteger;
     Open;
     QMIsoCapacitacionDDescTarea.AsString := xTareaDESCRIPCION.AsString;
  end;
end;

procedure TIsoDMCapacitacion.QMIsoCapacitacionCNewRecord(DataSet: TDataSet);
begin
  QMIsoCapacitacionCEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TIsoDMCapacitacion.QMIsoCapacitacionDDescTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTarea do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['seccion'].AsString := QMIsoCapacitacionCSECCION.AsString;
     Params.ByName['tarea'].AsInteger := QMIsoCapacitacionDTAREA.AsInteger;
     Open;
     Text := xTareaDESCRIPCION.AsString;
  end;
end;

procedure TIsoDMCapacitacion.frIsoCapacitacionGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;
end;

end.
