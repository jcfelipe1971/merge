unit UDMUsuariosWeb;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, FIBDataSetRO;

type
  TDMUsuariosWeb = class(TDataModule)
     QMUsuariosWeb: TFIBTableSet;
     DSQMUsuariosWeb: TDataSource;
     TLocal: THYTransaction;
     QMUsuariosWebUSUARIOID: TFIBStringField;
     QMUsuariosWebCONTRASENYA: TFIBStringField;
     QMUsuariosWebEMAIL: TFIBStringField;
     QMUsuariosWebNOMBRE: TFIBStringField;
     QMUsuariosWebTELEFONO: TFIBStringField;
     QMUsuariosWebTIPO_USUARIO: TIntegerField;
     QMUsuariosWebACEPTAR: TIntegerField;
     QMUsuariosWebID_CLIENTE_AGENTE: TIntegerField;
     xNombre: TFIBTableSet;
     DSxNombre: TDataSource;
     xNombreNOMBRE: TFIBStringField;
     QMUsuariosWebSTOCK: TIntegerField;
     QMUsuariosWebVISTA: TFIBStringField;
     QMUsuariosWebWEB_EMPRESA: TIntegerField;
     QMUsuariosWebWEB_EJERCICIO: TIntegerField;
     QMUsuariosWebWEB_CANAL: TIntegerField;
     QMUsuariosWebWEB_SERIE: TFIBStringField;
     QMUsuariosWebWEB_ALMACEN: TFIBStringField;
     QMUsuariosWebWEB_TARIFA: TFIBStringField;
     QMUsuariosWebWEB_APLICA_TARIFA: TIntegerField;
     xEmpresas: TFIBDataSetRO;
     DSxEmpresas: TDataSource;
     TUpdate: THYTransaction;
     QMUsuariosWebUSUARIO: TIntegerField;
     QMUsuariosWebID_USUARIO: TIntegerField;
     DSQMUsuariosWebDocs: TDataSource;
     QMUsuariosWebDocs: TFIBTableSet;
     QMUsuariosWebDIRECCION_AMPLIADA: TBlobField;
     QMUsuariosWebMarcas: TFIBTableSet;
     DSQMUsuariosWebMarcas: TDataSource;
     QMUsuariosWebMarcasUSUARIOID: TFIBStringField;
     QMUsuariosWebMarcasID_MARCA: TIntegerField;
     QMUsuariosWebMarcasTITULO: TFIBStringField;
     QMUsuariosWebDocsUSUARIOID: TFIBStringField;
     QMUsuariosWebDocsTIPO: TFIBStringField;
     QMUsuariosWebDocsTITULO_DOC: TFIBStringField;
     QMUsuariosWebDocsPERMISO_DOC: TIntegerField;
     QMUsuariosWebDocsDEFECTO_DOC: TIntegerField;
     QMUsuariosWebModulos: TFIBTableSet;
     DSUsuariosWebModulos: TDataSource;
     QMUsuariosWebModulosUSUARIOID: TFIBStringField;
     QMUsuariosWebModulosCOD_MODULO: TFIBStringField;
     QMUsuariosWebModulosTITULO_MODULO_USR: TFIBStringField;
     QMUsuariosWebModulosDESC_MODULO_USR: TFIBStringField;
     QMUsuariosWebModulosORDEN: TIntegerField;
     QMUsuariosWebCONFIGURACION: TIntegerField;
     QMUsuariosWebID_EMPLEADO: TIntegerField;
     QMUsuariosWebSECCION: TFIBStringField;
     QMUsuariosWebHOJA_TRABAJO_VER_MAQUINA: TIntegerField;
     xNombreMAESTRO: TIntegerField;
     QMUsuariosWebModulosADMINISTRADOR: TIntegerField;
     QMUsuariosWebIMAGEN: TIntegerField;
     QMUsuariosWebTERCERO: TIntegerField;
     QMUsuariosWebDIRECCION: TIntegerField;
     xNombreTERCERO: TIntegerField;
     QMUsuariosWebCONTACTO: TIntegerField;
     QMUsuariosWebDATE_INS: TDateTimeField;
     QMUsuariosWebDATE_UPD: TDateTimeField;
     QMUsuariosWebNOMBRE_AGE_CLI_SIS: TStringField;
     DSQMUsuariosWebFP: TDataSource;
     QMUsuariosWebFP: TFIBTableSet;
     QMUsuariosWebFPUSUARIOID: TFIBStringField;
     QMUsuariosWebFPFORMA: TFIBStringField;
     QMUsuariosWebFPTITULO: TStringField;
     QMUsuariosWebWEB_ALMACEN_DST: TFIBStringField;
     procedure DMUsuariosWebCreate(Sender: TObject);
     procedure QMUsuariosWebAfterOpen(DataSet: TDataSet);
     procedure QMUsuariosWebNewRecord(DataSet: TDataSet);
     procedure QMUsuariosWebID_CLIENTE_AGENTEChange(Sender: TField);
     procedure QMUsuariosWebWEB_EMPRESAChange(Sender: TField);
     procedure QMUsuariosWebMarcasNewRecord(DataSet: TDataSet);
     procedure QMUsuariosWebBeforeClose(DataSet: TDataSet);
     procedure QMUsuariosWebModulosNewRecord(DataSet: TDataSet);
     procedure QMUsuariosWebModulosCOD_MODULOChange(Sender: TField);
     procedure QMUsuariosWebCalcFields(DataSet: TDataSet);
     procedure QMUsuariosWebDocsAfterPost(DataSet: TDataSet);
     procedure QMUsuariosWebAfterPost(DataSet: TDataSet);
     procedure QMUsuariosWebFPTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMUsuariosWebFPNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     Posicionando: boolean;
     function DameNombreSegunTipo(Tipo, AgeCliSis: integer): string;
  public
     { Public declarations }
     HayModificaciones: boolean;
     procedure BusquedaCompleja;
     procedure PosicionarUsuario(IdUsuario: integer);
     procedure ConectaDocs;
     procedure DesconectaDocs;
     procedure ConectaMarcas;
     procedure DesconectaMarcas;
     procedure ConectaModulos;
     procedure DesconectaModulos;
     procedure ConectaFormaPago;
     procedure DesconectaFormaPago;
  end;

