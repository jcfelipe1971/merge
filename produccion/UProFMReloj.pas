unit UProFMReloj;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, UFormGest, ExtCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Menus, rxPlacemnt, idGlobalProtocols,
  FIBDataSetRO, HYFIBQuery, UFPEdit, ULFDBEdit, ULFToolBar, DateUtils, Grids,
  ULFLabel;

type
  LecturaMarcaje = array [1..50] of string;

type
  TProFMReloj = class(TG2KForm)
     Dialogo: TOpenDialog;
     TBMain: TLFToolBar;
     TButtAbrir: TToolButton;
     TButtImportar: TToolButton;
     TButtSalir: TToolButton;
     LblRecurso: TLFLabel;
     DBEDescRecurso: TLFDbedit;
     LblIncidencias: TLFLabel;
     Bevel1: TBevel;
     LblParametro: TLFLabel;
     DBLCBRecurso: TDBLookupComboBox;
     LblResumen: TLFLabel;
     LblRegTotal: TLFLabel;
     LblRegCorrecto: TLFLabel;
     LblRegIncorr: TLFLabel;
     LblRegTot: TLFLabel;
     LblRegCor: TLFLabel;
     LblRegInc: TLFLabel;
     TSep1: TToolButton;
     Bevel2: TBevel;
     TextoPre: TListBox;
     Texto: TListBox;
     LblReloj: TLFLabel;
     LblTipoReloj: TLFLabel;
     LVIncidencia: TListView;
     PMVerInc: TPopupMenu;
     VerFicheroIncidencias: TMenuItem;
     FormStorage: TFormStorage;
     PMAbrir: TPopupMenu;
     MIAbrirMarc: TMenuItem;
     MIAbrirInc: TMenuItem;
     SGDetalle: TStringGrid;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtAbrirClick(Sender: TObject);
     procedure TButtImportarClick(Sender: TObject);
     procedure VerFicheroIncidenciasClick(Sender: TObject);
     procedure DBLCBRecursoChange(Sender: TObject);
  private
     { Private declarations }
     //FUNCIONES EXCLUSIVAS DE 'MARCAJES POR PARES'
     procedure MarcajesPares;
     procedure BuscarRegistroTratar(DataSet: TFIBDataSetRO; var numcab: integer; operari, tarea: integer; fecha: string; var CabInsertada: boolean; var Linea: integer);
     procedure SelecColPares(tipo: integer; CabInsertada: boolean; Linea: integer; var ColumnasInsertar: string; var CamposInsertar: string; var CamposModificar: string; var Hora: real);
     procedure InsertarDetalle(ColumnasInsertar, CamposInsertar, Recurso: string; Cont, Linea, LineaFase, OrdenProd, LineaTarea, SubOrden: integer; var NumCab: integer; PrecioUni: real; QTipoMarca: TFIBDataSetRO; QGeneral: THYFIBQuery);
     procedure ActualizarDetalle(CamposModificar, Recurso, IDTarea: string; n, LineaFase, OrdenProd, LineaTarea, SubOrden: integer; var numcab: integer; PrecioUni: real; QTipoMarca, QMGeneral: TFIBDataSetRO);
     function ComprobarDatos(Tipo, Rig, Linea, Rig_Of, Suborden, Linea_Fase, Linea_Tarea, Recurso, Lineaproces: string; Actualizar: integer): boolean;

     //FUNCIONES EXCLUSIVAS DE 'MARCAJES POR JORNADA'
     procedure MarcajesJornada;
     procedure GuardarDatos;
     function ComprobarOpeMaqError(Lista: TStringList; OpeMaq: string): boolean;
     function BuscaCampo(Campo: string): integer;
     procedure Asigna(DatosLinea: LecturaMarcaje; FechaIni, FechaFin: TDateTime; HoraIni, HoraFin, HoraMarcaje: real; TipoM, OpeMaq, Calendario: string; NumMarcaje, Linea, IdOrden, OrdenProd, Suborden, LineaFase, LineaTarea: integer; Recurso: string; PrecioUni: real);
     procedure AsignaHora(DatosLinea: LecturaMarcaje; HoraIni, HoraFin, HoraMarcaje: real; TipoM, ColumnasInsertar, CamposInsertar, CamposModificar: string; NumMarcaje, Linea, IdOrden, OrdenProd, SubOrden, LineaFase, LineaTarea: integer; idtarea, Recurso: string; PrecioUni: real);
     procedure AsignaDia(DatosLinea: LecturaMarcaje; HoraIni, HoraFin, HoraMarcaje: real; ColumnasInsertar, CamposInsertar, CamposModificar: string; NumMarcaje, Linea, IdOrden, OrdenProd, Suborden, LineaFase, LineaTarea: integer; idtarea, TipoM, Recurso: string; PrecioUni: real);
     procedure SelecColJornada(CabInsertada, ModoUpdate: boolean; Linea, IdOrden: integer; var ColumnasInsertar: string; var CamposInsertar: string; var CamposModificar: string; var Hora: real);
     {    procedure SelecRecursoOpe(operario: String; var Recurso_Imputacion: String;
      var PrecioUni: Real);
    function BusquedaMarcatge(DatosLinea: LecturaMarcaje): real; NO SE UTILIZA
      }

     //FUNCIONES DE 'MARCAJES POR PARES' y 'MARCAJES POR JORNADA'
     function ConversionFecha(Tipo: integer; Fecha: string; Formato: integer): string;
     procedure InsertarIncidencias(Linea, TipoError: string);
     function CalcTiempo(HoraIni, HoraFin: real): string;
     procedure EscribeFicheroMarcajes(NombreFichero: string; TipoFichero: integer);
     procedure EscribeFicheroIncidencias;
     function BuscarNumLView(Num: integer; Lista: TListView): boolean;
  public
     { Public declarations }
     ListaOpeMaqError: TStringList;
     Configuracion: integer; //Asignado desde ProFMSelecReloj
     ModoMarcaje: smallint;  //Asignado desde ProFMSelecReloj
     TipoMarcajes: array [1..10] of string; //En marcajes jornada, no funciona y no se usa.
     PosFecha: integer;
     NombreFicheroIncidencias: string; //Usado en ProDMVerIncidencias
  end;

var
  ProFMReloj : TProFMReloj;

implementation

uses UFMain, UDMMain, UProDMReloj, UEntorno,
  UProFMSelecReloj, UProFMVerIncidencias, UOpeDMHorario, DB, UUtiles;

{$R *.dfm}

procedure TProFMReloj.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMReloj, ProDMReloj);
  LVIncidencia.Enabled := False;
  TButtImportar.Enabled := False;
  VerFicheroIncidencias.Enabled := False;
end;

procedure TProFMReloj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMReloj);
  Action := caFree;
end;

procedure TProFMReloj.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMReloj.TButtAbrirClick(Sender: TObject);
var
  n, m, NumReg : smallint;
  Archivo, Carpeta : string;
begin
  LVIncidencia.Items.Clear;

  SGDetalle.ColCount := 2;
  SGDetalle.RowCount := 2;
  SGDetalle.FixedCols := 1;
  SGDetalle.FixedRows := 1;
  SGDetalle.Enabled := True;

  //Creo el formulari
  ProFMSelecReloj := TProFMSelecReloj.Create(Self);
  ProFMSelecReloj.ShowModal;

  //Muestro las columnas de la configuracion, si lo selecciono
  ProDMReloj.xConfigCab.Close;
  ProDMReloj.xConfigCab.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  ProDMReloj.xConfigCab.Params.ByName['RIG'].AsInteger := Configuracion;
  ProDMReloj.xConfigCab.Open;

  if (Configuracion <> 0) then
  begin
     LblRegTot.Caption := '0';
     LblRegCor.Caption := '0';
     LblRegInc.Caption := '0';

     TextoPre.Items.Clear;
     // Si abrimos un fichero de marcajes, lo hacemos en la carpeta de Ruta
     // y si lo hacemos de un fichero de incidencias, lo hacemos de la carpeta de Incidencias
     if (Sender is TMenuItem) then
     begin
        if (Sender as TMenuItem).Name = 'MIAbrirMarc' then
           Carpeta := ProDMReloj.xConfigCabRUTA.AsString
        else
           Carpeta := ProDMReloj.xConfigCabRUTAINC.AsString;
     end
     else // Por defecto se hara desde la carpeta de marcajes (si no desplegamos el menu)
        Carpeta := ProDMReloj.xConfigCabRUTA.AsString;

     // Número de registros en la tabla de configuración
     ProDMReloj.xConfigDet.Last;
     NumReg := ProDMReloj.xConfigDet.RecordCount;

     //Ponemos el número de columnas, tantas como registros
     SGDetalle.ColCount := NumReg + 1;

     //Ponemos el nombre a cada columna
     SGDetalle.Rows[0].Strings[0] := 'Linea';
     ProDMReloj.xConfigDet.First;
     for n := 0 to NumReg - 1 do
     begin
        SGDetalle.Rows[0].Strings[n + 1] := ProDMReloj.xConfigDetCAMPO.AsString;
        ProDMReloj.xConfigDet.Next;
     end;

     if MyOpenDialog(Archivo, '', Carpeta) then
     begin
        LblTipoReloj.Caption := LblTipoReloj.Caption + '- Fichero: ' + Archivo + ' -';
        // Cargamos los datos del fichero en la lista TextoPre
        TextoPre.Items.LoadFromFile(Archivo);

        // Ponemos los datos de la lista a las filas/columnas correspondientes del StringGrid
        SGDetalle.RowCount := TextoPre.Items.Count + 1;
        for n := 0 to TextoPre.Items.Count - 1 do
        begin
           ProDMReloj.xConfigDet.First;

           // Ponemos el numero de linea en la primera columna
           SGDetalle.Rows[n + 1].Strings[0] := IntToStr(n + 1);

           // Ponemos los datos de cada marcaje en su celda correspondiente
           for m := 0 to NumReg do
           begin
              SGDetalle.Rows[n + 1].Strings[m + 1] :=
                 Copy(TextoPre.Items.Strings[n], ProDMReloj.xConfigDetLONG_INI.AsInteger,
                 ProDMReloj.xConfigDetLONG_FIN.AsInteger - ProDMReloj.xConfigDetLONG_INI.AsInteger + 1);

              ProDMReloj.xConfigDet.Next;
           end;
        end;// fin for

        LblRegTot.Caption := IntToStr(TextoPre.Items.Count);
        TButtImportar.Enabled := True;
     end;// fin if
  end;// fin if configuracion
