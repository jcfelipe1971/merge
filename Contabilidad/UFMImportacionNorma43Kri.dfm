inherited FMImportacionNorma43Kri: TFMImportacionNorma43Kri
  Left = 304
  Top = 158
  Width = 593
  Height = 359
  ActiveControl = CBBancoAutomatico
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importacion Norma CSB 43'
  FormStyle = fsNormal
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 583
    Height = 105
    Align = alTop
    DesignSize = (
      583
      105)
    object LBanco: TLFLabel [0]
      Left = 22
      Top = 44
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Banco'
    end
    inherited TBMain: TLFToolBar
      Width = 579
      TabOrder = 4
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBImportar: TToolButton
        Left = 33
        Top = 0
        Action = AImportar
      end
    end
    object EBanco: TLFEdit
      Left = 96
      Top = 40
      Width = 403
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object EFBanco: TLFEditFind2000
      Left = 56
      Top = 40
      Width = 39
      Height = 21
      TabOrder = 0
      Text = '0'
      OnChange = EFBancoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'BANCO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'ACTIVO=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'BANCO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object CBBancoAutomatico: TLFCheckBox
      Left = 504
      Top = 42
      Width = 72
      Height = 17
      Caption = 'Automatico'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
      OnClick = CBBancoAutomaticoClick
      Anchors = [akTop, akRight]
      Alignment = taLeftJustify
    end
    object PNLInfo: TLFPanel
      Left = 2
      Top = 65
      Width = 579
      Height = 38
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        579
        38)
      object LProceso1: TLFLabel
        Left = 5
        Top = 4
        Width = 573
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
      end
      object LProceso2: TLFLabel
        Left = 5
        Top = 20
        Width = 573
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Color = clInfoBk
        ParentColor = False
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 306
    Width = 583
    TabOrder = 2
  end
  object PNLLog: TLFPanel [2]
    Left = 0
    Top = 105
    Width = 583
    Height = 201
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    OnResize = PNLLogResize
    object spl1: TSplitter
      Left = 0
      Top = 112
      Width = 583
      Height = 8
      Cursor = crVSplit
      Align = alTop
      Color = clAppWorkSpace
      ParentColor = False
    end
    object MErrores: TLFMemo
      Left = 0
      Top = 120
      Width = 583
      Height = 81
      Align = alClient
      Lines.Strings = (
        'Errores')
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object MLog: TLFMemo
      Left = 0
      Top = 0
      Width = 583
      Height = 112
      Align = alTop
      Lines.Strings = (
        'Log')
      ScrollBars = ssVertical
      TabOrder = 1
    end
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
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Importacion'
      Caption = 'Importacion'
      Hint = 'Importacion'
      ImageIndex = 49
    end
    object AImportar: TAction
      Category = 'Importacion'
      Caption = 'Importar fichero'
      Hint = 'Importar fichero de norma 43'
      ImageIndex = 49
      OnExecute = AImportarExecute
    end
    object ALimpiarLog: TAction
      Category = 'Importacion'
      Caption = 'Limpiar Logs'
      Hint = 'Limpiar Logs'
      ImageIndex = 20
      OnExecute = ALimpiarLogExecute
    end
  end
end
