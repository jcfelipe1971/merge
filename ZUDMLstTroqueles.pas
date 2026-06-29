unit ZUDMLstTroqueles;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBDataSet, FIBQuery,
  HYFIBQuery, FIBTableDataSet, UFormGest, ExtCtrls, jpeg;

type
  TZDMLstTroqueles = class(TDataModule)
     TLocal: THYTransaction;
     xTroquel: TFIBDataSetRO;
     DSxTroquel: TDataSource;
     xTroquelTROQUEL: TIntegerField;
     xTroquelANCHO: TIntegerField;
     xTroquelAVANCE: TIntegerField;
     xTroquelCILINDRO: TFIBStringField;
     xTroquelOBSERVACIONES: TBlobField;
     xTroquelTIPO_AUX: TFIBStringField;
     xTroquelPOS_ANCHO: TIntegerField;
     xTroquelPOS_AVANCE: TIntegerField;
     frListadoE: TfrHYReport;
     frDBListadoE: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(Modo, Grupo: integer; Troquel: string);
  end;

var
  ZDMLstTroqueles : TZDMLstTroqueles;

implementation

uses UDMListados, UEntorno;

{$R *.dfm}

procedure TZDMLstTroqueles.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMLstTroqueles.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLstTroqueles.MostrarListado(Modo, Grupo: integer; Troquel: string);
begin
  xTroquel.Close;
  xTroquel.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xTroquel.Params.ByName['TROQUEL'].AsString := Troquel;
  xTroquel.Open;

  // ***************************************************************************
  // Por alguna razon carga directamente el listado y no el listado por defecto del grupo
  // El grupo, aparentemente, es el 9900
  // Duilio - 15/03/2022
  // ***************************************************************************
  DMListados.Imprimir(Grupo, Modo, '', '10062', frListadoE, nil); // Listado del escandallo
  // DMListados.Imprimir(9000,1, '10062', str, frListadoTroquel, nil);
end;

end.
