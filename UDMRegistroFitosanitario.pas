unit UDMRegistroFitosanitario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMRegistroFitosanitario = class(TDataModule)
     QMRegistroFitosanitario: TFIBTableSet;
     DSQMRegistroFitosanitario: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMRegistroFitosanitarioID_REGISTRO_FITOSANITARIO: TIntegerField;
     QMRegistroFitosanitarioEMPRESA: TIntegerField;
     QMRegistroFitosanitarioEJERCICIO: TIntegerField;
     QMRegistroFitosanitarioCANAL: TIntegerField;
     QMRegistroFitosanitarioSERIE: TFIBStringField;
     QMRegistroFitosanitarioTIPO: TFIBStringField;
     QMRegistroFitosanitarioRIG: TIntegerField;
     QMRegistroFitosanitarioLINEA: TIntegerField;
     QMRegistroFitosanitarioID_S: TIntegerField;
     QMRegistroFitosanitarioID_DETALLES_S: TIntegerField;
     QMRegistroFitosanitarioTIPO_REGISTRO: TFIBStringField;
     QMRegistroFitosanitarioARTICULO: TFIBStringField;
     QMRegistroFitosanitarioDESCRIPCION: TFIBStringField;
     QMRegistroFitosanitarioCANTIDAD: TFloatField;
     QMRegistroFitosanitarioFECHA: TDateTimeField;
     QMRegistroFitosanitarioNIF: TFIBStringField;
     QMRegistroFitosanitarioNOMBRE: TFIBStringField;
     QMRegistroFitosanitarioDIRECCION: TFIBStringField;
     QMRegistroFitosanitarioC_POSTAL: TFIBStringField;
     QMRegistroFitosanitarioLOCALIDAD: TFIBStringField;
     QMRegistroFitosanitarioLOTE: TFIBStringField;
     QMRegistroFitosanitarioCOD_REG_FITOSANITARIO: TFIBStringField;
     QMRegistroFitosanitarioCARNET_APLICADOR: TFIBStringField;
     QMRegistroFitosanitarioNOTAS: TBlobField;
     QMRegistroFitosanitarioFECHA_VALIDEZ_CARNET_APLICADOR: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMRegistroFitosanitarioNewRecord(DataSet: TDataSet);
     procedure QMRegistroFitosanitarioBeforePost(DataSet: TDataSet);
     procedure QMRegistroFitosanitarioID_DETALLES_SChange(Sender: TField);
     procedure QMRegistroFitosanitarioID_SChange(Sender: TField);
     procedure QMRegistroFitosanitarioARTICULOChange(Sender: TField);
  private
     { Private declarations }
     Tipo: string;
     IdDet: integer;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure AsignaDocumento(aTipo: string; aIdDet: integer);
  end;

var
  DMRegistroFitosanitario : TDMRegistroFitosanitario;

implementation

uses
  UDMMain, UEntorno, UDameDato, uFBusca, HYFIBQuery, UParam;

{$R *.dfm}

procedure TDMRegistroFitosanitario.DataModuleCreate(Sender: TObject);
begin
  inherited;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  with QMRegistroFitosanitario do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  Tipo := '';
  IdDet := 0;
end;

procedure TDMRegistroFitosanitario.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMRegistroFitosanitario, '11100');
end;

procedure TDMRegistroFitosanitario.QMRegistroFitosanitarioNewRecord(DataSet: TDataSet);
begin
  QMRegistroFitosanitarioID_REGISTRO_FITOSANITARIO.AsInteger := 0;
  QMRegistroFitosanitarioEMPRESA.AsInteger := REntorno.Empresa;
  QMRegistroFitosanitarioEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMRegistroFitosanitarioCANAL.AsInteger := REntorno.Canal;

  // Campos que vendrán dados por el detalle de un documento
  QMRegistroFitosanitarioSERIE.AsString := '';
  QMRegistroFitosanitarioRIG.AsInteger := 0;
  QMRegistroFitosanitarioLINEA.AsInteger := 0;
  QMRegistroFitosanitarioID_S.AsInteger := 0;

  QMRegistroFitosanitarioTIPO_REGISTRO.AsString := 'A';
  QMRegistroFitosanitarioCOD_REG_FITOSANITARIO.AsString := '';
  QMRegistroFitosanitarioCANTIDAD.AsFloat := 0;
  QMRegistroFitosanitarioFECHA.AsDateTime := REntorno.FechaTrabSH;

  // Estos dos campos se rellenan al final, para incializar campos asociados a la linea.
  QMRegistroFitosanitarioTIPO.AsString := Tipo;
  QMRegistroFitosanitarioID_DETALLES_S.AsInteger := IdDet;
