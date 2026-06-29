{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}

{$MINSTACKSIZE $00004000}

{$MAXSTACKSIZE $00100000}

{$IMAGEBASE $00400000}

{$APPTYPE GUI}

unit UFMUnidadesExtGesC;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, ToolWin, StdCtrls, DB, DBCtrls, Mask, UNavigator,
  Menus, UTeclas, UControlEdit, UFormGest, ULFDBEdit, ULFPanel, ULFToolBar,
  ULFLabel, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, UEditPanel;

type
  TFMUnidadesExtGesC = class(TFPEditSimple)
     PNLUnidades: TLFPanel;
     LPrecio: TLFLabel;
     DBEPrecio: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtCancelarClick(Sender: TObject);
     procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure FormShow(Sender: TObject);
     procedure DBEPrecioExit(Sender: TObject);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     Unidades: double;
     Precio: double;
     Estado: integer;
  public
     { Public declarations }
     procedure CreaCampos(DataSet: TDataSet);
     procedure ObtenerDatos;
  end;

var
  FMUnidadesExtGesC : TFMUnidadesExtGesC;

function DevuelveValor(DataSet: TDataSet; padre: TComponent; Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; rig, Linea: integer; aArticulo: string; var aEstado: integer; var aPrecio: double; proveedor: integer; Moneda: string; Factor: double; Mostrar: boolean = True): double;

implementation

uses UDMMain, UDMUnidadesExtGesC;

{$R *.DFM}

function DevuelveValor(DataSet: TDataSet; padre: TComponent; Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; rig, Linea: integer; aArticulo: string; var aEstado: integer; var aPrecio: double; proveedor: integer; Moneda: string; Factor: double; Mostrar: boolean = True): double;
var
  FMUnidadesExtGesC : TFMUnidadesExtGesC;
  aUnidades : double;
  SalidaOk : boolean;
begin
  aUnidades := 1;

  FMUnidadesExtGesC := TFMUnidadesExtGesC.Create(padre);
  try
     with FMUnidadesExtGesC do
     begin
        aPrecio := 0;
        Estado := aEstado;
        if (Estado = 2) then
           NavMain.DataSource := nil
        else
           NavMain.DataSource := DMUnidadesExtGesC.DSQMUnidadesExt;
     end;

     with DMUnidadesExtGesC do
     begin
        Estado := aEstado;
        MonedaDoc := Moneda;
        FiltraLinea(Empresa, Ejercicio, Canal, Serie, Tipo, Rig, Linea, aArticulo, aEstado);
        FiltraPrecio(DataSet.FieldByName('ARTICULO').AsString, proveedor, factor);
        FMUnidadesExtGesC.CreaCampos(DataSet);
        Estado := 2;
        Multiplo1 := DataSet.FieldByName('MULTIPLO_1').AsFloat;
        Multiplo2 := DataSet.FieldByName('MULTIPLO_2').AsFloat;
        Multiplo3 := DataSet.FieldByName('MULTIPLO_3').AsFloat;
        Multiplo4 := DataSet.FieldByName('MULTIPLO_4').AsFloat;

        FactorEscala := DataSet.FieldByName('FACTOR_ESCALA').AsFloat;
        ud_min_compra := DataSet.FieldByName('UD_MINIMO_COMPRA').AsFloat;
        ud_min_venta := DataSet.FieldByName('UD_MINIMO_VENTA').AsFloat;
        unidad := DataSet.FieldByName('UNIDADES').AsString;
        // ??? Factor := Factor;
     end;

     with FMUnidadesExtGesC do
     begin
        Caption := _('Unidades');
        if (DataSet.FieldByName('CONTROLA_MEDIDAS').AsInteger >= 1) then
           Caption := Caption + ' ' + DataSet.FieldByName('MULTIPLO_1').AsString;
        if (DataSet.FieldByName('CONTROLA_MEDIDAS').AsInteger >= 2) then
           Caption := Caption + 'x' + DataSet.FieldByName('MULTIPLO_2').AsString;
        if (DataSet.FieldByName('CONTROLA_MEDIDAS').AsInteger >= 3) then
           Caption := Caption + 'x' + DataSet.FieldByName('MULTIPLO_3').AsString;
        if (DataSet.FieldByName('CONTROLA_MEDIDAS').AsInteger >= 4) then
           Caption := Caption + 'x' + DataSet.FieldByName('MULTIPLO_4').AsString;

        SalidaOk := True;

        // FM.Precio y FM.Unidades se calculan en OnClose. Si no se muestra el Form, se tienen que obtener a mano.
        if (Mostrar) then
           SalidaOk := (ShowModal = mrOk)
        else
           ObtenerDatos;

        if (SalidaOk) then
        begin
           aUnidades := Unidades;
           aPrecio := Precio;
           if Estado <> 2 then
              Estado := 0;

           if (DMMain.EstadoKri(441) = 1) then // Si se trata de una arrocera RD
           begin
              AbreData(TDMUnidadesExtGesC, DMUnidadesExtGesC);
              DMUnidadesExtGesC.FiltraLinea(Empresa, Ejercicio, Canal, Serie, Tipo, Rig, Linea, aArticulo, Estado);
              // SFG_RSL cálculo especial para fanegas - begin
              if (DMUnidadesExtGesC.QMUnidadesExtUNIDADES.AsFloat = 4) then
              begin
                 aUnidades := (DMUnidadesExtGesC.QMUnidadesExtMEDIDA1.AsFloat -
                    DMUnidadesExtGesC.QMUnidadesExtMEDIDA2.AsFloat) /
                    DMUnidadesExtGesC.QMUnidadesExtMEDIDA4.AsFloat;
                 aPrecio := DMUnidadesExtGesC.QMUnidadesExtPRECIO.AsFloat;
              end;
              //else
              //Result := aUnidades;
              // CierraData(DMUnidadesExtGesC);
           end;
        end;

        // Actualizamos el valor de la variable aEstado ya que se devuelve
        aEstado := Estado;
     end;
  finally
     FMUnidadesExtGesC.Free;
  end;

  Result := aUnidades;