var
  DMUsuariosWeb : TDMUsuariosWeb;

implementation

uses UDMMain, UFBusca, UEntorno, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMUsuariosWeb.DMUsuariosWebCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Posicionando := False;
  HayModificaciones := False;

  QMUsuariosWeb.Open;
end;

procedure TDMUsuariosWeb.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMUsuariosWeb, '00000');
end;

procedure TDMUsuariosWeb.QMUsuariosWebAfterOpen(DataSet: TDataSet);
begin
  xEmpresas.Open;
end;

procedure TDMUsuariosWeb.QMUsuariosWebNewRecord(DataSet: TDataSet);
begin
  QMUsuariosWebTIPO_USUARIO.AsInteger := 0;
  QMUsuariosWebACEPTAR.AsInteger := 1;
  QMUsuariosWebVISTA.AsString := 'img';
  QMUsuariosWebSTOCK.AsInteger := 0;
  QMUsuariosWebWEB_EMPRESA.AsInteger := REntorno.Empresa;
  QMUsuariosWebWEB_EJERCICIO.AsInteger := REntorno.Ejercicio;
  QMUsuariosWebWEB_CANAL.AsInteger := REntorno.Canal;
  QMUsuariosWebWEB_SERIE.AsString := REntorno.Serie;
  QMUsuariosWebWEB_ALMACEN.AsString := REntorno.AlmacenDefecto;
  QMUsuariosWebWEB_ALMACEN_DST.AsString := REntorno.AlmacenDefecto;
  QMUsuariosWebWEB_TARIFA.AsString := REntorno.TarifaDefecto;
  QMUsuariosWebWEB_APLICA_TARIFA.AsInteger := 0;
  QMUsuariosWebID_CLIENTE_AGENTE.AsInteger := -1;
  QMUsuariosWebCONFIGURACION.AsInteger := 0;
  QMUsuariosWebID_EMPLEADO.AsInteger := 0;
  QMUsuariosWebIMAGEN.AsInteger := 0;
  QMUsuariosWebHOJA_TRABAJO_VER_MAQUINA.AsInteger := 1;
end;

procedure TDMUsuariosWeb.QMUsuariosWebID_CLIENTE_AGENTEChange(Sender: TField);
begin
  DameNombreSegunTipo(QMUsuariosWebTIPO_USUARIO.AsInteger, QMUsuariosWebID_CLIENTE_AGENTE.AsInteger);
end;

procedure TDMUsuariosWeb.QMUsuariosWebWEB_EMPRESAChange(Sender: TField);
begin
  xEmpresas.Close;
  xEmpresas.Open;
end;

