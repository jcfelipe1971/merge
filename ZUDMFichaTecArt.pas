unit ZUDMFichaTecArt;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO, Forms;

type
  TZDMFichaTecArt = class(TDataModule)
     QMFichaTecArt: TFIBTableSet;
     DSQMFichaTecArt: TDataSource;
     TLocal: THYTransaction;
     QMArticuloTextos: TFIBTableSet;
     QMArticuloTextosEMPRESA: TIntegerField;
     QMArticuloTextosARTICULO: TFIBStringField;
     QMArticuloTextosCOD_ART_TEXTO: TIntegerField;
     QMArticuloTextosTEXTO: TFIBStringField;
     QMArticuloTextosTIPO_AUX_COLOR: TFIBStringField;
     QMArticuloTextosCODIGO_COLOR: TFIBStringField;
     QMArticuloTextosCodigo_color_descripcion: TStringField;
     DSQMArticuloTextos: TDataSource;
     xMaquinas: TFIBDataSetRO;
     xMaquinasMAQUINA: TFIBStringField;
     xMaquinasDESCRIPCION: TFIBStringField;
     xMaquinasACTIVO: TIntegerField;
     xClientes: TFIBDataSetRO;
     xClientesTITULO: TFIBStringField;
     xClientesNOMBRE_COMERCIAL: TFIBStringField;
     xMaestros: TFIBDataSetRO;
     xMaestrosDESCRIPCION: TFIBStringField;
     xArticulo: TFIBDataSetRO;
     xArticuloEMPRESA: TIntegerField;
     xArticuloARTICULO: TFIBStringField;
     xArticuloTITULO: TFIBStringField;
     xProvPapel: TFIBDataSetRO;
     xProvPapelEMPRESA: TIntegerField;
     xProvPapelEJERCICIO: TIntegerField;
     xProvPapelCANAL: TIntegerField;
     xProvPapelPROVEEDOR: TIntegerField;
     xProvPapelTERCERO: TIntegerField;
     xProvPapelTITULO: TFIBStringField;
     QMArticuloTextosTIPO_AUX_ANILOX: TFIBStringField;
     QMArticuloTextosCODIGO_ANILOX: TFIBStringField;
     QMArticuloTextosPANTONE: TIntegerField;
     QMArticuloTextosCUERPO_IMPRESION: TIntegerField;
     QMArticuloTextosCOMP_PANTONE: TFIBStringField;
     QMArticuloTextosDescAnilox: TStringField;
     xClientesTERCERO: TIntegerField;
     QMConstantes: TFIBTableSet;
     QMConstantesPATH_DOCUMENTOS: TFIBStringField;
     DSConstantes: TDataSource;
     QMFichaTecArtEMPRESA: TIntegerField;
     QMFichaTecArtARTICULO: TFIBStringField;
     QMFichaTecArtTITULO_ARTICULO: TFIBStringField;
     QMFichaTecArtREIMPRESION: TIntegerField;
     QMFichaTecArtOBSERVACIONES_ETIQ: TMemoField;
     QMFichaTecArtETIQUETA_X_CAJA: TIntegerField;
     QMFichaTecArtANCHO_FILM_ESTAMP: TIntegerField;
     QMFichaTecArtNOTAS: TMemoField;
     QMFichaTecArtFOTOGRABADO: TFIBStringField;
     QMFichaTecArtFECHA_IMAGEN_WEB: TDateTimeField;
     QMFichaTecArtID_A: TIntegerField;
     QMFichaTecArtID_IMAGEN: TIntegerField;
     QMFichaTecArtCODIGO_BARNIZ: TFIBStringField;
     QMFichaTecArtCODIGO_BARNIZ_2: TFIBStringField;
     QMFichaTecArtBANDA_ESTAMPACION: TFloatField;
     QMFichaTecArtAVANCE_ESTAMPACION: TFloatField;
     QMFichaTecArtRELIEVE_EN_SECO: TIntegerField;
     QMFichaTecArtCODIGO_ESTAMPACION: TFIBStringField;
     QMFichaTecArtTIPO_ETIQUETA: TFIBStringField;
     QMFichaTecArtBOBINADO: TFIBStringField;
     QMFichaTecArtMATERIAL_1: TFIBStringField;
     QMFichaTecArtIMPRESION_ADHESIVO_1: TIntegerField;
     QMFichaTecArtIMPRESION_CARA_1: TIntegerField;
     QMFichaTecArtIMPRESION_DORSO_1: TIntegerField;
     QMFichaTecArtMATERIAL_2: TFIBStringField;
     QMFichaTecArtIMPRESION_ADHESIVO_2: TIntegerField;
     QMFichaTecArtIMPRESION_CARA_2: TIntegerField;
     QMFichaTecArtIMPRESION_DORSO_2: TIntegerField;
     QMFichaTecArtMATERIAL_3: TFIBStringField;
     QMFichaTecArtIMPRESION_ADHESIVO_3: TIntegerField;
     QMFichaTecArtIMPRESION_CARA_3: TIntegerField;
     QMFichaTecArtIMPRESION_DORSO_3: TIntegerField;
     QMFichaTecArtCODIGO_MODELOCAJA: TFIBStringField;
     QMFichaTecArtDIAMETRO_EXTERIOR: TFloatField;
     QMFichaTecArtDIAMETRO_INTERIOR: TFloatField;
     QMFichaTecArtETIQUETAS_AL_ANCHO: TFloatField;
     QMFichaTecArtETIQUETAS_X_ROLLO: TFloatField;
     QMFichaTecArtPATH_IMAGEN: TFIBStringField;
     QMFichaTecArtPUBLICACION_WEB: TIntegerField;
     QMFichaTecArtTROQUELES: TIntegerField;
     QMFichaTecArtTROQUELES_2: TIntegerField;
     QMFichaTecArtESCANDALLO: TIntegerField;
     QMFichaTecArtANCHO: TFloatField;
     QMFichaTecArtSH_ANCHO: TFloatField;
     QMFichaTecArtAVANCE: TFloatField;
     QMFichaTecArtSV_AVANCE: TFloatField;
     QMFichaTecArtPOS_Z: TIntegerField;
     QMFichaTecArtFORMA: TFIBStringField;
     QMFichaTecArtANCHO_2: TFloatField;
     QMFichaTecArtSH_ANCHO_2: TFloatField;
     QMFichaTecArtAVANCE_2: TFloatField;
     QMFichaTecArtSV_AVANCE_2: TFloatField;
     QMFichaTecArtPOS_Z_2: TIntegerField;
     QMFichaTecArtFORMA_2: TFIBStringField;
     QMProMatEsc: TFIBTableSet;
     DSQMProMatEsc: TDataSource;
     QMProMatEscCOMPONENTE: TFIBStringField;
     QMProMatEscDESC_ARTICULO: TFIBStringField;
     QMProTareaEsc: TFIBTableSet;
     DSQMProTareaEsc: TDataSource;
     QMProTareaEscTIPOTAREA: TFIBStringField;
     QMProTareaEscTAREA: TFIBStringField;
     QMFichaTecColores: TFIBTableSet;
     DSQMFichaTecColores: TDataSource;
     QMFichaTecColoresLINEA: TIntegerField;
     QMFichaTecColoresCOLOR: TFIBStringField;
     QMFichaTecColoresTITULO_COLOR: TFIBStringField;
     QMFichaTecColoresANILOX: TIntegerField;
     QMFichaTecColoresTITULO_ANILOX: TFIBStringField;
     QMFichaTecColoresMAQUINA: TIntegerField;
     QMFichaTecColoresCOLOR_DECIMAL: TFloatField;
     QMFichaTecColoresEMPRESA: TIntegerField;
     QMFichaTecColoresARTICULO: TFIBStringField;
     QMFichaTecColoresOBSERVACIONES: TMemoField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMFichaTecArtAfterOpen(DataSet: TDataSet);
     procedure QMArticuloTextosNewRecord(DataSet: TDataSet);
     procedure QMArticuloTextosBeforePost(DataSet: TDataSet);
     procedure QMArticuloTextosCODIGO_COLORChange(Sender: TField);
     procedure QMArticuloTextosCodigo_color_descripcionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaTecColoresNewRecord(DataSet: TDataSet);
     procedure QMFichaTecArtBeforeClose(DataSet: TDataSet);
     procedure QMFichaTecColoresBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     procedure MaestroDescripcion(Maestro: string; Codigo: string);
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure DuplicarArticulo(ArtNuevo: string);
     function DameTituloModeloCaja(Codigo: string): string;
     function DameTituloBobinado(Codigo: string): string;
  end;

