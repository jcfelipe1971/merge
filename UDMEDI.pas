unit UDMEDI;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FIBDatabase, UFIBModificados,
  DB, Dialogs, FIBDataSet, FIBTableDataSet, UFormGest,
  Barras, Forms, Controls;

type
  TDMEDI = class(TDataModule)
     TLocal: THYTransaction;
     QEDIPedCab: THYFIBQuery;
     QEDIPedCabNotas: THYFIBQuery;
     QPedDet: THYFIBQuery;
     QPedDetNotas: THYFIBQuery;
     xEDIPedCab: TFIBDataSet;
     DSxEDIPedCab: TDataSource;
     DSxAlbAProcesar: TDataSource;
     xAlbAProcesar: TFIBTableSet;
     xAlbAProcesarEMPRESA: TIntegerField;
     xAlbAProcesarEJERCICIO: TIntegerField;
     xAlbAProcesarCANAL: TIntegerField;
     xAlbAProcesarSERIE: TFIBStringField;
     xAlbAProcesarTIPO: TFIBStringField;
     xAlbAProcesarRIG: TIntegerField;
     xAlbAProcesarALMACEN: TFIBStringField;
     xAlbAProcesarFECHA: TDateTimeField;
     xAlbAProcesarCLIENTE: TIntegerField;
     xAlbAProcesarSU_REFERENCIA: TFIBStringField;
     xAlbAProcesarFORMA_PAGO: TFIBStringField;
     xAlbAProcesarAGENTE: TIntegerField;
     xAlbAProcesarLIQUIDO: TFloatField;
     xAlbAProcesarPROCESAR: TIntegerField;
     xAlbAProcesarPROCESADO: TIntegerField;
     DSxFacAProcesar: TDataSource;
     xFacAProcesar: TFIBTableSet;
     xFacAProcesarEMPRESA: TIntegerField;
     xFacAProcesarEJERCICIO: TIntegerField;
     xFacAProcesarCANAL: TIntegerField;
     xFacAProcesarSERIE: TFIBStringField;
     xFacAProcesarTIPO: TFIBStringField;
     xFacAProcesarRIG: TIntegerField;
     xFacAProcesarALMACEN: TFIBStringField;
     xFacAProcesarFECHA: TDateTimeField;
     xFacAProcesarCLIENTE: TIntegerField;
     xFacAProcesarSU_REFERENCIA: TFIBStringField;
     xFacAProcesarFORMA_PAGO: TFIBStringField;
     xFacAProcesarAGENTE: TIntegerField;
     xFacAProcesarLIQUIDO: TFloatField;
     xFacAProcesarPROCESAR: TIntegerField;
     xFacAProcesarPROCESADO: TIntegerField;
     DSxAlbEtiAProcesar: TDataSource;
     xAlbEtiAProcesar: TFIBTableSet;
     xAlbEtiAProcesarEMPRESA: TIntegerField;
     xAlbEtiAProcesarEJERCICIO: TIntegerField;
     xAlbEtiAProcesarCANAL: TIntegerField;
     xAlbEtiAProcesarSERIE: TFIBStringField;
     xAlbEtiAProcesarTIPO: TFIBStringField;
     xAlbEtiAProcesarRIG: TIntegerField;
     xAlbEtiAProcesarALMACEN: TFIBStringField;
     xAlbEtiAProcesarFECHA: TDateTimeField;
     xAlbEtiAProcesarCLIENTE: TIntegerField;
     xAlbEtiAProcesarSU_REFERENCIA: TFIBStringField;
     xAlbEtiAProcesarFORMA_PAGO: TFIBStringField;
     xAlbEtiAProcesarAGENTE: TIntegerField;
     xAlbEtiAProcesarLIQUIDO: TFloatField;
     xAlbEtiAProcesarPROCESAR: TIntegerField;
     QPedDetLoc: THYFIBQuery;
     xEDIPedDetLoc: TFIBDataSet;
     DSxEDIPedDetLoc: TDataSource;
     DSxPedDet: TDataSource;
     xPedDet: TFIBDataSet;
     TUpdate: THYTransaction;
     xArticulosEDI: TFIBDataSet;
     xArticulosEDIARTICULO: TFIBStringField;
     xArticulosEDITITULO: TFIBStringField;
     DSxArticulosEDI: TDataSource;
     xReporteDeVentas: TFIBDataSet;
     DSxReporteDeVentas: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     LocalMascaraN: string;
     procedure MarcaProcesado(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer);
     procedure BorrarPedidoNoImportado;
     function DameTerceroEDI(CodigoEDI: string): integer;
  public
     { Public declarations }
     Cancelar: boolean;
     procedure ImportaPedido(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer; Logs: TStrings);
     procedure ImportaDeclaracionPO(Empresa, Ejercicio, Canal: integer; Logs: TStrings);
     procedure SeleccionAlbaranes(MuestraTodo: boolean; Serie: string; Desde, Hasta: integer);
     procedure SeleccionAlbaranesEti(MuestraTodo: boolean);
     procedure SeleccionFacturas(MuestraTodo: boolean; Serie: string; Desde, Hasta: integer);
     procedure ExportaAlbaranes;
     procedure ExportaFacturas;
     procedure ImprimirEtiquetasAlbaranes(Previsualizar: boolean);
     procedure MarcaAlbaranes(Procesar: integer);
     procedure MarcaFacturas(Procesar: integer);
     procedure GenerarReporteDeVentas(Serie: string; Desde, Hasta: TDateTime; Familia, Emisor, Receptor, Proveedor, Comprador, CodigoDeLugar: string);
     procedure MarcaAlbaranesProcesado;
     procedure MarcaFacturasProcesado;
  end;

var
  DMEDI : TDMEDI;

implementation

uses UDMMain, UEntorno, UFMEDI, UFMErrorPedidoEdi, UDMExportaAlbaranEDI,
  UDMExportaFacturaEDI, UUtiles;

{$R *.dfm}

procedure TDMEDI.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  xFacAProcesarLIQUIDO.DisplayFormat := LocalMascaraN;
  xAlbAProcesarLIQUIDO.DisplayFormat := LocalMascaraN;
  xAlbEtiAProcesarLIQUIDO.DisplayFormat := LocalMascaraN;
end;

procedure TDMEDI.ImportaPedido(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer; Logs: TStrings);
var
  Tf : TextFile;
  Linea : string;
  MemoCab, MemoDet : TStrings;
  auxs : string;
  Nota : string;
  auxi : integer;
  FMErrorPedidoEdi : TFMErrorPedidoEdi;
  Cliente : integer;
  Precio, Descuento, Descuento2, Descuento3 : real;
  ModTarifa : boolean;
  Cliente_EDI : string;
  Q : THYFIBQuery;
  Clave1 : string;
  NumPed : string;
  Fecha : TDateTime;
