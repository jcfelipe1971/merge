unit UDMSysGestiones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMSysGestiones = class(TDataModule)
     QMGestiones: TFIBTableSet;
     DSGestiones: TDataSource;
     TLocal: THYTransaction;
     xPgC: TFIBDataSetRO;
     DSxPgC: TDataSource;
     xPgCPAIS: TFIBStringField;
     xPgCPGC: TIntegerField;
     xPgCTITULO: TFIBStringField;
     xPgCDEFECTO: TIntegerField;
     TUpdate: THYTransaction;
     QMGestionesPAIS: TFIBStringField;
     QMGestionesGESTION: TIntegerField;
     QMGestionesTITULO: TFIBStringField;
     QMGestionesPGC: TIntegerField;
     procedure DMSysCuentasCreate(Sender: TObject);
     procedure QMGestionesNewRecord(DataSet: TDataSet);
     procedure xPgCAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMSysGestiones : TDMSysGestiones;

implementation

uses UDMMain, uFBusca;

{$R *.DFM}

procedure TDMSysGestiones.DMSysCuentasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xPgC.Open;
end;

procedure TDMSysGestiones.BusquedaCompleja;
var
  Orden : string;
begin
  with QMGestiones do
  begin
     DisableControls;
     Close;
     Orden := OrdenadoPor;
     Ordenar('');
     TFBusca.Create(Self).SeleccionaBusqueda(QMGestiones, '00000', False);
     if Pos('WHERE', UpperCase(SelectSQL.Text)) <> 0 then
        SelectSQL.Add('AND')
     else
        SelectSQL.Add('WHERE');
     SelectSQL.Add('PGC=?PGC');
     Params.ByName['PGC'].AsString := xPgCPGC.AsString;
     Ordenar(Orden);
     Open;
     EnableControls;
  end;
end;

procedure TDMSysGestiones.QMGestionesNewRecord(DataSet: TDataSet);
begin
  QMGestionesPGC.AsInteger := xPGCPGC.AsInteger;
  QMGestionesPAIS.AsString := xPGCPAIS.AsString;
end;

procedure TDMSysGestiones.xPgCAfterOpen(DataSet: TDataSet);
begin
  QMGestiones.Close;
  QMGestiones.Open;
end;

procedure TDMSysGestiones.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

end.
