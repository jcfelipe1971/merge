unit UFPregAgrupTer;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UFormGest,
  StdCtrls, Mask, DBCtrls, Buttons, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ULFDBEdit, ULFPanel,
  ULFEditFind2000, ULFLabel;

type
  TFPregAgrupTer = class(TG2KForm)
     PNLMain: TLFPanel;
     EF1: TLFEditFind2000;
     EF2: TLFEditFind2000;
     BitBtnOk: TBitBtn;
     BitBtnCancel: TBitBtn;
     DBETit1: TLFDbedit;
     DBETit2: TLFDbedit;
     Label1: TLFLabel;
     LTipo: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EF2Exit(Sender: TObject);
     procedure EF2Change(Sender: TObject);
     procedure EF1Change(Sender: TObject);
     procedure EF1Exit(Sender: TObject);
     procedure EF1Busqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Modo: integer;
     Rig: integer;
  end;

var
  FPregAgrupTer : TFPregAgrupTer;

procedure DevuelveValor(var aModo: integer; Titulo: string; var Tercero: integer; var Agrupacion, Tipo: string; padre: TComponent; aRig: integer);

implementation

uses UDMMain, UFMain, UDMPregAgrupTer, UUtiles;

{$R *.DFM}

procedure DevuelveValor(var aModo: integer; Titulo: string; var Tercero: integer; var Agrupacion, Tipo: string; padre: TComponent; aRig: integer);
begin
  FPregAgrupTer := TFPregAgrupTer.Create(padre);
  try
     with FPregAgrupTer do
     begin
        Caption := Titulo;
        EF2.Tabla_a_buscar := 'SYS_TIPOS_DESTINO';
        EF2.CampoNum := 'TIPO';
        EF2.CampoStr := 'TITULO';
        EF2.OrdenadoPor.Text := 'TIPO';
        EF2.Color := clWindow;
        EF2.Font.Color := clWindowText;

        Rig := aRig;

        if ((aModo = 2) or (aModo = 3)) then
        begin
           EF2.Enabled := False;
           EF2.ReadOnly := True;
           EF2.Color := clInfoBk;
           EF2.Font.Color := clGrayText;
        end;

        Modo := aModo;

        case Modo of
           0:
           begin
              Label1.Caption := _('Agrupación');
              EF1.Tabla_a_buscar := 'VER_AGRUPACIONES_CLIENTE';
              EF1.CampoNum := 'AGRUPACION';
              EF1.CampoStr := 'TITULO';
              EF1.Filtros := [obEmpresa];
              EF1.OrdenadoPor.Text := 'AGRUPACION';
              DBETit1.DataSource := DMPregAgrupTer.DSxAgrupacion;
              DBETit1.DataField := 'TITULO';
           end;

           1:
           begin
              Label1.Caption := _('Tercero');
              EF1.Tabla_a_buscar := 'SYS_TERCEROS';
              EF1.CampoNum := 'TERCERO';
              EF1.CampoStr := 'NOMBRE_R_SOCIAL';
              EF1.Filtros := [];
              EF1.OrdenadoPor.Text := 'TERCERO';
              DBETit1.DataSource := DMPregAgrupTer.DSxTerceros;
              DBETit1.DataField := 'NOMBRE_R_SOCIAL';
           end;

           2:
           begin
              Label1.Caption := _('Agrupación');
              EF1.Tabla_a_buscar := 'VER_AGRUPACION_CORREO';
              EF1.CampoNum := 'AGRUPACION';
              EF1.CampoStr := 'TITULO';
              EF1.Filtros := [obEmpresa];
              EF1.OrdenadoPor.Text := 'AGRUPACION';
              DBETit1.DataSource := DMPregAgrupTer.DSxAgrupacion;
              DBETit1.DataField := 'TITULO';
              aModo := 0;
           end;

           3:
           begin
              Label1.Caption := _('Tercero');
              EF1.Tabla_a_buscar := 'VER_TERCEROS_CORREO';
              EF1.CampoNum := 'TERCERO';
              EF1.CampoStr := 'TITULO';
              EF1.Filtros := [];
              EF1.OrdenadoPor.Text := 'TERCERO';
              DBETit1.DataSource := DMPregAgrupTer.DSxTerceros;
              DBETit1.DataField := 'NOMBRE_R_SOCIAL';
              aModo := 1;
           end;
        end;

        Tercero := 0;
        Agrupacion := '';
        Tipo := '';
        ShowModal;

        if ModalResult = mrOk then
        begin
           case aModo of
              0:
              begin
                 Agrupacion := EF1.Text;
                 Tipo := EF2.Text;
                 Tercero := 0;
              end;

              1:
              begin
                 Agrupacion := '';
                 Tipo := EF2.Text;
                 Tercero := StrToIntDef(EF1.Text, 0);
              end;
           end;
        end
        else
           aModo := -1;
     end;
  finally
     FPregAgrupTer.Free;
  end;
end;

procedure TFPregAgrupTer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPregAgrupTer);
  action := caFree;
end;

procedure TFPregAgrupTer.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE   
  AbreData(TDMPregAgrupTer, DMPregAgrupTer);

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BitBtnOk, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BitBtnCancel, 1, DMMain.ILMain_Ac, 0);
end;

procedure TFPregAgrupTer.EF2Exit(Sender: TObject);
begin
  if (EF2.Text <> '') then
     DMPregAgrupTer.FiltraTipo(EF2.Text);
end;

procedure TFPregAgrupTer.EF2Change(Sender: TObject);
begin
  if (EF2.Text <> '') then
     DMPregAgrupTer.FiltraTipo(EF2.Text);
end;

procedure TFPregAgrupTer.EF1Change(Sender: TObject);
begin
  if EF1.Text <> '' then
     case Modo of
        0: DMPregAgrupTer.FiltraAgrupacion(EF1.Text);
        1: DMPregAgrupTer.FiltraTercero(StrToInt(EF1.Text));
     end;
end;

procedure TFPregAgrupTer.EF1Exit(Sender: TObject);
begin
  if EF1.Text <> '' then
     case Modo of
        0: DMPregAgrupTer.FiltraAgrupacion(EF1.Text);
        1: DMPregAgrupTer.FiltraTercero(StrToInt(EF1.Text));
     end;
end;

procedure TFPregAgrupTer.EF1Busqueda(Sender: TObject);
begin
  if (Modo = 2) or (Modo = 3) then
  begin
     EF1.CondicionBusqueda := 'RIG = ' + IntToStr(Rig);
  end;
end;

end.
