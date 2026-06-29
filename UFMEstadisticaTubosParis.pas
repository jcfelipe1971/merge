unit UFMEstadisticaTubosParis;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ComCtrls, ULFPageControl, ToolWin, ULFToolBar, ExtCtrls,
  ULFPanel, StdCtrls, Mask, rxToolEdit, ULFDateEdit, ULFLabel;

type
  TFMEstadisticaTubosParis = class(TFPEditListado)
     LFechaDesde: TLFLabel;
     DEFechaDesde: TLFDateEdit;
     LFechaHasta: TLFLabel;
     DEFechaHasta: TLFDateEdit;
     TButtConfigurar: TToolButton;
     TButtExportar: TToolButton;
     CBEstFamAgeCliArt: TCheckBox;
     CBEstAgeCliFam: TCheckBox;
     CBEstAgeFamCli: TCheckBox;
     CBEstAgeCli: TCheckBox;
     CBEstCli: TCheckBox;
     CBxEstFam: TCheckBox;
     CBEstFamArt: TCheckBox;
     CBAgentes: TCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FMEstadisticaTubosParis : TFMEstadisticaTubosParis;

implementation

uses UDMEstadisticaTubosParis, UFormGest, DateUtils;

{$R *.dfm}

procedure TFMEstadisticaTubosParis.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEstadisticaTubosParis, DMEstadisticaTubosParis);
  DEFechaDesde.Date := Today;
  DEFechaHasta.Date := Today;

  Grupo := 642;
  Listado := DMEstadisticaTubosParis.frListado;
  ListadoFR3 := DMEstadisticaTubosParis.frxListado;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFMEstadisticaTubosParis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEstadisticaTubosParis);
end;

procedure TFMEstadisticaTubosParis.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMEstadisticaTubosParis.EstFamAgeCliArt := CBEstFamAgeCliArt.Checked;
  DMEstadisticaTubosParis.EstAgeCliFam := CBEstAgeCliFam.Checked;
  DMEstadisticaTubosParis.EstAgeFamCli := CBEstAgeFamCli.Checked;
  DMEstadisticaTubosParis.EstAgeCli := CBEstAgeCli.Checked;
  DMEstadisticaTubosParis.EstCli := CBEstCli.Checked;
  DMEstadisticaTubosParis.EstFam := CBxEstFam.Checked;
  DMEstadisticaTubosParis.EstFamArt := CBEstFamArt.Checked;
  DMEstadisticaTubosParis.EstAgentes := CBAgentes.Checked;

  DMEstadisticaTubosParis.MostrarInforme(Modo, Grupo, _('Estadistica'), Now, DEFechaDesde.Date, DEFechaHasta.Date);
end;

end.
