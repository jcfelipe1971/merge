unit UFMSeleccion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, ULFEdit, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel,
  ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Mask, rxToolEdit,
  ULFDateEdit, ULFLabel;

type
  TFMSeleccion = class(TFPEditSinNavegador)
     LTipo: TLFLabel;
     EFCodigo: TLFEditFind2000;
     ETitulo: TLFEdit;
     TBOk: TToolButton;
     ToolButton2: TToolButton;
     DateEdit: TLFDateEdit;
     DTPHora: TDateTimePicker;
     EntornoBusqueda: TEntornoFind2000;
     procedure TBOkClick(Sender: TObject);
     procedure EFCodigoChange(Sender: TObject);
     procedure OnKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormShow(Sender: TObject);
     procedure EFCodigoBusqueda(Sender: TObject);
     procedure EFCodigoExiste(Sender: TObject);
     procedure EFCodigoNoExiste(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     AceptarConEnter: boolean;
     Tipo: string;
     procedure Inicializa(aTipo: string; aCaption: string; aCondicionBusqueda: string; aEmpresa: integer; aEjercicio: integer; aCanal: integer);
  public
     { Public declarations }
  end;

var
  FMSeleccion : TFMSeleccion;

function PideDato(aTipo: string; var Valor: double; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
function PideDato(aTipo: string; var Valor: integer; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
function PideDato(aTipo: string; var Valor: string; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
function PideDato(aTipo: string; var Valor: TDateTime; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
function PideDato(aTipo: string; var Valor: string; var ValorF: TDateTime; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;

implementation

uses UDMMain, UFormGest, DateUtils, UEntorno, UDameDato, UFMain, HYFIBQuery;

{$R *.dfm}

function PideDato(aTipo: string; var Valor: double; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
begin
  AbreForm(TFMSeleccion, FMSeleccion);
  try
     with FMSeleccion do
     begin
        Inicializa(aTipo, aCaption, aCondicionBusqueda, aEmpresa, aEjercicio, aCanal);
        if (Valor <> 0) then
           ETitulo.Text := FloatToStr(Valor)
        else
           ETitulo.Text := '0';
        ETitulo.SelectAll;

        // Oculto para mostrar en modo Modal
        Hide;
        ShowModal;

        FMain.AddComponenteReturn(ETitulo);
        try
           Result := False;
           if (ModalResult = mrOk) then
           begin
              Result := True;
              Valor := StrToFloat(StringReplace(ETitulo.Text, ThousandSeparator, '', [rfReplaceAll]));
           end;
        finally
           FMain.DelComponenteReturn(ETitulo);
        end;
     end;
  finally
     CierraForm(FMSeleccion);
  end;
end;

function PideDato(aTipo: string; var Valor: integer; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
begin
  AbreForm(TFMSeleccion, FMSeleccion);
  try
     with FMSeleccion do
     begin
        Inicializa(aTipo, aCaption, aCondicionBusqueda, aEmpresa, aEjercicio, aCanal);
        if (Valor <> 0) then
        begin
           if (aTipo = 'INT') then
           begin
              ETitulo.Text := IntToStr(Valor);
              ETitulo.SelectAll;
           end
           else
           begin
              EFCodigo.Text := IntToStr(Valor);
              EFCodigo.SelectAll;
           end;
        end;

        // Oculto para mostrar en modo Modal
        Hide;
        ShowModal;

        Result := False;
        if (ModalResult = mrOk) then
        begin
           Result := True;
           if (aTipo = 'INT') then
              Valor := StrToInt(ETitulo.Text)
           else
              Valor := StrToInt(EFCodigo.Text);
        end;
     end;
  finally
     CierraForm(FMSeleccion);
  end;
end;

function PideDato(aTipo: string; var Valor: string; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
begin
  AbreForm(TFMSeleccion, FMSeleccion);
  try
     with FMSeleccion do
     begin
        Inicializa(aTipo, aCaption, aCondicionBusqueda, aEmpresa, aEjercicio, aCanal);
        if aTipo = 'STR' then
           ETitulo.Text := Valor
        else
           EFCodigo.Text := Valor;

        // Oculto para mostrar en modo Modal
        Hide;
        ShowModal;

        Result := False;
        if (ModalResult = mrOk) then
        begin
           Result := True;
           if aTipo = 'STR' then
              Valor := ETitulo.Text
           else
              Valor := EFCodigo.Text;
        end;
     end;
  finally
     CierraForm(FMSeleccion);
  end;
end;

function PideDato(aTipo: string; var Valor: string; var ValorF: TDateTime; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
begin
  // Muestra EFCodigo y DateEdit a la misma vez
  AbreForm(TFMSeleccion, FMSeleccion);
  try
     with FMSeleccion do
     begin
        Inicializa(aTipo, aCaption, aCondicionBusqueda, aEmpresa, aEjercicio, aCanal);
        if aTipo = 'STR' then
           ETitulo.Text := Valor
        else
           EFCodigo.Text := Valor;

        // Muestro Fecha y Hora porque la funcion Inicializa los oculta
        DateEdit.Date := DateOf(ValorF);
        DTPHora.Time := TimeOf(ValorF);
        DateEdit.Visible := True;
        DTPHora.Visible := True;

        // Oculto para mostrar en modo Modal
        Hide;
        ShowModal;

        Result := False;
        if (ModalResult = mrOk) then
        begin
           Result := True;
           if aTipo = 'STR' then
              Valor := ETitulo.Text
           else
           begin
              Valor := EFCodigo.Text;
              ValorF := DateOf(DateEdit.Date) + TimeOf(DTPHora.Time);
           end;
        end;
     end;
  finally
     CierraForm(FMSeleccion);
  end;
end;

function PideDato(aTipo: string; var Valor: TDateTime; aCaption: string = ''; aCondicionBusqueda: string = ''; aEmpresa: integer = 0; aEjercicio: integer = 0; aCanal: integer = 0): boolean; overload;
begin
  AbreForm(TFMSeleccion, FMSeleccion);
  try
     with FMSeleccion do
     begin
        Inicializa(aTipo, aCaption, aCondicionBusqueda, aEmpresa, aEjercicio, aCanal);
        DateEdit.Date := DateOf(Valor);
        DTPHora.Time := TimeOf(Valor);

        // Oculto para mostrar en modo Modal
        Hide;
        ShowModal;

        Result := False;
        if (ModalResult = mrOk) then
        begin
           Result := True;
           Valor := DateOf(DateEdit.Date) + TimeOf(DTPHora.Time);
        end;
     end;
  finally
     CierraForm(FMSeleccion);
  end;
end;

procedure TFMSeleccion.FormCreate(Sender: TObject);
begin
  inherited;
  AceptarConEnter := True;
end;

procedure TFMSeleccion.TBOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFMSeleccion.Inicializa(aTipo: string; aCaption: string; aCondicionBusqueda: string; aEmpresa: integer; aEjercicio: integer; aCanal: integer);
begin
  Tipo := aTipo;
  DateEdit.Visible := False;
  DTPHora.Visible := False;

  if (aEmpresa = 0) then
     EntornoBusqueda.Empresa := REntorno.Empresa
  else
     EntornoBusqueda.Empresa := aEmpresa;

  if (aEjercicio = 0) then
     EntornoBusqueda.Ejercicio := REntorno.Ejercicio
  else
     EntornoBusqueda.Ejercicio := aEjercicio;

  if (aCanal = 0) then
     EntornoBusqueda.Canal := REntorno.Canal
  else
     EntornoBusqueda.Canal := aCanal;

  EntornoBusqueda.PGC := REntorno.PGC;

  with EFCodigo do
  begin
     MaxLength := 0;
     CampoADevolver := '';
     Campos_Desplegar.Clear;
     OrdenadoPor.Clear;
     CondicionBusqueda := '';
     BuscarNums := False;

     if (Tipo = 'EMP') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Empresa');
        LTipo.Caption := _('Empresa');
        CampoNum := 'EMPRESA';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'SYS_EMPRESAS';
        OrdenadoPor.Text := 'EMPRESA';

        if (aCondicionBusqueda = '') then
           CondicionBusqueda := 'ABIERTA = 1'
        else
           CondicionBusqueda := aCondicionBusqueda;

        Filtros := [];
     end;

     if (Tipo = 'SER') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Serie');
        LTipo.Caption := _('Serie');
        CampoNum := 'SERIE';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'VER_SERIES';
        OrdenadoPor.Text := 'SERIE';

        if (aCondicionBusqueda = '') then
           CondicionBusqueda := ''
        else
           CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;

     if (Tipo = 'CTA') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Cuenta');
        MaxLength := REntorno.DigitosSub;
        LTipo.Caption := _('Cuenta');
        CampoNum := 'CUENTA';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'CON_CUENTAS';
        OrdenadoPor.Text := 'CUENTA';
        BuscarNums := True;

        if (aCondicionBusqueda = '') then
           CondicionBusqueda := 'TIPO = 5' // cuentas de ultimo nivel
        else
           CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obEjercicio, obCanal, obPgc];
     end;

     if (Tipo = 'CLI') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Cliente');
        MaxLength := 0;
        LTipo.Caption := _('Cliente');
        CampoNum := 'CLIENTE';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'VER_CLIENTES_EF';
        OrdenadoPor.Text := 'CLIENTE';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;

     if (Tipo = 'CAJ') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Caja');
        MaxLength := 0;
        LTipo.Caption := _('Caja');
        CampoNum := 'CAJA';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'VER_CAJAS_USUARIOS_ACTIVAS';
        OrdenadoPor.Text := 'CAJA';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;

     if (Tipo = 'PRO') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Proveedor');
        MaxLength := 0;
        LTipo.Caption := _('Proveedor');
        CampoNum := 'PROVEEDOR';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'VER_PROVEEDORES';
        OrdenadoPor.Text := 'PROVEEDOR';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;

     { TODO : Agregar código para ACR, AGE, TER}
     // if (Tipo = 'ACR') then
     // ...

     if (Tipo = 'PER') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Periodo');
        MaxLength := 0;
        LTipo.Caption := _('Periodo');
        CampoNum := 'PERIODO';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'VER_PERIODOS';
        OrdenadoPor.Text := 'PERIODO';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obEjercicio];
     end;

     if (Tipo = 'ART') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Articulo');
        MaxLength := 15;
        LTipo.Caption := _('Articulo');
        CampoNum := 'ARTICULO';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'VER_ARTICULOS_EF';
        OrdenadoPor.Text := 'ARTICULO';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;

     if (Tipo = 'MOD') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Modelo');
        MaxLength := 15;
        LTipo.Caption := _('Modelo');
        CampoNum := 'REF_PROVEEDOR';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'ART_ARTICULOS_MODELOS';
        OrdenadoPor.Text := 'REF_PROVEEDOR';
        BuscarNums := True;

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa];
     end;

     if (Tipo = 'FAM') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Familia');
        MaxLength := 15;
        LTipo.Caption := _('Familia');
        CampoNum := 'FAMILIA';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'ART_FAMILIAS';
        OrdenadoPor.Text := 'FAMILIA';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa];
     end;

     if (Tipo = 'ALM') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Almacen');
        MaxLength := 15;
        LTipo.Caption := _('Almacen');
        CampoNum := 'ALMACEN';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'ART_ALMACENES';
        OrdenadoPor.Text := 'ALMACEN';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa];
     end;

     if (Tipo = 'TAR') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Tarifa');
        MaxLength := 3;
        LTipo.Caption := _('Tarifa');
        CampoNum := 'TARIFA';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'ART_TARIFAS_C';
        OrdenadoPor.Text := 'TARIFA';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa];
     end;

     if (Tipo = 'KIT') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Kit');
        MaxLength := 15;
        LTipo.Caption := _('Kit');
        CampoNum := 'KIT';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'ART_KIT';
        OrdenadoPor.Text := 'KIT';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa];
     end;

     if (Tipo = 'NSE') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Nro. Serie');
        LTipo.Caption := _('Codigo');
        CampoNum := 'NSERIE';
        CampoADevolver := 'CODIGO';
        CampoStr := 'TITULO';
        Campos_Desplegar.Add('ALMACEN');
        Tabla_a_Buscar := 'VER_ARTICULOS_SERIALIZACION';
        OrdenadoPor.Text := 'NSERIE';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obCanal];
     end;

     if (Tipo = 'BAN') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Banco');
        LTipo.Caption := _('Banco');
        CampoNum := 'BANCO';
        CampoStr := 'TITULO';
        Tabla_a_Buscar := 'VER_BANCOS_CUENTAS';
        OrdenadoPor.Text := 'BANCO';

        if (aCondicionBusqueda = '') then
           CondicionBusqueda := ''
        else
           CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;

     if (Tipo = 'REP') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Matricula');
        MaxLength := 0;
        Text := '';
        LTipo.Caption := _('Matricula');
        CampoADevolver := 'IDCABREPARAR';
        CampoNum := 'MATRICULA';
        CampoStr := 'NOMBRE_R_SOCIAL';
        Tabla_a_Buscar := 'VER_REPAR_CAB_REPARACIONES';
        OrdenadoPor.Text := 'MATRICULA';

        CondicionBusqueda := aCondicionBusqueda;

        Filtros := [obEmpresa, obCanal];
     end;

     if (Tipo = 'LOS') then
     begin
        if (aCaption <> '') then
           Self.Caption := aCaption
        else
           Self.Caption := _('Seleccione Lote Simple');
        MaxLength := 0;
        Text := '';
        LTipo.Caption := _('Lote Simple');
        CampoADevolver := 'LOTE_SIMPLE';
        CampoNum := 'LOTE_SIMPLE';
        CampoStr := 'ARTICULO';
        Campos_Desplegar.Add('EJERCICIO');
        Campos_Desplegar.Add('SERIE');
        Campos_Desplegar.Add('RIG');
        Tabla_a_Buscar := 'GES_DETALLES_S';
        OrdenadoPor.Text := 'LOTE_SIMPLE';

        CondicionBusqueda := '(LOTE_SIMPLE <> '''' AND LOTE_SIMPLE <> ''0'')';
        if (aCondicionBusqueda > '') then
           CondicionBusqueda := CondicionBusqueda + ' AND ' + aCondicionBusqueda;

        Filtros := [obEmpresa, obCanal];
     end;
  end;

  if (Tipo = 'STR') then
  begin
     if (aCaption <> '') then
        Self.Caption := aCaption
     else
        Self.Caption := aCaption;
     LTipo.Caption := _('Valor');
     ETitulo.Left := EFCodigo.Left;
     ETitulo.Enabled := True;
     ETitulo.ReadOnly := False;
     EFCodigo.Visible := False;
  end;

  if (Tipo = 'DBL') then
  begin
     if (aCaption <> '') then
        Self.Caption := aCaption
     else
        Self.Caption := aCaption;
     LTipo.Caption := _('Valor');
     ETitulo.Left := EFCodigo.Left;
     ETitulo.Enabled := True;
     ETitulo.ReadOnly := False;
     EFCodigo.Visible := False;
  end;

  if (Tipo = 'INT') then
  begin
     if (aCaption <> '') then
        Self.Caption := aCaption
     else
        Self.Caption := aCaption;
     LTipo.Caption := _('Valor');
     ETitulo.Left := EFCodigo.Left;
     ETitulo.Enabled := True;
     ETitulo.ReadOnly := False;
     EFCodigo.Visible := False;
     EFCodigo.Enabled := False;
     ETitulo.Text := '0';
  end;

  if (Tipo = 'DAT') then
  begin
     if (aCaption <> '') then
        Self.Caption := aCaption
     else
        Self.Caption := aCaption;
     LTipo.Caption := _('Fecha');
     DateEdit.Visible := True;
     DTPHora.Visible := False;
     DateEdit.Top := ETitulo.Top;
     DateEdit.Date := DateOf(Now);
     DTPHora.Time := TimeOf(Now);
     ETitulo.Visible := False;
     EFCodigo.Visible := False;
  end;

  if (Tipo = 'DTM') then
  begin
     if (aCaption <> '') then
        Self.Caption := aCaption
     else
        Self.Caption := aCaption;
     LTipo.Caption := _('Fecha');
     DateEdit.Visible := True;
     DTPHora.Visible := True;
     DateEdit.Top := ETitulo.Top;
     DTPHora.Top := ETitulo.Top;
     DateEdit.Date := DateOf(Now);
     DTPHora.Time := TimeOf(Now);
     ETitulo.Visible := False;
     EFCodigo.Visible := False;
  end;
end;

procedure TFMSeleccion.EFCodigoChange(Sender: TObject);
begin
  inherited;
  if (Tipo = 'EMP') then
     ETitulo.Text := DameTituloEmpresa(StrToIntDef(EFCodigo.Text, 0));

  if (Tipo = 'CLI') then
     ETitulo.Text := DameTituloCliente(StrToIntDef(EFCodigo.Text, 0));

  if (Tipo = 'PRO') then
     ETitulo.Text := DameTituloProveedor(StrToIntDef(EFCodigo.Text, 0));

  { TODO : Agregar código para ACR, AGE, TER}
  // if (Tipo = 'ACR') then
  // ...

  if (Tipo = 'ART') then
     ETitulo.Text := DameTituloArticulo(EFCodigo.Text);

  if (Tipo = 'FAM') then
     ETitulo.Text := DameTituloFamilia(EFCodigo.Text);

  if (Tipo = 'ALM') then
     ETitulo.Text := DameTituloAlmacen(EFCodigo.Text);

  if (Tipo = 'TAR') then
     ETitulo.Text := DameTituloTarifa(EFCodigo.Text);

  if (Tipo = 'CTA') then
     ETitulo.Text := DameTituloCuenta(EFCodigo.Text);

  if (Tipo = 'PER') then
     ETitulo.Text := DameTituloPeriodo(EFCodigo.Text);

  if (Tipo = 'SER') then
     ETitulo.Text := UDameDato.DameTituloSerie(EFCodigo.Text);

  if (Tipo = 'LOS') then
     ETitulo.Text := EFCodigo.Text;

  if (Tipo = 'REP') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MATRICULA || '' - '' || NOMBRE_R_SOCIAL AS TITULO FROM VER_REPAR_CAB_REPARACIONES WHERE IDCABREPARAR = :IDCABREPARAR';
           Params.ByName['IDCABREPARAR'].AsInteger := StrToIntDef(EFCodigo.Text, 0);
           ExecQuery;
           ETitulo.Text := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (Tipo = 'MOD') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM ART_ARTICULOS_MODELOS WHERE EMPRESA = :EMPRESA AND REF_PROVEEDOR = :REF_PROVEEDOR';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['REF_PROVEEDOR'].AsString := Copy(EFCodigo.Text, 1, 25);
           ExecQuery;
           ETitulo.Text := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (Tipo = 'NSE') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT NSERIE || '' - '' || TITULO FROM VER_ARTICULOS_SERIALIZACION WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL AND CODIGO = :CODIGO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['CODIGO'].AsInteger := StrToIntDef(EFCodigo.Text, 0);
           ExecQuery;
           ETitulo.Text := Fields[0].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFMSeleccion.OnKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and AceptarConEnter then
     ModalResult := mrOk;
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
end;

procedure TFMSeleccion.FormShow(Sender: TObject);
begin
  inherited;

  if EFCodigo.Visible then
     EFCodigo.SetFocus
  else
  if ETitulo.Visible then
     ETitulo.SetFocus
  else
     DateEdit.SetFocus;
end;

procedure TFMSeleccion.EFCodigoBusqueda(Sender: TObject);
begin
  inherited;
  AceptarConEnter := False;
end;

procedure TFMSeleccion.EFCodigoExiste(Sender: TObject);
begin
  inherited;
  AceptarConEnter := True;
end;

procedure TFMSeleccion.EFCodigoNoExiste(Sender: TObject);
begin
  inherited;
  AceptarConEnter := True;
end;

end.
