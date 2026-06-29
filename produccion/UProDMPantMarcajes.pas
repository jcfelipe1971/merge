unit UProDMPantMarcajes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, RxMemDS, FIBTableDataSet, FIBQuery, HYFIBQuery,
  FIBInfoSet, Dialogs, jpeg, GIFImage, Graphics, ExtCtrls, Variants, Math,
  Controls;

type
  TProDMPantMarcajes = class(TDataModule)
     LstMarcajes: TRxMemoryData;
     DSLstMarcajes: TDataSource;
     TLocal: THYTransaction;
     QMVerMarcajesOpe: TFIBTableSet;
     DSQMVerMarcajesOpe: TDataSource;
     xVerMarcajesOpe: TFIBDataSetRO;
     DSxVerMarcajesOpe: TDataSource;
     QMVerMarcajesOpeEMPRESA: TIntegerField;
     QMVerMarcajesOpeEMPLEADO: TIntegerField;
     QMVerMarcajesOpeTERCERO: TIntegerField;
     QMVerMarcajesOpeCATEGORIA: TFIBStringField;
     QMVerMarcajesOpeCENTRO: TFIBStringField;
     QMVerMarcajesOpeDEPARTAMENTO: TFIBStringField;
     QMVerMarcajesOpeSECCION: TFIBStringField;
     QMVerMarcajesOpeCALENDARIO: TIntegerField;
     QMVerMarcajesOpeN_SEGURIDAD_SOCIAL: TFIBStringField;
     QMVerMarcajesOpeTIPO_CONTRATO: TFIBStringField;
     QMVerMarcajesOpeINI_CONTRATO: TDateTimeField;
     QMVerMarcajesOpeFIN_CONTRATO: TDateTimeField;
     QMVerMarcajesOpeFECHA_NACIMIENTO: TDateTimeField;
     QMVerMarcajesOpeESTADO_CIVIL: TFIBStringField;
     QMVerMarcajesOpeNOTAS: TBlobField;
     QMVerMarcajesOpeIMAGEN: TMemoField;
     QMVerMarcajesOpeCODIGO_TARJETA: TFIBStringField;
     QMVerMarcajesOpeUSUARIO: TIntegerField;
     QMVerMarcajesOpeRECURSO: TFIBStringField;
     QMVerMarcajesOpeHORARIO: TFIBStringField;
     QMVerMarcajesOpeIMPUTACION: TIntegerField;
     QMVerMarcajesOpeTIPOIMPUTACION: TIntegerField;
     QMVerMarcajesOpeID_IMAGEN: TIntegerField;
     QMVerMarcajesOpeTIPOTAREA: TFIBStringField;
     QMVerMarcajesOpeFORMACION_INI: TBlobField;
     QMVerMarcajesOpeEXPERIENCIA_PROF: TBlobField;
     xVerMarcajesOpeEMPRESA: TIntegerField;
     xVerMarcajesOpeEMPLEADO: TIntegerField;
     xVerMarcajesOpeTERCERO: TIntegerField;
     xVerMarcajesOpeCATEGORIA: TFIBStringField;
     xVerMarcajesOpeCENTRO: TFIBStringField;
     xVerMarcajesOpeDEPARTAMENTO: TFIBStringField;
     xVerMarcajesOpeSECCION: TFIBStringField;
     xVerMarcajesOpeCALENDARIO: TIntegerField;
     xVerMarcajesOpeN_SEGURIDAD_SOCIAL: TFIBStringField;
     xVerMarcajesOpeTIPO_CONTRATO: TFIBStringField;
     xVerMarcajesOpeINI_CONTRATO: TDateTimeField;
     xVerMarcajesOpeFIN_CONTRATO: TDateTimeField;
     xVerMarcajesOpeFECHA_NACIMIENTO: TDateTimeField;
     xVerMarcajesOpeESTADO_CIVIL: TFIBStringField;
     xVerMarcajesOpeNOTAS: TBlobField;
     xVerMarcajesOpeIMAGEN: TMemoField;
     xVerMarcajesOpeCODIGO_TARJETA: TFIBStringField;
     xVerMarcajesOpeUSUARIO: TIntegerField;
     xVerMarcajesOpeRECURSO: TFIBStringField;
     xVerMarcajesOpeHORARIO: TFIBStringField;
     xVerMarcajesOpeIMPUTACION: TIntegerField;
     xVerMarcajesOpeTIPOIMPUTACION: TIntegerField;
     xVerMarcajesOpeID_IMAGEN: TIntegerField;
     xVerMarcajesOpeTIPOTAREA: TFIBStringField;
     xVerMarcajesOpeFORMACION_INI: TBlobField;
     xVerMarcajesOpeEXPERIENCIA_PROF: TBlobField;
     xVerMarcajesOpeNOMBRE_R_SOCIAL: TFIBStringField;
     LstMarcajesImagen: TStringField;
     LstMarcajesTitulo: TStringField;
     SPDetalle: THYFIBQuery;
     xVerMarcajesOpeFECHA: TDateTimeField;
     QMVerMarcajesOpeFECHA: TDateTimeField;
     LstMarcajesNotas: TMemoField;
     xDetalles: TFIBDataSetRO;
     DSxDetalles: TDataSource;
     DSQMDetalles: TDataSource;
     QMDetalles: TFIBTableSet;
     QMDetallesEMPRESA: TIntegerField;
     QMDetallesEJERCICIO: TIntegerField;
     QMDetallesCANAL: TIntegerField;
     QMDetallesSERIE: TFIBStringField;
     QMDetallesTIPO: TFIBStringField;
     QMDetallesRIG: TIntegerField;
     QMDetallesLINEA: TIntegerField;
     QMDetallesRIG_OF: TIntegerField;
     QMDetallesSUBORDEN: TIntegerField;
     QMDetallesLINEA_FASE: TIntegerField;
     QMDetallesLINEA_TAREA: TIntegerField;
     QMDetallesFECHA_PREV: TDateTimeField;
     QMDetallesFECHA_REAL: TDateTimeField;
     QMDetallesNUM_REF_SAL: TIntegerField;
     QMDetallesHORA_INICIO: TFloatField;
     QMDetallesHORA_FIN: TFloatField;
     QMDetallesTIEMPO: TFloatField;
     QMDetallesRECURSO: TFIBStringField;
     QMDetallesPRECIO_RECURSO: TFloatField;
     QMDetallesTIPO_RECURSO: TFIBStringField;
     QMDetallesUNIDADES_FAB: TFloatField;
     QMDetallesUNIDADES_DEFEC: TFloatField;
     QMDetallesESTADO: TIntegerField;
     QMDetallesNOTAS: TMemoField;
     QMDetallesTOTAL_RECURSO: TFloatField;
     QMDetallesIDTAREA: TIntegerField;
     QMDetallesIMPUTACION: TFIBStringField;
     QMDetallesTIEMPO_DEC: TFloatField;
     QMDetallesTIPOFASE: TFIBStringField;
     QMDetallesTIPOTAREA: TFIBStringField;
     QMDetallesNUEVA_TAREA: TIntegerField;
     QMDetallesENTRADA: TIntegerField;
     QMDetallesCANTIDAD: TFloatField;
     QMDetallesTIPO_MARCAJE: TFIBStringField;
     QMDetallesID_ORDEN: TIntegerField;
     QMDetallesOPERARIO: TIntegerField;
     QMDetallesMAQUINA: TIntegerField;
     QMDetallesPROVEEDOR: TIntegerField;
     QMDetallesVARIOS: TFIBStringField;
     QMDetallesFECHA: TDateTimeField;
     QMDetallesTIEMPO_TOT: TFloatField;
     QMDetallesRIG_OFF: TIntegerField;
     LstMarcajesHorario: TStringField;
     LstMarcajesHorasTrab: TStringField;
     xVerMarcajesOpeDESCRIPCION: TFIBStringField;
     QMVerMarcajesOpeTIEMPO_TOT: TFloatField;
     xVerMarcajesOpeTIEMPO_TOT: TFloatField;
     DSQMVerMarcajesMaq: TDataSource;
     xVerMarcajesMaq: TFIBDataSetRO;
     DSxVerMarcajesMaq: TDataSource;
     QMVerMarcajesMaq: TFIBTableSet;
     xDetallesEMPRESA: TIntegerField;
     xDetallesEJERCICIO: TIntegerField;
     xDetallesCANAL: TIntegerField;
     xDetallesSERIE: TFIBStringField;
     xDetallesTIPO: TFIBStringField;
     xDetallesRIG: TIntegerField;
     xDetallesLINEA: TIntegerField;
     xDetallesRIG_OF: TIntegerField;
     xDetallesSUBORDEN: TIntegerField;
     xDetallesLINEA_FASE: TIntegerField;
     xDetallesLINEA_TAREA: TIntegerField;
     xDetallesFECHA_PREV: TDateTimeField;
     xDetallesFECHA_REAL: TDateTimeField;
     xDetallesNUM_REF_SAL: TIntegerField;
     xDetallesHORA_INICIO: TFloatField;
     xDetallesHORA_FIN: TFloatField;
     xDetallesTIEMPO: TFloatField;
     xDetallesRECURSO: TFIBStringField;
     xDetallesPRECIO_RECURSO: TFloatField;
     xDetallesTIPO_RECURSO: TFIBStringField;
     xDetallesUNIDADES_FAB: TFloatField;
     xDetallesUNIDADES_DEFEC: TFloatField;
     xDetallesESTADO: TIntegerField;
     xDetallesNOTAS: TMemoField;
     xDetallesTOTAL_RECURSO: TFloatField;
     xDetallesIDTAREA: TIntegerField;
     xDetallesIMPUTACION: TFIBStringField;
     xDetallesTIEMPO_DEC: TFloatField;
     xDetallesTIPOFASE: TFIBStringField;
     xDetallesTIPOTAREA: TFIBStringField;
     xDetallesNUEVA_TAREA: TIntegerField;
     xDetallesENTRADA: TIntegerField;
     xDetallesCANTIDAD: TFloatField;
     xDetallesTIPO_MARCAJE: TFIBStringField;
     xDetallesID_ORDEN: TIntegerField;
     xDetallesEMPRESA1: TIntegerField;
     xDetallesEJERCICIO1: TIntegerField;
     xDetallesCANAL1: TIntegerField;
     xDetallesSERIE1: TFIBStringField;
     xDetallesTIPO1: TFIBStringField;
     xDetallesRIG1: TIntegerField;
     xDetallesOPERARIO: TIntegerField;
     xDetallesMAQUINA: TIntegerField;
     xDetallesPROVEEDOR: TIntegerField;
     xDetallesVARIOS: TFIBStringField;
     xDetallesFECHA: TDateTimeField;
     xDetallesTIEMPO_TOT: TFloatField;
     xDetallesRIG_OFF: TIntegerField;
     LstMarcajesCodigo: TStringField;
     xVerMarcajesMaqEMPRESA: TIntegerField;
     xVerMarcajesMaqCODMAQ: TIntegerField;
     xVerMarcajesMaqTIPO: TFIBStringField;
     xVerMarcajesMaqCODIDE: TFIBStringField;
     xVerMarcajesMaqFECHA_COMPRA: TDateTimeField;
     xVerMarcajesMaqFABRICANTE: TFIBStringField;
     xVerMarcajesMaqNSERIE: TFIBStringField;
     xVerMarcajesMaqDESCRIPCION: TFIBStringField;
     xVerMarcajesMaqOBSERVACION: TBlobField;
     xVerMarcajesMaqFRECUENCIA: TIntegerField;
     xVerMarcajesMaqCERTIFICACION: TIntegerField;
     xVerMarcajesMaqFECHA_CERT: TDateTimeField;
     xVerMarcajesMaqRECURSO: TFIBStringField;
     xVerMarcajesMaqCALENDARIO: TIntegerField;
     xVerMarcajesMaqHORARIO: TFIBStringField;
     xVerMarcajesMaqEMPRESA1: TIntegerField;
     xVerMarcajesMaqEJERCICIO: TIntegerField;
     xVerMarcajesMaqCANAL: TIntegerField;
     xVerMarcajesMaqSERIE: TFIBStringField;
     xVerMarcajesMaqTIPO1: TFIBStringField;
     xVerMarcajesMaqRIG: TIntegerField;
     xVerMarcajesMaqOPERARIO: TIntegerField;
     xVerMarcajesMaqMAQUINA: TIntegerField;
     xVerMarcajesMaqPROVEEDOR: TIntegerField;
     xVerMarcajesMaqVARIOS: TFIBStringField;
     xVerMarcajesMaqFECHA: TDateTimeField;
     xVerMarcajesMaqTIEMPO_TOT: TFloatField;
     xVerMarcajesMaqRIG_OFF: TIntegerField;
     xVerMarcajesMaqEMPRESA2: TIntegerField;
     xVerMarcajesMaqHORARIO1: TFIBStringField;
     xVerMarcajesMaqDESCRIPCION1: TFIBStringField;
     xDetallesMaq: TFIBDataSetRO;
     DSxDetallesMaq: TDataSource;
     DSQMDetallesMaq: TDataSource;
     QMDetallesMaq: TFIBTableSet;
     IntegerField25: TIntegerField;
     IntegerField26: TIntegerField;
     IntegerField27: TIntegerField;
     FIBStringField12: TFIBStringField;
     FIBStringField13: TFIBStringField;
     IntegerField28: TIntegerField;
     IntegerField29: TIntegerField;
     IntegerField30: TIntegerField;
     IntegerField31: TIntegerField;
     IntegerField32: TIntegerField;
     IntegerField33: TIntegerField;
     DateTimeField4: TDateTimeField;
     DateTimeField5: TDateTimeField;
     IntegerField34: TIntegerField;
     FloatField11: TFloatField;
     FloatField12: TFloatField;
     FloatField13: TFloatField;
     FIBStringField14: TFIBStringField;
     FloatField14: TFloatField;
     FIBStringField15: TFIBStringField;
     FloatField15: TFloatField;
     FloatField16: TFloatField;
     IntegerField35: TIntegerField;
     MemoField2: TMemoField;
     FloatField17: TFloatField;
     IntegerField36: TIntegerField;
     FIBStringField16: TFIBStringField;
     FloatField18: TFloatField;
     FIBStringField17: TFIBStringField;
     FIBStringField18: TFIBStringField;
     IntegerField37: TIntegerField;
     IntegerField38: TIntegerField;
     FloatField19: TFloatField;
     FIBStringField19: TFIBStringField;
     IntegerField39: TIntegerField;
     IntegerField40: TIntegerField;
     IntegerField41: TIntegerField;
     IntegerField42: TIntegerField;
     FIBStringField20: TFIBStringField;
     DateTimeField6: TDateTimeField;
     FloatField20: TFloatField;
     IntegerField43: TIntegerField;
     SPDetalleMaq: THYFIBQuery;
     xDetallesMaqEMPRESA: TIntegerField;
     xDetallesMaqEJERCICIO: TIntegerField;
     xDetallesMaqCANAL: TIntegerField;
     xDetallesMaqSERIE: TFIBStringField;
     xDetallesMaqTIPO: TFIBStringField;
     xDetallesMaqRIG: TIntegerField;
     xDetallesMaqLINEA: TIntegerField;
     xDetallesMaqRIG_OF: TIntegerField;
     xDetallesMaqSUBORDEN: TIntegerField;
     xDetallesMaqLINEA_FASE: TIntegerField;
     xDetallesMaqLINEA_TAREA: TIntegerField;
     xDetallesMaqFECHA_PREV: TDateTimeField;
     xDetallesMaqFECHA_REAL: TDateTimeField;
     xDetallesMaqNUM_REF_SAL: TIntegerField;
     xDetallesMaqHORA_INICIO: TFloatField;
     xDetallesMaqHORA_FIN: TFloatField;
     xDetallesMaqTIEMPO: TFloatField;
     xDetallesMaqRECURSO: TFIBStringField;
     xDetallesMaqPRECIO_RECURSO: TFloatField;
     xDetallesMaqTIPO_RECURSO: TFIBStringField;
     xDetallesMaqUNIDADES_FAB: TFloatField;
     xDetallesMaqUNIDADES_DEFEC: TFloatField;
     xDetallesMaqESTADO: TIntegerField;
     xDetallesMaqNOTAS: TMemoField;
     xDetallesMaqTOTAL_RECURSO: TFloatField;
     xDetallesMaqIDTAREA: TIntegerField;
     xDetallesMaqIMPUTACION: TFIBStringField;
     xDetallesMaqTIEMPO_DEC: TFloatField;
     xDetallesMaqTIPOFASE: TFIBStringField;
     xDetallesMaqTIPOTAREA: TFIBStringField;
     xDetallesMaqNUEVA_TAREA: TIntegerField;
     xDetallesMaqENTRADA: TIntegerField;
     xDetallesMaqCANTIDAD: TFloatField;
     xDetallesMaqTIPO_MARCAJE: TFIBStringField;
     xDetallesMaqID_ORDEN: TIntegerField;
     xDetallesMaqEMPRESA1: TIntegerField;
     xDetallesMaqEJERCICIO1: TIntegerField;
     xDetallesMaqCANAL1: TIntegerField;
     xDetallesMaqSERIE1: TFIBStringField;
     xDetallesMaqTIPO1: TFIBStringField;
     xDetallesMaqRIG1: TIntegerField;
     xDetallesMaqOPERARIO: TIntegerField;
     xDetallesMaqMAQUINA: TIntegerField;
     xDetallesMaqPROVEEDOR: TIntegerField;
     xDetallesMaqVARIOS: TFIBStringField;
     xDetallesMaqFECHA: TDateTimeField;
     xDetallesMaqTIEMPO_TOT: TFloatField;
     xDetallesMaqRIG_OFF: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMVerMarcajesOpeAfterOpen(DataSet: TDataSet);
     procedure QMVerMarcajesOpeAfterScroll(DataSet: TDataSet);
     procedure QMDetallesAfterOpen(DataSet: TDataSet);
     procedure QMVerMarcajesMaqAfterOpen(DataSet: TDataSet);
     procedure QMVerMarcajesMaqAfterScroll(DataSet: TDataSet);
     procedure xDetallesMaqAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     RutaFicheros: string;
     procedure RastreaDirOpe;
     procedure RastreaDirMaq;
     procedure CambiaFecha(Fecha: TDateTime);
     procedure LeerIni;
     function FormatoHora(Texto: string): string;
  end;

