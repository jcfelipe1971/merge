unit UIsoFMLstMedicion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UFPEditListadoSfg, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Mask, rxToolEdit, ULFDateEdit, StdCtrls, ULFComboBox, ULFEdit, ULFLabel,
  ComCtrls, ULFPageControl, ToolWin, ULFToolBar, ExtCtrls, ULFPanel,
  Dialogs, DateUtils;

type
  TIsoFMLstMedicion = class(TFPEditListadoSfg)
     LFPanel1: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LFDDesdeF: TLFDateEdit;
     LFDHastaF: TLFDateEdit;
     procedure AImprimirExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMLstMedicion : TIsoFMLstMedicion;

implementation

uses UDMListados, UFMListconfig, UFormGest, UIsoDMLstMedicion,
  UIsoDMMedicion;

{$R *.dfm}

procedure TIsoFMLstMedicion.AImprimirExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  IsoDMLstMedicion.Filtra(LFDDesdeF.Date, LFDHastaF.Date, TDPFechaListado.Date, EComentario.Text);
  str := '';
  DMListados.Imprimir(8038, 1, '', str, IsoDMLstMedicion.frIsoSegRevision, nil);
end;

procedure TIsoFMLstMedicion.AConfigurarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8038, Formato, Cabecera, Copias, Pijama, '', IsoDMMedicion.frIsoInc);
end;

procedure TIsoFMLstMedicion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMLstMedicion, IsoDMLstMedicion);
  AbreData(TDMListados, DMListados);

  ARecargar.Execute;
  TDPFechaListado.Date := Date;
end;

procedure TIsoFMLstMedicion.APrevExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  IsoDMLstMedicion.Filtra(LFDDesdeF.Date, LFDHastaF.Date, TDPFechaListado.Date, EComentario.Text);
  str := '';
  DMListados.Imprimir(8038, 0, '', str, IsoDMLstMedicion.frIsoSegRevision, nil);
end;

procedure TIsoFMLstMedicion.ARecargarExecute(Sender: TObject);
var
  Year, Month, Day : word;
begin
  inherited;
  DecodeDate(Date, Year, Month, Day);
  LFDDesdeF.Date := EncodeDate(Year, Month, 1);
  LFDHastaF.Date := EncodeDate(Year, Month, DaysInAMonth(Year, Month));
end;

procedure TIsoFMLstMedicion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMLstMedicion);
  CierraData(DMListados);
end;

end.
