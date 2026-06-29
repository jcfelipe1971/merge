unit UDMConfig;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDataSet, FIBQuery, FIBTableDataSet, ImgList, ComCtrls,
  FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO, jpeg, GIFImage,
  UBackup;

type
  TDMConfig = class(TDataModule)
     DSQMTeclas: TDataSource;
     QMTeclas: TFIBTableSet;
     QMTeclasCOMBINACION: TIntegerField;
     QMTeclasCOMBINACION_STR: TStringField;
     QMTeclasTECLA: TIntegerField;
     QMTeclasPROPIEDAD_ASOCIADA: TFIBStringField;
     xContadores: TFIBDataSetRO;
     DSxContadores: TDataSource;
     xContadoresTIPO: TFIBStringField;
     xContadoresCONTADOR: TIntegerField;
     xContadoresCANAL: TIntegerField;
     xContadoresSERIE: TFIBStringField;
     xContadoresL_EMP: TIntegerField;
     xContadoresL_EJE: TIntegerField;
     xContadoresL_CAN: TIntegerField;
     xContadoresL_SER: TIntegerField;
     QTreeEmpresas: TFIBQuery;
     QTreeCanales: TFIBQuery;
     QMTeclasTITULO: TFIBStringField;
     xContadoresTITULO: TFIBStringField;
     QTreeSeries: TFIBQuery;
     QTreeEjercicios: TFIBQuery;
     xVerEstado: TFIBDataSetRO;
     DSxVerEstado: TDataSource;
     TLocal: THYTransaction;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xMonedasMONEDA: TFIBStringField;
     xMonedasTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     DSxKriConfiguracion: TDataSource;
     xKriConfiguracion: TFIBTableSet;
     xKriConfiguracionID: TIntegerField;
     xKriConfiguracionDESCRIPCION: TFIBStringField;
     xKriConfiguracionESTADO: TIntegerField;
     DSxDicNavegadores: TDataSource;
     DSxDicGrids: TDataSource;
     xDicNavegadores: TFIBTableSet;
     xDicNavegadoresFORMULARIO: TFIBStringField;
     xDicNavegadoresNAVEGADOR: TFIBStringField;
     xDicNavegadoresPERFIL: TIntegerField;
     xDicNavegadoresBOTONES: TFIBStringField;
     xDicGrids: TFIBTableSet;
     xDicGridsFORMULARIO: TFIBStringField;
     xDicGridsGRID: TFIBStringField;
     xDicGridsPERFIL: TIntegerField;
     xDicGridsRESTRICCION: TFIBStringField;
     HYBackup: THYIBBackup;
     DSxDicPagecontrols: TDataSource;
     xDicPagecontrols: TFIBTableSet;
     xDicPagecontrolsFORMULARIO: TFIBStringField;
     xDicPagecontrolsPAGECONTROL: TFIBStringField;
     xDicPagecontrolsTABSHEET: TFIBStringField;
     xDicPagecontrolsPERFIL: TIntegerField;
     xDicPagecontrolsRESTRICCION: TFIBStringField;
     QMParamDef: TFIBTableSet;
     QMParamDefPARAMETRO: TFIBStringField;
     QMParamDefDESCRIPCION: TFIBStringField;
     QMParamDefTIPO: TFIBStringField;
     QMParamDefLONGITUD: TIntegerField;
     QMParamDefVALORES_POSIBLES: TFIBStringField;
     QMParamDefVALOR_DEF: TFIBStringField;
     QMParamDefNIVEL: TIntegerField;
     QMParamDefAYUDA: TFIBStringField;
     QMParamDefDETALLE: TBlobField;
     QMParamGen: TFIBTableSet;
     QMParamGenTIPO: TFIBStringField;
     QMParamGenEMPRESA: TIntegerField;
     QMParamGenSERIE: TFIBStringField;
     QMParamGenPERFIL: TIntegerField;
     QMParamGenPARAMETRO: TFIBStringField;
     QMParamGenVALOR: TFIBStringField;
     QMParamGenUSUARIO_ALTA: TFIBStringField;
     QMParamGenFECHA_ALTA: TDateTimeField;
     QMParamGenUSUARIO_MODIFICADO: TFIBStringField;
     QMParamGenFECHA_MODIFICADO: TDateTimeField;
     QMParamGenDESCRIPCION: TFIBStringField;
     QMParamGenAYUDA: TFIBStringField;
     QMParamGenNIVEL: TIntegerField;
     QMParamGenID: TIntegerField;
     DSQMParamDef: TDataSource;
     DSQMParamGen: TDataSource;
     QMParamEmp: TFIBTableSet;
     QMParamEmpTIPO: TFIBStringField;
     QMParamEmpEMPRESA: TIntegerField;
     QMParamEmpSERIE: TFIBStringField;
     QMParamEmpPERFIL: TIntegerField;
     QMParamEmpPARAMETRO: TFIBStringField;
     QMParamEmpVALOR: TFIBStringField;
     QMParamEmpUSUARIO_ALTA: TFIBStringField;
     QMParamEmpFECHA_ALTA: TDateTimeField;
     QMParamEmpUSUARIO_MODIFICADO: TFIBStringField;
     QMParamEmpFECHA_MODIFICADO: TDateTimeField;
     QMParamEmpDESCRIPCION: TFIBStringField;
     QMParamEmpAYUDA: TFIBStringField;
     QMParamEmpNIVEL: TIntegerField;
     QMParamEmpID: TIntegerField;
     QMParamEmpTITULO_EMPRESA: TFIBStringField;
     QMParamEmpTITULO_SERIE: TFIBStringField;
     QMParamEmpTITULO_PERFIL: TFIBStringField;
     QMParamSer: TFIBTableSet;
     QMParamSerTIPO: TFIBStringField;
     QMParamSerEMPRESA: TIntegerField;
     QMParamSerSERIE: TFIBStringField;
     QMParamSerPERFIL: TIntegerField;
     QMParamSerPARAMETRO: TFIBStringField;
     QMParamSerVALOR: TFIBStringField;
     QMParamSerUSUARIO_ALTA: TFIBStringField;
     QMParamSerFECHA_ALTA: TDateTimeField;
     QMParamSerUSUARIO_MODIFICADO: TFIBStringField;
     QMParamSerFECHA_MODIFICADO: TDateTimeField;
     QMParamSerDESCRIPCION: TFIBStringField;
     QMParamSerAYUDA: TFIBStringField;
     QMParamSerNIVEL: TIntegerField;
     QMParamSerID: TIntegerField;
     QMParamSerTITULO_EMPRESA: TFIBStringField;
     QMParamSerTITULO_SERIE: TFIBStringField;
     QMParamSerTITULO_PERFIL: TFIBStringField;
     QMParamPer: TFIBTableSet;
     QMParamPerTIPO: TFIBStringField;
     QMParamPerEMPRESA: TIntegerField;
     QMParamPerSERIE: TFIBStringField;
     QMParamPerPERFIL: TIntegerField;
     QMParamPerPARAMETRO: TFIBStringField;
     QMParamPerVALOR: TFIBStringField;
     QMParamPerUSUARIO_ALTA: TFIBStringField;
     QMParamPerFECHA_ALTA: TDateTimeField;
     QMParamPerUSUARIO_MODIFICADO: TFIBStringField;
     QMParamPerFECHA_MODIFICADO: TDateTimeField;
     QMParamPerDESCRIPCION: TFIBStringField;
     QMParamPerAYUDA: TFIBStringField;
     QMParamPerNIVEL: TIntegerField;
     QMParamPerID: TIntegerField;
     QMParamPerTITULO_EMPRESA: TFIBStringField;
     QMParamPerTITULO_SERIE: TFIBStringField;
     QMParamPerTITULO_PERFIL: TFIBStringField;
     DSQMParamEmp: TDataSource;
     DSQMParamSer: TDataSource;
     DSQMParamPer: TDataSource;
     QMParamUsu: TFIBTableSet;
     QMParamUsuTIPO: TFIBStringField;
     QMParamUsuEMPRESA: TIntegerField;
     QMParamUsuSERIE: TFIBStringField;
     QMParamUsuPERFIL: TIntegerField;
     QMParamUsuUSUARIO: TIntegerField;
     QMParamUsuPARAMETRO: TFIBStringField;
     QMParamUsuVALOR: TFIBStringField;
     QMParamUsuUSUARIO_ALTA: TFIBStringField;
     QMParamUsuFECHA_ALTA: TDateTimeField;
     QMParamUsuUSUARIO_MODIFICADO: TFIBStringField;
     QMParamUsuFECHA_MODIFICADO: TDateTimeField;
     QMParamUsuDESCRIPCION: TFIBStringField;
     QMParamUsuAYUDA: TFIBStringField;
     QMParamUsuNIVEL: TIntegerField;
     QMParamUsuID: TIntegerField;
     QMParamUsuTITULO_EMPRESA: TFIBStringField;
     QMParamUsuTITULO_SERIE: TFIBStringField;
     QMParamUsuTITULO_PERFIL: TFIBStringField;
     QMParamUsuTITULO_USUARIO: TFIBStringField;
     DSQMParamUsu: TDataSource;
     procedure DMConfigCreate(Sender: TObject);
     procedure QMTeclasBeforeOpen(DataSet: TDataSet);
     procedure QMTeclasCalcFields(DataSet: TDataSet);
     procedure QMTeclasAfterScroll(DataSet: TDataSet);
     procedure DMConfigDestroy(Sender: TObject);
     procedure xContadoresBeforeOpen(DataSet: TDataSet);
     procedure xKriConfiguracionAfterPost(DataSet: TDataSet);
     procedure QMParamDefNewRecord(DataSet: TDataSet);
     procedure QMParamGenNewRecord(DataSet: TDataSet);
     procedure QMParamGenBeforePost(DataSet: TDataSet);
     procedure QMParamEmpNewRecord(DataSet: TDataSet);
     procedure QMParamEmpBeforePost(DataSet: TDataSet);
     procedure QMParamSerNewRecord(DataSet: TDataSet);
     procedure QMParamSerBeforePost(DataSet: TDataSet);
     procedure QMParamPerNewRecord(DataSet: TDataSet);
     procedure QMParamPerBeforePost(DataSet: TDataSet);
     procedure QMParamUsuNewRecord(DataSet: TDataSet);
     procedure QMParamUsuBeforePost(DataSet: TDataSet);
     procedure QMParamGenVALORChange(Sender: TField);
     procedure QMParamEmpVALORChange(Sender: TField);
     procedure QMParamSerVALORChange(Sender: TField);
     procedure QMParamPerVALORChange(Sender: TField);
     procedure QMParamUsuVALORChange(Sender: TField);
     procedure QMParamEmpPARAMETROChange(Sender: TField);
     procedure QMParamGenPARAMETROChange(Sender: TField);
     procedure QMParamSerPARAMETROChange(Sender: TField);
     procedure QMParamPerPARAMETROChange(Sender: TField);
     procedure QMParamUsuPARAMETROChange(Sender: TField);
     procedure QMParamEmpEMPRESAChange(Sender: TField);
     procedure QMParamSerEMPRESAChange(Sender: TField);
     procedure QMParamSerSERIEChange(Sender: TField);
     procedure QMParamPerPERFILChange(Sender: TField);
     procedure QMParamUsuUSUARIOChange(Sender: TField);
     // procedure xAjustesSQLChanging(Sender: TObject);
  private
     { Private declarations }
     procedure RellenaEmp(Nodo: TTreeNode);
     procedure RellenaEje(Nodo: TTreeNode; Empresa: smallint);
     procedure RellenaCan(Nodo: TTreeNode; Empresa, Ejercicio: smallint);
     procedure RellenaSer(Nodo: TTreeNode; Empresa, Ejercicio, Canal: smallint);
     procedure QMParam_NewRecord(DataSet: TDataSet; Tipo: string);
     procedure QMParam_Cahnge(DataSet: TDataSet);
     procedure CruceParametro(Parametro: string; DataSet: TDataSet);
  public
     { Public declarations }
     procedure AjustaContadores;
     procedure VaciaLog;
     procedure VaciaLogTodo;
     procedure VaciaUbicaciones;
     function InicializaSistema: boolean;
     procedure LimpiaEmpresaEjercicio;
     procedure UpdateTeclas(Cadena: string);
     procedure RellenaMapa;
     procedure LeerConfigPVentas(var Flag: integer);
     procedure EscribirConfigPVentas(Flag: integer);
     procedure LeerEFE_COBRAR(var Flag: integer);
     procedure EscribirEFE_COBRAR(Flag: integer);
     procedure LeerUD_SEC(var Flag: integer);
     procedure EscribirUD_SEC(Flag: integer);
     function LeerMONEDA_SEC: string;
     procedure EscribirMONEDA_SEC;
     procedure LeerPCoste(var Flag: integer);
     procedure EscribirPCoste(Flag: integer);
     procedure BorraConfiguracion;
     function LeerPreCB: string;
     procedure EscribirPreCB(CB: string);
     procedure ReleeConfiguracion;
     procedure GenerarBackup;
     procedure GenerarRestore;
     procedure GenerarSweep;
     procedure PasarParches;
     procedure TraspasaAdjuntos(RepositorioDestino: integer);
     procedure TraspasaImagenes(RepositorioDestino: integer);
     procedure FiltraParamPer(Todos: boolean);
     procedure FiltraParamEmp(Todos: boolean);
     procedure FiltraParamSer(Todos: boolean);
     procedure FiltraParamUsu(Todos: boolean);
     procedure RellenaDetalle(ts: TStrings; Parametro: string);
  end;

