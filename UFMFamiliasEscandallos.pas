{Especifico cliente DICOMOL}

unit UFMFamiliasEscandallos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  ULFFIBDBEditFind, ULFLabel, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ULFDBEdit, UHYDescription, ULFHYDBDescription, ULFDBEditFind2000;

type
  TFMFamiliasEscandallos = class(TFPEdit)
     LFamilia: TLFLabel;
     LEscandallo: TLFLabel;
     LFDBEFFamilia: TLFDBEditFind2000;
     LFDBEFEscandallo: TLFDBEditFind2000;
     DescCompuesto: TLFDbedit;
     DescFamili: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure LFDBEFFamiliaChange(Sender: TObject);
     procedure LFDBEFEscandalloChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMFamiliasEscandallos : TFMFamiliasEscandallos;

implementation

uses UDMFamiliasEscandallos, UDMMain, UFormGest, UEntorno;

{$R *.dfm}

procedure TFMFamiliasEscandallos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFamiliasEscandallos);
end;

procedure TFMFamiliasEscandallos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMFamiliasEscandallos, DMFamiliasEscandallos);
  NavMain.DataSource := DMFamiliasEscandallos.ZDSQMFamiliasEscandallos;
  DBGMain.DataSource := DMFamiliasEscandallos.ZDSQMFamiliasEscandallos;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  G2KTableLoc.Base_de_datos := DMMain.DataBase;
  G2KTableLoc.DataSource := DMFamiliasEscandallos.ZDSQMFamiliasEscandallos;
end;

procedure TFMFamiliasEscandallos.LFDBEFFamiliaChange(Sender: TObject);
begin
  inherited;
  DescFamili.Text := DMFamiliasEscandallos.BuscarFamilia;
end;

procedure TFMFamiliasEscandallos.LFDBEFEscandalloChange(Sender: TObject);
begin
  inherited;
  DescCompuesto.Text := DMFamiliasEscandallos.BuscarCompuesto;
end;

end.
