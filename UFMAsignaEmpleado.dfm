inherited FMAsignaEmpleado: TFMAsignaEmpleado
  Left = 551
  Top = 223
  Caption = 'Asigna empleados'
  ClientHeight = 174
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 150
    object LEmpleadoResponsable: TLFLabel [0]
      Left = 21
      Top = 68
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Responsable'
    end
    object LEmpleadoAtencion: TLFLabel [1]
      Left = 41
      Top = 90
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Atencion'
    end
    inherited TBMain: TLFToolBar
      object TBOk: TToolButton [0]
        Left = 0
        Top = 0
        Caption = 'Ok'
        ImageIndex = 25
        OnClick = TBOkClick
      end
      object ToolButton2: TToolButton [1]
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 31
        Width = 26
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object EEmpleadoTituloResponsable: TLFEdit
      Left = 170
      Top = 64
      Width = 287
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = OnKeyPress
    end
    object EFEmpleadoAtencion: TLFEditFind2000
      Left = 88
      Top = 86
      Width = 81
      Height = 21
      TabOrder = 3
      Text = '0'
      OnChange = EFEmpleadoAtencionChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'EMPLEADO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'ACTIVO=1'
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
    object EEmpleadoTituloAtencion: TLFEdit
      Left = 170
      Top = 86
      Width = 287
      Height = 21
      Color = clInfoBk
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object EFEmpleadoResponsable: TLFEditFind2000
      Left = 88
      Top = 64
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '0'
      OnChange = EFEmpleadoResponsableChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'EMPLEADO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'ACTIVO=1'
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
  end
  inherited TBActions: TLFToolBar
    Top = 150
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