end;

procedure TProFMReloj.TButtImportarClick(Sender: TObject);
begin
  if (ModoMarcaje = 0) then
     MarcajesPares    //Si Modo=0 -> MarcajesPares
  else
     MarcajesJornada; //Si Modo=1 -> MarcajesJornada
end;

procedure TProFMReloj.VerFicheroIncidenciasClick(Sender: TObject);
begin
  ProFMVerFicheroInc := TProFMVerFicheroInc.Create(Self);
  ProFMVerFicheroInc.ShowModal;
end;

procedure TProFMReloj.DBLCBRecursoChange(Sender: TObject);
begin
  ProDMReloj.xDescRecurso.Close;
  ProDMReloj.xDescRecurso.Params.ByName['Empresa'].Value := REntorno.Empresa;
  ProDMReloj.xDescRecurso.Params.ByName['Recurso'].Value := DBLCBRecurso.Text;
  ProDMReloj.xDescRecurso.Open;
end;

//FUNCIONES EXCLUSIVAS DE 'MARCAJES POR PARES'
procedure TProFMReloj.MarcajesPares;
var
  n, j, col, z, tareamarcaje, numcab, lineafase, IdOrden, ordenprod, lineatarea, suborden, linea : integer;
  PrecioUni, aux : real;
  recurso, opemaq, calendario : string;
  valor, cabinsertada{, verdatos} : boolean;
  FechaMarcaje, CamposModificar, ColumnasInsertar, CamposInsertar : string;
