unit UFMCreaLocalidad;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, ULFEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, HYFIBQuery;

type
  TFMCreaLocalidad = class(TFPEditSinNavegador)
     EFPais: TLFEditFind2000;
     EPaisTitulo: TLFEdit;
     EFProvincia: TLFEditFind2000;
     EProvinciaTitulo: TLFEdit;
     ENombreLocalidad: TLFEdit;
     LPais: TLFLabel;
     LProvincia: TLFLabel;
     LCodigoPostal: TLFLabel;
     LLocalidad: TLFLabel;
     TBCreaLocalidad: TToolButton;
     SBCreaLocalidad: TToolButton;
     ECodigoPostal: TLFEdit;
     BCrearProvincia: TButton;
     procedure EFPaisChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EFProvinciaExit(Sender: TObject);
     procedure EFProvinciaBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBCreaLocalidadClick(Sender: TObject);
     procedure BCrearProvinciaClick(Sender: TObject);
  private
     { Private declarations }
     procedure CreaLocalidad(Pais, Provincia, NombreProvincia, CodigoPostal, NombreLocalidad: string);
  public
     { Public declarations }
     Localidad: string;
  end;

function CreaLocalidad(Pais: string): string;

var
  FMCreaLocalidad : TFMCreaLocalidad;

implementation

uses
  UDMMain, UEntorno, UFormGest, UFMProvincias, UDameDato;

{$R *.dfm}

function CreaLocalidad(Pais: string): string;
begin
  /// Muestra el formulario y devuelve la localidad creada.
  /// si no se crea ninguna localidad devuelve ''.
  /// Se inicializa con el pais pasado por parametro.

  Result := '';
  AbreForm(TFMCreaLocalidad, FMCreaLocalidad, nil);
  with FMCreaLocalidad do
  begin
     if (Pais > '') then
        EFPais.Text := Pais;

     Hide;
     if (ShowModal = mrOk) then
        Result := Localidad;
     Free;
  end;
end;

procedure TFMCreaLocalidad.FormCreate(Sender: TObject);
begin
  inherited;
  EFPais.Text := REntorno.Pais;
  Localidad := '';
end;

procedure TFMCreaLocalidad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Solo escondemos formulario para poder obtener la localidad creada
  Action := caHide;
end;

procedure TFMCreaLocalidad.EFPaisChange(Sender: TObject);
var
  TituloRegion, TituloProvincia, TituloPoblacion : string;
begin
  inherited;
  EPaisTitulo.Text := DameTituloPais(EFPais.Text);
  DMMain.DameDatosPais(EFPais.Text, TituloRegion, TituloProvincia, TituloPoblacion);
  LProvincia.Caption := TituloProvincia;
end;

procedure TFMCreaLocalidad.CreaLocalidad(Pais, Provincia, NombreProvincia, CodigoPostal, NombreLocalidad: string);
var
  // id_provincia, Id_local, id_CodigoPostal : integer;
  NuevaLocalidad : string;
