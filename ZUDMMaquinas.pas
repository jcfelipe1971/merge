unit ZUDMMaquinas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TZDMMaquinas = class(TDataModule)
     TLocal: THYTransaction;
     QMMaquinas: TFIBTableSet;
     DSQMMaquinas: TDataSource;
     QMMaquinasMAQUINA: TFIBStringField;
     QMMaquinasDESCRIPCION: TFIBStringField;
     QMMaquinasACTIVO: TIntegerField;
     QMMaquinasEMPRESA: TIntegerField;
     QMMaquinasTIPO_MAQUINA: TFIBStringField;
     TUpdate: THYTransaction;
     QMMaquinasDESC_TIPO_MAQUINA: TStringField;
     procedure ZDMMaquinasCreate(Sender: TObject);
     procedure ZDMMaquinasDestroy(Sender: TObject);
     procedure QMMaquinasNewRecord(DataSet: TDataSet);
     procedure QMMaquinasDESC_TIPO_MAQUINAGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ZDMMaquinas : TZDMMaquinas;

implementation

{$R *.DFM}

uses UDMMain, uFBusca, UEntorno;

procedure TZDMMaquinas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMaquinas, '10000');
end;

procedure TZDMMaquinas.ZDMMaquinasCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Apertura de tablas
  DMMain.FiltraTabla(QMMaquinas, '10000', True);
  // Máscaras
end;

procedure TZDMMaquinas.ZDMMaquinasDestroy(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TZDMMaquinas.QMMaquinasNewRecord(DataSet: TDataSet);
begin
  QMMaquinasEMPRESA.AsInteger := REntorno.Empresa;
  QMMaquinasMAQUINA.AsString := '';
  QMMaquinasDESCRIPCION.AsString := '';
  QMMaquinasACTIVO.AsInteger := 1;
end;

procedure TZDMMaquinas.QMMaquinasDESC_TIPO_MAQUINAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMMaquinasTIPO_MAQUINA.AsString = 'N') then
     Text := _('Máquina Normal');
  if (QMMaquinasTIPO_MAQUINA.AsString = 'R') then
     Text := _('Máquina Reimpresión');
  if (QMMaquinasTIPO_MAQUINA.AsString = 'E') then
     Text := _('Máquina Estampación');
  if (QMMaquinasTIPO_MAQUINA.AsString = 'V') then
     Text := _('Máquina Verificación');
end;

end.
