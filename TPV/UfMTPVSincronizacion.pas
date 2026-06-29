unit UFMTPVSincronizacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFLabel,
  DB, FIBDataSet, Buttons, ULFMemo, FIBQuery, HYFIBQuery, FIBDatabase,
  UFIBModificados;

type
  TFMTPVSincronizacion = class(TFPEditSinNavegador)
     ASincronizar: TAction;
     PTop: TLFPanel;
     PCuerpo: TLFPanel;
     ESerie: TLFEdit;
     MSalida: TLFMemo;
     BTraspaso: TBitBtn;
     LSerie: TLFLabel;
     EBaseDestino: TLFEdit;
     LBase: TLFLabel;
     LSesion: TLabel;
     ESesion: TEdit;
     Panel1: TPanel;
     LContadorClientes: TLFLabel;
     LContadorCabTickets: TLabel;
     LContadorDetTickets: TLabel;
     LContadorTicFP: TLabel;
     LRit: TLFLabel;
     ERit: TLFEdit;
     LContadorSesCajaTurnoFP: TLabel;
     LContadorSesCajaTurno: TLabel;
     LFLabel1: TLFLabel;
     ENumTicket: TLFEdit;
     LNumTicket: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure ASincronizarExecute(Sender: TObject);
     procedure BTraspasoClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     // function TraspasaClientes: boolean;
     //procedure ModificaContadorEndestino(Contador: integer);
  public
     { Public declarations }
  end;

var
  FMTPVSincronizacion : TFMTPVSincronizacion;

implementation

uses
  UDMTPVSesionCajaTurno, UEntorno, UDMMain, UFormGest, UDMTPVSincronizacion, IniFiles, UParam, UDameDato;

{$R *.dfm}

procedure TFMTPVSincronizacion.FormCreate(Sender: TObject);
var
  FicheroSincronizacion, RutaSincronizacion, Sesion, RIT, NumTicket, Base : string;
  oIni : TIniFile;
begin
  inherited;
  AbreData(TDMTPVSesionCajaTurno, DMTPVSesionCajaTurno);
  AbreData(TDMTPVSincronizacion, DMTPVSincronizacion);
  ESerie.Text := DameTituloSerie(REntorno.Serie);

  // Obtenemos la ruta del fichero de sincronización
  RutaSincronizacion := DMMain.DameRutaFicheroDeSincronizacion(ESerie.Text);

  RutaSincronizacion := ExtractFilePath(Application.ExeName);
  FicheroSincronizacion := RutaSincronizacion + 'TPV-sincronizacion_' + ESerie.Text + '.ini';

  // Verificamos si exsite el fichero
  if (FileExists(FicheroSincronizacion)) then
  begin
     oIni := TIniFile.Create(FicheroSincronizacion);
     try
        Sesion := oIni.ReadString('Datos', 'Sesion', Sesion);
        Base := oIni.ReadString('Datos', 'BaseDeDatos', Base);
        RIT := oIni.ReadString('Datos', 'RIT', RIT);
        NumTicket := oIni.ReadString('Datos', 'NumeroTicket', NumTicket);

        ESesion.Text := Sesion;
        ERit.Text := RIT;
        ENumTicket.Text := NumTicket;
        EBaseDestino.Text := Base;
     finally
        oIni.Free;
     end;
  end
  else
     ShowMessage(_('No se ha encontrado el fichero de configuración para la sincronización'));
end;

procedure TFMTPVSincronizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTPVSesionCajaTurno);
  CierraData(DMTPVSincronizacion);
end;

procedure TFMTPVSincronizacion.ASincronizarExecute(Sender: TObject);
begin
  inherited;
  {
  // Verificamos si la sesion esta cerrada
  if (DMTPVSesionCajaTurno.xSesionABIERTA.AsInteger = 1)then
  begin
     DMTPVSesionCajaTurno.SincronizaSesion(REntorno.Serie);
  end
  else
  begin
     ShowMessage(_('No se puede sincronizar mientras haya una sesión abierta!!!'));
  end;
  }
end;

procedure TFMTPVSincronizacion.BTraspasoClick(Sender: TObject);
var
  c, err, dup : integer;
  //f : integer;
  // i : integer;
  sesion_origen : integer;
  Q, Q1, Q2 : THYFIBQuery;
