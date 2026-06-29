unit UDMLstProyectos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, FIBDataSetRW;

type
  TDMLstProyectos = class(TDataModule)
     TLocal: THYTransaction;
     frProyectos: TfrHYReport;
     frxProyectos: TfrxHYReport;
     TUpdate: THYTransaction;
     frDBProyectos: TfrDBDataSet;
     xLstProyectos: TFIBDataSetRO;
     DSxLstProyectos: TDataSource;
     frDBProyectosCompras: TfrDBDataSet;
     frDBDProyectosVentas: TfrDBDataSet;
     frDBProyectosOtros: TfrDBDataSet;
     DSxProyectoCompras: TDataSource;
     xProyectoCompras: TFIBDataSetRO;
     xProyectoVentas: TFIBDataSetRO;
     xProyectoOtros: TFIBDataSetRO;
     DSxProyectoVentas: TDataSource;
     DSxProyectoOtros: TDataSource;
     frDBProyectoOfertas: TfrDBDataSet;
     xProyectoOfertas: TFIBDataSetRO;
     DSxProyectoOfertas: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     xTercero: TFIBDataSetRO;
     DSxTercero: TDataSource;
     frDBProyectoEmpleados: TfrDBDataSet;
     xProyectoEmpleados: TFIBDataSetRO;
     DSxProyectoEmpleados: TDataSource;
     procedure frProyectosEnterRect(Memo: TStringList; View: TfrView);
     procedure frxProyectosBeforePrint(Sender: TfrxReportComponent);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frProyectosGetValue(const ParName: string; var ParValue: variant);
     procedure frxProyectosGetValue(const VarName: string; var Value: variant);
     procedure xLstProyectosAfterOpen(DataSet: TDataSet);
     procedure xLstProyectosBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     param_PRYMODO003: integer;
  public
     { Public declarations }
     procedure MostrarListado(Proyecto: string; Modo, Grupo, DesdeProyecto, HastaProyecto, DesdeUsuario, HastaUsuario, DesdeCliente, HastaCliente: integer; DesdeFecha, HastaFecha: TDateTime);
  end;

var
  DMLstProyectos : TDMLstProyectos;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UParam;

{$R *.DFM}

procedure TDMLstProyectos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  // PRYMODO003 - 1: Calculo normal; 2 Calculo MCDGRUP
  param_PRYMODO003 := StrToIntDef(LeeParametro('PRYMODO003'), 1);
end;

