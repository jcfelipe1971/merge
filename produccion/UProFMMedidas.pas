unit UProFMMedidas;

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
  ULFPageControl;

type
  TProFMMedidas = class(TFPEdit)
     LFPanelDetall: TLFPanel;
     NavDetalle: THYMNavigator;
     DBGDetalle: TDBGridFind2000;
     LFCategoryAction1: TLFCategoryAction;
     ACrearOF: TAction;
     SBAEscandallo: TSpeedButton;
     ALMedidas: TLFActionList;
     AEscandallo: TAction;
     ANotas: TAction;
     PCMedidas: TLFPageControl;
     TSTareas: TTabSheet;
     TSLotes: TTabSheet;
     TSComponentes: TTabSheet;
     TBTareas: TLFToolBar;
     TBComponentes: TLFToolBar;
     NavComponentes: THYMNavigator;
     TBLotes: TLFToolBar;
     DBGComponentes: TDBGridFind2000;
     DBGLotes: TDBGridFind2000;
     NavLote: THYMNavigator;
     LID: TLFLabel;
     LFID: TLFDbedit;
     LFDBArticulo: TLFDbedit;
     LArticulo: TLFLabel;
     DescArticulo: TLFDbedit;
     LFDBMedida2: TLFDbedit;
     LMedida2: TLFLabel;
     LFDBMedida1: TLFDbedit;
     LMedida1: TLFLabel;
     LMedida3: TLFLabel;
     LFDBMedida3: TLFDbedit;
     LFDBEscandallo: TLFDbedit;
     LEscandallo: TLFLabel;
     LFDBMedida4: TLFDbedit;
     LMedida4: TLFLabel;
     LFDBNotas: TLFDBMemo;
     LNotas: TLFLabel;
     LFCBTraspasar: TLFDBCheckBox;
     LAlmacen: TLFLabel;
     LFDBAlmacen: TLFDbedit;
     DescAlmacen: TLFDbedit;
     LFDBUnPed: TLFDbedit;
     LUnidadesPendientes: TLFLabel;
     LStock: TLFLabel;
     LFDBUnStock: TLFDbedit;
     LUnidadesAsignadasALote: TLFLabel;
     LFDBUniAsignadas: TLFDbedit;
     LLoteOptimo: TLFLabel;
     LFDBLoteOp: TLFDbedit;
     LUnidadesAFabricar: TLFLabel;
     LFDBFabOp: TLFDbedit;
     LFDAFabricar: TLFDbedit;
     LUnidadesAFabricarManual: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure SBAEscandalloDblClick(Sender: TObject);
     procedure AEscandalloExecute(Sender: TObject);
     procedure ACrearOFExecute(Sender: TObject);
     procedure LFIDChange(Sender: TObject);
     procedure ANotasExecute(Sender: TObject);
     procedure DBGLotesBusqueda(Sender: TObject);
     procedure DBGLotesKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
     procedure TraspasarNotasPedido(Notas: string);
     procedure BuscarTareasMarcades;
  public
     { Public declarations }
  end;

var
  ProFMMedidas : TProFMMedidas;

implementation

uses UProDMMedidas, URecursos, UDMMain, UFMain, UEntorno, UUtiles,
  UDMPedidos, UProFMOrden, UFMPedidos, UFormGest{, PsFR_E_PDF};

{$R *.dfm}

procedure TProFMMedidas.FormCreate(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  inherited;
  AbreData(TProDMMedidas, ProDMMedidas);
  NavMain.DataSource := ProDMMedidas.DSMedidas;
  DBGMain.DataSource := ProDMMedidas.DSMedidas;

  if (ProDMMedidas.QMMedidasID_MEDIDA.AsInteger <> 0) then
  begin
     NavMain.VisibleButtons := [nbEdit, nbPost, nbCancel, nbRefresh];
     // TbuttComp.Enabled := False;
  end
  else
     NavMain.VisibleButtons := [nbInsert, nbEdit, nbPost, nbCancel, nbRefresh];

  LFDBEscandallo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEscandallo, LFDBEscandallo);

  //sfg.albert - Si ja té una OF generada, no en pot fer res cap més
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_ORDEN FROM GES_DETALLES_S_PED WHERE ID_DETALLES_S=?ID_DETALLES';
        Params.ByName['ID_DETALLES'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        if (FieldByName['ID_ORDEN'].AsInteger <> 0) then
        begin
           ACrearOF.Enabled := False;
           DBGDetalle.Enabled := False;
           NavMain.Enabled := False;
        end
        else
        begin
           ACrearOF.Enabled := True;
           DBGDetalle.Enabled := True;
           NavMain.Enabled := True;
        end;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  PCMain.ActivePage := TSTareas;
  PCMedidas.ActivePage := TSTareas; //sfg.albert
  NavLote.DataSource := ProDMMedidas.DSMedidasLotes;
end;

procedure TProFMMedidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (ProDMMedidas.QMMedidasID_MEDIDA.AsInteger <> 0) then
     FMPedidos.AProADatosEsc.ImageIndex := 7//verd
  else
     FMPedidos.AProADatosEsc.ImageIndex := 6;//groc

  CierraData(ProDMMedidas);
end;

procedure TProFMMedidas.SBAEscandalloDblClick(Sender: TObject);
begin
  inherited;
  AEscandallo.Execute;
end;

procedure TProFMMedidas.AEscandalloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'id_esc = ' +
     IntToStr(ProDMMedidas.QMMedidasID_ESCANDALLO.AsInteger));
