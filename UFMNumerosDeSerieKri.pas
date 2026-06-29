unit UFMNumerosDeSerieKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, DBCtrls, ULFLabel, ULFDBEdit;

type
  TFMNumerosDeSerieKri = class(TForm)
     DBEArticulo: TLFDBEdit;
     DBETitulo: TLFDBEdit;
     DBGAsignado: TDBGrid;
     DBGDisponible: TDBGrid;
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     Label4: TLFLabel;
     Label5: TLFLabel;
     LCantAsignada: TLFLabel;
     LCantidad: TLFLabel;
     Label6: TLFLabel;
     BOK: TButton;
     procedure DBGDisponibleDblClick(Sender: TObject);
     procedure DBGAsignadoDblClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BOKClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Asignados: integer;
     Cantidad: integer;
     Empresa: integer;
     Ejercicio: integer;
     Canal: integer;
     Serie: string;
     rig: integer;
     Articulo: string;
     Almacen: string;
     Fecha: TDateTime;
     Cliente: integer;
     Linea: integer;
     NroSerieAux: string;
     Garantia: boolean;
     procedure Muestra(emp: integer; ej: integer; can: integer; ser: string; r: integer; li: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: integer; gar: boolean; ForzarEntrada: boolean);
  end;

var
  FMNumerosDeSerieKri : TFMNumerosDeSerieKri;

implementation

uses UDMNumerosDeSerieKri, UFormGest, UFMNumeroDeSerieDev;

{$R *.DFM}

procedure TFMNumerosDeSerieKri.DBGDisponibleDblClick(Sender: TObject);
begin
  // Debe pasar el nro a Asignados
  if Garantia then
  begin
     try
        with DMNumerosDeSerieKri.InsertarNroSerieGar do
        begin
           Close;
           Params.ByName['EJERCICIO_GAR'].AsInteger := Ejercicio;
           Params.ByName['CANAL_GAR'].AsInteger := Canal;
           Params.ByName['SERIE_GAR'].AsString := Serie;
           Params.ByName['RIG_GAR'].AsInteger := RIG;
           Params.ByName['LINEA_GAR'].AsInteger := Linea;
           Params.ByName['ALMACEN_GAR'].AsString := Almacen;
           Params.ByName['FECHA_GAR'].AsDateTime := Fecha;
           Params.ByName['ID'].AsInteger :=
              DMNumerosDeSerieKri.NroSerieDisponibleGarID.AsInteger;
           ExecQuery;
           FreeHandle;
        end;
        DMNumerosDeSerieKri.Refrescar(empresa, articulo, ejercicio,
           canal, serie, rig, linea, cliente, almacen);
        Dec(Asignados);
        LCantAsignada.Caption := IntToStr(Asignados);
        if asignados = Cantidad then
           BOK.Enabled := True
        else
           BOK.Enabled := False;
     except
        MessageDlg('No se puede pasar este Nro de Serie', mtError, [mbOK], 0);
     end;
  end
  else
  begin
     try
        with DMNumerosDeSerieKri.InsertarNroSerie do
        begin
           Close;
           Params.ByName['EJERCICIO_SAL'].AsInteger := Ejercicio;
           Params.ByName['CANAL_SAL'].AsInteger := Canal;
           Params.ByName['SERIE_SAL'].AsString := Serie;
           Params.ByName['RIG_SAL'].AsInteger := RIG;
           Params.ByName['LINEA_SAL'].AsInteger := Linea;
           Params.ByName['ALMACEN_SAL'].AsString := Almacen;
           Params.ByName['FECHA_SAL'].AsDateTime := Fecha;
           Params.ByName['CLIENTE'].AsInteger := Cliente;
           Params.ByName['ID'].AsInteger :=
              DMNumerosDeSerieKri.NroSerieDisponibleID.AsInteger;
           ExecQuery;
           Transaction.CommitRetaining;
           FreeHandle;
        end;
        DMNumerosDeSerieKri.Refrescar(empresa, articulo, ejercicio,
           canal, serie, rig, linea, cliente, almacen);
        Inc(Asignados);
        LCantAsignada.Caption := IntToStr(Asignados);
        if asignados = Cantidad then
           BOK.Enabled := True
        else
           BOK.Enabled := False;
     except
        MessageDlg('No se puede pasar este Nro de Serie', mtError, [mbOK], 0);
     end;
  end;
end;