procedure TDMLstProyectos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstProyectos.MostrarListado(Proyecto: string; Modo, Grupo, DesdeProyecto, HastaProyecto, DesdeUsuario, HastaUsuario, DesdeCliente, HastaCliente: integer; DesdeFecha, HastaFecha: TDateTime);
begin
  if ((Grupo = 5125) or (Grupo = 2060)) then
  begin
     with xLstProyectos do
     begin
        Close;
        DataSource := nil;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_EMP_PROYECTOS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' PROYECTO >= ?DESDE_PROYECTO AND ');
        SelectSQL.Add(' PROYECTO <= ?HASTA_PROYECTO ');
        SelectSQL.Add(' ORDER BY PROYECTO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_PROYECTO'].AsInteger := DesdeProyecto;
        Params.ByName['HASTA_PROYECTO'].AsInteger := HastaProyecto;
        Open;
     end;

     with xProyectoCompras do
     begin
        Close;
        DataSource := DSxLstProyectos;
        SelectSQL.Clear;
        case param_PRYMODO003 of
           1:
           begin
              SelectSQL.Add(' SELECT P.*, C.FECHA, C.SU_REFERENCIA, C.ESTADO, D.* ');
              SelectSQL.Add(' FROM EMP_PROYECTOS_COMPRAS P ');
              SelectSQL.Add(' JOIN GES_CABECERAS_E C ON P.ID_E = C.ID_E ');
              SelectSQL.Add(' JOIN GES_DETALLES_E D ON P.ID_DETALLES_E = D.ID_DETALLES_E ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' P.PROYECTO = :PROYECTO AND ');
              SelectSQL.Add(' C.FECHA >= :DESDE_FECHA AND ');
              SelectSQL.Add(' C.FECHA <= :HASTA_FECHA ');
              SelectSQL.Add(' ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.TIPO, C.RIG, D.LINEA ');
           end;
           2:
           begin
              // Facturas de compras o documentos anteriores abiertos
              SelectSQL.Add(' SELECT P.*, C.FECHA, C.SU_REFERENCIA, C.ESTADO, D.* ');
              SelectSQL.Add(' FROM EMP_PROYECTOS_COMPRAS P ');
              SelectSQL.Add(' JOIN GES_CABECERAS_E C ON P.ID_E = C.ID_E ');
              SelectSQL.Add(' JOIN GES_DETALLES_E D ON P.ID_DETALLES_E = D.ID_DETALLES_E ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' P.PROYECTO = :PROYECTO AND ');
              SelectSQL.Add(' C.FECHA >= :DESDE_FECHA AND ');
              SelectSQL.Add(' C.FECHA <= :HASTA_FECHA AND ');
              SelectSQL.Add(' ((C.ESTADO = 0) OR ');
              SelectSQL.Add(' -- ');
              SelectSQL.Add(' ((C.TIPO IN (''FAP'', ''FCR'')) AND ');
              SelectSQL.Add(' (C.ESTADO = 5))) ');
              SelectSQL.Add(' ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.TIPO, C.RIG, D.LINEA ');
           end;
        end;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Open;
     end;

     with xProyectoVentas do
     begin
        Close;
        DataSource := DSxLstProyectos;
        SelectSQL.Clear;
        case param_PRYMODO003 of
           1:
           begin
              SelectSQL.Add(' SELECT P.*, C.FECHA, C.CLIENTE, C.SU_REFERENCIA, C.PEDIDO_CLIENTE, C.Z_OBSERVACION, C.ESTADO, R.O_TIPO , D.* ');
              SelectSQL.Add(' FROM EMP_PROYECTOS_VENTAS P ');
              SelectSQL.Add(' JOIN GES_CABECERAS_S C ON P.ID_S = C.ID_S ');
              SelectSQL.Add(' JOIN GES_DETALLES_S D ON P.ID_DETALLES_S = D.ID_DETALLES_S ');
              SelectSQL.Add(' LEFT JOIN GES_CABECERAS_RELACIONES R ON C.ID_S = R.D_ID_S ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' P.PROYECTO = :PROYECTO AND ');
              SelectSQL.Add(' C.FECHA >= :DESDE_FECHA AND ');
              SelectSQL.Add(' C.FECHA <= :HASTA_FECHA ');
              SelectSQL.Add(' ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.TIPO, C.RIG, D.LINEA ');
           end;
           2:
           begin
              // Facturas de venta o documentos anteriores abiertos
              SelectSQL.Add(' SELECT P.*, C.FECHA, C.CLIENTE, C.SU_REFERENCIA, C.PEDIDO_CLIENTE, C.Z_OBSERVACION, C.ESTADO, R.O_TIPO , D.* ');
              SelectSQL.Add(' FROM EMP_PROYECTOS_VENTAS P ');
              SelectSQL.Add(' JOIN GES_CABECERAS_S C ON P.ID_S = C.ID_S ');
              SelectSQL.Add(' JOIN GES_DETALLES_S D ON P.ID_DETALLES_S = D.ID_DETALLES_S ');
              SelectSQL.Add(' LEFT JOIN GES_CABECERAS_RELACIONES R ON C.ID_S = R.D_ID_S ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' P.PROYECTO = :PROYECTO AND ');
              SelectSQL.Add(' C.FECHA >= :DESDE_FECHA AND ');
              SelectSQL.Add(' C.FECHA <= :HASTA_FECHA AND ');
              SelectSQL.Add(' -- ');
              SelectSQL.Add(' ( ');
              SelectSQL.Add('   (C.ESTADO = 0) OR ');
              SelectSQL.Add('   -- ');
              SelectSQL.Add('   ((C.TIPO IN (''FAC'')) AND ');
              SelectSQL.Add('    (C.ESTADO = 5)) ');
              SelectSQL.Add(' ) ');
              SelectSQL.Add(' ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.TIPO, C.RIG, D.LINEA ');
           end;
        end;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Open;
     end;

     with xProyectoOfertas do
     begin
        Close;
        DataSource := DSxLstProyectos;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT ');
        SelectSQL.Add(' * ');
        SelectSQL.Add(' FROM VER_CABECERAS_OFERTA_C ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' PROYECTO = ?PROYECTO AND ');
        SelectSQL.Add(' FECHA >= ?DESDE_FECHA AND ');
        SelectSQL.Add(' FECHA <= ?HASTA_FECHA AND ');
        SelectSQL.Add(' CLIENTE >= ?DESDE_CLIENTE AND ');
        SelectSQL.Add(' CLIENTE <= ?HASTA_CLIENTE ');
        SelectSQL.Add(' ORDER BY EJERCICIO, CANAL, SERIE, RIG ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
        Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
        Open;
     end;

     with xProyectoOtros do
     begin
        Close;
        DataSource := DSxLstProyectos;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM EMP_PROYECTOS_OTROS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' PROYECTO = ?PROYECTO AND ');
        SelectSQL.Add(' USUARIO >= ?DESDE_USUARIO AND ');
        SelectSQL.Add(' USUARIO <= ?HASTA_USUARIO AND ');
        SelectSQL.Add(' FECHA >= ?DESDE_FECHA AND ');
        SelectSQL.Add(' FECHA <= ?HASTA_FECHA ');
        SelectSQL.Add(' ORDER BY LINEA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_USUARIO'].AsInteger := DesdeUsuario;
        Params.ByName['HASTA_USUARIO'].AsInteger := HastaUsuario;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Open;
     end;

     with xProyectoEmpleados do
     begin
        Close;
        DataSource := DSxLstProyectos;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM EMP_PROYECTOS_EMPLEADOS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' PROYECTO = ?PROYECTO AND ');
        SelectSQL.Add(' FECHA >= ?DESDE_FECHA AND ');
        SelectSQL.Add(' FECHA <= ?HASTA_FECHA ');
        SelectSQL.Add(' ORDER BY FECHA, EMPLEADO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Open;
     end;
  end
  else
  begin
     with xProyectoOfertas do
     begin
        Close;
        DataSource := nil;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT ');
        SelectSQL.Add(' * ');
        SelectSQL.Add(' FROM VER_CABECERAS_OFERTA_C ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' PROYECTO >= ?DESDE_PROYECTO AND ');
        SelectSQL.Add(' PROYECTO <= ?HASTA_PROYECTO AND ');
        SelectSQL.Add(' FECHA >= ?DESDE_FECHA AND ');
        SelectSQL.Add(' FECHA <= ?HASTA_FECHA AND ');
        SelectSQL.Add(' CLIENTE >= ?DESDE_CLIENTE AND ');
        SelectSQL.Add(' CLIENTE <= ?HASTA_CLIENTE ');
        SelectSQL.Add(' ORDER BY PROYECTO, EJERCICIO, CANAL, SERIE, RIG ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_PROYECTO'].AsInteger := DesdeProyecto;
        Params.ByName['HASTA_PROYECTO'].AsInteger := HastaProyecto;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
        Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
        Open;
     end;

     with xLstProyectos do
     begin
        Close;
        SelectSQL.Clear;
        DataSource := DSxProyectoOfertas;
        SelectSQL.Add(' SELECT * FROM VER_EMP_PROYECTOS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' PROYECTO = ?PROYECTO ');
        SelectSQL.Add(' ORDER BY PROYECTO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;

     with xProyectoCompras do
     begin
        Close;
        DataSource := DSxProyectoOfertas;
        SelectSQL.Clear;
        case param_PRYMODO003 of
           1:
           begin
              SelectSQL.Add(' SELECT P.*, C.FECHA, C.SU_REFERENCIA, C.ESTADO, D.* ');
              SelectSQL.Add(' FROM EMP_PROYECTOS_COMPRAS P ');
              SelectSQL.Add(' JOIN GES_CABECERAS_E C ON P.ID_E = C.ID_E ');
              SelectSQL.Add(' JOIN GES_DETALLES_E D ON P.ID_DETALLES_E = D.ID_DETALLES_E ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' P.PROYECTO = :PROYECTO AND ');
              SelectSQL.Add(' C.FECHA >= :DESDE_FECHA AND ');
              SelectSQL.Add(' C.FECHA <= :HASTA_FECHA ');
              SelectSQL.Add(' ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.TIPO, C.RIG, D.LINEA ');
           end;
           2:
           begin
              // Facturas de compras o documentos anteriores abiertos
              SelectSQL.Add(' SELECT P.*, C.FECHA, C.SU_REFERENCIA, C.ESTADO, D.* ');
              SelectSQL.Add(' FROM EMP_PROYECTOS_COMPRAS P ');
              SelectSQL.Add(' JOIN GES_CABECERAS_E C ON P.ID_E = C.ID_E ');
              SelectSQL.Add(' JOIN GES_DETALLES_E D ON P.ID_DETALLES_E = D.ID_DETALLES_E ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' P.PROYECTO = :PROYECTO AND ');
              SelectSQL.Add(' C.FECHA >= :DESDE_FECHA AND ');
              SelectSQL.Add(' C.FECHA <= :HASTA_FECHA AND ');
              SelectSQL.Add(' ((C.ESTADO = 0) OR ');
              SelectSQL.Add(' -- ');
              SelectSQL.Add(' ((C.TIPO IN (''FAP'', ''FCR'')) AND ');
              SelectSQL.Add(' (C.ESTADO = 5))) ');
              SelectSQL.Add(' ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.TIPO, C.RIG, D.LINEA ');
           end;
        end;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Open;
     end;

     with xProyectoVentas do
     begin
        Close;
        DataSource := DSxProyectoOfertas;
        SelectSQL.Clear;
        case param_PRYMODO003 of
           1:
           begin
              SelectSQL.Add(' SELECT P.*, C.FECHA, C.CLIENTE, C.SU_REFERENCIA, C.PEDIDO_CLIENTE, C.Z_OBSERVACION, C.ESTADO, R.O_TIPO, D.* ');
              SelectSQL.Add(' FROM EMP_PROYECTOS_VENTAS P ');
              SelectSQL.Add(' JOIN GES_CABECERAS_S C ON P.ID_S = C.ID_S ');
              SelectSQL.Add(' JOIN GES_DETALLES_S D ON P.ID_DETALLES_S = D.ID_DETALLES_S ');
              SelectSQL.Add(' LEFT JOIN GES_CABECERAS_RELACIONES R ON C.ID_S = R.D_ID_S ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' P.PROYECTO = :PROYECTO AND ');
              SelectSQL.Add(' C.FECHA >= :DESDE_FECHA AND ');
              SelectSQL.Add(' C.FECHA <= :HASTA_FECHA ');
              SelectSQL.Add(' ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.TIPO, C.RIG, D.LINEA ');
           end;
           2:
           begin
              // Facturas de venta o documentos anteriores abiertos
              SelectSQL.Add(' SELECT P.*, C.FECHA, C.CLIENTE, C.SU_REFERENCIA, C.PEDIDO_CLIENTE, C.Z_OBSERVACION, C.ESTADO, R.O_TIPO , D.* ');
              SelectSQL.Add(' FROM EMP_PROYECTOS_VENTAS P ');
              SelectSQL.Add(' JOIN GES_CABECERAS_S C ON P.ID_S = C.ID_S ');
              SelectSQL.Add(' JOIN GES_DETALLES_S D ON P.ID_DETALLES_S = D.ID_DETALLES_S ');
              SelectSQL.Add(' LEFT JOIN GES_CABECERAS_RELACIONES R ON C.ID_S = R.D_ID_S ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' P.PROYECTO = :PROYECTO AND ');
              SelectSQL.Add(' C.FECHA >= :DESDE_FECHA AND ');
              SelectSQL.Add(' C.FECHA <= :HASTA_FECHA AND ');
              SelectSQL.Add(' -- ');
              SelectSQL.Add(' ( ');
              SelectSQL.Add('   (C.ESTADO = 0) OR ');
              SelectSQL.Add('   -- ');
              SelectSQL.Add('   ((C.TIPO IN (''FAC'')) AND ');
              SelectSQL.Add('    (C.ESTADO = 5)) ');
              SelectSQL.Add(' ) ');
              SelectSQL.Add(' ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.TIPO, C.RIG, D.LINEA ');
           end;
        end;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Open;
     end;

     with xProyectoOtros do
     begin
        Close;
        DataSource := DSxProyectoOfertas;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM EMP_PROYECTOS_OTROS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' PROYECTO = ?PROYECTO AND ');
        SelectSQL.Add(' USUARIO >= ?DESDE_USUARIO AND ');
        SelectSQL.Add(' USUARIO <= ?HASTA_USUARIO AND ');
        SelectSQL.Add(' FECHA >= ?DESDE_FECHA AND ');
        SelectSQL.Add(' FECHA <= ?HASTA_FECHA ');
        SelectSQL.Add(' ORDER BY LINEA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_USUARIO'].AsInteger := DesdeUsuario;
        Params.ByName['HASTA_USUARIO'].AsInteger := HastaUsuario;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Open;
     end;

     with xProyectoEmpleados do
     begin
        Close;
        DataSource := DSxProyectoOfertas;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM EMP_PROYECTOS_EMPLEADOS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' PROYECTO = ?PROYECTO AND ');
        SelectSQL.Add(' FECHA >= ?DESDE_FECHA AND ');
        SelectSQL.Add(' FECHA <= ?HASTA_FECHA ');
        SelectSQL.Add(' ORDER BY FECHA, EMPLEADO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
        Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
        Open;
     end;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frProyectos, frxProyectos, nil, nil);
end;

procedure TDMLstProyectos.frProyectosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstProyectos.frxProyectosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstProyectos.frProyectosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstProyectos.frxProyectosGetValue(const VarName: string; var Value: variant);
begin
  frProyectosGetValue(VarName, Value);
end;

procedure TDMLstProyectos.xLstProyectosAfterOpen(DataSet: TDataSet);
begin
  xCliente.Open;
  xTercero.Open;
end;

procedure TDMLstProyectos.xLstProyectosBeforeClose(DataSet: TDataSet);
begin
  xCliente.Close;
  xTercero.Close;
end;

end.
