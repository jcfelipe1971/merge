unit UDMInfoTercero;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO;

type
  TDMInfoTercero = class(TDataModule)
     xTercero: TFIBDataSetRO;
     DSxTercero: TDataSource;
     xTituloRazon: TFIBDataSetRO;
     DSxTituloRazon: TDataSource;
     xDireccionPrincipal: TFIBDataSetRO;
     DSxDireccionPrincipal: TDataSource;
     xDireccionPrincipalTERCERO: TIntegerField;
     xDireccionPrincipalDIRECCION: TIntegerField;
     xDireccionPrincipalDIR_NOMBRE: TFIBStringField;
     xDireccionPrincipalDIR_BLOQUE_ESCALERA: TFIBStringField;
     xDireccionPrincipalDIR_PISO: TFIBStringField;
     xDireccionPrincipalCOMPOSICION: TStringField;
     xLocalidad: TFIBDataSetRO;
     DSxLocalidad: TDataSource;
     xBancos: TFIBDataSetRO;
     DSxBancos: TDataSource;
     xContactos: TFIBDataSetRO;
     DSxContactos: TDataSource;
     xDirecciones: TFIBDataSetRO;
     DSxDirecciones: TDataSource;
     xDireccionPrincipalDIR_LOCALIDAD: TFIBStringField;
     xDireccionPrincipalDIR_TIPO: TFIBStringField;
     xDireccionPrincipalDIR_PUERTA: TFIBStringField;
     TLocal: THYTransaction;
     xDireccionPrincipalDIR_NOMBRE_2: TFIBStringField;
     xTipDir_T: TFIBDataSetRO;
     DSxTipDir_T: TDataSource;
     xDireccionPrincipalDIR_NUMERO: TFIBStringField;
     xDireccionPrincipalDIR_COMPLETA: TFIBStringField;
     xClasDir_T: TFIBDataSetRO;
     DSxClasDir_T: TDataSource;
     xDireccionPrincipalDIR_CLASE: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMInfoTerceroCreate(Sender: TObject);
     procedure xDireccionPrincipalDIR_TIPOChange(Sender: TField);
     procedure xDireccionPrincipalDIR_CLASEChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure SeleccionaTercero(tercero: integer);
  end;

var
  DMInfoTercero : TDMInfoTercero;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMInfoTercero.DMInfoTerceroCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMInfoTercero.SeleccionaTercero(tercero: integer);
begin
  with xTercero do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := tercero;
     Open;
  end;

  // Se abre el resto de tablas pues se han cerrado al cerrar la
  // 'master'
  xTituloRazon.Open;
  xDireccionPrincipal.Open;
  xLocalidad.Open;
  xBancos.Open;
  xContactos.Open;
  xDirecciones.Open;
  xTipDir_T.Open;
  xClasDir_T.Open;
end;

procedure TDMInfoTercero.xDireccionPrincipalDIR_TIPOChange(Sender: TField);
begin
  with xTipDir_T do
  begin
     Close;
     Params.ByName['DIR_TIPO'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMInfoTercero.xDireccionPrincipalDIR_CLASEChange(Sender: TField);
begin
  with xClasDir_T do
  begin
     Close;
     Params.ByName['DIR_CLASE'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

end.
