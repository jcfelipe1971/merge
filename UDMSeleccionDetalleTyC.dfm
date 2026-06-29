object DMSeleccionDetalleTyC: TDMSeleccionDetalleTyC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 285
  Top = 239
  Height = 287
  Width = 539
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 328
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 464
    Top = 8
  end
  object QMModelo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_MODELOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'REF_PROVEEDOR = :REF_PROVEEDOR')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_MODELOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'REF_PROVEEDOR = :REF_PROVEEDOR')
    UniDirectional = False
    AfterOpen = QMModeloAfterOpen
    BeforeClose = QMModeloBeforeClose
    Left = 48
    Top = 8
  end
  object DSQMModelo: TDataSource
    DataSet = QMModelo
    Left = 152
    Top = 8
  end
  object QMColor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 128
    RefreshSQL.Strings = (
      'SELECT AM.*, C.COD_COLOR, C.TITULO COLOR '
      'FROM ART_ARTICULOS_MOD_COLOR AMC '
      'JOIN ART_COLORES C ON AMC.ID_A_C = C.ID_A_C'
      'WHERE '
      'ID_A_M_C = :ID_A_M_C')
    SelectSQL.Strings = (
      'SELECT AMC.*, C.COD_COLOR, C.TITULO COLOR '
      'FROM ART_ARTICULOS_MOD_COLOR AMC '
      'JOIN ART_COLORES C ON AMC.ID_A_C = C.ID_A_C'
      'WHERE '
      'ID_A_M = :ID_A_M'
      'ORDER BY C.TITULO')
    UniDirectional = False
    DataSource = DSQMModelo
    AfterOpen = QMColorAfterOpen
    BeforeOpen = QMColorBeforeOpen
    Left = 48
    Top = 56
  end
  object DSQMColor: TDataSource
    DataSet = QMColor
    Left = 152
    Top = 56
  end
  object QMTalla: TFIBDataSetRO
    Database = DMMain.DataBase
    AutoTrans = True
    BufferChunks = 128
    RefreshSQL.Strings = (
      
        'SELECT AM.*, C.COD_COLOR, C.TITULO COOR ART_ARTICULOS_MOD_COLOR ' +
        'AMC ON AM.ID_A_M = AMC.ID_A_M'
      'JOIN ART_COLORES C ON AMC.ID_A_C = C.ID_A_C'
      'WHERE '
      'ID_A_M_C = :ID_A_M_C')
    SelectSQL.Strings = (
      'SELECT AM.ID_A_M, T.*, AMCT.ARTICULO'
      'FROM ART_ARTICULOS_MODELOS AM'
      'JOIN ART_ARTICULOS_MOD_COLOR AMC ON AM.ID_A_M = AMC.ID_A_M'
      'JOIN ART_GRUPOS_TALLAS G ON AM.ID_G_T = G.ID_G_T'
      'JOIN ART_TALLAS T ON G.ID_G_T = T.ID_G_T'
      
        'LEFT JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON AMCT.ID_A_M_C = AMC.I' +
        'D_A_M_C AND ID_A_T = T.ID_A_T'
      'WHERE'
      'AM.ID_A_M = :ID_A_M AND'
      'AMC.ID_A_M_C = :ID_A_M_C'
      'ORDER BY AMC.COD_COLOR, T.COD_TALLA')
    UniDirectional = False
    DataSource = DSQMColor
    Left = 48
    Top = 104
  end
  object DSQMTalla: TDataSource
    DataSet = QMTalla
    Left = 152
    Top = 104
  end
  object QMTallasArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 128
    RefreshSQL.Strings = (
      'SELECT C.TITULO COLOR, T.TITULO TALLA, AMCT.ARTICULO'
      'FROM ART_ARTICULOS_MODELOS AM'
      'JOIN ART_ARTICULOS_MOD_COLOR AMC ON AM.ID_A_M = AMC.ID_A_M'
      'JOIN ART_COLORES C ON AMC.ID_A_C = C.ID_A_C'
      'JOIN ART_GRUPOS_TALLAS G ON AM.ID_G_T = G.ID_G_T'
      'JOIN ART_TALLAS T ON G.ID_G_T = T.ID_G_T'
      
        'LEFT JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON AMCT.ID_A_M_C = AMC.I' +
        'D_A_M_C AND ID_A_T = T.ID_A_T'
      'WHERE'
      'AMCT.ID_A_M_C_T = :ID_A_M_C_T'
      '')
    SelectSQL.Strings = (
      
        'SELECT C.TITULO COLOR, T.TITULO TALLA, AMCT.ID_A_M_C_T, AMCT.ART' +
        'ICULO'
      'FROM ART_ARTICULOS_MODELOS AM'
      'JOIN ART_ARTICULOS_MOD_COLOR AMC ON AM.ID_A_M = AMC.ID_A_M'
      'JOIN ART_COLORES C ON AMC.ID_A_C = C.ID_A_C'
      'JOIN ART_GRUPOS_TALLAS G ON AM.ID_G_T = G.ID_G_T'
      'JOIN ART_TALLAS T ON G.ID_G_T = T.ID_G_T'
      
        'LEFT JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON AMCT.ID_A_M_C = AMC.I' +
        'D_A_M_C AND ID_A_T = T.ID_A_T'
      'WHERE'
      'AM.ID_A_M = :ID_A_M '
      'ORDER BY AMC.COD_COLOR, T.COD_TALLA')
    UniDirectional = False
    DataSource = DSQMModelo
    Left = 48
    Top = 152
  end
  object DSTallasArticulo: TDataSource
    DataSet = QMTallasArticulo
    Left = 152
    Top = 152
  end
end
