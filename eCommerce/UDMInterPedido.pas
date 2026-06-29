unit UDMInterPedido;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMInterPedido = class(TDataModule)
     TLocal: THYTransaction;
     DSQMCabecera: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleDescArt: TStringField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetallePEDIDO: TIntegerField;
     QMDetalleCLIENTE: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetalleFECHA: TDateTimeField;
     QMDetalleDIRECCIONDESTINO: TFIBStringField;
     QMDetalleERROR: TIntegerField;
     QMDetalleTRASPASAR: TIntegerField;
     QMDetalleCODIGO_ARTICULO: TFIBStringField;
     QMDetallePRECIO: TFloatField;
     QMDetalleOBSERVACIONES_CLI: TBlobField;
     QMDetalleNUM_PEDIDO_CLI: TFIBStringField;
     QMCabecera: TFIBDataSetRO;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField;
     TUpdate: THYTransaction;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraNUM_PEDIDO_CLI: TFIBStringField;
     QMDetalleTERCERO: TIntegerField;
     QMDetalleDIRECCION: TIntegerField;
     QMCabeceraDIR_COMPLETA_N: TFIBStringField;
     procedure DMInterPedidoCreate(Sender: TObject);
     procedure QMDetalleDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CargarFichero;
     procedure Refrescar(ReposicionaTambienDetalle: boolean = False);
     procedure EliminaPedido;
     procedure MarcarTodo(Marca: integer);
     procedure TraspasarPedido;
  end;

var
  DMInterPedido : TDMInterPedido;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UUtiles, UDameDato;

procedure TDMInterPedido.DMInterPedidoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMDetalleUNIDADES.DisplayFormat := MascaraI;
  QMDetallePRECIO.DisplayFormat := MascaraN;
  QMCabecera.Close;
  QMCabecera.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMCabecera.Open;
end;

procedure TDMInterPedido.TraspasarPedido;
var
  Q : THYFIBQuery;
  fecha_entrega : TDateTime;
