unit UDMImprimeCartaPortes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBTableDataSetRO;

type
  TDMImprimeCartaPortes = class(TDataModule)
     TLocal: THYTransaction;
     QMAlbaranes: TFIBTableSetRO;
     QMAlbaranesEMPRESA: TIntegerField;
     QMAlbaranesEJERCICIO: TIntegerField;
     QMAlbaranesCANAL: TIntegerField;
     QMAlbaranesSERIE: TFIBStringField;
     QMAlbaranesTIPO: TFIBStringField;
     QMAlbaranesRIG: TIntegerField;
     QMAlbaranesALMACEN: TFIBStringField;
     QMAlbaranesMONEDA: TFIBStringField;
     QMAlbaranesFECHA: TDateTimeField;
     QMAlbaranesTERCERO: TIntegerField;
     QMAlbaranesTITULO: TFIBStringField;
     QMAlbaranesDIRECCION: TIntegerField;
     QMAlbaranesCLIENTE: TIntegerField;
     QMAlbaranesSU_REFERENCIA: TFIBStringField;
     QMAlbaranesFORMA_PAGO: TFIBStringField;
     QMAlbaranesCAMPANYA: TIntegerField;
     QMAlbaranesNOTAS: TBlobField;
     QMAlbaranesESTADO: TIntegerField;
     QMAlbaranesBULTOS: TIntegerField;
     QMAlbaranesLINEAS: TIntegerField;
     QMAlbaranesBRUTO: TFloatField;
     QMAlbaranesI_DTO_LINEAS: TFloatField;
     QMAlbaranesS_BASES: TFloatField;
     QMAlbaranesM_BRUTO: TFloatField;
     QMAlbaranesC_TOTAL: TFloatField;
     QMAlbaranesAGENTE: TIntegerField;
     QMAlbaranesS_CUOTA_IVA: TFloatField;
     QMAlbaranesS_CUOTA_RE: TFloatField;
     QMAlbaranesB_DTO_LINEAS: TFloatField;
     QMAlbaranesDTO_PP: TFloatField;
     QMAlbaranesDTO_CIAL: TFloatField;
     QMAlbaranesI_DTO_CIAL: TFloatField;
     QMAlbaranesI_DTO_PP: TFloatField;
     QMAlbaranesB_COMISION: TFloatField;
     QMAlbaranesI_COMISION: TFloatField;
     QMAlbaranesPOR_FINANCIACION: TFloatField;
     QMAlbaranesI_FINANCIACION: TFloatField;
     QMAlbaranesLIQUIDO: TFloatField;
     QMAlbaranesENTRADA: TIntegerField;
     QMAlbaranesTRANSPORTISTA: TIntegerField;
     QMAlbaranesI_BASE_RETENCION: TFloatField;
     QMAlbaranesP_RETENCION: TFloatField;
     QMAlbaranesI_RETENCION: TFloatField;
     QMAlbaranesTIPO_IRPF: TIntegerField;
     QMAlbaranesA_IRPF: TIntegerField;
     QMAlbaranesTOTAL_A_COBRAR: TFloatField;
     QMAlbaranesNOMBRE_COMERCIAL: TFIBStringField;
     QMAlbaranesPORTES: TIntegerField;
     QMAlbaranesTARIFA: TFIBStringField;
     QMAlbaranesID_S: TIntegerField;
     DSQMAlbaranes: TDataSource;
     QMAlbaranesCONTACTO: TIntegerField;
     QMAlbaranesBULTOS_KRI: TIntegerField;
     QMAlbaranesGARANTIA: TIntegerField;
     QMAlbaranesAGRUPACION_KRI: TIntegerField;
     QMAlbaranesALMACEN_DEPOSITO: TFIBStringField;
     QMAlbaranesNUM_MOV_DEPOSITO: TIntegerField;
     QMAlbaranesDEPOSITO: TIntegerField;
     QMAlbaranesDEVOLUCION_DEPOSITO: TIntegerField;
     QMAlbaranesIDIOMA: TFIBStringField;
     QMAlbaranesTIPO_PORTES: TIntegerField;
     QMAlbaranesPOR_PORTES: TFloatField;
     QMAlbaranesI_PORTES: TFloatField;
     QMAlbaranesI_PORTES_CANAL: TFloatField;
     QMAlbaranesRANGO: TIntegerField;
     QMAlbaranesINDICE: TIntegerField;
     QMAlbaranesCAMBIO_FIJO: TIntegerField;
     QMAlbaranesVALOR_CAMB_FIJO: TFloatField;
     QMAlbaranesPROYECTO: TIntegerField;
     QMAlbaranesNOTAS_INTERNAS_KRI: TBlobField;
     QMAlbaranesTIPO_LINEA_KRI: TIntegerField;
     QMAlbaranesTIT_CONTACTO: TFIBStringField;
     QMAlbaranesMODIFICA_DOC: TIntegerField;
     QMAlbaranesALBARAN_VALORADO: TIntegerField;
     QMAlbaranesFECHA_SERVIDO: TDateTimeField;
     QMAlbaranesCARTA_PORTE: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Generar(Fecha: TDateTime; Transportista, DirTransportista: integer; Matricula: string; Naturaleza: integer);
     procedure MuestraAlbaranes(TodosLosAlbaranes: boolean);
     function DameMatriculaDefecto(Transportista: integer): string;
     function DameNaturalezaDefecto: integer;
  end;