var
  DMConfig : TDMConfig;

implementation

uses UDMMain, UUtiles, UEntorno, Menus, UFMConfig, UFormGest, UFSendCorreo,
  UDMAdjunto, UParam, UDMImagenes, UDameDato;

{$R *.DFM}

procedure TDMConfig.DMConfigCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  // Abre y prepara ;
  Self.QMTeclas.Open;
  xContadores.Open;
  DMMain.FiltraRO(xVerEstado, '11100', True);
  RellenaMapa;
  xKriConfiguracion.Close;
  xKriConfiguracion.Open;
  xDicNavegadores.Close;
  xDicNavegadores.Open;
  xDicGrids.Close;
  xDicGrids.Open;
  xDicPagecontrols.Close;
  xDicPagecontrols.Open;

  QMParamDef.Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
  QMParamGen.Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
  QMParamEmp.Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
  QMParamSer.Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
  QMParamPer.Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
  QMParamUsu.Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
  QMParamDef.Open;
  QMParamGen.Open;
  QMParamEmp.Open;
  QMParamSer.Open;
  QMParamPer.Open;
  QMParamUsu.Open;
end;

procedure TDMConfig.AjustaContadores;
begin
  DMMain.AjustaMovimientos;
end;

procedure TDMConfig.VaciaLog;
begin
  if (REntorno.Nivel <> 9) then
  begin
     ShowMessage(_('No tiene derechos suficientes'));
     Exit;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE LOG_ENTRADAS_VACIA';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfig.VaciaLogTodo;
