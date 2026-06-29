unit UFMNumerosDeSerieKriCompra;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, DBCtrls, ULFEdit, ULFLabel, ULFDBEdit;

type
  TFMNumerosDeSerieKriCompra = class(TForm)
     Label2K: TLFLabel;
     Label3K: TLFLabel;
     Label4K: TLFLabel;
     Label5K: TLFLabel;
     LCantAsignada: TLFLabel;
     LCantidad: TLFLabel;
     Label6K: TLFLabel;
     DBEArticulo: TLFDBEdit;
     DBETitulo: TLFDBEdit;
     DBGrid1: TDBGrid;
     Label1K: TLFLabel;
     Edit1: TLFEdit;
     BOK: TButton;
     procedure Edit1KeyPress(Sender: TObject; var Key: char);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGrid1DblClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
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
     Proveedor: integer;
     Linea: integer;
     NroSerieAux: string;
     procedure Muestra(emp: integer; ej: integer; can: integer; ser: string; r: integer; li: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; esc: integer);
  end;

var
  FMNumerosDeSerieKriCompra : TFMNumerosDeSerieKriCompra;

implementation

uses UDMNumerosDeSerieKriCompra, UFormGest, UFMNumeroDeSerieCompraDev;

{$R *.DFM}

procedure TFMNumerosDeSerieKriCompra.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then // presionó ENTER, tiene que grabar e´l número de serie
  begin
     with DMNumerosDeSerieKriCompra.InsertarNroSerie do
     begin
        Close;
        Params.ByName['RIG_ENT'].AsInteger := RIG;
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['NRO_SERIE'].AsString := Edit1.Text;
        Params.ByName['DEVOLUCION'].AsInteger := 0;
        Params.ByName['EJERCICIO_ENT'].AsInteger := Ejercicio;
        Params.ByName['CANAL_ENT'].AsInteger := Canal;
        Params.ByName['SERIE_ENT'].AsString := Serie;
        Params.ByName['LINEA_ENT'].AsInteger := Linea;
        Params.ByName['ALMACEN_ENT'].AsString := Almacen;
        Params.ByName['FECHA_ENT'].AsDateTime := Fecha;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        Transaction.CommitRetaining;
        FreeHandle;
     end;
     DMNumerosDeSerieKriCompra.Refrescar(empresa, articulo, ejercicio,
        canal, serie, rig, linea);
     Inc(asignados);
     LcantAsignada.Caption := IntToStr(asignados);
     if asignados = Cantidad then
        BOK.Enabled := True
     else
        BOK.Enabled := False;
  end;
end;

procedure TFMNumerosDeSerieKriCompra.Muestra(emp: integer; ej: integer; can: integer; ser: string; r: integer; li: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; esc: integer);
var
  ArtAux, DetAux : string;
  Aux : TFMNumerosDeSerieKriCompra;
  NSerieDev : TFMNumeroDeSerieCompraDev;
