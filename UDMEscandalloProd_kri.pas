unit UDMEscandalloProd_kri;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMEscandalloProd_kri = class(TDataModule)
     TLocal: THYTransaction;
     QMEscandallo: TFIBTableSet;
     DSQMEscandallo: TDataSource;
     DSQMEscandalloDet: TDataSource;
     QMEscandalloDet: TFIBTableSet;
     QMEscandalloEMPRESA: TIntegerField;
     QMEscandalloARTICULO: TFIBStringField;
     QMEscandalloNUMERO: TIntegerField;
     QMEscandalloUNIDADES: TFloatField;
     QMEscandalloFECHA_DESDE: TDateTimeField;
     QMEscandalloFECHA_HASTA: TDateTimeField;
     QMEscandalloACTIVO: TIntegerField;
     DSxArticulos: TDataSource;
     QMEscandalloDetEMPRESA: TIntegerField;
     QMEscandalloDetARTICULO: TFIBStringField;
     QMEscandalloDetNUMERO: TIntegerField;
     QMEscandalloDetDETALLE: TFIBStringField;
     QMEscandalloDetCANTIDAD: TFloatField;
     QMEscandalloDetTITULO: TFIBStringField;
     QMEscandalloDetFAMILIA: TFIBStringField;
     QMEscandalloDetP_COSTE: TFloatField;
     QContador: THYFIBQuery;
     xArticulosDet: THYFIBQuery;
     QMEscandalloCOSTE: TFloatField;
     QMEscandalloDetCOSTE: TFloatField;
     QEjercicio: THYFIBQuery;
     xArticulos: TFIBDataSetRO;
     QMEscandalloDetLINEA: TIntegerField;
     QMEscandalloSUM_UNID_KRI: TFloatField;
     QDuplicaEscandalloTyC: THYFIBQuery;
     DSQMEscandalloProc: TDataSource;
     QMEscandalloProc: TFIBTableSet;
     QMEscandalloProcEMPRESA: TIntegerField;
     QMEscandalloProcARTICULO: TFIBStringField;
     QMEscandalloProcNUMERO: TIntegerField;
     QMEscandalloProcPROCESO: TIntegerField;
     QMEscandalloProcPRECIO: TFloatField;
     QMEscandalloProcDURACION: TFloatField;
     QMEscandalloProcTITULO_PROCESO: TFIBStringField;
     QMEscandalloProcLINEA: TIntegerField;
     QMEscandalloProcOPERARIO: TIntegerField;
     QMEscandalloProcTITULO_OP: TFIBStringField;
     QMEscandalloTITULO: TStringField;
     TUpdate: THYTransaction;
     DSxCaracteristicas: TDataSource;
     xCaracteristicas: TFIBDataSetRO;
     procedure DMEscandalloProdCreate(Sender: TObject);
     procedure QMEscandalloAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMEscandalloNewRecord(DataSet: TDataSet);
     procedure QMEscandalloDetNewRecord(DataSet: TDataSet);
     procedure QMEscandalloARTICULOChange(Sender: TField);
     procedure QMEscandalloBeforePost(DataSet: TDataSet);
     procedure QMEscandalloPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMEscandalloAfterPost(DataSet: TDataSet);
     procedure QMEscandalloDetDETALLEChange(Sender: TField);
     procedure QMEscandalloDetBeforePost(DataSet: TDataSet);
     procedure QMEscandalloSUM_UNID_KRIGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMEscandalloProcAfterDelete(DataSet: TDataSet);
     procedure QMEscandalloProcAfterPost(DataSet: TDataSet);
     procedure QMEscandalloProcNewRecord(DataSet: TDataSet);
     procedure QMEscandalloProcPROCESOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     function CosteTotal: double;
     procedure BusquedaCompleja;
     procedure DuplicaEscandalloTyC;
     procedure RecalculoDeCostes;
     procedure MuestraTodos(Todos: boolean);
     procedure FiltraEscandallo(Filtro: string);
     procedure ExportacionJMTChem;
  end;