end;

procedure TFMUnidadesExtGesC.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMUnidadesExtGesC, DMUnidadesExtGesC);
  ControlEdit := CEMain;
  OwnerDrawMenus(Self);
end;

procedure TFMUnidadesExtGesC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ObtenerDatos;
  CierraData(DMUnidadesExtGesC);
end;

procedure TFMUnidadesExtGesC.CreaCampos(DataSet: TDataSet);
var
  i, x, y, NumUnidades : integer;
  auxlabel : TLFLabel;
  auxedit : TLFDBEdit;
begin
  // Inicializamos las coordenadas x e y para situar los edits
  x := 30; // x := 9;
  y := 40; // y := 5;

  NumUnidades := DataSet.FieldByName('CONTROLA_MEDIDAS').AsInteger;
  DMUnidadesExtGesC.QMUnidadesExtUNIDADES.AsInteger := NumUnidades;
  DMUnidadesExtGesC.Unidades := numunidades;

  // Creamos tantos edits como dimensiones tengan las unidades
  for i := 0 to (NumUnidades - 1) do
  begin
     auxedit := TLFDBEdit.Create(PNLUnidades);
     auxlabel := TLFLabel.Create(PNLUnidades);
     try
        auxedit.Parent := PNLUnidades;
        auxedit.Top := y;
        auxedit.Left := x;
        auxedit.AutoSize := False;
        auxedit.Width := 45;
        auxedit.DataSource := DMUnidadesExtGesC.DSQMUnidadesExt;
        auxedit.DataField := 'MEDIDA' + IntToStr(i + 1);
        if Estado = 2 then
           auxedit.ReadOnly := True;

        auxlabel.Parent := PNLUnidades;
        auxlabel.Top := y + 2;
        auxlabel.Left := x + 50;
        auxlabel.AutoSize := False;
        auxlabel.Width := 10;
        auxlabel.Caption := 'x';
        x := x + 62;
     except
        auxedit.Free;
        auxlabel.Free;
     end;
  end;

  // Ampliamos el formulario si es necesario
  Width := x + 45;

  //  if width < 195 then width := 195;
  if Width < 320 then
     Width := 320;
end;

procedure TFMUnidadesExtGesC.ObtenerDatos;
begin
  if DMUnidadesExtGesC.QMUnidadesExt.State in [dsInsert, dsEdit] then
     DMUnidadesExtGesC.QMUnidadesExt.Post;
  Precio := DMUnidadesExtGesC.QMUnidadesExtPRECIO.AsFloat;
  Unidades := DMUnidadesExtGesC.DameUnidades;
end;

procedure TFMUnidadesExtGesC.TButtCancelarClick(Sender: TObject);
begin
  DMUnidadesExtGesC.QMUnidadesExt.Cancel;
  ModalResult := mrCancel;
end;

procedure TFMUnidadesExtGesC.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
     DMUnidadesExtGesC.QMUnidadesExt.Cancel;
     ModalResult := mrCancel;
  end;
  {  if (Key = VK_RETURN) then
    begin
      DMUnidadesExtGesC.QMUnidadesExt.Post;
      modalResult := mrOk;
    end;}
end;

procedure TFMUnidadesExtGesC.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbPost then
     ModalResult := mrOk;

  if Button = nbCancel then
     ModalResult := mrCancel;
end;

procedure TFMUnidadesExtGesC.FormShow(Sender: TObject);
var
  i, ce : integer;
begin
  if Estado = 2 then
     DBEPrecio.ReadOnly := True
  else
     DBEPrecio.ReadOnly := False;

  // Posicionamos el TAB Order en el primer DBEdit
  ce := 0;
  for i := 0 to PNLUnidades.ControlCount - 1 do
  begin
     if (PNLUnidades.Controls[i] is TDBEdit) then
     begin
        Inc(ce);
        if (ce = 2) then
        begin
           (PNLUnidades.Controls[i] as TDBEdit).SetFocus;
           Exit;
        end;
     end;
  end;
end;

procedure TFMUnidadesExtGesC.DBEPrecioExit(Sender: TObject);
begin
  Precio := DMUnidadesExtGesC.QMUnidadesExtPRECIO.AsFloat;
  if (Estado <> 2) then
     DMUnidadesExtGesC.QMUnidadesExt.Post;
  ModalResult := mrOk;
end;

procedure TFMUnidadesExtGesC.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMUnidadesExtGesC.QMUnidadesExt.Cancel;
  ModalResult := mrCancel;
end;

end.
