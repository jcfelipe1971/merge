unit UCrmFMMarcajesVentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, UFIBDBEditfind, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, UComponentesBusquedaFiltrada, dbcgrids, URecursos,
  UFPEdit, ActnList, Buttons, UHYEdits, DbComboBoxValue, Barras,
  UHYDescription, NsDBGrid, rxPlacemnt, ULFCheckBox, ULFDBMemo,
  ULFPageControl, ULFDBCtrlGrid, ULFEdit, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ULFActionList, ULFToolBar, ULFPanel,
  ULFHYDBDescription, DBActns, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  UG2kTBLoc, DB, UFormGest;

type
  TCrmFMMarcajesVentas = class(TG2KForm)
     LFMain: TLFPanel;
     LbContacto: TLFLabel;
     LbArticulo: TLFLabel;
     LFDescArticulo: TLFEdit;
     TBMain: TLFToolBar;
     BSalir: TToolButton;
     BProcesa: TToolButton;
     LFArticulo: TLFEdit;
     LFContacto: TLFEdit;
     LFMarcaje: TLFEdit;
     LbCadenaMarcaje: TLFLabel;
     LFError: TLFEdit;
     BBorraMarcaje: TToolButton;
     LFDescContacto: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BSalirClick(Sender: TObject);
     procedure BProcesaClick(Sender: TObject);
     procedure BBorraMarcajeClick(Sender: TObject);
     procedure LFMarcajeChange(Sender: TObject);
     procedure LFMarcajeKeyPress(Sender: TObject; var Key: char);
  private
     { Private declarations }
     procedure MarcajeContacto;//sfg.albert
     procedure ProcesaCadena;
     procedure MarcajeArticulo;//sfg.albert
     procedure QuitaColor;
     procedure NuevoMarcaje;
  public
     { Public declarations }
  end;

var
  CrmFMMarcajesVentas : TCrmFMMarcajesVentas;

implementation

uses UCrmDMMarcajeVentas, UDMMain, UFMain;

{$R *.dfm}

procedure TCrmFMMarcajesVentas.FormCreate(Sender: TObject);
begin
  AbreData(TCrmDMMarcajeVentas, CrmDMMarcajeVentas);
  NuevoMarcaje;
end;

procedure TCrmFMMarcajesVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(CrmDMMarcajeVentas);
  Action := caFree;
end;

procedure TCrmFMMarcajesVentas.BSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TCrmFMMarcajesVentas.ProcesaCadena;
var
  identifica_cadena : string;
begin
  if (LFMarcaje.Text = 'B999') then
     NuevoMarcaje
  else
  begin
     identifica_cadena := Copy(LFMarcaje.Text, 1, 1);
     // LFError.Clear;
     if ((identifica_cadena = 'C') or (identifica_cadena <> 'A')) then
        MarcajeContacto;
     if (identifica_cadena = 'A') then
        MarcajeArticulo;

     if ((LFContacto.Text <> '') and (LFArticulo.Text <> '')) then
     begin
        CrmDmMarcajeVentas.InsertarMarcaje(StrToIntDef(Trim(LFContacto.Text), 0), CrmDmMarcajeVentas.xArticuloID_ARTICULO.AsInteger);
        LFError.Text := _('Marcaje insertado correctamente');
        LFError.Visible := True;
        NuevoMarcaje;
     end;
  end;
end;

procedure TCrmFMMarcajesVentas.BProcesaClick(Sender: TObject);
begin
  ProcesaCadena;
end;

procedure TCrmFMMarcajesVentas.MarcajeContacto;
begin
  if ((Copy(LFMarcaje.Text, 1, 1) = 'C') and (CrmDMMarcajeVentas.ContactoExiste(StrToIntDef(Copy(LFMarcaje.Text, 2, Length(LFMarcaje.Text)), 0))) or
     ((Copy(LFMarcaje.Text, 1, 1) <> 'C') and (CrmDMMarcajeVentas.ContactoExiste(StrToIntDef(LFMarcaje.Text, 0))))) then
  begin
     if (Copy(LFMarcaje.Text, 1, 1) <> 'C') then
        LFContacto.Text := LFMarcaje.Text
     else //Si posen la C
        LFContacto.Text := Copy(LFMarcaje.Text, 2, Length(LFMarcaje.Text));
     QuitaColor;
     //LFContacto.Color := clAqua;
     //LFDescContacto.Color := clAqua;
     LFDescContacto.Text := CrmDMMarcajeVentas.DameDescContacto(StrToInt(LFContacto.Text));
  end
  else
  begin
     // NuevoMarcaje;
     LFError.Visible := True;
     LFError.Text := _('El contacto no existe');
     LFMarcaje.Clear;
  end;
end;

procedure TCrmFMMarcajesVentas.MarcajeArticulo;
begin
  // Si el articulo no existe no voy a poder hacer el marcaje
  if (CrmDMMarcajeVentas.ArticuloExiste(Copy(LFMarcaje.Text, 2, Length(LFMarcaje.Text)))) then
  begin
     LFArticulo.Text := Copy(LFMarcaje.Text, 2, Length(LFMarcaje.Text));
     //Inserta el marcatge, ja que tot és correcte
     QuitaColor;
     //LFArticulo.Color := clAqua;
     //LFDescArticulo.Color := clAqua;
     LFDescArticulo.Text := CrmDMMarcajeVentas.DameDescArticulo(LFArticulo.Text);

     //Selecciona el id d'article
     CrmDmMarcajeVentas.xArticulo.Close;
     CrmDmMarcajeVentas.xArticulo.Params.ByName['articulo'].AsString := LFArticulo.Text;
     CrmDmMarcajeVentas.xArticulo.Open;
  end
  else
  begin
     // NuevoMarcaje;
     LFError.Visible := True;
     LFError.Text := _('El artículo no existe');
     LFMarcaje.Clear;
  end;
  //  end
  //  else
  //  begin
  {TODO -oAlbert -cCRM : Debe limpiar el formulario si hay error?}
  // NuevoMarcaje;
  //     LFError.Visible := True;
  //     LFError.Text := _('El contacto no existe');
  //  end;
end;

procedure TCrmFMMarcajesVentas.QuitaColor;
begin
  LFContacto.Color := clInfoBk;
  LFArticulo.Color := clInfoBk;
  LFDescArticulo.Color := clInfoBk;
  LFDescContacto.Color := clInfoBk;
  LFMarcaje.Text := '';
end;

procedure TCrmFMMarcajesVentas.BBorraMarcajeClick(Sender: TObject);
begin
  NuevoMarcaje;
end;

procedure TCrmFMMarcajesVentas.NuevoMarcaje;
begin
  LFMarcaje.Text := '';
  LFContacto.Text := '';
  LFArticulo.Text := '';
  LFDescArticulo.Text := '';
  LFDescContacto.Text := '';
  QuitaColor;
  //LFContacto.Color := clAqua;
  //LFDescContacto.Color := clAqua;
  //LFError.Visible := False;
  //LFError.Text := '';
end;

procedure TCrmFMMarcajesVentas.LFMarcajeChange(Sender: TObject);
begin
  if (LFMarcaje.Text <> '') then
     LFError.Clear;
end;

procedure TCrmFMMarcajesVentas.LFMarcajeKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = #13) then
     ProcesaCadena;
end;

end.