begin
  if QMCabeceraFECHA.AsDateTime < REntorno.FechaTrabSH then
     fecha_entrega := REntorno.FechaTrabSH + 1
  else
     fecha_entrega := QMCabeceraFECHA.AsDateTime;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASAR_A_PEDIDO (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?FECHA_ENTREGA_PREV, ?FECHA, ?ENTRADA, ?USUARIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['FECHA_ENTREGA_PREV'].AsDateTime := fecha_entrega;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Refrescar;
  ShowMessage(_('Se ha realizado el traspaso.'));
end;

procedure TDMInterPedido.MarcarTodo(Marca: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE EMP_INTERPRETA_PEDIDO SET TRASPASAR = ?TRASPASAR WHERE EMPRESA = ?EMPRESA AND FECHA = ?FECHA';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        Params.ByName['TRASPASAR'].AsInteger := Marca;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  Refrescar(True);
end;

procedure TDMInterPedido.EliminaPedido;
var
  Q : THYFIBQuery;
begin
  if (QMCabecera.RecordCount > 0) then
     if (MessageDlg(_('¿Desea eliminar este pedido?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'DELETE FROM EMP_INTERPRETA_PEDIDO WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE AND FECHA = ?FECHA';
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
              Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
              ExecQuery;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
        Refrescar;
     end;
end;

procedure TDMInterPedido.QMDetalleDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMDetalleARTICULO.AsString);
end;

procedure TDMInterPedido.CargarFichero;
const
  nCampos = 10;
var
  Q : THYFIBQuery;
  n, fin : integer;
  f : TextFile;
  Texto : string;
  // TextoAux : string;
  Cliente : integer;
  Articulo : string;
  Unidades : double;
  Precio : double;
  Fecha : TDateTime;
  Direccion : string;
  NumPedido : string; //Referencia?¿??
  Observaciones : string;
  Archivo : string;
begin
  if MyOpenDialog(Archivo, 'TXT,CSV', '', 'DMInterPedido-CargarFichero') then
  begin
     // Posiblemente sean innecesarias estas inicializaciones
     Unidades := 0.0;
     Precio := 0.0;
     Fecha := 0;
     Cliente := -1;
     AssignFile(f, Archivo);
     Reset(f);
     while not EOF(f) do
     begin
        Readln(f, Texto);
        n := 0;
        repeat
           fin := Pos(';', Texto);
           case n of
              0: Cliente := StrToIntDef(Trim(Copy(Texto, 0, fin - 1)), 0);
              1: Articulo := Trim(Copy(Texto, 0, fin - 1));
              2: Unidades := StrToFloatDef(Trim(Copy(Texto, 0, fin - 1)), 0);
              3: Precio := StrToFloatDef(Trim(Copy(Texto, 0, fin - 1)), 0);
              4: Fecha := StrToDateDef(Trim(Copy(Texto, 0, fin - 1)), REntorno.FechaTrabSH);
              5: Direccion := Trim(Copy(Texto, 0, fin - 1));
              6: NumPedido := Trim(Copy(Texto, 0, fin - 1));
              7: Observaciones := Trim(Texto);
           end;
           Delete(Texto, 1, fin);
           Inc(n);
        until not ((fin > 0) and (n <= nCampos - 1));

        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO EMP_INTERPRETA_PEDIDO ');
              SQL.Add(' (EMPRESA, CLIENTE, ARTICULO, UNIDADES, FECHA, DIRECCIONDESTINO, NUM_PEDIDO_CLI, PRECIO, OBSERVACIONES_CLI) ');
              SQL.Add(' VALUES ');
              SQL.Add(' (?EMPRESA, ?CLIENTE, ?ARTICULO, ?UNIDADES, ?FECHA, ?DIRECCIONDESTINO, ?NUM_PEDIDO_CLI, ?PRECIO, ?OBSERVACIONES_CLI) ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CLIENTE'].AsInteger := Cliente;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['UNIDADES'].AsFloat := Unidades;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              Params.ByName['DIRECCIONDESTINO'].AsString := Direccion;
              Params.ByName['NUM_PEDIDO_CLI'].AsString := NumPedido;
              Params.ByName['PRECIO'].AsFloat := Precio;
              Params.ByName['OBSERVACIONES_CLI'].AsString := Observaciones;
              ExecQuery;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
     end; // while not eof
     CloseFile(f);
     QMCabecera.Close;
     QMCabecera.Open;
  end;
end;

procedure TDMInterPedido.Refrescar(ReposicionaTambienDetalle: boolean = False);
var
  Cliente : integer;
  Pedido : string;
  PedidoDet : integer;
begin
  {Guardo la posicion}
  Cliente := QMCabeceraCLIENTE.AsInteger;
  Pedido := QMCabeceraNUM_PEDIDO_CLI.AsString;
  PedidoDet := QMDetallePEDIDO.AsInteger;
  with QMCabecera do
  begin
     DisableControls;
     try
        // Cierro y abro
        Close;
        Open;

        // Busco un registro que sea igual al que tome los datos
        while (((Cliente <> QMCabeceraCLIENTE.AsInteger) or (Pedido <> QMCabeceraNUM_PEDIDO_CLI.AsString)) and (not EOF)) do
           Next;

        // Si no estoy en ese registro, quiere decir que ya no está en el DataSet
        if ((Cliente <> QMCabeceraCLIENTE.AsInteger) or (Pedido <> QMCabeceraNUM_PEDIDO_CLI.AsString)) then
           First;
     finally
        EnableControls;
     end;
  end;

  if (ReposicionaTambienDetalle) then
  begin
     with QMDetalle do
     begin
        DisableControls;
        try
           // Busco un registro que sea igual al que tome los datos
           while ((PedidoDet <> QMDetallePEDIDO.AsInteger) and (not EOF)) do
              Next;

           // Si no estoy en ese registro, quiere decir que ya no está en el DataSet
           if (PedidoDet <> QMDetallePEDIDO.AsInteger) then
              First;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMInterPedido.QMDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMInterPedido.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TDMInterPedido.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

procedure TDMInterPedido.QMDetalleAfterPost(DataSet: TDataSet);
begin
  Refrescar(True);
end;

procedure TDMInterPedido.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  // Para poder filtrar el EditFind de direccion
  DMMain.EntornoBusqueda.Tercero := QMDetalleTERCERO.AsInteger;
end;

procedure TDMInterPedido.DataModuleDestroy(Sender: TObject);
begin
  DMMain.EntornoBusqueda.Tercero := 0;
end;

end.