var
  DMImprimeCartaPortes : TDMImprimeCartaPortes;

implementation

uses UDMMain, UDMLstAlbaranes, UFMImprimeCartaPortes, HYFIBQuery, UEntorno, UFormGest, UUtiles;

{$R *.dfm}

procedure TDMImprimeCartaPortes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

function TDMImprimeCartaPortes.DameMatriculaDefecto(Transportista: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 MATRICULA ');
        SQL.Add(' FROM EMP_MATRICULAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' TRANSPORTISTA = :TRANSPORTISTA AND ');
        SQL.Add(' DEFECTO = 1 ');
        SQL.Add(' ORDER BY MATRICULA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
        ExecQuery;
        Result := FieldByName['MATRICULA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImprimeCartaPortes.DameNaturalezaDefecto: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 NATURALEZA ');
        SQL.Add(' FROM SYS_NATURALEZA_CARGA ');
        SQL.Add(' WHERE ');
        SQL.Add(' DEFECTO = 1 ');
        ExecQuery;
        Result := FieldByName['NATURALEZA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImprimeCartaPortes.Generar(Fecha: TDateTime; Transportista, DirTransportista: integer; Matricula: string; Naturaleza: integer);
var
  Bultos, Peso : double;
  IdS : integer;
begin
  with QMAlbaranes do
  begin
     IdS := FieldByName('ID_S').AsInteger;
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (FMImprimeCartaPortes.Seleccionado) then
           begin
              // Si no tiene Carta de Portes generada la creo
              if (QMAlbaranes.FieldByName('CARTA_PORTE').AsInteger = 0) then
              begin
                 // Bultos y Peso del albaran
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT SUM(DET.BULTOS) BULTOS, SUM((ART.PESO) * (DET.UNIDADES)) PESO ');
                       SQL.Add(' FROM GES_DETALLES_S DET ');
                       SQL.Add(' JOIN ART_ARTICULOS ART ');
                       SQL.Add(' ON (DET.ID_A = ART.ID_A) ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' DET.ID_S = :ID_S ');
                       Params.ByName['ID_S'].AsInteger := QMAlbaranes.FieldByName('ID_S').AsInteger;
                       ExecQuery;
                       Bultos := FieldByName['BULTOS'].AsFloat;
                       Peso := FieldByName['PESO'].AsFloat;
                       FreeHandle;
                    finally;
                       Free;
                    end;
                 end;

                 // Generar Carta de Portes
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' INSERT INTO GES_CABECERAS_S_CGA ');
                       SQL.Add(' (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S, ');
                       SQL.Add(' CARGADORA,EXPEDIDORA,DIR_EXPEDIDORA,DIR_CARGADORA,INTERMEDIARIA,DIR_INTERMEDIARIA, ');
                       SQL.Add(' TRANSPORTISTA,DIR_TRANSPORTISTA,DESTINATARIO,DIR_DESTINATARIO, ');
                       SQL.Add(' BULTOS,PESO,ORIGEN,DESTINO,FECHA_TRANSPORTE,/*NOTAS,*/PALETS,PESO_BRUTO,UNIDADES_LOGISTICAS,VOLUMEN) ');
                       SQL.Add(' VALUES ');
                       SQL.Add(' (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?CARGADORA,?EXPEDIDORA,?DIR_EXPEDIDORA,?DIR_CARGADORA,?INTERMEDIARIA, ');
                       SQL.Add(' ?DIR_INTERMEDIARIA,?TRANSPORTISTA,?DIR_TRANSPORTISTA,?DESTINATARIO,?DIR_DESTINATARIO, ');
                       SQL.Add(' ?BULTOS,?PESO,?ORIGEN,?DESTINO,?FECHA_TRANSPORTE,/*?NOTAS,*/?PALETS,?PESO_BRUTO,?UNIDADES_LOGISTICAS,?VOLUMEN) ');

                       Params.ByName['EMPRESA'].AsInteger := QMAlbaranes.FieldByName('EMPRESA').AsInteger;
                       Params.ByName['EJERCICIO'].AsInteger := QMAlbaranes.FieldByName('EJERCICIO').AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMAlbaranes.FieldByName('CANAL').AsInteger;
                       Params.ByName['SERIE'].AsString := QMAlbaranes.FieldByName('SERIE').AsString;
                       Params.ByName['TIPO'].AsString := QMAlbaranes.FieldByName('TIPO').AsString;
                       Params.ByName['RIG'].AsInteger := QMAlbaranes.FieldByName('RIG').AsInteger;
                       Params.ByName['ID_S'].AsInteger := QMAlbaranes.FieldByName('ID_S').AsInteger;

                       Params.ByName['CARGADORA'].AsInteger := REntorno.Tercero;
                       Params.ByName['EXPEDIDORA'].AsInteger := REntorno.Tercero;
                       Params.ByName['INTERMEDIARIA'].AsInteger := REntorno.Tercero;
                       Params.ByName['DESTINATARIO'].AsInteger := QMAlbaranes.FieldByName('TERCERO').AsInteger;

                       Params.ByName['DIR_CARGADORA'].AsInteger := DMMain.DameMinDireccion(REntorno.Tercero);
                       Params.ByName['DIR_EXPEDIDORA'].AsInteger := DMMain.DameMinDireccion(REntorno.Tercero);
                       Params.ByName['DIR_INTERMEDIARIA'].AsInteger := DMMain.DameMinDireccion(REntorno.Tercero);
                       Params.ByName['DIR_DESTINATARIO'].AsInteger := DMMain.DameMinDireccion(QMAlbaranes.FieldByName('TERCERO').AsInteger);

                       Params.ByName['DESTINO'].AsInteger := QMAlbaranes.FieldByName('DIRECCION').AsInteger;
                       Params.ByName['BULTOS'].AsFloat := Bultos;
                       Params.ByName['PESO'].AsFloat := Peso;
                       // Params.ByName['NOTAS'].AsString := '';

                       Params.ByName['FECHA_TRANSPORTE'].AsDateTime := Fecha;
                       Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                       Params.ByName['DIR_TRANSPORTISTA'].AsInteger := DirTransportista;

                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (Matricula > '') then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO GES_CABECERAS_S_MAT ');
                          SQL.Add(' (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,MATRICULA) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?MATRICULA) ');

                          Params.ByName['EMPRESA'].AsInteger := QMAlbaranes.FieldByName('EMPRESA').AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := QMAlbaranes.FieldByName('EJERCICIO').AsInteger;
                          Params.ByName['CANAL'].AsInteger := QMAlbaranes.FieldByName('CANAL').AsInteger;
                          Params.ByName['SERIE'].AsString := QMAlbaranes.FieldByName('SERIE').AsString;
                          Params.ByName['TIPO'].AsString := QMAlbaranes.FieldByName('TIPO').AsString;
                          Params.ByName['RIG'].AsInteger := QMAlbaranes.FieldByName('RIG').AsInteger;
                          Params.ByName['ID_S'].AsInteger := QMAlbaranes.FieldByName('ID_S').AsInteger;
                          Params.ByName['MATRICULA'].AsString := Matricula;

                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 if (Naturaleza >= 0) then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO GES_CABECERAS_S_NAT ');
                          SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, NATURALEZA) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_S, :NATURALEZA) ');

                          Params.ByName['EMPRESA'].AsInteger := QMAlbaranes.FieldByName('EMPRESA').AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := QMAlbaranes.FieldByName('EJERCICIO').AsInteger;
                          Params.ByName['CANAL'].AsInteger := QMAlbaranes.FieldByName('CANAL').AsInteger;
                          Params.ByName['SERIE'].AsString := QMAlbaranes.FieldByName('SERIE').AsString;
                          Params.ByName['TIPO'].AsString := QMAlbaranes.FieldByName('TIPO').AsString;
                          Params.ByName['RIG'].AsInteger := QMAlbaranes.FieldByName('RIG').AsInteger;
                          Params.ByName['ID_S'].AsInteger := QMAlbaranes.FieldByName('ID_S').AsInteger;
                          Params.ByName['NATURALEZA'].AsInteger := Naturaleza;

                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;
              end;

              // Imprimir Carte de Portes
              AbreData(TDMLstAlbaranes, DMLstAlbaranes);
              DMLstAlbaranes.MostrarListado(FieldByName('ID_S').AsInteger,
                 FieldByName('RIG').AsInteger, FieldByName('SERIE').AsString,
                 1, 5, FieldByName('EJERCICIO').AsInteger);
              CierraData(DMLstAlbaranes);
           end;

           Next;
        end;

        Close;
        Open;
     finally
        EnableControls;
     end;
  end;

  Posicionar(QMAlbaranes, 'ID_S', IdS, True);
end;

procedure TDMImprimeCartaPortes.MuestraAlbaranes(TodosLosAlbaranes: boolean);
var
  IdS : integer;
begin
  with QMAlbaranes do
  begin
     IdS := FieldByName('ID_S').AsInteger;

     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT A.*, COALESCE((SELECT 1 FROM GES_CABECERAS_S_CGA WHERE ID_S = A.ID_S), 0) AS CARTA_PORTE ');
     SelectSQL.Add(' FROM VER_CABECERAS_ALBARAN A ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' A.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' A.EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' A.CANAL = :CANAL AND ');
     SelectSQL.Add(' A.TIPO = ''ALB'' AND ');
     SelectSQL.Add(' A.ESTADO = 0 ');
     if (not TodosLosAlbaranes) then
     begin
        SelectSQL.Add(' AND NOT EXISTS(SELECT ID_S ');
        SelectSQL.Add('                FROM GES_CABECERAS_S_CGA ');
        SelectSQL.Add('                WHERE ');
        SelectSQL.Add('                ID_S = A.ID_S) ');
     end;
     SelectSQL.Add(' ORDER BY A.EJERCICIO, A.SERIE, A.RIG ');
  end;

  DMMain.FiltraRO(QMAlbaranes, '11100', True);
  Posicionar(QMAlbaranes, 'ID_S', IdS, True);
end;

end.
