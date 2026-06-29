unit UProFMMedidasOFC;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, {UFPEditDelfos,} Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFLabel, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin,
  ULFToolBar, ExtCtrls, ULFPanel, Buttons, ULFDBMemo, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  FR_Pars, frxClass, frxDBSet, frxHYReport, UFPEdit, UHYDBGrid, UG2kTBLoc,
  ULFPageControl, ULFEdit;

type
  TProFMMedidasOFC = class(TFPEdit)
     LFPanelDetall: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGDetall: TDBGridFind2000;
     SBAEscandallo: TSpeedButton;
     ALMedidas: TLFActionList;
     AEscandallo: TAction;
     ANotas: TAction;
     LNotas: TLFLabel;
     LMedida4: TLFLabel;
     LMedida3: TLFLabel;
     LMedida2: TLFLabel;
     LMedida1: TLFLabel;
     LID: TLFLabel;
     LFID: TLFDbedit;
     LEscandallo: TLFLabel;
     LArticulo: TLFLabel;
     LFDBNotas: TLFDBMemo;
     LFDBMedida4: TLFDbedit;
     LFDBMedida3: TLFDbedit;
     LFDBMedida2: TLFDbedit;
     LFDBMedida1: TLFDbedit;
     LFDBEscandalloOferta: TLFDbedit;
     LDBArticulo: TLFDbedit;
     LFCBTraspasar: TLFDBCheckBox;
     DescArticulo: TLFDbedit;
     AGeneraEscandallo: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LEstandallo: TLFLabel;
     LFDBEscandallo: TLFDbedit;
     SBAEscandalloG: TSpeedButton;
     AEscandalloG: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure SBAEscandalloDblClick(Sender: TObject);
     procedure AEscandalloExecute(Sender: TObject);
     procedure LFIDChange(Sender: TObject);
     procedure ANotasExecute(Sender: TObject);
     procedure AGeneraEscandalloExecute(Sender: TObject);
     procedure AEscandalloGExecute(Sender: TObject);
  private
     { Private declarations }
     procedure TraspasarNotasPedido(Notas: string);
     procedure BuscarTareasMarcades;
  public
     { Public declarations }
  end;

var
  ProFMMedidasOFC : TProFMMedidasOFC;

implementation

uses UProDMMedidasOFC, URecursos, UDMMain, UFMain, UEntorno, UUtiles,
  {UDMPedidos, }UProFMOrden, {UFMPedidos,} UFormGest, PsFR_E_PDF, UDMOfertas,
  UFMOfertas;

{$R *.dfm}

procedure TProFMMedidasOFC.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMedidasOFC, ProDMMedidasOFC);
  NavMain.DataSource := ProDMMedidasOFC.DSMedidas;
  DBGMain.DataSource := ProDMMedidasOFC.DSMedidas;

  if (ProDMMedidasOFC.QMMedidasID_MEDIDA.AsInteger <> 0) then
  begin
     NavMain.VisibleButtons := [nbEdit, nbPost, nbCancel, nbRefresh];
     //TbuttComp.Enabled:=False;
  end
  else
     NavMain.VisibleButtons := [nbInsert, nbEdit, nbPost, nbCancel, nbRefresh];

  LFDBEscandalloOferta.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEscandallo, LFDBEscandalloOferta);

  LFDBEscandallo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEscandalloG, LFDBEscandallo);

  // sfg.albert - Si ja té una OF generada, no en pot fer res cap més
  // sfg.albert - SI JA S'HA TRASPASSAT LA OFERTA A PEDIDO, NO ES PODRÀ FER RES MÉS
  if (ProDMMedidasOFC.QMMedidasID_ESC_GENERADO.AsInteger <> 0) then
  begin
     AGeneraEscandallo.Enabled := False;
     NavMain.Enabled := False;
     DBGDetall.Enabled := False;
     TButtComp.Enabled := False;
  end
  else
  if (ProDMmedidasOFC.QMMedidasID_ESC_GENERADO.AsInteger = 0) then
  begin
     AGeneraEscandallo.Enabled := True;
     NavMain.Enabled := True;
     DBGDetall.Enabled := True;
     TButtComp.Enabled := True;
  end;
end;

procedure TProFMMedidasOFC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (ProDMMedidasOFC.QMMedidasID_MEDIDA.AsInteger <> 0) then
     FMOfertas.AProMedidas.ImageIndex := 7 // verd
  else
     FMOfertas.AProMedidas.ImageIndex := 6; // groc

  CierraData(ProDMMedidasOFC);
end;

procedure TProFMMedidasOFC.SBAEscandalloDblClick(Sender: TObject);
begin
  inherited;
  AEscandallo.Execute;
end;

procedure TProFMMedidasOFC.AEscandalloExecute(Sender: TObject);
begin
  inherited;
  if (ProDMMedidasOFC.gest_ofe_trabajar_esc_ofe = 0) then //escandall
  begin
     FMain.EjecutaAccion(FMain.AProEscandalloSF, 'id_esc = ' +
        IntToStr(ProDMMedidasOFC.QMMedidasID_ESCANDALLO.AsInteger));
  end
  else if (ProDMMedidasOFC.gest_ofe_trabajar_esc_ofe = 1) then //oferta escandall
  begin
     FMain.EjecutaAccion(FMain.AProOfertasE, 'id_esc = ' +
        IntToStr(ProDMMedidasOFC.QMMedidasID_ESCANDALLO.AsInteger));
  end;
end;

procedure TProFMMedidasOFC.LFIDChange(Sender: TObject);
begin
  inherited;
  if (LFID.Text <> '0') then
     // Un cop s'ha fer l'insert, no es permet insertar més registres per aquest detall de Pedido
     NavMain.VisibleButtons := [nbEdit, nbPost, nbCancel, nbRefresh];
