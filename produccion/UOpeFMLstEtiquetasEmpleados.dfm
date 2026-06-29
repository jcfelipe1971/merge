inherited OpeFMLstEtiquetasEmpleados: TOpeFMLstEtiquetasEmpleados
  Left = 329
  Top = 239
  ActiveControl = EFEmpleadoDesde
  Caption = 'Etiquetas empleados'
  ClientHeight = 303
  ClientWidth = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 438
    Height = 237
    inherited TBMain: TLFToolBar
      Width = 438
    end
    inherited PBListado: TProgressBar
      Top = 221
      Width = 438
    end
    inherited PCMain: TLFPageControl
      Width = 438
      Height = 185
      ActivePage = TabSheet1
      TabIndex = 0
      object TabSheet1: TTabSheet
        Caption = '&Ficha'
        object LFEmpleadoDesde: TLFLabel
          Left = 19
          Top = 48
          Width = 81
          Height = 13
          Caption = 'Desde Empleado'
        end
        object LEmpleadoHasta: TLFLabel
          Left = 22
          Top = 72
          Width = 78
          Height = 13
          Caption = 'Hasta Empleado'
        end
        object EFEmpleadoDesde: TLFEditFind2000
          Left = 104
          Top = 45
          Width = 66
          Height = 21
          TabOrder = 0
          OnChange = EFEmpleadoDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EMPLEADO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_EMPLEADOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPLEADO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFEmpleadoHasta: TLFEditFind2000
          Left = 104
          Top = 67
          Width = 66
          Height = 21
          TabOrder = 2
          OnChange = EFEmpleadoHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EMPLEADO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_EMPLEADOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPLEADO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EEmpleadoDesde: TLFEdit
          Left = 171
          Top = 44
          Width = 246
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object EEmpleadoHasta: TLFEdit
          Left = 171
          Top = 67
          Width = 246
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 237
    Width = 438
    inherited LComentario: TLFLabel
      Visible = False
    end
    inherited LOrden: TLFLabel
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Visible = False
    end
    inherited EComentario: TLFEdit
      Visible = False
    end
    inherited CBOrden: TLFComboBox
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfigLst: TAction
      Caption = 'Configuraci'#243'n R'#225'pida'
    end
  end
end