begin
  if (REntorno.Nivel <> 9) then
  begin
     ShowMessage(_('No tiene derechos suficientes'));
     Exit;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE LOG_ENTRADAS_VACIA_TODO';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfig.VaciaUbicaciones;
begin
  if (REntorno.Nivel <> 9) then
  begin
     ShowMessage(_('No tiene derechos suficientes'));
     Exit;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE S_UBICACIONES_LIMPIA';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMConfig.InicializaSistema: boolean;
begin
  Result := False;
  if Confirma and ConfirmaGrave then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE LIMPIA_SISTEMA';
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Result := True;
  end;
end;

procedure TDMConfig.QMTeclasBeforeOpen(DataSet: TDataSet);
begin
  Self.QMTeclas.Params.ByName['usuario'].AsInteger := REntorno.Usuario;
end;

procedure TDMConfig.QMTeclasCalcFields(DataSet: TDataSet);
begin
  QMTeclasCOMBINACION_STR.AsString := ShortCutToText(TShortCut(QMTeclasCOMBINACION.AsInteger));
end;

procedure TDMConfig.QMTeclasAfterScroll(DataSet: TDataSet);
begin
  FMConfig.MostrarTeclaActual(QMTeclasTITULO.AsString, QMTeclasCOMBINACION_STR.AsString);