function TDMUsuariosWeb.DameNombreSegunTipo(Tipo, AgeCliSis: integer): string;
begin
  /// TIPO_USUARIO - Definido en SYS_TIPO_USUARIO_WEB
  ///    0:Cliente
  ///    1:Agente
  ///    2:Sistema
  ///    3:Almacen
  ///    4:Visitante
  ///    5:Empelado
  ///    6:Seccion

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        case Tipo of
           0: SQL.Text := 'SELECT T.NOMBRE_R_SOCIAL AS NOMBRE, C.CLIENTE MAESTRO, C.TERCERO FROM EMP_CLIENTES C JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO WHERE C.ID_CLIENTE = :ID_CLIENTE_AGENTE';
           1: SQL.Text := 'SELECT T.NOMBRE_R_SOCIAL AS NOMBRE, A.AGENTE MAESTRO, A.TERCERO FROM EMP_AGENTES A JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO WHERE A.ID_AGENTE = :ID_CLIENTE_AGENTE';
           2: SQL.Text := 'SELECT NOMBRE, USUARIO MAESTRO, CAST(0 AS INTEGER) AS TERCERO FROM SYS_USUARIOS WHERE USUARIO = :ID_CLIENTE_AGENTE';
           5: SQL.Text := 'SELECT T.NOMBRE_R_SOCIAL AS NOMBRE, A.EMPLEADO MAESTRO, A.TERCERO FROM OPE_EMPLEADO A JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO WHERE A.ID_EMPLEADO = :ID_CLIENTE_AGENTE';
           else
              SQL.Text := 'SELECT NOMBRE, USUARIO MAESTRO, CAST(0 AS INTEGER) AS TERCERO FROM SYS_USUARIOS WHERE USUARIO = :ID_CLIENTE_AGENTE';
        end;
        Params.ByName['ID_CLIENTE_AGENTE'].AsInteger := AgeCliSis;
        ExecQuery;
        Result := FieldByName['NOMBRE'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMUsuariosWeb.QMUsuariosWebMarcasNewRecord(DataSet: TDataSet);
begin
  QMUsuariosWebMarcasUsuarioID.AsString := QMUsuariosWebUsuarioID.AsString;
end;

procedure TDMUsuariosWeb.QMUsuariosWebBeforeClose(DataSet: TDataSet);
begin
  xEmpresas.Close;
end;

procedure TDMUsuariosWeb.QMUsuariosWebModulosNewRecord(DataSet: TDataSet);
begin
  QMUsuariosWebModulosUSUARIOID.AsString := QMUsuariosWebUSUARIOID.AsString;
  QMUsuariosWebModulosADMINISTRADOR.AsInteger := 0;
end;

procedure TDMUsuariosWeb.QMUsuariosWebModulosCOD_MODULOChange(Sender: TField);
begin
  if (Trim(QMUsuariosWebModulosTITULO_MODULO_USR.AsString) = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO_MODULO FROM WEB_MODULOS WHERE COD_MODULO = :COD_MODULO';
           Params.ByName['COD_MODULO'].AsString := QMUsuariosWebModulosCOD_MODULO.AsString;
           ExecQuery;
           QMUsuariosWebModulosTITULO_MODULO_USR.AsString := FieldByName['TITULO_MODULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (Trim(QMUsuariosWebModulosDESC_MODULO_USR.AsString) = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DESC_MODULO FROM WEB_MODULOS WHERE COD_MODULO = :COD_MODULO';
           Params.ByName['COD_MODULO'].AsString := QMUsuariosWebModulosCOD_MODULO.AsString;
           ExecQuery;
           QMUsuariosWebModulosDESC_MODULO_USR.AsString := FieldByName['DESC_MODULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMUsuariosWeb.PosicionarUsuario(IdUsuario: integer);
begin
  if (IdUsuario <> 0) then
  begin
     Posicionando := True;
     try
        Posicionar(QMUsuariosWeb, 'ID_USUARIO', IdUsuario);
     finally
        Posicionando := False;
     end;
  end;
end;

procedure TDMUsuariosWeb.QMUsuariosWebCalcFields(DataSet: TDataSet);
begin
  if not Posicionando then
     QMUsuariosWebNOMBRE_AGE_CLI_SIS.AsString := DameNombreSegunTipo(QMUsuariosWebTIPO_USUARIO.AsInteger, QMUsuariosWebID_CLIENTE_AGENTE.AsInteger);
end;

procedure TDMUsuariosWeb.ConectaDocs;
begin
  QMUsuariosWebDocs.Open;
end;

procedure TDMUsuariosWeb.DesconectaDocs;
begin
  QMUsuariosWebDocs.Close;
end;

procedure TDMUsuariosWeb.ConectaMarcas;
begin
  QMUsuariosWebMarcas.Open;
end;

procedure TDMUsuariosWeb.DesconectaMarcas;
begin
  QMUsuariosWebMarcas.Close;
end;

procedure TDMUsuariosWeb.ConectaModulos;
begin
  QMUsuariosWebModulos.Open;
end;

procedure TDMUsuariosWeb.DesconectaModulos;
begin
  QMUsuariosWebModulos.Close;
end;

procedure TDMUsuariosWeb.QMUsuariosWebDocsAfterPost(DataSet: TDataSet);
begin
  // Debo hacer esto para refrescar el contenido manteniendo la posición
  // porque si se modifica el campo defecto, por triggers se desmarcan los otros

  Refrescar(QMUsuariosWebDocs, 'TIPO', QMUsuariosWebDocsTIPO.AsString);
end;

procedure TDMUsuariosWeb.QMUsuariosWebAfterPost(DataSet: TDataSet);
begin
  HayModificaciones := True;
end;

procedure TDMUsuariosWeb.QMUsuariosWebFPTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloFormaPago(QMUsuariosWebFPFORMA.AsString);
end;

procedure TDMUsuariosWeb.ConectaFormaPago;
begin
  QMUsuariosWebFP.Open;
end;

procedure TDMUsuariosWeb.DesconectaFormaPago;
begin
  QMUsuariosWebFP.Open;
end;

procedure TDMUsuariosWeb.QMUsuariosWebFPNewRecord(DataSet: TDataSet);
begin
  QMUsuariosWebFPUSUARIOID.AsString := QMUsuariosWebUSUARIOID.AsString;
end;

end.
