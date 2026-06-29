inherited FMRecalculoPresencia: TFMRecalculoPresencia
  Top = 226
  Caption = 'Recalculo Presencia'
  ClientHeight = 262
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 238
    object LEmpleado: TLFLabel [0]
      Left = 36
      Top = 68
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empleado'
    end
    object LDesdeFecha: TLFLabel [1]
      Left = 52
      Top = 90
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LHastaFecha: TLFLabel [2]
      Left = 55
      Top = 112
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LAdvertencia: TLabel [3]
      Left = 2
      Top = 197
      Width = 498
      Height = 39
      Align = alBottom
      Alignment = taCenter
      Caption = 
        'El recalculo eliminara todos los marcajes entrados o modificados' +
        ' manualemente en el periodo seleccionado.'#13#10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    inherited TBMain: TLFToolBar
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object EFEmpleado: TLFEditFind2000
      Left = 88
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '0'
      OnChange = EFEmpleadoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoADevolver = 'EMPLEADO'
      CampoNum = 'EMPLEADO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'TITULO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object DEDesdeFecha: TLFDateEdit
      Left = 88
      Top = 86
      Width = 121
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 2
    end
    object DEHastaFecha: TLFDateEdit
      Left = 88
      Top = 108
      Width = 121
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 3
    end
    object EEmpleado: TLFEdit
      Left = 210
      Top = 64
      Width = 273
      Height = 21
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 4
      Text = 'EEmpleado'
    end
    object BProcesar: TButton
      Left = 208
      Top = 160
      Width = 75
      Height = 25
      Caption = '&Procesar'
      TabOrder = 5
      OnClick = BProcesarClick
    end
  end
  inherited TBActions: TLFToolBar
    Top = 238
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
