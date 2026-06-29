unit UFPregEtiqAgrup;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UFormGest,
  StdCtrls, Mask, DBCtrls, Buttons, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ULFDBEdit, ULFPanel,
  ULFEditFind2000, ULFLabel;

type
  TFPregEtiqAgrup = class(TG2KForm)
     PNLMain: TLFPanel;
     EF1: TLFEditFind2000;
     BitBtnOk: TBitBtn;
     BitBtnCancel: TBitBtn;
     DBETit1: TLFDbedit;
     Label1: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EF1Change(Sender: TObject);
     procedure EF1Exit(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     modo: integer;
  end;

var
  FPregEtiqAgrup : TFPregEtiqAgrup;

procedure DevuelveValor(var Modo: integer; Titulo: string; var Agrupacion: string; padre: TComponent);

implementation

uses UDMMain, UFMain, UDMPregEtiqAgrup, UUtiles;

{$R *.DFM}

procedure DevuelveValor(var Modo: integer; Titulo: string; var Agrupacion: string; padre: TComponent);
begin
  FPregEtiqAgrup := TFPregEtiqAgrup.Create(padre);
  FPregEtiqAgrup.Caption := Titulo;
  FPregEtiqAgrup.Modo := modo;

  case modo of
     0:
     begin
        FPregEtiqAgrup.Label1.Caption := 'Agrupación';
        FPregEtiqAgrup.EF1.Tabla_a_buscar := 'VER_AGRUPACIONES_CLIENTE';
        FPregEtiqAgrup.EF1.CampoNum := 'AGRUPACION';
        FPregEtiqAgrup.EF1.CampoStr := 'TITULO';
        FPregEtiqAgrup.EF1.Filtros := [obEmpresa];
        FPregEtiqAgrup.DBETit1.DataSource := DMPregEtiqAgrup.DSxAgrupClientes;
        FPregEtiqAgrup.DBETit1.DataField := 'TITULO';
     end;
     1:
     begin
        FPregEtiqAgrup.Label1.Caption := 'Agrupación';
        FPregEtiqAgrup.EF1.Tabla_a_buscar := 'VER_AGRUPACIONES_PROVEEDOR';
        FPregEtiqAgrup.EF1.CampoNum := 'AGRUPACION';
        FPregEtiqAgrup.EF1.CampoStr := 'TITULO';
        FPregEtiqAgrup.EF1.Filtros := [obEmpresa];
        FPregEtiqAgrup.DBETit1.DataSource := DMPregEtiqAgrup.DSxAgrupProveedores;
        FPregEtiqAgrup.DBETit1.DataField := 'TITULO';
     end;
  end;

  Agrupacion := '';
  FPregEtiqAgrup.ShowModal;

  if FPregEtiqAgrup.ModalResult = mrOk then
  begin
     case modo of
        0, 1: Agrupacion := FPregEtiqAgrup.EF1.Text;
     end;
  end
  else
     modo := -1;

  FPregEtiqAgrup.Free;
end;

procedure TFPregEtiqAgrup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPregEtiqAgrup);
  action := caFree;
end;

procedure TFPregEtiqAgrup.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE   
  AbreData(TDMPregEtiqAgrup, DMPregEtiqAgrup);

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BitBtnOk, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BitBtnCancel, 1, DMMain.ILMain_Ac, 0);
end;

procedure TFPregEtiqAgrup.EF1Change(Sender: TObject);
begin
  if EF1.Text <> '' then
     case modo of
        0: DMPregEtiqAgrup.FiltraAgrupacion(EF1.Text);
        1: DMPregEtiqAgrup.FiltraAgrupacionProv(EF1.Text);
     end;
end;

procedure TFPregEtiqAgrup.EF1Exit(Sender: TObject);
begin
  if EF1.Text <> '' then
     case modo of
        0: DMPregEtiqAgrup.FiltraAgrupacion(EF1.Text);
        1: DMPregEtiqAgrup.FiltraAgrupacionProv(EF1.Text);
     end;
end;

end.
