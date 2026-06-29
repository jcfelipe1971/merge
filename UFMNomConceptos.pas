unit UFMNomConceptos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, RxDBComb;

type
  TFMNomConceptos = class(TFPEdit)
     DBEConcepto: TLFDbedit;
     LConcepto: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LDescripcion: TLFLabel;
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     DBEClave: TLFDbedit;
     LCalve: TLFLabel;
     DBCBSegSocial: TLFDBCheckBox;
     DBCBHorasFuerzaMayor: TLFDBCheckBox;
     DBESubClave: TLFDbedit;
     LSubClave: TLFLabel;
     DBCHActualizaConvenio: TLFDBCheckBox;
     DBCBPositivo: TLFDBCheckBox;
     DBCBHoras: TLFDBCheckBox;
     DBCBTipoContabilizacion: TRxDBComboBox;
     LTipoContabilizacion: TLFLabel;
     LSigno: TLFLabel;
     DBCBSigno: TRxDBComboBox;
     LTipoImporte: TLFLabel;
     DBCBTipoImporte: TRxDBComboBox;
     LTipoConcepto: TLFLabel;
     DBCBTipoConcepto: TRxDBComboBox;
     LSignoContabilizacion: TLFLabel;
     DBCBSignoContabilizacion: TRxDBComboBox;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtrar(Filtro: string);
  end;

var
  FMNomConceptos : TFMNomConceptos;

implementation

uses UDMMain, UEntorno, UFMain, UFPregDatosCSB34, UUtiles, UParam, UFormGest, UDMNomConceptos;

{$R *.dfm}

procedure TFMNomConceptos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMNomConceptos, DMNomConceptos);
  DBGMain.DataSource := DMNomConceptos.DSQMNomConcep;
  NavMain.DataSource := DMNomConceptos.DSQMNomConcep;
  G2kTableLoc.DataSource := DMNomConceptos.DSQMNomConcep;
end;

procedure TFMNomConceptos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNomConceptos);
end;

procedure TFMNomConceptos.Filtrar(Filtro: string);
begin
  // Se espera el codigo de concepto
  DMNomConceptos.Filtrar(Filtro);
end;

procedure TFMNomConceptos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMNomConceptos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMNomConceptos.Busqueda;
end;

end.
