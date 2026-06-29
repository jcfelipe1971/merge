////////////////////////////////////////////////////////////////////////////////
//  Descripción                : Buscador SQL Gest-2000                       //
//  Unit                       : uBusquedas                                   //
//  Classe                     : N/A                                          //
//  Versión                    : 1.1 (Fase de pruebas)                        //
//  Creado inicialmente        : 12/11/1998                                   //
//  Última modificación        : 04/05/1999                                   //
//  Programador                : Josep Maria Piñol Fontseca                   //
//  Revisiones y nueva versión : Helio Yago Mateu                             //
////////////////////////////////////////////////////////////////////////////////

unit uFBusca;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Forms, StdCtrls, ExtCtrls, ComCtrls,
  ToolWin, FIBDatabase, Controls, Graphics, UFIBModificados, DB,
  FIBTableDataSet, FIBDataSet, ImgList, ActnList, UControlEdit,
  FIBDataSetRO, FIBQuery, HYFIBQuery, Mask, rxToolEdit,
  ULFActionList, ULFToolBar, ULFPanel, ULFComboBox, ULFLabel, ULFDateEdit, ULFEdit;

const
  kOR = 0;
  kAND = 1;
  kFirst = 2;

type

  FieldRec = record
     FDescripcion,
     FField,
     FTable,
     FKey, FKeyMaster: string;
     FFiltra: boolean;
     FTipo: integer;
  end;
  PFieldRec = ^FieldRec;

  FieldDate = record
     FDescripcion,
     FField,
     FTable,
     FKey: string;
  end;
  PFieldDate = ^FieldDate;

  RecFiltro = record
     HayFiltro: boolean;
     Posicion: smallint;
     cbFields: smallint;
     cbCondition: smallint;
     EdText: string;
  end;

  TPanelSearch = class(TPanel)
  private
     FPField: PFieldRec;  //Puntero a la estructura FieldRec
     cbFields, cbCondition: TLFComboBox;
     lbFirst, lbKind, lbSecond: TLFLabel;
     edText: TLFEdit;
     FSQL: string;
     procedure OnFieldsClick(Sender: TObject);
     procedure OnFieldsKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  public
     FKind: integer;
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     procedure ConstruirComponents(Pare: TWinControl; Kind: integer);
     function GetActualField: PFieldRec;
  end;

  TFBusca = class(THYForm)
     PMain: TLFPanel;
     rgKind: TRadioGroup;
     TBMain: TLFToolBar;
     btnDec: TToolButton;
     ToolButton3: TToolButton;
     ToolButton1: TToolButton;
     btnConfirmar: TToolButton;
     btnInc: TToolButton;
     pnlDate: TLFPanel;
     LFecha_Entre: TLFLabel;
     LFecha_1: TLFLabel;
     L_Fecha_ElDia: TLFLabel;
     cbDate: TLFComboBox;
     cbDateFirst: TLFDateEdit;
     cbDateLast: TLFDateEdit;
     tbNoDate: TToolButton;
     ToolButton4: TToolButton;
     btnCancelar: TToolButton;
     ToolButton2: TToolButton;
     ALMain: TLFActionList;
     act_Mas: TAction;
     act_Menos: TAction;
     act_Confirmar: TAction;
     act_SinDias: TAction;
     act_Cancelar: TAction;
     tbNoFiltro: TToolButton;
     ToolButton6: TToolButton;
     act_NoFiltro: TAction;
     cbTimeFirst: TDateTimePicker;
     cbTimeLast: TDateTimePicker;
     act_Configurar: TAction;
     TBSep1: TToolButton;
     TBConfigurar: TToolButton;
     procedure FormDestroy(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure cbDateClick(Sender: TObject);
     procedure tbNoDateClick(Sender: TObject);
     procedure act_MasExecute(Sender: TObject);
     procedure act_ConfirmarExecute(Sender: TObject);
     procedure act_CancelarExecute(Sender: TObject);
     procedure act_MenosExecute(Sender: TObject);
     procedure act_NoFiltroExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure act_ConfigurarExecute(Sender: TObject);
  private
     {Private declarations}
     PanelsList: TList;
     FPTable: PFieldRec;  //Puntero de la banda principal de tablas
     FPDate: PFieldDate;  //Puntero actual a la estructura de fechas
     FSerie: string;
     PosCursor: smallint;
     RFiltro: RecFiltro;
     modoreturn: integer;
     FControlEdit: TControlEdit;
     procedure AddNewPanelToList(Kind: integer);
     procedure RemoveLastPanel;
     procedure BuildConditionalSQL(Panel: TPanelSearch);
     procedure BuildNucliSQL;
     procedure SetDateComboBox;
     procedure CambiaCampo(Sender: TObject);
     procedure GuardaFiltro(Tabla: TFIBTableSet; Filtro: string; Abrir: boolean; Serie: string; Posicion: smallint);
     procedure RecuperaFiltro(Tabla: TFIBTableSet);
     function QuitaComaPonPunto(Parametro: string): string;
  private
     FFieldsCount, FDateCount: integer;
     procedure AddFields(Descripcion, Field, Table, Key, KeyMaster: string; Tipo: integer; Filtra: boolean);
     procedure AddDate(Descripcion, Field, Table, Key, KeyMaster: string; Filtra: boolean);
     function ArreglaOrderBY(orden: string): string;
  public
     FFields: array of PFieldRec;
     FDates: array of PFieldDate;
     FSQL: string;
     Filtros: string;
     function SeleccionaBusqueda(Tabla: TFIBTableSet; Filtro: string = '000000'; Abrir: boolean = True; Serie: string = ''; Posicion: smallint = 3; FiltroSql: string = ''): integer;
        overload;
     function SeleccionaBusqueda(ce: TControlEdit; Tabla: TFIBTableSet; Filtro: string = '00000'; Abrir: boolean = True; Serie: string = ''; Posicion: smallint = 3): integer; overload;
     constructor Create(AOwner: TComponent); overload; override;
  end;

var
  FBusca : TFBusca;
  SQLConditions : array[0..12] of string = (' = ', ' != ', ' CONTAINING ', ' NOT CONTAINING ', ' STARTING WITH ', ' NOT STARTING WITH ', ' < ', ' > ', ' <= ', ' >= ', ' !< ', ' !> ', ' <> ');
  SQLKind : array[0..2] of string = (' OR ', ' AND ', '  ');

implementation

uses UDMMain, UEntorno, UParam, UUtiles, UFBuscaConfiguracion;

{$R *.DFM}

{ Implementación de TPanelSearch}

constructor TPanelSearch.Create(AOwner: TComponent);
begin
  {Creamos el panel}
  inherited Create(AOwner);
  { Inicializaciones }
  Height := 34;
  Align := alTop;
  Caption := '';
  BevelInner := bvNone;
  BevelOuter := bvNone;
  FKind := kFirst;
  FSQL := '';
  FPField := nil;
end;

destructor TPanelSearch.Destroy;
begin
  inherited Destroy;
end;

procedure TPanelSearch.OnFieldsClick(Sender: TObject);
begin
  {El punter actual serà el del index del combo box}
  FPField := TFBusca(Parent).FFields[cbFields.ItemIndex];
end;

procedure TPanelSearch.OnFieldsKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     TFBusca(Parent).act_ConfirmarExecute(Sender);
  if (Key = VK_ESCAPE) then
     TFBusca(Parent).act_CancelarExecute(Sender);
end;

function TPanelSearch.GetActualField: PFieldRec;
begin
  {Devolvemos el puntero del campo actual seleccionado }
  Result := FPField;
end;

procedure TPanelSearch.ConstruirComponents(Pare: TWinControl; Kind: integer);
begin
  {Creamos el primer label}
  lbFirst := TLFLabel.Create(Self);
  lbFirst.Top := 11;
  lbFirst.Left := 8;
  case Kind of
     kOr: lbFirst.Caption := _('o el valor');
     kAnd: lbFirst.Caption := _('y el valor');
     kFirst: lbFirst.Caption := _('El valor de');
  end;
  FKind := Kind;
  lbFirst.Parent := Pare;
  {Creamos el label de tipo}
  lbKind := TLFLabel.Create(Self);
  lbKind.Hint := _('C Carácter; N Número; E Entero');
  lbKind.ShowHint := True;
  lbKind.Top := lbFirst.Top;
  lbKind.Left := 623;
  lbKind.Caption := 'C';
  lbKind.Parent := Pare;
  lbKind.Font.Style := [fsBold];
  {Creamos el segundo label}
  lbSecond := TLFLabel.Create(Self);
  lbSecond.Top := lbFirst.Top;
  lbSecond.Left := 198;
  lbSecond.Caption := _('que');
  lbSecond.Parent := Pare;
  {Creamos el primer combobox}
  cbFields := TLFComboBox.Create(Self);
  cbFields.Top := 7;
  cbFields.Left := 65;
  cbFields.Width := 125;
  cbFields.Parent := Pare;
  cbFields.Style := csDropDownList;
  cbFields.OnClick := OnFieldsClick;
  {Creamos el segundo combobox}
  cbCondition := TLFComboBox.Create(Self);
  cbCondition.Top := cbFields.Top;
  cbCondition.Left := 228;
  cbCondition.Width := 162;
  cbCondition.Parent := Pare;
  cbCondition.Style := csDropDownList;
  {Insertamos strings de condición}

  with cbCondition do
  begin
     Items.Add(_('sea igual a'));
     Items.Add(_('no sea igual a'));
     Items.Add(_('contenga'));
     Items.Add(_('no contenga'));
     Items.Add(_('empiece por'));
     Items.Add(_('no empiece por'));
     Items.Add(_('sea más pequeño'));
     Items.Add(_('sea más grande'));
     Items.Add(_('sea más pequeño o igual'));
     Items.Add(_('sea más grande o igual'));
     Items.Add(_('sea más pequeño o diferente'));
     Items.Add(_('sea más grande o diferente'));
     Items.Add(_('sea diferente'));
     ItemIndex := StrToIntDef(LeeParametro('BUSGENE001'), 2);
  end;

  {Cream el edit de texto}
  edText := TLFEdit.Create(Self);
  edText.Top := cbFields.Top;
  edText.Left := 395;
  edText.Width := edText.Width + 100;
  edText.Parent := Pare;
  edText.OnKeyDown := OnFieldsKeyDown;
  Top := Pare.Height + 65;
end;

{ Implementación de TFBusca }

constructor TFBusca.Create(AOwner: TComponent);
begin
  inherited Create(aOwner);
  FControlEdit := nil;
end;

procedure TFBusca.FormDestroy(Sender: TObject);
var
  ix : integer;
  PRec : PFieldRec;
  PDate : PFieldDate;
begin
  {Liberamos todos los punteros usados }
  for ix := 0 to FFieldsCount - 1 do
  begin
     PRec := FFields[ix];
     Dispose(PRec);
  end;
  Dispose(FPTable);
  for ix := 0 to FDateCount - 1 do
  begin
     PDate := FDates[ix];
     Dispose(PDate);
  end;
  PanelsList.Free;
end;

procedure TFBusca.SetDateComboBox;
var
  index : integer;
  PDate : PFieldDate;
begin
  if FDateCount <> 0 then
  begin
     {Rellenamos el ComboBox}
     for index := 0 to FDateCount - 1 do
     begin
        PDate := FDates[index];
        cbDate.Items.Add(PDate^.FDescripcion);
     end;
     cbDate.ItemIndex := 0;
     {Guardamos el valor del puntero en una variable global}
     FPDate := FDates[0];
  end
  else
  begin
     pnlDate.Visible := False;
     Height := Height - pnlDate.Height;
  end;
end;

procedure TFBusca.AddNewPanelToList(Kind: integer);
var
  NewPanel : TPanelSearch;
  index : integer;
  PField : PFieldRec;
  StrField : string;
begin
  {Creamos un nuevo Panel de Búsqueda}
  NewPanel := TPanelSearch.Create(Self);
  NewPanel.Parent := Self;
  NewPanel.ConstruirComponents(NewPanel, Kind);
  Height := Height + NewPanel.Height;
  {Añadimos los valors del array al Combobox}
  if FFieldsCount <> 0 then
  begin
     for index := 0 to FFieldsCount - 1 do
     begin
        PField := FFields[index];
        StrField := PField^.FDescripcion;
        NewPanel.cbFields.Items.AddObject(StrField, Pointer(PField));
     end;
     {Inicializamos valores del combo box}
     NewPanel.cbFields.OnChange := CambiaCampo;
     NewPanel.cbFields.ItemIndex := 0;
     CambiaCampo(NewPanel.cbFields);
     NewPanel.FPField := FFields[0];
  end;
  {Añadimos un nuevo panel a la lista }
  if Assigned(PanelsList) then
     PanelsList.Add(NewPanel);
end;

procedure TFBusca.RemoveLastPanel;
var
  Panel : TPanelSearch;
  iHeight : integer;
begin
  { Tomamos el puntero del último panel }
  Panel := PanelsList.Items[PanelsList.Count - 1];
  iHeight := Panel.Height;
  Panel.Free;
  { Eliminamos el último panel de la lista }
  PanelsList.Delete(PanelsList.Count - 1);
  { Redimensionamos la pantalla }
  Height := Height - iHeight;
end;

procedure TFBusca.BuildConditionalSQL(Panel: TPanelSearch);
begin
  if ((Panel.edText.Text = '*')) and (Panel.cbCondition.ItemIndex = 0) then
  begin
     Panel.cbCondition.ItemIndex := 2;
     Panel.edText.Text := '';
  end;
  case PFieldRec(Panel.GetActualField)^.Ftipo of
     7, 8: // Se comprueba que el valor introducido es un entero valido
     begin
        Panel.edText.Text := IntToStr(StrToIntDef(Panel.edText.Text, 0));
     end;
     27, 333: // Se comprueba que el valor introducido es un flotante valido
     begin
        try
           Panel.edText.Text := FloatToStr(StrToFloat(Panel.edText.Text));
           Panel.edText.Text := QuitaComaPonPunto(Panel.edText.Text);
        except
           Panel.edText.Text := '0';
        end;
     end;
     35: // Se comprueba que el valor introducido es una fecha valido
     begin
        try
           Panel.edText.Text := DateToStr(StrToDate(Panel.edText.Text));
        except
           Panel.edText.Text := DateToStr(Now);
        end;
     end;
  end;
  { Añade la parte condicional a la sentencia SQL}
  FSQL := FSQL + SQLKind[Panel.Fkind] + PFieldRec(Panel.GetActualField)^.FTable + '.' +
     PFieldRec(Panel.GetActualField)^.FField +
     SQLConditions[Panel.cbCondition.ItemIndex] + '''' + Panel.edText.Text + '''';
end;

procedure TFBusca.CambiaCampo(Sender: TObject);
begin
  case PFieldRec(TLFComboBox(Sender).Items.Objects[TLFComboBox(Sender).ItemIndex]).FTipo of
     7, 8, 14: TPanelSearch(TLFComboBox(Sender).Owner).lbKind.Caption := 'E';
     27, 333: TPanelSearch(TLFComboBox(Sender).Owner).lbKind.Caption := 'N';
     37: TPanelSearch(TLFComboBox(Sender).Owner).lbKind.Caption := 'C';
  end;
end;

procedure TFBusca.BuildNucliSQL;
var
  ix : integer;
begin
  {Nucleo simple}
  FSQL := FSQL + ' from ' + FPTable^.FTable + ' ';
  { Para Construir el nucleo de la sentència SQL}
  {Recorremos el TList donde están los paneles, para ir haciendo los left joins}
  for ix := 0 to PanelsList.Count - 1 do
  begin
     //    Panel:=PanelsList[ix];
     {Comprobamos si la tabla es diferente de la  maestra }
{    if (PFieldRec(Panel.GetActualField)^.FTable)<>(FPTable^.FTable) then
    begin
      FSQL:=FSQL+' LEFT JOIN ';
      FSQL:=FSQL+PFieldRec(Panel.GetActualField)^.FTable+' '+
        PFieldRec(Panel.GetActualField)^.FTable+' ON '+
        FPTable^.FTable+'.'+PFieldRec(Panel.GetActualField)^.FKeyMaster+'='+
        PFieldRec(Panel.GetActualField)^.FTable+'.'+
        PFieldRec(Panel.GetActualField)^.FKey;
    end;                                      }
  end;
end;

procedure TFBusca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  REntorno.ModoEnter := modoreturn;
  Action := caFree;
end;

procedure TFBusca.cbDateClick(Sender: TObject);
begin
  {Guardamos el nuevo indice }
  FPDate := FDates[cbDate.ItemIndex];
end;

procedure TFBusca.tbNoDateClick(Sender: TObject);
begin
  if FDateCount = 0 then
     Exit;
  PnlDate.Enabled := not PnlDate.Enabled;
  if PnlDate.Enabled then
  begin
     PnlDate.Visible := True;
     Height := Height + pnlDate.Height;
  end
  else
  begin
     PnlDate.Visible := False;
     Height := Height - pnlDate.Height;
  end;
end;

function TFBusca.SeleccionaBusqueda(ce: TControlEdit; Tabla: TFIBTableSet; Filtro: string = '00000'; Abrir: boolean = True; Serie: string = ''; Posicion: smallint = 3): integer;
begin
  FControlEdit := ce;
  Result := SeleccionaBusqueda(Tabla, Filtro, Abrir, Serie, Posicion, '');
end;

function TFBusca.SeleccionaBusqueda(Tabla: TFIBTableSet; Filtro: string = '000000'; Abrir: boolean = True; Serie: string = ''; Posicion: smallint = 3; FiltroSql: string = ''): integer;
var
  NomTabla, Campo, Titulo, Orden : string;
  Tipo : integer;
  Salta : boolean;
begin
  Filtros := Filtro;
  NomTabla := Trim(UpperCase(Tabla.TableName));
  PanelsList := TList.Create;
  // Posición del cursor
  Self.PosCursor := Posicion;
  {Creamos un puntero a la estructura de tabla principal }
  New(FPTable);
  FPTable^.FTable := NomTabla;
  FFieldsCount := 0;
  FDateCount := 0;

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT R.CAMPO, T.TITULO, R.TIPO, R.VISIBLE ');
           SelectSQL.Add(' FROM DIC_RELACIONES_CAMPOS R ');
           SelectSQL.Add(' LEFT JOIN DIC_TEXTOS T ON (T.TEXTO = R.TEXTO) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' (R.RELACION = ?RELACION) AND ');
           SelectSQL.Add(' ((T.IDIOMA = ?IDIOMA) OR (T.IDIOMA IS NULL)) ');
           SelectSQL.Add(' ORDER BY R.ORDEN_BUSCADOR, T.TITULO ');
           Params.ByName['RELACION'].AsString := NomTabla;
           Params.ByName['IDIOMA'].AsString := REntorno.IdiomaCanal;
           Open;
           while not EOF do
           begin
              Campo := Trim(FieldByName('CAMPO').AsString);
              Titulo := Trim(FieldByName('TITULO').AsString);
              {dji lrk kri - Si no tiene Titulo asignado, que ponga el nombre del campo}
              if (Titulo = '') then
                 Titulo := Campo;
              Tipo := FieldByName('TIPO').AsInteger;
              Salta := False;
              if FieldByName('VISIBLE').AsInteger = 0 then
                 Salta := True;
              if ((Filtro[1] = '1') and (Campo = 'EMPRESA')) then
                 Salta := True;
              if ((Filtro[2] = '1') and (Campo = 'EJERCICIO')) then
                 Salta := True;
              if ((Filtro[3] = '1') and (Campo = 'CANAL')) then
                 Salta := True;
              if ((Filtro[4] = '1') and (Campo = 'SERIE')) then
                 Salta := True;
              if ((Filtro[5] = '1') and (Campo = 'PAIS')) then
                 Salta := True;
              if ((Filtro[6] = '1') and (Campo = 'PGC')) then
                 Salta := True;
              if (Tipo = 35) then
                 AddDate(Titulo, Campo, NomTabla, '', '', Salta)
              else
                 AddFields(Titulo, Campo, NomTabla, '', '', Tipo, Salta);
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

  SetDateComboBox;
  if Serie <> '' then
     FSerie := Serie
  else
     FSerie := REntorno.Serie;
  AddNewPanelToList(kFirst);

  if REntorno.GuardaFiltros then
     RecuperaFiltro(Tabla);
  Result := ShowModal;

  if (ModalResult = mrOk) or (ModalResult = mrAll) then
  begin
     Orden := ArreglaOrderBY(Tabla.OrdenadoPor);       // Arreglamos la sentencia
     Tabla.Close;
     Tabla.SelectSQL.Text := FSQL + FiltroSQL;
     if Filtro[4] = '1' then
        Tabla.QSelect.Params.ByName['SERIE'].AsString := FSerie;
     Tabla.Ordenar(Orden);
     if Abrir then
        Tabla.Open;
     if REntorno.GuardaFiltros then
        GuardaFiltro(Tabla, Filtro, Abrir, Serie, Posicion);
  end;
  if (ModalResult = mrCancel) then
  begin
     Tabla.Close;
     if Filtro[4] = '1' then
        Tabla.QSelect.Params.ByName['SERIE'].AsString := FSerie;
     if Abrir then
        Tabla.Open;
  end;
end;

procedure TFBusca.act_MasExecute(Sender: TObject);
var
  Paneles : smallint;
begin
  {Añadimos un nuevo panel a la lista}
  AddNewPanelToList(rgKind.ItemIndex);
  Paneles := PanelsList.Count;
  if Paneles > 1 then
     act_Menos.Enabled := True;
  TPanelSearch(PanelsList[Paneles - 1]).edText.SetFocus;
end;

procedure TFBusca.act_ConfirmarExecute(Sender: TObject);
var
  ix : integer;
begin
  FSQL := 'select * ';
  BuildNucliSQL;
  FSQL := FSQL + ' where ';
  if PanelsList.Count > 0 then
     FSQL := FSQL + '(';
  for ix := 0 to PanelsList.Count - 1 do
  begin
     BuildConditionalSQL(PanelsList[ix]);
  end;
  if PanelsList.Count > 0 then
     FSQL := FSQL + ')';
  if (PanelsList.Count > 0) and (Filtros <> '00000') then
     FSQL := FSQL + ' and';
  if Filtros[1] = '1' then
     FSQL := FSQL + ' empresa=' + REntorno.EmpresaStr;
  if Filtros[2] = '1' then
     FSQL := FSQL + ' and Ejercicio=' + REntorno.EjercicioStr;
  if Filtros[3] = '1' then
     FSQL := FSQL + ' and Canal=' + REntorno.CanalStr;
  if Filtros[4] = '1' then
     FSQL := FSQL + ' and serie=?serie';
  if Filtros[5] = '1' then
     FSQL := FSQL + ' and pais=''' + REntorno.Pais + '''';
  if Filtros[6] = '1' then
     FSQL := FSQL + ' and Pgc=' + IntToStr(REntorno.Pgc);
  {Comprovem si tenim Date's actives}
  if ((FDateCount <> 0) and (PnlDate.Enabled)) then
  begin
     FSQL := FSQL + ' and ' + FPDate^.FTable + '.' + FPDate^.FField + ' between ''' +
        FormatDateTime('mm-dd-yyyy', cbDateFirst.Date) +
        FormatDateTime(' hh:nn:ss', cbTimeFirst.Time) + ''' and ''' +
        FormatDateTime('mm-dd-yyyy', cbDateLast.Date) +
        FormatDateTime(' hh:nn:ss', cbTimeLast.Time) + '''';
  end;

  ModalResult := mrOk;
end;

procedure TFBusca.act_CancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFBusca.act_MenosExecute(Sender: TObject);
begin
  if PanelsList.Count = 2 then
     act_Menos.Enabled := False;
  RemoveLastPanel;
end;

procedure TFBusca.act_NoFiltroExecute(Sender: TObject);
var
  andStr : string;
begin
  FSQL := 'select * ';
  andStr := '';
  BuildNucliSQL;
  FSQL := FSQL + ' where 1=1';
  if Filtros[1] = '1' then
     FSQL := FSQL + ' and empresa=' + REntorno.EmpresaStr;
  if Filtros[2] = '1' then
     FSQL := FSQL + ' and Ejercicio=' + REntorno.EjercicioStr;
  if Filtros[3] = '1' then
     FSQL := FSQL + ' and Canal=' + REntorno.CanalStr;
  if Filtros[4] = '1' then
     FSQL := FSQL + ' and serie=?SERIE';
  if Filtros[5] = '1' then
     FSQL := FSQL + ' and pais=''' + REntorno.Pais + '''';
  if Filtros[6] = '1' then
     FSQL := FSQL + ' and Pgc=' + IntToStr(REntorno.Pgc);
  ModalResult := mrAll;
end;

procedure TFBusca.AddFields(Descripcion, Field, Table, Key, KeyMaster: string; Tipo: integer; Filtra: boolean);
var
  PRecord : PFieldRec;
begin
  if not Filtra then
  begin
     {Redimensionem l'array}
     SetLength(FFields, FFieldsCount + 1);
     {Creem un nou punter}
     New(PRecord);
     {Posem les dades d'entrada}
     PRecord^.FDescripcion := Descripcion;
     PRecord^.FField := Field;
     PRecord^.FTable := Table;
     PRecord^.FKey := Key;
     PRecord^.FKeyMaster := KeyMaster;
     PRecord^.FFiltra := Filtra;
     PRecord^.FTipo := Tipo;
     { Guardem el punter dins de l'array}
     FFields[FFieldsCount] := PRecord;
     {Incrementem el valor dels Fields guardats}
     Inc(FFieldsCount);
  end;
end;

procedure TFBusca.AddDate(Descripcion, Field, Table, Key, KeyMaster: string; Filtra: boolean);
var
  PRecord : PFieldDate;
begin
  if not Filtra then
  begin
     {Redimensionamos el array}
     SetLength(FDates, FDateCount + 1);
     {Creamos un nuevo puntero}
     New(PRecord);
     {Asignamos los parámetros}
     PRecord^.FDescripcion := Descripcion;
     PRecord^.FField := Field;
     PRecord^.FTable := Table;
     PRecord^.FKey := Key;
     {Guardamos el puntero en el array}
     FDates[FDateCount] := PRecord;
     {Incrementamos el valor de los campos guardados }
     Inc(FDateCount);
  end;
end;

procedure TFBusca.FormShow(Sender: TObject);
var
  PanelAct : TPanelSearch;
  i : integer;
begin
  tbNoDateClick(Sender);
  PanelAct := PanelsList.Last;
  if RFiltro.HayFiltro then
  begin
     Self.PosCursor := RFiltro.Posicion;
     PanelAct.cbFields.ItemIndex := RFiltro.cbFields;
     PanelAct.cbCondition.ItemIndex := RFiltro.cbCondition;
     PanelAct.edText.Text := RFiltro.EdText;
  end;
  if ((fControlEdit <> nil) and (fControlEdit.PoPupField <> nil) and not fControlEDit.PopUpMenu.wasShortCut
     ) then
  begin
     Self.posCursor := 3;
     for i := 0 to PanelAct.cbFields.items.Count - 1 do
        if PFieldRec(PanelAct.cbFields.Items.Objects[i])^.FField =
           FControlEdit.PopUpField.FieldName then
        begin
           PanelAct.cbFields.ItemIndex := I;
           CambiaCampo(PanelAct.cbFields);
        end;
  end;
  if PanelAct.cbFields.ItemIndex > 0 then
     PanelAct.FPField := FFields[PanelAct.cbFields.ItemIndex];
  case Self.PosCursor of
     0: rgKind.SetFocus;
     1: PanelAct.cbFields.SetFocus;
     2: PanelAct.cbCondition.SetFocus;
     3: PanelAct.edText.SetFocus;
  end;
end;

procedure TFBusca.GuardaFiltro(Tabla: TFIBTableSet; Filtro: string; Abrir: boolean; Serie: string; Posicion: smallint);
var
  cDataModule, cTableSet, cPosicion, sCBFields, scbCondition, Cadena : string;
  PanelAct : TPanelSearch;
  YaExiste : boolean;
begin
  cDataModule := Tabla.Owner.Name;
  cTableSet := Tabla.Name;
  cPosicion := IntToStr(Posicion);
  PanelAct := PanelsList.Last;
  scbFields := IntToStr(PanelAct.cbFields.ItemIndex);
  scbCondition := IntToStr(PanelAct.cbCondition.ItemIndex);
  Cadena := Copy(PanelAct.edText.Text, 1, 31);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT USUARIO FROM SYS_USUARIOS_FILTROS ');
        SQL.Add(' WHERE ');
        SQL.Add(' USUARIO=' + REntorno.UsuarioStr);
        SQL.Add(' AND DATAMODULE=''' + cDataModule + '''');
        SQL.Add(' AND TABLESET=''' + cTableSet + '''');
        SQL.Add(' AND EMPRESA=' + REntorno.EmpresaStr);
        SQL.Add(' AND EJERCICIO=' + REntorno.EjercicioStr);
        SQL.Add(' AND CANAL=' + REntorno.CanalStr);
        ExecQuery;
        YaExiste := (FieldByName['USUARIO'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if YaExiste then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE SYS_USUARIOS_FILTROS ');
           SQL.Add(' SET ');
           SQL.Add(' POSICION=' + cPosicion);
           SQL.Add(' ,CBFIELDS=' + scbFields);
           SQL.Add(' ,CBCONDITION=' + scbCondition);
           SQL.Add(' ,EDTEXT=''' + Cadena + '''');
           SQL.Add(' WHERE ');
           SQL.Add(' USUARIO=' + REntorno.UsuarioStr);
           SQL.Add(' AND DATAMODULE=''' + cDataModule + '''');
           SQL.Add(' AND TABLESET=''' + cTableSet + '''');
           SQL.Add(' AND EMPRESA=' + REntorno.EmpresaStr);
           SQL.Add(' AND EJERCICIO=' + REntorno.EjercicioStr);
           SQL.Add(' AND CANAL=' + REntorno.CanalStr);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO SYS_USUARIOS_FILTROS( ');
           SQL.Add(' USUARIO, DATAMODULE, TABLESET, EMPRESA, EJERCICIO, CANAL, POSICION, CBFIELDS, CBCONDITION, EDTEXT) ');
           SQL.Add(' VALUES ');
           SQL.Add('(' + REntorno.UsuarioStr + ',''' + cDataModule + ''',''' + cTableSet + ''',' + REntorno.EmpresaStr + ',' +
              REntorno.EjercicioStr + ',' + REntorno.CanalStr + ',' + cPosicion + ',' + sCBFields + ',' + scbCondition + ',''' + Cadena + ''')');
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFBusca.RecuperaFiltro(Tabla: TFIBTableSet);
var
  cDataModule, cTableSet : string;
begin
  RFiltro.HayFiltro := False;
  cDataModule := Tabla.Owner.Name;
  cTableSet := Tabla.Name;

  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT * FROM SYS_USUARIOS_FILTROS ');
           SQL.Add(' WHERE ');
           SQL.Add(' USUARIO=' + REntorno.UsuarioStr);
           SQL.Add(' AND DATAMODULE=''' + cDataModule + '''');
           SQL.Add(' AND TABLESET=''' + cTableSet + '''');
           SQL.Add(' AND EMPRESA=' + REntorno.EmpresaStr);
           SQL.Add(' AND EJERCICIO=' + REntorno.EjercicioStr);
           SQL.Add(' AND CANAL=' + REntorno.CanalStr);
           ExecQuery;
           if (FieldByName['USUARIO'].AsInteger <> 0) then
           begin
              RFiltro.HayFiltro := True;
              RFiltro.Posicion := FieldByName['POSICION'].AsInteger;
              RFiltro.cbFields := FieldByName['CBFIELDS'].AsInteger;
              RFiltro.cbCondition := FieldByName['CBCONDITION'].AsInteger;
              RFiltro.EdText := FieldByName['EDTEXT'].AsString;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     RFiltro.HayFiltro := False;
  end;
end;

procedure TFBusca.FormCreate(Sender: TObject);
begin
  // Inicializamos las fechas
  TranslateComponent(Self); //IDIOMA_CODE

  cbDateFirst.Date := REntorno.FechaTrabSH;
  cbDateLast.Date := REntorno.FechaTrabSH;
  cbTimeFirst.Time := StrToTime('00:00:00');
  cbTimeLast.Time := StrToTime('23:59:59');

  modoreturn := REntorno.ModoEnter;
  REntorno.ModoEnter := 0;

  HelpFile := REntorno.FicheroAyuda;
  HelpType := htKeyword;
  HelpKeyword := 'FBUSCA';
end;

function TFBusca.QuitaComaPonPunto(Parametro: string): string;
var
  Posicion : integer;
  STemp : string;
begin
  Result := '';
  Posicion := Pos(',', Parametro);
  if Posicion = 0 then
     Result := Parametro
  else
  begin
     // Tenemos el final de la cadena despues de la coma
     STemp := Copy(Parametro, Posicion + 1, (Length(Parametro) - Posicion + 1));
     Result := Copy(Parametro, 1, Length(Parametro) - (Length(Parametro) - Posicion + 1));
     Result := Result + '.' + Stemp;
  end;
end;

// Procedimiento que arregla una sentecia OrderBy quitandole los identificadores de tablas (alias)
//   (PEjem: VER.RIG, VER.EJERCICIO => RIG,EJERCICIO)
function TFBusca.ArreglaOrderBY(orden: string): string;
var
  aux : string;
begin
  if (Pos('.', orden) > 0) then {dji lrk kri - Si no tiene alias, que no haga nada}
  begin
     aux := '';
     orden := orden + ',';                 // centinela
     repeat
        Delete(orden, 1, Pos('.', orden));
        aux := aux + Trim(Copy(orden, 1, Pos(',', orden)));
     until (Pos('.', orden) = 0);
     Result := Copy(aux, 0, Length(aux) - 1);  // quitamos centinela
  end
  else
     Result := orden;
end;

procedure TFBusca.act_ConfigurarExecute(Sender: TObject);
begin
  TFBuscaConfiguracion.Create(Self).Configurar(Trim(UpperCase(FPTable^.FTable)));
end;

end.
