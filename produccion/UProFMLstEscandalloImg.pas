unit UProFMLstEscandalloImg;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, DBCtrls, ULFDBEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel, Grids, DBGrids,
  ULFDateEdit, rxPlacemnt, ULFFormStorage;

type
  TProFMLstEscandalloImg = class(TFPEditListadoSfg)
     PanelCentral: TLFPanel;
     LDesdeEscandallo: TLFLabel;
     LHastaEscandallo: TLFLabel;
     EFEscD: TLFEditFind2000;
     EFEscH: TLFEditFind2000;
     DBETitulosDesdeEscandallo: TLFDbedit;
     DBETitulosHastaEscandallo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EFEscDChange(Sender: TObject);
     procedure EFEscHChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMLstEscandalloImg : TProFMLstEscandalloImg;

implementation

uses UDMMain, UProDMLstEscandalloImg, UFormGest;

{$R *.dfm}

procedure TProFMLstEscandalloImg.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLSTEscandalloImg, ProDMLSTEscandalloImg);
  ProDMLstEscandalloImg.Tipo_Esc := 'EPR';
  TDPFechaListado.Date := Date;
  Grupo := 8046;
  Listado := ProDMLSTEscandalloImg.frListadoEscImg;
  ARecargar.Execute;
end;

procedure TProFMLstEscandalloImg.EFEscDChange(Sender: TObject);
begin
  inherited;
  ProDMLstEscandalloImg.CambiaEscandalloD(StrToInt(EFEscD.Text));
end;

procedure TProFMLstEscandalloImg.EFEscHChange(Sender: TObject);
begin
  inherited;
  ProDMLstEscandalloImg.CambiaEscandalloH(StrToInt(EFEscH.Text));
end;

procedure TProFMLstEscandalloImg.ARecargarExecute(Sender: TObject);
begin
  inherited;
  ProDMLstEscandalloImg.Recargar;
  EFEscD.Text := ProDMLstEscandalloImg.xMinEscandalloDMIN_D.AsString;
  EFEscH.Text := ProDMLstEscandalloImg.xMaxEscandalloHMAX_H.AsString;
end;

procedure TProFMLstEscandalloImg.APrevExecute(Sender: TObject);
begin
  inherited;
  ProDmLstEscandalloImg.Comentario := EComentario.Text;
  ProDMLstEscandalloImg.FechaListado := TDPFechaListado.Date;
  ProDMLstEscandalloImg.TFiltro := _('Escandallo desde: ') + EFEscD.Text + '  ' +
     DBETitulosDesdeEscandallo.Text + _(' Escandallo hasta: ') + EFEscH.Text + ' ' + DBETitulosHastaEscandallo.Text;
  ProDMLstEscandalloImg.MostrarListado(0, StrToInt(EFEscD.Text), StrToInt(EFEscH.Text), 'EPR');
end;

end.