procedure TFMNumerosDeSerieKri.DBGAsignadoDblClick(Sender: TObject);
begin
  // Debe devolver el nro de serie a Disponibles.
  if Garantia then
  begin
     try
        NroSerieAux := DMNumerosDeSerieKri.NroSerieAsignadoGarNRO_SERIE.AsString;
        with DMNumerosDeSerieKri.SacarNroSerieGar do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['NRO_SERIE'].AsString := NroSerieAux;
           Params.ByName['EJERCICIO_GAR'].AsInteger := ejercicio;
           Params.ByName['CANAL_GAR'].AsInteger := canal;
           Params.ByName['SERIE_GAR'].AsString := serie;
           Params.ByName['RIG_GAR'].AsInteger := rig;
           Params.ByName['LINEA_GAR'].AsInteger := linea;
           ExecQuery;
           Transaction.CommitRetaining;
           FreeHandle;
        end;
        DMNumerosDeSerieKri.Refrescar(empresa, articulo, ejercicio,
           canal, serie, rig, linea, cliente, almacen);
        Inc(Asignados);
        LCantAsignada.Caption := IntToStr(Asignados);
        if asignados = Cantidad then
           BOK.Enabled := True
        else
           BOK.Enabled := False;
     except
        MessageDlg('No se puede Des-Asignar este Nro de Serie', mtError, [mbOK], 0);
     end;
  end
  else
  begin
     try
        NroSerieAux := DMNumerosDeSerieKri.NroSerieAsignadoNRO_SERIE.AsString;
        with DMNumerosDeSerieKri.SacarNroSerie do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['NRO_SERIE'].AsString := NroSerieAux;
           Params.ByName['EJERCICIO_SAL'].AsInteger := ejercicio;
           Params.ByName['CANAL_SAL'].AsInteger := canal;
           Params.ByName['SERIE_SAL'].AsString := serie;
           Params.ByName['RIG_SAL'].AsInteger := rig;
           Params.ByName['LINEA_SAL'].AsInteger := linea;
           ExecQuery;
           Transaction.CommitRetaining;
           FreeHandle;
        end;
        DMNumerosDeSerieKri.Refrescar(empresa, articulo, ejercicio,
           canal, serie, rig, linea, cliente, almacen);
        Dec(Asignados);
        LCantAsignada.Caption := IntToStr(Asignados);
        if asignados = Cantidad then
           BOK.Enabled := True
        else
           BOK.Enabled := False;
     except
        MessageDlg('No se puede Des-Asignar este Nro de Serie', mtError, [mbOK], 0);
     end;
  end;
end;

procedure TFMNumerosDeSerieKri.Muestra(emp: integer; ej: integer; can: integer; ser: string; r: integer; li: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: integer; gar: boolean; ForzarEntrada: boolean);
var
  ArtAux, DetAux : string;
  Aux : TFMNumerosDeSerieKri;
  NSerieDev : TFMNumeroDeSerieDev;