var
  ProDMPantMarcajes : TProDMPantMarcajes;

implementation

uses Forms, UDMMain, UProFMPantMarcajes, uFBusca, UEntorno,
  UFMain, UProFMOrden, UUtiles,
  UProFMExtraeArticulos, UFormGest,
  Mask, UFParada;

{$R *.dfm}

procedure TProDMPantMarcajes.DataModuleCreate(Sender: TObject);
{var
  HorasTrab : TDateTime;}
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  LeerIni;

  with QMVerMarcajesOpe do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA'].AsDateTime := QMVerMarcajesOpe.Params.ByName['Fecha'].AsDateTime;
     Open;
  end;

  with QMVerMarcajesMaq do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA'].AsDateTime := QMVerMarcajesMaq.Params.ByName['Fecha'].AsDateTime;
     Open;
  end;
end;

procedure TProDMPantMarcajes.QMVerMarcajesOpeAfterScroll(DataSet: TDataSet);
begin
  ProFMPantMarcajes.DBCGOperario.DataSource := nil;
  RastreaDirOpe;
  ProFMPantMarcajes.DBCGOperario.DataSource := ProDMPantMarcajes.DSLstMarcajes;
end;

procedure TProDMPantMarcajes.RastreaDirOpe;
var
  FileSearch : TSearchRec;
  Dir, Empleado, Marcaje, Titulo, Horario, HorasTrab : string;
