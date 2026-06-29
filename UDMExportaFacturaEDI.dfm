object DMExportaFacturaEDI: TDMExportaFacturaEDI
  OldCreateOrder = False
  Left = 280
  Top = 138
  Height = 359
  Width = 432
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 352
    Top = 8
  end
  object xProcedencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT r.o_empresa,r.o_ejercicio,r.o_canal,r.o_serie,r.o_tipo,r.' +
        'o_rig,c.su_referencia FROM GES_cabeceras_RELACIONES r'
      'JOIN GES_CABECERAS_S c ON'
      'r.o_empresa = c.empresa and'
      'r.o_ejercicio = c.ejercicio and'
      'r.o_canal = c.canal and'
      'r.o_serie = c.serie and'
      'r.o_tipo = c.tipo and'
      'r.o_rig = c.rig '
      'WHERE'
      'r.D_EMPRESA = ?EMPRESA AND '
      'r.D_EJERCICIO = ?EJERCICIO AND'
      'r.D_CANAL = ?CANAL AND '
      'r.D_SERIE = ?SERIE AND '
      'r.D_TIPO = ?TIPO AND '
      'r.D_RIG=?RIG')
    UniDirectional = False
    Left = 240
    Top = 8
  end
  object xDireccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select  te.tercero,te.NIF,'
      '        di.dir_completa,lo.codigo_postal,lo.titulo'
      'from sys_terceros te join sys_terceros_direcciones di'
      'on (te.tercero=di.tercero)'
      'join sys_localidades lo'
      'on (di.dir_localidad=lo.localidad)'
      'where '
      'te.tercero = ?TERCERO and'
      'di.direccion= ?DIRECCION')
    UniDirectional = False
    Left = 240
    Top = 104
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG')
    UniDirectional = False
    Left = 24
    Top = 8
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    Left = 24
    Top = 56
  end
  object QMCabeceraImpuestos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      '  ID_S = ?ID_S')
    UniDirectional = False
    Left = 128
    Top = 8
  end
  object QMVencimientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select d.vencimiento,d.liquido from emp_cartera c'
      'join emp_cartera_detalle d'
      'on'
      'c.empresa = d.empresa and'
      'c.ejercicio = d.ejercicio and'
      'c.canal = d.canal and'
      'c.signo = d.signo and'
      'c.registro = d.registro'
      'where'
      'c.empresa=?empresa and'
      'c.ejercicio=?ejercicio and '
      'c.canal=?canal and'
      'c.doc_serie=?serie and'
      'c.doc_numero=?rig and '
      'c.signo='#39'C'#39' and'
      'c.origen_impagado = 0 and'
      'd.visible = 1')
    UniDirectional = False
    Left = 128
    Top = 56
  end
  object xProcedenciaLinea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT r.o_empresa,r.o_ejercicio,r.o_canal,r.o_serie,r.o_tipo,r.' +
        'o_rig,r.o_linea FROM GES_DETALLES_RELACIONES r'
      'JOIN GES_DETALLES_S c ON'
      'r.o_empresa = c.empresa and'
      'r.o_ejercicio = c.ejercicio and'
      'r.o_canal = c.canal and'
      'r.o_serie = c.serie and'
      'r.o_tipo = c.tipo and'
      'r.o_rig = c.rig and'
      'r.o_linea = c.linea '
      'WHERE'
      'r.D_EMPRESA = ?EMPRESA AND '
      'r.D_EJERCICIO = ?EJERCICIO AND'
      'r.D_CANAL = ?CANAL AND '
      'r.D_SERIE = ?SERIE AND '
      'r.D_TIPO = ?TIPO AND '
      'r.D_RIG=?RIG AND'
      'r.D_LINEA=?LINEA')
    UniDirectional = False
    Left = 240
    Top = 56
  end
  object QEDIFacCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EDI_FAC_CAB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG')
    UniDirectional = False
    Left = 24
    Top = 168
  end
  object QEDIFacCabDto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EDI_FAC_CAB_DTO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG')
    UniDirectional = False
    Left = 24
    Top = 216
  end
  object QEDIFacCabImp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EDI_FAC_CAB_IMP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG')
    UniDirectional = False
    Left = 128
    Top = 168
  end
  object QEDIFacDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EDI_FAC_DET'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    Left = 240
    Top = 168
  end
  object QEDIFacDetDto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EDI_FAC_DET_DTO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    Left = 240
    Top = 216
  end
end
