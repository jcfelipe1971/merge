unit UCrmFMContactosDir;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, DBCtrls, StdCtrls, ULFLabel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, Mask, ULFDBEdit, Buttons,
  UFormGest, ULFEditFind2000, ULFEdit;

type
  TCrmFMContactosDir = class(TG2KForm)
     EDireccion2: TLFEdit;
     EFTipoDir: TLFEditFind2000;
     EDirNombre: TLFEdit;
     EDirNumero: TLFEdit;
     EDirBloqEsc: TLFEdit;
     EDirPiso: TLFEdit;
     EDirPuerta: TLFEdit;
     LPuerta: TLFLabel;
     LPiso: TLFLabel;
     LBloqueEscalera: TLFLabel;
     LNumero: TLFLabel;
     LblNombreDireccion: TLFLabel;
     PnlMain: TLFPanel;
     LDireccionContacto: TLFLabel;
     DBEDireccionContacto: TLFDbedit;
     LblLocalidad: TLFLabel;
     DBELocalidad: TLFDbedit;
     DBELocalidadNombre: TLFDbedit;
     DBECpostal: TLFDbedit;
     DBEPais: TLFDbedit;
     DBEProvincia: TLFDbedit;
     LblProvincia: TLFLabel;
     BBAceptar: TBitBtn;
     BBCancelar: TBitBtn;
     LblTipoDir: TLFLabel;
     LblCalle: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BBAceptarClick(Sender: TObject);
     procedure BBCancelarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMContactosDir : TCrmFMContactosDir;

implementation

uses UDMMain, UCrmDMContactos, UUtiles;

{$R *.dfm}

procedure TCrmFMContactosDir.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  EDirNombre.Text := CrmDMContactos.QMContactosDIR_NOMBRE.AsString;
  EFTipoDir.Text := 'CL';

  // Asigno Imagenes a BitdBtn
  GetBitmapFromImageList(BBAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancelar, 1, DMMain.ILMain_Ac, 0);
end;

procedure TCrmFMContactosDir.FormShow(Sender: TObject);
begin
  EDireccion2.SetFocus;
end;

procedure TCrmFMContactosDir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCrmFMContactosDir.BBAceptarClick(Sender: TObject);
begin
  CrmDMContactos.NuevoTercero(EDireccion2.Text, EFTipoDir.Text,
     EDirNombre.Text, EDirNumero.Text, EDirBloqEsc.Text,
     EDirPiso.Text, EDirPuerta.Text, CrmDmContactos.QMContactosID_CONTACTO.AsInteger);

  CrmDMContactos.QMContactos.Refresh;
  ShowMessage(_('Tercero creado correctamente'));
end;

procedure TCrmFMContactosDir.BBCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
