unit UCRMFMSeguimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TCRMFMSeguimientos = class(TFPEdit)
     DBESeguimiento: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LFSeguimiento: TLFLabel;
     LFDescripcion: TLFLabel;
     DBCBActualizaFechaVisita: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CRMFMSeguimientos : TCRMFMSeguimientos;

implementation

uses UCRMDMSeguimientos, UFormGest, UDMMain, uUtiles;

{$R *.dfm}

procedure TCRMFMSeguimientos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMSeguimientos, CrmDMSeguimientos);

  // Color campo ID
  ColorCampoID(DBESeguimiento);
end;

procedure TCRMFMSeguimientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMSeguimientos);
end;

procedure TCRMFMSeguimientos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
