unit UFReplicaBalance;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UHYDBGrid, StdCtrls, Buttons, ExtCtrls, NsDBGrid,
  ULFPanel;

type
  TFReplicaBalance = class(TForm)
     PBotones: TLFPanel;
     BBCancelar: TBitBtn;
     DBGMain: THYTDBGrid;
     PTitulo: TLFPanel;
     BBAceptar: TBitBtn;
     procedure DBGMainDblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function Muestra: integer;
  end;

var
  FReplicaBalance : TFReplicaBalance;

implementation

uses UDMBalances, UDMMain, UUtiles;

{$R *.DFM}

function TFReplicaBalance.Muestra: integer;
begin
  DMBalances.AbreReplica;
  DBGMain.DataSource := DMBalances.DSxBalancesElec;
  Result := ShowModal;
end;

procedure TFReplicaBalance.DBGMainDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFReplicaBalance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (ModalResult = mrOk) then
     DMBalances.nOrigen :=
        DBGMain.DataSource.DataSet.FieldByName('BALANCE').AsInteger
  else
     DMBalances.nOrigen := 0;
end;

procedure TFReplicaBalance.FormCreate(Sender: TObject);
begin
  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BBAceptar, 1, DMMain.ILMain_Ac, 37);
  GetBitmapFromImageList(BBCancelar, 1, DMMain.ILMain_Ac, 0);
end;

end.
