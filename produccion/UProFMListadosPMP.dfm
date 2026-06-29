inherited ProFMListadosPMP: TProFMListadosPMP
  Left = 269
  Top = 221
  ActiveControl = EFTareas
  Caption = 'Listados de PMP'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited PCMain: TLFPageControl
      ActivePage = TSFicha
      TabIndex = 0
      OnChange = PCMainChange
      object TSFicha: TTabSheet
        Caption = 'Ficha'
        object LTipoTarea: TLFLabel
          Left = 25
          Top = 20
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Tarea'
        end
        object LOperario: TLFLabel
          Left = 37
          Top = 45
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Operario'
        end
        object EFTareas: TLFEditFind2000
          Left = 83
          Top = 18
          Width = 75
          Height = 21
          TabOrder = 0
          OnChange = EFTareasChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TAREA'
          CampoStr = 'DESC_TAREA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'PMP_VER_OP_GENERADAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFTareasBusqueda
          OrdenadoPor.Strings = (
            'TAREA')
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DescTarea: TLFEdit
          Left = 159
          Top = 18
          Width = 291
          Height = 21
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object DescOperario: TLFEdit
          Left = 159
          Top = 41
          Width = 291
          Height = 21
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object EFOperario: TLFEditFind2000
          Left = 83
          Top = 41
          Width = 75
          Height = 21
          TabOrder = 3
          OnChange = EFOperarioChange
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
        object RGFiltro: TRadioGroup
          Left = 28
          Top = 84
          Width = 125
          Height = 85
          Caption = 'Filtro'
          ItemIndex = 0
          Items.Strings = (
            'Ninguno'
            'Material'
            'M'#225'quina')
          TabOrder = 4
          OnClick = RGFiltroClick
        end
      end
      object TSEtiquetas: TTabSheet
        Caption = 'Etiquetas'
        ImageIndex = 1
        object LPlanificacion: TLFLabel
          Left = 28
          Top = 22
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Planificacion'
        end
        object EPlanificacion: TLFEdit
          Left = 93
          Top = 18
          Width = 58
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited PNLOrden: TLFPanel
    inherited LComentario: TLFLabel
      Top = 10
    end
    inherited LOrden: TLFLabel
      Top = 39
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Top = 39
      Visible = False
    end
    inherited EComentario: TLFEdit
      Top = 6
    end
    inherited CBOrden: TLFComboBox
      Top = 35
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Top = 35
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 440
    Top = 62
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
