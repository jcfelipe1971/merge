inherited OpeFMLstFormacion: TOpeFMLstFormacion
  Left = 329
  Top = 239
  ActiveControl = LFDBEmpleadosDesde
  Caption = 'Listado Formacion Empleado'
  ClientHeight = 303
  ClientWidth = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 438
    Height = 237
    inherited TBMain: TLFToolBar
      Width = 438
      inherited TButtRecargar: TToolButton
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 438
      Height = 201
      ActivePage = TabSheet1
      TabIndex = 0
      object TabSheet1: TTabSheet
        Caption = '&Ficha'
        object LDesdeEmpleado: TLFLabel
          Left = 19
          Top = 48
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Empleado'
        end
        object LHastaEmpleado: TLFLabel
          Left = 22
          Top = 72
          Width = 78
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Empleado'
        end
        object LFDBEmpleadosDesde: TLFEditFind2000
          Left = 104
          Top = 45
          Width = 66
          Height = 21
          TabOrder = 0
          OnChange = LFDBEmpleadosDesdeChange
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
          Filtros = []
        end
        object LFDBEmpleadosHasta: TLFEditFind2000
          Left = 104
          Top = 67
          Width = 66
          Height = 21
          TabOrder = 1
          OnChange = LFDBEmpleadosHastaChange
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
          Filtros = []
        end
        object DescEmpleadoD: TLFDbedit
          Left = 171
          Top = 45
          Width = 172
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = OpeDMLstFormacion.DSxEmpleadoD
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object DescEmpleadoH: TLFDbedit
          Left = 171
          Top = 67
          Width = 172
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = OpeDMLstFormacion.DSEmpleadoH
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
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    object AConfigLst: TAction
      Caption = 'Configuraci'#243'n R'#225'pida'
    end
  end
end
