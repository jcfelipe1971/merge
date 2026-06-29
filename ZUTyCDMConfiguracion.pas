unit ZUTyCDMConfiguracion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TZTyCDMConfiguracion = class(TDataModule)
     TLocal: THYTransaction;
     DSQMTyCConfig: TDataSource;
     QMTyCConfig: TFIBTableSet;
     QMTyCConfigEMPRESA: TIntegerField;
     QMTyCConfigLISTADO_PED_ESPECIALES: TIntegerField;
     QMTyCConfigSERVIR_PEDIDOS: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZTyCDMConfiguracion : TZTyCDMConfiguracion;

implementation

uses UEntorno, UDMMain;

{$R *.dfm}

procedure TZTyCDMConfiguracion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMTyCConfig, '10000');
end;

end.
