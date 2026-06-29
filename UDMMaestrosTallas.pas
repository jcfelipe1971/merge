unit UDMMaestrosTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase, variants,
  UFIBModificados, FIBQuery, HYFIBQuery, FIBDataSetRO, FIBTableDataSetRO;

type
  TDMMaestrosTallas = class(TDataModule)
     TLocal: THYTransaction;
     QMart_colores: TFIBTableSet;
     QMart_coloresID_A_C: TIntegerField;
     QMart_coloresCOD_COLOR: TFIBStringField;
     QMart_coloresTITULO: TFIBStringField;
     QMart_grupos_tallas: TFIBTableSet;
     QMart_tallas: TFIBTableSet;
     QMart_grupos_tallasID_G_T: TIntegerField;
     QMart_grupos_tallasGRUPO: TFIBStringField;
     QMart_grupos_tallasTITULO: TFIBStringField;
     DSart_grupos_tallas: TDataSource;
     QMart_articulos_modelos: TFIBTableSet;
     DSart_articulos_modelos: TDataSource;
     QMver_art_mod_color_edit: TFIBTableSet;
     QMxver_precio_am: TFIBTableSet;
     QMArt_mod_estructura: TFIBDataSet;
     QMart_articulos_modelosID_A_M: TIntegerField;
     QMart_articulos_modelosEMPRESA: TIntegerField;
     QMart_articulos_modelosCOD_MOD: TFIBStringField;
     QMart_articulos_modelosPROVEEDOR: TIntegerField;
     QMart_articulos_modelosTITULO: TFIBStringField;
     QMart_articulos_modelosID_G_T: TIntegerField;
     QMart_articulos_modelosFAMILIA: TFIBStringField;
     QMart_articulos_modelosAGNO: TFIBStringField;
     QMart_articulos_modelosTEMPORADA: TIntegerField;
     QMart_articulos_modelosSECCION: TIntegerField;
     QMart_articulos_modelosPVPORTALLA: TIntegerField;
     QMart_articulos_modelosCONTROL_STOCK: TIntegerField;
     QMart_articulos_modelosP_COMPRA: TFloatField;
     QMart_articulos_modelosP_VENTA: TFloatField;
     QMart_articulos_modelosIVA_INC: TIntegerField;
     QMart_articulos_modelosTIPO_IVA: TIntegerField;
     QMart_articulos_modelosMAXIMO_DES: TFloatField;
     QMart_articulos_modelosREF_PROVEEDOR: TFIBStringField;
     QMart_articulos_modelosDBLNULO: TFloatField;
     QMart_articulos_modelosVCHARNULL: TFIBStringField;
     QMart_articulos_modelosBASE_CREACION: TFIBStringField;
     QMart_articulos_modelosCOD_ESTRUCTURA: TFIBStringField;
     QMver_art_mod_color_editID_A_M_C: TIntegerField;
     QMver_art_mod_color_editID_A_M: TIntegerField;
     QMver_art_mod_color_editID_A_C: TIntegerField;
     QMver_art_mod_color_editHORMA: TIntegerField;
     QMver_art_mod_color_editS_COLOR: TFIBStringField;
     QMver_art_mod_color_editTITULO: TFIBStringField;
     QMver_art_mod_color_editCOD_COLOR: TFIBStringField;
     QMver_art_mod_color_editN_COLOR: TFIBStringField;
     QMart_tallasID_A_T: TIntegerField;
     QMart_tallasID_G_T: TIntegerField;
     QMart_tallasCOD_TALLA: TFIBStringField;
     QMart_tallasTALLA: TFIBStringField;
     QMxver_precio_amEMPRESA: TIntegerField;
     QMxver_precio_amMODO: TIntegerField;
     QMxver_precio_amTARIFA: TFIBStringField;
     QMxver_precio_amID_A_M: TIntegerField;
     QMxver_precio_amID_A_M_C: TIntegerField;
     QMxver_precio_amPROVEEDOR: TIntegerField;
     QMxver_precio_amFAMILIA: TFIBStringField;
     QMxver_precio_amAGNO: TFIBStringField;
     QMxver_precio_amTEMPORADA: TIntegerField;
     QMxver_precio_amSECCION: TIntegerField;
     QMxver_precio_amP_COSTE: TFloatField;
     QMxver_precio_amP_VENTA: TFloatField;
     QMxver_precio_amHORMA: TIntegerField;
     QMxver_precio_amS_COLOR: TFIBStringField;
     QMxver_precio_amID_A_C: TIntegerField;
     QMxver_precio_amP01: TFloatField;
     QMxver_precio_amP02: TFloatField;
     QMxver_precio_amP03: TFloatField;
     QMxver_precio_amP04: TFloatField;
     QMxver_precio_amP05: TFloatField;
     QMxver_precio_amP06: TFloatField;
     QMxver_precio_amP07: TFloatField;
     QMxver_precio_amP08: TFloatField;
     QMxver_precio_amP09: TFloatField;
     QMxver_precio_amP10: TFloatField;
     QMxver_precio_amP11: TFloatField;
     QMxver_precio_amP12: TFloatField;
     QMxver_precio_amP13: TFloatField;
     QMxver_precio_amP14: TFloatField;
     QMxver_precio_amP15: TFloatField;
     QMxver_precio_amP16: TFloatField;
     QMxver_precio_amP17: TFloatField;
     QMxver_precio_amP18: TFloatField;
     QMxver_precio_amP19: TFloatField;
     QMxver_precio_amP20: TFloatField;
     QMxver_precio_amP21: TFloatField;
     QMxver_precio_amP22: TFloatField;
     QMArt_mod_estructuraEMPRESA: TIntegerField;
     QMArt_mod_estructuraCOD_MODELO: TFIBStringField;
     QMArt_mod_estructuraTITULO: TFIBStringField;
     QMart_articulos_modelosBORRAR: TIntegerField;
     TUpdate: THYTransaction;
     DSart_colores: TDataSource;
     DSart_tallas: TDataSource;
     DSart_articulos_mod_color: TDataSource;
     DSQMxver_precio_am: TDataSource;
     DSModelo_estructura: TDataSource;
     QMart_grupos_tallasPREFIJO: TFIBStringField;
     QMart_grupos_tallasSUFIJO: TFIBStringField;
     QMart_coloresID_T_C: TIntegerField;
     QMart_coloresTIPO: TFIBStringField;
     QMart_coloresTITULO_TIPO: TFIBStringField;
     QMart_tallasTITULO: TFIBStringField;
     QMart_tipo_color: TFIBTableSet;
     DSart_tipo_color: TDataSource;
     QMart_tipo_colorID_T_C: TIntegerField;
     QMart_tipo_colorTIPO: TFIBStringField;
     QMart_tipo_colorTITULO: TFIBStringField;
     QMart_articulos_modelosNOTAS: TBlobField;
     QMart_articulos_modelosIMAGEN: TIntegerField;
     QMart_articulos_modelosWEB: TIntegerField;
     QMart_articulos_modelosIMAGEN_WEB: TBlobField;
     QMart_articulos_modelosCLIENTE: TIntegerField;
     QMart_articulos_modelosREF_CLIENTE: TFIBStringField;
     QMver_art_mod_color_editCODIGO_PROVEEDOR: TFIBStringField;
     QMart_articulos_modelosTARIFA_DEFECTO: TFIBStringField;
     QMart_articulos_modelosID_MARCA: TIntegerField;
     xMarcas: TFIBDataSetRO;
     DSxMarcas: TDataSource;
     xMarcasTITULO: TFIBStringField;
     QMart_articulos_modelosID_GALERIA: TIntegerField;
     QMart_articulos_modelosSUBFAMILIA: TFIBStringField;
     QMver_art_mod_color_editIMAGEN: TIntegerField;
     QMArtKit: TFIBTableSet;
     DSQMKitTallas: TDataSource;
     QMArtKitTallas: TFIBTableSet;
     DSQMArtKitTallas: TDataSource;
     QMArtKitID_A_K: TIntegerField;
     QMArtKitEMPRESA: TIntegerField;
     QMArtKitKIT: TFIBStringField;
     QMArtKitID_G_T: TIntegerField;
     QMArtKitTITULO: TFIBStringField;
     QMArtKitTallasID_A_K: TIntegerField;
     QMArtKitTallasID_A_T: TIntegerField;
     QMArtKitTallasUNIDADES: TFloatField;
     QMArtKitTallasID_G_T: TIntegerField;
     QMArtKitTallasCOD_TALLA: TFIBStringField;
     QMArtKitTallasTALLA: TFIBStringField;
     QMArtKitTallasTITULO: TFIBStringField;
     QMArtColorEmpresa: TFIBTableSet;
     DSArtColorEmpresa: TDataSource;
     QMArtColorEmpresaEMPRESA: TIntegerField;
     QMArtColorEmpresaID_A_C: TIntegerField;
     QMArtColorEmpresaPROVEEDOR: TIntegerField;
     QMArtColorEmpresaCODIGO_PROVEEDOR: TFIBStringField;
     QMart_articulos_modelosDESCUENTO_COMPRA: TFloatField;
     QMart_articulos_modelosP_COSTE: TFloatField;
     QMart_articulos_modelosALFA_1: TFIBStringField;
     QMart_articulos_modelosALFA_2: TFIBStringField;
     QMart_articulos_modelosALFA_3: TFIBStringField;
     QMart_articulos_modelosALFA_4: TFIBStringField;
     QMart_articulos_modelosALFA_5: TFIBStringField;
     QMart_articulos_modelosALFA_6: TFIBStringField;
     QMart_articulos_modelosALFA_7: TFIBStringField;
     QMart_articulos_modelosALFA_8: TFIBStringField;
     QMArtColorEmpresaTITULO: TStringField;
     QMver_art_mod_color_editALFA_1: TFIBStringField;
     QMver_art_mod_color_editALFA_2: TFIBStringField;
     QMver_art_mod_color_editALFA_3: TFIBStringField;
     QMver_art_mod_color_editALFA_4: TFIBStringField;
     QMver_art_mod_color_editALFA_5: TFIBStringField;
     QMver_art_mod_color_editALFA_6: TFIBStringField;
     QMver_art_mod_color_editALFA_7: TFIBStringField;
     QMver_art_mod_color_editALFA_8: TFIBStringField;
     QMart_articulos_modelosBAJA: TIntegerField;
     QMart_articulos_modelosFECHA_BAJA: TDateTimeField;
     QMart_articulos_modelosCODIGO_GENERO: TFIBStringField;
     QMart_articulos_modelosCODIGO_TEMPORADA: TFIBStringField;
     QMart_articulos_modelosPACK: TFIBStringField;
     QMart_articulos_modelosP_MERCADO: TFloatField;
     QMart_articulos_modelosCANTIDAD_COMBINACIONES: TIntegerField;
     QMart_coloresIMAGEN: TIntegerField;
     QMart_articulos_modelosFAMILIA_TEJIDO: TFIBStringField;
     QMart_articulos_modelosARTICULO_ESTRUCTURA: TFIBStringField;
     QMart_articulos_modelosARTICULO_CONFECCION: TFIBStringField;
     QMart_articulos_modelosCREA_FALDON: TIntegerField;
     QMart_articulos_modelosCREA_CONFECCION: TIntegerField;
     procedure QMart_coloresBeforePost(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMart_grupos_tallasBeforePost(DataSet: TDataSet);
     procedure QMart_tallasBeforePost(DataSet: TDataSet);
     procedure QMart_articulos_modelosBeforePost(DataSet: TDataSet);
     procedure QMart_articulos_mod_colorBeforePost(DataSet: TDataSet);
     procedure QMart_tallasNewRecord(DataSet: TDataSet);
     procedure QMart_articulos_mod_colorNewRecord(DataSet: TDataSet);
     procedure QMart_articulos_modelosNewRecord(DataSet: TDataSet);
     procedure QMart_articulos_modelosAfterOpen(DataSet: TDataSet);
     procedure QMart_grupos_tallasAfterOpen(DataSet: TDataSet);
     procedure QMart_grupos_tallasAfterPost(DataSet: TDataSet);
     procedure QMart_articulos_modelosBeforeOpen(DataSet: TDataSet);
     procedure QMxver_precio_amPXXChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMart_grupos_tallasNewRecord(DataSet: TDataSet);
     procedure QMart_tallasTALLAChange(Sender: TField);
     procedure QMart_tipo_colorBeforePost(DataSet: TDataSet);
     procedure QMart_articulos_modelosAfterPost(DataSet: TDataSet);
     procedure QMver_art_mod_color_editN_COLORChange(Sender: TField);
     procedure QMart_articulos_modelosBeforeClose(DataSet: TDataSet);
     procedure QMArtKitAfterOpen(DataSet: TDataSet);
     procedure QMArtKitBeforeClose(DataSet: TDataSet);
     procedure QMArtKitBeforePost(DataSet: TDataSet);
     procedure QMArtKitNewRecord(DataSet: TDataSet);
     procedure QMArtKitAfterPost(DataSet: TDataSet);
     procedure QMart_coloresAfterOpen(DataSet: TDataSet);
     procedure QMart_coloresBeforeClose(DataSet: TDataSet);
     procedure QMArtColorEmpresaBeforeOpen(DataSet: TDataSet);
     procedure QMArtColorEmpresaTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArtColorEmpresaNewRecord(DataSet: TDataSet);
     procedure QMart_articulos_modelosDESCUENTO_COMPRAChange(Sender: TField);
     procedure QMart_articulos_modelosP_COMPRAChange(Sender: TField);
     procedure QMArtColorEmpresaCalcFields(DataSet: TDataSet);
     procedure QMver_art_mod_color_editBeforeOpen(DataSet: TDataSet);
     procedure QMart_articulos_modelosCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     LocalMascaraN: string;
     Param_MODCODI001: string;
     Param_MODCODI002: string;
     function DameCodigoModelo(FormatoCodigo, Campo: string): string;
  public
     { Public declarations }
     // procedure LocateTarifa(tarifa: string);
     SQLBase: TStrings;
     procedure AbrirPrecios(Modo: integer; Tarifa: string);
     procedure CerrarPrecios;
     procedure SetDatosLineaNColor(nColor: string; Proveedor: integer);
     procedure CreaArticulosModelo(Automatico: boolean = False);
     procedure ActualizaAlfasArticulosModelo;
     procedure ActualizaAlfasColoresModelo;
     procedure BorrarArticulosModelo;
     procedure PosicionaRefProveedor(RefProveedor: string);
     procedure FiltraModelo(aFiltro: string);
     procedure DuplicaModelo(NuevaRefProveedor: string);
     procedure ModificaPrecioTarifa(Importe: double);
  end;

var
  DMMaestrosTallas : TDMMaestrosTallas;

implementation

uses UDMMain, UEntorno, UDMTallas, UFMMultiTalla, UFMMultiColor, UFormGest,
  UFMain, UParam, UUtiles, UDameDato;

{$R *.dfm}

procedure TDMMaestrosTallas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not Tlocal.InTransaction then
     TLocal.StartTransaction;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  QMxver_precio_amP01.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP02.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP03.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP04.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP05.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP06.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP07.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP08.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP09.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP10.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP11.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP12.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP13.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP14.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP15.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP16.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP17.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP18.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP19.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP20.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP21.DisplayFormat := LocalMascaraN;
  QMxver_precio_amP22.DisplayFormat := LocalMascaraN;
  QMart_articulos_modelosP_COMPRA.DisplayFormat := LocalMascaraN;
  QMart_articulos_modelosDESCUENTO_COMPRA.DisplayFormat := MascaraP;
  QMart_articulos_modelosP_MERCADO.DisplayFormat := LocalMascaraN;
  QMart_articulos_modelosP_COSTE.DisplayFormat := LocalMascaraN;
  QMart_articulos_modelosP_VENTA.DisplayFormat := LocalMascaraN;
  SQLBase := TStringList.Create;
  SQLBase.Text := QMart_articulos_modelos.SelectSQL.Text;

  Param_MODCODI001 := LeeParametro('MODCODI001');
  Param_MODCODI002 := LeeParametro('MODCODI002');
end;

procedure TDMMaestrosTallas.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;

  SQLBase.Free;
end;

procedure TDMMaestrosTallas.QMart_coloresBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'SEQ_ART_COLORES', 'ID_A_C');
end;