begin
  LstMarcajes.DisableControls;
  try
     LstMarcajes.Close;
     LstMarcajes.Open;
     LstMarcajes.EmptyTable;
     xVerMarcajesOpe.Open;
     xVerMarcajesOpe.First;

     while (not xVerMarcajesOpe.EOF) do
     begin
        Empleado := xVerMarcajesOpeEMPLEADO.AsString;
        Titulo := xVerMarcajesOpeNOMBRE_R_SOCIAL.AsString;
        Horario := xVerMarcajesOpeDESCRIPCION.AsString;
        HorasTrab := FormatoHora(xVerMarcajesOpeTIEMPO_TOT.AsString) + ' h.';
        Dir := RutaFicheros + '\';

        with QMDetalles do
        begin
           Close;
           Params.ByName['FECHA'].AsDateTime := QMVerMarcajesOpe.Params.ByName['Fecha'].AsDateTime;
           Params.ByName['OPERARIO'].AsString := Empleado;
           Open;
        end;

        with SPDetalle do
        begin
           Close;
           Params.ByName['Fecha'].AsDateTime := QMVerMarcajesOpe.Params.ByName['Fecha'].AsDateTime;
           Params.ByName['Operario'].AsString := Empleado;
           ExecQuery;

           if FindFirst(Dir + 'T' + Empleado + '*.*', 0, FileSearch) = 0 then
              Empleado := Copy(ExtractFileName(FileSearch.Name), 0, Length(ExtractFileName(FileSearch.Name)) - Length(ExtractFileExt(FileSearch.Name)));

           LstMarcajes.Insert;
           LstMarcajes.FieldByName('Imagen').AsString := Dir + FileSearch.Name;
           LstMarcajes.FieldByName('Codigo').AsString := Empleado;
           LstMarcajes.FieldByName('Titulo').AsString := Titulo;
           LstMarcajes.FieldByName('Horario').AsString := Horario;
           LstMarcajes.FieldByName('HorasTrab').AsString := HorasTrab;
           FileSearch.Name := '';

           xDetalles.Open;
           xDetalles.First;
           ProFMPantMarcajes.LFDBMemo.Text := '';

           while (not xDetalles.EOF) do
           begin
              // Mostra components
              ProFMPantMarcajes.LFDBMemo.Visible := True;
              ProFMPantMarcajes.LFDBNombre.Visible := True;
              ProFMPantMarcajes.DBEEmpleado.Visible := True;
              ProFMPantMarcajes.LFDHorario.Visible := True;
              ProFMPantMarcajes.LFDHorasTrab.Visible := True;

              Marcaje := Format(_('Hora Inicio: %s Hora Fin: %s Tarea : %s'), [FormatoHora(xDetallesHORA_INICIO.AsString), FormatoHora(xDetallesHORA_FIN.AsString), xDetallesTIPOTAREA.AsString]);
              ProFMPantMarcajes.LFDBMemo.Lines.Add(Marcaje);
              xDetalles.Next;
           end;

           LstMarcajes.FieldByName('Notas').AsString := ProFMPantMarcajes.LFDBMemo.Text;
           LstMarcajes.Post;
        end;
        xVerMarcajesOpe.Next;
     end;
  finally
     LstMarcajes.EnableControls;
  end;
