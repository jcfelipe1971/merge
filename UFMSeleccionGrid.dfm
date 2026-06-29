inherited FMSeleccionGrid: TFMSeleccionGrid
  Caption = 'FMSeleccionGrid'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      object TBOK: TToolButton [0]
        Left = 0
        Top = 0
        Action = AOk
        ParentShowHint = False
        ShowHint = False
      end
      object ToolButton1: TToolButton [1]
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 31
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
    end
    object DBGSeleccion: TNsDBGrid
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      Align = alClient
      DataSource = DSFDS
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGSeleccionDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
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
    object ACancel: TAction
      Caption = 'Cancelar'
      ImageIndex = 27
      OnExecute = ACancelExecute
    end
    object AOk: TAction
      Caption = 'Aceptar'
      ImageIndex = 19
      OnExecute = AOkExecute
    end
  end
  object DSFDS: TDataSource
    DataSet = FDS
    Left = 368
    Top = 16
  end
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 400
    Top = 16
  end
  object FDS: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 432
    Top = 16
  end
end
