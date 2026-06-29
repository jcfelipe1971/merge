unit UDMColadas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UComponentesBusquedaFiltrada,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, UFormGest;

type
  TDMColadas = class(TDataModule)
     QMColadasD: TFIBTableSet;
     DSColadasD: TDataSource;
     QMColadasC: TFIBTableSet;
     DSColadasC: TDataSource;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     SPLineaSiguiente: THYFIBQuery;
     EntornoDoc: TEntornoFind2000;
     TLocal: THYTransaction;
     SPRefrescaDetalle: THYFIBQuery;
     xMateriales: TFIBDataSetRO;
     DSxMateriales: TDataSource;
     QGen: THYFIBQuery;
     QSerieHabil: THYFIBQuery;
     TUpdate: THYTransaction;
     QMColadasCEMPRESA: TIntegerField;
     QMColadasCEJERCICIO: TIntegerField;
     QMColadasCCANAL: TIntegerField;
     QMColadasCSERIE: TFIBStringField;
     QMColadasCID_COLADA: TIntegerField;
     QMColadasCFECHA: TDateTimeField;
     QMColadasCORDEN: TIntegerField;
     QMColadasCMATERIAL: TFIBStringField;
     QMColadasCNOTAS: TBlobField;
     QMColadasCPESO_LINGOTES: TFloatField;
     QMColadasCPESO_BEBEDEROS: TFloatField;
     QMColadasDEMPRESA: TIntegerField;
     QMColadasDEJERCICIO: TIntegerField;
     QMColadasDCANAL: TIntegerField;
     QMColadasDSERIE: TFIBStringField;
     QMColadasDID_COLADA: TIntegerField;
     QMColadasDLINEA: TIntegerField;
     QMColadasDPOSICION: TIntegerField;
     QMColadasDID_ORDEN: TIntegerField;
     QMColadasDARTICULO_CAJA: TFIBStringField;
     QMColadasDDEFECTUOSO: TIntegerField;
     xMaterialesTITULO: TFIBStringField;
     QMColadasCENTRADA: TIntegerField;
     QMColadasDENTRADA: TIntegerField;
     procedure Graba(DataSet: TDataSet);
     procedure QMColadasDNewRecord(DataSet: TDataSet);
     procedure QMColadasCNewRecord(DataSet: TDataSet);
     procedure QMColadasCBeforePost(DataSet: TDataSet);
     procedure QMColadasDBeforePost(DataSet: TDataSet);
     procedure AntesDeEditar(DataSet: TDataSet);
     procedure QMColadasCPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMColadasCAfterPost(DataSet: TDataSet);
     procedure QMColadasCBeforeInsert(DataSet: TDataSet);
     procedure QMColadasDAfterPost(DataSet: TDataSet);
     procedure QMColadasDAfterDelete(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMColadasCAfterOpen(DataSet: TDataSet);
     procedure QMColadasCMATERIALChange(Sender: TField);
     procedure QMColadasCBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     SQLFind: string;
     procedure AbreDetalles;
     procedure CierraAbreDet;
  public
     function BusquedaCompleja: integer;
     procedure CambiaSerie(SerieVar: string);
     procedure RefrescaDetalle;
     procedure RefrescaTabla;
     {procedure FiltraCabecera(Ejercicio: integer; Serie: string; IdColada: integer);}
     procedure RefrescaCabecera(Accion: integer);
  end;

var
  DMColadas : TDMColadas;
  Serie : string;

implementation

uses UDMMain, UUtiles, UEntorno, uFBusca, uFParada,
  UFMain, UFSendCorreo, UFMColadas;

{$R *.DFM}

procedure TDMColadas.AbreDetalles;
begin
  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
  end;
end;

procedure TDMColadas.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TDMColadas.QMColadasDNewRecord(DataSet: TDataSet);
begin
  if (QMColadasC.State = dsInsert) then
  begin
     QMColadasC.Post;
     QMColadasD.Edit;
  end;

  QMColadasDEMPRESA.AsInteger := QMColadasCEMPRESA.AsInteger;
  QMColadasDEJERCICIO.AsInteger := QMColadasCEJERCICIO.AsInteger;
  QMColadasDCANAL.AsInteger := QMColadasCCANAL.AsInteger;
  QMColadasDSERIE.AsString := QMColadasCSERIE.AsString;
  QMColadasDID_COLADA.AsInteger := QMColadasCID_COLADA.AsInteger;
  QMColadasDENTRADA.AsInteger := REntorno.ENTRADA;
  QMColadasDPOSICION.AsInteger := 0;

  //Obtenemos el número de línea más alto en la colada actual
  with SPLineaSiguiente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMColadasCEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMColadasCEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMColadasCCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMColadasCSERIE.AsString;
     Params.ByName['ID_COLADA'].AsInteger := QMColadasCID_COLADA.AsInteger;
     ExecQuery;
     QMColadasDLINEA.AsInteger := SPLineaSiguiente.FieldByName['LINEA'].AsInteger + 1;
     FreeHandle;
  end;
end;

procedure TDMColadas.QMColadasCNewRecord(DataSet: TDataSet);
begin
  QMColadasCEMPRESA.AsInteger := REntorno.Empresa;
  QMColadasCEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMColadasCCANAL.AsInteger := REntorno.Canal;
  QMColadasCSERIE.AsString := Serie;
  QMColadasCFECHA.AsDateTime := REntorno.FechaTrab;
  QMColadasCENTRADA.AsInteger := REntorno.Entrada;
end;

procedure TDMColadas.QMColadasCBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMColadasCID_COLADA.AsInteger = 0)) then
     QMColadascID_COLADA.AsInteger := DMMain.Contador_EECS(QMColadasCSERIE.AsString, 'COL');