end;

procedure TProDMPantMarcajes.RastreaDirMaq;
var
  FileSearch : TSearchRec;
  Dir, Maquina, Marcaje, Titulo, Horario, HorasTrab : string;
begin
  LstMarcajes.DisableControls;
  try
     LstMarcajes.Close;
     LstMarcajes.Open;
     LstMarcajes.EmptyTable;
     xDetallesMaq.Open;
     xVerMarcajesMaq.Open;
     xVerMarcajesMaq.First;

     while (not xVerMarcajesMaq.EOF) do
     begin
        Maquina := xVerMarcajesMaqCODMAQ.AsString;
        Titulo := xVerMarcajesMaqDESCRIPCION.AsString;
        Horario := xVerMarcajesMaqDESCRIPCION1.AsString;
        HorasTrab := FormatoHora(xVerMarcajesMaqTIEMPO_TOT.AsString) + ' h.';
        Dir := RutaFicheros + '\';

        with QMDetallesMaq do
        begin
           Close;
           Params.ByName['FECHA'].AsDateTime := QMVerMarcajesMaq.Params.ByName['Fecha'].AsDateTime;
           Params.ByName['MAQUINA'].AsString := Maquina;
           Open;
        end;

        with SPDetalleMaq do
        begin
           Close;
           Params.ByName['Fecha'].AsDateTime := QMVerMarcajesMaq.Params.ByName['Fecha'].AsDateTime;
           Params.ByName['Maquina'].AsString := Maquina;
           ExecQuery;

           if FindFirst(Dir + 'X' + Maquina + '*.*', 0, FileSearch) = 0 then
              Maquina := Copy(ExtractFileName(FileSearch.Name), 0, Length(ExtractFileName(FileSearch.Name)) - Length(ExtractFileExt(FileSearch.Name)));

           LstMarcajes.Insert;
           LstMarcajes.FieldByName('Imagen').AsString := Dir + FileSearch.Name;
           LstMarcajes.FieldByName('Codigo').AsString := Maquina;
           LstMarcajes.FieldByName('Titulo').AsString := Titulo;
           LstMarcajes.FieldByName('Horario').AsString := Horario;
           LstMarcajes.FieldByName('HorasTrab').AsString := HorasTrab;
           FileSearch.Name := '';

           xDetallesMaq.Open;
           xDetallesMaq.First;

           ProFMPantMarcajes.LFDBMemo1.Text := '';

           while (not xDetallesMaq.EOF) do
           begin
              // Mostra components
              ProFMPantMarcajes.LFDBMemo1.Visible := True;
              ProFMPantMarcajes.DBECodMaq.Visible := True;
              ProFMPantMarcajes.DBENombre1.Visible := True;
              ProFMPantMarcajes.DBEMaquina.Visible := True;
              ProFMPantMarcajes.DBEHorario1.Visible := True;

              Marcaje := Format(_('Hora Inicio: %s Hora Fin: %s Tarea : %s'), [FormatoHora(xDetallesMaqHORA_INICIO.AsString), FormatoHora(xDetallesMaqHORA_FIN.AsString), xDetallesMaqTIPOTAREA.AsString]);
              ProFMPantMarcajes.LFDBMemo1.Lines.Add(Marcaje);
              xDetallesMaq.Next;
           end;

           LstMarcajes.FieldByName('Notas').AsString := ProFMPantMarcajes.LFDBMemo1.Text;
           LstMarcajes.Post;
        end;

        xVerMarcajesMaq.Next;
     end;
  finally
     LstMarcajes.EnableControls;
  end;
