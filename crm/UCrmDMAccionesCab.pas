unit UCrmDMAccionesCab;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TCrmDMAccionesCab = class(TDataModule)
     TLocal: THYTransaction;
     QMAccionesCab: TFIBTableSet;
     DSQMAccionesCab: TDataSource;
     TUpdate: THYTransaction;
     QMAccionesCabID: TIntegerField;
     QMAccionesCabTIPO_ACCION: TFIBStringField;
     QMAccionesCabFECHA_ACCION: TDateTimeField;
     QMAccionesCabDESCRIPCION_ACCION: TFIBStringField;
     QMAccionesCabNOTAS: TBlobField;
     QMAccionesCabNUMERO_CONTACTOS: TIntegerField;
     QMAccionesCabFECHA_PREVISTA_CIERRE: TDateTimeField;
     QMAccionesCabFECHA_CIERRE_REAL: TDateTimeField;
     QMAccionesCabCOMENTARIO_CIERRE: TMemoField;
     QMAccionesCabESTADO: TIntegerField;
     QMAccionesCabEMPRESA: TIntegerField;
     QMAccionesCabPROYECTO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAccionesCabNewRecord(DataSet: TDataSet);
     procedure QMAccionesCabPROYECTOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure NuevaAccion(Proyecto: integer; Descripcion: string);
  end;

var
  CrmDMAccionesCab : TCrmDMAccionesCab;

implementation

uses UFBusca, UDMMain, UEntorno, DateUtils;

{$R *.DFM}

procedure TCrmDMAccionesCab.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMAccionesCab.Open;
end;

procedure TCrmDMAccionesCab.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMAccionesCab, '00000');
end;

procedure TCrmDMAccionesCab.QMAccionesCabNewRecord(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMAccionesCab, 'crm_id_acciones_cab', 'ID');
end;

procedure TCrmDMAccionesCab.QMAccionesCabPROYECTOChange(Sender: TField);
begin
  if (QMAccionesCabPROYECTO.AsInteger <> 0) then
     QMAccionesCabEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TCrmDMAccionesCab.NuevaAccion(Proyecto: integer; Descripcion: string);
begin
  QMAccionesCab.Insert;
  QMAccionesCabPROYECTO.AsInteger := Proyecto;
  QMAccionesCabDESCRIPCION_ACCION.AsString := Copy(Descripcion, 1, 60);
  QMAccionesCabFECHA_ACCION.AsDateTime := Today;
end;

end.