begin
  // Si la provincia es vacia creamos una nueva
  if (Provincia = '') then
  begin
     // Obtenemos el código de provincia a crear. Será el último + 1.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('SELECT FIRST 1 PROVINCIA + 1 AS PROVINCIA FROM SYS_PROVINCIAS ');
           SQL.Add('WHERE ');
           SQL.Add('PAIS = :PAIS AND ');
           SQL.Add('SUBSTRING(PROVINCIA FROM 1 FOR 1) BETWEEN ''0'' AND ''9'' AND ');
           SQL.Add('SUBSTRING(PROVINCIA FROM 2 FOR 1) BETWEEN ''0'' AND ''9'' ');
           SQL.Add('ORDER BY PROVINCIA DESC ');
           Params.ByName['PAIS'].AsString := Pais;
           ExecQuery;
           Provincia := FieldByName['PROVINCIA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO SYS_PROVINCIAS (PAIS, PROVINCIA, TITULO) VALUES (:PAIS, :PROVINCIA, :TITULO)';
           Params.ByName['PAIS'].AsString := Pais;
           Params.ByName['PROVINCIA'].AsString := Provincia;
           Params.ByName['TITULO'].AsString := NombreProvincia;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Calculo codigo de localidad.
  // Formato=PPPnnnnn P: Pais - n: contador
  // Busco último número de contador de las localidades que empiezan por [PAIS]
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 CAST(SUBSTRING(LOCALIDAD FROM 4 FOR 5) AS INTEGER) AS LOCALIDAD ');
        SQL.Add(' FROM SYS_LOCALIDADES ');
        SQL.Add(' WHERE PAIS = :PAIS AND ');
        SQL.Add('       SUBSTRING(LOCALIDAD FROM 1 FOR 3) = :PAIS AND ');
        SQL.Add('       SUBSTRING(LOCALIDAD FROM 4 FOR 1) BETWEEN ''0'' AND ''9'' AND ');
        SQL.Add('       SUBSTRING(LOCALIDAD FROM 5 FOR 1) BETWEEN ''0'' AND ''9'' AND ');
        SQL.Add('       SUBSTRING(LOCALIDAD FROM 6 FOR 1) BETWEEN ''0'' AND ''9'' AND ');
        SQL.Add('       SUBSTRING(LOCALIDAD FROM 7 FOR 1) BETWEEN ''0'' AND ''9'' AND ');
        SQL.Add('       SUBSTRING(LOCALIDAD FROM 8 FOR 1) BETWEEN ''0'' AND ''9'' ');
        SQL.Add(' ORDER BY LOCALIDAD DESC ');
        Params.ByName['PAIS'].AsString := Pais;
        ExecQuery;
        NuevaLocalidad := format('%s%.5d', [Pais, FieldByName['LOCALIDAD'].AsInteger + 1]);
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO SYS_LOCALIDADES (LOCALIDAD, TITULO, CODIGO_POSTAL, PAIS, PROVINCIA) ');
        SQL.Add(' VALUES (:LOCALIDAD, :TITULO, :CODIGO_POSTAL, :PAIS, :PROVINCIA) ');
        Params.ByName['LOCALIDAD'].AsString := NuevaLocalidad;
        Params.ByName['TITULO'].AsString := NombreLocalidad;
        Params.ByName['CODIGO_POSTAL'].AsString := CodigoPostal;
        Params.ByName['PAIS'].AsString := Pais;
        Params.ByName['PROVINCIA'].AsString := Provincia;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si todo salio bien, guardo la localidad creada.
  Localidad := NuevaLocalidad;
end;

procedure TFMCreaLocalidad.EFProvinciaExit(Sender: TObject);
begin
  inherited;
  if ((EFPais.Text > '') and (EFProvincia.Text > '')) then
     EProvinciaTitulo.Text := DameTituloProvincia(EFPais.Text, EFProvincia.Text)
  else
     EProvinciaTitulo.Text := '';
end;

procedure TFMCreaLocalidad.EFProvinciaBusqueda(Sender: TObject);
begin
  inherited;
  EFProvincia.CondicionBusqueda := 'PAIS = ''' + EFPais.Text + '''';
end;

procedure TFMCreaLocalidad.TBCreaLocalidadClick(Sender: TObject);
begin
  inherited;

  if (ENombreLocalidad.Text > '') then
  begin
     CreaLocalidad(EFPais.Text, EFProvincia.Text, EProvinciaTitulo.Text, ECodigoPostal.Text, ENombreLocalidad.Text);
     ModalResult := mrOk;
  end
  else
     raise Exception.Create(_('Debe ingresar un nombre de localidad'));
end;

procedure TFMCreaLocalidad.BCrearProvinciaClick(Sender: TObject);
begin
  inherited;
  EFProvincia.Text := CreaProvincia(EFPais.Text);
  EFProvinciaExit(Sender);

  if (ECodigoPostal.CanFocus) then
     ECodigoPostal.SetFocus;
end;

end.
