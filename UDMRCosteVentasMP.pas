unit UDMRCosteVentasMP;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, Forms, DateUtils, FR_Class, Fr_HYReport, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery, DB, FIBDataSet, FIBDataSetRO,
  FR_DSet, FR_DBSet;

type
  TDMRCosteVentasMP = class(TDataModule)
     TLocal: THYTransaction;
     frListado: TfrHYReport;
     QMinArticulo: THYFIBQuery;
     QMaxArticulo: THYFIBQuery;
     xArticuloD: TFIBDataSetRO;
     xArticuloDTITULO: TFIBStringField;
     xArticuloH: TFIBDataSetRO;
     xArticuloHTITULO: TFIBStringField;
     DSArticuloD: TDataSource;
     DSArticuloH: TDataSource;
     xFamiliaH: TFIBDataSetRO;
     xFamiliaHFAMILIA: TFIBStringField;
     xFamiliaHTITULO: TFIBStringField;
     DSxFamiliaH: TDataSource;
     DSxFamiliaD: TDataSource;
     xFamiliaD: TFIBDataSetRO;
     xFamiliaDFAMILIA: TFIBStringField;
     xFamiliaDTITULO: TFIBStringField;
     xLstCosteMP_V: TFIBDataSetRO;
     frDBDSxLstCosteMP_V: TfrDBDataSet;
     DSxLstCosteMP_V: TDataSource;
     xLstCosteMP_VFECHA_FACTURA: TDateTimeField;
     xLstCosteMP_VRIG_FACTURA: TIntegerField;
     xLstCosteMP_VID_S_FAC: TIntegerField;
     xLstCosteMP_VLINEA_FAC: TIntegerField;
     xLstCosteMP_VARTICULO: TFIBStringField;
     xLstCosteMP_VTITULO: TFIBStringField;
     xLstCosteMP_VUNIDADES: TFloatField;
     xLstCosteMP_VPRECIO: TFloatField;
     xLstCosteMP_VTOTAL: TFloatField;
     xLstCosteMP_VCOSTE_MERCANCIA: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     // variables comunes para limites de impresion
     Fecha_Desde, Fecha_Hasta: TDateTime;
     Articulo_Desde, Articulo_Hasta: string;
     procedure Rangos;
     function DameMinMaxFamilia(Modo: byte): string;
     procedure CambiaArticuloD(Articulo: string);
     procedure CambiaArticuloH(Articulo: string);
     procedure CambiaFamiliaD(Familia: string);
     procedure CambiaFamiliaH(Familia: string);
     procedure MostrarListado(Modo: byte; Articulo_D, Articulo_H, Familia_D, Familia_H: string; Fecha_D, Fecha_H: TDateTime);
  end;

var
  DMRCosteVentasMP : TDMRCosteVentasMP;

implementation

uses UFormGest, UDMListados, UEntorno, UDMMain, UUtiles,
  UFPregCosteVentasMP;

{$R *.dfm}

procedure TDMRCosteVentasMP.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMRCosteVentasMP.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMRCosteVentasMP.Rangos;
var
  year, month, day, dias : word;
begin
  //Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dias := DaysInMonth(REntorno.FechaTrabSH);

  Fecha_Desde := RecodeDay(REntorno.FechaTrabSH, 1);
  Fecha_Hasta := RecodeDay(REntorno.FechaTrabSH, dias);

  with QMinArticulo do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Articulo_Desde := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxArticulo do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Articulo_Hasta := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

function TDMRCosteVentasMP.DameMinMaxFamilia(Modo: byte): string;
var
  Q : THYFIBQuery;
  Sentencia : string;
begin
  Q := THYFIBQuery.Create(nil);

  case Modo of
     0: Sentencia := 'select min(familia) as familia from art_familias where empresa=?empresa';
     1: Sentencia := 'select max(familia) as familia from art_familias where empresa=?empresa';
  end;
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := Sentencia;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['FAMILIA'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMRCosteVentasMP.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMRCosteVentasMP.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMRCosteVentasMP.CambiaFamiliaD(Familia: string);
begin
  with xFamiliaD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

procedure TDMRCosteVentasMP.CambiaFamiliaH(Familia: string);
begin
  with xFamiliaH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

procedure TDMRCosteVentasMP.MostrarListado(Modo: byte; Articulo_D, Articulo_H, Familia_D, Familia_H: string; Fecha_D, Fecha_H: TDateTime);
var
  str : string;
begin
  DMListados.Normalizar_Desde_Hasta(Articulo_D, Articulo_H);
  DMListados.Normalizar_Desde_Hasta(Familia_D, Familia_H);
  DMListados.Normalizar_Desde_Hasta(Fecha_D, Fecha_H);
  Fecha_D := HourIntoDate(Fecha_D, '00:00:00');
  Fecha_H := HourIntoDate(Fecha_H, '23:59:59');

  with xLstCosteMP_V do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['Articulo_D'].AsString := Articulo_D;
     Params.ByName['Articulo_H'].AsString := Articulo_H;
     Params.ByName['Familia_D'].AsString := Familia_D;
     Params.ByName['Familia_H'].AsString := Familia_H;
     Params.ByName['Fecha_D'].AsDateTime := Fecha_D;
     Params.ByName['Fecha_H'].AsDateTime := Fecha_H;
     Params.ByName['Tipo'].AsInteger := 1; //Escandallos en facturas
     Open;
  end;

  DMListados.Cargar(9002, '');
  frListado.LoadFromFIB(REntorno.Formato, str);
  frListado.PrepareReport;
  case Modo of
     0: frListado.ShowPreparedReport;
     1: frListado.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMRCosteVentasMP.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if Trim(ParName) = 'Comentario' then
     ParValue := FPregCosteVentasMP.EComentario.Text;
  if Trim(ParName) = 'FechaListado' then
     ParValue := FPregCosteVentasMP.TDPFechaListado.Date;
end;

end.