end;

function TProDMPantMarcajes.FormatoHora(Texto: string): string;
var
  TextoAux : string;
  i, a : integer;
begin
  TextoAux := Texto + '0';
  a := Length(Texto);
  for i := Length(TextoAux) downto 1 do
  begin
     if i = (Length(Texto) - 1) then
        TextoAux[i] := ':'
     else
     begin
        TextoAux[i] := Texto[a];
        a := a - 1;
     end;
  end;

  Result := TextoAux;
end;

procedure TProDMPantMarcajes.QMVerMarcajesOpeAfterOpen(DataSet: TDataSet);
begin
  xVerMarcajesOpe.Open;

  LstMarcajes.Close;
  LstMarcajes.Open;
  LstMarcajes.EmptyTable;
end;

procedure TProDMPantMarcajes.CambiaFecha(Fecha: TDateTime);
begin
  xVerMarcajesOpe.Open;
  xVerMarcajesMaq.Open;
  LstMarcajes.Close;
  LstMarcajes.Open;
  LstMarcajes.EmptyTable;
  xVerMarcajesOpeFECHA.AsDateTime := Fecha;
  // xVerMarcajesMaqFECHA.AsDateTime := Fecha;

  // Mostra components
  ProFMPantMarcajes.LFDBMemo.Visible := False;
  ProFMPantMarcajes.LFDBNombre.Visible := False;
  ProFMPantMarcajes.DBEEmpleado.Visible := False;

  RastreaDirOpe;