begin
  inherited;
  sesion_origen := StrToInt(ESesion.Text);
  MSalida.Lines.Clear;
  MSalida.Visible := False;

  // verificamos que este habilitada la sincronizacion y sea una estacion de trabajo
  if ((LeeParametro('TPVSINC001', '') = 'S') and (REntorno.MaquinaSincronizacion = 'online')) then
  begin
     with DMTPVSincronizacion do
     begin
        // Conectamos a la base destino
        if (DBDestino.Connected) then
           DBDestino.Close;

        DBDestino.DBName := EBaseDestino.Text;
        DBDestino.Open;
        try
           // Verificamos que la sesion pendiente de sincronizar sea la misma
           if (dameSesionASincronizar = sesion_origen) then
           begin
              if not TDestino.InTransaction then
                 TDestino.StartTransaction;

              // Actualizamos el contador al de la base online
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DBDestino;
                    SQL.Add('UPDATE VER_EMP_CONT_REC_EECS ');
                    SQL.Add('SET ');
                    SQL.Add('CONTADOR = ?CONTADOR ');
                    SQL.Add('WHERE ');
                    SQL.Add('  EMPRESA = ?EMPRESA AND ');
                    SQL.Add('  EJERCICIO = ?EJERCICIO AND ');
                    SQL.Add('  CANAL = ?CANAL AND ');
                    SQL.Add('  SERIE = ?SERIE AND ');
                    SQL.Add('  TIPO = ?TIPO ');

                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['SERIE'].AsString := REntorno.Serie;
                    Params.ByName['TIPO'].AsString := 'TIC';
                    Params.ByName['CONTADOR'].AsInteger := StrToInt(ERit.Text);
                    ExecQuery;
                    FreeHandle;
                 except
                    on E: Exception do
                    begin
                       MSalida.Lines.Add('No se ha podido actualizar el numero del contador ' + E.Message);
                       ShowMessage('No se ha podido actualizar el numero del contador ' + E.Message);
                    end;

                 end;
              end;

              TDestino.Commit;

              if not TDestino.InTransaction then
                 TDestino.StartTransaction;

              c := 0;
              err := 0;
              dup := 0;

              // Insertamos clientes nuevos
              QOrigen.Close;
              QOrigen.SelectSQL.Clear;
              QOrigen.SelectSQL.Add(' SELECT CAB.EMPRESA,CAB.EJERCICIO,CAB.CANAL,CAB.SERIE,NIF.TERCERO, NIF.NIF AS NIF,NIF.nombre AS NOMBRE FROM GES_TICKET_CABECERA CAB ');
              QOrigen.SelectSQL.Add(' JOIN GES_CABECERAS_S_FAC_NIF NIF ON( CAB.EMPRESA = NIF.EMPRESA AND ');
              QOrigen.SelectSQL.Add(' CAB.EJERCICIO = NIF.EJERCICIO AND CAB.CANAL = NIF.CANAL AND ');
              QOrigen.SelectSQL.Add(' CAB.SERIE = NIF.SERIE AND CAB.TIPO = NIF.TIPO AND CAB.RIT = NIF.RIG ) ');
              QOrigen.SelectSQL.Add(' WHERE CAB.EMPRESA=:EMPRESA AND CAB.EJERCICIO=:EJERCICIO AND CAB.CANAL=:CANAL AND ');
              QOrigen.SelectSQL.Add(' CAB.SERIE=:SERIE AND CAB.TIPO=:TIPO AND CAB.SESION=:SESION ');
              QOrigen.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              QOrigen.Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
              QOrigen.Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
              QOrigen.Params.ByName['SERIE'].AsString := REntorno.SERIE;
              QOrigen.Params.ByName['TIPO'].AsString := 'TIC';
              QOrigen.Params.ByName['SESION'].AsInteger := sesion_origen;
              QOrigen.Open;
              QOrigen.First;

              while not QOrigen.EOF do
              begin
                 // Verificamos si existe el cliente
                 if (VerificaSiExisteTercero(QOrigen.FieldByName('NIF').AsString) = 0) then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DBDestino;
                          SQL.Add(' INSERT INTO VER_TERCEROS_EDICION ');
                          SQL.Add(' (TERCERO, NOMBRE_COMERCIAL, NOMBRE_R_SOCIAL, NIF, DIR_LOCALIDAD, DIR_DEFECTO) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (?TERCERO, ?NOMBRE_COMERCIAL, ?NOMBRE_R_SOCIAL, ?NIF, ?DIR_LOCALIDAD, ?DIR_DEFECTO) ');
                          Params.ByName['TERCERO'].AsInteger := 0;
                          Params.ByName['NOMBRE_COMERCIAL'].AsString := QOrigen.FieldByName('NOMBRE').AsString;
                          Params.ByName['NOMBRE_R_SOCIAL'].AsString := QOrigen.FieldByName('NOMBRE').AsString;
                          Params.ByName['NIF'].AsString := QOrigen.FieldByName('NIF').AsString;
                          Params.ByName['DIR_LOCALIDAD'].AsString := '99999999';
                          Params.ByName['DIR_DEFECTO'].AsInteger := 1;
                          ExecQuery;
                          FreeHandle;
                          c := c + 1;
                       except
                          {Error de conexion Base Destino}
                          on e: Exception do
                          begin
                             err := err + 1;
                             MSalida.Lines.Add(e.Message);
                             ShowMessage(e.Message);
                          end;
                       end;
                    end;
                 end
                 else
                 begin
                    MSalida.Lines.Add('Ya exite el cliente' + QOrigen.FieldByName('NIF').AsString + '-' + QOrigen.FieldByName('NOMBRE').AsString);
                    dup := dup + 1;
                 end;
                 QOrigen.Next;
              end;
              LContadorClientes.Caption := 'Clientes:' + #13 + #10 + 'Insertados:' + IntToStr(c) + ' - Ya Existen:' + IntToStr(dup) + ' - Errores: ' + IntToStr(err);
              Application.ProcessMessages;

              TDestino.Commit;
              if not TDestino.InTransaction then
                 TDestino.StartTransaction;

              // Application.ProcessMessages;
              // Agregamos cabeceras de ticket
              c := 0;
              err := 0;
              dup := 0;

              QOrigen.Close;
              QOrigen.SelectSQL.Clear;
              QOrigen.SelectSQL.Add(' SELECT Z_CONTADOR_NCF, DTO_CIAL, S_BASES, I_DTO_PP, DTO_PP, I_DTO_CIAL, S_CUOTA_RE, S_CUOTA_IVA, I_DTO_LINEAS, BRUTO, ');
              QOrigen.SelectSQL.Add(' NOTAS, FECHA, A_DEVOLVER, A_DEVOLVER_CANAL, S_BASES_CANAL, S_CUOTA_RE_CANAL, S_CUOTA_IVA_CANAL, ID_FAMILIA, ');
              QOrigen.SelectSQL.Add(' ID_TICKET_DEVOLUCION, ID_TICKET, FACTURACION, AGENTE, TIPO_GASTO, ACREEDOR, ENTRADA, CLIENTE, TERCERO, RVT, RIT AS RIT, ');
              QOrigen.SelectSQL.Add(' SERIE, CAJA, SESION, ENTRADA_FAC, LINEAS, Z_TIPO_NCF, TURNO, CONTROL_STOCK, MODO_IVA, ESTADO, DESCRIPCION, ');
              QOrigen.SelectSQL.Add(' USUARIO, CANAL, EJERCICIO, EMPRESA, DEVOLUCION, CHG_MONEDA, CANAL_A_FACTURAR, FECHA_HORA, Z_PREFIJO_NCF, TARIFA, ');
              QOrigen.SelectSQL.Add(' FORMA_PAGO, MONEDA, ALMACEN, TIPO, TIPO_RELACION, SFV_AUTORIZACION, SFV_CODIGO_CONTROL, SFV_CODIGO_RESPUESTA_RAPIDA, SFV_NUM_DOSIFICACION');
              QOrigen.SelectSQL.Add(' from GES_TICKET_CABECERA ');
              QOrigen.SelectSQL.Add(' WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL AND ');
              QOrigen.SelectSQL.Add(' SERIE=:SERIE AND TIPO=:TIPO AND SESION=:SESION ');
              QOrigen.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              QOrigen.Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
              QOrigen.Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
              QOrigen.Params.ByName['SERIE'].AsString := REntorno.SERIE;
              QOrigen.Params.ByName['TIPO'].AsString := 'TIC';
              QOrigen.Params.ByName['SESION'].AsInteger := sesion_origen;
              QOrigen.Open;
              QOrigen.First;

              while not QOrigen.EOF do
              begin
                 // Verificamos si existe el ticket
                 if (not ExisteTicket(QOrigen.FieldByName('RIT').AsInteger)) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       try
                          Close;
                          DataBase := DBDestino;
                          SQL.Add(' INSERT INTO GES_TICKET_CABECERA ');
                          SQL.Add(' (Z_CONTADOR_NCF,DTO_CIAL,S_BASES,I_DTO_PP,DTO_PP,I_DTO_CIAL,S_CUOTA_RE,S_CUOTA_IVA,I_DTO_LINEAS,BRUTO,');
                          SQL.Add(' NOTAS,FECHA,A_DEVOLVER,A_DEVOLVER_CANAL,S_BASES_CANAL,S_CUOTA_RE_CANAL,S_CUOTA_IVA_CANAL,ID_FAMILIA,ID_TICKET_DEVOLUCION,');
                          SQL.Add(' FACTURACION,AGENTE,TIPO_GASTO,ACREEDOR,ENTRADA,CLIENTE,TERCERO,RVT,RIT,SERIE,CAJA,SESION,');
                          SQL.Add(' ENTRADA_FAC,LINEAS,Z_TIPO_NCF,TURNO,CONTROL_STOCK,MODO_IVA,ESTADO,DESCRIPCION,USUARIO,CANAL,EJERCICIO,EMPRESA,');
                          SQL.Add(' DEVOLUCION,CHG_MONEDA,CANAL_A_FACTURAR,FECHA_HORA,Z_PREFIJO_NCF,TARIFA,FORMA_PAGO,MONEDA,ALMACEN,TIPO,TIPO_RELACION,');
                          SQL.Add(' SFV_AUTORIZACION, SFV_CODIGO_CONTROL, SFV_CODIGO_RESPUESTA_RAPIDA, SFV_NUM_DOSIFICACION) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (?Z_CONTADOR_NCF,?DTO_CIAL,?S_BASES,?I_DTO_PP,?DTO_PP,?I_DTO_CIAL,?S_CUOTA_RE,?S_CUOTA_IVA,?I_DTO_LINEAS,?BRUTO,');
                          SQL.Add(' ?NOTAS,?FECHA,?A_DEVOLVER,?A_DEVOLVER_CANAL,?S_BASES_CANAL,?S_CUOTA_RE_CANAL,?S_CUOTA_IVA_CANAL,?ID_FAMILIA, ');
                          SQL.Add(' ?ID_TICKET_DEVOLUCION,?FACTURACION,?AGENTE,?TIPO_GASTO,?ACREEDOR,?ENTRADA,?CLIENTE,?TERCERO,?RVT,?RIT, ');
                          SQL.Add(' ?SERIE,?CAJA,?SESION,?ENTRADA_FAC,?LINEAS,?Z_TIPO_NCF,?TURNO,?CONTROL_STOCK,?MODO_IVA,?ESTADO,?DESCRIPCION,?USUARIO,?CANAL,');
                          SQL.Add(' ?EJERCICIO,?EMPRESA,?DEVOLUCION,?CHG_MONEDA,?CANAL_A_FACTURAR,?FECHA_HORA,?Z_PREFIJO_NCF,?TARIFA,?FORMA_PAGO,');
                          SQL.Add(' ?MONEDA,?ALMACEN,?TIPO,?TIPO_RELACION, ?SFV_AUTORIZACION, ?SFV_CODIGO_CONTROL, ?SFV_CODIGO_RESPUESTA_RAPIDA, ?SFV_NUM_DOSIFICACION)');

                          Params.ByName['Z_CONTADOR_NCF'].AsString := QOrigen.FieldByName('Z_CONTADOR_NCF').AsString;
                          Params.ByName['DTO_CIAL'].AsFloat := QOrigen.FieldByName('DTO_CIAL').AsFloat;
                          Params.ByName['S_BASES'].AsFloat := 0;//QOrigen.FieldByName('S_BASES').AsFloat;
                          Params.ByName['I_DTO_PP'].AsFloat := QOrigen.FieldByName('I_DTO_PP').AsFloat;
                          Params.ByName['DTO_PP'].AsFloat := QOrigen.FieldByName('DTO_PP').AsFloat;
                          Params.ByName['I_DTO_CIAL'].AsFloat := QOrigen.FieldByName('I_DTO_CIAL').AsFloat;
                          Params.ByName['S_CUOTA_RE'].AsFloat := QOrigen.FieldByName('S_CUOTA_RE').AsFloat;
                          Params.ByName['S_CUOTA_IVA'].AsFloat := 0;//QOrigen.FieldByName('S_CUOTA_IVA').AsFloat;
                          Params.ByName['I_DTO_LINEAS'].AsFloat := QOrigen.FieldByName('I_DTO_LINEAS').AsFloat;
                          Params.ByName['BRUTO'].AsFloat := 0;
                          Params.ByName['NOTAS'].AsString := QOrigen.FieldByName('NOTAS').AsString;
                          Params.ByName['FECHA'].AsDateTime := QOrigen.FieldByName('FECHA').AsDateTime;
                          Params.ByName['A_DEVOLVER'].AsFloat := QOrigen.FieldByName('A_DEVOLVER').AsFloat;
                          Params.ByName['A_DEVOLVER_CANAL'].AsFloat := QOrigen.FieldByName('A_DEVOLVER_CANAL').AsFloat;
                          Params.ByName['S_BASES_CANAL'].AsFloat := 0;//QOrigen.FieldByName('S_BASES_CANAL').AsFloat;
                          Params.ByName['S_CUOTA_RE_CANAL'].AsFloat := QOrigen.FieldByName('S_CUOTA_RE_CANAL').AsFloat;
                          Params.ByName['S_CUOTA_IVA_CANAL'].AsFloat := 0;//QOrigen.FieldByName('S_CUOTA_IVA_CANAL').AsFloat;
                          Params.ByName['ID_FAMILIA'].AsInteger := QOrigen.FieldByName('ID_FAMILIA').AsInteger;
                          Params.ByName['ID_TICKET_DEVOLUCION'].AsInteger := QOrigen.FieldByName('ID_TICKET_DEVOLUCION').AsInteger;
                          Params.ByName['FACTURACION'].AsInteger := QOrigen.FieldByName('FACTURACION').AsInteger;
                          Params.ByName['AGENTE'].AsInteger := QOrigen.FieldByName('AGENTE').AsInteger;
                          Params.ByName['TIPO_GASTO'].AsInteger := QOrigen.FieldByName('TIPO_GASTO').AsInteger;
                          Params.ByName['ACREEDOR'].AsInteger := QOrigen.FieldByName('ACREEDOR').AsInteger;
                          Params.ByName['ENTRADA'].AsInteger := 1;
                          Params.ByName['CLIENTE'].AsInteger := QOrigen.FieldByName('CLIENTE').AsInteger;
                          Params.ByName['TERCERO'].AsInteger := QOrigen.FieldByName('TERCERO').AsInteger;
                          Params.ByName['RVT'].AsInteger := QOrigen.FieldByName('RVT').AsInteger;
                          Params.ByName['RIT'].AsInteger := QOrigen.FieldByName('RIT').AsInteger;
                          Params.ByName['SERIE'].AsString := QOrigen.FieldByName('SERIE').AsString;
                          Params.ByName['CAJA'].AsInteger := QOrigen.FieldByName('CAJA').AsInteger;
                          Params.ByName['SESION'].AsInteger := QOrigen.FieldByName('SESION').AsInteger;
                          Params.ByName['ENTRADA_FAC'].AsInteger := 1;
                          Params.ByName['LINEAS'].AsInteger := 1;
                          Params.ByName['Z_TIPO_NCF'].AsInteger := QOrigen.FieldByName('Z_TIPO_NCF').AsInteger;
                          Params.ByName['TURNO'].AsInteger := QOrigen.FieldByName('TURNO').AsInteger;
                          Params.ByName['CONTROL_STOCK'].AsInteger := QOrigen.FieldByName('CONTROL_STOCK').AsInteger;
                          Params.ByName['MODO_IVA'].AsInteger := QOrigen.FieldByName('MODO_IVA').AsInteger;
                          Params.ByName['ESTADO'].AsInteger := 0;//QOrigen.FieldByName('ESTADO').Asinteger;
                          Params.ByName['DESCRIPCION'].AsString := QOrigen.FieldByName('DESCRIPCION').AsString;
                          Params.ByName['USUARIO'].AsInteger := QOrigen.FieldByName('USUARIO').AsInteger;
                          Params.ByName['CANAL'].AsInteger := QOrigen.FieldByName('CANAL').AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := QOrigen.FieldByName('EJERCICIO').AsInteger;
                          Params.ByName['EMPRESA'].AsInteger := QOrigen.FieldByName('EMPRESA').AsInteger;
                          Params.ByName['DEVOLUCION'].AsInteger := QOrigen.FieldByName('DEVOLUCION').AsInteger;
                          Params.ByName['CHG_MONEDA'].AsInteger := QOrigen.FieldByName('CHG_MONEDA').AsInteger;
                          Params.ByName['CANAL_A_FACTURAR'].AsInteger := QOrigen.FieldByName('CANAL_A_FACTURAR').AsInteger;
                          Params.ByName['FECHA_HORA'].AsString := QOrigen.FieldByName('FECHA_HORA').AsString;
                          Params.ByName['Z_PREFIJO_NCF'].AsString := QOrigen.FieldByName('Z_PREFIJO_NCF').AsString;
                          Params.ByName['TARIFA'].AsString := QOrigen.FieldByName('TARIFA').AsString;
                          Params.ByName['FORMA_PAGO'].AsString := QOrigen.FieldByName('FORMA_PAGO').AsString;
                          Params.ByName['MONEDA'].AsString := QOrigen.FieldByName('MONEDA').AsString;
                          Params.ByName['ALMACEN'].AsString := QOrigen.FieldByName('ALMACEN').AsString;
                          Params.ByName['TIPO'].AsString := QOrigen.FieldByName('TIPO').AsString;
                          Params.ByName['TIPO_RELACION'].AsString := QOrigen.FieldByName('TIPO_RELACION').AsString;
                          Params.ByName['SFV_AUTORIZACION'].AsString := QOrigen.FieldByName('SFV_AUTORIZACION').AsString;
                          Params.ByName['SFV_CODIGO_CONTROL'].AsString := QOrigen.FieldByName('SFV_CODIGO_CONTROL').AsString;
                          Params.ByName['SFV_CODIGO_RESPUESTA_RAPIDA'].AsString := QOrigen.FieldByName('SFV_CODIGO_RESPUESTA_RAPIDA').AsString;
                          Params.ByName['SFV_NUM_DOSIFICACION'].AsInteger := QOrigen.FieldByName('SFV_NUM_DOSIFICACION').AsInteger;

                          ExecQuery;
                          FreeHandle;
                          c := c + 1;
                       except
                          {Error de conexion Base Destino}
                          on e: Exception do
                          begin
                             err := err + 1;
                             MSalida.Lines.Add(e.Message);
                             ShowMessage(e.Message);
                          end;
                       end;
                    end;
                 end
                 else
                 begin
                    MSalida.Lines.Add('Ya exite el Ticket' + IntToStr(QOrigen.FieldByName('RIT').AsInteger));
                    dup := dup + 1;
                 end;
                 QOrigen.Next;
              end;
              LContadorCabTickets.Caption := 'Tickets Cab:' + #13 + #10 + 'Insertados:' + IntToStr(c) + ' - Ya Existen:' + IntToStr(dup) + ' - Errores: ' + IntToStr(err);
              Application.ProcessMessages;

              TDestino.Commit;
              if not TDestino.InTransaction then
                 TDestino.StartTransaction;

              // Application.ProcessMessages;
              // Agregamos detalle de tickets
              c := 0;
              err := 0;
              dup := 0;

              QOrigen.Close;
              QOrigen.SelectSQL.Clear;
              QOrigen.SelectSQL.Add(' select UNIDADES, PRECIO, P_COSTE, BRUTO, I_DTO_PP, I_DTO_CIAL, I_DESCUENTO, B_IMPONIBLE, B_DTO_LINEA, C_IVA, NOTAS, ');
              QOrigen.SelectSQL.Add('        UNIDADES_EXT, TOTAL_LINEA, SERIE, RIT, M_MOV_STOCK, ENTRADA, EMPRESA, EJERCICIO, CANAL, LINEA, TITULO, DESCUENTO, ');
              QOrigen.SelectSQL.Add('        TIPO_IVA, P_IVA, P_RECARGO, DTO_PP, DTO_CIAL, IVA_INCLUIDO, CANAL_DESTINO, TIPO, ALMACEN, ARTICULO, PAIS, ');
              QOrigen.SelectSQL.Add('        USUARIO ');
              QOrigen.SelectSQL.Add(' from GES_TICKET_DETALLE ');
              QOrigen.SelectSQL.Add(' where ID_TICKET in (select ID_TICKET ');
              QOrigen.SelectSQL.Add('                     from GES_TICKET_CABECERA ');
              QOrigen.SelectSQL.Add('                     where EMPRESA = :EMPRESA and ');
              QOrigen.SelectSQL.Add('                           EJERCICIO = :EJERCICIO and ');
              QOrigen.SelectSQL.Add('                           CANAL = :CANAL and ');
              QOrigen.SelectSQL.Add('                           SERIE = :SERIE and ');
              QOrigen.SelectSQL.Add('                           TIPO = :TIPO and ');
              QOrigen.SelectSQL.Add('                           SESION = :SESION) ');

              QOrigen.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              QOrigen.Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
              QOrigen.Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
              QOrigen.Params.ByName['SERIE'].AsString := REntorno.SERIE;
              QOrigen.Params.ByName['TIPO'].AsString := 'TIC';
              QOrigen.Params.ByName['SESION'].AsInteger := sesion_origen;
              QOrigen.Open;
              QOrigen.First;

              while not QOrigen.EOF do
              begin
                 // Verificamos si existe linea de ticket
                 if (VerificaSiExisteLineaTicket(QOrigen.FieldByName('RIT').AsInteger, QOrigen.FieldByName('LINEA').AsInteger) = 0) then
                 begin
                    Q1 := THYFIBQuery.Create(nil);
                    with Q1 do
                    begin
                       try
                          Close;
                          DataBase := DBDestino;

                          SQL.Add(' INSERT INTO GES_TICKET_DETALLE (UNIDADES, PRECIO, P_COSTE, BRUTO, I_DTO_PP, I_DTO_CIAL, I_DESCUENTO, B_IMPONIBLE, ');
                          SQL.Add(' B_DTO_LINEA, C_IVA, NOTAS, UNIDADES_EXT, TOTAL_LINEA, SERIE, RIT, M_MOV_STOCK, ENTRADA, ');
                          SQL.Add(' EMPRESA, EJERCICIO, CANAL, LINEA, TITULO, DESCUENTO, TIPO_IVA, P_IVA, P_RECARGO, DTO_PP, ');
                          SQL.Add(' DTO_CIAL, IVA_INCLUIDO, CANAL_DESTINO, TIPO, ALMACEN, ARTICULO, PAIS, USUARIO) ');
                          SQL.Add(' VALUES (:UNIDADES, :PRECIO, :P_COSTE, :BRUTO, :I_DTO_PP, :I_DTO_CIAL, :I_DESCUENTO, :B_IMPONIBLE, :B_DTO_LINEA, :C_IVA, ');
                          SQL.Add(' :NOTAS, :UNIDADES_EXT, :TOTAL_LINEA, :SERIE, :RIT, :M_MOV_STOCK, :ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, :LINEA, ');
                          SQL.Add(' :TITULO, :DESCUENTO, :TIPO_IVA, :P_IVA, :P_RECARGO, :DTO_PP, :DTO_CIAL, :IVA_INCLUIDO, :CANAL_DESTINO, :TIPO, ');
                          SQL.Add(' :ALMACEN, :ARTICULO, :PAIS, :USUARIO) ');
                          Params.ByName['UNIDADES'].AsFloat := QOrigen.FieldByName('UNIDADES').AsFloat;
                          Params.ByName['PRECIO'].AsFloat := QOrigen.FieldByName('PRECIO').AsFloat;
                          Params.ByName['P_COSTE'].AsFloat := QOrigen.FieldByName('P_COSTE').AsFloat;
                          Params.ByName['BRUTO'].AsFloat := QOrigen.FieldByName('BRUTO').AsFloat;
                          Params.ByName['I_DTO_PP'].AsFloat := 0;
                          Params.ByName['I_DTO_CIAL'].AsFloat := 0;
                          Params.ByName['I_DESCUENTO'].AsFloat := 0;
                          Params.ByName['B_IMPONIBLE'].AsFloat := 0;
                          Params.ByName['B_DTO_LINEA'].AsFloat := QOrigen.FieldByName('B_DTO_LINEA').AsFloat;
                          Params.ByName['C_IVA'].AsFloat := QOrigen.FieldByName('C_IVA').AsFloat;
                          Params.ByName['NOTAS'].AsString := QOrigen.FieldByName('NOTAS').AsString;
                          Params.ByName['UNIDADES_EXT'].AsFloat := QOrigen.FieldByName('UNIDADES_EXT').AsFloat;
                          Params.ByName['TOTAL_LINEA'].AsFloat := 0;
                          Params.ByName['SERIE'].AsString := QOrigen.FieldByName('SERIE').AsString;
                          Params.ByName['RIT'].AsInteger := QOrigen.FieldByName('RIT').AsInteger;
                          Params.ByName['M_MOV_STOCK'].AsInteger := QOrigen.FieldByName('M_MOV_STOCK').AsInteger;
                          Params.ByName['ENTRADA'].AsInteger := 1;
                          Params.ByName['EMPRESA'].AsInteger := QOrigen.FieldByName('EMPRESA').AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := QOrigen.FieldByName('EJERCICIO').AsInteger;
                          Params.ByName['CANAL'].AsInteger := QOrigen.FieldByName('CANAL').AsInteger;
                          Params.ByName['LINEA'].AsInteger := QOrigen.FieldByName('LINEA').AsInteger;
                          Params.ByName['TITULO'].AsString := QOrigen.FieldByName('TITULO').AsString;
                          Params.ByName['DESCUENTO'].AsFloat := QOrigen.FieldByName('DESCUENTO').AsFloat;
                          Params.ByName['TIPO_IVA'].AsInteger := QOrigen.FieldByName('TIPO_IVA').AsInteger;
                          Params.ByName['P_IVA'].AsFloat := QOrigen.FieldByName('P_IVA').AsFloat;
                          Params.ByName['P_RECARGO'].AsFloat := QOrigen.FieldByName('P_RECARGO').AsFloat;
                          Params.ByName['DTO_PP'].AsFloat := QOrigen.FieldByName('DTO_PP').AsFloat;
                          Params.ByName['DTO_CIAL'].AsFloat := QOrigen.FieldByName('DTO_CIAL').AsFloat;
                          Params.ByName['IVA_INCLUIDO'].AsInteger := QOrigen.FieldByName('IVA_INCLUIDO').AsInteger;
                          Params.ByName['CANAL_DESTINO'].AsInteger := QOrigen.FieldByName('CANAL_DESTINO').AsInteger;
                          Params.ByName['TIPO'].AsString := QOrigen.FieldByName('TIPO').AsString;
                          Params.ByName['ALMACEN'].AsString := QOrigen.FieldByName('ALMACEN').AsString;
                          Params.ByName['ARTICULO'].AsString := QOrigen.FieldByName('ARTICULO').AsString;
                          Params.ByName['PAIS'].AsString := QOrigen.FieldByName('PAIS').AsString;
                          Params.ByName['USUARIO'].AsInteger := QOrigen.FieldByName('USUARIO').AsInteger;
                          ExecQuery;
                          FreeHandle;
                          c := c + 1;
                       except
                          {Error de conexion Base Destino}
                          on e: Exception do
                          begin
                             err := err + 1;
                             MSalida.Lines.Add(e.Message);
                             ShowMessage(e.Message);
                          end;
                       end;
                    end;
                 end
                 else
                 begin
                    MSalida.Lines.Add('Ya exite la linea ' + IntToStr(QOrigen.FieldByName('LINEA').AsInteger) + '-' + QOrigen.FieldByName('ARTICULO').AsString);
                    dup := dup + 1;
                 end;
                 QOrigen.Next;
              end;
              LContadorDetTickets.Caption := 'Tickets Det:' + #13 + #10 + 'Insertados:' + IntToStr(c) + ' - Ya Existen:' + IntToStr(dup) + ' - Errores: ' + IntToStr(err);
              Application.ProcessMessages;


              // Insertamos desglose de totales por forma de pago
              c := 0;
              err := 0;
              dup := 0;

              QOrigen.Close;
              QOrigen.SelectSQL.Clear;

              QOrigen.SelectSQL.Add(' SELECT TOTAL_ENTREGADO, TOTAL_COBRADO, RIT, SERIE, TITULO, CANAL, EJERCICIO, EMPRESA, FORMA_PAGO, TIPO ');
              QOrigen.SelectSQL.Add(' FROM VER_TICKET_FP ');
              QOrigen.SelectSQL.Add(' WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ');
              QOrigen.SelectSQL.Add(' SERIE = :SERIE AND TIPO = :TIPO AND ');
              QOrigen.SelectSQL.Add(' RIT IN (SELECT RIT FROM GES_TICKET_CABECERA WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND ');
              QOrigen.SelectSQL.Add(' CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND SESION = :SESION) ');

              QOrigen.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              QOrigen.Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
              QOrigen.Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
              QOrigen.Params.ByName['SERIE'].AsString := REntorno.SERIE;
              QOrigen.Params.ByName['TIPO'].AsString := 'TIC';
              QOrigen.Params.ByName['SESION'].AsInteger := sesion_origen;
              QOrigen.Open;
              QOrigen.First;

              while not QOrigen.EOF do
              begin
                 // Verificamos si existe el ticket
                 if (VerificaSiExisteDetalleTicketenFP(QOrigen.FieldByName('RIT').AsInteger, QOrigen.FieldByName('FORMA_PAGO').AsString) = 0) then
                 begin
                    Q2 := THYFIBQuery.Create(nil);
                    with Q2 do
                    begin
                       try
                          Close;
                          DataBase := DBDestino;

                          SQL.Add(' INSERT INTO VER_TICKET_FP ');
                          SQL.Add(' (TOTAL_ENTREGADO,TOTAL_COBRADO,RIT,SERIE,TITULO,CANAL,EJERCICIO,EMPRESA,FORMA_PAGO,TIPO) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (?TOTAL_ENTREGADO,?TOTAL_COBRADO,?RIT,?SERIE,?TITULO,?CANAL,?EJERCICIO,?EMPRESA,?FORMA_PAGO,?TIPO) ');

                          Params.ByName['TOTAL_ENTREGADO'].AsFloat := QOrigen.FieldByName('TOTAL_ENTREGADO').AsFloat;
                          Params.ByName['TOTAL_COBRADO'].AsFloat := QOrigen.FieldByName('TOTAL_COBRADO').AsFloat;
                          Params.ByName['RIT'].AsInteger := QOrigen.FieldByName('RIT').AsInteger;
                          Params.ByName['SERIE'].AsString := QOrigen.FieldByName('SERIE').AsString;
                          Params.ByName['TITULO'].AsString := QOrigen.FieldByName('TITULO').AsString;
                          Params.ByName['CANAL'].AsInteger := QOrigen.FieldByName('CANAL').AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := QOrigen.FieldByName('EJERCICIO').AsInteger;
                          Params.ByName['EMPRESA'].AsInteger := QOrigen.FieldByName('EMPRESA').AsInteger;
                          Params.ByName['FORMA_PAGO'].AsString := QOrigen.FieldByName('FORMA_PAGO').AsString;
                          Params.ByName['TIPO'].AsString := QOrigen.FieldByName('TIPO').AsString;
                          ExecQuery;
                          FreeHandle;
                          c := c + 1;
                       except
                          {Error de conexion Base Destino}
                          on e: Exception do
                          begin
                             err := err + 1;
                             MSalida.Lines.Add(e.Message);
                             ShowMessage(e.Message);
                          end;
                       end;
                    end;
                 end
                 else
                 begin
                    MSalida.Lines.Add('Ya exite el Ticket ' + IntToStr(QOrigen.FieldByName('RIT').AsInteger) + ' en Formas de pago');
                    dup := dup + 1;
                 end;
                 QOrigen.Next;
              end;
              LContadorTicFP.Caption := 'Ticket FP:' + #13 + #10 + 'Insertados:' + IntToStr(c) + ' - Ya Existen:' + IntToStr(dup) + ' - Errores: ' + IntToStr(err);
              Application.ProcessMessages;

              TDestino.Commit;
              if not TDestino.InTransaction then
                 TDestino.StartTransaction;

              // Insertamos sesion caja turno fp
              c := 0;
              err := 0;
              dup := 0;

              QOrigen.Close;
              QOrigen.SelectSQL.Clear;

              QOrigen.SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, SESION, CAJA, TURNO, FORMA_PAGO, TOTAL_COBRADO ');
              QOrigen.SelectSQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO_FP ');
              QOrigen.SelectSQL.Add(' WHERE EMPRESA = :EMPRESA AND ');
              QOrigen.SelectSQL.Add('       EJERCICIO = :EJERCICIO AND ');
              QOrigen.SelectSQL.Add('       CANAL = :CANAL AND ');
              QOrigen.SelectSQL.Add('       SERIE = :SERIE AND ');
              QOrigen.SelectSQL.Add('       SESION = :SESION  ');

              QOrigen.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              QOrigen.Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
              QOrigen.Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
              QOrigen.Params.ByName['SERIE'].AsString := REntorno.SERIE;
              QOrigen.Params.ByName['SESION'].AsInteger := sesion_origen;
              QOrigen.Open;
              QOrigen.First;

              while not QOrigen.EOF do
              begin
                 //Verificamos si existe el ticket
                 if (VerificaSiExisteSesionCajaTurnoFP(QOrigen.FieldByName('SESION').AsInteger, QOrigen.FieldByName('CAJA').AsInteger,
                    QOrigen.FieldByName('TURNO').AsInteger, QOrigen.FieldByName('FORMA_PAGO').AsString) = 0) then
                 begin
                    Q2 := THYFIBQuery.Create(nil);
                    with Q2 do
                    begin
                       try
                          Close;
                          DataBase := DBDestino;

                          SQL.Add(' INSERT INTO GES_TPV_SESIONES_CAJAS_TURNO_FP ');
                          SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, SESION, CAJA, TURNO, FORMA_PAGO,TOTAL_COBRADO ) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?SESION, ?CAJA, ?TURNO, ?FORMA_PAGO,?TOTAL_COBRADO) ');

                          Params.ByName['EMPRESA'].AsInteger := QOrigen.FieldByName('EMPRESA').AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := QOrigen.FieldByName('EJERCICIO').AsInteger;
                          Params.ByName['CANAL'].AsInteger := QOrigen.FieldByName('CANAL').AsInteger;
                          Params.ByName['SERIE'].AsString := QOrigen.FieldByName('SERIE').AsString;
                          Params.ByName['SESION'].AsInteger := QOrigen.FieldByName('SESION').AsInteger;
                          Params.ByName['CAJA'].AsInteger := QOrigen.FieldByName('CAJA').AsInteger;
                          Params.ByName['TURNO'].AsInteger := QOrigen.FieldByName('TURNO').AsInteger;
                          Params.ByName['FORMA_PAGO'].AsString := QOrigen.FieldByName('FORMA_PAGO').AsString;
                          Params.ByName['TOTAL_COBRADO'].AsFloat := QOrigen.FieldByName('TOTAL_COBRADO').AsFloat;
                          ExecQuery;
                          FreeHandle;
                          c := c + 1;
                       except
                          {Error de conexion Base Destino}
                          on e: Exception do
                          begin
                             err := err + 1;
                             MSalida.Lines.Add(e.Message);
                             ShowMessage(e.Message);
                          end;
                       end;
                    end;
                 end
                 else
                 begin
                    MSalida.Lines.Add('Ya exite la sesion caja turno forma de pago ' + QOrigen.FieldByName('FORMA_PAGO').AsString);
                    dup := dup + 1;
                 end;
                 QOrigen.Next;
              end;
              LContadorSesCajaTurnoFP.Caption := 'SesCajaTurFP:' + #13 + #10 + 'Insertados:' + IntToStr(c) + ' - Ya Existen:' + IntToStr(dup) + ' - Errores: ' + IntToStr(err);
              Application.ProcessMessages;

              TDestino.Commit;
              if not TDestino.InTransaction then
                 TDestino.StartTransaction;

              // Actualizamos datos del turno
              c := 0;
              err := 0;
              dup := 0;

              QOrigen.Close;
              QOrigen.SelectSQL.Clear;

              QOrigen.SelectSQL.Add(' SELECT SESION, CAJA, TURNO, I_IVA, B_IMPONIBLE, TOTAL_TURNO, CAMBIO_ENTREGADO, DIFERENCIA, SALDO ');
              QOrigen.SelectSQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              QOrigen.SelectSQL.Add(' WHERE EMPRESA = :EMPRESA AND ');
              QOrigen.SelectSQL.Add('       EJERCICIO = :EJERCICIO AND ');
              QOrigen.SelectSQL.Add('       CANAL = :CANAL AND ');
              QOrigen.SelectSQL.Add('       SERIE = :SERIE AND ');
              QOrigen.SelectSQL.Add('       SESION = :SESION ');

              QOrigen.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              QOrigen.Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
              QOrigen.Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
              QOrigen.Params.ByName['SERIE'].AsString := REntorno.SERIE;
              QOrigen.Params.ByName['SESION'].AsInteger := sesion_origen;
              QOrigen.Open;
              QOrigen.First;

              while not QOrigen.EOF do
              begin
                 // Verificamos si existe el ticket
                 if (VerificaSiExisteSesionCajaTurno(QOrigen.FieldByName('SESION').AsInteger, QOrigen.FieldByName('CAJA').AsInteger,
                    QOrigen.FieldByName('TURNO').AsInteger) = 1) then
                 begin
                    Q2 := THYFIBQuery.Create(nil);
                    with Q2 do
                    begin
                       try
                          Close;
                          DataBase := DBDestino;

                          SQL.Add(' UPDATE GES_TPV_SESIONES_CAJAS_TURNO ');
                          SQL.Add(' SET I_IVA = :I_IVA, ');
                          SQL.Add('     B_IMPONIBLE = :B_IMPONIBLE, ');
                          SQL.Add('     TOTAL_TURNO = :TOTAL_TURNO, ');
                          SQL.Add('     CAMBIO_ENTREGADO = :CAMBIO_ENTREGADO, ');
                          SQL.Add('     DIFERENCIA = :DIFERENCIA, ');
                          SQL.Add('     SALDO = :SALDO ');
                          SQL.Add(' WHERE EMPRESA = :EMPRESA AND ');
                          SQL.Add('       EJERCICIO = :EJERCICIO AND ');
                          SQL.Add('       CANAL = :CANAL AND ');
                          SQL.Add('       SERIE = :SERIE AND ');
                          SQL.Add('       SESION = :SESION AND ');
                          SQL.Add('       CAJA = :CAJA AND ');
                          SQL.Add('       TURNO = :TURNO ');

                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
                          Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
                          Params.ByName['SERIE'].AsString := REntorno.SERIE;
                          Params.ByName['SESION'].AsInteger := QOrigen.FieldByName('SESION').AsInteger;
                          Params.ByName['CAJA'].AsInteger := QOrigen.FieldByName('CAJA').AsInteger;
                          Params.ByName['TURNO'].AsInteger := QOrigen.FieldByName('TURNO').AsInteger;
                          Params.ByName['I_IVA'].AsFloat := QOrigen.FieldByName('I_IVA').AsFloat;
                          Params.ByName['B_IMPONIBLE'].AsFloat := QOrigen.FieldByName('B_IMPONIBLE').AsFloat;
                          Params.ByName['TOTAL_TURNO'].AsFloat := QOrigen.FieldByName('TOTAL_TURNO').AsFloat;
                          Params.ByName['CAMBIO_ENTREGADO'].AsFloat := QOrigen.FieldByName('CAMBIO_ENTREGADO').AsFloat;
                          Params.ByName['DIFERENCIA'].AsFloat := QOrigen.FieldByName('DIFERENCIA').AsFloat;
                          Params.ByName['SALDO'].AsFloat := QOrigen.FieldByName('SALDO').AsFloat;
                          ExecQuery;
                          FreeHandle;
                          c := c + 1;
                       except
                          {Error de conexion Base Destino}
                          on e: Exception do
                          begin
                             err := err + 1;
                             MSalida.Lines.Add(e.Message);
                             ShowMessage(e.Message);
                          end;
                       end;
                    end;
                 end
                 else
                 begin
                    MSalida.Lines.Add('No exite la sesion caja turno ' + IntToStr(QOrigen.FieldByName('TURNO').AsInteger));
                    dup := dup + 1;
                 end;
                 QOrigen.Next;
              end;

              LContadorSesCajaTurno.Caption := 'SesCajaTur:' + #13 + #10 + 'Insertados:' + IntToStr(c) + ' - Ya Existen:' + IntToStr(dup) + ' - Errores: ' + IntToStr(err);
              Application.ProcessMessages;

              TDestino.Commit;
              if not TDestino.InTransaction then
                 TDestino.StartTransaction;

              // Cerramos tickets pagados
              QOrigen.Close;
              QOrigen.SelectSQL.Clear;
              QOrigen.SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIT, ESTADO ');
              QOrigen.SelectSQL.Add(' from GES_TICKET_CABECERA ');
              QOrigen.SelectSQL.Add(' WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL AND ');
              QOrigen.SelectSQL.Add(' SERIE=:SERIE AND TIPO=:TIPO AND SESION=:SESION ');
              QOrigen.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              QOrigen.Params.ByName['EJERCICIO'].AsInteger := REntorno.EJERCICIO;
              QOrigen.Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
              QOrigen.Params.ByName['SERIE'].AsString := REntorno.SERIE;
              QOrigen.Params.ByName['TIPO'].AsString := 'TIC';
              QOrigen.Params.ByName['SESION'].AsInteger := sesion_origen;
              QOrigen.Open;
              QOrigen.First;

              while not QOrigen.EOF do
              begin
                 // Verificamos si existe el ticket
                 if (ExisteTicket(QOrigen.FieldByName('RIT').AsInteger)) then
                 begin
                    if (QOrigen.FieldByName('ESTADO').AsInteger <> 0) then
                    begin
                       Q := THYFIBQuery.Create(nil);
                       with Q do
                       begin
                          try
                             Close;
                             DataBase := DBDestino;
                             SQL.Add(' UPDATE GES_TICKET_CABECERA ');
                             SQL.Add(' SET ESTADO = ?ESTADO ');
                             SQL.Add(' WHERE EMPRESA = :EMPRESA AND ');
                             SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                             SQL.Add(' CANAL = :CANAL AND ');
                             SQL.Add(' SERIE = :SERIE AND ');
                             SQL.Add(' TIPO = :TIPO AND ');
                             SQL.Add(' RIT = :RIT ');

                             Params.ByName['EMPRESA'].AsInteger := QOrigen.FieldByName('EMPRESA').AsInteger;
                             Params.ByName['EJERCICIO'].AsInteger := QOrigen.FieldByName('EJERCICIO').AsInteger;
                             Params.ByName['CANAL'].AsInteger := QOrigen.FieldByName('CANAL').AsInteger;
                             Params.ByName['SERIE'].AsString := QOrigen.FieldByName('SERIE').AsString;
                             Params.ByName['TIPO'].AsString := QOrigen.FieldByName('TIPO').AsString;
                             Params.ByName['RIT'].AsInteger := QOrigen.FieldByName('RIT').AsInteger;
                             Params.ByName['ESTADO'].AsInteger := 5;
                             ExecQuery;
                             FreeHandle;
                             //c := c + 1;
                          except
                             {Error de conexion Base Destino}
                             on e: Exception do
                             begin
                                //err := err + 1;
                                MSalida.Lines.Add(e.Message);
                                ShowMessage(e.Message);
                             end;
                          end;
                       end;
                    end;
                 end
                 else
                 begin
                    MSalida.Lines.Add('No exite el Ticket' + IntToStr(QOrigen.FieldByName('RIT').AsInteger));
                    //dup := dup + 1;
                 end;
                 QOrigen.Next;
              end;

              Application.ProcessMessages;
              TDestino.Commit;
              MSalida.Visible := True;
           end;
        except
           {Error de conexion Base Destino}
           on e: Exception do
           begin
              MSalida.Lines.Add('Error conectando la Base Destino');
              MSalida.Lines.Add(e.Message);
           end;
        end;
     end;

  end
  else
     raise Exception.Create(_('La sincronizacion no esta habilitada o no es una estacion de trabajo Offline'));
