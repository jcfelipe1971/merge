unit UDMExportacionHelios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, FIBDataSet, UFIBModificados, DB,
  FIBDataSetRO;

type
  TDMExportacionHelios = class(TDataModule)
     SPStockAlmacen: TFIBDataSetRO;
     DSSPStockAlmacen: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     SPStockAlmacenID_A: TIntegerField;
     SPStockAlmacenARTICULO: TFIBStringField;
     SPStockAlmacenCODIGO_AS400: TFIBStringField;
     SPStockAlmacenCODIGO_PROVEEDOR: TFIBStringField;
     SPStockAlmacenTITULO: TFIBStringField;
     SPStockAlmacenEXISTENCIAS: TFloatField;
     SPStockAlmacenUNIDAD: TFIBStringField;
     SPStockAlmacenID_LOTE: TIntegerField;
     SPStockAlmacenLOTE: TFIBStringField;
     SPStockAlmacenCANTIDAD: TFloatField;
     SPStockAlmacenFECHA_FABRICACION: TDateTimeField;
     SPStockAlmacenFECHA_CADUCIDAD: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Calcular(Almacen: string; Proveedor: integer; Fecha: TDateTime; DesdeArticulo, HastaArticulo: string);
     procedure Exportar(Fichero: string);
  end;

var
  DMExportacionHelios : TDMExportacionHelios;

implementation

uses UDMMain, UEntorno, Dialogs, DateUtils, UUtiles, UHojaCalc;

{$R *.dfm}

procedure TDMExportacionHelios.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMExportacionHelios.Calcular(Almacen: string; Proveedor: integer; Fecha: TDateTime; DesdeArticulo, HastaArticulo: string);
begin
  with SPStockAlmacen do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := 'SELECT * FROM A_ART_EXPORTACION_HELIOS(:ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, :ALMACEN, :ART_INI, :ART_FIN, :FECHA, :PROVEEDOR)';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['ART_INI'].AsString := DesdeArticulo;
     Params.ByName['ART_FIN'].AsString := HastaArticulo;
     Params.ByName['FECHA'].AsDateTime := RecodeTime(Fecha, 23, 59, 59, 999);
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMExportacionHelios.Exportar(Fichero: string);
var
  HCalc : THojaCalc;
  f : integer;
begin
  HCalc := THojaCalc.Create(thcOpenOffice, False); //OpenOffice doc if possible, please
  {
  if (UpperCase(ExtractFileExt(Fichero)) = '.ODS') then
     HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
  else
     HCalc := THojaCalc.Create(thcExcel, False);
  }

  try
     HCalc.FileName := Fichero; //Needs a file name before you SaveDoc!

     f := 1;
     HCalc.CellText[f, 1] := 'Centro';
     HCalc.CellText[f, 2] := 'Almacen';
     HCalc.CellText[f, 3] := 'Codigo AS400';
     HCalc.CellText[f, 4] := 'Num. Mat. SAP';
     HCalc.CellText[f, 5] := 'Denominacion';
     HCalc.CellText[f, 6] := 'Cantidad';
     HCalc.CellText[f, 7] := 'Unidad';
     HCalc.CellText[f, 8] := 'Lote';
     HCalc.CellText[f, 9] := 'Fec. Produccion';
     HCalc.CellText[f, 10] := 'Fec. Caducidad';

     with SPStockAlmacen do
     begin
        First;

        while not EOF do
        begin
           Inc(f);

           HCalc.CellText[f, 1] := '';
           HCalc.CellText[f, 2] := '';
           HCalc.CellText[f, 3] := FieldByName('CODIGO_AS400').AsString;
           HCalc.CellText[f, 4] := '';
           HCalc.CellText[f, 5] := FieldByName('TITULO').AsString;
           HCalc.SendNumber(f, 6, FieldByName('CANTIDAD').AsFloat);
           HCalc.CellText[f, 7] := FieldByName('UNIDAD').AsString;
           HCalc.CellText[f, 8] := FieldByName('LOTE').AsString;
           HCalc.CellText[f, 9] := '';
           if (HCalc.IsOpenOffice) then
              HCalc.CellText[f, 10] := DateToStr(FieldByName('FECHA_CADUCIDAD').AsDateTime)
           else
              HCalc.CellText[f, 10] := Trim(FormatDateTime('MM/DD/YYYY', FieldByName('FECHA_CADUCIDAD').AsDateTime));

           Next;
           // Application.ProcessMessages;
        end;
     end;

     // Descripcion y lote ajustados
     HCalc.AutoFit(5);
     HCalc.AutoFit(8);

     HCalc.SaveDocAs(Fichero, (Pos('.XLS', UpperCase(ExtractFileExt(Fichero))) > 0));
  finally
     Sleep(1000);
     HCalc.Free;
  end;
end;

end.