begin
  Linea := 0;
  // VerDatos := False;

  //Selecciono la posició dels marcatges i de la data
  ProDMReloj.SeleccionMarcajesYFecha;

  //Mentres no m'acabi l'array, agafaré les dades de la taula de configuració
  //i recorreré el fitxer tants cops com linies hi hagin
  //Monto la capçalera i per cada una els seu detall
  //ARA NOMÉS VA PER OPERARI

  n := 1;
  while (n < SGDetalle.RowCount) do
  begin
     j := 1;
     ProDMReloj.xConfigDet.First;
     CabInsertada := False;
     NumCab := 0;
     //    FechaMarcaje := ConversionFecha(0,LVDetall.Items[n].SubItems[PosFecha - 1],0);
     FechaMarcaje := ConversionFecha(0, SGDetalle.Rows[n].Strings[PosFecha - 1], 0);

     //A partir del codi de targeta, busco el número d'operari que és
     if (ProDMReloj.SelecOpeMaq(SGDetalle.Rows[n].Strings[StrToInt(tipomarcajes[j]) - 1],
        ProDMReloj.xConfigCabTIPORECURSO.AsString, opemaq, calendario) = False) then
     begin //Poso la linea a incidencies
        InsertarIncidencias(IntToStr(n), _('NO existe el código de targeta ') + SGDetalle.Rows[n].Strings[StrToInt(tipomarcajes[j]) - 1]);   //idioma_code
        //Repassar
        {VerDatos := True; No se utiliza}
        Inc(n);
        continue;
     end;

     //Si no existeix l'operario, máquina, proveeïdor o varis, insertarà la capçalera
     if (ProDMReloj.HayCabMarcaje(Opemaq, FechaMarcaje, ProDMReloj.xConfigCabTIPORECURSO.AsString, 0) <> True) then
     begin
        //Llegeixo les dades de la taula i camp fisic per poder crear la capçalera
        numcab := ProDMReloj.CreaCabMarcaje(OpeMaq,
           Trim(ProDMReloj.xConfigDetTABLA_FISICA.AsString),
           Trim(ProDMReloj.xConfigDetCAMPO_FISICO.AsString),
           ProDMReloj.xConfigDetTIPOMARC.AsString, FechaMarcaje);
        CabInsertada := True;
     end;

     //MONTO EL DETALL
     valor := False;
     col := 1;
     while (col <= SGDetalle.ColCount - 1) do
     begin
        //Miro si la columna que es 'col' existeix dins de l'array on hi han les
        //possibles columnes capçaleres i que pel detall no serveixen
        if ((col <= 10) and (col <> 0)) then
           for z := 1 to 10 do
           begin
              if (IntToStr(col) = tipomarcajes[z]) then
              begin
                 valor := True;
                 Break;
              end //fi if
              else
                 valor := False;
           end; //fi for

        //Tractament del detall.....
        if (valor) then
        begin
           //Seleccion del operario o la maquina
           ProDMReloj.SelecOpeMaq(SGDetalle.Rows[n].Strings[StrToInt(tipomarcajes[col]) - 1],
              ProDMReloj.xConfigCabTIPORECURSO.AsString, opemaq, calendario);

           //Aqui hauré de, a partir de les dades de la capçalera (operari)
           //buscar en el seu detall la tarea i les dades per veure si ja existeix.
           //Si és així, hauré de posar-li la hora final i sinó existeix, l'hauré de insertar
           //amb la hora inicial

           //Poso dins d'una variable la columna on està el camp TAREA
           with ProDMReloj.QMGeneral do
           begin
              Close;
              SelectSQL.Clear;
              SelectSQL.Add('select orden,tabla_fisica,campo_fisico from pro_config_det_marca');
              SelectSQL.Add('where rig=:configuracion and campo_fisico=' + '''' + 'IDTAREA' + '''');
              Params[0].AsInteger := Configuracion;
              Open;
              TareaMarcaje := Fields[0].AsInteger;
           end;
           //Busco el registre que s'ha de tractar. Depen de si ja té una capçalera o no.
           if ((NumCab = 0) and (opemaq <> '')) then
              BuscarRegistroTratar(ProDMReloj.QMGeneral, NumCab,
                 //            StrToInt(Operario), StrToInt(LVDetall.Items[n].SubItems[TareaMarcaje - 1]),
                 StrToInt(OpeMaq), StrToInt(SGDetalle.Rows[n].Strings[TareaMarcaje - 1]),
                 FechaMarcaje, CabInsertada, Linea);
           //Si hi ha número de capçalera, és a dir, si ha registre a tractar, busco les dades associades a aquell IDTarea
           if (NumCab > 0) then
           begin
              LineaFase := 0;
              OrdenProd := 0;
              LineaTarea := 0;
              SubOrden := 0;
              Recurso := '';
              PrecioUni := 0;
              //Li paso el IDTarea i m'ha de retornar la lineafase i la ordreprod
              //          if (RecogerDatosIdTarea(StrToInt(LVDetall.Items[n].SubItems[TareaMarcaje - 1]),
              if (ProDMReloj.RecogerDatosIdTarea(StrToInt(SGDetalle.Rows[n].Strings[TareaMarcaje - 1]),
                 IdOrden, OrdenProd, LineaFase, LineaTarea, SubOrden, Recurso, PrecioUni) = False) then
                 ShowMessage(_('IDTarea ya cerrada o inexistente')); //idioma_code

              //Selecciono les columnes a insertar o modificar
              if (CabInsertada = True) then
              begin
                 SelecColPares(0, CabInsertada, n, ColumnasInsertar,
                    CamposInsertar, CamposModificar, aux);
                 InsertarDetalle(ColumnasInsertar, CamposInsertar,
                    Recurso, n, Linea, LineaFase, OrdenProd, LineaTarea, SubOrden, numcab,
                    PrecioUni, ProDMReloj.xConfigDet, ProDMReloj.QGeneral);
              end
              else
              begin
                 SelecColPares(1, CabInsertada, n, ColumnasInsertar,
                    CamposInsertar, CamposModificar, aux);
                 ActualizarDetalle(CamposModificar, Recurso,
                    //              LVDetall.Items[n].SubItems[TareaMarcaje - 1], n, LineaFase, OrdenProd,
                    SGDetalle.Rows[n].Strings[TareaMarcaje - 1], n, LineaFase, OrdenProd,
                    LineaTarea, SubOrden, numcab, PrecioUni, ProDMReloj.xConfigDet, ProDMReloj.QMGeneral);
              end;
           end;
        end;//fi if

        Inc(col);
     end;//fi while detall
     ProDMReloj.xConfigDet.Next;
     Inc(n);
     //inc(j);
  end;//fi while capçalera

  if (LVIncidencia.Items.Count = 0) then
  begin
     ShowMessage(_('Proceso finalizado y sin errores'));//idioma_code
     CopyFileTo(Dialogo.FileName, ProDMReloj.xConfigCabRUTADEST.AsString +
        '\' + ExtractFileName(Dialogo.FileName));
  end
  else
  begin
     ShowMessage(_('Proceso finalizado y con errores. Se ha generado fichero de incidencias'));   //idioma_code
     //Paso els marcatges passats correctament a la carpeta de destí
     EscribeFicheroMarcajes(ProDMReloj.xConfigCabRUTADEST.AsString +
        '\' + ExtractFileName(Dialogo.FileName), 1);

     //Escric en un arxiu les incidències, que són els que no han passat
     EscribeFicheroIncidencias;
  end;

  TButtImportar.Enabled := False;
end;

//Servirà per buscar el registre de la bdd a tractar i decidir si s'ha de insertar o modificar
procedure TProFMReloj.BuscarRegistroTratar(DataSet: TFIBDataSetRO; var numcab: integer; operari, tarea: integer; fecha: string; var CabInsertada: boolean; var Linea: integer);
begin
  //Selecciono les linees que coincideixen amb aquesta TAREA. Només entrarà quan NO estigui insertant capçalera
  if (NumCab = 0) then
  begin
     with ProDMReloj.QMGeneral do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(
           'select det.rig,det.linea_tarea,det.hora_inicio,det.hora_fin,det.linea from pro_ord_det_marca det');
        SelectSQL.Add(
           'join pro_ord_cab_marca cab on (cab.empresa=det.empresa and cab.ejercicio=det.ejercicio and cab.canal=det.canal');
        SelectSQL.Add('and cab.serie=det.serie and cab.tipo=det.tipo and cab.rig=det.rig)');
        SelectSQL.Add('where cab.operario=:operario and cab.fecha=:fecha and det.idtarea=:tarea');
        SelectSQL.Add('order by det.linea_tarea asc');
        Params.ByName['operario'].AsInteger := Operari;
        Params.ByName['fecha'].AsString := Fecha;
        Params.ByName['tarea'].AsInteger := Tarea;
        Open;
        numcab := Fields[0].AsInteger;
        //Recorraré tota la consulta, per veure si n'hi algún que no té hora final.
        //Llavors l'actual serà una inserció i no modificació
        First;
        while EOF <> True do
        begin
           if (Fields[3].AsInteger > 0) then
           begin
              CabInsertada := True;  //insert
              Next;
           end
           else
           begin
              CabInsertada := False;   //update
              Break;
           end;
        end;

        //Si inserto busco el número de linea més gran per Asignar-li el següent
        if ((numcab > 0) and (CabInsertada = True)) then
        begin
           ProDMReloj.QGeneral.Close;
           ProDMReloj.QGeneral.SQL.Clear;
           ProDMReloj.QGeneral.SQL.Add('select max(linea) from pro_ord_det_marca');
           ProDMReloj.QGeneral.SQL.Add('where rig=:rig');
           ProDMReloj.QGeneral.Params.ByName['rig'].AsInteger := NumCab;
           ProDMReloj.QGeneral.ExecQuery;
           Linea := ProDMReloj.QGeneral.Fields[0].AsInteger;
           ;
           //conto el número de linies de l aconsulta, per saber el número de linea de la inserció
        end; // fi if
     end;   //fi if principal

     //Si encara Numcab=0, voldrà dir que estic insertant un detall nou a aquella capçalera
     if (numcab = 0) then
     begin
        with ProDMReloj.QMGeneral do
        begin
           //Busco el rig d'aquell operari i per aquella data, ja que hi ha capçalera però no té cap detall
           Close;
           SelectSQL.Clear;

           SelectSQL.Add('select rig from pro_ord_cab_marca');
           SelectSQL.Add(
              'where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and serie=:serie and tipo=:tipo and operario=:operario and fecha=:fecha');
           Params.ByName['empresa'].AsInteger := REntorno.Empresa;
           Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
           Params.ByName['canal'].AsInteger := REntorno.Canal;
           Params.ByName['Serie'].AsString := REntorno.Serie;
           Params.ByName['tipo'].AsString := 'MO';//Només per operari
           Params.ByName['operario'].AsInteger := Operari;
           Params.ByName['fecha'].AsString := Fecha;
           Open;
           numcab := Fields[0].AsInteger;

           //Si ha trobat rig, busco la linea més alta d'aquell operari en aquella data
           if (numcab > 0) then
           begin
              ProDMReloj.QGeneral.Close;
              ProDMReloj.QGeneral.SQL.Clear;
              ProDMReloj.QGeneral.SQL.Add('select max(linea) from pro_ord_det_marca');
              ProDMReloj.QGeneral.SQL.Add('where rig=:rig');
              ProDMReloj.QGeneral.Params.ByName['rig'].AsInteger := NumCab;
              ProDMReloj.QGeneral.ExecQuery;
              Linea := ProDMReloj.QGeneral.Fields[0].AsInteger;
              ;
              //conto el número de linies de la consulta, per saber el número de linea de la inserció
           end; //fi if
           CabInsertada := True;
        end; //fi with
     end;   //fi if principal
  end;
end;//fi procedure

//Aquesta procedure seleccionarà les columnes a insertar, tant si estic actualitzant o insertant un registre
//nou al detall a marcatges per parelles
procedure TProFMReloj.SelecColPares(tipo: integer; CabInsertada: boolean; Linea: integer; var ColumnasInsertar: string; var CamposInsertar: string; var CamposModificar: string; var Hora: real);
var
  Tiempo : string;
  QColumnes : TFIBDataSetRO;
begin
  ColumnasInsertar := '';
  CamposModificar := '';
  CamposInsertar := '';

  //Selecciono només la configuració de la capçalera de la máquina que estem fent servir
  //per recollir els marcatges
  with ProDMReloj.QMGeneral do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('select orden,campo,tabla_fisica,campo_fisico from pro_config_det_marca');
     SelectSQL.Add('where empresa=:empresa and rig=:configuracion and tabla_fisica=:tablafisica');
     SelectSQL.Add('order by orden asc');

     Params[0].AsInteger := REntorno.Empresa;
     Params[1].AsInteger := Configuracion;
     Params[2].AsString := 'PRO_ORD_DET_MARCA';
     Open;
  end;

  QColumnes := ProDMReloj.QMGeneral;
  QColumnes.First;

  //********************* INSERTAR EL DETALL, QUANT ESTIC INSERTANT CAPÇALERA *********************//
  if (Tipo = 0) then
  begin
     while QColumnes.EOF <> True do
     begin
        QColumnes.Next;
        if QColumnes.EOF = False then
        begin
           QColumnes.Prior;
           //Agafo el camp fisic
           ColumnasInsertar := ColumnasInsertar +
              Trim(QColumnes.Fields[3].AsString) + ',';
           //Agafo el valor del camp
           if (Trim(QColumnes.Fields[3].AsString) = 'HORA_INICIO') then
              Hora := StrToFloat(Trim(SGDetalle.Rows[Linea].Strings[QColumnes.Fields[0].AsInteger]));

           if (Trim(QColumnes.Fields[3].AsString) = 'RECURSO') then
              CamposInsertar := CamposInsertar + '''' +
                 Trim(SGDetalle.Rows[Linea].Strings[QColumnes.Fields[0].AsInteger]) + '''' + ','
           else
              CamposInsertar := CamposInsertar +
                 Trim(SGDetalle.Rows[Linea].Strings[QColumnes.Fields[0].AsInteger]) + ',';
        end
        else
        begin
           ColumnasInsertar := ColumnasInsertar + Trim(QColumnes.Fields[3].AsString);
           CamposInsertar := CamposInsertar +
              Trim(SGDetalle.Rows[Linea].Strings[QColumnes.Fields[0].AsInteger]);
        end;

        QColumnes.Next;
     end; //fi while
  end;   //fi if=0

  //********************* ACTUALITZAR EL DETALL, QUANT ESTIC MODIFICANT ***************//
  if (Tipo = 1) then
  begin
     CamposModificar := 'set ';
     //Monto l'string amb tots els camps de la taula de configuració i els seus valors per fer-la
     //servir al update
     while QColumnes.EOF <> True do
     begin
        //Agafo el camp fisic
        if (Trim(QColumnes.Fields[3].AsString) = 'HORA_INICIO') then
        begin
           CamposModificar := CamposModificar + 'HORA_FIN' + '=';
           //Calculamos el tiempo entre HoraFin-HoraIni
           Tiempo := CalcTiempo(ProDMReloj.QMGeneral.Fields[2].AsFloat, StrToFloat(SGDetalle.Rows[Linea].Strings[QColumnes.Fields[0].AsInteger]));
        end
        else
           CamposModificar := CamposModificar + Trim(QColumnes.Fields[3].AsString) + '=';
        //Agafo el valor del camp
        QColumnes.Next;
        if QColumnes.EOF = False then
        begin
           QColumnes.Prior;
           if (Trim(QColumnes.Fields[3].AsString) = 'RECURSO') then
              CamposModificar := CamposModificar + '''' +
                 Trim(SGDetalle.Rows[Linea].Strings[QColumnes.Fields[0].AsInteger]) + '''' + ','
           else
              CamposModificar := CamposModificar +
                 Trim(SGDetalle.Rows[Linea].Strings[QColumnes.Fields[0].AsInteger]) + ',';
        end
        else
           CamposModificar := CamposModificar +
              Trim(SGDetalle.Rows[Linea].Strings[QColumnes.Fields[0].AsInteger]);

        QColumnes.Next;
     end;//fi while

     if (CabInsertada = False) then
        CamposModificar := CamposModificar + ',TIEMPO=' + Tiempo;
  end;//fi if=1
end;

//Insertar el detall nou a la base de dades
procedure TProFMReloj.InsertarDetalle(ColumnasInsertar, CamposInsertar, Recurso: string; Cont, Linea, LineaFase, OrdenProd, LineaTarea, SubOrden: integer; var NumCab: integer; PrecioUni: real; QTipoMarca: TFIBDataSetRO; QGeneral: THYFIBQuery);
var
  VerDatos : boolean;
begin
  //Actualitzo els camps de la fila afectada, que és la que coincideix amb la tarea o inserto si estic
  //insertant un capçalera
  VerDatos := ComprobarDatos(QTipoMarca.Fields[2].AsString,
     IntToStr(numcab), IntToStr(Linea + 1), IntToStr(OrdenProd),
     IntToStr(SubOrden), IntToStr(LineaFase), IntToStr(LineaTarea), Recurso,
     SGDetalle.Rows[cont].Strings[0], 0);

  if (VerDatos = False) then
  begin
     with QGeneral do
     begin
        Close;
        SQL.Clear;
        SQL.Add('insert into pro_ord_det_marca (empresa,ejercicio,canal,serie,tipo,rig,linea,rig_of,suborden,linea_fase,linea_tarea,recurso,precio_recurso,' + ColumnasInsertar + ')');
        SQL.Add('values (' + IntToStr(REntorno.Empresa) + ',' +
           IntToStr(REntorno.Ejercicio) + ',' + IntToStr(REntorno.Canal) + ',' +
           '''' + REntorno.Serie + '''' + ',' + '''' + QTipoMarca.Fields[2].AsString + '''' + ',' +
           IntToStr(numcab) + ',' + IntToStr(Linea + 1) +
           ',' + IntToStr(OrdenProd) + ',' + IntToStr(SubOrden) + ',' +
           IntToStr(LineaFase) + ',' + IntToStr(LineaTarea) + ',' + '''' + Recurso +
           '''' + ',' + FloatToStr(PrecioUni) + ',' + CamposInsertar + ')');
        Prepare;
        ExecQuery;
     end;
  end;        //fi if
  numcab := 0;//el poso a 0 per asegurarme qu eno tornarà a entrar (NOMÉS AMB OPERARI)
end;

//Actualitza un detall ja existent
procedure TProFMReloj.ActualizarDetalle(CamposModificar, Recurso, IDTarea: string; n, LineaFase, OrdenProd, LineaTarea, SubOrden: integer; var numcab: integer; PrecioUni: real; QTipoMarca, QMGeneral: TFIBDataSetRO);
var
  VerDatos : boolean;
begin
  VerDatos := ComprobarDatos(QTipoMarca.Fields[2].AsString, IntToStr(numcab),
     IntToStr(0), IntToStr(OrdenProd), IntToStr(SubOrden), IntToStr(LineaFase),
     IntToStr(LineaTarea), Recurso, SGDetalle.Rows[n].Strings[0], 1);

  if (VerDatos = False) then
  begin
     with ProDMReloj.QGeneral do
     begin
        Close;
        SQL.Clear;
        SQL.Add('update pro_ord_det_marca');
        SQL.Add(CamposModificar);
        SQL.Add('where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and serie=:serie and tipo=:tipomarc and rig=' + IntToStr(numcab) + ' and rig_of=' + IntToStr(OrdenProd) + ' and linea=' +
           QMGeneral.Fields[4].AsString + ' and idtarea=' + IDTarea);

        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Serie'].AsString := REntorno.Serie;
        Params.ByName['TipoMarc'].AsString := 'MO';
        Prepare;
        ExecQuery;
     end;
  end;        // fi if
  numcab := 0;//el poso a 0 per asegurarme qu eno tornarà a entrar (NOMÉS AMB OPERARI)
end;

//Comprovará los datos antes de la inserción. Si devuelve True, se insertará, i si devuelve
//False, ese marcaje pasará a Incidencias
function TProFMReloj.ComprobarDatos(Tipo, Rig, Linea, Rig_Of, Suborden, Linea_Fase, Linea_Tarea, Recurso, Lineaproces: string; Actualizar: integer): boolean;
var
  error : boolean;
begin
  Error := False;

  if (Actualizar = 0) then
  begin
     //1.- Comprovar PK de la tabla Pro_ord_det_marca
     ProDMReloj.QComprobarDatos.Close;
     ProDMReloj.QComprobarDatos.SQL.Clear;
     ProDMReloj.QComprobarDatos.SQL.Add('select count(*) from pro_ord_det_marca');
     ProDMReloj.QComprobarDatos.SQL.Add(
        'where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and serie=:serie and tipo=:tipo and rig=:rig and linea=:linea and rig_of=:rig_of');
     ProDMReloj.QComprobarDatos.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ProDMReloj.QComprobarDatos.Params.ByName['Ejercicio'].AsInteger :=
        REntorno.Ejercicio;
     ProDMReloj.QComprobarDatos.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ProDMReloj.QComprobarDatos.Params.ByName['Serie'].AsString := REntorno.Serie;
     ProDMReloj.QComprobarDatos.Params.ByName['Tipo'].AsString := Tipo;
     ProDMReloj.QComprobarDatos.Params.ByName['Rig'].AsInteger := StrToInt(Rig);
     ProDMReloj.QComprobarDatos.Params.ByName['Linea'].AsInteger := StrToInt(Linea);
     ProDMReloj.QComprobarDatos.Params.ByName['Rig_Of'].AsInteger := StrToInt(Rig_Of);
     ProDMReloj.QComprobarDatos.ExecQuery;

     if (ProDMReloj.QComprobarDatos.Fields[0].AsInteger > 0) then
     begin
        //Poso la linea
        InsertarIncidencias(Lineaproces, _('Duplicación de la PK'));
        Error := True;
     end;
  end;

  //4.-Comprovar la existencia de la Tarea en la Orden de fabricación i la suborden
  ProDMReloj.QComprobarDatos.Close;
  ProDMReloj.QComprobarDatos.SQL.Clear;
  ProDMReloj.QComprobarDatos.SQL.Add('select count(*) from pro_ord_tarea');
  ProDMReloj.QComprobarDatos.SQL.Add(
     'where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and serie=:serie and rig_of=:rig_of and suborden=:suborden and linea_fase=:lineafase and linea_tarea=:lineatarea');
  ProDMReloj.QComprobarDatos.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  ProDMReloj.QComprobarDatos.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
  ProDMReloj.QComprobarDatos.Params.ByName['Canal'].AsInteger := REntorno.Canal;
  ProDMReloj.QComprobarDatos.Params.ByName['Serie'].AsString := REntorno.Serie;
  ProDMReloj.QComprobarDatos.Params.ByName['Rig_of'].AsInteger := StrToInt(Rig_Of);
  ProDMReloj.QComprobarDatos.Params.ByName['Suborden'].AsInteger := StrToInt(SubOrden);
  ProDMReloj.QComprobarDatos.Params.ByName['LineaFase'].AsInteger :=
     StrToInt(Linea_Fase);
  ProDMReloj.QComprobarDatos.Params.ByName['LineaTarea'].AsInteger :=
     StrToInt(Linea_Tarea);
  ProDMReloj.QComprobarDatos.ExecQuery;

  if (ProDMReloj.QComprobarDatos.Fields[0].AsInteger = 0) then
  begin
     InsertarIncidencias(lineaproces, _('NO existe la Tarea para esa OF')); //idioma_code
     Error := True;
  end
  else
  begin
     //3.-Comprovar la existencia de la Fase en la Orden de fabricación i la suborden
     ProDMReloj.QComprobarDatos.Close;
     ProDMReloj.QComprobarDatos.SQL.Clear;
     ProDMReloj.QComprobarDatos.SQL.Add('select count(*) from pro_ord_fases');
     ProDMReloj.QComprobarDatos.SQL.Add(
        'where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and series=:serie and rig_of=:rig_of and suborden=:suborden and linea_fase=:lineafase');
     ProDMReloj.QComprobarDatos.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ProDMReloj.QComprobarDatos.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ProDMReloj.QComprobarDatos.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ProDMReloj.QComprobarDatos.Params.ByName['Serie'].AsString := REntorno.Serie;
     ProDMReloj.QComprobarDatos.Params.ByName['Rig_of'].AsInteger := StrToInt(Rig_Of);
     ProDMReloj.QComprobarDatos.Params.ByName['Suborden'].AsInteger := StrToInt(SubOrden);
     ProDMReloj.QComprobarDatos.Params.ByName['LineaFase'].AsInteger :=
        StrToInt(Linea_Fase);
     ProDMReloj.QComprobarDatos.ExecQuery;

     if (ProDMReloj.QComprobarDatos.Fields[0].AsInteger = 0) then
     begin
        InsertarIncidencias(lineaproces, _('NO existe la Fase para esa OF'));   //idioma_code
        Error := True;
     end
     else
     begin
        //2.-Comprovar la existencia de la Orden de Fabricación
        ProDMReloj.QComprobarDatos.Close;
        ProDMReloj.QComprobarDatos.SQL.Clear;
        ProDMReloj.QComprobarDatos.SQL.Add('select count(*) from pro_ord');
        ProDMReloj.QComprobarDatos.SQL.Add(
           'where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and series=:serie and rig_of=:rig_of and suborden=:suborden');
        ProDMReloj.QComprobarDatos.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        ProDMReloj.QComprobarDatos.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        ProDMReloj.QComprobarDatos.Params.ByName['Canal'].AsInteger := REntorno.Canal;
        ProDMReloj.QComprobarDatos.Params.ByName['Serie'].AsString := REntorno.Serie;
        ProDMReloj.QComprobarDatos.Params.ByName['Rig_of'].AsInteger := StrToInt(Rig_Of);
        ProDMReloj.QComprobarDatos.Params.ByName['Suborden'].AsInteger := StrToInt(SubOrden);
        ProDMReloj.QComprobarDatos.Prepare;
        ProDMReloj.QComprobarDatos.ExecQuery;

        if (ProDMReloj.QComprobarDatos.Fields[0].AsInteger = 0) then
        begin
           InsertarIncidencias(lineaproces, _('NO existe la Orden de Fabricación'));   //idioma_code
           Error := True;
        end
        else
        begin //5.-Comprovar la existencia del Recurso
           ProDMReloj.QComprobarDatos.Close;
           ProDMReloj.QComprobarDatos.SQL.Clear;
           ProDMReloj.QComprobarDatos.SQL.Add('select count(*) from pro_ord_tarea');
           ProDMReloj.QComprobarDatos.SQL.Add('where empresa=:empresa and recurso=:recurso');
           ProDMReloj.QComprobarDatos.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
           ProDMReloj.QComprobarDatos.Params.ByName['Recurso'].AsString := Recurso;
           ProDMReloj.QComprobarDatos.ExecQuery;

           if (ProDMReloj.QComprobarDatos.Fields[0].AsInteger = 0) then
           begin
              InsertarIncidencias(lineaproces, _('NO existe el recurso'));//idioma_code
              Error := True;
           end;
        end;
     end;
  end;

  //Retorno el valor a la funció
  ComprobarDatos := Error;

  if (Error = False) then
     LblRegCor.Caption := IntToStr(StrToInt(LblRegCor.Caption) + 1);

  {  if (Error = True) then   //Si hi ha algun error
  begin
    LblRegInc.Caption := IntToStr(StrToInt(LblRegInc.Caption) + 1);
    //BotonInc.Enabled := True;
    LVIncidencia.Enabled := True;
  end
  else  //si no n'hi ha cap
  begin
    LblRegCor.Caption := IntToStr(StrToInt(LblRegCor.Caption) + 1);
    //BotonInc.Enabled := False;
    LVIncidencia.Enabled := False;
  end;}
end;

//FUNCIONES EXCLUSIVAS DE 'MARCAJES POR JORNADA'
procedure TProFMReloj.MarcajesJornada;
var
  i, n, {j,} NumMarcaje, Linea, IdOrden, OrdenProd, LineaFase, LineaTarea, Suborden : integer;
  FechaLast, FechaMarcaje, recurso, OpeMaq, TipoM, Calendario : string;
  HoraIniLast, HoraFinLast, PrecioUni : real;
  DatosLinea : LecturaMarcaje;
begin
  ListaOpeMaqError := TStringList.Create;
  ListaOpeMaqError.Sorted := True;

  GuardarDatos;
  ProDMReloj.SeleccionMarcajesYFecha;
  n := 1;
  while (n < SGDetalle.RowCount) do
  begin
     //    j := 1;
     ProDMReloj.xConfigDet.First;
     TipoM := ProDMReloj.xConfigCabTIPORECURSO.AsString;

     //Inserto todos los valores de la linea a tratar en DatosLinea, para poder tratar los datos mejor
     for i := 1 to SGDetalle.ColCount - 1 do
        DatosLinea[i] := SGDetalle.Rows[n].Strings[i];

     if (Trim(DatosLinea[1]) <> '') then
     begin //SI EL PRIMER CAMPO NO ESTA VACIO, PROCESAMOS LA LINIA, SINO LA ELIMINAMOS DEL FICHERO
        DatosLinea[50] := IntToStr(n); //Pongo el nimero de linea de la lectura del marcaje

        //Pasamos la fecha del marcaje a formato correcto
        FechaMarcaje := ConversionFecha(1, DatosLinea[PosFecha], 0); //formato: mes/dia/any

        //En operarios, a partir del codigo de targeta, busco el número de operario que es
        //En maquinas, ponemos el numero de maquina
        //      if (ProDMReloj.SelecOpeMaq(DatosLinea[StrToInt(tipomarcajes[j])], TipoM, opemaq, calendario) = False) then
        if not ProDMReloj.SelecOpeMaq(DatosLinea[1], TipoM, OpeMaq, Calendario) then
        begin //Ponemos la linea en incidencias si no ha encontrado el operario/maquina
           if (TipoM = 'MO') then
              //          InsertarIncidencias(IntToStr(n),_('NO existe el código de targeta ')+DatosLinea[StrToInt(tipomarcajes[j])]) //idioma_code
              InsertarIncidencias(IntToStr(n), _('NO existe el código de targeta ') + DatosLinea[1]) //idioma_code
           else if (TipoM = 'HM') then
              //          InsertarIncidencias(IntToStr(n),_('NO existe el código de máquina ')+DatosLinea[StrToInt(tipomarcajes[j])]); //idioma_code
              InsertarIncidencias(IntToStr(n), _('NO existe el código de máquina ') + DatosLinea[1]); //idioma_code
           Inc(n);
           Continue;
        end;

        //Comprobamos que el operario que se esta procesando no haya estado procesado
        //con error en marcajes anteriores del mismo fichero
        if not ComprobarOpeMaqError(ListaOpeMaqError, OpeMaq) then
        begin //Busco la fecha y hora del ultimo marcaje del operario/maquina
           if not (ProDMReloj.BuscarUltimoMarcaje(OpeMaq, TipoM, NumMarcaje, Linea,
              FechaLast, HoraIniLast, HoraFinLast)) then
           begin
              ShowMessage(_('ERROR: No hay ningun marcaje inicial para este operario/máquina')); //idioma_code
              InsertarIncidencias(IntToStr(n), _('No se ha encontrado el marcaje inicial para este operario/máquina'));//idioma_code
           end
           else
           begin
              if not (ProDMReloj.RecogerDatosIdTarea(StrToInt(DatosLinea[BuscaCampo('IDTAREA')]),
                 IdOrden, OrdenProd, LineaFase, LineaTarea, SubOrden, Recurso, PrecioUni)) then
              begin
                 if (OrdenProd = -99) then
                    InsertarIncidencias(IntToStr(n), _('IDTarea ') + DatosLinea[BuscaCampo('IDTAREA')] +
                       _(' inexistente. No se ha procesado el operario/máquina ') + OpeMaq)  //idioma_code
                 else
                    InsertarIncidencias(IntToStr(n), _('IDTarea ') + DatosLinea[BuscaCampo('IDTAREA')] +
                       _(' ya cerrada. No se ha procesado el operario/máquina ') + OpeMaq);  //idioma_code
                 ListaOpeMaqError.Add(OpeMaq);
              end
              else
              begin
                 Asigna(DatosLinea, StrToDate(FechaLast), StrToDate(FechaMarcaje),
                    HoraIniLast, HoraFinLast, HoraFinLast,
                    TipoM, OpeMaq, Calendario, NumMarcaje, Linea,
                    IdOrden, OrdenProd, Suborden, LineaFase, LineaTarea, Recurso, PrecioUni);
                 LblRegCor.Caption := IntToStr(StrToInt(LblRegCor.Caption) + 1);
              end;
           end;
        end
        else
        begin
           InsertarIncidencias(IntToStr(n), _('Marcaje no procesado.') + //idioma_code
              _(' Error en algun marcaje anterior del operario/máquina ') + OpeMaq); //idioma_code
        end;
     end; //end if (Trim(DatosLinea[1])<>'')
     Inc(n);
  end;//fi while inicial
  ListaOpeMaqError.Free;

  //Guardo el archivo de marcajes en la carpeta de destino
  if (LVIncidencia.Items.Count = 0) then
  begin
     ShowMessage(_('Proceso finalizado'));   //idioma_code
     CopyFileTo(Dialogo.FileName, ProDMReloj.xConfigCabRUTADEST.AsString + '\' +
        ExtractFileName(Dialogo.FileName));
     TButtImportar.Enabled := False;
  end
  else
  begin
     ShowMessage(_('Proceso finalizado y con errores. Se ha generado fichero de incidencias'));//idioma_code
     //Guardo los marcajes pasados correctamente en la carpeta de destino
     EscribeFicheroMarcajes(ProDMReloj.xConfigCabRUTADEST.AsString +
        '\' + ExtractFileName(Dialogo.FileName), 1);
     //Guardo en la carpeta de incidencias, los marcajes que han dado error
     EscribeFicheroIncidencias;
  end;
  DeleteFile(Dialogo.FileName);
  SGDetalle.Enabled := False;
end;

procedure TProFMReloj.GuardarDatos;
var
  i, j : integer;
  Str : string;
  TS : TStrings;
begin
  Str := '';
  // Para cada línea de las selecciondas
  for i := (SGDetalle.Selection.Top) to (SGDetalle.Selection.Bottom) do
  begin
     // Si no es la 1ª linea, añadimos un salto de línea
     if (i <> SGDetalle.Selection.Top) then
        Str := Str + #13#10;

     ProDMReloj.xConfigDet.First;
     // Para cada elemento dentro de la línea (celdas)...
     for j := 1 to (SGDetalle.ColCount - 1) do
     begin
        Str := Str +
           Copy(SGDetalle.Rows[i].Strings[j], 1,
           ProDMReloj.xConfigDetLONG_FIN.AsInteger - ProDMReloj.xConfigDetLONG_INI.AsInteger + 1);
        ProDMReloj.xConfigDet.Next;
     end;

     // La guardamos en el fichero (utilizando un TStrings, por ejemplo)
     TS := TStringList.Create();
     TS.Add(Str);
     TS.SaveToFile(Dialogo.Filename);
     TS.Free;
  end;
end;

function TProFMReloj.ComprobarOpeMaqError(Lista: TStringList; OpeMaq: string): boolean;
var
  index : integer;
begin
  Result := Lista.Find(OpeMaq, index);
end;

function TProFMReloj.BuscaCampo(Campo: string): integer;
begin
  with ProDMReloj.QGeneral do
  begin
     Close;
     SQL.Clear;
     SQL.Add('select orden from pro_config_det_marca');
     SQL.Add('where rig=:configuracion and campo_fisico=''' + Campo + '''');
     Params[0].AsInteger := Configuracion;
     ExecQuery;
  end;
  Result := ProDMReloj.QGeneral.Fields[0].AsInteger;
end;

procedure TProFMReloj.Asigna(DatosLinea: LecturaMarcaje; FechaIni, FechaFin: TDateTime; HoraIni, HoraFin, HoraMarcaje: real; TipoM, OpeMaq, Calendario: string; NumMarcaje, Linea, IdOrden, OrdenProd, Suborden, LineaFase, LineaTarea: integer; Recurso: string; PrecioUni: real);
var
  CampoCab, CamposModificar, ColumnasInsertar, CamposInsertar : string;
begin
  if (TipoM = 'MO') then
     CampoCab := 'OPERARIO'
  else if (TipoM = 'HM') then
     CampoCab := 'MAQUINA'
  else if (TipoM = 'TE') then
     CampoCab := 'PROVEEDOR'
  else if (TipoM = 'VAR') then
     CampoCab := 'VARIOS';

  //Comprobamos que la fecha es laboral
  if (ProDMReloj.EsLaboral(FechaIni, OpeMaq, Calendario, TipoM)) then
  begin
     if not (ProDMReloj.HayCabMarcaje(OpeMaq, ConversionFecha(0, DateToStr(FechaIni), 1), TipoM, 0)) then
     begin
        NumMarcaje := ProDMReloj.CreaCabMarcaje(OpeMaq, 'PRO_ORD_CAB_MARCA', CampoCab, TipoM,
           ConversionFecha(0, DateToStr(FechaIni), 1));
        HoraFin := 0; //En una cabecera de marcaje nueva, HoraFin no tiene importancia
     end;

     ProDMReloj.SelecHorario(StrToInt(OpeMaq), TipoM, FechaIni);

     //Si HoraMarcaje=0, significa que no hay HORA_FINAL en la ultima linea del marcaje
     //del operario actual, por lo tanto, se hara un UPDATE en la tabla de marcajes.
     //Si HoraMarcaje<>0, se hara un INSERT en la tabla de marcajes
     SelecColJornada(False, (HoraMarcaje = 0), StrToInt(DatosLinea[50]), IdOrden,
        ColumnasInsertar, CamposInsertar, CamposModificar, HoraMarcaje);

     if (FechaIni > FechaFin) then
     begin
        InsertarIncidencias(DatosLinea[50], 'El día del marcaje es anterior al último marcaje. No se ha procesado el operario/máquina ' + OpeMaq);
        ListaOpeMaqError.Add(OpeMaq);
     end;
     if (FechaIni = FechaFin) and (HoraMarcaje < HoraFin) then
     begin
        InsertarIncidencias(DatosLinea[50], _('La hora del marcaje actual es anterior al último marcaje. No se ha procesado el operario/máquina ') + OpeMaq);  //idioma_code
        ListaOpeMaqError.Add(OpeMaq);
     end;

     if (FechaIni = FechaFin) and (HoraMarcaje >= HoraFin) then
        AsignaHora(DatosLinea, HoraIni, HoraFin, HoraMarcaje, TipoM,
           ColumnasInsertar, CamposInsertar, CamposModificar,
           NumMarcaje, Linea, IdOrden, OrdenProd, Suborden, LineaFase, LineaTarea,
           DatosLinea[BuscaCampo('IDTAREA')], Recurso, PrecioUni);

     if (FechaIni < FechaFin) then
        AsignaDia(DatosLinea, HoraIni, HoraFin, HoraMarcaje, ColumnasInsertar, CamposInsertar, CamposModificar,
           NumMarcaje, Linea, IdOrden, OrdenProd, Suborden, LineaFase, LineaTarea,
           DatosLinea[BuscaCampo('IDTAREA')], TipoM, Recurso, PrecioUni);
  end;

  //Si la fecha del ultimo marcaje no es la del actual, seguimos con los marcajes en el dia siguiente
  if (FechaIni < FechaFin) then
     Asigna(DatosLinea, IncDay(FechaIni, 1), FechaFin, HoraIni, HoraFin, HoraMarcaje,
        TipoM, OpeMaq, Calendario, NumMarcaje, Linea,
        IdOrden, OrdenProd, Suborden, LineaFase, LineaTarea, Recurso, PrecioUni);
end;

procedure TProFMReloj.AsignaHora(DatosLinea: LecturaMarcaje; HoraIni, HoraFin, HoraMarcaje: real; TipoM, ColumnasInsertar, CamposInsertar, CamposModificar: string; NumMarcaje, Linea, IdOrden, OrdenProd, SubOrden, LineaFase, LineaTarea: integer; idtarea, Recurso: string; PrecioUni: real);
var
  Tiempo : string;
begin
  //Nos posicionamos sobre la hora correcta del horario y calendario
  while (HoraFin <> 0) and not ((HoraFin >= ProDMReloj.xHorarioHORA_INI.AsFloat) and
        (HoraFin <= ProDMReloj.xHorarioHORA_FIN.AsFloat)) and not (ProDMReloj.xHorario.EOF) do
     ProDMReloj.xHorario.Next;

  if (HoraFin = 0) then //Inicialización de la HoraFin
     HoraFin := ProDMReloj.xHorarioHORA_INI.AsFloat;

  while not (ProDMReloj.xHorario.EOF) and not ((HoraMarcaje >= ProDMReloj.xHorarioHORA_INI.AsFloat) and
        (HoraMarcaje <= ProDMReloj.xHorarioHORA_FIN.AsFloat)) do
  begin
     if not ((HoraMarcaje >= ProDMReloj.xHorarioHORA_INI.AsFloat) and
        (HoraMarcaje <= ProDMReloj.xHorarioHORA_FIN.AsFloat)) and
        (HoraMarcaje > ProDMReloj.xHorarioHORA_INI.AsFloat) then
     begin
        if (CamposModificar <> '') then  //Si s'ha de fer update de un marcatge existent
        begin
           Tiempo := CalcTiempo(HoraIni, ProDMReloj.xHorarioHORA_FIN.AsFloat);
           CamposModificar := CamposModificar + ',HORA_FIN=' + ProDMReloj.xHorarioHORA_FIN.AsString +
              ',TIEMPO=' + Tiempo; //+',UNIDADES_FAB=0, ESTADO=0';
           ProDMReloj.ActualizarMarcaje(CamposModificar, TipoM, NumMarcaje, Linea);
        end;

        if (CamposModificar = '') then  //Crear un nou marcatge
        begin
           Tiempo := CalcTiempo(ProDMReloj.xHorarioHORA_INI.AsFloat, ProDMReloj.xHorarioHORA_FIN.AsFloat);
           //        ColumnasInsertar := ColumnasInsertar + ',UNIDADES_FAB, ESTADO';
           //        CamposInsertar   := CamposInsertar + ',0,0';
           ProDMReloj.InsertarMarcaje(ColumnasInsertar, CamposInsertar, NumMarcaje, OrdenProd,
              Suborden, LineaFase, LineaTarea, Recurso, TipoM, PrecioUni, HoraFin,
              ProDMReloj.xHorarioHORA_FIN.AsFloat, Tiempo);
        end;
     end;

     ProDMReloj.xHorario.Next;
     HoraFin := ProDMReloj.xHorarioHORA_INI.AsFloat;

     SelecColJornada(False, (HoraMarcaje = 0), StrToInt(DatosLinea[50]), IdOrden,
        ColumnasInsertar, CamposInsertar, CamposModificar, HoraMarcaje);
  end;

  //Si no es cumpleix la condició, de que la hora final no està compresa dins la
  //franja horaria determinada, posarà les hores del horari que falten
  if (CamposModificar <> '') then
  begin
     if (HoraIni < HoraMarcaje) and
        (not ProDMReloj.xHorario.EOF) then
     begin
        Tiempo := CalcTiempo(HoraIni, HoraMarcaje);
        CamposModificar := CamposModificar + ',HORA_FIN=' + FloatToStr(HoraMarcaje) +
           ',TIEMPO=' + Tiempo;
        ProDMReloj.ActualizarMarcaje(CamposModificar, TipoM, NumMarcaje, Linea);
     end
     else
     begin
        //Hacemos UPDATE de la linea actual del marcaje
        SelecColJornada(False, True, StrToInt(DatosLinea[50]), IdOrden,
           ColumnasInsertar, CamposInsertar, CamposModificar, HoraMarcaje);
        ProDMReloj.ActualizarMarcaje(CamposModificar, TipoM, NumMarcaje, Linea);
     end;
  end
  else if (CamposModificar = '') then
  begin
     if (ProDMReloj.xHorarioHORA_INI.AsFloat < HoraMarcaje) and
        (not ProDMReloj.xHorario.EOF) then
     begin
        //      Tiempo := CalcTiempo(ProDMReloj.xHorarioHORA_INI.AsFloat,HoraMarcaje);
        Tiempo := CalcTiempo(HoraFin, HoraMarcaje);
        ProDMReloj.InsertarMarcaje(columnasinsertar, camposinsertar, nummarcaje, ordenprod,
           suborden, lineafase, lineatarea, recurso, TipoM, preciouni, horafin, horamarcaje, Tiempo);
     end
     else
     begin
        //Hacemos UPDATE de la linea actual del marcaje
        SelecColJornada(False, True, StrToInt(DatosLinea[50]), IdOrden,
           ColumnasInsertar, CamposInsertar, CamposModificar, HoraMarcaje);
        ProDMReloj.ActualizarMarcaje(CamposModificar, TipoM, NumMarcaje, Linea);
     end;
  end;
end;

procedure TProFMReloj.AsignaDia(DatosLinea: LecturaMarcaje; HoraIni, HoraFin, HoraMarcaje: real; ColumnasInsertar, CamposInsertar, CamposModificar: string; NumMarcaje, Linea, IdOrden, OrdenProd, Suborden, LineaFase, LineaTarea: integer; idtarea, TipoM, Recurso: string; PrecioUni: real);
var
  Tiempo : string;
begin
  //Nos posicionamos sobre la hora correcta del horario y calendario
  while (HoraFin <> 0) and not ((HoraFin >= ProDMReloj.xHorarioHORA_INI.AsFloat) and
        (HoraFin <= ProDMReloj.xHorarioHORA_FIN.AsFloat)) and not (ProDMReloj.xHorario.EOF) do
     ProDMReloj.xHorario.Next;

  if (HoraFin = 0) then //Inicialización de la HoraFin
     HoraFin := ProDMReloj.xHorarioHORA_INI.AsFloat;

  while not (ProDMReloj.xHorario.EOF) do
  begin
     if (CamposModificar <> '') then //Update de HORA_FIN en un marcaje existente
     begin
        Tiempo := CalcTiempo(HoraIni, ProDMReloj.xHorarioHORA_FIN.AsFloat);
        CamposModificar := CamposModificar + ',HORA_FIN=' + ProDMReloj.xHorarioHORA_FIN.AsString +
           ',TIEMPO=' + Tiempo + ',UNIDADES_FAB=0, ESTADO=0'; //Como asignamos a todo el dia, no indicamos FIN ni Unidades (lo haremos al final)
        ProDMReloj.ActualizarMarcaje(CamposModificar, TipoM, NumMarcaje, Linea);
     end;

     if (CamposModificar = '') then  //Crear un nuevo marcaje
     begin
        Tiempo := CalcTiempo(HoraFin, ProDMReloj.xHorarioHORA_FIN.AsFloat);
        ColumnasInsertar := ColumnasInsertar + ',UNIDADES_FAB, ESTADO'; //Como asignamos a todo el dia, no indicamos FIN ni Unidades (lo haremos al final)
        CamposInsertar := CamposInsertar + ',0,0';                    //Como asignamos a todo el dia, no indicamos FIN ni Unidades (lo haremos al final)
        //      if (Tiempo <> ''0'') then
        ProDMReloj.InsertarMarcaje(ColumnasInsertar, CamposInsertar, NumMarcaje, Ordenprod,
           suborden, lineafase, lineatarea, recurso, TipoM, preciouni, HoraFin,
           ProDMReloj.xHorarioHORA_FIN.AsFloat, Tiempo);
     end;

     ProDMReloj.xHorario.Next;

     //Inicializamos variables para Insertar o Modificar el marcaje
     SelecColJornada(False, (HoraMarcaje = 0), StrToInt(DatosLinea[50]), IdOrden,
        ColumnasInsertar, CamposInsertar, CamposModificar, HoraMarcaje);

     HoraFin := ProDMReloj.xHorarioHORA_INI.AsFloat;
  end;
end;

//Seleccion de campos a insertar o modificar
//però depen de la situació la hora_inici la obviaré a marcajes per jornada
procedure TProFMReloj.SelecColJornada(CabInsertada, ModoUpdate: boolean; Linea, IdOrden: integer; var ColumnasInsertar: string; var CamposInsertar: string; var CamposModificar: string; var Hora: real);
var
  UnidadCompuesto, Coma, CampoFisico, Valor : string;
  PosDecimal : integer;
  CantidadDest : double;
begin
  CamposInsertar := '';
  CamposModificar := '';
  ColumnasInsertar := '';

  with ProDMReloj.QGeneral do
  begin
     Close;
     SQL.Text := 'select ord.compuesto, art.unidades ' +
        ' from pro_ord ord join art_articulos art on ' +
        '  (ord.empresa=art.empresa and ord.compuesto=art.articulo) ' +
        '  where ord.id_orden=:id_orden';
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     ExecQuery;
     UnidadCompuesto := ProDMReloj.QGeneral.Fields[1].AsString;
     FreeHandle;
  end;

  ProDMReloj.xConfigDet.First;

  // SI NO SE HA ENCONTRADO NINGUN MARCAJE DEL OPERARIO/MAQUINA, INSERTAMOS EL DETALLE (ColumnasInsertar)
  // SI SE ENCUENTRA UN MARCAJE ANTERIOR, ACTUALIZAMOS EL DETALLE (CamposModificar)
  // ModoUpdate=False -> Insertar
  // ModoUpdate=True  -> Modificar
  Coma := ''; //La primera vez no ponemos la coma delante del campo
  if (ModoUpdate) then
     CamposModificar := 'set ';
  while not ProDMReloj.xConfigDet.EOF do
  begin
     CampoFisico := Trim(ProDMReloj.xConfigDetCAMPO_FISICO.AsString);
     Valor := Trim(SGDetalle.Rows[Linea].Strings[ProDMReloj.xConfigDetORDEN.AsInteger]);

     if (Trim(ProDMReloj.xConfigDetTABLA_FISICA.AsString) = 'PRO_ORD_DET_MARCA') then
     begin
        if (CampoFisico = 'HORA_INICIO') then
           //Guardamos el valor del campo HORA_INICIO
           Hora := StrToFloat(Valor)
        else
        begin //Guardamos el campo en la variable correspondiente
           if (not ModoUpdate) then
              ColumnasInsertar := ColumnasInsertar + Coma + CampoFisico
           else
              CamposModificar := CamposModificar + Coma + CampoFisico + '=';
        end;

        if (CampoFisico <> 'HORA_INICIO') then
        begin
           if (CampoFisico = 'RECURSO') or (CampoFisico = 'TIPO_MARCAJE') then
           begin //Si guardamos el campo RECURSO o TIPO_MARCAJE, lo hacemos entre comillas ''
              if (not ModoUpdate) then
                 CamposInsertar := CamposInsertar + Coma + '''' + Valor + ''''
              else
                 CamposModificar := CamposModificar + '''' + Valor + '''';
           end
           else
           begin //Si NO guardamos el campo RECURSO o TIPO_MARCAJE, lo hacemos SIN comillas ''
              if (CampoFisico = 'UNIDADES_FAB') and (UnidadCompuesto <> '-') then
              begin
                 //Si la unidad del material que se ha fabricado es diferente al de unidades '-', hacemos el cambio
                 with ProDMReloj.QGeneral do
                 begin
                    Close;
                    SQL.Text := 'select cantidad_dest from pro_sys_relacion_unidades ' +
                       'where unidad=:ud_compuesto and unidad_dest=''-''';
                    Params.ByName['UD_COMPUESTO'].AsString := UnidadCompuesto;
                    ExecQuery;
                    CantidadDest := ProDMReloj.QGeneral.Fields[0].AsFloat;
                    FreeHandle;
                 end;

                 if (CantidadDest <> 0) then
                 begin //Si tenemos la cantidad relacionada entre las unidades hacemos el cambio
                    Valor := FloatToStr(StrToFloat(Valor) / CantidadDest);
                    PosDecimal := Pos(',', Valor);
                    if (PosDecimal > 0) then
                    begin
                       Delete(Valor, PosDecimal, 1);
                       Insert('.', Valor, PosDecimal);
                    end;
                 end;
              end;

              if (not ModoUpdate) then
                 CamposInsertar := CamposInsertar + Coma + Valor
              else
                 CamposModificar := CamposModificar + Valor;
           end;
           Coma := ','; //Despues de la primera vez, añadimos una coma delante de los campos
        end; //fin if (ProDMReloj.xConfigDetCAMPO_FISICO.AsString <> 'HORA_INICIO') then
     end; //fin if TABLA_FISICA
     ProDMReloj.xConfigDet.Next;
  end; //fin while

  //if (CabInsertada=False) and (ModoUpdate) then
  //  CamposModificar:=CamposModificar+',TIEMPO='+IntToStr(tiempo);
end;

//Aquest procediment seleccionarà si l'operari imputa a través de Recursos o Imputació
{procedure TProFMReloj.SelecRecursoOpe(operario: string;
  var Recurso_Imputacion: string; var PrecioUni: real);
begin
  ProDMReloj.xOperario.Close;
  ProDMReloj.xOperario.Params.ByName['Empresa' ].AsInteger := REntorno.Empresa;
  ProDMReloj.xOperario.Params.ByName['Empleado'].AsInteger := StrToInt(operario);
  ProDMReloj.xOperario.Open;

  if (ProDMReloj.xOperarioTIPOIMPUTACION.AsInteger = 0) then //Recurso
  begin
    Recurso_Imputacion := ProDMReloj.xOperarioRECURSO.AsString;
    ProDMReloj.QMGeneral.Close;
    ProDMReloj.QMGeneral.SelectSQL.Clear;
    ProDMReloj.QMGeneral.SelectSQL.Add('select rec.importe from ope_empleado ope');
    ProDMReloj.QMGeneral.SelectSQL.Add(
      'join pro_recursos rec on (ope.empresa=rec.empresa and ope.recurso=rec.recurso)');
    ProDMReloj.QMGeneral.SelectSQL.Add('where ope.empresa=?empresa and ope.recurso=?recurso');
    ProDMReloj.QMGeneral.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
    ProDMReloj.QMGeneral.Params.ByName['Recurso'].AsString := Recurso_Imputacion;
    ProDMReloj.QMGeneral.Open;
    PrecioUni := ProDMReloj.QMGeneral.Fields[0].AsFloat;
    ProDMReloj.QMGeneral.Close;
    ProDMReloj.QMGeneral.SelectSQL.Clear;
  end
  else //Imputación
  begin
    Recurso_Imputacion := ProDMReloj.xOperarioIMPUTACION.AsString;
    ProDMReloj.QMGeneral.Close;
    ProDMReloj.QMGeneral.SelectSQL.Clear;
    ProDMReloj.QMGeneral.SelectSQL.Add('select importe from ope_empleado_pre');
    ProDMReloj.QMGeneral.SelectSQL.Add(
      'where empresa=?empresa and empleado=?empleado and linea=?linea');
    ProDMReloj.QMGeneral.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
    ProDMReloj.QMGeneral.Params.ByName['Empleado'].AsInteger := StrToInt(Operario);
    ProDMReloj.QMGeneral.Params.ByName['Linea'].AsInteger :=
      StrToInt(Recurso_Imputacion);
    ProDMReloj.QMGeneral.Open;
    PrecioUni := ProDMReloj.QMGeneral.Fields[0].AsFloat;
    ProDMReloj.QMGeneral.Close;
    ProDMReloj.QMGeneral.SelectSQL.Clear;
  end;
end;

function TProDMReloj.BusquedaMarcatge(DatosLinea: LecturaMarcaje): real;
var
  QColumnes: TFIBDataSetRo;
begin
  //Selecciono només la configuració de la capçalera de la máquina que estem fent servir
  //per recollir els marcatges
  with ProDMReloj.QMGeneral do
  begin
    Close;
    SelectSQL.Clear;
    SelectSQL.Add('select orden,campo,tabla_fisica,campo_fisico from pro_config_det_marca');
    SelectSQL.Add('where empresa=:empresa and rig=:configuracion and tabla_fisica=:tablafisica');
    SelectSQL.Add('order by orden asc');
    Params[0].AsInteger := REntorno.Empresa;
    Params[1].AsInteger := Configuracion;
    Params[2].AsString := 'PRO_ORD_DET_MARCA';
    Open;
  end;

  QColumnes := ProDMReloj.QMGeneral;
  QColumnes.First;

  while QColumnes.EOF <> True do
    begin  //Agafo el valor del camp
      if (Trim(QColumnes.Fields[3].AsString) = 'HORA_INICIO') then
          BusquedaMarcatge := StrToFloat(DatosLinea[qcolumnes.fields[0].asinteger]);
      QColumnes.Next;
    end; //fi while
end;

}

//FUNCIONES DE 'MARCAJES POR PARES' Y 'MARCAJES POR JORNADA'
function TProFMReloj.ConversionFecha(Tipo: integer; Fecha: string; Formato: integer): string;
var
  mes, dia, any : string;
begin
  if (Formato = 0) then //Fecha sin caracter '/'
  begin
     dia := Copy(Fecha, 1, 2);
     mes := Copy(Fecha, 3, 2);
     any := Copy(Fecha, 5, 4);
  end
  else if (Formato = 1) then //Fecha con caracter'/'
  begin
     dia := Copy(Fecha, 1, 2);
     mes := Copy(Fecha, 4, 2);
     any := Copy(Fecha, 7, 4);
  end;

  if (Tipo = 0) then //formato: mes/dia/any
     ConversionFecha := mes + '/' + dia + '/' + any;

  if (Tipo = 1) then //formato: dia/mes/any
     ConversionFecha := dia + '/' + mes + '/' + any;
end;

//Añade las incidencias encontradas en el objecto  ListView
procedure TProFMReloj.InsertarIncidencias(Linea, TipoError: string);
var
  ItemAux : TListItem;
begin
  ItemAux := LVIncidencia.Items.Add;
  ItemAux.Caption := Linea;

  //Ponemos el problema detectado
  ItemAux.SubItems.Add(TipoError);
  LblRegInc.Caption := IntToStr(StrToInt(LblRegInc.Caption) + 1);
end;

//Calculamos el tiempo entre HoraFin-HoraIni
function TProFMReloj.CalcTiempo(HoraIni, HoraFin: real): string;
begin
  {TODO: Revisar. No utilizar StrToDateTime}

  if (HoraIni = 2400) then
     HoraIni := 0;

  if (HoraFin = 2400) then
  begin
     HoraFin := 0;
     Result :=
        FormatDateTime('hhnn',
        StrToDateTime('1/2/2002 ' + FormatFloat('00:00', HoraFin)) -
        StrToDateTime('1/1/2002 ' + FormatFloat('00:00', HoraIni)));
  end
  else
     Result :=
        FormatDateTime('hhnn',
        StrToDateTime('1/1/2002 ' + FormatFloat('00:00', HoraFin)) -
        StrToDateTime('1/1/2002 ' + FormatFloat('00:00', HoraIni)));
end;

procedure TProFMReloj.EscribeFicheroMarcajes(NombreFichero: string; TipoFichero: integer);
var
  Fichero : TextFile; //Fichero
  n, m, valor : integer;
begin
  valor := 0;

  AssignFile(Fichero, NombreFichero);
  Rewrite(Fichero); //Inicializamos el fichero

  //Escribimos el fichero de los registros correctos (leemos desde el StringGrid)
  if (TipoFichero = 1) then //REGISTROS CORRECTOS
     for n := 1 to SGDetalle.RowCount - 1 do
        if not BuscarNumLView(StrToInt(SGDetalle.Rows[n].Strings[0]), LVIncidencia) then
        begin
           if Trim(SGDetalle.Rows[StrToInt(SGDetalle.Rows[n].Strings[0])].Strings[1]) <> '' then
           begin //Si el primer campo no esta vacio, guardamos el dato, sino, eliminamos la linea
              for m := 1 to SGDetalle.ColCount - 1 do
                 Write(Fichero, SGDetalle.Rows[StrToInt(SGDetalle.Rows[n].Strings[0])].Strings[m]);
              WriteLn(Fichero, '');
           end;
        end;//fin if

  //Escribimos el fichero de los registros incorrectos
  //(leemos desde la lista de incidencias y del StringGrid)
  if (TipoFichero = 2) then //REGISTROS INCORRECTOS
     for n := 0 to LVIncidencia.Items.Count - 1 do
        if (valor <> StrToInt(LVIncidencia.Items[n].Caption)) then
        begin
           valor := StrToInt(LVIncidencia.Items[n].Caption);
           if Trim(SGDetalle.Rows[StrToInt(LVIncidencia.Items[n].Caption)].Strings[1]) <> '' then
           begin //Si el primer campo no esta vacio, guardamos el dato, sino, eliminamos la linea
              for m := 1 to SGDetalle.ColCount - 1 do
                 Write(Fichero, SGDetalle.Rows[StrToInt(LVIncidencia.Items[n].Caption)].Strings[m]);
              WriteLn(Fichero, '');
           end;
        end;//fin if

  CloseFile(Fichero); //Cerramos el fichero
end;

procedure TProFMReloj.EscribeFicheroIncidencias;
var
  diastr, messtr, horastr, minstr, segstr : string;
  any, mes, dia, hora, min, seg, mseg : word;
begin
  //Descodifico la data i la hora per Asignar-li al fitxer desti
  DecodeDate(Date, any, mes, dia);
  DecodeTime(time, hora, min, seg, mseg);
  if (dia < 10) then
     diastr := '0' + IntToStr(dia)
  else
     diastr := IntToStr(dia);
  if (mes < 10) then
     messtr := '0' + IntToStr(mes)
  else
     messtr := IntToStr(mes);
  if (hora < 10) then
     horastr := '0' + IntToStr(hora)
  else
     horastr := IntToStr(hora);
  if (min < 10) then
     minstr := '0' + IntToStr(min)
  else
     minstr := IntToStr(min);
  if (seg < 10) then
     segstr := '0' + IntToStr(seg)
  else
     segstr := IntToStr(seg);

  NombreFicheroIncidencias := ProDMReloj.xConfigCabRUTAINC.AsString +
     '\Inc' + IntToStr(any) + messtr + diastr + horastr + minstr + segstr + '.spe';

  EscribeFicheroMarcajes(NombreFicheroIncidencias, 2); //Guardamos las indicencias en un archivo
  VerFicheroIncidencias.Enabled := True;
end;

//Buscamos en el primer campo de la lista (la linea)
//para ver las que tienen alguna incidencia
function TProFMReloj.BuscarNumLView(Num: integer; Lista: TListView): boolean;
var
  n : integer;
begin
  BuscarNumLView := False;
  n := 0;
  while (n < Lista.Items.Count) do
  begin
     if (Num = StrToInt(Lista.Items[n].Caption)) then
     begin
        BuscarNumLView := True;
        Break;
     end;
     Inc(n);
  end;
end;

end.