begin
  DMMain.LogIni('ImportaPedido');
  try
     Cancelar := False;
     {Cabecera ---------------------------------------------------------------------}
     MemoCab := TStringList.Create;
     MemoCab.Clear;
     MemoDet := TStringList.Create;
     MemoDet.Clear;
     DMMain.LogIni('Importando ficheros a tablas');
     DMMain.LogIni('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'cabped.txt');
     AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'cabped.txt');
     if (FileExists(REntorno.DirectorioEDI_Entrada + 'cabped.txt')) then
     begin
        Reset(Tf);
        while not EOF(Tf) do
        begin
           ReadLn(Tf, Linea);
           with QEDIPedCab do
           begin
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              Close;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['CLAVE1'].AsString := Trim(Copy(Linea, 1, 8));
              Params.ByName['NODO'].AsString := Trim(Copy(Linea, 9, 3));
              Params.ByName['FUNCION'].AsString := Trim(Copy(Linea, 12, 3));
              Params.ByName['NUMPED'].AsString := Trim(Copy(Linea, 15, 15));
              Params.ByName['FECHA'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 30, 12)));
              Params.ByName['FECHAEPR'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 42, 12)));
              Params.ByName['FECHAERE'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 54, 12)));
              Params.ByName['FECHATOP'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 66, 12)));
              Params.ByName['FORMAPAG'].AsString := Trim(Copy(Linea, 78, 3));
              Params.ByName['CONDESP'].AsString := Trim(Copy(Linea, 81, 3));
              Params.ByName['PEDABIER'].AsString := Trim(Copy(Linea, 84, 17));
              Params.ByName['LPRECIOS'].AsString := Trim(Copy(Linea, 101, 17));
              Params.ByName['NCONTRAT'].AsString := Trim(Copy(Linea, 118, 17));
              Params.ByName['FCONTRAT'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 135, 12)));
              Params.ByName['CLIENTE'].AsString := Trim(Copy(Linea, 147, 17));
              Params.ByName['QPIDE'].AsString := Trim(Copy(Linea, 164, 17));
              Params.ByName['AQSF'].AsString := Trim(Copy(Linea, 181, 17));
              Params.ByName['DEPTO'].AsString := Trim(Copy(Linea, 198, 17));
              Params.ByName['RECEPTOR'].AsString := Trim(Copy(Linea, 215, 17));
              Params.ByName['MUELLE'].AsString := Trim(Copy(Linea, 232, 17));
              Params.ByName['VENDEDOR'].AsString := Trim(Copy(Linea, 249, 17));
              Params.ByName['QPAGA'].AsString := Trim(Copy(Linea, 266, 17));
              Params.ByName['PORTES'].AsString := Trim(Copy(Linea, 283, 3));
              Params.ByName['RECOGIDA'].AsString := Trim(Copy(Linea, 286, 3));
              Params.ByName['REPOSI'].AsString := Trim(Copy(Linea, 289, 35));
              Params.ByName['ENTREGA'].AsString := Trim(Copy(Linea, 324, 35));
              Params.ByName['MONEDA'].AsString := Trim(Copy(Linea, 359, 3));
              Params.ByName['CALIF1'].AsString := Trim(Copy(Linea, 362, 3));
              Params.ByName['SECUEN1'].AsInteger :=
                 DMMain.EDIToInt(Trim(Copy(Linea, 365, 2)));
              Params.ByName['TIPO1'].AsString := Trim(Copy(Linea, 367, 3));
              Params.ByName['PORCEN1'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 370, 8)), 3);
              Params.ByName['IMP_DES1'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 378, 15)), 3);
              Params.ByName['CALIF2'].AsString := Trim(Copy(Linea, 393, 3));
              Params.ByName['SECUEN2'].AsInteger :=
                 DMMain.EDIToInt(Trim(Copy(Linea, 396, 2)));
              Params.ByName['TIPO2'].AsString := Trim(Copy(Linea, 398, 3));
              Params.ByName['PORCEN2'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 401, 8)), 3);
              Params.ByName['IMP_DES2'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 409, 15)), 3);
              Params.ByName['CALIF3'].AsString := Trim(Copy(Linea, 424, 3));
              Params.ByName['SECUEN3'].AsInteger :=
                 DMMain.EDIToInt(Trim(Copy(Linea, 427, 2)));
              Params.ByName['TIPO3'].AsString := Trim(Copy(Linea, 429, 3));
              Params.ByName['PORCEN3'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 432, 8)), 3);
              Params.ByName['IMP_DES3'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 440, 15)), 3);
              Params.ByName['CALIF4'].AsString := Trim(Copy(Linea, 455, 3));
              Params.ByName['SECUEN4'].AsInteger :=
                 DMMain.EDIToInt(Trim(Copy(Linea, 458, 2)));
              Params.ByName['TIPO4'].AsString := Trim(Copy(Linea, 460, 3));
              Params.ByName['PORCEN4'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 463, 3)), 3);
              Params.ByName['IMP_DES4'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 471, 15)), 3);
              Params.ByName['CALIF5'].AsString := Trim(Copy(Linea, 486, 3));
              Params.ByName['SECUEN5'].AsInteger :=
                 DMMain.EDIToInt(Trim(Copy(Linea, 489, 2)));
              Params.ByName['TIPO5'].AsString := Trim(Copy(Linea, 491, 3));
              Params.ByName['PORCEN5'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 494, 8)), 3);
              Params.ByName['IMP_DES5'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 502, 15)), 3);
              Params.ByName['TIPOIMP1'].AsString := Trim(Copy(Linea, 517, 3));
              Params.ByName['TASAIMP1'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 520, 8)), 3);
              Params.ByName['BASEIMP1'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 528, 15)), 3);
              Params.ByName['IMPIMP1'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 543, 15)), 3);
              Params.ByName['TIPOIMP2'].AsString := Trim(Copy(Linea, 558, 3));
              Params.ByName['TASAIMP2'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 562, 8)), 3);
              Params.ByName['BASEIMP2'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 569, 15)), 3);
              Params.ByName['IMPIMP2'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 584, 15)), 3);
              Params.ByName['TIPOIMP3'].AsString := Trim(Copy(Linea, 599, 3));
              Params.ByName['TASAIMP3'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 602, 8)), 3);
              Params.ByName['BASEIMP3'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 610, 15)), 3);
              Params.ByName['IMPIMP3'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 625, 15)), 3);
              Params.ByName['PATREF'].AsString := Trim(Copy(Linea, 640, 3));
              Params.ByName['PATDIAS'].AsString := Trim(Copy(Linea, 643, 3));
              Params.ByName['PATMES'].AsString := Trim(Copy(Linea, 646, 3));
              Params.ByName['FECHAV'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 649, 12)));
              Params.ByName['VTO1'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 661, 12)));
              Params.ByName['IMPVTO1'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 673, 15)), 3);
              Params.ByName['VTO2'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 688, 12)));
              Params.ByName['IMPVTO2'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 700, 15)), 3);
              Params.ByName['VTO3'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 715, 12)));
              Params.ByName['IMPVTO3'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 727, 15)), 3);
              Params.ByName['TBRUTO'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 742, 15)), 3);
              Params.ByName['TNETO'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 757, 15)), 3);
              Params.ByName['TCARGDES'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 772, 15)), 3);
              Params.ByName['BASEIMP'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 787, 15)), 3);
              Params.ByName['TOTIMPUES'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 802, 15)), 3);
              Params.ByName['TOTAL'].AsFloat :=
                 DMMain.EDIToFloat(Trim(Copy(Linea, 817, 15)), 3);
              Params.ByName['FRECOGIDA'].AsDateTime :=
                 DMMain.EDIToDate(Trim(Copy(Linea, 832, 12)));
              Params.ByName['TRANSPOR'].AsString := Trim(Copy(Linea, 844, 17));
              Params.ByName['ALMRECOG'].AsString := Trim(Copy(Linea, 861, 17));
              Params.ByName['FREFPAG'].AsDateTime := DMMain.EDIToDate(Copy(Linea, 878, 6));
              Params.ByName['TOTCANT'].AsInteger :=
                 DMMain.EDIToInt(Trim(Copy(Linea, 884, 15)));
              Params.ByName['TEMPORA'].AsString := Trim(Copy(Linea, 899, 35));
              Params.ByName['DEPTOVENT'].AsString := Trim(Copy(Linea, 934, 17));
              Params.ByName['SUCURSAL'].AsString := Trim(Copy(Linea, 951, 17));
              Params.ByName['DESTMSG'].AsString := Trim(Copy(Linea, 968, 17));
              Params.ByName['CONDPAGO'].AsString := Trim(Copy(Linea, 985, 5));
              Params.ByName['TRANSPORT'].AsString := Trim(Copy(Linea, 990, 5));
              Params.ByName['LUGADIENT'].AsString := Trim(Copy(Linea, 1010, 17));
              ExecQuery;
              Transaction.Commit;
           end;
        end;
        CloseFile(Tf);
     end;
     DMMain.LogFin('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'cabped.txt');

     {Notas Cabecera ---------------------------------------------------------------}
     DMMain.LogIni('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'obsped.txt');
     AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'obsped.txt');
     if (FileExists(REntorno.DirectorioEDI_Entrada + 'obsped.txt')) then
     begin
        Reset(Tf);
        while not EOF(Tf) do
        begin
           ReadLn(Tf, Linea);
           with QEDIPedCabNotas do
           begin
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              Close;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['CLAVE1'].AsString := Trim(Copy(Linea, 1, 8));
              Params.ByName['CLAVE2'].AsString := Trim(Copy(Linea, 9, 5));
              Params.ByName['TEMA'].AsString := Trim(Copy(Linea, 14, 3));
              Params.ByName['TEXTO1'].AsString := Trim(Copy(Linea, 17, 70));
              Params.ByName['TEXTO2'].AsString := Trim(Copy(Linea, 87, 70));
              Params.ByName['TEXTO3'].AsString := Trim(Copy(Linea, 157, 70));
              Params.ByName['TEXTO4'].AsString := Trim(Copy(Linea, 227, 70));
              Params.ByName['TEXTO5'].AsString := Trim(Copy(Linea, 297, 70));
              MemoCab.Clear;
              MemoCab.Add(Trim(Copy(Linea, 17, 70)));
              MemoCab.Add(Trim(Copy(Linea, 87, 70)));
              MemoCab.Add(Trim(Copy(Linea, 157, 70)));
              MemoCab.Add(Trim(Copy(Linea, 227, 70)));
              MemoCab.Add(Trim(Copy(Linea, 297, 70)));
              // Params.ByName['NOTAS'].AsString := MemoCab.Text;
              ExecQuery;
              Transaction.Commit;
           end;
        end;
        CloseFile(Tf);
     end;
     DMMain.LogFin('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'obsped.txt');

     {Detalle ----------------------------------------------------------------------}
     DMMain.LogIni('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'linped.txt');
     AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'linped.txt');
     if (FileExists(REntorno.DirectorioEDI_Entrada + 'linped.txt')) then
     begin
        Reset(Tf);
        while not EOF(Tf) do
        begin
           ReadLn(Tf, Linea);
           with QPedDet do
           begin
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              Close;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['CLAVE1'].AsString := Trim(Copy(Linea, 1, 8));
              Params.ByName['CLAVE2'].AsString := Trim(Copy(Linea, 9, 5));
              Params.ByName['REFEAN'].AsString := Trim(Copy(Linea, 14, 17));
              Params.ByName['DUN14'].AsString := Trim(Copy(Linea, 31, 14));
              Params.ByName['VP'].AsString := Trim(Copy(Linea, 45, 2));
              Params.ByName['REFCLI'].AsString := Trim(Copy(Linea, 47, 35));
              Params.ByName['REFPROV'].AsString := Trim(Copy(Linea, 82, 35));
              Params.ByName['REFETIQ'].AsString := Trim(Copy(Linea, 117, 35));
              Params.ByName['DESCMER'].AsString := Trim(Copy(Linea, 152, 35));
              Params.ByName['DESCMER2'].AsString := Trim(Copy(Linea, 187, 35));
              Params.ByName['DESCCONS'].AsString := Trim(Copy(Linea, 222, 35));
              Params.ByName['CANTPED'].AsFloat := DMMain.EDIToFloat(Trim(Copy(Linea, 257, 15)), 3);
              Params.ByName['UMEDIDA'].AsString := Trim(Copy(Linea, 272, 3));
              Params.ByName['CANTGRAT'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 275, 15), 3);
              Params.ByName['CANTUE'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 290, 15), 3);
              Params.ByName['CANTBONI'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 305, 15), 3);
              Params.ByName['FECHAE'].AsDateTime := DMMain.EDIToDate(Copy(Linea, 320, 12));
              Params.ByName['PRECION'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 332, 15), 3);
              Params.ByName['PRECIOB'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 347, 15), 3);
              Params.ByName['PVP'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 362, 15), 3);
              Params.ByName['NETO'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 377, 15), 3);
              Params.ByName['CALIF1'].AsString := Trim(Copy(Linea, 392, 3));
              Params.ByName['SECUEN1'].AsInteger := DMMain.EDIToInt(Copy(Linea, 395, 2));
              Params.ByName['TIPO1'].AsString := Trim(Copy(Linea, 397, 3));
              Params.ByName['PORCEN1'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 400, 8), 3);
              Params.ByName['IMPDES1'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 408, 15), 3);
              Params.ByName['CALIF2'].AsString := Trim(Copy(Linea, 423, 3));
              Params.ByName['SECUEN2'].AsInteger := DMMain.EDIToInt(Copy(Linea, 426, 2));
              Params.ByName['TIPO2'].AsString := Trim(Copy(Linea, 428, 3));
              Params.ByName['PORCEN2'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 431, 8), 3);
              Params.ByName['IMPDES2'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 439, 15), 3);
              Params.ByName['CALIF3'].AsString := Trim(Copy(Linea, 454, 3));
              Params.ByName['SECUEN3'].AsInteger := DMMain.EDIToInt(Copy(Linea, 457, 2));
              Params.ByName['TIPO3'].AsString := Trim(Copy(Linea, 459, 3));
              Params.ByName['PORCEN3'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 462, 8), 3);
              Params.ByName['IMPDES3'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 470, 15), 3);
              Params.ByName['CALIF4'].AsString := Trim(Copy(Linea, 485, 3));
              Params.ByName['SECUEN4'].AsInteger := DMMain.EDIToInt(Copy(Linea, 488, 2));
              Params.ByName['TIPO4'].AsString := Trim(Copy(Linea, 490, 3));
              Params.ByName['PORCEN4'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 493, 8), 3);
              Params.ByName['IMPDES4'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 501, 15), 3);
              Params.ByName['TIPOIMP1'].AsString := Trim(Copy(Linea, 516, 3));
              Params.ByName['TASAIMP1'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 519, 8), 3);
              Params.ByName['IMPIMP1'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 527, 15), 3);
              Params.ByName['TIPOIMP2'].AsString := Trim(Copy(Linea, 542, 3));
              Params.ByName['TASAIMP2'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 545, 8), 3);
              Params.ByName['IMPIMP2'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 553, 15), 3);
              Params.ByName['TIPOIMP3'].AsString := Trim(Copy(Linea, 568, 3));
              Params.ByName['TASAIMP3'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 571, 8), 3);
              Params.ByName['IMPIMP3'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 579, 15), 3);
              Params.ByName['NUCUE'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 594, 15), 3);
              Params.ByName['FORMATO'].AsString := Trim(Copy(Linea, 609, 3));
              Params.ByName['NUEXP'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 612, 15), 3);
              Params.ByName['PNCAJA'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 627, 15), 3);
              Params.ByName['MONPREC'].AsString := Trim(Copy(Linea, 642, 3));
              Params.ByName['MARCA'].AsString := Trim(Copy(Linea, 645, 35));
              Params.ByName['COLOR'].AsString := Trim(Copy(Linea, 680, 35));
              Params.ByName['TAMANO'].AsString := Trim(Copy(Linea, 715, 35));
              Params.ByName['PRESENT'].AsString := Trim(Copy(Linea, 750, 35));
              Params.ByName['UNIDCOM'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 785, 15), 3);
              Params.ByName['PUM'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 900, 15), 3);
              ExecQuery;
              Transaction.Commit;
           end;
        end;
        CloseFile(Tf);
     end;
     DMMain.LogFin('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'linped.txt');

     {Notas Detalle ----------------------------------------------------------------}
     DMMain.LogIni('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'obslped.txt');
     AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'obslped.txt');
     if (FileExists(REntorno.DirectorioEDI_Entrada + 'obslped.txt')) then
     begin
        Reset(Tf);
        while not EOF(Tf) do
        begin
           ReadLn(Tf, Linea);
           with QPedDetNotas do
           begin
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              Close;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['CLAVE1'].AsString := Trim(Copy(Linea, 1, 8));
              Params.ByName['CLAVE2'].AsString := Trim(Copy(Linea, 9, 5));
              Params.ByName['CLAVE3'].AsString := Trim(Copy(Linea, 14, 3));
              Params.ByName['TEMA'].AsString := Trim(Copy(Linea, 19, 3));
              Params.ByName['TEXTO1'].AsString := Trim(Copy(Linea, 22, 70));
              Params.ByName['TEXTO2'].AsString := Trim(Copy(Linea, 92, 70));
              Params.ByName['TEXTO3'].AsString := Trim(Copy(Linea, 162, 70));
              Params.ByName['TEXTO4'].AsString := Trim(Copy(Linea, 232, 70));
              Params.ByName['TEXTO5'].AsString := Trim(Copy(Linea, 302, 70));
              MemoDet.Clear;
              MemoDet.Add(Trim(Copy(Linea, 22, 70)));
              MemoDet.Add(Trim(Copy(Linea, 92, 70)));
              MemoDet.Add(Trim(Copy(Linea, 162, 70)));
              MemoDet.Add(Trim(Copy(Linea, 232, 70)));
              MemoDet.Add(Trim(Copy(Linea, 302, 70)));
              // Params.ByName['NOTAS'].AsString := MemoDet.Text;
              ExecQuery;
              Transaction.Commit;
           end;
        end;
        CloseFile(Tf);
     end;
     DMMain.LogFin('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'obslped.txt');

     {Cantidad Pedida Por Localizacion ---------------------------------------------}
     DMMain.LogIni('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'loclped.txt');
     AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'loclped.txt');
     if (FileExists(REntorno.DirectorioEDI_Entrada + 'loclped.txt')) then
     begin
        Reset(Tf);
        while not EOF(Tf) do
        begin
           ReadLn(Tf, Linea);
           with QPedDetLoc do
           begin
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              Close;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['CLAVE1'].AsString := Trim(Copy(Linea, 1, 8));
              Params.ByName['CLAVE2'].AsString := Trim(Copy(Linea, 9, 5));
              Params.ByName['CLAVE3'].AsString := Trim(Copy(Linea, 14, 5));
              Params.ByName['LUGAR'].AsString := Trim(Copy(Linea, 19, 17));
              Params.ByName['CANTIDAD'].AsFloat := DMMain.EDIToFloat(Copy(Linea, 36, 15), 3);
              Params.ByName['FECHENTR'].AsDateTime := DMMain.EDIToDate(Copy(Linea, 51, 12));
              Params.ByName['FECHULT'].AsDateTime := DMMain.EDIToDate(Copy(Linea, 63, 12));
              ExecQuery;
              Transaction.Commit;
           end;
        end;
        CloseFile(Tf);
     end;
     DMMain.LogFin('Importando fichero ' + REntorno.DirectorioEDI_Entrada + 'loclped.txt');
     DMMain.LogFin('Importando ficheros a tablas');

     {Verificacion y completado de notas -------------------------------------------}
     DMMain.LogIni('Verificacion y completado de notas');
     with xEDIPedCab do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
     while (not xEDIPedCab.EOF) do
     begin
        with xEDIPedCab do
        begin
           MemoCab.Clear;
           if (FieldByName('NODO').AsString = '221') then
              MemoCab.Add(_('Pedido abierto.'));
           if (FieldByName('NODO').AsString = '224') then
              MemoCab.Add(_('Pedido URGENTE !'));
           if (FieldByName('NODO').AsString = '226') then
              MemoCab.Add(_('Pedido parcial. Cancelacion de pedido anterior.'));
           if (FieldByName('NODO').AsString = '227') then
              MemoCab.Add(_('Pedido en consignacion.'));
           if (FieldByName('NODO').AsString = '22E') then
              MemoCab.Add(_('Propuesta de Pedido de proveedor (CRP)'));

           if (FieldByName('FUNCION').AsString = '3') then
              MemoCab.Add(_('Funcion : CANCELACION'));
           if (FieldByName('FUNCION').AsString = '5') then
              MemoCab.Add(_('Funcion : REEMPLAZAR'));
           if (FieldByName('FUNCION').AsString = '6') then
              MemoCab.Add(_('Funcion : CONFIRMACION'));
           if (FieldByName('FUNCION').AsString = '7') then
              MemoCab.Add(_('Funcion : DUPLICADO'));
           if (FieldByName('FUNCION').AsString = '31') then
              MemoCab.Add(_('Funcion : COPIA'));
           if (FieldByName('FUNCION').AsString = '16') then
              MemoCab.Add(_('Funcion : Propuesta (CPR)'));
           if (FieldByName('FUNCION').AsString = '46') then
              MemoCab.Add(_('Funcion : PROVISIONAL'));

           if (FieldByName('CONDESP').AsString = 'X1') then
              MemoCab.Add(_('Si envío parcial, cancelar el resto del pedido'));
           if (FieldByName('CONDESP').AsString = 'X2') then
              MemoCab.Add(_('Si envío parcial, entregar el resto del pedido'));

           if (FieldByName('PORTES').AsString = 'PP') then
              MemoCab.Add(_('Portes Pagados'));
           if (FieldByName('PORTES').AsString = 'PD') then
              MemoCab.Add(_('Portes Debidos'));

           if (FieldByName('RECOGIDA').AsString = 'RD') then
              MemoCab.Add(_('Recogida por el emisor del pedido'));
           if (FieldByName('RECOGIDA').AsString = 'EP') then
              MemoCab.Add(_('Enviado por el receptor del pedido'));
           if (FieldByName('RECOGIDA').AsString = 'COM') then
              MemoCab.Add(_('Servir pedido completo'));
           if (FieldByName('RECOGIDA').AsString = 'FNA') then
              MemoCab.Add(_('Facturar y no reponer'));
           if (FieldByName('RECOGIDA').AsString = 'RNF') then
              MemoCab.Add(_('Reponer y no facturar'));

           if (FieldByName('FORMAPAG').AsString = '42') then
              MemoCab.Add(_('Forma de Pago : Pago a una Cuenta Bancaria.'));
           if (FieldByName('FORMAPAG').AsString = '14E') then
              MemoCab.Add(_('Forma de Pago : Pago mediante Giro Bancario.'));
           if (FieldByName('FORMAPAG').AsString = '10') then
              MemoCab.Add(_('Forma de Pago : En Efectivo.'));
           if (FieldByName('FORMAPAG').AsString = '20') then
              MemoCab.Add(_('Forma de Pago : Cheque.'));
           if (FieldByName('FORMAPAG').AsString = '60') then
              MemoCab.Add(_('Forma de Pago : Pagaré.'));

           if (FieldByName('PATREF').AsString = '29') then
              if (FieldByName('PATDIAS').AsString <> '') then
                 MemoCab.Add(Format(_('Fecha pago : %s dias desde la entrega de mercancia'), [FieldByName('PATDIAS').AsString]))
              else if (FieldByName('PATMES').AsString <> '') then
                 MemoCab.Add(Format(_('Fecha pago : %s mes/es desde la entrega de mercancia'), [FieldByName('PATMES').AsString]));
           if (FieldByName('PATREF').AsString = '68') then
              if (FieldByName('PATDIAS').AsString <> '') then
                 MemoCab.Add(Format(_('Fecha pago : %s dias desde %s'), [FieldByName('PATDIAS').AsString, DateToStr(FieldByName('FECHAV').AsDateTime)]))
              else if (FieldByName('PATMES').AsString <> '') then
                 MemoCab.Add(Format(_('Fecha pago : %s mes/es desde %s'), [FieldByName('PATMES').AsString, DateToStr(FieldByName('FECHAV').AsDateTime)]));

           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT FIRST 1 EMPRESA FROM EDI_PED_CAB_NOTAS WHERE CLAVE1 = ''' + xEDIPedCab.FieldByName('CLAVE1').AsString + '''';
              ExecQuery;
              auxi := FieldByName['EMPRESA'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);

           if (auxi = 0) then
           begin
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'INSERT INTO EDI_PED_CAB_NOTAS (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,CLAVE1,CLAVE2,NOTAS) VALUES (' +
                    xEDIPedCab.FieldByName('EMPRESA').AsString + ',' + xEDIPedCab.FieldByName('EJERCICIO').AsString + ',' + xEDIPedCab.FieldByName('CANAL').AsString + ',' +
                    '''' + xEDIPedCab.FieldByName('SERIE').AsString + ''',''' + xEDIPedCab.FieldByName('TIPO').AsString + ''',' + xEDIPedCab.FieldByName('RIG').AsString + ',' +
                    '''' + xEDIPedCab.FieldByName('CLAVE1').AsString + ''',''001'',?NOTAS)';
                 Params.ByName['NOTAS'].AsString := MemoCab.Text;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);
           end
           else
           begin
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT NOTAS,CLAVE2 from EDI_PED_CAB_NOTAS where CLAVE1 = ''' + xEDIPedCab.FieldByName('CLAVE1').AsString + '''';
                 ExecQuery;
                 auxs := FieldByName['CLAVE2'].AsString;
                 Nota := FieldByName['NOTAS'].AsString;
                 MemoCab.Insert(0, Nota);
                 FreeHandle;
              end;
              FreeAndNil(Q);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE EDI_PED_CAB_NOTAS SET NOTAS = ?NOTAS WHERE CLAVE1 = ''' + xEDIPedCab.FieldByName('CLAVE1').AsString + ''' and CLAVE2 = ''' + auxs + '''';
                 Params.ByName['NOTAS'].AsString := MemoCab.Text;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);
           end;
           Next;
        end; {with}
     end;
     xEDIPedCab.Close;
     DMMain.LogFin('Verificacion y completado de notas');

     {Verifico que no exista el pedido ---------------------------------------------}
     DMMain.LogIni('Verifico que no exista el pedido');
     with xEDIPedCab do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
     while (not xEDIPedCab.EOF) do
     begin
        with xEDIPedCab do
        begin
           auxs := Trim(FieldByName('NUMPED').AsString);
           Logs.Add(Format(_('(i) Verificando pedido : %s'), [auxs]));

           // Obtengo cliente de la gestion
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT FIRST 1 C.CLIENTE ');
              SQL.Add(' FROM SYS_TERCEROS T ');
              SQL.Add(' JOIN EMP_CLIENTES C ON C.TERCERO = T.TERCERO ');
              SQL.Add(' WHERE ');
              SQL.Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              SQL.Add(' T.CODIGO_EDI = ''' + Trim(xEDIPedCab.FieldByName('CLIENTE').AsString) + ''' ');
              ExecQuery;
              auxi := FieldByName['CLIENTE'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);

           // Busco un documento con la misma referencia para el SERIE+CLIENTE
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT FIRST 1 EMPRESA FROM GES_CABECERAS_S WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND SERIE = ''' + Serie + ''' AND TIPO=''PEC'' AND CLIENTE = ' + IntToStr(auxi) + ' AND SU_REFERENCIA = ''' + auxs + '''';
              ExecQuery;
              auxi := FieldByName['EMPRESA'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);

           if (auxi <> 0) then
           begin
              {Si existe lo borro}
              ShowMessage(Format(_('Ya existe un pedido numero : %s' + #13#10 + 'El pedido será omitido.'), [auxs]));
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'DELETE FROM EDI_PED_CAB WHERE RIG = 0 AND NUMPED = ''' + auxs + '''';
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              Logs.Add(
                 Format(_('(ATENCION!) Ya existe el pedido nro - %s. Será omitido.'), [auxs]));
           end;
           Next;
        end; {with}
     end;
     xEDIPedCab.Close;
     DMMain.LogFin('Verifico que no exista el pedido');

     {Verifico que no exista el cliente --------------------------------------------}
     DMMain.LogIni('Verifico que no exista el cliente');
     with xEDIPedCab do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
     while (not xEDIPedCab.EOF) do
     begin
        with xEDIPedCab do
        begin
           Logs.Add(
              Format(_('(i) Verificando CLIENTE, QPIDE, RECEPTOR del pedido : %s'), [Trim(FieldByName('NUMPED').AsString)]));

           {CLIENTE}
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT FIRST 1 TERCERO FROM SYS_TERCEROS WHERE CODIGO_EDI = ''' + Trim(xEDIPedCab.FieldByName('CLIENTE').AsString) + '''';
              ExecQuery;
              auxi := FieldByName['TERCERO'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);
           if (auxi = 0) then
           begin
              Cancelar := True;
              Logs.Add(
                 Format(_('(ERROR) [CLIENTE] - No existe el cliente con codigo EDI : %s'), [Trim(FieldByName('CLIENTE').AsString)]));
           end;

           {QPIDE}
           auxi := DameTerceroEDI(Trim(xEDIPedCab.FieldByName('QPIDE').AsString));
           if (auxi = 0) then
           begin
              Cancelar := True;
              Logs.Add(
                 Format(_('(ERROR) [QPIDE] No existe la sucursal con codigo EDI : %s'), [Trim(FieldByName('QPIDE').AsString)]));
           end;

           {RECEPTOR}
           auxi := DameTerceroEDI(Trim(xEDIPedCab.FieldByName('RECEPTOR').AsString));
           if (auxi = 0) then
           begin
              Cancelar := True;
              Logs.Add(
                 Format(_('(ERROR) [RECEPTOR] No existe la sucursal con codigo EDI : %s'), [Trim(FieldByName('RECEPTOR').AsString)]));
           end;
           Next;
        end; {with}
     end;
     xEDIPedCab.Close;
     DMMain.LogFin('Verifico que no exista el cliente');

     DMMain.LogIni('Verificaciones detalle (LUGAR)');
     with xEDIPedDetLoc do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
     while (not xEDIPedDetLoc.EOF) and (not Cancelar) do
     begin
        with xEDIPedDetLoc do
        begin
           Logs.Add(
              Format(_('(i) Verificando LUGAR del pedido (loc) : %s/%s/%s'), [Trim(FieldByName('CLAVE1').AsString), Trim(FieldByName('CLAVE2').AsString), Trim(FieldByName('CLAVE3').AsString)]));

           {LUGAR}
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT FIRST 1 TERCERO FROM SYS_TERCEROS WHERE CODIGO_EDI = ''' + Trim(xEDIPedDetLoc.FieldByName('LUGAR').AsString) + '''';
              ExecQuery;
              auxi := FieldByName['TERCERO'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);

           if (auxi = 0) then
           begin
              auxi := DameTerceroEDI(Trim(xEDIPedDetLoc.FieldByName('LUGAR').AsString));
           end;

           if (auxi = 0) then
           begin
              Cancelar := True;
              Logs.Add(
                 Format(_('(ERROR) [LUGAR] - No existe el cliente con codigo EDI : %s'), [Trim(FieldByName('LUGAR').AsString)]));
           end;
           Next;
        end;
     end;
     xEDIPedDetLoc.Close;
     DMMain.LogFin('Verificaciones detalle (LUGAR)');

     if (Cancelar) then
     begin
        DMMain.Log('Proceso cancelado. Se borran tablas');

        BorrarPedidoNoImportado;
        Logs.Add(_('(ERROR) Se Cancela la importacion de pedidos'));
     end;

     {Verifico que no exista el articulo -------------------------------------------}
     DMMain.LogIni('Verifico que no exista el articulo');
     with xPedDet do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;

     while (not xPedDet.EOF) and (not Cancelar) do
     begin
        Logs.Add(
           Format(_('(i) Verificando que existe el articulo : %s'), [xPedDet.FieldByName('REFCLI').AsString]));
        with xPedDet do
        begin
           {El Corte Ingles trae el cliente en cliente }
           {Cortefiel trae el cliente en AQSF          }
           Refresh;
           Cliente_EDI := FieldByName('CLIENTE').AsString;
           if (Trim(Cliente_EDI) = '') then
              Cliente_EDI := FieldByName('AQSF').AsString;

           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT FIRST 1 EMPRESA FROM ART_ARTICULOS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + xPedDet.FieldByName('REFCLI').AsString + '''';
              ExecQuery;
              auxi := FieldByName['EMPRESA'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);
           if (auxi = 0) then
           begin
              {Si no se encuentra lo busco en EDI_ARTICULOS}
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT ARTICULO FROM EDI_ARTICULOS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND REFCLI = ''' + xPedDet.FieldByName('REFCLI').AsString + ''' AND CLIENTE_EDI = ''' + Cliente_EDI + '''';
                 ExecQuery;
                 auxs := FieldByName['ARTICULO'].AsString;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (auxs <> '') then
              begin
                 {si esta lo modifico en el pedido}
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text :=
                       'UPDATE EDI_PED_DET SET REFCLI = ''' + auxs +
                       ''' WHERE RIG = 0 AND EMPRESA = ' +
                       REntorno.EmpresaStr + ' AND CLAVE1 = ''' + xPedDet.FieldByName('CLAVE1').AsString +
                       ''' AND CLAVE2 = ''' + xPedDet.FieldByName('CLAVE2').AsString + '''';
                    ExecQuery;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 {si no esta, que pregunte cual es el codigo g2k del articulo edi}
                 Logs.Add(Format(_('(i) No existe REFCLI= %s, CLIENTE_EDI= %s.'), [xPedDet.FieldByName('REFCLI').AsString, Cliente_EDI]));

                 FMErrorPedidoEdi := TFMErrorPedidoEdi.Create(Self);
                 FMErrorPedidoEdi.ErrorArticulo(Cliente_EDI);
                 with xArticulosEDI do
                 begin
                    Close;
                    Params.ByName['EMPRESA'].AsInteger := xPedDet.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['REF_CLIENTE'].AsString := xPedDet.FieldByName('REFCLI').AsString;
                    Open;
                 end;
                 if (FMErrorPedidoEdi.ShowModal = mrOk) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text :=
                          'INSERT INTO EDI_ARTICULOS (EMPRESA,ARTICULO,REFCLI,REFPROV,REFETIQ,REFEAN,DUN14,CLIENTE_EDI) VALUES (' + REntorno.EmpresaStr + ',''' + FMErrorPedidoEdi.EFArticulo.Text +
                          ''',''' + xPedDet.FieldByName('REFCLI').AsString +
                          ''',''' + xPedDet.FieldByName('REFPROV').AsString + ''',''' +
                          xPedDet.FieldByName('REFETIQ').AsString + ''',''' +
                          xPedDet.FieldByName('REFEAN').AsString + ''',''' +
                          xPedDet.FieldByName('DUN14').AsString + ''',''' + Cliente_EDI + ''')';
                       ExecQuery;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);

                    Logs.Add(
                       Format(_('(i) Se agregó el artículo - REFCLI=%s, REFPROV=%s, ARTICULO=%s a la tabla de conversión.'), [FieldByName('REFCLI').AsString, FieldByName('REFPROV').AsString, FMErrorPedidoEdi.EFArticulo.Text]));
                 end
                 else
                 begin
                    {Si cancela borro los pedidos (cancela toda la operacion)}
                    Cancelar := True;
                    BorrarPedidoNoImportado;
                    Logs.Add(_('(ERROR) Se ha CANCELADO la importación del pedido'));
                 end;
                 FMErrorPedidoEdi.Free;
              end;
           end;
           Next;
        end; {with}
     end;
     xPedDet.Close;
     DMMain.LogFin('Verifico que no exista el articulo');

     {Verifico los precios del articulo --------------------------------------------}
     DMMain.LogIni('Verifico los precios del articulo');
     with xPedDet do
     begin
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
     while (not xPedDet.EOF) and (not Cancelar) do
     begin
        with xPedDet do
        begin
           Refresh;
           Logs.Add(
              '(i) Verificando la precios del articulo : ' +
              xPedDet.FieldByName('REFCLI').AsString);
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              if (Trim(xPedDet.FieldByName('CLIENTE').AsString) <> '') then
                 SQL.Text := 'SELECT MIN(CLI.CLIENTE) FROM EMP_CLIENTES CLI JOIN SYS_TERCEROS_DIRECCIONES DIR ON CLI.TERCERO = DIR.TERCERO WHERE DIR.CODIGO_EDI = ''' + xPedDet.FieldByName('CLIENTE').AsString + ''' AND CLI.EMPRESA =' + REntorno.EmpresaStr
              else
                 SQL.Text := 'SELECT MIN(CLI.CLIENTE) FROM EMP_CLIENTES CLI JOIN SYS_TERCEROS_DIRECCIONES DIR ON CLI.TERCERO = DIR.TERCERO WHERE DIR.CODIGO_EDI = ''' + xPedDet.FieldByName('QPIDE').AsString + ''' AND CLI.EMPRESA =' + REntorno.EmpresaStr;
              ExecQuery;
              Cliente := FieldByName['MIN'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);

           {Esto no
      if ((copy(xPedDet.FieldByName('CLIENTE').AsString,1,7)='8429107')or(copy(xPedDet.FieldByName('QPIDE').AsString,1,7)='8429107')) then
      begin
        Cortefiel - en REFCLI no está el codigo de Mirko. Debo traer el de Mirko.
        if ( not QGeneral.Transaction.InTransaction) then
          QGeneral.Transaction.StartTransaction;
        QGeneral.Close;
        QGeneral.SQL.Text := 'select articulo from edi_articulos where cliente_edi = ''' + xPedDet.FieldByName('QPIDE').AsString + ''' and empresa = ' + REntorno.EmpresaStr +' and REFCLI='''+xPedDet.FieldByName('REFCLI').AsString+'''';
        QGeneral.ExecQuery;
        auxs := QGeneral.FieldByName['ARTICULO'].AsString;
        QGeneral.Transaction.Commit;
      end;
}
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' EXECUTE PROCEDURE G_PRECIO_VENTA_MONEDA ');
                 SQL.Add(' (?EMPRESA, ?CLIENTE, ?ARTICULO, ?TARIFA, ?FECHA, ?EJERCICIO, ?CANAL, ');
                 SQL.Add(' ?UNIDADES_EXT, ?PRECIOP, ?UNIDADES, ?MONEDA, 0/*ID_A*/, 0/*UNIDADES_OLD*/, ');
                 SQL.Add(' ''ESP'', ''NOR'', 0 /*id_p_old*/, :ALMACEN, 0 /*factor*/) ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['CLIENTE'].AsInteger := Cliente;
                 Params.ByName['ARTICULO'].AsString := xPedDet.FieldByName('REFCLI').AsString;
                 Params.ByName['TARIFA'].AsString := 'NOR';
                 Params.ByName['FECHA'].AsDateTime := xPedDet.FieldByName('FECHA').AsDateTime;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['UNIDADES_EXT'].AsFloat := 0;
                 Params.ByName['PRECIOP'].AsFloat := 0;
                 Params.ByName['UNIDADES'].AsFloat := xPedDet.FieldByName('CANTPED').AsFloat;
                 Params.ByName['MONEDA'].AsString := 'EUR';
                 Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
                 ExecQuery;
                 Precio := FieldByName['PRECIO'].AsFloat;
                 Descuento := FieldByName['DESCUENTO'].AsFloat;
                 Descuento2 := FieldByName['DESCUENTO_2'].AsFloat;
                 Descuento3 := FieldByName['DESCUENTO_3'].AsFloat;
                 {auxi := FieldByName['MODO'].AsInteger;}//Es de donde saca el descuento que elige
                 auxs := FieldByName['TITULO'].AsString;
                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;

           if (FieldByName('PRECIOB').AsFloat <> Precio) then
           begin
              FMErrorPedidoEdi := TFMErrorPedidoEdi.Create(Self);
              FMErrorPedidoEdi.ErrorPrecio(Precio, Descuento, Descuento2,
                 Descuento3, ModTarifa);
              if (FMErrorPedidoEdi.ModalResult = 1) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE EDI_PED_DET SET PRECIOB = ?PRECIOB WHERE RIG = 0 AND REFCLI = ''' + xPedDet.FieldByName('REFCLI').AsString + '''';
                    Params.ByName['PRECIOB'].AsFloat := Precio;
                    ExecQuery;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 if (ModTarifa) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE ART_TARIFAS_PRECIOS SET BLOQUEADO = 1, PRECIO_VENTA = ?PRECIOB WHERE TARIFA = ''NOR'' AND LINEA = 1 AND EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ?ARTICULO';
                       Params.ByName['PRECIOB'].AsFloat := Precio;
                       Params.ByName['ARTICULO'].AsString := xPedDet.FieldByName('REFCLI').AsString;
                       ExecQuery;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
              end
              else
              begin
                 {Si cancela borro los pedidos (cancela toda la operacion)}
                 Cancelar := True;
                 BorrarPedidoNoImportado;
                 Logs.Add(_('(ERROR) Se ha CANCELADO la importación del pedido'));
              end;
           end;
           Next;
        end; {with}
     end;
     xPedDet.Close;
     DMMain.LogFin('Verifico los precios del articulo');

     {Finalmente Importar ----------------------------------------------------------}
     if (not Cancelar) then
     begin
        try
           DMMain.LogIni('Finalmente Importar');
           try
              Logs.Add(_('(i) Generando pedidos de venta'));
              Clave1 := '';
              repeat
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT FIRST 1 CLAVE1, NUMPED, FECHA FROM EDI_PED_CAB WHERE RIG = 0 ORDER BY CLAVE1';
                       ExecQuery;
                       Clave1 := FieldByName['CLAVE1'].AsString;
                       NumPed := FieldByName['NUMPED'].AsString;
                       Fecha := FieldByName['FECHA'].AsDateTime;
                       Logs.Add(Format(_('(i) Importando pedido %s con fecha %s'), [NumPed, DateTimeToStr(Fecha)]));
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;
                 Application.ProcessMessages;

                 if (Clave1 <> '') then
                 begin
                    DMMain.LogIni(Format(_('Importando pedido %s (CLAVE1=%s)'), [NumPed, Clave1]));
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'EXECUTE PROCEDURE G_IMPORTA_PED_EDI(:ENTRADA)';
                          Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       DMMain.LogFin(Format(_('Importando pedido %s (CLAVE1=%s)'), [NumPed, Clave1]));
                       FreeAndNil(Q);
                    end;
                 end;
              until ((Cancelar) or (Clave1 = ''));

              if (not Cancelar) then
              begin
                 Logs.Add(_('(i) Borrando fichero cabped.txt'));
                 if not DeleteFile(REntorno.DirectorioEDI_Entrada + 'cabped.txt') then
                    Logs.Add(_('(i) No se pudo borrar fichero cabped.txt'));

                 Logs.Add(_('(i) Borrando fichero obsped.txt'));
                 if not DeleteFile(REntorno.DirectorioEDI_Entrada + 'obsped.txt') then
                    Logs.Add(_('(i) No se pudo borrar fichero obsped.txt'));

                 Logs.Add(_('(i) Borrando fichero linped.txt'));
                 if not DeleteFile(REntorno.DirectorioEDI_Entrada + 'linped.txt') then
                    Logs.Add(_('(i) No se pudo borrar fichero linped.txt'));

                 Logs.Add(_('(i) Borrando fichero obslped.txt'));
                 if not DeleteFile(REntorno.DirectorioEDI_Entrada + 'obslped.txt') then
                    Logs.Add(_('(i) No se pudo borrar fichero obslped.txt'));

                 Logs.Add(_('(i) Borrando fichero loclped.txt'));
                 if not DeleteFile(REntorno.DirectorioEDI_Entrada + 'loclped.txt') then
                    Logs.Add(_('(i) No se pudo borrar fichero loclped.txt'));
              end
              else
              begin
                 Logs.Add(
                    _('(ERROR) Se ha CANCELADO la importación del pedido'));
                 BorrarPedidoNoImportado;
              end;
           except
              on E: Exception do
              begin
                 Logs.Add(
                    _('(ERROR) Error en el procedimiento final:'));
                 Logs.Add(E.Message);
                 BorrarPedidoNoImportado;
              end;
           end;
        finally
           DMMain.LogFin('Finalmente Importar');
        end;
     end
     else
     begin
        Logs.Add('');
        Logs.Add(_('(i) Se mantienen los ficheros.'));
        Logs.Add('');
     end;
     MemoCab.Free;
     MemoDet.Free;
  finally
     DMMain.LogFin('ImportaPedido');
  end;
end;

procedure TDMEDI.SeleccionAlbaranes(MuestraTodo: boolean; Serie: string; Desde, Hasta: integer);
begin
  with xAlbAProcesar do
  begin
     if (Transaction.InTransaction) then
        Transaction.Commit;
     Transaction.StartTransaction;
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT GC.EMPRESA,GC.EJERCICIO,GC.CANAL,GC.SERIE,GC.TIPO,GC.RIG,GC.ALMACEN, ');
        Add(' GC.FECHA,GC.CLIENTE,GC.SU_REFERENCIA,GC.FORMA_PAGO,GC.AGENTE,GC.LIQUIDO, ');
        Add(' EP.PROCESAR,EP.PROCESADO ');
        Add(' FROM EDI_PROCESADO EP ');
        Add(' JOIN GES_CABECERAS_S GC ');
        Add(' ON ');
        Add(' EP.EMPRESA = GC.EMPRESA AND ');
        Add(' EP.EJERCICIO = GC.EJERCICIO AND ');
        Add(' EP.CANAL = GC.CANAL AND ');
        Add(' EP.SERIE = GC.SERIE AND ');
        Add(' EP.TIPO = GC.TIPO AND ');
        Add(' EP.RIG = GC.RIG ');
        Add(' WHERE ');
        Add(' EP.EMPRESA=?EMPRESA AND ');
        Add(' ((EP.EJERCICIO=?EJERCICIO) OR (EP.EJERCICIO=?EJERCICIO - 1)) AND ');
        Add(' EP.CANAL=?CANAL AND ');
        Add(' EP.TIPO=?TIPO AND ');
        Add(' EP.PROCESADO <= ?PROCESADO AND ');
        Add(' (GC.TERCERO in (SELECT TERCERO FROM SYS_TERCEROS WHERE CODIGO_EDI >'''')) ');
        if (Trim(Serie) <> '') then
           Add(' AND GC.Serie = ''' + Serie + '''');
        if (Desde <> 0) then
           Add(' AND GC.RIG >= ' + IntToStr(Desde));
        if (Hasta <> 0) then
           Add(' AND GC.RIG <= ' + IntToStr(Hasta));
        Add(' ORDER BY EP.SERIE,EP.RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := 'ALB';
     if (MuestraTodo) then
        Params.ByName['PROCESADO'].AsInteger := 1
     else
        Params.ByName['PROCESADO'].AsInteger := 0;
     Open;
  end;
end;

procedure TDMEDI.SeleccionAlbaranesEti(MuestraTodo: boolean);
begin
  with xAlbEtiAProcesar do
  begin
     if (Transaction.InTransaction) then
        Transaction.Commit;
     Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := 'ALB';
     if (MuestraTodo) then
        Params.ByName['ETIQUETA'].AsInteger := 1
     else
        Params.ByName['ETIQUETA'].AsInteger := 0;
     Open;
  end;
end;

procedure TDMEDI.SeleccionFacturas(MuestraTodo: boolean; Serie: string; Desde, Hasta: integer);
begin
  with xFacAProcesar do
  begin
     if (Transaction.InTransaction) then
        Transaction.Commit;
     Transaction.StartTransaction;
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT GC.EMPRESA,GC.EJERCICIO,GC.CANAL,GC.SERIE,GC.TIPO,GC.RIG,GC.ALMACEN, ');
        Add(' GC.FECHA,GC.CLIENTE,GC.SU_REFERENCIA,GC.FORMA_PAGO,GC.AGENTE,GC.LIQUIDO, ');
        Add(' EP.PROCESAR,EP.PROCESADO ');
        Add(' FROM EDI_PROCESADO EP ');
        Add(' JOIN GES_CABECERAS_S GC ');
        Add(' ON ');
        Add(' EP.EMPRESA = GC.EMPRESA AND ');
        Add(' EP.EJERCICIO = GC.EJERCICIO AND ');
        Add(' EP.CANAL = GC.CANAL AND ');
        Add(' EP.SERIE = GC.SERIE AND ');
        Add(' EP.TIPO = GC.TIPO AND ');
        Add(' EP.RIG = GC.RIG ');
        Add(' WHERE ');
        Add(' EP.EMPRESA=?EMPRESA AND ');
        Add(' ((EP.EJERCICIO=?EJERCICIO) OR (EP.EJERCICIO=?EJERCICIO - 1)) AND ');
        Add(' EP.CANAL=?CANAL AND ');
        Add(' EP.TIPO=?TIPO AND ');
        Add(' EP.PROCESADO <= ?PROCESADO AND ');
        Add(' GC.ESTADO = 5 AND ');
        Add(' (GC.TERCERO in (SELECT TERCERO FROM SYS_TERCEROS WHERE CODIGO_EDI >'''')) ');
        if (Trim(Serie) <> '') then
           Add(' AND GC.SERIE = ''' + Serie + '''');
        if (desde <> 0) then
           Add(' AND GC.RIG >= ' + IntToStr(desde));
        if (hasta <> 0) then
           Add(' AND GC.RIG <= ' + IntToStr(hasta));
        Add(' ORDER BY EP.SERIE,EP.RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := 'FAC';
     if (MuestraTodo) then
        Params.ByName['PROCESADO'].AsInteger := 1
     else
        Params.ByName['PROCESADO'].AsInteger := 0;
     Open;
  end;
end;

procedure TDMEDI.ExportaAlbaranes;
begin
  FMEDI.LProcesandoAlbaran.Visible := True;
  xAlbAProcesar.DisableControls;
  try
     xAlbAProcesar.First;
     repeat
        if (xAlbAProcesarPROCESAR.AsInteger = 1) then
        begin
           FMEDI.LProcesandoAlbaran.Caption := Format(_('Procesando albarán %s'), [xAlbAProcesarSERIE.AsString + '/' + xAlbAProcesarRIG.AsString]);
           Application.ProcessMessages;
           AbreData(TDMExportaAlbaranEDI, DMExportaAlbaranEDI);
           DMExportaAlbaranEDI.Exporta(xAlbAProcesarEMPRESA.AsInteger,
              xAlbAProcesarEJERCICIO.AsInteger, xAlbAProcesarCANAL.AsInteger,
              xAlbAProcesarSERIE.AsString, xAlbAProcesarTIPO.AsString,
              xAlbAProcesarRIG.AsInteger);
           CierraData(DMExportaAlbaranEDI);
        end;
        xAlbAProcesar.Next;
     until xAlbAProcesar.EOF;
     xAlbAProcesar.Close;
     xAlbAProcesar.Open;
     FMEDI.LProcesandoAlbaran.Visible := False;
  finally
     xAlbAProcesar.EnableControls;
  end;
end;

procedure TDMEDI.ExportaFacturas;
begin
  FMEDI.LProcesandoFactura.Visible := True;
  with xFacAProcesar do
  begin
     DisableControls;
     try
        First;
        repeat
           if (xFacAProcesarPROCESAR.AsInteger = 1) then
           begin
              FMEDI.LProcesandoFactura.Caption := Format(_('Procesando factura %s'), [xFacAProcesarSERIE.AsString + '/' + xFacAProcesarRIG.AsString]);
              Application.ProcessMessages;
              AbreData(TDMExportaFacturaEDI, DMExportaFacturaEDI);
              DMExportaFacturaEDI.Exporta(xFacAProcesarEMPRESA.AsInteger,
                 xFacAProcesarEJERCICIO.AsInteger, xFacAProcesarCANAL.AsInteger,
                 xFacAProcesarSERIE.AsString, xFacAProcesarTIPO.AsString,
                 xFacAProcesarRIG.AsInteger);
              CierraData(DMExportaFacturaEDI);
           end;
           Next;
        until EOF;
        Close;
        Open;
        FMEDI.LProcesandoFactura.Visible := False;
     finally
        xFacAProcesar.EnableControls;
     end;
  end;
end;

procedure TDMEDI.ImprimirEtiquetasAlbaranes(Previsualizar: boolean);
var
  Modo : integer;
begin
  Modo := 1;
  if (Previsualizar) then
     Modo := 0;

  with xAlbEtiAProcesar do
  begin
     DisableControls;
     try
        First;
        repeat
           if (xAlbEtiAProcesarPROCESAR.AsInteger = 1) then
           begin
              AbreData(TDMExportaAlbaranEDI, DMExportaAlbaranEDI);
              DMExportaAlbaranEDI.ImprimirEtiqueta(
                 xAlbEtiAProcesarEMPRESA.AsInteger, xAlbEtiAProcesarEJERCICIO.AsInteger,
                 xAlbEtiAProcesarCANAL.AsInteger, xAlbEtiAProcesarSERIE.AsString,
                 xAlbEtiAProcesarTIPO.AsString, xAlbEtiAProcesarRIG.AsInteger, Modo);
              CierraData(DMExportaAlbaranEDI);
           end;
           Next;
        until EOF;
        Close;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMEDI.ImportaDeclaracionPO(Empresa, Ejercicio, Canal: integer; Logs: TStrings);
var
  Tf : TextFile;
  Linea : string;
  Tercero, Direccion : integer;
  Error : boolean;
  TipoRazon : string;
  Q : THYFIBQuery;
begin
  AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'declpo.txt');
  if (FileExists(REntorno.DirectorioEDI_Entrada + 'declpo.txt')) then
  begin
     Reset(Tf);
     while not EOF(Tf) do
     begin
        Error := False;
        ReadLn(Tf, Linea);

        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select tercero from sys_terceros where codigo_edi starting with ''' +
              Copy(Linea, 96, 7) + '''';
           ExecQuery;
           Tercero := FieldByName['TERCERO'].AsInteger;
           FreeHandle;
        end;
        FreeAndNil(Q);

        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select direccion from sys_terceros_direcciones where codigo_edi = ''' +
              Copy(Linea, 96, 13) + '''';
           ExecQuery;
           Direccion := FieldByName['DIRECCION'].AsInteger;
           FreeHandle;
        end;
        FreeAndNil(Q);

        if (Copy(Linea, 11, 3) = 'CPO') then {Crear de Punto Operacional}
        begin
           if ((Tercero <> 0) and (Direccion <> 0)) then
           begin
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'select NOMBRE_R_SOCIAL from ver_terceros_edicion where tercero =' +
                    IntToStr(Tercero);
                 ExecQuery;
                 Logs.Add(
                    Format(_('(!) El mensaje debe Crear el Punto Operacional %s, pero ya esta creado.'), [Trim(Copy(Linea, 96, 13))]));
                 Logs.Add('    ' + _('Nombre') + ' : ' + Trim(
                    Copy(Linea, 113, 35)));
                 Logs.Add('    ' + _('Direccion') + ' : ' + Trim(
                    Copy(Linea, 148, 35)));
                 Logs.Add('    ' + _('CP/Poblacion') + ' : ' + Trim(
                    Copy(Linea, 243, 5)) + ' - ' + Trim(Copy(Linea, 183, 35)) +
                    ' (' + Trim(Copy(Linea, 248, 2)) + ')');
                 Logs.Add(
                    '    ---------------------------------------------------------------');
                 Logs.Add('    ' + _('Tercero') + ' : ' + IntToStr(Tercero));
                 Logs.Add('   ' + _('Nombre') + ' : ' +
                    FieldByName['NOMBRE_R_SOCIAL'].AsString);
                 FreeHandle;
              end;
              FreeAndNil(Q);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'select DIR_COMPLETA_N from ver_terceros_direcciones where tercero =' +
                    IntToStr(Tercero) + ' and direccion =' + IntToStr(Direccion);
                 ExecQuery;
                 Logs.Add('    ' + _('Direccion') + ' : ' +
                    FieldByName['DIR_COMPLETA_N'].AsString);
                 FreeHandle;
              end;
              FreeAndNil(Q);
           end
           else
           begin
              if (Tercero = 0) then
              begin
                 Tercero := DMMain.ContadorGen('CONTA_TERCEROS');
                 TipoRazon := 'DE';
                 if (Pos('SL', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SL';
                 if (Pos('SA', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SA';
                 if (Pos('SC', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SC';
                 if (Pos('SRL', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SRL';
                 if (Pos('SAL', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SAL';
                 if (Pos('S.L.', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SL';
                 if (Pos('S.A.', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SA';
                 if (Pos('S.C.', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SC';
                 if (Pos('S.R.L.', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SRL';
                 if (Pos('S.A.L.', Trim(Copy(Linea, 113, 35))) > 0) then
                    TipoRazon := 'SAL';
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text :=
                          'insert into sys_terceros (tercero,nombre_r_social,nombre_comercial,tipo_razon,nif,telefono01,telefax,email,codigo_edi,registro_mercantil) ' +
                          'vaules (' + IntToStr(Tercero) + ',''' + Trim(
                          Copy(Linea, 113, 35)) + ''',''' + Trim(Copy(Linea, 113, 35)) +
                          ''',''' + TipoRazon + ''',' +
                          '''' + Trim(Copy(Linea, 321, 35)) + ''',''' + Trim(
                          Copy(Linea, 398, 17)) + ''',''' + Trim(Copy(Linea, 423, 17)) + ''',' +
                          '''' + Trim(Copy(Linea, 363, 17)) + ''',''' + Trim(
                          Copy(Linea, 96, 17)) + ''',''' + Trim(Copy(Linea, 251, 70)) + ''')';
                       ExecQuery;
                       FreeHandle;
                    except
                       on E: Exception do
                       begin
                          Error := True;
                          Logs.Add(
                             Format(_('(!) Error al modificar el Punto Operacional %s'), [Trim(Copy(Linea, 96, 13))]));
                          Logs.Add(E.Message);
                       end;
                    end;
                 end;
                 FreeAndNil(Q);
              end;

              if (Direccion = 0) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'execute procedure cod_tercero_aux(' + IntToStr(Tercero) + ',3)';
                    ExecQuery;
                    Tercero := FieldByName['CONT'].AsInteger;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text :=
                          'insert into sys_terceros (tercero,nombre_r_social,nombre_comercial,tipo_razon,nif,telefono01,telefax,email,codigo_edi,registro_mercantil)' +
                          'vaules (' + IntToStr(Tercero) + ',''' + Trim(
                          Copy(Linea, 113, 35)) + ''',''' + Trim(Copy(Linea, 113, 35)) +
                          ''',''' + TipoRazon + ''',' +
                          '''' + Trim(Copy(Linea, 321, 35)) + ''',''' + Trim(
                          Copy(Linea, 398, 17)) + ''',''' + Trim(Copy(Linea, 423, 17)) + ''',' +
                          '''' + Trim(Copy(Linea, 363, 17)) + ''',''' + Trim(
                          Copy(Linea, 96, 17)) + ''',''' + Trim(Copy(Linea, 251, 70)) + ''')';
                       ExecQuery;
                       FreeHandle;
                    except
                       on E: Exception do
                       begin
                          Error := True;
                          Logs.Add(
                             Format(_('(!) Error al modificar el Punto Operacional %s'), [Trim(Copy(Linea, 96, 13))]));
                          Logs.Add(E.Message);
                       end;
                    end;
                 end;
                 FreeAndNil(Q);
              end;
              if (not Error) then
                 Logs.Add(Format(_('(i) Se Ha creado el tercero %s'), [IntToStr(Tercero)]));
           end;
        end;

        if (Copy(Linea, 11, 3) = 'SPO') then {Suprimir de Punto Operacional}
        begin
           if ((Tercero = 0) and (Direccion = 0)) then
           begin
              Logs.Add(
                 Format(_('(!) El mensaje debe suprimir el Punto Operacional %s, pero no se encuentra en los terceros.'), [Trim(Copy(Linea, 96, 13))]));
              Logs.Add('    ' + _('Nombre') + ' : ' +
                 Trim(Copy(Linea, 113, 35)));
              Logs.Add('    ' + _('Direccion') + ' : ' +
                 Trim(Copy(Linea, 148, 35)));
              Logs.Add('    ' + _('CP/Poblacion') + ' : ' + Trim(
                 Copy(Linea, 243, 5)) + ' - ' + Trim(Copy(Linea, 183, 35)) +
                 ' (' + Trim(Copy(Linea, 248, 2)) + ')');
           end
           else
           begin
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'delete from sys_terceros_direcciones where codigo_edi starting with ''' + Copy(Linea, 96, 13) + '''';
                    ExecQuery;
                    FreeHandle;
                    Logs.Add('    ' + Format(_('Se ha borrado el Punto Operacional %s'), [Trim(Copy(Linea, 96, 13))]));
                 except
                    on E: Exception do
                    begin
                       Logs.Add(Format(_('(!) Error al borrar el Punto Operacional %s'), [Trim(Copy(Linea, 96, 13))]));
                       Logs.Add(E.Message);
                    end;
                 end;
              end;
              FreeAndNil(Q);
           end;
        end;
        if (Copy(Linea, 11, 3) = 'MPO') then {Modificar de Punto Operacional}
        begin
           if ((Tercero = 0) and (Direccion = 0)) then
           begin
              Logs.Add(
                 Format(_('(!) El mensaje debe modificar el Punto Operacional %s, pero no se encuentra en los terceros.'), [Trim(Copy(Linea, 96, 13))]));
              Logs.Add('    ' + _('Nombre') + ' : ' +
                 Trim(Copy(Linea, 113, 35)));
              Logs.Add('    ' + _('Direccion') + ' : ' +
                 Trim(Copy(Linea, 148, 35)));
              Logs.Add('    ' + _('CP/Poblacion') + ' : ' + Trim(
                 Copy(Linea, 243, 5)) + ' - ' + Trim(Copy(Linea, 183, 35)) +
                 ' (' + Trim(Copy(Linea, 248, 2)) + ')');
           end
           else
           begin
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' update sys_terceros ');
                    SQL.Add(' set ');
                    SQL.Add(' nombre_r_social=''' + Trim(Copy(Linea, 113, 35)) + ''' ');
                    SQL.Add(' telefono01=''' + Trim(Copy(Linea, 398, 17)) + ''' ');
                    SQL.Add(' telefax=''' + Trim(Copy(Linea, 423, 17)) + ''' ');
                    SQL.Add(' email=''' + Trim(Copy(Linea, 363, 17)) + ''' ');
                    SQL.Add(' registro_mercantil=''' + Trim(Copy(Linea, 251, 100)) + ''' ');
                    SQL.Add(' where tercero = ' + IntToStr(Tercero));
                    ExecQuery;
                    FreeHandle;
                 except
                    on E: Exception do
                    begin
                       Logs.Add(Format(_('(!) Error al modificar el Punto Operacional %s'), [Trim(Copy(Linea, 96, 13))]));
                       Logs.Add(E.Message);
                    end;
                 end;
              end;
              FreeAndNil(Q);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' update sys_terceros_direcciones ');
                    SQL.Add(' set ');
                    SQL.Add(' dir_nombre=''' + Trim(Copy(Linea, 148, 35)) + ''' ');
                    SQL.Add(' dir_telefono01=''' + Trim(Copy(Linea, 398, 17)) + ''' ');
                    SQL.Add(' dir_telefax=''' + Trim(Copy(Linea, 423, 17)) + ''' ');
                    SQL.Add(' where tercero = ' + IntToStr(Tercero));
                    SQL.Add(' and direccion = ' + IntToStr(Direccion));
                    ExecQuery;
                    FreeHandle;
                 except
                    on E: Exception do
                    begin
                       Logs.Add(Format(_('(!) Error al modificar el Punto Operacional %s'), [Trim(Copy(Linea, 96, 13))]));
                       Logs.Add(E.Message);
                    end;
                 end;
              end;
              FreeAndNil(Q);
           end;
           Logs.Add('    ' + Format(_('Se ha modificado el Punto Operacional %s'), [Trim(Copy(Linea, 96, 13))]));
        end;
        if (Copy(Linea, 11, 3) = 'IPO') then {Confirmar de Punto Operacional}
        begin
           if ((Tercero = 0) and (Direccion = 0)) then
           begin
              Logs.Add(
                 '(!) El mensaje debe confirmar el Punto Operacional ' +
                 Trim(Copy(Linea, 96, 13)) +
                 ', pero no se encuentra en los terceros.');
              Logs.Add('    ' + _('Nombre') + ' : ' +
                 Trim(Copy(Linea, 113, 35)));
              Logs.Add('    ' + _('Direccion') + ' : ' +
                 Trim(Copy(Linea, 148, 35)));
              Logs.Add('    ' + _('CP/Poblacion') + ' : ' + Trim(
                 Copy(Linea, 243, 5)) + ' - ' + Trim(Copy(Linea, 183, 35)) +
                 ' (' + Trim(Copy(Linea, 248, 2)) + ')');
           end
           else
           begin
              Logs.Add(
                 Format(_('(i) El mensaje CONFIRMA el Punto Operacional %s, pero no se encuentra en los terceros.'), [Trim(Copy(Linea, 96, 13))]));
              Logs.Add('    ' + _('Nombre') + ' : ' +
                 Trim(Copy(Linea, 113, 35)));
              Logs.Add('    ' + _('Direccion') + ' : ' +
                 Trim(Copy(Linea, 148, 35)));
              Logs.Add('    ' + _('CP/Poblacion') + ' : ' + Trim(
                 Copy(Linea, 243, 5)) + ' - ' + Trim(Copy(Linea, 183, 35)) +
                 ' (' + Trim(Copy(Linea, 248, 2)) + ')');
           end;
        end;
     end;
     CloseFile(Tf);
  end;
end;

procedure TDMEDI.MarcaAlbaranes(Procesar: integer);
begin
  with xAlbAProcesar do
  begin
     DisableControls;
     try
        First;
        repeat
           if (FieldByName('PROCESAR').AsInteger <> Procesar) then
           begin
              Edit;
              FieldByName('PROCESAR').AsInteger := Procesar;
              Post;
           end;
           Next;
        until EOF;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMEDI.MarcaFacturas(Procesar: integer);
begin
  with xFacAProcesar do
  begin
     DisableControls;
     try
        First;
        repeat
           if (FieldByName('PROCESAR').AsInteger <> Procesar) then
           begin
              Edit;
              FieldByName('PROCESAR').AsInteger := Procesar;
              Post;
           end;
           Next;
        until EOF;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMEDI.GenerarReporteDeVentas(Serie: string; Desde, Hasta: TDateTime; Familia, Emisor, Receptor, Proveedor, Comprador, CodigoDeLugar: string);
var
  s : TStrings;
  // Genericos
  FmtSoloFecha, FmtFechaHora, FmtPeriodo : string;
  // UNA
  SepGrupo, SepDato, SepLibre, FinSegmento : string;
  SepDecimal : char;
  // UNB
  { Emisor, -parametro} EmisorCualificador : string;
  { Receptor, -parametro} ReceptorCualificador : string;
  Referencia : string;
  // UNH
  ReferenciaCabecera, MessageType, MessageVersionNumber, ReleaseNumber, ControllingAgency, AssocAssignedCode : string;
  // BGM
  DocumentNameCode, CodeListIdCode, CodeListRespAgency, MessageFunction : string;
  ContadorSLSRPT : integer;
  // NAD - Proveedor
  // Proveedor : string;
  // NAD - Comprador
  // Comprador : string;
  // Nombre, Direccion, Localidad, CodigoPostal, Pais : string;
  // LOC
  // CodigoDeLugar : string;
  // DTM
  Fecha, UltimaFecha : TDateTime;
  // LIN
  LineaDeReporte : integer;
  Articulo : string;
  // PRI
  BaseImponible, Precio : double;
  // QTY
  Unidades : double;
  // UNT
  CantidadSegmentos : integer;
  // UNZ
  CantidadInformes : integer;
begin
  /// Genera fichero EDI SLSRPT.
  /// Reporte de ventas entre fechas

  // Preparo los datos
  with xReporteDeVentas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['FAMILIA'].AsString := Familia;
     Open;
  end;

  SepGrupo := ':';
  SepDato := '+';
  SepDecimal := '.';
  SepLibre := '?';
  FinSegmento := '''';
  FmtSoloFecha := '102'; // YYYYMMDD
  FmtFechaHora := '203'; // YYYYMMDDHHNN
  FmtPeriodo := '718'; //YYYYMMDD-YYYYMMDD
  // Datos a averiguar
  // Parametro - Emisor := '9120049430253'; // Absenderbezeichnung
  EmisorCualificador := '14'; // Teilnehmerbezeichnung, Qualifier
  // Parametro - Receptor := '9003025000001'; // Empfängerbezeichnung
  ReceptorCualificador := '14'; // Teilnehmerbezeichnung, Qualifier
  Referencia := FormatDateTime('yyyymmdd', Now); // Referenz oder PaBwort des Empfangers
  ReferenciaCabecera := '1'; // Supongo que un contador

  // Datos para UNH
  MessageType := 'SLSRPT';
  MessageVersionNumber := 'D';
  ReleaseNumber := '96A';
  ControllingAgency := 'UN';
  AssocAssignedCode := 'EAN004';

  // Datos para BGM
  DocumentNameCode := '73E';
  CodeListIdCode := '';
  CodeListRespAgency := '9';
  ContadorSLSRPT := 1;
  MessageFunction := '9'; // 1 Cancelacion, 2 Agregado, 5 Reemplazo,6 Confirmacion, 9 Original, 31 Copia

  // Datos para NAD + SU
  // Parametro - Proveedor := '9003025000001';

  // Datos para NAD + BY
  // Parametro - Comprador := '9120049430253';

  // Parametro - CodigoDeLugar := '9120049430253';
  CantidadSegmentos := 0;
  CantidadInformes := 0;

  s := TStringList.Create;
  with s do
  begin
     try
        // UNA - Simbolos a utilizar
        // UNA:+.?
        Add('UNA' + SepGrupo + SepDato + SepDecimal + SepLibre + FinSegmento);

        // UNB - Segmento cabecera de Mensaje
        // UNB+UNOC:3+9120049430253:14+9003025000001:14+161003:0802+2145
        Add('UNB' + SepDato + 'UNOC' + SepGrupo + '3' + SepDato + Emisor + SepGrupo + EmisorCualificador + SepDato + Receptor + SepGrupo + ReceptorCualificador + SepDato + FormatDateTime('yyyymmdd', Now) + SepGrupo + FormatDateTime('hhnn', Now) + SepDato + Referencia);
        Inc(CantidadInformes);

        // UNH - Cabecera de Informe
        // UNH+1+SLSRPT:D:96A:UN:EAN004
        Add('UNH' + SepDato + ReferenciaCabecera + SepDato + MessageType + SepGrupo + MessageVersionNumber + SepGrupo + ReleaseNumber + SepGrupo + ControllingAgency + SepGrupo + AssocAssignedCode);
        Inc(CantidadSegmentos);

        // BGM - Comienzo de Informe
        // BGM+73E::9+908+9
        Add('BGM' + SepDato + DocumentNameCode + SepGrupo + CodeListIdCode + SepGrupo + CodeListRespAgency + SepDato + IntToStr(ContadorSLSRPT) + SepDato + MessageFunction);
        Inc(CantidadSegmentos);

        // DTM - Fecha de Informe
        // DTM+137:20161003:102
        Add('DTM' + SepDato + '137' + SepGrupo + FormatDateTime('yyyymmdd', Now) + SepGrupo + FmtSoloFecha);
        Inc(CantidadSegmentos);

        // DTM - Fecha de inicio de reporte
        // DTM+90:20160930:102
        Add('DTM' + SepDato + '90' + SepGrupo + FormatDateTime('yyyymmdd', Desde) + SepGrupo + FmtSoloFecha);
        Inc(CantidadSegmentos);

        // DTM - Fecha fin de reporte
        // DTM+90:20160930:102
        Add('DTM' + SepDato + '91' + SepGrupo + FormatDateTime('yyyymmddhhnn', Hasta) + SepGrupo + FmtFechaHora);
        Inc(CantidadSegmentos);

        // SG2 - Segmento 2 - Proveedor
        // NAD - Participantes del mensaje -SU Proveedor
        // NAD+SU+9003025000001::9
        Add('NAD' + SepDato + 'SU' + SepDato + Proveedor + SepGrupo + SepGrupo + CodeListRespAgency);
        Inc(CantidadSegmentos);
        // Aqui se puede agregar informacion de direccion si se desea

        // SG2 - Comprador
        // NAD Participantes del mensaje - BY Comprador
        // NAD+BY+9120049430253::9

        // Asi sería si conocemos el id del comprador
        Add('NAD' + SepDato + 'BY' + SepDato + Comprador + SepGrupo + SepGrupo + CodeListRespAgency);
        Inc(CantidadSegmentos);

        // Así sería si no conocemos el id y debemo enviar los datos del comprador.
        {
        Nombre := Copy(xReporteDeVentas.FieldByName('NOMBRE_R_SOCIAL').AsString, 1, 35);
        if (Trim(Copy(xReporteDeVentas.FieldByName('NOMBRE_R_SOCIAL').AsString, 36, 35)) > '') then
           Nombre := SepGrupo + Copy(xReporteDeVentas.FieldByName('NOMBRE_R_SOCIAL').AsString, 36, 35);
        Direccion := Copy(xReporteDeVentas.FieldByName('DIR_COMPLETA_N').AsString, 1, 35);
        if (Trim(Copy(xReporteDeVentas.FieldByName('DIR_COMPLETA_N').AsString, 36, 35)) > '') then
           Direccion := SepGrupo + Copy(xReporteDeVentas.FieldByName('DIR_COMPLETA_N').AsString, 36, 35);
        Localidad := Copy(xReporteDeVentas.FieldByName('TITULO_LOCALIDAD').AsString, 1, 35);
        CodigoPostal := Copy(xReporteDeVentas.FieldByName('CODIGO_POSTAL').AsString, 1, 17);
        Pais := Copy(xReporteDeVentas.FieldByName('PAIS').AsString, 1, 3);
        Add('NAD' + SepDato + 'BY' + SepDato + SepGrupo + SepGrupo + SepDato + Nombre + SepDato + Nombre + SepDato + Direccion + SepDato + Localidad + SepDato + SepGrupo + SepGrupo + SepGrupo + SepDato + CodigoPostal + SepDato + Pais);
        Inc(CantidadSegmentos);
        }

        {
        // NAD Participantes del mensaje - CO Corporate Office
        // NAD+CO+1234567890123::9
        Add('NAD' + SepDato + 'CO' + SepDato + CorporateOffice + SepGrupo + SepGrupo + CodeListRespAgency);
        // Aqui se puede agregar informacion de direccion si se desea
        }

        // SG5 Moneda
        // CUX - Moneda - 2 De referencia - 9 de Pedido, 10 De precios, 11 De Pago
        // CUX+2:EUR:10
        Add('CUX' + SepDato + '2' + SepGrupo + Copy(xReporteDeVentas.FieldByName('MONEDA').AsString, 1, 3) + SepGrupo + '10');
        Inc(CantidadSegmentos);

        // Inicializo variables
        LineaDeReporte := 0;
        // Inicializo con un valor fuera del rango del listado
        UltimaFecha := Desde - 1;

        // Recorro datos
        while (not xReporteDeVentas.EOF) do
        begin
           Inc(LineaDeReporte);
           Articulo := xReporteDeVentas.FieldByName('ALFA_8').AsString; // Código de Collonil en Coimbra
           BaseImponible := xReporteDeVentas.FieldByName('B_IMPONIBLE_UNIT').AsFloat;
           Precio := xReporteDeVentas.FieldByName('LIQUIDO_UNIT').AsFloat;
           Unidades := xReporteDeVentas.FieldByName('UNIDADES').AsFloat;
           Fecha := Trunc(xReporteDeVentas.FieldByName('FECHA').AsFloat);

           // Si la fecha cambia, se escribe un registro para informar la fecha de las proximas lineas
           if (Fecha <> UltimaFecha) then
           begin
              // SG6 - Grupo de lugar de venta
              // LOC - 162 Lugar de venta
              // LOC+162+9120049430253::9
              // Add('162' + SepDato + '2' + SepGrupo + CodigoDeLugar + SepGrupo + SepGrupo + CodeListRespAgency);
              // Inc(CantidadSegmentos);

              // DTM Fecha de la venta
              // DTM+356:20160930:102
              Add('DTM' + SepDato + '90' + SepGrupo + FormatDateTime('yyyymmdd', Fecha) + SepGrupo + FmtSoloFecha);
              Inc(CantidadSegmentos);

              UltimaFecha := Fecha;
           end;

           // SG8 Line de venta
           // LIN - Linea de venta
           // LIN+1++4002092901254:EN
           Add('LIN' + SepDato + IntToStr(LineaDeReporte) + SepDato + {1 ???, 2 borrado, 3 modificado} SepDato + Articulo + SepGrupo + 'EN'{CodeListIdentificationCode - Deberia ser un codigo EAN, creo});
           Inc(CantidadSegmentos);

           // SG9 Precios
           // PRI - Detalles de precio - AAA Neto
           // PRI+AAA:8.12::RTP
           Add('PRI' + SepDato + 'AAA' + SepGrupo + FloatToStrDec(BaseImponible, SepDecimal, '0.00') + SepGrupo + {CT Contrato, CA Catalogo} SepGrupo + 'RTP' {Precio unitario - En otra version es NTP});
           Inc(CantidadSegmentos);

           // PRI - Detalles de precio - NTP ???
           // PRI+NTP:8.12::RTP
           Add('PRI' + SepDato + 'NTP' + SepGrupo + FloatToStrDec(Precio, SepDecimal, '0.00') + SepGrupo + {CT Contrato, CA Catalogo} SepGrupo + 'RTP' {Precio unitario - En otra version es NTP});
           Inc(CantidadSegmentos);

           // PRI - Detalles de precio - AAB Bruto
           // PRI+AAB:8.12::RTP
           Add('PRI' + SepDato + 'AAB' + SepGrupo + FloatToStrDec(0, SepDecimal, '0.00') + SepGrupo + {CT Contrato, CA Catalogo} SepGrupo + 'RTP' {Precio unitario - En otra version es NTP});
           Inc(CantidadSegmentos);

           // PRI - Detalles de precio - GRP ???
           // PRI+GRP:8.12::RTP
           Add('PRI' + SepDato + 'GRP' + SepGrupo + FloatToStrDec(0, SepDecimal, '0.00') + SepGrupo + {CT Contrato, CA Catalogo} SepGrupo + 'RTP' {Precio unitario - En otra version es NTP});
           Inc(CantidadSegmentos);

           // SG10 Cantidades
           // QTY - Cantidad - 153 Statistical salses quantity
           // QTY+153:1:PCE
           Add('QTY' + SepDato + '153' + SepGrupo + FloatToStrDec(Unidades, SepDecimal, '0.00') + SepGrupo + 'PCE' {PCE Pieza, PR Par});
           Inc(CantidadSegmentos);

           // SG8 Fin - Linea de venta
           // SG6 Fin - Grupo lugar de venta

           xReporteDeVentas.Next;
        end;

        // UNT - Pie de Informe
        // UNT+49+1
        Add('UNT' + SepDato + IntToStr(CantidadSegmentos) + SepDato + ReferenciaCabecera);
        // Aparentemente conteniendo este segmento tambien pero no contando UNA UNB y UNZ

        // UNZ - Pie de Mensaje
        // UNZ+1+2145
        Add('UNZ' + SepDato + IntToStr(CantidadInformes) + SepDato + Referencia);

        FMEDI.MReporteDeVentasErrores.Lines.Text := Text;
     finally
        Free;
     end;
  end;