end;

procedure TDMColadas.QMColadasDBeforePost(DataSet: TDataSet);
begin
  QMColadasDENTRADA.AsInteger := REntorno.Entrada;
end;

procedure TDMColadas.AntesDeEditar(DataSet: TDataSet);
begin
  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
  end;
end;

function TDMColadas.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMColadasC, '11100', True, Serie);
  if (Result = mrAll) then
  begin
     QMColadasC.Close;
     QMColadasC.SelectSQL.Text := SQLFind;
     DMMain.FiltraTabla(QMColadasC, '11100', False);
     CambiaSerie(Serie);
  end;
end;

procedure TDMColadas.QMColadasCPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMColadasC.State = dsInsert then
  begin
     QMColadasCID_COLADA.Clear;
  end;
end;

procedure TDMColadas.QMColadasCAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMColadas.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;
  with QMColadasC do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMColadas.RefrescaDetalle;
begin
  if (QMColadasC.RecordCount <> 0) then
  begin
     with SPRefrescaDetalle do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMColadasCEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMColadasCEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMColadasCCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMColadasCSERIE.AsString;
        Params.ByName['ID_COLADA'].AsInteger := QMColadasCID_COLADA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
     QMColadasC.Refresh;
  end;
end;

procedure TDMColadas.RefrescaTabla;
begin
  if (QMColadasC.RecordCount > 0) then
  begin
     QMColadasD.DisableControls;
     QMColadasC.Refresh;
     QMColadasD.EnableControls;
  end;
end;

{procedure TDMColadas.FiltraCabecera(Ejercicio: integer; Serie: string; IdColada: integer);
begin
  with QMColadasC do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM EMP_COLADA_CABECERA ' +
        'WHERE EMPRESA=?EMPRESA AND ' +
        'EJERCICIO=?EJERCICIO AND ' +
        'CANAL=?CANAL AND ' +
        'SERIE=?SERIE AND ' +
        'ID_COLADA=?ID_COLADA';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['ID_COLADA'].AsInteger := IdColada;
     Open;
     FMColadas.EFSerie.Text := Serie;
  end;
end;}

procedure TDMColadas.QMColadasCBeforeInsert(DataSet: TDataSet);
begin
  with EntornoDoc do
  begin
     Empresa := REntorno.Empresa;
     Ejercicio := REntorno.Ejercicio;
     Canal := REntorno.Canal;
  end;
end;

procedure TDMColadas.QMColadasDAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  CierraAbreDet;
end;

procedure TDMColadas.CierraAbreDet;
var
  Mark : TBookmark;
begin
  with QMColadasD do
  begin
     Mark := GetBookmark;
     try
        DisableControls;
        Close;
        Open;
        Last;
        GotoBookmark(Mark);
     finally
        EnableControls;
        FreeBookmark(Mark);
     end;
  end;
end;

procedure TDMColadas.QMColadasDAfterDelete(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMColadas.RefrescaCabecera(Accion: integer);
var
  Marca : TBookmark;
begin
  case Accion of
     1: DMColadas.QMColadasC.Refresh;
     2:
     begin
        with DMColadas.QMColadasC do
        begin
           Marca := GetBookmark;
           try
              Close;
              Open;
              GotoBookmark(Marca);
           finally
              FreeBookmark(Marca);
           end;
        end;
     end;
  end;
end;

procedure TDMColadas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMColadasC, '11100', False);
  SQLFind := QMColadasC.SelectSQL.Text;
  Serie := REntorno.Serie;
  AbreDetalles;

  // Se asignan las máscaras de visualización a los campos que las requieren
  QMColadasCPESO_LINGOTES.DisplayFormat := MascaraN;
  QMColadasCPESO_BEBEDEROS.DisplayFormat := MascaraN;
end;

procedure TDMColadas.QMColadasCAfterOpen(DataSet: TDataSet);
begin
  QMColadasD.Open;
  xMateriales.Open;
end;

procedure TDMColadas.QMColadasCMATERIALChange(Sender: TField);
begin
  with xMateriales do
  begin
     Close;
     Open;
  end;
end;

procedure TDMColadas.QMColadasCBeforeClose(DataSet: TDataSet);
begin
  QMColadasD.Close;
  xMateriales.Close;
end;

end.