end;

procedure TDMConfig.DMConfigDestroy(Sender: TObject);
begin
  Self.QMTeclas.Close;
  xKriConfiguracion.Close;
end;

procedure TDMConfig.xContadoresBeforeOpen(DataSet: TDataSet);
begin
  with xContadores do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
  end;
end;

procedure TDMConfig.LimpiaEmpresaEjercicio;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE LIM_EMP_EJE(:EMPRESA, :EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfig.UpdateTeclas(Cadena: string);
var
  ShortCut_aux : TShortCut;
  BM : TBookmark;
  Propiedad : string;
begin
  ShortCut_aux := TextToShortCut(Cadena);
  if ShortCut_aux = 0 then
  begin
     Beep;
     Application.MessageBox(PChar(string(_('La cadena introducida no es una combinación válida.'))), PChar(string(_('Error'))), MB_OK);
     Exit;
  end
  else
  begin
     Propiedad := QMTeclas.FieldByName('PROPIEDAD_ASOCIADA').AsString;

     // Se introduce el valor en la base de datos
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE SYS_USUARIOS_TECLAS SET COMBINACION = :COMBINACION WHERE TECLA = :TECLA AND USUARIO = :USUARIO';
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['TECLA'].AsInteger := QMTeclas.FieldByName('TECLA').AsInteger;
           Params.ByName['COMBINACION'].AsInteger := integer(ShortCut_aux);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with QMTeclas do
     begin
        BM := GetBookmark;
        try
           Close;
           Open;
           GotoBookmark(BM);
        finally
           FreeBookmark(BM);
        end;
     end;

     // Se actualiza el valor en el componente Teclas
     DMMain.LeerTeclas(True);
  end;
end;

procedure TDMConfig.RellenaMapa;
var
  Nodo : TTreeNode;
begin
  Nodo := FMConfig.TWMapa.Items.Add(nil, 'Empresas');
  Nodo.SelectedIndex := 4;
  Nodo.ImageIndex := 17;
  RellenaEmp(Nodo);
end;

procedure TDMConfig.RellenaEmp(Nodo: TTreeNode);
var
  NodoLoc : TTreeNode;
  Codigo : smallint;
  Titulo : string;
begin
  with QTreeEmpresas do
  begin
     Close;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['EMPRESA'].AsInteger;
        Titulo := Format(_('Empresa: %d - %s'), [Codigo, FieldByName['TITULO'].AsString]);
        NodoLoc := FMConfig.TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 17;
        NodoLoc.SelectedIndex := 4;
        RellenaEje(NodoLOc, Codigo);
        Next;
     end;
     Close;
  end;
end;

procedure TDMConfig.RellenaEje(Nodo: TTreeNode; Empresa: smallint);
var
  NodoLoc : TTreeNode;
  Codigo : smallint;
  Titulo : string;
begin
  with QTreeEjercicios do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['EJERCICIO'].AsInteger;
        Titulo := Format(_('Ejercicio: %d'), [FieldByName['EJERCICIO'].AsInteger]);
        NodoLoc := FMConfig.TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 50;
        NodoLoc.SelectedIndex := 4;
        RellenaCan(NodoLoc, Empresa, Codigo);
        Next;
     end;
     Close;
  end;
end;

procedure TDMConfig.RellenaCan(Nodo: TTreeNode; Empresa, Ejercicio: smallint);
var
  NodoLoc : TTreeNode;
var
  Codigo : smallint;
  Titulo : string;
begin
  with QTreeCanales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['CANAL'].AsInteger;
        Titulo := Format(_('Canal: %d - %s'), [Codigo, FieldByName['TITULO'].AsString]);
        NodoLoc := FMConfig.TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 132;
        NodoLoc.SelectedIndex := 4;
        RellenaSer(NodoLoc, Empresa, Ejercicio, Codigo);
        Next;
     end;
     Close;
  end;
end;

procedure TDMConfig.RellenaSer(Nodo: TTreeNode; Empresa, Ejercicio, Canal: smallint);
var
  NodoLoc : TTreeNode;
var
  Codigo : string;
  Titulo : string;
begin
  with QTreeSeries do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['SERIE'].AsString;
        Titulo := Format(_('Serie: %s - %s'), [Codigo, FieldByName['TITULO'].AsString]);
        NodoLoc := FMConfig.TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 115;
        NodoLoc.SelectedIndex := 4;
        Next;
     end;
     Close;
  end;
end;

// Leer el Flag de PAR_PRECIO
procedure TDMConfig.LeerConfigPVentas(var Flag: integer);
begin
  Flag := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PAR_PRECIO FROM SYS_CONSTANTES';
        ExecQuery;
        Flag := FieldByName['PAR_PRECIO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Escribir el Flag de PAR_PRECIO
procedure TDMConfig.EscribirConfigPVentas(Flag: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONSTANTES SET PAR_PRECIO = ' + IntToStr(Flag);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Leer el Flag de EFECTOS_A_COBRAR
procedure TDMConfig.LeerEFE_COBRAR(var Flag: integer);
begin
  Flag := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EFECTOS_A_COBRAR FROM SYS_CONSTANTES';
        ExecQuery;
        Flag := FieldByName['EFECTOS_A_COBRAR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Escribir el Flag de EFECTOS_A_COBRAR
procedure TDMConfig.EscribirEFE_COBRAR(Flag: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONSTANTES SET EFECTOS_A_COBRAR = ' + IntToStr(Flag);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Leer el Flag de PVP_POR_UD_SECUNDARIA
procedure TDMConfig.LeerUD_SEC(var Flag: integer);
begin
  Flag := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PVP_POR_UD_SECUNDARIA FROM SYS_CONSTANTES';
        ExecQuery;
        Flag := FieldByName['PVP_POR_UD_SECUNDARIA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Escribir el Flag de PVP_POR_UD_SECUNDARIA
procedure TDMConfig.EscribirUD_SEC(Flag: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONSTANTES SET PVP_POR_UD_SECUNDARIA = ' + IntToStr(Flag);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  REntorno.PVP_Ud_Sec := (Flag = 1);
end;

// Leer el flag de la moneda secundaria para impresión de documentos
function TDMConfig.LeerMONEDA_SEC: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MONEDA_SEC FROM SYS_CONSTANTES';
        ExecQuery;
        Result := FieldByName['MONEDA_SEC'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xMonedas.Open;
end;

// Escribir el flag de la moneda secundaria para impresión de documentos
procedure TDMConfig.EscribirMONEDA_SEC;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONSTANTES SET MONEDA_SEC = ' + '''' + xMonedas.FieldByName('MONEDA').AsString + '''';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  REntorno.Moneda_Sec := xMonedas.FieldByName('MONEDA').AsString;
  MascaraNSec := DMMain.MascaraMoneda(REntorno.Moneda_Sec, 1);
end;

// Leer prefijo de códigos de barras
function TDMConfig.LeerPreCB: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ART_COD_BARRAS FROM SYS_CONSTANTES';
        ExecQuery;
        Result := FieldByName['ART_COD_BARRAS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// Escribir prefijo de códigos de barras
procedure TDMConfig.EscribirPreCB(CB: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONSTANTES SET ART_COD_BARRAS = ''' + Copy(Trim(CB), 1, 13) + '''';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfig.LeerPCoste(var Flag: integer);
begin
  Flag := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PRECIO_COSTE_MOV FROM SYS_CONSTANTES';
        ExecQuery;
        Flag := FieldByName['PRECIO_COSTE_MOV'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfig.EscribirPCoste(Flag: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONSTANTES SET PRECIO_COSTE_MOV = ' + IntToStr(Flag);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  REntorno.Precio_coste_mov := (Flag = 1);
end;

procedure TDMConfig.BorraConfiguracion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE DIC_FORMULARIOS SET CONFIGURACION = NULL';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfig.xKriConfiguracionAfterPost(DataSet: TDataSet);
begin
  DMMain.BorraEstadoKri(xKriConfiguracionID.AsInteger);
end;

procedure TDMConfig.ReleeConfiguracion;
begin
  with xKriConfiguracion do
  begin
     Close;
     Open;
     while not (EOF) do
     begin
        DMMain.BorraEstadoKri(xKriConfiguracionID.AsInteger);
        Next;
     end;
     First;
  end;
end;

procedure TDMConfig.GenerarBackup;
var
  i : integer;
begin
  with HYBackup do
  begin
     Usuario := DMMain.DataBase.DBParams.Values['user_name'];
     Password := DMMain.DataBase.DBParams.Values['password'];
     FicheroOrigen := DMMain.DataBase.DBName;
     FicheroDestino := REntorno.DirBackups + ChangeFileExt(ExtractFileName(DMMain.DataBase.DBName), '.FBK');
     // Si el fichero existe, le agrego un indice
     i := 1;
     while (FileExists(FicheroDestino)) do
     begin
        FicheroDestino := REntorno.DirBackups + ChangeFileExt(ExtractFileName(DMMain.DataBase.DBName), '-' + IntToStr(i) + '.FBK');
        Inc(i);
     end;
     Backup;
  end;
end;

procedure TDMConfig.GenerarRestore;
var
  ArchivoBackup, Extension : string;
begin
  with TOpenDialog.Create(nil) do
  begin
     try
        Filter := _('Todas los archivos|*.*|Backups (*.FBK)|*.FBK');
        FilterIndex := 2;
        // Posicion inicial en Mis Documentos
        InitialDir := REntorno.DirBackups;
        Title := _('Seleccionar Backup');
        if (Execute) then
           ArchivoBackup := FileName;
     finally
        Free;
     end;
  end;

  Extension := '.FDB';
  if Application.MessageBox(PChar(string(_('¿Desea sobreescribir la base de datos actual (se recomienda hacer el restore primero en una copia)?'))),
     PChar(string(_('Atención'))), MB_YESNO) = idNo then
     Extension := '.RES';
  with HYBackup do
  begin
     Usuario := DMMain.DataBase.DBParams.Values['user_name'];
     Password := DMMain.DataBase.DBParams.Values['password'];
     FicheroOrigen := ArchivoBackup;
     FicheroDestino := ChangeFileExt(DMMain.DataBase.DBName, extension);
     if (Extension = '.FDB') then
     begin
        try
           // Se va a sustituir la base de datos, por tanto, se desconecta.
           CierraForms;
           DMMain.RegistraSalida;
           DMMain.Desconecta;
           try
              Restore;
           except
              Beep;
           end;
        finally
           DMMain.RegistraEntrada;
           Application.MainForm.SetFocus;
        end;
     end
     else
     begin
        Restore;
     end;
  end;
end;

procedure TDMConfig.GenerarSweep;
begin
  with HYBackup do
  begin
     Usuario := DMMain.DataBase.DBParams.Values['user_name'];
     Password := DMMain.DataBase.DBParams.Values['password'];
     FicheroOrigen := DMMain.DataBase.DBName;
     Sweep;
  end;
end;

procedure TDMConfig.PasarParches;
begin
  CierraForms;
  with HYBackup do
  begin
     FicheroOrigen := DMMain.DataBase.DBName;
     PasarParches(DMMain.DataBase);
  end;
end;

procedure TDMConfig.TraspasaAdjuntos(RepositorioDestino: integer);
var
  Registro, Registros : integer;
begin
  AbreData(TDMAdjunto, DMAdjunto);
  try
     FSendCorreo := TFSendCorreo.Create(Self);
     try
        FSendCorreo.Titulo(_('Traspasando adjuntos ...'));
        FSendCorreo.Show;
        FSendCorreo.Texto(_('Obteniendo adjuntos ...'));

        with TFIBDataSet.Create(nil) do
        begin
           try
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Add(' SELECT ID FROM EMP_ADJUNTOS ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' REPOSITORIO <> :REPOSITORIO_DESITNO ');
                 SelectSQL.Add(' ORDER BY ID ');
                 Params.ByName['REPOSITORIO_DESITNO'].AsInteger := RepositorioDestino;
                 Open;
                 FetchAll;
                 First;

                 Registros := RecordCount;
                 Registro := 0;
                 while not EOF do
                 begin
                    Inc(Registro);
                    FSendCorreo.Texto(Format(_('Traspasando adjuntos %d de %d' + #13#10 + 'Id: %d'), [Registro, Registros, FieldByName('ID').AsInteger]));
                    try
                       DMAdjunto.CambiaDestinoAdjunto(FieldByName('ID').AsInteger, RepositorioDestino);
                    except
                    end;
                    Next;
                 end;

                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
        FSendCorreo.Texto(Format(_('Se traspasaron %d adjuntos'), [Registro]));
        FSendCorreo.BitBtnOk.Visible := True;
        Application.ProcessMessages;
        FSendCorreo.Visible := False;
        FSendCorreo.SePuede := True;
        FSendCorreo.ShowModal;
     finally
        FreeAndNil(FSendCorreo);
     end;
  finally
     CierraData(DMAdjunto);
  end;
end;

procedure TDMConfig.QMParamDefNewRecord(DataSet: TDataSet);
begin
  QMParamDefNIVEL.AsInteger := REntorno.Nivel;
end;

procedure TDMConfig.QMParamGenNewRecord(DataSet: TDataSet);
begin
  QMParam_NewRecord(QMParamGen, '000');
end;

procedure TDMConfig.QMParamGenBeforePost(DataSet: TDataSet);
begin
  CheckValorParametro(QMParamGenPARAMETRO.AsString, QMParamGenVALOR.AsString);
end;

procedure TDMConfig.QMParamEmpNewRecord(DataSet: TDataSet);
begin
  QMParam_NewRecord(QMParamEmp, '001');
end;

procedure TDMConfig.QMParamEmpBeforePost(DataSet: TDataSet);
begin
  CheckValorParametro(QMParamEmpPARAMETRO.AsString, QMParamEmpVALOR.AsString);
end;

procedure TDMConfig.QMParamSerNewRecord(DataSet: TDataSet);
begin
  QMParam_NewRecord(QMParamSer, '002');
end;

procedure TDMConfig.QMParamSerBeforePost(DataSet: TDataSet);
begin
  CheckValorParametro(QMParamSerPARAMETRO.AsString, QMParamSerVALOR.AsString);
end;

procedure TDMConfig.QMParamPerNewRecord(DataSet: TDataSet);
begin
  QMParam_NewRecord(QMParamPer, '003');
end;

procedure TDMConfig.QMParamPerBeforePost(DataSet: TDataSet);
begin
  CheckValorParametro(QMParamPerPARAMETRO.AsString, QMParamPerVALOR.AsString);
end;

procedure TDMConfig.QMParamUsuNewRecord(DataSet: TDataSet);
begin
  QMParam_NewRecord(QMParamUsu, '004');
end;

procedure TDMConfig.QMParamUsuBeforePost(DataSet: TDataSet);
begin
  CheckValorParametro(QMParamUsuPARAMETRO.AsString, QMParamUsuVALOR.AsString);
end;

procedure TDMConfig.QMParam_NewRecord(DataSet: TDataSet; Tipo: string);
var
  id : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT MAX(ID) FROM SYS_PARAMETROS_VALORES');
        ExecQuery;
        id := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with (DataSet) do
  begin
     FieldByName('ID').AsInteger := id;
     FieldByName('TIPO').AsString := Tipo;
     FieldByName('USUARIO_ALTA').AsString := REntorno.Nombre;
     FieldByName('FECHA_ALTA').AsDateTime := Date;
     FieldByName('USUARIO_MODIFICADO').AsString := REntorno.Nombre;
     FieldByName('FECHA_MODIFICADO').AsDateTime := Date;
  end;
end;

procedure TDMConfig.QMParam_Cahnge(DataSet: TDataSet);
begin
  with (DataSet) do
  begin
     FieldByName('USUARIO_MODIFICADO').AsString := REntorno.Nombre;
     FieldByName('FECHA_MODIFICADO').AsDateTime := Date;
  end;
end;

procedure TDMConfig.CruceParametro(Parametro: string; DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION, AYUDA, NIVEL FROM SYS_PARAMETROS_DEFINICION WHERE PARAMETRO = ?PARAMETRO';
        Params.ByName['PARAMETRO'].AsString := Parametro;
        ExecQuery;
        DataSet.FieldByName('DESCRIPCION').AsString := FieldByName['DESCRIPCION'].AsString;
        DataSet.FieldByName('AYUDA').AsString := FieldByName['AYUDA'].AsString;
        DataSet.FieldByName('NIVEL').AsInteger := FieldByName['NIVEL'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfig.QMParamGenVALORChange(Sender: TField);
begin
  QMParam_Cahnge(QMParamGen);
end;

procedure TDMConfig.QMParamEmpVALORChange(Sender: TField);
begin
  QMParam_Cahnge(QMParamEmp);
end;

procedure TDMConfig.QMParamSerVALORChange(Sender: TField);
begin
  QMParam_Cahnge(QMParamSer);
end;

procedure TDMConfig.QMParamPerVALORChange(Sender: TField);
begin
  QMParam_Cahnge(QMParamPer);
end;

procedure TDMConfig.QMParamUsuVALORChange(Sender: TField);
begin
  QMParam_Cahnge(QMParamUsu);
end;

procedure TDMConfig.QMParamEmpPARAMETROChange(Sender: TField);
begin
  CruceParametro(QMParamEmpPARAMETRO.AsString, QMParamEmp);
end;

procedure TDMConfig.QMParamGenPARAMETROChange(Sender: TField);
begin
  CruceParametro(QMParamGenPARAMETRO.AsString, QMParamGen);
end;

procedure TDMConfig.QMParamSerPARAMETROChange(Sender: TField);
begin
  CruceParametro(QMParamSerPARAMETRO.AsString, QMParamSer);
end;

procedure TDMConfig.QMParamPerPARAMETROChange(Sender: TField);
begin
  CruceParametro(QMParamPerPARAMETRO.AsString, QMParamPer);
end;

procedure TDMConfig.QMParamUsuPARAMETROChange(Sender: TField);
begin
  CruceParametro(QMParamUsuPARAMETRO.AsString, QMParamUsu);
end;

procedure TDMConfig.QMParamEmpEMPRESAChange(Sender: TField);
begin
  QMParamEmpTITULO_EMPRESA.AsString := DameTituloEmpresa(QMParamEmpEMPRESA.AsInteger);
end;

procedure TDMConfig.QMParamSerEMPRESAChange(Sender: TField);
begin
  QMParamSerTITULO_EMPRESA.AsString := DameTituloEmpresa(QMParamSerEMPRESA.AsInteger);
end;

procedure TDMConfig.QMParamSerSERIEChange(Sender: TField);
begin
  QMParamSerTITULO_SERIE.AsString := DameTituloSerie(QMParamSerSERIE.AsString);
end;

procedure TDMConfig.QMParamPerPERFILChange(Sender: TField);
begin
  QMParamPerTITULO_PERFIL.AsString := DameTituloPerfilUsuario(QMParamPerPERFIL.AsInteger);
end;

procedure TDMConfig.QMParamUsuUSUARIOChange(Sender: TField);
begin
  QMParamUsuTITULO_USUARIO.AsString := DameTituloUsuario(QMParamUsuUSUARIO.AsInteger);
end;

procedure TDMConfig.FiltraParamEmp(Todos: boolean);
begin
  with QMParamEmp do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PARAMETROS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TIPO = ''001'' AND ');
     SelectSQL.Add(' NIVEL <= ?NIVEL ');
     if not Todos then
        SelectSQL.Add(' AND EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' ORDER BY PARAMETRO, EMPRESA ');
     if not Todos then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
     Open;
  end;
end;

procedure TDMConfig.FiltraParamPer(Todos: boolean);
begin
  with QMParamPer do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PARAMETROS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TIPO = ''003'' AND ');
     SelectSQL.Add(' NIVEL <= ?NIVEL ');
     if not Todos then
        SelectSQL.Add(' AND PERFIL = ?PERFIL ');
     SelectSQL.Add(' ORDER BY PARAMETRO, PERFIL ');
     if not Todos then
        Params.ByName['PERFIL'].AsInteger := REntorno.Restriccion;
     Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
     Open;
  end;
end;

procedure TDMConfig.FiltraParamSer(Todos: boolean);
begin
  with QMParamSer do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PARAMETROS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TIPO = ''002'' AND ');
     SelectSQL.Add(' NIVEL <= ?NIVEL ');
     if not Todos then
        SelectSQL.Add(' AND EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' ORDER BY PARAMETRO, EMPRESA, SERIE ');
     if not Todos then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
     Open;
  end;
end;

procedure TDMConfig.FiltraParamUsu(Todos: boolean);
begin
  with QMParamUsu do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PARAMETROS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TIPO = ''004'' AND ');
     SelectSQL.Add(' NIVEL <= ?NIVEL ');
     if not Todos then
        SelectSQL.Add(' AND USUARIO = ?USUARIO ');
     SelectSQL.Add(' ORDER BY PARAMETRO, USUARIO ');
     if not Todos then
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Params.ByName['NIVEL'].AsInteger := REntorno.Nivel;
     Open;
  end;
end;

procedure TDMConfig.RellenaDetalle(ts: TStrings; Parametro: string);
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add('SELECT DETALLE FROM SYS_PARAMETROS_DEFINICION WHERE PARAMETRO = :PARAMETRO');
           Params.ByName['PARAMETRO'].AsString := Parametro;
           Open;
           ts.Text := FieldByName('DETALLE').AsString;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfig.TraspasaImagenes(RepositorioDestino: integer);
var
  Registro, Registros : integer;
begin
  AbreData(TDMImagenes, DMImagenes);
  try
     FSendCorreo := TFSendCorreo.Create(Self);
     try
        FSendCorreo.Titulo(_('Traspasando imagenes ...'));
        FSendCorreo.Show;
        FSendCorreo.Texto(_('Obteniendo imagenes ...'));

        with TFIBDataSet.Create(nil) do
        begin
           try
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Add(' SELECT CODIGO FROM SYS_IMAGENES ');
                 SelectSQL.Add(' WHERE ');
                 // La imagen de inicio siempre estará en disco
                 SelectSQL.Add(' CODIGO <> -1 AND ');
                 SelectSQL.Add(' REPOSITORIO <> :REPOSITORIO_DESITNO ');
                 SelectSQL.Add(' ORDER BY CODIGO ');
                 Params.ByName['REPOSITORIO_DESITNO'].AsInteger := RepositorioDestino;
                 Open;
                 FetchAll;
                 First;

                 Registros := RecordCount;
                 Registro := 0;
                 while not EOF do
                 begin
                    Inc(Registro);
                    FSendCorreo.Texto(Format(_('Traspasando imagenes %d de %d' + #13#10 + 'Codigo: %d'), [Registro, Registros, FieldByName('CODIGO').AsInteger]));
                    try
                       DMImagenes.CambiaDestinoImagen(FieldByName('CODIGO').AsInteger, RepositorioDestino);
                    except
                    end;
                    Next;
                 end;

                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
        FSendCorreo.Texto(Format(_('Se traspasaron %d imagenes'), [Registro]));
        FSendCorreo.BitBtnOk.Visible := True;
        Application.ProcessMessages;
        FSendCorreo.Visible := False;
        FSendCorreo.SePuede := True;
        FSendCorreo.ShowModal;
     finally
        FreeAndNil(FSendCorreo);
     end;
  finally
     CierraData(DMImagenes);
  end;
end;

end.
