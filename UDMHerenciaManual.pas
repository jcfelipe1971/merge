unit UDMHerenciaManual;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMHerenciaManual = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSDetalle: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleID_DOC: TIntegerField;
     QMDetalleID_DETALLE_DOC: TIntegerField;
     QMDetalleDestino: TFIBTableSet;
     DSQMDetalleDestino: TDataSource;
     QMDetalleDestinoEMPRESA: TIntegerField;
     QMDetalleDestinoEJERCICIO: TIntegerField;
     QMDetalleDestinoCANAL: TIntegerField;
     QMDetalleDestinoSERIE: TFIBStringField;
     QMDetalleDestinoTIPO: TFIBStringField;
     QMDetalleDestinoRIG: TIntegerField;
     QMDetalleDestinoLINEA: TIntegerField;
     QMDetalleDestinoID_DOC: TIntegerField;
     QMDetalleDestinoID_DETALLE_DOC: TIntegerField;
     QMDetalleDestinoARTICULO: TFIBStringField;
     QMDetalleDestinoTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Inicializa(Tipo: string; IDDetalleDoc: integer);
     procedure FiltraDestino(Ejercicio, Canal: integer; Serie, Tipo: string; Rig, Linea: integer);
     procedure Asociar;
     procedure Reemplazar;
  end;

var
  DMHerenciaManual : TDMHerenciaManual;

implementation

uses
  UDMMain, UEntorno, HYFIBQuery;

{$R *.dfm}

procedure TDMHerenciaManual.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMHerenciaManual.Inicializa(Tipo: string; IDDetalleDoc: integer);
begin
  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
     begin
        SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S AS ID_DOC, ID_DETALLES_S AS ID_DETALLE_DOC, ARTICULO, TITULO ');
        SelectSQL.Add(' FROM GES_DETALLES_S ');
     end
     else
     begin
        SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_E AS ID_DOC, ID_DETALLES_E AS ID_DETALLE_DOC, ARTICULO, TITULO ');
        SelectSQL.Add(' FROM GES_DETALLES_E ');
     end;
     SelectSQL.Add(' WHERE ');
     if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
        SelectSQL.Add(' ID_DETALLES_S = :ID_DETALLES_DOC ')
     else
        SelectSQL.Add(' ID_DETALLES_E = :ID_DETALLES_DOC ');
     Params.ByName['ID_DETALLES_DOC'].AsInteger := IdDetalleDoc;
     Open;
  end;
end;

procedure TDMHerenciaManual.FiltraDestino(Ejercicio, Canal: integer; Serie, Tipo: string; Rig, Linea: integer);
begin
  with QMDetalleDestino do
  begin
     Close;
     SelectSQL.Clear;
     if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
     begin
        SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S AS ID_DOC, ID_DETALLES_S AS ID_DETALLE_DOC, ARTICULO, TITULO ');
        SelectSQL.Add(' FROM GES_DETALLES_S ');
     end
     else
     begin
        SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_E AS ID_DOC, ID_DETALLES_E AS ID_DETALLE_DOC, ARTICULO, TITULO ');
        SelectSQL.Add(' FROM GES_DETALLES_E ');
     end;

     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' SERIE = :SERIE AND ');
     SelectSQL.Add(' TIPO = :TIPO AND ');
     SelectSQL.Add(' RIG = :RIG AND ');
     SelectSQL.Add(' LINEA = :LINEA ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
  end;
end;

procedure TDMHerenciaManual.Asociar;
begin
  /// Relaciones de Ventas a Compras se crean en GES_CABECERAS/DETALLES_RELACIONES (las relaciones de venta).
  /// Solo las relaciones de Compra a Compra se crean en GES_CABECERAS/DETALLES_E_RELACIONES.

  if (QMDetalleDestinoID_DETALLE_DOC.AsInteger = 0) then
     raise Exception.Create(_('No existe el documento destino'));

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_RELACIONES_CREA( ');
        SQL.Add(' :O_EMPRESA, :O_EJERCICIO, :O_CANAL, :O_SERIE, :O_TIPO, :O_RIG, :O_LINEA, ');
        SQL.Add(' :D_EMPRESA, :D_EJERCICIO, :D_CANAL, :D_SERIE, :D_TIPO, :D_RIG, :D_LINEA, ');
        SQL.Add(' :TITULO) ');

        Params.ByName['O_EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['O_EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['O_CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['O_SERIE'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['O_TIPO'].AsString := QMDetalleTIPO.AsString;
        Params.ByName['O_RIG'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['O_LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['D_EMPRESA'].AsInteger := QMDetalleDestinoEMPRESA.AsInteger;
        Params.ByName['D_EJERCICIO'].AsInteger := QMDetalleDestinoEJERCICIO.AsInteger;
        Params.ByName['D_CANAL'].AsInteger := QMDetalleDestinoCANAL.AsInteger;
        Params.ByName['D_SERIE'].AsString := QMDetalleDestinoSERIE.AsString;
        Params.ByName['D_TIPO'].AsString := QMDetalleDestinoTIPO.AsString;
        Params.ByName['D_RIG'].AsInteger := QMDetalleDestinoRIG.AsInteger;
        Params.ByName['D_LINEA'].AsInteger := QMDetalleDestinoLINEA.AsInteger;
        Params.ByName['TITULO'].AsString := _('Herencia manual');
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMHerenciaManual.Reemplazar;
begin
  /// Crea una linea del documento origen en el documento destino.
  /// Minora el precio de la linea destino.

  if (QMDetalleID_DETALLE_DOC.AsInteger = 0) then
     raise Exception.Create(_('No existe el documento origen'));

  if (QMDetalleDestinoID_DETALLE_DOC.AsInteger = 0) then
     raise Exception.Create(_('No existe el documento destino'));

  if (QMDetalleTIPO.AsString = 'ALB') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE G_TRASPASA_LINEA (:O_ID_DETALLES, :R_ID_DETALLES) ');
           Params.ByName['O_ID_DETALLES'].AsInteger := QMDetalleID_DETALLE_DOC.AsInteger;
           Params.ByName['R_ID_DETALLES'].AsInteger := QMDetalleDestinoID_DETALLE_DOC.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  if (QMDetalleTIPO.AsString = 'ALP') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE G_TRASPASA_LINEA_E (:O_ID_DETALLES, :R_ID_DETALLES) ');
           Params.ByName['O_ID_DETALLES'].AsInteger := QMDetalleID_DETALLE_DOC.AsInteger;
           Params.ByName['R_ID_DETALLES'].AsInteger := QMDetalleDestinoID_DETALLE_DOC.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     raise Exception.Create(_('Solo se pueden relacionar albaranes de compra o de venta.'));
end;

end.
