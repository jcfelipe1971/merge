unit ZUDMTiposConfig;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TZDMTiposConfig = class(TDataModule)
     QMConfig: TFIBTableSet;
     QMConfigDefecto: TFIBTableSet;
     QMConfigDet: TFIBTableSet;
     QMConfigDetDatos: TFIBTableSet;
     DSQMConfig: TDataSource;
     DSQMConfigDefecto: TDataSource;
     DSQMConfigDet: TDataSource;
     DSQMConfigDetDatos: TDataSource;
     TLocal: THYTransaction;
     QMConfigTIPO: TIntegerField;
     QMConfigDESCRIPCION: TFIBStringField;
     QMConfigDefectoTIPO: TIntegerField;
     QMConfigDefectoCAMPO: TFIBStringField;
     QMConfigDefectoVISIBLE: TIntegerField;
     QMConfigDefectoORDEN: TIntegerField;
     QMConfigDetTIPO: TIntegerField;
     QMConfigDetSUBTIPO: TIntegerField;
     QMConfigDetDESCRIPCION: TFIBStringField;
     QMConfigDetDatosTIPO: TIntegerField;
     QMConfigDetDatosSUBTIPO: TIntegerField;
     QMConfigDetDatosCAMPO: TFIBStringField;
     QMConfigDetDatosVISIBLE: TIntegerField;
     QMConfigDetDatosORDEN: TIntegerField;
     QMConfigDefectoSUBTIPO: TIntegerField;
     TUpdate: THYTransaction;
     QMConfigDetDatosHABILITADO: TIntegerField;
     QMConfigDetDatosCAMPO_CALCULADO: TIntegerField;
     QMConfigDetDatosVALOR_DEFECTO: TFIBStringField;
     QMConfigDefectoHABILITADO: TIntegerField;
     QMConfigDefectoCAMPO_CALCULADO: TIntegerField;
     QMConfigDefectoVALOR_DEFECTO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMConfigAfterOpen(DataSet: TDataSet);
     procedure QMConfigDetAfterOpen(DataSet: TDataSet);
     procedure QMConfigDetNewRecord(DataSet: TDataSet);
     procedure QMConfigDefectoAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZDMTiposConfig : TZDMTiposConfig;

implementation

uses UDMMain;

{$R *.dfm}

procedure TZDMTiposConfig.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMConfig.Open;
end;

procedure TZDMTiposConfig.QMConfigAfterOpen(DataSet: TDataSet);
begin
  QMConfigDefecto.Open;
  QMConfigDet.Open;
end;

procedure TZDMTiposConfig.QMConfigDetAfterOpen(DataSet: TDataSet);
begin
  QMConfigDetDatos.Open;
end;

procedure TZDMTiposConfig.QMConfigDetNewRecord(DataSet: TDataSet);
begin
  QMConfigDetTIPO.AsInteger := QMConfigTIPO.AsInteger;
end;

procedure TZDMTiposConfig.QMConfigDefectoAfterPost(DataSet: TDataSet);
begin
  QMConfigDet.Refresh;
end;

end.
