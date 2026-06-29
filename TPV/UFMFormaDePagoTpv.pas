{ TODO -oDuilio -cTPV : Agregar selector de SERIE y CAJA  con ComboBox }

unit UFMFormaDePagoTpv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, DB, StdCtrls, UHYDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFDBEdit,
  ULFEdit;

type
  TFMFormasPagoTpv = class(TFPEdit)
     DSQMFomaPago: TDataSource;
     DBESerie: TDBEdit;
     DBEFFormaPago: TDBEditFind2000;
     DBETituloFormaPago: TLFEdit;
     DBEFCuenta: TDBEditFind2000;
     DBETituloCuenta: TLFEdit;
     LSerie: TLabel;
     LFormaPago: TLabel;
     LCuenta: TLabel;
     DBETituloSerie: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFFormaPagoChange(Sender: TObject);
     procedure DBEFCuentaChange(Sender: TObject);
     procedure DBESerieChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMFormasPagoTpv : TFMFormasPagoTpv;

implementation

uses UDMFormasPagoTpv, UDMMain, UFormGest, UDameDato;

{$R *.dfm}

procedure TFMFormasPagoTpv.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMFormasPagoTpv, DMFormasPagoTpv);
end;

procedure TFMFormasPagoTpv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMFormasPagoTpv);
  inherited;
end;

procedure TFMFormasPagoTpv.DBEFFormaPagoChange(Sender: TObject);
begin
  inherited;
  DBETituloFormaPago.Text := DameTituloFormaPago(DBEFFormaPago.Text);
end;

procedure TFMFormasPagoTpv.DBEFCuentaChange(Sender: TObject);
begin
  inherited;
  DBETituloCuenta.Text := DameTituloCuenta(DBEFCuenta.Text);
end;

procedure TFMFormasPagoTpv.DBESerieChange(Sender: TObject);
begin
  inherited;
  DBETituloSerie.Text := DameTituloSerie(DBESerie.Text);
end;

end.