var
  DMEscandalloProd_kri : TDMEscandalloProd_kri;

implementation

uses UDMMain, UEntorno, UUtiles, UFBusca;

{$R *.DFM}

procedure TDMEscandalloProd_kri.DMEscandalloProdCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Ponemos las máscaras
  QMEscandalloUNIDADES.DisplayFormat := MascaraI;
  QMEscandalloCOSTE.DisplayFormat := MascaraN;
  QMEscandalloDetCANTIDAD.DisplayFormat := MascaraKri;
  QMEscandalloDetCOSTE.DisplayFormat := MascaraN;
  QMEscandalloDetP_COSTE.DisplayFormat := MascaraN;
  QMEscandalloProcPRECIO.DisplayFormat := MascaraE;
  QMEscandalloProcDURACION.DisplayFormat := ',##0.##';

  // Abrimos la tabla maestra
  DMMain.FiltraTabla(QMEscandallo, '10000', True);
end;

procedure TDMEscandalloProd_kri.QMEscandalloAfterOpen(DataSet: TDataSet);
begin
  // Abrimos las tablas hijas
  QMEscandalloDet.Open;
  xArticulos.Open;
  QMEscandalloProc.Open;
end;

procedure TDMEscandalloProd_kri.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMEscandalloProd_kri.QMEscandalloNewRecord(DataSet: TDataSet);
begin
  // Valores por defecto
  with QEjercicio do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     QMEscandalloFECHA_DESDE.AsDateTime := FieldByName['APERTURA'].AsDateTime;
     QMEscandalloFECHA_HASTA.AsDateTime := FieldByName['CIERRE'].AsDateTime;
     Close;
     FreeHandle;
  end;

  QMEscandalloEMPRESA.AsInteger := REntorno.Empresa;
  QMEscandalloUNIDADES.AsFloat := 1;
  QMEscandalloACTIVO.AsInteger := 1;
  QMEscandalloCOSTE.AsFloat := 0;
end;

procedure TDMEscandalloProd_kri.QMEscandalloDetNewRecord(DataSet: TDataSet);
begin
  // Si el maestro está en modo de inserción o edición, lo grabamos antes
  if ((QMEscandallo.State = dsInsert) or (QMEscandallo.State = dsEdit)) then
  begin
     QMEscandallo.Post;
     QMEscandalloDet.Edit;
  end;

  // Valores por defecto
  QMEscandalloDetEMPRESA.AsInteger := REntorno.Empresa;
  QMEscandalloDetARTICULO.AsString := QMEscandalloARTICULO.AsString;
  QMEscandalloDetNUMERO.AsInteger := QMEscandalloNUMERO.AsInteger;
  QMEscandalloDetCANTIDAD.AsFloat := 1;
  QMEscandalloDetCOSTE.AsFloat := 0;
end;

procedure TDMEscandalloProd_kri.QMEscandalloARTICULOChange(Sender: TField);
begin
  // Cambio de Título del artículo
  with xArticulos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMEscandalloProd_kri.QMEscandalloBeforePost(DataSet: TDataSet);
begin
  // Llamada al contador
  if (DataSet.State = dsInsert) then
  begin
     with QContador do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := QMEscandalloARTICULO.AsString;
        ExecQuery;
        QMEscandalloNUMERO.AsInteger := FieldByName['CONTADOR'].AsInteger + 1;
        FreeHandle;
     end;
  end;
end;

procedure TDMEscandalloProd_kri.QMEscandalloPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMEscandallo.State = dsInsert then
     QMEscandalloNUMERO.Clear;
end;

procedure TDMEscandalloProd_kri.QMEscandalloAfterPost(DataSet: TDataSet);
begin
  // Grabamos en la transacción local
  Graba(DataSet);
end;

procedure TDMEscandalloProd_kri.QMEscandalloDetDETALLEChange(Sender: TField);
begin
  // Obtenemos el título del artículo
  with xArticulosDet do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMEscandalloDetDETALLE.AsString;
     ExecQuery;
     QMEscandalloDetTITULO.AsString := FieldByName['TITULO'].AsString;
     QMEscandalloDetP_COSTE.AsString := FieldByName['P_COSTE'].AsString;
     {dji lrk kri - es como refrescar, pues es el p_coste del art en la vista}
     QMEscandalloDetFAMILIA.AsString := FieldByName['FAMILIA'].AsString;
  end;