end;

procedure EscribeIniSincronizacion;
{var
  oIni : TIniFile;}
begin
  {
  oIni := TIniFile.Create(REntorno.FicheroINI);
  with REntorno do
  begin
     oIni.WriteString('Datos', 'BaseDeDatos', BaseDeDatos);
     oIni.WriteString('Datos', 'UsuarioBD', UsuarioBD);
     oIni.WriteString('Datos', 'RolBD', RolBD);
     oIni.WriteInteger('Datos', 'Ejercicio', Ejercicio);
     oIni.WriteInteger('Datos', 'Canal', Canal);
     oIni.WriteString('Datos', 'Serie', Serie);
     oIni.WriteString('Datos', 'Logo', Logo);
     oIni.WriteInteger('Datos', 'Laser', FLaser);
     oIni.WriteInteger('Datos', 'Etiquetas', FEtiquetas);
     oIni.WriteString('Datos', 'Matricial', FMatricial);

     oIni.WriteString('Datos', 'SerieDeposito', SerieDeposito);
     oIni.WriteString('Datos', 'DirectorioEDI', DirectorioEDI);
     oIni.WriteString('Datos', 'DirectorioAdjuntos', DirectorioAdjuntos);
     oIni.WriteString('Datos', 'ReportesReportSmith', ReportesReportSmith);
     oIni.WriteString('Datos', 'RuntimeReportSmith', RuntimeReportSmith);
     oIni.WriteString('Datos', 'DirectorioComunicaciones', DirectorioComunicaciones);
     oIni.WriteString('Datos', 'DirectorioLector', DirectorioLector);
     if (LineasAProc < 1) then
        LineasAProc := 100;
     oIni.WriteInteger('Datos', 'LineasAProc', LineasAProc);

     oIni.WriteString('Datos', 'DirBackup', DirBackups);
     oIni.WriteString('Datos', 'RutaLibros', RutaLibros);

     // Impresión Documentos
     oIni.WriteInteger('Documentos', 'Ofertas', Ofertas);
     oIni.WriteInteger('Documentos', 'Pedidos', Pedidos);
     oIni.WriteInteger('Documentos', 'Albaranes', Albaranes);
     oIni.WriteInteger('Documentos', 'Facturas', Facturas);

     // News
     oIni.WriteString('News', 'News', News);
     oIni.WriteInteger('News', 'PortNews', PortNews);
     oIni.WriteString('News', 'UserIDNews', UserIDNews);
     oIni.WriteBool('News', 'IdentNews', IdentNews);
     oIni.WriteString('News', 'PasswordNews', PasswordNews);

     oIni.WriteInteger('Procesos', 'Procesos', Procesos);
     oIni.WriteInteger('Procesos', 'Timer', timer_proc);

     // Usuario
     oIni.WriteBool('Usuario', 'FechaHoraG2k', FechaHoraG2k);
     oIni.WriteString('Usuario', 'Nombre', Nombre);

     // Ultimo Acceso
     oIni.WriteString('Ultimo Acceso', 'Fecha y Hora', DateTimeToStr(Now));

     // Idioma aplicacion
     oIni.WriteString('Usuario', 'Lang', GetCurrentLanguage);
  end;

  oIni.Free;
  }
end;

{procedure TFMTPVSincronizacion.ModificaContadorEndestino(Contador: integer);
begin
  // Pendiente ???
end;}

end.