end;

procedure TDMEDI.MarcaAlbaranesProcesado;
begin
  FMEDI.LProcesandoAlbaran.Visible := True;
  xAlbAProcesar.DisableControls;
  try
     xAlbAProcesar.First;
     repeat
        if (xAlbAProcesarPROCESAR.AsInteger = 1) then
        begin
           FMEDI.LProcesandoAlbaran.Caption := Format(_('Marcando albarán %s'), [xAlbAProcesarSERIE.AsString + '/' + xAlbAProcesarRIG.AsString]);
           Application.ProcessMessages;
           MarcaProcesado(xAlbAProcesarEMPRESA.AsInteger,
              xAlbAProcesarEJERCICIO.AsInteger,
              xAlbAProcesarCANAL.AsInteger,
              xAlbAProcesarSERIE.AsString,
              xAlbAProcesarTIPO.AsString,
              xAlbAProcesarRIG.AsInteger);
        end;
        xAlbAProcesar.Next;
     until xAlbAProcesar.EOF;
     xAlbAProcesar.Close;
     xAlbAProcesar.Open;
     FMEDI.LProcesandoAlbaran.Visible := False;
  finally
     xAlbAProcesar.EnableControls;
  end;
end;

procedure TDMEDI.MarcaFacturasProcesado;
begin
  FMEDI.LProcesandoFactura.Visible := True;
  with xFacAProcesar do
  begin
     DisableControls;
     try
        First;
        repeat
           if (xFacAProcesarPROCESAR.AsInteger = 1) then
           begin
              FMEDI.LProcesandoFactura.Caption := Format(_('Marcando factura %s'), [xFacAProcesarSERIE.AsString + '/' + xFacAProcesarRIG.AsString]);
              Application.ProcessMessages;
              MarcaProcesado(xFacAProcesarEMPRESA.AsInteger
                 , xFacAProcesarEJERCICIO.AsInteger
                 , xFacAProcesarCANAL.AsInteger
                 , xFacAProcesarSERIE.AsString
                 , xFacAProcesarTIPO.AsString
                 , xFacAProcesarRIG.AsInteger);
           end;
           Next;
        until EOF;
        Close;
        Open;
        FMEDI.LProcesandoFactura.Visible := False;
     finally
        xFacAProcesar.EnableControls;
     end;
  end;
end;

procedure TDMEDI.MarcaProcesado(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EDI_PROCESADO ');
        SQL.Add(' SET ');
        SQL.Add(' PROCESAR = 0, ');
        SQL.Add(' PROCESADO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' RIG = :RIG ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := Rig;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEDI.BorrarPedidoNoImportado;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM EDI_PED_CAB WHERE RIG = 0';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM EDI_PED_DET WHERE RIG = 0';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM EDI_PED_DET_LOC WHERE RIG = 0';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMEDI.DameTerceroEDI(CodigoEDI: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 TERCERO FROM SYS_TERCEROS_DIRECCIONES WHERE CODIGO_EDI = ''' + Trim(CodigoEDI) + '''';
        ExecQuery;
        Result := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
