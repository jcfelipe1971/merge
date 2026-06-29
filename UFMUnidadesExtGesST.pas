{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}

{$MINSTACKSIZE $00004000}

{$MAXSTACKSIZE $00100000}

{$IMAGEBASE $00400000}

{$APPTYPE GUI}

unit UFMUnidadesExtGesST;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, ToolWin, StdCtrls, DB, DBCtrls, Mask, UNavigator,
  Menus, UTeclas, UControlEdit, UFormGest, ULFDBEdit, ULFPanel, ULFToolBar,
  ULFLabel, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, UEditPanel;

type
  TFMUnidadesExtGesST = class(TFPEditSimple)
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
  FMUnidadesExtGesST : TFMUnidadesExtGesST;

function DevuelveValor(DataSet: TDataSet; padre: TComponent; Empresa, Ejercicio, Canal: integer; Serie, TipoOper: string; rig, Linea: integer; Almacen: string; var aEstado: integer; var aPrecio: double; aArticulo: string; Mostrar: boolean = True): double;

implementation

uses UDMMain, UDMUnidadesExtGesST;

{$R *.DFM}

function DevuelveValor(DataSet: TDataSet; padre: TComponent; Empresa, Ejercicio, Canal: integer; Serie, TipoOper: string; rig, Linea: integer; Almacen: string; var aEstado: integer; var aPrecio: double; aArticulo: string; Mostrar: boolean = True): double;
var
  FMUnidadesExtGesST : TFMUnidadesExtGesST;
  aUnidades : double;
  SalidaOk : boolean;
begin
  aUnidades := 1;

  FMUnidadesExtGesST := TFMUnidadesExtGesST.Create(padre);
  try
     with FMUnidadesExtGesST do
     begin
        aPrecio := 0;
        Estado := aEstado;
        if (Estado = 2) then
           NavMain.DataSource := nil
        else
           NavMain.DataSource := DMUnidadesExtGesST.DSQMUnidadesExt;
     end;

     with DMUnidadesExtGesST do
     begin
        FiltraLinea(Empresa, Ejercicio, Canal, Serie, TipoOper, Rig, Linea, aArticulo, aEstado);
        FiltraPrecio(aArticulo, Almacen, TipoOper, canal);
        FMUnidadesExtGesST.CreaCampos(DataSet);
        Estado := 2;
        Multiplo1 := DataSet.FieldByName('MULTIPLO_1').AsFloat;
        Multiplo2 := DataSet.FieldByName('MULTIPLO_2').AsFloat;
        Multiplo3 := DataSet.FieldByName('MULTIPLO_3').AsFloat;
        Multiplo4 := DataSet.FieldByName('MULTIPLO_4').AsFloat;
     end;

     with FMUnidadesExtGesST do
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
        end;

        // Actualizamos el valor de la variable aEstado ya que se devuelve
        aEstado := Estado;
     end;
  finally
     FMUnidadesExtGesST.Free;
  end;

  Result := aUnidades;
end;

procedure TFMUnidadesExtGesST.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMUnidadesExtGesST, DMUnidadesExtGesST);
  ControlEdit := CEMain;
  OwnerDrawMenus(Self);
end;

procedure TFMUnidadesExtGesST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ObtenerDatos;
  CierraData(DMUnidadesExtGesST);
end;

procedure TFMUnidadesExtGesST.CreaCampos(DataSet: TDataSet);
var
  i, x, y, NumUnidades : integer;
  auxlabel : TLFLabel;
  auxedit : TLFDBEdit;
begin
  // Inicializamos las coordenadas x e y para situar los edits
  x := 30; // x := 9;
  y := 20; // y := 5;

  NumUnidades := DataSet.FieldByName('CONTROLA_MEDIDAS').AsInteger;
  DMUnidadesExtGesST.QMUnidadesExtUNIDADES.AsInteger := NumUnidades;
  DMUnidadesExtGesST.Unidades := numunidades;

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
        auxedit.DataSource := DMUnidadesExtGesST.DSQMUnidadesExt;
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

  // if width < 195 then width := 195;
  if Width < 320 then
     Width := 320;
end;

procedure TFMUnidadesExtGesST.ObtenerDatos;
begin
  if DMUnidadesExtGesST.QMUnidadesExt.State in [dsInsert, dsEdit] then
     DMUnidadesExtGesST.QMUnidadesExt.Post;
  Precio := DMUnidadesExtGesST.QMUnidadesExtPRECIO.AsFloat;
  Unidades := DMUnidadesExtGesST.DameUnidades;
end;

procedure TFMUnidadesExtGesST.TButtCancelarClick(Sender: TObject);
begin
  DMUnidadesExtGesST.QMUnidadesExt.Cancel;
  ModalResult := mrCancel;
end;

procedure TFMUnidadesExtGesST.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
     DMUnidadesExtGesST.QMUnidadesExt.Cancel;
     ModalResult := mrCancel;
  end;
  {
  if (Key = VK_RETURN) then
  begin
     DMUnidadesExtGesST.QMUnidadesExt.Post;
     ModalResult := mrOk;
  end;
  }
end;

procedure TFMUnidadesExtGesST.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbPost then
     ModalResult := mrOk;

  if Button = nbCancel then
     ModalResult := mrCancel;
end;

procedure TFMUnidadesExtGesST.FormShow(Sender: TObject);
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

procedure TFMUnidadesExtGesST.DBEPrecioExit(Sender: TObject);
begin
  Precio := DMUnidadesExtGesST.QMUnidadesExtPRECIO.AsFloat;
  if (Estado <> 2) then
     DMUnidadesExtGesST.QMUnidadesExt.Post;
  ModalResult := mrOk;
end;

procedure TFMUnidadesExtGesST.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMUnidadesExtGesST.QMUnidadesExt.Cancel;
  ModalResult := mrCancel;
end;

end.