begin
  if (cant < 0) then
  begin
     NSerieDev := TFMNumeroDeSerieDev.Create(Self);
     NSerieDev.Muestra(emp, ej, can, ser, r, li, fec, art, alm, cli, cant, False
        {Escandallo}, ForzarEntrada);
     NSerieDev.Release;
  end
  else
  begin
     empresa := emp;
     ejercicio := ej;
     canal := can;
     serie := ser;
     rig := r;
     linea := li;
     articulo := art;
     almacen := alm;
     cliente := cli;
     cantidad := cant;
     fecha := fec;
     Garantia := gar;
     Caption := 'ARTICULO : ' + articulo + ' RIG : ' + IntToStr(rig) +
        ' LINEA : ' + IntToStr(linea);
     LCantidad.Caption := IntToStr(Cantidad);
     DMNumerosDeSerieKri.Refrescar(empresa, articulo, ejercicio, canal,
        serie, rig, linea, cliente, almacen);
     if garantia then
     begin
        DBGDisponible.DataSource := DMNumerosDeSerieKri.DSNroSerieDisponibleGar;
        DBGAsignado.DataSource := DMNumerosDeSerieKri.DSNroSerieAsignadoGar;
        if DMNumerosDeSerieKri.xEscandallo.EOF then
        begin
           // Debo ver si cambió el articulo.
           with DMNumerosDeSerieKri.xOldArticulo do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := empresa;
              Params.ByName['EJERCICIO_SAL'].AsInteger := ejercicio;
              Params.ByName['CANAL_SAL'].AsInteger := canal;
              Params.ByName['SERIE_SAL'].AsString := serie;
              Params.ByName['RIG_SAL'].AsInteger := rig;
              Params.ByName['LINEA_SAL'].AsInteger := linea;
              Params.ByName['ARTICULO'].AsString := articulo;
              ExecQuery;
              if (EOF) then
              begin
                 with DMNumerosDeSerieKri do
                 begin
                    xCuantosAsignadosGar.Close;
                    xCuantosAsignadosGar.Params.ByName['EMPRESA'].AsInteger := empresa;
                    xCuantosAsignadosGar.Params.ByName['ARTICULO'].AsString := articulo;
                    xCuantosAsignadosGar.Params.ByName['EJERCICIO_GAR'].AsInteger :=
                       ejercicio;
                    xCuantosAsignadosGar.Params.ByName['CANAL_GAR'].AsInteger := canal;
                    xCuantosAsignadosGar.Params.ByName['SERIE_GAR'].AsString := serie;
                    xCuantosAsignadosGar.Params.ByName['RIG_GAR'].AsInteger := rig;
                    xCuantosAsignadosGar.Params.ByName['LINEA_GAR'].AsInteger := linea;
                    xCuantosAsignadosGar.ExecQuery;
                    asignados :=
                       (-1) * xCuantosAsignadosGar.FieldByName['CANTIDAD'].AsInteger;
                    xCuantosAsignados.FreeHandle;
                 end;
                 if (DMNumerosDeSerieKri.xArticulosSERIALIZADO_KRI.AsInteger = 1) and
                    (asignados <> cantidad) then
                 begin
                    BOK.Enabled := False;
                    LCantAsignada.Caption := IntToStr(asignados);
                    ShowModal;
                 end;
              end;
           end;
        end
        else
           MessageDlg('No se puede devolver un escandallo', mtError, [mbOK], 0);
     end
     else
     begin
        DBGDisponible.DataSource := DMNumerosDeSerieKri.DSNroSerieDisponible;
        DBGAsignado.DataSource := DMNumerosDeSerieKri.DSNroSerieAsignado;
        // Debo ver si cambió el articulo.
        with DMNumerosDeSerieKri.xOldArticulo do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := empresa;
           Params.ByName['EJERCICIO_SAL'].AsInteger := ejercicio;
           Params.ByName['CANAL_SAL'].AsInteger := canal;
           Params.ByName['SERIE_SAL'].AsString := serie;
           Params.ByName['RIG_SAL'].AsInteger := rig;
           Params.ByName['LINEA_SAL'].AsInteger := linea;
           Params.ByName['ARTICULO'].AsString := articulo;
           ExecQuery;
           if (EOF and (esc = 0) and DMNumerosDeSerieKri.xEscandallo.EOF) then
              // el artículo cambió porque no lo encuentra. Debo borrar todas las referencias antiguas.
           begin
              with DMNumerosDeSerieKri.BorraNrosDeSerie do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := empresa;
                 Params.ByName['EJERCICIO_SAL'].AsInteger := ejercicio;
                 Params.ByName['CANAL_SAL'].AsInteger := canal;
                 Params.ByName['SERIE_SAL'].AsString := serie;
                 Params.ByName['RIG_SAL'].AsInteger := rig;
                 Params.ByName['LINEA_SAL'].AsInteger := linea;
                 ExecQuery;
                 Transaction.CommitRetaining;
                 FreeHandle;
              end;
           end;
           FreeHandle;
        end;
        ArtAux := Articulo;
        while not DMNumerosDeSerieKri.xEscandallo.EOF do
        begin
           DetAux := DMNumerosDeSerieKri.xEscandalloDETALLE.AsString;
           Aux := TFMNumerosDeSerieKri.Create(Self);
           Aux.Muestra(EMPRESA,
              EJERCICIO,
              CANAL,
              SERIE,
              RIG,
              LINEA,
              FECHA,
              DMNumerosDeSerieKri.xEscandalloDETALLE.AsString,
              ALMACEN,
              CLIENTE,
              cantidad * DMNumerosDeSerieKri.xEscandalloCANTIDAD.AsInteger,
              1, garantia, False);
           Aux.Release;
           DMNumerosDeSerieKri.Refrescar(empresa, ArtAux, ejercicio,
              canal, serie, rig, linea, cliente, almacen);
           DMNumerosDeSerieKri.xEscandallo.First;
           while DetAux <> DMNumerosDeSerieKri.xEscandalloDETALLE.AsString do
              DMNumerosDeSerieKri.xEscandallo.Next;
           if not DMNumerosDeSerieKri.xEscandallo.EOF then
              DMNumerosDeSerieKri.xEscandallo.Next;
        end;
        with DMNumerosDeSerieKri do
        begin
           xCuantosAsignados.Close;
           xCuantosAsignados.Params.ByName['EMPRESA'].AsInteger := empresa;
           xCuantosAsignados.Params.ByName['ARTICULO'].AsString := articulo;
           xCuantosAsignados.Params.ByName['EJERCICIO_SAL'].AsInteger := ejercicio;
           xCuantosAsignados.Params.ByName['CANAL_SAL'].AsInteger := canal;
           xCuantosAsignados.Params.ByName['SERIE_SAL'].AsString := serie;
           xCuantosAsignados.Params.ByName['RIG_SAL'].AsInteger := rig;
           xCuantosAsignados.Params.ByName['LINEA_SAL'].AsInteger := linea;
           xCuantosAsignados.ExecQuery;
           asignados := xCuantosAsignados.FieldByName['CANTIDAD'].AsInteger;
           xCuantosAsignados.FreeHandle;
        end;
        if (DMNumerosDeSerieKri.xArticulosSERIALIZADO_KRI.AsInteger = 1) then
           if ((asignados <> cantidad) or (ForzarEntrada)) then
           begin
              BOK.Enabled := False;
              LCantAsignada.Caption := IntToStr(asignados);
              ShowModal;
           end;
        //dji lrk kri         CierraData(DMNumerosDeSerieKri);
     end;
  end;
end;

procedure TFMNumerosDeSerieKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMNumerosDeSerieKri, DMNumerosDeSerieKri);
end;

procedure TFMNumerosDeSerieKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMNumerosDeSerieKri);
end;

procedure TFMNumerosDeSerieKri.BOKClick(Sender: TObject);
begin
  Close;
end;

end.