procedure TDMMaestrosTallas.QMart_grupos_tallasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'SEQ_ART_GRUPOS_TALLAS', 'ID_G_T');
end;

procedure TDMMaestrosTallas.QMart_tallasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'SEQ_ART_TALLAS', 'ID_A_T');
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'SEQ_ART_ARTICULOS_MODELOS', 'ID_A_M');

  // Si codigo de modelo esta vacio lo genero mediante formula.
  if ((QMart_articulos_modelosREF_PROVEEDOR.AsString = '') and (Param_MODCODI001 <> '')) then
  begin
     QMart_articulos_modelosREF_PROVEEDOR.AsString := DameCodigoModelo(Param_MODCODI001, 'REF_PROVEEDOR');

     if ((QMart_articulos_modelosTITULO.AsString = '') and (Param_MODCODI001 <> '')) then
        QMart_articulos_modelosTITULO.AsString := Copy(Trim(DameTituloFamilia(QMart_articulos_modelosFAMILIA.AsString) + ' ' + DameTituloSubFamilia(QMart_articulos_modelosSUBFAMILIA.AsString, QMart_articulos_modelosFAMILIA.AsString)), 1, 60);
  end;

  // Si codigo de modelo esta vacio lo genero mediante formula.
  if ((QMart_articulos_modelosBASE_CREACION.AsString = '') and (Param_MODCODI002 <> '')) then
  begin
     QMart_articulos_modelosBASE_CREACION.AsString := DameCodigoModelo(Param_MODCODI002, 'BASE_CREACION');

     if ((QMart_articulos_modelosTITULO.AsString = '') and (Param_MODCODI002 <> '')) then
        QMart_articulos_modelosTITULO.AsString := Copy(Trim(DameTituloFamilia(QMart_articulos_modelosFAMILIA.AsString) + ' ' + DameTituloSubFamilia(QMart_articulos_modelosSUBFAMILIA.AsString, QMart_articulos_modelosFAMILIA.AsString)), 1, 60);
  end;
