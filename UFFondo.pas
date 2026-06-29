unit UFFondo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, TeEngine, Series, TeeProcs, Chart, DbChart,
  Menus, jpeg, ActnList, UAccesosDirectos;

type
  TPanelTransparent = class(TPanel)
  private
     procedure CnCtlColorStatic(var Msg: TWMCtlColorStatic); message CN_CTLCOLORSTATIC;
     procedure WmEraseBkgnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
     {TODO : Duilio Ver para que se ha puesto en la seccion PROTECTED }
  protected
     procedure Paint; override;

  public
     procedure CreateParams(var Params: TCreateParams); override;
  end;

  TAvisos = record
     Cabecera, Detalle, Accion: string;
  end;

  // Clase { TADPanel } para crear un panel con las propiedades de mouse Enter y con  Leave
  TADPanel = class(TPanel)
  private
     { Private declarations }
     FOnMouseLeave: TNotifyEvent;
     FOnMouseEnter: TNotifyEvent;
     FActivateMouseLeave: boolean;
     PanelInfo: TPanel;
     Accion: TAction;
     procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
  protected
     { Protected declarations }
  public
     { Public declarations }
     constructor Create(AOwner: TComponent); override;
     procedure ADPMouseEnter(Sender: TObject);
     procedure ADPMouseLeave(Sender: TObject);
  published
     { Published declarations }
     property OnMouseLeave: TNotifyEvent Read FOnMouseLeave Write FOnMouseLeave;
     property OnMouseEnter: TNotifyEvent Read FOnMouseEnter Write FOnMouseEnter;
  end;

  TFFondo = class(TForm)
     IFondo: TImage;
     ALFondo: TActionList;
     PMAD: TPopupMenu;
     MIEliminaAccesoDirecto: TMenuItem;
     AEliminarAD: TAction;
     Timer1: TTimer;
     ACambiaColorFondoAD: TAction;
     N1: TMenuItem;
     MICambiaColor: TMenuItem;
     ACambiaColorLetraAD: TAction;
     MICambiaColordeLetra: TMenuItem;
     MIMosrarBorde: TMenuItem;
     MIOcultarBorde: TMenuItem;
     procedure FormPaint(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure SBAccesosDirectosClick(Sender: TObject);
     procedure Label1Click(Sender: TObject);
     procedure Image2Click(Sender: TObject);
     procedure DBChart1Click(Sender: TObject);
     procedure DBCMensualClick(Sender: TObject);
     procedure ADPMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure ADPMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
     procedure ADPMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure FormShow(Sender: TObject);
     procedure AEliminarADExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure Timer1Timer(Sender: TObject);
     procedure FormClick(Sender: TObject);
     procedure ACambiaColorFondoADExecute(Sender: TObject);
     procedure ACambiaColorLetraADExecute(Sender: TObject);
     procedure MIMosrarBordeClick(Sender: TObject);
     procedure MIOcultarBordeClick(Sender: TObject);
  private
     { Private declarations }
     FILogo: TImage;
     CantidadAvisos, AvisoAMostrar: integer;
     ADSeleccionado: string;
     Avisos: array of TAvisos;
     inReposition: boolean;
     oldPos: TPoint;
  public
     { Public declarations }
     PNLAvisos: TADPanel;
     LControlDec, LControl, LControlInc, LControlCerrar: Tlabel;
     property ILogo: TImage Read FILogo Write FILogo;
     procedure Posicionar;
     procedure CreaAD(Tipo, aLeft, aTop, ico: integer; LabelCabecera, LabelDetalle, NombreAccion: string; ColorAD, ColorFontAD: TColor; BordeVisible: boolean);
     procedure CreaImagen(p: TPanel; Tipo: integer; NombreAccion, DameNombreICO: string);
     procedure CargaImagen(i: Timage; Nombre: string); overload;
     procedure CargaImagen(i: Timage; Nombre, NombreAccion: string); overload;
     procedure EjecutaAccion(Sender: TObject);
     procedure CreaLabel(p: TPanel; Tipo: integer; Texto: string; ColorFontAD: TColor);
     procedure CreaPanel(p: TPanel; Tipo: integer);
     procedure CreaForma(p: TPanel; Tipo: integer);
     function DameNombreICO(ICO: integer): string;
     procedure AgregarAvisoDetalle(aCabecera, aDetalle, aAccion: string);
     procedure MuestraAvisos;
     procedure LabelAvisosClick(Sender: TObject);
     procedure LControlDecClick(Sender: TObject);
     procedure LControlIncClick(Sender: TObject);
     procedure LControlCerrarClick(Sender: TObject);
     procedure DrawRounded(Control: TWinControl);  //para redondear esquinas de un control
  end;

var
  FFondo : TFFondo;

implementation

uses UFMain, Types, StrUtils, ImgList, UDMMain, UFMAlmacenes, UFormGest, Uutiles;

{$R *.DFM}

{ R IMADRecursos.RES}

procedure TPanelTransparent.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
end;

procedure TPanelTransparent.WmEraseBkgnd(var Msg: TWMEraseBkgnd);
begin
  Msg.Result := 1;
end;

procedure TPanelTransparent.CnCtlColorStatic(var Msg: TWMCtlColorStatic);
begin
  SetBKMode(Msg.ChildDC, TRANSPARENT);
  Msg.Result := GetStockObject(NULL_BRUSH);
end;

procedure TPanelTransparent.Paint;
begin
  SetBKMode(Handle, TRANSPARENT);
  //inherited;
end;

procedure TFFondo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  FILogo := TImage.Create(Self);
  FILogo.Name := 'FILogo';

  ADSeleccionado := '';
  PNLAvisos := nil;

  // Temporal. Habilito Panel para Accesos directos segun KRICONF_900
  if (DMMain.EstadoKri(900) <> 1) then
  begin
     Self.Enabled := False;
     Timer1.Enabled := False;
  end;
  CantidadAvisos := 0;
  AvisoAMostrar := 0;
end;

procedure TFFondo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LiberaAccesosDirectos;
end;

procedure TFFondo.FormDestroy(Sender: TObject);
begin
  FILogo.Free;
end;

procedure TFFondo.FormShow(Sender: TObject);
begin
  CargaAccesosDirectos;
  CargaAvisos;
  if (CantidadAvisos > 0) then
     MuestraAvisos;
end;

//***************************** Inicio  de { TADPanel } ****************************************************

procedure TADPanel.CMMouseEnter(var Msg: TMessage);
begin
  Msg.Result := WM_CANCELMODE;
  FActivateMouseLeave := True;
  if Assigned(FOnMouseEnter) then
     FOnMouseEnter(Self);
end;

procedure TADPanel.CMMouseLeave(var Msg: TMessage);
begin
  if (FActivateMouseLeave) then
  begin
     Msg.Result := WM_CANCELMODE;
     FActivateMouseLeave := False;
     if Assigned(FOnMouseLeave) then
        FOnMouseLeave(Self);
  end;
end;

constructor TADPanel.Create(AOwner: TComponent);
begin
  FActivateMouseLeave := True;
  PanelInfo := nil;
  Accion := nil;

  inherited;
end;

procedure TADPanel.ADPMouseEnter(Sender: TObject);
var
  i : integer;
begin
  (Sender as TADPanel).BevelOuter := bvRaised;
  for i := 0 to (Sender as TADPanel).ControlCount - 1 do
     if (Sender as TADPanel).Controls[i] is Timage then
        if ((Sender as TADPanel).Controls[i] as Timage).Tag in [3, 4, 5, 6, 8, 9] then // [3,4,5,6,8,9]  tipos de imagenes que se hacen visibles
           ((Sender as TADPanel).Controls[i] as Timage).Visible := True;
  (Sender as TADPanel).Cursor := crSizeAll;
end;

procedure TADPanel.ADPMouseLeave(Sender: TObject);
var
  i : integer;
begin
  (Sender as TADPanel).BevelOuter := bvNone;
  for i := 0 to (Sender as TADPanel).ControlCount - 1 do
     if (Sender as TADPanel).Controls[i] is Timage then
        if ((Sender as TADPanel).Controls[i] as Timage).Tag in [3, 4, 5, 6, 8, 9] then  // [3,4,5,6,8,9]  tipos de imagenes que se ocultan en ADMouseLeave
           ((Sender as TADPanel).Controls[i] as Timage).Visible := False;

  (Sender as TADPanel).Cursor := crDefault;
end;

//***************************** Final  de { TADPanel } ****************************************************

procedure TFFondo.FormPaint(Sender: TObject);
var
  contx, conty, Ancho, Alto : integer;
  dest : TRect;
  Factor : double;
begin
  // Si es mas grande que el fondo la escalo para que entre completa
  if ((IFondo.Width > ClientRect.Right) or (IFondo.Height > ClientRect.Bottom)) then
  begin
     Factor := (IFondo.Width / IFondo.Height);

     // Si es apaisada escalo horizontalmente
     if (IFondo.Width > IFondo.Height) then
     begin
        if (Trunc(ClientRect.Right / Factor) <= ClientRect.Bottom) then
        begin
           Ancho := ClientRect.Right;
           Alto := Trunc(ClientRect.Right / Factor);
        end
        else
        begin
           Alto := ClientRect.Bottom;
           Ancho := Trunc(ClientRect.Bottom * Factor);
        end;
     end
     else
     begin
        Alto := ClientRect.Bottom;
        Ancho := Trunc(ClientRect.Bottom * Factor);
     end;

     IFondo.Picture.Bitmap.Canvas.StretchDraw(Rect(0, 0, Ancho, Alto), IFondo.Picture.Bitmap);
     IFondo.Picture.Bitmap.Width := Ancho;
     IFondo.Picture.Bitmap.Height := Alto;
     Canvas.Draw((ClientRect.Right - Ancho) div 2, (ClientRect.Bottom - Alto) div 2, IFondo.Picture.Graphic);

     IFondo.Picture.Bitmap.Width := ClientRect.Right;
     IFondo.Picture.Bitmap.Height := ClientRect.Bottom;
     // IFondo.Picture.Bitmap.Canvas.Draw(0,0,Canvas.Brush.Bitmap);
     IFondo.Picture.Bitmap.Canvas.CopyRect(Rect(0, 0, ClientRect.Right, ClientRect.Bottom), Canvas, Rect(0, 0, ClientRect.Right, ClientRect.Bottom));
     // Canvas.StretchDraw(Rect(0, 0, Ancho, Alto), IFondo.Picture.Bitmap);
  end
  else
  begin
     // Si es mas pequeña hago mosaico
     if (IFondo.Width > 0) then
        Ancho := (ClientRect.Right - ClientRect.Left) div IFondo.Width
     else
        Ancho := 0;

     if (IFondo.Height > 0) then
        Alto := (ClientRect.Bottom - ClientRect.Top) div IFondo.Height
     else
        Alto := 0;

     dest := IFondo.ClientRect;

     for contx := 0 to Ancho do
     begin
        for conty := 0 to Alto do
        begin
           // if IntersectRect(intersect, dest, Canvas.ClipRect) then
           Canvas.Draw(dest.Left, dest.Top,
              IFondo.Picture.Graphic);
           OffSetRect(dest, 0, IFondo.Height);
        end;
        OffSetRect(dest, IFondo.Width, -(Alto + 1) * IFondo.Height);
     end;
  end;

  if (ILogo <> nil) then
  begin
     // Pintar logo sobre fondo en posición
     Ancho := ClientRect.Right - ILogo.Picture.Width;
     Alto := ClientREct.Bottom - ILogo.Picture.Height;
     Canvas.Draw(Ancho, Alto, ILogo.Picture.Graphic);
  end;
end;

procedure TFFondo.Posicionar;
var
  t, l : integer;
begin
  t := 0;

  if FMain.Visible then
     t := FMain.Top;

  if (t < 0) then
     t := 0;

  l := 0;
  if FMain.Visible then
     l := FMain.Left;

  if (l < 0) then
     l := 0;

  Self.Top := t;
  Self.Left := l;
end;

procedure TFFondo.DrawRounded(Control: TWinControl);
var
  R : TRect;
  Rgn : HRGN;
begin
  with Control do
  begin
     R := ClientRect;
     // Agrego un pixel para evitar que se vean lineas blancas.
     Rgn := CreateRoundRectRgn(R.Left + 1, R.Top + 1, R.Right, R.Bottom, 20, 20);
     Perform(EM_GETRECT, 0, lParam(@R));
     InflateRect(R, -4, -4);
     Perform(EM_SETRECTNP, 0, lParam(@R));
     SetWindowRgn(Handle, Rgn, True);
     Invalidate;
  end;
end;

procedure TFFondo.CreaAD(Tipo, aLeft, aTop, ico: integer; LabelCabecera, LabelDetalle, NombreAccion: string; ColorAD, ColorFontAD: TColor; BordeVisible: boolean);
var
  p, ps : TADPanel;
  PanelControl, PanelLabelDetalle : TPanel;
  i : integer;
begin
  {Tipo
  1- ADGrandeNegro
  2- Avisos
  3- Acceso Directo Chico
  }

  if (Self.Enabled) then
  begin
     if (Tipo <> 2) or (not Assigned(PNLAvisos)) then
     begin
        p := TADPanel.Create(FFondo);

        with p do
        begin
           Left := aLeft;
           Top := aTop;

           case Tipo of
              1:
              begin
                 Width := 325;
                 Height := 357;
              end;
              2:
              begin // Avisos
                 Width := 380;
                 Height := 357;

                 // Aseguro que la posicion este dentro del panel
                 if (Left = 0) or (Left + Width > FFondo.Width) then
                    Left := FFondo.Width - p.Width - 5;

                 if (Top = 0) or (Top + Height > FFondo.Height) then
                    Top := FFondo.Height - p.Height - 5;

                 // Guardo este panel para poder encontrarlo y agregar mensajes.
                 PNLAvisos := p;
              end;
              3:
              begin // Acceso Directo Chico
                 Width := 100;
                 Height := 100;
                 Name := 'P_AD_' + NombreAccion;
              end;
           end;

           Tag := Tipo;
           Parent := FFondo;
           BevelOuter := bvNone;
           Caption := '';

           if BordeVisible then
              Color := clWhite
           else
              Color := ColorAD;

           PopupMenu := PMAD;

           PanelInfo := TADPanel.Create(p);
           PanelInfo.Parent := p;
           PanelInfo.Left := 5;
           PanelInfo.Top := 5;
           PanelInfo.Width := p.Width - 10;
           PanelInfo.Height := p.Height - 10;
           DrawRounded(PanelInfo);
           PanelInfo.Color := ColorAD;

           PanelControl := nil;
           PanelLabelDetalle := nil;
           if (Tipo = 2) then
           begin
              PanelInfo.Name := 'P_Aviso';
              PanelInfo.Color := $00DADADA;
              PanelControl := TPanel.Create(PanelInfo);
              PanelControl.Parent := PanelInfo;
              PanelControl.Align := alTop;
              PanelControl.Color := clWhite;
              PanelControl.BevelOuter := bvNone;
              PanelControl.BorderStyle := bsNone;
              PanelControl.Height := 20;
           end
           else
           begin
              PanelInfo.Name := 'P_' + NombreAccion;
              PanelLabelDetalle := TPanel.Create(PanelInfo);
              PanelLabelDetalle.Parent := PanelInfo;
              PanelLabelDetalle.Align := alBottom;
              PanelLabelDetalle.Color := PanelInfo.Color;
              PanelLabelDetalle.BevelOuter := bvNone;
              PanelLabelDetalle.BorderStyle := bsNone;
              PanelLabelDetalle.Height := 25;
           end;

           PanelInfo.Caption := '';

           case Tipo of
              1:
              begin
                 // CreaImagen(PanelInfo, 1, '', DameNombreICO(ico));
                 // CreaImagen(PanelInfo, 5, '', ''); //icono menu
                 CreaLabel(PanelInfo, 3, LabelCabecera, ColorFontAD); // Label cabecera
                 // CreaPanel(PanelInfo,1);  //panel de ventas
              end;
              2:
              begin // Avisos
                 if Assigned(PanelControl) then
                 begin
                    CreaLabel(PanelControl, 10, ' > ', clWindowText); // Label control de avisos derecha
                    CreaLabel(PanelControl, 9, '0 de 0', clWindowText); // Label control de avisos centro
                    CreaLabel(PanelControl, 8, ' < ', clWindowText); // Label control de avisos izquierda
                    CreaLabel(PanelControl, 11, ' X ', clWindowText); // Label control de avisos cerrar
                 end;
                 // CreaImagen(PanelInfo, 2, '', DameNombreICO(ico)); // Imagen de fondo Grande color amarillo
                 // CreaImagen(PanelInfo, 5, '', '');  // Icono menu grande
                 CreaLabel(PanelInfo, 3, LabelCabecera, clWindowText); // Label cabecera avisos
                 CreaLabel(PanelInfo, 5, LabelDetalle, clWindowText); // Label detalle avisos
              end;
              3:
              begin // Acceso Directo Chico
                 // CreaImagen(PanelInfo, 7, NombreAccion, DameNombreICO(ico)); // Imagen centra con la accion
                 // CreaImagen(PanelInfo, 8, NombreAccion, ''); // Popup Menu lateral derecho
                 CreaLabel(PanelInfo, 1, LabelCabecera, ColorFontAD); // Label de cabecera
                 if Assigned(PanelLabelDetalle) then
                 begin
                    CreaLabel(PanelLabelDetalle, 2, LabelDetalle, ColorFontAD); // Label detalle
                 end;

                 CreaLabel(PanelInfo, 7, Copy(NombreAccion, 2, 1), ColorFontAD); // Label letra del centro " Primera Letra del Nombre "
              end;
           end;

           // Para forzar a que este posicionado arriba de todos los paneles 
           if (Tipo = 2) then
              PanelControl.Top := 0;

           OnMouseLeave := ADPMouseLeave;
           OnMouseEnter := ADPMouseEnter;
           OnMouseDown := ADPMouseDown;
           OnMouseMove := ADPMouseMove;
           OnMouseUp := ADPMouseUp;

           // Obtengo la accion según el nombre de accion
           Accion := nil;
           for i := 0 to (FMain.ALMain.ActionCount - 1) do
           begin
              if (TAction(FMain.ALMain.Actions[i]).Name = NombreAccion) then
                 Accion := TAction(FMain.ALMain.Actions[i]);
           end;
        end;
     end
     else
        p := PNLAvisos;

     if (Tipo = 2) and (Trim(LabelDetalle) <> '') then
        AgregarAvisoDetalle(LabelCabecera, LabelDetalle, NombreAccion);

     // Evito que se solapen los paneles.
     i := 0;
     while (i < FFondo.ControlCount) do
     begin
        ps := TADPanel(FFondo.Controls[i]);

        // Calculo si piso el panel
        if (p <> ps) and
           (
           // Solapa arriba a la izquierda
           ((ps.Top <= p.Top) and (ps.Top + ps.Height >= p.Top) and (ps.Left <= p.Left) and (ps.Left + ps.Width >= p.Left)) or
           // Solapa abajo a la izquierda
           ((ps.Top >= p.Top) and (ps.Top <= p.Top + p.Height) and (ps.Left <= p.Left) and (ps.Left + ps.Width >= p.Left)) or
           // Solapa arriba a la derecha
           ((ps.Top <= p.Top) and (ps.Top + ps.Height >= p.Top) and (ps.Left >= p.Left) and (ps.Left <= p.Left + p.Width)) or
           // Solapa abajo a la derecha
           ((ps.Top >= p.Top) and (ps.Top <= p.Top + p.Height) and (ps.Left >= p.Left) and (ps.Left <= p.Left + p.Width))
           ) then
        begin
           // Si lo piso muevo el panel a la derecha
           p.Left := ps.Left + ps.Width + 1;

           // Si me pase del limite lo muevo hacia abajo y vuelvo a empezar comprobaciones.
           if (p.Left + p.Width > FFondo.Width) then
           begin
              p.Top := ps.Top + ps.Height + 1;
              p.Left := 200;

              // Solo vuelvo a comparar si estoy dentro del limite vertical
              if (p.Top + p.Height < FFondo.Height) then
                 i := 0
              else
                 Inc(i);
           end
           else
              Inc(i);
        end
        else
           Inc(i);
     end;

     if (CantidadAvisos > 0) then
        MuestraAvisos;

     DrawRounded(p);
  end;
end;

procedure TFFondo.CreaImagen(p: TPanel; Tipo: integer; NombreAccion, DameNombreICO: string);
var
  im : Timage;
begin
  {Tipo
  1- ADGrandeAzul
  2- ADGrandeVerde almacenes
  3- btMenuNegro
  4- btEliminarNegro
  5- Menu Almacnes grande
  6- ADGrandeColor
  7- btMenuNegro
  8- btEliminarNegro
  9- btEliminarNegro  }
  im := Timage.Create(Self);
  with im do
  begin
     Tag := tipo;
     Parent := p;
     case tipo of
        1:
        begin
           CargaImagen(im, 'ADGrandeAzul');
           Width := 284;
           Height := 317;
           Left := 27;
           Top := 23;
           Stretch := True;
        end;
        2:
        begin
           CargaImagen(im, 'ADAmarilloG');
           Width := 284;
           Height := 317;
           Left := 27;
           Top := 23;
           Stretch := True;
        end;
        3:
        begin
           CargaImagen(im, 'imbtMenuNegro');
           Width := 18;
           Height := 17;
           Left := 301;
           Top := 171;
           Visible := False;
        end;
        4:
        begin
           CargaImagen(im, 'imbtEliminarNegro');
           Width := 18;
           Height := 17;
           Left := 256;
           Top := 29;
           Visible := False;
        end;
        5:
        begin //5- Menu  grande Avisos
           CargaImagen(im, 'MenuBlanco');
           Width := 18;
           Height := 17;
           Left := 301;
           Top := 171;
           Visible := False;
        end;
        6:
        begin
           CargaImagen(im, 'imbtEliminarColor');
           Width := 18;
           Height := 17;
           Left := 256;
           Top := 29;
           Visible := False;
           // OnClick := BtEliminarClick;
        end;
        7:
        begin
           CargaImagen(im, DameNombreICO, NombreAccion);
           Width := 97;
           Height := 94;
           Left := 29;
           Top := 27;
           Visible := True;
           Stretch := True;
           OnClick := EjecutaAccion;
        end;
        8:
        begin
           CargaImagen(im, 'MenuBlanco');
           Width := 18;
           Height := 17;
           Left := 128;
           Top := 65;
           Visible := False;
           BringToFront;
           // Name := 'i' + NombreAccion;
        end;
        9:
        begin
           CargaImagen(im, 'imbtEliminarBlanco');
           Width := 18;
           Height := 17;
           Left := 132;
           Top := 6;
           Visible := False;
           // OnClick := BtEliminarClick;
        end;
     end;
  end;
end;

procedure TFFondo.CreaForma(p: Tpanel; Tipo: integer);
var
  S : TShape;
begin
  {Tipo
  1- TShape Rojo Debajo de los AD Grandes
  }
  S := TShape.Create(Self);
  with S do
  begin
     Parent := p;
     Font.Color := clRed;
     case Tipo of
        1:
        begin
           Width := 145;
           Height := 17;
           Left := 80;
           Top := 288;
           Pen.Color := clRed;
           Brush.Color := clRed;
           Shape := stRoundRect;
        end;
     end;
  end;
end;

procedure TFFondo.CreaPanel(p: TPanel; Tipo: integer);
var
  l : TPanel;
begin
  {Tipo
  1- Panel de ventas
  }
  l := TPanel.Create(Self);
  with l do
  begin
     Parent := p;
     Font.Color := $00F3FAF1;
     Caption := '';
     BorderStyle := bsNone;
     case Tipo of
        1:
        begin
           Width := 230;
           Height := 41;
           Left := 41;
           Top := 59;
        end;
        2:
        begin

        end;
     end;
  end;
end;

procedure TFFondo.CreaLabel(p: TPanel; Tipo: integer; Texto: string; ColorFontAD: TColor);
var
  l : TLabel;
begin
  l := TLabel.Create(p);
  with l do
  begin
     Parent := p;
     Font.Style := [fsBold];
     // Font.Name := 'Arial Black';
     Caption := Texto;
     Alignment := taCenter;
     OnClick := EjecutaAccion;
     Transparent := True;
     Font.Color := ColorFontAD;
     case Tipo of
        1:
        begin // Label de la cabecera del AD Chico
           Font.Size := 8;
           Align := alTop;
        end;
        2:
        begin // Label de la Detalle del AD Chico
           Font.Size := 8;
           Align := alBottom;
           Layout := tlTop;
           WordWrap := True;
        end;
        3:
        begin // Label Cabera de Almacenes grande
           // Font.Color := $00DADADA;
           Font.Size := 12;
           Align := alTop;
        end;
        4:
        begin // Label Almacenes stock minimo grande cabecera
           // Font.Color := clGray;
           Font.Size := 8;
           Align := alClient;
        end;
        5:
        begin // Label Warning
           // Font.Color := clGray;
           Font.Size := 7;
           Align := alClient;

           // Quito alineacion y agrego un poco de margen a los lados
           AutoSize := False;
           Align := alNone;
           Left := Left + 5;
           Width := Width - 10;

           { DEBUG - Para ver la posicion el label
           Transparent := False;
           ParentColor := False;
           Color := clYellow;
           }

           Alignment := taLeftJustify;
           Name := 'LAvisosDetalles';
           OnMouseUp := ADPMouseUp;
           Caption := '';
           OnClick := LabelAvisosClick;
           Font.Style := [];
        end;
        6:
        begin // Label
           // Font.Color := clWhite;
           Font.Size := 10;
           Align := alClient;
           BringToFront;
        end;
        7:
        begin // Label centro una sola letra
           // Font.Color := clWhite;
           Font.Size := 40;
           Font.Name := 'Arial';
           Color := clGray;
           Align := alClient;
           Layout := tlCenter;
           BringToFront;
           Name := 'L' + Copy(p.Name, 2, Length(p.Name));
           OnMouseUp := ADPMouseUp;
        end;
        8:
        begin // Label del control de avisos izquierda
           // Font.Color := clBlack;
           Font.Size := 10;
           Font.Style := [fsBold];
           //Align := alLeft;
           Left := (p.Width div 4);
           Layout := tlCenter;
           LControlDec := L;
           OnClick := LControlDecClick;
        end;
        9:
        begin // Label del control de avisos centro
           // Font.Color := clBlack;
           Font.Size := 10;
           //Align := alLeft;
           Left := (p.Width div 4) * 2;
           Layout := tlCenter;
           LControl := L;
        end;
        10:
        begin // Label del control de avisos derecha
           // Font.Color := clBlack;
           Font.Size := 10;
           //Align := alLeft;
           Left := (p.Width div 4) * 3;
           Layout := tlCenter;
           LcontrolInc := L;
           OnClick := LControlIncClick;
        end;
        11:
        begin // Label del control de avisos cerrar
           // Font.Color := clBlack;
           Font.Size := 10;
           Align := alRight;
           Layout := tlCenter;
           LControlCerrar := L;
           OnClick := LControlCerrarClick;
        end;
     end;
  end;
end;

procedure TFFondo.AgregarAvisoDetalle(aCabecera, aDetalle, aAccion: string);
begin
  Inc(CantidadAvisos);
  SetLength(Avisos, CantidadAvisos);
  Avisos[CantidadAvisos - 1].Cabecera := aCabecera;
  Avisos[CantidadAvisos - 1].Detalle := aDetalle;
  Avisos[CantidadAvisos - 1].Accion := aAccion;

  // Fuerzo a que se muestre el ultimo mensaje, que es el que acabo de agregar
  AvisoAMostrar := 0;
end;

procedure TFFondo.CargaImagen(i: Timage; Nombre: string);
var
  rs : TResourceStream;
begin
  try
     rs := TResourceStream.Create(HInstance, Nombre, RT_RCDATA);
     try
        i.Picture.Bitmap.LoadFromStream(rs);
     finally
        rs.Free;
     end;
  except
     i.Picture.Bitmap := nil;
  end;
end;

procedure TFFondo.CargaImagen(i: Timage; Nombre, NombreAccion: string);
begin
  CargaImagen(i, Nombre);
  if NombreAccion <> '' then
     i.Name := 'IMG_' + NombreAccion;
end;

procedure TFFondo.SBAccesosDirectosClick(Sender: TObject);
begin
  FMain.RestauraVentanas;
end;

procedure TFFondo.Label1Click(Sender: TObject);
begin
  FMain.RestauraVentanas;
end;

procedure TFFondo.Image2Click(Sender: TObject);
begin
  FMain.RestauraVentanas;
end;

procedure TFFondo.DBChart1Click(Sender: TObject);
begin
  FMain.RestauraVentanas;
end;

procedure TFFondo.DBCMensualClick(Sender: TObject);
begin
  FMain.RestauraVentanas;
end;

procedure TFFondo.ADPMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if inReposition then
  begin
     Screen.Cursor := crDefault;
     ReleaseCapture;
     inReposition := False;
     ActualizaPos(Copy(TWinControl(Sender).Name, 6, Length(TWinControl(Sender).Name)), TWinControl(Sender).Left, TWinControl(Sender).Top);
     FMain.RestauraVentanas;
  end;

  ADSeleccionado := TWinControl(Sender).Name;
end;

procedure TFFondo.ADPMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
const
  minWidth = 20;
  minHeight = 20;
var
  newPos : TPoint;
  frmPoint : TPoint;
begin
  if inReposition then
  begin
     with TWinControl(Sender) do
     begin
        GetCursorPos(newPos);
        if ssAlt in Shift then
        begin // resize
           Screen.Cursor := crSizeNWSE;
           frmPoint := ScreenToClient(Mouse.CursorPos);
           if frmPoint.X > minWidth then
              Width := frmPoint.X;
           if frmPoint.Y > minHeight then
              Height := frmPoint.Y;
        end
        else // move
        begin
           Screen.Cursor := crSize;
           Left := Left - oldPos.X + newPos.X;
           Top := Top - oldPos.Y + newPos.Y;
           oldPos := newPos;
        end;
     end;
  end;
  //  Caption := 'Left: ' + TWinControl(Sender).left.ToString +' Top: ' + TWinControl(Sender).top.ToString
end;

procedure TFFondo.ADPMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  if (ssCtrl in Shift) and (Sender is TWinControl) then
  begin
     inReposition := True;
     SetCapture(TWinControl(Sender).Handle);
     GetCursorPos(oldPos);
  end;
  // ComponenteID := TWinControl(Sender).tag;
end;

procedure TFFondo.EjecutaAccion(Sender: TObject);
var
  aAccion : TAction;
  ADPanel : TObject;
begin
  FMain.RestauraVentanas;

  if (Sender is TImage) or (Sender is TLabel) then
  begin
     aAccion := nil;

     // Obtengo el ADPanel debajo de este objeto
     ADPanel := Sender;
     while Assigned(ADPanel) and ((not (ADPanel is TADPanel)) or (not Assigned(TADPanel(ADPanel).Accion))) do
        ADPanel := TWinControl(ADPanel).Parent;

     // Obtengo la accion del ADPanel
     if Assigned(ADPanel) then
        aAccion := TADPanel(ADPanel).Accion;

     if Assigned(aAccion) then
        FMain.EjecutaAccion(aAccion);
  end;
end;

procedure TFFondo.AEliminarADExecute(Sender: TObject);
begin
  if ConfirmaMensaje(_('Esta seguro de Eliminar el Acceso Directo ?')) then
     EliminaAccesoDirecto(Copy(ADSeleccionado, 3, Length(ADSeleccionado)));
end;

function TFFondo.DameNombreICO(ICO: integer): string;
begin
  case ICO of
     0: Result := 'ADGrisClaro';
     1: Result := 'ADGrisOscuro';
     2: Result := 'ADRosado';
     3: Result := 'ADVerdeClaro';
     4: Result := 'ADVerdeOscuro';
     5: Result := 'ADAmarilloG';
  end;
end;

procedure TFFondo.MuestraAvisos;
var
  p : TComponent;
  i : integer;
  aAccion : TAction;
begin
  // Solo sigo si esta creado el panel de avisos
  if Assigned(PNLAvisos) then
  begin
     // Busco el panel de informacino dentro del panel de avisos
     p := PNLAvisos.FindComponent('P_Aviso');

     // Busco el label alineado a cliente, que es el que debe mostrar el aviso
     for i := 0 to p.ComponentCount - 1 do
     begin
        if (p.Components[i] is TLabel) then
        begin
           // Si existe avisos
           if (CantidadAvisos > 0) then
           begin
              if (AvisoAMostrar <= 0) then
                 AvisoAMostrar := CantidadAvisos;

              if (TLabel(p.Components[i]).Name = 'LAvisosDetalles') then
                 TLabel(p.Components[i]).Caption := Avisos[AvisoAMostrar - 1].Detalle;
              if (TLabel(p.Components[i]).Align = alTop) then
                 TLabel(p.Components[i]).Caption := Avisos[AvisoAMostrar - 1].Cabecera;

              LControl.Caption := format('%d de %d', [AvisoAMostrar, CantidadAvisos]);
           end
           else
           begin
              TLabel(p.Components[i]).Caption := '';
              TLabel(p.Components[i]).Tag := 0;

              LControl.Caption := '';
           end;
        end;
     end;

     aAccion := nil;
     if (CantidadAvisos > 0) then
     begin
        // Obtengo la accion según el nombre de accion
        for i := 0 to (FMain.ALMain.ActionCount - 1) do
        begin
           if (TAction(FMain.ALMain.Actions[i]).Name = Avisos[AvisoAMostrar - 1].Accion) then
              aAccion := TAction(FMain.ALMain.Actions[i]);
        end;
     end;
     PNLAvisos.Accion := aAccion;
     PNLAvisos.Hide;
     PNLAvisos.Show;
  end;
end;

procedure TFFondo.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
     // MuestraAvisos;
  finally
     Timer1.Enabled := True;
  end;
end;

procedure TFFondo.LabelAvisosClick(Sender: TObject);
var
  Accion : TAction;
  NombreAccion : string;
  i : integer;
begin
  if (Sender is TLabel) then
  begin
     if (CantidadAvisos > 0) then
     begin
        NombreAccion := Avisos[AvisoAMostrar - 1].Accion;

        // Obtengo la accion según el nombre de accion
        Accion := nil;
        for i := 0 to (FMain.ALMain.ActionCount - 1) do
        begin
           if (TAction(FMain.ALMain.Actions[i]).Name = NombreAccion) then
              Accion := TAction(FMain.ALMain.Actions[i]);
        end;

        if Assigned(Accion) then
           FMain.EjecutaAccion(Accion);
     end;
  end;
end;

procedure TFFondo.LControlDecClick(Sender: TObject);
begin
  Dec(AvisoAMostrar);
  if (AvisoAMostrar < 1) then
     AvisoAMostrar := CantidadAvisos;

  MuestraAvisos;
  FMain.RestauraVentanas;
end;

procedure TFFondo.LControlIncClick(Sender: TObject);
begin
  Inc(AvisoAMostrar);
  if (AvisoAMostrar > CantidadAvisos) then
     AvisoAMostrar := 1;

  MuestraAvisos;
  FMain.RestauraVentanas;
end;

procedure TFFondo.LControlCerrarClick(Sender: TObject);
var
  i : integer;
begin
  if (CantidadAvisos > 0) then
  begin
     i := AvisoAMostrar - 1;

     while i < Length(Avisos) - 2 do
     begin
        Avisos[i] := Avisos[i + 1];
        Inc(i);
     end;

     Dec(CantidadAvisos);
     SetLength(Avisos, CantidadAvisos);

     if AvisoAMostrar > CantidadAvisos then
        AvisoAMostrar := CantidadAvisos;

     MuestraAvisos;
     FMain.RestauraVentanas;
  end;
end;

procedure TFFondo.FormClick(Sender: TObject);
begin
  FMain.RestauraVentanas;
end;

procedure TFFondo.ACambiaColorFondoADExecute(Sender: TObject);
begin
  CambiaColor(Copy(ADSeleccionado, 3, Length(ADSeleccionado)), DameColor(clBtnFace));
end;

procedure TFFondo.ACambiaColorLetraADExecute(Sender: TObject);
begin
  CambiaColorFont(Copy(ADSeleccionado, 3, Length(ADSeleccionado)), DameColor(clBtnFace));
end;

procedure TFFondo.MIMosrarBordeClick(Sender: TObject);
begin
  CambiaBordeVisible(Copy(ADSeleccionado, 3, Length(ADSeleccionado)), True);
end;

procedure TFFondo.MIOcultarBordeClick(Sender: TObject);
begin
  CambiaBordeVisible(Copy(ADSeleccionado, 3, Length(ADSeleccionado)), False);
end;

end.
