unit UDMAsistenteEmpresa;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, ImgList, Controls, FIBQuery, HYFIBQuery, Graphics, jpeg,
  GIFImage, FIBTableDataSet;

type
  TDMAsistenteEmpresa = class(TDataModule)
     TLocal: THYTransaction;
     xTerceros: TFIBDataSetRO;
     xMoneda: TFIBDataSetRO;
     xModosIVA: TFIBDataSetRO;
     DSxModosIVA: TDataSource;
     DSxMoneda: TDataSource;
     DSxTerceros: TDataSource;
     QTreeEmpresas: TFIBQuery;
     QTreeEjercicios: TFIBQuery;
     QTreeSeries: TFIBQuery;
     QTreeCanales: TFIBQuery;
     xDatosEmpresa: TFIBDataSetRO;
     DSxDatosEmpresa: TDataSource;
     xDatosEmpresaEMPRESA: TIntegerField;
     xDatosEmpresaTITULO: TFIBStringField;
     xDatosEmpresaTERCERO: TIntegerField;
     xDatosEmpresaFECHA_ALTA: TDateTimeField;
     xDatosEmpresaAPERTURA: TDateTimeField;
     xDatosEmpresaDURACION: TIntegerField;
     xDatosEmpresaMONEDA: TFIBStringField;
     xDatosEmpresaABIERTA: TIntegerField;
     xDatosEmpresaMODO_IVA: TIntegerField;
     xDatosEmpresaIMPRIME_CABECERA: TIntegerField;
     xDatosEmpresaCLIENTE_AUT: TIntegerField;
     xDatosEmpresaPMP_CERO: TIntegerField;
     xDatosEmpresaFECHA_CONTABILIZACION_COMPRAS: TIntegerField;
     xDatosEmpresaCIERRE_CONTABLE: TIntegerField;
     xDatosEmpresaFECHA_VENTAS: TIntegerField;
     xDatosEmpresaLISTAR_PEDIDOS: TIntegerField;
     xDatosEmpresaSERIE_AUTOFAC: TFIBStringField;
     SPEmpAjusta: THYFIBQuery;
     SPActEmpresa: THYFIBQuery;
     QMinSerie: THYFIBQuery;
     DSQMCreaEmpresa: TDataSource;
     SPCreaNiveles: THYFIBQuery;
     QEjerCan: THYFIBQuery;
     SPAltas: THYFIBQuery;
     SPAltas2: THYFIBQuery;
     SPNivCont: THYFIBQuery;
     QCopiaCanalSerie: THYFIBQuery;
     QPropaga: THYFIBQuery;
     QCopiaCreaNiveles: THYFIBQuery;
     QCopiaCreaEstructura: THYFIBQuery;
     QCopiaGenericos: THYFIBQuery;
     ILDefecto: TImageList;
     xDatosEmpresaE_IMAGEN: TIntegerField;
     xDatosEmpresaCIERRA_DOC_CERO: TIntegerField;
     xDatosEmpresaREG_MERCANTIL: TBlobField;
     xDatosEmpresaE_MAIL: TFIBStringField;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     TUpdate: THYTransaction;
     QMCreaEmpresa: TFIBTableSet;
     QMCreaEmpresaEMPRESA: TIntegerField;
     QMCreaEmpresaTITULO: TFIBStringField;
     QMCreaEmpresaTERCERO: TIntegerField;
     QMCreaEmpresaFECHA_ALTA: TDateTimeField;
     QMCreaEmpresaAPERTURA: TDateTimeField;
     QMCreaEmpresaDURACION: TIntegerField;
     QMCreaEmpresaMONEDA: TFIBStringField;
     QMCreaEmpresaABIERTA: TIntegerField;
     QMCreaEmpresaMODO_IVA: TIntegerField;
     QMCreaEmpresaIMPRIME_CABECERA: TIntegerField;
     QMCreaEmpresaCLIENTE_AUT: TIntegerField;
     QMCreaEmpresaPMP_CERO: TIntegerField;
     QMCreaEmpresaFECHA_CONTABILIZACION_COMPRAS: TIntegerField;
     QMCreaEmpresaCIERRE_CONTABLE: TIntegerField;
     QMCreaEmpresaFECHA_VENTAS: TIntegerField;
     QMCreaEmpresaLISTAR_PEDIDOS: TIntegerField;
     QMCreaEmpresaSERIE_AUTOFAC: TFIBStringField;
     QMCreaEmpresaE_IMAGEN: TIntegerField;
     QMCreaEmpresaCIERRA_DOC_CERO: TIntegerField;
     QMCreaEmpresaREG_MERCANTIL: TBlobField;
     QMCreaEmpresaE_MAIL: TFIBStringField;
     QMCreaEmpresaSERIALIZADO_AUTO: TIntegerField;
     QMCreaEmpresaMOV_STOCK_ANULA_VENTAS: TIntegerField;
     QMCreaEmpresaMOV_STOCK_ANULA_COMPRAS: TIntegerField;
     QMCreaEmpresaPORTES_VENTAS: TIntegerField;
     QMCreaEmpresaPORTES_COMPRAS: TIntegerField;
     QMCreaEmpresaSEPARAR_APUNTES_REMESAS: TIntegerField;
     QMCreaEmpresaSEPARAR_PEDIDOS_RECEPCION: TIntegerField;
     QMCreaEmpresaCONTROL_STOCK_NEG: TIntegerField;
     QMCreaEmpresaCONTROL_ASIENTO_NEG: TIntegerField;
     xDatosEmpresaPROVEEDOR_AUT: TIntegerField;
     xDatosEmpresaACREEDOR_AUT: TIntegerField;
     QMCreaEmpresaPROVEEDOR_AUT: TIntegerField;
     QMCreaEmpresaACREEDOR_AUT: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraTercero(Tercero: integer);
     procedure FiltraMoneda(Moneda: string);
     procedure FiltraModoIVA(Modo: integer);
     procedure DameEjerCanal(Empresa: smallint; var Ejercicio, Canal: smallint);
     procedure GrabaNivelesContables(Empresa, Ejercicio, Canal, Nivel, Digitos: smallint);
     procedure CreaEstructuraContable(Empresa, Ejercicio, Canal, Nivel, Digitos: smallint);
     procedure CopiaCanalSerie(Origen, Destino: smallint);
     procedure Propaga(Empresa: smallint);
     procedure CopiaCreaNiveles(Origen, Destino, Ejercicio: smallint);
     procedure CopiaCreaEstructura(Empresa: smallint);
     procedure CopiaGenericos(Origen, Destino: smallint);
     procedure FiltraSerieAut(Serie: string);
  end;