end;

procedure TDMRegistroFitosanitario.QMRegistroFitosanitarioBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_REGISTRO_FITOSANITARIO', 'ID_REGISTRO_FITOSANITARIO'); // ID
end;

procedure TDMRegistroFitosanitario.AsignaDocumento(aTipo: string; aIdDet: integer);
begin
  Tipo := aTipo;
  IdDet := aIdDet;

  with QMRegistroFitosanitario do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM GES_REGISTRO_FITOSANITARIO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' TIPO = ?TIPO AND ');
     SelectSQL.Add(' ID_DETALLES_S = ?ID_DETALLES_S ');
     SelectSQL.Add(' ORDER BY ID_REGISTRO_FITOSANITARIO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ID_DETALLES_S'].AsInteger := IdDet;
     Open;

     // Si no existe el registro para esta linea de detalle, lo creo.
     if (EOF) then
        Insert
     else
        Edit;
  end;
end;

procedure TDMRegistroFitosanitario.QMRegistroFitosanitarioID_DETALLES_SChange(Sender: TField);
var
  ParametrosEnCamposAlfa : boolean;
begin
  if ((QMRegistroFitosanitario.State = dsInsert) and (QMRegistroFitosanitarioTIPO.AsString <> '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;

           if (QMRegistroFitosanitarioTIPO.AsString = 'TIC') then
           begin
              SQL.Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.RIT AS RIG, D.LINEA, ');
              SQL.Add(' D.ID_TICKET AS ID_S, D.ARTICULO, D.UNIDADES, A.TIPO_REGISTRO_FITOSANITARIO ');
              SQL.Add(' FROM GES_TICKET_DETALLE D ');
              SQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_TICKET_DETALLE = :ID_DETALLES_S ');
           end
           else
           begin
              SQL.Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.RIG, D.LINEA, ');
              SQL.Add(' D.ID_S, D.ARTICULO, D.UNIDADES, A.TIPO_REGISTRO_FITOSANITARIO ');
              SQL.Add(' FROM GES_DETALLES_S D ');
              SQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
              SQL.Add(' WHERE ');
              SQL.Add(' D.ID_DETALLES_S = :ID_DETALLES_S ');
           end;

           Params.ByName['ID_DETALLES_S'].AsInteger := QMRegistroFitosanitarioID_DETALLES_S.AsInteger;
           ExecQuery;

           QMRegistroFitosanitarioARTICULO.AsString := FieldByName['ARTICULO'].AsString;
           QMRegistroFitosanitarioCANTIDAD.AsFloat := FieldByName['UNIDADES'].AsFloat;
           QMRegistroFitosanitarioEMPRESA.AsInteger := FieldByName['EMPRESA'].AsInteger;
           QMRegistroFitosanitarioEJERCICIO.AsInteger := FieldByName['EJERCICIO'].AsInteger;
           QMRegistroFitosanitarioCANAL.AsInteger := FieldByName['CANAL'].AsInteger;
           QMRegistroFitosanitarioSERIE.AsString := FieldByName['SERIE'].AsString;
           QMRegistroFitosanitarioRIG.AsInteger := FieldByName['RIG'].AsInteger;
           QMRegistroFitosanitarioLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
           QMRegistroFitosanitarioID_S.AsInteger := FieldByName['ID_S'].AsInteger;
           QMRegistroFitosanitarioTIPO_REGISTRO.AsString := FieldByName['TIPO_REGISTRO_FITOSANITARIO'].AsString;

           FreeHandle;
        finally
           Free;
        end;
     end;

     ParametrosEnCamposAlfa := (LeeParametro('REGFITO001') = 'S');

     if (ParametrosEnCamposAlfa) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;

              SQL.Text := 'SELECT ALFA_3, ALFA_4, TIPO_REGISTRO_FITOSANITARIO FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';

              Params.ByName['EMPRESA'].AsInteger := QMRegistroFitosanitarioEMPRESA.AsInteger;
              Params.ByName['ARTICULO'].AsString := QMRegistroFitosanitarioARTICULO.AsString;
              ExecQuery;

              QMRegistroFitosanitarioCOD_REG_FITOSANITARIO.AsString := FieldByName['ALFA_3'].AsString;
              QMRegistroFitosanitarioLOTE.AsString := FieldByName['ALFA_4'].AsString;
              QMRegistroFitosanitarioTIPO_REGISTRO.AsString := FieldByName['TIPO_REGISTRO_FITOSANITARIO'].AsString;

              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
     begin
        // Informacion de Lote
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;

              { TODO : Revisar codigo que trae LOTE en caso de TICKET. }
              if (QMRegistroFitosanitarioTIPO.AsString = 'TIC') then
                 SQL.Text := 'SELECT CAST('''' AS VARCHAR(20)) LOTE FROM GES_TICKET_DETALLE WHERE ID_TICKET_DETALLE = :ID_DETALLES_S'
              else
                 SQL.Text := 'SELECT FIRST 1 LOTE FROM GES_DETALLES_S_LOTES WHERE ID_DETALLES_S = :ID_DETALLES_S ORDER BY SUBLINEA';

              Params.ByName['ID_DETALLES_S'].AsInteger := QMRegistroFitosanitarioID_DETALLES_S.AsInteger;
              ExecQuery;

              QMRegistroFitosanitarioLOTE.AsString := FieldByName['LOTE'].AsString;

              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMRegistroFitosanitario.QMRegistroFitosanitarioID_SChange(Sender: TField);
begin
  if ((QMRegistroFitosanitario.State = dsInsert) and (QMRegistroFitosanitarioTIPO.AsString <> '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;

           if (QMRegistroFitosanitarioTIPO.AsString = 'TIC') then
           begin
              SQL.Add(' SELECT C.FECHA, T.NIF, T.NOMBRE_R_SOCIAL NOMBRE, DIR.DIR_COMPLETA DIRECCION, LOC.CODIGO_POSTAL, LOC.TITULO LOCALIDAD, ');
              SQL.Add('        N.NIF VARIOS_NIF, N.NOMBRE VARIOS_NOMBRE, N.DIRECCION VARIOS_DIRECCION, N.C_POSTAL VARIOS_CODIGO_POSTAL, ');
              SQL.Add('        N.LOCALIDAD VARIOS_LOCALIDAD, N.ID_S ID_S_VARIOS, ');
              SQL.Add('        T.CARNET_APLICADOR, N.CARNET_APLICADOR VARIOS_CARNET_APLICADOR, T.FECHA_VALIDEZ_CARNET_APLICADOR ');
              SQL.Add(' FROM GES_TICKET_CABECERA C ');
              SQL.Add(' JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = CL.CLIENTE ');
              SQL.Add(' JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO ');
              SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES DIR ON T.TERCERO = DIR.TERCERO AND DIR.DIR_DEFECTO = 1 ');
              SQL.Add(' JOIN SYS_LOCALIDADES LOC ON DIR.DIR_LOCALIDAD = LOC.LOCALIDAD ');
              SQL.Add(' LEFT JOIN GES_CABECERAS_S_FAC_NIF N ON C.ID_TICKET = N.ID_S AND C.TIPO = N.TIPO ');
              SQL.Add(' WHERE ');
              SQL.Add(' C.ID_TICKET = :ID_S ');
           end
           else
           begin
              SQL.Add(' SELECT C.FECHA, T.NIF, T.NOMBRE_R_SOCIAL NOMBRE, DIR.DIR_COMPLETA DIRECCION, LOC.CODIGO_POSTAL, LOC.TITULO LOCALIDAD, ');
              SQL.Add('        N.NIF VARIOS_NIF, N.NOMBRE VARIOS_NOMBRE, N.DIRECCION VARIOS_DIRECCION, N.C_POSTAL VARIOS_CODIGO_POSTAL, ');
              SQL.Add('        N.LOCALIDAD VARIOS_LOCALIDAD, N.ID_S ID_S_VARIOS, ');
              SQL.Add('        T.CARNET_APLICADOR, T2.CARNET_APLICADOR VARIOS_CARNET_APLICADOR, T.FECHA_VALIDEZ_CARNET_APLICADOR ');
              SQL.Add(' FROM GES_CABECERAS_S C ');
              SQL.Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
              SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES DIR ON T.TERCERO = DIR.TERCERO AND DIR.DIR_DEFECTO = 1 ');
              SQL.Add(' JOIN SYS_LOCALIDADES LOC ON DIR.DIR_LOCALIDAD = LOC.LOCALIDAD ');
              SQL.Add(' LEFT JOIN GES_CABECERAS_S_FAC_NIF N ON C.ID_S = N.ID_S AND C.TIPO = N.TIPO ');
              SQL.Add(' LEFT JOIN SYS_TERCEROS T2 ON N.TERCERO = T2.TERCERO ');
              SQL.Add(' WHERE ');
              SQL.Add(' C.ID_S = :ID_S ');
           end;

           Params.ByName['ID_S'].AsInteger := QMRegistroFitosanitarioID_S.AsInteger;
           ExecQuery;

           if (FieldByName['ID_S_VARIOS'].AsInteger = 0) then
           begin
              QMRegistroFitosanitarioFECHA.AsDateTime := FieldByName['FECHA'].AsDateTime;
              QMRegistroFitosanitarioNIF.AsString := FieldByName['NIF'].AsString;
              QMRegistroFitosanitarioNOMBRE.AsString := FieldByName['NOMBRE'].AsString;
              QMRegistroFitosanitarioDIRECCION.AsString := FieldByName['DIRECCION'].AsString;
              QMRegistroFitosanitarioC_POSTAL.AsString := FieldByName['CODIGO_POSTAL'].AsString;
              QMRegistroFitosanitarioLOCALIDAD.AsString := FieldByName['LOCALIDAD'].AsString;
              QMRegistroFitosanitarioCARNET_APLICADOR.AsString := FieldByName['CARNET_APLICADOR'].AsString;
              QMRegistroFitosanitarioFECHA_VALIDEZ_CARNET_APLICADOR.AsString := FieldByName['FECHA_VALIDEZ_CARNET_APLICADOR'].AsString;
           end
           else
           begin
              QMRegistroFitosanitarioFECHA.AsDateTime := FieldByName['FECHA'].AsDateTime;
              QMRegistroFitosanitarioNIF.AsString := FieldByName['VARIOS_NIF'].AsString;
              QMRegistroFitosanitarioNOMBRE.AsString := FieldByName['VARIOS_NOMBRE'].AsString;
              QMRegistroFitosanitarioDIRECCION.AsString := FieldByName['VARIOS_DIRECCION'].AsString;
              QMRegistroFitosanitarioC_POSTAL.AsString := FieldByName['VARIOS_CODIGO_POSTAL'].AsString;
              QMRegistroFitosanitarioLOCALIDAD.AsString := FieldByName['VARIOS_LOCALIDAD'].AsString;
              QMRegistroFitosanitarioCARNET_APLICADOR.AsString := FieldByName['VARIOS_CARNET_APLICADOR'].AsString;
           end;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRegistroFitosanitario.QMRegistroFitosanitarioARTICULOChange(Sender: TField);
begin
  QMRegistroFitosanitarioDESCRIPCION.AsString := DameTituloArticulo(QMRegistroFitosanitarioARTICULO.AsString);
end;

end.
