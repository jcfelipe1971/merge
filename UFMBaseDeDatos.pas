unit UFMBaseDeDatos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, UControlEdit, UFormGest, ULFPanel,
  ULFComboBox, ULFEdit, ULFLabel;

type
  TFMBaseDeDatos = class(THYForm)
     CBBaseDeDatos: TLFComboBox;
     PNLBotones: TLFPanel;
     BBConectar: TBitBtn;
     BBCancelar: TBitBtn;
     EBaseDeDatos: TLFEdit;
     PNLMain: TLFPanel;
     TCancelarSeleccion: TTimer;
     LFiltro: TLFLabel;
     LFicheroINI: TLabel;
     LFicheroConfiguracion: TLabel;
     procedure FormCreate(Sender: TObject);
     procedure BBCancelarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BBConectarClick(Sender: TObject);
     procedure TCancelarSeleccionTimer(Sender: TObject);
     procedure EBaseDeDatosChange(Sender: TObject);
     procedure CBBaseDeDatosChange(Sender: TObject);
     procedure FormKeyPress(Sender: TObject; var Key: char);
     procedure LFicheroINIDblClick(Sender: TObject);
  private
     { Private declarations }
     FiltroConexiones: string;
     procedure FiltrarConexiones;
  public
     { Public declarations }
  end;

var
  FMBaseDeDatos : TFMBaseDeDatos;

implementation

uses UEntorno, IniFiles, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMBaseDeDatos.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  LFicheroINI.Caption := REntorno.FicheroINI;

  FiltroConexiones := '';
  FiltrarConexiones;

  // Timer de 2 minutos para evitar que la aplicacion se quede en este estado
  TCancelarSeleccion.Enabled := True;

  HelpFile := REntorno.FicheroAyuda;
  HelpType := htKeyword;
  HelpKeyword := 'FMBASEDEDATOS';

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BBConectar, 1, DMMain.ILMain_Ac, 94);
  GetBitmapFromImageList(BBCancelar, 1, DMMain.ILMain_Ac, 0);
end;

procedure TFMBaseDeDatos.BBCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMBaseDeDatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (EBaseDeDatos.Visible) then
     REntorno.BaseDeDatos := EBaseDeDatos.Text;

  Action := caFree;
end;

procedure TFMBaseDeDatos.BBConectarClick(Sender: TObject);
var
  oIni : TIniFile;
  i : integer;
  BaseSeleccionada : string;
begin
  BaseSeleccionada := CBBaseDeDatos.Text;

  // Hago que el Combo tenga todas las conexiones otra vez para guardarlas en el INI
  FiltroConexiones := '';
  FiltrarConexiones;

  with CBBaseDeDatos.Items do
  begin
     i := IndexOf(BaseSeleccionada);

     // Subo uno en la posicion para que aparezca entre los primeros.
     if (i > 0) then
        Move(i, i - 1)
     else
     if (EBaseDeDatos.Visible) then
        Add(EBaseDeDatos.Text);

     // Ahora guardo estas posiciones.
     oIni := TIniFile.Create(REntorno.FicheroINI);
     try
        for i := 0 to Count - 1 do
           oIni.WriteString('Datos', Format('BaseDeDatos%d', [i + 1]), CBBaseDeDatos.Items[i]);
     finally
        oIni.Free;
     end;
  end;

  REntorno.BaseDeDatos := BaseSeleccionada;
end;

procedure TFMBaseDeDatos.TCancelarSeleccionTimer(Sender: TObject);
begin
  BBConectar.Click;
end;

procedure TFMBaseDeDatos.EBaseDeDatosChange(Sender: TObject);
begin
  TCancelarSeleccion.Enabled := False;
  TCancelarSeleccion.Enabled := True;
end;

procedure TFMBaseDeDatos.CBBaseDeDatosChange(Sender: TObject);
begin
  TCancelarSeleccion.Enabled := False;
  TCancelarSeleccion.Enabled := True;
end;

procedure TFMBaseDeDatos.FiltrarConexiones;
var
  i : integer;
begin
  with CBBaseDeDatos do
  begin
     Clear;
     Items.Clear;

     if (Trim(REntorno.BaseDeDatos) > '') and ((FiltroConexiones = '') or (Pos(UpperCase(FiltroConexiones), UpperCase(REntorno.BaseDeDatos)) > 0)) then
        Items.Add(REntorno.BaseDeDatos);

     for i := 0 to REntorno.OtrasBasesDeDatos.Count - 1 do
     begin
        if ((FiltroConexiones = '') or (Pos(UpperCase(FiltroConexiones), UpperCase(REntorno.OtrasBasesDeDatos[i])) > 0)) then
           Items.Add(REntorno.OtrasBasesDeDatos[i]);
     end;

     i := Items.IndexOf(REntorno.BaseDeDatos);
     if (i >= 0) then
        ItemIndex := i
     else
        ItemIndex := 0;

     // Si no hay ninguna base, pido la ruta en un edit
     if (Items.Count = 0) then
     begin
        // Visible := False;
        // EBaseDeDatos.Top := Top;
        EBaseDeDatos.Visible := True;
     end
     else
     begin
        // Visible := True;
        EBaseDeDatos.Visible := False;
     end;
  end;
end;

procedure TFMBaseDeDatos.FormKeyPress(Sender: TObject; var Key: char);
begin
  if (REntorno.OtrasBasesDeDatos.Count > 1) then
  begin
     if ((Key = #13) and (Sender = CBBaseDeDatos)) then
        BBConectarClick(Sender)
     else
     begin
        if (Key in ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.']) then
        begin
           FiltroConexiones := FiltroConexiones + Key;
           Key := #0;
        end
        else
        if (Key = #8) then
        begin
           FiltroConexiones := Copy(FiltroConexiones, 1, Length(FiltroConexiones) - 1);
           Key := #0;
        end;

        with LFiltro do
        begin
           Caption := '';
           Color := clBtnFace;
           if (FiltroConexiones <> '') then
           begin
              Caption := 'Filtro: ' + FiltroConexiones;
              Color := clYellow;
           end;
        end;

        FiltrarConexiones;
     end;
  end;
end;

procedure TFMBaseDeDatos.LFicheroINIDblClick(Sender: TObject);
begin
  DMMain.AbrirArchivo(ExtractFilePath(REntorno.FicheroINI));
end;

end.