end;

procedure TDMMaestrosTallas.QMart_articulos_mod_colorBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'SEQ_ART_ARTICULOS_MOD_COLOR', 'ID_A_M_C');
end;

procedure TDMMaestrosTallas.QMart_tallasNewRecord(DataSet: TDataSet);
begin
  QMart_tallas['ID_G_T'] := QMart_grupos_tallas['ID_G_T'];
  QMart_tallas['COD_TALLA'] := '';
end;

procedure TDMMaestrosTallas.QMart_articulos_mod_colorNewRecord(DataSet: TDataSet);
begin
  QMver_art_mod_color_edit['ID_A_M'] := QMart_articulos_modelos['ID_A_M'];
  QMver_art_mod_color_edit['TITULO'] := '';
  QMver_art_mod_color_edit['ALFA_1'] := QMart_articulos_modelos['ALFA_1'];
  QMver_art_mod_color_edit['ALFA_2'] := QMart_articulos_modelos['ALFA_2'];
  QMver_art_mod_color_edit['ALFA_3'] := QMart_articulos_modelos['ALFA_3'];
  QMver_art_mod_color_edit['ALFA_4'] := QMart_articulos_modelos['ALFA_4'];
  QMver_art_mod_color_edit['ALFA_5'] := QMart_articulos_modelos['ALFA_5'];
  QMver_art_mod_color_edit['ALFA_6'] := QMart_articulos_modelos['ALFA_6'];
  QMver_art_mod_color_edit['ALFA_7'] := QMart_articulos_modelos['ALFA_7'];
  QMver_art_mod_color_edit['ALFA_8'] := QMart_articulos_modelos['ALFA_8'];