begin
  if (cant < 0) then
  begin
     NSerieDev := TFMNumeroDeSerieCompraDev.Create(Self);
     NSerieDev.Muestra(emp, ej, can, ser, r, li, fec, art, alm, pro, cant, False
        {Escandallo}, False {Forzar Entrada});
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
     proveedor := pro;
     cantidad := cant;
     fecha := fec;
     Caption := 'ARTICULO : ' + articulo + ' RIG : ' + IntToStr(rig) +
        ' LINEA : ' + IntToStr(linea);
     Refresh;
     LCantidad.Caption := IntToStr(Cantidad);
     DMNumerosDeSerieKriCompra.Refrescar(empresa, articulo, ejercicio,
        canal, serie, rig, linea);
     // Debo ver si cambió el articulo.
     with DMNumerosDeSerieKriCompra.xOldArticulo do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['EJERCICIO_ENT'].AsInteger := ejercicio;
        Params.ByName['CANAL_ENT'].AsInteger := canal;
        Params.ByName['SERIE_ENT'].AsString := serie;
        Params.ByName['RIG_ENT'].AsInteger := rig;
        Params.ByName['LINEA_ENT'].AsInteger := linea;
        Params.ByName['ARTICULO'].AsString := articulo;
        ExecQuery;
        if (EOF and (esc = 0) and DMNumerosDeSerieKriCompra.xEscandallo.EOF) then
           // el artículo cambió porque no lo encuentra. Debo borrar todos los nros de serie que haya.
        begin
           with DMNumerosDeSerieKriCompra.BorraNroDeSerie do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := empresa;
              Params.ByName['EJERCICIO_ENT'].AsInteger := ejercicio;
              Params.ByName['CANAL_ENT'].AsInteger := canal;
              Params.ByName['SERIE_ENT'].AsString := serie;
              Params.ByName['RIG_ENT'].AsInteger := rig;
              Params.ByName['LINEA_ENT'].AsInteger := linea;
              ExecQuery;
              Transaction.CommitRetaining;
              FreeHandle;
           end;
        end;
        FreeHandle;
     end;
     ArtAux := Articulo;
     while not DMNumerosDeSerieKriCompra.xEscandallo.EOF do
     begin
        DetAux := DMNumerosDeSerieKriCompra.xEscandalloDETALLE.AsString;
        Aux := TFMNumerosDeSerieKriCompra.Create(Self);
        Aux.Muestra(EMPRESA,
           EJERCICIO,
           CANAL,
           SERIE,
           RIG,
           LINEA,
           FECHA,
           DMNumerosDeSerieKriCompra.xEscandalloDETALLE.AsString,
           ALMACEN,
           PROVEEDOR,
           cantidad * DMNumerosDeSerieKriCompra.xEscandalloCANTIDAD.AsInteger, 1);
        Aux.Release;
        DMNumerosDeSerieKriCompra.Refrescar(empresa, ArtAux, ejercicio,
           canal, serie, rig, linea);
        DMNumerosDeSerieKriCompra.xEscandallo.First;
        while DetAux <> DMNumerosDeSerieKriCompra.xEscandalloDETALLE.AsString do
           DMNumerosDeSerieKriCompra.xEscandallo.Next;
        if not DMNumerosDeSerieKriCompra.xEscandallo.EOF then
           DMNumerosDeSerieKriCompra.xEscandallo.Next;
     end;
     with DMNumerosDeSerieKriCompra do
     begin
        xCuantosAsignados.Close;
        xCuantosAsignados.Params.ByName['EMPRESA'].AsInteger := empresa;
        xCuantosAsignados.Params.ByName['ARTICULO'].AsString := articulo;
        xCuantosAsignados.Params.ByName['EJERCICIO_ENT'].AsInteger := ejercicio;
        xCuantosAsignados.Params.ByName['CANAL_ENT'].AsInteger := canal;
        xCuantosAsignados.Params.ByName['SERIE_ENT'].AsString := serie;
        xCuantosAsignados.Params.ByName['RIG_ENT'].AsInteger := rig;
        xCuantosAsignados.Params.ByName['LINEA_ENT'].AsInteger := linea;
        xCuantosAsignados.ExecQuery;
        asignados := xCuantosAsignados.FieldByName['CANTIDAD'].AsInteger;
        xCuantosAsignados.FreeHandle;
     end;
     LCantAsignada.Caption := IntToStr(asignados);
     if (DMNumerosDeSerieKriCompra.xArticulosSERIALIZADO_KRI.AsInteger = 1) and
        (cantidad <> asignados) then
     begin
        BOK.Enabled := False;
        ShowModal;
     end;
  end;
end;

procedure TFMNumerosDeSerieKriCompra.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMNumerosDeSerieKriCompra, DMNumerosDeSerieKriCompra);
end;

procedure TFMNumerosDeSerieKriCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMNumerosDeSerieKriCompra);
  Action := caFree;
end;

procedure TFMNumerosDeSerieKriCompra.DBGrid1DblClick(Sender: TObject);
var
  rig_sal, rig_mov, devolucion : integer;
begin
  // Debe borrar el numero ingresado.
  with DMNumerosDeSerieKriCompra.xTieneMovimiento do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := empresa;
     Params.ByName['ARTICULO'].AsString := articulo;
     Params.ByName['NRO_SERIE'].AsString :=
        DMNumerosDeSerieKriCompra.NumerosDeSerieEntradosNRO_SERIE.AsString;
     ExecQuery;
     rig_sal := FieldByName['RIG_SAL'].AsInteger;
     rig_mov := FieldByName['RIG_MOV'].AsInteger;
     devolucion := FieldByName['DEVOLUCION'].AsInteger;
     FreeHandle;
  end;
  if (rig_sal = 0) and (rig_mov = 0) and (devolucion = 0) then
     with DMNumerosDeSerieKriCompra.SacarNroSerie do
     begin
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['ARTICULO'].AsString := articulo;
        Params.ByName['NRO_SERIE'].AsString :=
           DMNumerosDeSerieKriCompra.NumerosDeSerieEntradosNRO_SERIE.AsString;
        ExecQuery;
        FreeHandle;
        DMNumerosDeSerieKriCompra.Refrescar(empresa, articulo, ejercicio,
           canal, serie, rig, linea);
        Dec(asignados);
        LcantAsignada.Caption := IntToStr(asignados);
        if asignados = Cantidad then
           BOK.Enabled := True
        else
           BOK.Enabled := False;
     end
  else if rig_sal <> 0 then
     MessageDlg('Este articulo tiene Albaran de Venta Nro : ' +
        IntToStr(rig_sal), mtError, [mbOK], 0)
  else if rig_mov <> 0 then
     MessageDlg('Este articulo tiene Movimiento Nro : ' + IntToStr(
        rig_mov), mtError, [mbOK], 0)
  else if devolucion <> 0 then
     MessageDlg('Este articulo tiene Devolucion', mtError, [mbOK], 0);
end;

procedure TFMNumerosDeSerieKriCompra.FormShow(Sender: TObject);
begin
  DMNumerosDeSerieKriCompra.Refrescar(empresa, articulo, ejercicio,
     canal, serie, rig, linea);
end;

procedure TFMNumerosDeSerieKriCompra.BOKClick(Sender: TObject);
begin
  Close;
end;

end.
