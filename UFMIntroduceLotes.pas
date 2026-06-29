unit UFMIntroduceLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, UHYDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ComCtrls, UEditPanel, StdCtrls, ToolWin,
  Mask, DBCtrls, Buttons, rxToolEdit, ULFDBEdit, ULFToolBar, ULFEdit,
  ULFPanel, ULFEditFind2000, ULFLabel, ULFDBEditFind2000, ULFComboBox,
  TFlatCheckBoxUnit, ULFCheckBox, ULFMemo, ULFDateEdit, HYFIBQuery;

type
  TFMIntroduceLotes = class(TG2KForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     LBLAlmacen: TLFLabel;
     LBLClasificacion: TLFLabel;
     LBLFFAbricacion: TLFLabel;
     LBLFENvasado: TLFLabel;
     LBLFCaducidad: TLFLabel;
     HYMEditPanel1: THYMEditPanel;
     EArticulo: TLFEdit;
     ETituloArticulo: TLFEdit;
     LArticulo: TLFLabel;
     ToolButton2: TToolButton;
     TBAbrirLote: TToolButton;
     EClasificacion: TLFEdit;
     DTPFFabricacion: TLFDateEdit;
     DTPFEnvasado: TLFDateEdit;
     DTPFCaducidad: TLFDateEdit;
     EStock: TLFEdit;
     LStock: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     TButtEtiquetas: TToolButton;
     EDescAlmacen: TLFEdit;
     EFAlmacenDST: TLFEditFind2000;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     EDescProveedor: TLFEdit;
     LIDLote: TLFLabel;
     TBEliminaReetiquetado: TToolButton;
     ELote: TLFEdit;
     LFIdLote: TLFLabel;
     ELoteNuevo: TLFEdit;
     EFLote: TLFEditFind2000;
     BtAceptar1: TButton;
     LNotas: TLFLabel;
     MNotas: TLFMemo;
     LFMedida1: TLFLabel;
     LFEMedida1: TLFEdit;
     LFMedida2: TLFLabel;
     LFEMedida2: TLFEdit;
     LFMedida3: TLFLabel;
     LFEMedida3: TLFEdit;
     LFMedida4: TLFLabel;
     LFEMedida4: TLFEdit;
     SBNuevo: TButton;
     SBLibre: TButton;
     procedure FormCreate(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure TBAbrirLoteClick(Sender: TObject);
     procedure SBLibreClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtEtiquetasClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure TBEliminaReetiquetadoClick(Sender: TObject);
     procedure EFLoteBusqueda(Sender: TObject);
     procedure EFLoteChange(Sender: TObject);
     procedure SBNuevoClick(Sender: TObject);
     procedure BtAceptar1Click(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     BotonSalir: boolean;
     TipoEntrada: boolean;
     FIDLote, FIDUbicacion: integer;
     UnidadesMinimas: real;
     Tipo, Serie: string;
     Ejercicio, CanalOri, CanalDst, RIG, Linea: integer;
     id_doc, id_a: integer;
     Proveedor: integer;
     procedure Habilita(PuedeEditar: boolean);
     procedure ColoreaSeleccion;
     procedure ColoreaInsercion;
     procedure AbreEditFind;
     function ExisteLoteConMismaClasificacion: boolean;
  public
     { Public declarations }
     function AsignaArticulo(aTipo, aSerie, Articulo: string; aEjercicio, aRIG, aLinea: integer; Unidades: double; AlmacenDocOri, AlmacenDocDst: string; aCanalOri, aCanalDst: integer; PuedeEditar: boolean; aid_a, aid_doc, aProveedor: integer; aTipoEntrada: boolean): integer;
     property IDLote: integer Read FIDLote;
     property IDUbicacion: integer Read FIDUbicacion;
  end;

var
  FMIntroduceLotes : TFMIntroduceLotes;

implementation

uses UDMMain, UDMIntroduceLotes, UEntorno, UFPregEtiquetasLotes, UUtiles, UDameDato, UParam;

{$R *.dfm}

procedure TFMIntroduceLotes.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMIntroduceLotes, DMIntroduceLotes);
  BotonSalir := True;
  ColoreaSeleccion;

  FIDLote := 0;
  FIDUbicacion := 0;
end;

function TFMIntroduceLotes.AsignaArticulo(aTipo, aSerie, Articulo: string; aEjercicio, aRIG, aLinea: integer; Unidades: double; AlmacenDocOri, AlmacenDocDst: string; aCanalOri, aCanalDst: integer; PuedeEditar: boolean; aid_a, aid_doc, aProveedor: integer; aTipoEntrada: boolean): integer;
var
  Larticulo, NroSerie, clasificacion, LoteAnterior : string;
  Lote : string;
  FFabricacion, FCaducidad, FEnvasado : TDateTime;
  stock : real;
  idReetiquetado : integer;
  AlmacenOri, AlmacenDst : string;
begin
  { TODO : Para que sirve esta variable? (stock) }
  stock := 0;
  EArticulo.Text := Articulo;
  ETituloArticulo.Text := DameTituloArticulo(Articulo);

  Ejercicio := aEjercicio;
  CanalOri := aCanalOri;
  CanalDst := aCanalDst;
  id_doc := aid_doc;
  id_a := aid_a;
  AlmacenOri := AlmacenDocOri;
  AlmacenDst := AlmacenDocDst;
  Tipo := aTipo; // Estas 4 variables se usarán después a la hora de insertar
  RIG := aRIG;
  Linea := aLinea;
  Serie := aSerie; // Ojo! esto es la serie del canal y no el nº de serie.
  TipoEntrada := aTipoEntrada; // TieneReetiquetado = (QMCabeceraTIPO_OPERACION.AsString = 'E')

  if not TipoEntrada then
     TBEliminaReetiquetado.Visible := False;

  DMIntroduceLotes.DameDatos(Tipo, Serie, Articulo, Ejercicio, RIG, Linea, id_doc, AlmacenDocOri,
     AlmacenDocDst, Larticulo, NroSerie, Clasificacion, Lote, CanalOri, CanalDst,
     FFabricacion, FCaducidad, FEnvasado, aProveedor, FIDLote, idReetiquetado, LoteAnterior);

  if (TipoEntrada) then
     UnidadesMinimas := 0
  else
     UnidadesMinimas := Unidades;

  if (aProveedor = 0) then
     Proveedor := aProveedor;

  if (FFabricacion = 0) then
     FFabricacion := REntorno.FechaTrabSH;
  if (FEnvasado = 0) then
     FEnvasado := REntorno.FechaTrabSH;
  if (FCaducidad = 0) then
     FCaducidad := REntorno.FechaTrabSH;
  if (FIDLote <> 0) then
     EFLote.Text := IntToStr(IDLote);

  if (Lote = '0') then
     ELote.Text := ''
  else
     ELote.Text := Lote;

  if (Proveedor = 0) then
     EFProveedor.Text := ''
  else
     EFProveedor.Text := IntToStr(Proveedor);

  // ENroSerie.Text := NroSerie;
  EClasificacion.Text := clasificacion;
  DTPFFabricacion.Date := ffabricacion;
  DTPFEnvasado.Date := fEnvasado;
  DTPFCaducidad.Date := fCaducidad;
  EStock.Text := FloatToStr(Stock); // FloatToStr(Unidades);
  if (Tipo = 'REG') then
     EStock.Text := FloatToStr(Unidades);

  if (AlmacenDocOri <> '') then
     AlmacenOri := AlmacenDocOri;
  EFAlmacen.Text := AlmacenOri;
  EFAlmacenDST.Text := AlmacenDst;
  if (EFAlmacen.Text = EFAlmacenDST.Text) then
     EFAlmacenDST.Visible := False;

  Habilita(PuedeEditar);

  TBEliminaReetiquetado.Visible := (idReetiquetado > 0);

  EFLoteChange(Self); // Para que asigne el proveedor
  ShowModal;
  Result := FIDLote;
end;

procedure TFMIntroduceLotes.EFAlmacenChange(Sender: TObject);
begin
  if (EFAlmacen.Text <> '') then
     EDescAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMIntroduceLotes.TBAbrirLoteClick(Sender: TObject);
begin
  DMIntroduceLotes.AbreLotes(FIDLote);
end;

procedure TFMIntroduceLotes.SBLibreClick(Sender: TObject);
begin
  {Si salgo sin asignar, no asigno ni lote ni ubicacion}
  FIDLote := 0;
  FIDUbicacion := 0;
  Close;
end;

procedure TFMIntroduceLotes.Habilita(PuedeEditar: boolean);
begin
  if (PuedeEditar) then
  begin
     EFLote.Enabled := True;
     EFLote.Font.Color := clWindowText;
     EFLote.Color := clWindow;
     EClasificacion.Enabled := True;
     EClasificacion.Font.Color := clWindowText;
     EClasificacion.Color := clWindow;
     DTPFFabricacion.Enabled := True;
     DTPFFabricacion.Font.Color := clWindowText;
     DTPFFabricacion.Color := clWindow;
     DTPFEnvasado.Enabled := True;
     DTPFEnvasado.Font.Color := clWindowText;
     DTPFEnvasado.Color := clWindow;
     DTPFCaducidad.Enabled := True;
     DTPFCaducidad.Font.Color := clWindowText;
     DTPFCaducidad.Color := clWindow;
  end
  else
  begin
     EFLote.Enabled := False;
     EFLote.Font.Color := clGrayText;
     EFLote.Color := clInfoBk;
     EFAlmacen.Enabled := False;
     EFAlmacen.Font.Color := clGrayText;
     EFAlmacen.Color := clInfoBk;
     EClasificacion.Enabled := False;
     EClasificacion.Font.Color := clGrayText;
     EClasificacion.Color := clInfoBk;
     DTPFFabricacion.Enabled := False;
     DTPFFabricacion.Font.Color := clGrayText;
     DTPFFabricacion.Color := clInfoBk;
     DTPFEnvasado.Enabled := False;
     DTPFEnvasado.Font.Color := clGrayText;
     DTPFEnvasado.Color := clInfoBk;
     DTPFCaducidad.Enabled := False;
     DTPFCaducidad.Font.Color := clGrayText;
     DTPFCaducidad.Color := clInfoBk;
     SBNuevo.Visible := False;
     BtAceptar1.Visible := False;
     EDescProveedor.Text := '';
  end;
end;

procedure TFMIntroduceLotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMIntroduceLotes);
end;

procedure TFMIntroduceLotes.TButtEtiquetasClick(Sender: TObject);
begin
  TFPregEtiquetasLotes.Create(Self).Muestrate(1, StrToIntDef(EStock.Text, 0), FIDLote,
     EArticulo.Text, ETituloArticulo.Text, '' {NroSerie}, EClasificacion.Text,
     DTPFFabricacion.Date,
     DTPFCaducidad.Date, DTPFEnvasado.Date);
end;

procedure TFMIntroduceLotes.EFProveedorChange(Sender: TObject);
begin
  EDescProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMIntroduceLotes.TBEliminaReetiquetadoClick(Sender: TObject);
begin
  DMIntroduceLotes.EliminaReetiquetado(id_doc, Tipo);
  Self.Close;
end;

procedure TFMIntroduceLotes.EFLoteBusqueda(Sender: TObject);
begin
  {Modificamos la tabla a buscar, para que tire de un Stored Procedure
   El procedimiento nos devolverá ID_LOTE,ID_UBICACION en el campo INFO_COMPUESTA
   Con esta información se rellenaran los datos que sean necesarios}

  with EFLote do
  begin
     {Todo : Que muestre la columna de ID_Ubicacion, solo si es ubicable}
     if (Tipo = 'COM') then
        Tabla_a_buscar := 'A_ART_DAME_STOCK_LOTE_UBIC(' + REntorno.EmpresaStr + ',''' + EArticulo.Text + ''',' + REntorno.CanalStr + ',''   '', -1)'
     else
        Tabla_a_buscar := 'A_ART_DAME_STOCK_LOTE_UBIC(' + REntorno.EmpresaStr + ',''' + EArticulo.Text + ''',' + REntorno.CanalStr + ',''' + EFAlmacen.Text + ''', -1)';

     CampoNum := 'INFO_COMPUESTA';
     CampoStr := 'LOTE';
     Campos_Desplegar.Clear;
     Campos_Desplegar.Add('F_FABRICACION');
     Campos_Desplegar.Add('CLASIFICACION');
     Campos_Desplegar.Add('TITULO_UBICACION');
     Campos_Desplegar.Add('STOCK');
     //Si el modulo de etiquetas esta activo agregamos las medidas en la seleccion de lote
     if (LeeParametro('MODREST008') = 'S') then
     begin
        Campos_Desplegar.Add('MEDIDA1');
        Campos_Desplegar.Add('MEDIDA2');
        Campos_Desplegar.Add('MEDIDA3');
     end;

     CondicionBusqueda := '(ARTICULO=''' + EArticulo.Text + ''')';

     if (not TipoEntrada) then
        CondicionBusqueda := CondicionBusqueda + ' AND (STOCK > 0)'; // + ' AND (STOCK >= ' + FloatToStrDec(UnidadesMinimas, '.') + ')';

     if (DMIntroduceLotes.Insercion) then
        if (StrToIntDef(EFProveedor.Text, 0) <> 0) then
           CondicionBusqueda := CondicionBusqueda + ' AND (PROVEEDOR=' + EFProveedor.Text + ')';
  end;
end;

procedure TFMIntroduceLotes.EFLoteChange(Sender: TObject);
var
  Lote, Clasificacion : string;
  Proveedor : integer;
  Notas : TStrings;
  medida1, medida2, medida3, medida4, stock : double;
  f_envasado, f_caducidad, f_fabricacion : TDateTime;
begin
  // Desdoblo la información que me da el EditFind 'IDLote,IDUbicacion'
  FIDLote := StrToIntDef(Copy(EFLote.Text, 1, Pos('-', EFLote.Text) - 1), 0);
  FIDUbicacion := StrToIntDef(Copy(EFLote.Text, Pos('-', EFLote.Text) + 1, Length(EFLote.Text)), 0);

  if ((FIDLote = 0) and (EFLote.Text <> '')) then
     FIDLote := StrToInt(EFLote.Text);

  Proveedor := StrToIntDef(EFProveedor.Text, 0);

  if (not DMIntroduceLotes.Insercion) then
  begin
     Notas := TStringList.Create;
     try
        DMIntroduceLotes.DameDatosLote(FIDLote, Lote, Proveedor, Notas, medida1, medida2, medida3, medida4, f_envasado, f_caducidad, f_fabricacion, stock, Clasificacion);
        if (DMMain.EstadoKri(491) = 1) then
           ELote.Text := Clasificacion
        else
           ELote.Text := Lote;

        EFProveedor.Text := IntToStr(Proveedor);
        MNotas.Lines.Assign(Notas);
        LFEMedida1.Text := FloatToStr(medida1);
        LFEMedida2.Text := FloatToStr(medida2);
        LFEMedida3.Text := FloatToStr(medida3);
        LFEMedida4.Text := FloatToStr(medida4);
        DTPFEnvasado.Date := f_envasado;
        DTPFCaducidad.Date := f_caducidad;
        DTPFFabricacion.Date := f_fabricacion;
        if (Tipo <> 'REG') then
           EStock.Text := FloatToStr(stock);
     finally
        Notas.Free;
     end;
  end;
end;

procedure TFMIntroduceLotes.ColoreaSeleccion;
begin
  DMIntroduceLotes.Insercion := False;

  EFProveedor.Enabled := False;
  DTPFFabricacion.Enabled := False;
  DTPFEnvasado.Enabled := False;
  DTPFCaducidad.Enabled := False;
  EClasificacion.Enabled := False;
  MNotas.Enabled := False;

  EFProveedor.Color := clInfoBk;
  DTPFFabricacion.Color := clInfoBk;
  DTPFEnvasado.Color := clInfoBk;
  DTPFCaducidad.Color := clInfoBk;
  EClasificacion.Color := clInfoBk;
  MNotas.Color := clInfoBk;

  LFIdLote.Visible := True;
  ELote.Visible := True;
  EFLote.Visible := True;
  ELoteNuevo.Visible := False;
  SBNuevo.Visible := True;

  EFProveedor.TabStop := False;
  DTPFCaducidad.TabStop := False;
  EClasificacion.TabStop := False;
  MNotas.TabStop := False;

  LIDLote.Caption := _('Id Lote');
end;

procedure TFMIntroduceLotes.ColoreaInsercion;
begin
  DMIntroduceLotes.Insercion := True;

  EFProveedor.Enabled := True;
  DTPFFabricacion.Enabled := True;
  DTPFEnvasado.Enabled := True;
  DTPFCaducidad.Enabled := True;
  EClasificacion.Enabled := True;
  MNotas.Enabled := True;

  EFProveedor.Color := clWindow;
  DTPFFabricacion.Color := clWindow;
  DTPFEnvasado.Color := clWindow;
  DTPFCaducidad.Color := clWindow;
  EClasificacion.Color := clWindow;
  MNotas.Color := clWindow;

  LFIdLote.Visible := False;
  ELote.Visible := False;
  EFLote.Visible := False;
  ELoteNuevo.Visible := True;
  SBNuevo.Visible := False;

  EFProveedor.TabStop := True;
  DTPFFabricacion.TabStop := True;
  DTPFEnvasado.TabStop := True;
  DTPFCaducidad.TabStop := True;
  EClasificacion.TabStop := True;
  MNotas.TabStop := True;

  EClasificacion.Text := '';
  LIDLote.Caption := _('Lote');
  DTPFFabricacion.Date := Now;
  ELoteNuevo.SetFocus;

  //sfg.albert
  LFEMedida1.Color := clWindow;
  LFEMedida1.ReadOnly := False;
  LFEMedida1.Enabled := True;
  LFEMedida1.Font.Color := clWindowText;

  LFEMedida2.Color := clWindow;
  LFEMedida2.ReadOnly := False;
  LFEMedida2.Enabled := True;
  LFEMedida2.Font.Color := clWindowText;

  LFEMedida3.Color := clWindow;
  LFEMedida3.ReadOnly := False;
  LFEMedida3.Enabled := True;
  LFEMedida3.Font.Color := clWindowText;

  LFEMedida4.Color := clWindow;
  LFEMedida4.ReadOnly := False;
  LFEMedida4.Enabled := True;
  LFEMedida4.Font.Color := clWindowText;
end;

procedure TFMIntroduceLotes.SBNuevoClick(Sender: TObject);
begin
  ColoreaInsercion;
  LFEMedida1.Text := '0';
  LFEMedida2.Text := '0';
  LFEMedida3.Text := '0';
  LFEMedida4.Text := '0';
  EFProveedor.Text := '-1';
  // Aquí verificamos que tenga lote descripción y si tiene cramos nuevo con esa descripción
  if (ELote.Text <> '') then
  begin
     if (DMMain.EstadoKri(491) = 1) then
     begin
        ELoteNuevo.Text := '';
        ELoteNuevo.ReadOnly := True;
     end
     else
        ELoteNuevo.Text := ELote.Text;

     EClasificacion.Text := ELote.Text;
  end
  else
     ELoteNuevo.Text := DMMain.DameLoteSiguiente(id_a, RIG, Tipo);
  ;
end;

procedure TFMIntroduceLotes.BtAceptar1Click(Sender: TObject);
var
  CrearLote : boolean;
begin
  CrearLote := True;

  // Aqui verificamos si ya existe la clasificacion para ese compuesto
  if (ExisteLoteConMismaClasificacion) then
  begin
     if (not ConfirmaMensaje(_('Ya existe un compuesto con esta clasificación desea continuar?'))) then
     begin
        FIDLote := 0;
        FIDUbicacion := 0;
        CrearLote := False;
     end;
  end;

  if (CrearLote) then
  begin
     if (DMIntroduceLotes.Insercion) then
     begin
        ELote.Text := ELoteNuevo.Text;
        EFLote.Text := '0';
     end;

     FIDLote := DMIntroduceLotes.GrabaLote(Ejercicio, CanalOri, CanalDst, Serie,
        Tipo, EArticulo.Text,
        ELote.Text, EFalmacen.Text, EFalmacenDST.Text,
        EClasificacion.Text, '' {NroSerie}, EStock.Text,
        RIG, Linea, DTPFFabricacion.Date,
        DTPFEnvasado.Date, DTPFCaducidad.Date, id_doc, id_a, StrToInt(EFProveedor.Text),
        FIDLote, '' {NuevoLote}, MNotas.Lines, StrToFloat(LFEMedida1.Text), StrToFloat(LFEMedida2.Text), StrToFloat(LFEMedida3.Text), StrToFloat(LFEMedida4.Text));
  end;

  Close;
end;

procedure TFMIntroduceLotes.AbreEditFind;
var
  SalirSiVacio, SalirSiNoExiste : boolean;
begin
  // Este procedimiento despliega la búsqueda del EditFind
  SalirSiVacio := EFLote.SalirSiVacio;
  SalirSiNoExiste := EFLote.SalirSiNoExiste;
  EFLote.SalirSiVacio := False;
  EFLote.SalirSiNoExiste := False;
  Application.ProcessMessages; // Para que se muestre el form, si todavía no lo hizo
  EFLote.SetFocus;
  BtAceptar1.SetFocus;
  EFLote.SalirSiVacio := SalirSiVacio;
  EFLote.SalirSiNoExiste := SalirSiNoExiste;
end;

procedure TFMIntroduceLotes.FormShow(Sender: TObject);
begin
  {Despliego automaticamente el EditFind si es una salida}
  if (((Tipo = 'MAN') or (Tipo = 'ALB')) and (not TipoEntrada)) then
     AbreEditFind;
end;

function TFMIntroduceLotes.ExisteLoteConMismaClasificacion: boolean;
begin
  if (Trim(EClasificacion.Text) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT FIRST 1 EMPRESA FROM ART_ARTICULOS_LOTES WHERE EMPRESA = :EMPRESA AND CLASIFICACION = :CLASIFICACION AND ARTICULO = :ARTICULO ';
           Params.ByName['CLASIFICACION'].AsString := Trim(EClasificacion.Text);
           Params.ByName['ARTICULO'].AsString := EArticulo.Text;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;
           Result := (FieldByName['EMPRESA'].AsInteger > 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     Result := False;
end;

end.
