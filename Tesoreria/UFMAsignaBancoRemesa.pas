unit UFMAsignaBancoRemesa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, NsDBGrid, UControlEdit, ULFPanel,
  ULFLabel, ULFDBEdit, ULFEdit, ULFEditFind2000, ToolWin, ComCtrls,
  ULFToolBar, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UEditPanel;

type
  TFMAsignaBancoRemesa = class(TFPEditSinNavegador)
     PNLTotalesBanco: TLFPanel;
     DBGTotalesBanco: TDBGrid;
     PNLSeleccion: TLFPanel;
     PNLDatosRecibo: TLFPanel;
     LNombreCliente: TLFLabel;
     LBanco: TLFLabel;
     LPoblacion: TLFLabel;
     LFormaPago: TLFLabel;
     DBENombreCliente: TLFDBEdit;
     DBEBanco: TLFDBEdit;
     DBEPoblacion: TLFDBEdit;
     DBETituloFormaPago: TLFDbedit;
     PNLRecibos: TLFPanel;
     DBGRecibos: TDBGridFind2000;
     PNLFiltroAgrupacion: TLFPanel;
     LAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     EAgrupacion: TLFEdit;
     DBEFormaPago: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgrupacionChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAsignaBancoRemesa : TFMAsignaBancoRemesa;

implementation

uses UDMAsignaBancoRemesa, UFormGest, UDMMain, UFMain, UDameDato;

{$R *.DFM}

procedure TFMAsignaBancoRemesa.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAsignaBancoRemesa, DMAsignaBancoRemesa);
end;

procedure TFMAsignaBancoRemesa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsignaBancoRemesa);
end;

procedure TFMAsignaBancoRemesa.EFAgrupacionChange(Sender: TObject);
begin
  EAgrupacion.Text := DameTituloAgrupacion('C', EFAgrupacion.Text);
  DMAsignaBancoRemesa.FiltraAgrupacion(EFAgrupacion.Text);
end;

end.