end;

procedure TProDMPantMarcajes.QMDetallesAfterOpen(DataSet: TDataSet);
begin
  xDetalles.Open;
end;

procedure TProDMPantMarcajes.QMVerMarcajesMaqAfterOpen(DataSet: TDataSet);
begin
  xVerMarcajesMaq.Open;

  LstMarcajes.Close;
  LstMarcajes.Open;
  LstMarcajes.EmptyTable;
end;

procedure TProDMPantMarcajes.QMVerMarcajesMaqAfterScroll(DataSet: TDataSet);
begin
  ProFMPantMarcajes.DBCGOperario.DataSource := nil;
  RastreaDirMaq;
  ProFMPantMarcajes.DBCGOperario.DataSource := ProDMPantMarcajes.DSLstMarcajes;
end;

procedure TProDMPantMarcajes.xDetallesMaqAfterOpen(DataSet: TDataSet);
begin
  xDetallesMaq.Open;
end;

procedure TProDMPantMarcajes.LeerIni;
begin
  RutaFicheros := LeeDatoIni('Marcajes', 'Path', ExtractFilePath(Application.Exename) + 'VerMarcajes');
  ProFMPantMarcajes.EFilas.Text := LeeDatoIni('Marcajes', 'Filas', '2');
  ProFMPantMarcajes.EColumnas.Text := LeeDatoIni('Marcajes', 'Columnas', '3');

  EscribeDatoIni('Marcajes', 'Path', RutaFicheros);
  EscribeDatoIni('Marcajes', 'Filas', ProFMPantMarcajes.EFilas.Text);
  EscribeDatoIni('Marcajes', 'Columnas', ProFMPantMarcajes.EColumnas.Text);
end;

end.