end;

procedure TDMEscandalloProd_kri.BusquedaCompleja;
begin
  MuestraTodos(True);
  // Llamada al buscador
  TFBusca.Create(Self).SeleccionaBusqueda(QMEscandallo, '10000', True);
end;

procedure TDMEscandalloProd_kri.QMEscandalloDetBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if (QMEscandalloDetCANTIDAD.AsString = '') then
     QMEscandalloDetCANTIDAD.AsFloat := 1;
  if (DataSet.State = dsInsert) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add('select max(linea) as linea from ART_ARTICULOS_ESC_PROD_DETALLE ');
           SQL.Add('where EMPRESA = ?EMPRESA AND ');
           SQL.Add('ARTICULO = ?ARTICULO AND ');
           SQL.Add('NUMERO = ?NUMERO ');
           Params.ByName['EMPRESA'].AsInteger := QMEscandalloDetEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMEscandalloDetARTICULO.AsString;
           Params.ByName['NUMERO'].AsInteger := QMEscandalloDetNUMERO.AsInteger;
           ExecQuery;
           QMEscandalloDetLINEA.AsInteger := FieldByName['linea'].AsInteger + 1;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

function TDMEscandalloProd_kri.CosteTotal: double;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'execute procedure A_ART_ESC_PRODUCCION_COSTE (?EMPRESA,?ARTICULO,?NUMERO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := QMEscandalloARTICULO.AsString;
        Params.ByName['NUMERO'].AsFloat := QMEscandalloNUMERO.AsFloat;
        ExecQuery;
        Result := FieldByName['coste'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMEscandalloProd_kri.QMEscandalloSUM_UNID_KRIGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(CANTIDAD) FROM art_articulos_esc_prod_detalle ' +
           'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO AND NUMERO=?NUMERO';
        Params.ByName['EMPRESA'].AsInteger := QMEscandalloEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMEscandalloARTICULO.AsString;
        Params.ByName['NUMERO'].AsInteger := QMEscandalloNUMERO.AsInteger;
        ExecQuery;
        Text := FormatFloat(MascaraN, FieldByName['SUM'].AsFloat);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMEscandalloProd_kri.DuplicaEscandalloTyC;
begin
  QDuplicaEscandalloTyC.Close;
  QDuplicaEscandalloTyC.Params.ByName['EMPRESA'].AsInteger :=
     QMEscandalloEMPRESA.AsInteger;
  QDuplicaEscandalloTyC.Params.ByName['ARTICULO'].AsString :=
     QMEscandalloARTICULO.AsString;
  QDuplicaEscandalloTyC.Params.ByName['NUMERO'].AsInteger :=
     QMEscandalloNUMERO.AsInteger;
  QDuplicaEscandalloTyC.ExecQuery;
  QMEscandallo.Close;
  QMEscandallo.Open;
end;

procedure TDMEscandalloProd_kri.QMEscandalloProcAfterDelete(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMEscandalloProd_kri.QMEscandalloProcAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMEscandalloProd_kri.QMEscandalloProcNewRecord(DataSet: TDataSet);
begin
  // Valores por defecto
  QMEscandalloProcEMPRESA.AsInteger := REntorno.Empresa;
  QMEscandalloProcARTICULO.AsString := QMEscandalloARTICULO.AsString;
  QMEscandalloProcNUMERO.AsInteger := QMEscandalloNUMERO.AsInteger;
  QMEscandalloProcOPERARIO.AsInteger := 0;
end;

procedure TDMEscandalloProd_kri.QMEscandalloProcPROCESOChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select titulo, duracion, precio from emp_procesos_produccion where empresa=?empresa and proceso=?proceso';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROCESO'].AsString := Sender.AsString;
        ExecQuery;
        QMEscandalloProcTITULO_PROCESO.AsString := FieldByName['titulo'].AsString;
        QMEscandalloProcDURACION.AsFloat := FieldByName['duracion'].AsFloat;
        QMEscandalloProcPRECIO.AsFloat := FieldByName['precio'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select OPERARIO, TITULO_OP from a_art_dame_operario(?EMPRESA,?PROCESO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROCESO'].AsString := Sender.AsString;
        ExecQuery;
        QMEscandalloProcOPERARIO.AsInteger := FieldByName['OPERARIO'].AsInteger;
        QMEscandalloProcTITULO_OP.AsString := FieldByName['TITULO_OP'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMEscandalloProd_kri.RecalculoDeCostes;
var
  DS : TFIBDataSet;
  Q : THYFIBQuery;
  err : string;
begin
  // Label1.Caption := 'VERIFICANDO ESCANDALLOS';
  // Label1.Visible:=TRUE;
  Application.ProcessMessages;
  err := '';
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
           end;
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'select c1.articulo,c1.numero,d1.detalle,d2.detalle,d3.detalle,d4.detalle,d5.detalle,d6.detalle from art_articulos_esc_produccion c1 ' +
              'left join art_articulos_esc_prod_detalle d1 ' +
              'on c1.empresa=d1.empresa and ' +
              '   c1.articulo=d1.articulo and ' +
              '   c1.numero=d1.numero ' +
              'left join art_articulos_esc_prod_detalle d2 ' +
              'on d1.empresa=d2.empresa and ' +
              '   d1.detalle=d2.articulo and ' +
              '   d1.numero=d2.numero ' +
              'left join art_articulos_esc_prod_detalle d3 ' +
              'on d2.empresa=d3.empresa and ' +
              '   d2.detalle=d3.articulo and ' +
              '   d2.numero=d3.numero ' +
              'left join art_articulos_esc_prod_detalle d4 ' +
              'on d3.empresa=d4.empresa and ' +
              '   d3.detalle=d4.articulo and ' +
              '   d3.numero=d4.numero ' +
              'left join art_articulos_esc_prod_detalle d5 ' +
              'on d4.empresa=d5.empresa and ' +
              '   d4.detalle=d5.articulo and ' +
              '   d4.numero=d5.numero ' +
              'left join art_articulos_esc_prod_detalle d6 ' +
              'on d5.empresa=d6.empresa and ' +
              '   d5.detalle=d6.articulo and ' +
              '   d5.numero=d6.numero ' +
              'where ' +
              '(c1.articulo=d1.detalle) or ' +
              '(c1.articulo=d2.detalle) or ' +
              '(c1.articulo=d3.detalle) or ' +
              '(c1.articulo=d4.detalle) or ' +
              '(c1.articulo=d5.detalle) or ' +
              '(c1.articulo=d6.detalle) ';
           Open;
           while (not EOF) do
           begin
              err := err + FieldByName('ARTICULO').AsString + ' (' + FieldByName('NUMERO').AsString + ')--> ' +
                 FieldByName('DETALLE').AsString + ' - ' + FieldByName('DETALLE1').AsString + ' - ' +
                 FieldByName('DETALLE2').AsString + ' - ' + FieldByName('DETALLE3').AsString + ' - ' +
                 FieldByName('DETALLE4').AsString + ' - ' + FieldByName('DETALLE5').AsString + #13;
              Next;
           end;
           if (err > '') then
           begin
              MessageDlg(_('Escandallo Erroneo') + #13#10 + err, mtError, [mbOK], 0);
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
  if (err = '') then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'execute procedure calculo_escandallos_kri';
           try
              ExecQuery;
           except
              on e: Exception do
              begin
                 MessageDlg(_('Error en el calculo de coste de escandallos') + #13#10 + e.Message, mtError, [mbOK], 0);
                 err := '';
              end;
           end;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
     if (err = '') then
        ShowMessage(_('Se han calculado los precios de coste de los escandallos de produccion'));
  end;
end;

procedure TDMEscandalloProd_kri.MuestraTodos(Todos: boolean);
var
  articulo : string;
  numero : integer;
  activo : integer;
begin
  // Guardo los datos para tratar de reposicionarme
  articulo := QMEscandalloARTICULO.AsString;
  numero := QMEscandalloNUMERO.AsInteger;
  activo := QMEscandalloACTIVO.AsInteger;

  with QMEscandallo do
  begin
     // Aplico el filtro
     DisableControls;
     try
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT * FROM VER_ARTICULOS_ESC_PROD_TIT_KRI C ');
        SelectSQL.Add('WHERE ');
        SelectSQL.Add('C.EMPRESA =?EMPRESA ');
        if (not Todos) then
        begin
           SelectSQL.Add('AND C.ACTIVO = 1 ');
           activo := 1;
        end;
        SelectSQL.Add('ORDER BY C.ARTICULO, C.ACTIVO DESC, C.NUMERO DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;

        // Trato de reposicionar
        // Primero busco un registro identico
        while ((not EOF) and (not ((articulo = QMEscandalloARTICULO.AsString) and (numero = QMEscandalloNUMERO.AsInteger) and (activo = QMEscandalloACTIVO.AsInteger)))) do
           Next;
        if (EOF and ((articulo <> QMEscandalloARTICULO.AsString) or (numero <> QMEscandalloNUMERO.AsInteger) or (activo <> QMEscandalloACTIVO.AsInteger))) then
        begin
           // Si no encuentro, busco registro parecido
           First;
           while ((not EOF) and (not ((articulo = QMEscandalloARTICULO.AsString) and (activo = QMEscandalloACTIVO.AsInteger)))) do
              Next;
           if (EOF and ((articulo <> QMEscandalloARTICULO.AsString) or (activo <> QMEscandalloACTIVO.AsInteger))) then
           begin
              // Si no encuentro, busco registro con el mismo articulo
              First;
              while ((not EOF) and (articulo <> QMEscandalloARTICULO.AsString)) do
                 Next;
              // Si no puedo reposicionarme voy al primer registro
              if (EOF and (articulo <> QMEscandalloARTICULO.AsString)) then
                 First;
           end;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMEscandalloProd_kri.FiltraEscandallo(Filtro: string);
begin
  with QMEscandallo do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_ARTICULOS_ESC_PROD_TIT_KRI C');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' C.ACTIVO = 1 ');
     if (Trim(Filtro) > '') then
        SelectSQL.Add(' AND ' + Filtro);
     SelectSQL.Add(' ORDER BY C.ARTICULO, C.ACTIVO DESC, C.NUMERO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMEscandalloProd_kri.ExportacionJMTChem;
var
  Carpeta : string;
  Fichero : string;
  ts : TStrings;
begin
  // Verifico si existe carpeta
  Carpeta := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True));
  if not DirectoryExists(Carpeta + 'JMTChem') then
     CreateDir(Carpeta + 'JMTChem'); {Creo directorios si no existen}
  Carpeta := IncludeTrailingPathDelimiter(Carpeta + 'JMTChem');

  ts := TStringList.Create;
  try
     // Caracterisitcas del articulo escandallo
     xCaracteristicas.Open;

     // Recorro escandallos
     QMEscandallo.First;
     while not QMEscandallo.EOF do
     begin
        { Las materias primas no se exportaran

        // Recorro materiales
        QMEscandalloDet.First;
        while not QMEscandalloDet.EOF do
        begin
           Fichero := format('%s%s.xml', [Carpeta, LimpiaNombreFichero(QMEscandalloDetDETALLE.AsString)]);
           if not FileExists(Fichero) then
           begin
              // Exporto material
              // material_clase = (31:Tintas / 32:Productos Quimicos / 33:Disolventes / 34:Aerosoles)
              // formula_tipo = (1:materia prima, 2:producto intermedio, 3:producto acabado)

              ts.Clear;
              ts.Add('<estructura>');
              ts.Add('    <material>');
              ts.Add('        <material_codigo>' + QMEscandalloDetDETALLE.AsString + '</material_codigo>');
              ts.Add('        <material_nombre1>' + QMEscandalloDetTITULO.AsString + '</material_nombre1>');
              // ts.Add('        <material_nombre2>'+QMEscandalloDetTITULO.AsString+'</material_nombre2>');
              // ts.Add('        <material_nombre3>'+QMEscandalloDetTITULO.AsString+'</material_nombre3>');
              ts.Add('        <material_clase>31</material_clase>'); // ???
              // ts.Add('        <material_generico></material_generico>'); // ???
              ts.Add('    </material>');
              ts.Add('    <formula>');
              ts.Add('        <formula_tipo>1</formula_tipo>'); // 1=materia prima, 2=producto intermedio, 3=producto acabado
              ts.Add('        <formula_componente>' + QMEscandalloDetDETALLE.AsString + '</formula_componente>');
              ts.Add('        <formula_cantidad>100</formula_cantidad>');
              ts.Add('    </formula>');
              ts.Add('    <caracteristica>');
              ts.Add('        <caracteristica_codigo></caracteristica_codigo>'); // ???
              ts.Add('        <caracteristica_valor1></caracteristica_valor1>'); // ???
              ts.Add('        <caracteristica_valor2></caracteristica_valor2>'); // ???
              ts.Add('        </caracteristica>');
              ts.Add('    </estructura>');
              ts.SaveToFile(Fichero);
           end;

           QMEscandalloDet.Next;
        end;
        }

        // Ahora el compuesto
        Fichero := format('%s%s.xml', [Carpeta, LimpiaNombreFichero(QMEscandalloARTICULO.AsString)]);
        if not FileExists(Fichero) then
        begin
           // Exporto escandallo
           ts.Clear;
           ts.Add('<estructura>');
           ts.Add('    <material>');
           ts.Add('        <material_codigo>' + QMEscandalloARTICULO.AsString + '</material_codigo>');
           ts.Add('        <material_nombre1>' + QMEscandalloTITULO.AsString + '</material_nombre1>');
           // ts.Add('        <material_nombre2>'+QMEscandalloDetTITULO.AsString+'</material_nombre2>');
           // ts.Add('        <material_nombre3>'+QMEscandalloDetTITULO.AsString+'</material_nombre3>');
           ts.Add('        <material_clase>31</material_clase>'); // ???
           // ts.Add('        <material_generico></material_generico>'); // ???
           ts.Add('    </material>');

           // Agrego materiales al tag <formula>
           QMEscandalloDet.First;
           while not QMEscandalloDet.EOF do
           begin
              ts.Add('    <formula>');
              ts.Add('        <formula_tipo>1</formula_tipo>'); // 1=materia prima, 2=producto intermedio, 3=producto acabado
              ts.Add('        <formula_componente>' + QMEscandalloDetDETALLE.AsString + '</formula_componente>');
              ts.Add('        <formula_cantidad>' + FloatToStrDec(QMEscandalloDetCANTIDAD.AsFloat, '.') + '</formula_cantidad>');
              ts.Add('    </formula>');

              QMEscandalloDet.Next;
           end;

           // Agrego caracterisitcas del articulo compuesto
           xCaracteristicas.First;
           while not xCaracteristicas.EOF do
           begin
              ts.Add('    <caracteristica>');
              ts.Add('        <caracteristica_codigo>' + xCaracteristicas.FieldByName('CODIGO').AsString + '</caracteristica_codigo>'); // ???
              ts.Add('        <caracteristica_valor1>' + xCaracteristicas.FieldByName('VALOR1').AsString + '</caracteristica_valor1>'); // ???
              ts.Add('        <caracteristica_valor2>' + xCaracteristicas.FieldByName('VALOR2').AsString + '</caracteristica_valor2>'); // ???
              ts.Add('    </caracteristica>');

              xCaracteristicas.Next;
           end;

           ts.Add('</estructura>');

           ts.SaveToFile(Fichero);
        end;

        QMEscandallo.Next;
     end;
  finally
     xCaracteristicas.Close;
     ts.Free;
  end;
end;

end.
