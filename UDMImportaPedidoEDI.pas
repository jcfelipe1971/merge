unit UDMImportaPedidoEDI;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery;

type
  TDMImportaPedidoEDI = class(TDataModule)
     TLocal: THYTransaction;
     QEDIPedCab: THYFIBQuery;
     QEDIPedCabNotas: THYFIBQuery;
     QPedDet: THYFIBQuery;
     QPedDetNotas: THYFIBQuery;
     QImportar: THYFIBQuery;
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Importa(empresa, ejercicio, canal: integer; serie, tipo: string; rig: integer);
  end;

var
  DMImportaPedidoEDI : TDMImportaPedidoEDI;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMImportaPedidoEDI.Importa(empresa, ejercicio, canal: integer; serie, tipo: string; rig: integer);
var
  Tf : TextFile;
  linea : string;
  MemoCab, MemoDet : TStrings;
begin
  {Cabecera ---------------------------------------------------------------------}
  MemoCab := TStringList.Create;
  MemoCab.Clear;
  MemoDet := TStringList.Create;
  MemoDet.Clear;
  AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'cabped.txt');
  if (FileExists(REntorno.DirectorioEDI_Entrada + 'cabped.txt')) then
  begin
     Reset(Tf);
     while not EOF(Tf) do
     begin
        ReadLn(Tf, linea);
        with QEDIPedCab do
        begin
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           Close;
           Params.ByName['EMPRESA'].AsInteger := empresa;
           Params.ByName['EJERCICIO'].AsInteger := ejercicio;
           Params.ByName['CANAL'].AsInteger := canal;
           Params.ByName['SERIE'].AsString := serie;
           Params.ByName['TIPO'].AsString := tipo;
           Params.ByName['CLAVE1'].AsString := Trim(Copy(linea, 1, 8));
           Params.ByName['NODO'].AsString := Trim(Copy(linea, 9, 3));
           if (Trim(Copy(linea, 9, 3)) = '224') then
              MemoCab.Add('Pedido URGENTE !');
           Params.ByName['FUNCION'].AsString := Trim(Copy(linea, 12, 3));
           Params.ByName['NUMPED'].AsString := Trim(Copy(linea, 15, 15));
           Params.ByName['FECHA'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 30, 12)));
           Params.ByName['FECHAEPR'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 42, 12)));
           Params.ByName['FECHAERE'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 54, 12)));
           Params.ByName['FECHATOP'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 66, 12)));
           Params.ByName['FORMAPAG'].AsString := Trim(Copy(linea, 78, 3));
           Params.ByName['CONDESP'].AsString := Trim(Copy(linea, 81, 3));
           if (Trim(Copy(linea, 81, 3)) = 'X1') then
              MemoCab.Add(_('Si envío parcial, cancelar el resto del pedido'));
           if (Trim(Copy(linea, 81, 3)) = 'X2') then
              MemoCab.Add(_('Si envío parcial, entregar el resto del pedido'));
           Params.ByName['PEDABIER'].AsString := Trim(Copy(linea, 84, 17));
           Params.ByName['LPRECIOS'].AsString := Trim(Copy(linea, 101, 17));
           Params.ByName['NCONTRAT'].AsString := Trim(Copy(linea, 118, 17));
           Params.ByName['FCONTRAT'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 135, 12)));
           Params.ByName['CLIENTE'].AsString := Trim(Copy(linea, 147, 17));
           Params.ByName['QPIDE'].AsString := Trim(Copy(linea, 164, 17));
           Params.ByName['AQSF'].AsString := Trim(Copy(linea, 181, 17));
           Params.ByName['DEPTO'].AsString := Trim(Copy(linea, 198, 17));
           Params.ByName['RECEPTOR'].AsString := Trim(Copy(linea, 215, 17));
           Params.ByName['MUELLE'].AsString := Trim(Copy(linea, 232, 17));
           Params.ByName['VENDEDOR'].AsString := Trim(Copy(linea, 249, 17));
           Params.ByName['QPAGA'].AsString := Trim(Copy(linea, 266, 17));
           Params.ByName['PORTES'].AsString := Trim(Copy(linea, 283, 3));
           Params.ByName['RECOGIDA'].AsString := Trim(Copy(linea, 286, 3));
           if (Trim(Copy(linea, 286, 3)) = 'RD') then
              MemoCab.Add(_('Recogida por el emisor del pedido'));
           if (Trim(Copy(linea, 286, 3)) = 'EP') then
              MemoCab.Add(_('Enviado por el receptor del pedido'));
           if (Trim(Copy(linea, 286, 3)) = 'COM') then
              MemoCab.Add(_('Servir pedido completo'));
           if (Trim(Copy(linea, 286, 3)) = 'FNA') then
              MemoCab.Add(_('Facturar y no reponer'));
           if (Trim(Copy(linea, 286, 3)) = 'RNF') then
              MemoCab.Add(_('Reponer y no facturar'));
           Params.ByName['REPOSI'].AsString := Trim(Copy(linea, 289, 35));
           Params.ByName['ENTREGA'].AsString := Trim(Copy(linea, 324, 35));
           Params.ByName['MONEDA'].AsString := Trim(Copy(linea, 359, 3));
           Params.ByName['CALIF1'].AsString := Trim(Copy(linea, 362, 3));
           Params.ByName['SECUEN1'].AsInteger :=
              DMMain.EDIToInt(Trim(Copy(linea, 365, 2)));
           Params.ByName['TIPO1'].AsString := Trim(Copy(linea, 367, 3));
           Params.ByName['PORCEN1'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 370, 8)), 3);
           Params.ByName['IMP_DES1'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 378, 15)), 3);
           Params.ByName['CALIF2'].AsString := Trim(Copy(linea, 393, 3));
           Params.ByName['SECUEN2'].AsInteger :=
              DMMain.EDIToInt(Trim(Copy(linea, 396, 2)));
           Params.ByName['TIPO2'].AsString := Trim(Copy(linea, 398, 3));
           Params.ByName['PORCEN2'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 401, 8)), 3);
           Params.ByName['IMP_DES2'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 409, 15)), 3);
           Params.ByName['CALIF3'].AsString := Trim(Copy(linea, 424, 3));
           Params.ByName['SECUEN3'].AsInteger :=
              DMMain.EDIToInt(Trim(Copy(linea, 427, 2)));
           Params.ByName['TIPO3'].AsString := Trim(Copy(linea, 429, 3));
           Params.ByName['PORCEN3'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 432, 8)), 3);
           Params.ByName['IMP_DES3'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 440, 15)), 3);
           Params.ByName['CALIF4'].AsString := Trim(Copy(linea, 455, 3));
           Params.ByName['SECUEN4'].AsInteger :=
              DMMain.EDIToInt(Trim(Copy(linea, 458, 2)));
           Params.ByName['TIPO4'].AsString := Trim(Copy(linea, 460, 3));
           Params.ByName['PORCEN4'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 463, 3)), 3);
           Params.ByName['IMP_DES4'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 471, 15)), 3);
           Params.ByName['CALIF5'].AsString := Trim(Copy(linea, 486, 3));
           Params.ByName['SECUEN5'].AsInteger :=
              DMMain.EDIToInt(Trim(Copy(linea, 489, 2)));
           Params.ByName['TIPO5'].AsString := Trim(Copy(linea, 491, 3));
           Params.ByName['PORCEN5'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 494, 8)), 3);
           Params.ByName['IMP_DES5'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 502, 15)), 3);
           Params.ByName['TIPOIMP1'].AsString := Trim(Copy(linea, 517, 3));
           Params.ByName['TASAIMP1'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 520, 8)), 3);
           Params.ByName['BASEIMP1'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 528, 15)), 3);
           Params.ByName['IMPIMP1'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 543, 15)), 3);
           Params.ByName['TIPOIMP2'].AsString := Trim(Copy(linea, 558, 3));
           Params.ByName['TASAIMP2'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 562, 8)), 3);
           Params.ByName['BASEIMP2'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 569, 15)), 3);
           Params.ByName['IMPIMP2'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 584, 15)), 3);
           Params.ByName['TIPOIMP3'].AsString := Trim(Copy(linea, 599, 3));
           Params.ByName['TASAIMP3'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 602, 8)), 3);
           Params.ByName['BASEIMP3'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 610, 15)), 3);
           Params.ByName['IMPIMP3'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 625, 15)), 3);
           Params.ByName['PATREF'].AsString := Trim(Copy(linea, 640, 3));
           Params.ByName['PATDIAS'].AsString := Trim(Copy(linea, 643, 3));
           Params.ByName['PATMES'].AsString := Trim(Copy(linea, 646, 3));
           Params.ByName['FECHAV'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 649, 12)));
           Params.ByName['VTO1'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 661, 12)));
           Params.ByName['IMPVTO1'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 673, 15)), 3);
           Params.ByName['VTO2'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 688, 12)));
           Params.ByName['IMPVTO2'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 700, 15)), 3);
           Params.ByName['VTO3'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 715, 12)));
           Params.ByName['IMPVTO3'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 727, 15)), 3);
           Params.ByName['TBRUTO'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 742, 15)), 3);
           Params.ByName['TNETO'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 757, 15)), 3);
           Params.ByName['TCARGDES'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 772, 15)), 3);
           Params.ByName['BASEIMP'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 787, 15)), 3);
           Params.ByName['TOTIMPUES'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 802, 15)), 3);
           Params.ByName['TOTAL'].AsFloat :=
              DMMain.EDIToFloat(Trim(Copy(linea, 817, 15)), 3);
           Params.ByName['FRECOGIDA'].AsDateTime :=
              DMMain.EDIToDate(Trim(Copy(linea, 832, 12)));
           Params.ByName['TRANSPOR'].AsString := Trim(Copy(linea, 844, 17));
           Params.ByName['ALMRECOG'].AsString := Trim(Copy(linea, 861, 17));
           Params.ByName['FREFPAG'].AsDateTime := DMMain.EDIToDate(Copy(linea, 878, 6));
           Params.ByName['TOTCANT'].AsInteger :=
              DMMain.EDIToInt(Trim(Copy(linea, 884, 15)));
           Params.ByName['TEMPORA'].AsString := Trim(Copy(linea, 899, 35));
           Params.ByName['DEPTOVENT'].AsString := Trim(Copy(linea, 934, 17));
           Params.ByName['SUCURSAL'].AsString := Trim(Copy(linea, 951, 17));
           Params.ByName['DESTMSG'].AsString := Trim(Copy(linea, 968, 17));
           Params.ByName['CONDPAGO'].AsString := Trim(Copy(linea, 985, 5));
           Params.ByName['TRANSPORT'].AsString := Trim(Copy(linea, 990, 5));
           Params.ByName['LUGADIENT'].AsString := Trim(Copy(linea, 1010, 17));
           ExecQuery;
           Transaction.Commit;
        end;
     end;
     CloseFile(Tf);
  end;
  {Notas Cabecera ---------------------------------------------------------------}
  AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'obsped.txt');
  if (FileExists(REntorno.DirectorioEDI_Entrada + 'obsped.txt')) then
  begin
     Reset(Tf);
     while not EOF(Tf) do
     begin
        ReadLn(Tf, linea);
        with QEDIPedCabNotas do
        begin
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           Close;
           Params.ByName['EMPRESA'].AsInteger := empresa;
           Params.ByName['EJERCICIO'].AsInteger := ejercicio;
           Params.ByName['CANAL'].AsInteger := canal;
           Params.ByName['SERIE'].AsString := serie;
           Params.ByName['TIPO'].AsString := tipo;
           Params.ByName['CLAVE1'].AsString := Trim(Copy(linea, 1, 8));
           Params.ByName['CLAVE2'].AsString := Trim(Copy(linea, 9, 5));
           Params.ByName['TEMA'].AsString := Trim(Copy(linea, 14, 3));
           Params.ByName['TEXTO1'].AsString := Trim(Copy(linea, 17, 70));
           Params.ByName['TEXTO2'].AsString := Trim(Copy(linea, 87, 70));
           Params.ByName['TEXTO3'].AsString := Trim(Copy(linea, 157, 70));
           Params.ByName['TEXTO4'].AsString := Trim(Copy(linea, 227, 70));
           Params.ByName['TEXTO5'].AsString := Trim(Copy(linea, 297, 70));
           MemoCab.Add(Trim(Copy(linea, 17, 70)));
           MemoCab.Add(Trim(Copy(linea, 87, 70)));
           MemoCab.Add(Trim(Copy(linea, 157, 70)));
           MemoCab.Add(Trim(Copy(linea, 227, 70)));
           MemoCab.Add(Trim(Copy(linea, 297, 70)));
           Params.ByName['NOTAS'].AsString := MemoCab.Text;
           ExecQuery;
           Transaction.Commit;
        end;
     end;
     CloseFile(Tf);
  end;
  {Detalle ----------------------------------------------------------------------}
  AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'linped.txt');
  if (FileExists(REntorno.DirectorioEDI_Entrada + 'linped.txt')) then
  begin
     Reset(Tf);
     while not EOF(Tf) do
     begin
        ReadLn(Tf, linea);
        with QPedDet do
        begin
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           Close;
           Params.ByName['EMPRESA'].AsInteger := empresa;
           Params.ByName['EJERCICIO'].AsInteger := ejercicio;
           Params.ByName['CANAL'].AsInteger := canal;
           Params.ByName['SERIE'].AsString := serie;
           Params.ByName['TIPO'].AsString := tipo;
           Params.ByName['CLAVE1'].AsString := Trim(Copy(linea, 1, 8));
           Params.ByName['CLAVE2'].AsString := Trim(Copy(linea, 9, 5));
           Params.ByName['REFEAN'].AsString := Trim(Copy(linea, 14, 17));
           Params.ByName['DUN14'].AsString := Trim(Copy(linea, 31, 14));
           Params.ByName['VP'].AsString := Trim(Copy(linea, 45, 2));
           Params.ByName['REFCLI'].AsString := Trim(Copy(linea, 47, 35));
           Params.ByName['REFPROV'].AsString := Trim(Copy(linea, 82, 35));
           Params.ByName['REFETIQ'].AsString := Trim(Copy(linea, 117, 35));
           Params.ByName['DESCMER'].AsString := Trim(Copy(linea, 152, 35));
           Params.ByName['DESCMER2'].AsString := Trim(Copy(linea, 187, 35));
           Params.ByName['DESCCONS'].AsString := Trim(Copy(linea, 222, 35));
           Params.ByName['CANTPED'].AsFloat := DMMain.EDIToFloat(Trim(Copy(linea, 257, 15)), 3);
           Params.ByName['UMEDIDA'].AsString := Trim(Copy(linea, 272, 3));
           Params.ByName['CANTGRAT'].AsFloat := DMMain.EDIToFloat(Copy(linea, 275, 15), 3);
           Params.ByName['CANTUE'].AsFloat := DMMain.EDIToFloat(Copy(linea, 290, 15), 3);
           Params.ByName['CANTBONI'].AsFloat := DMMain.EDIToFloat(Copy(linea, 305, 15), 3);
           Params.ByName['FECHAE'].AsDateTime := DMMain.EDIToDate(Copy(linea, 320, 12));
           Params.ByName['PRECION'].AsFloat := DMMain.EDIToFloat(Copy(linea, 332, 15), 3);
           Params.ByName['PRECIOB'].AsFloat := DMMain.EDIToFloat(Copy(linea, 347, 15), 3);
           Params.ByName['PVP'].AsFloat := DMMain.EDIToFloat(Copy(linea, 362, 15), 3);
           Params.ByName['NETO'].AsFloat := DMMain.EDIToFloat(Copy(linea, 377, 15), 3);
           Params.ByName['CALIF1'].AsString := Trim(Copy(linea, 392, 3));
           Params.ByName['SECUEN1'].AsInteger := DMMain.EDIToInt(Copy(linea, 395, 2));
           Params.ByName['TIPO1'].AsString := Trim(Copy(linea, 397, 3));
           Params.ByName['PORCEN1'].AsFloat := DMMain.EDIToFloat(Copy(linea, 400, 8), 3);
           Params.ByName['IMPDES1'].AsFloat := DMMain.EDIToFloat(Copy(linea, 408, 15), 3);
           Params.ByName['CALIF2'].AsString := Trim(Copy(linea, 423, 3));
           Params.ByName['SECUEN2'].AsInteger := DMMain.EDIToInt(Copy(linea, 426, 2));
           Params.ByName['TIPO2'].AsString := Trim(Copy(linea, 428, 3));
           Params.ByName['PORCEN2'].AsFloat := DMMain.EDIToFloat(Copy(linea, 431, 8), 3);
           Params.ByName['IMPDES2'].AsFloat := DMMain.EDIToFloat(Copy(linea, 439, 15), 3);
           Params.ByName['CALIF3'].AsString := Trim(Copy(linea, 454, 3));
           Params.ByName['SECUEN3'].AsInteger := DMMain.EDIToInt(Copy(linea, 457, 2));
           Params.ByName['TIPO3'].AsString := Trim(Copy(linea, 459, 3));
           Params.ByName['PORCEN3'].AsFloat := DMMain.EDIToFloat(Copy(linea, 462, 8), 3);
           Params.ByName['IMPDES3'].AsFloat := DMMain.EDIToFloat(Copy(linea, 470, 15), 3);
           Params.ByName['CALIF4'].AsString := Trim(Copy(linea, 485, 3));
           Params.ByName['SECUEN4'].AsInteger := DMMain.EDIToInt(Copy(linea, 488, 2));
           Params.ByName['TIPO4'].AsString := Trim(Copy(linea, 490, 3));
           Params.ByName['PORCEN4'].AsFloat := DMMain.EDIToFloat(Copy(linea, 493, 8), 3);
           Params.ByName['IMPDES4'].AsFloat := DMMain.EDIToFloat(Copy(linea, 501, 15), 3);
           Params.ByName['TIPOIMP1'].AsString := Trim(Copy(linea, 516, 3));
           Params.ByName['TASAIMP1'].AsFloat := DMMain.EDIToFloat(Copy(linea, 519, 8), 3);
           Params.ByName['IMPIMP1'].AsFloat := DMMain.EDIToFloat(Copy(linea, 527, 15), 3);
           Params.ByName['TIPOIMP2'].AsString := Trim(Copy(linea, 542, 3));
           Params.ByName['TASAIMP2'].AsFloat := DMMain.EDIToFloat(Copy(linea, 545, 8), 3);
           Params.ByName['IMPIMP2'].AsFloat := DMMain.EDIToFloat(Copy(linea, 553, 15), 3);
           Params.ByName['TIPOIMP3'].AsString := Trim(Copy(linea, 568, 3));
           Params.ByName['TASAIMP3'].AsFloat := DMMain.EDIToFloat(Copy(linea, 571, 8), 3);
           Params.ByName['IMPIMP3'].AsFloat := DMMain.EDIToFloat(Copy(linea, 579, 15), 3);
           Params.ByName['NUCUE'].AsFloat := DMMain.EDIToFloat(Copy(linea, 594, 15), 3);
           Params.ByName['FORMATO'].AsString := Trim(Copy(linea, 609, 3));
           Params.ByName['NUEXP'].AsFloat := DMMain.EDIToFloat(Copy(linea, 612, 15), 3);
           Params.ByName['PNCAJA'].AsFloat := DMMain.EDIToFloat(Copy(linea, 627, 15), 3);
           Params.ByName['MONPREC'].AsString := Trim(Copy(linea, 642, 3));
           Params.ByName['MARCA'].AsString := Trim(Copy(linea, 645, 35));
           Params.ByName['COLOR'].AsString := Trim(Copy(linea, 680, 35));
           Params.ByName['TAMANO'].AsString := Trim(Copy(linea, 715, 35));
           Params.ByName['PRESENT'].AsString := Trim(Copy(linea, 750, 35));
           Params.ByName['UNIDCOM'].AsFloat := DMMain.EDIToFloat(Copy(linea, 785, 15), 3);
           Params.ByName['PUM'].AsFloat := DMMain.EDIToFloat(Copy(linea, 900, 15), 3);
           ExecQuery;
           Transaction.Commit;
        end;
     end;
     CloseFile(Tf);
  end;
  {Notas Detalle ----------------------------------------------------------------}
  AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'obslped.txt');
  if (FileExists(REntorno.DirectorioEDI_Entrada + 'obslped.txt')) then
  begin
     Reset(Tf);
     while not EOF(Tf) do
     begin
        ReadLn(Tf, linea);
        with QPedDetNotas do
        begin
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           Close;
           Params.ByName['EMPRESA'].AsInteger := empresa;
           Params.ByName['EJERCICIO'].AsInteger := ejercicio;
           Params.ByName['CANAL'].AsInteger := canal;
           Params.ByName['SERIE'].AsString := serie;
           Params.ByName['TIPO'].AsString := tipo;
           Params.ByName['CLAVE1'].AsString := Trim(Copy(linea, 1, 8));
           Params.ByName['CLAVE2'].AsString := Trim(Copy(linea, 9, 5));
           Params.ByName['CLAVE3'].AsString := Trim(Copy(linea, 14, 3));
           Params.ByName['TEMA'].AsString := Trim(Copy(linea, 19, 3));
           Params.ByName['TEXTO1'].AsString := Trim(Copy(linea, 22, 70));
           Params.ByName['TEXTO2'].AsString := Trim(Copy(linea, 92, 70));
           Params.ByName['TEXTO3'].AsString := Trim(Copy(linea, 162, 70));
           Params.ByName['TEXTO4'].AsString := Trim(Copy(linea, 232, 70));
           Params.ByName['TEXTO5'].AsString := Trim(Copy(linea, 302, 70));
           MemoDet.Add(Trim(Copy(linea, 22, 70)));
           MemoDet.Add(Trim(Copy(linea, 92, 70)));
           MemoDet.Add(Trim(Copy(linea, 162, 70)));
           MemoDet.Add(Trim(Copy(linea, 232, 70)));
           MemoDet.Add(Trim(Copy(linea, 302, 70)));
           Params.ByName['NOTAS'].AsString := MemoDet.Text;
           ExecQuery;
           Transaction.Commit;
        end;
     end;
     CloseFile(Tf);
  end;
  {Cantidad Pedida Por Localizacion ---------------------------------------------}
  AssignFile(Tf, REntorno.DirectorioEDI_Entrada + 'loclped.txt');
  if (FileExists(REntorno.DirectorioEDI_Entrada + 'loclped.txt')) then
  begin
     Reset(Tf);
     while not EOF(Tf) do
     begin
        ReadLn(Tf, linea);
        with QPedDetNotas do
        begin
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           Close;
           Params.ByName['EMPRESA'].AsInteger := empresa;
           Params.ByName['EJERCICIO'].AsInteger := ejercicio;
           Params.ByName['CANAL'].AsInteger := canal;
           Params.ByName['SERIE'].AsString := serie;
           Params.ByName['TIPO'].AsString := tipo;
           Params.ByName['CLAVE1'].AsString := Trim(Copy(linea, 1, 8));
           Params.ByName['CLAVE2'].AsString := Trim(Copy(linea, 9, 5));
           Params.ByName['CLAVE3'].AsString := Trim(Copy(linea, 14, 5));
           Params.ByName['LUGAR'].AsString := Trim(Copy(linea, 19, 17));
           Params.ByName['CANTIDAD'].AsFloat := DMMain.EDIToFloat(Copy(linea, 36, 15), 3);
           Params.ByName['FECHENTR'].AsDateTime := DMMain.EDIToDate(Copy(linea, 51, 12));
           Params.ByName['FECHULT'].AsDateTime := DMMain.EDIToDate(Copy(linea, 63, 12));
           ExecQuery;
           Transaction.Commit;
        end;
     end;
     CloseFile(Tf);
  end;
  with QImportar do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     Transaction.Commit;
  end;
  MemoCab.Free;
  MemoDet.Free;
end;

end.
