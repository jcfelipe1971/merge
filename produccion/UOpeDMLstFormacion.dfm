object OpeDMLstFormacion: TOpeDMLstFormacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 314
  Top = 211
  Height = 405
  Width = 461
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 396
    Top = 43
  end
  object frFormacion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Formacion'
    RebuildPrinter = False
    OnGetValue = frFormacionGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 232
    Top = 27
    ReportForm = {19000000}
  end
  object QMEmpleados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ope_empleado ope'
      'join sys_terceros ter on(ope.tercero=ter.tercero)'
      
        'where ope.empresa=?empresa  and ope.empleado>=?empleadod and ope' +
        '.empleado<=?empleadoh'
      'order by ope.empleado')
    UniDirectional = False
    Left = 64
    Top = 19
    object QMEmpleadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpleadosEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMEmpleadosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMEmpleadosCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object QMEmpleadosCENTRO: TFIBStringField
      DisplayLabel = 'Centro'
      FieldName = 'CENTRO'
      Size = 3
    end
    object QMEmpleadosDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object QMEmpleadosSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMEmpleadosCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMEmpleadosN_SEGURIDAD_SOCIAL: TFIBStringField
      DisplayLabel = 'Nro. Seg. Social'
      FieldName = 'N_SEGURIDAD_SOCIAL'
      Size = 14
    end
    object QMEmpleadosTIPO_CONTRATO: TFIBStringField
      DisplayLabel = 'Tipo Contrato'
      FieldName = 'TIPO_CONTRATO'
      Size = 3
    end
    object QMEmpleadosINI_CONTRATO: TDateTimeField
      DisplayLabel = 'Ini. Contrato'
      FieldName = 'INI_CONTRATO'
    end
    object QMEmpleadosFIN_CONTRATO: TDateTimeField
      DisplayLabel = 'Fin Contrato'
      FieldName = 'FIN_CONTRATO'
    end
    object QMEmpleadosFECHA_NACIMIENTO: TDateTimeField
      DisplayLabel = 'Fec. Nacimiento'
      FieldName = 'FECHA_NACIMIENTO'
    end
    object QMEmpleadosESTADO_CIVIL: TFIBStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADO_CIVIL'
      Size = 15
    end
    object QMEmpleadosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMEmpleadosIMAGEN: TMemoField
      FieldName = 'IMAGEN'
      BlobType = ftMemo
      Size = 8
    end
    object QMEmpleadosCODIGO_TARJETA: TFIBStringField
      DisplayLabel = 'Tarjeta'
      FieldName = 'CODIGO_TARJETA'
      Size = 25
    end
    object QMEmpleadosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMEmpleadosRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMEmpleadosHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object QMEmpleadosIMPUTACION: TIntegerField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
    end
    object QMEmpleadosTIPOIMPUTACION: TIntegerField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPOIMPUTACION'
    end
    object QMEmpleadosID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
    object QMEmpleadosTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMEmpleadosFORMACION_INI: TBlobField
      DisplayLabel = 'Formacion Ini.'
      FieldName = 'FORMACION_INI'
      Size = 8
    end
    object QMEmpleadosEXPERIENCIA_PROF: TBlobField
      DisplayLabel = 'Experiencia Prof.'
      FieldName = 'EXPERIENCIA_PROF'
      Size = 8
    end
    object QMEmpleadosID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMEmpleadosFORMACIONESPHAB: TBlobField
      DisplayLabel = 'Formaciones Hab.'
      FieldName = 'FORMACIONESPHAB'
      Size = 8
    end
    object QMEmpleadosTERCERO1: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO1'
    end
    object QMEmpleadosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMEmpleadosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMEmpleadosTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object QMEmpleadosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMEmpleadosFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMEmpleadosNOTAS1: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS1'
      Size = 8
    end
    object QMEmpleadosTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object QMEmpleadosTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object QMEmpleadosTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object QMEmpleadosEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMEmpleadosWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object QMEmpleadosIMAGEN1: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN1'
    end
    object QMEmpleadosID_REGISTRO: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_REGISTRO'
    end
  end
  object DSEmpleados: TDataSource
    DataSet = QMEmpleados
    Left = 64
    Top = 75
  end
  object frDBLstFormacion: TfrDBDataSet
    DataSource = DSEmpleados
    Left = 232
    Top = 83
  end
  object xEmpleadoD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?empleado')
    UniDirectional = False
    Left = 64
    Top = 168
    object xEmpleadoDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xEmpleadoH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?empleado')
    UniDirectional = False
    Left = 64
    Top = 224
    object xEmpleadoHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxEmpleadoD: TDataSource
    DataSet = xEmpleadoD
    Left = 144
    Top = 168
  end
  object DSEmpleadoH: TDataSource
    DataSet = xEmpleadoH
    Left = 144
    Top = 224
  end
  object xDireccionEmp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * '
      'FROM SYS_TERCEROS te '
      'JOIN SYS_TERCEROS_DIRECCIONES di ON (te.TERCERO=di.TERCERO)'
      'JOIN SYS_LOCALIDADES LOC ON (DI.ID_LOCAL = LOC.ID_LOCAL)'
      'WHERE di.dir_defecto = 1 and te.tercero=?tercero')
    UniDirectional = False
    DataSource = DSEmpleados
    Left = 256
    Top = 160
    object xDireccionEmpTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDireccionEmpNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xDireccionEmpNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xDireccionEmpTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xDireccionEmpNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xDireccionEmpFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object xDireccionEmpNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xDireccionEmpTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xDireccionEmpTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xDireccionEmpTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xDireccionEmpEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xDireccionEmpWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object xDireccionEmpIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object xDireccionEmpTERCERO1: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO1'
    end
    object xDireccionEmpDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xDireccionEmpDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object xDireccionEmpDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xDireccionEmpDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xDireccionEmpDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xDireccionEmpDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object xDireccionEmpDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xDireccionEmpDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xDireccionEmpDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xDireccionEmpDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object xDireccionEmpDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xDireccionEmpDIR_CLASE: TIntegerField
      DisplayLabel = 'Clase'
      FieldName = 'DIR_CLASE'
    end
    object xDireccionEmpDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'DIR_TELEFONO01'
    end
    object xDireccionEmpDIR_TELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'DIR_TELEFONO02'
    end
    object xDireccionEmpDIR_TELEFAX: TFIBStringField
      DisplayLabel = 'FAX'
      FieldName = 'DIR_TELEFAX'
    end
    object xDireccionEmpDIR_DEFECTO: TIntegerField
      DisplayLabel = 'Dir. Defecto'
      FieldName = 'DIR_DEFECTO'
    end
    object xDireccionEmpID_LOCAL: TIntegerField
      DisplayLabel = 'ID Local'
      FieldName = 'ID_LOCAL'
    end
    object xDireccionEmpLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 8
    end
    object xDireccionEmpTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xDireccionEmpCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xDireccionEmpPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xDireccionEmpPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 2
    end
    object xDireccionEmpID_LOCAL1: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_LOCAL1'
    end
  end
  object DSxDireccionEmp: TDataSource
    DataSet = xDireccionEmp
    Left = 256
    Top = 216
  end
  object xVerCursoEmpl: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ISO_VER_EMPL_CURSOS'
      'where empresa=?empresa and id_empleado=?empleado')
    UniDirectional = False
    DataSource = DSEmpleados
    Left = 64
    Top = 283
    object xVerCursoEmplEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerCursoEmplEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerCursoEmplID_CURSO: TIntegerField
      DisplayLabel = 'Id Curso'
      FieldName = 'ID_CURSO'
    end
    object xVerCursoEmplID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object xVerCursoEmplTITULO_EMPL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_EMPL'
      Size = 60
    end
    object xVerCursoEmplDESC_CURSO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_CURSO'
      Size = 100
    end
    object xVerCursoEmplRESULTADO: TIntegerField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
    end
    object xVerCursoEmplDESC_RESULTADO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_RESULTADO'
      Size = 40
    end
    object xVerCursoEmplFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object xVerCursoEmplFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
  end
  object DSxVerCursoEmpl: TDataSource
    DataSet = xVerCursoEmpl
    Left = 148
    Top = 285
  end
  object frCursos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de etiquetas empleados'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 356
    Top = 175
    ReportForm = {19000000}
  end
  object frDBLstCursos: TfrDBDataSet
    DataSource = DSxVerCursoEmpl
    Left = 356
    Top = 231
  end
end
