object DMLstInformeMoldes: TDMLstInformeMoldes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 759
  Top = 279
  Height = 390
  Width = 327
  object frDBlstMoldesDet: TfrDBDataSet
    DataSource = DSDetalle
    Left = 125
    Top = 70
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 264
    Top = 16
  end
  object frListadoN: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Moldes'
    RebuildPrinter = False
    OnGetValue = frListadoNGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 36
    Top = 16
    ReportForm = {19000000}
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 248
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM emp_moldes'
      'WHERE empresa = ?empresa and num_molde=?num_molde ')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    Left = 37
    Top = 125
    object QMCabeceraEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMCabeceraNUM_MOLDE: TFIBStringField
      FieldName = 'NUM_MOLDE'
      Size = 10
    end
    object QMCabeceraPROPIETARIO: TIntegerField
      FieldName = 'PROPIETARIO'
    end
    object QMCabeceraALTO: TIntegerField
      FieldName = 'ALTO'
    end
    object QMCabeceraLARGO: TIntegerField
      FieldName = 'LARGO'
    end
    object QMCabeceraANCHO: TIntegerField
      FieldName = 'ANCHO'
    end
    object QMCabeceraTIPO_BOQUILLA: TIntegerField
      FieldName = 'TIPO_BOQUILLA'
    end
    object QMCabeceraDIAMETRO_EXPULSOR: TIntegerField
      FieldName = 'DIAMETRO_EXPULSOR'
    end
    object QMCabeceraTIPO_INYECCION: TIntegerField
      FieldName = 'TIPO_INYECCION'
    end
    object QMCabeceraNUM_CAVIDADES: TIntegerField
      FieldName = 'NUM_CAVIDADES'
    end
    object QMCabeceraFECHA_LLEGADA: TDateTimeField
      FieldName = 'FECHA_LLEGADA'
    end
    object QMCabeceraFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
    end
    object QMCabeceraACTIVO: TIntegerField
      FieldName = 'ACTIVO'
    end
    object QMCabeceraDESCRIPCION: TFIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMCabeceraID_UBICACION: TIntegerField
      FieldName = 'ID_UBICACION'
    end
    object QMCabeceraARO_CENTRADOR: TIntegerField
      FieldName = 'ARO_CENTRADOR'
    end
    object QMCabeceraIMAGEN: TIntegerField
      FieldName = 'IMAGEN'
    end
    object QMCabeceraCORREDERAS: TIntegerField
      FieldName = 'CORREDERAS'
    end
    object QMCabeceraNOYOS: TIntegerField
      FieldName = 'NOYOS'
    end
    object QMCabeceraTIPO_NOYO: TIntegerField
      FieldName = 'TIPO_NOYO'
    end
    object QMCabeceraFABRICADO: TIntegerField
      FieldName = 'FABRICADO'
    end
    object QMCabeceraFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
    end
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 125
    Top = 124
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 129
    Top = 176
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM emp_moldes_reparaciones where'
      'empresa = ?empresa and num_molde=?num_molde')
    UniDirectional = False
    Plan.Strings = (
      'PLAN (VER_DETALLE_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      '           VER_DETALLE_PEDIDO DET INDEX (GES_DETALLES_S_CAB_ID),'
      '           VER_DETALLE_PEDIDO PED INDEX (GES_DETALLES_S_PED_ID))')
    Left = 37
    Top = 178
    object QMDetalleEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMDetalleNUM_MOLDE: TFIBStringField
      FieldName = 'NUM_MOLDE'
      Size = 10
    end
    object QMDetalleLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object QMDetalleFECHA_DETECCION: TDateTimeField
      FieldName = 'FECHA_DETECCION'
    end
    object QMDetalleFECHA_REPARACION: TDateTimeField
      FieldName = 'FECHA_REPARACION'
    end
    object QMDetalleDESCRIPCION: TFIBStringField
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMDetalleCOMENTARIO: TFIBStringField
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMDetalleLABORATORIO: TFIBStringField
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object QMDetalleCOSTE_REP: TFloatField
      FieldName = 'COSTE_REP'
    end
    object QMDetalleTALLER: TIntegerField
      FieldName = 'TALLER'
    end
    object QMDetalleNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object frDBlstMoldesCab: TfrDBDataSet
    DataSource = DSCabecera
    Left = 35
    Top = 70
  end
end
