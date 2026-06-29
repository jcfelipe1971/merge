unit UFMProvincias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls,
  ULFDBEdit, ULFDBEditFind2000, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, NsDBGrid, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel,
  ULFEdit, UG2kTBLoc, ULFComboBox;

type
  TFMProvincias = class(TFPEdit)
     DBEFPais: TLFDBEditFind2000;
     DBEProvincia: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBECod_Tel: TLFDbedit;
     LProvincia: TLFLabel;
     LTitulo: TLFLabel;
     LCodTelefonico: TLFLabel;
     LPais: TLFLabel;
     LINE: TLFLabel;
     DBEIne: TLFDbedit;
     ETituloPais: TLFEdit;
     PNLFiltroPais: TLFPanel;
     LFiltroPais: TLFLabel;
     CBFiltroPais: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFPaisChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure CBFiltroPaisSelect(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
     InsercionModal: boolean;
  public
     { Public declarations }
  end;

function CreaProvincia(Pais: string): string;

var
  FMProvincias : TFMProvincias;

implementation

uses UDMPoblaciones, UDMMain, UFormGest, UEntorno, UDameDato, URellenaLista;

{$R *.DFM}

function CreaProvincia(Pais: string): string;
var
  i : integer;
begin
  /// Muestra el formulario y devuelve la provincia creada.
  /// Si no se crea ninguna provincia devuelve ''.
  /// Se inicializa con el pais pasado por parametro.

  Result := '';

  AbreForm(TFMProvincias, FMProvincias, nil);
  with FMProvincias do
  begin
     InsercionModal := True;

     if (Trim(Pais) = '') then
        Pais := REntorno.Pais
     else
        CBFiltroPais.Enabled := False;

     with CBFiltroPais do
     begin
        i := 0;
        while ((i < Items.Count) and (Pais <> Copy(Items[i], 1, Pos(' ', Items[i]) - 1))) do
           Inc(i);

        if (i < Items.Count) then
        begin
           ItemIndex := i;
           Text := Items[ItemIndex];
           CBFiltroPaisSelect(nil);
        end;
     end;

     DMPoblaciones.QMProvincias.Insert;
     DMPoblaciones.QMProvinciasPAIS.AsString := Pais;
     DBEProvincia.SetFocus;

     Hide;
     if (ShowModal = mrOk) then
        Result := DBEProvincia.Text;
     Free;
  end;
end;

procedure TFMProvincias.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  AbreData(TDMPoblaciones, DMPoblaciones);
  NavMain.DataSource := DMPoblaciones.DSQMProvincias;
  DBGMain.DataSource := DMPoblaciones.DSQMProvincias;
  G2kTableLoc.DataSource := DMPoblaciones.DSQMProvincias;

  with CBFiltroPais do
  begin
     i := RellenaPaises(Items);
     if (i < 0) then
        i := 0;
     ItemIndex := i;
     Text := Items[ItemIndex];
     CBFiltroPaisSelect(Sender);
  end;

  InsercionModal := False;
end;

procedure TFMProvincias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Se pasa el codigo a FormDestroy para tener la información para el procedimiento CreaProvincia()
end;

procedure TFMProvincias.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(DMPoblaciones);
end;

procedure TFMProvincias.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPoblaciones.BCProvincias;
  Continua := False;
end;

procedure TFMProvincias.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  ETituloPais.Text := DameTituloPais(DBEFPais.Text);
end;

procedure TFMProvincias.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
var
  Pais : string;
begin
  inherited;

  Pais := '';
  with CBFiltroPais do
  begin
     if (ItemIndex > 0) then
        Pais := Copy(Items[ItemIndex], 1, Pos(' ', Items[ItemIndex]) - 1);
  end;

  if (Pais <> '') then
     G2kTableLoc.CondicionBusqueda := 'PAIS =''' + Pais + '''';
  G2kTableLoc.Click;
end;

procedure TFMProvincias.CBFiltroPaisSelect(Sender: TObject);
var
  Pais : string;
begin
  inherited;

  Pais := '';
  with CBFiltroPais do
  begin
     if (ItemIndex > 0) then
        Pais := Copy(Items[ItemIndex], 1, Pos(' ', Items[ItemIndex]) - 1);
  end;
  DMPoblaciones.FiltraProvincias(Pais);
end;

procedure TFMProvincias.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if InsercionModal and (Button = nbPost) then
     ModalResult := mrOk;
end;

end.