end;

procedure TProFMMedidas.ACrearOFExecute(Sender: TObject);
var
  id_orden : integer;
  {TextNotas:String; No se utiliza}
begin
  (*
  DMPedidos.RefrescaID_Esc;
  *)
  if (DMPedidos.QMDetalleID_ESC.AsInteger <> 0) then
  begin
     id_orden := DMPedidos.QMDetalleID_ORDEN.AsInteger;

     if (id_orden = 0) then
     begin
        if (ConfirmaMensaje(_('¿Desea genenar la Orden de Producción?'))) then
        begin
           id_orden := DMPedidos.OrdenProduccion;
           // Es traspasa el camp notes de la comanda de client. L'string no es passarà a la OF
           if (ProDMMedidas.QMMedidasTRASPASAR_NOTAS_PEDIDO.AsInteger = 1) then
           begin
              // BuscarTareasMarcades; //SFG_VICTOR duplicava l'informació al traspasar-ho a les notes de la comanda.
              TraspasarNotasPedido(LFDBNotas.Text);
              TbuttComp.Enabled := False;
           end;

           // sfg.albert -  Es marca com a traspasat a la taula temporal per no tornar a generar una OF
           ProDMMedidas.QModificarTras.Close;
           ProDMMedidas.QModificarTras.Params.ByName['id_detalles'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;

           // ProDMMedidas.QModificarTras.Params.ByName['id_esc'].AsInteger:=ProDMMedidas.QMMedidasID_ESCANDALLO.AsInteger;
           // ProDMMedidas.QModificarTras.Params.ByName['linea_fase'].AsInteger:=ProDMMedidas.QMDetMedidasLINEA_FASE.AsInteger;
           ProDMMedidas.QModificarTras.Prepare;
           ProDMMedidas.QModificarTras.ExecQuery;
           ProDMMedidas.QModificarTras.FreeHandle;

           TbuttComp.Enabled := False;
           // Es canvien els colors del botó de OF de FMPedidos
           if (id_orden <> 0) then
              FMPedidos.AProCrearOF.ImageIndex := 7 // verd
           else
              FMPedidos.AProCrearOF.ImageIndex := 8; //groc

           // Mostra l'ordre creada o ja associada
           FMain.EjecutaAccion(FMain.AProOrden);
           ProFMOrden.FiltraOrden(id_orden);
        end;
     end
     else
     begin
        // Mostra l'ordre creada o ja associada
        FMain.EjecutaAccion(FMain.AProOrden);
        ProFMOrden.FiltraOrden(id_orden);
     end;
  end;
  Close;
end;

procedure TProFMMedidas.LFIDChange(Sender: TObject);
begin
  inherited;
  if (LFID.Text <> '0') then
     // Un cop s'ha fer l'insert, no es permet insertar més registres per aquest detall de Pedido
     NavMain.VisibleButtons := [nbEdit, nbPost, nbCancel, nbRefresh];
end;

procedure TProFMMedidas.TraspasarNotasPedido(Notas: string);
begin
  ProDMMedidas.TraspasarNotasPedido(DMPedidos.QMDetalleID_DETALLES_S.AsInteger, Notas);
end;

procedure TProFMMedidas.BuscarTareasMarcades;
var
  Text : string;
  aux : integer;
  {Tecla: Char; No se utiliza}
  TextNotas : string;
  medida, medida1, medida2, medida3, medida4 : string;
begin
  { TODO -oAlbert : Todo esto debería ser un procedimiento en el DataModule }

  // LFDBNotas.Text:=''; // SFG_VICTOR evitem borrar contingut previ.
  TextNotas := '';
  Text := '';
  aux := 0;
  {Tecla := #13; No se utiliza}
  ProDMMedidas.QBuscarMarcats.Close;
  ProDMMedidas.QBuscarMarcats.Params.ByName['id_detalles'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
  ProDMMedidas.QBuscarMarcats.Params.ByName['id_esc'].AsInteger := ProDMMedidas.QMMedidasID_ESCANDALLO.AsInteger;
  ProDMMedidas.QBuscarMarcats.Open;

  // SFG_VICTOR INICI afegeix el text (TextNotas) en la tercera linea i buida la caixa de text abans d'introduir les tasques i mides.
  TextNotas := LFDBNotas.Text;
  LFDBNotas.Clear;

  if (TextNotas <> '') then
  begin
     TextNotas := Trim(TextNotas) + ' ';
  end;

  LFDBNotas.Text := '';
  // SFG_VICTOR FINAL afegeix el text (textNotas) en la tercera linea i buida la caixa de texte abans d'introduir les tasques i mides.

  while not ProDMMedidas.QBuscarMarcats.EOF do
  begin
     ProDMMedidas.QMMedidas.Edit;
     if (aux = 0) then
     begin
        Text := Trim(ProDMMedidas.QBuscarMarcatsTAREA.AsString);  //SFG_VICTOR elimina espais en blanc de inici i final
        aux := 1;
     end
     else
        Text := Text + ', ' + ProDMMedidas.QBuscarMarcatsTAREA.AsString;
     ProDMMedidas.QMMedidas.Post;
     ProDMMedidas.QBuscarMarcats.Next;
  end;

  ProDMMedidas.QEscandallo.Close;
  ProDMMedidas.QEscandallo.Params.ByName['id_escandallo'].AsInteger := ProDMMedidas.QMMedidasID_ESCANDALLO.AsInteger;
  ProDMMedidas.QEscandallo.Open;

  // sfg.albert -  Si medidas te valor 0, no cal que es posi a les notes
  medida1 := ProDMMedidas.QMMedidasMEDIDA_1.AsString;
  medida2 := ProDMMedidas.QMMedidasMEDIDA_2.AsString;
  medida3 := ProDMMedidas.QMMedidasMEDIDA_3.AsString;
  medida4 := ProDMMedidas.QMMedidasMEDIDA_4.AsString;

  if (medida1 <> '0') then
     medida := 'Ø' + medida1;

  if ((medida2 <> '0') and (medida <> '')) then
     medida := medida + 'x' + 'Ø' + medida2
  else
  if (medida2 <> '0') then
     medida := medida + 'Ø' + medida2;

  if ((medida3 <> '0') and (medida <> '')) then
     medida := medida + 'x' + medida3 + 'mm'
  else
  if (medida3 <> '0') then
     medida := medida + medida3 + 'mm';

  if ((medida4 <> '0') and (medida <> '')) then
     medida := medida + 'x' + medida4 + 'mm'
  else
  if (medida4 <> '0') then
     medida := medida + medida4 + 'mm';

  LFDBNotas.Text := Text + #13#10 + ProDMMedidas.QEscandalloDESCRIPCION.AsString +
     #13#10 + textNotas + medida;
end;

procedure TProFMMedidas.ANotasExecute(Sender: TObject);
begin
  inherited;
  BuscarTareasMarcades;
  ProDMMedidas.TraspasarNotasMedidas(LFDBNotas.Text);

  // Es passen les notes a les notes de pedidos
  if (LFCBTraspasar.Checked) then
     TraspasarNotasPedido(LFDBNotas.Text)
  else
     TraspasarNotasPedido(''); // Es passa les notes el blanc
end;

procedure TProFMMedidas.DBGLotesBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGLotes.TablaABuscar) = 'ART_ARTICULOS_LOTES' then
  begin
     DBGLotes.CondicionBusqueda := 'ID_LOTE NOT IN (select id_lote from pro_medidas_lotes where id_pedido = ' + IntToStr(ProDMMedidas.QMMedidasLotesID_PEDIDO.AsInteger) +
        ' and id_medida=''' + ProDMMedidas.QMMedidasID_MEDIDA.AsString + '''' + ')';
  end;
end;

procedure TProFMMedidas.DBGLotesKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        ProDMMedidas.Infolotes;
  end;
end;

end.
