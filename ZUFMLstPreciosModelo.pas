unit ZUFMLstPreciosModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel, ComCtrls,
  ActnList, ULFActionList, ULFPageControl, ToolWin, ULFToolBar, Mask,
  DBCtrls, ULFDBEdit, rxPlacemnt, ULFFormStorage, ExtCtrls, ULFPanel,
  UFPEditListadoSimple;

type
  TZFMLstPreciosModelo = class(TFPEditListadoSimple)
     LblModelo: TLFLabel;
     EFModelo: TLFEditFind2000;
     TButtConfRapida: TToolButton;
     AConfRapida: TAction;
     DBEDescModelo: TLFDbedit;
     LblTipoLona: TLFLabel;
     EFTipoLona: TLFEditFind2000;
     DBEDescTipoLona: TLFDbedit;
     PNLLimites: TPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure EFModeloChange(Sender: TObject);
     procedure EFTipoLonaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMLstPreciosModelo : TZFMLstPreciosModelo;

implementation

uses UFormGest, ZUDMLstPreciosModelo, UDMMain, UFMListConfig;

{$R *.dfm}

procedure TZFMLstPreciosModelo.FormCreate(Sender: TObject);
begin
  AbreData(TZDMLstPreciosModelo, ZDMLstPreciosModelo);
end;

procedure TZFMLstPreciosModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLstPreciosModelo);
end;

procedure TZFMLstPreciosModelo.ARecargarExecute(Sender: TObject);
begin
  inherited;
  EFModelo.Text := '';
  EFTipoLona.Text := '';
end;

procedure TZFMLstPreciosModelo.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TZFMLstPreciosModelo.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(9001, Formato, Cabecera, Copias,
     Pijama, '', ZDMLstPreciosModelo.frLstPrecios);
end;

procedure TZFMLstPreciosModelo.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ZDMLstPreciosModelo.ListadoPrecios(1);
end;

procedure TZFMLstPreciosModelo.APrevExecute(Sender: TObject);
begin
  inherited;
  ZDMLstPreciosModelo.ListadoPrecios(0);
end;

procedure TZFMLstPreciosModelo.EFModeloChange(Sender: TObject);
begin
  inherited;
  ZDMLstPreciosModelo.xModelo.Close;
  ZDMLstPreciosModelo.xModelo.Params.ByName['MODELO'].AsString := EFModelo.Text;
  ZDMLstPreciosModelo.xModelo.Open;
end;

procedure TZFMLstPreciosModelo.EFTipoLonaChange(Sender: TObject);
begin
  inherited;
  ZDMLstPreciosModelo.xTipoLona.Close;
  ZDMLstPreciosModelo.xTipoLona.Params.ByName['TIPO_LONA'].AsString := EFTipoLona.Text;
  ZDMLstPreciosModelo.xTipoLona.Open;
end;

end.