var
  ZDMFichaTecArt : TZDMFichaTecArt;

implementation

uses UDMMain, UEntorno, ZUFMFichaTecArt, uFBusca, UUtiles;

{$R *.dfm}

procedure TZDMFichaTecArt.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMFichaTecArt, '10000');
end;

procedure TZDMFichaTecArt.DuplicarArticulo(ArtNuevo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_DUPLICA_ARTICULO (:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :ARTNUEVO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := QMFichaTecArtARTICULO.AsString;
        Params.ByName['ARTNUEVO'].AsString := ArtNuevo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMFichaTecArt, 'ARTICULO', ArtNuevo, False, True);
end;

procedure TZDMFichaTecArt.QMFichaTecArtAfterOpen(DataSet: TDataSet);
begin
  QMArticuloTextos.Open;
  QMConstantes.Open;
  QMFichaTecColores.Open;
  QMProMatEsc.Open;
  QMProTareaEsc.Open;
end;

procedure TZDMFichaTecArt.MaestroDescripcion(Maestro: string; Codigo: string);
begin
  with xMaestros do
  begin
     Close;
     Params.ByName['TIPO_AUX'].AsString := Maestro;
     Params.ByName['CODIGO'].AsString := Codigo;
     Open;
  end;
end;

procedure TZDMFichaTecArt.QMArticuloTextosNewRecord(DataSet: TDataSet);
begin
  QMArticuloTextosEMPRESA.AsInteger := QmFichaTecArtEMPRESA.AsInteger;
  QMArticuloTextosARTICULO.AsString := QMFichaTecArtARTICULO.AsString;
  QMArticuloTextosCOD_ART_TEXTO.AsInteger := 0;
  QMArticuloTextosTEXTO.AsString := '';
  QMArticuloTextosTIPO_AUX_COLOR.AsString := 'COL';
  QMArticuloTextosCODIGO_COLOR.AsString := 'IND';
  QMArticuloTextosTIPO_AUX_ANILOX.AsString := 'ANI';
  QMArticuloTextosCODIGO_ANILOX.AsString := 'IND';
end;

procedure TZDMFichaTecArt.QMArticuloTextosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(COD_ART_TEXTO) ');
           SQL.Add(' FROM Z_ART_ARTICULOS_TEXTOS_ETIQ ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' ARTICULO = :ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := QMFichaTecArtEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMFichaTecArtARTICULO.AsString;
           ExecQuery;
           QMArticuloTextosCOD_ART_TEXTO.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TZDMFichaTecArt.QMArticuloTextosCODIGO_COLORChange(Sender: TField);
begin
  MaestroDescripcion(QMArticuloTextosTIPO_AUX_COLOR.AsString,
     QMArticuloTextosCODIGO_COLOR.AsString);
  QMArticuloTextosCodigo_color_descripcion.AsString := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMFichaTecArt.QMArticuloTextosCodigo_color_descripcionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  MaestroDescripcion(QMArticuloTextosTIPO_AUX_COLOR.AsString,
     QMArticuloTextosCODIGO_COLOR.AsString);
  Text := xMaestrosDESCRIPCION.AsString;
end;

procedure TZDMFichaTecArt.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMFichaTecArt, '10000');
end;

function TZDMFichaTecArt.DameTituloModeloCaja(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''CAJ'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMFichaTecArt.DameTituloBobinado(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''BOB'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMFichaTecArt.QMFichaTecColoresNewRecord(DataSet: TDataSet);
begin
  QMFichaTecColoresEMPRESA.AsInteger := QMFichaTecArtEMPRESA.AsInteger;
  QMFichaTecColoresARTICULO.AsString := QMFichaTecArtARTICULO.AsString;
end;

procedure TZDMFichaTecArt.QMFichaTecArtBeforeClose(DataSet: TDataSet);
begin
  QMArticuloTextos.Close;
  QMConstantes.Close;
  QMFichaTecColores.Close;
  QMProMatEsc.Close;
  QMProTareaEsc.Close;
end;

procedure TZDMFichaTecArt.QMFichaTecColoresBeforePost(DataSet: TDataSet);
begin
  if (QMFichaTecColores.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM ETI_FICHA_TECNICA_COLOR ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' ARTICULO = :ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := QMFichaTecColoresEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMFichaTecColoresARTICULO.AsString;
           ExecQuery;
           QMFichaTecColoresLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
