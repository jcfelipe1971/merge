unit UProDMDuplicarEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery,
  DB, FIBDataSet, FIBDataSetRO;

type
  TProDMDuplicarEsc = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     function EjecutarDuplicar(TipoOrigen, TipoDestino: string; EscandalloOrigen: integer; CompuestoDestino: string; IDDetalles: integer): integer;
  public
     { Public declarations }
     function ExisteEscandallo(articulo: string): boolean;
     procedure Duplicar(TipoOrigen, TipoDestino, Destino, Compuesto: string; Escandallo, IdDetalleOfertaV: integer; InsertMasivo: boolean);
  end;

var
  ProDMDuplicarEsc : TProDMDuplicarEsc;

implementation

uses UDMMain, UEntorno, UFMArticulos, UFMain, UProDMEscandallo, Dialogs, Forms, Windows, UFormGest, UUtiles;

{$R *.dfm}

procedure TProDMDuplicarEsc.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

function TProDMDuplicarEsc.EjecutarDuplicar(TipoOrigen, TipoDestino: string; EscandalloOrigen: integer; CompuestoDestino: string; IDDetalles: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE PRO_DUPLICAR_ESCANDALLO ');
        SQL.Add(' (?EMPRESA, ?TIPO_ORI, ?ESCANDALLO_ORI, ?TIPO_DEST, ');
        SQL.Add(' ?COMPUESTO_DEST, ?ID_DETALLES, ?ID_DETALLES_PEDIDO_V, ?ENTRADA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TIPO_ORI'].AsString := TipoOrigen;
        Params.ByName['ESCANDALLO_ORI'].AsInteger := EscandalloOrigen;
        Params.ByName['TIPO_DEST'].AsString := TipoDestino;
        Params.ByName['COMPUESTO_DEST'].AsString := CompuestoDestino;
        Params.ByName['ID_DETALLES'].AsInteger := IDDetalles;
        // Params.ByName['ID_DETALLES_PEDIDO_V'].AsInteger := ???;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['ID_ESCANDALLO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMDuplicarEsc.Duplicar(TipoOrigen, TipoDestino, Destino, Compuesto: string; Escandallo, IdDetalleOfertaV: integer; InsertMasivo: boolean);
var
  IDDetalles : integer;
  Cantidad : integer;
  IDEscandallo : integer;
  NuevoEscandallo : integer;
begin
  Cantidad := 0;
  // Escandalls
  if ((TipoOrigen = 'EPR') and (not InsertMasivo)) then
  begin
     IDDetalles := 0; // En la duplicacion de Escandallos no traspasamos el origen

     IDEscandallo := EjecutarDuplicar(TipoOrigen, TipoDestino, Escandallo, Destino, IDDetalles);
     if (TipoOrigen = TipoDestino) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ESCANDALLO FROM PRO_ESCANDALLO WHERE ID_ESC = :ID_ESC';
              Params.ByName['ID_ESC'].AsInteger := IDEscandallo;
              ExecQuery;
              NuevoEscandallo := FieldByName['ESCANDALLO'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        ShowMessage(Format(_('Duplicación de escandallo hecha. Escandallo resultante nro.: %d (id %d)'), [NuevoEscandallo, IDEscandallo]));
     end
     else
     begin
        ShowMessage(Format(_('Traspaso de escandallo a escandallo de oferta realizado. Escandallo resultante nro.: %d'), [IDEscandallo]));
        FMain.EjecutaAccion(FMain.AProOfertasE, 'id_esc = ' + IntToStr(IDEscandallo));
     end;
  end;

  if ((TipoOrigen = 'EPR') and (InsertMasivo)) then
  begin
     if Assigned(FMArticulos.DM) then
     begin
        IDDetalles := 0; // En la duplicacion de Escandallos no traspasamos el origen
        if (ConfirmaMensaje(Format(_('Se va a proceder a la inserción de %d artículos.'), [FMArticulos.DM.QMArticulos.RecordCount])) and
           ConfirmaMensaje(Format(_('Esta seguro de querer crear %d escandallos nuevos?'), [FMArticulos.DM.QMArticulos.RecordCount]))) then
        begin
           FMArticulos.DM.QMArticulos.First;
           while (not FMArticulos.DM.QMArticulos.EOF) do
           begin
              // sfg.albert - Se impide que genere un escandallo con el escandallo padre actual y
              // se impide que haya duplicidad de escandallo

              if ((FMArticulos.DM.QMArticulosARTICULO.AsString <> Trim(Destino)) and
                 (ExisteEscandallo(FMArticulos.DM.QMArticulosARTICULO.AsString) = False)) then
              begin
                 EjecutarDuplicar(TipoOrigen, TipoDestino, Escandallo, FMArticulos.DM.QMArticulosARTICULO.AsString, IDDetalles);
                 Inc(Cantidad); // sfg.albert - escandalls insertats
              end
              // Si l'escandall ja existeix, es repliquen les dades (es borra tot i es torna a crear)
              // Abans es deixa l'estat inactiu i es torn a deixar com estava
              else
              if (Compuesto <> FMArticulos.DM.QMArticulosARTICULO.AsString) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' EXECUTE PROCEDURE PRO_REPLICAR_ESCANDALLO ');
                       SQL.Add(' (?EMPRESA, ?TIPO_ORI, ?ESCANDALLO_ORI, ?TIPO_DEST, ');
                       SQL.Add(' ?COMPUESTO_DEST, ?ID_DETALLES, ?ID_DETALLES_PEDIDO_V, ?ENTRADA) ');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['TIPO_ORI'].AsString := TipoOrigen;
                       Params.ByName['ESCANDALLO_ORI'].AsInteger := Escandallo;
                       Params.ByName['TIPO_DEST'].AsString := TipoDestino;
                       Params.ByName['COMPUESTO_DEST'].AsString := FMArticulos.DM.QMArticulosARTICULO.AsString;
                       Params.ByName['ID_DETALLES'].AsInteger := IDDetalles;
                       // Params.ByName['ID_DETALLES_PEDIDO_V'].AsInteger := ???;
                       Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              FMArticulos.DM.QMArticulos.Next;
           end;
           ShowMessage(Format(_('Se han creado %d escandallos nuevos con éxito.'), [Cantidad]));
        end;
     end
     else
        Application.MessageBox(PChar(string(_('No se puede insertar masivamente articulos con la ventana de articulos cerrada...'))),
           PChar(string(_('Error'))), mb_iconstop);

     CierraForm(FMArticulos); // Cierra form articulos

     ProDMEscandallo.QMProEscandallo.Close;
     ProDMEscandallo.QMProEscandallo.Open;
  end;

  // Ofertes escandall
  if (TipoOrigen = 'OFE') then
  begin
     if (TipoDestino = 'OFE') then
        IDDetalles := 0 // En la duplicacion de Ofertas no traspasamos el origen
     else
        IDDetalles := IdDetalleOfertaV;

     IDEscandallo := EjecutarDuplicar(TipoOrigen, TipoDestino, Escandallo, Destino, IDDetalles);
     if (TipoOrigen = TipoDestino) then
        ShowMessage(Format(_('Duplicación de escandallo hecha. Escandallo resultante nro.: %d'), [IDEscandallo]))
     else
     begin
        ShowMessage(Format(_('Traspaso de oferta de esc. a escandallo realizado. Escandallo resultante nro.: %d'), [IDEscandallo]));
        FMain.EjecutaAccion(FMain.AProEscandallosF, 'id_esc = ' + IntToStr(IDEscandallo));
     end;
  end;
end;

function TProDMDuplicarEsc.ExisteEscandallo(articulo: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM PRO_ESCANDALLO WHERE EMPRESA = ?EMPRESA AND COMPUESTO = ?COMPUESTO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPUESTO'].AsString := articulo;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger > 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
