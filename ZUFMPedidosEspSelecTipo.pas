unit ZUFMPedidosEspSelecTipo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, rxToolEdit, rxCurrEdit, Mask, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel,
  ExtCtrls, ULFPanel, FIBDatabase, UFIBModificados, DB, HYFIBQuery, ULFEdit;

type
  TZFMPedidosEspSelecTipo = class(TForm)
     PnlAnyadirTipo: TLFPanel;
     LblTipoArt: TLFLabel;
     LblModelo: TLFLabel;
     LblLacado: TLFLabel;
     LblCantidad: TLFLabel;
     EFTipoArt: TLFEditFind2000;
     EFModelo: TLFEditFind2000;
     EFLacado: TLFEditFind2000;
     DBEDescTipoArt: TLFEdit;
     DBEDescModelo: TLFEdit;
     DBEDescLacado: TLFEdit;
     CECantidad: TCurrencyEdit;
     BBOK: TBitBtn;
     BBCancel: TBitBtn;
     LblSubtipo: TLFLabel;
     EFSubtipo: TLFEditFind2000;
     DBEDescSubtipo: TLFEdit;
     LblTipo: TLFLabel;
     EFTipo: TLFEditFind2000;
     DBEDescTipo: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EFTipoArtChange(Sender: TObject);
     procedure EFModeloChange(Sender: TObject);
     procedure BBOKClick(Sender: TObject);
     procedure EFSubtipoBusqueda(Sender: TObject);
     procedure BBCancelClick(Sender: TObject);
     procedure EFLacadoChange(Sender: TObject);
     procedure EFTipoChange(Sender: TObject);
     procedure EFSubtipoChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMPedidosEspSelecTipo : TZFMPedidosEspSelecTipo;

implementation

uses ZUFMPedidosEsp, ZUDMPedidosEsp, UDMMain, FIBDataSetRO, UUtiles;

{$R *.dfm}

procedure TZFMPedidosEspSelecTipo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  EFLacado.Text := 'BL';
  CECantidad.Value := 1;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BBOK, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancel, 1, DMMain.ILMain_Ac, 0);
end;

procedure TZFMPedidosEspSelecTipo.EFTipoArtChange(Sender: TObject);
begin
  LblModelo.Visible := ((EFTipoArt.Text = 'T') or (EFTipoArt.Text = 'A') or (EFTipoArt.Text = 'L'));
  EFModelo.Visible := ((EFTipoArt.Text = 'T') or (EFTipoArt.Text = 'A') or (EFTipoArt.Text = 'L'));
  DBEDescModelo.Visible := ((EFTipoArt.Text = 'T') or (EFTipoArt.Text = 'A') or (EFTipoArt.Text = 'L'));

  EFModelo.Text := 'IND';
  EFTipo.Text := '1';
  if (EFTipoArt.Text <> 'L') then
     EFSubtipo.Text := '0'
  else
     EFSubtipo.Text := '5';

  BBOK.Enabled := (EFTipoArt.Text <> '');

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM SYS_TIPOS_ARTICULO_TYC WHERE TIPO_ARTICULO_TYC = :TIPO_ARTICULO_TYC';
        Params.ByName['TIPO_ARTICULO_TYC'].AsString := EFTipoArt.Text;
        ExecQuery;
        DBEDescTipoArt.Text := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZFMPedidosEspSelecTipo.EFModeloChange(Sender: TObject);
begin
  BBOK.Enabled := (EFTipoArt.Text <> '') and (EFModelo.Text <> '');

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CONFIG_TIPO, CONFIG_SUBTIPO, DESCRIPCION FROM Z_SYS_MODELOS WHERE CODIGO = :CODIGO';
        Params.ByName['CODIGO'].AsString := EFModelo.Text;
        ExecQuery;
        EFTipo.Text := FieldByName['CONFIG_TIPO'].AsString;
        DBEDescModelo.Text := FieldByName['DESCRIPCION'].AsString;
        if (EFTipoArt.Text <> 'L') then
           EFSubtipo.Text := FieldByName['CONFIG_SUBTIPO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZFMPedidosEspSelecTipo.BBOKClick(Sender: TObject);
begin
  ZFMPedidosEsp.TipoG := EFTipoArt.Text;
  ZFMPedidosEsp.ConfigTipoG := EFTipo.Text;
  ZFMPedidosEsp.ConfigSubtipoG := EFSubtipo.Text;

  if (EFModelo.Text = '') then
     ZFMPedidosEsp.ModeloG := 'IND'
  else
     ZFMPedidosEsp.ModeloG := EFModelo.Text;

  ZFMPedidosEsp.AnyadirPestanya(EFLacado.Text, CECantidad.Value, EFModelo.Text);
  Close;
end;

procedure TZFMPedidosEspSelecTipo.EFSubtipoBusqueda(Sender: TObject);
begin
  EFSubtipo.CondicionBusqueda := 'TIPO=' + EFTipo.Text;
end;

procedure TZFMPedidosEspSelecTipo.BBCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMPedidosEspSelecTipo.EFLacadoChange(Sender: TObject);
begin
  DBEDescLacado.Text := DMMain.DameDescripcionColor(EFLacado.Text);
end;

procedure TZFMPedidosEspSelecTipo.EFTipoChange(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_TIPOS_CONFIG WHERE TIPO = :TIPO';
        Params.ByName['TIPO'].AsInteger := StrToIntDef(EFTipo.Text, 0);
        ExecQuery;
        DBEDescTipo.Text := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZFMPedidosEspSelecTipo.EFSubtipoChange(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_TIPOS_CONFIG_DET WHERE TIPO = :TIPO AND SUBTIPO = :SUBTIPO';
        Params.ByName['TIPO'].AsInteger := StrToIntDef(EFTipo.Text, 0);
        Params.ByName['SUBTIPO'].AsInteger := StrToIntDef(EFSubtipo.Text, 0);
        ExecQuery;
        DBEDescSubtipo.Text := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