end;

procedure TProFMMedidasOFC.TraspasarNotasPedido(Notas: string);
begin
  ProDMMedidasOFC.TraspasarNotasPedido(DMOfertas.QMDetalleID_DETALLES_S.AsInteger, Notas);
end;

procedure TProFMMedidasOFC.BuscarTareasMarcades;
var
  Text : string;
  aux : integer;
  {Tecla: Char; No se utiliza}
  textNotas : string;
  medida, medida1, medida2, medida3, medida4 : string;
begin
  { TODO -oAlbert : Todo esto debería ser un procedimiento en el DataModule }

  //  LFDBNotas.Text:='';         //SFG_VICTOR evitem borrar contingut previ.
  textNotas := '';
  Text := '';
  aux := 0;
  {Tecla := #13; No se utiliza}

  ProDMMedidasOFC.QBuscarMarcats.Close;
  ProDMMedidasOFC.QBuscarMarcats.Params.ByName['id_detalles'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
  ProDMMedidasOFC.QBuscarMarcats.Params.ByName['id_esc'].AsInteger := ProDMMedidasOFC.QMMedidasID_ESCANDALLO.AsInteger;
  ProDMMedidasOFC.QBuscarMarcats.Open;

  // SFG_VICTOR INICI afegeix el text (textNotas) en la tercera linea i buida la caixa de text abans d'introduir les tasques i mides.
  textNotas := LFDBNotas.Text;
  LFDBNotas.Clear;

  if (textNotas <> '') then
  begin
     textNotas := Trim(textNotas) + ' ';
  end;

  LFDBNotas.Text := '';
  // SFG_VICTOR FINAL afegeix el text (textNotas) en la tercera linea i buida la caixa de texte abans d'introduir les tasques i mides.

  while not ProDMMedidasOFC.QBuscarMarcats.EOF do
  begin
     ProDMMedidasOFC.QMMedidas.Edit;
     if (aux = 0) then
     begin
        Text := Trim(ProDMMedidasOFC.QBuscarMarcatsTAREA.AsString);  //SFG_VICTOR elimina espais en blanc de inici i final
        aux := 1;
     end
     else
        Text := Text + ', ' + ProDMMedidasOFC.QBuscarMarcatsTAREA.AsString;
     ProDMMedidasOFC.QMMedidas.Post;
     ProDMMedidasOFC.QBuscarMarcats.Next;
  end;

  ProDMMedidasOFC.QEscandallo.Close;
  ProDMMedidasOFC.QEscandallo.Params.ByName['id_escandallo'].AsInteger := ProDMMedidasOFC.QMMedidasID_ESCANDALLO.AsInteger;
  ProDMMedidasOFC.QEscandallo.Open;

  // sfg.albert -  Si medidas te valor 0, no cal que es posi a les notes
  medida1 := ProDMMedidasOFC.QMMedidasMEDIDA_1.AsString;
  medida2 := ProDMMedidasOFC.QMMedidasMEDIDA_2.AsString;
  medida3 := ProDMMedidasOFC.QMMedidasMEDIDA_3.AsString;
  medida4 := ProDMMedidasOFC.QMMedidasMEDIDA_4.AsString;

  if (medida1 <> '0') then
     medida := 'Ø' + medida1;

  if ((medida2 <> '0') and (medida <> '')) then
     medida := medida + 'x' + 'Ø' + medida2
  else if (medida2 <> '0') then
     medida := medida + 'Ø' + medida2;

  if ((medida3 <> '0') and (medida <> '')) then
     medida := medida + 'x' + medida3 + 'mm'
  else if (medida3 <> '0') then
     medida := medida + medida3 + 'mm';

  if ((medida4 <> '0') and (medida <> '')) then
     medida := medida + 'x' + medida4 + 'mm'
  else if (medida4 <> '0') then
     medida := medida + medida4 + 'mm';

  LFDBNotas.Text := Text + #13#10 + ProDMMedidasOFC.QEscandalloDESCRIPCION.AsString +
     #13#10 + textNotas + medida;
end;

procedure TProFMMedidasOFC.ANotasExecute(Sender: TObject);
begin
  inherited;
  BuscarTareasMarcades;
  ProDMMedidasOFC.TraspasarNotasMedidas(LFDBNotas.Text);
  //Es passen les notes a les notes de pedidos
  if (LFCBTraspasar.Checked) then
     TraspasarNotasPedido(LFDBNotas.Text)
  else
     TraspasarNotasPedido(''); //Es passa les notes el blanc
end;

procedure TProFMMedidasOFC.AGeneraEscandalloExecute(Sender: TObject);
begin
  inherited;
  ProDMMedidasOFC.GenerarEscandallo;
end;

procedure TProFMMedidasOFC.AEscandalloGExecute(Sender: TObject);
begin
  inherited;
  if (ProDMMedidasOFC.gest_ofe_trabajar_esc_ofe = 0) then //escandall
  begin
     FMain.EjecutaAccion(FMain.AProEscandalloSF, 'id_esc = ' +
        IntToStr(ProDMMedidasOFC.QMMedidasID_ESC_GENERADO.AsInteger));
  end
  else if (ProDMMedidasOFC.gest_ofe_trabajar_esc_ofe = 1) then //oferta escandall
  begin
     FMain.EjecutaAccion(FMain.AProOfertasE, 'id_esc = ' +
        IntToStr(ProDMMedidasOFC.QMMedidasID_ESC_GENERADO.AsInteger));
  end;
end;

end.
