inherited DMFacturasTallas: TDMFacturasTallas
  OldCreateOrder = True
  Left = 168
  Top = 183
  inherited QMCabecera: TFIBTableSet
    Plan.Strings = (
      
        '/*PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (PK_GES_CABECERAS_S' +
        '),'
      
        '           VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_' +
        'ID),'
      '           VER_CABECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))*/')
  end
  inherited xInfoActualizada: TFIBDataSet
    Plan.Strings = (
      '/*'
      
        'PLAN SORT (JOIN (VER_CABECERAS_FACTURA FAC INDEX (PK_GES_CABECER' +
        'AS_S_FAC),'
      
        'VER_CABECERAS_FACTURA CAB INDEX (PK_GES_CABECERAS_S),VER_CABECER' +
        'AS_FACTURA TER INDEX (PK_SYS_TERCEROS)))               '
      '*/')
  end
end