end;

procedure TDMMaestrosTallas.SetDatosLineaNColor(nColor: string; Proveedor: integer);
var
  Formato : string;
  Longitud : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT C.ID_A_C, COALESCE(E.CODIGO_PROVEEDOR, '''') CODIGO_PROVEEDOR, C.IMAGEN ');
        SQL.Add(' FROM ART_COLORES C ');
        SQL.Add(' LEFT JOIN ART_COLORES_EMPRESA E ');
        SQL.Add(' ON C.ID_A_C = E.ID_A_C AND E.PROVEEDOR = :PROVEEDOR ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.COD_COLOR = :COD_COLOR ');
        Params.ByName['COD_COLOR'].AsString := nColor;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        QMver_art_mod_color_edit['ID_A_C'] := FieldByName['ID_A_C'].Value;
        QMver_art_mod_color_edit['CODIGO_PROVEEDOR'] := FieldByName['CODIGO_PROVEEDOR'].Value;

        // Si no tiene imagen asignada todavia, busco en el modelo y en el color
        if ((VarIsNull(QMver_art_mod_color_edit['IMAGEN'])) or (QMver_art_mod_color_edit['IMAGEN'] <> 0)) then
        begin
           // Si el modelo tiene imagen la asigno, sino tomo la del color.
           if ((not VarIsNull(QMart_articulos_modelos['IMAGEN'])) and (QMart_articulos_modelos['IMAGEN'] <> 0)) then
              QMver_art_mod_color_edit['IMAGEN'] := QMart_articulos_modelos['IMAGEN']
           else
              QMver_art_mod_color_edit['IMAGEN'] := FieldByName['IMAGEN'].Value;
        end;

        FreeHandle;
     finally
        Free;
     end;
  end;

  if (QMver_art_mod_color_editS_COLOR.AsString = '') then
  begin
     // Cantidad de digitos a utilizar para el codigo
     Longitud := StrToIntDef(LeeParametro('TYCCOLO002'), 0);

     // S_COLOR es el numero de linea
     if (LeeParametro('TYCCOLO003') = 'S') then
     begin
        // Formato para cantidad de digitos
        Formato := LeeParametro('TYCCOLO002');
        if (Longitud = 0) then
           Formato := '%d'
        else
           Formato := '%.' + IntToStr(Longitud) + 'd';

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT COUNT(*) ');
              SQL.Add(' FROM ART_ARTICULOS_MOD_COLOR ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_A_M = :ID_A_M ');
              Params.ByName['ID_A_M'].AsString := QMart_articulos_modelos['ID_A_M'];
              ExecQuery;
              QMver_art_mod_color_editS_COLOR.AsString := Format(Formato, [FieldByName['COUNT'].AsInteger + 1]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
     begin
        if (Longitud = 0) then
           QMver_art_mod_color_editS_COLOR.AsString := QMver_art_mod_color_editN_COLOR.AsString
        else
           QMver_art_mod_color_editS_COLOR.AsString := Copy(QMver_art_mod_color_editN_COLOR.AsString, 1, Longitud);
     end;
  end;
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosNewRecord(DataSet: TDataSet);
var
  i : integer;
begin
  QMart_articulos_modelos['AGNO'] := FormatDateTime('yy', Now);
  QMart_articulos_modelos['TEMPORADA'] := 0;
  QMart_articulos_modelos['SECCION'] := 0;
  QMart_articulos_modelos['EMPRESA'] := REntorno.Empresa;
  QMart_articulos_modelos['CONTROL_STOCK'] := 1;
  QMart_articulos_modelos['IVA_INC'] := 0;
  QMart_articulos_modelos['PVPORTALLA'] := 0;
  QMart_articulos_modelos['BORRAR'] := 1;
  {Todo : Esto debería ser el tipo de IVA del canal}
  QMart_articulos_modelos['TIPO_IVA'] := 1;
  QMart_articulos_modelos['ID_G_T'] := -1;
  QMart_articulos_modelos['CLIENTE'] := 0;
  QMart_articulos_modelos['TARIFA_DEFECTO'] := REntorno.TarifaDefecto;
  QMart_articulos_modelos['ID_MARCA'] := (REntorno.Empresa * (-1));
  QMart_articulos_modelos['ID_GALERIA'] := 0;
  QMart_articulos_modelos['IMAGEN'] := 0;
  QMart_articulos_modelos['FAMILIA'] := REntorno.FamDefecto;
  QMart_articulos_modelos['SUBFAMILIA'] := '';
  QMart_articulos_modelos['CODIGO_GENERO'] := 'DES';
  QMart_articulos_modelos['CODIGO_TEMPORADA'] := 'DES';
  QMart_articulos_modelos['PROVEEDOR'] := -1;
  QMart_articulos_modelos['COD_ESTRUCTURA'] := LeeParametro('TYCCODE001');

  // Selecciono el primer codigo de estructura
  if ((QMart_articulos_modelos['COD_ESTRUCTURA'] = '') or VarIsNull(QMart_articulos_modelos['COD_ESTRUCTURA'])) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COD_MODELO FROM ART_MOD_ESTRUCTURA_CAB WHERE EMPRESA = :EMPRESA ORDER BY COD_MODELO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;
           QMart_articulos_modelos['COD_ESTRUCTURA'] := FieldByName['COD_MODELO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Busco un codigo de 5 digitos que no esté en uso.
  if (LeeParametro('TYCREFP001') = 'S') then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('');
              SelectSQL.Text := 'SELECT REF_PROVEEDOR FROM ART_ARTICULOS_MODELOS WHERE REF_PROVEEDOR BETWEEN ''10000'' AND ''99999'' ORDER BY REF_PROVEEDOR';
              Open;

              i := StrToIntDef(FieldByName('REF_PROVEEDOR').AsString, 0);
              while ((not EOF) and (i = StrToIntDef(FieldByName('REF_PROVEEDOR').AsString, 0))) do
              begin
                 Inc(i);
                 Next;
              end;

              if (i <> 0) then
                 QMart_articulos_modelos['REF_PROVEEDOR'] := format('%.5d', [i]);

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosAfterOpen(DataSet: TDataSet);
begin
  QMver_art_mod_color_edit.Open;
  xMarcas.Open;
end;

procedure TDMMaestrosTallas.QMart_grupos_tallasAfterOpen(DataSet: TDataSet);
begin
  QMart_tallas.Open;
end;

procedure TDMMaestrosTallas.AbrirPrecios(Modo: integer; Tarifa: string);
begin
  with QMxver_precio_am do
  begin
     if Active then
        Close;
     Params.ByName['MODO'].AsInteger := Modo;
     Params.ByName['TARIFA'].AsString := Tarifa;
     if (Trim(Tarifa) > '') then
        Open;
  end;
end;

procedure TDMMaestrosTallas.CerrarPrecios;
begin
  with QMxver_precio_am do
  begin
     if Active then
        Close;
  end;
end;

procedure TDMMaestrosTallas.QMart_grupos_tallasAfterPost(DataSet: TDataSet);
begin
  DMTallas.Refresh;
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosBeforeOpen(DataSet: TDataSet);
begin
  {dji lrk kri qmart_articulos_modelos.Params.ByName['empresa'].AsInteger := REntorno.Empresa;}
end;

procedure TDMMaestrosTallas.CreaArticulosModelo(Automatico: boolean = False);
begin
  if ((QMart_articulos_modelos.State = dsInsert) or (QMart_articulos_modelos.State = dsEdit)) then
  begin
     QMart_articulos_modelos.Post;
  end;

  if (QMArt_Articulos_ModelosID_A_M.AsInteger > 0) then
  begin
     AbreForm(TFMMultiTalla, FMMultiTalla, FMain);
     FMMultiTalla.RellenarSeleccion(QMArt_Articulos_ModelosID_G_T.AsInteger, QMArt_Articulos_ModelosPACK.AsString);
     FMMultiTalla.Hide;
     if not Automatico then
        FMMultiTalla.ShowModal;

     AbreForm(TFMMultiColor, FMMultiColor, FMain);
     FMMultiColor.RellenarSeleccion(QMArt_Articulos_ModelosID_A_M.AsInteger);
     FMMultiColor.Hide;
     if not Automatico then
        FMMultiColor.ShowModal;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE XSET_ARTMODELO_TALLAS (:EMPRESA, :ID_A_M, :ID_G_T, :ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := QMArt_Articulos_ModelosEMPRESA.AsInteger;
           Params.ByName['ID_A_M'].AsInteger := QMArt_Articulos_ModelosID_A_M.AsInteger;
           Params.ByName['ID_G_T'].AsInteger := QMArt_Articulos_ModelosID_G_T.AsInteger;
           Params.ByName['ENTRADA'].AsFloat := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if Automatico then
     begin
        FMMultiTalla.Close;
        FreeAndNil(FMMultiTalla);
        FMMultiColor.Close;
        FreeAndNil(FMMultiColor);
     end;

     if not Automatico then
        Refrescar(QMart_articulos_modelos, 'ID_A_M', QMArt_Articulos_ModelosID_A_M.AsInteger);
  end;
end;

procedure TDMMaestrosTallas.ActualizaAlfasArticulosModelo;
begin
  if ((QMart_articulos_modelos.State = dsInsert) or (QMart_articulos_modelos.State = dsEdit)) then
  begin
     QMart_articulos_modelos.Post;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE XUPDATE_ARTICULO( :ID_A_M )';
        Params.ByName['ID_A_M'].AsInteger := QMArt_Articulos_ModelosID_A_M.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMaestrosTallas.BorrarArticulosModelo;
begin
  if ((QMart_articulos_modelos.State = dsInsert) or (QMart_articulos_modelos.State = dsEdit)) then
  begin
     QMart_articulos_modelos.Post;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE XDELETE_ARTICULO( :ID_A_M )';
        Params.ByName['ID_A_M'].AsInteger := QMArt_Articulos_ModelosID_A_M.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMart_articulos_modelos, 'ID_A_M', QMArt_Articulos_ModelosID_A_M.AsInteger);
end;

procedure TDMMaestrosTallas.QMxver_precio_amPXXChange(Sender: TField);
var
  i : integer;
  nombre_o, nombre_d : string;
begin
  {dji lrk kri - IberFluid}
  i := StrToInt(Copy(Sender.FieldName, 2, 2));
  if (i < 22) then
  begin
     nombre_o := Format('%2.2d', [i]);

     Inc(i);
     while ((i < 22) and (QMxver_precio_am.FieldByName('P' + Format('%2.2d', [i])).IsNull)) do
        Inc(i);

     if (i < 22) then
     begin
        nombre_d := Format('%2.2d', [i]);

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT TALLA FROM ART_TALLAS WHERE ID_G_T=' + IntToStr(QMart_articulos_modelosID_G_T.AsInteger) +
                 ' AND COD_TALLA=''' + nombre_d + '''';
              ExecQuery;
              if (FieldByName['TALLA'].AsString > '') then
                 QMxver_precio_am.FieldByName('P' + nombre_d).AsFloat := QMxver_precio_am.FieldByName('P' + nombre_o).AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMMaestrosTallas.QMart_grupos_tallasNewRecord(DataSet: TDataSet);
begin
  QMart_grupos_tallasPREFIJO.AsString := 'T-';
end;

procedure TDMMaestrosTallas.QMart_tallasTALLAChange(Sender: TField);
begin
  /// Si el titulo está vacio, el titulo será igual a a la codigo de talla

  if (Trim(QMart_tallasTITULO.AsString) = '') then
     QMart_tallasTITULO.AsString := UpperCase(QMart_tallasTALLA.AsString);
end;

procedure TDMMaestrosTallas.QMart_tipo_colorBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'CONTA_TIPO_COLOR', 'ID_T_C');
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosAfterPost(DataSet: TDataSet);
begin
  // Refresco el detalle, manteniendo la posicion
  Refrescar(QMver_art_mod_color_edit, 'ID_A_M_C', QMver_art_mod_color_editID_A_M_C.AsInteger);
end;

procedure TDMMaestrosTallas.QMver_art_mod_color_editN_COLORChange(Sender: TField);
begin
  SetDatosLineaNColor(QMver_art_mod_color_editN_COLOR.AsString, QMart_articulos_modelos.FieldByName('PROVEEDOR').AsInteger);
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosBeforeClose(DataSet: TDataSet);
begin
  QMver_art_mod_color_edit.Close;
  xMarcas.Close;
end;

procedure TDMMaestrosTallas.QMArtKitAfterOpen(DataSet: TDataSet);
begin
  QMArtKitTallas.Open;
end;

procedure TDMMaestrosTallas.QMArtKitBeforeClose(DataSet: TDataSet);
begin
  QMArtKitTallas.Close;
end;

procedure TDMMaestrosTallas.QMArtKitBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'ID_A_KIT', 'ID_A_K');
end;

procedure TDMMaestrosTallas.QMArtKitNewRecord(DataSet: TDataSet);
begin
  QMArtKitEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMMaestrosTallas.QMArtKitAfterPost(DataSet: TDataSet);
begin
  QMArtKitTallas.Close;
  QMArtKitTallas.Open;
end;

procedure TDMMaestrosTallas.PosicionaRefProveedor(RefProveedor: string);
begin
  if (Trim(RefProveedor) > '') then
     Posicionar(QMart_articulos_modelos, 'REF_PROVEEDOR', RefProveedor);
end;

procedure TDMMaestrosTallas.QMart_coloresAfterOpen(DataSet: TDataSet);
begin
  QMArtColorEmpresa.Open;
end;

procedure TDMMaestrosTallas.QMart_coloresBeforeClose(DataSet: TDataSet);
begin
  QMArtColorEmpresa.Close;
end;

procedure TDMMaestrosTallas.QMArtColorEmpresaBeforeOpen(DataSet: TDataSet);
begin
  QMArtColorEmpresa.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

procedure TDMMaestrosTallas.QMArtColorEmpresaTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  DameTituloProveedor(QMArtColorEmpresaPROVEEDOR.AsInteger);
end;

procedure TDMMaestrosTallas.QMArtColorEmpresaNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_A_C').AsInteger := QMart_coloresID_A_C.AsInteger;
  DataSet.FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
end;

procedure TDMMaestrosTallas.FiltraModelo(aFiltro: string);
begin
  with QMart_articulos_modelos do
  begin
     Close;
     SelectSQL.Clear;

     if (aFiltro = '') then
     begin
        SelectSQL.Text := SQLBase.Text;
        DMMain.FiltraTabla(QMart_articulos_modelos, '10000', False);
     end
     else
     begin
        SelectSQL.Add(' SELECT * FROM ART_ARTICULOS_MODELOS ');
        SelectSQL.Add(' WHERE  ');
        SelectSQL.Add(aFiltro);
        SelectSQL.Add(' ORDER BY REF_PROVEEDOR ');
     end;

     Open;
  end;
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosDESCUENTO_COMPRAChange(Sender: TField);
begin
  QMart_articulos_modelosP_COSTE.AsFloat := (QMart_articulos_modelosP_COMPRA.AsFloat - ((QMart_articulos_modelosP_COMPRA.AsFloat * QMart_articulos_modelosDESCUENTO_COMPRA.AsFloat) / 100));
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosP_COMPRAChange(Sender: TField);
begin
  QMart_articulos_modelosP_COSTE.AsFloat := (QMart_articulos_modelosP_COMPRA.AsFloat - ((QMart_articulos_modelosP_COMPRA.AsFloat * QMart_articulos_modelosDESCUENTO_COMPRA.AsFloat) / 100));
end;

procedure TDMMaestrosTallas.QMArtColorEmpresaCalcFields(DataSet: TDataSet);
begin
  // Obtenemos el titulo del proveedor en el grid
  QMArtColorEmpresaTITULO.AsString := DameTituloProveedor(QMArtColorEmpresaPROVEEDOR.AsInteger);
end;

procedure TDMMaestrosTallas.QMver_art_mod_color_editBeforeOpen(DataSet: TDataSet);
var
  i : integer;
begin
  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
     QMver_art_mod_color_edit.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
end;

procedure TDMMaestrosTallas.ActualizaAlfasColoresModelo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('UPDATE ART_ARTICULOS_MOD_COLOR SET ');
        SQL.Add('ID_A_M = :ID_A_M /* DUMMY UPDATE */ ');
        if (Trim(QMart_articulos_modelosALFA_1.AsString) <> '') then
           SQL.Add(',ALFA_1 = :ALFA_1 ');
        if (Trim(QMart_articulos_modelosALFA_2.AsString) <> '') then
           SQL.Add(',ALFA_2 = :ALFA_2 ');
        if (Trim(QMart_articulos_modelosALFA_3.AsString) <> '') then
           SQL.Add(',ALFA_3 = :ALFA_3 ');
        if (Trim(QMart_articulos_modelosALFA_4.AsString) <> '') then
           SQL.Add(',ALFA_4 = :ALFA_4 ');
        if (Trim(QMart_articulos_modelosALFA_5.AsString) <> '') then
           SQL.Add(',ALFA_5 = :ALFA_5 ');
        if (Trim(QMart_articulos_modelosALFA_6.AsString) <> '') then
           SQL.Add(',ALFA_6 = :ALFA_6 ');
        if (Trim(QMart_articulos_modelosALFA_7.AsString) <> '') then
           SQL.Add(',ALFA_7 = :ALFA_7 ');
        if (Trim(QMart_articulos_modelosALFA_8.AsString) <> '') then
           SQL.Add(',ALFA_8 = :ALFA_8 ');
        SQL.Add('WHERE ID_A_M = :ID_A_M ');

        if (Trim(QMart_articulos_modelosALFA_1.AsString) <> '') then
           Params.ByName['ALFA_1'].AsString := QMart_articulos_modelosALFA_1.AsString;
        if (Trim(QMart_articulos_modelosALFA_2.AsString) <> '') then
           Params.ByName['ALFA_2'].AsString := QMart_articulos_modelosALFA_2.AsString;
        if (Trim(QMart_articulos_modelosALFA_3.AsString) <> '') then
           Params.ByName['ALFA_3'].AsString := QMart_articulos_modelosALFA_3.AsString;
        if (Trim(QMart_articulos_modelosALFA_4.AsString) <> '') then
           Params.ByName['ALFA_4'].AsString := QMart_articulos_modelosALFA_4.AsString;
        if (Trim(QMart_articulos_modelosALFA_5.AsString) <> '') then
           Params.ByName['ALFA_5'].AsString := QMart_articulos_modelosALFA_5.AsString;
        if (Trim(QMart_articulos_modelosALFA_6.AsString) <> '') then
           Params.ByName['ALFA_6'].AsString := QMart_articulos_modelosALFA_6.AsString;
        if (Trim(QMart_articulos_modelosALFA_7.AsString) <> '') then
           Params.ByName['ALFA_7'].AsString := QMart_articulos_modelosALFA_7.AsString;
        if (Trim(QMart_articulos_modelosALFA_8.AsString) <> '') then
           Params.ByName['ALFA_8'].AsString := QMart_articulos_modelosALFA_8.AsString;
        Params.ByName['ID_A_M'].AsInteger := QMart_articulos_modelosID_A_M.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  QMver_art_mod_color_edit.Close;
  QMver_art_mod_color_edit.Open;
end;

procedure TDMMaestrosTallas.DuplicaModelo(NuevaRefProveedor: string);
var
  id_a_m_nuevo : integer;
begin
  if (Trim(NuevaRefProveedor) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE A_ART_DUPLICA_MODELO(?ID_A_M, ?REF_PROVEEDOR_DESTINO)';
           Params.ByName['ID_A_M'].AsInteger := QMart_articulos_modelosID_A_M.AsInteger;
           Params.ByName['REF_PROVEEDOR_DESTINO'].AsString := NuevaRefProveedor;
           ExecQuery;
           id_a_m_nuevo := FieldByName['ID_A_M_NUEVO'].AsInteger;
           Close;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Refrescar(QMart_articulos_modelos, 'ID_A_M', id_a_m_nuevo);
  end;
end;

procedure TDMMaestrosTallas.ModificaPrecioTarifa(Importe: double);
begin
  with QMxver_precio_am do
  begin
     First;
     while not EOF do
     begin
        Edit;
        QMxver_precio_amP01.AsFloat := Importe;
        Post;
        Next;
     end;
  end;
end;

procedure TDMMaestrosTallas.QMart_articulos_modelosCalcFields(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) FROM ART_ARTICULOS A ');
        SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS T ON A.ID_A_M_C_T = T.ID_A_M_C_T ');
        SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR C ON T.ID_A_M_C = C.ID_A_M_C ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.ID_A_M = :ID_A_M AND ');
        SQL.Add(' A.EMPRESA = :EMPRESA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_A_M'].AsInteger := QMart_articulos_modelosID_A_M.AsInteger;
        ExecQuery;
        QMart_articulos_modelosCANTIDAD_COMBINACIONES.AsInteger := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMaestrosTallas.DameCodigoModelo(FormatoCodigo, Campo: string): string;
var
  CodigoModelo, aux, car, Contador : string;
  i : integer;
begin
  /// Recorremos el FormatoCodigo en busca de F para familia, S para subfamilia y N para contadores.
  /// Esperamos que los ultimos caracteres sean los N

  CodigoModelo := '';
  aux := '';
  i := 1;

  while (i <= Length(FormatoCodigo)) do
  begin
     car := Copy(FormatoCodigo, i, 1);

     // Si cambio caracter de formato o llegue al final
     if (((aux <> '') and (car <> Copy(aux, 1, 1))) or (i = Length(FormatoCodigo))) then
     begin
        if (i = Length(FormatoCodigo)) then
           aux := aux + car;

        if (Copy(aux, 1, 1) = 'F') then
        begin
           // Familia
           CodigoModelo := CodigoModelo + Copy(QMart_articulos_modelosFAMILIA.AsString, 1, Length(aux));
        end
        else if (Copy(aux, 1, 1) = 'S') then
        begin
           // Subfamilia
           CodigoModelo := CodigoModelo + Copy(QMart_articulos_modelosSUBFAMILIA.AsString, 1, Length(aux));
        end
        else if (Copy(aux, 1, 1) = 'N') then
        begin
           // Numero
           // Selecciono el ultimo articulo con el prefijo segun el formato
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT MAX(' + Campo + ') ');
                 SQL.Add(' FROM ART_ARTICULOS_MODELOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' FAMILIA = :FAMILIA AND ');
                 SQL.Add(' SUBFAMILIA = :SUBFAMILIA AND ');
                 SQL.Add(' ' + Campo + ' STARTING WITH :CODIGO_MODELO AND ');
                 SQL.Add(' CHAR_LENGTH(' + Campo + ') = ' + IntToStr(Length(FormatoCodigo)));
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['FAMILIA'].AsString := QMart_articulos_modelosFAMILIA.AsString;
                 Params.ByName['SUBFAMILIA'].AsString := QMart_articulos_modelosSUBFAMILIA.AsString;
                 Params.ByName['CODIGO_MODELO'].AsString := CodigoModelo;
                 ExecQuery;
                 Contador := FieldByName['MAX'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Tomo los digitos correspondientes al contador
           if (Length(Contador) = Length(FormatoCodigo)) then
              Contador := Copy(Contador, Length(CodigoModelo) + 1, Length(Contador))
           else
              // En el caso de que no encuentre nada la longitud sera 0.
              Contador := '0';

           CodigoModelo := CodigoModelo + Format('%' + IntToStr(Length(aux)) + '.' + IntToStr(Length(aux)) + 'd', [StrToIntDef(Contador, 0) + 1]);
        end
        else
        begin
           CodigoModelo := CodigoModelo + aux;
        end;

        aux := car;
     end
     else
        aux := aux + car;

     Inc(i);
  end;

  Result := CodigoModelo;
end;

end.