var
  DMAsistenteEmpresa : TDMAsistenteEmpresa;

implementation

uses UDMMain, UEntorno, UFMAsistenteEmpresa;

{$R *.dfm}

procedure TDMAsistenteEmpresa.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMAsistenteEmpresa.FiltraTercero(Tercero: integer);
begin
  with xTerceros do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
end;

procedure TDMAsistenteEmpresa.FiltraMoneda(Moneda: string);
begin
  with xMoneda do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

procedure TDMAsistenteEmpresa.FiltraModoIVA(Modo: integer);
begin
  with xModosIVA do
  begin
     Close;
     Params.ByName['MODO_IVA'].AsInteger := Modo;
     Open;
  end;
end;

procedure TDMAsistenteEmpresa.DameEjerCanal(Empresa: smallint; var Ejercicio, Canal: smallint);
begin
  with QEjerCan do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     ExecQuery;
     Ejercicio := FieldByName['EJERCICIO'].AsInteger;
     Canal := FieldByName['CANAL'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMAsistenteEmpresa.GrabaNivelesContables(Empresa, Ejercicio, Canal, Nivel, Digitos: smallint);
var
  x : integer;
begin
  for x := 1 to Nivel do
  begin
     with SPCreaNiveles do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['NIVEL'].AsInteger := x;
        if x <> Nivel then
           Params.ByName['DIGITOS'].AsInteger := 1
        else
           Params.ByName['DIGITOS'].AsInteger := Digitos - 4;
        ExecQuery;
        FreeHandle;
     end;
  end;

  with SPNivCont do
  begin
     Params.ByName['Empresa'].AsInteger := Empresa;
     Params.ByName['Ejercicio'].AsInteger := Ejercicio;
     Params.ByName['Canal'].AsInteger := Canal;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteEmpresa.CreaEstructuraContable(Empresa, Ejercicio, Canal, Nivel, Digitos: smallint);
var
  c, s : string[11];
begin
  with SPAltas do
  begin
     Params.ByName['Empresa'].AsInteger := Empresa;
     Params.ByName['Ejercicio'].AsInteger := Ejercicio;
     Params.ByName['Canal'].AsInteger := Canal;
     ExecQuery;
     FreeHandle;
  end;

  c := '00000000000';
  with SPAltas2 do
  begin
     s := Copy(c, 0, Digitos - 4);
     Params.ByName['Empresa'].AsInteger := Empresa;
     Params.ByName['Ejercicio'].AsInteger := Ejercicio;
     Params.ByName['Canal'].AsInteger := Canal;
     Params.ByName['Nivel'].AsInteger := Nivel;
     Params.ByName['Cadena'].AsString := s;
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteEmpresa.CopiaCanalSerie(Origen, Destino: smallint);
begin
  with QCopiaCanalSerie do
  begin
     Close;
     Params.ByName['ORIGEN'].AsInteger := Origen;
     Params.ByName['DESTINO'].AsInteger := Destino;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteEmpresa.Propaga(Empresa: smallint);
begin
  with QPropaga do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteEmpresa.CopiaCreaNiveles(Origen, Destino, Ejercicio: smallint);
begin
  with QCopiaCreaNiveles do
  begin
     Close;
     Params.ByName['ORIGEN'].AsInteger := Origen;
     Params.ByName['DESTINO'].AsInteger := Destino;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteEmpresa.CopiaCreaEstructura(Empresa: smallint);
begin
  with QCopiaCreaEstructura do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteEmpresa.CopiaGenericos(Origen, Destino: smallint);
begin
  with QCopiaGenericos do
  begin
     Close;
     Params.ByName['ORIGEN'].AsInteger := Origen;
     Params.ByName['DESTINO'].AsInteger := Destino;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteEmpresa.FiltraSerieAut(Serie: string);
begin
  with xSeries do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

end.
